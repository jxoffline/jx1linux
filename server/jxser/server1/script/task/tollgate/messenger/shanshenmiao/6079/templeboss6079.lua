-------------------------------------------------------------------------
-- FileName		:	templeboss6079.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-18 14:13:14
-- Desc			:   É½ÉñÃí¹Ø¿¨µÄ±êÖ¾boss½Å±¾[60-79¼¶]
-------------------------------------------------------------------------
IncludeLib( "FILESYS" );
Include("\\script\\task\\tollgate\\messenger\\shanshenmiao\\enemy_temboss.lua") 
Include("\\script\\task\\newtask\\newtask_head.lua") --µ÷ÓÃ nt_getTask Í¬²½±äÁ¿µ½¿Í»§¶ËµÄÀà
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --È¡ÏûÈÎÎñ
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --µ÷ÓÃ¼ÆÊ±Æ÷
Include("\\script\\tagnewplayer\\head.lua");
TabFile_Load( "\\settings\\task\\tollgate\\messenger\\messenger_tollprize.txt" , "tollprize");	 --»ñµÃÍ¬°éĞŞÁ·µÄ±í¸ñ


NPC_PARAM_ID = 1;        --ÓÃÔÚbossËÀÍöºóË¢³ö¹ÖÎïµÄÌØÊâÊÂ¼şÖĞ£¬Ôö¼ÓnpcµÄÊ±ºò×÷ÎªGetNpcParamµÄµÚ¶şÎ»£¬ÒâË¼ÊÇ¸Ãº¯ÊıÈ¡³öµÄÊÇ´ú±íÄ¿Ç°ËÀÍöbossIDµÄÊı×Ö   
TEMBOSS_RELIVE=120       --Ã¿¸ö±êÖ¾µÄÖØÉúÊ±¼ä
TEMBOSS_EXP=tonumber( TabFile_GetCell( "tollprize" ,5 ,"boss_exp"))  --Ğ¡¹Ö¾­Ñé
TEMBOSS_MAPID=390        --µ±Ç°Íæ¼ÒËùÔÚµØÍ¼·çÖ®ÆïµÄµØÍ¼±àºÅ£¿£¿ÊÇ¶àÉÙ£¿£¿
TEMBOSS_MESSENGEREXP= tonumber( TabFile_GetCell( "tollprize" ,5 ,"boss_jifen"))  --Ğ¡¹Ö¾­Ñé

templeboss=
{
{834,70,390,1520,2625,1,"§ao Yªu Huynh §Ö L©m §¹t",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",1},
{834,70,390,1519,2718,1,"§ao Yªu Huynh §Ö Tr­¬ng Tam",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",2},
{834,70,390,1465,2795,1,"§ao Yªu Huynh §Ö Cao §¹t",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",3},
{834,70,390,1436,2955,1,"§ao Yªu Huynh §Ö ThiÕt Ch¶o",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",4},
{834,70,390,1379,3056,1,"§ao Yªu Huynh §Ö §ång Tı ",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",5},
{834,70,390,1412,3091,1,"§ao Yªu Huynh §Ö C­¬ng Nha",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",6},
{834,70,390,1499,2996,1,"§ao Yªu Huynh §Ö Tr­êng Tu",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",7},
{834,70,390,1530,2836,1,"§ao Yªu Huynh §Ö V­¬ng NhŞ Ma Tö ",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",8},
{834,70,390,1581,2701,1,"§ao Yªu Huynh §Ö Bµn Lı ",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",9},
{834,70,390,1360,2979,1,"§ao Yªu Huynh §Ö Hµ B¸ ",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",10},
{834,70,390,1404,2810,1,"§ao Yªu Huynh §Ö Hång C«n",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",11},
{834,70,390,1404,2688,1,"§ao Yªu Huynh §Ö LiÔu Qu¸t",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",12},
{834,70,390,1463,2706,1,"§ao Yªu Huynh §Ö Lı §¹i Niªn",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",13},
{834,70,390,1465,3136,1,"§ao Yªu Huynh §Ö U«ng Ng­u",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",14},
{834,70,390,1558,3151,1,"§ao Yªu Huynh §Ö ThiÕt Nha",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",15},
{834,70,390,1572,3000,1,"§ao Yªu Huynh §Ö Lı TiÓu Chñy",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",16},
{834,70,390,1572,2843,1,"§ao Yªu Huynh §Ö M¹n §¹p",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",17},
{834,70,390,1333,2774,1,"§ao Yªu Huynh §Ö S¬n Phong",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",18},
{834,70,390,1344,2669,1,"§ao Yªu Huynh §Ö B¸t §éc",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",19},
{834,70,390,1485,2625,1,"§ao Yªu Huynh §Ö Xa TriÖt",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",20},
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

