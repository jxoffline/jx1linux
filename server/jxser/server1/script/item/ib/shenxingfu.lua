Include("\\script\\battles\\battlehead.lua")
Include("\\script\\lib\\file.lua");
Include("\\script\\lib\\string.lua");
Include("\\script\\global\\forbidmap.lua");
Include("\\script\\missions\\sevencity\\war.lua")
Include("\\script\\global\\playerlist.lua")
Include("\\script\\item\\ib\\headshenxingfu.lua")
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\missions\\boss\\callboss_incity.lua")
IncludeLib("TONG")


function main(sel)
	dofile("script/item/ib/shenxingfu.lua");
--local szTongName, nTongID = GetTongName();
--if szTongName ~= nil and szTongName ~= "" then
--if TONG_GetMemberCount(nTongID) > 150 then
--Say("Bang v­ît qu¸ 150 thµnh viªn kh«ng thÓ sö dông thÇn thµnh phï.Xin h·y t«n träng s©n ch¬i kh«ng gian lËn trong viÖc s¸p nhËp bang héi ®Ó tr¸nh phiÒn phøc cho chÝnh bæn bang m×nh.");
--return 1
--end
--end

	if (IsDisabledUseTownP() == 1 or GetTaskTemp(200) == 1 ) or ( SubWorldIdx2ID( SubWorld ) >= 387 and SubWorldIdx2ID( SubWorld ) <= 395)then
		Msg2Player("HiÖn t¹i ng­¬i kh«ng thÓ sö dông thÇn hµnh phï!");
		return 1
	end

	local nSubWorldID = GetWorldPos();
	if (nSubWorldID >= 375 and nSubWorldID <= 386) then
		Msg2Player("B¶n ®å hiÖn t¹i ng­¬i ®ang ®øng thuéc khu vùc ®Æc thï, kh«ng thÓ sö dông thÇn hµnh phï.");
		return 1
	end

	if (nSubWorldID >= 416 and nSubWorldID <= 511) then
		Msg2Player("B¶n ®å hiÖn t¹i ng­¬i ®ang ®øng thuéc khu vùc ®Æc thï, kh«ng thÓ sö dông thÇn hµnh phï.");
		return 1
	end

	if (nSubWorldID == 44 or nSubWorldID == 197 or nSubWorldID == 208 or nSubWorldID == 209 or nSubWorldID == 210 or nSubWorldID == 211 or nSubWorldID == 212 or (nSubWorldID >= 213 and nSubWorldID <= 223)	or nSubWorldID == 336 or nSubWorldID == 341 or nSubWorldID == 342	or nSubWorldID == 175	or nSubWorldID == 337	or nSubWorldID == 338	or nSubWorldID == 339 or ( nSubWorldID >= 387 and  nSubWorldID <= 395 ) )then
		Msg2Player("B¶n ®å hiÖn t¹i ng­¬i ®ang ®øng thuéc khu vùc ®Æc thï, kh«ng thÓ sö dông thÇn hµnh phï.");
		return 1
	end;

	--check map
	if (CheckAllMaps(nSubWorldID) == 1) then
		Msg2Player("B¶n ®å hiÖn t¹i ng­¬i ®ang ®øng thuéc khu vùc ®Æc thï, kh«ng thÓ sö dông thÇn hµnh phï.");
		return 1
	end;

	if (GetLevel() < 5) then
		Say("Ng­êi ch¬i ph¶i ®¹t ®¼ng cÊp 5 trë lªn míi cã thÓ sö dông thÇn hµnh phï.", 0);
		return 1
	end;
	if (GetSkillState(739) >= 1) then
		Say("B¹n ®ang vËn Tiªu Bang Héi kh«ng thÓ sö dông THP")
		return 1
	end;

Say("ThÇn hµnh phï ®i ®Õn n¬i ®­îc chØ ®Þnh..!!!", 7,
		"Th«n trang - Thµnh thÞ - M«n ph¸i/gototown",
		"Maps luyÖn c«ng/goto_luyencong",
		"ThiÕt ®Æt ®iÓm håi sinh./set_backpos",
		"§i lµm [Ho¹t ®«ng]./vitri_khac",
		"T×m boss hoµng kim/timbosshk",
		"§i Minh NguyÖt TrÊn - §µo Hoa §¶o./#tbVNGWORDPOS:GotoOtherMap()",
		"Rêi khái/no");
	return 1
end;

function didenchienlongok()
-- if GetFaction() == "cuiyan" then
-- Say("Thóy yªn Kh«ng ®îc tham gia ChiÕn Long ®éng")
-- return
-- end
	Say("H·y chän cæng mµ b¹n muèn!", 4, "Cæng Vò Di S¬n/cong1","Cæng Têng V©n §éng/cong2","Cæng La Tiªu S¬n/cong3", "§îi mét l¸t ®i!/OnCancel")
end

function cong1()
	Msg2Player("§· ®Õn ChiÕn Long §éng!")
	NewWorld(959, 1670, 2959);
	SetProtectTime(18*3)
	AddSkillState(963, 1, 0, 18*3)
end

function cong2()
	Msg2Player("§· ®Õn ChiÕn Long §éng!")
	NewWorld(959, 1548, 2995);
	SetProtectTime(18*3)
	AddSkillState(963, 1, 0, 18*3)
end

function cong3()
	Msg2Player("§· ®Õn ChiÕn Long §éng!")
	NewWorld(959, 1701, 3152);
	SetProtectTime(18*3)
	AddSkillState(963, 1, 0, 18*3)
end

function vitri_khac()
local tab_Content = {
		"VËn Tiªu/goto_vantieu",
		"Boss s¸t thñ/gotobosssatthu",
		"V­ît ¶i/goto_satthu",
		"TÝn Sø/goto_tinsu",
		"KiÕm Gia Mª Cung/goto_kiemgia",
		"ThÝ LuyÖn §­êng/goto_thiluyenduong",
		"Viªm §Õ B¶o Tµng/goto_viemde",
		"Phong L¨ng §é/goto_phonglangdo",
		"Tèng - Kim/gopos_step2battle",
		"§Êu Tr­êng Sinh Tö/vaodautruong",
		"Thiªn Tr× MËt C¶nh/goto_thientri",
		"Lo¹n ChiÕn Cöu Ch©u/goto_chaucoc",
		"ChiÕn tr­êng ThÊt Thµnh §¹i ChiÕn/gopos_sevencityfield",
		"KÕt thóc..!/no"
	}
	Say("ThÇn hµnh phï, ®i ®Õn n¬i ng­¬i muèn.", getn(tab_Content), tab_Content);
end

function vaodautruong()
	local nWeekDay = tonumber(GetLocalDate("%w"))
	if  nWeekDay == 0 or  nWeekDay == 1 or  nWeekDay == 2 or  nWeekDay == 3 or  nWeekDay == 4 or  nWeekDay == 5  then
	Say("Thêi gian vµo §Êu Tr­êng 20h10 Thø 7 hµng TuÇn")
	return 1
	end

	local _, nTongID = GetTongName()
	if (nTongID == 0) then
		Msg2Player("Kh«ng cã trong bang héi, kh«ng thÓ tham gia.")
		return
	end
	local szTong = GetTongName()
	if szTong == "" then
		Msg2Player("Kh«ng cã trong bang héi, kh«ng thÓ tham gia.")
		return
	end

	--if (TONGM_GetFigure(nTongID, GetName()) == TONG_RETIRE) then
	--	Say("Èn sü kh«ng thÓ tham gia .")
	--	return
	--end

	local tbSay = {}
	tinsert(tbSay,"HËu Doanh B¾c./#gotoDT(1572,2438)")
	tinsert(tbSay,"HËu Doanh Nam./#gotoDT(1206,3156)")
	tinsert(tbSay,"HËu Doanh  §«ng./#gotoDT(1545,3110)")
	tinsert(tbSay,"HËu Doanh T©y./#gotoDT(1218,2452)")
	tinsert(tbSay,"Th«i ta kh«ng muèn ®i./no")
	Say("Mêi lùa chän khu vùc tham ®Êu", getn(tbSay), tbSay)
	return 1
end;

function gotoDT(nX,nY)
	local nWeekDay = tonumber(GetLocalDate("%w"))
	local nHour = tonumber(GetLocalDate("%H%M"))
	if  (nHour >= 2010 and nHour < 2059) then
		else
			Say("Thêi gian vµo ®Êu tr­êng sinh tö lµ 20h10. .",0);
			return
		end
	NewWorld(355,nX,nY)
	SetPunish(0)
	SetLogoutRV(1);
	local szTong = GetTong()
	if not szTong or  szTong == "" then
		SetCreateTeam(0);
		SetCurCamp(4);
	end
end

function goto_satthu()
SetFightState(0)
NewWorld(78,1509,3209)
end
function goto_thientri()
SetFightState(1)
NewWorld(934,1598,3240)
end
function goto_chaucoc()
SetFightState(0)
NewWorld(176,1574,2955)
end

function goto_vantieu()
SetFightState(1)
NewWorld(1,1559,2768)
end
function goto_tinsu()
SetFightState(0)
NewWorld(11,3024,5086)
end
function goto_thiluyenduong()
SetFightState(0)
NewWorld(176,1588,2941)
end


function goto_kiemgia()
SetFightState(0)
NewWorld(949,1580,3158)
end

function goto_viemde()
SetFightState(0)
--NewWorld(53,1629,3184)
NewWorld(37, 1711, 3179)
end

function goto_phonglangdo()
SetFightState(1)
NewWorld(336,1124,3187)
end


--*******************************************************************
tbMapGoldBoss = {
{"Cæ B¸ch","Phï Dung ®éng",202,"S¬n B¶o ®éng",76,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"HuyÒn Gi¸c §¹i S­","Nh¹n Th¹ch ®éng",10,"Thanh khª ®éng",198,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"§­êng Phi YÕn", "Phong L¨ng ®é",336,"Kho¶ Lang ®éng",75,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"Lam Y Y","Vò L¨ng ®éng",199,"Phi Thiªn ®éng",204,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"Hµ Linh Phiªu", "Tr­êng B¹ch s¬n B¾c",322,"V« Danh ®éng",203,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"Yªn HiÓu Tr¸i", "Sa M¹c s¬n  ®éng 1",225,"Sa M¹c s¬n  ®éng 3",227,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"M¹nh Th­¬ng L­¬ng","Sa m¹c ®Þa biÓu",224,"Sa M¹c s¬n  ®éng 2",226,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"Gia LuËt TÞ Ly", "L­ìng Thñy ®éng",181,"D­¬ng Trung ®éng",205,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"§¹o Thanh Ch©n Nh©n","Tr­êng B¹ch s¬n Nam",321,"M¹c Cao QuËt",340,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"TuyÒn C¬ Tö", "T©y S¬n ®¶o",342,"Phi Thiªn ®éng",204,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"V­¬ng T¸","Vò L¨ng ®éng",199,"Phï Dung ®éng",202,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"HuyÒn Nan §¹i S­","Phong L¨ng ®é",336,"Kho¶ Lang ®éng",75,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"§­êng BÊt NhiÔm", "Tr­êng B¹ch s¬n Nam",321,"Kho¶ Lang ®éng",75,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"B¹ch Doanh Doanh", "Thanh khª ®éng",198,"Sa m¹c ®Þa biÓu",224,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"Thanh TuyÖt S­ Th¸i", "T©y S¬n ®¶o",342,"D­¬ng Trung ®éng",205,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"Chung Linh Tó", "Phi Thiªn ®éng",204,"V« Danh ®éng",203,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"Hµ Nh©n Ng·", "Nh¹n Th¹ch ®éng",10,"L­ìng Thñy ®éng",181,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"§oan Méc DuÖ", "Phong L¨ng ®é",336,"S¬n B¶o ®éng",76,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"Tõ §¹i Nh¹c", "M¹c B¾c Th¶o Nguyªn",341,"Vò L¨ng ®éng",199,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"Thanh Liªn Tö","Tr­êng B¹ch s¬n B¾c",322,"Sa M¹c s¬n  ®éng 3",227,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"Thanh TuyÖt S­ Th¸i","Sa M¹c s¬n  ®éng 1",225,"Sa M¹c s¬n  ®éng 3",227,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"Hµn Ngu Dèt","Phong L¨ng ®é",336,"Kho¶ Lang ®éng",75,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
}

function timbosshk()
    findgoldboss(1,12)
end
function findgoldboss(f_bossx,f_bossy)

	if (not f_bossx) then
		f_bossx1 = 1;
		f_bossy1 = 12;
	else
		f_bossx1 = f_bossx;
		f_bossy1 = f_bossy;
	end

	if (f_bossy1 - f_bossx1 > 11) then
		f_bossy1 = f_bossx1 + 11;
	end

	local n_count = getn(tbMapGoldBoss);
	local tab_Content = {}

	for i = f_bossx1, f_bossy1 do
		tinsert(tab_Content, tbMapGoldBoss[i][1].."/#findgoldboss_Step2( "..i..")");
	end
	if (f_bossx1 ~= 1) then
		tinsert(tab_Content, "Trang tr­íc/#findgoldboss( 1,"..(f_bossx1-1)..")");
	end

	if (f_bossy1 < n_count) then
		tinsert(tab_Content, "Trang sau/#findgoldboss( "..(f_bossy1+1)..","..n_count..")");
	end
	tinsert(tab_Content, "Tho¸t./no");
	Say("§¹i hiÖp t×m cao thñ nµo?", getn(tab_Content), tab_Content);
end
function findgoldboss_Step2(nId)
	local tb = {}
	for i=2,getn(tbMapGoldBoss[nId]),2 do --"buoc nhay 2 tuc la i=2,4,6,8,10
	local npcidxtab = GetMapNpcWithName(tbMapGoldBoss[nId][i+1], tbMapGoldBoss[nId][1])
		if npcidxtab == nil then
				nNPCCount = 0
		else
			nNPCCount = getn(npcidxtab);
		end
		for j = 1, nNPCCount do
			x, y, subworld = GetNpcPos(npcidxtab[j]);
			m,n,k = floor(x/32),floor(y/32),SubWorldIdx2ID(subworld)

			--tinsert(tbOpt, {tbMapGoldBoss[nId][1].."-"..tbMapGoldBoss[nId][i].."["..m.."-"..n.."]",bbbbb, {m,n,k}})
			tinsert(tb,tbMapGoldBoss[nId][1].."-"..tbMapGoldBoss[nId][i].."["..floor(m/8).."-"..floor(n/16).."]/#findgoldboss_Step3("..m..","..n..","..k..")")
		end
	end
	strTittle = "T×m thÊy cao thñ vâ l©m "..tbMapGoldBoss[nId][1].." t¹i c¸c vÞ trÝ sau ®©y."
	--tinsert(tbOpt, {"tho¸t ",Quit})
	tinsert(tb,"Quay l¹i./#findgoldboss(1,12)")
	tinsert(tb,"Tho¸t./Quit")
	--CreateNewSayEx(strTittle, tbOpt)
	Say(strTittle,getn(tb),tb)
end
function findgoldboss_Step3(nX,nY,Map)
	NewWorld(Map,nX,nY) --
	SetFightState(1)
end
--*******************************************************************

tab_RevivePos = {
	[1] = {	--"Dia ly"
		{"Thµnh §« ®«ng", 6, 11},{"Thµnh §« t©y", 7, 11},{"Thµnh §« nam", 8, 11},{"Thµnh §« b¾c", 9, 11},{"Thµnh §« trung t©m", 5, 11}
	},
	[2] = {	--"Dia ly"
		{"T­¬ng D­¬ng ®«ng", 30, 78},{"T­¬ng D­¬ng t©y", 32 , 78},{"T­¬ng D­¬ng nam", 31, 78},{"T­¬ng D­¬ng b¾c", 33, 78},{"T­¬ng D­¬ng trung t©m", 29, 78}
	},
	[3] = {	--"Dia ly"
		{"Ph­îng T­êng ®«ng", 1, 1},{"Ph­îng T­êng t©y", 2, 1},{"Ph­îng T­êng nam", 3, 1},{"Ph­îng T­êng b¾c", 4, 1},{"Ph­îng T­êng trung t©m", 0, 1}
	},
	[4] = {	--"Dia ly"
		{"§¹i lý b¾c", 64, 162},{"§¹i lý trung t©m", 63, 162}
	},
	[5] = {	--"Dia ly"
		{"BiÖn Kinh ®«ng", 24, 37},{"BiÖn Kinh t©y", 25, 37},{"BiÖn Kinh nam", 24, 37},{"BiÖn Kinh b¾c", 26, 37},{"BiÖn Kinh trung t©m", 23, 37}
	},
	[6] = {	--"Dia ly"
		{"D­¬ng Ch©u ®«ng", 35, 80},{"D­¬ng Ch©u t©y", 38, 80},{"D­¬ng Ch©u nam", 37, 80},{"D­¬ng Ch©u b¾c", 36, 80},{"D­¬ng Ch©u trung t©m", 34, 80}
	},
	[7] = {	--"Dia ly"
		{"L©m An ®«ng", 68, 176},{"L©m An nam", 67, 176},{"L©m An b¾c", 69, 176}
	},
	[8] = {	--"Dia ly"
		{"Ba L¨ng huyÖn", 19, 53},{"Giang T©n Th«n", 10, 20},{"VÜnh L¹c trÊn", 43, 99},{"Chu Tiªn trÊn", 45, 100},{"§¹o H­¬ng th«n", 47, 101},{"Long M«n trÊn", 55, 121},{"Th¹ch Cæ trÊn", 59, 153},{"Long TuyÒn th«n", 65, 174},{"T©y S¬n th«n", 1, 175}
	},
	[9] = {	--"Dia ly"
		{"Thiªn V­¬ng Bang", 21, 59},{"ThiÕu L©m ph¸i", 52, 103},{"§­êng M«n", 15, 25},{"Ngò §éc Gi¸o", 71, 183},{"Nga My ph¸i", 13, 13},{"Thóy Yªn m«n", 61, 154},{"Thiªn NhÉn gi¸o", 28, 49},{"C¸i Bang", 53, 115},{"Vâ §ang ph¸i", 40, 81},{"C«n L«n ph¸i", 58, 131},{"Hoa S¬n ph¸i", 987, 987}, {"Vò Hån", 1042, 1042},
	},
};
--Cai gi do
function set_backpos()
	for i = 1, getn(tbBATTLEMAP) do
		if ( nMapId == tbBATTLEMAP[i] ) then
			Msg2Player("Lóc nµy b¹n kh«ng thÓ sö dông vËt phÈm nµy");
			return 1;
		end
	end



	local tab_Content = {
		"Rêi khái/no",
		"Thµnh §«/#setpos_step2(1)",
		"T­¬ng D­¬ng/#setpos_step2(2)",
		"Ph­îng T­êng/#setpos_step2(3)",
		"§¹i Lý/#setpos_step2(4)",
		"BiÖn Kinh/#setpos_step2(5)",
		"D­¬ng Ch©u/#setpos_step2(6)",
		"L©m An/#setpos_step2(7)",
		"Th«n trang/#setpos_step2(8)",
		"M«n ph¸i/#setpos_step2(9)"
	}
	Say("ThiÕt ®Æt ®iÓm håi thµnh cho l Çn sau sö dông thæ ®Þa phï", getn(tab_Content), tab_Content);
end;

--"Dia ly"
function setpos_step2(nIdx)
	local tab_Content = {};
	for i = 1, getn(tab_RevivePos[nIdx]) do
		tinsert(tab_Content, tab_RevivePos[nIdx][i][1].."/#setpos_step3( "..nIdx..","..i..")");
	end;
	tinsert(tab_Content, "Rêi khái/no");
	Say("ThiÕt ®Æt ®iÓm håi thµnh cho l Çn sau sö dông thæ ®Þa phï", getn(tab_Content), tab_Content);
end;
--"Dia ly"
function setpos_step3(nIdx, nSubIdx)
	SetRevPos(tab_RevivePos[nIdx][nSubIdx][3], tab_RevivePos[nIdx][nSubIdx][2]);
	Say("§¹i hiÖp ®· ®Æt thµnh c«ng ®iÓm håi sinh"..tab_RevivePos[nIdx][nSubIdx][1], 0);
	Msg2Player("§¹i hiÖp ®· ®Æt thµnh c«ng ®iÓm håi sinh"..tab_RevivePos[nIdx][nSubIdx][1]);
end;
--"Dia ly"
function gototown()

	local tab_Content = {
		"Rêi khái/no",
		"Thµnh thÞ /gopos_step2town",
		"Th«n trang/#gopos_step2(8)",
		"M«n ph¸i/#gopos_step2(9)",
		--"ChiÕn Tr­êng Tèng - Kim/gopos_step2battle",
		--"ChiÕn tr­êng ThÊt Thµnh §¹i ChiÕn/gopos_sevencityfield",
		--"ChiÕn Long §éng/didenchienlongok",

	}
	Say("ThÇn hµnh phï, ®i ®Õn n¬i ng­¬i muèn.", getn(tab_Content), tab_Content);
end;

tbMapTrain = {
	[10] ={
		{"Ph­îng T­êng",1,1528,2733},
		{"Hoa S¬n",2,2287,4092},
		{"Thµnh §«",11,3100,4822},
		{"Nga My ph¸i",13,1867,5021},
		{"Giang T©n Th«n",20,3701,6232},
		{"§­êng M«n",25,3532,5770},
		{"BiÖn Kinh",37,2081,2477},
		{"Thiªn NhÉn gi¸o",45,1559,3246},
		{"Thiªn NhÉn Gi¸o tÇng 1",46,1611,3201},
		{"Thiªn NhÉn Gi¸o tÇng 2",47,1606,3054},
		{"Thiªn NhÉn Gi¸o tÇng 2",48,1672,3138},
		{"ThÊt S¸t ®éng",50,1425,3217},
		{"Ba L¨ng huyÖn",53,1342,3346},
		{"Nam Nh¹c trÊn",54,1618,2969},
		{"Thiªn V­¬ng Bang",59,1425,3472},
		{"Thiªn V­¬ng ®¶o s¬n ®éng",65,1596,3250},
		{"Phôc L­u ®éng",73,1599,3210},
		{"T­¬ng D­¬ng",78,1299,3483},
		{"D­¬ng Ch©u",80,1345,3359},
		{"Vâ §ang ph¸i",81,1620,3595},
		{"Mª cung §¸y giÕng",82,1593,3193},
		{"VÜnh L¹c trÊn",99,1849,2835},
		{"Chu Tiªn trÊn",100,1852,3356},
		{"§¹o H­¬ng th«n",101,1767,2816},
		{"ThiÕu L©m ph¸i",103,1622,3565},
		{"Méc Nh©n H¹ng",111,1580,3417},
		{"Long M«n trÊn",121,1715,4394},
		{"C«n L«n ph¸i",131,1872,3659},
		{"D­îc V­¬ng Cèc",140,2429,3731},
		{"Th¹ch Cæ trÊn",153,1439,3042},
		{"Thóy Yªn m«n",154,628,1261},
		{"§¹i Lý phñ",162,1642,2935},
		{"Long TuyÒn th«n",174,1818,3017},
		{"L©m An",176,1614,2561},
		{"Ngò §éc Gi¸o",183,1371,3677},
		{"Mª cung nhËp m«n",190,1380,3003},
		{"Nh¹n §·ng s¬n",195,682,2863},
	},
	[20] ={
		{"KiÕm C¸c T©y B¾c",3,932,4076},
		{"TÇn L¨ng",7,2417,2631},
		{"M·nh Hæ ®éng",14,1589,3217},
		{"KiÕm C¸c T©y Nam",19,3096,3968},
		{"KiÕm C¸c Trung Nguyªn",43,1673,2713},
		{"Vò L¨ng s¬n",70,1649,3050},
		{"B¹ch Thñy ®éng",71,1739,3208},
		{"Háa Lang ®éng",83,1584,3248},
		{"C¸i Bang",115,1538,4021},
		{"La Tiªu s¬n",179,1618,3292},
	},
	[30] ={
		{"Kim Quang ®éng",4,1797,3058},
		{"L¨ng TÇn Thñy Hoµng",8,1603,3497},
		{"B¹ch V©n ®éng",22,1752,3372},
		{"Miªu LÜnh",74,1947,3120},
		{"YÕn Tö ®éng",77,1549,3169},
		{"Phôc Ng­u S¬n §«ng",90,1649,3567},
		{"Thôc C­¬ng s¬n",92,2025,3040},
		{"Kho¸i Ho¹t L©m",136,1716,3144},
		{"D­îc V­¬ng ®éng tÇng 1",141,1603,3372},
		{"TuyÕt B¸o ®éng tÇng 1",145,1563,3245},
		{"TuyÕt B¸o ®éng tÇng 2",146,1630,3325},
		{"Thæ PhØ ®éng",170,1605,3191},
		{"Vò Di s¬n",193,1937,2851},
	},
	[40] ={
		{"Kinh Hoµng ®éng",5,1822,3473},
		{"Táa V©n ®éng",6,1384,3286},
		{"Thanh Thµnh s¬n",21,2247,3923},
		{"ThÇn Tiªn ®éng",23,1710,3077},
		{"Tróc T¬ ®éng tÇng 3",28,1551,3192},
		{"Phôc Ng­u S¬n T©y",41,2078,2804},
		{"Mª cung Kª Qu¸n ®éng",91,1806,2858},
		{"MËt thÊt ThiÕu L©m",113,1675,3361},
		{"Hoµng Hµ Nguyªn §Çu",122,1612,3328},
		{"KiÕn TÝnh Phong s¬n ®éng",135,1748,3198},
		{"§iÓm Th­¬ng s¬n",167,1214,2731},
		{"Phông Nh·n ®éng",168,1508,3005},
		{"§iÓm Th­¬ng ®éng tÇng 1",171,1532,3130},
		{"§iÓm Th­¬ng ®éng tÇng 2",172,1586,3223},
		{"§iÓm Th­¬ng ®éng tÇng 3",173,1353,3102},
		{"Long Cung ®éng",180,1509,3106},
	},
	[50] ={
		{"§Þa ®¹o hËu viÖn TÝn T­íng tù",12,1589,3188},
		{"H­ëng Thñy ®éng",24,1692,3189},
		{"ThiÕt th¸p tÇng 1",38,1702,3134},
		{"ThiÕt th¸p tÇng 2",39,1690,3032},
		{"ThiÕt th¸p tÇng 3",40,1668,3133},
		{"Thiªn T©m ®éng",42,1648,3119},
		{"§¸y §éng §×nh hå tÇng 1",66,1596,3199},
		{"§¸y §éng §×nh hå tÇng 2",67,1591,3193},
		{"T­êng V©n ®éng tÇng 1",116,1787,2980},
		{"L­u Tiªn ®éng tÇng 1",125,1811,3219},
		{"B¨ng HuyÖt ®éng",132,1701,3407},
		{"TuyÕt B¸o ®éng tÇng 3",147,1630,3323},
		{"¸c b¸ ®Þa ®¹o",163,1559,3201},
		{"Thiªn TÇm th¸p tÇng 1",164,1606,3194},
		{"Thiªn TÇm th¸p tÇng 2",165,1501,3295},
		{"S¬n ®éng Ngù Hoa viªn",178,1609,3200},
		{"NghiÖt Long ®éng",182,1997,3067},
		{"Ngäc Hoa ®éng",194,1599,3199},
	},
	[60] ={
		{"Tróc T¬ ®éng tÇng 1",26,1603,3210},
		{"Th¸nh ®éng tÇng 1",51,1666,3291},
		{"Th¸nh ®éng tÇng 2",52,1617,3261},
		{"Hoµnh S¬n Ph¸i",56,1594,3210},
		{"Thanh Loa ®¶o",68,1545,2972},
		{"MËt ®¹o Nha m«n T­¬ng D­¬ng",79,1599,3206},
		{"108 La H¸n trËn",114,1499,3312},
		{"T­êng V©n ®éng tÇng 2",117,1660,2947},
		{"T­êng V©n ®éng tÇng 3",118,1525,2962},
		{"T­êng V©n ®éng tÇng 4",119,1569,3099},
		{"L­u Tiªn ®éng tÇng 2",126,1496,2929},
		{"L­u Tiªn ®éng tÇng 3",127,1769,3216},
		{"L­u Tiªn ®éng tÇng 4",128,1515,3123},
		{"TuyÕt B¸o ®éng tÇng 4",148,1527,3273},
		{"Mª cung cÊm ®Þa",158,1584,3191},
		{"Thiªn TÇm th¸p tÇng 3",166,1662,3245},
		{"D­¬ng Gi¸c ®éng",196,1691,3068},
	},
	[70] ={
		{"Tr­êng Giang Nguyªn §Çu",9,2478,5691},
		{"Tróc T¬ ®éng tÇng 2",27,1607,3208},
		{"§µo Hoa Nguyªn",55,1729,3282},
		{"Thanh Loa ®¶o s¬n ®éng",69,1600,3207},
		{"§¹i Tï ®éng",72,1611,2969},
		{"S¬n B¶o ®éng",76,1796,2959},
		{"Linh Cèc ®éng",94,1751,3107},
		{"T­êng V©n ®éng tÇng 5",120,1815,3195},
		{"L·o Hæ ®éng",123,1698,3363},
		{"L­u Tiªn ®éng tÇng 5",129,1597,3212},
		{"L­u Tiªn ®éng tÇng 6",130,1547,3143},
		{"D­îc V­¬ng ®éng tÇng 2",142,1467,3288},
		{"TuyÕt B¸o ®éng tÇng 5",149,1611,3220},
		{"Long Nh·n ®éng",169,1596,3212},
		{"TÇn L¨ng tÇng 2",206,1790,3265},
		{"L©m Du Quan",319,2031,3286},
	},
	[80] ={
		{"Nh¹n Th¹ch ®éng",10,1603,3209},
		{"D­îc V­¬ng ®éng tÇng 3",143,1602,3215},
		{"TuyÕt B¸o ®éng tÇng 6",150,1613,3184},
		{"TuyÕt B¸o ®éng tÇng 7",151,1612,3218},
		{"L­ìng Thñy ®éng",181,1590,3199},
		{"Thanh khª ®éng",198,1522,2955},
		{"Vò L¨ng ®éng",199,1644,2906},
		{"Cæ D­¬ng ®éng",200,1612,3171},
		{"B¨ng Hµ ®éng",201,1599,3197},
		{"Phï Dung ®éng",202,1786,2823},
		{"V« Danh ®éng",203,1551,2992},
		{"Phi Thiªn ®éng",204,1679,3391},
		{"D­¬ng Trung ®éng",205,1698,3408},
		{"TÇn L¨ng tÇng 3",207,1595,3205},
		{"Sa m¹c ®Þa biÓu",224,1591,3013},
		{"Ch©n nói Tr­êng B¹ch",320,1386,2253},
	},
	[90] ={
		{"Kho¶ Lang ®éng",75,1872,3071},
		{"TiÕn Cóc ®éng",93,1526,3172},
		{"C¸n Viªn ®éng",124,1672,3420},
		{"D­îc V­¬ng ®éng tÇng 4",144,1690,3023},
		{"TuyÕt B¸o ®éng tÇng 8",152,1675,3365},
		{"Sa M¹c 1",225,1476,3274},
		{"Sa M¹c 2",226,1553,3173},
		{"Sa M¹c 3",227,1530,3270},
		{"Tr­êng B¹ch s¬n Nam",321,966,2296},
		{"Tr­êng B¹ch s¬n B¾c",322,2048,4120},
		{"M¹c Cao QuËt",340,1853,3446},
		{"M¹c B¾c Th¶o Nguyªn",341,1576,3040},
		{"Vi s¬n ®¶o",342,1400,2800},
		{"H¾c Sa ®éng",875,1576,3177},
	},
	[100] ={
		{"TÝch HuyÕt Cèc",917,1816,3392},
		{"¸c Nh©n Cèc",918,1816,3392},
		{"Thùc Cèt Nhai",919,1608,3168},
		{"H¾c Méc Nhai",920,1608,3168},
	},
	[110] ={
		{"Thiªn Phô S¬n",921,1560,3104},
		{"Bµn Long S¬n",922,1560,3104},
		{"§Þa MÉu S¬n",923,2008,4080},
		{"UyÓn Phông S¬n",924,2008,4080},
		{"¸c Lang Cèc 1",950,1592,3195},
		{"¸c Lang Cèc 2",951,1592,3195},
		{"¸c Lang Cèc 3",952,1592,3195},
		{"¸c Lang Cèc 4",953,1592,3195},
		{"¸c Lang Cèc 5",954,1592,3195},
		{"¸c Lang Cèc 6",955,1592,3195},
		{"¸c Lang Cèc 7",956,1592,3195},
		{"¸c Lang Cèc 8",995,1592,3195},
	},
}

function goto_luyencong()
	--dofile("/script/item/ib/shenxingfu.lua");
	local tab_Content = {
		"B¶n ®å cÊp 10/#goto_luyencong2(10,getn(tbMapTrain[10]))", --
		"B¶n ®å cÊp 20/#goto_luyencong2(20,getn(tbMapTrain[20]))",
		"B¶n ®å cÊp 30/#goto_luyencong2(30,getn(tbMapTrain[30]))",
		"B¶n ®å cÊp 40/#goto_luyencong2(40,getn(tbMapTrain[40]))",
		"B¶n ®å cÊp 50/#goto_luyencong2(50,getn(tbMapTrain[50]))",
		"B¶n ®å cÊp 60/#goto_luyencong2(60,getn(tbMapTrain[60]))",
		"B¶n ®å cÊp 70/#goto_luyencong2(70,getn(tbMapTrain[70]))",
		"B¶n ®å cÊp 80/#goto_luyencong2(80,getn(tbMapTrain[80]))",
		"B¶n ®å cÊp 90/#goto_luyencong2(90,getn(tbMapTrain[90]))",
		"B¶n ®å cÊp 100/#goto_luyencong2(100,getn(tbMapTrain[100]))",
		"B¶n ®å cÊp 110/#goto_luyencong2(110,getn(tbMapTrain[110]))",
		"Tho¸t/no",
	}
	Say("ThÇn hµnh phï, ®i ®Õn n¬i ng­¬i muèn.", getn(tab_Content), tab_Content);
end

function goto_luyencong2(num1,num2,num3)
	local tab_Content = {};
	if num2 > 8 then
		if num3 == nil then
			a = 1;
			num = 8;
		end
		if num3 ~= nil then
		a = num2 - num3;
			if a > 8 then
				a = num3;
				num = num3 + 8;
			end
			if a < 8 then 
				a = num3;
				num = num2;
			end
		end
	end
	if num2 <= 8 and num3 == nil then 
		a = 1;
		num = num2;
	end
	for i = a , num do
		tinsert(tab_Content, tbMapTrain[num1][i][1].."/#goto_luyencong3("..num1..","..i..")");
		--Msg2Player(""..i..""..num.." sè a:"..num1.." sè b:"..num2.."")
	end
	if num2 > 8 and num3 == nil then
		tinsert(tab_Content, "Trang kÕ /#goto_luyencong2( "..num1..","..num2..","..a.."+8)");
	end	
	if num2 > 8 and num3 ~=nil then
		n = num2 - num3;
		if n > 8 then
			tinsert(tab_Content, "Trang kÕ /#goto_luyencong2( "..num1..","..num2..","..a.."+8)");
		end
	end
	tinsert(tab_Content, "Rêi khái/no");
	Say("ThÇn hµnh phï, ®i ®Õn n¬i ng­¬i muèn.", getn(tab_Content), tab_Content);
end

function goto_luyencong3(num1,num2)
	local mapName = tbMapTrain[num1][num2][1]
	local mapid = tbMapTrain[num1][num2][2]
	local mapx = tbMapTrain[num1][num2][3]
	local mapy =  tbMapTrain[num1][num2][4]
	--Msg2Player(""..mapid..","..mapx..","..mapy.."")
	NewWorld(mapid,mapx,mapy)
	SetFightState(1);
	Msg2Player("Xin h·y ngåi yªn, chóng ta ®i ®Õn <color=yellow>"..mapName.."<color> nµo");
	SetProtectTime(18*3)
	AddSkillState(963, 1, 0, 18*3)
end

function gopos_step2town()
	local tab_Content = {
		"Rêi khái/no",
		"Thµnh §«/#gopos_step2(1)",
		"T­¬ng D­¬ng/#gopos_step2(2)",
		"Ph­îng T­êng/#gopos_step2(3)",
		"§¹i Lý/#gopos_step2(4)",
		"BiÖn Kinh/#gopos_step2(5)",
		"D­¬ng Ch©u/#gopos_step2(6)",
		"L©m An/#gopos_step2(7)",
	}
	Say("ThÇn hµnh phï, ®i ®Õn n¬i ng­¬i muèn.", getn(tab_Content), tab_Content);
end

--"Dia ly"
function gopos_step2(nIdx)
	local tab_Content = {};
	for i = 1, getn(tab_RevivePos[nIdx]) do
		tinsert(tab_Content, tab_RevivePos[nIdx][i][1].."/#gopos_step3( "..nIdx..","..i..")");
	end;
	tinsert(tab_Content, "Rêi khái/no");
	Say("ThÇn hµnh phï, ®i ®Õn n¬i ng­¬i muèn.", getn(tab_Content), tab_Content);
end;

--"Dia ly"
function gopos_step3(nIdx, nSubIdx)
	local file = [[\settings\RevivePos.ini]];
	ini_loadfile(file, 0)
	local szData = ini_getdata(file, tab_RevivePos[nIdx][nSubIdx][3], tab_RevivePos[nIdx][nSubIdx][2]);

	local szArr = split(szData);
	local nPosX = floor(tonumber(szArr[1]) / 32);
	local nPosY = floor(tonumber(szArr[2]) / 32);

	if (not nPosX or not nPosY) then
		return
	end;
	NewWorld(tab_RevivePos[nIdx][nSubIdx][3], nPosX, nPosY)
	SetFightState(0);
	Msg2Player("Xin h·y ngåi yªn, chóng ta ®i "..tab_RevivePos[nIdx][nSubIdx][1].." nµo");
	SetProtectTime(18*3) --"Dia ly"
	AddSkillState(963, 1, 0, 18*3)
end;



function gopos_step2battle()
	--if ( GetLevel() < 120 ) then
		--Talk( 1, "", "Phong V©n LuËn KiÕm gian khæ khèc liÖt, ng­¬i ch­a ®¹t ®Õn cÊp 120 h·y vÒ luyÖn thªm råi h·y tÝnh." );
	--else
		Say ( "Trong Phong V©n LuËn KiÕm, bªn lîi thÕ vÒ sè ng­êi tuy cã chiÕm ­u thÕ nh­ng sÏ nhËn ®­îc ®iÓm tÝch lòy Ýt h¬n, c¸c h¹ muèn chän b¸o danh bªn nµo?", 3, "Vµo ®iÓm b¸o danh phe Tèng (T)/#DoRescriptFunc(1)", "Vµo ®iÓm b¸o danh phe Kim (K)/#DoRescriptFunc(2)","§Ó ta suy nghÜ l¹i./no" );
	--end;
end

function gopos_sevencityfield()
	Say("Ng­¬i muèn ®i chiÕn tr­êng nµo cña ThÊt Thµnh §¹i ChiÕn?", 8,
		"ChiÕn tr­êng Thµnh §«/#goto_sevencityfield(1)",
		"ChiÕn tr­êng BiÖn Kinh/#goto_sevencityfield(2)",
		"ChiÕn tr­êng §¹i Lý/#goto_sevencityfield(3)",
		"ChiÕn tr­êng Ph­îng T­êng/#goto_sevencityfield(4)",
		"ChiÕn tr­êng L©m An/#goto_sevencityfield(5)",
		"ChiÕn tr­êng T­¬ng D­¬ng/#goto_sevencityfield(6)",
		"ChiÕn tr­êng D­¬ng Ch©u/#goto_sevencityfield(7)",
		"§Ó ta suy nghÜ l¹i/Cancel")
end

function goto_sevencityfield(nIndex)
	local player = PlayerList:GetPlayer(PlayerIndex)
	local tbErr = {}
	if (BattleWorld:CheckMapPermission(player, tbErr) == 0) then
		player:Say(tbErr.Msg)
		return
	end
	local nMapId = FIELD_LIST[nIndex]
	BattleWorld:Transfer(player, nMapId)
end

function DoRescriptFunc(nSel)
	--if ( GetLevel() < 120 ) then
	--	Talk( 1, "", "Phong V©n LuËn KiÕm gian khæ khèc liÖt, ng­¬i ch­a ®¹t ®Õn cÊp 120 h·y vÒ luyÖn thªm råi h·y tÝnh." );
	--	return
	--end
	local tbsongjin_pos = {1541, 3178};	--cai gi do
	local szstr = "Phe Tèng (T)";
	if (nSel == 2) then
		tbsongjin_pos = {1570, 3085};
		szstr = "Phe Kim (K)";
	end;
	szstr = ""
	if ( GetLevel() >= 40 and GetLevel() < 80 ) then
		NewWorld( 323, tbsongjin_pos[1], tbsongjin_pos[2]);
	SetProtectTime(18*3) --- cai gi do
	AddSkillState(963, 1, 0, 18*3)
		SetFightState(0);
		DisabledUseTownP(0); --- cai gi do
		Msg2Player( "§Õn n¬i b¸o danh ChiÕn Tr­êng Tèng Kim S¬ CÊp" );
	elseif ( GetLevel() >= 80 and GetLevel() < 120 ) then
		NewWorld( 324, tbsongjin_pos[1], tbsongjin_pos[2]);
	SetProtectTime(18*3) --- cai gi do
	AddSkillState(963, 1, 0, 18*3)
		SetFightState(0);
		DisabledUseTownP(0);--- cai gi do
		Msg2Player( "§Õn n¬i b¸o danh ChiÕn Tr­êng Tèng Kim Trung CÊp" );
	else
		NewWorld( 325, tbsongjin_pos[1], tbsongjin_pos[2]);
	SetProtectTime(18*3) --- cai gi do
	AddSkillState(963, 1, 0, 18*3)
		SetFightState(0);
		DisabledUseTownP(0); --- cai gi do
		Msg2Player( "§Õn n¬i b¸o danh ChiÕn Tr­êng Tèng Kim Cao CÊp" );
	end
end

function gotobosssatthu()
	local tab_Content = {
		"Boss S¸t thñ 9x/#gopos_9x()",
		"Boss S¸t thñ 2x/#gopos_2x()",
		"Boss S¸t thñ 3x/#gopos_3x()",
		"Boss S¸t thñ 4x/#gopos_4x()",
		"Boss S¸t thñ 5x/#gopos_5x()",
		"Boss S¸t thñ 6x/#gopos_6x()",
		"Boss S¸t thñ 7x/#gopos_7x()",
		"Boss S¸t thñ 8x/#gopos_8x()",
		"Thoat/no"
	}
	Say("<color=green>H·y chän kÎ mµ ng­¬i muèn tiªu diÖt, ta sÏ ®­a ng­¬i ®Õn chæ h¾n!<color>", getn(tab_Content), tab_Content);
end;

tab_lv2xmap = {
	{73,1544,2944,"Tr¸c L·nh CÇm","Phôc L­u §éng",},
	{73,1416,3024,"Tiªu Thiªn Ng¹o","Phôc L­u §éng",},
	{73,1640,3088,"Môc Minh KiÖt","Phôc L­u §éng",},
	{73,1736,3040,"TÊt V­u Phãng","Phôc L­u §éng",},
	{43,1600,3024,"Lôc Cöu U","KiÕm C¸c Trung Nguyªn",},
	{43,1712,3136,"Bé Hiªu TrÇn","KiÕm C¸c Trung Nguyªn",},
	{43,1800,3056,"Cèc KiÕm Thu","KiÕm C¸c Trung Nguyªn",},
	{43,1784,2736,"ThiÖu Hoa Dung","KiÕm C¸c Trung Nguyªn",},
	{71,1680,3136,"Quan Tö M¹c","B¹ch Thñy ®éng",},
	{71,1600,3072,"Bµnh ThÝch H¶i","B¹ch Thñy ®éng",},
	{71,1576,3184,"BÝch Phï B×nh","B¹ch Thñy ®éng",},
	{71,1592,3280,"Tr­îng L·nh s¬n ","B¹ch Thñy ®éng",},
	{83,1512,3072,"Tiªu KiÕm TuyÕt","Háa Lang ®éng",},
	{83,1560,2880,"Kha ThiÕu Gia","Háa Lang ®éng",},
	{83,1720,3024,"Ch­ëng B¸t Ph­¬ng","Háa Lang ®éng",},
	{83,1696,3184,"Méng Êt  Phi","Háa Lang ®éng",},
	{14,1792,3520,"T­ §å TuyÖt Chñy","M·nh Hæ ®éng",},
	{14,1712,3312,"Th­îng Quan L·ng","M·nh Hæ ®éng",},
	{14,1624,3136,"D­¬ng Thanh Èn","M·nh Hæ ®éng",},
	{14,1704,3200,"Ngôy Chiªm Th©n","M·nh Hæ ®éng",},    
}

tab_lv3xmap = {
	{4,1576,2992,"§µo §o¹t Thu","Kim Quang ®éng",},
	{4,1752,3248,"Xµ B¸ §«ng ","Kim Quang ®éng",},
	{4,1744,2960,"L­¬ng T­ Nam ","Kim Quang ®éng",},
	{4,1536,2880,"Tr¸c ThÊt Lang","Kim Quang ®éng",},
	{22,1720,3184,"KiÒu §Ønh Thiªn","B¹ch V©n ®éng",},
	{22,1784,3040,"Träng V« CÊp ","B¹ch V©n ®éng",},
	{22,1888,3200,"KhÝ CÇm SÜ ","B¹ch V©n ®éng",},
	{22,1720,3344,"§inh V¨n Dôc","B¹ch V©n ®éng",},
	{77,1368,3504,"Phong Ngò Ên","YÕn Tö ®éng",},
	{77,1440,3344,"Khang BÊt Hèi","YÕn Tö ®éng",},
	{77,1648,3264,"Ph­¬ng Dùc Viªm","YÕn Tö ®éng",},
	{77,1616,3520,"Ninh T©m Cuång","YÕn Tö ®éng",},
	{141,1568,3264,"H×nh Phô Sinh","TÇng 1 D­îc V­¬ng ®éng",},
	{141,1552,3216,"Ho¾c TrÊn Phi","TÇng 1 D­îc V­¬ng ®éng",},
	{141,1656,3264,"Qu¶n V« YÕm","TÇng 1 D­îc V­¬ng ®éng",},
	{141,1632,3184,"DiÖp VÜnh ¢n","TÇng 1 D­îc V­¬ng ®éng",},
	{193,1248,2960,"¢u chÝ Phong","Vò Di s¬n",},
	{193,912,2656,"§éc C« HiÖp ","Vò Di s¬n",},
	{193,960,2704,"H¹ng Phï Nhai","Vò Di s¬n",},
	{193,1440,3168,"Nghª §¹i Chu","Vò Di s¬n",},
}
tab_lv4xmap = {
	{5,1616,3472,"Du Th¸n Giang ","Kinh Hoµng ®éng",},
	{5,1440,3376,"H¹ Hïng Phi","Kinh Hoµng ®éng",},
	{5,1600,3280,"Tèng Vò Phong","Kinh Hoµng ®éng",},
	{5,1752,3616,"Lé Th­îng Nh©n","Kinh Hoµng ®éng",},
	{168,1760,3216,"NhËm T«ng Hoµnh","Phông Nh·n ®éng",},
	{168,1760,3024,"Hµn Khanh Long","Phông Nh·n ®éng",},
	{168,1640,2912,"Tr× PhÈm Ch©n","Phông Nh·n ®éng",},
	{168,1520,2928,"Chung ThiÕt Thèi","Phông Nh·n ®éng",},
	{23,1696,3168,"§iªu DÞch §ao","ThÇn Tiªn ®éng",},
	{23,1768,3072,"§å Tµn Sinh","ThÇn Tiªn ®éng",},
	{23,1864,3168,"Bµng V« TÜnh","ThÇn Tiªn ®éng",},
	{23,1768,3312,"Lý Hoa §é","ThÇn Tiªn ®éng",},
	{91,1536,3008,"ThÝch ¶nh Sa","Kª Qu¸n ®éng",},
	{91,1528,2784,"Nguy Nh©n Tö ","Kª Qu¸n ®éng",},
	{91,1688,2960,"Cè ViÔn Khª ","Kª Qu¸n ®éng",},
	{91,1656,3088,"Tang Ninh Cèc","Kª Qu¸n ®éng",},
	{135,1736,2960,"Diªm Tù H÷u","KiÕn TÝnh Phong s¬n  ®éng",},
	{135,1808,3040,"§µm Thiªn Béc","KiÕn TÝnh Phong s¬n  ®éng",},
	{135,1608,3088,"Th¹ch Cè KiÒu","KiÕn TÝnh Phong s¬n  ®éng",},
	{135,1536,2896,"øng Th¸i HiÖp","KiÕn TÝnh Phong s¬n  ®éng",},
}
tab_lv5xmap = {
	{12,1792,3168,"M¹nh §¹p Hång","MËt ®¹o TÝn T­íng tù",},
	{12,1720,3104,"¢n Tøc HËn","MËt ®¹o TÝn T­íng tù",},
	{12,1696,3200,"Ho¾c Thanh S­¬ng","MËt ®¹o TÝn T­íng tù",},
	{12,1776,3264,"Miªn T­ §¹o","MËt ®¹o TÝn T­íng tù",},
	{24,1792,3232,"TiÕu Väng Du","H­ëng Thñy ®éng",},
	{24,1896,3280,"Cao N·i Kho¸t","H­ëng Thñy ®éng",},
	{24,1952,3376,"M¹nh Tö  Vò ","H­ëng Thñy ®éng",},
	{24,2064,3216,"§­êng NghÜa Chi","H­ëng Thñy ®éng",},
	{42,1592,2928,"L©u Vi ThiÖn","Thiªn T©m ®éng",},
	{42,1520,3152,"Lç Tranh Tranh","Thiªn T©m ®éng",},
	{42,1632,2992,"Sö Tiªu s¬n ","Thiªn T©m ®éng",},
	{42,1704,3104,"T©y M«n V« Giíi","Thiªn T©m ®éng",},
	{66,1720,3232,"Giíi T×nh ChØ ","S¬n ®éng d­íi ®¸y §éng §×nh Hå",},
	{66,1696,3312,"L«i HuyÔn Kh¸ch","S¬n ®éng d­íi ®¸y §éng §×nh Hå",},
	{66,1832,3232,"DiÖp Ngò Long","S¬n ®éng d­íi ®¸y §éng §×nh Hå",},
	{66,1656,3184,"TiÕt TiÓu B¸ch","S¬n ®éng d­íi ®¸y §éng §×nh Hå",},
	{194,1720,3360,"MËu TuÊt Nhung","Ngäc Hoa ®éng",},
	{194,1768,3200,"D­¬ng DiÔm Qu©n","Ngäc Hoa ®éng",},
	{194,1536,3104,"Du Tiªu C­êng","Ngäc Hoa ®éng",},
	{194,1480,3456,"C« Dù  TÈu","Ngäc Hoa ®éng",},
}
tab_lv6xmap = {
	{164,1784,3120,"U«ng ThÖ Thñy","TÇng 1 Thiªn TÇm th¸p",},
	{164,1776,2928,"YÕn L­u Sanh","TÇng 1 Thiªn TÇm th¸p",},
	{164,1720,3072,"Tang Th­¬ng H¶i","TÇng 1 Thiªn TÇm th¸p",},
	{164,1568,3040,"Bå ThËp Tam ","TÇng 1 Thiªn TÇm th¸p",},
	{117,1664,3008,"HËu  KhÊt KiÕm","TÇng  2 T­êng V©n ®éng",},
	{117,1528,3104,"HËu YÕn T©n","TÇng  2 T­êng V©n ®éng",},
	{117,1656,3136,"ThiÖu ThÊt S¸t","TÇng  2 T­êng V©n ®éng",},
	{117,1680,3248,"Du V¹n Lý ","TÇng  2 T­êng V©n ®éng",},
	{56,1464,3440,"Cõu DuÉn Sam","Hoµnh s¬n  ph¸i",},
	{56,1536,3376,"Th­îng Quan ChÊt","Hoµnh s¬n  ph¸i",},
	{56,1504,3232,"T¸i ViÔn B¹c","Hoµnh s¬n  ph¸i",},
	{56,1624,3152,"T­ëng HuyÒn ViÔn","Hoµnh s¬n  ph¸i",},
	{148,1536,3296,"KhuÊt Léc Vinh","TÇng 4 TuyÕt B¸o ®éng",},
	{148,1560,3280,"L« Qu¸n B¾c ","TÇng 4 TuyÕt B¸o ®éng",},
	{148,1560,3312,"Gi¶i Qui Nam ","TÇng 4 TuyÕt B¸o ®éng",},
	{148,1624,3200,"Tïng V« ¶nh","TÇng 4 TuyÕt B¸o ®éng",},
	{196,1528,3040,"TiÔn Thª Thanh ","D­¬ng Gi¸c ®éng",},
	{196,1648,2944,"B¹ch Th­¬ng Nham","D­¬ng Gi¸c ®éng",},
	{196,1768,3184,"BiÖn L­u ThiÖn"," D­¬ng Gi¸c ®éng",},
	{196,1656,3344,"Th¸i Tinh ThÇn","D­¬ng Gi¸c ®éng",},
}
tab_lv7xmap = {
	{123,1600,3200,"H¹ng LÖnh Ti","L·o Hæ ®éng",},
	{123,1704,3248,"Tµo Nh©n Phñ ","L·o Hæ ®éng",},
	{123,1576,3360,"Tr×nh Phóc Ba","L·o Hæ ®éng",},
	{123,1552,3296,"§Æng An Khuª ","L·o Hæ ®éng",},
	{94,1664,3120,"øng  Tiªu Phong","Linh Cèc ®éng",},
	{94,1752,3168,"Th­¬ng TriÒu S­¬ng","Linh Cèc ®éng",},
	{94,1584,3248,"Phïng Song Dùc","Linh Cèc ®éng",},
	{94,1608,3040,"Phã Kh©u Tu","Linh Cèc ®éng",},
	{319,1656,3296,"L¹c Long HiÒn","L©m Du Quan",},
	{319,1856,3264,"Cæ Thanh D­¬ng","L©m Du Quan",},
	{319,1928,3632,"Quan Thiªn VÊn","L©m Du Quan",},
	{319,1808,3408,"H¹ ThiÕu Hïng","L©m Du Quan",},
	{72,1624,3120,"T« Cæ Ng©m","§¹i Tï ®éng",},
	{72,1800,3200,"Hå NhÊt Lang","§¹i Tï ®éng",},
	{72,1584,3232,"Hoµng V¹n KiÕp","§¹i Tï ®éng",},
	{72,1560,2976,"Giang TrÇm Nh¹n ","§¹i Tï ®éng",},
	{76,1648,3136,"C¶nh Dung Phôc","S¬n B¶o ®éng",},
	{76,1584,3152,"Kh­¬ng Tù Dao","S¬n B¶o ®éng",},
	{76,1832,3056,"Khæng Dong Nh©n","S¬n B¶o ®éng",},
	{76,1608,3024,"L¨ng TËn Trung","S¬n B¶o ®éng",},
}
tab_lv8xmap = {
	{201,1768,3200,"DiÖp øc Anh","B¨ng Hµ ®éng",},
	{201,1648,3184,"L¹c NhÜ Kim","B¨ng Hµ ®éng",},
	{201,1696,3312,"M¹c Nam Tróc","B¨ng Hµ ®éng",},
	{201,1832,3360,"TÇn Tö Du","B¨ng Hµ ®éng",},
	{10,1744,2992,"C« V« Th­êng","Nh¹n Th¹ch ®éng",},
	{10,1848,3216,"LiÔu Tø Gia","Nh¹n Th¹ch ®éng",},
	{10,1752,3216,"Thi §¹i ThiÕu","Nh¹n Th¹ch ®éng",},
	{10,1672,3136,"T«n V¨n B­u ","Nh¹n Th¹ch ®éng",},
	{202,1544,2832,"§ång BÊt Phôc","Phï Dung ®éng",},
	{202,1712,2912,"§­êng B¸c V¨n","Phï Dung ®éng",},
	{202,1608,3136,"§µo §¶o Chñ ","Phï Dung ®éng",},
	{202,1512,2656,"§iÒn V« §¹o","Phï Dung ®éng",},
	{181,1592,3104,"Viªn NiÖm TÞch","L­ìng Thñy ®éng",},
	{181,1624,2960,"TrÞnh Tr¸c QuÇn","L­ìng Thñy ®éng",},
	{181,1696,3024,"Ch­¬ng Nguyªn Sïng","L­ìng Thñy ®éng",},
	{181,1688,3216,"T¹ Träng HËu","L­ìng Thñy ®éng",},
	{143,1536,3152,"Vu Cöu  §å","TÇng 3 D­îc V­¬ng ®éng",},
	{143,1528,3248,"Viªn Thiªn Thä ","TÇng 3 D­îc V­¬ng ®éng",},
	{143,1640,3120,"Nh¹c Th­îng C«n","TÇng 3 D­îc V­¬ng ®éng",},
	{143,1632,3248,"Chiªm Phóc V©n","TÇng 3 D­îc V­¬ng ®éng",},
}
tab_lv9xmap = {
	{93,1640,3264,"Gi¶ Giíi Nh©n","TiÕn Cóc ®éng",},
	{93,1640,3056,"TrÞnh Cöu NhËt","TiÕn Cóc ®éng",},
	{93,1736,3200,"Chu Së B¸ ","TiÕn Cóc ®éng",},
	{93,1608,3152,"Trang Minh Trung","TiÕn Cóc ®éng",},
	{225,1584,3312,"Cam ChÝnh C« ","Sa M¹c s¬n  ®éng",},
	{225,1256,3232,"Vò NhÊt ThÕ ","Sa M¹c s¬n  ®éng",},
	{225,1448,3376,"D­¬ng Phong  DËt","Sa M¹c s¬n  ®éng",},
	{225,1424,3104,"Hµ Sinh Vong","Sa M¹c s¬n  ®éng",},
	{75,1704,3184,"T¨ng ChØ ãan","Kho¶ Lang ®éng",},
	{75,1752,3120,"VÖ Biªn Thµnh","Kho¶ Lang ®éng",},
	{75,1824,3184,"Cè Thñ §»ng","Kho¶ Lang ®éng",},
	{75,1632,3152,"Gia C¸t Kinh Hång","Kho¶ Lang ®éng",},
	{321,1248,2992,"Phan Ng¹t Nh¹n","Tr­êng B¹ch nam",},
	{321,1483,2744,"Liªn H×nh Th¸i","Tr­êng B¹ch nam",}, -- lag
	{321,1288,2608,"Bµo TriÖt s¬n ","Tr­êng B¹ch nam",},
	{321,1112,2560,"V¹n Hå Tinh","Tr­êng B¹ch nam",},
	{340,1216,2736,"Trö Thiªn MÉn","M¹c Cao QuËt",},
	{340,1720,2752,"§o¹n L¨ng NguyÖt","M¹c Cao QuËt",},
	{340,1272,2736,"T¶ DËt Minh","M¹c Cao QuËt",},
	{340,1924,2770,"NhËm Th­¬ng Khung","M¹c Cao QuËt",},
}
-- Boss Sat Thu 2x
function gopos_2x(ns, ne)
	if (not ns) then
		ns_1 = 1;
		ne_1 = 7;
	else
		ns_1 = ns;
		ne_1 = ne;
	end
	
	if (ne_1 - ns_1 > 6) then
		ne_1 = ns_1 + 6;
	end
	
	local n_count = getn(tab_lv2xmap);
	
	local tab_Content = {};
	for i = ns_1, ne_1 do
		tinsert(tab_Content, tab_lv2xmap[i][4].."/#gopos_2xdi("..i..")");
	end
	
	if (ns_1 ~= 1) then
		tinsert(tab_Content, "Trang tr­íc/#gopos_2x(1,"..(ns_1-1)..")");
	end
	
	if (ne_1 < n_count) then
		tinsert(tab_Content, "Trang kÕ/#gopos_2x("..(ne_1+1)..","..n_count..")");
	end
	
	tinsert(tab_Content, "Rêi khái./no");
	Say("<color=green>H·y chän kÎ mµ ng­¬i muèn tiªu diÖt, ta sÏ ®­a ng­¬i ®Õn chæ h¾n!<color>", getn(tab_Content), tab_Content);
end
function gopos_2xdi(nIdx)
	NewWorld(tab_lv2xmap[nIdx][1], tab_lv2xmap[nIdx][2], tab_lv2xmap[nIdx][3])
	SetFightState(1);
	Msg2Player("H·y ngåi yªn, chóng ta ®i ®Õn <color=Green>"..tab_lv2xmap[nIdx][5].."<color> ®Ó tiªu diÖt <color=Yellow>"..tab_lv2xmap[nIdx][4].."<color> nµo!");
end
-- Boss Sat Thu 3x
function gopos_3x(ns, ne)
	if (not ns) then
		ns_1 = 1;
		ne_1 = 7;
	else
		ns_1 = ns;
		ne_1 = ne;
	end
	
	if (ne_1 - ns_1 > 6) then
		ne_1 = ns_1 + 6;
	end
	
	local n_count = getn(tab_lv3xmap);
	
	local tab_Content = {};
	for i = ns_1, ne_1 do
		tinsert(tab_Content, tab_lv3xmap[i][4].."/#gopos_3xdi("..i..")");
	end
	
	if (ns_1 ~= 1) then
		tinsert(tab_Content, "Trang tr­íc/#gopos_3x(1,"..(ns_1-1)..")");
	end
	
	if (ne_1 < n_count) then
		tinsert(tab_Content, "Trang kÕ/#gopos_3x("..(ne_1+1)..","..n_count..")");
	end
	
	tinsert(tab_Content, "Rêi khái./no");
	Say("<color=green>H·y chän kÎ mµ ng­¬i muèn tiªu diÖt, ta sÏ ®­a ng­¬i ®Õn chæ h¾n!<color>", getn(tab_Content), tab_Content);
end

function gopos_3xdi(nIdx)
	NewWorld(tab_lv3xmap[nIdx][1], tab_lv3xmap[nIdx][2], tab_lv3xmap[nIdx][3])
	SetFightState(1);
	Msg2Player("H·y ngåi yªn, chóng ta ®i ®Õn <color=Green>"..tab_lv3xmap[nIdx][5].."<color> ®Ó tiªu diÖt <color=Yellow>"..tab_lv3xmap[nIdx][4].."<color> nµo!");
end
-- Boss Sat thu 4x
function gopos_4x(ns, ne)
	if (not ns) then
		ns_1 = 1;
		ne_1 = 7;
	else
		ns_1 = ns;
		ne_1 = ne;
	end
	
	if (ne_1 - ns_1 > 6) then
		ne_1 = ns_1 + 6;
	end
	
	local n_count = getn(tab_lv4xmap);
	
	local tab_Content = {};
	for i = ns_1, ne_1 do
		tinsert(tab_Content, tab_lv4xmap[i][4].."/#gopos_4xdi("..i..")");
	end
	
	if (ns_1 ~= 1) then
		tinsert(tab_Content, "Trang tr­íc/#gopos_4x(1,"..(ns_1-1)..")");
	end
	
	if (ne_1 < n_count) then
		tinsert(tab_Content, "Trang kÕ/#gopos_4x("..(ne_1+1)..","..n_count..")");
	end
	
	tinsert(tab_Content, "Rêi khái./no");
	Say("<color=green>H·y chän kÎ mµ ng­¬i muèn tiªu diÖt, ta sÏ ®­a ng­¬i ®Õn chæ h¾n!<color>", getn(tab_Content), tab_Content);
end

function gopos_4xdi(nIdx)
	NewWorld(tab_lv4xmap[nIdx][1], tab_lv4xmap[nIdx][2], tab_lv4xmap[nIdx][3])
	SetFightState(1);
	Msg2Player("H·y ngåi yªn, chóng ta ®i ®Õn <color=Green>"..tab_lv4xmap[nIdx][5].."<color> ®Ó tiªu diÖt <color=Yellow>"..tab_lv4xmap[nIdx][4].."<color> nµo!");
end
-- Boss Sat Thu 5x
function gopos_5x(ns, ne)
	if (not ns) then
		ns_1 = 1;
		ne_1 = 7;
	else
		ns_1 = ns;
		ne_1 = ne;
	end
	
	if (ne_1 - ns_1 > 6) then
		ne_1 = ns_1 + 6;
	end
	
	local n_count = getn(tab_lv5xmap);
	
	local tab_Content = {};
	for i = ns_1, ne_1 do
		tinsert(tab_Content, tab_lv5xmap[i][4].."/#gopos_5xdi("..i..")");
	end
	
	if (ns_1 ~= 1) then
		tinsert(tab_Content, "Trang tr­íc/#gopos_5x(1,"..(ns_1-1)..")");
	end
	
	if (ne_1 < n_count) then
		tinsert(tab_Content, "Trang kÕ/#gopos_5x("..(ne_1+1)..","..n_count..")");
	end
	
	tinsert(tab_Content, "Rêi khái./no");
	Say("<color=green>H·y chän kÎ mµ ng­¬i muèn tiªu diÖt, ta sÏ ®­a ng­¬i ®Õn chæ h¾n!<color>", getn(tab_Content), tab_Content);
end

function gopos_5xdi(nIdx)
	NewWorld(tab_lv5xmap[nIdx][1], tab_lv5xmap[nIdx][2], tab_lv5xmap[nIdx][3])
	SetFightState(1);
	Msg2Player("H·y ngåi yªn, chóng ta ®i ®Õn <color=Green>"..tab_lv5xmap[nIdx][5].."<color> ®Ó tiªu diÖt <color=Yellow>"..tab_lv5xmap[nIdx][4].."<color> nµo!");
end
-- Boss Sat Thu 6x
function gopos_6x(ns, ne)
	if (not ns) then
		ns_1 = 1;
		ne_1 = 7;
	else
		ns_1 = ns;
		ne_1 = ne;
	end
	
	if (ne_1 - ns_1 > 6) then
		ne_1 = ns_1 + 6;
	end
	
	local n_count = getn(tab_lv6xmap);
	
	local tab_Content = {};
	for i = ns_1, ne_1 do
		tinsert(tab_Content, tab_lv6xmap[i][4].."/#gopos_6xdi("..i..")");
	end
	
	if (ns_1 ~= 1) then
		tinsert(tab_Content, "Trang tr­íc/#gopos_6x(1,"..(ns_1-1)..")");
	end
	
	if (ne_1 < n_count) then
		tinsert(tab_Content, "Trang kÕ/#gopos_6x("..(ne_1+1)..","..n_count..")");
	end
	
	tinsert(tab_Content, "Rêi khái./no");
	Say("<color=green>H·y chän kÎ mµ ng­¬i muèn tiªu diÖt, ta sÏ ®­a ng­¬i ®Õn chæ h¾n!<color>", getn(tab_Content), tab_Content);
end

function gopos_6xdi(nIdx)
	NewWorld(tab_lv6xmap[nIdx][1], tab_lv6xmap[nIdx][2], tab_lv6xmap[nIdx][3])
	SetFightState(1);
	Msg2Player("H·y ngåi yªn, chóng ta ®i ®Õn <color=Green>"..tab_lv6xmap[nIdx][5].."<color> ®Ó tiªu diÖt <color=Yellow>"..tab_lv6xmap[nIdx][4].."<color> nµo!");
end
-- Boss Sat Thu 7x
function gopos_7x(ns, ne)
	if (not ns) then
		ns_1 = 1;
		ne_1 = 7;
	else
		ns_1 = ns;
		ne_1 = ne;
	end
	
	if (ne_1 - ns_1 > 6) then
		ne_1 = ns_1 + 6;
	end
	
	local n_count = getn(tab_lv7xmap);
	
	local tab_Content = {};
	for i = ns_1, ne_1 do
		tinsert(tab_Content, tab_lv7xmap[i][4].."/#gopos_7xdi("..i..")");
	end
	
	if (ns_1 ~= 1) then
		tinsert(tab_Content, "Trang tr­íc/#gopos_7x(1,"..(ns_1-1)..")");
	end
	
	if (ne_1 < n_count) then
		tinsert(tab_Content, "Trang kÕ/#gopos_7x("..(ne_1+1)..","..n_count..")");
	end
	
	tinsert(tab_Content, "Rêi khái./no");
	Say("<color=green>H·y chän kÎ mµ ng­¬i muèn tiªu diÖt, ta sÏ ®­a ng­¬i ®Õn chæ h¾n!<color>", getn(tab_Content), tab_Content);
end

function gopos_7xdi(nIdx)
	NewWorld(tab_lv7xmap[nIdx][1], tab_lv7xmap[nIdx][2], tab_lv7xmap[nIdx][3])
	SetFightState(1);
	Msg2Player("H·y ngåi yªn, chóng ta ®i ®Õn <color=Green>"..tab_lv7xmap[nIdx][5].."<color> ®Ó tiªu diÖt <color=Yellow>"..tab_lv7xmap[nIdx][4].."<color> nµo!");
end
-- Boss Sat Thu 8x
function gopos_8x(ns, ne)
	if (not ns) then
		ns_1 = 1;
		ne_1 = 7;
	else
		ns_1 = ns;
		ne_1 = ne;
	end
	
	if (ne_1 - ns_1 > 6) then
		ne_1 = ns_1 + 6;
	end
	
	local n_count = getn(tab_lv8xmap);
	
	local tab_Content = {};
	for i = ns_1, ne_1 do
		tinsert(tab_Content, tab_lv8xmap[i][4].."/#gopos_8xdi("..i..")");
	end
	
	if (ns_1 ~= 1) then
		tinsert(tab_Content, "Trang tr­íc/#gopos_8x(1,"..(ns_1-1)..")");
	end
	
	if (ne_1 < n_count) then
		tinsert(tab_Content, "Trang kÕ/#gopos_8x("..(ne_1+1)..","..n_count..")");
	end
	
	tinsert(tab_Content, "Tho¸t/no");
	Say("<color=green>H·y chän kÎ mµ ng­¬i muèn tiªu diÖt, ta sÏ ®­a ng­¬i ®Õn chæ h¾n!<color>", getn(tab_Content), tab_Content);
end

function gopos_8xdi(nIdx)
	NewWorld(tab_lv8xmap[nIdx][1], tab_lv8xmap[nIdx][2], tab_lv8xmap[nIdx][3])
	SetFightState(1);
	Msg2Player("H·y ngåi yªn, chóng ta ®i ®Õn <color=Green>"..tab_lv8xmap[nIdx][5].."<color> ®Ó tiªu diÖt <color=Yellow>"..tab_lv8xmap[nIdx][4].."<color> nµo!");
end
-- Boss Sat Thu 9x
function gopos_9x(ns, ne)
	if (not ns) then
		ns_1 = 1;
		ne_1 = 7;
	else
		ns_1 = ns;
		ne_1 = ne;
	end
	
	if (ne_1 - ns_1 > 6) then
		ne_1 = ns_1 + 6;
	end
	
	local n_count = getn(tab_lv9xmap);
	
	local tab_Content = {};
	for i = ns_1, ne_1 do
		tinsert(tab_Content, tab_lv9xmap[i][5]..": "..tab_lv9xmap[i][4].."/#gopos_9xdi("..i..")");
	end
	
	if (ns_1 ~= 1) then
		tinsert(tab_Content, "Trang tr­íc/#gopos_9x(1,"..(ns_1-1)..")");
	end
	
	if (ne_1 < n_count) then
		tinsert(tab_Content, "Trang kÕ/#gopos_9x("..(ne_1+1)..","..n_count..")");
	end
	
	tinsert(tab_Content, "Rêi khái./no");
	Say("<color=green>H·y chän kÎ mµ ng­¬i muèn tiªu diÖt, ta sÏ ®­a ng­¬i ®Õn chæ h¾n!<color>", getn(tab_Content), tab_Content);
end

function gopos_9xdi(nIdx)
	NewWorld(tab_lv9xmap[nIdx][1], tab_lv9xmap[nIdx][2], tab_lv9xmap[nIdx][3])
	SetFightState(1);
	Msg2Player("H·y ngåi yªn, chóng ta ®i ®Õn <color=Green>"..tab_lv9xmap[nIdx][5].."<color> ®Ó tiªu diÖt <color=Yellow>"..tab_lv9xmap[nIdx][4].."<color> nµo!");
end


function no()
end

