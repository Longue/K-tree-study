options(scipen = 999)
#creamos un grafico de 2*3
par(mfrow = c(2, 3))

n <- t2$V1
s <- t2$V2
plot(n, s, type="l", main = "Evolución de los steps k=2", xlab = "Nodos Visitados", ylab = "Steps")
n <- t3$V1
s <- t3$V2
plot(n, s,  type="l", main = "Evolución de los steps k=3", xlab = "Nodos Visitados", ylab = "Steps")
n <- t4$V1
s <- t4$V2
plot(n, s, type ="l", main = "Evolución de los steps k=4", xlab = "Nodos Visitados", ylab = "Steps")
n <- t5$V1
s <- t5$V2
plot(n, s, type="l", main = "Evolución de los steps k=5", xlab = "Nodos Visitados", ylab = "Steps")
n <- t6$V1
s <- t6$V2
plot(n, s, type="l", main = "Evolución de los steps k=6", xlab = "Nodos Visitados", ylab = "Steps")

par(mfrow = c(1, 1))

n <- t2$V1
s <- t2$V2
sm <- t6$V2
plot(n, s, type="l", main = "Evolución de los steps", xlab = "Nodos Visitados", ylab = "Steps", ylim=c(min(s),max(sm)))

n <- t3$V1
s <- t3$V2
lines(n,s, col="blue")

n <- t4$V1
s <- t4$V2
lines(n,s, col="purple")

n <- t5$V1
s <- t5$V2
lines(n,s, col="orange")

n <- t6$V1
s <- t6$V2
lines(n,s, col="green")

legend("topleft",                 
       legend = c("k=2", "k=3", "k=4", "k=5", "k=6"),
       col = c("black", "blue", "purple", "orange", "green"),        
       lwd = 2,
       bty = "n"                    
)

#creamos un grafico de 2*3
par(mfrow = c(2, 3))

#ingresamos los valores k2 1 a 10k
n <- t2$V1
s <- t2$V2

#Realizamos una regresion lineal loglog de nuestros datos
#para observar el crecimiento y conseguir una funcion lineal
#que encage con su crecimiento
ajuste2 <- lm(log10(s) ~ log10(n))
summary(ajuste2)
plot(log10(n), log10(s), type="l", main = "Evolución de los steps k=2", xlab = "Nodos Visitados", ylab = "Steps")
abline(ajuste2, col="red")

#ingresamos los valores k3 1 a 10k
n <- t3$V1
s <- t3$V2

ajuste3 <- lm(log10(s) ~ log10(n))
summary(ajuste3)
plot(log10(n), log10(s), type="l", main = "Evolución de los steps k=3", xlab = "Nodos Visitados", ylab = "Steps")
abline(ajuste3, col="red")

#ingresamos los valores k4 1 a 10k
n <- t4$V1
s <- t4$V2

ajuste4 <- lm(log10(s) ~ log10(n))
summary(ajuste4)
plot(log10(n), log10(s), type="l", main = "Evolución de los steps k=4", xlab = "Nodos Visitados", ylab = "Steps")
abline(ajuste4, col="red")

#ingresamos los valores k5 1 a 10k
n <- t5$V1
s <- t5$V2

ajuste5 <- lm(log10(s) ~ log10(n))
summary(ajuste5)
plot(log10(n), log10(s), type="l", main = "Evolución de los steps k=5", xlab = "Nodos Visitados", ylab = "Steps")
abline(ajuste5, col="red")

#ingresamos los valores k6 1 a 10k
n <- t6$V1
s <- t6$V2

ajuste6 <- lm(log10(s) ~ log10(n))
summary(ajuste6)
plot(log10(n), log10(s), type="l", main = "Evolución de los steps k=6", xlab = "Nodos Visitados", ylab = "Steps")
abline(ajuste6, col="red")

par(mfrow = c(1, 1))

n <- t2$V1
s <- t2$V2
sm <- t6$V2
plot(log10(n),log10(s), type="l", ylim=c(min(log10(n)),max(log10(sm))), main = "Evolución de los steps", xlab = "Nodos Visitados", ylab = "Steps")
abline(ajuste2, col="red")

n <- t3$V1
s <- t3$V2
lines(log10(n),log10(s), col="blue")
abline(ajuste3, col="red")

n <- t4$V1
s <- t4$V2
lines(log10(n),log10(s), col="purple")
abline(ajuste4, col="red")

n <- t5$V1
s <- t5$V2
lines(log10(n),log10(s), col="orange")
abline(ajuste5, col="red")

n <- t6$V1
s <- t6$V2
lines(log10(n),log10(s), col="green")
abline(ajuste6, col="red")


legend("bottomright",                 
       legend = c("k=2", "k=3", "k=4", "k=5", "k=6"),
       col = c("black", "blue", "purple", "orange", "green"),        
       lwd = 2,
       bty = "n"                    
)
#funcion lineal que corresponde al crecimiento del coste
coef(ajuste2)
coef(ajuste3)
coef(ajuste4)
coef(ajuste5)
coef(ajuste6)

