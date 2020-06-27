# Processadores com despacho múltiplo de instruções 
### Como aumentar o desempenho além do pipeline? 
- Lançar múltiplas instruções para a execução em paralelo 
- Em 1 ciclo lançar 2 ou + instruções 
- CPI < 1 
- Aumentar a profundidade do pipeline para ter mais instruções em execução 

<img src="../../img/17.01.png" align="center" height=auto width=70%/>

<br/>
<br/>
<br/>

<img src="../../img/17.02.png" align="center" height=auto width=70%/>

-  Resultado do despacho múltiplo 
  - CPI abaixo de 1! 
  - IPC: instruções por ciclo. 
  - IPC = 4 -> quatro instruções finalizadas por ciclo 



## Multicore
#### Blocked Multithreading
<img src="../../img/multicore_com_blocked_multithreading.jpg" align="center" height=auto width=30%/>

#### Interleaved Multithreading
<img src="../../img/multicore_com_interleaved_multithreading.jpg" align="center" height=auto width=30%/>

#### Simultaneous Multithreading
<img src="../../img/multicore_com_simultaneous_multithreading.jpg" align="center" height=auto width=30%/>

#### Superescalar
<img src="../../img/multicore_superescalar.jpg" align="center" height=auto width=30%/>


## Multiprocessador
#### Numa
<img src="../../img/multiprocessador_numa.jpg" align="center" height=auto width=90%/>

#### Uma
<img src="../../img/multiprocessador_uma.jpg" align="center" height=auto width=90%/>

## Superscalar
#### Superscalar
<img src="../../img/superescalar.jpg" align="center" height=auto width=30%/>

#### Multithread
<img src="../../img/superescalar_com_interleaved_multithreading.jpg" align="center" height=auto width=30%/>
