--Á½ºşÇø °ÍÁêÏØ Â·ÈË10Éò¾Å¶Ô»°
--°ÍÁêÏØĞÂÊÖÈÎÎñ£º°¢·¼µÄ¼Ş×±
--suyu
-- Update: Dan_Deng(2003-08-10)
--×¢Òâ£ºÔ½ÄÏÖ»ÓĞÒ»ÖÖÔª±¦£¬Ïàµ±ÓÚÎÒÃÇµÄÒøÔª±¦£¬Ãû³Æ½Ğ½ğÔª±¦£¬Ç§Íò×¢Òâ£¬±àºÅÓÃ 343

function main()
	UTask_world20 = GetTask(48)
	if (CheckStoreBoxState(1) == 0 and  UTask_world20 == 1) then			-- ·ûºÏÂòÏä×ÓµÄÌõ¼ş£¬ÔÊĞí¹ºÂò¸½¼Ó´¢ÎïÏä
		Say("Ta cã 1 r­¬ng thÇn kú, kh«ng nh÷ng gi÷ ®­îc nhiÒu vËt mµ cßn cã thÓ khãa l¹i an toµn. C¶ Trung Nguyªn chØ m×nh ta cã. Cã muèn xem thö kh«ng?   ",4,"§Ó ta xem thö /buy_addibox", "Hái th¨m mét chót/task_ring","VÒ viÖc r­¬ng më réng/box_help", "Kh«ng høng thó /no")
	elseif (UTask_world20 == 1) then
		task_ring()
	elseif (CheckStoreBoxState(1) == 0) then
		Say("Ta cã 1 r­¬ng thÇn kú, kh«ng nh÷ng gi÷ ®­îc nhiÒu vËt mµ cßn cã thÓ khãa l¹i an toµn. C¶ Trung Nguyªn chØ m×nh ta cã. Cã muèn xem thö kh«ng?   ",3,"§Ó ta xem thö /buy_addibox", "VÒ viÖc r­¬ng më réng/box_help", "Kh«ng høng thó /no")
	else
		other_chat()
	end
end;

function task_ring()
	UTask_world20 = GetTask(48);
	if (UTask_world20 == 1) then
		Say("Muèn mua giïm c« n­¬ng Êy cña håi m«n ­? Hµng hßa cßn l¹i cña ta kh«ng nhiÒu, chØ cßn l¹i ®éi b«ng tai vµng nµy lµ kh¸ rÎ, chØ cã 200 l­îng",2,"Mua/yes", "T¸n gÉu/other_chat","Kh«ng mua/no")
	end
end

function other_chat()
	Talk(3,"", "Ta tõ Tø Xuyªn ®Õn, trªn ®­êng cã rÊt nhiÒu thæ phØ,thËt lµ nguy hiÓm!", "ThËt kh«ng thÓ ngê ®­îc ta cã thÓ ®Õn khu vùc hå §éng §×nh nµy mµ kh«ng hÒ bŞ c­íp! Ng­¬i thÊy cã l¹ kh«ng?", "ta nghe ng­êi ta nãi míi biÕt, ë ®©y kh«ng chŞu sù qu¶n lı cña quan phñ, mµ tõ mét ph¸i tªn Thiªn V­¬ng Bang g× ®ã, hÌn g× ë ®©y thËt yªn b×nh!")
end

function yes()
	if(GetCash() >= 200)then
		Talk(1,"","Khuyªn tai ®· gãi l¹i råi! Xin gi÷ lÊy!")
		Pay(200);
		AddEventItem(181);
		Msg2Player("B¹n ®­îc mét ®«i b«ng tai");
		AddNote("B¹n mua ®­îc mét ®«i b«ng tai ë chç th­¬ng nh©n ®em vÒ giao cho A Ph­¬ng")
--		SetTask(48, 2);
	else
		Talk(1,"","Kh¸ch quan ch­a ®ñ tiÒn! Khi nµo cã ®ñ tiÒn h·y quay l¹i. ")
	end
end;

function buy_addibox()
		local szMsg = 
		{
				"ThÈm Cöu: §©y lµ chiÕc r­¬ng ®­îc lµm tõ ®¸ san h« xanh, cã thÓ cho ng­¬i bá thªm vËt phÈm, cßn cã thÓ khãa l¹i mét c¸ch an toµn.",	--1
				"Dïng 40 tiÒn ®ång ®Ó mua./#buy_addibox_yes(40)",	--2
				"Dïng 20 tiÒn ®ång ®Ó mua./#buy_addibox_yes(20)",	--3
				"§¾t qu¸! LÇn sau sÏ mua! /no",			--4
		};
		
		local nDate = tonumber(GetLocalDate("%Y%m%d"));
		
		if (nDate >= 20080202 and nDate <= 20080302) then	--´º½Ú»î¶¯ÆÚ¼äÄÚ
			Say(szMsg[1], 2, szMsg[3], szMsg[4]);
		else
			--tinhpn 20100803: Patch Request
			--Say(szMsg[1], 2, szMsg[2], szMsg[4]);
			Say(szMsg[1], 2, szMsg[3], szMsg[4]);
		end;
				
end

function buy_addibox_yes(nNedCount)
	if (nNedCount < 1 or nNedCount == nil) then
		print("Fail!!!!");
		return
	end;
	
	local nCount = CalcEquiproomItemCount(4, 417, 1, 1)
	
	if (nCount < nNedCount) then
		Talk(1,"","Kh¸ch quan ch­a ®ñ tiÒn! Khi nµo cã ®ñ tiÒn h·y quay l¹i.")
		return 1;
	end
	ConsumeEquiproomItem(nNedCount, 4, 417, 1, 1)
	
	WriteGoldLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName()..format("]: Tèn %d TiÒn ®ång, nhËn ®­îc 1 r­¬ng më réng.",nNedCount),-2,0,0,0);
	OpenStoreBox(1)
	
	UseSilver(1, 2, nNedCount); -- ½ğÔª±¦¶Ò»»ÎªÍ­Ç®µÄÏûºÄÍ³¼Æ(Ö±½ÓÏûºÄµÄÔª±¦ÒøÆ±£¬ÓëÍ­Ç®¶Ò»»µÈÍ¬´¦Àí)
	SaveNow(); -- Á¢¼´´æÅÌ
	  	
	Talk(1,"","Tèt qu¸! §ñ tiÒn råi! Ta sÏ lËp tøc l¾p ®Æt r­¬ng! VÒ sau kh¸ch quan chØ cÇn ®Õn n¬i cã r­¬ng chøa ®å cña m×nh më <color=yellow>r­¬ng më réng<color> lµ cã thÓ dïng ®­îc. ")
	Msg2Player("B¹n ®· mua chøc n¨ng më réng r­¬ng, kh«ng gian l­u tr÷ ®· t¨ng lªn! Më r­¬ng ra b¹n sÏ sö dông ®­îc chøc n¨ng nµy. ")
end


function box_help()
	str=
	{
	"<#> Mçi nh©n vËt chØ mua ®­îc mét chøc n¨ng më réng r­¬ng th«i. Nã sÏ theo b¹n suèt, gåm cã 60 «, chøc n¨ng vµ nguyªn lı sö dông gièng nh­ r­¬ng ban ®Çu chØ kh«ng thÓ cÊt gi÷ tiÒn b¹c.",
	"<#> Sau khi mua chøc n¨ng më réng r­¬ng, b¹n nhËn ®­îc mét mËt m· dïng ®Ó b¶o vÖ c¸c trang bŞ trªn ng­êi còng nh­ trong r­¬ng.",
	"<#> Sau khi nhÊn vµo mËt m· sÏ khãa l¹i, cßn trong t×nh tr¹ng th¸i khãa, trang bŞ trªn ng­êi kh«ng ®­îc mÆc lªn còng nh­ cëi bá, nh­ng nã sÏ kh«ng ¶nh h­ëng ®Õn chøc n¨ng s½n cã (Nh­ ®iÓm sè PK qu¸ cao th× sÏ rít c¸c trang bŞ trªn ng­êi) .",
	"<#> ViÖc thiÕt lËp mËt m·: nhÊn vµo giao diÖn r­¬ng chøa ®å n¬i <color=yellow>thiÕt lËp mËt m·<color>, sÏ hiÖn ra mét « nhá, trªn ®ã cã tõ 0-9 sè ®Ó nhËp vµo.",
	"<#> LÇn ®Çu tiªn thiÕt lËp mËt m· ta nhÊn vµo hµng ®ã, cßn nÕu b¹n ®· thiÕt lËp qua khi nhÊn vµo sÏ lµ chØnh söa mËt m·.",
	"<#> Khi chØnh söa mËt m· tr­íc tiªn ta nhËp mËt m· cò vµo sau ®ã nhÊn hai lÇn mËt m· míi, x¸c nhËn chØnh söa thµnh c«ng. §é dµi mËt m· İt nhÊt mét kı tù sè dµi nhÊt lµ 9 kİ tù sè.",
	};
	Talk(6,"",str[1],str[2], str[3], str[4], str[5], str[6]);
end
	
	
function no()
end;
