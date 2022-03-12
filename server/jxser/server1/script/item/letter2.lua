--°ü¸¤ÄÚµÄĞÅ¼ş£¨ĞÂÈÎÎñÏµÍ³ÁúÎåµÄ°ü¸¤£©Ğ°ÅÉ
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
	if ( Uworld189 == 20 )  then
		Describe("<link=image:\\spr\\item\\questkey\\taskobj091.spr>Th­ cña Long Ngò<link><enter>"..name..", h·y ®Õn Chu Tiªn TrÊn t×m V©n Nhi! SÏ cã nhiÖm vô cho ng­¬i! Hµnh sù nªn thËn träng! Long ngò!",1,"NhËn hµm th­ /no")
		nt_setTask(189,30)
		if ( Uworld1003 < 10 ) then 
			nt_setTask(1003,10) --Ğ°ÅÉÈÎÎñ¿ªÊ¼
		end
	end
	return 0
end
	
