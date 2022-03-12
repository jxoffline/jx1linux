-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµÍøÂç°æÔ½ÄÏÊÕ·Ñ°æ - Õ½ÐÄ×ðÕß¶Ô»°NPC
-- ÎÄ¼þÃû¡¡£ºnpc_zhanxin_zunzhe.lua
-- ´´½¨Õß¡¡£º×Ó·Çô~
-- ´´½¨Ê±¼ä£º2009-06-01 14:27:01

-- ======================================================

Include("\\script\\event\\birthday_jieri\\200905\\class.lua");
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\tagnewplayer\\fucmain.lua");
Include("\\script\\tagnewplayer\\head.lua");
Include("\\script\\tagnewplayer\\dispose_item.lua");
Include("\\script\\thuhoiitem\\huyenvien\\funcmain_huyenvien.lua")
 -- §Òn bï PQCH -Created By - AnhHH - 20110919
Include("\\script\\vng_event\\den_bu_pqch\\den_bu_pqch.lua")
--§Òn bï event trång c©y th¸ng 6 2011 - Modified by DinhHQ - 20110713
Include("\\script\\vng_event\\den_bu_event_thang6\\main.lua")
Include("\\script\\vng_event\\traogiai\\NPAH\\vng_ToolAward.lua")
--Phong v©n lÖnh bµi - Modified by DinhHQ - 20110913
Include("\\script\\activitysys\\config\\1005\\activeingame.lua")
--§Òn bï trèng kh¶i hoµn
Include("\\script\\vng_event\\denbutrongkhaihoan\\main.lua")
Include("\\script\\vng_event\\201203_huyenvulenh\\main.lua")
-- Vong Hao Quang Thien Ha De Nhat Bang - 201204190000 -> 202004212400
Include("\\script\\vng_event\\2012_vlnb\\main.lua")

function main() 
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))          
	local nMonth =tonumber(GetLocalDate("%d"))
	local IsDailyTSK = GetTask(Task_Daily_Quest)
	if (IsDailyTSK ~= nCurDate) then
		SetTask(Task_Daily_Quest, nCurDate)
		SetTask(Task_IsQuest, 0)
		SetTask(Task_IsFinishQuest, 0)
		SetTask(Task_lag_TskID, 0)
	end                                                                                     
	local tbOpt = {};                                                                                              
	local szTitle = format("- Chµo mõng b¹n ®Õn víi <color=yellow>Vâ L©m TruyÒn Kú<color=yellow><enter>- <color=Red>C­u Niªn T­¬ng Phïng <color><enter>- ViÖt ho¸ tæng hîp By <color=Green>Nam Cung NhÊt Thiªn<color>");   
	tinsert(tbOpt, 1, szTitle)  
	tbVngToolAward:AddDialog(tbOpt, "ChiÕn T©m T«n Gi¶") 
	
	tbVnHuyenVu:AddDialog(tbOpt)
	--Phong v©n lÖnh bµi - Modified by DinhHQ - 20110913
	tbPVLBActive:AddDialog(tbOpt)
	--§Òn bï trèng kh¶i hoµn
	tbVngDenBuTKH:AddDialog(tbOpt)
	-- Vong Hao Quang Thien Ha De Nhat Bang - 201204190000 -> 202004212400
	tbVngVLNB2012:AddDialog(tbOpt)
	if (nMonth == 1) then
		tinsert(tbOpt,  "Ta muèn hñy vËt phÈm/DisposeItem")  
--	                tbOpt =                                                                                                        
--	                {                                                                                        
----	                	 "Ta muèn tham gia/NWP_main",             
--	                	 "Ta muèn hñy vËt phÈm/DisposeItem",
----	                	  "Ta tr¶ l¹i trang bÞ HuyÒn Viªn/ThuHoiHuyenVien_main",                        
--	                     	 "KÕt thóc/OnCancel",                                                                                   
--	                }                
--                else
--	                tbOpt =                                                                                                        
--	                {                                                                                        
----	                	 "Ta muèn tham gia/NWP_main",    
----	                	 "Ta tr¶ l¹i trang bÞ HuyÒn Viªn/ThuHoiHuyenVien_main",                                            
--	                     	 "KÕt thóc/OnCancel",                                                                                   
--	                }                        
	end                                                                                              
        -- §Òn bï PQCH -Created By - AnhHH - 20110919
	--  if (DenBuPQCH2011:IsActive() == 1 and DenBuPQCH2011:CheckAccount() == 1) then
			tinsert(tbOpt, "NhËn phÇn th­ëng Phó Quý CÈm H¹p/#DenBuPQCH2011:GetAward()")
	--  end
        
--        if tbVngEventThang6Reward:isActive() == 1 then
--        	tinsert(tbOpt, "NhËn phÇn th­ëng ®Òn bï event trång c©y/#tbVngEventThang6Reward:main()")
--        end       
	tinsert(tbOpt,  "KÕt thóc/OnCancel")
	CreateTaskSay(tbOpt);                                                                                                  
                                                                                                                               
        --if (tbBirthday0905:IsActDate() ~= 1) then                                                                            
                --Talk(1, "", "Ho¹t ®éng ®· kÕt thóc.");                                                                       
                --return^                                                                                                       
        --end                                                                                                                  
                                                                                                                              
        --CreateTaskSay({"<dec><npc>".."§©y lµ lo¹i tiÒm n¨ng trêi ban nh­ng rÊt Ýt ng­êi biÕt béc ph¸t lo¹i tiÒm lùc nµy. Ta bi
                                        --"Ta muèn nhËn Nh©n gi¶ v« ®Þch quyÕt/tbBirthday0905_renzhewudi",                     
                                        --"Tù ta cã thÓ kh¬i dËy søc m¹nh tiÒm tµng cña b¶n th©n./OnCancel"});                 
end    

function OnCancel()
end


function tbBirthday0905_renzhewudi()
	do return end
	if (GetLevel() <= 79 and tbBirthday0905:IsActDate() == 1) then
		AddSkillState(512,20,1,60*60*18)--40ÅÜËÙ
		AddSkillState(527,5,1,60*60*18)--500Ñª
		AddSkillState(313,5,1,60*60*18)--20È«¿¹
		AddSkillState(314,12,1,60*60*18)--7»Ø¸´Ñª£¬5»Ø¸´ÄÚ
		AddSkillState(546,1,1,60*60*18)--Óù´Í¹â»·
		CreateTaskSay({"<dec><npc>".."Ta ®· kh¬i dËy mét chót søc m¹nh tiÒm tµng trong b¶n th©n ng­¬i råi, giê ng­¬i cã thÓ ®i hµnh hiÖp. Khi nµo cÇn ta gióp ®ì th× cø ®Õn gÆp ta?", "§a t¹ /OnCancel"})
		Msg2Player("NhËn ®­îc tr¹ng th¸i Nh©n gi¶ v« ®Þch quyÕt");
	else
		CreateTaskSay({"<dec><npc>".."Tù ng­¬i ®· trë nªn m¹nh mÏ råi cßn cÇn ta gióp sao?", "ThËt ng¹i qu¸! T¹i h¹ ®Õn nhÇm chç råi./OnCancel"});
	end
end
