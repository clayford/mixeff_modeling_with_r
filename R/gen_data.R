# data with subject random effect on intercept and slope
n <- 10
id <- gl(n = n, k = 10)
x <- rep(1:10, n)
set.seed(2)
obs_noise <- rnorm(n * 10, mean = 0, sd = 0.7)

# simulate correlated subject random effects
set.seed(4)
V <- matrix(c(0.6, -0.8, 
              -0.8, 1.5), nrow = 2)
subj_noise <- MASS::mvrnorm(n, mu = c(0,0), Sigma = V)

# generate y; add subject-specific noise to intercept
y <- (2 + subj_noise[id,1]) + (5 + subj_noise[id,2])*x + obs_noise
d3 <- data.frame(id, y, x)
write.csv(d3, file = "data/d.csv", row.names = FALSE)
