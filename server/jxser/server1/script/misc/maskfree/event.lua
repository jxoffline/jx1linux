Include("\\script\\lib\\basic.lua")

MASKFREE_SWITH = 1;		--1:Open   
											--nil:Close

TB_MASKFREE_1 = {
	{"MÆt n¹ - L¹c Quang", 369},
	{"MÆt n¹ - Ng©n Nha", 370},
	{"MÆt n¹ - S­¬ng §ao", 371},
	{"MÆt n¹ - L·nh §ao", 372},
	{"MÆt n¹ - Hµn Th­¬ng", 373},
	{"MÆt n¹ - B«n L«i", 374},
	{"MÆt n¹ - §éc Bé ", 375},
	{"MÆt n¹ - Gi¸ng Chïy", 376},
	{"MÆt n¹ - XÝch Ch­ëng", 377},
	{"MÆt n¹ - Lang Bæng", 378},
	--{"",},
}
TB_MASKFREE_2 = {
	{"MÆt n¹ - Tr­¬ng T«ng ChÝnh", 379},
	{"MÆt n¹ - LiÔu Thanh Thanh", 380},
	{"MÆt n¹ - PhiÕn Kh¸ch", 381},
}

TB_MASKFREE_3 = {
	{"MÆt n¹ - HuyÒn Gi¸c §¹i S­ ", 382},
	{"MÆt n¹ - Long Ngò ", 383},
}

TB_MASKFREEINFO_BYBIT = {
	--BIT		MASKTYPE					TABLE-MASK
	[1] = {"MÆt n¹ lo¹i 5000 VND ", TB_MASKFREE_1},
	[2] = {"MÆt n¹ lo¹i 20000 VND ", TB_MASKFREE_2},
	[3] = {"MÆt n¹ lo¹i 60000 VND", TB_MASKFREE_3},
--	[4] = {},
--	[5] = {},
--	[6] = {},
--	[7] = {},
--	[8] = {},
--	[9] = {},
--	[10] = {},
--	[11] = {},
--	[12] = {},
--	[13] = {},
--	[14] = {},
--	[15] = {},
--	[16] = {},
}

--print(getn(TB_MASKFREEINFO_BYBIT[1][2]))


function takeMaskFree()
	local aryMaskFree = {};
	local nExtValue = GetExtPoint(6);
	
	if (nExtValue <= 0) then
		Say("Quý kh¸ch ch­a ®ñ ®iÒu kiÖn nhËn quµ tÆng MÆt n¹! ", 0);
		return
	end;
	
	for nbit, maskinfo in TB_MASKFREEINFO_BYBIT do
		if (get_extpoint_bit(6, nbit) == 1 and getn(TB_MASKFREEINFO_BYBIT[nbit]) ~= 0) then
			tinsert(aryMaskFree, TB_MASKFREEINFO_BYBIT[nbit][1].."/#sure2takeMaskFree("..nbit..")")
		end;
	end;
	
	tinsert(aryMaskFree, "L¸t n÷a quay l¹i /no")
	
	Say("Quý kh¸ch muèn nhËn lo¹i mÆt n¹ nµo? ", getn(aryMaskFree), aryMaskFree);
end;

function sure2takeMaskFree(nbit)
	local tbMask = TB_MASKFREEINFO_BYBIT[nbit][2];
	local nItem = random(getn(tbMask));
	
	if (pay_extpoint_bit(6, nbit) == 1 and nItem > 0) then
		local szname, np = unpack(tbMask[nItem]);
		AddItem(0, 11, np, 1, 1, 1);
		Say("§©y lµ mÆt n¹ "..szname..". C¶m ¬n quý kh¸ch ®· ñng hé!", 0);
		WriteLog("[MASKFREE]"..date().." Name:"..GetName().." Account:"..GetAccount().." take a mask : "..szname.." by bit:"..nbit);
	else
		print("ERROR!! PAY EXTPOINT6 FAIL! THE BIT:"..nbit)
	end;
end;

function get_extpoint_bit(nextp, nbit)
	local nvalue = GetExtPoint(nextp);
	return GetBit(nvalue, nbit)
end;

function pay_extpoint_bit(nextp, nbit)
	local npoint = 2^(nbit-1); -- nBit´Ó1¿ªÊ¼¼ÆÊý
	return PayExtPoint(nextp, npoint);
end;
