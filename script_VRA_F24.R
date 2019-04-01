rm(list = ls())

setwd("~/Dropbox/InovaAC/O1 - E4 - MALHA/Data sets/VRA_F24")

# ---------------------------------------------------------------------------------------
# BIBLIOTECAS
# ---------------------------------------------------------------------------------------

library(tidyverse)
library(lubridate)
library(gridExtra)

load("nvFR24.Rdata")


# ---------------------------------------------------------------------------------------
# CONSTRUÇÃO DO DSP 2018 - REFERÊNCIA VRA 2018 
# ---------------------------------------------------------------------------------------

data_2018_01  <- read_delim("vra_2018_01.csv", ";", escape_double = FALSE, 
                     col_names = FALSE, trim_ws = TRUE)

data_2018_02 <- read_delim("vra_2018_02.csv", ";", escape_double = FALSE, 
                     col_names = FALSE, trim_ws = TRUE)

data_2018_03 <- read_delim("vra_2018_03.csv", ";", escape_double = FALSE, 
                     col_names = FALSE, trim_ws = TRUE)

data_2018_04 <- read_delim("vra_2018_04.csv", ";", escape_double = FALSE, 
                     col_names = FALSE, trim_ws = TRUE)

data_2018_05 <- read_delim("vra_2018_05.csv", ";", escape_double = FALSE, 
                     col_names = FALSE, trim_ws = TRUE)

data_2018_06 <- read_delim("vra_2018_06.csv", ";", escape_double = FALSE, 
                     col_names = FALSE, trim_ws = TRUE)

data_2018_07 <- read_delim("vra_2018_07.csv", ";", escape_double = FALSE, 
                     col_names = FALSE, trim_ws = TRUE)

data_2018_08 <- read_delim("vra_2018_08.csv", ";", escape_double = FALSE, 
                     col_names = FALSE, trim_ws = TRUE)

data_2018_09 <- read_delim("vra_2018_09.csv", ";", escape_double = FALSE, 
                     col_names = FALSE, trim_ws = TRUE)

data_2018_10 <- read_delim("vra_2018_10.csv", ";", escape_double = FALSE, 
                     col_names = FALSE, trim_ws = TRUE)

data_2018_11 <- read_delim("vra_2018_11.csv", ";", escape_double = FALSE, 
                     col_names = FALSE, trim_ws = TRUE)

data_2018_12 <- read_delim("vra_2018_12.csv", ";", escape_double = FALSE, 
                     col_names = FALSE, trim_ws = TRUE)

#------------------------ DSP 2018 ------------------------------------------------

# Montagem do DSP2018

DSP2018 <- rbind(data_2018_01,data_2018_02,data_2018_03,data_2018_04,data_2018_05,data_2018_06,
              data_2018_07,data_2018_08,data_2018_09,data_2018_10,data_2018_11,data_2018_12)

#---------------------------------------------------------------------------------
# Remoção dos data sets 2018 que não serão empregados no restante da análise

rm(data_2018_01,data_2018_02,data_2018_03,data_2018_04,data_2018_05,data_2018_06,
    data_2018_07,data_2018_08,data_2018_09,data_2018_10,data_2018_11,data_2018_12)


# ---------------------------------------------------------------------------------------
# CONSTRUÇÃO DO DSP 2017 - REFERÊNCIA VRA 2017 
# ---------------------------------------------------------------------------------------

data_2017_01 <- read_delim("vra_2017_01.csv", ";", escape_double = FALSE, 
                    col_names = FALSE, trim_ws = TRUE) 

data_2017_02 <- read_delim("vra_2017_02.csv", ";", escape_double = FALSE, 
                    col_names = FALSE, trim_ws = TRUE) 

data_2017_03 <- read_delim("vra_2017_03.csv", ";", escape_double = FALSE, 
                    col_names = FALSE, trim_ws = TRUE) 

data_2017_04 <- read_delim("vra_2017_04.csv", ";", escape_double = FALSE, 
                    col_names = FALSE, trim_ws = TRUE) 

data_2017_05 <- read_delim("vra_2017_05.csv", ";", escape_double = FALSE, 
                    col_names = FALSE, trim_ws = TRUE) 


data_2017_06 <- read_delim("vra_2017_06.csv", ";", escape_double = FALSE, 
                    col_names = FALSE, trim_ws = TRUE) 


data_2017_07 <- read_delim("vra_2017_07.csv", ";", escape_double = FALSE, 
                    col_names = FALSE, trim_ws = TRUE) 


data_2017_08 <- read_delim("vra_2017_08.csv", ";", escape_double = FALSE, 
                    col_names = FALSE, trim_ws = TRUE) 

data_2017_09 <- read_delim("vra_2017_09.csv", ";", escape_double = FALSE, 
                    col_names = FALSE, trim_ws = TRUE) 

data_2017_10 <- read_delim("vra_2017_10.csv", ";", escape_double = FALSE, 
                    col_names = FALSE, trim_ws = TRUE) 

data_2017_11 <- read_delim("vra_2017_11.csv", ";", escape_double = FALSE, 
                    col_names = FALSE, trim_ws = TRUE) 

data_2017_12 <- read_delim("vra_2017_12.csv", ";", escape_double = FALSE, 
                    col_names = FALSE, trim_ws = TRUE) 


#------------------------ DSP 2017 ------------------------------------------------

DSP2017  <- rbind( data_2017_01 , data_2017_02 , data_2017_03 , data_2017_04 ,
               data_2017_05 , data_2017_06 , data_2017_07 , data_2017_08 ,
               data_2017_09 , data_2017_10 , data_2017_11 , data_2017_12)

# Remoção dos data sets 2017 que não serão empregados no restante da análise

rm( data_2017_01 , data_2017_02 , data_2017_03 , data_2017_04 ,
    data_2017_05 , data_2017_06 , data_2017_07 , data_2017_08 ,
    data_2017_09 , data_2017_10 , data_2017_11 , data_2017_12 )

# ---------------------------------------------------------------------------------------
# Montagem do Data Set data que contém o  VRA 2018 e VRA 2017

data<-rbind(DSP2017,DSP2018)

# ---------------------------------------------------------------------------------------
# Alteração dos nomes dos Rótulos das colunas

rotulos.colunas <-c("cia","nvo","cod","lin","dep","arr","dpp","dpr","dcp","dcr","sit","jus")
names(data)     <-rotulos.colunas
names(DSP2017)  <-rotulos.colunas
names(DSP2018)  <-rotulos.colunas

# ---------------------------------------------------------------------------------------
# Impressão da Tabela DSP 2017

tab.DSP2017  <- DSP2017 %>% slice(1:10)
pdf("tab.DSP2017.pdf", width = 12, height =5)
grid.table(tab.DSP2017)
dev.off()

# ---------------------------------------------------------------------------------------
# Impressão da Tabela DSP 2018

tab.DSP2018  <- DSP2018 %>% slice(1:10)
pdf("tab.DSP2018.pdf", width = 12, height =5)
grid.table(tab.DSP2018)
dev.off()

# ---------------------------------------------------------------------------------------
# Concluída a etapa de montagem do DSP2018 foram realizados procedimentos de exclusão 
# das observações dos pares de aeroportos que não pertencem ao território brasileiro. 
# Portanto, foram excluídos todos os voos classificados como: Internacional (I),
# Cargueiro Internacional (G) e Sub-Regional (H), conforme a coluna lin. Adicionalmente
# foram excluídos os voos programados não realizados, indicados na coluna sit do DSP2018
# como “CANCELADO”
# ---------------------------------------------------------------------------------------

data <- data %>% filter ( lin != "I" ) %>% 
                 filter ( lin != "G" ) %>%
                 filter ( lin != "H" ) %>%
                 filter ( sit != "CANCELADO")

data <-data %>%  separate(dpp, sep = "([\\ \\:])", into = c("dpp_date","dpp_hour","dpp_minute"))
data <-data %>%  separate(dpr, sep = "([\\ \\:])", into = c("dpr_date","dpr_hour","dpr_minute"))
data <-data %>%  separate(dcp, sep = "([\\ \\:])", into = c("dcp_date","dcp_hour","dcp_minute"))
data <-data %>%  separate(dcr, sep = "([\\ \\:])", into = c("dcr_date","dcr_hour","dcr_minute"))


data$dpp_date<-as.Date(data$dpp_date, "%d/%m/%Y")
data$dpr_date<-as.Date(data$dpr_date, "%d/%m/%Y")
data$dcp_date<-as.Date(data$dcp_date, "%d/%m/%Y")
data$dcr_date<-as.Date(data$dcr_date, "%d/%m/%Y")

data <- data %>% select(cia,nvo,dep,arr, dpr_date,dpr_hour,dpr_minute) 


# ---------------------------------------------------------------------------------------
# Ordenação dos pares OD tendo como referência DSP2018
# ---------------------------------------------------------------------------------------

dataPares <- DSP2018
dataPares <- dataPares %>% unite(par, dep, arr, sep = '-')
dataPares <- dataPares %>% filter ( lin != "I" ) %>%  filter ( lin != "G" ) %>%
                                                      filter ( lin != "H" ) %>%
                                                      filter ( sit != "CANCELADO")
dataPares <- dataPares %>% select(cia,nvo,par)

dataPares$cia <-as.factor(dataPares$cia)
dataPares$nvo <-as.factor(dataPares$nvo)
dataPares$par <-as.factor(dataPares$par)


tabParesOD<-dataPares %>% count(par, sort = TRUE )    %>%  
                          mutate(fr = (n/sum(n))*100) %>%
                          mutate(Fr = cumsum(fr))

nRows<- nrow(tabParesOD) 

tabParesOD$x<-seq(1:nRows)

ggplot(tabParesOD, aes(x = x , y=Fr)) + 
       geom_point(color="blue", size=0.5) + labs(x = "Pares") + 
       theme(axis.text=element_text(size=14), axis.title=element_text(size=14,face="bold"))



pares_CHR   <-  tabParesOD  %>% slice(1:20)
pares_CHR   <-  pares_CHR   %>% select(par)
pares_CHR   <-  pares_CHR   %>%  separate(par,sep ="-",into = c("orig","dest"))

# ---------------------------------------------------------------------------------------
# Definição dos conjunto de datas a serem analisadas
# ---------------------------------------------------------------------------------------

dates <- as.Date(c("2017-09-12","2017-09-19","2017-09-20",
                   "2017-09-21","2017-09-22","2017-09-23",
                   "2017-09-24","2017-09-25","2017-09-26",
                   "2017-09-27","2017-09-28","2017-09-29",
                   "2017-09-30","2017-10-01","2017-10-02",
                   "2017-10-04","2017-10-05","2017-10-06",
                   "2017-10-07","2017-10-08","2017-10-09",
                   "2017-10-10","2017-10-24","2017-10-25",
                   "2017-10-26","2017-10-27","2017-10-28",
                   "2017-10-29","2017-10-30","2017-10-31",
                   "2017-11-01","2017-11-02","2017-11-03",
                   "2017-11-04","2017-11-05","2017-11-06",
                   "2017-11-07","2017-11-08","2017-11-09",
                   "2017-11-10","2017-11-11","2017-11-12",
                   "2017-11-13","2017-11-14"))


# ---------------------------------------------------------------------------------------
# Definição do data set  DSN2017, este data frame contém os 44 dias selecionados
# no vetor dates.
# ---------------------------------------------------------------------------------------

VRA_44  <- data %>% filter(dpr_date %in% dates)

# ---------------------------------------------------------------------------------------
# Impressão da Tabela DSN 2017

DSN2017  <- VRA_44
DSN2017  <- DSN2017 %>% unite(par, dep, arr, sep = '-')
DSN2017  <- DSN2017 %>% select(cia, nvo , par, dpr_date) 

tab.DSN2017 <- DSN2017 %>% slice(1:10)
pdf("tab.DSN2017.pdf", width = 12, height =5)
grid.table(tab.DSN2017)
dev.off()


# ---------------------------------------------------------------------------------------
### Carrega o data frame com o 20 pares origem - destino no formato:
### $ orig: chr  "SBSP" "SBRJ" "SBGR" "SBPA" ...
### $ dest: chr  "SBRJ" "SBSP" "SBPA" "SBGR"
### Este arquivo de dados é oriundo do programa que ordena os pares origem - destino



aerO<-pares_CHR$orig
aerD<-pares_CHR$dest
nvVRA<-numeric(length(aerD))

for (i in 1:length(aerD)) {
  
  myTEMP   <- VRA_44 %>% filter(dep == aerO[i],arr == aerD[i] )
  nvVRA[i] <- nrow(myTEMP)
}

remove(myTEMP)


### Monta a data frame com os pares e os número de voos correpondentes tendo como 
### referência o VRA e o FR24 para os 44 dias analisados



tabCover<-data.frame(pares_CHR$orig, pares_CHR$dest, nvVRA,nvFR24)

tabCover$nvVRA <-nvVRA
tabCover$nvFR24<-nvFR24


tabCover<-tabCover %>% mutate(cover = (nvFR24 / nvVRA)*100) 


var<-c("dep","arr","voos VRA","voos FR24","cover %")
names(tabCover)<-var


pdf("tab.Cover", onefile=T, paper="A4r",width = 20, height =20)
grid.table(tabCover)
dev.off()


#remove(data, dataPares, DSN2017, DSP2017, DSP2018, pares_CHR,tab.DSN2017, 
#       tab.DSP2017, tab.DSP2018, tabCover,tabParesOD, VRA_44)


