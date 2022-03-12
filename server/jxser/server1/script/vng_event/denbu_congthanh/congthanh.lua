Include("\\script\\vng_lib\\extpoint.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\missions\\citywar_global\\infocenter_head.lua")
Include("\\script\\vng_event\\denbu_congthanh\\head.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")

function tbDenbuCT2011:ShowDialog()
	if (tbDenbuCT2011:IsActive() ~= 1) then
		Talk(1,"","Ho¹t ®éng ®· kÕt thóc!")
		return
	end
	
	local strTittle = "PhÇn th­ëng §Òn bï C«ng thµnh, nÕu §¹i HiÖp kh«ng gia nhËp Bang Héi sÏ kh«ng nhËn ®­îc <color=red>PhÇn th­ëng Khiªu ChiÕn LÖnh <color>"
	Describe(strTittle, 2, "Ta muèn nhËn/#tbDenbuCT2011:GetAward()", "§ãng/OnCancel")
end

function tbDenbuCT2011:GetAward()
	if not self.tbListaward[GetAccount()] then	
		Talk(1, "", "§¹i HiÖp kh«ng cã trong danh s¸ch nhËn th­ëng lÇn nµy")	
		return
	end
	
	if (tbExtPointLib:GetBitValue(self.nExtpoint_Is_DBCT, self.nBit_Is_DBCT) == 1) then
		Talk(1, "", "Ch¼ng ph¶i ®¹i hiÖp ®·  nhËn th­ëng råi sao?")
		return
	end
	
	if (tbExtPointLib:SetBitValue(self.nExtpoint_Is_DBCT, self.nBit_Is_DBCT, 1) ~= 1)then
		return
	end
	
	local tbPlayerAward = self.tbListaward[GetAccount()]
	tbAwardTemplet:Give(tbPlayerAward, 1, {"DenbuCT2011","NhanDenbuCongThanh"});
	
	if(self:CheckBangHoi() == 1) then
		local szTongName, nTongID = GetTongName();
		checkCreatLG(szTongName);
		checkJoinLG(szTongName);
		local nCurCount = LG_GetMemberTask(TIAOZHANLING_LGTYPE,TIAOZHANLING_LGName,szTongName,LGTSK_TIAOZHANLING_COUNT)
		LG_ApplyAppendMemberTask(TIAOZHANLING_LGTYPE,TIAOZHANLING_LGName, szTongName, LGTSK_TIAOZHANLING_COUNT, 2000, "", "");
		Msg2Player("§¹i hiÖp nép thµnh c«ng 2000 Khiªu ChiÕn LÖnh cho Bang Héi !")
		WriteLog(date("%Y%m%d %H%M%S").."\t".."DenbuCT2011"..GetAccount().."\t"..GetName().."\t".."Nép thµnh c«ng 2000 KCL cho Bang Héi")
	end
	Msg2Player("Chóc mõng §¹i HiÖp nhËn thµnh c«ng phÇn th­ëng ®Òn bï C«ng Thµnh.");
end

function tbDenbuCT2011:IsActive()
	local now = tonumber(date("%Y%m%d"));
	if (now < tbDenbuCT2011.nEndDate) then
		return 1;
	end
	return 0;
end

--KiÓm tra Bang Héi
function tbDenbuCT2011:CheckBangHoi()
	local TongName,TongID = GetTongName();
	if TongName == "" or TongName == nil then
		return 0;
	else
		return 1;
	end
end

function OnCancel()
end

local pEventType = EventSys:GetType("AddNpcOption")

if (tbDenbuCT2011:IsActive() ~= 0) then
	nId = pEventType:Reg("LÔ Quan", "NhËn ®Òn bï C«ng Thµnh", tbDenbuCT2011.ShowDialog,{tbDenbuCT2011})
end	
