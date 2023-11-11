--°ü¸¤ÄÚµÄĞÅ¼ş£¨ĞÂÈÎÎñÏµÍ³ÁúÎåµÄ°ü¸¤£©ÖĞÁ¢
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
	if ( Uworld186 == 20 )  then
		Describe("<link=image:\\spr\\item\\questkey\\taskobj090.spr>Th¬ Long Ngò<link><enter>Long Ngò: "..name..", ng­¬i tuy míi ra giang hå nh×n ®· thÓ hiÖn b¶n lÜnh h¬n ng­êi! HiÖn giê cã mét tæ chøc s¸t thñ lín m¹nh tªn lµ L©m Uyªn Nhai ®ang ¶nh h­ëng rÊt nguy h¹i ®Õn Vâ l©m! Ng­¬i mang th­ nµy ®Õn BiÖn Kinh ®­a cho Phã Nam B¨ng, h¾n sÏ tù biÕt s¾p xÕp! Long Ngò.",1,"NhËn hµm th­ /no")
		nt_setTask(186,30)
		if ( Uworld1002 < 10 ) then
			nt_setTask(1002,10) --ÖĞÁ¢ÈÎÎñ¿ªÊ¼
		end
	end
	return 0
end
	
