buffetts_alpha_R
================

R Factor Analysis with BAB and QMJ factors (Table 4) in the "Buffett's Alpha" paper

# How to Run

1. Edit `frazinni.r`, choose the csv file to use.
  1. `ffdata_brk.csv`: BRK.A stock prices from 1980 to 2013
  2. `ffdata_brk13f.csv`: Berkshire Hathaway 13F-HR portfolio's simulation return from 1999 to 2013
2. Choose which factor analysis to display - `reg_ff1`, `reg_ff2`, `ref_ff3`.
3. Run it by `Rscript frazinni.r`

# Major Results on BRK.A analysis

## Regression to the market

BRK.A has alpha of 12% and beta of 63%

![alt tag](https://raw.githubusercontent.com/slihn/buffetts_alpha_R/master/frazinni_R_BRK_vs_market.png)

## Table 4

We attempt to reproduce the loadings shown in Table 4.

![alt tag](https://raw.githubusercontent.com/slihn/buffetts_alpha_R/master/Buffetts_Alpha_Table_4.png)

### Table 4, Column 1: Basic FF loadings

Here we see that the loadings are strong on rmrf, smb, hml, but not on umd.

![alt tag](https://raw.githubusercontent.com/slihn/buffetts_alpha_R/master/frazinni_R_BRK_FF_Column_1.png)

### Table 4, Column 1: Loadings with BAB

Here we see that BAB has strong loading, and it weakens both hml and umd. Alpha is reduced from 12% to 8%, indicating BAB has explanatory power.

![alt tag](https://raw.githubusercontent.com/slihn/buffetts_alpha_R/master/frazinni_R_BRK_FF_Column_2.png)

### Table 4, Column 1: Loadings with BAB and QMJ

Here we see that QMJ has strong loading, and it weakens smb and umd. Alpha is reduced from 8% to 3%, indicating BAB and QMJ has explanatory power.

![alt tag](https://raw.githubusercontent.com/slihn/buffetts_alpha_R/master/frazinni_R_BRK_FF_Column_3.png)

# Major Results on 13F-HR analysis



# References

http://www.econ.yale.edu/~af227/pdf/Buffett%27s%20Alpha%20-%20Frazzini,%20Kabiller%20and%20Pedersen.pdf
