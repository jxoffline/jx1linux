IL("SETTING")
IL("LEAGUE")
Include("\\script\\lib\\gb_modulefuncs.lua")

TSK_VALENTINE = 1553
function main()
if (gb_GetModule("LÔ vËt t×nh nh©n") == 1) then
	if (GetSex() == 1) then
		if (GetTask(TSK_VALENTINE) >= 99) then
				Say("<#> B¹n ®· sö dông <color=yellow>99 ®ãa hoa hång t×nh ı<color>, lµm ®å trang søc dÔ bŞ ®è kş l¾m ®ã!", 0)
				return 1
		end
		AddOwnExp(1000000)
		AddSkillState(440, 20, 1,32400)--30·ÖÖÓÄÚ»ñµÃË«±¶¾­ÑéÊ±¼ä¡£
		AddSkillState(450, 20, 1,32400)--ĞÒÔËÖµ30·ÖÖÓÄÚÔö¼Ó20µã¡£
		SetTask(TSK_VALENTINE, GetTask(TSK_VALENTINE) + 1)
		if (GetTask(TSK_VALENTINE) == 99) then
			Msg2Player("<#> B¹n sö dông mét ®ãa hoa hång t×nh ı nhËn ®­îc 100 v¹n ®iÓm kinh nghiÖm, t¨ng ®«i kinh nghiÖm + 20 ®iÓm may m¾n trong nöa giê ")
		else
			Msg2Player("<#> B¹n ®· sö dông mét ®ãa hoa hång t×nh ı nhËn ®­îc 100 v¹n ®iÓm kinh nghiÖm, ®ång thêi néi trong nöa giê t¨ng ®«i ®iÓm kinh nghiÖm + 20 ®iÓm may m¾n. B¹n cßn cã thÓ sö dông"..(99 - GetTask(TSK_VALENTINE)).."®ãa hoa hång t×nh ı.")
		end
		return
	else
		Msg2Player("<#> ChØ cã ph¸i n÷ míi sö dông ®­îc hoa hång t×nh ı th«i!")
		return 1
	end
end
end