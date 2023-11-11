Include("\\script\\lib\\awardtemplet.lua")
Include("\\vng_script\\features\\ruong_tinhnang\\exp_award.lua")
Include("\\vng_script\\vng_lib\\reset_daily_task.lua")

tbTKBox_Key_Require = {
	["chiakhoadong"] = {6, 1, 30548,1,0,0},
	["chiakhoabac"] = {6, 1, 30549,1,0,0},
}
tbTKBox = {szName = "B¶o R­¬ng Tèng Kim", tbProp = {6,1,30547,1,0,0}}
-- th­ëng sö dông B¶o R­¬ng Tèng Kim  -Modifiled by ThanhLD - 20160307	
tbTKBoxAward = 
{	
	["chiakhoadong"] = 
	{
		{szName="§iÓm kinh nghiÖm 1", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbVNG_GiveExpAward_Box:ExpAward(100000, "B¶o R­¬ng Tèng Kim")
					end,
					nRate = 45,
		},
		{szName="§iÓm kinh nghiÖm 2", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbVNG_GiveExpAward_Box:ExpAward(200000, "B¶o R­¬ng Tèng Kim")
					end,
					nRate = 35,
		},
		{szName="§iÓm kinh nghiÖm 3", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbVNG_GiveExpAward_Box:ExpAward(300000, "B¶o R­¬ng Tèng Kim")
					end,
					nRate = 12,
		},
		{szName="§iÓm kinh nghiÖm 4", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbVNG_GiveExpAward_Box:ExpAward(500000, "B¶o R­¬ng Tèng Kim")
					end,
					nRate = 8,
		},	
	},	

	["chiakhoabac"] = 
	{	
		{szName="Thiªn C¬ LÖnh",tbProp={6,1,4625,1,0,0},nCount=1,nRate=2,nExpiredTime=3*24*60},
		{szName="Dao Quang LÖnh",tbProp={6,1,4626,1,0,0},nCount=1,nRate=2,nExpiredTime=3*24*60},
		{szName="Tiªn Th¶o Lé ®Æc biÖt",tbProp={6,1,1181,1,0,0},nCount=1,nRate=2,nExpiredTime=3*24*60},
		{szName="Thiªn Niªn Linh D­îc",tbProp={6,1,4631,1,0,0},nCount=1,nRate=2,nExpiredTime=3*24*60},
		{szName="Cöu Thiªn Linh D­îc",tbProp={6,1,4632,1,0,0},nCount=1,nRate=2,nExpiredTime=3*24*60},		
		{szName="Thiªn V­¬ng Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)", tbProp={6,1,4547,1,0,0},nCount=1,nRate=0.1,},
		{szName="Ngò §éc Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)", tbProp={6,1,4548,1,0,0},nCount=1,nRate=0.1,},
		{szName="Thóy Yªn Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)", tbProp={6,1,4549,1,0,0},nCount=1,nRate=0.1,},
		{szName="C«n l«n Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)", tbProp={6,1,4550,1,0,0},nCount=1,nRate=0.1,},
		{szName="Thiªn nhÉn Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)", tbProp={6,1,4551,1,0,0},nCount=1,nRate=0.1,},
		{szName="ThiÕu l©m Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)", tbProp={6,1,4552,1,0,0},nCount=1,nRate=0.05,},
		{szName="§­êng m«n Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)", tbProp={6,1,4553,1,0,0},nCount=1,nRate=0.05,},
		{szName="Nga my Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)", tbProp={6,1,4554,1,0,0},nCount=1,nRate=0.05,},
		{szName="Vâ ®ang Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)", tbProp={6,1,4555,1,0,0},nCount=1,nRate=0.05,},
		{szName="C¸i bang Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)", tbProp={6,1,4556,1,0,0},nCount=1,nRate=0.05,},	
		{szName="§iÓm kinh nghiÖm 1", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbVNG_GiveExpAward_Box:ExpAward(350000,"B¶o R­¬ng Tèng Kim")
					end,
					nRate = 41,
		},
		{szName="§iÓm kinh nghiÖm 2", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbVNG_GiveExpAward_Box:ExpAward(500000,"B¶o R­¬ng Tèng Kim")
					end,
					nRate = 31,
		},
		{szName="§iÓm kinh nghiÖm 3", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbVNG_GiveExpAward_Box:ExpAward(1000000,"B¶o R­¬ng Tèng Kim")
					end,
					nRate = 10,
		},
		{szName="§iÓm kinh nghiÖm 4", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbVNG_GiveExpAward_Box:ExpAward(1500000,"B¶o R­¬ng Tèng Kim")
					end,
					nRate = 7.25,
		},					
	},	
}

nWidth = 3
nHeight = 3
nFreeItemCellLimit = 1

function main(nIndexItem)
	local tbKey1 = tbTKBox_Key_Require["chiakhoadong"]
	local tbKey2 = tbTKBox_Key_Require["chiakhoabac"]
	local nCount1 = CalcItemCount(3, tbKey1[1], tbKey1[2], tbKey1[3], -1) 
	local nCount2 = CalcItemCount(3, tbKey2[1], tbKey2[2], tbKey2[3], -1) 
	if nCount1 == 0 and nCount2 == 0 then
		Say("CÇn ph¶i cã Ch×a Khãa B¹c hoÆc Ch×a Khãa §ång míi cã thÓ më ®­îc B¶o R­¬ng Tèng Kim", 1, "§ãng/no")
		return 1
	end	

	local tbOpt = {}
	if nCount1 ~= 0 then
		tinsert(tbOpt,format("Sö dông Ch×a Khãa §ång/#GetAwardTKBox(%d, '%s')", nIndexItem, "chiakhoadong"))
	end
	if nCount2 ~= 0 then
		tinsert(tbOpt,format("Sö dông Ch×a Khãa B¹c/#GetAwardTKBox(%d, '%s')", nIndexItem, "chiakhoabac"))
	end
	if getn(tbOpt) > 0 then
		tinsert(tbOpt, "§ãng/Oncancel")
		Say("Sö dông ch×a khãa ®Ó më r­¬ng:", getn(tbOpt), tbOpt)
	end
	return 1	
end

function Oncancel()

end

function GetAwardTKBox(nItemIdx, strKeyType)
	local tbKey = tbTKBox_Key_Require[strKeyType]
	local tbAward = tbTKBoxAward[strKeyType]
	if not tbKey or not tbAward then
		return
	end
	--kiem tra o trong hanh trang
	if strKeyType == "chiakhoabac" then
		if PlayerFunLib:CheckFreeBagCell(5,"Ph¶i cã Ýt nhÊt 5 « trèng míi cã thÓ nhËn th­ëng.")~= 1 then
			return
		end
	end
	
	if ConsumeItem(3, 1, tbKey[1], tbKey[2], tbKey[3], -1) ~= 1 then
		Say("CÇn ph¶i cã Ch×a Khãa B¹c hoÆc Ch×a Khãa §ång míi cã thÓ më ®­îc B¶o R­¬ng Tèng Kim", 1, "§ãng/no")
		return
	end
	
	if ConsumeItem(3, 1, tbTKBox.tbProp[1], tbTKBox.tbProp[2], tbTKBox.tbProp[3], -1) ~= 1 then
		Say("Kh«ng t×m thÊy B¶o R­¬ng Tèng Kim", 1, "§ãng/no")
		return
	end	
	
	tbAwardTemplet:Give(tbAward, 1, {"LOG_FEATURE_CTC", "Use TKBox"})	
end