
# This script attempts to reproduce Table 4 in the "Buffett's Alpha" paper
# Factor analysis on BRK.A stock price, including QMJ and BAB factors

# Fama-French Regression example in R
# From http://www.calculatinginvestor.com/2011/04/19/fama-french-tutorial/
# Modified by ClosetIndexer

# Load CSV file into R
ff_data <- read.table("~/R/ffdata_brk13f.csv",header=TRUE,sep=",")

# Extract Fama-French Factors and Fund Returns
dt <- as.Date(ff_data[,1],"%m/%d/%Y")
fund <- ff_data[,2]/100 # BRK.A
rmrf <- ff_data[,3]/100
smb <- ff_data[,4]/100
hml <- ff_data[,5]/100
rf <- ff_data[,6]/100
qmj <- ff_data[,7]/100
bab <- ff_data[,8]/100
umd <- ff_data[,9]/100


# Calculate Excess Returns for target fund
fund.xs <- fund - rf
fund_rtn <- exp(sum(log(1+fund.xs))*12/length(fund.xs))-1
fund_sd <- sd(fund.xs)*sqrt(12)
fund_sharpe <- fund_rtn/fund_sd
mkt_rtn <- exp(sum(log(1+rmrf))*12/length(rmrf))-1
mkt_sd <- sd(rmrf)*sqrt(12)
mkt_sharpe <- mkt_rtn/mkt_sd
print(c("---- Return VS Market ----"))
print(c("fund rtn,sd=", fund_rtn, fund_sd, "mkt rtn,sd=", mkt_rtn, mkt_sd))
print(c("fund SR", fund_sharpe, "mkt SR", mkt_sharpe))


# Run Regression to extract beta
reg_mkt <- lm(fund.xs ~ rmrf ) 
# Print summary of regression results
print(c("---- Regression against market only ----"))
print(summary(reg_mkt))
alpha <- reg_mkt$coefficients[1]*12
beta <- reg_mkt$coefficients[2]
names(alpha) <- c("alpha")
names(beta) <- c("beta")
print(c(alpha,beta))

fund.xm <- fund.xs - beta * rmrf
reg_ff1 <- lm(fund.xs ~ rmrf + smb + hml + umd)
reg_ff2 <- lm(fund.xs ~ rmrf + smb + hml + umd + bab)
reg_ff3 <- lm(fund.xs ~ rmrf + smb + hml + umd + bab + qmj)

reg <- reg_ff3  # Choose which regression to display
print(c("---- Multi-Factor Model ----"))
print(summary(reg))
alpha <- reg$coefficients[1]*12
names(alpha) <- c("alpha")
print(c(alpha))

