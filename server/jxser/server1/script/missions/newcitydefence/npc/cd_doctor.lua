function main()
	Say("Qu©n nhu quan thñ thµnh: Chç ta cã nhiÒu lo¹i d­îc phÈm quı, nh÷ng vËt phÈm sö dông chiÕn tr­êng. Ng­¬i cã thÓ sö dông <color=yellow>®iÓm th­ëng Tèng Kim<color> ®Õn chç ta mua <color=yellow>vËt phÈm Tèng Kim<color>, nh­ng <color=red>Binh sÜ hiÖu gi¸c vµ bå c©u<color> chØ ®­îc sö dông trong ChiÕn tr­êng Tèng Kim, muèn mua thø g×?", 3, "Mua d­îc phÈm/salemedicine", "Mua VËt phÈm Tèng Kim/sj_shop_sell", "Hñy bá /OnCancel")
end

function salemedicine()
	Sale(131, 1)
end

function sj_shop_sell()
	Sale(98, 4);			
end;

function OnCancel()
end
