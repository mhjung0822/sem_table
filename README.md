
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

위 환경에서는 /Users/~~~/Documents/Stata/ado/personal/)


## 3) Stata 재시작

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

###주의사항
sem_etable 실행시 수행한 sem 모형이 재 수행되므로 post-estimation 등이
적용되지 않을 수 있음.

## 3.2. sem_gof_table

### syntax
. sem_gof_table [, replace table(string)

sem 명령어 실행후 gof table 생성. 실행시 "gof" collection 생성

###options
replace : "gof" collection이 있을 경우 replace
table(string) : "string"으로 collection table 명 설정
