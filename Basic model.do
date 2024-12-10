import delimited "Data_all_metropolitan.csv", clear
xtset name_code year

***LM test
clear
use "W_all_queen.dta", clear
spcs2xt x1-x261, matrix(aaa) time(11)
spatwmat using aaaxt,name(W)
import delimited "Data_all_metropolitan.csv", clear
xtset name_code year
regress area gdztkn_in_all rs fai pop_diff rp fd

spatdiag, weights(W)

***hausman test
spatwmat using W_all_queen.dta, name(W) standardize
xsmle area gdztkn_in_all rs fai pop_diff rp fd, fe model(sdm) wmat(W) nolog noeffects type(both)
est store fe
xsmle area gdztkn_in_all rs fai pop_diff rp fd, re model(sdm) wmat(W) nolog noeffects type(both)
est store re

hausman re fe

***LR test
xsmle area gdztkn_in_all rs fai pop_diff rp fd, fe model(sdm) wmat(W) nolog noeffects type(ind)
est store ind
xsmle area gdztkn_in_all rs fai pop_diff rp fd, fe model(sdm) wmat(W) nolog noeffects type(time)
est store time
xsmle area gdztkn_in_all rs fai pop_diff rp fd, fe model(sdm) wmat(W) nolog noeffects type(both)
est store both 

lrtest ind both, df(11)
lrtest both time, df(11)

***Wald test
spatwmat using W_all_queen.dta, name(W) standardize
xsmle area gdztkn_in_all rs fai pop_diff rp fd, fe model(sdm) wmat(W) nolog noeffects type(ind)
test [Wx]gdztkn_in_all = [Wx]rs = [Wx]fai = [Wx]pop_diff = [Wx]rp = [Wx]fd

testnl ([Wx]gdztkn_in_all = -[Spatial]rho*[Main]gdztkn_in_all) ([Wx]rs = -[Spatial]rho*[Main]rs) ([Wx]fai = -[Spatial]rho*[Main]fai) ([Wx]pop_diff = -[Spatial]rho*[Main]pop_diff) ([Wx]rp = -[Spatial]rho*[Main]rp) ([Wx]fd = -[Spatial]rho*[Main]fd)

***LR检验-SEM、SLM、SDM
xsmle area gdztkn_in_all rs fai pop_diff rp fd, fe model(sdm) wmat(W) nolog noeffects type(ind)
est store sdm
xsmle area gdztkn_in_all rs fai pop_diff rp fd, fe model(sar) wmat(W) nolog noeffects type(ind)
est store sar
xsmle area gdztkn_in_all rs fai pop_diff rp fd, fe model(sem) emat(W) nolog type(ind)
est store sem 

lrtest sdm sar, df(11)
lrtest sdm sem, df(11)


***basic model
xsmle area gdztkn_in_all rs fai pop_diff rp fd, fe model(sdm) wmat(W) nolog noeffects type(ind)