Include("\\script\\tagnewplayer\\func_check.lua");
Include("\\script\\tagnewplayer\\QualityItem.lua");



function ToStrNumb(set)
	local s = "{"
	local sep = ""
	local val = ""
	for k,v in set do
			if (type(v) == "table") then
				val = ToStrNumb(v)
			else
				val = v
			end
			if (type(v) == "string") then
				val = "\"" ..v.."\""
			end
			s = s .. sep .. val
			sep = ", "
	end
	return s .. "}"
end

tbItem=
{
	{strSelect ="nãn"},
	{strSelect ="¸o"},
	{strSelect ="th¾t l­ng"},
	{strSelect ="bao tay"},
	{strSelect ="giÇy"},
	{strSelect ="vò khÝ thø nhÊt"},
	{strSelect ="vò khÝ thø hai"}
};
tbWeapon=
{
	{strName ="§ao"},
	{strName ="Phi §ao"},
	{strName ="Phi Tiªu"},
	{strName ="KiÕm"},
	{strName ="Th­¬ng"},
	{strName ="Bæng"}
};



function GetItemTim()
		local tbSeries={}
		if (CheckObject() < 1) then
			Talk(1, "", "Xin h·y kiÓm tra l¹i ®iÒu kiÖn tham gia.");
			return
		end
		if (CheckGetItem(NWP_EXTPOINT, NWP_E5_BIT_GetItemBonusTim) ~= 1) then
			Talk(1, "", "PhÇn th­ëng nµy chØ nhËn 1 lÇn !");
			return
		end
		if CalcFreeItemCellCount() < 60 then
			Talk(1, "", "Hµnh trang kh«ng ®ñ 60 « trèng.");
			return
		end
		SelectItemTim(tbSeries)
end
function SelectItemTim(tbSeries)
	local tbOpp = {}
	local str = "<#>§¹i hiÖp, xin h·y chän trang bÞ ";
	local szTempSeries = ToStrNumb(tbSeries)
	str = str .. ShowSelItem(tbSeries)
		
	for i = 1, getn(tbItem) do
			local strFunc = tbItem[i].strSelect
			tinsert(tbOpp,"Ta muèn nhËn trang bÞ ".. strFunc.." /#SelectSeries("..i.. ",".."\""..strFunc.."\"".."," .. szTempSeries .. ")");
	end
	tinsert(tbOpp, "<#>Tho¸t/CancelSelectItem")
	if ( getn( tbOpp ) == 0 ) then
		Say(str, 0);
		return
	end;
	Say( str, getn( tbOpp ), tbOpp )
	
end
function SelectSeries(nIndex, strFunc, tbSeries)
	
	if (getn(tbSeries)> 0) then
		for i =1, getn(tbSeries) do
				
				if (tbSeries[i][1] == strFunc) then
					do
						Talk(1,"",format("§¹i hiÖp ®· chän trang bÞ %s råi mµ cßn muèn chän n÷a sao!!!", strFunc))
						return
					end
				end
		end
	end

	local szTempSeries = ToStrNumb(tbSeries)
	if (strFunc ~= "vò khÝ thø nhÊt" and strFunc ~= "vò khÝ thø hai") then
		local tbOpp = {}
		local str = "<#> §¹i hiÖp chän lùa thuéc tÝnh ngò hµnh ";
		tinsert(tbOpp,"Ta muèn nhËn trang bÞ hÖ Kim/#SelectItem(0,".."\""..strFunc.."\"".. "," .. szTempSeries ..")");
		tinsert(tbOpp,"Ta muèn nhËn trang bÞ hÖ Méc/#SelectItem(1,".."\""..strFunc.."\"".. "," .. szTempSeries ..")");
		tinsert(tbOpp,"Ta muèn nhËn trang bÞ hÖ Thñy/#SelectItem(2,".."\""..strFunc.."\"".. "," .. szTempSeries ..")");
		tinsert(tbOpp,"Ta muèn nhËn trang bÞ hÖ Háa/#SelectItem(3,".."\""..strFunc.."\"".. "," .. szTempSeries ..")");
		tinsert(tbOpp,"Ta muèn nhËn trang bÞ hÖ Thæ/#SelectItem(4,".."\""..strFunc.."\"".. "," .. szTempSeries ..")");
		tinsert(tbOpp, "<#>Tho¸t/CancelSelectItem")
		if ( getn( tbOpp ) == 0 ) then
			Say(str, 0);
			return
		end
		Say( str, getn( tbOpp ), tbOpp )
	else
		local tbOpp = {}
		local str = "<#> §¹i hiÖp xin h·y chän vò khÝ"
		for i=1, getn(tbWeapon) do
			local strItemName = tbWeapon[i].strName
			tinsert(tbOpp,"Ta chän: " .. strItemName.."/#SelectItem(0,".."\""..strItemName.."\"".. "," .. szTempSeries .. ")");
		end
		tinsert(tbOpp, "<#>Tho¸t/CancelSelectItem")
		if ( getn( tbOpp ) == 0 ) then
			Say(str, 0);
			return
		end;
		Say( str, getn( tbOpp ), tbOpp )
	end
end
function SelectItem(nSeries, strFunc, tbSeries)

	if (getn(tbSeries)> 0) then
		for i =1, getn(tbSeries) do
				
				if (tbSeries[i][1] == strFunc) then
					do
						Talk(1,"",format("§¹i hiÖp ®· chän trang bÞ %s råi mµ cßn muèn chän n÷a sao!!!", strFunc))
						return
					end
				end
		end
	end
	tbSeries[getn(tbSeries)+1] = {strFunc, nSeries}
	if (getn(tbSeries)> 0) then
		local nCount = 0
		for i =1, getn(tbSeries) do
			for j = 1, getn(tbWeapon) do
				if (tbSeries[i][1] == tbWeapon[j].strName) then
					nCount = nCount + 1
				end
			end
		end
		
		if (nCount > 2) then
			do
					Talk(1,"","§¹i hiÖp ®· chän qu¸ sè l­îng vò khÝ cho phÐp!!!")
					return
			end
		end
		
	end		
		if (getn(tbSeries) < 7) then
			SelectItemTim(tbSeries)
		else
			--tbItem = clone(tbItem)
			local strTitle = "<#>C¸c h¹ ®· chän ngò hµnh cho c¸c trang bÞ: "
			--for strItemName,numSeries in tbSeries do
			strTitle = strTitle .. ShowSelItem(tbSeries)
			local szTempSeries = ToStrNumb(tbSeries)
			Say(strTitle, 2,
			"Ta muèn nhËn/#ConfirmGetItem(" .. szTempSeries .. ")",
			"Hñy bá /CancelSelectItem")
		end
end
function ConfirmGetItem(tbSeries)
		for k,v in tbSeries do
			Msg2Player(v[1])
		end
		SetBit2GetItem(NWP_EXTPOINT, NWP_E5_BIT_GetItemBonusTim, 1)--set bit 7 len 1de xac nhan  gamer nhan  phan thuong
		local nSex = GetSex()

		 for i = 1, getn(tbSeries) do
			local strItemName = tbSeries[i][1]
			local numSeries = tbSeries[i][2]
			AddQItem(strItemName, numSeries, nSex)
		end
		
		Addweapon(tbSeries)
		--tbSeries={}		
end
function Addweapon(tbSeries)
		 for i = 1, getn(tbSeries) do
					local strItemName = tbSeries[i][1]
					local nItemIndex = nil
					if (strItemName == "§ao") then
						nItemIndex = AddQualityItem(2,0,0,1,10,0,0,30,219,9,290,135,-1)				
					elseif (strItemName == "Phi §ao") then
						nItemIndex = AddQualityItem(2,0,1,1,10,0,0,30,219,9,290,140,-1)						
					elseif (strItemName == "Phi Tiªu") then
						nItemIndex = AddQualityItem(2,0,1,0,10,0,0,30,219,9,290,140,-1)						
					elseif (strItemName == "KiÕm") then
						nItemIndex = AddQualityItem(2,0,0,0,10,0,0,30,219,9,290,135,-1)					
					elseif (strItemName == "Th­¬ng") then
						nItemIndex = AddQualityItem(2,0,0,3,10,0,0,30,219,9,290,125,-1)					
					elseif (strItemName == "Bæng") then
						nItemIndex = AddQualityItem(2,0,0,2,10,0,0,30,219,9,290,135,-1)					
					end
				
				if (nItemIndex ~= nil) then
					SetItemBindState(nItemIndex, -2);
					SyncItem(nItemIndex)
					local strItem = GetItemName(nItemIndex)
					Msg2Player("B¹n nhËn ®­îc "..strItem)
					WriteLog(date("%Y%m%d %H%M%S").."\t".."An Bang Hoµng Kim LÖnh"..GetAccount().."\t"..GetName().."\t".."nhËn ®­îc TÝm"..strItem)
				end
		end--for
end

function ShowSelItem(tbSeries)
	local szTem = ""
	for i = 1, getn(tbSeries) do
				local numSeries = tbSeries[i][2]
				local strItemName =  tbSeries[i][1]
				local nSeries=""
				if (numSeries == 0) then
					nSeries = "Kim"
				elseif(numSeries == 1) then
					nSeries = "Méc"
				elseif(numSeries == 2) then
					nSeries = "Thñy"
				elseif(numSeries == 3) then
					nSeries = "Háa"
				else
					nSeries = "Thæ"
				end
				szTem = szTem .. "\n<color=yellow>"..strItemName.."<color> hÖ <color=red>"..nSeries.."<color>"
	end
	return szTem
end

function CancelSelectItem()

end






