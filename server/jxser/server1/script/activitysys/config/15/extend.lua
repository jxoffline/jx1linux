Include("\\script\\activitysys\\config\\15\\head.lua")
Include("\\script\\activitysys\\config\\15\\variables.lua")
Include("\\script\\flipcard\\flipcard_gs.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\log.lua")
pActivity.nPak = curpack()

function pActivity:FlipCardCallBack(nIndex)
	if self:CheckTaskDaily(%TSKI_BOX_OPEN_NUM,%MAX_USE_LIMIT_BOX,"H«m nay ®¹i hiÖp ®· më 200 « råi, ngµy mai l¹i tiÕp tôc nhÐ.","<") and
	PlayerFunLib:CheckCash(%nConsumeMoney,"TiÒn ®¹i hiÖp mang theo kh«ng ®ñ råi, mang tiÒn ®Çy ®ñ råi h½ng ®Õn.") and
	PlayerFunLib:CheckFreeBagCell(1,"Hµnh trang cña c¸c h¹ kh«ng ®ñ « trèng, h·y s¾p xÕp l¹i råi h½ng ®Õn.") then
		
		local funCallBack = function(nItemIndex)
			local nCount = GetItemStackCount(nItemIndex)
			local nG, nD, nP = GetItemProp(nItemIndex)
			%tbFlipCard:SetItem(%nIndex, {nCount, nG, nD, nP})
		end
		local tbAward = {
			[1]={szName=%tbMaterail_1.szName, tbProp=%tbMaterail_1.tbProp, nExpiredTime=%tbMaterail_1.nExpiredTime, nRate = 10, nCount = 2,CallBack=funCallBack},
			[2]={szName=%tbMaterail_1.szName, tbProp=%tbMaterail_1.tbProp, nExpiredTime=%tbMaterail_1.nExpiredTime, nRate = 7, nCount = 4,CallBack=funCallBack},
			[3]={szName=%tbMaterail_1.szName, tbProp=%tbMaterail_1.tbProp, nExpiredTime=%tbMaterail_1.nExpiredTime, nRate = 6, nCount = 6,CallBack=funCallBack},
			[4]={szName=%tbMaterail_1.szName, tbProp=%tbMaterail_1.tbProp, nExpiredTime=%tbMaterail_1.nExpiredTime, nRate = 5, nCount = 8,CallBack=funCallBack},
			[5]={szName=%tbMaterail_1.szName, tbProp=%tbMaterail_1.tbProp, nExpiredTime=%tbMaterail_1.nExpiredTime, nRate = 5, nCount = 10,CallBack=funCallBack},
			[6]={szName=%tbMaterail_4.szName, tbProp=%tbMaterail_4.tbProp, nExpiredTime=%tbMaterail_4.nExpiredTime, nRate = 10, nCount = 2,CallBack=funCallBack},
			[7]={szName=%tbMaterail_4.szName, tbProp=%tbMaterail_4.tbProp, nExpiredTime=%tbMaterail_4.nExpiredTime, nRate = 7, nCount = 4,CallBack=funCallBack},
			[8]={szName=%tbMaterail_4.szName, tbProp=%tbMaterail_4.tbProp, nExpiredTime=%tbMaterail_4.nExpiredTime, nRate = 6, nCount = 6,CallBack=funCallBack},
			[9]={szName=%tbMaterail_4.szName, tbProp=%tbMaterail_4.tbProp, nExpiredTime=%tbMaterail_4.nExpiredTime, nRate = 5, nCount = 8,CallBack=funCallBack},
			[10]={szName=%tbMaterail_4.szName, tbProp=%tbMaterail_4.tbProp, nExpiredTime=%tbMaterail_4.nExpiredTime, nRate = 5, nCount = 10,CallBack=funCallBack},
			[11]={szName=%tbMaterail_5.szName, tbProp=%tbMaterail_5.tbProp, nExpiredTime=%tbMaterail_5.nExpiredTime, nRate = 10, nCount = 2,CallBack=funCallBack},
			[12]={szName=%tbMaterail_5.szName, tbProp=%tbMaterail_5.tbProp, nExpiredTime=%tbMaterail_5.nExpiredTime, nRate = 7, nCount = 4,CallBack=funCallBack},
			[13]={szName=%tbMaterail_5.szName, tbProp=%tbMaterail_5.tbProp, nExpiredTime=%tbMaterail_5.nExpiredTime, nRate = 6, nCount = 6,CallBack=funCallBack},
			[14]={szName=%tbMaterail_5.szName, tbProp=%tbMaterail_5.tbProp, nExpiredTime=%tbMaterail_5.nExpiredTime, nRate = 5, nCount = 8,CallBack=funCallBack},
			[15]={szName=%tbMaterail_5.szName, tbProp=%tbMaterail_5.tbProp, nExpiredTime=%tbMaterail_5.nExpiredTime, nRate = 6, nCount = 10,CallBack=funCallBack},			
		} 	
		self:OpenBox(tbAward)
	end
end

-- ´ò¿ª·­ÅÆ½çÃæ
function pActivity:OpenUI()
	%tbFlipCard:OpenUI(self.FlipCardCallBack, {self})
end

-- Ëæ»ú»ñÈ¡½±Àø
function pActivity:GetIndexByRandom(tbItem)
	if tbItem == nil then
		return nil
	end
	local rtotal = 10000000
	local rcur=random(1,rtotal);
	local rstep=0;
	for i=1,getn(tbItem) do
		rstep=rstep+floor(tbItem[i].nRate*rtotal/100);
		if(rcur <= rstep) then
			return i  -- ·µ»ØÎïÆ·µÄÏÂ±ê
		end
	end
end

-- ¹ö¶¯¹«¸æ
function pActivity:BroadCast(szPlayerName, szAwardType, szAwardName)
	AddGlobalNews("Chóc mõng <color=red>"..szPlayerName.."<color>§¹i hiÖp tõ <color=red>"..szAwardType.."<color>§· nhËn ®­îc <color=red>"..szAwardName.."<color>")
end

-- ´ò¿ª¿ò¸ñ
function pActivity:OpenBox(tbAward)
	self:AddTaskDaily(%TSKI_BOX_OPEN_NUM,1) -- Ôö¼Ó·­ÅÆÊýÁ¿
	Pay(%nConsumeMoney)  -- ¿Û³ý½£ÏÀ±Ò
	-- ½±Àø¾­Ñé
	PlayerFunLib:AddExp(%EXP_OPEN_BOX, 1)
	-- ½±Àø²ÄÁÏ
	PlayerFunLib:GetItem(tbAward, 1)
	-- ´ïµ½200¸ö£¬ÏµÍ³¹«¸æÌáÐÑ
	if self:GetTaskDaily(%TSKI_BOX_OPEN_NUM) == %MAX_USE_LIMIT_BOX then 
		Msg2Player(format("H«m nay ®¹i hiÖp ®· më %d «, ngµy mai l¹i ®Õn nhÐ", %MAX_USE_LIMIT_BOX))
	end
end

-- Ê¹ÓÃ½±ÀøÎïÆ·
function pActivity:UseAward1(nExp)
	-- ½±Àø¾­Ñé
	PlayerFunLib:AddExp(nExp, 1, %EVENT_LOG_TITLE, "SuDungQuocKhanhVang")  
	-- ½±ÀøµÀ¾ß
	local nCurrentNum = self:GetTask(%TSKI_AWARD_NUM_1)
	local tbAward = self.tbAward["award_a"]
	local nAwardIndex = self:GetIndexByRandom(tbAward)
	if nAwardIndex then
		local tbAwardItem = tbAward[nAwardIndex]
		PlayerFunLib:GetItem(tbAwardItem, 1, %EVENT_LOG_TITLE, "SuDungQuocKhanhVang")
		if tbAwardItem.bBroadcast then
			self:BroadCast(GetName(), %tbAward_1.szName, tbAwardItem.szName)
		end
	end  
	if nCurrentNum == %MAX_USE_LIMIT_AWARD_1 then -- ´ïµ½2000¸ö£¬Ê¹ÓÃ½±Àø±íC
		Msg2Player(format("Ho¹t ®éng lÇn nµy ®¹i hiÖp sö dông %s ®¹t ®Õn %d c¸I, kh«ng thÓ tiÕp tôc sö dông", %tbAward_1.szName, %MAX_USE_LIMIT_AWARD_1))
	end
end

function pActivity:UseAward2(nExp)
	-- ½±Àø¾­Ñé
	PlayerFunLib:AddExp(nExp, 1)       
	-- ½±ÀøµÀ¾ß
	local nCurrentNum = self:GetTask(%TSKI_AWARD_NUM_2)
	local tbAward = {}
	if mod(nCurrentNum, 100) == 0 then         -- ´ïµ½100¡¢200µÈN°Ù¸ö£¬Ê¹ÓÃ½±Àø±íC
		tbAward = self.tbAward["award_c"]
		%tbLog:PlayerActionLog(%EVENT_LOG_TITLE, "SuDungQuocKhanhDo"..nCurrentNum.."Lan")
	else                                  -- ÆäËüÇé¿öÊ¹ÓÃ½±Àø±íB
		tbAward = self.tbAward["award_b"]
	end
	local nAwardIndex = self:GetIndexByRandom(tbAward)
	if nAwardIndex then
		local tbAwardItem = tbAward[nAwardIndex]
		PlayerFunLib:GetItem(tbAwardItem, 1,%EVENT_LOG_TITLE, "SuDungQuocKhanhDo")
		if tbAwardItem.bBroadcast then
			self:BroadCast(GetName(), %tbAward_2.szName, tbAwardItem.szName)
		end
	end
	--Special award
	local tbTmpSpecial = self.tbAward["award_special"]
	if tbTmpSpecial[nCurrentNum] then
		local tbTmpSpecial2 = tbTmpSpecial[nCurrentNum]
		PlayerFunLib:GetItem(tbTmpSpecial2, 1, %EVENT_LOG_TITLE, "SuDungQuocKhanhDo"..nCurrentNum.."Lan_DB")
		if tbTmpSpecial2.bBroadcast then
			self:BroadCast(GetName(), %tbAward_2.szName, tbTmpSpecial2.szName)
		end
	end
	if nCurrentNum == %MAX_USE_LIMIT_AWARD_2 then -- ´ïµ½2000¸ö£¬Ê¹ÓÃ½±Àø±íC
		Msg2Player(format("Ho¹t ®éng lÇn nµy ®¹i hiÖp sö dông %s ®¹t ®Õn %d c¸I, kh«ng thÓ tiÕp tôc sö dông", %tbAward_2.szName, %MAX_USE_LIMIT_AWARD_2))
	end
end

