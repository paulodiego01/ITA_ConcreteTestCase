### Passo-a-passo para execução da ferramenta ConcreteTestCase

Este arquivo contém o passo-a-passo de utilização da ferramenta ConcreteTestCase.

Para execução do programa se faz necessário abrir os arquivos .m no programa MATLAB.

#### a) Para executar a função de criação da fila de bordo para o simulador é necessário serguir os seguintes passos:
 
 1 - Executar o arquivo mainInput.m
 
 2 - Selecionar o arquivo .seq, arquivo que contém os casos de teste.
 
 3 - Escolher um diretório e definir um nome para o novo arquivo.
 
 *Após sua execução, a ferramenta gera um arquivo do tipo .txt, com o nome dado mais "_BoardQueue", contendo a fila de bordo 
 prontapara ser importada e executada dentro do simulador.
 
#### b) Para executar a função de criação do veredito de teste contendo os resultados da comparação das saídas observadas 
 da simulação com as saídas esperadas dos casos de teste, é necessário seguir o seguintes passos:
 
 1 - Executar o arquivo mainOutput.m
 
 2 - Selecionar o arquivo contendo os casos de teste da condado (.seq)
 
 3 - Selecionar o arquivo de telecomandos (.csv)
 
 4 - Selecionar o arquivo de saída do simulador, arquivo este chamado de histórico de simulação (.csv)
 
 5 - Escolher um diretório e definir um nome para o arquivo contendo o veredito de teste.
 
 *Após sua execução, a ferramenta gera um arquivo do tipo .xlsx, com o nome dado, contendo o veredito de teste.
