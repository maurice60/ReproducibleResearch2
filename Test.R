cas <- sqldf('select EVTYPE, fatalities, injuries, casualties
                from byType
                where casualties > 0
                order by casualties')

head(cas, 10)
barplot(as.matrix(rbind(cas$fatalities, cas$injuries)), horiz=TRUE, names.arg=cas$EVTYPE)