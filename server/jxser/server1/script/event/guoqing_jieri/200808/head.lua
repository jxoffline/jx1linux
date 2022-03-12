-- ====================== Œƒº˛–≈œ¢ ======================

-- Ω£œ¿«È‘µÕ¯¬Á∞Ê“ª◊∑—∞√ÿ∆◊π´π≤–≈œ¢Ω≈±æ

-- Edited by ◊”∑«Ù~
-- 2008/07/24 13:43

-- ======================================================


ZHUIXUNMIPU_START	=	08081000;		-- ªÓ∂Øø™ º ±º‰£®∞Ê±æ£©(yymmddHH)
ZHUIXUNMIPU_CLOSE	=	08082024;		-- ªÓ∂ØΩ· ¯ ±º‰

ZHUIXUNMIPU_ITEM_TIME	=	08082724;
ZHUIXUNMIPU_MAXEXP		=	800000000;		-- µ¿æﬂ π”√æ≠—È…œœﬁ
ZHUIXUNMIPU_EXPPER		=	1500000;		--  π”√µ¿æﬂ√ø¥ŒªÒµ√æ≠—È÷µ

TSK_ZXMP_VERSION	= 1903;				-- ªÓ∂Ø∆ º ±º‰…Ë÷√±‰¡ø
TSK_ZXMP_MAXEXP		= 1904;				-- ªÒµ√æ≠—È¿€º∆±‰¡ø

TB_ZHUIXUNMIPU_ITEMLIST = {
--	TYPE,	TBITEMID,	RATE,	NAME
	{n_type = 2,	tb_itemid = {0, 164},	n_rate = 0.0007,	sz_name = "An Bang B®ng Tinh Thπch Hπng Li™n"},
	{n_type = 2,	tb_itemid = {0, 165},	n_rate = 0.001,	sz_name = "An Bang CÛc Hoa Thπch Chÿ hoµn"},
	{n_type = 2,	tb_itemid = {0, 166},	n_rate = 0.002,	sz_name = "An Bang ßi“n Hoµng Thπch Ng‰c BÈi"},
	{n_type = 2,	tb_itemid = {0, 167},	n_rate = 0.001,	sz_name = "An Bang K™ Huy’t Thπch GiÌi Chÿ "},
	
	{n_type = 2,	tb_itemid = {0, 159},	n_rate = 0.002,	sz_name = "ßﬁnh QuËc Thanh Sa Tr≠Íng Sam"},
	{n_type = 2,	tb_itemid = {0, 160},	n_rate = 0.001,	sz_name = "ßﬁnh QuËc § Sa Ph∏t Qu∏n"},
	{n_type = 2,	tb_itemid = {0, 161},	n_rate = 0.004,	sz_name = "ßﬁnh QuËc X›ch Quy™n Nhuy‘n Ngoa"},
	{n_type = 2,	tb_itemid = {0, 162},	n_rate = 0.004,	sz_name = "ßﬁnh QuËc Tˆ ßªng HÈ uy”n"},
	{n_type = 2,	tb_itemid = {0, 163},	n_rate = 0.004,	sz_name = "ßﬁnh QuËc Ng©n Tµm Y™u Æ∏i"},
	
	{n_type = 1,	tb_itemid = {6,1,147,3,0,0},	n_rate = 4,	sz_name = "Huy“n tinh kho∏ng thπch c p 3"},
	{n_type = 1,	tb_itemid = {6,1,147,4,0,0},	n_rate = 1,	sz_name = "Huy“n Tinh Kho∏ng Thπch c p 4"},
	{n_type = 1,	tb_itemid = {6,1,147,5,0,0},	n_rate = 0.5,	sz_name = "Huy“n Tinh Kho∏ng Thπch c p 5"},
	
	{n_type = 1,	tb_itemid = {6,1,26,1,0,0},	n_rate = 0.003,	sz_name = "V‚ L©m MÀt Tﬁch"},
	{n_type = 1,	tb_itemid = {6,1,22,1,0,0},	n_rate = 0.003,	sz_name = "T»y TÒy Kinh"},
	
	{n_type = 3,	n_repute = 1,	n_rate = 44.4743,	sz_name = "Danh v‰ng"},
	{n_type = 3,	n_repute = 2,	n_rate = 30,	sz_name = "Danh v‰ng"},
	{n_type = 3,	n_repute = 3,	n_rate = 20,	sz_name = "Danh v‰ng"},
};

TB_ZHUIXUNMIPU_COMPLIST = {
	{n_type = 1,	tb_itemid = {6,1,196,-1},	n_count = 5,	sz_name = "MÀt ÆÂ th«n b› "},
	{n_type = 1,	tb_itemid = {6,1,122,-1},	n_count = 1,	sz_name = "PhÛc Duy™n LÈ (Ti”u) "},
	{n_type = 4,	n_money = 10000,			n_count = 1,	sz_name = "Ng©n l≠Óng"},
}

function zxmp_reset_vertsk()
	if (GetTask(TSK_ZXMP_VERSION) ~= ZHUIXUNMIPU_START) then
		SetTask(TSK_ZXMP_VERSION, ZHUIXUNMIPU_START);
		SetTask(TSK_ZXMP_MAXEXP, 0);
	end
end


-- ºÏ≤È «∑Ò‘⁄ªÓ∂Ø∫œ≥… ±º‰£∫ «1£¨∑Ò0£ª
function zxmp_200808_checkdate()
	local n_date = tonumber(GetLocalDate("%y%m%d%H"));
	if (n_date >= ZHUIXUNMIPU_START and n_date <= ZHUIXUNMIPU_CLOSE) then
		return 1;
	end
	
	return 0;
end

-- ºÏ≤Èµ¿æﬂ π”√ ±º‰£∫ «1£¨∑Ò0£ª
function zxmp_200808_itemdate()
	local n_date = tonumber(GetLocalDate("%y%m%d%H"));
	if (n_date <= ZHUIXUNMIPU_ITEM_TIME) then
		return 1;
	end
	
	return 0;
end

-- ºÏ≤È π”√µ¿æﬂæ≠—È
function zxmp_200808_checkexp()
	local n_curexp = GetTask(TSK_ZXMP_MAXEXP);
	
	if (n_curexp >= ZHUIXUNMIPU_MAXEXP) then
		return 0;
	elseif (ZHUIXUNMIPU_EXPPER + n_curexp <= ZHUIXUNMIPU_MAXEXP) then
		return ZHUIXUNMIPU_EXPPER;
	elseif (ZHUIXUNMIPU_EXPPER + n_curexp > ZHUIXUNMIPU_MAXEXP) then
		return (ZHUIXUNMIPU_MAXEXP - (ZHUIXUNMIPU_EXPPER + n_curexp));
	end
	
	return 0;		-- ’‚æ‰÷ª «Œ™¡À±‹√‚≥ˆ¥Ì
end

