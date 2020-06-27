## Princípios de localidade e hierarquia de memória
Memory wall  

 

Memory wall ≡ Barrier power 

Há uma grande disparidade de desempenho entre memória e processador. 
<img src="../../img/23.01.png" align="center" height=auto width=70%/>




Exemplo) Processador de 2 GHz executa uma instrução por ciclo. 

tempoCPU = CPI*frequência 

CPI = 1 

0,5 ns /ciclo 

20% das instruções acessam a memória 

Cada acesso à memória leva 100 ciclos, 0,5*100  = 50 ns 

 

– Quanto tempo cada instrução deveria levar? 

Resposta: 0,5 ns 

 

– Qual o tempo médio das instruções realmente? 

Resposta: 0,5 ns + 0,2*50 ns = 10,5 ns (~95MHz) 

 

Para amenizar os efeitos do memory wall inserimos memorias intermediárias. 

Exemplo: se 95% dos acessos levassem 5 ciclos na memória intermediária (os outros 5% precisam de mais 100 ciclos) 

= 0,5 ns + 0,2*(2,5 + 0,05*50) ns 

OBS: 0,5 ns por ciclos * 5 ciclos na memória intermediária = 2,5 

= 0,5 + 0,2*(2,5 + 2,5) 

= 0,5 + 1 = 1,5 ns 

666 MHz ou ~7x melhor do que antes 

 

As memórias intermediarias formam a hierarquia de memória. 





Hierarquia de memória 

 

O principal objetivo de se ter uma hierarquia de memória é o melhoramento do desempenho. 

 

– Quanto mais longe da CPU: 

• Maior a capacidade 

• Mais lenta  

• Mais barata 

<img src="../../img/23.02.png" align="center" height=auto width=70%/>



PRINCÍPIO DA LOCALIDADE 

 

Analogia da biblioteca 

 

– Livros na estante 

• Muitos livros, acesso lento 

 

– Livros na mesa 

• Poucos livros, acesso rápido 

 

– Livro na mão 

• Um livro, acesso muito rápido 

 

 

Dois tipos de localidade 

 

Localidade temporal 

• Se um endereço é referenciado, é provável que ele seja referenciado em breve. 

Se você trouxe um livro para mesa é provável que precise examiná-lo novamente em breve. 

 

Localidade espacial 

• Se um endereço é referenciado, é provável que endereços próximos sejam referenciados em breve. 

Os livros sobre o mesmo assunto são colocados juntos na biblioteca para aumentar a localidade espacial. 

 

Exemplos do princípio da localidade: 

 

MUITOS LAÇOS -  Alta localidade temporal a instruções. Um programa com muitos laços acessa repetidamente as mesmas instruções e, portanto, tem alta localidade temporal em relação às instruções. 

MUITO USO DE ARRAY - Alta localidade espacial a dados. 

MUITO USO DE VARIÁVEIS DE ÍNDICE E CONTROLE DE LAÇOS - Alta localidade temporal a dados. 

MUITOS DESVIOS -  

 

FUNCIONAMENTO DO PRINCIPIOS DE LOCALIDADE 

 

A memória é feita de blocos (unidade mínima) 

<img src="../../img/23.03.png" align="center" height=auto width=70%/>

Quando um dado sai do disco ele passará por todos os níveis de memória até chegar no núcleo. 

No L1 a L3 os dados são cópias da memória principal, ou seja, eles repetem as mesmas informações. 



Acessos à cache 

 

– Acerto (cache hit): Endereço acessado se encontra na cache. 

 

• Tudo ok 

• Tempo para consultar um livro na mesa 

 

– Falha (cache miss): Endereço acessado não se encontra na cache. 

 

• Pede para o próximo nível na hierarquia pelo dado. 

• Tempo de apanhar outro livro na estante e colocá-lo na mesa. 

• Para uma falha de cache é criado um stall semelhante ao pipeline 








OBS: 

O termo cache, é usado para qualquer armazenamento que utiliza o princípio de localidade. 

 

Escrita na cache 

 

Na instrução STORE, escrevemos os dados apenas na cache de dados (sem alterar a memória principal), isso faz com que a memória tenha um valor diferente da cache, nestes casos dizemos que a cache e a memória estão inconsistentes. Para manter a consistencia entre as memorias temos que escrever os dados na memória e na cache. Para isso podemos utilizar: 

Write through – Cache e memória (nivel inferior) são atualizadas simultaneamente  

Write back – Memória principal é atualizada quando bloco é substituído. 

 

Desempenho 

 

• Desempenho depende de vários parâmetros: 

 

– Taxa de acerto (Hit rate) 

• Percentual de acesso à cache que resultam em Acertos 

 

– Tempo de acesso (Hit time) 

• Número de ciclos para acessar a cache 

 

– penalidade de falta (miss penalty) 

• Número de ciclos realizados para trazer os dados para a cache 

 

 

Fórmulas: 

 

tempoCPU = Ciclos * frequência 



            CPI = tempo de acesso + (taxa de falta * penalidade de falta) 



Caso não mencione, o tempo de acesso para instruções é sempre 1 ! 

 

Exemplo) 

– Taxa de acerto (hit rate): 80% 

– Tempo de acesso (hit time): 5 ciclos 

– Penalidade de falta (miss penalty): 20 ciclos 

 

Ciclos = 5 + 0,2*20 = 5 + 4 = 9 ciclos 

 omo o acesso à memória afeta o desempenho 

 

tempoCPU = Ciclos * frequência 

Ciclos = CPI * I 

Ciclos = (tempo de acesso + (taxa de falta * penalidade de falta)) * I 

 

• Em geral, assume-se que os ciclos de CPU já contam com o uso de uma cache de mais alto nível perfeita 

– Sem falhas -> Sem penalidades por falhas 

– Ciclos em stalls de memória precisam ser contados com as faltas nas caches 

            ciclosStall = I * taxa faltas * penalty 



Exemplo 1 

– Um programa leva a 5% de falhas na cache de instruções e 10% de falhas na cache de dados. Sabendo que 20% de suas instruções são load/store, como o CPI do processador abaixo é afetado pela carga de trabalho do programa? 

 

L1 instruções ou dados: tempo de acesso de 5 ciclos, penalidade de falha de 50 ciclos 

CPI do processador sem stalls de memória: 3 

 

Resolução: 

 

– CPI sem stalls = 3 

 

– L1 instruções 

• Usada por 100% das instruções 

• Hit rate 95%, hit time 5, miss penalty 50 

Ciclos = tempo de acesso + ciclosStall 

CPI inst = 5 + 0,05*50 = 5 + 2,5 = 7,5 

 

– L1 dados 

• Usada por 20% das instruções 

• Hit rate 90%, hit time 5, miss penalty 50 

Ciclos = tempo de acesso + ciclosStall 

 

CPI dados = 0,2*(5 + (0,1*50)) = 0,2*(5+5) = 0,2*10 = 2 

 

CPIfinal = CPIsem stalls + CPIinstruções + CPIdados 

 

CPI final = 3 + 7,5 + 2 = 12,5 

 

 

Exemplo 2 (do livro-texto) 

– Cache de instruções com taxa de faltas de 2% 

– Taxa de faltas para dados de 4% 

– Frequência de acesso a dados de 36% 

– Penalidade de falta de 100 ciclos 

– CPI = 2 sem considerar memória 

– O quão mais rápido seria o processador se não houvessem faltas de cache? 

 

Resolução: 

 

– Ciclos em faltas de instruções (tempo de acesso = 1) 

CiclosStall = I * taxa faltas* penalty 

• I*0,02*100 = 2*I 

 

– Ciclos em faltas de dados (frequência de acesso = 0,36) 

CiclosStall = I * taxa faltas* penalty 

• I*0,36*0,04*100 = 1,44*I 

 

– Total de ciclos em stalls de memória (instruções + dados) 

• 2*I + 1,44*I = 3,44*I 

– CPI com stalls = 3,44 + 2 = 5,44 

– CPI sem stalls = 2 

– Diferença de desempenho 

• 5,44 / 2 = 2,72 

• O processador seria 2,72 mais rápido sem faltas de cache 

 

Exemplo 3 

– Dado o sistema com dois níveis de cache com as características listadas abaixo, quantos ciclos adicionais levam loads e stores em média? 

• L1: miss rate 25%, hit time 2 ciclos 

• L2: miss rate 10%, hit time 10 ciclos 

• Memória: hit time 200 ciclos 

 

Lembre-se: a cache secundária tem o objetivo de reduzir a taxa de falhas na cache primária. 

L2 é o penalty de l1 

 

Ciclos médio = tempo de acesso + (taxa de falta * penalidade de falta) 

Cm = 2 + 0,25*(10 + 0,1*200) 

Cm = 2 + 0,25*30 = 2 + 7,5 = 9,5 ciclos 


<img src="../../img/23.03.png" align="center" height=auto width=70%/>
<img src="../../img/23.03.png" align="center" height=auto width=70%/>
<img src="../../img/23.03.png" align="center" height=auto width=70%/>
<img src="../../img/23.03.png" align="center" height=auto width=70%/>
<img src="../../img/23.03.png" align="center" height=auto width=70%/>
