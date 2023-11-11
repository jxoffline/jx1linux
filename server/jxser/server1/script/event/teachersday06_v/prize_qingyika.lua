--ÇéÒê¿¨½±Àø
Include([[\script\event\teachersday06_v\head.lua]]);

--·¢½±Èë¿Ú
function vt06_prizeenter()
	if (vt06_isactive() == 0) then
		return 0;
	end;
	
	Describe("Trong dŞp lÔ ¢n S­ nµy, c¸c hiÖp kh¸ch <color=yellow>d­íi cÊp 80<color> hoµn thµnh nhiÖm vô Hoµng Kim, Boss s¸t thñ vµ giÕt Boss xanh, cã c¬ héi nhËn ®uîc 4 ch÷ “NhÊt”,”Tù”,”Vi”,S­”. D©ng tÆng 4 ch÷ cho s­ phô, ®Ö tö sÏ nhËn ®­îc “ThÎ Cao §å”, s­ phô sÏ nhËn ®­îc “ThÎ ¢n S­”. Ta cã thÓ ®æi 2 thÎ nµy thµnh qu¶ th­ëng. Ng­¬i muèn ®æi thÎ nµo?", 3, "Ta muèn ®æi “ThÎ ¢n S­”/#vt06_sendgift(1)", 
		"Ta muèn ®æi “ThÎ Cao §å”/#vt06_sendgift(2)", "Rêi khái/no");
end;

tab_Goods = {{"ThÎ ¢n S­", 1293}, {"ThÎ Cao §å", 1295}};
tab_Idx = {1, 2, 3, 4, 5, 6}

function vt06_sendgift(nIdx)
	Say("Thu thËp ®­îc nhiÒu thÎ, phÇn th­ëng ®iÓm kinh nghiÖm cµng nhiÒu! <color=yellow>1<color>"..tab_Goods[nIdx][1].." ®­îc <color=yellow>40 v¹n ®iÓm<color>, <color=yellow>2<color>"..tab_Goods[nIdx][1].." ®­îc <color=yellow>100 v¹n ®iÓm<color>, <color=yellow>5<color>"..tab_Goods[nIdx][1].." ®­îc <color=yellow>300 v¹n ®iÓm<color>.", 4,
	"Ta muèn ®æi 1 "..tab_Goods[nIdx][1].." lÊy 40 v¹n ®iÓm/#vt06_giveprize("..nIdx..", 1, 400000)",
	"Ta muèn ®æi 2 "..tab_Goods[nIdx][1].." lÊy 100 v¹n ®iÓm/#vt06_giveprize("..nIdx..", 2, 1000000)",
	"Ta muèn ®æi 5 "..tab_Goods[nIdx][1].." lÊy 300 v¹n ®iÓm/#vt06_giveprize("..nIdx..", 5, 3000000)",
	"Rêi khái/no");
end;

function vt06_giveprize(nIdx, nCount, nExp)
	local nOwnedExp = GetTask(TK_EXPLIMIT);
	
	if (nOwnedExp >= VT06_EXPLIMIT) then
		Say("B¹n ®· nhËn ®­îc <color=yellow>"..VT06_EXPLIMIT.."<color> ®iÓm kinh nghiÖm, kh«ng thÓ nhËn thªm!", 0);
		return
	end;
	
	if (CalcEquiproomItemCount(6,1,tab_Goods[nIdx][2],-1) < nCount) then
		Say("Ng­¬i h×nh nh­ kh«ng ®ñ <color=yellow>"..nCount.."<color>"..tab_Goods[nIdx][1].."! TiÕp tôc nç lùc nhĞ!", 0);
		return
	end;
	
	--É¾ÎïÆ·
	if (ConsumeEquiproomItem(nCount,6,1,tab_Goods[nIdx][2],-1) == 0) then
		return
	end;

	--¼Ó¾­Ñé
	nOwnedExp = nOwnedExp + nExp;
	SetTask(TK_EXPLIMIT, nOwnedExp);
	AddOwnExp(nExp);
	Say("B¹n nhËn ®­îc<color=yellow>"..nExp.."<color> ®iÓm kinh nghiÖm.", 0);
end;