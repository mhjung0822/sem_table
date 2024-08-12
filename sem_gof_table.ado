

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







