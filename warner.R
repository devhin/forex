#Sys.setenv(JAVA_HOME='C:\\Program Files\\Java\\jdk1.8.0_201')
library(readr)
library(rJava)
library(mailR)

rates_df = read_csv("rates.csv")

send.mail(from = "duroy.raphael@gmail.com",
          to = c("obertran94@gmail.com"),
          subject = "[Forex Warner]",
          body = "Body of the email",
          smtp = list(host.name = "smtp.gmail.com", port = 465, user.name = "duroy.raphael@gmail.com", passwd = "raphaelduroygmail", ssl = TRUE),
          authenticate = TRUE,
          send = TRUE)