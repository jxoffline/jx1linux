--Ω£Õ¯»˝÷‹ƒÍªÓ∂Ø
--∂π…≥ ŸÃ“
-- π”√∫ÛªÒµ√300wæ≠—È
--◊Ó∂‡ø…ªÒµ√1“⁄
--œﬁ 80º∂º∞“‘…œ ≤¢ ≥Â÷µÕÊº“ π”√

Include("\\script\\event\\jxanniversary3\\head.lua");

function main(nItemIndex)
	str=
	{	"<#>°n mÈt tr∏i Æµo vπn th‰, c„ th” nhÀn Æ≠Óc <color=red>"..tostring(JXANNIVERSARY3_ONCEEXP).."<color> Æi”m kinh nghi÷m, Æi”m kinh nghi÷m tËi Æa Æπt Æ≠Óc lµ <color=red>"..tostring(JXANNIVERSARY3_MAXOWNEXP).."<color>.",
		"<#>Sˆ dÙng ßµo vπn th‰/#_UseDoushaShoutao("..nItemIndex..")",
		"<#> ß” ta suy ngh‹ lπi!/OnCancel",
	};
	Say(str[1], 2, str[2], str[3]);
	return 1;
end

function _UseDoushaShoutao(nItemIndex)
	if (JxAn_cloud_join() ~= 1) then
		return 
	end;
	
	if (GetTask(TASKID_DOUSHASHOUTAO_EXP) >= JXANNIVERSARY3_MAXOWNEXP) then 
		Msg2Player("Bπn Æ∑ ®n qu∏ nhi“u ßµo vπn th‰, kh´ng th” ti’p tÙc ®n Æ” t®ng kinh nghi÷m.");
		return
	end 
	
	if (RemoveItemByIndex(nItemIndex) == 1 ) then
		local nAddExp = 0;
		if ( (GetTask(TASKID_DOUSHASHOUTAO_EXP) + JXANNIVERSARY3_ONCEEXP) > JXANNIVERSARY3_MAXOWNEXP) then
			nAddExp = JXANNIVERSARY3_MAXOWNEXP - GetTask(TASKID_DOUSHASHOUTAO_EXP);
		else
			nAddExp = JXANNIVERSARY3_ONCEEXP;
		end
		
		--‘ˆº”æ≠—È
		SetTask(TASKID_DOUSHASHOUTAO_EXP, GetTask(TASKID_DOUSHASHOUTAO_EXP) + nAddExp);
		AddOwnExp(nAddExp);
		Msg2Player("°n mÈt tr∏i Æµo vπn th‰, nhÀn Æ≠Óc "..JXANNIVERSARY3_ONCEEXP.."kinh nghi÷m ");
	else
		Msg2Player("Kh´ng c„ ßµo vπn th‰ nµo!");
	end
end

function OnCancel()
	return 0;
end

