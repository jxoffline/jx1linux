Include("\\script\\lib\\basic.lua")

IP_EXTPOINT = 4 								-- Ext used for IP Bonus
IP_BIT = 1 											-- Bit check
IP_Name = "Nh©n ®«i kinh nghiÖm"		-- Event Name
IP_SWITCH = 0 									-- Open or close event


function IpBonus()
do return end
	local nPromotionSay =
	{		
		"T¹i h¹ muèn biÕt m×nh ®ñ ®iÒu kiÖn nhËn th­ëng kh«ng?/getInfo",
	}	
	
	local nDay = tonumber(date("%w"))
	
	if nDay == 6 or nDay == 0 then
		tinsert(nPromotionSay,"NhËn phÇn th­ëng/getBonus")
	end	
	
	tinsert(nPromotionSay,"T¹i h¹ chØ ghÐ qua th«i!/OnCancel")
	
	Say("Nhµ ®iÒu hµnh sÏ göi tÆng nhiÒu phÇn quµ cho nh÷ng ng­êi ch¬i ë nh÷ng phßng m¸y hoÆc c¸ nh©n cã nhiÒu ®ãng gãp. Néi dung cña ho¹t ®éng trong giai ®o¹n nµy lµ <color=red>"..IP_Name.."<color>.",getn(nPromotionSay),nPromotionSay)
end;

function IsIPBonus()
	return IP_SWITCH
end

function CheckIPBonus()
	local nExtValue = GetExtPoint(IP_EXTPOINT)	
	if (GetBit(nExtValue,IP_BIT) == 1) then
		return 1
	else
		return 0
	end
end

function getBonus()
	if  (IsIPBonus() == 1) then		
		if (CheckIPBonus() == 1) then			
			AddIPAward();
		else
			Say("ThËt tiÕc, IP cña ng­¬i kh«ng thuéc trong danh s¸ch nhËn th­ëng. H·y quay l¹i sau nhÐ!",1,"ThËt ng¹i qu¸!/OnCancel")
			return
		end;	
	end;
end;

function getInfo()
	if (CheckIPBonus() == 1) then
		Say("Cung hû! IP cña ng­¬i ®ang cã trong danh s¸ch nhËn th­ëng. H·y cè g¾ng h¬n!",1,"Xin ®a t¹/OnCancel")
		return
	else
		Say("ThËt tiÕc, IP cña ng­¬i kh«ng thuéc trong danh s¸ch nhËn th­ëng. H·y quay l¹i sau nhÐ!",1,"ThËt ng¹i qu¸!/OnCancel")
		return
	end;
end;

function AddIPAward()
	if GetSkillState(451) > 0 then
		Say("Ch¼ng ph¶i ng­¬i ®· nhËn th­ëng råi sao?" ,1,"ThËt ng¹i qu¸!/OnCancel")
		return
	end	
	
	Say("TÆng ng­¬i 1 mãn quµ nhá thay cho lêi tri ©n! Mãn quµ lÇn nµy lµ <color=red>"..IP_Name.."<color>.",1,"Xin ®a t¹/OnCancel")
	AddSkillState(451, 20, 1, 18*60*60*24);
	Msg2Player("Chóc mõng b¹n nhËn ®­îc phÇn th­ëng "..IP_Name);	
	WriteLog(format("[IPBonus]\t%s\t%s\t%s\t%s",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),IP_Name))
end;

function OnCancel()
end;
