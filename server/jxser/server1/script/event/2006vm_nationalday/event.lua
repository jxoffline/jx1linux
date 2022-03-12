NA_MONEYGIFT_MAX_MONEY				=	1000000			--»î¶¯ÆÚ×î´óÔÊÐí¶Ò»»½±Àø½ðÇ®Êý
NA_MONEYGIFT_DAYMAX_MONEY			= 200000			--Ã¿ÈÕ×î´óÔÊÐí¶Ò»»½±Àø½ðÇ®Êý
NA_MONEYGIFT_SV_DAYMAX_MONEY	= 350000000	--Ã¿Ì¨·þÎñÆ÷ÔÊÐíÃ¿ÈÕ¶Ò»»µÄ×î´óÖµ3.5ÒÚ
NA_MONEYGIFT_MONEY						= 20000

TSK_NA_MONEYGIFT_MAXMONEY			= 1194			--µ±Ç°ÒÑ»ñµÃµÄ½ðÇ®Í³¼Æ
TSK_NA_MONEYGIFT_DAYMAXMONEY 	= 1195			--±¾ÈÕ»ñµÃµÄ½ðÇ®Í³¼Æ
TSK_NA_MONEYGIFT_LASTDAY			= 1196			--×îºóÒ»´Î¶Ò»»½±ÀøµÄÈÕÆÚ
TSK_NA_MONEYGIFT_ISTAKED			= 1197			--¸Ã½ÇÉ«ÊÇ·ñÄÜ¹»¶Ò»»½±Àø

GTSK_NA_MONEYGIFT_SVLASTDAY		= 831				--×îºóÒ»´Î¶Ò»»ÎïÆ·½±ÀøµÄÈÕÆÚ
GTSK_NA_MONEYGIFT_SVMAXMONEY	= 832				--µ±ÈÕÀñ¹ÙÒÑ¶Ò»»½±Àø½ðÇ®µÄÊýÁ¿

EXT_NA_MONEYGIFT_ACCT					= 2					--À©Õ¹µã£¬Èý¸ö½ÇÉ«²Î¼Ó»î¶¯
TB_MONEYGIFT_MSG = {
	"<#>Quý kh¸ch ch­a n¹p thÎ, kh«ng thÓ tham gia ho¹t ®éng nµy!",
	"<#>ChØ nh÷ng ng­êi ®¼ng cÊp trªn 50 míi cã thÓ tham gia ho¹t ®éng nµy.",
	"<#>Ng­¬i ®· cã 3 nh©n vËt tham gia ho¹t ®éng nµy, kh«ng thÓ tham gia thªm ®­îc n÷a.",
	"<#>Quý kh¸ch ®· ®æi ®ñ 100 v¹n trong ho¹t ®éng nµy! C¶m ¬n ®· ñng hé!",
	"<#>H«m nay quý kh¸ch ®· ®æi ®ñ 20 v¹n. Mai l¹i ®Õn nhÐ!",
	"<#>ThËt ng¹i qu¸! Ta míi ®æi hÕt tiÒn! H·y thö ®i c¸c thµnh kh¸c hoÆc ngµy mai quay l¹i nhÐ. Chóc vui vÎ!",
	"<#>H×nh nh­ quý kh¸ch kh«ng cã “Quµ Quèc Kh¸nh”!",
}
function vm_NationalDay()
	Say("<#>Quèc kh¸nh vui vÎ! H·y mau ®i luyÖn c«ng, t×m ®­îc “Quµ Quèc Kh¸nh” ®Õn ®©y ta sÏ ®æi cho phÇn quµ thó vÞ!", 2,
	"§æi quµ Quèc Kh¸nh/NA_want2changegift",
	"Ta chØ ®Õn xem th«i/OnCancel");
end;

function NA_want2changegift()
	if (NA_istakedgift() == 0) then
		return 0;
	end;
	
	if (CalcEquiproomItemCount(6,1,1155,-1) >= 1 and ConsumeEquiproomItem(1, 6, 1, 1155, -1)) then
		SetTask(TSK_NA_MONEYGIFT_MAXMONEY, GetTask(TSK_NA_MONEYGIFT_MAXMONEY) + NA_MONEYGIFT_MONEY);
		SetTask(TSK_NA_MONEYGIFT_DAYMAXMONEY, GetTask(TSK_NA_MONEYGIFT_DAYMAXMONEY) + NA_MONEYGIFT_MONEY);
		SetGlbValue(GTSK_NA_MONEYGIFT_SVMAXMONEY, GetGlbValue(GTSK_NA_MONEYGIFT_SVMAXMONEY) + NA_MONEYGIFT_MONEY);
		Earn(NA_MONEYGIFT_MONEY);
		WriteLog("[Ho¹t ®éng Quèc Kh¸nh]\t"..date().." \tName:"..GetName().."\tAccount:"..GetAccount().." NhËn ®­îc"..NA_MONEYGIFT_MONEY.." l­îng")
		Say("<#>Xin nhËn ng©n l­îng. Chóc Quèc Kh¸nh vui vÎ!", 1, "NhËn ng©n l­îng/OnCancel")
		if (GetTask(TSK_NA_MONEYGIFT_ISTAKED) == 0) then
			SetTask(TSK_NA_MONEYGIFT_ISTAKED, 1);
			AddExtPoint(EXT_NA_MONEYGIFT_ACCT, 1);
		end;
	else
		Say(TB_MONEYGIFT_MSG[7], 0);
	end;
end;

function NA_istakedgift()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	
	if (GetTask(TSK_NA_MONEYGIFT_LASTDAY) ~= nDate) then
		SetTask(TSK_NA_MONEYGIFT_LASTDAY, nDate);
		SetTask(TSK_NA_MONEYGIFT_DAYMAXMONEY, 0);
	end;
	
	if (GetGlbValue(GTSK_NA_MONEYGIFT_SVLASTDAY) ~= nDate) then
		SetGlbValue(GTSK_NA_MONEYGIFT_SVLASTDAY, nDate);
		SetGlbValue(GTSK_NA_MONEYGIFT_SVMAXMONEY, 0);
	end;

	if (GetTask(TSK_NA_MONEYGIFT_ISTAKED) == 0) then
		if (IsCharged() ~= 1) then	--³åÖµ
			Say(TB_MONEYGIFT_MSG[1], 0);
		elseif (GetLevel() < 50) then	--50¼¶
			Say(TB_MONEYGIFT_MSG[2], 0);
		elseif (GetExtPoint(EXT_NA_MONEYGIFT_ACCT) >= 3) then	--3¸ö½ÇÉ«
			Say(TB_MONEYGIFT_MSG[3], 0);
		else
			return 1;
		end;
		return 0;
	else
		if (GetTask(TSK_NA_MONEYGIFT_MAXMONEY) >= NA_MONEYGIFT_MAX_MONEY) then	--½ÇÉ«»ñÈ¡×î´ó½±Àø
			Say(TB_MONEYGIFT_MSG[4], 0);
		elseif (GetTask(TSK_NA_MONEYGIFT_DAYMAXMONEY) >= NA_MONEYGIFT_DAYMAX_MONEY) then		--Ã¿ÈÕ×î´ó½±Àø
			Say(TB_MONEYGIFT_MSG[5], 0);
		elseif (GetGlbValue(GTSK_NA_MONEYGIFT_SVMAXMONEY) >= NA_MONEYGIFT_SV_DAYMAX_MONEY) then	--·þÎñÆ÷×î´óÏÞÖÆ
			Say(TB_MONEYGIFT_MSG[6], 0);
		else
			return 1;
		end;
		return 0;
	end;
end;

function IsCharged()
	if( GetExtPoint( 0 ) >= 1 ) then
		return 1;
	else
		return 0;
	end;
end;