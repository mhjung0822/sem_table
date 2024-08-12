

cap program drop sem_etable
program define sem_etable
 syntax [, table(string) replace]

 local cmd "`e(cmd)'"
 if "`cmd'"!="sem" {
 	dis as error "sem 명령어가 우선 실행되어야 합니다."
	exit
 }
 local cmdline="`e(cmdline)'"
 local latent="`e(lxvars)'"
 
 if "`table'"=="" {
 	local table "table"
 }
 
 qui {
		collect create `table', `replace'
		collect, name(`table') : `cmdline'
		collect layout (colname[`latent']#coleq colname) (result[_r_b _r_se _r_z _r_p b_std])
		collect style cell _r_se , minimum(0.000001, label("-")) 
		collect style cell result[_r_b _r_se b_std], nformat(%10.3f)
		collect stars _r_p 0.001 "***" 0.01 "**" 0.05 "*", result 
		collect layout (colname[`latent']#coleq colname) (result[_r_b stars _r_se _r_z _r_p b_std])
		collect style cell _r_b _r_se _r_z _r_p, empty("-")
		collect label levels result b_std "std.coef.", modify
		collect style header result[stars], level(hide)
		global ll : dis %10.3f `e(ll)' 
		dis $ll
		global N : dis %10.0fc `e(N)' 
		dis $N
		collect notes "주: N=$N; Log likelihood=$ll", clear
 }
 collect dir
 collect preview
end


cap program drop sem_gof_table
program define sem_gof_table
 syntax [, table(string) replace]
 
 local cmd "`e(cmd)'"
 if "`cmd'"!="sem" {
 	dis as error "sem 명령어가 우선 실행되어야 합니다."
	exit
 }
 local df=`e(df_ms)'
 if "`table'"=="" {
	local table "gof"
 }
 qui {
	*gof table
	collect create `table', `replace'
	collect, name(`table') : estat gof, stats(all)
	collect layout (result) (cmdset)
	collect layout (result[chi2_ms p_ms rmsea lb90_rmsea ub90_rmsea pclose cfi tli]) (cmdset)
	collect style cell result[rmsea], border(top)
	collect style cell result[cfi], border(top)
	collect label levels result chi2_ms "LR test of model vs. saturated: chi2(`df')", modify
	collect style cell result, nformat(%10.3f)
	collect label levels result p_ms "Prob > chi2", modify
	collect label levels cmdset 1 "value"
	collect style header , level(label)
	collect title "Goodness of Fit statistic"
 }
 collect dir
 collect preview
end







