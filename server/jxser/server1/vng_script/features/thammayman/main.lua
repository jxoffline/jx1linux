Include("\\script\\lib\\log.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\activitysys\\npcdailog.lua")
Include("\\vng_script\\vng_lib\\reset_daily_task.lua")
Include("\\vng_script\\features\\thammayman\\head.lua")

function main()	
	if tbVngThamMayMan:IsOpen() ~= 1 then
		return Talk(1,"","§ît Th¨m may m¾n nµy ®· kÕt thóc, h·y chê ®ît tíi nhÐ!")
	end
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)	
		
	--kiem tra reset daily
	tbCheckTaskDaily2ReSet:OnLogin()
	local nCurExp= tbVngThamMayMan:GetTodayExp()
	local nCurUseTMM_1000  = tbVNG_BitTask_Lib:getBitTask(tbVngThamMayMan.BITTASK_USE_TMN_1000)
	local nCurValue  = tbVNG_BitTask_Lib:getBitTask(tbVngThamMayMan.BITTASK_USE_TOTAL) 
	local nTotalUse = nCurValue*1000 + nCurUseTMM_1000
	
	tbDailog.szTitleMsg =  format("<npc><color=yellow>Th¨m May M¾n<color>  Chøa rÊt nhiÒu phÇn th­ëng quý hiÕm, c¸c h¹ cã muèn thö vËn may m×nh kh«ng?!\n Tæng sè Th¨m May M¾n sö dông: <color=yellow>%d<color>.\n Sè Th¨m May M¾n sö dông nhËn mèc 1000: <color=yellow>%d / 1000<color>.\n Sè ®iÓm kinh nghiÖm h«m nay ®· nhËn: <color=yellow>%d<color>.\n",nTotalUse,nCurUseTMM_1000,nCurExp)
	tbDailog:AddOptEntry("Ta muèn nhËn phÇn th­ëng gi¶i 1 ", tbVngThamMayMan.GetAwardTMM, {tbVngThamMayMan,1} )
	tbDailog:AddOptEntry("Ta muèn nhËn phÇn th­ëng gi¶i 2 ", tbVngThamMayMan.GetAwardTMM, {tbVngThamMayMan,2} )
	tbDailog:AddOptEntry("Ta muèn nhËn phÇn th­ëng gi¶i 3 ", tbVngThamMayMan.GetAwardTMM, {tbVngThamMayMan,3} )
	tbDailog:AddOptEntry("Ta muèn nhËn phÇn th­ëng mèc 5000", tbVngThamMayMan.GetAwardMoc, {tbVngThamMayMan,5} )
	tbDailog:AddOptEntry("Ta muèn nhËn phÇn th­ëng mèc 10000 ", tbVngThamMayMan.GetAwardMoc, {tbVngThamMayMan,10} )
	tbDailog:AddOptEntry("Ta muèn nhËn phÇn th­ëng mèc 15000", tbVngThamMayMan.GetAwardMoc, {tbVngThamMayMan,15} )
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	tbDailog:Show()	
end
--nhan thuong giai 1,2,3
function tbVngThamMayMan:GetAwardTMM(nPrize)
	local nNumPrize =  tbVNG_BitTask_Lib:getBitTask(self.BITTASK_WIN)
	if nNumPrize == 0 or nNumPrize ~= nPrize then
		return Talk(1,"",format("C¸c h¹ kh«ng tróng gi¶i th­ëng %d nµy. H·y sö dông Th¨m May M¾n ®Ó cã c¬ héi tróng th­ëng.",nPrize))
	end
	tbVNG_BitTask_Lib:setBitTask(self.BITTASK_WIN, 0)
	tbAwardTemplet:Give(self.AwardItem[nPrize],1,{self.EVENT_LOG_TITLE,"NhanThuongGiai: "..nPrize})	
	Msg2Player(format("<color=yellow>NhËn ®­îc phÇn th­ëng gi¶i: %d<color>",nPrize))
end

--Nhan phan thuong Moc
function tbVngThamMayMan:GetAwardMoc(nPoint)	
	if not nPoint or not self.BITTASK_LIMIT_MOC[nPoint] then
		return
	end
	if not tbVNG_BitTask_Lib:CheckBitTaskValue(self.BITTASK_USE_TOTAL, nPoint, format("C¸c h¹ ch­a sö dông ®ñ: %d  Th¨m May M¾n.",nPoint*1000), ">=") then
		return
	end
	if not tbVNG_BitTask_Lib:CheckBitTaskValue(self.BITTASK_LIMIT_MOC[nPoint], 1, format("C¸c h¹ ®· nhËn th­ëng mèc: %d  Th¨m May M¾n råi.",nPoint*1000), "<") then
		return
	end
	tbVNG_BitTask_Lib:setBitTask(self.BITTASK_LIMIT_MOC[nPoint], 1)
	tbAwardTemplet:Give(self.AwardLimitTMM,1,{self.EVENT_LOG_TITLE,"NhanThuongMoc: "..nPoint*1000})
	Talk(1,"",format("Chóc mõng c¸c h¹ nhËn ®­îc phÇn th­ëng mèc %d.",nPoint*1000))
	Msg2Player(format("Chóc mõng c¸c h¹ nhËn ®­îc phÇn th­ëng mèc %d.",nPoint*1000))
end
--Kiem tra gioi han exp 1 ngay
function tbVngThamMayMan:GetTodayExp()
	local nCurExp =  tbVNG_BitTask_Lib:getBitTask(self.BITTASK_LIMIT_EXP_DAILY)
	return nCurExp*FACTOR
end

--Reset Exp nhan moi ngay
function tbVngThamMayMan:ResetExpDaily()
	 tbVNG_BitTask_Lib:setBitTask(self.BITTASK_LIMIT_EXP_DAILY, 0)
end

function tbVngThamMayMan:IsOpen()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"));
	if (nCurDate >= self.nStartDate and nCurDate < self.nEndDate) then
		return 1
	else
		return 0
	end
end
--Load du lieu quest
function tbVngThamMayMan:LoadFile()	
	self.tbNumberTMM = {}	
	if TabFile_Load(self.szPathFile, self.szPathFile) == 0 then
		return 0
	end
	local nCount = TabFile_GetRowCount(self.szPathFile)	
	--print("====tbVngThamMayMan:LoadFile()	nCount: "..nCount)
	for i = 2, nCount do
		local tbTemp = {}
		local nNumber	= tonumber(TabFile_GetCell(self.szPathFile, i, "nNumber")) or 0	
		tbTemp.nNumber = nNumber
		tbTemp.nRate	= tonumber(TabFile_GetCell(self.szPathFile, i, "nRate")) or 0
				
		self.tbNumberTMM[nNumber] = self.tbNumberTMM[nNumber] or {}
		tinsert(self.tbNumberTMM[nNumber],tbTemp)
	end
end

--Load file so trung thuong -- Thanhld 20160120
tbVngThamMayMan:LoadFile()