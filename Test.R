eco <- sqldf('select EVTYPE, property, crops, damage
                from byType
                where damage > 0
             order by damage desc')

topTypeEco <- eco[1:10,]

ecoPlt <- sqldf('select EVTYPE evtype, damage, "Total" rtype
      from topTypeEco')

ecoPlt <- rbind(ecoPlt, sqldf('select EVTYPE evtype, property damage, "Property Damage" rtype
      from topTypeEco'))

ecoPlt <- rbind(ecoPlt, sqldf('select EVTYPE evtype, crops damage, "Crop Damage" rtype
      from topTypeEco'))

plt <- ggplot(data=ecoPlt, aes(x=evtype, y=damage, fill=factor(rtype))) + 
    geom_bar(position="dodge", stat="identity") + coord_flip() +
    scale_x_discrete(limits=rev(topTypeEco$EVTYPE)) +
    theme(legend.title=element_blank(), legend.position=c(.75,.7))
print(plt)


