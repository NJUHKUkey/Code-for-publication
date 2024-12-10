import delimited "Data_all_metropolitan.csv", clear
xtset name_code year

local core_explanatory_vars "gdztkn_in_all gd_in_all ztkn_in_all gdztkn_in_m"

foreach var of local core_explanatory_vars {
	spatwmat using W_all_queen.dta, name(W) standardize

	xsmle area `var' pop_diff rp fd, fe model(sdm) wmat(W) nolog effects type(ind)
	
	xsmle rs `var' pop_diff rp fd, fe model(sdm) wmat(W) nolog effects type(ind)
	
	xsmle fai `var' pop_diff rp fd, fe model(sdm) wmat(W) nolog effects type(ind)
	
	xsmle area `var' rs fai pop_diff rp fd, fe model(sdm) wmat(W) nolog effects type(ind)
}
