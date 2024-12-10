import delimited "Data_robust test.csv", clear
xtset name_code year
spatwmat using W_all_distance, name(W) standardize
summarize area_stata
generate area_stata_std = (area_stata - r(mean)) / r(sd)
xsmle area_stata_std gdztkn_in_all rs fai pop_diff rp fd, fe model(sdm) wmat(W) nolog noeffects type(ind)


import delimited "Data_all_metropolitan.csv", clear
xtset name_code year
spatwmat using W_all_distance, name(W) standardize
xsmle area gdztkn_in_all rs fai pop_diff rp fd, fe model(sdm) wmat(W) nolog noeffects type(ind)


import delimited "Data_all_metropolitan.csv", clear
xtset name_code year
spatwmat using W_all_queen2, name(W) standardize
xsmle area gdztkn_in_all rs fai pop_diff rp fd, fe model(sdm) wmat(W) nolog noeffects type(ind)


import delimited "Data_all_metropolitan.csv", clear
xtset name_code year
spatwmat using W_all_queen.dta, name(W) standardize
xsmle area gdztkn_in_all rs fai pop_diff rp fd, fe model(sar) wmat(W) nolog noeffects type(ind)
xsmle area gdztkn_in_all rs fai pop_diff rp fd, fe model(sem) emat(W) nolog type(ind)