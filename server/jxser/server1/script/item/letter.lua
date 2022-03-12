--°ü¸¤ÄÚµÄĞÅ¼ş£¨ĞÂÈÎÎñÏµÍ³ÁúÎåµÄ°ü¸¤£©ÕıÅÉ
--by xiaoyang(2004\12\25)

Include("\\script\\task\\newtask\\newtask_head.lua")

function main(sel)
local curCamp = nt_getCamp()
	Uworld1001 = nt_getTask(1001)  --ÕıÅÉ
	Uworld1002 = nt_getTask(1002)
	Uworld1003 = nt_getTask(1003)
	Uworld183 = nt_getTask(183)
	Uworld186 = nt_getTask(186)
	Uworld189 = nt_getTask(189)
	local name = GetName()
	if ( Uworld183 == 20 )  then
		Describe("<link=image:\\spr\\item\\questkey\\taskobj075.spr>Th¬ Long Ngò<link><enter>Long Ngò: "..name..", hiÖn cã mét tæ chøc tªn lµ TÇm Long héi thùc lùc to lín ®ang tô häp trong c¸c thµnh thŞ. Ng­¬i h·y t×m c¸ch gia nhËp tæ chøc nµy, rÊt tèt cho t­¬ng lai cña ng­¬i! H·y ®i §¹i Lı t×m M¹c SÇu, c« ta sÏ giao cô thÓ cho ng­¬i. Nh­ng kh«ng ®­îc nh¾c tíi ta! Nguyªn nh©n sau nµy ng­¬i sÏ biÕt! Long Ngò.",1,"NhËn hµm th­ /no")
		nt_setTask(183,30)
		if ( Uworld1001 < 10 ) then
	  		nt_setTask(1001,10) --ÕıÅÉÈÎÎñ¿ªÊ¼
	  	end
	end
	return 0
end
	
