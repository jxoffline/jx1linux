

TKID_NEWBIE_BONUS = 610		--ÊÇ·ñ·¢½±±êÖ¾
TKID_NEWBIE_CANCLE = 604		--´ËÈÎÎñ±äÁ¿ÓÃÓÚ´æ·ÅÁ¬ĞøÈ¡ÏûÈÎÎñµÄÊıÁ¿

Bonus = {
	SetBonusFlag = function(tasklvl) --ÉèÖÃ½±Àø±êÊ¶£¬²¢·µ»Ø½±Àø±êÊ¶
		local flag = 1 --0x0001 ±íÊ¾ĞèÒª·¢ÆÕÍ¨½±Àø
		if(GetTask(TKID_NEWBIE_SUCCED)>19) then
			flag = flag + 256 --0x0100 ±íÊ¾ĞèÒª·¢Ò»ÂÖµÄ½±Àø
		end
		SetTask(TKID_NEWBIE_BONUS,flag)
		return flag
	end,
	PayExp = function(self,tasklvl) --½±Àø¾­ÑéÖµ£¬²¢Çå³ıÆÕÍ¨½±ÀøµÄ¾­Ñé
		local lspan,rspan = self[tasklvl]["Exp"][1],self[tasklvl]["Exp"][2]
		local flag = GetTask(TKID_NEWBIE_BONUS)
		AddOwnExp(random(lspan,rspan))
		flag = floor(flag/256) * 256
		SetTask(TKID_NEWBIE_BONUS,flag)
		return 1
	end,
	PayGold = function(self,tasklvl) --½±Àø½ğÇ®
		local lspan,rspan = self[tasklvl]["Gold"][1],self[tasklvl]["Gold"][2]
		local flag = GetTask(TKID_NEWBIE_BONUS)
		Earn(random(lspan,rspan))
		flag = floor(flag/256) * 256
		SetTask(TKID_NEWBIE_BONUS,flag)
		return 1
	end,
	PayChance = function(self,tasklvl) --½±ÀøÈ¡ÏûÈÎÎñµÄ»ú»á
		local flag = GetTask(TKID_NEWBIE_BONUS)
		SetTask(TKID_NEWBIE_CANCLE,GetTask(TKID_NEWBIE_CANCLE)+1)
		flag = floor(flag/256) * 256
		SetTask(TKID_NEWBIE_BONUS,flag)
		return 1
	end,
	PayCircle = function(self,tasklvl) --Íê³É1ÂÖÈÎÎñµÄ½±Àø
		flag = GetTask(TKID_NEWBIE_BONUS)
		SetTask(TKID_FUYUAN,GetTask(TKID_FUYUAN)+10) --½±Àø10µã¸£Ôµ
		flag = mod(flag,256)
		SetTask(TKID_NEWBIE_BONUS,flag)
		return 1
	end,
	PaySpecial = function(self,tasklvl) --ÌØÊâ½±Àø
		local succed = NewbieTask.GetSucced()
		local additiveRate = 10 + succed
		local targetRate = random(1,10000000)
		local special = self.Special[tasklvl]
		local span = 0
		for i=1,getn(special) do
			span = span + special[i][3] + floor(special[i][3]*additiveRate/10000000)
			if(targetRate <= span) then --ÖĞ´ó½±
				local bonuFlag = special[i][1]
				if(bonuFlag==BONUSFLAG_ITEM) then -- ·¢ÎïÆ·
					AddItem(special[i][4],special[i][5],special[i][6],1,0,0,0,0)
					WriteLog(date("%H%M%S")..": Tµi kho¶n:"..GetAccount()..", nh©n vËt:"..GetName()..", ®¹t ®­îc:"..special[i][2])
					return special[i]
				elseif(bonuFlag == BONUSFLAG_EXP) then --½±¾­Ñé
					AddOwnExp(special[i][4])
					WriteLog(date("%H%M%S")..": Tµi kho¶n:"..GetAccount()..", nh©n vËt:"..GetName()..", ®¹t ®­îc:"..special[i][2])
					return special[i]
				elseif(bonuFlag == BONUSFLAG_GOLDEN) then --»Æ½ğ×°±¸
					AddGoldItem(0,special[i][4])
					WriteLog(date("%H%M%S")..": Tµi kho¶n:"..GetAccount()..", nh©n vËt:"..GetName()..", ®¹t ®­îc:"..special[i][2])
					return special[i]
				else
					print(" phÇn th­ëng")
					WriteLog(date("%H%M%S")..": Tµi kho¶n:"..GetAccount()..", nh©n vËt:"..GetName()..", kh«ng râ nguyªn nh©n, kh«ng thÓ nhËn ®­îc phÇn th­ëng.")
					return nil
				end
			end
		end
		return nil
	end,
}

