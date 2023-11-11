-------------------------------------------------------------------------
-- FileName		:	templeboss90.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-18 14:13:14
-- Desc			:   É½ÉñÃí¹Ø¿¨µÄ±êÖ¾boss½Å±¾[90ÒÔÉÏ¼¶]
-------------------------------------------------------------------------
IncludeLib( "FILESYS" );
Include("\\script\\task\\tollgate\\messenger\\shanshenmiao\\enemy_temboss.lua") 
Include("\\script\\task\\newtask\\newtask_head.lua") --µ÷ÓÃ nt_getTask Í¬²½±äÁ¿µ½¿Í»§¶ËµÄÀà
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --È¡ÏûÈÎÎñ
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --µ÷ÓÃ¼ÆÊ±Æ÷
Include("\\script\\tagnewplayer\\head.lua");
TabFile_Load( "\\settings\\task\\tollgate\\messenger\\messenger_tollprize.txt" , "tollprize");	 --»ñµÃÍ¬°éĞŞÁ·µÄ±í¸ñ

NPC_PARAM_ID = 1;        --ÓÃÔÚbossËÀÍöºóË¢³ö¹ÖÎïµÄÌØÊâÊÂ¼şÖĞ£¬Ôö¼ÓnpcµÄÊ±ºò×÷ÎªGetNpcParamµÄµÚ¶şÎ»£¬ÒâË¼ÊÇ¸Ãº¯ÊıÈ¡³öµÄÊÇ´ú±íÄ¿Ç°ËÀÍöbossIDµÄÊı×Ö   
TEMBOSS_RELIVE=120        --Ã¿¸ö±êÖ¾µÄÖØÉúÊ±¼ä
TEMBOSS_EXP=tonumber( TabFile_GetCell( "tollprize" ,7 ,"boss_exp"))  --Ğ¡¹Ö¾­Ñé
TEMBOSS_MAPID=392        --µ±Ç°Íæ¼ÒËùÔÚµØÍ¼·çÖ®ÆïµÄµØÍ¼±àºÅ£¿£¿ÊÇ¶àÉÙ£¿£¿
TEMBOSS_MESSENGEREXP= tonumber( TabFile_GetCell( "tollprize" ,7 ,"boss_jifen"))  --Ğ¡¹Ö¾­Ñé

templeboss3=
{
--µ¶ÑıĞÖµÜ90¼¶ÒÔÉÏ
{840,100,392,1520,2625,1,"§ao Yªu Huynh §Ö §µm Tø ",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\90\\templebro90.lua",1},
{840,100,392,1519,2718,1,"§ao Yªu Huynh §Ö T­¬ng M«n Nh©n",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\90\\templebro90.lua",2},
{840,100,392,1465,2795,1,"§ao Yªu Huynh §Ö §µm T×nh",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\90\\templebro90.lua",3},
{840,100,392,1436,2955,1,"§ao Yªu Huynh §Ö §µm NhŞ ThËp Tam",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\90\\templebro90.lua",4},
{840,100,392,1379,3056,1,"§ao Yªu Huynh §Ö §µm Tø Lang",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\90\\templebro90.lua",5},
{840,100,392,1412,3091,1,"§ao Yªu Huynh §Ö §µm Tø Nª ",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\90\\templebro90.lua",6},
{840,100,392,1499,2996,1,"§ao Yªu Huynh §Ö §µm Tèng",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\90\\templebro90.lua",7},
{840,100,392,1530,2836,1,"§ao Yªu Huynh §Ö §µm TuÊn",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\90\\templebro90.lua",8},
{840,100,392,1581,2701,1,"§ao Yªu Huynh §Ö §µm Thñy",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\90\\templebro90.lua",9},
{840,100,392,1360,2979,1,"§ao Yªu Huynh §Ö §µm V©n",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\90\\templebro90.lua",10},
{840,100,392,1404,2810,1,"§ao Yªu Huynh §Ö §µm Phi",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\90\\templebro90.lua",11},
{840,100,392,1404,2688,1,"§ao Yªu Huynh §Ö §µm Th¶ Trô ",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\90\\templebro90.lua",12},
{840,100,392,1463,2706,1,"§ao Yªu Huynh §Ö §µm S¸i S¸i",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\90\\templebro90.lua",13},
{840,100,392,1465,3136,1,"§ao Yªu Huynh §Ö §µm Sö ",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\90\\templebro90.lua",14},
{840,100,392,1558,3151,1,"§ao Yªu Huynh §Ö §µm Håi",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\90\\templebro90.lua",15},
{840,100,392,1572,3000,1,"§ao Yªu Huynh §Ö §µm §Şa",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\90\\templebro90.lua",16},
{840,100,392,1572,2843,1,"§ao Yªu Huynh §Ö §µm Có ",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\90\\templebro90.lua",17},
{840,100,392,1333,2774,1,"§ao Yªu Huynh §Ö §µm §Ëu",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\90\\templebro90.lua",18},
{840,100,392,1344,2669,1,"§ao Yªu Huynh §Ö §µm §iÓm §iÓm",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\90\\templebro90.lua",19},
{840,100,392,1485,2625,1,"§ao Yªu Huynh §Ö §µm Tïy",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\90\\templebro90.lua",20},

}

function OnDeath(NpcIndex)
	local name = GetName()
	if (GetTask(Task_IsQuest)==2 and GetTask(Task_lag_TskID)==4) then
		if (GetTask(Task_KillNPC) < 5) then
			SetTask(Task_KillNPC, GetTask(Task_KillNPC) + 1)
			Msg2Player(format("§¹i hiÖp ®· tiªu diÖt ®­îc %d tªn §ao Yªu", GetTask(Task_KillNPC)))
		else
		Msg2Player("§¹i hiÖp ®· hoµn thµnh nhiÖm vô tiªu diÖt §ao Yªu, H·y ®Õn ChiÕn t©m T«n Gi¶ hoµn thµnh nhiÖm vô")
		end
	end
	
	if (  messenger_middletime() == 10 ) then --Íæ¼ÒÔÚµØÍ¼ÖĞµÄÊ±¼ä
		Msg2Player("Xin lçi! "..name.."! B¹n ®· hÕt thêi gian thùc hiÖn nhiÖm vô Tİn sø! NhiÖm vô thÊt b¹i!.")
		losemessengertask()
	else
		Msg2Player("B¹n thµnh c«ng h¹ tªn §ao Yªu.")
		messenger_templego(NpcIndex)
	end
end

