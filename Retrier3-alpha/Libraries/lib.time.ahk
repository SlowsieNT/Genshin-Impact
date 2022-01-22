; ahk sucks, here's the polyfill for: get unix timestamp 
gettime(aYear=1970, aMonth=1, aDay=1, aHour=0, aMinute=0, aSeconds=0, aMilli=0) {
	; this is correct way to calculate timestamp, noobs
	vDaysToMonth := [0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334, 365]
	vYears := aYear - 1970
	; this is the way, noobs only divide by 4, not all x/4 are leap
	vLeaps := ceil(vYears/4 + vYears/400 - vYears/100)
	vYearsToTime := (vYears - vLeaps) * 31536000 + vLeaps * 31622400
	vMonthsToTime := vDaysToMonth[aMonth] * 86400
	vDaysToTime := aDay * 86400
	vHoursToTime := aHour * 3600
	vMinutesToTime := aMinute * 60
	; add all numbers together
	vTime := vYearsToTime+vMonthsToTime+vDaysToTime+vHoursToTime+vMinutesToTime+aSeconds+aMilli/1000
	; do -86400 for lulz' sake
	return round(vTime - 86400, 3)
}
utcnow() {
	return gettime(0 + A_YYYY, 0 + A_MM, 0 + A_DD, 0 + A_Hour, 0 + A_Min, 0 + A_Sec, 0 + A_MSec)
}
