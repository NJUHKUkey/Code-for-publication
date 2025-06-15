import delimited "Data_all_metropolitan.csv", clear
xtset name_code year

by name_code, sort: gen gdztkn_in_all_lag13 = L3.gdztkn_in_all

ivreg2 area_all (gdztkn_in_all = gdztkn_in_all_lag13) rs fai pop_diff rp fd, cluster(name_code) first savefp(first)
ivreg2 rs (gdztkn_in_all = gdztkn_in_all_lag13) pop_diff rp fd,cluster(name_code) first savefp(first)
ivreg2 fai (gdztkn_in_all = gdztkn_in_all_lag13) pop_diff rp fd,cluster(name_code) first savefp(first)