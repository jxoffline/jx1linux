
-- ĞÂÔöÁËÍ¬°éËæ»úÈÎÎñµÄ´¦Àí
-- Edited by peres
-- 2005/09/03 PM 15:55	

IncludeLib("FILESYS");
IncludeLib("PARTNER");

-- ÈÎÎñÏµÍ³¿âÖ§³Ö
IncludeLib("TASKSYS");

-- ¶ÁÈëËæ»úÈÎÎñÍ·ÎÄ¼ş
Include("\\script\\task\\system\\task_main.lua");

TabFile_Load( "\\settings\\partner\\talk\\man_w.txt" , "friendly_man_w");	 --»ñµÃÍ¬°é¶Ô»°µÄ±í¸ñ
TabFile_Load( "\\settings\\partner\\talk\\woman_w.txt" , "friendly_woman_w");	 --»ñµÃÍ¬°é¶Ô»°µÄ±í¸ñ
TabFile_Load( "\\settings\\partner\\talk\\man_m.txt" , "friendly_man_m");	 --»ñµÃÍ¬°é¶Ô»°µÄ±í¸ñ
TabFile_Load( "\\settings\\partner\\talk\\woman_m.txt" , "friendly_woman_m");	 --»ñµÃÍ¬°é¶Ô»°µÄ±í¸ñ
TabFile_Load( "\\settings\\partner\\talk\\partner_sex.txt" , "partnersex");	 --»ñµÃÍ¬°éĞÔ±ğµÄ±í¸ñ
--randomseed(GetCurrentTime())

function toSprLinkStr(nSettingIdx, nActionId)
	return "<#><link=image[0,8]:#npcspr:?NPCSID="..tostring(nSettingIdx).."?ACTION="..tostring(nActionId)..">"
end

function main()
	-- 		do 
	-- 	return Talk(1, "", "Chøc n¨ng ch­a më!")
	-- end
	
	local peoplesex = GetSex()
	local partnerindex,partnerstate = PARTNER_GetCurPartner()       --»ñµÃÕÙ»½³öÍ¬°éµÄindex,Í¬°é×´Ì¬ÎªÕÙ³ö»òÎª²»ÕÙ³ö
	local PartnerFriendly = PARTNER_GetEmotionDegree(partnerindex) 
	local NpcCount = PARTNER_Count()
	local nSettingIdx = PARTNER_GetSettingIdx(partnerindex)
	if (partnerindex < 1 or partnerstate == 0) then
		Msg2Player("HiÖn b¹n kh«ng thÓ gäi §ång hµnh, kh«ng thÓ ®èi tho¹i víi §ång hµnh!")
	else
		local nRowCount0 = TabFile_GetRowCount("partnersex")
		local RealNpcSex, RealNpcAir
		local partner_NpcId,partner_NpcSex;
		
		-- Í¬°éËæ»úÈÎÎñµÄ´¦Àí
		-- Edited by peres
		-- 2005/09/03 PM 15:55	
		local nRandomTaskState = GetTaskStatus(TaskName(GetTask(ID_RANDOMTASK)));
		
		if nRandomTaskState==nil then nRandomTaskState=0; end;
			
		if getRandomTaskState()==1 then
		
			if GetTask(ID_RANDOMTASK)~=0 and nRandomTaskState<3 then
			
					Say("§ång hµnh cña b¹n cã 1 c¸i <color=green>"..GetTaskText(TaskName(GetTask(ID_RANDOMTASK_WAIT))).."<color> muèn ®­a b¹n, b¹n muèn bá nhiÖm vô hiÖn t¹i ®Ó tiÕp nhËn nhiÖm vô míi?", 2, 
						"§óng vËy! Ta cã høng thó víi nhiÖm vô míi!/_confirmRandomTask",
						"Kh«ng ph¶i! NhiÖm vô cña ta ch­a hoµn thµnh!/#setRandomTaskState(2)");
						
					return
				
			else
				
				-- Çå¿ÕµÈ´ı½ÓµÄËæ»úÈÎÎñ
				SetTaskStatus(TaskName(GetTask(ID_RANDOMTASK_WAIT)), 0);
				CloseTask( TaskName(GetTask(ID_RANDOMTASK_WAIT)) );	
				
				ApplyTask( TaskName(GetTask(ID_RANDOMTASK_WAIT)) );   -- ÉêÇë¿ªÊ¼Ò»¸öÈÎÎñ
				
				return
				
			end;
			
		end;
		
		for i=2,nRowCount0 do 
			partner_NpcId = tonumber( TabFile_GetCell( "partnersex", i ,"NpcId"))
			partner_NpcSex = tonumber( TabFile_GetCell( "partnersex", i ,"NpcSex"))
			if ( nSettingIdx == partner_NpcId  ) then
				RealNpcSex = partner_NpcSex
				break
			end
		end
		if ( peoplesex == 0  and  RealNpcSex == 1 ) then
			local nRowCount1 = TabFile_GetRowCount("friendly_man_w")
			if ( PartnerFriendly >= 0 and PartnerFriendly <= 10) then
				local j = random(2,nRowCount1)
				local Partner_content = TabFile_GetCell( "friendly_man_w", j ,"friend010")
				Describe(toSprLinkStr(nSettingIdx, 0)..PARTNER_GetName(partnerindex).."<link>:"..Partner_content,1,"KÕt thóc ®èi tho¹i/no")				
			elseif ( PartnerFriendly >10 and PartnerFriendly <= 19) then
				local k = random(2,nRowCount1)
				local Partner_content = TabFile_GetCell( "ffriendly_man_w", k ,"friend1019")
				Describe(toSprLinkStr(nSettingIdx, 0)..PARTNER_GetName(partnerindex).."<link>:"..Partner_content,1,"KÕt thóc ®èi tho¹i/no")
			elseif ( PartnerFriendly >19 and PartnerFriendly <= 49) then
			  	local l = random(2,nRowCount1)
			    local Partner_content = TabFile_GetCell( "friendly_man_w", l ,"friend1949")
			   	Describe(toSprLinkStr(nSettingIdx, 0)..PARTNER_GetName(partnerindex).."<link>:"..Partner_content,1,"KÕt thóc ®èi tho¹i/no")
			elseif ( PartnerFriendly >49 and PartnerFriendly <= 84) then
			   	local m = random(2,nRowCount1)
			    local Partner_content = TabFile_GetCell( "friendly_man_w", m ,"friend4984")
			   	Describe(toSprLinkStr(nSettingIdx, 0)..PARTNER_GetName(partnerindex).."<link>:"..Partner_content,1,"KÕt thóc ®èi tho¹i/no")
			elseif ( PartnerFriendly >84 and PartnerFriendly <= 95) then
			   	local n = random(2,nRowCount1)
			    local Partner_content = TabFile_GetCell( "friendly_man_w", n ,"friend4984")
				Describe(toSprLinkStr(nSettingIdx, 0)..PARTNER_GetName(partnerindex).."<link>:"..Partner_content,1,"KÕt thóc ®èi tho¹i/no")
			elseif ( PartnerFriendly >95 and PartnerFriendly <= 100) then
			  	local o = random(2,nRowCount1)
			    local Partner_content = TabFile_GetCell( "friendly_man_w", o ,"friend95100")
				Describe(toSprLinkStr(nSettingIdx, 0)..PARTNER_GetName(partnerindex).."<link>:"..Partner_content,1,"KÕt thóc ®èi tho¹i/no")
			end
		elseif ( peoplesex == 1 ) and ( RealNpcSex == 1 ) then
			local nRowCount2 = TabFile_GetRowCount("friendly_woman_w")
			if ( PartnerFriendly >= 0 and PartnerFriendly <= 10) then
				local p = random(2,nRowCount2)
				local Partner_content = TabFile_GetCell( "friendly_woman_w", p ,"friend010")
				Describe(toSprLinkStr(nSettingIdx, 0)..PARTNER_GetName(partnerindex).."<link>:"..Partner_content,1,"KÕt thóc ®èi tho¹i/no")
			elseif ( PartnerFriendly >10 and PartnerFriendly <= 19) then
				local q = random(2,nRowCount2)
				local Partner_content = TabFile_GetCell( "friendly_woman_w", q ,"friend1019")
			   	Describe(toSprLinkStr(nSettingIdx, 0)..PARTNER_GetName(partnerindex).."<link>:"..Partner_content,1,"KÕt thóc ®èi tho¹i/no")
			elseif ( PartnerFriendly >19 and PartnerFriendly <= 49) then
			  	local r = random(2,nRowCount2)
				local Partner_content = TabFile_GetCell( "friendly_woman_w", r ,"friend1949")
			   	Describe(toSprLinkStr(nSettingIdx, 0)..PARTNER_GetName(partnerindex).."<link>:"..Partner_content,1,"KÕt thóc ®èi tho¹i/no")
			elseif ( PartnerFriendly >49 and PartnerFriendly <= 84) then
			   	local s = random(2,nRowCount2)
			    local Partner_content = TabFile_GetCell( "friendly_woman_w", s ,"friend4984")
			   	Describe(toSprLinkStr(nSettingIdx, 0)..PARTNER_GetName(partnerindex).."<link>:"..Partner_content,1,"KÕt thóc ®èi tho¹i/no")
			elseif ( PartnerFriendly >84 and PartnerFriendly <= 95) then
			   	local t = random(2,nRowCount2)
			    local Partner_content = TabFile_GetCell( "friendly_woman_w", t ,"friend4984")
				Describe(toSprLinkStr(nSettingIdx, 0)..PARTNER_GetName(partnerindex).."<link>:"..Partner_content,1,"KÕt thóc ®èi tho¹i/no")
			elseif ( PartnerFriendly >95 and PartnerFriendly <= 100) then
			    local u = random(2,nRowCount2)
				local Partner_content = TabFile_GetCell( "friendly_woman_w", u ,"friend95100")
				Describe(toSprLinkStr(nSettingIdx, 0)..PARTNER_GetName(partnerindex).."<link>:"..Partner_content,1,"KÕt thóc ®èi tho¹i/no")
			end				
		elseif ( peoplesex == 0 ) and ( RealNpcSex == 0 ) then
			local nRowCount3 = TabFile_GetRowCount("friendly_man_m")
			if ( PartnerFriendly >= 0 and PartnerFriendly <= 10) then
				local v = random(2,nRowCount3)
				local Partner_content = TabFile_GetCell( "friendly_man_m", v ,"friend010")
				Describe(toSprLinkStr(nSettingIdx, 0)..PARTNER_GetName(partnerindex).."<link>:"..Partner_content,1,"KÕt thóc ®èi tho¹i/no")
			elseif ( PartnerFriendly >10 and PartnerFriendly <= 19) then
				local w = random(2,nRowCount3)
				local Partner_content = TabFile_GetCell( "friendly_man_m", w ,"friend1019")
				Describe(toSprLinkStr(nSettingIdx, 0)..PARTNER_GetName(partnerindex).."<link>:"..Partner_content,1,"KÕt thóc ®èi tho¹i/no")
			elseif ( PartnerFriendly >19 and PartnerFriendly <= 49) then
				local x = random(2,nRowCount3)
				local Partner_content = TabFile_GetCell( "friendly_man_m", x ,"friend1949")
				Describe(toSprLinkStr(nSettingIdx, 0)..PARTNER_GetName(partnerindex).."<link>:"..Partner_content,1,"KÕt thóc ®èi tho¹i/no")
			elseif ( PartnerFriendly >49 and PartnerFriendly <= 84) then
				local y = random(2,nRowCount3)
				local Partner_content = TabFile_GetCell( "friendly_man_m", y ,"friend4984")
				Describe(toSprLinkStr(nSettingIdx, 0)..PARTNER_GetName(partnerindex).."<link>:"..Partner_content,1,"KÕt thóc ®èi tho¹i/no")
			elseif ( PartnerFriendly >84 and PartnerFriendly <= 95) then
				local z = random(2,nRowCount3)
				local Partner_content = TabFile_GetCell( "friendly_man_m", z ,"friend4984")
				Describe(toSprLinkStr(nSettingIdx, 0)..PARTNER_GetName(partnerindex).."<link>:"..Partner_content,1,"KÕt thóc ®èi tho¹i/no")
			elseif ( PartnerFriendly >95 and PartnerFriendly <= 100) then
				local a = random(2,nRowCount3)
				local Partner_content = TabFile_GetCell( "friendly_man_m", a ,"friend95100")
				Describe(toSprLinkStr(nSettingIdx, 0)..PARTNER_GetName(partnerindex).."<link>:"..Partner_content,1,"KÕt thóc ®èi tho¹i/no")
			end
		elseif ( peoplesex == 1 ) and ( RealNpcSex == 0 ) then
			local nRowCount4 = TabFile_GetRowCount("friendly_woman_m")
			if ( PartnerFriendly >= 0 and PartnerFriendly <= 10) then
				local b = random(2,nRowCount4)
				local Partner_content = TabFile_GetCell( "friendly_woman_m", b ,"friend010")
				Describe(toSprLinkStr(nSettingIdx, 0)..PARTNER_GetName(partnerindex).."<link>:"..Partner_content,1,"KÕt thóc ®èi tho¹i/no")
			elseif ( PartnerFriendly >10 and PartnerFriendly <= 19) then
				local c = random(2,nRowCount4)
				local Partner_content = TabFile_GetCell( "friendly_woman_m", c ,"friend1019")
				Describe(toSprLinkStr(nSettingIdx, 0)..PARTNER_GetName(partnerindex).."<link>:"..Partner_content,1,"KÕt thóc ®èi tho¹i/no")
			elseif ( PartnerFriendly >19 and PartnerFriendly <= 49) then
				local d = random(2,nRowCount4)
				local Partner_content = TabFile_GetCell( "friendly_woman_m", d ,"friend1949")
				Describe(toSprLinkStr(nSettingIdx, 0)..PARTNER_GetName(partnerindex).."<link>:"..Partner_content,1,"KÕt thóc ®èi tho¹i/no")
			elseif ( PartnerFriendly >49 and PartnerFriendly <= 84) then
				local f = random(2,nRowCount4)
				local Partner_content = TabFile_GetCell( "friendly_woman_m", f ,"friend4984")
				Describe(toSprLinkStr(nSettingIdx, 0)..PARTNER_GetName(partnerindex).."<link>:"..Partner_content,1,"KÕt thóc ®èi tho¹i/no")
			elseif ( PartnerFriendly >84 and PartnerFriendly <= 95) then
				local g = random(2,nRowCount4)
				local Partner_content = TabFile_GetCell( "friendly_woman_m", g ,"friend4984")
				Describe(toSprLinkStr(nSettingIdx, 0)..PARTNER_GetName(partnerindex).."<link>:"..Partner_content,1,"KÕt thóc ®èi tho¹i/no")
			elseif ( PartnerFriendly >95 and PartnerFriendly <= 100) then
				local h = random(2,nRowCount4)
				local Partner_content = TabFile_GetCell( "friendly_woman_m", h ,"friend95100")
				Describe(toSprLinkStr(nSettingIdx, 0)..PARTNER_GetName(partnerindex).."<link>:"..Partner_content,1,"KÕt thóc ®èi tho¹i/no")
			end
		end
	end
end

function no()

end