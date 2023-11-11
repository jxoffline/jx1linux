--·£¶ñÊ¹
--hehongpeng 2004-12-27
Include("\\script\\global\\shangchenghead.lua")
--¶¨ÒåÈ«¾Ö±äÁ¿¼ÇÂ¼Íæ¼ÒÒª³Í·£ÄÇ¸ö³ÇÊÐ
nGlobalCityIndex = 0

CityData = {0, 0, 0, 0, 0, 0, 0};

function main()
	if (nil) then
		Say("Chøc n¨ng vÉn ch­a Më ra", 0)
		return
	end
	--¶ÁÈ¡´æÅÌÎÄ¼þ£¬±£Ö¤Ö»¶ÁÈ¡Ò»´Î
	loadsavevalue()
	
	local aryszContent = 
	{
		"<#> Ta lµ ng­êi trõng ph¹t kÎ ¸c, cã thÓ gióp g× cho hÞªp kh¸ch?",
		"<#> T×m hiÓu c«ng tr¹ng c¸c thµnh thÞ /onchecknum",
		"<#> Trõng ph¹t bang héi chiÕm lÜnh Ph­îng T­êng /onpunish_fengxiang",
		"<#> Trõng ph¹t bang héi chiÕm lÜnh Thµnh §«/onpunish_chengdu",
		"<#> Trõng ph¹t bang héi chiÕm lÜnh §¹i Lý /onpunish_dali",
		"<#> Trõng ph¹t bang héi chiÕm lÜnh BiÖn Kinh/onpunish_bianjing",
		"<#> Trõng ph¹t bang héi chiÕm lÜnh T­¬ng D­¬ng/onpunish_xiangyang",	
		"<#> Trõng ph¹t bang héi chiÕm lÜnh D­¬ng Ch©u/onpunish_yangzhou",
		"<#> Trõng ph¹t bang héi chiÕm lÜnh L©m An/onpunish_linan",		
		"<#> Nh©n tiÖn ghÐ qua th«i/oncancel",
	}
	
	--¿ÉÒÔ²»¿ÉÒÔÓÃÊý×éÀ´ÊµÏÖ
	local aryCallBackFun = {
		"/onpunish_fengxiang",
		"/onpunish_chengdu",
		"/onpunish_dali",
		"/onpunish_bianjing",
		"/onpunish_xiangyang",
		"/onpunish_yangzhou",
		"/onpunish_linan"
	}
	local nNum
	for nCityIndex=1, 7 do
		strTongName = GetCityOwner(nCityIndex)
		if (strTongName == nil or strTongName == "") then
			aryszContent[nCityIndex + 2] = "<#>"..arraycityindextoname[nCityIndex].."Kh«ng cã bang héi chiÕm lÜnh, kh«ng thÓ tiÕn hµnh trõng ph¹t/oncancel"
		else
			nNum = GetGlbValue(arraycitytoglobalvalue[nCityIndex])
			aryszContent[nCityIndex + 2] = "<#> Trõng ph¹t bang héi"..strTongName.."chiÕm lÜnh thµnh thÞ "..arraycityindextoname[nCityIndex].." (C«ng tr¹ng thµnh thÞ:"..nNum..")"..aryCallBackFun[nCityIndex]
		end
	end	
	
	Say(aryszContent[1], 9,	aryszContent[2],aryszContent[3],aryszContent[4],aryszContent[5],aryszContent[6],aryszContent[7],aryszContent[8],aryszContent[9], aryszContent[10]);
end 

function onpunish()
	--¸ù¾ÝµØÍ¼Ë÷Òý³Í·£
	if (nGlobalCityIndex < 1) then
		Say("<#> Kh«ng cã thµnh thÞ nµo cÇn trõng ph¹t", 0)
		return
	end

	local strCityTongName = GetCityOwner(nGlobalCityIndex)
	if (strCityTongName == nil or strCityTongName == "" ) then
		Say("<#> bang héi chiÕm lÜnh <color=red>"..arraycityindextoname[nIndex].."<color> kh«ng ai chiÕm lÜnh, kh«ng thÓ tiÕn hµnh trõng ph¹t", 0)
		return
	end

	local strCityTongName = GetCityOwner(nGlobalCityIndex)
	local nNum = GetGlbValue(arraycitytoglobalvalue[nGlobalCityIndex])
	--´ò¿ª¸øÓë½çÃæ
	GiveItemUI( "Giao nép Ph¹t ¸c LÖnh", "Trõng ph¹t thµnh thÞ "..arraycityindextoname[nGlobalCityIndex]..", bang héi chiÕm lÜnh thµnh thÞ "..strCityTongName..", hiÖn t¹i c«ng tr¹ng cña thµnh ®ã lµ:"..nNum, "onsubmitconfirm", "oncancel" )
end

function onconfirm(nIndex)
	local strCityTongName = GetCityOwner(nIndex)
	if (strCityTongName == nil or strCityTongName == "" ) then
		Say("<#> bang héi chiÕm lÜnh <color=red>"..arraycityindextoname[nIndex].."<color> kh«ng ai chiÕm lÜnh, kh«ng thÓ tiÕn hµnh trõng ph¹t", 0)
		return
	end

	--¸øÈ«¾Ö±äÁ¿¸³Öµ
	nGlobalCityIndex = nIndex	
	strMsg={	
		"<#> bang héi chiÕm lÜnh <color=red>"..arraycityindextoname[nIndex].."<color>lµ: <color=red>"..strCityTongName.."<color>, b¹n x¸c ®Þnh sö dông Ph¹t ¸c LÖnh?",
		"<#> Sö dông/onpunish",
		"<#> §Ó ta suy nghÜ l¹i!/oncancel"		
	};
	
	Say(strMsg[1], 2, strMsg[2], strMsg[3]);
end

function onpunish_fengxiang()
	onconfirm(1)
end

function onpunish_chengdu()
	onconfirm(2)
end

function onpunish_dali()
	onconfirm(3)
end

function onpunish_bianjing()
	onconfirm(4)
end

function onpunish_xiangyang()
	onconfirm(5)
end

function onpunish_yangzhou()
	onconfirm(6)
end

function onpunish_linan()
	onconfirm(7)
end
		
function oncancel()
	return
end

function onchecknum()
	--²éÑ¯¸÷°ï»áÉÍÉÆÁîµÄÊýÁ¿
	local strTongName
	local nCityIndex
	local arr = {}
	local strInfo1 = ""
	local strInfo2 = ""
	for nCityIndex=1, 4 do
		strTongName = GetCityOwner(nCityIndex)
		local nNum = GetGlbValue(arraycitytoglobalvalue[nCityIndex])
		if (strTongName == nil or strTongName == "") then
			arr[nCityIndex] = "<#><color=red>"..arraycityindextoname[nCityIndex].."<color> Kh«ng ai chiÕm lÜnh, c«ng tr¹ng lµ:<color=red>"..nNum.."<color>"
		else
			arr[nCityIndex] = "<#> bang héi chiÕm lÜnh <color=red>"..arraycityindextoname[nCityIndex].."<color> lµ: <color=red>"..strTongName.."<color>, c«ng tr¹ng thµnh thÞ lµ:<color=red>"..nNum.."<color>"
		end
		if (nCityIndex == 1) then
		    strInfo = arr[nCityIndex]
		elseif (nCityIndex == 2) then
		    strInfo = strInfo.."<enter>"..arr[nCityIndex]
		elseif (nCityIndex == 3) then
		    strInfo1 = arr[nCityIndex]
		elseif (nCityIndex == 4) then
		    strInfo1 = strInfo1.."<enter>"..arr[nCityIndex]
		end
	end
	
	--Talk(4, "onchecknum1", arr[1], arr[2], arr[3], arr[4])
	Talk(2, "onchecknum1", strInfo, strInfo1)
end

function onchecknum1()
	--²éÑ¯¸÷°ï»áÉÍÉÆÁîµÄÊýÁ¿
	local strTongName
	local nCityIndex
	local arr = {}
	local strInfo = ""
	local strInfo1 = ""
	for nCityIndex=5, 7 do
		strTongName = GetCityOwner(nCityIndex)
		local nNum = GetGlbValue(arraycitytoglobalvalue[nCityIndex])
		if (strTongName == nil or strTongName == "") then
			arr[nCityIndex] = "<#><color=red>"..arraycityindextoname[nCityIndex].."<color> kh«ng ai chiÕm lÜnh, c«ng tr¹ng thµnh thÞ lµ: <color=red>"..nNum.."<color>"
		else
			arr[nCityIndex] = "<#> bang héi chiÕm lÜnh <color=red>"..arraycityindextoname[nCityIndex].."<color> lµ: <color=red>"..strTongName.."<color>, c«ng tr¹ng thµnh thÞ lµ:<color=red>"..nNum.."<color>"
		end
		if (nCityIndex == 5) then
		    strInfo = arr[nCityIndex]
		elseif (nCityIndex == 6) then
		    strInfo = strInfo.."<enter>"..arr[nCityIndex]
		else
		    strInfo1 = arr[nCityIndex]
		end
	end
	
	--Talk(3, "", arr[5], arr[6], arr[7])
	Talk(2, "", strInfo, strInfo1)
end

function onsubmitconfirm(nCount)
	if (nCount < 1) then
		Msg2Player("B¹n kh«ng giao nép Ph¹t ¸c LÖnh")
		return
	end
	
	--ÅÐ¶ÏÎïÆ·ÊÇ·ñÎª·£¶ñÁî
	for i = 1, nCount do
		local nItemIndex = GetGiveItemUnit( i )
		ItemGenre, DetailType, ParticularType = GetItemProp(nItemIndex)

		if (ItemGenre ~= AEXP_PUNISHMEDIAL_NGENTYPE or
			DetailType ~= AEXP_PUNISHMEDIAL_DETAILTYPE or
			ParticularType ~= AEXP_PUNISHMEDIAL_PARTYPE) then
				Msg2Player("<#> H×nh nh­ vËt cña ng­¬i kh«ng ph¶i Ph¹t ¸c LÖnh ®ã!")
				return 0			
		end
	end
	
	local nTotalNum = 0
	for i = 1, nCount do
		nItemIndex = GetGiveItemUnit( i )
		nTotalNum = nTotalNum + GetItemStackCount(nItemIndex)
		RemoveItemByIndex( nItemIndex )
	end
	
	local nNum = GetGlbValue(arraycitytoglobalvalue[nGlobalCityIndex])
	--if (nNum < 0) then
	--	nNum = 0
	--end
	
	local nSpareNum = nNum - nTotalNum
	--if (nSpareNum < 0) then
	--	nSpareNum = 0
	--end
	
	SetGlbValue(arraycitytoglobalvalue[nGlobalCityIndex], nSpareNum)
	local strCityTongName = GetCityOwner(nGlobalCityIndex);	
	--¶ÔtabÎÄ¼þ½øÐÐÐ´
	CityData[nGlobalCityIndex] = CityData[nGlobalCityIndex] + nTotalNum
	if (CityData[nGlobalCityIndex] > AEXP_REDUCEMAX_SAVE) then
		CityData[nGlobalCityIndex] = 0		
		WriteLog("["..date("%Y-%m-%d %X").."] Bang héi:"..strCityTongName.." Thµnh thÞ:"..arraycityindextoname[nGlobalCityIndex].." V× "..GetAccount().."("..GetName()..") ®· giao"..nTotalNum.."Ph¹t ¸c LÖnh, v­ît qu¸ sè l­îng, hiÖn t¹i lµ "..nSpareNum.."(Current OnlineTime: "..GetGameTime().." sec)" );
		savevalue()
	end	
	
	Say("<#> bang héi chiÕm lÜnh <color=red>"..arraycityindextoname[nGlobalCityIndex].."<color> lµ: <color=red>"..strCityTongName.."<color>, b¹n giao nép"..nTotalNum.."Ph¹t ¸c LÖnh ®Ó trõng ph¹t ®èi ph­¬ng, c«ng tr¹ng hiÖn t¹i cña thµnh thÞ lµ:<color=red>"..nSpareNum.."<color>",0)
end
