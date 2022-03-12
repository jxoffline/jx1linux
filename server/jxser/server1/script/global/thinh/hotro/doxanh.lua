tbItemName =
{
	--VK can
	[0]={
		szName = "Vò KhÝ CËn ChiÕn",
		tbEquip =
		{
			{"HuyÒn ThiÕt KiÕm",0,0,0},
			{"§¹i Phong §ao",0,0,1},
			{"Kim C« Bæng",0,0,2},
			{"Ph¸ Thiªn KÝch",0,0,3},
			{"Ph¸ Thiªn chïy",0,0,4},
			{"Th«n NhËt Tr·m",0,0,5},
			{"TriÒn Thñ",0,0,6},
			{"Vò Hån §ao",0,0,7},
			{"Vò Hån ThuÉn",0,0,8},
		}
	},
	--VK xa
	[1]={
		szName = "Vò KhÝ TÇm Xa",
		tbEquip =
		{
			{"B¸ V­¬ng Tiªu",0,1,0},
			{"To¸i NguyÖt §ao",0,1,1},
			{"Khæng T­íc Linh",0,1,2},
		}		
	},
	--Ao
	[2]={
		szName = "Aã Gi¸p",
		tbEquip =
		{
			{"ThÊt B¶o Cµ Sa",0,2,0},
			{"Ch©n Vò Th¸nh Y",0,2,1},
			{"Thiªn NhÉn MËt Trang",0,2,2},
			{"Gi¸ng Sa Bµo",0,2,3},
			{"§­êng Nghª gi¸p",0,2,4},
			{"V¹n L­u Quy T«ng Y",0,2,5},
			{"TuyÒn Long bµo",0,2,6},
			{"Long Tiªu ®¹o Y",0,2,8},
			{"Cöu VÜ B¹ch Hå trang",0,2,9},
			{"TrÇm H­¬ng sam",0,2,10},
			{"TÝch LÞch Kim Phông gi¸p",0,2,11},
			{"V¹n Chóng TÒ T©m Y",0,2,12},
			{"L­u Tiªn QuÇn",0,2,13},
		}
	},
	--Nhan
	[3]={
		szName = "NhÉn",
		tbEquip =
		{
			{"Toµn Th¹ch Giíi ChØ ",0,3,0},
		}	
	},
	--Day Chuyen
	[4]={
		szName = "D©y ChuyÒn",
		tbEquip =
		{
			{"Toµn th¹ch h¹ng liªn",0,4,0},
			{"Lôc PhØ Thóy Hé Th©n phï ",0,4,1},
		}
	},
	--Giay
	[5]={
		szName = "Giµy",
		tbEquip =
		{
			{"Cöu TiÕt X­¬ng VÜ Ngoa",0,5,0},
			{"Thiªn Tµm Ngoa",0,5,1},
			{"Kim Lò hµi",0,5,2},
			{"Phi Phông Ngoa",0,5,3},
		}		
	},
	--Dai Lung
	[6]={
		szName = "§ai L­ng",
		tbEquip =
		{
			{"Thiªn Tµm Yªu §¸i",0,6,0},
			{"B¹ch Kim Yªu §¸i",0,6,1},
		}
	},
	--Non
	[7]={
		szName = "Nãn",
		tbEquip =
		{
			{"Tú L« m·o",0,7,0},
			{"Ngò l·o qu¸n",0,7,1},
			{"Tu La Ph¸t kÕt",0,7,2},
			{"Th«ng Thiªn Ph¸t Qu¸n",0,7,3},
			{"YÓm NhËt kh«i",0,7,4},
			{"TrÝch Tinh hoµn",0,7,5},
			{"¤ Tµm M·o",0,7,6},
			{"Quan ¢m Ph¸t Qu¸n",0,7,7},
			{"¢m D­¬ng V« Cùc qu¸n",0,7,8},
			{"HuyÒn Tª DiÖn Tr¸o",0,7,9},
			{"Long HuyÕt §Çu hoµn",0,7,10},
			{"Long L©n Kh«i",0,7,11},
			{"Thanh Tinh Thoa",0,7,12},
			{"Kim Phông TriÓn SÝ ",0,7,13},
		}		
	},
	--Bao Tay
	[8]={
		szName = "Bao Tay",
		tbEquip =
		{
			{"Long Phông HuyÕt Ngäc Tr¹c",0,8,0},
			{"Thiªn Tµm Hé UyÓn",0,8,1},
		}		
	},
	--NGoc Boi
	[9]={
		szName = "Ngäc Béi",
		tbEquip =
		{
			{"Long Tiªn H­¬ng Nang",0,9,0},
			{"D­¬ng Chi B¹ch Ngäc",0,9,1},
		}		
	},	
}
----------LÊy §å Xanh------------------
function laydoxanh()
	local tbOpt = {}
	for i=0, 9 do
		tinsert(tbOpt, format("%s/#laydoxanh1(%d)", tbItemName[i].szName, i))  
	end
	tinsert(tbOpt, "Trë l¹i./main")
	tinsert(tbOpt, "KÕt thóc ®èi tho¹i./no")
	Say("Xin mêi lùa chän trang bÞ:", getn(tbOpt), tbOpt)	
	--CreateNewSayEx("Xin mêi lùa chän trang bÞ:", tbOpt)
end

function laydoxanh1(nType)
	local tbEquip = %tbItemName[nType]["tbEquip"]
	local tbOpt = {}
	for i=1, getn(tbEquip) do
		tinsert(tbOpt, format("%s/#laydoxanh2(%d,%d)", tbEquip[i][1], i, nType))  --{tbEquip[i][1], laydoxanh2, {i, nType}}
	end

	tinsert(tbOpt, "Trë l¹i./laydoxanh")
	tinsert(tbOpt, "KÕt thóc ®èi tho¹i./no")
	Say("Xin mêi lùa chän trang bÞ:", getn(tbOpt), tbOpt)	
end


function laydoxanh2(nIndex, nType)
	local szTitle = "Mêi chän hÖ:"
	local tbOpt = {}
	tinsert(tbOpt, format("Kim/#laydoxanh3(%d,%d, 0)",nIndex, nType))
	tinsert(tbOpt, format("Méc/#laydoxanh3(%d,%d, 1)",nIndex, nType))
	tinsert(tbOpt, format("Thñy/#laydoxanh3(%d,%d, 2)",nIndex, nType))
	tinsert(tbOpt, format("Háa/#laydoxanh3(%d,%d, 3)",nIndex, nType))
	tinsert(tbOpt, format("Thæ/#laydoxanh3(%d,%d, 4)",nIndex, nType))
	tinsert(tbOpt, "Trë l¹i./laydoxanh")
	tinsert(tbOpt, "KÕt thóc ®èi tho¹i./no")
	Say(szTitle, getn(tbOpt), tbOpt)	
end

function laydoxanh3(nIndex, nType, nSeries)
	g_AskClientNumberEx(0, 60, "Sè L­îng:", {laydoxanh4, {nIndex, nType, nSeries}})
end

function level_of_clothes(player_level)
	level = player_level/9 + 1
	if level < 1 then
		level = 1
	elseif level > 10 then
		level = 10
	end
	return level
end

function laydoxanh4(nIndex, nType, nSeries, nCount)
	local Level_Player = GetLevel()
	local Level_Clothes = level_of_clothes(Level_Player)
	local tbEquipSelect = %tbItemName[nType]["tbEquip"][nIndex]
	for i=1,nCount do AddItem(tbEquipSelect[2], tbEquipSelect[3], tbEquipSelect[4], Level_Clothes, nSeries, 200, 10) end
end

-------------------------------------------------------Th¨ng cÊp------------------------------------------

function UpgradeDo() 
	GiveItemUI("Th¨ng cÊp trang bÞ", "§¹i hiÖp ®Æt vËt phÈm vµo!", "UpItemConfirm", "onCancel", 1);
end

function UpItemConfirm(nCount)
	for i=1, nCount do
		local nItemIndex = GetGiveItemUnit(i)
		local strItem = GetItemName(nItemIndex)
		local nEquipVer = ITEM_GetItemVersion(nItemIndex)
		local nEquipRandSeed = ITEM_GetItemRandSeed(nItemIndex)
		local nQuality = GetItemQuality(nItemIndex)
		local nGenre, nDetailType, nParticular, nLevel, nSeries, nLuck = GetItemProp(nItemIndex)
		local arynMagLvl = GetItemAllParams(nItemIndex)	
		if nLevel<10 then
			RemoveItemByIndex(nItemIndex)
			newitem_index = AddItemEx(nEquipVer,nEquipRandSeed,nQuality,nGenre,nDetailType,nParticular,nLevel+1,nSeries,nLuck,arynMagLvl[1],arynMagLvl[2],arynMagLvl[3],arynMagLvl[4],arynMagLvl[5],arynMagLvl[6])
			local strItem_new = GetItemName(newitem_index)
			Msg2Player("Th¨ng cÊp vËt phÈm thµnh c«ng")
			Talk(1, "", "Th¨ng cÊp thµnh c«ng <color=yellow>"..strItem.."<color> thµnh <color=yellow>"..strItem_new);		
		else
			Talk(1, "", "Kh«ng thÓ th¨ng cÊp <color=yellow>"..strItem)
		end
	end
end

-------------------------------------------------------H¹ cÊp------------------------------------------

function DowngradeDo() 
	GiveItemUI("H¹ cÊp trang bÞ", "§¹i hiÖp ®Æt vËt phÈm vµo!", "DownItemConfirm", "onCancel", 1);
end

function DownItemConfirm(nCount)
	for i=1, nCount do
		local nItemIndex = GetGiveItemUnit(i)
		local strItem = GetItemName(nItemIndex)
		local nEquipVer = ITEM_GetItemVersion(nItemIndex)
		local nEquipRandSeed = ITEM_GetItemRandSeed(nItemIndex)
		local nQuality = GetItemQuality(nItemIndex)
		local nGenre, nDetailType, nParticular, nLevel, nSeries, nLuck = GetItemProp(nItemIndex)
		local arynMagLvl = GetItemAllParams(nItemIndex)	
		if nLevel>1 then
			RemoveItemByIndex(nItemIndex)
			newitem_index = AddItemEx(nEquipVer,nEquipRandSeed,nQuality,nGenre,nDetailType,nParticular,nLevel-1,nSeries,nLuck,arynMagLvl[1],arynMagLvl[2],arynMagLvl[3],arynMagLvl[4],arynMagLvl[5],arynMagLvl[6])
			local strItem_new = GetItemName(newitem_index)
			Msg2Player("H¹ cÊp vËt phÈm thµnh c«ng")
			Talk(1, "", "H¹ cÊp thµnh c«ng <color=yellow>"..strItem.."<color> thµnh <color=yellow>"..strItem_new);		
		else
			Talk(1, "", "Kh«ng thÓ h¹ cÊp <color=yellow>"..strItem)
		end
	end
end