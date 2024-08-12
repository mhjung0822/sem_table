
# 1. 설치방법

## 1) Stata의 personal 폴더 확인(sysdir)

```
. sysdir
   STATA:  /Applications/Stata/
    BASE:  /Applications/Stata/ado/base/
    SITE:  /Applications/Stata/ado/site/
    PLUS:  /Users/~~~/Library/Application Support/Stata/ado/plus/
PERSONAL:  /Users/~~~/Documents/Stata/ado/personal/
OLDPLACE:  ~/ado/
```

## 2) personal 폴더에 sem_etable.ado, sem_gof_table.ado를 복사, 붙여넣기

위 환경에서는 "/Users/~~~/Documents/Stata/ado/personal/"


## 3) Stata 재시작

stata를 재시작하면 sem_etable, sem_gof_table 명령어가 등록됨.

# 2. 사용방법

sem 명령어 실행후 sem_etable, sem_gof_table 명령어 실행

# 3. 명령어 설명

## 3.1. sem_etable

### syntax
. sem_etable [, replace table(string)

sem 명령어 실행후 etable 생성. 실행시 "table" collection 생성

### options
replace : "table" collection이 있을 경우 replace  
table(string) : "string"으로 collection table 명 설정

### 주의사항
sem_etable 실행시 수행한 sem 모형이 재 수행되므로 post-estimation 등이
적용되지 않을 수 있음.

## 3.2. sem_gof_table

### syntax
. sem_gof_table [, replace table(string)

sem 명령어 실행후 gof table 생성. 실행시 "gof" collection 생성

### options

replace : "gof" collection이 있을 경우 replace  
table(string) : "string"으로 collection table 명 설정

# 4. 결과 예시
```
. webuse sem_2fmm, clear
. sem (Affective -> a1 a2 a3 a4 a5) (Cognitive -> c1 c2 c3 c4 c5)
. sem_etable, replace
Collections in memory
Current: table
-----------------
 Name   No. items
-----------------
table   738      
-----------------

-----------------------------------------------------------------------------
                         | Coefficient     Std. error     z p-value std.coef.
-------------------------+---------------------------------------------------
Affective                |                                                   
  Affective arousal 1    |       1.000              -     -       -     0.900
  Affective arousal 2    |       0.976 ***      0.046 21.18   0.000     0.902
  Affective arousal 3    |       0.837 ***      0.036 23.58   0.000     0.939
  Affective arousal 4    |       0.964 ***      0.050 19.31   0.000     0.869
  Affective arousal 5    |       1.064 ***      0.044 24.41   0.000     0.952
Cognitive                |                                                   
  Cognitive arousal 1    |       1.000              -     -       -     0.852
  Cognitive arousal 2    |       1.115 ***      0.066 17.00   0.000     0.876
  Cognitive arousal 3    |       1.330 ***      0.079 16.79   0.000     0.863
  Cognitive arousal 4    |       1.173 ***      0.071 16.48   0.000     0.858
  Cognitive arousal 5    |       1.126 ***      0.064 17.48   0.000     0.893
var(e.a1)                |     384.136         43.791     -       -     0.189
var(e.a2)                |     357.352         41.005     -       -     0.186
var(e.a3)                |     154.951         20.090     -       -     0.118
var(e.a4)                |     496.459         54.163     -       -     0.245
var(e.a5)                |     191.686         28.072     -       -     0.093
var(e.c1)                |     171.664         19.823     -       -     0.274
var(e.c2)                |     171.806         20.535     -       -     0.233
var(e.c3)                |     276.014         32.335     -       -     0.255
var(e.c4)                |     224.199         25.934     -       -     0.263
var(e.c5)                |     146.866         18.576     -       -     0.202
var(Affective)           |    1644.463        193.103     -       -     1.000
var(Cognitive)           |     455.935         59.112     -       -     1.000
cov(Affective,Cognitive) |     702.074 ***     85.723  8.19   0.000     0.811
-----------------------------------------------------------------------------
주: N= 216; Log likelihood= -9539.385

. sem_gof_table
Collections in memory
Current: gof
-----------------
 Name   No. items
-----------------
  gof   18       
table   738      
-----------------

Goodness of Fit statistic
----------------------------------------------------
                                            |  value
--------------------------------------------+-------
LR test of model vs. saturated: chi2(34)    | 88.879
Prob > chi2                                 |  0.000
--------------------------------------------+-------
RMSE of approximation                       |  0.087
Lower bound of 90% CI for RMSEA             |  0.065
Upper bound of 90% CI for RMSEA             |  0.109
p-value for test of close fit: RMSEA < 0.05 |  0.004
--------------------------------------------+-------
Comparative fit index                       |  0.977
Tucker-Lewis fit index                      |  0.970
----------------------------------------------------
```



