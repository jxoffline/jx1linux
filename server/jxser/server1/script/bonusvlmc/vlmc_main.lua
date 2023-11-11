Include("\\script\\bonusvlmc\\func_check.lua");

function AcceptEXPBonusTK()
	SetGlbValue(GlbVar1, 1)
	SetTask(TSK_Active_TK, 1)
	AddGlobalNews("Vâ L©m Minh Chñ <color=yellow> "..VLMC_Name.." <color> kªu gäi c¸c anh hïng hµo kiÖt trong thiªn h¹ h·y ®øng lªn hîp søc chèng giÆc ngo¹i bang. Nh÷ng ai cã tinh thÇn yªu n­íc h·y nhanh chèng ®Õn t­îng ®µi b¸o danh ®Ó ®­îc nhËn phÇn th­ëng nh©n ®«i ®iÓm kinh nghiÖm khi  tham gia chiÕn tr­êng !")
	Msg2Player("Vâ L©m Minh Chñ <color=yellow> "..VLMC_Name.." <color> bang th­ëng nh©n ®«i ®iÓm kinh nghiÖm khi tham gia chiÕn tr­êng !")
	WriteLog(date("%Y%m%d %H%M%S").."\t".."VLMC"..GetAccount().."\t"..GetName().."\t".."VLMC kİch ho¹t nh©n ®«i EXP Tèng Kim")
end

function AcceptActiveX2EXP()
	SetGlbValue(GlbVar2, 1)
	SetTask(TSK_Active_x2EXP, 1)
	AddGlobalNews("Vâ L©m Minh Chñ <color=yellow> "..VLMC_Name.." <color> bang th­ëng nh©n ®«i ®iÓm kinh nghiÖm khi ®¸nh qu¸i, Mêi tÊt c¶ c¸c anh hïng hµo kiÖt h·y mau nhanh chèng ®Õn t­îng ®µi b¸o danh nhËn th­ëng")
	Msg2Player("Vâ L©m Minh Chñ <color=yellow> "..VLMC_Name.." <color> bang th­ëng nh©n ®«i ®iÓm kinh nghiÖm khi ®¸nh qu¸i")
	WriteLog(date("%Y%m%d %H%M%S").."\t".."VLMC"..GetAccount().."\t"..GetName().."\t".."VLMC kİch ho¹t ®¸nh qu¸i nhËn nh©n ®«i ®iÓm kinh nghiÖm")
end

function GetEXPBonus()
	SetTask(TSK_GetBonusEXP, 1)
	AddSkillState(451, 20, 1, 18*60*180);
	Say("Chóc mõng ®¹i hiÖp nhËn ®­îc hiÖu qu¶ Nh©n ®«i kinh nghiÖm!");
	Msg2Player("B¹n nhËn ®­îc hiÖu qu¶ nh©n ®«i kinh nghiÖm trong vßng 60 phót.");
	WriteLog(date("%Y%m%d %H%M%S").."\t".."VLMC"..GetAccount().."\t"..GetName().."\t".."nhËn nh©n ®«i ®iÓm kinh nghiÖm")
end

function Get2xExpTK()
	local nDate = tonumber(GetLocalDate("%y%m%d"))
	SetTask(TSK_Get2ExpTK, nDate)
	Say("Chóc mõng ®¹i hiÖp nhËn ®­îc nh©n ®«i kinh nghiÖm trong chiÕn tr­êng Tèng Kim!");
	Msg2Player("B¹n nhËn ®­îc hiÖu qu¶ nh©n ®«i kinh nghiÖm trong chiÕn tr­êng Tèng Kim trËn 21h00");
	WriteLog(date("%Y%m%d %H%M%S").."\t".."VLMC"..GetAccount().."\t"..GetName().."\t".."nhËn nh©n ®«i ®iÓm kinh nghiÖm Tèng Kim 21h00")
end

function ResetGlbValue()
	SetGlbValue(1252,0)
	SetGlbValue(1253,0)
end