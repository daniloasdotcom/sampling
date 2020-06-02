#Primeiro Carregamos os Pacotes
library(xlsx)


#Primeiro indico onde os arquivos se encontram
setwd("C:/Users/Usuário/Desktop")

#Agora eu abro o arquivo como tabela
dados<-read.xlsx("inv.xlsx", sheetName = "Planilha1")

#Abro o arquivo de dados
head(dados)
str(dados)

#Na sequencia cria-se os parametros para o laço for in
#"n" será o número de amostragens
n = 10000

#"resultado" será um objeto do tipo lista que representará como cada amostragem deve ser apresentada
resultado=list(c(NA))

#Será criado um laço de 1 até n (1000) onde o conteúdo i de "resultado" serão amostras de tamanho 20 com reposição das parcelas
#O  duplo colchete serve para indica que cada resultado deve conter todo o conteúdo de tamanho 20

for(i in 1:n)
{
  resultado[[i]]<-sample(dados$v1, size=20, replace=TRUE)
}


dados <- c("cara","coroa")

for(i in 1:100)
{
  resultado[[i]]<-sample(dados, size=10, replace=TRUE)
}

#Abrir o conteúdo das amostragens
resultado

#Criaremos agora uma lista que servirá de cabeçalho para resultado
names(resultado)<-paste('A', 1:100, sep = '')

#Vericamos agora se resultaddo é uma lista
is.list(resultado)

#transformamos em um data.frame
amostras<-as.data.frame(resultado)
amostras


# e salvamos a amostragem em um arquivo .txt
write.xlsx(amostras, file = "tabela.xlsx")