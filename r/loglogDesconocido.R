par(mfrow = c(1, 1))
#ingresamos los valores k3 1 a 10k
n <- t2$V1
s <- t2$V2
ajuste2 <- lm(log10(s-log2(n)) ~ log10(n))

n <- t3$V1
s <- t3$V2

ajuste3 <- lm(log10(s-log2(n)) ~ log10(n))
#ingresamos los valores k4 1 a 10k
n <- t4$V1
s <- t4$V2

ajuste4 <- lm(log10(s-log2(n)) ~ log10(n))

#ingresamos los valores k5 1 a 10k
n <- t5$V1
s <- t5$V2

ajuste5 <- lm(log10(s-log2(n)) ~ log10(n))

#ingresamos los valores k6 1 a 10k
n <- t6$V1
s <- t6$V2

ajuste6 <- lm(log10(s-log2(n)) ~ log10(n))

par(mfrow = c(1, 1))

n <- t2$V1
s <- t2$V2
sm <- t6$V2
plot(log10(n), log10(s-log2(n)), type="l", ylim=c(min(log10(s-log2(n))),max(log10(sm-log2(n)))), main = "Evolución de los steps", xlab = "Nodos Visitados", ylab = "Steps")
abline(ajuste2, col="red")

n <- t3$V1
s <- t3$V2
lines(log10(n),log10(s-log2(n)), col="blue")
abline(ajuste3, col="red")

n <- t4$V1
s <- t4$V2
lines(log10(n),log10(s-log2(n)), col="purple")
abline(ajuste4, col="red")

n <- t5$V1
s <- t5$V2
lines(log10(n),log10(s-log2(n)), col="orange")
abline(ajuste5, col="red")

n <- t6$V1
s <- t6$V2
lines(log10(n),log10(s-log2(n)), col="green")
abline(ajuste6, col="red")

par(mar=c(6,6,6,6))
par(xpd = TRUE)
legend(6, 2.5,#4, 2,               
       legend = c("k=2", "k=3", "k=4", "k=5", "k=6"),
       col = c("black", "blue", "purple", "orange", "green"),        
       lwd = 2,
       bty = "n"                    
)
par(xpd = FALSE)
#funcion lineal que corresponde al crecimiento del coste
coef(ajuste2)
coef(ajuste3)
coef(ajuste4)
coef(ajuste5)
coef(ajuste6)

