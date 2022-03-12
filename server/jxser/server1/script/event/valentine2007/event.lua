Include("\\script\\event\\valentine2007\\head.lua");

function isValentine2007()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate >= 20070213 and nDate <= 20070215) then
		return 1;
	else
		return 0;
	end;
end;

function Valentine2007_main()
	Say("NguyÖt L·o: Kh«ng biÕt tõ bao giê, Giang T©n Th«n l¹i b¾t ®Çu mét bÇu kh«ng khİ ngät ngµo ®Õn thÕ. §Ó chóc cho ngµy lÔ ®Æc biÖt nµy, l·o phu sÏ tÆng cho c¸c vŞ ®¹i hiÖp mét İt <color=yellow>H¹t hoa hång<color>. C¸c vŞ cã thÓ cïng 'ng­êi Êy' ®Õn nh÷ng n¬i s¬n thanh thñy tó, tù tay trång <color=yellow>c©y hoa hång<color> cho riªng m×nh.", 3,
			"V©ng, ta muèn nhËn h¹t hoa hång/want_take_roseseed",
			"Ta muèn t×m hiÓu ho¹t ®éng LÔ T×nh Nh©n/about_valentine2007", 
			"Ta sÏ quay l¹i sau/no");
end;

function want_take_roseseed()
	if (checkValentine2007Limit() ~= 1) then
		Say("NguyÖt L·o: ThËt ng¹i qu¸, l·o phu chØ tÆng H¹t hoa hång cho nh÷ng ng­êi ch¬i <color=yellow>cÊp trªn 80 ®· n¹p thÎ<color>.", 0);
		return 0;
	end;
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (GetTask(TSK_VALENTINE_ROSE_DATE) ~= nDate) then
		Say("NguyÖt L·o: <color=yellow>Tõ 13/02/2007 ®Õn hÕt 15/02/20007<color>, c¸c nh©n sü vâ l©m cÊp trªn 80 ®· n¹p thÎ míi cã thÓ t×m l·o phu ®Ó nhËn <color=yellow>1<color> h¹t hoa hång, b¹n muèn nhËn kh«ng?", 2, 
		"V©ng, ta muèn nhËn h¹t hoa hång/sure_task_roseseed",
		"Ta cã viÖc ph¶i ®i/no");
	else
		Say("NguyÖt L·o: Mçi ngµy chØ cã thÓ nhËn ®­îc <color=yellow>1<color> h¹t hoa hång. H«m nay ch¼ng ph¶i ng­¬i ®· nhËn råi hay sao?", 0);
	end;
end;

function sure_task_roseseed()
	if (isValentine2007() == 1) then
		local nDate = tonumber(GetLocalDate("%Y%m%d"));
		if (GetTask(TSK_VALENTINE_ROSE_DATE) ~= nDate) then
			AddItem(6,1,1361,1,0,0);
			SetTask(TSK_VALENTINE_ROSE_DATE, nDate)
			WriteLog(format("[LÔ Tinh Nh©n 2007]\t%sName:%s\tAccount:%s\t ®· nhËn 1 h¹t hoa hång.", GetLocalDate("%Y-%m-%d %H:%M:%S"), GetName(), GetAccount()));
			Say("NguyÖt L·o: H¹t hoa hång ®©y, h·y mau t×m mét n÷a kia ®Ó trång c©y hoa hång ®i.", 0);
		end;
	end;
end;

function about_valentine2007()
	Say("NguyÖt L·o: Trong thêi gian ho¹t ®éng, ng­êi ch¬i cÊp trªn 80 ®· n¹p thÎ mçi ngµy cã thÓ nhËn ®­îc 1 h¹t hoa hång. Cïng tæ ®éi víi mét ng­êi ch¬i kh¸c ph¸i ®Ó cïng nhau trång hoa. Trong khi trång, trªn ngän c©y sÏ xuÊt hiÖn 'dÊu chÊm than', nhÊp vµo c©y hoa hång ®Ó nhËn ®­îc mét nhiÖm vô T­íi n­íc, Bãn ph©n, C¾t cá d¹i, DiÖt s©u bä. NÕu ®«i b¹n hoµn thµnh nhiÖm vô trªn trong thêi gian quy ®Şnh, thao t¸c cµng chİnh x¸c, hoa hång sÏ cµng rùc rì. H·y mau chãng tham gia!", 0);
end;


