-- ÎÄ¼þÃû¡¡£ºzhanbeiyingpiao.lua
-- ´´½¨Õß¡¡£ºzhongchaolong
-- ´´½¨Ê±¼ä£º2008-04-15 10:27:57
--Õ½±¸ÒøÆ±
--ÎïÆ·ÉÏµÄËµÃ÷£º¡°±¾°ïÕ½±¸»ù½ð»áÔö¼Ó1Íòµã¡±
--Ê¹ÓÃ½ØÖ¹Ê±¼ä£º2008Äê05ÔÂ18ÈÕ24µã00·Ö
--Ê¹ÓÃ·½·¨£ºÓÒ¼üµã»÷Ê¹ÓÃ
--ÏÞÖÆ£ºÖ»ÓÐ°ïÖ÷²ÅÄÜÊ¹ÓÃ´ËÎïÆ·¡£
--¼ÇÂ¼Ê¹ÓÃÕ½±¸ÒøÆ±LOG
IncludeLib("SETTING");
if MODEL_GAMESERVER == 1 then
	IncludeLib("TONG")
	Include("\\script\\tong\\tong_header.lua")
end

function  main(nItemIndex)
	
	local nItemData	= GetItemParam(nItemIndex, 1);	
	local nDate = tonumber(GetLocalDate("%Y%m%d"))
	
	
	if nDate >= nItemData then
		Msg2Player("VËt phÈm qu¸ h¹n sö dông, tù ®éng mÊt ®i.")
		return 0;
	end
	
	
	local nBuildFund = 10000
	local _, nTongID = GetTongName()
	if(nTongID == 0) then
		Msg2Player("Ch­a gia nhËp bang héi, kh«ng thÓ sö dông ®¹o cô nµy.");
		return 1
	end
	local figure = TONGM_GetFigure(nTongID, GetName())
	if (figure == TONG_MASTER)then
		WriteLog(format("[%s]\t%s\tName:%s\tAccount:%s\t AddTongBuildFund %d.","use zhanbeiyingpiao",GetLocalDate("%Y-%m-%d %H:%M"),GetName(), GetAccount(), nBuildFund))
		TONG_ApplyAddWarBuildFund(nTongID, nBuildFund)
		
		return 0;
	else
		Msg2Player("Kh«ng ph¶i lµ bang chñ, kh«ng thÓ sö dông ®¹o cô nµy.");
		return 1
	end
end

function GetDesc(nItemIndex)

end