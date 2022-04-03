Include("\\script\\battles\\battlehead.lua")
Include("\\script\\lib\\file.lua");
Include("\\script\\lib\\string.lua");
Include("\\script\\global\\forbidmap.lua");
Include("\\script\\missions\\sevencity\\war.lua")
Include("\\script\\global\\playerlist.lua")
Include("\\script\\item\\ib\\headshenxingfu.lua")
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\missions\\boss\\callboss_incity.lua")
Include("\\script\\global\\nhmnghia\\hotro\\gotoboss_satthu.lua")
IncludeLib("TONG")


function main(sel)

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
		"Th«n trang - Thµnh thÞ - M«n ph¸i - CLD/gototown",
		"Maps luyÖn c«ng/gotoluyencong",
		"ThiÕt ®Æt ®iÓm håi sinh./set_backpos",
		"§i lµm [Ho¹t ®«ng]./vitri_khac",
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
		--"VËn Tiªu/goto_vantieu",
		"Boss s¸t thñ/gotobosssatthu",
		"V­ît ¶i/goto_satthu",
		"TÝn Sø/goto_tinsu",
		"KiÕm Gia Mª Cung/goto_kiemgia",
		--"ThÝ LuyÖn §­êng/goto_thiluyenduong",
		"Viªm §Õ B¶o Tµng/goto_viemde",
		"Phong L¨ng §é/goto_phonglangdo",
		--"Tèng - Kim/gopos_step2battle",
		--"§Êu Tr­êng Sinh Tö/vaodautruong",
		"Thiªn Tr× MËt C¶nh/goto_thientri",
		--"Lo¹n ChiÕn Cöu Ch©u/goto_chaucoc",
		--"ChiÕn tr­êng ThÊt Thµnh §¹i ChiÕn/gopos_sevencityfield",
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
BienHinh()
	local szTong = GetTong()
	if not szTong or  szTong == "" then
		SetCreateTeam(0);
		SetCurCamp(4);
BienHinh()
end
end
function BienHinh()
local szTong = GetTongName()

if szTong == "VuiÙVÎ" then
ChangeOwnFeature( 1, 3500*18, 822,  0, 0, 0, 0)
end
if szTong == "VâÙL©m" then
ChangeOwnFeature( 1, 3500*18, 1194,  0, 0, 0, 0)
end
if szTong == "ÙQuËy" then
ChangeOwnFeature( 1, 3500*18, 1195,  0, 0, 0, 0)
end
if szTong == "Ngé" then
ChangeOwnFeature( 1, 3500*18, 1196,  0, 0, 0, 0)
end
if szTong == "" then
ChangeOwnFeature( 1, 3500*18, 1200,  0, 0, 0, 0)
end
if szTong == "" then
ChangeOwnFeature( 1, 3500*18, 1114,  0, 0, 0, 0)
end
if szTong == "" then
ChangeOwnFeature( 1, 3500*18, 1436,  0, 0, 0, 0)
end
if szTong == "" and GetCamp() ~= 6 then
ChangeOwnFeature( 1, 3500*18, 893,  0, 0, 0, 0)
end
if GetCamp() == 6 then
ChangeOwnFeature( 1, 3500*18, 1503,  0, 0, 0, 0)
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

local tbmap =
{
	[20]={
		{"L¨ng TÇn Thñy Hoµng",7, 2235, 2847},
		{"La Tiªu s¬n",179, 1738, 2559},
		{"KiÕm C¸c Thôc §¹o",3,1159, 3715},
	},
	[30]={
		{"Thôc C­¬ng s¬n",92, 1637, 3302},
		{"B¹ch V©n ®éng",21, 2852, 3887},
		{"Kim Quang ®éng",4, 1596, 3282},
		{"tÇng 1 TÇn L¨ng",8, 1603, 3497},
		{"Thæ PhØ ®éng",167, 1859, 2770},
		{"Táa V©n ®éng",6, 1644, 3195},
	},
	[40]={
		{"§iÓm Th­¬ng ®éng",167, 1411, 2748},
		{"ThÇn Tiªn ®éng",23, 1583, 3205},
		{"Kinh Hoµng ®éng",	5, 1802, 3412},
	},
	[50]={
		{"Thiªn TÇm th¸p tÇng 1",164, 1606, 3194},
		{"H­ëng Thñy ®éng",24, 1692, 3189},
		{"Thiªn T©m ®éng",	42, 1584, 3221},
		{"ThiÕt Th¸p mª cung",	38, 1602, 3206},
		{"NghiÖt Long ®éng",	179, 1541, 3193},
	},
	[60]={
		{"108 La H¸n trËn",114, 1499, 3312},
		{"Thanh Loa ®éng",	69, 1600, 3207},
		{"Linh Cèc ®éng",	94, 1591, 3194},
	},
	[70]={
		{"L©m Du Quan",	319, 1612, 3612},
		{"§¹i Tï ®éng",	72, 1700, 2865},
		{"L·o Hæ ®éng",	122, 1665, 3326},
		{"Long Nh·n ®éng",	167, 1214, 2731},
	},
	[80]={
		{"V« Danh ®éng",	153, 1439, 3042},
		{"L­ìng Thñy ®éng",	179, 1570, 3147},
		{"Thanh Khª ®éng",174, 1483, 3074},
		{"Phï Dung ®éng",20, 3701, 6232},
	},
}
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
		"ChiÕn Long §éng/didenchienlongok",

	}
	Say("ThÇn hµnh phï, ®i ®Õn n¬i ng­¬i muèn.", getn(tab_Content), tab_Content);
end;


function gotoluyencong()

	local tab_Content = {
		"B¶n ®å cÊp 90/#gopos_step2lv90()",
		"B¶n ®å cÊp trªn 90/#gopos_step2lv90x()",
		"B¶n ®å LuyÖn c«ng cña t©n thñ./#luyencongtanthu()",
		"Rêi khái/no",

	}
	Say("ThÇn hµnh phï, ®i ®Õn n¬i ng­¬i muèn.", getn(tab_Content), tab_Content);
end;

function luyencongtanthu()
	local tab_Content = {
		"Di chuyÓn ®Õn b¶n ®å luyÖn c«ng cÊp 20 /gopos_step2lv20",
		"Di chuyÓn ®Õn b¶n ®å luyÖn c«ng cÊp 30 /gopos_step2lv30",
		"Di chuyÓn ®Õn b¶n ®å luyÖn c«ng cÊp 40 /gopos_step2lv40",
		"Di chuyÓn ®Õn b¶n ®å luyÖn c«ng cÊp 50 /gopos_step2lv50",
		"Di chuyÓn ®Õn b¶n ®å luyÖn c«ng cÊp 60 /gopos_step2lv60",
		"Di chuyÓn ®Õn b¶n ®å luyÖn c«ng cÊp 70 /gopos_step2lv70",
		"Di chuyÓn ®Õn b¶n ®å luyÖn c«ng cÊp 80 /gopos_step2lv80",
		"Ta ch­a muèn ®i ®©u c¶./no",
	}
	Say("Lùa chän b¶n ®å luyÖn c«ng cÇn thiÕt.", getn(tab_Content), tab_Content);
end;

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

tab_lv90map = {

		{322,1589,3164	,"Tr­êng B¹ch S¬n B¾c",},
		{321,967,2313	,"Tr­êng B¹ch S¬n Nam",},
		{75,1811,3012	,"Kho¶ Lang ®éng",},
		{225,1474,3275	,"Sa M¹c Mª Cung 1",},
		{226,1560,3184	,"Sa M¹c Mª Cung 2",},
		{227,1588,3237	,"Sa M¹c Mª Cung 3",},
		{336,1124,3187	,"Phong L¨ng ®é",},
		{340,1845,3438	,"M¹c Cao QuËt",},
		{144,1691,3020	,"D­îc V­¬ng ®éng tÇng 4",},
		{93,1529,3166	,"TiÕn Cóc §éng MËt Cung",},
		{124,1675,3418	,"C¸n Viªn §éng Mª Cung",},
		{152,1672,3361	,"TuyÕt B¸o §éng TÇng 8",},
		--{949,1602,3199	,"Mª Cung KiÕm Gia",},
		--{875,1576,3177	,"H¾c Sa ®éng",},
		--{917,1816,3392	,"Ph¸ch HuyÕt Cèc",},
		--{918,1816,3392	,"¸c Nh©n Cèc",},
		---{919,1608,3168	,"Thùc Cèt Nhai",},
		--{920,1608,3168	,"H¾c Méc Nhai",},
		--{921,1560,3104	,"Thiªn Phô S¬n",},
		--{922,1560,3104	,"Bµn Long S¬n",},
		--{923,2008,4080	,"§Þa MÉu S¬n",},
		--{924,2008,4080	,"UyÓn Ph­îng S¬n",},
		--{950,1592,3195	,"¸c Lang Cèc",},
}

function gopos_step2lv90(ns, ne)
	print(ns, ne)
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
	local n_count = getn(tab_lv90map);
	local tab_Content = {};
	for i = ns_1, ne_1 do
		tinsert(tab_Content, tab_lv90map[i][4].."/#gopos_step3lv90( "..i..")");
	end
	if (ns_1 ~= 1) then
		tinsert(tab_Content, "Trang tr­íc/#gopos_step2lv90( 1,"..(ns_1-1)..")");
	end
	if (ne_1 < n_count) then
		tinsert(tab_Content, "Trang kÕ /#gopos_step2lv90( "..(ne_1+1)..","..n_count..")");
	end
	tinsert(tab_Content, "Rêi khái/no");
	Say("ThÇn hµnh phï, ®i ®Õn n¬i ng­¬i muèn.", getn(tab_Content), tab_Content);
end


function gopos_step3lv90(nIdx)
	NewWorld(tab_lv90map[nIdx][1], tab_lv90map[nIdx][2], tab_lv90map[nIdx][3])
	SetFightState(1);
	Msg2Player("Xin h·y ngåi yªn, chóng ta ®i "..tab_lv90map[nIdx][4].." nµo");
	SetProtectTime(18*3) --cai gi do
	AddSkillState(963, 1, 0, 18*3)
end

-------------**********-----------
tab_lv90mapx = {

		{875,1576,3177	,"H¾c Sa ®éng",},
		{917,1816,3392	,"Ph¸ch HuyÕt Cèc",},
		{918,1816,3392	,"¸c Nh©n Cèc",},
		{919,1608,3168	,"Thùc Cèt Nhai",},
		{920,1608,3168	,"H¾c Méc Nhai",},
		{921,1560,3104	,"Thiªn Phô S¬n",},
		{922,1560,3104	,"Bµn Long S¬n",},
		{923,2008,4080	,"§Þa MÉu S¬n",},
		{924,2008,4080	,"UyÓn Ph­îng S¬n",},
		{950,1592,3195	,"¸c Lang Cèc",},
}
function gopos_step2lv90x(ns, ne)
	print(ns, ne)
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
	local n_count = getn(tab_lv90mapx);
	local tab_Content = {};
	for i = ns_1, ne_1 do
		tinsert(tab_Content, tab_lv90mapx[i][4].."/#gopos_step3lv90x( "..i..")");
	end
	if (ns_1 ~= 1) then
		tinsert(tab_Content, "Trang tr­íc/#gopos_step2lv90x( 1,"..(ns_1-1)..")");
	end
	if (ne_1 < n_count) then
		tinsert(tab_Content, "Trang kÕ /#gopos_step2lv90x( "..(ne_1+1)..","..n_count..")");
	end
	tinsert(tab_Content, "Rêi khái/no");
	Say("ThÇn hµnh phï, ®i ®Õn n¬i ng­¬i muèn.", getn(tab_Content), tab_Content);
end

function gopos_step3lv90x(nIdx)
	NewWorld(tab_lv90mapx[nIdx][1], tab_lv90mapx[nIdx][2], tab_lv90mapx[nIdx][3])
	SetFightState(1);
	Msg2Player("Xin h·y ngåi yªn, chóng ta ®i "..tab_lv90mapx[nIdx][4].." nµo");
	SetProtectTime(18*3) --cai gi do
	AddSkillState(963, 1, 0, 18*3)
end

----------------******************

tab_lv80map = {
		{224,1622,3118	,"Sa M¹c ®Þa biÓu",},
		{198,1521,2947	,"Thanh Khª §éng",},
		{320,1147,3123	,"Ch©n nói Tr­êng B¹ch",},
		{181,1425,2999	,"L­ìng Thñy §éng",},
		{201,1616,3195	,"B¨ng Hµ §éng",},
	}

function gopos_step2lv80(ns, ne)
	local n_count = getn(tab_lv80map);
	local tab_Content = {};
	for i = 1, 5 do
		tinsert(tab_Content, tab_lv80map[i][4].."/#gopos_step3lv80( "..i..")");
	end


	tinsert(tab_Content, "Hñy bá/no");
	Say("ThÇn Hµnh Phï, di chuyÓn ®Õn n¬i cÇn ®Õn.", getn(tab_Content), tab_Content);
end


function gopos_step3lv80(nIdx)
	NewWorld(tab_lv80map[nIdx][1], tab_lv80map[nIdx][2], tab_lv80map[nIdx][3])
	SetFightState(1);
	Msg2Player("Ngåi yªn! Chóng ta ®i "..tab_lv80map[nIdx][4].."!");
	SetProtectTime(18*3) --cai gi do
	AddSkillState(963, 1, 0, 18*3)
end
---------------------map luyen cong 70----------------------------
tab_lv70map = {
		{319,1630,3587	,"L©m Du Quan",},
		{123,1702,3350	,"L·o Hæ §éng",},
		{206,1603,3215	,"TÇn L¨ng tÇng 2",},

	}

function gopos_step2lv70(ns, ne)
	local n_count = getn(tab_lv70map);
	local tab_Content = {};
	for i = 1, 3 do
		tinsert(tab_Content, tab_lv70map[i][4].."/#gopos_step3lv70( "..i..")");
	end


	tinsert(tab_Content, "Hñy bá/no");
	Say("ThÇn Hµnh Phï, di chuyÓn ®Õn n¬i cÇn ®Õn.", getn(tab_Content), tab_Content);
end


function gopos_step3lv70(nIdx)
	NewWorld(tab_lv70map[nIdx][1], tab_lv70map[nIdx][2], tab_lv70map[nIdx][3])
	SetFightState(1);
	Msg2Player("Ngåi yªn! Chóng ta ®i "..tab_lv70map[nIdx][4].."!");
	SetProtectTime(18*3) --cai gi do
	AddSkillState(963, 1, 0, 18*3)
end
---------------------map luyen cong 60----------------------------
tab_lv60map = {
		{79,1600,3206	,"T­¬ng D­¬ng Nha M«n MËt §¹o",},
		{56,1516,3443	,"Hoµnh S¬n Ph¸i",},
		{166,1649,3231	,"Thiªn T©m Th¸p tÇng 3",},

	}

function gopos_step2lv60(ns, ne)
	local n_count = getn(tab_lv60map);
	local tab_Content = {};
	for i = 1, 3 do
		tinsert(tab_Content, tab_lv60map[i][4].."/#gopos_step3lv60( "..i..")");
	end


	tinsert(tab_Content, "Hñy bá/no");
	Say("ThÇn Hµnh Phï, di chuyÓn ®Õn n¬i cÇn ®Õn.", getn(tab_Content), tab_Content);
end


function gopos_step3lv60(nIdx)
	NewWorld(tab_lv60map[nIdx][1], tab_lv60map[nIdx][2], tab_lv60map[nIdx][3])
	SetFightState(1);
	Msg2Player("Ngåi yªn! Chóng ta ®i "..tab_lv60map[nIdx][4].."!");
	SetProtectTime(18*3) --Cai gi do
	AddSkillState(963, 1, 0, 18*3)
end
---------------------map luyen cong 50----------------------------
tab_lv50map = {
		{182,1777,2982	,"NghiÖt Long §éng",},
		{164,1611,3187	,"Thiªn T©m Th¸p",},

	}

function gopos_step2lv50(ns, ne)
	local n_count = getn(tab_lv50map);
	local tab_Content = {};
	for i = 1, 2 do
		tinsert(tab_Content, tab_lv50map[i][4].."/#gopos_step3lv50( "..i..")");
	end


	tinsert(tab_Content, "Hñy bá/no");
	Say("ThÇn Hµnh Phï, di chuyÓn ®Õn n¬i cÇn ®Õn.", getn(tab_Content), tab_Content);
end


function gopos_step3lv50(nIdx)
	NewWorld(tab_lv50map[nIdx][1], tab_lv50map[nIdx][2], tab_lv50map[nIdx][3])
	SetFightState(1);
	Msg2Player("Ngåi yªn! Chóng ta ®i "..tab_lv50map[nIdx][4].."!");
	SetProtectTime(18*3) --cai gi do
	AddSkillState(963, 1, 0, 18*3)
end
---------------------map luyen cong 40----------------------------
tab_lv40map = {
		{21,2622,4502	,"Thanh Thµnh S¬n",},
		{167,1575,3239	,"§iÓm Th­¬ng S¬n",},

	}

function gopos_step2lv40(ns, ne)
	local n_count = getn(tab_lv40map);
	local tab_Content = {};
	for i = 1, 2 do
		tinsert(tab_Content, tab_lv40map[i][4].."/#gopos_step3lv40( "..i..")");
	end


	tinsert(tab_Content, "Hñy bá/no");
	Say("ThÇn Hµnh Phï, di chuyÓn ®Õn n¬i cÇn ®Õn.", getn(tab_Content), tab_Content);
end


function gopos_step3lv40(nIdx)
	NewWorld(tab_lv40map[nIdx][1], tab_lv40map[nIdx][2], tab_lv40map[nIdx][3])
	SetFightState(1);
	Msg2Player("Ngåi yªn! Chóng ta ®i "..tab_lv40map[nIdx][4].."!");
	SetProtectTime(18*3) --cai gi do
	AddSkillState(963, 1, 0, 18*3)
end
---------------------map luyen cong 30----------------------------
tab_lv30map = {
		{193,1938,2845	,"Vò Di S¬n",},
		{170,1612,3187	,"Thæ PhØ §éng",},
	}

function gopos_step2lv30(ns, ne)
	local n_count = getn(tab_lv30map);
	local tab_Content = {};
	for i = 1, 2 do
		tinsert(tab_Content, tab_lv30map[i][4].."/#gopos_step3lv30( "..i..")");
	end


	tinsert(tab_Content, "Hñy bá/no");
	Say("ThÇn Hµnh Phï, di chuyÓn ®Õn n¬i cÇn ®Õn.", getn(tab_Content), tab_Content);
end


function gopos_step3lv30(nIdx)
	NewWorld(tab_lv30map[nIdx][1], tab_lv30map[nIdx][2], tab_lv30map[nIdx][3])
	SetFightState(1);
	Msg2Player("Ngåi yªn! Chóng ta ®i "..tab_lv30map[nIdx][4].."!");
	SetProtectTime(18*3) --cai gid
	AddSkillState(963, 1, 0, 18*3)
end
---------------------map luyen cong 20----------------------------
tab_lv20map = {
		{19,3102,3963	,"KiÕm C¸c T©y Nam",},
		{7,2276,2825	,"TÇn L¨ng tÇng 1",},

	}

function gopos_step2lv20(ns, ne)
	local n_count = getn(tab_lv20map);
	local tab_Content = {};
	for i = 1, 2 do
		tinsert(tab_Content, tab_lv20map[i][4].."/#gopos_step3lv20( "..i..")");
	end


	tinsert(tab_Content, "Hñy bá/no");
	Say("ThÇn Hµnh Phï, di chuyÓn ®Õn n¬i cÇn ®Õn.", getn(tab_Content), tab_Content);
end


function gopos_step3lv20(nIdx)
	NewWorld(tab_lv20map[nIdx][1], tab_lv20map[nIdx][2], tab_lv20map[nIdx][3])
	SetFightState(1);
	Msg2Player("Ngåi yªn! Chóng ta ®i "..tab_lv20map[nIdx][4].."!");
	SetProtectTime(18*3) ---- cai gi
	AddSkillState(963, 1, 0, 18*3)
end
---------------------map luyen cong 10----------------------------

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


function no()
end

