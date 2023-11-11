-------------------------------------------------------------------------
-- FileName		:	enemy_temzhiboss.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-18 10:27:14
-- Desc			:   É½ÉñÃí¹Ø¿¨µÄ±êÖ¾boss½Å±¾
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua") --µ÷ÓÃ nt_getTask Í¬²½±äÁ¿µ½¿Í»§¶ËµÄÀà
Include("\\script\\task\\tollgate\\messenger\\posthouse.lua") --°üº¬Íæ¼ÒÈÎÎñÊı¾İ±í¸ñµÄÀà
Include("\\script\\task\\tollgate\\messenger\\lib_messenger.lua") --µ÷ÓÃ×é¶ÓÅĞ¶Ï
Include("\\script\\event\\birthday_jieri\\200905\\class.lua");

function messenger_templego(KillerNpcIndex)
	local _, _, nMapIndex = GetPos()
------------------------------------------------------±äÁ¿¶¨Òå------------------------------------------
	local name = GetName()
	local Uworld1201 = nt_getTask(1202)  --É½ÉñÃíÈÎÎñµÄÈÎÎñ±äÁ¿
	local Uworld1204 = nt_getTask(1204)  --ËÍĞÅÈÎÎñËùµ½µØµãÈÎÎñ±äÁ¿
	local Uworld3000 = nt_getTask(3000)  --ĞÅÊ¹»ı·Ö
	local Uworld1206 = nt_getTask(1206)  --ĞÅÊ¹³ÆºÅ
	local Uworld1207 = nt_getTask(1207)  --ĞÅÊ¹ÈÎÎñµ±Ç°É±¹Ö¼ÇÊıÆ÷
	local Uworld1208 = nt_getTask(1209)  --É½ÉñÃíÉ±¹Ö¼ÇÊıÆ÷
	local Uworld1211 = nt_getTask(1211)  --ĞÅÊ¹ÈÎÎñ¹Ø¿¨¿ªÊ¼Ê±¼ä
	local Uworld1213 = nt_getTask(1213)  --Ë«±¶¾­ÑéÊ±¼ä
	local Uworld1214 = nt_getTask(1214)  --µ¶ÑıÅÑÍ½¾çÇé¿ª¹Ø
	local Uworld1215 = nt_getTask(1215)  --bossË¢¹Ö¿ª¹Ø
	local messenger_nowtime = GetGameTime()  --»ñµÃÍæ¼Òµ±Ç°ÔÚÏßÊ±¼ä
	local Uworld1212  =  messenger_nowtime - Uworld1211 --»ñµÃÍæ¼Òµ±Ç°ÔÚ¸Ã¹Ø¿¨µØÍ¼ÖĞ×ÜÊ±¼ä
	local Npcindex = KillerNpcIndex	
	
------------------------------------------------------º¯ÊıÅĞ¶Ï--------------------------------------------
	
	if ( Uworld1213 ~= 0 ) and ( Uworld1214 ~= 0 ) and ( Uworld1215 ~= 0 ) then  --¼¸ÖÖÈÎÎñÀàĞÍ¶¼ÒÑ¾­´¥·¢¹ıÁË
		--Msg2Player("Äã»¹ÓĞÈÎÎñÃ»ÓĞÍê³É£¬¼ÓÓÍ¡£")  ²»×ö´¦ÀíÁË
	else
		local messenger_choice = random(1,40)
		--if ( messenger_choice == 4 ) then  --Ôö¼ÓÒ»¸öÉñÃØ´óºì°ü
		--	local lucky_hongbao = random(1,10)
		--	if ( lucky_hongbao == 5 ) then
		--		AddItem(6,1,402,0,0,0)      
		--		Msg2Player("Äã»ñµÃÁËÒ»¸öÉñÃØ´óºì°ü")
		--	end
		if ( messenger_choice == 7) then  --Èç¹ûÃ»ÓĞµÃµ½Õâ¸ö¸£Àû£¬ÔòÔö¼Ó»ı·Ö20·ÖÖÓ
			if ( Uworld1213 == 0 ) then
				nt_setTask(1213,messenger_nowtime)
				Msg2Player("B¹n nhËn ®­îc phÇn th­ëng t¨ng gÊp ®«i ®iÓm kinh nghiÖm khi giÕt qu¸i trong 20 phót!")
				AddSkillState( 548, 1, 1,21600)
			else
				Msg2Player("B¹n thµnh c«ng h¹ tªn §ao Yªu.")
			end
		elseif ( messenger_choice == 11 ) then  --Ôö¼Ó»ı·Ö10 
			nt_setTask(3000,Uworld3000+20)
			tongaward_message(20);	--by Ğ¡É½
			Msg2Player("§iÓm tİch lòy trong nhiÖm vô Tİn Sø cña b¹n t¨ng lªn 20 ®iÓm!")
			AddSkillState( 509, 1, 0, 180)
		elseif ( messenger_choice == 13 ) then  --¼õÉÙ»ı·Ö10
			if ( Uworld3000 >= 10 ) then 
			nt_setTask(3000,Uworld3000-10)
			Msg2Player("§iÓm tİch lòy trong nhiÖm vô Tİn Sø cña b¹n gi¶m ®i 10 ®iÓm!")
			AddSkillState( 509, 1, 0, 180)
			end
		elseif ( messenger_choice == 16 ) then  --Èç¹ûÃ»ÓĞ´¥·¢¹ı¶¨µã´ò¹ÖµÄÊÂ¼ş£¬´¥·¢ÔÚÄ³µã´òÌØÊâ¹ÖÎïµÄÊÂ¼ş
			local lucky_dingdian = random(1,3)
			if ( lucky_dingdian == 2 ) then
				if ( Uworld1214 == 0 ) then                            
					nt_setTask(1214,Uworld1214+10)									--¼ÇÂ¼ÔÚkillfly±íÖĞÈ¡µÃµÄĞĞÊı
					Msg2Player("Tr­íc khi §ao Yªu t¾t thë anh ta nãi víi b¹n do bŞ thñ h¹ §ao Thñ h·m h¹i nªn anh ta míi giÕt ng­êi v« sè. Hy väng b¹n cã thÓ gióp anh ta h¹ 10 tªn §ao Thñ sÏ cã nhiÒu bÊt ngê cho b¹n ®Êy!")
					AddSkillState( 509, 1, 0, 180)
				else 
					Msg2Player("B¹n thµnh c«ng h¹ tªn §ao Yªu.")
					--SetTask2Team(tbBirthday0905.tbTask.tsk_msg_curtsk,tbBirthday0905.tbTask.tsk_msg_needcount, 7);
				end
			end
			
		elseif ( messenger_choice == 19 ) then 	--ÔÚ¸ÃbossÉí±ßÔö¼Óif ( messenger_npcindex == templeboss[i][10]) ¸önpc
			local lucky_shuachu = random(1,3)
			if ( lucky_shuachu == 2 ) then
				if ( SubWorldIdx2ID( nMapIndex ) == 390 ) and ( GetGlbValue(817) < 10 )  then
					SetGlbValue(817,GetGlbValue(817)+1)
					nt_setTask(1215,10)
					local messenger_npcindex = GetNpcParam(Npcindex,NPC_PARAM_ID) --»ñµÃµ±Ç°ËÀÍönpcµÄ´¢´æ±äÁ¿Öµ£¨¶ÔÓ¦±äÁ¿ÉèÖÃÖµÔÚ¸Ãnpc±»¼ÓÔØ´¦£©
			
					for i=1,getn(templeboss) do  								  --È¥ËùÓĞbossËÀÍöºóÉú³ÉµÄnpc±í¸ñÖĞÑ°ÕÒ·ûºÏ¸ÃbossË÷ÒıµÄ×ø±ê
						if ( messenger_npcindex == templeboss[i][10]) then   	  --Êı×éÄÚÑ°ÕÒ·ûºÏnpcË÷ÒıµÄ±äÁ¿ÊıÖµ
							Tid = SubWorldID2Idx(templeboss[i][3]);   			  --Ôö¼Ónpc
							if (Tid >= 0 ) then
								TabValue4 = templeboss[i][4] * 32
								TabValue5 = templeboss[i][5] * 32
								newtasknpcindex = AddNpc(templeboss[i][1],templeboss[i][2],Tid,TabValue4,TabValue5,templeboss[i][6],templeboss[i][7],templeboss[i][8]);
								SetNpcScript(newtasknpcindex, templeboss[i][9]);
								Msg2Player(templeboss[i][7]..": Ng­¬i d¸m giÕt ca ca ta, h«m nay ng­¬i ph¶i nép m¹ng!")
							end
						end
					end
				elseif ( SubWorldIdx2ID( nMapIndex ) == 391 ) and ( GetGlbValue(818) < 10 ) then
					SetGlbValue(818,GetGlbValue(818)+1)
					nt_setTask(1215,10)
					local messenger_npcindex = GetNpcParam(Npcindex,NPC_PARAM_ID) --»ñµÃµ±Ç°ËÀÍönpcµÄ´¢´æ±äÁ¿Öµ£¨¶ÔÓ¦±äÁ¿ÉèÖÃÖµÔÚ¸Ãnpc±»¼ÓÔØ´¦£©
			
					for i=1,getn(templeboss2) do  								  --È¥ËùÓĞbossËÀÍöºóÉú³ÉµÄnpc±í¸ñÖĞÑ°ÕÒ·ûºÏ¸ÃbossË÷ÒıµÄ×ø±ê
						if ( messenger_npcindex == templeboss2[i][10]) then   	  --Êı×éÄÚÑ°ÕÒ·ûºÏnpcË÷ÒıµÄ±äÁ¿ÊıÖµ
							Tid = SubWorldID2Idx(templeboss2[i][3]);   			  --Ôö¼Ónpc
							if (Tid >= 0 ) then
								TabValue4 = templeboss2[i][4] * 32
								TabValue5 = templeboss2[i][5] * 32
								newtasknpcindex = AddNpc(templeboss2[i][1],templeboss2[i][2],Tid,TabValue4,TabValue5,templeboss2[i][6],templeboss2[i][7],templeboss2[i][8]);
								SetNpcScript(newtasknpcindex, templeboss2[i][9]);
								Msg2Player(templeboss2[i][7]..": Ng­¬i d¸m giÕt ca ca ta, h«m nay ng­¬i ph¶i nép m¹ng!")
							end
						end
					end
				elseif ( SubWorldIdx2ID( nMapIndex ) == 392 ) and ( GetGlbValue(819) < 10 ) then
					SetGlbValue(819,GetGlbValue(819)+1)
					nt_setTask(1215,10)
					local messenger_npcindex = GetNpcParam(Npcindex,NPC_PARAM_ID) --»ñµÃµ±Ç°ËÀÍönpcµÄ´¢´æ±äÁ¿Öµ£¨¶ÔÓ¦±äÁ¿ÉèÖÃÖµÔÚ¸Ãnpc±»¼ÓÔØ´¦£©
			
					for i=1,getn(templeboss3) do  								  --È¥ËùÓĞbossËÀÍöºóÉú³ÉµÄnpc±í¸ñÖĞÑ°ÕÒ·ûºÏ¸ÃbossË÷ÒıµÄ×ø±ê
						if ( messenger_npcindex == templeboss3[i][10]) then   	  --Êı×éÄÚÑ°ÕÒ·ûºÏnpcË÷ÒıµÄ±äÁ¿ÊıÖµ
							Tid = SubWorldID2Idx(templeboss3[i][3]);   			  --Ôö¼Ónpc
							if (Tid >= 0 ) then
								TabValue4 = templeboss3[i][4] * 32
								TabValue5 = templeboss3[i][5] * 32
								newtasknpcindex = AddNpc(templeboss3[i][1],templeboss3[i][2],Tid,TabValue4,TabValue5,templeboss3[i][6],templeboss3[i][7],templeboss3[i][8]);
								SetNpcScript(newtasknpcindex, templeboss3[i][9]);
								Msg2Player(templeboss3[i][7]..": Ng­¬i d¸m giÕt ca ca ta, h«m nay ng­¬i ph¶i nép m¹ng!")
							end
						end
					end
				end
			end
		end
	end
--------------------------------------------------×öbossËÀÍöµÄ»ù±¾²Ù×÷-------------------------------------------------------
	if ( Uworld1213 ~= 0 ) then       --ÅĞ¶ÏÊÇ·ñË«±¶¾­ÑéÊ±¼ä
		if  (  messenger_nowtime - Uworld1213 >= 1200 ) then
			nt_setTask(1213,0)
			Msg2Player("Thêi gian t¨ng gÊp ®«i ®iÓm kinh nghiÖm cña b¹n ®· kÕt thóc!")
		else
			AddOwnExp(TEMBOSS_EXP)    --¸øÓèÒ»±¶µÄ¾­Ñé
		end
	end
	
	
	local Uworld3000 = nt_getTask(3000)
	local Uworld1207 = nt_getTask(1207)
	local Uworld1207 = nt_getTask(1209)
	
	messenger_killnpc_jifen(TEMBOSS_MESSENGEREXP,TEMBOSS_MAPID)
	SetMessengerPlayer(1207,1209,TEMBOSS_EXP,TEMBOSS_MAPID)   --Ôö¼ÓÉ½ÉñÃíÉ±¹ÖÊı£¬Ôö¼Óµ±Ç°¹Ø¿¨É±¹ÖÊı£¬Ôö¼Ó¾­Ñé
	SetTask2Team(tbBirthday0905.tbTask.tsk_msg_curtsk,tbBirthday0905.tbTask.tsk_msg_needcount, 7);
end