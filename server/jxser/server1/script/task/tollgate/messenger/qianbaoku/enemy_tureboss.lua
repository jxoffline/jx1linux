-------------------------------------------------------------------------
-- FileName		:	enemy_tureboss.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-19 16:09:14
-- Desc			:   Ç§±¦¿â¹Ø¿¨µÄ±¦Ïä½Å±¾
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua") --µ÷ÓÃ nt_getTask Í¬²½±äÁ¿µ½¿Í»§¶ËµÄÀµ
Include("\\script\\task\\tollgate\\messenger\\posthouse.lua") --°üº¬Íæ¼ÒÈÎÎñÊý¾Ý±í¸ñµÄÀµ
Include("\\script\\task\\tollgate\\messenger\\lib_messenger.lua") --µ÷ÓÃ×é¶ÓÅÐ¶Ï
Include("\\script\\event\\birthday_jieri\\200905\\class.lua")
Include("\\script\\event\\jiaoshi_jieri\\200910\\head.lua")
Include("\\script\\lib\\awardtemplet.lua")

thiefdeathscript = "\\script\\task\\tollgate\\messenger\\qianbaoku\\thiefdeathscript.lua"

Include("\\script\\task\\tollgate\\messenger\\qianbaoku\\messenger_baoxiangtask.lua")--¿ª±¦Ïä¹¤¾ßº¯Êý
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --È¡ÏûÈÎÎñ

function messenger_turego()
	
	local _, _, nMapIndex = GetPos()
--------------------------------------------------------±äÁ¿¶¨Òå------------------------------------------
	local name = GetName()
	local Uworld1201 = nt_getTask(1203)  --Ç§±¦¿âÈÎÎñµÄÈÎÎñ±äÁ¿
	local Uworld1204 = nt_getTask(1204)  --ËÍÐÅÈÎÎñËùµ½µØµãÈÎÎñ±äÁ¿
	local Uworld3000 = nt_getTask(3000)  --ÐÅÊ¹»ý·Ö
	local Uworld1206 = nt_getTask(1206)  --ÐÅÊ¹³ÆºÅ
	local Uworld1207 = nt_getTask(1207)  --ÐÅÊ¹ÈÎÎñµ±Ç°É±¹Ö¼ÇÊýÆ÷
	local Uworld1208 = nt_getTask(1210)  --Ç§±¦¿âÉ±¹Ö¼ÇÊýÆ÷
	local Uworld1211 = nt_getTask(1211)  --ÐÅÊ¹ÈÎÎñ¹Ø¿¨¿ªÊ¼Ê±¼ä
	local Uworld1213 = nt_getTask(1213)  --Ë«±¶¾­ÑéÊ±¼ä
	local Uworld1214 = nt_getTask(1214)  --±»À§ÉÙÅ®¾çÇé¿ª¹Ø
	local Uworld1215 = nt_getTask(1215)  --bossË¢¹Ö¿ª¹Ø
	local messenger_nowtime = GetGameTime()  --»ñµÃÍæ¼Òµ±Ç°ÔÚÏßÊ±¼ä
	local Uworld1212  =  messenger_nowtime - Uworld1211 --»ñµÃÍæ¼Òµ±Ç°ÔÚ¸Ã¹Ø¿¨µØÍ¼ÖÐ×ÜÊ±¼ä

	local Npcindex = GetLastDiagNpc()
	SetTaskTemp(180,Npcindex)    --½«µ±Ç°BossË÷Òý´æµ½Ò»¸öÁÙÊ±±äÁ¿ÖÐ
	local nBoxIndex = GetTaskTemp(181)
	SetTaskTemp(181,0)           --·ÀÖ¹É±ËÀÒ»´ÎbossºóµÄÍæ¼Ò¼ÌÐøÀûÓÃ´Ë±äÁ¿¿ªÏä×Ó
	
	local nTask1203 = nt_getTask(1203)
	if nTask1203 == 20 then
    	local nTaskStatus = %add_task_step(nBoxIndex)--ÈÎÎñÍÆ½ø
    	
    	if nTaskStatus == 30 then
    		--ÈÎÎñÍê³É
    		nt_setTask(1203,25)
    		Talk(1, "", name.."§¹i nh©n, nhiÖm vô cña ng­¬i ®· hoµn thµnh, xin h·y ®i t×m Tiªu TrÊn.")
    		return 1
    	elseif nTaskStatus==20 then
    		--ÈÎÎñ¿ÉÒÔ¼ÌÐø
    		--do nothing
    		return 1
    	else
    		--ÈÎÎñÊ§°Ü
    		losemessengertask()
    		Talk(1, "", "ThËt xin lçi ! "..name.."Ng­¬i më r­¬ng kh«ng ®óng trËt tù, nhiÖm vô thÊt b¹i .")
    	end
    elseif nTask1203 == 25 then
    	Talk(1, "", "NhiÖm vô cña ng­¬i ®· hoµn thµnh, xin h·y ®i t×m Tiªu TrÊn.")
    end

------------------------------------------------------º¯ÊýÅÐ¶Ï--------------------------------------------
	
--	--¹ØÓÚÍæ¼ÒÊÇ·ñÉ±µôÁË¸ÃÏä×Ó¶ÔÓ¦ÊØ»¤ÕßµÄÅÐ¶Ï·ÅÔÚµ÷ÓÃ¸Ã½Å±¾µÄµØ·½½øÐÐ
	if ( Uworld1213 ~= 0 ) and ( Uworld1214 ~= 0 ) and ( Uworld1215 ~= 0 ) then  --¼¸ÖÖÈÎÎñÀµÐÍ¶¼ÒÑ¾­´¥·¢¹ýÁË
		Msg2Player("Ng­¬i cßn cã nhiÖm vô ch­a hoµn thµnh, cè g¾ng lªn .") 
	else
		local messenger_choice = random(1,40)
		--if ( messenger_choice == 4 ) then  --Ôö¼ÓÒ»¸öÉñÃØ´óºì°ü
		--	local lucky_hongbao = random(1,10)
--		--	if ( lucky_hongbao == 5 ) then
--		--		AddItem(6,1,402,0,0,0)      
--		--		Msg2Player("Äã»ñµÃÁËÒ»¸öÉñÃØ´óºì°ü")
--		--	end
		if ( messenger_choice == 7) then  --Èç¹ûÃ»ÓÐµÃµ½Õâ¸ö¸£Àû£¬ÔòÔö¼Ó»ý·Ö20·ÖÖÓ
			if ( Uworld1213 == 0 ) then
				nt_setTask(1213,messenger_nowtime)
				Msg2Player("Ng­¬i lÊy ®­îc giÕt qu¸i ®­îc gÊp ®«i kinh nghiÖm 20 phót nhËn th­ëng!")
				AddSkillState( 548, 1, 1, 21600 )
			else
				Msg2Player("Ng­¬i thµnh c«ng më thµnh c«ng mét b¸o r­¬ng.")
			end
		elseif ( messenger_choice == 11 ) then  --Ôö¼Ó»ý·Ö10 
			nt_setTask(3000,Uworld3000+20)
			tongaward_message(20);	--by Ð¡É½
			Msg2Player("Ng­¬i ë ®©y nhiÖm vô tÝn sø ®· tÝch lòy ®iÓm t¨ng thªm 20 ®iÓm!")
		
		elseif ( messenger_choice == 13 ) then  --¼õÉÙ»ý·Ö10
			if ( Uworld3000 >= 10 ) then 
			nt_setTask(3000,Uworld3000-10)
			Msg2Player("Ng­¬i nhiÖm vô tÝn sø ®· bÞ gi¶m ®i 10 ®iÓm tÝch lòy")
			
			end
		elseif ( messenger_choice == 16 )  then  --Èç¹ûÃ»ÓÐ´¥·¢¹ý¶¨µã´ò¹ÖµÄÊ¢¼þ£¬´¥·¢ÔÚÄ³µã´òÌØÊâ¹ÖÎïµÄÊ¢¼þ
			local lucky_dingdian = random(1,3)  --¿ØÖÆ¶¨µãÉÙÅ®³öÏÖ¼¸¢Ê¼õµÍ3±¶
			if ( lucky_dingdian == 2 ) then
				local TureParam = GetNpcParam(Npcindex,NPC_PARAM_ID)
				if ( SubWorldIdx2ID( nMapIndex ) == 393 ) then
					for i=1,getn(turegirl) do 
						if ( TureParam == turegirl[i][10]) then
							Mid = SubWorldID2Idx(turegirl[i][3]);   			  --Ôö¼Ónpc
							if (Mid >= 0 ) then
								TabValue4 = turegirl[i][4] * 32
								TabValue5 = turegirl[i][5] * 32
								newtasknpcindex = AddNpc(turegirl[i][1],turegirl[i][2],Mid,TabValue4,TabValue5,turegirl[i][6],turegirl[i][7],turegirl[i][8]);
								SetNpcScript(newtasknpcindex, turegirl[i][9]);
							end
						end
					end
				elseif ( SubWorldIdx2ID( nMapIndex ) == 394 ) then
					for i=1,getn(turegirl2) do 
						if ( TureParam == turegirl2[i][10]) then
							Mid = SubWorldID2Idx(turegirl2[i][3]);   			  --Ôö¼Ónpc
							if (Mid >= 0 ) then
								TabValue4 = turegirl2[i][4] * 32
								TabValue5 = turegirl2[i][5] * 32
								newtasknpcindex = AddNpc(turegirl2[i][1],turegirl2[i][2],Mid,TabValue4,TabValue5,turegirl2[i][6],turegirl2[i][7],turegirl2[i][8]);
								SetNpcScript(newtasknpcindex, turegirl2[i][9]);
								
							end
						end
					end
				elseif ( SubWorldIdx2ID( nMapIndex ) == 395 ) then
					for i=1,getn(turegirl3) do 
						if ( TureParam == turegirl3[i][10]) then
							Mid = SubWorldID2Idx(turegirl3[i][3]);   			  --Ôö¼Ónpc
							if (Mid >= 0 ) then
								TabValue4 = turegirl3[i][4] * 32
								TabValue5 = turegirl3[i][5] * 32
								newtasknpcindex = AddNpc(turegirl3[i][1],turegirl3[i][2],Mid,TabValue4,TabValue5,turegirl3[i][6],turegirl3[i][7],turegirl3[i][8]);
								SetNpcScript(newtasknpcindex, turegirl3[i][9]);
							end
						end
					end
				end
			end
			
		elseif ( messenger_choice == 19 ) then 	--ÔÚ¸ÃbossÉí±ßÔö¼Óif ( messenger_npcindex == turerobber[i][10]) ¸önpc
			local lucky_shuachu = random(1,3)
			if ( lucky_shuachu == 2 ) then
				local lucky_time = 1
				if ( SubWorldIdx2ID( nMapIndex ) == 393 ) and ( GetGlbValue(814) < 10 ) then
					SetGlbValue(814,GetGlbValue(814)+1)
					nt_setTask(1215,10)
					local messenger_npcindex = GetNpcParam(Npcindex,NPC_PARAM_ID) --»ñµÃµ±Ç°ËÀÍönpcµÄ´¢´æ±äÁ¿Öµ£¨¶ÔÓ¦±äÁ¿ÉèÖÃÖµÔÚ¸Ãnpc±»¼ÓÔØ´¦£©
					Msg2Player("B¶o Khè §¹o TÆc : Ng­¬i ng­¬i ng­¬i, ng­¬i lµ thÕ nµo ph¸t hiÖn ta, ai nha nha, phiÒn n·o, trém c¸ b¶o bèi cßn cã ng­êi quÊy rÇy! §i t×m chÕt ®i ng­¬i !")	
				
					for i=1,getn(turerobber) do  								  --È¥ËùÓÐbossËÀÍöºóÉú³ÉµÄnpc±í¸ñÖÐÑ°ÕÒ·ûºÏ¸ÃbossË÷ÒýµÄ×ø±ê
						if ( messenger_npcindex == turerobber[i][10]) then   	  --Êý×éÄÚÑ°ÕÒ·ûºÏnpcË÷ÒýµÄ±äÁ¿ÊýÖµ
							Tid = SubWorldID2Idx(turerobber[i][3]);   			  --Ôö¼Ónpc
							if (Tid >= 0 ) then
								TabValue4 = turerobber[i][4] * 32
								TabValue5 = turerobber[i][5] * 32
								newtasknpcindex = AddNpc(turerobber[i][1],turerobber[i][2],Tid,TabValue4,TabValue5,turerobber[i][6],turerobber[i][7],turerobber[i][8]);
								SetNpcScript(newtasknpcindex, turerobber[i][9]);
								SetNpcDeathScript(newtasknpcindex, thiefdeathscript);
							end
						end
					end
				elseif ( SubWorldIdx2ID( nMapIndex ) == 394 ) and ( GetGlbValue(815) < 10 ) then
					SetGlbValue(815,GetGlbValue(815)+1)
					nt_setTask(1215,10)
					local messenger_npcindex = GetNpcParam(Npcindex,NPC_PARAM_ID) --»ñµÃµ±Ç°ËÀÍönpcµÄ´¢´æ±äÁ¿Öµ£¨¶ÔÓ¦±äÁ¿ÉèÖÃÖµÔÚ¸Ãnpc±»¼ÓÔØ´¦£©
					Msg2Player("B¶o Khè §¹o TÆc : Ng­¬i ng­¬i ng­¬i, ng­¬i lµ thÕ nµo ph¸t hiÖn ta, ai nha nha, phiÒn n·o, trém c¸ b¶o bèi cßn cã ng­êi quÊy rÇy! §i t×m chÕt ®i ng­¬i !")	
				
					for i=1,getn(turerobber2) do  								  --È¥ËùÓÐbossËÀÍöºóÉú³ÉµÄnpc±í¸ñÖÐÑ°ÕÒ·ûºÏ¸ÃbossË÷ÒýµÄ×ø±ê
						if ( messenger_npcindex == turerobber2[i][10]) then   	  --Êý×éÄÚÑ°ÕÒ·ûºÏnpcË÷ÒýµÄ±äÁ¿ÊýÖµ
							Tid = SubWorldID2Idx(turerobber2[i][3]);   			  --Ôö¼Ónpc
							if (Tid >= 0 ) then
								TabValue4 = turerobber2[i][4] * 32
								TabValue5 = turerobber2[i][5] * 32
								newtasknpcindex = AddNpc(turerobber2[i][1],turerobber2[i][2],Tid,TabValue4,TabValue5,turerobber2[i][6],turerobber2[i][7],turerobber2[i][8]);
								SetNpcScript(newtasknpcindex, turerobber2[i][9]);
								SetNpcDeathScript(newtasknpcindex, thiefdeathscript);
							end
						end
					end
				elseif ( SubWorldIdx2ID( nMapIndex ) == 395 ) and ( GetGlbValue(816) < 10 ) then
					SetGlbValue(816,GetGlbValue(816)+1)
					nt_setTask(1215,10)
					local messenger_npcindex = GetNpcParam(Npcindex,NPC_PARAM_ID) --»ñµÃµ±Ç°ËÀÍönpcµÄ´¢´æ±äÁ¿Öµ£¨¶ÔÓ¦±äÁ¿ÉèÖÃÖµÔÚ¸Ãnpc±»¼ÓÔØ´¦£©
					Msg2Player("B¶o Khè §¹o TÆc : Ng­¬i ng­¬i ng­¬i, ng­¬i lµ thÕ nµo ph¸t hiÖn ta, ai nha nha, phiÒn n·o, trém c¸ b¶o bèi cßn cã ng­êi quÊy rÇy! §i t×m chÕt ®i ng­¬i !")		
				
					for i=1,getn(turerobber3) do  								  --È¥ËùÓÐbossËÀÍöºóÉú³ÉµÄnpc±í¸ñÖÐÑ°ÕÒ·ûºÏ¸ÃbossË÷ÒýµÄ×ø±ê
						if ( messenger_npcindex == turerobber3[i][10]) then   	  --Êý×éÄÚÑ°ÕÒ·ûºÏnpcË÷ÒýµÄ±äÁ¿ÊýÖµ
							Tid = SubWorldID2Idx(turerobber3[i][3]);   			  --Ôö¼Ónpc
							if (Tid >= 0 ) then
								TabValue4 = turerobber3[i][4] * 32
								TabValue5 = turerobber3[i][5] * 32
								newtasknpcindex = AddNpc(turerobber3[i][1],turerobber3[i][2],Tid,TabValue4,TabValue5,turerobber3[i][6],turerobber3[i][7],turerobber3[i][8]);
								SetNpcScript(newtasknpcindex, turerobber3[i][9]);
								SetNpcDeathScript(newtasknpcindex, thiefdeathscript);
							end
						end
					end
				end
			end
		end
	end
----------------------------------------------------×öbossËÀÍöµÄ»ù±¾²Ù×÷-------------------------------------------------------
	if ( Uworld1213 ~= 0 ) then       --ÅÐ¶ÏÊÇ·ñË«±¶¾­ÑéÊ±¼ä
		if  (  messenger_nowtime - Uworld1213 >= 1200 ) then
			nt_setTask(1213,0)
			Msg2Player("Ngµi ë vèn quan trung lÊy ®­îc gÊp ®«i kinh nghiÖm thêi gian ®· kÕt thóc !")
		else
			AddOwnExp(TUREBOSS_EXP)    --¸øÓèÒ»±¶µÄ¾­Ñé
		end
	end

	if (tbJiaoShi2009:IsActive() == 1) then	-- 2009½ÌÊ¦½Úµô¢äË®Ä«
		--print("123");
		tbAwardTemplet:GiveAwardByList({szName="Thñy MÆc", tbProp={6,1,2175,1,0,0},nExpiredTime=20091203,}, "2009 Teacher's Day Messenger's Box give ink");
	end
	local Uworld3000 = nt_getTask(3000)
	local Uworld1207 = nt_getTask(1207)
	local Uworld1207 = nt_getTask(1210)
	
	messenger_killnpc_jifen(TUREBOSS_MESSENGEREXP,TUREBOSS_MAPID)
	SetMessengerPlayer(1207,1210,TUREBOSS_EXP,TUREBOSS_MAPID)   --Ôö¼ÓÇ§±¦¿âÉ±¹ÖÊý£¬Ôö¼Óµ±Ç°¹Ø¿¨É±¹ÖÊý£¬Ôö¼Ó¾­Ñé
	if ( lucky_time == 1 ) then
		HideNpc(GetTaskTemp(180),TUREBOSS_RELIVE*60*18)  --18ìõÎªÒ»Ãë  Òþ²Ø¸Ã¶Ô»°ÐÍµÄnpc
		lucky_time = 0
	else
		HideNpc(GetTaskTemp(180),TUREBOSS_RELIVE*18)  --18ìõÎªÒ»Ãë  Òþ²Ø¸Ã¶Ô»°ÐÍµÄnpc
	end
	SetTask2Team(tbBirthday0905.tbTask.tsk_msg_curtsk,tbBirthday0905.tbTask.tsk_msg_needcount, 4);
end
