import delimited "Data_all_metropolitan.csv", clear
xtset name_code year
spatwmat using W_all_queen.dta, name(W) standardize
xsmle area gd_in_all rs fai pop_diff rp fd, fe model(sdm) wmat(W) nolog noeffects type(ind)
xsmle area ztkn_in_all rs fai pop_diff rp fd, fe model(sdm) wmat(W) nolog noeffects type(ind)

xsmle area gdztkn_in_m rs fai pop_diff rp fd, fe model(sdm) wmat(W) nolog noeffects type(ind)


import delimited "Data_province.csv", clear
xtset name_code year
spatwmat using W_province_queen.dta, name(W) standardize
xsmle area gdztkn_in_p rs fai pop_diff rp fd, fe model(sdm) wmat(W) nolog noeffects type(ind)



import delimited "Data_agglomeration.csv", clear
xtset name_code year
spatwmat using W_agglomeration_queen.dta, name(W) standardize
xsmle area gdztkn_in_a rs fai pop_diff rp fd, fe model(sdm) wmat(W) nolog noeffects type(ind)