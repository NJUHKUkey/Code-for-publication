import delimited "Data_all_metropolitan.csv", clear
xtset name_code year

*** VIF test
regress area gdztkn_in_all rs fai pop_diff rp fd
estat vif

***Cointegration test
xtcointtest pedroni area gdztkn_in_all rs fai pop_diff rp fd, trend demean ar(panels)
xtcointtest pedroni area gdztkn_in_all rs fai pop_diff rp fd, demean ar(panels)
xtcointtest pedroni area gdztkn_in_all rs fai pop_diff rp fd, noconstant demean ar(panels)

***Stationarity test
xtunitroot llc area
xtunitroot llc gdztkn_in_all
xtunitroot llc rs
xtunitroot llc pop_diff
xtunitroot llc rp
xtunitroot llc fd


xtunitroot ht area
xtunitroot ht gdztkn_in_all
xtunitroot ht rs
xtunitroot ht pop_diff
xtunitroot ht rp
xtunitroot ht fd

xtunitroot breitung area
xtunitroot breitung gdztkn_in_all
xtunitroot breitung rs
xtunitroot breitung pop_diff
xtunitroot breitung rp
xtunitroot breitung fd

xtunitroot ips area
xtunitroot ips gdztkn_in_all
xtunitroot ips rs
xtunitroot ips pop_diff
xtunitroot ips rp
xtunitroot ips fd

xtunitroot fisher area
xtunitroot fisher gdztkn_in_all
xtunitroot fisher rs
xtunitroot fisher pop_diff
xtunitroot fisher rp
xtunitroot fisher fd