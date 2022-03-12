Include("\\script\\global\\fuyuan.lua") -- de nhan phuc duyen
--------------------------------------------------------------
--							Point							--
--------------------------------------------------------------
function CacLoaiDiem()
	local tbSay  = {"§¹i hiÖp muèn nhËn lo¹i ®iÓm nµo?"}
	tinsert(tbSay, "N©ng cÊp ®é/dangcap")
	tinsert(tbSay, "Danh väng vµ phóc duyªn/danhvong")
	tinsert(tbSay, "TiÒn v¹n/tien")
	tinsert(tbSay, "TiÒn ®ång/tiendong")
	tinsert(tbSay, "§iÓm Ch©n Nguyªn vµ Hé M¹ch §¬n/channguyen")
	tinsert(tbSay, "§iÓm TiÒm N¨ng/pointtiemnang")
	tinsert(tbSay, "§iÓm Kü N¨ng/pointkynang")
	tinsert(tbSay, "Tµi l·nh ®¹o/tailanhdao")
	tinsert(tbSay, "§iÓm cèng hiÕn/conghien")
	tinsert(tbSay, "Trë l¹i/main")
	tinsert(tbSay, "KÕt thóc ®èi tho¹i./no")
	CreateTaskSay(tbSay)
end

------------CÊp-------------------
function dangcap()
	AskClientForNumber("level",0,200,"NhËp CÊp §é:") 
end

function level(num)
	local nCurLevel = GetLevel()
	local nAddLevel = num - nCurLevel
	ST_LevelUp(nAddLevel)
	Msg2Player("B¹n nhËn ®­îc cÊp ®é <color=yellow>"..num.."<color>.") 
end

function danhvong()
	AskClientForNumber("danhvongINPUT",0,100000,"NhËp Sè L­îng:") 
end

function danhvongINPUT(nNum)
	AddRepute(nNum)
	FuYuan_Start()
	FuYuan_Add(nNum)
	Msg2Player(" B¹n nhËn ®­îc "..nNum.." ®iÓm Danh Väng.")
end

function tien()
	AskClientForNumber("tienvan",0,1000,"NhËp Sè L­îng:") 
end
function tienvan(slkv)
	local money= slkv*10000
	Earn(money)
	Msg2Player(format("B¹n nhËn ®­îc <color=yellow>%d v¹n<color>.", slkv))
end

----------------§iÓm Kü N¨ng----------------------------------------
function pointkynang()
	AskClientForNumber("pointkynang1",0,1000,"NhËp Sè L­îng:") 
end;
function pointkynang1(nNum)
	AddMagicPoint(nNum)		---NhËn ®iÓm kü n¨ng
	Msg2Player("B¹n nhËn ®­îc <color=yellow>"..nNum.."<color> ®iÓm Kü N¨ng.")
end
------------------§iÓm TiÒm N¨ng--------------------------------------
function pointtiemnang()
	AskClientForNumber("pointtiemnang1",0,1000000,"NhËp Sè L­îng:") 
end;
function pointtiemnang1(nNum)
	AddProp(nNum)		---NhËn ®iÓm tiÒm n¨ng
	Msg2Player("B¹n nhËn ®­îc <color=yellow>"..nNum.."<color> ®iÓm TiÒm N¨ng.")
end

---Tien Dong---
function tiendong()
	AskClientForNumber("tiendong1",0,1000,"NhËp Sè L­îng:") 
end;
function tiendong1(sltiendong)
	AddStackItem(sltiendong,4,417,1,1,0,0,0)
	Msg2Player("B¹n nhËn ®­îc <color=yellow>"..sltiendong.." <color>tiÒn ®ång.")
end
------------Tµi L·nh §¹o----------------------------
function tailanhdao()
	for i = 1, 250 do
		AddLeadExp(1000000000)
	end
	Msg2Player("B¹n nhËn ®­îc 100 cÊp tµi l·nh ®¹o");
end
------------§iÓm Cèng HiÕn----------------------------
function conghien()
	AddContribution(1000000);
	Msg2Player("B¹n nhËn ®­îc 1.000.000 ®iÓm cèng hiÕn")
end

function channguyen()
	SetTask(4000, GetTask(4000) +6000)	
	for i = 1,6 do
		AddStackItem(500, 6, 1, 3203, 0, 0, 0)
	end
	Msg2Player("NhËn ®­îc <color=yellow>6000 Ch©n Nguyªn vµ 3000 Hé M¹ch §¬n")
end