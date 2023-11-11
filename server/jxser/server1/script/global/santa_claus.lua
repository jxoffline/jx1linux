-- ÄÏÂùÀÏÈË.lua (Ê¥µ®»î¶¯)
Include([[\script\missions\chrismas\ch_head.lua]]);
Include([[\script\missions\chrismas\xmas_day.lua]]);

tabExp = {
2000000,
2000000,
2000000,
1500000,
1500000,
1500000,
1000000,
1000000,
1000000,
500000
};

tabRate = {
	{0, 0.69, 0.27, 0.04},
	{0, 0.83, 0.14, 0.03},
	{0, 0.86, 0.13, 0.01},
	{0, 0.85, 0.15, 0},
	{0, 0.9, 0.1, 0},
	{0, 0.95, 0.05, 0},
	{0.27, 0.68, 0.05, 0},
	{0.37, 0.59, 0.04, 0},
	{0.61, 0.36, 0.03, 0},
	{0.72, 0.26, 0.02, 0}
};

function main()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate < 20061222) then
		Describe(DescLink_LiGuan.."Chóc gi¸ng sinh vui vÎ!", 1, "KÕt thóc ®èi tho¹i/oncancel");
	else
		Describe(DescLink_LiGuan.."Ha ha, chóc gi¸ng sinh vui vÎ! Cã muèn biÕt gi¸ng sinh n¨m nay cã ho¹t ®éng g× kh«ng?", 5, 
			"Nghe nãi «ng bŞ mÊt bao hµnh lı/want_xmasevent",
			"Ta muèn t¹o ng­êi tuyÕt./want_snowman",
			"Ta muèn ®em ng­êi tuyÕt ®æi quµ./want_gift",
			"Ta muèn t×m hiÓu néi dung ho¹t ®éng/xmas_about",
			"Ta hiÖn t¹i rÊt bËn, khi kh¸c sÏ quay l¹i./oncancel");
	end;
end;

function want_xmasevent()
	if (isXmasTime() ~= 1) then
		Describe(DescLink_LiGuan.."C¶m ¬n ng­¬i, ta ®· t×m l¹i ®­îc bao hµnh lı.",1, "KÕt thóc ®èi tho¹i/oncancel");
		return 0;
	end;
	Describe(DescLink_LiGuan.."Ta võa bŞ mÊt bao hµnh lı, bªn trong cã rÊt nhiÒu quµ gi¸ng sinh cña mäi ng­êi. Ng­¬i cã thÓ gióp ta t×m l¹i kh«ng?", 4,
	"§­¬ng nhiªn lµ ®­îc råi./onok",
	"Ta ®· t×m ra bän chóng råi./award",
	"Giíi thiÖu ho¹t ®éng gi¸ng sinh./detail",
	"Ta hiÖn t¹i rÊt bËn, khi kh¸c sÏ quay l¹i./oncancel")
end;


function onok()
	if (50 > GetLevel()) then
		strTalk = DescLink_LiGuan.."B¹n ch­a ®¹t ®Õn cÊp 50, kh«ng thÓ tham gia ho¹t ®éng Gi¸ng Sinh.";
		Describe(strTalk, 1, "KÕt thóc ®èi tho¹i/oncancel");
		return
	end;
	Describe(DescLink_LiGuan.."C¶m ¬n ng­¬i nhiÒu, ta sÏ ®­a ng­¬i ®Õn n¬i ta lµm r¬i bao quµ.", 2, "§­îc råi./wantjoin", "HiÖn thêi ta bËn qu¸, kh«ng cã thêi gian ®©u./oncancel");
end;

function award()
	local nCount = GetTask(TK_COUNT_ONETIME);
	local nRank = GetTask(TK_RANK);
	SetTask(TK_COUNT_ONETIME, 0);
	SetTask(TK_RANK, 0);
	if (nCount == 0 or nRank == 0) then
		Describe(DescLink_LiGuan.."H×nh nh­ ng­¬i vÉn ch­a t×m ®­îc c¸c mãn quµ cña ta.", 1, "KÕt thóc ®èi tho¹i/oncancel");
		return
	end;
	local strSay = format("¤i, ®©y chİnh lµ quµ mµ ta lµm mÊt ®Êy mµ! §Ó ta xem, ng­¬i t×m ®­îc tæng céng %d bao <color=yellow>quµ gi¸ng sinh<color>, xÕp h¹ng thø %d trong nhãm ng­êi ®i t×m. §©y lµ quµ cña ng­¬i, h·y nhËn lÊy.", nCount, nRank);
	Describe(DescLink_LiGuan..strSay, 1, "NhËn lÊy lÔ vËt./oncancel");
	giveaward(nRank);
end;

function detail()
	Describe(DescLink_LiGuan.."Ho¹t ®éng t×m quµ gi¸ng sinh thÊt l¹c mçi ®ît chia thµnh <color=yellow>15<color> phót, trong ®ã cã <color=yellow>5<color> phót ®Ó b¸o danh vµ chuÈn bŞ. Khi b¸o danh xong, ng­êi ch¬i sÏ ®­îc ®­a ®Õn mét b¶n ®å chung ®Ó chuÈn bŞ. Khi chİnh thøc b¾t ®Çu ®ît t×m kiÕm quµ, ng­êi ch¬i sÏ ®­îc ®­a ngÉu nhiªn ®Õn khu vùc ho¹t ®éng ®Ó tham gia t×m kiÕm quµ bŞ thÊt l¹c. Khi ph¸t hiÖn quµ, nhÊp chuét tr¸i vµo <color=yellow>quµ gi¸ng sinh<color> ®Ó nhÆt chóng. Trong lóc ®i t×m, ng­êi ch¬i sÏ ph¶i sö dông c¸c ®¹o cô ®Ó ng¨n c¶n vµ tho¸t khái sù c¶n trë cña ng­êi ch¬i kh¸c. NhÆt cµng nhiÒu quµ, phÇn th­ëng nhËn ®­îc sÏ cµng lín.", 1, "Cã thÇn kú nh­ vËy kh«ng? §Ó ta thö xem./oncancel");
end;

function giveaward(nRank)
	expaward(nRank);
	goodsaward(nRank);
end;

function expaward(nRank)
	AddOwnExp(tabExp[nRank]);
end;

function goodsaward(nRank)
	local nGoodsType = getgoodtype(nRank);
	if (nGoodsType == 1) then
		AddItem(6, 1, 1008, 1, 0, 0, 0);
		local strsay = "B¹n nhËn ®­îc mét h¹t Hoµng Kim"
		Msg2Player(strsay);
	elseif (nGoodsType == 2) then
		AddItem(6, 1, 1007, 1, 0, 0, 0);
		local strsay = "B¹n nhËn ®­îc mét h¹t Thñy Tinh"
		Msg2Player(strsay);
	elseif (nGoodsType == 3) then
		AddItem(6, 1, 1006, 1, 0, 0, 0);
		local strsay = "B¹n nhËn ®­îc mét h¹t Hoa hång"
		Msg2Player(strsay);
	elseif (nGoodsType == 4) then
		AddItem(6, 1, 1005, 1, 0, 0, 0);
		local strsay = "B¹n nhËn ®­îc mét h¹t May m¾n"
		Msg2Player(strsay);
	end;
end;

function getgoodtype(nRank)
	local nSeed = random(100);
	local nRate = {}
	local i;
	for i = 1, 4 do
		nRate[i] = tabRate[nRank][i] * 100;
	end;
	local nBase = 0;
	for i = 1, 4 do
		nBase = nBase + nRate[i];
		if (nBase >= nSeed) then
			return (5 - i);
		end;
	end;
end;

function onsale()

end;

function wantjoin()
	local w, x, y;
	w, x, y = GetWorldPos();
	SetTask(TK_LEAVERMAPID, w);	--´æ´¢Íæ¼ÒÀë¿ªµÄ×ø±ê
	SetTask(TK_LEAVERPOSX, x);
	SetTask(TK_LEAVERPOSY, y);
	joingame() --¼ÓÈëµ½ÓÎÏ·ÖĞ
end;

function xmas_about()
	Describe(DescLink_LiGuan.."Trong thêi gian ho¹t ®éng, ng­êi ch¬i sÏ ph¶i ®¸nh qu¸i vËt ®Ó thu thËp hép quµ, bªn trong sÏ cã <color=yellow>b«ng tuyÕt, cµ rèt, cµnh th«ng, nãn, c©y th«ng, kh¨n choµng<color>, lµ c¸c nguyªn liÖu dïng ®Ó t¹o ra <color=yellow>ng­êi tuyÕt ®Æc biÖt<color>. NÕu chÕ t¹o thÊt b¹i, sÏ cho ra  <color=yellow>ng­êi tuyÕt th­êng<color>. Sau ®ã, cã thÓ dïng ng­êi tuyÕt ®Ó ®æi quµ t¹i ®©y.", 1, "Ta biÕt råi/main");
end;

function oncancel()	--È¡Ïû

end;