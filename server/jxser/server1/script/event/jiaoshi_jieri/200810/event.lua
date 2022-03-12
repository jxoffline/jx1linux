
Include("\\script\\event\\jiaoshi_jieri\\200810\\lib\\compose.lua")
Include("\\script\\event\\jiaoshi_jieri\\200810\\timectrl.lua")
Include("\\script\\event\\jiaoshi_jieri\\200810\\lib\\lib.lua")
function jiaoshi0810_DailogMain(nItemIndex, szDescLink)
	nItemIndex = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	if not jiaoshi0810_IsActTime() then
		Talk(1,"", "Ho¹t ®éng ®· kÕt thóc.")
		return 
	end
	
	local tbSay = 
	{
		"<dec>"..szDescLink.."Ngµy Nhµ Gi¸o ViÖt Nam lµ ngµy t«n vinh c«ng ¬n cña nh÷ng ng­êi thÇy, ng­êi c« ®· gãp c«ng gi¸o d­ìng chóng ta nªn ng­êi. Nh©n dÞp nµy, ta cã nhiÒu mãn quµ ®Ó tÆng cho c¸c ®Ö tö xuÊt s¾c vµ hiÕu th¶o. Ng­¬i cã muèn tham gia ho¹t ®éng nµy kh«ng?",
		format("§Ö tö muèn t×m hiÓu néi dung cña ho¹t ®éng/#jiaoshi0810_Content(%d, [[%s]])", nItemIndex, szDescLink),
		format("§Ö tö muèn tham gia ho¹t ®éng nµy/#jiaoshi0810_Attend(%d, [[%s]])",nItemIndex, szDescLink),
		"§Ö tö biÕt råi, ta sÏ quay l¹i sau./OnCancel"	
	}
	CreateTaskSay(tbSay)
end

function jiaoshi0810_Attend(nItemIndex, szDescLink)
	nItemIndex = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	local tbSay = jiaoshi0810_MakeComposeListOpt(nItemIndex, szDescLink)
	tinsert(tbSay, 1, "<dec>"..szDescLink.."Ho¹t ®éng §¸p T¹ ¢n S­ diÔn ra tõ ngµy 14-11-2008 ®Õn 23-11-2008. Trong thêi gian diÔn ra sù kiÖn, c¸c ®Ö tö cã thÓ sö dông c¸c vËt phÈm thu thËp ®­îc trong qu¸ tr×nh b«n tÈu giang hå ®Ó lµm quµ tÆng cho ¢n S­.")
	tinsert(tbSay, "§Ö tö chØ ghÐ th¨m ¢n S­ th«i./OnCancel")
	CreateTaskSay(tbSay)
end

local tbFormulaList = 
{
	[1] =
	{
		tbMaterial = 
		{
			{szName="HuyÒn tinh kho¸ng th¹ch (cÊp 1)", tbProp={6, 1, 147, 1, 0, 0},nCount = 1},
			{szName="Phóc Duyªn Tinh Th¹ch", tbProp={6, 1, 1835, 1, 0, 0},nCount = 3},
			{nJxb = 10000}
		},
		tbProduct = 
		{
			{szName="BÝ KÝp Gia TruyÒn", tbProp={6, 1, 1834, 1, 0, 0}, nExpiredTime = 20081201},
		}
		
	},
	[2] =
	{
		tbMaterial = 
		{
			{szName="HuyÒn tinh kho¸ng th¹ch (cÊp 2)", tbProp={6, 1, 147, 2, 0, 0},nCount = 1},
			{szName="Phóc Duyªn Tinh Th¹ch", tbProp={6, 1, 1835, 1, 0, 0},nCount = 1},
			{nJxb = 10000}
		},
		tbProduct = 
		{
			{szName="BÝ KÝp Gia TruyÒn", tbProp={6, 1, 1834, 1, 0, 0}, nExpiredTime = 20081201},
		}
		
	},
	[3] =
	{
		tbMaterial = 
		{
			{szName="MËt ®å thÇn bÝ ", tbProp={6, 1, 196},nCount = 1},
			{szName="Phóc Duyªn Tinh Th¹ch", tbProp={6, 1, 1835, 1, 0, 0},nCount = 1},
			{nJxb = 40000}
		},
		tbProduct = 
		{
			{szName="BÝ KÝp Gia TruyÒn", tbProp={6, 1, 1834, 1, 0, 0}, nExpiredTime = 20081201},
		}
		
	},
	[4] =
	{
		tbMaterial = 
		{
			{szName="MËt ®å thÇn bÝ ", tbProp={6, 1, 196}, nCount = 10},
			{nJxb = 40000}
		},
		tbProduct = 
		{
			{szName="BÝ KÝp Gia TruyÒn", tbProp={6, 1, 1834, 1, 0, 0}, nExpiredTime = 20081201},
		}
		
	}
}


function jiaoshi0810_Content(nItemIndex, szDescLink)
	nItemIndex = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	local szMsg = "<dec>"..szDescLink.."Ta chØ mong sím ®­îc gÆp l¹i c¸c ®Ö tö cña ta ®Ó tho¶ lßng mong nhí nhí bÊy l©u. Ta kh«ng cÇn ®Õn nh÷ng mãn quµ cao sang mµ chØ mong nhËn ®­îc nh÷ng mãn quµ thËt gi¶n dÞ, ®ã lµ b»ng chøng cho nh÷ng thµnh tÝch trong qu¸ tr×nh rÌn luyÖn cña c¸c ®Ö tö.<enter>"
	for i=1, getn(%tbFormulaList) do
		szMsg = szMsg..jiaoshi0810_MakeComposeMsg(%tbFormulaList[i]).."<enter>"
	end
	local tbSay = 
	{
		szMsg,
		"§Ö tö râ råi, ®a t¹ ©n s­!/OnCancel"
	}
	CreateTaskSay(tbSay)
end

function jiaoshi0810_MakeComposeMsg(tbFormula)
	local tbMaterial = tbFormula.tbMaterial
	local szMsg = nil
	for i=1, getn(tbMaterial) do
		local szName
		if tbMaterial[i].nJxb then
			szName = jiaoshi0810_TransferDigit2CnNum(tbMaterial[i].nJxb).." l­îng"
		else
			szName = tbMaterial[i].szName.."X"..(tbMaterial[i].nCount or 1)
		end
		
		if not szMsg then
			szMsg = szName
		else
			szMsg = szMsg.."+"..szName	
		end
		
	end
	return szMsg
end

function jiaoshi0810_MakeComposeListOpt(nItemIndex, szDescLink)
	nItemIndex = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	local tbOpt = {}
	for i=1, getn(%tbFormulaList) do
		tinsert(tbOpt, format("%s/#jiaoshi0810_Compose(%d,%d, [[%s]])",jiaoshi0810_MakeComposeMsg(%tbFormulaList[i]), nItemIndex, i, szDescLink))
	end
	return tbOpt
end

function jiaoshi0810_Compose(nItemIndex, nId, szDescLink)
	nItemIndex = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	local szMsg = format("<dec>"..szDescLink.."§æi %s cÇn: <enter>%s, ", %tbFormulaList[nId].tbProduct[1].szName ,jiaoshi0810_ComposeClass:GetMaterialList(%tbFormulaList[nId].tbMaterial))
	local tbSay = 
	{
		szMsg,
		format("X¸c nhËn/#jiaoshi0810_ComposeConfirm(%d, %d)", nItemIndex, nId),
		"Hñy bá /OnCancel"
	}
	CreateTaskSay(tbSay)
end

function jiaoshi0810_ComposeConfirm(nItemIndex, nId)
	nItemIndex = nItemIndex or -1
	
	
	if tbItemJingnianshijian then
		if tbItemJingnianshijian:CheckItem(nItemIndex) ~= 1 then
			return 0
		end
	end
	
	
	if jiaoshi0810_ComposeClass:Compose(%tbFormulaList[nId], "jiaoshi0810_Compose"..jiaoshi0810_MakeComposeMsg(%tbFormulaList[nId]) ) == 1 then
		if tbItemJingnianshijian then
			 tbItemJingnianshijian:ReduceUseCount(nItemIndex)
		end
		return 1
	end
	return 0
end



function OnCancel()
	
end


