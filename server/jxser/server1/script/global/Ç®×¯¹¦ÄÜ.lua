-- Ç®×¯¹¦ÄÜ.lua		Âôºì°üµÄ±ê×¼ÎÄ¼ş
-- By Dan_Deng(2003-12-31)
-- Update: Dan_Deng(2004-01-06) ½«ÒøÆ±¹¦ÄÜÒÆ³öµ½ÁÙ°²Ç®×¯¶ÀÓĞ

function main_proc()
	if (GetSex() == 0) then
		Say("§óng råi! ThiÕu hiÖp cÇn g×?",2,"ë ®©y cã bao l× x× kh«ng? /buy_sele","Nh©n tiÖn ghĞ qua th«i/no")
	else
		Say("§óng råi! N÷ hiÖp cÇn g×?",2,"ë ®©y cã bao l× x× kh«ng? /buy_sele","Nh©n tiÖn ghĞ qua th«i/no")
	end
end
------------ Âòºì°ü ---------------------
function buy_sele()
	--Say("Ç®×¯ÀÏ°å£ºÎÒÕâÀïµÄºì°ü¸»ÀöÓ·ÈÙ£¬ÀñÖØÇé¸üÖØ£¬×îÊÇËÍÀñÉÏÆ·£¬Ğ¡ºì°ü10000Á½£¬´óºì°ü100000Á½£¬ÒÔ¼°<color=green>ÈçÒâºì°üºÍºØËêºì°ü¡£\nÈçÒâºì°ü<color>ÊÇÓÉ¿ÍÙÄÄú×Ô¼º¾ö¶¨°ü¶àÉÙÇ®µÄºì°ü¡£\n<color=green>ºØËêºì°ü<color>ÊÇ¿ÉÒÔ°ü<color=yellow>Í­Ç®<color>µÄºì°ü£¬µ±È»ºì°üÖĞÍ­Ç®ÊıÁ¿»¹ÊÇÓÉÄú¶¨¡£",5,"Òª¸öĞ¡ºì°ü°É/buy1","À´¸ö´óºì°ü/buy2","ÒªÈçÒâºì°ü/ruyi_hongbao","ÒªºØËêºì°ü/hesui_hongbao","²»ÒªÁË/no")
	Say("TiÓu Hång bao 10000 l­îng, §¹i Hång Bao 100000 l­îng. Kh¸ch quan muèn lo¹i nµo?",3,"Muèn 1 bao l× x× nhá. /buy1","Muèn 1 bao l× x× lín. /buy2","Kh«ng cÇn ®©u. /no")
end

function buy1()
	if (GetCash() >= 10000) then
		Pay(10000)
		AddItem(6,1,14,1,0,0,0)
		Talk(1,"","TiÓu Hång Bao 1 c¸i!  Xin nhËn lÊy! ")
	else
		Talk(1,"","Kh¸ch quan h×nh nh­ ch­a ®ñ tiÒn.")
	end
end

function buy2()
	if (GetCash() >= 100000) then
		Pay(100000)
		AddItem(6,1,13,1,0,0,0)
		Talk(1,"","§¹i Hång Bao 1 c¸i!  Xin nhËn lÊy! ")
	else
		Talk(1,"","Kh¸ch quan h×nh nh­ ch­a ®ñ tiÒn.")
	end
end

function no()
end

function hesui_hongbao()	--×Ô¶¨ÒåÍ­Ç®
	AskClientForNumber("Package_Hesui", 1, 100, "Xin nhËp vµo sè l­îng TiÒn ®ång:");
end
function Package_Hesui(nMoney)
	if (CalcEquiproomItemCount(4, 417, 1, 1) < nMoney) then
		Talk(1,"","Kh¸ch quan kh«ng ®ñ "..nMoney.." tiÒn §ång")
	else
		ConsumeEquiproomItem(nMoney, 4, 417, 1, -1)
		local nItem = AddItem(6,1,1052,1,0,0,0)
		SetSpecItemParam(nItem, 1, nMoney)
		SyncItem(nItem)
		Talk(1,"","Mêi kh¸ch quan nhËn1 bao mõng thä!")
	end
end


function ruyi_hongbao()		--×Ô¶¨Òå½ğÇ®
	AskClientForNumber("Package_Ruyi", 1, 10000000, "Xin nhËp sè tiÒn vµo bao l× x×:");
end
function Package_Ruyi(nMoney)
	if (GetCash() < nMoney) then
		Talk(1,"","Kh¸ch quan b¹n h×nh nh­ kh«ng ®ñ"..nMoney.." l­îng.")
	else
		Pay(nMoney)
		local nItem = AddItem(6,1,1051,1,0,0,0)
		SetSpecItemParam(nItem, 1, nMoney)
		local nM1 = floor(nMoney / 1000000)
		local nM2 = floor(mod(nMoney, 1000000) / 1000)
		local nM3 = mod(nMoney, 1000)
		SetSpecItemParam(nItem, 2, nM1)
		SetSpecItemParam(nItem, 3, nM2)
		SetSpecItemParam(nItem, 4, nM3)
		SyncItem(nItem)
		Talk(1,"","Mêi nhËn bao l× x× Nh­ ı!")
	end
end