'''
The vice president of sales at a large company says salespeople are averaging 
no more than 15 sales contacts per week. (He would like to increase that number.) 
As proof of his claim, n = 20 salespeople are randomly selected and the number 
of contacts made by each for a single randomly selected week is recorded.
'''

muestra <- c(V1 = 13, V2 = 17, V3 = 20, V4 = 17, V5 = 20, V6 = 20, V7 = 18, V8 = 18, V9 = 16, V10 = 19, 
             V11 = 13, V12 = 17, V13 = 15, V14 = 19, V15 = 16, V16 = 19, V17 = 22, V18 = 10, V19 = 13, V20 = 21)


# H0: mu=15 vs H1: mu>15
(t0 <- (mean(muestra)-15)/(sd(muestra)/sqrt(20)))

(t.05 <- qt(p = 0.05, df=19, lower.tail = FALSE))

# z0>z.05 => Reject H0

# p-value
(pvalue <- pnorm(z0, lower.tail = FALSE)) # pvalue<0.01

t.test(x=muestra, alternative='greater', mu=15)
