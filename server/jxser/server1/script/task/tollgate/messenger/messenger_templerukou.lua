-------------------------------------------------------------------------
-- FileName		:	messenger_templerukou.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-08-31 22:21:14
-- Desc			:   É½ÉñÃíÈë¿Ú
-------------------------------------------------------------------------
Include("\\script\\task\\tollgate\\killbosshead.lua") --°üº¬ÁËÍ¼Ïóµ÷ÓÃ
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\tollgate\\messenger\\posthouse.lua") --°üº¬Íæ¼ÒÈÎÎñÊı¾İ±í¸ñµÄÀµ
Include("\\script\\event\\birthday_jieri\\200905\\message\\message.lua");
Include("\\script\\lib\\common.lua");

function main()
	local tbDialog =
	{
		"B¾t ®Çu nhiÖm vô /temple_starttask", 
                "Rêi ®i khu vùc /temple_movecity", 
                "Sau nµy trë l¹i /no",
	}
	if (tbBirthday0905:IsActDate() == 1) then
		tinsert(tbDialog, 3, "NhiÖm vô b¶n ®å S¬n ThÇn MiÕu /birthday0905_temple");
	end
	 Describe(DescLink_YiGuan..": §· më míi tİnh to¸n x«ng quan thêi gian, cè g¾ng lªn nha ! B©y giê ng­¬i nghÜ lµm c¸i g×?",getn(tbDialog), unpack(tbDialog))
end

function temple_starttask()
	if ( nt_getTask(1202) == 10 ) then
		nt_setTask(1211,GetGameTime())              --:ÉèÖÃÈÎÎñ¿ªÊ¼Ê±¼ä
		nt_setTask(1202,20)
		DisabledUseTownP(1)--½ûÓÃ»Ø³Ç·û				--1£º½ûÓÃ	--0£ºÆôÓÃ
		SetFightState(1);--´ò¿ªÕ½¶·×´Ì¬				--1£º´ò¿ª	--0£º¹Ø±Õ
		SetLogoutRV(1);--¶ÏÏßºÍËÀÍö²»ÎªÒ»¸öÖØÉúµã		--1£º¶ÏÏßºÍËÀÍöÎªÒ»¸öÖØÉúµã	--0£º¶ÏÏßºÍËÀÍö²»ÎªÒ»¸öÖØÉúµã
		SetPunish(0);--¹Ø±ÕËÀÍö³Í·£					--1£ºÓĞËÀÍö³Í·£		--0£ºÃ»ÓĞËÀÍö³Í·£
		SetCreateTeam(1);--ÔÊĞí×é¶Ó				--1£ºÔÊĞí×é¶Ó		--0£º²»ÔÊĞí×é¶Ó
		ForbidChangePK(1);   --²»ÄÜ¸ü¸Äpk×´Ì¬		--1£º²»ÄÜ¸ü¸Äpk×´Ì¬		--0:¿ÉÒÔ¸ü¸Äpk×´Ì¬
		SetPKFlag(0);        --ÉèÖÃÎªÁ·¹¦Ä£Ê½        
		SetDeathScript("\\script\\task\\tollgate\\messenger\\playerdead_tollgate.lua");
		SetPos(1340,3148);
		Msg2Player("§· më míi tİnh to¸n thêi gian lµm nhiÖm vô")
	elseif ( nt_getTask(1202) == 20 ) then
		Describe(DescLink_YiGuan.."Ng­¬i ®· hoµn thµnh nhiÖm vô, kh«ng cÇn tiÕp tôc nhËn!",1,"KÕt thóc ®èi tho¹i/no")
	elseif ( nt_getTask(1202) == 25 or nt_getTask(1202) == 30 ) then
		Describe(DescLink_YiGuan..": Ng­¬i ®· hoµn thµnh nhiÖm vô, thÕ nµo cßn muèn tiÕp tôc tiÕp nhËn ? nhanh lªn mét chót rêi khái c¸i nµy ®i!",1,"KÕt thóc ®èi tho¹i/no")
	elseif ( nt_getTask(1202) == 0 ) then
		Describe(DescLink_YiGuan..": Ng­¬i ®· hoµn thµnh nhiÖm vô tİn sø, xin nhanh lªn mét chót rêi ®i ®i!",1,"KÕt thóc ®èi tho¹i/no")
	end
end

function temple_movecity()
	local name = GetName()
	if ( nt_getTask(1202) == 25 or nt_getTask(1202) == 30 ) then
		for i=1,getn(citygo) do
			if ( nt_getTask(1204) == citygo[i][2] ) then
				SetLogoutRV(0);
				NewWorld(citygo[i][7], citygo[i][8], citygo[i][9])
				Msg2Player("MiÕu s¬n thÇn dŞch tr¹m cung tiÔn "..name.." ®¹i nh©n ®Õn "..citygo[i][4].." dŞch tr¹m !")
			end
		end	
	elseif ( nt_getTask(1202) == 10 ) or ( nt_getTask(1202) == 0 ) then
		SetLogoutRV(0);
		NewWorld(1,1561,3114)
	end	  	
end

function birthday0905_temple()
	tbBirthday0905.tbTask:reset_task();
	Say("DŞch quan : tõ 19/06/2009 ®Õn 19/07/2009 24 lóc , th«ng qua phİa d­íi nhiÖm vô cã thÓ ®¹t ®­îc mïa hÌ cung, ®¹i hiÖp muèn tham gia sao ?", 6, 
              "NhËn tiªu diÖt 2 c¸ ®ao yªu nhiÖm vô./#birthday0905_settask_message(7)", 
              "NhËn tiªu diÖt 100 c¸ miÕu s¬n thÇn ng­êi cÇm ®ao nhiÖm vô./#birthday0905_settask_message(8)", 
              "Ta ®· hoµn thµnh tiªu diÖt 2 c¸ ®ao yªu nhiÖm vô./#birthday0905_gettask_message(7)", 
              "Ta ®· hoµn thµnh tiªu diÖt 100 c¸ miÕu s¬n thÇn ng­êi cÇm ®ao nhiÖm vô./#birthday0905_gettask_message(8)", 
              "Ta muèn bu«ng tha cho b©y giê nhiÖm vô /birthday0905_cancel_message", 
              "Ta cã viÖc gÊp , chê mét chót trë l¹i./no");
end

function no()
end
