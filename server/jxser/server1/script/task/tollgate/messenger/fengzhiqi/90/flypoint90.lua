-------------------------------------------------------------------------
-- FileName		:	enemy_flypoint90.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-13 11:19:14
-- Desc			:   ·çÖ®Æï¹Ø¿¨µÄ¶¨µã¹ÖËÀÍö½Å±¾[90ÒÔÉÏ¼¶]
-------------------------------------------------------------------------
IncludeLib( "FILESYS" );
Include("\\script\\task\\tollgate\\messenger\\fengzhiqi\\enemy_flypoint.lua") 
Include("\\script\\task\\newtask\\newtask_head.lua") --µ÷ÓÃ nt_getTask Í¬²½±äÁ¿µ½¿Í»§¶ËµÄÀà
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --È¡ÏûÈÎÎñ
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --µ÷ÓÃ¼ÆÊ±Æ÷
TabFile_Load( "\\settings\\task\\tollgate\\messenger\\messenger_tollprize.txt" , "tollprize");	 --»ñµÃÍ¬°éĞŞÁ·µÄ±í¸ñ

FLYPOINT_EXP = tonumber( TabFile_GetCell( "tollprize" ,4 ,"dingdian_exp"))  --¶¨µãĞ¡¹Ö¾­Ñé
FLYPOINT_MAPID= 389  --·çÖ®ÆïµÄµØÍ¼id
FLYPOINT_MESSENGEREXP= tonumber( TabFile_GetCell( "tollprize" ,4 ,"dingdian_jifen"))  --·çÖ®ÆïµÄ¶¨µãĞ¡¹ÖËÀÍö»ñµÃĞÅÊ¹»ı·Ö

------ĞÅÊ¹ÈÎÎñ·çÖ®Æï¶¨µãÉ±¹Ö±í¸ñ--------------
--Ğ¡µØÍ¼×ø±êx£¬y£¬ÈËÎïÃû×Ö£¨60-79¼¶£©,
killfly ={
{193,194,"Gia LuËt Tµ Ch©m",1},
{181,183,"§¹i Tõ ",2},
{197,179,"§¹i Qu©n",3},
{197,172,"§¹i Khè ",4},
{198,163,"Gia LuËt LËp",5},
{190,160,"Gia LuËt N¨ng",6},
{164,162,"Hoµn Nhan Ph¸ Qu©n",7},
{164,172,"Hoµn Nhan MÖnh",8},
{178,190,"§¹i NiÕt",9},
{178,187,"Gia LuËt Kh¸ch",10},
{169,190,"Hoµn Nhan Phu Binh",11},
{172,193,"Gia LuËt M· B«n",12},
{165,191,"§¹i Cï ",13},
{178,2851,"Gia LuËt Bé ",14},
{186,183,"§¹i KhÊu",15},
}


function OnDeath(nNpcIndex)
	local name = GetName()
	local Uworld1214 = nt_getTask(1214)  --¶¨µã´ò¹Ö¿ª¹Ø
	local FLY_npcidex = GetNpcParam(nNpcIndex,1)
	
	if (  messenger_middletime() == 10 ) then --Íæ¼ÒÔÚµØÍ¼ÖĞµÄÊ±¼ä
		Msg2Player("Xin lçi! "..name.."! B¹n ®· hÕt thêi gian thùc hiÖn nhiÖm vô Tİn sø! NhiÖm vô thÊt b¹i!.")
		losemessengertask()
	elseif ( Uworld1214 == 0 ) then  --Ã»ÓĞ¶¨µãÉ±¹ÖµÄÈÎÎñ
		Msg2Player("Tªn nµy ®· bŞ ng­êi ta ®· ng­êi ta mua ®øt råi, ng­¬i ®¸nh h¾n còng kh«ng ®­îc phÇn th­ëng.")
		return
	elseif ( FLY_npcidex ~= killfly[Uworld1214][4]) then
		Msg2Player("Tªn nµy kh«ng ph¶i lµ ng­êi trong th­ muèn ng­¬i ®i t×m sao? X¸c ®Şnh râ cã ph¶i lµ ng­êi cña Kim CÈu!")
	else
		messenger_killpoint()
	end
end