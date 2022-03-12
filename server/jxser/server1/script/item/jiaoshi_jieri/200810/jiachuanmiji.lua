--º“¥´√ÿºÆ
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\event\\jiaoshi_jieri\\200810\\lib\\lib.lua")
Include("\\script\\event\\jiaoshi_jieri\\200810\\taskctrl.lua")
Include("\\script\\lib\\pay.lua")
local tbAwardList = 
{
	[1] = {nExp = 1000000},
	[2] =
	{
		{szName="An Bang B®ng Tinh Thπch Hπng Li™n", nQuality=1, nRate=0.002, tbProp={0, 164}},
		{szName="An Bang K™ Huy’t Thπch GiÌi Chÿ ", nQuality=1, nRate=0.005, tbProp={0, 167}},
		{szName="An Bang CÛc Hoa Thπch Chÿ hoµn", nQuality=1, nRate=0.005, tbProp={0, 165}},
		{szName="An Bang ßi“n Hoµng Thπch Ng‰c BÈi", nQuality=1, nRate=0.01, tbProp={0, 166}},
		{szName="ßﬁnh QuËc § Sa Ph∏t Qu∏n", nQuality=1, nRate=0.005, tbProp={0, 160}},
		{szName="ßﬁnh QuËc Thanh Sa Tr≠Íng Sam", nQuality=1, nRate=0.008, tbProp={0, 159}},
		{szName="ßﬁnh QuËc Ng©n Tµm Y™u Æ∏i", nQuality=1, nRate=0.2, tbProp={0, 163}},
		{szName="ßﬁnh QuËc X›ch Quy™n Nhuy‘n Ngoa", nQuality=1, nRate=0.05, tbProp={0, 161}},
		{szName="ßﬁnh QuËc Tˆ ßªng HÈ uy”n", nQuality=1, nRate=0.2, tbProp={0, 162}},
		{szName="Nhu T◊nh C©n QuËc Ngh™ Th≠Íng", nQuality=1, nRate=0.002, tbProp={0, 190}},
		{szName="Nhu T◊nh  Tu÷ T©m Ng‰c BÈi", nQuality=1, nRate=0.01, tbProp={0, 193}},
		{szName="Nhu T◊nh  PhÙng Nghi GiÌi Chÿ ", nQuality=1, nRate=0.2, tbProp={0, 192}},
		{szName="Nhu T◊nh ThÙc N˜ Hπng Li™n", nQuality=1, nRate=0.15, tbProp={0, 191}},
		{szName="Hi÷p CËt T◊nh ˝ K’t", nQuality=1, nRate=0.01, tbProp={0, 189}},
		{szName="Hi÷p CËt Thi’t Huy’t Sam", nQuality=1, nRate=0.1, tbProp={0, 186}},
		{szName="Hi÷p CËt ßan T©m GiÌi", nQuality=1, nRate=0.1, tbProp={0, 188}},
		{szName="Hi÷p CËt ßa T◊nh Hoµn", nQuality=1, nRate=0.5, tbProp={0, 187}},
		{szName="Huy“n tinh kho∏ng thπch c p 3", nRate=5, tbProp={6, 1, 147, 3, 0, 0}},
		{szName="Huy“n tinh kho∏ng thπch c p 4", nRate=3, tbProp={6, 1, 147, 4, 0, 0}},
		{szName="Huy“n tinh kho∏ng thπch c p 5", nRate=2, tbProp={6, 1, 147, 5, 0, 0}},
		{szName="V‚ L©m MÀt Tﬁch", nRate=0.1, tbProp={6, 1, 26, 1, 0, 0}},
		{szName="T»y TÒy Kinh", nRate=0.1, tbProp={6, 1, 22, 1, 0, 0}},
	}
}

function main(nItemIndex)
	jiaoshi0810_ResetTask()
	local nDate = tonumber(GetLocalDate("%Y%m%d"))
	if nDate >= GetItemParam(nItemIndex, 1) then
		Talk(1,"","VÀt ph»m nµy Æ∑ h’t hπn");
		return 0
	end
	if GetLevel() < 50 or IsCharged() == 0 then
		Talk(1, "", "Chÿ c„ ng≠Íi ch¨i c p 50 trÎ l™n vµ Æ∑ qua nπp thŒ mÌi c„ th” sˆ dÙng c´ng cÙ nµy.")
		return 1
	end
	local nCurExp = GetTask(jiaoshi0810_TSK_ExpLimit)
	if nCurExp >= jiaoshi0810_MaxExpLimit then
		Talk(1, "", format("MÁi nh©n vÀt sˆ dÙng vÀt ph»m nµy nhi“u nh t chÿ thu Æ≠Óc %s kinh nghi÷m.", jiaoshi0810_TransferDigit2CnNum(jiaoshi0810_MaxExpLimit)))
		return 1;
	end
	tbAwardTemplet:GiveAwardByList(%tbAwardList, "use "..GetItemName(nItemIndex))
	SetTask(jiaoshi0810_TSK_ExpLimit, nCurExp + %tbAwardList[1].nExp)
end