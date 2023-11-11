--½£ÍøÈıÖÜÄê»î¶¯
--ÔæÄàÊÙÌÒ
--Ê¹ÓÃºó»ñµÃ8Ğ¡Ê±´ò¹Ö¾­ÑéË«±¶£¬²»¿ÉÓëÏÉ²İÂ¶µş¼Ó
--ÏŞ 80¼¶¼°ÒÔÉÏ ²¢ ³åÖµÍæ¼ÒÊ¹ÓÃ

Include("\\script\\event\\jxanniversary3\\head.lua");

function main(nItemIndex)
	str=
	{	"<#>Sö dông §µo v¹n thä, nhËn ®­îc <color=red>8<color> giê nh©n ®«i kinh nghiÖm, nh­ng kh«ng thÓ cïng sö dông víi Tiªn Th¶o Lé.",
		"<#>Sö dông §µo v¹n thä/#_UseZaoNiShoutao("..nItemIndex..")",
		"<#> §Ó ta suy nghÜ l¹i!/OnCancel",
	};
	Say(str[1], 2, str[2], str[3]);
	return 1;
end

function _UseZaoNiShoutao(nItemIndex)
	if (JxAn_cloud_join() ~= 1) then
		return 
	end;
	
	if RemoveItemByIndex(nItemIndex) == 1 then
		AddSkillState(440, 1, 1, 64800 * 8);
		Msg2Player("Sö dông §µo v¹n thä, cã thÓ nh©n ®«i kinh nghiÖm trong 8 giê.")
	end;
end;

function OnCancel()
end;