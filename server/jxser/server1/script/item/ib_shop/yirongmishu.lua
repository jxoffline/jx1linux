-- ÎÄ¼þÃû¡¡£ºyirongmishu.lua
-- ´´½¨Õß¡¡£ºwangjingjun
-- ÄÚÈÝ¡¡¡¡£ºÒ×ÈÝÃØÊõ °üº¬¶à¸öÃæ¾ßµÄÀñ°üÀàÎïÆ·
-- ´´½¨Ê±¼ä£º2011-07-11 09:36:28

Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\dailogsys\\dailogsay.lua")

local tbMask = 
{
	{szName = "MÆt n¹ - B¹ch Doanh Doanh", tbProp = {0,11,496,1,0,0}, nExpiredTime = 48*60},
	{szName = "MÆt n¹ - B¹ch thµnh quËn chñ", tbProp = {0,11,497,1,0,0}, nExpiredTime = 48*60},
	{szName = "MÆt n¹ - Chung Linh Tó ", tbProp = {0,11,498,1,0,0}, nExpiredTime = 48*60},
	{szName = "MÆt n¹ - Cæ B¸ch", tbProp = {0,11,499,1,0,0}, nExpiredTime = 48*60},
	{szName = "MÆt n¹ - §ao song phông", tbProp = {0,11,500,1,0,0}, nExpiredTime = 48*60},
	{szName = "MÆt n¹ - §¹o Thanh Ch©n Nh©n", tbProp = {0,11,501,1,0,0}, nExpiredTime = 48*60},
	{szName = "MÆt n¹ - DiÖu Nh­ ", tbProp = {0,11,502,1,0,0}, nExpiredTime = 48*60},
	{szName = "MÆt n¹ - §oan Méc DuÖ ", tbProp = {0,11,503,1,0,0}, nExpiredTime = 48*60},
	{szName = "MÆt n¹ - §«ng tö", tbProp = {0,11,504,1,0,0}, nExpiredTime = 48*60},
	{szName = "MÆt n¹ - §­êng BÊt NhiÔm", tbProp = {0,11,505,1,0,0}, nExpiredTime = 48*60},	-- 10
	{szName = "MÆt n¹ - §­êng thÇn", tbProp = {0,11,506,1,0,0}, nExpiredTime = 48*60},
	{szName = "MÆt n¹ - §­êng Thiªn T©m", tbProp = {0,11,507,1,0,0}, nExpiredTime = 48*60},
	{szName = "MÆt n¹ - Gia LuËt TÞ Ly", tbProp = {0,11,508,1,0,0}, nExpiredTime = 48*60},
	{szName = "MÆt n¹ - Hµ Linh Phiªu", tbProp = {0,11,509,1,0,0}, nExpiredTime = 48*60},
	{szName = "MÆt n¹ - Hµ Nh©n Ng· ", tbProp = {0,11,510,1,0,0}, nExpiredTime = 48*60},
	{szName = "MÆt n¹ - H¹ Thµnh", tbProp = {0,11,511,1,0,0}, nExpiredTime = 48*60},
	{szName = "MÆt n¹ - Heo tr¾ng", tbProp = {0,11,512,1,0,0}, nExpiredTime = 48*60},
	{szName = "MÆt n¹ - H­¬u ®èm", tbProp = {0,11,513,1,0,0}, nExpiredTime = 48*60},
	{szName = "MÆt n¹ - HuyÒn Gi¸c §¹i S­ ", tbProp = {0,11,514,1,0,0}, nExpiredTime = 48*60},
	{szName = "MÆt n¹ - Lam linh c«ng tö", tbProp = {0,11,515,1,0,0}, nExpiredTime = 48*60},	-- 20
	{szName = "MÆt n¹ - Lam Y Y", tbProp = {0,11,516,1,0,0}, nExpiredTime = 48*60},
	{szName = "MÆt n¹ - LiÔu Phi Yªn", tbProp = {0,11,517,1,0,0}, nExpiredTime = 48*60},
	{szName = "MÆt n¹ - LiÔu Thanh Thanh", tbProp = {0,11,518,1,0,0}, nExpiredTime = 48*60},
	{szName = "MÆt n¹ - Long thËp tam gia", tbProp = {0,11,519,1,0,0}, nExpiredTime = 48*60},
	{szName = "MÆt n¹ - M¹nh Th­¬ng L­¬ng", tbProp = {0,11,520,1,0,0}, nExpiredTime = 48*60},
	{szName = "MÆt n¹ - Mé Dung YÕn", tbProp = {0,11,521,1,0,0}, nExpiredTime = 48*60},
	{szName = "MÆt n¹ - NguyÖt dao dao", tbProp = {0,11,522,1,0,0}, nExpiredTime = 48*60},
	{szName = "MÆt n¹ - PhiÕn Kh¸ch", tbProp = {0,11,523,1,0,0}, nExpiredTime = 48*60},
	{szName = "MÆt n¹ - T©n Niªn HiÖp Kh¸ch", tbProp = {0,11,524,1,0,0}, nExpiredTime = 48*60},
	{szName = "MÆt n¹ - T©n Niªn HiÖp N÷ ", tbProp = {0,11,525,1,0,0}, nExpiredTime = 48*60},	-- 30
	{szName = "MÆt n¹ - Thanh Niªn H¶i §­êng", tbProp = {0,11,526,1,0,0}, nExpiredTime = 48*60},
	{szName = "MÆt n¹ - Thµnh Niªn H¶i §­êng", tbProp = {0,11,527,1,0,0}, nExpiredTime = 48*60},
	{szName = "MÆt n¹ - Thanh Niªn Háa NhËn", tbProp = {0,11,528,1,0,0}, nExpiredTime = 48*60},
	{szName = "MÆt n¹ - Thµnh Niªn Háa NhËn", tbProp = {0,11,529,1,0,0}, nExpiredTime = 48*60},
	{szName = "MÆt n¹ - Thanh Niªn Kim Phong", tbProp = {0,11,530,1,0,0}, nExpiredTime = 48*60},
	{szName = "MÆt n¹ - Thµnh Niªn Kim Phong", tbProp = {0,11,531,1,0,0}, nExpiredTime = 48*60},
	{szName = "MÆt n¹ - Thanh Niªn L«i KiÕm", tbProp = {0,11,532,1,0,0}, nExpiredTime = 48*60},
	{szName = "MÆt n¹ - Thµnh Niªn L«i KiÕm", tbProp = {0,11,533,1,0,0}, nExpiredTime = 48*60},
	{szName = "MÆt n¹ - Thanh Niªn TiÕu S­¬ng", tbProp = {0,11,534,1,0,0}, nExpiredTime = 48*60},
	{szName = "MÆt n¹ - Thµnh Niªn TiÕu S­¬ng", tbProp = {0,11,535,1,0,0}, nExpiredTime = 48*60},	-- 40
	{szName = "MÆt n¹ - Thanh TuyÖt S­ Th¸i", tbProp = {0,11,536,1,0,0}, nExpiredTime = 48*60},
	{szName = "MÆt n¹ - ThiÕu Niªn H¶i §­êng", tbProp = {0,11,537,1,0,0}, nExpiredTime = 48*60},
	{szName = "MÆt n¹ - ThiÕu Niªn Háa NhËn", tbProp = {0,11,538,1,0,0}, nExpiredTime = 48*60},
	{szName = "MÆt n¹ - ThiÕu Niªn Kim Phong", tbProp = {0,11,539,1,0,0}, nExpiredTime = 48*60},
	{szName = "MÆt n¹ - ThiÕu Niªn L«i KiÕm", tbProp = {0,11,540,1,0,0}, nExpiredTime = 48*60},
	{szName = "MÆt n¹ - ThiÕu Niªn TiÕu S­¬ng", tbProp = {0,11,541,1,0,0}, nExpiredTime = 48*60},
	{szName = "MÆt n¹ - T« Tõ Hinh", tbProp = {0,11,542,1,0,0}, nExpiredTime = 48*60},
	{szName = "MÆt n¹ - Tr­¬ng T«ng ChÝnh", tbProp = {0,11,543,1,0,0}, nExpiredTime = 48*60},
	{szName = "MÆt n¹ - Tö hiÖp", tbProp = {0,11,544,1,0,0}, nExpiredTime = 48*60},
	{szName = "MÆt n¹ - TuyÒn C¬ Tö ", tbProp = {0,11,545,1,0,0}, nExpiredTime = 48*60},		-- 50	
	{szName = "MÆt n¹ - Voi Ch©u ¸ ", tbProp = {0,11,546,1,0,0}, nExpiredTime = 48*60},
	{szName = "MÆt n¹ - Voi Hoµng Hµ ", tbProp = {0,11,547,1,0,0}, nExpiredTime = 48*60},
	{szName = "MÆt n¹ - V­¬ng T¸ ", tbProp = {0,11,548,1,0,0}, nExpiredTime = 48*60},
	{szName = "MÆt n¹ - Yªn HiÓu Tr¸i", tbProp = {0,11,549,1,0,0}, nExpiredTime = 48*60},
	{szName = "MÆt n¹ - YÕn triÖu", tbProp = {0,11,550,1,0,0}, nExpiredTime = 48*60},
	{szName = "MÆt n¹ ChiÕu NhËt MiÖn", tbProp = {0,11,551,1,0,0}, nExpiredTime = 48*60},
	{szName = "MÆt n¹ DiÖu NhÊt", tbProp = {0,11,552,1,0,0}, nExpiredTime = 48*60},
	{szName = "MÆt n¹ §o¹n Méc Ly", tbProp = {0,11,553,1,0,0}, nExpiredTime = 48*60},
	{szName = "MÆt n¹ §­êng H¹o", tbProp = {0,11,554,1,0,0}, nExpiredTime = 48*60},
	{szName = "MÆt n¹ h»ng nga", tbProp = {0,11,555,1,0,0}, nExpiredTime = 48*60},		-- 60	
	{szName = "MÆt n¹ L¨ng Tiªu Tö", tbProp = {0,11,556,1,0,0}, nExpiredTime = 48*60},
	{szName = "MÆt n¹ LÖ ChiÕt Mai", tbProp = {0,11,557,1,0,0}, nExpiredTime = 48*60},
	{szName = "MÆt n¹ Xu©n Ng­u", tbProp = {0,11,558,1,0,0}, nExpiredTime = 48*60},
}

function showMask(nIndex, nPlayerIndex, nItemIndex)
	local szTitle = "Xin h·y lùa chän lo¹i mÆt n¹ mµ ng­¬i muèn"
	local tbOpt = {}
	local nMaskCount = getn(%tbMask)
	local nShowIndex = 0
	local nPerCount = 10
	
	nIndex = max(1, nIndex)
	nIndex = min(nIndex, nMaskCount)
	nShowIndex = nIndex
	
	for i=1,nPerCount do
		if nShowIndex > nMaskCount then
			break
		end
		tinsert(tbOpt, {%tbMask[nShowIndex].szName, queren, {nShowIndex, nPlayerIndex, nItemIndex}})
		nShowIndex = nShowIndex + 1	
	end
	
	tinsert(tbOpt, {"Trang tr­íc", showMask, {nIndex - nPerCount, nPlayerIndex, nItemIndex}})
	if nShowIndex + 1 < nMaskCount then
		tinsert(tbOpt, {"Trang kÕ ", showMask, {nShowIndex, nPlayerIndex, nItemIndex}})
	end
	tinsert(tbOpt, {"Rêi khái", cancel})
	
	CreateNewSayEx(szTitle, tbOpt)
end

function queren(nIndex, nPlayerIndex, nItemIndex)
	local nWidth = 1
	local nHeight = 1
	local nCount = 1
	if CountFreeRoomByWH(nWidth, nHeight, nCount) < nCount then
		Say(format("§Ó b¶o ®¶m tµi s¶n cña ®¹i hiÖp, xin h·y ®Ó trèng %d %dx%d hµnh trang", nCount, nWidth, nHeight))
		return 
	end
	
	if CallPlayerFunction(nPlayerIndex, IsMyItem, nItemIndex) ~= 1 then
		return 
	end
	if CallPlayerFunction(nPlayerIndex, RemoveItemByIndex, nItemIndex) ~= 1 then
		WriteLog("Hñy bá DÞ Dung BÝ ThuËt thÊt b¹i")
		return 
	end
	-- ÔùËÍÑ¡¶¨µÄÃæ¾ß
	CallPlayerFunction(nPlayerIndex, tbAwardTemplet.GiveAwardByList, tbAwardTemplet, %tbMask[nIndex], "Sö dông DÞ Dung BÝ ThuËt", 1)
end

function main(nItemIndex)
	showMask(1, PlayerIndex, nItemIndex)
	return 1
end