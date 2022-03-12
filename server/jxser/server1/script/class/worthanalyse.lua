--========ÎÄ¼þ¶¨Òå==================================--
--ÎÄ¼þÃû£ºworthanalyse.lua
--×÷Õß£ºyfeng
--´´½¨ÈÕÆÚ£º2005-1-25
--×îºóÐÞ¸ÄÈÕÆÚ£º2005-1-25
--¹¦ÄÜÐðÊö£º
--	½ÚÈÕ»î¶¯µÄ¼ÛÖµÁ¿·ÖÎöÏà¹ØÄÚÈÝ¡£Ö÷Òª·½·¨Îª£º
--	ÎÒÃÇÎªÃ¿¸ö½±Æ·±êÒ»¸ö¼ÛÖµÁ¿Worth(i)£¬ÔòÁî¸Ã¼ÛÖµÁ¿µÄ
--µ¹ÊýÎªÆä½±Æ·³öÏÖµÄ»ù±¾¸ÅÂÊÒò×Ó¡£Factor(i)£¬ÆäÖÐi±íÊ¾
--µÚi¸ö½±Æ·,Factor(i)±íÊ¾µÚi¸ö½±Æ·µÄ¸ÅÂÊÒò×Ó¡£
--	ÈôËùÓÐ½±Æ·µÄ¸ÅÂÊÒò×ÓµÄ×ÜºÍÎª£º
--	FactorCount = Factor(1)+Factor(2)+...+Factor(n)
--	ÄÇÃ´£¬BaseP(i) = Factor(i)/FactorCount±íÊ¾ÎªµÚi¸ö
--½±Æ·³öÏÖµÄ»ù±¾¸ÅÂÊ¡£
--	BasePCount = BaseP(1)+BaseP(2)+...+BaseP(n) = 1
--	ÏÖÔÚÍæ¼ÒÐèÒª¸¶³öÒ»¶¨µÄ¼ÛÖµÁ¿À´Ä±Çó½±Æ·£¬¼ÙÉèÍæ¼ÒËù
--¸¶³öµÄ¼ÛÖµÁ¿Îª£ºWorth£¬ÄÇÃ´WP(Worth,i)±íÊ¾ÎªÍæ¼ÒÓÃ
--¼ÛÖµÁ¿WorthµÃµ½µÚi¸ö½±Æ·µÄ¸ÅÂÊ¡£
--	ÎÒÃÇÈÃ<=WorthµÄ×î½Ó½ü¼ÛÖµÁ¿ÀñÆ·¼¯ºÏÖÐÈÎÑ¡jµÄ¸ÅÂÊÓÐ
--ËùÌáÉý£¬ÆäÌáÉýµÄ·ù¶ÈÓÉÔ­À´µÄBaseP(j)±äÎªWorthP(j)£¬
--Ôò£¬WP(Worth,j) = WorthP(j)
--ÔÚ´Ë£¬ÎÒÃÇ±ØÐë±£Ö¤WorthP(j) < 1
--ÎªÁË±£Ö¤¸ÅÂÊÊØºã£¬Ôò1-WorthP(j)µÄ¸ÅÂÊÐèÒª±»ÆäËû½±
--Æ·ÏûºÄµô¡£
--	ËùÒÔ£¬Áî³ýÈ¥Óëj½±Æ·¼ÛÖµÁ¿ÏàµÈµÄ½±Æ·¼¯ºÏÖ®ÍâµÄÆäËû
--½±Æ·µÄËùÓÐµÄ¸ÅÂÊÖ®ºÍÎª£º
--	LeavePCount = 1 - BaseP(j)
--ÔòÓÐÆäËû½±Æ·ÓÐWorth²úÉúµÄÐÂ¸ÅÂÊÎª
--	WorthP(i) = (1-WorthP(j))*BaseP(i)/LeavePCount  
--ÎÒÃÇ¼ÙÉèWorthPjCount ×ÜÄÜ³¬¹ýx%µÄ¸ÅÂÊ£¬ÄÇÃ´£¬
--	Ìá¹©Ëã·¨Ä£ÐÍ£º
--	µ±Min(Worth-Worth(j))>=0 ´æÔÚ£¬Ôò
--	1:	WorthP(j) = BaseP(j)*(100-x)/100 + x/100
--	2:	WorthP(i) = (1-WorthP(j)*BaseP(i)/LeavePCount
--Ê½1¡¢2¾ÍÊÇWP(Worth,n)µÄ±íÏÖÐÎÊ½
--
--ÓÎÏ·½Å±¾¡¤½£ÏÀÇéÔµÍøÂç°æ
--½ðÉ½Èí¼þ¹É·ÝÓÐÏÞ¹«Ë¾£¬copyright 1992-2005
--==================================================--
--DEBUG = 1

if not WORTHANALYSE_HEAD then
WORTHANALYSE_HEAD =1

Include("\\script\\lib\\mem.lua")
Include("\\script\\class\\lerror.lua")


--========Àà¶¨Òå====================================--
--ÀàÃû£ºWorthAnalyse
--×÷Õß£ºyfeng
--´´½¨ÈÕÆÚ£º2005-1-25
--×îºóÐÞ¸ÄÈÕÆÚ£º2005-1-25
--¹¦ÄÜÐðÊö£º
--	¸ÃÀàÓÃÓÚ´¦Àí°´ÕÕ¼ÛÖµÁ¿·¢½±µÄÏà¹Ø²Ù×÷¡£
--³ÉÔ±±äÁ¿£º
--	__maxP£º·ûºÏ³É¹¦µÄ¸ÅÂÊ£¬¼´x%
--	__worth£º¼ÛÖµÁ¿ÁÐ±í
--	__factors£º¸ÅÂÊÒò×ÓÁÐ±í£¬ÆäÎªÒ»¸öÊý×é£¬Êý×éµÄË÷Òý
--¶ÔÓ¦Ïà¹Ø¼ÛÖµÁ¿µÄÎïÆ·Ë÷Òý£¬ÆäÖµÎª¸ÅÂÊÒò×Ó¡£
--	__factorCount£º¸ÅÂÊÒò×Ó×ÜºÍ
--	__baseP£ºÎïÆ·¸ù¾Ý¸ÅÂÊÒò×ÓµÄ»ù±¾¸ÅÂÊÁÐ±í
--	__worthP£ºÎïÆ·¸ù¾ÝWorth±ä»»ºóµÄ¸ÅÂÊÁÐ±í
--	__concern£º½Ó½ü¸ø³ö¼ÛÖµÁ¿WorthµÄÏîÄ¿
--	__leavePC£ºÊ£ÓàÎïÆ·µÄ¸ÅÂÊ×ÜºÍ
--³ÉÔ±º¯Êý£º
--	:addWorth(idx,worth)£º¼ÓÈëµÚidxÎïÆ·µÄ¼ÛÖµÁ¿
--	:makeBaseP()£ºÉú³É»ù±¾¸ÅÂÊÁÐ±í
--	:makeWorthP(worth)£º¸ù¾ÝworthÉú³ÉÐÂµÄ¸ÅÂÊÁÐ±í
--	:getFromBase()£º´Ó»ù±¾¸ÅÂÊ±íÖÐÑ¡³öÒ»¸öÎïÆ·
--	:getFromWorth()£º´ÓWorth±íÖÐÑ¡³öÒ»¸öÎïÆ·
--ÓÃÀý£º
--
--
--
--==================================================--
WorthAnalyse = inherit(LError,{
	__factorCount = 0,
	__maxP = 50,

--========º¯Êý¶¨Òå==================================--
--º¯ÊýÔ­ÐÎ£º:__new(maxP)
--×÷Õß£ºyfeng
--´´½¨ÈÕÆÚ£º2005-2-1
--×îºóÐÞ¸ÄÈÕÆÚ£º2005-2-1
--¹¦ÄÜÐðÊö£º
--	¹¹Ôìº¯Êý£¬²¢³õÊ¼»¯maxP
--²ÎÊý£º
--	maxP£ºÃüÖÐÏîÄ¿µÄ¼ÛÖµÁ¿ÌáÉý¸ÅÂÊ²»Ð¡ÓÚ´ËÖµ£¬Èç¹û²»Ð´
--´ËÖµ£¬ÔòmaxP = 50
--·µ»ØÖµ£º
--	ÎÞ
--ÓÃÀý£º
--	ÎÞ
--==================================================--
	__new = function(self,arg)
		if(not arg) then return end
		if(not arg[1]) then return end
		if(arg[1]<=0) then return end
		if(arg[1]>100) then
			self.__maxP = 100
			return
		end
		self.__maxP = arg[1]
		return
	end,
	
--========º¯Êý¶¨Òå==================================--
--º¯ÊýÔ­ÐÎ£º:addWorth
--×÷Õß£ºyfeng
--´´½¨ÈÕÆÚ£º2005-1-25
--×îºóÐÞ¸ÄÈÕÆÚ£º2005-1-25
--¹¦ÄÜÐðÊö£º
--	¸øË÷ÒýidxÔö¼ÓÒ»¸ö¼ÛÖµÁ¿£¬²¢¼ÆËãÆäÏàÓ¦µÄ¸ÅÂÊÒò×Ó£¬
--µ±Á¬ÐøÊ¹ÓÃ¸Ãº¯ÊýÔö¼Ó¼ÛÖµÁ¿µÄÊ±ºò£¬Ë÷ÒýºÅ×îºÃÊÇ´Ó1¿ª
--Ê¼µÄÁ¬ÐøºÅ£¬ÒÔ±£Ö¤Ð§ÂÊºÍÕýÈ·ÐÔ£¬µ±¼ÛÖµÁ¿Îªnil»ò0Ê±£¬
--Æä¸ÅÂÊÒò×ÓÎª0£¬¸ÅÂÊÒò×ÓÎª0µÄÏîÄ¿²»»á±»getFromXXXº¯
--Êý»ñÈ¡µ½¡£
--²ÎÊý£º
--	idx£ºË÷ÒýºÅ£¬ÕûÊý
--	worth£º¼ÛÖµÁ¿´óÓÚ0µÄÕûÊý£¬Èç¹û¸Ã²ÎÊýÎªnil£¬ÔòÄ¬ÈÏÎª0
--·µ»ØÖµ£º
--	³ö´íÎªnil£¬·ñÔòÎª1
--ÓÃÀý£º
--	local myworth = new(WorthAnalyse)
--	for i=1,100 do
--		wroth:addWorth(i,i)
--	end
--==================================================--
	addWorth = function(self,idx,worth)
		if(not worth) then worth = 0 end
		--´ËÔËËãÉæ¼°È¡µ¹Êý£¬ËùÒÔ²»ÄÜÐ¡Êý,0±»ÌØÊâ´¦Àí
		if(worth>0 and worth < 1) then
			self:__notify(1000,"gi¸ trÞ biÕn l­îng kh«ng thÓ lµ sè thËp ph©n")
			return nil
		end
		if(not self.__worth) then
			self.__worth = {}
			self.__factors={}
		end
		if(not self.__worth[idx]) then --´ËÏîÉÐÎÞÈÎºÎ¼ÛÖµÁ¿
			self.__worth[idx] = worth
			if(worth == 0) then
				self.__factors[idx] = 0
			else
				self.__factors[idx] = 1/worth --ÔÚ´ËÊ±¼ÆËã¸ÅÂÊÒò×Ó
				self.__factorCount = self.__factorCount + 1/worth --ÔÚ´ËÊ±¼ÆËã__factorCount
			end
		else --´ËÏîÒÑÓÐ¼ÛÖµÁ¿£¬
			self.__factorCount = self.__factorCount - self.__factors[idx]
			self.__worth[idx] = worth
			if(worth == 0) then
				self.__factors[idx] = 0
			else
				self.__factors[idx] = 1/worth
				self.__factorCount = self.__factorCount + 1/worth
			end
		end
		self.__baseP = nil
		return 1
	end,
	
--========º¯Êý¶¨Òå==================================--
--º¯ÊýÔ­ÐÎ£º:makeBaseP
--×÷Õß£ºyfeng
--´´½¨ÈÕÆÚ£º2005-1-25
--×îºóÐÞ¸ÄÈÕÆÚ£º2005-1-25
--¹¦ÄÜÐðÊö£º
--	ÓÉ¸ÅÂÊÒò×Ó¼ÆËãÈ¡µÃ»ù±¾¸ÅÂÊ£¬²¢±£´æµ½__basePÖÐ¡£´Ë
--²Ù×÷Ò»¶¨ÒªÔÚËùÓÐ:addFactorÖ®ºó²ÅÄÜÊ¹ÓÃ£¬ÒÔ±£Ö¤ÕýÈ·ÐÔ£¬
--·ñÔò£¬getFromXXXÏµÁÐº¯Êý½«»á²»³É¹¦¡£
--²ÎÊý£º
--	ÎÞ
--·µ»ØÖµ£º
--	Ê§°ÜÎªnil£¬³É¹¦Îª1
--ÓÃÀý£º
--
--
--
--==================================================--
	makeBaseP = function(self)
		if(not self.__worth) then
			self:__notify(100,"no any worth.")
			return nil
		end
		if(not self.__baseP) then
			self.__baseP = {}
			for i = 1,getn(self.__factors) do
				if(self.__factors[i]) then
					self.__baseP[i] = self.__factors[i]/self.__factorCount
				else --nil
					self.__baseP[i] = 0
				end
			end
		end
		return 1
	end,

--========º¯Êý¶¨Òå==================================--
--º¯ÊýÔ­ÐÎ£º:makeWorthP
--×÷Õß£ºyfeng
--´´½¨ÈÕÆÚ£º2005-1-25
--×îºóÐÞ¸ÄÈÕÆÚ£º2005-1-25
--¹¦ÄÜÐðÊö£º
--	¸ù¾ÝworthÖØÐÂ¼ÆËã__basePÖÐµÄ¸ÅÂÊ£¬²¢´æ·Åµ½__worthP
--ÖÐ¡£¾­¹ýÕûÀíºóµÄ__worthP»á½«Óë½öÐ¡ÓÚµÈÓÚworthµÄÏîÄ¿
--¸ÅÂÊµ÷Õû³¬¹ý50%¡£×¢Òâ£¬Ö´ÐÐ´Ëº¯ÊýÖ®Ç°£¬Ò»¶¨ÒªÏÈÖ´ÐÐ
--:makeBaseP()£¬·ñÔò£¬Ö´ÐÐ¸Ãº¯Êý½«»áÊ§°Ü
--²ÎÊý£º
--	worth£º¼ÛÖµÁ¿£¬´ËÊý²»ÄÜÎª0»ònil
--·µ»ØÖµ£º
--	Ê§°ÜÎªnil£¬³É¹¦Îª1
--ÓÃÀý£º
--
--
--
--==================================================--
	makeWorthP = function(self,worth)
		if(not self.__baseP) then
			self:__notify(100,"no any baseP.")
			return nil
		end
		local concern = nil --³õÊ¼Öµ
		for i=1,getn(self.__worth) do
			if(worth >= self.__worth[i]) then --i¿ÉÄÜÊÇÎÒÃÇÒªÕÒµÄ×î½Ó½üworthµÄÏî
				if(not concern) then --»¹Ã»ÓÐ×îÐ¡Ïî
					concern={i} --½ö<=worthµÄ¼¯ºÏÖÐµÄ×î´óÏîÔÝÊ±ÊÇi
				else
					if(self.__worth[i] > self.__worth[concern[1]]) then  --¸ÃÏî¸ü´ó£¬µ«<=worth
						concern = {i} --ÖØÖÃ__concern
					elseif(self.__worth[i] == self.__worth[concern[1]]) then
						concern[getn(concern)+1] = i
					end
				end
			end
		end
		if(not concern) then --Ã»ÓÐÐ¡ÓÚµÈÓÚworthµÄÏî,__worthP = __baseP
			self.__worthP = self.__baseP
			return 1
		end
		self.__concern = concern[random(getn(concern))] --Ëæ»úÑ¡È¡Âú×ãÌõ¼þµÄÈÎÒâÏî£¬ÌáÉýÆä¸ÅÂÊ
		self.__leavePC = 1 - self.__baseP[self.__concern]
		--Éú³É__worthP
		self.__worthP = {}
		--	1:	WorthP(j) = BaseP(j)*(100-x)/100 + x/100
		self.__worthP[self.__concern] = self.__maxP/100 + self.__baseP[self.__concern]*(100-self.__maxP)/100
		for i=1,getn(self.__baseP) do
			if(i~=self.__concern) then  --iÊÇ¸ÅÂÊ±»ÌáÉýÏî
				--	2:	WorthP(i) = (1-WorthP(j))*BaseP(i)/LeavePCount
				self.__worthP[i] =  (1-self.__worthP[self.__concern])*self.__baseP[i]/self.__leavePC
			end
		end --endfor i
		return 1
	end,

--========º¯Êý¶¨Òå==================================--
--º¯ÊýÔ­ÐÎ£º:getFromBase
--×÷Õß£ºyfeng
--´´½¨ÈÕÆÚ£º2005-1-26
--×îºóÐÞ¸ÄÈÕÆÚ£º2005-1-26
--¹¦ÄÜÐðÊö£º
--	´Ó»ù±¾¸ÅÂÊ±íÖÐËæ»ú³éÈ¡Ò»¸öÏîÄ¿¡£
--²ÎÊý£º
--	ÎÞ
--·µ»ØÖµ£º
--	Èç¹û³É¹¦£¬·µ»ØÏîÄ¿±àºÅ£¬·ñÔò·µ»Ønil
--ÓÃÀý£º
--	ÎÞ
--==================================================--
	getFromBase = function(self)
		if(not self.__baseP) then
			self:__notify(300,"B¶ng x¸c xuÊt c¬ b¶n kh«ng tån t¹i..")
			return nil
		end
		local rnd = random()
		local p = 0
		for i=1,getn(self.__baseP) do
			p = p + self.__baseP[i]
			if(rnd <= p and self.__worth[i]~=0) then
				return i
			end
		end
		self:__notify(500,"Kh«ng thÓ chän ra h¹ng môc thÝch hîp.")
		return nil
	end,

--========º¯Êý¶¨Òå==================================--
--º¯ÊýÔ­ÐÎ£ºgetFromWorth
--×÷Õß£ºyfeng
--´´½¨ÈÕÆÚ£º2005-1-26
--×îºóÐÞ¸ÄÈÕÆÚ£º2005-1-26
--¹¦ÄÜÐðÊö£º
--	´Ó¼ÛÖµ¸ÅÂÊ±íÖÐ£¬Ëæ»úÑ¡È¡Ò»¸öÏîÄ¿£¬¼ÛÖµ¸ÅÂÊ±íÊÇ¸ú¾Ý
--¸øÓëµÄ¼ÛÖµÁ¿worthËã³öÀ´µÄ£¬ËùÒÔ£¬Ö´ÐÐ´Ëº¯ÊýÖ®Ç°£¬ÖÁÉÙ
--ÐèÒªÖ´ÐÐÒ»´Î:makeWorthP(worth)£¬Ôò£¬ÔÚmakeWorthPÖ®ºó
--µÄgetFromWorth¶¼ÊÇ´ÓworthËã³öÀ´µÄ¼ÛÖµ¸ÅÂÊ±íÖÐ»ñÈ¡µ½µÄ
--ÏîÄ¿¡£
--²ÎÊý£º
--	worth£º¼ÛÖµÁ¿£¬¸Ã²ÎÊý½«»á°Ñ¼ÛÖµÁ¿±íÖÐÐ¡ÓÚµÈÓÚÇÒÓëËû
--×î½Ó½üµÄ¼ÛÖµÁ¿µÄÏîÄ¿¸ÅÂÊÌáÉýµ½50%ÒÔÉÏ
--·µ»ØÖµ£º
--	Èç¹û³É¹¦,Ôò·µ»ØÑ¡ÔñµÄÏîÄ¿±àºÅ,·ñÔò·µ»Ønil
--ÓÃÀý£º
--	ÎÞ
--==================================================--
	getFromWorth = function(self)
		if(not self.__worthP) then
			self:__notify(400,"have no baseP.")
			return nil
		end
		local rnd = random()
		local p = 0
		for i=1,getn(self.__baseP) do
			p = p + self.__worthP[i]
			if(rnd <= p and self.__worth[i]~=0) then
				return i
			end
		end
		self:__notify(500,"Kh«ng thÓ chän ra h¹ng môc thÝch hîp.")
		return nil
	end,

})

--eg.
--Include("script/lib/string.lua")
--local myworth = new(WorthAnalyse)
--for i=1,200 do
--	myworth:addWorth(i,random(200000))
--end
--myworth:makeBaseP()
--h = openfile("settings/tmp.txt","w")
--for i=1,1000 do
--	local worth = random(200000)
--	myworth:makeWorthP(worth)
--	local idx = myworth:getFromWorth()
--	if(idx) then
--		local arr = {
--			worth,myworth.__worth[idx],myworth.__worthP[idx]
--		}
--		write(h,join(arr,"\t").."\n")
--		flush(h)
--	end
--end
--closefile(h)

end
