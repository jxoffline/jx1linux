IncludeLib("TASKSYS");
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\awardtemplet.lua")
IncludeLib("SETTING")
Include("\\script\\tong\\tong_award_head.lua");
IncludeLib("FILESYS")
Include("\\script\\lib\\common.lua");
Include("\\script\\vng_lib\\files_lib.lua");
Include("\\script\\petsys\\transferexp.lua")
Include("\\script\\petsys\\feed.lua")
Include("\\script\\ÖÐÔ­ÄÏÇø\\ÑïÖÝ\\npc\\ÑïÖÝ_Ìú½³Ñ§Í½¶Ô»°.lua")
Include("\\script\\ctc_feature\\top10\\top10.lua")
Include("\\script\\global\\eurofun\\hotro\\trangbihoangkim_caocap.lua")
Include("\\script\\global\\eurofun\\hotro\\nhancankhon.lua")
Include("\\script\\global\\eurofun\\hotro\\trangbihoangkim.lua")

function main()	
dofile("script/global/eurofun/npc/npc_thunghiem.lua")
str = "Chµo mõng c¸c b¹n ®· tham gia thÕ giíi <color=red>Vâ L©m TruyÒn Kú<color> ®­îc Edit <color=green>By  Eurofun<color> mäi chi tiÕt xin liªn hÖ <color=green>https://fb.com/groups/volamquan<color> ®Ó nhËn ®­îc sù hæ trî khi cÇn thiÕt."
AddGlobalCountNews(str, 1)
local bilTbOp = {}
tinsert(bilTbOp, "NhËn Trïng Sinh 6/TrungSinh")
tinsert(bilTbOp, "Xãa s¹ch g­¬ng ®å/DonSachRuong")
tinsert(bilTbOp, "NhËn Hé M¹ch §¬n vµ Ch©n Nguyªn n©ng m¹ch/nhantrannguyen")
--tinsert(bilTbOp, "Test/nhantrangbitestgame")
tinsert(bilTbOp, "NhËn Trang BÞ HiÕm/nhantrangbihiem")
tinsert(bilTbOp, "LÊy Trang BÞ Cao CÊp/TrangBiHoangKimCaoCap")
tinsert(bilTbOp, "NhËn Nguyªn LiÖu Pet/nguyenlieupet")
tinsert(bilTbOp, "LËp Bang/lapbang")
tinsert(bilTbOp, "NhËn TiÒn/NhanTienvsDiem")
tinsert(bilTbOp, "Vµo Hoa S¬n/vaohoason")
tinsert(bilTbOp, "Vµo Vò Hån/vaovuhon")
tinsert(bilTbOp, "KÕt thóc ®èi tho¹i/no")
Say("Chøc n¨ng thö nghiÖm !", getn(bilTbOp), bilTbOp)
end

function nhantrangbihiem()	
local bilTbOp = {}
tinsert(bilTbOp, "Trang BÞ HiÕm/TrangBiHiem")
tinsert(bilTbOp, "NhÉn Cµn Kh«n CÊp 10/NhanCanKhon")
tinsert(bilTbOp, "Trang BÞ Hoµng Kim Th­êng/TrangBiHoangKim22")
tinsert(bilTbOp, "KÕt thóc ®èi tho¹i/no")
Say("Chøc n¨ng thö nghiÖm !", getn(bilTbOp), bilTbOp)
end

function NhanCanKhon()	
local bilTbOp = {}
tinsert(bilTbOp, "NhÉn Cµn Kh«n CÊp 10 Thêi Gian Tróng §éc/NhanCanKhon1")
tinsert(bilTbOp, "NhÉn Cµn Kh«n CÊp 10 Thêi Gian Lµm Cho¸ng/NhanCanKhon2")
tinsert(bilTbOp, "NhÉn Cµn Kh«n CÊp 10 Thêi Gian Lµm ChËm/NhanCanKhon3")
tinsert(bilTbOp, "KÕt thóc ®èi tho¹i/no")
Say("Chøc n¨ng thö nghiÖm !", getn(bilTbOp), bilTbOp)
end
-----------------------------------------------------------------------------------------------------------
function vaohoason()
local player_Faction = GetFaction()
	if (GetLastFactionNumber() == 5) then		-- ±¾ÃÅ
		Talk(1,"","Tõ l©u nghe tiÕng c¸c c« n­¬ng Thóy Yªn ®Ñp nh­ tiªn n÷, vÞ c« n­¬ng nµy cho ¨n mµy ta Ýt tiÒn uèng r­îu ®­îc ch¨ng?")
		return
	elseif (GetLastFactionNumber() == 4) then				
		Talk(1,"","Xinh ®Ñp nh­ hoa t­¬i mµ h»ng ngµy cø ®èi diÖn víi Thanh §¨ng Cæ PhËt!  Ta kh«ng thÝch c¸c ng­¬i ë ®iÓm nµy! ")
		return
	elseif (GetLastFactionNumber() == 2) then
		Talk(1,"","Hai ph¸i chóng ta liªn minh l¹i, kh«ng cÇn ph¶i ph©n tranh n÷a! Ch¼ng ph¶i lµ hû sù ­?")
		return
	elseif (GetLastFactionNumber() == 3) then
		Talk(1,"","Ta ghÐt nhÊt lµ c¸i bän len lÐn h¹ ®éc h¹i ng­êi!  Êy!  Kh«ng ph¶i ta nãi ng­¬i! ")
		return
	elseif (GetLastFactionNumber() == 1) then
		Talk(1,"","D­¬ng Hå cña Thiªn V­¬ng bang c¸c ng­¬i cßn kÐm xa b¶n m«n cña ta, Thiªn V­¬ng qu¶ nhiªn ch¼ng ra g× hÕt! ")
		return
	elseif (GetLastFactionNumber() == 0) then
		Talk(1,"","Hßa th­îng ®Çu träc sao l¹i ®Õn n¬i th©m s¬n cïng cèc thÕ nµy?! ")
		return
	elseif (GetLastFactionNumber() == 8) then
		Talk(1,"","Quý m«n lÊy hiÖp nghÜa lµm träng, nh­ng kh«ng biÕt §¬n T­ Nam cã biÕt hæ thÑn hay kh«ng mµ cø muèn so tµi víi vâ c«ng cña chóng ta")
		return
	elseif (GetLastFactionNumber() == 9) then
		Talk(1,"","C«n L«n ph¸i ph¸t triÓn thÇn tèc! T¹i h¹ rÊt ng­ìng mé! ")
		return
	elseif (GetLastFactionNumber() == 7) then
		Talk(1,"","Ai lµm hoµng ®Õ th× còng mÆc!  Nh­ng c¸c ng­¬i tµn s¸t sinh linh th× bæn c« n­¬ng kh«ng bá qua! ")
		return
	elseif (GetLastFactionNumber() == 6) then
		Talk(2,"","§¹i hiÖp!  §õng qua ®©y! ","¸! Bä chÐt!!! ")
		return
	elseif (GetLastFactionNumber() == 11) then
		Talk(2,"","§¹i hiÖp!  §õng qua ®©y! ","¸! Bä chÐt!!! ")
		return
	elseif (GetLastFactionNumber() == 10) then
		Talk(2,"","§¹i hiÖp!  §õng qua ®©y! ","¸! Bä chÐt!!! ")
		return
end
SetFaction("huashan");
SetCamp(3);
SetCurCamp(3);
SetRank(89);
SetSeries(2);
SetLastFactionNumber(10);
AddMagic(1347,20)
AddMagic(1372,20)
AddMagic(1349,20)
AddMagic(1374,20)
AddMagic(1350,20)
AddMagic(1375,20)
AddMagic(1351,20)
AddMagic(1376,20)
AddMagic(1354,20)
AddMagic(1378,20)
AddMagic(1355,20)
AddMagic(1379,20)
AddMagic(1380,20)
AddMagic(1360,20)
AddMagic(1364,20)
AddMagic(1358,30)
AddMagic(1382,20)
AddMagic(1384,20)
AddMagic(1369,20)
AddMagic(1370,20)
end
-----------------------------------------------------------------------------------------------------------
function vaovuhon()
local player_Faction = GetFaction()
	if (GetLastFactionNumber() == 5) then		-- ±¾ÃÅ
		Talk(1,"","Tõ l©u nghe tiÕng c¸c c« n­¬ng Thóy Yªn ®Ñp nh­ tiªn n÷, vÞ c« n­¬ng nµy cho ¨n mµy ta Ýt tiÒn uèng r­îu ®­îc ch¨ng?")
		return
	elseif (GetLastFactionNumber() == 4) then				
		Talk(1,"","Xinh ®Ñp nh­ hoa t­¬i mµ h»ng ngµy cø ®èi diÖn víi Thanh §¨ng Cæ PhËt!  Ta kh«ng thÝch c¸c ng­¬i ë ®iÓm nµy! ")
		return
	elseif (GetLastFactionNumber() == 2) then
		Talk(1,"","Hai ph¸i chóng ta liªn minh l¹i, kh«ng cÇn ph¶i ph©n tranh n÷a! Ch¼ng ph¶i lµ hû sù ­?")
		return
	elseif (GetLastFactionNumber() == 3) then
		Talk(1,"","Ta ghÐt nhÊt lµ c¸i bän len lÐn h¹ ®éc h¹i ng­êi!  Êy!  Kh«ng ph¶i ta nãi ng­¬i! ")
		return
	elseif (GetLastFactionNumber() == 1) then
		Talk(1,"","D­¬ng Hå cña Thiªn V­¬ng bang c¸c ng­¬i cßn kÐm xa b¶n m«n cña ta, Thiªn V­¬ng qu¶ nhiªn ch¼ng ra g× hÕt! ")
		return
	elseif (GetLastFactionNumber() == 0) then
		Talk(1,"","Hßa th­îng ®Çu träc sao l¹i ®Õn n¬i th©m s¬n cïng cèc thÕ nµy?! ")
		return
	elseif (GetLastFactionNumber() == 8) then
		Talk(1,"","Quý m«n lÊy hiÖp nghÜa lµm träng, nh­ng kh«ng biÕt §¬n T­ Nam cã biÕt hæ thÑn hay kh«ng mµ cø muèn so tµi víi vâ c«ng cña chóng ta")
		return
	elseif (GetLastFactionNumber() == 9) then
		Talk(1,"","C«n L«n ph¸i ph¸t triÓn thÇn tèc! T¹i h¹ rÊt ng­ìng mé! ")
		return
	elseif (GetLastFactionNumber() == 7) then
		Talk(1,"","Ai lµm hoµng ®Õ th× còng mÆc!  Nh­ng c¸c ng­¬i tµn s¸t sinh linh th× bæn c« n­¬ng kh«ng bá qua! ")
		return
	elseif (GetLastFactionNumber() == 6) then
		Talk(2,"","§¹i hiÖp!  §õng qua ®©y! ","¸! Bä chÐt!!! ")
		return
	elseif (GetLastFactionNumber() == 10) then
		Talk(2,"","§¹i hiÖp!  §õng qua ®©y! ","¸! Bä chÐt!!! ")
		return
	elseif (GetLastFactionNumber() == 11) then
		Talk(2,"","§¹i hiÖp!  §õng qua ®©y! ","¸! Bä chÐt!!! ")
		return
	end
SetFaction("wuhun");
SetCamp(1);
SetCurCamp(1);
SetRank(97);
SetSeries(3);
SetLastFactionNumber(11);
AddMagic(1963,20)
AddMagic(1964,20)
AddMagic(1965,20)
AddMagic(1967,20)
AddMagic(1969,20)
AddMagic(1971,20)
AddMagic(1972,20)
AddMagic(1974,20)
AddMagic(1975,20)
AddMagic(1976,20)
AddMagic(1977,20)
AddMagic(1979,20)
AddMagic(1980,20)
AddMagic(1981,20)
AddMagic(1982,30)
AddMagic(1983,20)
AddMagic(1984,20)
AddMagic(1985,20)
AddMagic(1986,20)
end
--------------------------------------NhËn Ch©n Nguyªn------------------------------------------------------
function nhantrannguyen()
tbAwardTemplet:GiveAwardByList({{szName="Hé M¹ch §¬n",tbProp={6,1,3203,1,0},nCount=10000,},}, "npctest", 1);
SetTask(4000, GetTask(4000) + 100000)
end
--------------------------------------NhËn Trang BÞ Test Game-----------------------------------------------
function nhantrangbitestgame()
for i=5658,5669 do
AddGoldItem(0,i)
end
--AddGoldItem(0,5991)
--AddGoldItem(0,3962)
--AddGoldItem(0,3997)
--AddGoldItem(0,6480)
--AddGoldItem(0,6480)
--AddGoldItem(0,6762)
--AddItem(0,11,841,1,0,0)
--AddItem(6,1,2219,1,0,0)
--AddItem(0,11,829,1,0,0)
--AddGoldItem(0,6542)
--AddGoldItem(0,6592)
--AddGoldItem(0,6682)
--AddGoldItem(0,6735)
end
--------------------------------------Nguyªn LiÖu Pet-----------------------------------------------
function nguyenlieupet()
local nTamePoint = PET_GetTamePoint() + 100000
PET_SetTamePoint(nTamePoint)
local nGrownPoint = PET_GetGrownPoint()
PET_SetGrownPoint(nGrownPoint + 20000)
local nUpgradePoint = PET_GetUpgradePoint()
PET_SetUpgradePoint(nUpgradePoint + 20000)
for i=1,100 do
AddItem(6,1,3454,1,0,0)
end
AddItem(6,1,4808,1,0,0)
AddItem(6,1,4808,1,0,0)
for i=1,10 do
AddItem(6,1,3456,1,0,0)
end
AddItem(6,1,4808,1,0,0)
AddItem(6,1,3453,0,0,0)
end
--------------------------------------LËp Bang-----------------------------------------------
function lapbang()
	if (GetCamp() ~= 4) then
		SetCamp(4);
		SetCurCamp(4);
	end
	if (GetRepute() < 450) then
		AddRepute(450);
	end
	if (GetLeadLevel() < 30) then
		for i = 1, 30 do
			AddLeadExp(250000);
		end
	end
	if (HaveItem(195) < 1) then
		AddItem(4,195,1,0,0,0);
	end
Earn(1000000)
NewWorld(2, 2344, 3488)
end
----------------------------------------------------------------------------------------------------
function NhanTienvsDiem()
local bilTbOp = {}
tinsert(bilTbOp, "NhËn Ngay 10000 V¹n/Nhan10000Van")
tinsert(bilTbOp, "NhËn Ngay 1000 Xu/Nhan1000Xu")
tinsert(bilTbOp, "Kh«ng giao dÞch/no")
Say("Chøc n¨ng thö nghiÖm tÝnh n¨ng server míi xin chµo quý nh©n sü vâ l©m ®· ®Õn chung vui !", getn(bilTbOp), bilTbOp)
end
------nhËn tiÒn v¹n -----
function Nhan10000Van()
if GetCash() > 10000000 then
return Say("B¹n nhËn qu¸ nhiÒu tiÒn råi!")
end
Earn(10000000)
Say("NhËn thµnh c«ng xin h·y kiÓm tra !")
end

------nhËn tiÒn v¹n -----
function Nhan1000Xu()
for i=1,999 do
AddItem(4,417,1,1,1,1)
end
Say("NhËn thµnh c«ng xin h·y kiÓm tra !")
end

----------------------------------------------------------------------------------------------------
function DonSachRuong()
Say(" dän!")
	local tbItems = {}
			tbItems = GetRoomItems(0);
			if (getn(tbItems) > 0) then
				for i = 1, getn(tbItems) do
					RemoveItemByIndex(tbItems[i],-1);
				end
			end
end
----------------------------------------------------------------------------------------------------
function TrungSinh()
local nTransLife = ST_GetTransLifeCount();
local nCurLevel = GetLevel()
local nAddLevel = 200 - nCurLevel
if (nTransLife == 0) then
for i = 1, 6 do ST_LevelUp(nAddLevel) ST_DoTransLife() end
		ST_LevelUp(nAddLevel)  
	elseif (nTransLife == 1) then
		for i = 1, 5 do ST_LevelUp(nAddLevel) ST_DoTransLife() end
		ST_LevelUp(nAddLevel); 
	elseif (nTransLife == 2) then
		for i = 1, 4 do ST_LevelUp(nAddLevel) ST_DoTransLife() end
		ST_LevelUp(nAddLevel); 
	elseif (nTransLife == 3) then
		for i = 1, 3 do ST_LevelUp(nAddLevel) ST_DoTransLife() end
		ST_LevelUp(nAddLevel); 
	elseif (nTransLife == 4) then
		for i = 1, 2 do ST_LevelUp(nAddLevel) ST_DoTransLife() end
		ST_LevelUp(nAddLevel);
	elseif (nTransLife == 5) then
		for i = 1, 1 do ST_LevelUp(nAddLevel) ST_DoTransLife() end
		ST_LevelUp(nAddLevel); 
	end
ST_LevelUp(200); 
end
----------------------------------------------------------------------------------------------------
function dotim()	local tab_Content = {
		"Vò KhÝ/weapon",
		"Y Phôc/shirt",
		"§Ønh M¹o/hat",
		"Hæ UyÓn/glove",
		"Yªu §¸i/belt",
		"Hµi Tö/shoe",
		"VËt phÈm hæ trî/khoangth",
		"MÆt n¹/manat",
		"Trang bÞ b¹ch kim/bachkim",
		"KÕt thóc ®èi tho¹i."
	}
	Say(" Muèn lÊy thªm c¸i g× nµo ? ", getn(tab_Content), tab_Content);
end;

function weapon()
	local tab_Content = {
		"KiÕm/kiem",
		"§ao/dao",
		"Bæng/bong",
		"Th­¬ng/kick",
		"Chïy/chuy",
		"Song §ao/songdao",
		"Phi Tiªu/phitieu",
		"Phi §ao/phidao",
		"Tô TiÔn/tutien",
		"KÕt thóc ®èi tho¹i."
	}
	Say(" Muèn lÊy thªm c¸i g× nµo ? ", getn(tab_Content), tab_Content);
end;


function kiem()
		AddQualityItem(2,0,0,0,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,0,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,0,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,0,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,0,10,4,0,-1,-1,-1,-1,-1,-1)	
end


function dao()
		AddQualityItem(2,0,0,1,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,1,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,1,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,1,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,1,10,4,0,-1,-1,-1,-1,-1,-1)	
end


function bong()
		AddQualityItem(2,0,0,2,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,2,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,2,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,2,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,2,10,4,0,-1,-1,-1,-1,-1,-1)	
end


function kick()
		AddQualityItem(2,0,0,3,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,3,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,3,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,3,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,3,10,4,0,-1,-1,-1,-1,-1,-1)	
end


function chuy()
		AddQualityItem(2,0,0,4,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,4,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,4,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,4,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,4,10,4,0,-1,-1,-1,-1,-1,-1)	
end


function songdao()
		AddQualityItem(2,0,0,5,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,5,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,5,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,5,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,0,5,10,4,0,-1,-1,-1,-1,-1,-1)	
end


function phitieu()
		AddQualityItem(2,0,1,0,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,1,0,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,1,0,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,1,0,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,1,0,10,4,0,-1,-1,-1,-1,-1,-1)	
end


function phidao()
		AddQualityItem(2,0,1,1,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,1,1,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,1,1,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,1,1,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,1,1,10,4,0,-1,-1,-1,-1,-1,-1)	
end


function tutien()
		AddQualityItem(2,0,1,2,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,1,2,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,1,2,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,1,2,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,1,2,10,4,0,-1,-1,-1,-1,-1,-1)	
end


function shirt()
	local tab_Content = {
		"ThÊt B¶o Cµ Sa/aothieulam",
		"Ch©n Vò Th¸nh Y/aovodang",
		"Thiªn NhÉn MËt Trang/aothiennhan",
		"Gi¸ng Sa Bµo/sabao",
		"§­êng Nghª Gi¸p/dng",
		"V¹n L­u Quy T«ng Y/aocaibang",
		"TuyÒn Long Bµo/longbao",
		"Long Tiªu §¹o Y/daoy",
		"Cöu VÜ B¹ch Hå Trang/hotrang",
		"TrÇm H­¬ng Sam/huongsam",
		"TÝch LÞch Kim Phông Gi¸p/kimphung",
		"V¹n Chóng TÒ T©m Y/tamy",
		"L­u Tiªn QuÇn/tienquan",
		"KÕt thóc ®èi tho¹i."
	}
	Say(" Muèn lÊy thªm c¸i g× nµo ? ", getn(tab_Content), tab_Content);
end;


function aothieulam()
		AddQualityItem(2,0,2,0,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,0,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,0,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,0,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,0,10,4,0,-1,-1,-1,-1,-1,-1)
end


function aovodang()
		AddQualityItem(2,0,2,1,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,1,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,1,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,1,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,1,10,4,0,-1,-1,-1,-1,-1,-1)
end


function aothiennhan()
		AddQualityItem(2,0,2,2,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,2,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,2,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,2,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,2,10,4,0,-1,-1,-1,-1,-1,-1)
end


function sabao()
		AddQualityItem(2,0,2,3,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,3,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,3,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,3,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,3,10,4,0,-1,-1,-1,-1,-1,-1)
end


function dng()
		AddQualityItem(2,0,2,4,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,4,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,4,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,4,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,4,10,4,0,-1,-1,-1,-1,-1,-1)
end


function aocaibang()
		AddQualityItem(2,0,2,5,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,5,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,5,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,5,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,5,10,4,0,-1,-1,-1,-1,-1,-1)
end


function longbao()
		AddQualityItem(2,0,2,6,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,6,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,6,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,6,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,6,10,4,0,-1,-1,-1,-1,-1,-1)
end


function daoy()
		AddQualityItem(2,0,2,8,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,8,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,8,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,8,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,8,10,4,0,-1,-1,-1,-1,-1,-1)
end


function hotrang()
		AddQualityItem(2,0,2,9,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,9,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,9,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,9,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,9,10,4,0,-1,-1,-1,-1,-1,-1)
end


function huongsam()
		AddQualityItem(2,0,2,10,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,10,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,10,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,10,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,10,10,4,0,-1,-1,-1,-1,-1,-1)
end


function kimphung()
		AddQualityItem(2,0,2,11,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,11,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,11,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,11,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,11,10,4,0,-1,-1,-1,-1,-1,-1)
end


function tamy()
		AddQualityItem(2,0,2,12,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,12,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,12,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,12,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,12,10,4,0,-1,-1,-1,-1,-1,-1)
end


function tienquan()
		AddQualityItem(2,0,2,13,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,13,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,13,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,13,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,2,13,10,4,0,-1,-1,-1,-1,-1,-1)
end


function hat()
	local tab_Content = {
		"Tú L« M·o/lomao",
		"Ngò L·o Qu¸n/laoquan",
		"Tu La Ph¸t KÕt/phatket",
		"Th«ng Thiªn Ph¸t Qu¸n/phatquan",
		"YÓm NhËt Kh«i/nhatkhoi",
		"TrÝch Tinh Hoµn/tinhhoan",
		"¤ Tµm M·o/tammao",
		"Quan ¢m Ph¸t Qu¸n/quanam",
		"¢m D­¬ng V« Cùc Qu¸n/amduong",
		"HuyÒn Tª DiÖn Tr¸o/dientrao",
		"Long HuyÕt §Çu Hoµn/longhuyet",
		"Long L©n Kh«i/lankhoi",
		"Thanh Tinh Thoa/tinhthoa",
		"Kim Phông TriÓn SÝ/triensi",
		"KÕt thóc ®èi tho¹i."
	}
	Say(" Muèn lÊy thªm c¸i g× nµo ? ", getn(tab_Content), tab_Content);
end;


function lomao()
		AddQualityItem(2,0,7,0,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,0,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,0,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,0,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,0,10,4,0,-1,-1,-1,-1,-1,-1)
end


function laoquan()
		AddQualityItem(2,0,7,1,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,1,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,1,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,1,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,1,10,4,0,-1,-1,-1,-1,-1,-1)
end


function phatket()
		AddQualityItem(2,0,7,2,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,2,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,2,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,2,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,2,10,4,0,-1,-1,-1,-1,-1,-1)
end


function phatquan()
		AddQualityItem(2,0,7,3,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,3,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,3,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,3,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,3,10,4,0,-1,-1,-1,-1,-1,-1)
end


function nhatkhoi()
		AddQualityItem(2,0,7,4,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,4,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,4,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,4,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,4,10,4,0,-1,-1,-1,-1,-1,-1)
end


function tinhhoan()
		AddQualityItem(2,0,7,5,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,5,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,5,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,5,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,5,10,4,0,-1,-1,-1,-1,-1,-1)
end


function tammao()
		AddQualityItem(2,0,7,6,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,6,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,6,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,6,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,6,10,4,0,-1,-1,-1,-1,-1,-1)
end


function quanam()
		AddQualityItem(2,0,7,7,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,7,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,7,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,7,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,7,10,4,0,-1,-1,-1,-1,-1,-1)
end


function amduong()
		AddQualityItem(2,0,7,8,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,8,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,8,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,8,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,8,10,4,0,-1,-1,-1,-1,-1,-1)
end


function dientrao()
		AddQualityItem(2,0,7,9,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,9,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,9,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,9,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,9,10,4,0,-1,-1,-1,-1,-1,-1)
end


function longhuyet()
		AddQualityItem(2,0,7,10,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,10,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,10,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,10,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,10,10,4,0,-1,-1,-1,-1,-1,-1)
end


function lankhoi()
		AddQualityItem(2,0,7,11,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,11,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,11,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,11,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,11,10,4,0,-1,-1,-1,-1,-1,-1)
end


function tinhthoa()
		AddQualityItem(2,0,7,12,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,12,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,12,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,12,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,12,10,4,0,-1,-1,-1,-1,-1,-1)
end


function triensi()
		AddQualityItem(2,0,7,13,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,13,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,13,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,13,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,7,13,10,4,0,-1,-1,-1,-1,-1,-1)
end


function glove()
	local tab_Content = {
		"Long Phông HuyÕt Ngäc Tr¹c/ngoctrac",
		"Thiªn Tµm Hé UyÓn/houyen",
		"KÕt thóc ®èi tho¹i."
	}
	Say(" Muèn lÊy thªm c¸i g× nµo ? ", getn(tab_Content), tab_Content);
end;


function ngoctrac()
		AddQualityItem(2,0,8,0,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,8,0,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,8,0,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,8,0,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,8,0,10,4,0,-1,-1,-1,-1,-1,-1)
end


function houyen()
		AddQualityItem(2,0,8,1,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,8,1,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,8,1,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,8,1,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,8,1,10,4,0,-1,-1,-1,-1,-1,-1)
end


function belt()
	local tab_Content = {
		"Thiªn Tµm Yªu §¸i/thientamyeu",
		"B¹ch Kim Yªu §¸i/bachkim",
		"KÕt thóc ®èi tho¹i."
	}
	Say(" Muèn lÊy thªm c¸i g× nµo ? ", getn(tab_Content), tab_Content);
end;


function thientamyeu()
		AddQualityItem(2,0,6,0,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,6,0,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,6,0,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,6,0,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,6,0,10,4,0,-1,-1,-1,-1,-1,-1)
end


function bachkim()
		AddQualityItem(2,0,6,1,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,6,1,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,6,1,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,6,1,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,6,1,10,4,0,-1,-1,-1,-1,-1,-1)
end


function shoe()
	local tab_Content = {
		"Cöu TiÕt X­¬ng VÜ Ngoa/cuutien",
		"Thiªn Tµm Ngoa/thientam",
		"Kim Lò Hµi/kimlu",
		"Phi Phông Ngoa/phiphung",
		"KÕt thóc ®èi tho¹i."
	}
	Say(" Muèn lÊy thªm c¸i g× nµo ? ", getn(tab_Content), tab_Content);
end;


function cuutien()
		AddQualityItem(2,0,5,0,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,5,0,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,5,0,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,5,0,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,5,0,10,4,0,-1,-1,-1,-1,-1,-1)
end


function thientam()
		AddQualityItem(2,0,5,1,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,5,1,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,5,1,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,5,1,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,5,1,10,4,0,-1,-1,-1,-1,-1,-1)
end


function kimlu()
		AddQualityItem(2,0,5,2,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,5,2,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,5,2,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,5,2,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,5,2,10,4,0,-1,-1,-1,-1,-1,-1)
end


function phiphung()
		AddQualityItem(2,0,5,3,10,0,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,5,3,10,1,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,5,3,10,2,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,5,3,10,3,0,-1,-1,-1,-1,-1,-1)
		AddQualityItem(2,0,5,3,10,4,0,-1,-1,-1,-1,-1,-1)
end

function bachkim()
	local tbOpt =
	{
		{"ThiÕu l©m", bktl},
		{"Thiªn v­¬ng", bktv},
		{"®­êng m«n", bkdm},
		{"Ngò ®éc", bk5d},
		{"Nga mi", bknm},
		{"Thuý yªn", bkty},
		{"C¸i bang", bkcb},
		{"Thiªn nhÉn", bktn},
		{"Vâ ®ang", bkvd},
		{"C«n l«n", bkcl},
		{"Tho¸t"},
	}
	CreateNewSayEx("<npc>Chän m«n ph¸i?", tbOpt)
end
function bktl()
AddGoldItem(0, 11)
AddGoldItem(0, 6)
end
function bktv()
AddGoldItem(0, 16)
AddGoldItem(0, 21)
AddGoldItem(0, 26)
end
function bknm()
AddGoldItem(0, 31)
end
function bkty()
AddGoldItem(0, 46)
end
function bk5d()
AddGoldItem(0, 61)
end
function bkdm()
AddGoldItem(0, 71)
AddGoldItem(0, 76)
AddGoldItem(0, 81)
end
function bkcb()
AddGoldItem(0, 96)
end
function bktn()
AddGoldItem(0, 101)
end
function bkvd()
for i=4346,4355 do
AddPlatinaItem(3, i)
end
end
function bkcl()
AddGoldItem(0, 126)
end


function dohoangkim()
if (CalcFreeItemCellCount() < 10) then
		return Talk(1,"","H·y S¾p XÕp L¹i Hµnh Trang 10 «")
end
local tab_Content =
{
--"Trang BÞ Thanh C©u/settc",
--"Trang BÞ V©n Léc/setvl",
--"Trang BÞ Th­¬ng Lang/settl",
--"Trang BÞ HuyÒn Viªn/sethv",
--"Trang BÞ Tö M·ng/tumang",
--"Trang BÞ Kim ¤/kimo",
"Trang BÞ B¹ch Hæ/bachho",
"Trang BÞ XÝch L©n/xichlan",
"Trang BÞ Minh Ph­îng/minhphuong",
"Trang BÞ Minh Ph­îng MAX/minhphuongmax",
"Trang BÞ §»ng Long/danglong",
"NhËn Vò KhÝ + ¸o §»ng Long Max./vkdanglongmax",
"Trang BÞ Tinh S­¬ng/tinhsuong",
"Trang BÞ NguyÖt KhuyÕt/nguyetkhuyet",
"Trang BÞ DiÖu D­¬ng/dieuduong",

"Tho¸t./no",
"Trë l¹i"
}
Say(" Muèn lÊy trang bÞ g× ? ", getn(tab_Content), tab_Content);
end



function dieuduong()
local tab_Content = {
"Rêi khái/no",
"ThiÕu L©m QuyÒn/#setdieuduong(1)",
"ThiÕu L©m Bçng/#setdieuduong(2)",
"ThiÕu L©m §ao/#setdieuduong(3)",
"Thiªn V­¬ng Chïy/#setdieuduong(4)",
"Thiªn V­¬ng Th­¬ng/#setdieuduong(5)",
"Thiªn V­¬ng §ao/#setdieuduong(6)",
"Nga Mi KiÕm/#setdieuduong(7)",
"Nga Mi Ch­ëng/#setdieuduong(8)",
"Thóy Yªn §ao/#setdieuduong(9)",
"Thóy Yªn Song §ao/#setdieuduong(10)",
"Ngò §éc Ch­ëng/#setdieuduong(11)",
"Ngò §éc §ao/#setdieuduong(12)",
"§­êng M«n Phi §ao/#setdieuduong(13)",
"§­êng M«n Ná/#setdieuduong(14)",
"Trang sau/dieuduong2",
}
Say("Xin chµo <color=yellow>"..GetName().."<color>, h·y lùa chon M«n Ph¸i", getn(tab_Content), tab_Content);
end
function dieuduong2()
local tab_Content = {
"§­êng M«n Phi Tiªu/#setdieuduong(15)",
"C¸i Bang Rång/#setdieuduong(16)",
"C¸i Bang Bçng/#setdieuduong(17)",
"Thiªn NhÉn KÝch/#setdieuduong(18)",
"Thiªn NhÉn §ao/#setdieuduong(19)",
"Vâ §ang QuyÒn/#setdieuduong(20)",
"Vâ §ang KiÕm/#setdieuduong(21)",
"C«n L«n §ao/#setdieuduong(22)",
"C«n L«n KiÕm/#setdieuduong(23)",
"Hoa S¬n KiÕm T«ng/#setdieuduong(24)",
"Hoa S¬n KhÝ T«ng/#setdieuduong(25)",
"Tho¸t/no",
"Trë l¹i"
}
Say("Xin chµo <color=yellow>"..GetName().."<color>,  h·y lùa chon M«n Ph¸i", getn(tab_Content), tab_Content);
end
function setdieuduong(nId)
for i = 7093, 7102 do
AddGoldItem(0,10*nId+i-10)
end
end


function xichlan()
local tab_Content = {
"Rêi khái/no",
"ThiÕu L©m QuyÒn/#sexichlan(1)",
"ThiÕu L©m Bçng/#sexichlan(2)",
"ThiÕu L©m §ao/#sexichlan(3)",
"Thiªn V­¬ng Chïy/#sexichlan(4)",
"Thiªn V­¬ng Th­¬ng/#sexichlan(5)",
"Thiªn V­¬ng §ao/#sexichlan(6)",
"Nga Mi KiÕm/#sexichlan(7)",
"Nga Mi Ch­ëng/#sexichlan(8)",
"Thóy Yªn §ao/#sexichlan(9)",
"Thóy Yªn Song §ao/#sexichlan(10)",
"Ngò §éc Ch­ëng/#sexichlan(11)",
"Ngò §éc §ao/#sexichlan(12)",
"§­êng M«n Phi §ao/#sexichlan(13)",
"§­êng M«n Ná/#sexichlan(14)",
"Trang sau/xichlan2",
}
Say("Xin chµo <color=yellow>"..GetName().."<color>, h·y lùa chon M«n Ph¸i", getn(tab_Content), tab_Content);
end
function xichlan2()
local tab_Content = {
"§­êng M«n Phi Tiªu/#sexichlan(15)",
"C¸i Bang Rång/#sexichlan(16)",
"C¸i Bang Bçng/#sexichlan(17)",
"Thiªn NhÉn KÝch/#sexichlan(18)",
"Thiªn NhÉn §ao/#sexichlan(19)",
"Vâ §ang QuyÒn/#sexichlan(20)",
"Vâ §ang KiÕm/#sexichlan(21)",
"C«n L«n §ao/#sexichlan(22)",
"C«n L«n KiÕm/#sexichlan(23)",
"Hoa S¬n KhÝ T«ng/#sexichlan(24)",
"Hoa S¬n KiÕm T«ng/#sexichlan(25)",
"Tho¸t/no",
"Trë l¹i"
}
Say("Xin chµo <color=yellow>"..GetName().."<color>, h·y lùa chon M«n Ph¸i", getn(tab_Content), tab_Content);
end
function sexichlan(nId)
for i = 2655, 2664 do
AddGoldItem(0,10*nId+i-10)
end
end


function minhphuong()
local tab_Content = {
"Rêi khái/no",
"ThiÕu L©m QuyÒn/#seminhphuong(1)",
"ThiÕu L©m Bçng/#seminhphuong(2)",
"ThiÕu L©m §ao/#seminhphuong(3)",
"Thiªn V­¬ng Chïy/#seminhphuong(4)",
"Thiªn V­¬ng Th­¬ng/#seminhphuong(5)",
"Thiªn V­¬ng §ao/#seminhphuong(6)",
"Nga Mi KiÕm/#seminhphuong(7)",
"Nga Mi Ch­ëng/#seminhphuong(8)",
"Thóy Yªn §ao/#seminhphuong(9)",
"Thóy Yªn Song §ao/#seminhphuong(10)",
"Ngò §éc Ch­ëng/#seminhphuong(11)",
"Ngò §éc §ao/#seminhphuong(12)",
"§­êng M«n Phi §ao/#seminhphuong(13)",
"§­êng M«n Ná/#seminhphuong(14)",
"Trang sau/minhphuong2",
}
Say("Xin chµo <color=yellow>"..GetName().."<color>, h·y lùa chon M«n Ph¸i", getn(tab_Content), tab_Content);
end
function minhphuong2()
local tab_Content = {
"§­êng M«n Phi Tiªu/#seminhphuong(15)",
"C¸i Bang Rång/#seminhphuong(16)",
"C¸i Bang Bçng/#seminhphuong(17)",
"Thiªn NhÉn KÝch/#seminhphuong(18)",
"Thiªn NhÉn §ao/#seminhphuong(19)",
"Vâ §ang QuyÒn/#seminhphuong(20)",
"Vâ §ang KiÕm/#seminhphuong(21)",
"C«n L«n §ao/#seminhphuong(22)",
"C«n L«n KiÕm/#seminhphuong(23)",
"Hoa S¬n KhÝ T«ng/#seminhphuong(24)",
"Hoa S¬n KiÕm T«ng/#seminhphuong(25)",
"Tho¸t/no",
"Trë l¹i"
}
Say("Xin chµo <color=yellow>"..GetName().."<color>, h·y lùa chon M«n Ph¸i", getn(tab_Content), tab_Content);
end
function seminhphuong(nId)
for i = 2905, 2914 do
AddGoldItem(0,10*nId+i-10)
end
end


function danglong()
local tab_Content = {
"Rêi khái/no",
"ThiÕu L©m QuyÒn/#sedanglong(1)",
"ThiÕu L©m Bçng/#sedanglong(2)",
"ThiÕu L©m §ao/#sedanglong(3)",
"Thiªn V­¬ng Chïy/#sedanglong(4)",
"Thiªn V­¬ng Th­¬ng/#sedanglong(5)",
"Thiªn V­¬ng §ao/#sedanglong(6)",
"Nga Mi KiÕm/#sedanglong(7)",
"Nga Mi Ch­ëng/#sedanglong(8)",
"Thóy Yªn §ao/#sedanglong(9)",
"Thóy Yªn Song §ao/#sedanglong(10)",
"Ngò §éc Ch­ëng/#sedanglong(11)",
"Ngò §éc §ao/#sedanglong(12)",
"§­êng M«n Phi §ao/#sedanglong(13)",
"§­êng M«n Ná/#sedanglong(14)",
"Trang sau/danglong2",
}
Say("Xin chµo <color=yellow>"..GetName().."<color>, h·y lùa chon M«n Ph¸i", getn(tab_Content), tab_Content);
end
function danglong2()
local tab_Content = {
"§­êng M«n Phi Tiªu/#sedanglong(15)",
"C¸i Bang Rång/#sedanglong(16)",
"C¸i Bang Bçng/#sedanglong(17)",
"Thiªn NhÉn KÝch/#sedanglong(18)",
"Thiªn NhÉn §ao/#sedanglong(19)",
"Vâ §ang QuyÒn/#sedanglong(20)",
"Vâ §ang KiÕm/#sedanglong(21)",
"C«n L«n §ao/#sedanglong(22)",
"C«n L«n KiÕm/#sedanglong(23)",
"Hoa S¬n KiÕm T«ng/#sedanglong(24)",
"Hoa S¬n KhÝ T«ng/#sedanglong(25)",
"Vò Hån ThuÉn Ph¸p/#setdanglongvh1()",
"Vò Hån §ao Ph¸p/#setdanglongvh2()",

"Tho¸t/no",
"Trë l¹i"
}
Say("Xin chµo <color=yellow>"..GetName().."<color>,  h·y lùa chon M«n Ph¸i", getn(tab_Content), tab_Content);
end
function setdanglongvh1()
	for i = 7575, 7584 do
	AddGoldItem(0,i)
	end
end

function setdanglongvh2()
	for i = 7585, 7594 do
	AddGoldItem(0,i)
	end
end

function sedanglong(nId)
for i = 3155, 3164 do
AddGoldItem(0,10*nId+i-10)
end
end

function tinhsuong()
local tab_Content = {
"Rêi khái/no",
"ThiÕu L©m QuyÒn/#setinhsuong(1)",
"ThiÕu L©m Bçng/#setinhsuong(2)",
"ThiÕu L©m §ao/#setinhsuong(3)",
"Thiªn V­¬ng Chïy/#setinhsuong(4)",
"Thiªn V­¬ng Th­¬ng/#setinhsuong(5)",
"Thiªn V­¬ng §ao/#setinhsuong(6)",
"Nga Mi KiÕm/#setinhsuong(7)",
"Nga Mi Ch­ëng/#setinhsuong(8)",
"Thóy Yªn §ao/#setinhsuong(9)",
"Thóy Yªn Song §ao/#setinhsuong(10)",
"Ngò §éc Ch­ëng/#setinhsuong(11)",
"Ngò §éc §ao/#setinhsuong(12)",
"§­êng M«n Phi §ao/#setinhsuong(13)",
"§­êng M«n Ná/#setinhsuong(14)",
"Trang sau/tinhsuong2",
}
Say("Xin chµo <color=yellow>"..GetName().."<color>, h·y lùa chon M«n Ph¸i", getn(tab_Content), tab_Content);
end
function tinhsuong2()
local tab_Content = {
"§­êng M«n Phi Tiªu/#setinhsuong(15)",
"C¸i Bang Rång/#setinhsuong(16)",
"C¸i Bang Bçng/#setinhsuong(17)",
"Thiªn NhÉn KÝch/#setinhsuong(18)",
"Thiªn NhÉn §ao/#setinhsuong(19)",
"Vâ §ang QuyÒn/#setinhsuong(20)",
"Vâ §ang KiÕm/#setinhsuong(21)",
"C«n L«n §ao/#setinhsuong(22)",
"C«n L«n KiÕm/#setinhsuong(23)",
"Hoa S¬n KiÕm T«ng/#setinhsuong(24)",
"Hoa S¬n KhÝ T«ng/#setinhsuong(25)",
"Tho¸t/no",
"Trë l¹i"
}
Say("Xin chµo <color=yellow>"..GetName().."<color>,  h·y lùa chon M«n Ph¸i", getn(tab_Content), tab_Content);
end
function setinhsuong(nId)
for i = 3405, 3414 do
AddGoldItem(0,10*nId+i-10)
end
end

function nguyetkhuyet()
local tab_Content = {
"Rêi khái/no",
"ThiÕu L©m QuyÒn/#setnguyetkhuyet(1)",
"ThiÕu L©m Bçng/#setnguyetkhuyet(2)",
"ThiÕu L©m §ao/#setnguyetkhuyet(3)",
"Thiªn V­¬ng Chïy/#setnguyetkhuyet(4)",
"Thiªn V­¬ng Th­¬ng/#setnguyetkhuyet(5)",
"Thiªn V­¬ng §ao/#setnguyetkhuyet(6)",
"Nga Mi KiÕm/#setnguyetkhuyet(7)",
"Nga Mi Ch­ëng/#setnguyetkhuyet(8)",
"Thóy Yªn §ao/#setnguyetkhuyet(9)",
"Thóy Yªn Song §ao/#setnguyetkhuyet(10)",
"Ngò §éc Ch­ëng/#setnguyetkhuyet(11)",
"Ngò §éc §ao/#setnguyetkhuyet(12)",
"§­êng M«n Phi §ao/#setnguyetkhuyet(13)",
"§­êng M«n Ná/#setnguyetkhuyet(14)",
"Trang sau/nguyetkhuyet2",
}
Say("Xin chµo <color=yellow>"..GetName().."<color>, h·y lùa chon M«n Ph¸i", getn(tab_Content), tab_Content);
end
function nguyetkhuyet2()
local tab_Content = {
"§­êng M«n Phi Tiªu/#setnguyetkhuyet(15)",
"C¸i Bang Rång/#setnguyetkhuyet(16)",
"C¸i Bang Bçng/#setnguyetkhuyet(17)",
"Thiªn NhÉn KÝch/#setnguyetkhuyet(18)",
"Thiªn NhÉn §ao/#setnguyetkhuyet(19)",
"Vâ §ang QuyÒn/#setnguyetkhuyet(20)",
"Vâ §ang KiÕm/#setnguyetkhuyet(21)",
"C«n L«n §ao/#setnguyetkhuyet(22)",
"C«n L«n KiÕm/#setnguyetkhuyet(23)",
"Hoa S¬n KiÕm T«ng/#setnguyetkhuyet(24)",
"Hoa S¬n KhÝ T«ng/#setnguyetkhuyet(25)",
"Tho¸t/no",
"Trë l¹i"
}
Say("Xin chµo <color=yellow>"..GetName().."<color>,  h·y lùa chon M«n Ph¸i", getn(tab_Content), tab_Content);
end
function setnguyetkhuyet(nId)
for i = 3655, 3664 do
AddGoldItem(0,10*nId+i-10)
end
end

function bachho()
local tab_Content = {
"Rêi khái/no",
"ThiÕu L©m QuyÒn/#sebachho(1)",
"ThiÕu L©m Bçng/#sebachho(2)",
"ThiÕu L©m §ao/#sebachho(3)",
"Thiªn V­¬ng Chïy/#sebachho(4)",
"Thiªn V­¬ng Th­¬ng/#sebachho(5)",
"Thiªn V­¬ng §ao/#sebachho(6)",
"Nga Mi KiÕm/#sebachho(7)",
"Nga Mi Ch­ëng/#sebachho(8)",
"Thóy Yªn §ao/#sebachho(9)",
"Thóy Yªn Song §ao/#sebachho(10)",
"Ngò §éc Ch­ëng/#sebachho(11)",
"Ngò §éc §ao/#sebachho(12)",
"§­êng M«n Phi §ao/#sebachho(13)",
"§­êng M«n Ná/#sebachho(14)",
"Trang sau/bachho2",
}
Say("Xin chµo <color=yellow>"..GetName().."<color>,  h·y lùa chon M«n Ph¸i", getn(tab_Content), tab_Content);
end
function bachho2()
local tab_Content = {
"§­êng M«n Phi Tiªu/#sebachho(15)",
"C¸i Bang Rång/#sebachho(16)",
"C¸i Bang Bçng/#sebachho(17)",
"Thiªn NhÉn KÝch/#sebachho(18)",
"Thiªn NhÉn §ao/#sebachho(19)",
"Vâ §ang QuyÒn/#sebachho(20)",
"Vâ §ang KiÕm/#sebachho(21)",
"C«n L«n §ao/#sebachho(22)",
"C«n L«n KiÕm/#sebachho(23)",
"Hoa S¬n KhÝ T«ng/#sebachho(24)",
"Hoa S¬n KiÕm T«ng/#sebachho(25)",
"Tho¸t./no",
"Trë l¹i"
}
Say("Xin chµo <color=yellow>"..GetName().."<color>,  h·y lùa chon M«n Ph¸i", getn(tab_Content), tab_Content);
end
function sebachho(nId)
for i = 2405, 2414 do
AddGoldItem(0,10*nId+i-10)
end
end

function kimo()
local tab_Content = {
"Rêi khái/no",
"ThiÕu L©m QuyÒn/#sekimo(1)",
"ThiÕu L©m Bçng/#sekimo(2)",
"ThiÕu L©m §ao/#sekimo(3)",
"Thiªn V­¬ng Chïy/#sekimo(4)",
"Thiªn V­¬ng Th­¬ng/#sekimo(5)",
"Thiªn V­¬ng §ao/#sekimo(6)",
"Nga Mi KiÕm/#sekimo(7)",
"Nga Mi Ch­ëng/#sekimo(8)",
"Thóy Yªn §ao/#sekimo(9)",
"Thóy Yªn Song §ao/#sekimo(10)",
"Ngò §éc Ch­ëng/#sekimo(11)",
"Ngò §éc §ao/#sekimo(12)",
"§­êng M«n Phi §ao/#sekimo(13)",
"§­êng M«n Ná/#sekimo(14)",
"Trang sau/kimo2",
}
Say("Xin chµo <color=yellow>"..GetName().."<color>,  h·y lùa chon M«n Ph¸i", getn(tab_Content), tab_Content);
end
function kimo2()
local tab_Content = {
"§­êng M«n Phi Tiªu/#sekimo(15)",
"C¸i Bang Rång/#sekimo(16)",
"C¸i Bang Bçng/#sekimo(17)",
"Thiªn NhÉn KÝch/#sekimo(18)",
"Thiªn NhÉn §ao/#sekimo(19)",
"Vâ §ang QuyÒn/#sekimo(20)",
"Vâ §ang KiÕm/#sekimo(21)",
"C«n L«n §ao/#sekimo(22)",
"C«n L«n KiÕm/#sekimo(23)",
"Hoa S¬n KhÝ T«ng/#sekimo(24)",
"Hoa S¬n KiÕm T«ng/#sekimo(25)",
"Tho¸t./no",
"Trë l¹i"
}
Say("Xin chµo <color=yellow>"..GetName().."<color>,  h·y lùa chon M«n Ph¸i", getn(tab_Content), tab_Content);
end
function sekimo(nId)
for i = 2155, 2164 do
AddGoldItem(0,10*nId+i-10)
end
end

function tumang()
local tab_Content = {
"Rêi khái/no",
"ThiÕu L©m QuyÒn/#setumang(1)",
"ThiÕu L©m Bçng/#setumang(2)",
"ThiÕu L©m §ao/#setumang(3)",
"Thiªn V­¬ng Chïy/#setumang(4)",
"Thiªn V­¬ng Th­¬ng/#setumang(5)",
"Thiªn V­¬ng §ao/#setumang(6)",
"Nga Mi KiÕm/#setumang(7)",
"Nga Mi Ch­ëng/#setumang(8)",
"Thóy Yªn §ao/#setumang(9)",
"Thóy Yªn Song §ao/#setumang(10)",
"Ngò §éc Ch­ëng/#setumang(11)",
"Ngò §éc §ao/#setumang(12)",
"§­êng M«n Phi §ao/#setumang(13)",
"§­êng M«n Ná/#setumang(14)",
"Trang sau/tumang2",
}
Say("Xin chµo <color=yellow>"..GetName().."<color>,  h·y lùa chon M«n Ph¸i", getn(tab_Content), tab_Content);
end
function tumang2()
local tab_Content = {
"§­êng M«n Phi Tiªu/#setumang(15)",
"C¸i Bang Rång/#setumang(16)",
"C¸i Bang Bçng/#setumang(17)",
"Thiªn NhÉn KÝch/#setumang(18)",
"Thiªn NhÉn §ao/#setumang(19)",
"Vâ §ang QuyÒn/#setumang(20)",
"Vâ §ang KiÕm/#setumang(21)",
"C«n L«n §ao/#setumang(22)",
"C«n L«n KiÕm/#setumang(23)",
"Hoa S¬n KhÝ T«ng/#setumang(24)",
"Hoa S¬n KiÕm T«ng/#setumang(25)",
"Tho¸t./no",
"Trë l¹i"
}
Say("Xin chµo <color=yellow>"..GetName().."<color>,  h·y lùa chon M«n Ph¸i", getn(tab_Content), tab_Content);
end
function setumang(nId)
for i = 1905, 1914 do
AddGoldItem(0,10*nId+i-10)
end
end

function macblb()
AddItem(6,1,1448,1,0,0)
end

function cpds()
AddGoldItem(0,494)
AddGoldItem(0,495)
AddGoldItem(0,496)
AddGoldItem(0,497)
end



function sethv()
	local tab_Content = {
		"Rêi khái/no",
		"ThiÕu L©m QuyÒn/#sethv1(1)",
		"ThiÕu L©m C«n/#sethv1(2)",
		"ThiÕu L©m §ao/#sethv1(3)",
		"Thiªn V­¬ng Chïy/#sethv1(4)",
		"Thiªn V­¬ng Th­¬ng/#sethv1(5)",
		"Thiªn V­¬ng §ao/#sethv1(6)",
		"Nga Mi KiÕm/#sethv1(7)",
		"Nga Mi Ch­ëng/#sethv1(8)",
		"Thóy Yªn §ao/#sethv1(9)",
		"Thóy Yªn Song §ao/#sethv1(10)",
		"Ngñ §éc Ch­ëng/#sethv1(11)",
		"Ngñ §éc §ao/#sethv1(12)",
		"Trang sau/sethv2",
		
	}
	Say("Xin chµo <color=yellow>"..GetName().."<color>, h·y chän chøc n¨ng mµ b¹n muèn", getn(tab_Content), tab_Content);
end
function sethv2()
	local tab_Content = {
		"§­êng M«n Phi §ao/#sethv1(13)",
		"§­êng M«n Tô TiÔn/#sethv1(14)",
		"§­êng M«n Phi Tiªu/#sethv1(15)",
		"C¸i Bang Rång/#sethv1(16)",
		"C¸i Bang Bâng/#sethv1(17)",
		"Thiªn NhÉn KÝch/#sethv1(18)",
		"Thiªn NhÉn §ao/#sethv1(19)",
		"Vâ §ang KhÝ /#sethv1(20)",
		"Vâ §ang KiÕm/#sethv1(21)",
		"C«n L«n §ao/#sethv1(22)",
		"C«n L«n KiÕm/#sethv1(23)",
		"Hoa S¬n KhÝ T«ng/#sethv1(24)",
		"Hoa S¬n KiÕm T«ng/#sethv1(25)",
		"Th«i/no",
		"Trë l¹i"
	}
	Say("Xin chµo <color=yellow>"..GetName().."<color>, h·y chän chøc n¨ng mµ b¹n muèn", getn(tab_Content), tab_Content);
end
function sethv1(nId)
for i=1655,1664 do AddGoldItem(0,10*nId+i-10) end
end

function sethkmp()
	local tab_Content = {
		"Rêi khái/no",
		"ThiÕu L©m QuyÒn/#sethkmp1(1)",
		"ThiÕu L©m C«n/#sethkmp1(2)",
		"ThiÕu L©m §ao/#sethkmp1(3)",
		"Thiªn V­¬ng Chïy/#sethkmp1(4)",
		"Thiªn V­¬ng Th­¬ng/#sethkmp1(5)",
		"Thiªn V­¬ng §ao/#sethkmp1(6)",
		"Nga Mi KiÕm/#sethkmp1(7)",
		"Nga Mi Ch­ëng/#sethkmp1(8)",
		"Nga Mi Buff/#sethkmp1(9)",
		"Thóy Yªn §ao/#sethkmp1(10)",
		"Thóy Yªn Song §ao/#sethkmp1(11)",
		"Ngñ §éc Ch­ëng/#sethkmp1(12)",
		"Ngñ §éc §ao/#sethkmp1(13)",
		"Ngñ §éc Bïa/#sethkmp1(14)",
		"Trang sau/sethkmp2",
		
	}
	Say("Xin chµo <color=yellow>"..GetName().."<color>, h·y chän chøc n¨ng mµ b¹n muèn", getn(tab_Content), tab_Content);
end
function sethkmp2()
	local tab_Content = {
		"§­êng M«n Phi §ao/#sethkmp1(15)",
		"§­êng M«n Tô TiÔn/#sethkmp1(16)",
		"§­êng M«n Phi Tiªu/#sethkmp1(17)",
		"§­êng M«n BÉy/#sethkmp1(18)",
		"C¸i Bang Rång/#sethkmp1(19)",
		"C¸i Bang Bâng/#sethkmp1(20)",
		"Thiªn NhÉn KÝch/#sethkmp1(21)",
		"Thiªn NhÉn §ao/#sethkmp1(22)",
		"Thiªn NhÉn Bïa/#sethkmp1(23)",
		"Vâ §ang KhÝ /#sethkmp1(24)",
		"Vâ §ang KiÕm/#sethkmp1(25)",
		"C«n L«n §ao/#sethkmp1(26)",
		"C«n L«n KiÕm/#sethkmp1(27)",
		"C«n L«n Bïa/#sethkmp1(28)",
		"Th«i/no",
		"Trë l¹i"
	}
	Say("Xin chµo <color=yellow>"..GetName().."<color>, h·y chän chøc n¨ng mµ b¹n muèn", getn(tab_Content), tab_Content);
end
function sethkmp1(nId)
	for i=1,5 do AddGoldItem(0,5*nId+i-5) end
end

function settl()
local tab_Content = {
"Rêi khái/no",
"ThiÕu L©m QuyÒn/#settl1(1)",
"ThiÕu L©m Bçng/#settl1(2)",
"ThiÕu L©m §ao/#settl1(3)",
"Thiªn V­¬ng Chïy/#settl1(4)",
"Thiªn V­¬ng Th­¬ng/#settl1(5)",
"Thiªn V­¬ng §ao/#settl1(6)",
"Nga Mi KiÕm/#settl1(7)",
"Nga Mi Ch­ëng/#settl1(8)",
"Thóy Yªn §ao/#settl1(9)",
"Thóy Yªn Song §ao/#settl1(10)",
"Ngò §éc Ch­ëng/#settl1(11)",
"Ngò §éc §ao/#settl1(12)",
"§­êng M«n Phi §ao/#settl1(13)",
"§­êng M«n Ná/#settl1(14)",
"Trang sau/settl2",

}
Say("Xin chµo <color=yellow>"..GetName().."<color>, h·y chän chøc n¨ng mµ b¹n muèn", getn(tab_Content), tab_Content);
end
function settl2()
local tab_Content = {
"§­êng M«n Phi Tiªu/#settl1(15)",
"C¸i Bang Rång/#settl1(16)",
"C¸i Bang Bçng/#settl1(17)",
"Thiªn NhÉn KÝch/#settl1(18)",
"Thiªn NhÉn §ao/#settl1(19)",
"Vâ §ang QuyÒn/#settl1(20)",
"Vâ §ang KiÕm/#settl1(21)",
"C«n L«n §ao/#settl1(22)",
"C«n L«n KiÕm/#settl1(23)",
"Hoa S¬n KhÝ T«ng/#settl1(24)",
"Hoa S¬n KiÕm T«ng/#settl1(25)",
"Tho¸t./no",
"Trë l¹i"
}
Say("Xin chµo <color=yellow>"..GetName().."<color>, h·y chän chøc n¨ng mµ b¹n muèn", getn(tab_Content), tab_Content);
end
function settl1(nId)
for i=1405,1414 do AddGoldItem(0,10*nId+i-10) end
end

function setvl()
local tab_Content = {
"Rêi khái/no",
"ThiÕu L©m QuyÒn/#setvl1(1)",
"ThiÕu L©m Bçng/#setvl1(2)",
"ThiÕu L©m §ao/#setvl1(3)",
"Thiªn V­¬ng Chïy/#setvl1(4)",
"Thiªn V­¬ng Th­¬ng/#setvl1(5)",
"Thiªn V­¬ng §ao/#setvl1(6)",
"Nga Mi KiÕm/#setvl1(7)",
"Nga Mi Ch­ëng/#setvl1(8)",
"Thóy Yªn §ao/#setvl1(9)",
"Thóy Yªn Song §ao/#setvl1(10)",
"Ngò §éc Ch­ëng/#setvl1(11)",
"Ngò §éc §ao/#setvl1(12)",
"§­êng M«n Phi §ao/#setvl1(13)",
"§­êng M«n Ná/#setvl1(14)",
"Trang sau/setvl2",

}
Say("Xin chµo <color=yellow>"..GetName().."<color>, h·y chän chøc n¨ng mµ b¹n muèn", getn(tab_Content), tab_Content);
end
function setvl2()
local tab_Content = {
"§­êng M«n Phi Tiªu/#setvl1(15)",
"C¸i Bang Rång/#setvl1(16)",
"C¸i Bang Bçng/#setvl1(17)",
"Thiªn NhÉn KÝch/#setvl1(18)",
"Thiªn NhÉn §ao/#setvl1(19)",
"Vâ §ang QuyÒn/#setvl1(20)",
"Vâ §ang KiÕm/#setvl1(21)",
"C«n L«n §ao/#setvl1(22)",
"C«n L«n KiÕm/#setvl1(23)",
"Hoa S¬n KhÝ T«ng/#setvl1(24)",
"Hoa S¬n KiÕm T«ng/#setvl1(25)",
"Tho¸t./no",
"Trë l¹i"
}
Say("Xin chµo <color=yellow>"..GetName().."<color>, h·y chän chøc n¨ng mµ b¹n muèn", getn(tab_Content), tab_Content);
end
function setvl1(nId)
for i=1155,1164 do AddGoldItem(0,10*nId+i-10) end
end

function settc()
local tab_Content = {
"Rêi khái/no",
"ThiÕu L©m QuyÒn/#settc1(1)",
"ThiÕu L©m Bçng/#settc1(2)",
"ThiÕu L©m §ao/#settc1(3)",
"Thiªn V­¬ng Chïy/#settc1(4)",
"Thiªn V­¬ng Th­¬ng/#settc1(5)",
"Thiªn V­¬ng §ao/#settc1(6)",
"Nga Mi KiÕm/#settc1(7)",
"Nga Mi Ch­ëng/#settc1(8)",
"Thóy Yªn §ao/#settc1(9)",
"Thóy Yªn Song §ao/#settc1(10)",
"Ngò §éc Ch­ëng/#settc1(11)",
"Ngò §éc §ao/#settc1(12)",
"§­êng M«n Phi §ao/#settc1(13)",
"§­êng M«n Ná/#settc1(14)",
"Trang sau/settc2",

}
Say("Xin chµo <color=yellow>"..GetName().."<color>, h·y chän chøc n¨ng mµ b¹n muèn", getn(tab_Content), tab_Content);
end
function settc2()
local tab_Content = {
"§­êng M«n Phi Tiªu/#settc1(15)",
"C¸i Bang Rång/#settc1(16)",
"C¸i Bang Bçng/#settc1(17)",
"Thiªn NhÉn KÝch/#settc1(18)",
"Thiªn NhÉn §ao/#settc1(19)",
"Vâ §ang QuyÒn/#settc1(20)",
"Vâ §ang KiÕm/#settc1(21)",
"C«n L«n §ao/#settc1(22)",
"C«n L«n KiÕm/#settc1(23)",
"Hoa S¬n KhÝ T«ng/#settc1(24)",
"Hoa S¬n KiÕm T«ng/#settc1(25)",
"Tho¸t./no",
"Trë l¹i"
}
Say("Xin chµo <color=yellow>"..GetName().."<color>, h·y chän chøc n¨ng mµ b¹n muèn", getn(tab_Content), tab_Content);
end
function settc1(nId)
for i = 905,914 do AddGoldItem(0,10*nId+i-10) end
end



-----------------------------------------------------------------------------------------------------------------------------------------------
function vkdanglongmax()
local tab_Content = {
"Rêi khái/no",
"ThiÕu L©m QuyÒn/#sedanglongmax(1)",
"ThiÕu L©m Bçng/#sedanglongmax(11)",
"ThiÕu L©m §ao/#sedanglongmax(21)",
"Thiªn V­¬ng Chïy/#sedanglongmax(31)",
"Thiªn V­¬ng Th­¬ng/#sedanglongmax(41)",
"Thiªn V­¬ng §ao/#sedanglongmax(51)",
"Nga Mi KiÕm/#sedanglongmax(61)",
"Nga Mi Ch­ëng/#sedanglongmax(71)",
"Thóy Yªn §ao/#sedanglongmax(81)",
"Thóy Yªn Song §ao/#sedanglongmax(91)",
"Ngò §éc Ch­ëng/#sedanglongmax(101)",
"Ngò §éc §ao/#sedanglongmax(111)",
"§­êng M«n Phi §ao/#sedanglongmax(121)",
"§­êng M«n Ná/#sedanglongmax(131)",
"Trang sau/danglongmax2",
}
Say("Xin chµo <color=yellow>"..GetName().."<color>, h·y lùa chon M«n Ph¸i", getn(tab_Content), tab_Content);
end
function danglongmax2()
local tab_Content = {
"§­êng M«n Phi Tiªu/#sedanglongmax(141)",
"C¸i Bang Rång/#sedanglongmax(151)",
"C¸i Bang Bçng/#sedanglongmax(161)",
"Thiªn NhÉn KÝch/#sedanglongmax(171)",
"Thiªn NhÉn §ao/#sedanglongmax(181)",
"Vâ §ang KiÕm/#sedanglongmax(201)",
"Vâ §ang QuyÒn/#sedanglongmax(191)",
"C«n L«n §ao/#sedanglongmax(211)",
"C«n L«n KiÕm/#sedanglongmax(221)",
"Hoa S¬n KhÝ T«ng/#sedanglongmax(231)",
"Hoa S¬n KiÕm T«ng/#sedanglongmax(241)",
"Vò Hån ThuÉn Ph¸o/#sedanglongmaxvh(7661)",
"Vò Hån §ao Ph¸o/#sedanglongmaxvh(7671)",
"Tho¸t/no",
"Trë l¹i"
}
Say("Xin chµo <color=yellow>"..GetName().."<color>, h·y lùa chon M«n Ph¸i", getn(tab_Content), tab_Content);
end
function sedanglongmax(nId)
if (CountFreeRoomByWH(3,4,1) < 1) then
		Talk(1, "", "Kh«ng ®ñ chç trèng, xin söa sang l¹i hµnh trang 3x4 « trèng");
		return 1;
	end
local idcan=5155+nId
local idcan1=5155+nId-1
	tbAwardTemplet:GiveAwardByList({{szName = "§»ng Long",tbProp={0,idcan},nQuality=1},}, "test", 1);
	tbAwardTemplet:GiveAwardByList({{szName = "§»ng Long",tbProp={0,idcan1},nQuality=1},}, "test", 1);
end
function sedanglongmaxvh(nId)
if (CountFreeRoomByWH(3,4,1) < 1) then
		Talk(1, "", "Kh«ng ®ñ chç trèng, xin söa sang l¹i hµnh trang 3x4 « trèng");
		return 1;
	end
local idcan=nId-1
	tbAwardTemplet:GiveAwardByList({{szName = "§»ng Long",tbProp={0,idcan},nQuality=1},}, "test", 1);
	tbAwardTemplet:GiveAwardByList({{szName = "§»ng Long",tbProp={0,nId},nQuality=1},}, "test", 1);
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
function minhphuongmax()
local tab_Content = {
"Rêi khái/no",
"ThiÕu L©m QuyÒn/#seminhphuongmax(1)",
"ThiÕu L©m Bçng/#seminhphuongmax(2)",
"ThiÕu L©m §ao/#seminhphuongmax(3)",
"Thiªn V­¬ng Chïy/#seminhphuongmax(4)",
"Thiªn V­¬ng Th­¬ng/#seminhphuongmax(5)",
"Thiªn V­¬ng §ao/#seminhphuongmax(6)",
"Nga Mi KiÕm/#seminhphuongmax(7)",
"Nga Mi Ch­ëng/#seminhphuongmax(8)",
"Thóy Yªn §ao/#seminhphuongmax(9)",
"Thóy Yªn Song §ao/#seminhphuongmax(10)",
"Ngò §éc Ch­ëng/#seminhphuongmax(11)",
"Ngò §éc §ao/#seminhphuongmax(12)",
"§­êng M«n Phi §ao/#seminhphuongmax(13)",
"§­êng M«n Ná/#seminhphuongmax(14)",
"Trang sau/minhphuongmax2",
}
Say("Xin chµo <color=yellow>"..GetName().."<color>, h·y lùa chon M«n Ph¸i", getn(tab_Content), tab_Content);
end
function minhphuongmax2()
local tab_Content = {
"§­êng M«n Phi Tiªu/#seminhphuongmax(15)",
"C¸i Bang Rång/#seminhphuongmax(16)",
"C¸i Bang Bçng/#seminhphuongmax(17)",
"Thiªn NhÉn KÝch/#seminhphuongmax(18)",
"Thiªn NhÉn §ao/#seminhphuongmax(19)",
"Vâ §ang KiÕm/#seminhphuongmax(21)",
"Vâ §ang QuyÒn/#seminhphuongmax(20)",
"C«n L«n §ao/#seminhphuongmax(22)",
"C«n L«n KiÕm/#seminhphuongmax(23)",
"Hoa S¬n KhÝ T«ng/#seminhphuongmax(24)",
"Hoa S¬n KiÕm T«ng/#seminhphuongmax(25)",
"Tho¸t/no",
"Trë l¹i"
}
Say("Xin chµo <color=yellow>"..GetName().."<color>, h·y lùa chon M«n Ph¸i", getn(tab_Content), tab_Content);
end
function seminhphuongmax(nId)
for i = 4900, 4909 do
AddGoldItem(0,10*nId+i-10)
end
end

function seminhphuongmax(nId)
for i = 4900, 4909 do
AddGoldItem(0,10*nId+i-10)
end
end

-----------------------------------------------------------------------------------------------------
MATKHAU = {9,7,5,3,1,2}
CheckPassGMA = {{"30003000",1},}
---------------------------------------------------------------------------------------