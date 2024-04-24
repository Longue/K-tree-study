options(scipen = 999)
par(xpd = FALSE)
par(mfrow = c(2, 3))
n <- t2$V1
s <- t2$V2
zeta = log2(s - log2(n))/log2(n)
plot(n, zeta, type="l", main = "Tendencia de la ζ k=2", xlab = "Nodos Visitados", ylab = "ζ")
ajuste2 <- lm(zeta ~ log(n))
summary(ajuste2)
abline(ajuste2, col="red")

n <- t3$V1
s <- t3$V2
zeta = log2(s - log2(n))/log2(n)
plot(n, zeta,type="l", main = "Tendencia de la ζ k=3", xlab = "Nodos Visitados", ylab = "ζ")
ajuste3 <- lm(zeta ~ log(n))
summary(ajuste3)
abline(ajuste3, col="red")

n <- t4$V1
s <- t4$V2
zeta = log2(s - log2(n))/log2(n)
plot(n, zeta,type="l", main = "Tendencia de la ζ k=4", xlab = "Nodos Visitados", ylab = "ζ")
ajuste4 <- lm(zeta ~ log(n))
summary(ajuste4)
abline(ajuste4, col="red")

n <- t5$V1
s <- t5$V2
zeta = log2(s - log2(n))/log2(n)
plot(n, zeta,type="l", main = "Tendencia de la ζ k=5", xlab = "Nodos Visitados", ylab = "ζ")
ajuste5 <- lm(zeta ~ log(n))
summary(ajuste5)
abline(ajuste5, col="red")

n <- t6$V1
s <- t6$V2
zeta = log2(s - log2(n))/log2(n)
plot(n, zeta,type="l", main = "Tendencia de la ζ k=6", xlab = "Nodos Visitados", ylab = "ζ")
ajuste6 <- lm(zeta ~ log(n))
summary(ajuste6)
abline(ajuste6, col="red")

par(mfrow = c(1, 1))
n <- t2$V1
s <- t2$V2
zeta = log2(s - log2(n))/log2(n)
plot(n, zeta, type="l", main = "Tendencia de la ζ", xlab = "Nodos Visitados", ylab = "ζ", ylim=c(0,0.8))

n <- t3$V1
s <- t3$V2
zeta = log2(s - log2(n))/log2(n)
lines(n,zeta, col="blue")

n <- t4$V1
s <- t4$V2
zeta = log2(s - log2(n))/log2(n)
lines(n,zeta, col="purple")

n <- t5$V1
s <- t5$V2
zeta = log2(s - log2(n))/log2(n)
lines(n,zeta, col="orange")

n <- t6$V1
s <- t6$V2
zeta = log2(s - log2(n))/log2(n)
lines(n,zeta, col="green")

par(mar=c(4,4,4,6))
par(xpd = TRUE)

legend(10000,0.9,                  
       legend = c("k=2", "k=3", "k=4", "k=5", "k=6"),
       col = c("black", "blue", "purple", "orange", "green"),        
       lwd = 2,
       bty = "n"                    
)

par(xpd = FALSE)