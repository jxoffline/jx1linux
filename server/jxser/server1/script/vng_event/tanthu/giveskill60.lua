
--Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\vng_event\\tanthu\\head.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\dailogsys\\dailogsay.lua")

tbGiveSkill60 ={}
TakIsGetSkill = 2685
TakIsGetItem = 2686
TakIsGetItemKimPhong = 2687
TakIsGetSkill90 = 2688
TakIsGetBK90 = 4932

function tbGiveSkill60:MainDialog()
	local tbOpt = {}
	tinsert(tbOpt, {"NhËn VËt ThÇn Hµnh Phï, Thæ §Þa Phï 7 ngµy", tbGiveSkill60.GetItem, {tbGiveSkill60}})
	tinsert(tbOpt, {"NhËn KÜ N¨ng sau Khi Gia NhËp M«n Ph¸i", tbGiveSkill60.GetSkill, {tbGiveSkill60}})
	tinsert(tbOpt, {"NhËn vßng hæ trî t©n thñ", tbGiveSkill60.GetSkillSupport, {tbGiveSkill60}})
	tinsert(tbOpt, {"NhËn trang bÞ Kim Phong", tbGiveSkill60.GetKimPhong, {tbGiveSkill60}})
	tinsert(tbOpt, {"NhËn BÝ kÝp 90 tù chän theo ph¸i", tbGiveSkill60.GetBK90, {tbGiveSkill60}})
	--tinsert(tbOpt, {"NhËn KÜ N¨ng CÊp 90", tbGiveSkill60.GetSkill90, {tbGiveSkill60}})
	tinsert(tbOpt, {"Hñy bá "})
	CreateNewSayEx("Mêi ®¹i hiÖp chän", tbOpt)
end

function tbGiveSkill60:GetSkill90( )
		if(GetLevel() < 90 )then
		Talk(1,"","CÊp 90 trë lªn míi ®­îc nhËn!")
		return
	end
	if(GetTask(TakIsGetSkill90) > 0)then
		Talk(1,"","§¹i hiÖp kh«ng ph¶i ®· nhËn råi hay sao ?")
		return
	end

	local nFaction = GetLastFactionNumber()
  	if nFaction < 0 then
  		Talk(1, "", "Ch­a gia nhËp m«n ph¸i, ch­a thÓ nhËn phÇn th­ëng nµy!")
  		return
  	end

  	local tbSkill = TB_DAIYITOUSHI_FACTS[nFaction + 1].tbSkillID
  	if not tbSkill then
  		Talk(1, "", "ThÊt b¹i, xin liªn hÖ GM!")
  		return
  	end
  	
  	for key, val in tbSkill do
	  		for i = 1, getn(val) do
	  			if type(val[i]) == "table" then
		  			if key == 90 then
		  				print("Add skill 90")
		  				AddMagic(val[i][1], 1)
		  			end
	  			end

	  		end
	  	--end	 	
  	end
  	
  	SetTask(TakIsGetSkill90, 1)
  	Talk(1, "", "NhËn kÜ n¨ng thµnh c«ng, xin kiÓm tra l¹i! ")
  	Msg2Player("NhËn skill m«n ph¸i thµnh c«ng")
	-- body
end

function tbGiveSkill60:GetKimPhong( )
	if(GetLevel() < 60 )then
		Talk(1,"","CÊp 60 trë lªn míi ®­îc nhËn!")
		return
	end
	if(GetTask(TakIsGetItemKimPhong) > 0)then
		Talk(1,"","§¹i hiÖp kh«ng ph¶i ®· nhËn råi hay sao ?")
		return
	end
	--add item
	for i=177, 185 do
		local ndx= AddGoldItem(0,i)
		SetItemBindState(ndx, -2)
		SyncItem(ndx);
	end
	SetTask(TakIsGetItemKimPhong, 1)
	Msg2Player("§¹i hiÖp võa nhËn ®­îc bé trang bÞ Kim Phong")
end

function tbGiveSkill60:GetSkill()

	if (GetTask(TakIsGetSkill) > 0) then
		return Talk(1, "", "§¹i hiÖp kh«ng ph¶i ®· nhËn kÜ n¨ng råi hay sao!")
	end

	-- if(GetLevel() > 60)then
	-- 	return Talk(1, "", "Hç trî nµy chØ dµnh cho t©n thñ d­íi cÊp 60")
	-- end
	if(GetLevel() < 10)then
		return Talk(1, "", "Hç trî nµy chØ dµnh cho t©n thñ cÊp 10 trë lªn!")
	end

	local nFaction = GetLastFactionNumber()
  	if nFaction < 0 then
  		Talk(1, "", "Ch­a gia nhËp m«n ph¸i, ch­a thÓ nhËn phÇn th­ëng nµy!")
  		return
  	end

  	local tbSkill = TB_DAIYITOUSHI_FACTS[nFaction + 1].tbSkillID
  	if not tbSkill then
  		Talk(1, "", "ThÊt b¹i, xin liªn hÖ GM!")
  		return
  	end
  	
  	for key, val in tbSkill do
	  	--if key ~= 150 and key ~= "150" then	
	  		--print("==key "..key)
	  		for i = 1, getn(val) do
	  			--if type(val[i]) == "table" then
	  				if (key ~= 90) then
	  					AddMagic(val[i], 0)
	  				end
	  			--end 			
	  		end
	  	--end	 	
  	end
  	
  	SetTask(TakIsGetSkill, 1)
  	Talk(1, "", "NhËn kÜ n¨ng thµnh c«ng, xin kiÓm tra l¹i! ")
  	Msg2Player("NhËn skill m«n ph¸i thµnh c«ng")
  	
end

function tbGiveSkill60:GetSkillSupport()
	-- body
	if (GetSkillState(1594) > 0) then
		return Talk(1, "", "Trªn ng­êi ®¹i hiÖp kh«ng ph¶i ®· cã kÜ n¨ng nµy råi hay sao?")
	end
	if(GetLevel() > 60)then
		return Talk(1, "", "Hç trî nµy chØ dµnh cho t©n thñ d­íi cÊp 60")
	end
	--AddSkillState(1594, 1, 1, 1555200 *1095 , 1) 
	AddSkillState(1594, 1, 1, 64800*8 , 1) --8 giê
	--(60*18)*--> 1phut ==> (60*18)*60=1h

	Msg2Player("B¹n nhËn phÇn th­ëng thµnh c«ng")
end

function tbGiveSkill60:GetItem()
	-- body
	if(GetLevel() > 60)then
		return Talk(1, "", "Hç trî nµy chØ dµnh cho t©n thñ d­íi cÊp 60")
	end
	if (GetTask(TakIsGetItem) > 0) then
		return Talk(1, "", "§¹i hiÖp kh«ng ph¶i ®· nhËn råi hay sao!")
	end
	  	--add item
  	tbAwardTemplet:Give(tbAwardItem, 1, {"NhanHoTroTanThu", "NhanHoTroTanThu"})
	SetTask(TakIsGetItem, 1)
	Msg2Player("B¹n nhËn phÇn th­ëng thµnh c«ng")
end
--===================nhan BK 90=====================--
function tbGiveSkill60:GetBK90( )
	if (GetLevel() < 90 ) then
		Talk(1, "", "ChØ hç trî cho c¸c nh©n sü tõ cÊp 90 trë lªn.")
		return
	end
	
	local nFaction = GetLastFactionNumber()
  	if nFaction < 0 then
  		Talk(1, "", "Ch­a gia nhËp m«n ph¸i, cha thÓ nhËn phÇn thëng nµy!")
  		return
  	end
	
	mp = GetFaction()
	if GetTask(TakIsGetBK90) == 0 then
		local tbSay = {}
		if GetLastFactionNumber() == 0 then
			tinsert(tbSay,"ThiÕu l©m quyÒn./#ChonBiKipOK(56)")
			tinsert(tbSay,"ThiÕu l©m c«n./#ChonBiKipOK(57)")
			tinsert(tbSay,"ThiÕu l©m ®ao./#ChonBiKipOK(58)")
		elseif GetLastFactionNumber() == 1 then
			tinsert(tbSay,"Thiªn v­ong chuú./#ChonBiKipOK(37)")
			tinsert(tbSay,"Thiªn v­ong th­¬ng./#ChonBiKipOK(38)")
			tinsert(tbSay,"Thiªn v­ong ®ao./#ChonBiKipOK(39)")
		elseif GetLastFactionNumber() == 2 then
			tinsert(tbSay,"§uêng m«n phi ®ao./#ChonBiKipOK(45)")
			tinsert(tbSay,"§uêng m«n ná./#ChonBiKipOK(27)")
			tinsert(tbSay,"§uêng m«n phi tiªu./#ChonBiKipOK(46)")
			--tinsert(tbSay,"§uêng m«n bÉy./#ChonBiKipOK(28)")
		elseif GetLastFactionNumber() == 3 then
			tinsert(tbSay,"Ngò ®éc chuëng./#ChonBiKipOK(47)")
			tinsert(tbSay,"Ngò ®éc ®ao./#ChonBiKipOK(48)")
			tinsert(tbSay,"Ngò ®éc bïa./#ChonBiKipOK(49)")
		elseif GetLastFactionNumber() == 4 then
			tinsert(tbSay,"Nga my kiÕm./#ChonBiKipOK(42)")
			tinsert(tbSay,"Nga mi chuëng./#ChonBiKipOK(43)")
			tinsert(tbSay,"Nga mi buff./#ChonBiKipOK(59)")
		elseif GetLastFactionNumber() == 5 then
			tinsert(tbSay,"Thuý yªn ®ao./#ChonBiKipOK(40)")
			tinsert(tbSay,"Thuý yªn song ®ao./#ChonBiKipOK(41)")
		elseif GetLastFactionNumber() == 6 then
			tinsert(tbSay,"C¸i bang rång./#ChonBiKipOK(54)")
			tinsert(tbSay,"C¸i bang bæng./#ChonBiKipOK(55)")
		elseif GetLastFactionNumber() == 7 then
			--tinsert(tbSay,"Thiªn nhÉn kÝch./#ChonBiKipOK(35)")
			--tinsert(tbSay,"Thiªn nhÉn bïa./#ChonBiKipOK(53)")
			tinsert(tbSay,"Thiªn nhÉn ®ao./#ChonBiKipOK(36)")
		elseif GetLastFactionNumber() == 8 then
			tinsert(tbSay,"Vâ ®ang khÝ./#ChonBiKipOK(33)")
			tinsert(tbSay,"Vâ ®ang kiÕm./#ChonBiKipOK(34)")
		elseif GetLastFactionNumber() == 9 then
			tinsert(tbSay,"C«n l«n ®ao./#ChonBiKipOK(50)")
			tinsert(tbSay,"C«n l«n kiÕm./#ChonBiKipOK(51)")
			tinsert(tbSay,"C«n l«n bïa./#ChonBiKipOK(52)")
		end
			tinsert(tbSay,"§Ó sau ®i./no")
			Say("B©y giê ®¹i hiÖp chän theo ý m×nh", getn(tbSay), tbSay)
	else
			Talk(1, "", "Mçi ng­êi chØ ®­îc nhËn 1 lÇn duy nhÊt.")
	end	
end
function ChonBiKipOK(nId)
	if CalcFreeItemCellCount() < 1 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 1 « trèng råi h·y nhËn.",0);
		return
	end	
	local idbk = AddItem(6,1,nId,1,0,0) --bi kip 90
	SetItemBindState(idbk,-2)
	Msg2Player("B¹n nhËn ®­îc 01 BÝ kÝp 90.")
	SetTask(TakIsGetBK90,1)
end

--==================================================--