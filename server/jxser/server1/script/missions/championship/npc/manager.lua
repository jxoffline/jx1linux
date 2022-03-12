Include("\\script\\missions\\championship\\head.lua")
Include("\\script\\event\\wulin_final_match\\wulin_watchticket.lua")
Include("\\script\\event\\wulin_final_match\\awardevent.lua")
Include("\\script\\tong\\tong_header.lua");

--ÎäÁÖ´ó»á¹ÙÔ±
function main()
	--Say("ÎäÁÖ´ó»á¹ÙÔ±£ºÎäÁÖºÀ½Ü£¬ÖðÂ¹·×ÂÒÖ®ÊÀ£»ÌìÏÂÓ¢ÐÛ£¬Æë¼¯×Ï½ûÖ®áÛ¡£±¾´ÎÎäÁÖ´ó»á×÷ÎªÇøÓòÔ¤Ñ¡Èü£¬½«»áÑ¡³ö90ÃûÎäÁÖ¸ßÊÖ×÷Îª´ú±í±¾·þµÄÑ¡ÊÖ²Î¼Ó×îÖÕµÄÈ«ÇøÈ«·þÎäÁÖ´ó»á£¡È¼·ÅÄãµÄ¼¤Çé£¬À´Í¶ÈëÕâ³¡ºäºäÁÒÁÒµÄÎäÁÖ´ó»á£¡", 1, "È·ÈÏ/want_bid_option")
	--	wulin_watchticketmain()
	wulin_awardmain()	--ÎäÁÖ´ó»á½±ÀøÈë¿Ú
end

function str__findicon(string)
	len = strlen(string)
	for i = 1, len do 
		if (strbyte(string, i) == 93) then
			return 1
		end
	end
	return 0
end

function want_bid_option()
	local optiontab = {}
	if (validateDate(CP_BEGIN_BID_DATE, CP_END_BID_DATE)) then	--ÔÚ¾ºÑ¡Áì¶ÓµÄÊ±¼äÊ±
		talkstr = "Muèn tranh chÊp Tæng LÜnh ®éi cña khu vùc µ?"
		optiontab = {
						"Xem thêi gian kÕt thóc chän Tæng l·nh ®éi/look_endbid",
						"Vµo §Êu tr­êng Vâ l©m ®¹i héi/transtoplace",
						"ta muèn tranh chÊp Tæng l·nh ®éi khu vùc (c¸c Bang chñ) /want_bid",
						"Tra xem tæng vèn th¸ch ®Êu hiÖn nay cña ta/look_bid_self",
						"Tra xem t×nh h×nh th¸ch ®Êu hiÖn nay cña ta /look_bid_first",
						"NhËn danh hiÖu tuyÓn thñ kiÖt xuÊt /catch_title",
						"Gióp ®ì Vâ l©m ®¹i héi/help_championship",
						"Ta sÏ quay l¹i sau!/OnCancel"
					}
	elseif(tonumber(date("%y%m%d%H")) >= CP_UPTO_TRYOUT) then
		talkstr = "Muèn nhËn t­ c¸ch tuyÓn thñ cña khu vùc µ?"	--ÒÑ¾­¾ö³ö×ÜÁì¶Ó
		optiontab = {
						"B¸o danh tham gia liªn ®Êu 'kiÖt xuÊt'/regist_freshman",
						"L·nh l¹i tiÒn th¸ch ®Êu/give_back",
						"NhËn danh hiÖu tuyÓn thñ kiÖt xuÊt /catch_title",
						"L·nh l¹i tiÒn th¸ch ®Êu (Tæng L·nh ®éi) /send_card",
						"Tra xem danh s¸ch tuyÓn thñ kiÖt xuÊt vµ tu c¸ch thi ®Êu/look_card",
						"Gióp ®ì Vâ l©m ®¹i héi/help_championship",
						"Ta sÏ quay l¹i sau!/OnCancel"
			}
	elseif (tonumber(date("%y%m%d%H")) > CP_END_BID_DATE) then
		Say("Ho¹t ®éng tranh chÊp ®· kÕt thóc! Xin ®îi trËn dù tuyÓn §¹i héi Vâ l©m b¾t ®Çu! Sau nµy h·y tra xem kÕt qu¶. ", 0)
		return
	else
		Say(" Ho¹t ®éng Vâ l©m ®¹i héi hiÖn t¹i ch­a b¾t ®Çu! Vui lßng chó ý tin tøc th«ng b¸o!",0);
		return
	end

	Say(talkstr, getn(optiontab), optiontab)
end

function want_bid()
	if (GetTongFigure() ~= TONG_MASTER) then
		Say("ChØ cã Bang chñ míi cã t­ cÊp tham gia th¸ch ®Êu, hay lµ ng­¬i vÒ ®i!", 0);
		return 0
	end
	if(GetLevel() < 90) then
		Say("§¼ng cÊp cña Bang chñ ph¶i lín h¬n cÊp 90 míi cã thÓ tranh chÊp Tæng L·nh ®éi! Ng­¬i h·y trë vÒ!", 0)
		return
	end
	local strName = GetName();
	if (str__findicon(strName) == 0) then
		Say("Sè tiÒn mçi lÇn ®Êu thÇu lµ sè ch½n 100 v¹n, gi¸ thÊp nhÊt lµ 100 v¹n l­îng, mçi lÇn ®Êu thÇu nhiÒu nhÊt lµ 50 ngµn v¹n l­îng. ", 2, "X¸c nhËn/sure_bid", "Hñy bá /OnCancel")
	end
end

function sure_bid()
	if (GetTongFigure() ~= TONG_MASTER) then
		Say("ChØ cã Bang chñ míi cã t­ cÊp tham gia th¸ch ®Êu, hay lµ ng­¬i vÒ ®i!", 0);
		return 0
	end

	local flag = check_bid_title()
	if (not flag) then  
		return
	end
	AskClientForNumber("bit",1000000,500000000, "Xin nhËp sè tiÒn ®Êu thÇu vµo:");
end

function check_bid_title()
	biwu_loadfile(LEVELTOP10)
	local name = GetName()
	for i =1 , 10 do 
		topten_name = biwu_getdata(LEVELTOP10, "LevelTop10", "Top"..i)
		if (name == topten_name) then
			Say("B¹n ®· vµo thÕ giíi thËp ®¹i cao thñ, cã t­ c¸ch tham gia vµo §¹i héi Vâ l©m kiÖt xuÊt! B¹n kh«ng thÓ tranh chøc Tæng L·nh ®éi! H·y vÒ ®i!", 0)
			return nil
		end
	end
	return 1
end


function bit(fee)
	if( fee < 1000000 ) then
		Say("Gi¸ tranh chøc thÊp nhÊt lµ 100 v¹n.", 0);
		return 0
	end
	if( fee > 500000000 ) then
		Say("Mçi lÇn tranh chøc nhiÒu nhÊt lµ 50 ngµn v¹n l­îng.", 0);
		return 0
	end
	if( GetCash() < fee ) then
		Say("B¹n kh«ng ®ñ tiÒn, chuÈn bÞ ®ñ h·y tíi nhÐ!", 0);
		return 0
	end
	biwu_loadfile(BID_DATA);
	MasterName = GetName();
	intTongBid = tonumber(biwu_getdata(BID_DATA, MasterName, "Bid"));
	if (not intTongBid) then
		intTongBid = 0
	end
	intfee = floor(fee/1000000)
	if (mod(fee, 1000000) ~= 0) then
		dibs = mod(fee, 1000000)
		fee = intfee * 1000000
		Msg2Player(" Sè tiÒn mçi lÇn tranh chøc ph¶i lµ sè ch½n 100 v¹n, tr¶ l¹i b¹n tiÒn cßn d­!"..dibs.." l­îng")
	end
	Pay(fee);
	fee = floor(fee/10000)
	if( intTongBid == 0 ) then
		biwu_setdata(BID_DATA, MasterName, "Bid", intfee);
		biwu_setdata(BID_DATA, MasterName, "MasterName", MasterName);
		biwu_save(BID_DATA);
		cp_saveback_count(fee)
		Ladder_NewLadder(10130, MasterName, intfee, 1);
print("the first bid")
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]tranh chøc"..fee.."v¹n l­îng.");
		Say("B¹n lÇn ®Çu ®Õn tranh chøc. Sè tiÒn tranh chøc lÇn nµy lµ "..fee.."v¹n l­îng. HÖ thèng ®· ghi tªn, sè tiÒn vµ tµi kho¶n cña b¹n, thao t¸c tham gia tranh chøc cña b¹n ®· hoµn thµnh.",0);
		Msg2SubWorld("Ng­êi ch¬i <color=blue> "..GetName().."<color> Võa míi tham dù tranh chøc Tæng l·nh ®éi cña khu vùc")
		return 1
	end
print("bid back bid")
	intTongBid = intTongBid + intfee;
	TongBid = 100 * intTongBid;
	biwu_setdata(BID_DATA, MasterName, "Bid", tostring(intTongBid));
	biwu_setdata(BID_DATA, MasterName, "MasterName", MasterName);
	biwu_save(BID_DATA);
	cp_saveback_count(TongBid)
	Ladder_NewLadder(10130, MasterName, intTongBid, 1);
	WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]tiÕp tôc tranh chøc"..fee.."v¹n l­îng. HiÖn tæng sè tiÒn lµ "..TongBid.."v¹n l­îng.");
		Say("Sè tiÒn tranh chøc lÇn nµy cña b¹n lµ "..fee.."v¹n l­îng. HÖ thèng ®· ghi tªn, sè tiÒn vµ tµi kho¶n cña b¹n, thao t¸c tham gia tranh chøc cña b¹n ®· hoµn thµnh.Cho ®Õn hiÖn nay, tæng sè tiÒn tranh chøc cña b¹n lµ "..TongBid.."v¹n l­îng.", 0);
		Msg2SubWorld("Ng­êi ch¬i <color=blue> "..GetName().."<color> Võa míi tham dù tranh chøc Tæng l·nh ®éi cña khu vùc")
	return 1
end

CP_SENDCARD_OPEN = 5052820
CP_SENDCARD_END = 5060420

function send_card()	--Ñ¡ÔñÊÇ·ñÅÉ·¢

	sendmonth , senddate , sendhour = look_the_time( CP_SENDCARD_OPEN )
	endmonth , enddate , endhour = look_the_time( CP_SENDCARD_END )
if ( tonumber( date( "%y%m%d%H" ) ) < CP_SENDCARD_OPEN ) then
	Say(" Tæng L·nh ®éi cßn t­ c¸ch ®Õn "..sendmonth.."nguyÖt "..senddate.."nhËt "..sendhour..", ®Õn"..endmonth.."nguyÖt "..enddate.."nhËt "..endhour.." kÕt thóc", 0)
	return
end

if ( tonumber( date( "%y%m%d%H" ) ) > CP_SENDCARD_END ) then
	Say("Tæng lÜnh ®éi ph¸t quyÕt t­ c¸ch tham gia vâ l©m kiÖt xuÊt ®· kÕt thóc, b¹n cã thÓ ®Õn tra xem danh danh s¸ch tuyÓn thñ trËn vâ l©m kiÖt xuÊt!", 0)
return
end

	local orgindex = PlayerIndex
	biwu_loadfile(BID_LEADER)
	local leader_name = biwu_getdata(BID_LEADER, "Leader_Name", "Name")
	if (GetName() ~= leader_name) then
		Say("B¹n kh«ng ph¶i lµ Tæng L·nh ®éi khu vùc, kh«ng cã t­ c¸ch chän t­ c¸ch tham gia trËn vâ l©m kiÖt xuÊt!", 0)
		return
	end
	if ( IsCaptain() ~= 1 ) then
		Say("B¹n kh«ng ph¶i lµ ®éi tr­ëng, ph¶i do ®éi tr­ëng cña nhãm ph¸i ra. ",0);
		return 0
	end
	MemCount = GetTeamSize();
	if ( MemCount <= 1 ) then
		Say("Trong ®éi cña b¹n kh«ng cã thµnh viªn kh¸c, kh«ng thÓ ph¸i ra.",0);
		return 0
	end
	local TeamMembers = "";
	for i = 2, MemCount do
		PlayerIndex = GetTeamMember(i);
		TeamMembers = TeamMembers..","..GetName()
	end
	PlayerIndex = orgindex
	Say("Ng­¬i muèn ph¸i"..TeamMembers.."Tham gia vßng chung kÕt? NÕu ®¼ng cÊp d­íi 90 sÏ kh«ng ®ñ t­ c¸ch thi ®Êu. CÇn <color=yellow>"..endmonth.."nguyÖt "..enddate.."nhËt "..endhour.." <color> kÕt thóc.", 2, "Muèn/ensure", "ta ®ang suy nghÜ /OnCancel"); 
	return
end

function ensure(ncount)	--È·ÈÏÅÉ·¢
	local tabname = {}
	local ncount = 0
	local orgindex = PlayerIndex
	MemCount = GetTeamSize();
	for i = 1, MemCount do
		PlayerIndex = GetTeamMember(i);
		
		cp_checkmember_title()	--È·¶¨µ±Ç°¶ÓÔ±Éí·Ý
				
		if ( IsCaptain() ~= 1 and GetTask(CP_TASKID_TITLE) ~= 9 and GetLevel() >= 90) then --Èç¹û²»ÊÇ¶Ó³¤×Ô¼º,²¢ÇÒÃ»¸ø¹ý×Ê¸ñ
			TeamMemberName = GetName();
			local flag = provide(TeamMemberName);
			if (not flag) then 
				PlayerIndex = orgindex
				Say("Ng­¬i ®· hÕt quyÒn ph¸i ng­êi tham gia vßng chung kÕt", 0)
				WriteLog(date("%Y-%m-%d %H:%M:%S,")..GetAccount()..",["..GetName().."] Tæng l·mh ®éi  míi cã t­ c¸ch ph¸i ng­êi tham gia thi ®Êu!")
				break 
			end
			nt_settask(CP_TASKID_TITLE, 9)
			Title_AddTitle(19, 1, TITLETIME);	--ÕâÑùÊÇ¸ø×Ô¼º¼Ó»¹ÊÇ¸ø¶ÓÓÑ£¿
			Title_ActiveTitle( 19 );
			Talk(1, "", "B¹n nhËn ®­îc danh hiÖu tuyÓn thñ Vâ l©m ®¹i héi");
			Msg2SubWorld("Chóc mõng Ng­êi ch¬i ["..GetName().."] ®· nhËn ®­îc t­ c¸ch tuyÓn thñ Vâ l©m ®¹i héi ")
			WriteLog(date("%Y-%m-%d %H:%M:%S,")..GetAccount()..",["..GetName().."] Tæng L·nh ®éi xÐt duyÖt t­ c¸ch thi ®Êu")
		elseif( IsCaptain() ~= 1 and GetTask(CP_TASKID_TITLE) == 9 ) then
			Msg2Player("b¹n ®· cã t­ c¸ch tuyÓn thñ vßng chung kÕt")
		elseif( IsCaptain() ~= 1 and GetLevel() < 90 ) then
			Msg2Player("®¼ng cÊp cña b¹n ch­a ®¹t ®Õn cÊp 90, kh«ng thÓ nhËn t­ c¸ch tuyÓn thñ vßng chung kÕt")
		end
	end
	PlayerIndex = orgindex
end

function provide(MemberName)	--ÅÉ·¢×Ê¸ñ
	biwu_loadfile(LEADER_MEMBER);
	MemberCount = tonumber(biwu_getdata(LEADER_MEMBER, "LeadMember", "Count"));	--È¡Êý£¬Èç¹û¿ªÊ¼datÎª¿Õ»á²»»áÓÐ´í£¬ÐèÒª³õÊ¼»¯°É£¿
	if (not MemberCount) then	--²»ÖªµÀdatÎª¿Õ»á·µ»ØÊ²Ã´
		MemberCount = 0;
	end
	if ( MemberCount >= 29 ) then
		Say("Sè ®éi thi ®Êu cña khu vùc nµy ®· ®ñ, b¹n kh«ng thÓ nhËn ®­îc t­ c¸ch nµy.", 0);
		return nil
	end
	count = tostring(MemberCount + 1);
	biwu_setdata(LEADER_MEMBER, "LeadMember", "Count", count);	--¼ÆÊý
	biwu_setdata(LEADER_MEMBER, "LeadMember", "Member"..count, MemberName);
	biwu_setdata(LEADER_MEMBER, "LeadMember", "Fact"..count, tostring(GetLastFactionNumber()) )
	biwu_save(LEADER_MEMBER);
	return 1
end

function give_back()
	biwu_loadfile(BID_DATA)
	MasterName = GetName();
	TongBid = tonumber(biwu_getdata(BID_DATA, MasterName, "Bid"));
	if (not TongBid) then
		Say("B¹n ch­a tham gia ho¹t ®éng tranh tuyÓn l·nh ®éi, sao còng muèn m¹o hiÓm?", 0)
		return
	end
	biwu_loadfile(BID_LEADER)
	firstname = biwu_getdata(BID_LEADER, "Leader_Name", "Name")
	if (firstname ~= "" and firstname ~= nil and firstname == MasterName) then
		Say("B¹n ®· tranh tuyÓn t­ c¸ch Tæng L·nh ®éi cña khu vùc nµy, kh«ng thÓ tr¶ l¹i tiÒn cho b¹n!", 0)
		return
	end
	if (TongBid == 0) then
		Say("Sè tiÒn tranh chøc mµ b¹n tranh tuyÓn, ta ®· tr¶ b¹n råi.", 0)
		return
	end
	if (nt_gettask(CP_TASKID_BACKCONT) <= 0) then
		Say("Sè tiÒn tranh chøc mµ b¹n tranh tuyÓn ta ®· tr¶ hÕt cho b¹n råi.", 0)
		return
	end
	Say("NÕu sè tiÒn lín h¬n 50 ng¹n v¹n l­îng, b¹n sÏ ®­îc tr¶ tiÒn mçi lÇn lín nhÊt lµ 50 ngµn v¹n l­îng. Tr­íc khi l·nh h·y x¸c nhËn b¹n cã thÓ mang ®­îc sè tiÒn nµy.", 2, "HiÖn ta ®· l·nh/sure_give_back", "§îi chót ta quay l¹i/OnCancel")
end

function sure_give_back()
	biwu_loadfile(BID_DATA)
	MasterName = GetName();
	TongBid = tonumber(biwu_getdata(BID_DATA, MasterName, "Bid"));
	if (not TongBid) then
		Say("B¹n ch­a tham gia ho¹t ®éng tranh tuyÓn l·nh ®éi, sao còng muèn m¹o hiÓm?", 0)
		return
	end
	biwu_loadfile(BID_LEADER)
	firstname = biwu_getdata(BID_LEADER, "Leader_Name", "Name")
	if (firstname ~= "" and firstname ~= nil and firstname == MasterName) then
		Say("B¹n ®· tranh tuyÓn t­ c¸ch Tæng L·nh ®éi cña khu vùc nµy, kh«ng thÓ tr¶ l¹i tiÒn cho b¹n!", 0)
		return
	end
	if (TongBid == 0) then
		Say("Sè tiÒn tranh chøc mµ b¹n tranh tuyÓn, ta ®· tr¶ b¹n råi.", 0)
		return
	end
	if (nt_gettask(CP_TASKID_BACKCONT) <= 0) then
		Say("Sè tiÒn tranh chøc mµ b¹n tranh tuyÓn ta ®· tr¶ hÕt cho b¹n råi.", 0)
		return
	end

	if (GetCash() > 1500000000) then
		Say("H×nh nh­ b¹n mang theo qu¸ nhiÒu tiÒn, tiÒn cÇn tr¶ l¹i cho b¹n ta t¹m thêi gi÷ lÊy. §îi ®Õn lóc b¹n cã thÓ ®ùng ®­îc tiÒn råi h·y ®Õn l·nh.", 0)
		return
	end

	BackBid = TongBid
	if (BackBid > 500) then
		BackBid = 500
		TongBid = TongBid - BackBid
		biwu_setdata(BID_DATA, MasterName, "Bid", tostring(TongBid));
		biwu_save(BID_DATA);
		BackBid = 500 * 1000000
		Earn(BackBid)
		nt_settask(CP_TASKID_BACKCONT, nt_gettask(CP_TASKID_BACKCONT) - 1)
		TongBid = TongBid * 100
		WriteLog(date("%Y%m%d %H:%M:%S")..GetAccount()..",["..GetName().."]nhËn ®­îc 50 ngµn v¹n l­îng, cßn l¹i"..TongBid.."v¹n l­îng ch­a tr¶.")
		Say("V× sè tiÒn tranh chøc cña b¹n lín h¬n 50 ngµn v¹n l­îng, ta tr¶ cho b¹n 50 ngµn v¹n l­îng tr­íc, b¹n cßn l¹i<color=yellow>"..TongBid.."<color>v¹n l­îng ë chç ta, h·y x¸c nhËn hµnh trang cña b¹n cã thÓ chøa ®ñ tiÒn råi h·y quay l¹i nhËn tiÒn!", 0)
	else
		BackBid = BackBid * 1000000
		biwu_setdata(BID_DATA, MasterName, "Bid", tostring(0))
		biwu_save(BID_DATA);
		Earn(BackBid)
		nt_settask(CP_TASKID_BACKCONT, 0)
		BackBid = BackBid/10000
		WriteLog(date("%Y%m%d %H:%M:%S")..GetAccount()..",["..GetName().."]nhËn ®­îc tiÒn tr¶ l¹i"..BackBid.."v¹n l­îng, ®· tr¶ l¹i tÊt c¶ tiÒn tranh chøc.")
		Say("Ta tr¶<color=yellow>"..BackBid.."<color>v¹n l­îng cho b¹n, xin nhËn lÊy!", 0)
	end
end

function catch_title()
	Say("B¹n muèn nhËn danh hiÖu nµo?", 5, "Tæng L·nh ®éi/leader", "ThËp ®¹i cao thñ thÕ giíi/level_top10", "Vâ L©m §¹i héi tuyÓn thñ /nomal_player", "5 h¹ng ®Çu cña mçi ThËp ®¹i m«n ph¸i/#faction_top5("..GetLastFactionNumber()..")", "Kh«ng muèn/OnCancel");
end

function level_top10()	--ÊÀ½çÊ®´óÁìÈ¡³ÆºÅ
	biwu_loadfile(LEVELTOP10);
	for i = 1, 10 do
		Name = biwu_getdata(LEVELTOP10, "LevelTop10", "Top"..i);
		if ( GetName() == Name ) then
			nt_settask(CP_TASKID_TITLE, 9)
			Title_AddTitle(8, 1, TITLETIME);
			Title_ActiveTitle( 8 );
			WriteLog(date("%Y%m%d %H:%M:%S")..GetAccount()..",["..GetName().."]®· nhËn ®­îc danh hiÖu ThËp ®¹i cao thñ Vâ l©m ®¹i héi")
			Msg2Player("B¹n nhËn ®­îc danh hiÖu ThËp ®¹i cao thñ Vâ l©m ®¹i héi");
			return 1
		end
	end
	Say("B¹n kh«ng cã t­ c¸ch nhËn danh hiÖu ThËp ®¹i cao thñ thÕ giíi.", 0);
	return
end

function faction_top5(factionnumber)	--10´óÃÅÅÉÇ°ÎåÁìÈ¡³ÆºÅ
	if( factionnumber < 0 or factionnumber > 9 ) then
		Say("B¹n kh«ng ph¶i ng­êi cña ThËp ®¹i m«n ph¸i.", 0);
		return
	end
	if( tonumber(date("%y%m%d%H")) < CP_END_TRYOUT ) then
		Say("TrËn dù tuyÓn m«n ph¸i hiÖn ch­a kÕt thóc, ch­a t×m ra 5 h¹ng ®øng dÇu m«n ph¸i, kh«ng thÓ cÊp danh hiÖu.", 0)
		return
	end
	biwu_loadfile( Faction[factionnumber + 1][1] );
		for i = 1, 5 do
		Name = biwu_getdata(Faction[factionnumber+1][1], Faction[factionnumber+1][2], "Top"..i);
		if ( GetName() == Name ) then
			nt_settask(CP_TASKID_TITLE, 9)
			Title_AddTitle(factionnumber + 9, 1, TITLETIME);
			Title_ActiveTitle(factionnumber + 9);
			WriteLog(date("%Y%m%d %H:%M:%S")..GetAccount()..",["..GetName().."]®¹t ®­îc"..FactionTitle[factionnumber+1].."danh hiÖu");
			Msg2Player("B¹n ®¹t ®­îc"..FactionTitle[factionnumber+1].."danh hiÖu");
			return 1
		end
	end
	Say("B¹n kh«ng ®ñ t­ c¸ch nhËn danh hiÖu Cao thñ m«n ph¸i Vâ l©m ®¹i héi.",0);
	return
end

function nomal_player()
	biwu_loadfile(LEADER_MEMBER)
	count = tonumber(biwu_getdata(LEADER_MEMBER, "LeadMember", "Count"))
	if(not count ) then
		Say("Quan viªn Vâ l©m kiÖt xuÊt:Tæng L·nh ®éi ch­a cÊp ph¸t t­ c¸ch dù tuyÓn cho b¹n, b¹n kh«ng cã t­ c¸ch ®Ó nhËn danh hiÖu!", 0)
		return
	end
	local name = GetName()
	for i = 1, count do
		mem_name = biwu_getdata(LEADER_MEMBER, "LeadMember", "Member"..i);
		if (mem_name == name) then
			nt_settask(CP_TASKID_TITLE, 9)
			Title_AddTitle(19, 1, TITLETIME);	--ÕâÑùÊÇ¸ø×Ô¼º¼Ó»¹ÊÇ¸ø¶ÓÓÑ£¿
			Title_ActiveTitle( 19 );
			WriteLog(date("%Y%m%d %H:%M:%S")..GetAccount()..",["..GetName().."]®· nhËn ®­îc danh hiÖu TuyÓn thñ Vâ l©m ®¹i héi ");
			Msg2Player("B¹n nhËn ®­îc danh hiÖu TuyÓn thñ Vâ l©m ®¹i héi");
			return
		end
	end
	Say("Tæng L·nh ®éi ch­a cÊp ph¸t t­ c¸ch dù tuyÓn cho b¹n, b¹n kh«ng thÓ nhËn ®Æc ©n nµy!", 0)
end

function leader()	--Áì¶ÓÁìÈ¡³ÆºÅ
	biwu_loadfile(BID_LEADER)
	local name = biwu_getdata(BID_LEADER, "Leader_Name", "Name")
	if(GetName() ~= name) then
		Say("B¹n kh«ng ®ñ t­ c¸ch nhËn danh hiÖu L·nh ®éi khu vùc nµy.", 0)
		return
	end
	nt_settask(CP_TASKID_TITLE, 9)
	Title_AddTitle(7, 1, TITLETIME);
	Title_ActiveTitle(7);
	WriteLog(date("%Y%m%d %H:%M:%S")..GetAccount()..",["..GetName().."]®· nhËn ®­îc danh hiÖu Tæng L·nh ®éi Vâ L©m ®¹i héi");
	Msg2Player("B¹n nhËn ®­îc Tæng L·nh ®éi Vâ L©m ®¹i héi");
end

function look_bid_first()
	local MasterName = Ladder_GetLadderInfo(10130, 1);
	if (not MasterName ) then
		Say("HiÖn kh«ng cã ng­êi tranh chøc.", 0)
print("no new ladder1")
		return
	end
	if (MasterName == "") then
		Say("HiÖn kh«ng cã ng­êi tranh chøc.", 0)
print("no new ladder2")
		return
	end
	Say("HiÖn ng­êi tranh chøc ng­êi tham gia tranh chøc cao nhÊt lµ<color=yellow>"..MasterName.."<color> ng­êi ch¬i.", 0)	
end

function look_bid_self()
	local tabmaster = {}
	local flag = 0
	biwu_loadfile(BID_DATA);
	MasterName = GetName();
	TongBid = tonumber(biwu_getdata(BID_DATA, MasterName, "Bid"));
	if( not TongBid ) then
		Say("B¹n ch­a tham gia ho¹t ®éng tranh chøc, cã muèn thö kh«ng?", 0)
		return
	end
	TongBid = TongBid * 100
	for i = 1, 10 do 
		tabmaster[i] = Ladder_GetLadderInfo(10130, i);
		if (MasterName == tabmaster[i]) then
			flag = i
			break
		end
	end
	if (flag == 0) then
		Say("Sè tiÒn tranh chøc cña b¹n hiÖn lµ "..TongBid.."v¹n l­îng, ch­a vµo 10 h¹ng ®Çu.", 0)
	else
		Say("Sè tiÒn tranh chøc cña b¹n hiÖn lµ "..TongBid.."v¹n l­îng, xÕp h¹ng"..flag..", ", 0)
	end
end

function look_card()
	listtab = {
				"Danh s¸ch ThËp ®¹i cao thñ thÕ giíi ®­îc tuyÓn/look_list_topten",
				"5 h¹ng ®Çu cña mçi m«n ph¸i ®­îc tuyÓn/look_list_factop",
				"Tæng L·nh ®éi vµ c¸c tuyÓn thñ kh¸c/look_list_member",
				"cßn g× ®Ñp kh«ng?/OnCancel"
				}
	Say("B¹n muèn xem danh s¸ch nµo? ", getn(listtab), listtab)
end

function look_list_topten()
	biwu_loadfile(LEVELTOP10);
	local topten_mem = {}
	local ncount = 0;
	for i = 1, 10 do
		 name = biwu_getdata(LEVELTOP10, "LevelTop10", "Top"..i);
		 if (name ~= "" and name ~= nil) then
		 	ncount = ncount + 1
		 	topten_mem[ncount] = name.."/OnCancel"	
		 end
	end
	
	if (ncount > 0) then
		Say("Danh s¸ch ThËp ®¹i cao thñ thÕ giíi ®­îc tuyÓn nh­ sau: ", getn(topten_mem), topten_mem)
	else
		Say("Danh s¸ch ThËp ®¹i cao thñ thÕ giíi hiÖn ch­a xuÊt hiÖn. ", 0)
	end
end

function look_list_factop()
	if (tonumber(date("%y%m%d%H")) < CP_END_TRYOUT) then
		Say(" TrËn ®Êu ch­a kÕt thóc, danh s¸ch ®ñ t­ c¸ch ®­îc tuyÓn ë c¸c m«n ph¸i ch­a xuÊt hiÖn. ", 0)
		return
	end
local factab = {"ThiÕu L©m/#look_list_fac(1)", "Thiªn V­¬ng/#look_list_fac(2)", "§­êng M«n/#look_list_fac(3)", "Ngò §éc/#look_list_fac(4)", "Nga Mi/#look_list_fac(5)", "Thóy Yªn/#look_list_fac(6)", "C¸i Bang/#look_list_fac(7)", "Thiªn NhÉn/#look_list_fac(8)", "Vâ §ang/#look_list_fac(9)", "C«n L«n/#look_list_fac(10)" , "Kh«ng xem n÷a!/OnCancel"}
	Say("B¹n muèn xem danh s¸ch ®­îc tuyÓn cña m«n ph¸i ®ã µ?", getn(factab), factab)
end

function look_list_fac(nfact)
	local ncount = 0
	biwu_loadfile( Faction[nfact][1] );
	local topfac_mem = {}
	for i = 1, 5 do
		name = biwu_getdata(Faction[nfact][1], Faction[nfact][2], "Top"..i);
		 if (name ~= "" and name ~= nil) then
		 	ncount = ncount + 1
		 	topfac_mem[ncount] = name.."/OnCancel"
		 end
	end
	if (ncount > 0) then
		Say("Quan viªn Vâ l©m kiÖt xuÊt:"..Faction[nfact][3].."Danh s¸ch m«n ph¸i tróng tuyÓn:", getn(topfac_mem), topfac_mem);
	else
		Say("Quan viªn Vâ l©m kiÖt xuÊt:"..Faction[nfact][3].."Danh s¸ch tróng tuyÓn thi ®Êu dù tuyÓn m«n ph¸i vÉn ch­a cã.", 0)
	end
end

function look_list_member()
	local member_tab = {}
	biwu_loadfile(BID_LEADER)
	local leader_name = biwu_getdata(BID_LEADER, "Leader_Name", "Name")
	if (leader_name == "" or leader_name == nil) then
		Say("HiÖn ch­a cã Tæng L·nh ®éi.", 0)
		return
	end
	biwu_loadfile(LEADER_MEMBER);
	MemberCount = tonumber(biwu_getdata(LEADER_MEMBER, "LeadMember", "Count"));	--È¡Êý£¬Èç¹û¿ªÊ¼datÎª¿Õ»á²»»áÓÐ´í£¬ÐèÒª³õÊ¼»¯°É£¿
	if (not MemberCount) then	--²»ÖªµÀdatÎª¿Õ»á·µ»ØÊ²Ã´
		MemberCount = 0;
		Say("Tæng L·nh ®éi<color=yellow> "..leader_name.." <color>HiÖn ch­a ®­a ra bÊt cø t­ c¸ch nµo cho ng­êi ch¬i cßn l¹i.", 0)
		return
	end
	if (MemberCount <= 10) then
		member_tab = member_10_group(1, MemberCount)
		for i =1, getn(member_tab) do
			member_tab[i] = member_tab[i].."/OnCancel"
		end
		Say("Tæng L·nh ®éi cña khu vùc nµy lµ<color=yellow>"..leader_name.."<color>, hiÖn ®· ®­a ra t­ c¸ch tuyÓn thñ gåm"..MemberCount.."ng­êi, danh s¸ch nh­ sau:", getn(member_tab), member_tab)
	else
		member_tab = member_10_group(1, 10)
		for i =1, getn(member_tab) do
			member_tab[i] = member_tab[i].."/#look_list_member1(10)"
		end
		Say("Tæng L·nh ®éi cña khu vùc nµy lµ<color=yellow>"..leader_name.."<color>, hiÖn ®· ®­a ra t­ c¸ch tuyÓn thñ gåm"..MemberCount.."ng­êi, danh s¸ch nh­ sau:", getn(member_tab), member_tab)
	end				
end

function look_list_member1(count)
	local member_tab = {}
	biwu_loadfile(LEADER_MEMBER);
	MemberCount1 = tonumber(biwu_getdata(LEADER_MEMBER, "LeadMember", "Count"));	--È¡Êý£¬Èç¹û¿ªÊ¼datÎª¿Õ»á²»»áÓÐ´í£¬ÐèÒª³õÊ¼»¯°É£¿
	MemberCount1 = MemberCount1 - count
	count1 = count + 1
	if (MemberCount1 <= 10) then
		member_tab = member_10_group(count1, MemberCount)
		for i =1, getn(member_tab) do
			member_tab[i] = member_tab[i].."/OnCancel"
		end
		Say("Quan viªn Vâ l©m kiÖt xuÊt:", getn(member_tab), member_tab)
	else
		count2 = count + 10
		member_tab = member_10_group(count1, count2)
		for i =1, getn(member_tab) do
			member_tab[i] = member_tab[i].."/#look_list_member2(20)"
		end
		Say("Quan viªn Vâ l©m kiÖt xuÊt:", getn(member_tab), member_tab)
	end				
end

function look_list_member2(count)
	biwu_loadfile(LEADER_MEMBER);
	MemberCount1 = tonumber(biwu_getdata(LEADER_MEMBER, "LeadMember", "Count"));	--È¡Êý£¬Èç¹û¿ªÊ¼datÎª¿Õ»á²»»áÓÐ´í£¬ÐèÒª³õÊ¼»¯°É£¿
	count1 = count + 1
	member_tab = member_10_group(count1, MemberCount)
	for i =1, getn(member_tab) do
		member_tab[i] = member_tab[i].."/OnCancel"
	end
	Say("Quan viªn Vâ l©m kiÖt xuÊt:", getn(member_tab), member_tab)
end


function member_10_group(start, ending)
	biwu_loadfile(LEADER_MEMBER);
	local memtab = {}
	local count = ending - start + 1
	for i = 1, count do
		j = i + start - 1
		memtab[i] = biwu_getdata(LEADER_MEMBER, "LeadMember", "Member"..j);
	end
	return memtab
end

function cp_saveback_count(tol_money)
	if (mod(tol_money, 50000) > 0) then
		back_count = floor(tol_money / 50000) + 1
	else
		back_count = floor(tol_money / 50000)
	end
	nt_settask(CP_TASKID_BACKCONT, back_count)
end

function regist_champion()
Say("TrËn dù tuyÓn §¹i héi Vâ l©m kiÖt xuÊt ®· kÕt thóc tèt ®Ñp. B©y giê cã thÓ ®Õn chç ta xem kÕt qu¶ thi ®Êu vµ l·nh danh hiÖu t­¬ng øng. Chê mong Vâ l©m ®¹i héi b¾t ®Çu.", 0)
do return end
	if (nt_gettask(CP_TASKID_REGIST) == 9) then
		Say(" B¹n ®· tõ bá t­ c¸ch thi ®Êu dù tuyÓn c¸c m«n ph¸i, kh«ng thÓ tiÕp tôc b¸o danh tham gia.", 0)
		return
	end
	
	biwu_loadfile(BID_LEADER )
	local leader_name = biwu_getdata(BID_LEADER, "Leader_Name", "Name")
	if (leader_name ~= "" and leader_name ~= nil) then
		if (GetName() == leader_name) then
			nt_settask(CP_TASKID_TITLE, 9)
		end
	end
	
	biwu_loadfile(LEVELTOP10)
	for i = 1, 10 do
		Name = biwu_getdata(LEVELTOP10, "LevelTop10", "Top"..i);
		if(Name ~= "" and Name ~= nil) then
			if ( GetName() == Name ) then
				nt_settask(CP_TASKID_TITLE, 9)
			end
		end
	end
	
	biwu_loadfile(LEADER_MEMBER)
	count = tonumber(biwu_getdata(LEADER_MEMBER, "LeadMember", "Count"))
	if(not count ) then
	else
		for i = 1, count do
			mem_name = biwu_getdata(LEADER_MEMBER, "LeadMember", "Member"..i);
			if (mem_name ~= "" and mem_name ~= nil) then
				if (mem_name == GetName()) then
					nt_settask(CP_TASKID_TITLE, 9)
				end
			end
		end
	end
	
	if (nt_gettask(CP_TASKID_TITLE) == 9) then		--ÒÑ¾­È¡µÃ¾öÈüÈ¦×Ê¸ñ
		Say("B¹n ®· nhËn ®­îc t­ c¸ch tuyÓn thñ, th× ®õng tíi c­íp vÞ trÝ n÷a!", 0)
		return
	end
	
	if (GetLevel() < 90) then
		Say("B¹n ph¶i ®¹t ®­îc cÊp 90 trë lªn míi cã thÓ x©m nhËp ®Êu tr­êng Vâ l©m ®¹i héi, h·y tiÕp tôc luyÖn thªm!", 0)
		return
	end
	
	if (GetLastFactionNumber() == -1) then
		Say("Vâ L©m Minh Chñ cã lÖnh: ChØ cã ng­êi cña ThËp ®¹i ph¸i ®­îc tham gia §¹i héi vâ l©m, ng­¬i kh«ng m«n kh«ng ph¸i kh«ng thÓ tham gia. Sau khi gia nhËp ThËp ®¹i ph¸i míi ®­îc tham gia thi ®Êu!", 0)
		return
	end
	
	if (nt_gettask(CP_TASKID_REGIST) == CP_UPTO_TRYOUT) then
		transtoplace()
	else
		local talkstr = "B¸o danh tham gia trËn dù tuyÓn, cÇn nép 10 v¹n l­îng phÝ b¸o danh."
		Say(talkstr, 2, "§©y lµ 10 v¹n l­îng./sure_regist", "§Ó ta xem l¹i/OnCancel")
		return
	end
end

function sure_regist()
	if (GetCash() >= CP_CASH) then
		Pay(CP_CASH)
		
		nt_settask(CP_TASKID_REGIST, CP_UPTO_TRYOUT)
		for i = 1084 , 1092 do
			nt_settask(i, 0)
		end

		transtoplace()
		return
	end
	Say("B¹n kh«ng cã ®ñ phÝ b¸o danh, ®ñ 10 v¹n h·y quay l¹i!", 0)

end

function regist_freshman()
	Msg2Player( " ®Õn Sø gi¶ kiÖt xuÊt b¸o danh tham gia thi ®Êu" )
	NewWorld( 176, 1624, 3233 )
end

function look_endbid()
	local endbid_year = floor(CP_END_BID_DATE / 1000000)
	local endbid_month = mod(floor(CP_END_BID_DATE / 10000), 100)
	local endbid_date = mod(floor(CP_END_BID_DATE / 100), 100)
	local endbid_hour = mod(CP_END_BID_DATE,100)
	Say(" Tæng L·nh ®éi cã t­ c¸ch ®Õn"..endbid_month.."nguyÖt "..endbid_date.."nhËt "..endbid_hour.." giê kÕt thóc, thêi gian hiÖn giê lµ "..date("d ngµy% %m th¸ng %Y n¨m H giê "), 0)	
end

function look_the_time( THETIME )
	local the_year = floor(THETIME / 1000000)
	local the_month = mod(floor(THETIME / 10000), 100)
	local the_date = mod(floor(THETIME / 100), 100)
	local the_hour = mod(THETIME,100)
	return	the_month, the_date, the_hour
end

function cp_checkmember_title()

		biwu_loadfile(BID_LEADER)
		Name = biwu_getdata(BID_LEADER, "Leader_Name", "Name")
		if (GetName() == Name) then
			nt_settask(CP_TASKID_TITLE, 9)
		end

		factionnumber = GetLastFactionNumber()
		biwu_loadfile( Faction[factionnumber + 1][1] );
		for i = 1, 5 do
			Name = biwu_getdata(Faction[factionnumber+1][1], Faction[factionnumber+1][2], "Top"..i);
			if ( GetName() == Name ) then
				nt_settask(CP_TASKID_TITLE, 9)
			end
		end
		
		biwu_loadfile(LEVELTOP10);
		for i = 1, 10 do
			Name = biwu_getdata(LEVELTOP10, "LevelTop10", "Top"..i);
			if ( GetName() == Name ) then
				nt_settask(CP_TASKID_TITLE, 9)
			end
		end
end