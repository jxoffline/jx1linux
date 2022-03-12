IL("SETTING")
IL("LEAGUE")
Include("\\script\\lib\\gb_modulefuncs.lua")

TSK_VALENTINE = 1553
function main(nItemIdx)
if (gb_GetModule("LÔ vËt t×nh nh©n") == 1) then
	if (GetSex() == 0) then
		if (GetTask(TSK_VALENTINE) >= 99) then
			Say("<#> B¹n ®· ¨n <color=yellow>99 miÕng S« c« la t×nh yªu<color>, tiÕp tôc ¨n coi chõng s©u r¨ng ®Êy!", 0)
			return 1
		end
		AddOwnExp(1000000)
		AddSkillState(440, 20, 1,32400)--30·ÖÖÓÄÚ»ñµÃË«±¶¾­ÑéÊ±¼ä¡£
		AddSkillState(450, 20, 1,32400)--ĞÒÔËÖµ30·ÖÖÓÄÚÔö¼Ó20µã¡£
		SetTask(TSK_VALENTINE, GetTask(TSK_VALENTINE) + 1)
		if (GetTask(TSK_VALENTINE) == 99) then
			Msg2Player("<#> B¹n sö dông mét ®ãa hoa hång t×nh ı nhËn ®­îc 100 v¹n ®iÓm kinh nghiÖm, t¨ng ®«i kinh nghiÖm + 20 ®iÓm may m¾n trong nöa giê ")
		else
			Msg2Player("<#> B¹n ¨n mét miÕng S« c« la t×nh yªu nhËn ®­îc 100 v¹n ®iÓm kinh nghiÖm, kinh nghiÖm t¨ng ®«i + 20 ®iÓm may m¾n trong nöa tiÕng. B¹n cßn cã thÓ sö dông"..(99 - GetTask(TSK_VALENTINE)).."miÕng S« c« la t×nh yªu.")
		end
		return
	else
		Msg2Player("<#> ChØ cã tr¸ng sÜ míi ®­îc ¨n S« c« la t×nh yªu th«i!")
		return 1
	end
end
end