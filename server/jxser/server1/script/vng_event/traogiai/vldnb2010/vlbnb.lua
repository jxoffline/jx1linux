Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\vng_lib\\extpoint_lib.lua");
Include("\\script\\vng_lib\\vngAPI.lua");


VLDNB_EXTPOINT = 3
nBit_GetCLBHB = 1
nBit_GetTinhLuc = 2
nBit_GetHuyenVien = 3
nBit_GetPhienVu = 4
nBit_GetHoangChanDan = 5

VLDNB2010 =
{
	{szAccount="minhtuankg2001", nCLBHB=6, nTinhLuc=46000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="tuanminh200681", nCLBHB=6, nTinhLuc=46000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="minhphu2010kg", nCLBHB=6, nTinhLuc=46000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="tantaylang1981", nCLBHB=6, nTinhLuc=46000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="hangiatran", nCLBHB=6, nTinhLuc=46000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="nhatlongdaihiep303", nCLBHB=6, nTinhLuc=46000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="dolanguyenhoathan", nCLBHB=14, nTinhLuc=23000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="anhkiet11a13", nCLBHB=9, nTinhLuc=23000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="hoangthuankg1981", nCLBHB=4, nTinhLuc=23000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="volam24042004", nCLBHB=4, nTinhLuc=23000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="caoquochien23031989", nCLBHB=4, nTinhLuc=23000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="dolanguyenkhang", nCLBHB=4, nTinhLuc=23000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="iloveyoyo", nCLBHB=3, nTinhLuc=16000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="ngothethai", nCLBHB=3, nTinhLuc=16000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="banhmith", nCLBHB=3, nTinhLuc=16000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="tranhoangha1000002", nCLBHB=3, nTinhLuc=16000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="hihahiho", nCLBHB=3, nTinhLuc=16000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="quangquocablb", nCLBHB=2, nTinhLuc=8000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="taikhoantaone123456", nCLBHB=2, nTinhLuc=8000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="coolboykg", nCLBHB=2, nTinhLuc=8000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="dolanguyen0000", nCLBHB=2, nTinhLuc=8000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="mysa2011", nCLBHB=6, nTinhLuc=46000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="000ngoc000", nCLBHB=6, nTinhLuc=46000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="doilakho001", nCLBHB=6, nTinhLuc=46000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="trongnghiavolam", nCLBHB=6, nTinhLuc=46000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="daikalalinh", nCLBHB=6, nTinhLuc=46000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="phongvandaihiepbmt", nCLBHB=4, nTinhLuc=23000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="romhtt", nCLBHB=4, nTinhLuc=23000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="lechitrung06", nCLBHB=4, nTinhLuc=23000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="tranngoctu800", nCLBHB=4, nTinhLuc=23000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="lelylan", nCLBHB=4, nTinhLuc=23000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="nhiepphoong", nCLBHB=3, nTinhLuc=16000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="phuongtu66666", nCLBHB=3, nTinhLuc=16000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="chaubath0ng", nCLBHB=3, nTinhLuc=16000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="niemvui206", nCLBHB=3, nTinhLuc=16000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="huyenlove7777", nCLBHB=3, nTinhLuc=16000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="zinlatao12", nCLBHB=2, nTinhLuc=8000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="giacmobuontk", nCLBHB=2, nTinhLuc=8000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="beloan123", nCLBHB=2, nTinhLuc=8000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="ngocha012", nCLBHB=2, nTinhLuc=8000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="thuonghoai85", nCLBHB=12, nTinhLuc=8000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="hello36", nCLBHB=11, nTinhLuc=46000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="xalo14", nCLBHB=6, nTinhLuc=46000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="thanhvi50", nCLBHB=6, nTinhLuc=46000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="thao200369", nCLBHB=6, nTinhLuc=46000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="ngamyvodoixungba", nCLBHB=6, nTinhLuc=46000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="kuroro1269", nCLBHB=4, nTinhLuc=23000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="foreverneedyou", nCLBHB=4, nTinhLuc=23000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="nguyenthanhliem040990", nCLBHB=4, nTinhLuc=23000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="zluchuongxuyenz", nCLBHB=4, nTinhLuc=23000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="caohuyetap", nCLBHB=4, nTinhLuc=23000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="yeudonfuongct", nCLBHB=3, nTinhLuc=16000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="banghuy1116", nCLBHB=3, nTinhLuc=16000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="banghuy1113", nCLBHB=3, nTinhLuc=16000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="thanhsam19911", nCLBHB=3, nTinhLuc=16000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="accdmvip1990", nCLBHB=3, nTinhLuc=16000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="ditimbaovat", nCLBHB=3, nTinhLuc=16000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="tommythoai", nCLBHB=2, nTinhLuc=8000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="dinhthekien1", nCLBHB=2, nTinhLuc=8000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="tonyhardly", nCLBHB=2, nTinhLuc=8000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="luxury1", nCLBHB=2, nTinhLuc=8000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="cafevip2", nCLBHB=2, nTinhLuc=8000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="crazyhorse0404", nCLBHB=6, nTinhLuc=46000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="giudodatau10", nCLBHB=6, nTinhLuc=46000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="a0313174", nCLBHB=6, nTinhLuc=46000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="cumeovt", nCLBHB=6, nTinhLuc=46000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="vuchanh1904", nCLBHB=6, nTinhLuc=46000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="thinhnhu50", nCLBHB=6, nTinhLuc=46000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="maihue0301", nCLBHB=4, nTinhLuc=23000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="langban", nCLBHB=4, nTinhLuc=23000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="laotia", nCLBHB=4, nTinhLuc=23000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="kephahoai12", nCLBHB=4, nTinhLuc=23000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="tungtc84", nCLBHB=4, nTinhLuc=23000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="thanhnudatinh1987", nCLBHB=4, nTinhLuc=23000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="haccongtu0905", nCLBHB=13, nTinhLuc=16000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="glad6990", nCLBHB=8, nTinhLuc=16000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="cuongli7007", nCLBHB=3, nTinhLuc=16000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="boysoctrang5", nCLBHB=3, nTinhLuc=16000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="chikilled2", nCLBHB=3, nTinhLuc=16000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="nanaphan", nCLBHB=3, nTinhLuc=16000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="long5739vt", nCLBHB=2, nTinhLuc=8000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="ndt12111979", nCLBHB=2, nTinhLuc=8000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="phamthaivt", nCLBHB=2, nTinhLuc=8000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="thieugiahn1986", nCLBHB=2, nTinhLuc=8000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="vungtaucodon82", nCLBHB=2, nTinhLuc=8000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="tengicungduoc4000", nCLBHB=2, nTinhLuc=8000, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="batigolvnam010", nCLBHB=10, nTinhLuc=0, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="hoangkhanh", nCLBHB=5, nTinhLuc=0, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="whatislove", nCLBHB=5, nTinhLuc=0, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="hoahongxula1983", nCLBHB=5, nTinhLuc=0, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="whatislovebm", nCLBHB=5, nTinhLuc=0, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="phucgiaan", nCLBHB=5, nTinhLuc=0, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="daogiathieucongtu101", nCLBHB=10, nTinhLuc=0, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="tuyettinhcongchua", nCLBHB=5, nTinhLuc=0, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="manhhapvd", nCLBHB=5, nTinhLuc=0, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="romeo8x", nCLBHB=10, nTinhLuc=0, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="vtthanoi2", nCLBHB=5, nTinhLuc=0, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="luctieuphung1612", nCLBHB=5, nTinhLuc=0, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="anhhoangcp", nCLBHB=10, nTinhLuc=0, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="nguyennhuquynh", nCLBHB=10, nTinhLuc=0, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="trinhvucuong", nCLBHB=5, nTinhLuc=0, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="hoangmu3", nCLBHB=5, nTinhLuc=0, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="binhblk5", nCLBHB=5, nTinhLuc=0, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="cumlanrung", nCLBHB=5, nTinhLuc=0, nHVL=0, nPhienVu=0, nHCD=0},
	{szAccount="hearthurt0", nCLBHB=0, nTinhLuc=0, nHVL=50, nPhienVu=5, nHCD=25},
	{szAccount="leminhhien789", nCLBHB=0, nTinhLuc=0, nHVL=25, nPhienVu=5, nHCD=20},
	{szAccount="duongmonmamtrang", nCLBHB=0, nTinhLuc=0, nHVL=25, nPhienVu=3, nHCD=15},
	{szAccount="gunspeed", nCLBHB=0, nTinhLuc=0, nHVL=25, nPhienVu=2, nHCD=15},
	{szAccount="vanphuchau", nCLBHB=0, nTinhLuc=0, nHVL=10, nPhienVu=0, nHCD=0},
	--{szAccount="tester017", nCLBHB=5, nTinhLuc=5, nHVL=25, nPhienVu=3, nHCD=15},
}



function GetBonusVLDNB2010_main()
	local ntrue, nIndex = VNG_CompareAccountID(VLDNB2010)
	if (ntrue < 1 and nIndex < 1 ) then
		Talk(1,"","§¹i hiÖp sö dông kh«ng ®óng tµi kho¶n, xin kiÓm tra l¹i !")
		return
	end
	------------------------------------------------------------------------------------------------------------------------------------------------
	local tbOpp = {}
	local str = "<#> §¹i hiÖp xin h·y chän phÇn th­ëng";
			local numCLBHB = VLDNB2010[nIndex].nCLBHB
			local numTinhLuc = VLDNB2010[nIndex].nTinhLuc
			local numHVL = VLDNB2010[nIndex].nHVL
			local numPhienVu = VLDNB2010[nIndex].nPhienVu
			local numHCD = VLDNB2010[nIndex].nHCD
			
			if (numCLBHB>0) then
				tinsert(tbOpp,"Ta muèn nhËn " .. numCLBHB .. " C©u L¹c Bé Hång Bao/#VLDNB_GetBonusCLBHB("..numCLBHB..")");
			end
			if (numTinhLuc>0) then
			tinsert(tbOpp,"Ta muèn nhËn " .. numTinhLuc .. " Tinh Lùc/#VLDNB_GetBonusTinhLuc("..numTinhLuc..")");
			end
			if (numHVL>0) then
			tinsert(tbOpp,"Ta muèn nhËn " .. numHVL .. " HuyÒn Viªn LÖnh/#VLDNB_GetBonusHuyenVienLenh("..numHVL..")");
			end
			if (numPhienVu>0) then
			tinsert(tbOpp,"Ta muèn nhËn " .. numPhienVu .. " Phiªn Vò/#VLDNB_GetBonusPhienVu("..numPhienVu..")");
			end
			if (numHCD>0) then
			tinsert(tbOpp,"Ta muèn nhËn " .. numHCD .. " Hoµng Ch©n §an/#VLDNB_GetBonusHoangChanDan("..numHCD..")");
			end
			tinsert(tbOpp, "<#>Tho¸t/OnCancel")
	if ( getn( tbOpp ) == 0 ) then
		Say(str, 0);
		return
	end;
	Say( str, getn( tbOpp ), tbOpp )
end

function VLDNB_GetBonusHoangChanDan(nCount)
	if (GetBitValue(VLDNB_EXTPOINT, nBit_GetHoangChanDan) ~= 0) then
		Talk(1, "", "§¹i hiÖp ®· nhËn phÇn th­ëng nµy råi !");
		return
	end
	if CalcFreeItemCellCount() < 60 then
		Talk(1, "", "Hµnh trang cña ®¹i hiÖp kh«ng ®ñ 60 « trèng.");
		return
	end
	SetBitValue(VLDNB_EXTPOINT, nBit_GetHoangChanDan, 1)
	for i=1, nCount do
		local nIndex = AddItem(6,1,2264,1,0,0)
		SetSpecItemParam(nIndex,1,2000000000)
		SyncItem(nIndex)
	end
	Msg2Player(format("§¹i hiÖp võa nhËn ®­îc %d Hoµng Ch©n §an", nCount))
	WriteLog(date("%Y%m%d %H%M%S").."\t".."Bonus VLDNB2010"..GetAccount().."\t"..GetName().."\t".."NhËn th­ëng Hoµng Ch©n §an sè l­îng "..nCount)
end

function VLDNB_GetBonusPhienVu(nCount)
	if (GetBitValue(VLDNB_EXTPOINT, nBit_GetPhienVu) ~= 0) then
		Talk(1, "", "§¹i hiÖp ®· nhËn phÇn th­ëng nµy råi !");
		return
	end
	if CalcFreeItemCellCount() < 60 then
		Talk(1, "", "Hµnh trang cña ®¹i hiÖp kh«ng ®ñ 60 « trèng.");
		return
	end
	SetBitValue(VLDNB_EXTPOINT, nBit_GetPhienVu, 1)
	for i=1, nCount do
		local nIndex = AddItem(0,10,7,1,5,0)
		--ITEM_SetExpiredTime(nIndex, 43200);
		SyncItem(nIndex)
	end
	Msg2Player(format("§¹i hiÖp võa nhËn ®­îc %d Phiªn Vò", nCount))
	WriteLog(date("%Y%m%d %H%M%S").."\t".."Bonus VLDNB2010"..GetAccount().."\t"..GetName().."\t".."NhËn th­ëng Phiªn Vò sè l­îng "..nCount)
end

function VLDNB_GetBonusHuyenVienLenh(nCount)
	if (GetBitValue(VLDNB_EXTPOINT, nBit_GetHuyenVien) ~= 0) then
		Talk(1, "", "§¹i hiÖp ®· nhËn phÇn th­ëng nµy råi !");
		return
	end
	if CalcFreeItemCellCount() < 60 then
		Talk(1, "", "Hµnh trang cña ®¹i hiÖp kh«ng ®ñ 60 « trèng.");
		return
	end
	SetBitValue(VLDNB_EXTPOINT, nBit_GetHuyenVien, 1)
	for i=1, nCount do
		local nIndex = AddItem(6,1,2351,1,0,0)
		--ITEM_SetExpiredTime(nIndex, 43200);
		SyncItem(nIndex)
	end
	Msg2Player(format("§¹i hiÖp võa nhËn ®­îc %d HuyÒn Viªn LÖnh", nCount))
	WriteLog(date("%Y%m%d %H%M%S").."\t".."Bonus VLDNB2010"..GetAccount().."\t"..GetName().."\t".."NhËn th­ëng HuyÒn Viªn LÖnh sè l­îng "..nCount)
end

function VLDNB_GetBonusCLBHB(nCount)
	if (GetBitValue(VLDNB_EXTPOINT, nBit_GetCLBHB) ~= 0) then
		Talk(1, "", "§¹i hiÖp ®· nhËn phÇn th­ëng nµy råi !");
		return
	end
	if CalcFreeItemCellCount() < 60 then
		Talk(1, "", "Hµnh trang cña ®¹i hiÖp kh«ng ®ñ 60 « trèng.");
		return
	end
	SetBitValue(VLDNB_EXTPOINT, nBit_GetCLBHB, 1)
	for i=1, nCount do
		local nIndex = AddItem(6,1,30032,1,0,0)
		ITEM_SetExpiredTime(nIndex, 43200);
		SyncItem(nIndex)
	end
	Msg2Player(format("§¹i hiÖp võa nhËn ®­îc %d C©u L¹c Bé Hång Bao", nCount))
	WriteLog(date("%Y%m%d %H%M%S").."\t".."Bonus VLDNB2010"..GetAccount().."\t"..GetName().."\t".."NhËn th­ëng C©u L¹c Bé Hång Bao sè l­îng "..nCount)
end


function VLDNB_GetBonusTinhLuc(nCount)
	if (GetBitValue(VLDNB_EXTPOINT, nBit_GetTinhLuc) ~= 0) then
		Talk(1, "", "§¹i hiÖp ®· nhËn phÇn th­ëng nµy råi !");
		return
	end
	SetBitValue(VLDNB_EXTPOINT, nBit_GetTinhLuc, 1)
	AddEnergy(nCount)
	Msg2Player(format("§¹i hiÖp võa nhËn ®­îc %d Tinh Lùc", nCount))
	WriteLog(date("%Y%m%d %H%M%S").."\t".."Bonus VLDNB2010"..GetAccount().."\t"..GetName().."\t".."NhËn th­ëng Tinh Lùc sè l­îng "..nCount)
end

function OnCancel()
end