# Desempenho 
## Comparação entre desktops 
- Qual deles termina a tarefa primeiro? 
> Se executar um programa em 2 desktops diferentes o que terminar primeiro é o de melhor desempenho. 

## Comparação entre servidores 
- Qual deles completou mais tarefas?  
> Número de tarefas na unidade de tempo 
> Vazão (throughput)  

## Conceitos importantes 
- **Tempo de execução de um programa**: Medido em segundos 
- **Tempo de resposta** = CPU + memória + HD + E/S 
<br/>
É o tempo total, desde o início até o fim do programa 
 
- **Tempo de execução de CPU** = tempo do usuário + tempo do sistema 
- **Tempo de espera** = por dispositivos ou memória 
- **Tempo de ciclo de relógio** = Período (T), dado em segundos/ciclo
  - Exemplo) 250 Pico segundos é igual a 4 GHz  

    | T    | F     |
    |------|-------|
    | 1 s  |  1Hz  |
    | 1ns  | 1khZ  |
    | 1ms  | 1MHz  |
    | 1ῃs  | 1GHz  |

- **CPI** = ciclos de clock por instrução 
  - É ciclos de relógio cada instrução leva em média 

**OBS** 
> A única medida completa e confiável do desempenho de um computador é o tempo. 
<br/>
> Perfilamento  (benchmarks) -  usados para comparar computadores 

---

### Exercícios
1. Um programa precisa de 7,8 bilhões de pulsos de clock para executar, e terminou sua execução em 8,8 segundos em certo processador. Qual é a frequência de relógio desse processador em GHz? 
> 0,88 

2. Considere um processador com 4 tipos de instruções em sua ISA: instruções sobre inteiros (INT), instruções sobre ponto flutuante (FP), instruções de desvio (BR) e instruções de acesso à memória (MEM). 
> Dadas as quantidades de ciclos necessários para a execução de cada tipo de instruções e a distribuição de instruções para um dado programa, calcule o CPI médio obtido. 
>
> INT: 3 ciclos, 30% das instruções 
>
> FP: 18 ciclos, 30% das instruções 
>
> BR: 5 ciclos, 20% das instruções 
>
> MEM: 14 ciclos, 20% das instruções 
>
> 10,1 

3. Sabendo que um laço executa 6853523243 instruções em um dado processador com um tempo de ciclo de 8,0 ns e com CPI médio de 4,1, quantos segundos leva a execução desse laço? 
> 224,7 

4. Considere os dois processadores abaixo: 
 - Processador Intelbras: frequência de relógio de 321 MHz e CPI médio de 3,3. 
 - Processador Logitech: frequência de relógio de 231 MHz e CPI médio de 2,6. 

Tendo em vista que ambas as empresas licenciaram a mesma ISA para seus processadores, quantas vezes o processador de maior desempenho é mais rápido do que o outro? 
> 1,1 

5. Um processador possui um tempo de ciclo de relógio de 54,1 ns. Qual a frequência desse processador em MHz? 
> 18,4 
> T=1/f 

6. A sua empresa está buscando um servidor novo para dedicar à sua base de dados de Pokemons. Você ficou encarregado de testar máquinas de duas empresas diferentes para guiar a escolha de compra:  a PokeMachine 3000 consegue realizar 13586 transações por segundo, enquanto a máquina da PokeEnterprise realiza 17922 transações por segundo. 

Quantas vezes a máquina de desempenho superior é melhor do que a outra? 
> 1,3 

7. Um programa executa num processador de 7,1 GHz e precisa de 9,4 bilhões de ciclos de relógio para terminar. Quantos segundos esse programa demora para executar? 
> 1,3 

8. Um programa precisa de 1,2 bilhões de pulsos de clock para executar, e terminou sua execução em 9,5 segundos em certo processador. Qual é a frequência de relógio desse processador em GHz? 
> 0,12 
 