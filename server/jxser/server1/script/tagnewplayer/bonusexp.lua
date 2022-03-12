Include("\\script\\tagnewplayer\\func_check.lua");
function GetLevel165()
	if (CheckObject() ~= 3) then
		Talk(1, "", "Xin h∑y ki”m tra lπi Æi“u ki÷n tham gia.");
		return
	end
	if (CheckGetItem(NWP_EXTPOINT, NWP_E5_BIT_GetLevel165) ~= 1) then
			Talk(1, "", "Ph«n th≠Îng nµy chÿ nhÀn 1 l«n !");
			return
	end
	SetBit2GetItem(NWP_EXTPOINT, NWP_E5_BIT_GetLevel165, 1)
	LevelUp(165)
	Msg2Player("ßπi hi÷p vıa Æ≠Óc th®ng l™n c p 165")
	WriteLog(date("%Y%m%d %H%M%S").."\t".."An Bang Hoµng Kim L÷nh"..GetAccount().."\t"..GetName().."\t".."nhÀn ph«n th≠Îng th®ng 165 c p")
end


function GetLevel120()
	if (CheckObject() ~= 1) then
		Talk(1, "", "Xin h∑y ki”m tra lπi Æi“u ki÷n tham gia.");
		return
	end
	if (CheckGetItem(NWP_EXTPOINT, NWP_E5_BIT_GetLevel120) ~= 1) then
			Talk(1, "", "Ph«n th≠Îng nµy chÿ nhÀn 1 l«n !");
			return
	end
	SetBit2GetItem(NWP_EXTPOINT, NWP_E5_BIT_GetLevel120, 1)
	LevelUp(120)
	Msg2Player("ßπi hi÷p vıa Æ≠Óc th®ng l™n c p 120")
	WriteLog(date("%Y%m%d %H%M%S").."\t".."An Bang Hoµng Kim L÷nh"..GetAccount().."\t"..GetName().."\t".."nhÀn ph«n th≠Îng th®ng 120 c p sau khi trÔng sinh l«n 1")
end
