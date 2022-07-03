#!/bin/bash

echo "---------------------------------"

work_time1=`date +%Y"-"%m"-"%d" "%H":"%M":"%S`
work_time2=`date +%Y"-"%m"-"%d" "%H":"%M`
now_date=`date +%Y"-"%m"-"%d`
echo "현재 시각1 (년월일 시분초) : ${work_time1}"
echo "현재 시각2 (년월일 시분) : ${work_time2}"
echo "현재 날짜 (년월일) : ${now_date}"
echo "---------------------------------"

work_date00m=`date --date="+00 minutes" +%H":"%M`
work_date10m=`date --date="+10 minutes" +%H":"%M`
work_date30m=`date --date="+30 minutes" +%H":"%M`
echo "현재 시각 (시분) : ${work_date00m}"
echo "10분뒤 (시분) : ${work_date10m}"
echo "30분뒤 (시분) : ${work_date30m}"
echo "---------------------------------"

work_ago_10m=`date --date="-10 minutes" +%Y"-"%m"-"%d" "%H":"%M`
work_ago_30m=`date --date="-30 minutes" +%Y"-"%m"-"%d" "%H":"%M`
echo "10분전 (년월일 시분) : ${work_ago_10m}"
echo "30분전 (년월일 시분) : ${work_ago_30m}"
echo "---------------------------------"

date_now=`date +%Y"-"%m"-"%d`
date_later_1d=`date --date="1 days" +%Y"-"%m"-"%d`
date_later_1m=`date --date="1 months" +%Y"-"%m"-"%d`
date_later_1m1d=`date --date="1 months 1 day" +%Y"-"%m"-"%d`
echo "오늘 날짜 (년월일) : ${date_now}"
echo "1일 뒤 날짜. 내일 날짜 (년월일) : ${date_later_1d}"
echo "1개월 뒤 날짜. 한달 뒤 날짜 (년월일) : ${date_later_1m}"
echo "1개월 1일 뒤 날짜. (년월일) : ${date_later_1m1d}"
echo "---------------------------------"

date_ago_1d=`date --date="-1 days" +%Y"-"%m"-"%d`
date_ago_1m=`date --date="-1 months" +%Y"-"%m"-"%d`
date_ago_1m1d=`date --date="-1 months -1 day" +%Y"-"%m"-"%d`
echo "하루 전 날짜. 어제 날짜 (년월일) : ${date_ago_1d}"
echo "1개월 전 날짜. (년월일) : ${date_ago_1m}"
echo "1개월 1일 전 날짜. (년월일) : ${date_ago_1m1d}"
echo "---------------------------------"


date --date='1970-01-01 00:01:00 +0000' +%s
date --date='1970-01-01 00:01:00' +%s
date -d @1511020948 +"%F %T %z"

