-------------------------------------------------------------------------
-- FileName		:	enemy_flypoint6079.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-06 19:39:14
-- Desc			:   ·çÖ®Æï¹Ø¿¨µÄ¶¨µã¹ÖÎïËÀÍö½Å±¾[60-79¼¶]
-------------------------------------------------------------------------
IncludeLib( "FILESYS" );
Include("\\script\\task\\tollgate\\messenger\\fengzhiqi\\enemy_flypoint.lua") 
Include("\\script\\task\\newtask\\newtask_head.lua") --µ÷ÓÃ nt_getTask Í¬²½±äÁ¿µ½¿Í»§¶ËµÄÀà
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --È¡ÏûÈÎÎñ
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --µ÷ÓÃ¼ÆÊ±Æ÷
TabFile_Load( "\\settings\\task\\tollgate\\messenger\\messenger_tollprize.txt" , "tollprize");	 --»ñµÃÍ¬°éĞŞÁ·µÄ±í¸ñ

FLYPOINT_EXP = tonumber( TabFile_GetCell( "tollprize" ,2 ,"dingdian_exp"))  --¶¨µãĞ¡¹Ö¾­Ñé
FLYPOINT_MAPID= 387  --·çÖ®ÆïµÄµØÍ¼id
FLYPOINT_MESSENGEREXP= tonumber( TabFile_GetCell( "tollprize" ,2 ,"dingdian_jifen"))  --·çÖ®ÆïµÄ¶¨µãĞ¡¹ÖËÀÍö»ñµÃĞÅÊ¹»ı·Ö

------ĞÅÊ¹ÈÎÎñ·çÖ®Æï¶¨µãÉ±¹Ö±í¸ñ--------------
--Ğ¡µØÍ¼×ø±êx£¬y£¬ÈËÎïÃû×Ö£¨60-79¼¶£©,
killfly ={
{193,194,"Hoµn Nhan Xung",1},
{181,183,"Hoµn Nhan V« Lo¹i",2},
{197,179,"§¹i Cao",3},
{197,172,"Hoµn Nhan Tæ ",4},
{198,163,"§¹i Méc",5},
{190,160,"Hoµn Nhan NguyÖt",6},
{164,162,"Gia LuËt M·nh",7},
{164,172,"§¹i H¾c",8},
{178,190,"Hoµn Nhan Niªn",9},
{178,187,"§¹i Vò ",10},
{169,190,"Gia LuËt Bİnh Tr­¬ng",11},
{172,193,"Hoµn Nhan H¹o",12},
{165,191,"Gia LuËt LËp PhÈm",13},
{178,2851,"Hoµn Nhan An",14},
{186,183,"§¹i Tr× ",15},
}


function OnDeath(nNpcIndex)
	local name = GetName()
	local Uworld1214 = nt_getTask(1214)  --¶¨µã´ò¹Ö¿ª¹Ø
	local FLY_npcidex = GetNpcParam(nNpcIndex,1)
	
	if ( messenger_middletime() == 10 ) then --Íæ¼ÒÔÚµØÍ¼ÖĞµÄÊ±¼ä
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