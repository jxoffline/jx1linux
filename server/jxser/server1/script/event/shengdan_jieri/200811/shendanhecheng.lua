
Include("\\script\\lib\\composeclass.lua")
Include("\\script\\event\\shengdan_jieri\\200811\\timectrl.lua")
Include("\\script\\lib\\string.lua")
function shengdan0811_DailogMain(nItemIndex, szDescLink)
	nItemIndex = nItemIndex or -1
	if not shengdan0811_IsActTime() then
		Talk(1,"", "Ho¹t ®éng ®· kÕt thóc.")
		return 
	end
	szDescLink = szDescLink or "<npc>"
	local tbSay = 
	{
		"<dec>"..szDescLink.."Gi¸ng sinh n¨m nay diÔn ra tõ 05-12-2008 ®Õn 24:00 04-01-2008. C¸c vÞ ®ång ®¹o muèn t×m hiÓu néi dung vµ chuÈn bÞ tham gia ho¹t ®éng nµo?",
		format("T¹i h¹ muèn t×m hiÓu ho¹t ®éng lÇn nµy./#shengdan0811_Content(%d,[[%s]])", nItemIndex, szDescLink),
		format("T¹i h¹ muèn tham gia ho¹t ®éng lÇn nµy/#shengdan0811_Attend(%d, [[%s]])",nItemIndex, szDescLink),
		"Ta nhÊt ®Þnh sÏ quay trë l¹i./OnCancel"	
	}
	CreateTaskSay(tbSay);
end

function shengdan0811_Attend(nItemIndex, szDescLink)
	nItemIndex = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	local tbSay = shengdan0811_MakeComposeListOpt(nItemIndex, szDescLink)
	
	
	
	tinsert(tbSay, 1, "<dec>"..szDescLink.."Quý ®ång ®¹o muèn ®æi nguyªn liÖu thµnh phÇn th­ëng g×?")
	tinsert(tbSay, "Ta sÏ quay l¹i sau./OnCancel")
	CreateTaskSay(tbSay)
end

local tbFormulaList = 
{
	[1] =
	{
		tbMaterial = 
		{
			{szName="NÕn Gi¸ng Sinh", tbProp={6, 1, 1843, 1, 0, 0}, nCount = 3},
			{szName="Chu«ng Gi¸ng Sinh", tbProp={6, 1, 1844, 1, 0, 0}, nCount = 3},
			{szName="Ví Gi¸ng Sinh", tbProp={6, 1, 1845, 1, 0, 0}, nCount = 3},
			{szName="ThiÖp Gi¸ng Sinh", tbProp={6, 1, 1846, 1, 0, 0}, nCount = 3},
			{szName="Phóc Duyªn Tinh Th¹ch", tbProp={6, 1, 1835, 1, 0, 0}, nCount = 3},
			{nJxb = 2e4}
		},
		tbProduct = 
		{
			szName="B¸nh Kem D©u", tbProp={6, 1, 1848, 1, 0, 0}, nExpiredTime = 20090111

		}
		
	},
	[2] =
	{
		tbMaterial = 
		{
			
			{szName="NÕn Gi¸ng Sinh", tbProp={6, 1, 1843, 1, 0, 0}, nCount = 1},
			{szName="Chu«ng Gi¸ng Sinh", tbProp={6, 1, 1844, 1, 0, 0}, nCount = 1},
			{szName="Ví Gi¸ng Sinh", tbProp={6, 1, 1845, 1, 0, 0}, nCount = 1},
			{szName="ThiÖp Gi¸ng Sinh", tbProp={6, 1, 1846, 1, 0, 0}, nCount = 1},
			{szName="Ng«i Sao Gi¸ng Sinh", tbProp={6, 1, 1847, 1, 0, 0}, nCount = 3},
			{szName="Phóc Duyªn Tinh Th¹ch", tbProp={6, 1, 1835, 1, 0, 0}, nCount = 3},
			{nJxb = 2e4}
		},
		tbProduct = 
		{
			szName="B¸nh Kem Socola", tbProp={6, 1, 1849, 1, 0, 0}, nExpiredTime = 20090111
		}
		
	},
}


function shengdan0811_Content(nItemIndex, szDescLink)
	nItemIndex = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	local szMsg = "<dec>"..szDescLink.."Ho¹t ®éng gi¸ng sinh n¨m nay diÔn ra tõ 05-12-2008 ®Õn 04-01-2009. Trong thêi gian ho¹t ®éng ng­êi ch¬i cã thÓ thu ®­îc hép quµ xanh th«ng qua ®¸nh qu¸i vµ thu ®­îc hép quµ ®á th«ng qua ñy th¸c trªn m¹ng. Më c¸c hép quµ trªn, quý ®ång ®¹o sÏ thu thËp ®­îc c¸c vËt phÈm cÇn thiÕt ®Ó ®æi lÊy c¸c lo¹i b¸nh kem t¹i NPC ¤ng Giµ TuyÕt. Sö dông c¸c lo¹i b¸nh kem sÏ ®­îc kinh nghiÖm vµ c¸c phÇn quµ gi¸ trÞ. Ngoµi ra, quý ®ång ®¹o cßn cã kh¶ n¨ng nhËn ®­îc c¸c lo¹i phÇn th­ëng ®Æc biÖt nh­: TiÓu B¨ng Tinh, NÕn Tr¾ng vµ NÕn Xanh khi sö dông B¸nh Kem Socola<enter>C¸c h¹ cÇn cã ®ñ nh÷ng vËt phÈm sau ®©y ®Ó ®æi lÊy c¸c lo¹i B¸nh Kem:<enter>"
	for i=1, getn(%tbFormulaList) do
		szMsg = szMsg..shengdan0811_MakeComposeMsg(%tbFormulaList[i]).."<enter>"
	end
	local tbSay = 
	{
		szMsg,
		"Ta ®· biÕt råi. /OnCancel"
	}
	CreateTaskSay(tbSay)
end

function shengdan0811_MakeComposeMsg(tbFormula, nType)
	if nType == 1 then
		return tbFormula.tbProduct.szName
	end
	local tbMaterial = tbFormula.tbMaterial
	local szMsg = nil
	for i=1, getn(tbMaterial) do
		local szName
		if tbMaterial[i].nJxb then
			szName = transferDigit2CnNum(tbMaterial[i].nJxb).." l­îng"
		else
			szName = tbMaterial[i].szName.."X"..(tbMaterial[i].nCount or 1)
		end
		
		if not szMsg then
			szMsg = szName
		else
			szMsg = szMsg.."+"..szName	
		end
	end
	szMsg = szMsg.."="..tbFormula.tbProduct.szName
	return szMsg
end

function shengdan0811_MakeComposeListOpt(nItemIndex, szDescLink)
	nItemIndex = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	local tbOpt = {}
	for i=1, getn(%tbFormulaList) do
		tinsert(tbOpt, format("T¹i h¹ muèn ®æi %s/#shengdan0811_Compose(%d,%d, [[%s]])",shengdan0811_MakeComposeMsg(%tbFormulaList[i], 1), nItemIndex, i, szDescLink))
	end
	return tbOpt
end

function shengdan0811_Compose(nItemIndex, nId, szDescLink)
	nItemIndex = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	local szMsg = format("<dec>"..szDescLink.."§æi %s cÇn: <enter>%s, ", %tbFormulaList[nId].tbProduct.szName ,tbComposeClass:GetMaterialList(%tbFormulaList[nId].tbMaterial))
	local tbSay = 
	{
		szMsg,
		format("X¸c nhËn/#shengdan0811_ComposeConfirm(%d, %d)", nItemIndex, nId),
		"Hñy bá /OnCancel"
	}
	CreateTaskSay(tbSay)
end

function shengdan0811_ComposeConfirm(nItemIndex, nId)
	nItemIndex = nItemIndex or -1
	
	
	if tbItemJingnianshijian then
		if tbItemJingnianshijian:CheckItem(nItemIndex) ~= 1 then
			return 0
		end
	end
	--ÕâÀïÅÐ¶Ï±³°ü¿Õ¼ä
	if ( CalcFreeItemCellCount() < 1 ) then
		Say("Hµnh trang cña ®¹i hiÖp kh«ng ®ñ chç trèng!",0);
		return
	end
	
	if tbComposeClass:Compose(%tbFormulaList[nId], "shengdan0811_Compose"..shengdan0811_MakeComposeMsg(%tbFormulaList[nId]) ) == 1 then
		if tbItemJingnianshijian then
			 tbItemJingnianshijian:ReduceUseCount(nItemIndex)
		end
		return 1
	end
	return 0
end



function OnCancel()
	
end


