Include("\\script\\lib\\string.lua");
Include("\\script\\event\\newyear_2009\\taskctrl.lua");

local wuguo_tbFormulaList = 
{
	[1] =
	{
		szFailMsg = "<color=red>ChØ dïng mÊy nguyªn liÖu nµy th× kh«ng thÓ ®æi phÇn th­ëng Ngò Qu¶ Mõng Xu©n ®­îc, ®¹i hiÖp ph¶i t×m ®ñ nguyªn liÖu ®i ®·<color>",
		nFreeItemCellLimit = 1,
		tbMaterial = 
		{
			{szName = "M·ng CÇu",	tbProp={6, 1, 1886, 1, 0, 0}, 	nCount = 2},
			{szName = "Dõa", 	tbProp={6, 1, 1887, 1, 0, 0}, 	nCount = 1},
			{szName = "§u §ñ", tbProp={6, 1, 1888, 1, 0, 0}, 	nCount = 1},
			{szName = "Xoµi", 	tbProp={6, 1, 1889, 1, 0, 0},	nCount = 1},
			{szName = "Sung",	tbProp={6, 1, 1890, 1, 0, 0},	nCount = 3},
		},
		tbProduct = 
		{
			szName = "PhÇn th­ëng Ngò Qu¶ Mõng Xu©n",
			[1] =
			{
				{szName="ThiÖp Nh­ ý ", 	tbProp={6, 1, 1016, 1, 0, 0},	nRate = 50},
				{szName="ThiÖp mµu", tbProp={6, 1, 1053, 1, 0, 0}, 	nRate = 50},
			},
			[2] = {nExp = 8e6},
			[3] = 
			{
				pFun = function (self, nCount, szLogTilte)
					SetTask(newyear0901_TSK_GetExp_Wuguo, 800 + GetTask(newyear0901_TSK_GetExp_Wuguo));
				end
			}
		},
		pLimitFun = function (self, nCount)
			if (GetTask(newyear0901_TSK_GetExp_Wuguo) + 800 > 40000) then
				Msg2Player("§¹i hiÖp ®· ®¹t ®Õn kinh nghiÖm cao nhÊt, kh«ng thÓ nhËn thªm phÇn th­ëng tõ ho¹t ®éng Ngò Qu¶ Mõng Xu©n n÷a!");
				return 0;
			else
				return 1;
			end
			
		end
	},
}

function newyear0901_wuguo_dialogmain(tbFormulaList, nItemIndex, szDescLink)
	newyear0901_ResetTask();
	
	if (newyear0901_wuguo_IsActDate() ~= 1) then
		return Talk(1, "", "Ho¹t ®éng ®· kÕt thóc.")
	end
	
	if (GetLevel() < 50 or GetExtPoint(0) < 1) then
		Say("§¹i hiÖp vÉn ch­a ®ñ cÊp 50 hoÆc vÉn ch­a n¹p thÎ nªn kh«ng thÓ tham gia ho¹t ®éng nµy.", 0);
		return 1;
	end
	
	tbFormulaList = tbFormulaList or %wuguo_tbFormulaList
	newyear0901_wuguo_MakeComposeClas(tbFormulaList)
	nItemIndex = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	
	local tbSay = newyear0901_wuguo_Compose:MakeOptByProductName("Ta muèn nhËn l·nh", nItemIndex, szDescLink);
	tinsert(tbSay , 1, "<dec>"..szDescLink.."NÕu nh­ t×m ®ñ 5 lo¹i hoa qu¶ 'M·ng CÇu, Dõa, §u §ñ, Xoµi, Sung' th× sÏ thu ®­îc cµng nhiÒu may m¾n.");
	tinsert(tbSay , getn(tbSay)+1, "KÕt thóc ®èi tho¹i/OnCancel");
	CreateTaskSay(tbSay);
end

function newyear0901_wuguo_IsActDate()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate < 20090116 or nDate > 20090215) then
		return 0;
	else
		return 1;
	end
end


--Ö»ÔÚ¶Ô»°Ê±²úÉúÒ»´Î
function newyear0901_wuguo_MakeComposeClas(tbFormulaList)
	if  type(newyear0901_wuguo_Compose) ~= "table" then
		local tbComposeList = tbComposeListForJinNang:new("newyear0901_wuguo_Compose", tbFormulaList)
	end
end
