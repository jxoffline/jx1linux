--玄金装备
Include("\\script\\global\\autoexec_head.lua");
Include("\\script\\activitysys\\npcfunlib.lua");
Include("\\script\\dailogsys\\dailogsay.lua");
Include("\\script\\activitysys\\npcdailog.lua");
Include("\\script\\activitysys\\playerfunlib.lua");
Include("\\script\\item\\itemvalue\\fantasygoldessence.lua");
Include("\\script\\item\\itemvalue\\fantasygold.lua");

IncludeLib("ITEM");
IncludeLib("FILESYS")

IS_FANTASY_OPEN = 0

--允许升级成玄金装备（新白金装备）的黄金装备列表
--TB_GOLD_EQUIP_TO_UP = {
--	--[黄金ID] = {白金ID, 黄金装备名}
--};
--
--新黄金装备的黄金ID区间、需要的玄金之精等级、增加绑定时间的天数
TB_GOLD_EQUIP_TO_UP_ID_INTERVAL = {
	{905, 1134, 1, 1},--青驹
	{1135, 1364, 1, 1},--云鹿
	{1365, 1594, 1, 2},--苍狼
	{1595, 1824, 2, 7},--玄猿
	{1825, 2054, 2, 14},--紫蟒
	{2055, 2284, 2, 21},--金乌
	{2285, 2514, 3, 28},--白虎
	{2515, 2744, 3, 28},--赤麟
	{2745, 2974, 3, 28},--鸣凤
	{2975, 3204, 4, 28},--腾龙
	{3235, 3464, 2, 21},--金乌(满属性)
	{3895, 4124, 3, 28},--白虎(满属性)
	{4136, 4365, 3, 28},--赤麟(满属性)
};

--新玄金装备的ID区间、升级需要的价值量表、增加绑定时间的天数
TB_FANSTAY_GOLD_EQUIP_TO_UP_ID_INTERVAL = {
	{905, 1134, {10,11,12,13,14,15,16,17,19,21}, 1},--青驹
	{1135, 1364, {120,134,150,168,188,210,235,263,294,329}, 1},--云鹿
	{1365, 1594, {400,448,501,561,628,703,787,881,986,1104}, 2},--苍狼
	{1595, 1824, {1000,1120,1254,1404,1572,1760,1971,2207,2471,2767}, 7},--玄猿
	{1825, 2054, {3000,3360,3763,4214,4719,5285,5919,6629,7424,8314}, 14},--紫蟒
	{2055, 2284, {6000,6720,7526,8429,9440,10572,11840,13260,14851,16633}, 21},--金乌
	{2285, 2514, {16000,17920,20070,22478,25175,28196,31579,35368,39612,44365}, 28},--白虎
	{2515, 2744, {20000,22400,25088,28098,31469,35245,39474,44210,49515,55456}, 28},--赤麟
	{2745, 2974, {24000,26880,30105,33717,37763,42294,47369,53053,59419,66549}, 28},--鸣凤
	{2975, 3204, {30000,33600,37632,42147,47204,52868,59212,66317,74275,83188}, 28},--腾龙
	{3235, 3464, {6000,6720,7526,8429,9440,10572,11840,13260,14851,16633}, 21},--金乌(满属性)
	{3895, 4124, {16000,17920,20070,22478,25175,28196,31579,35368,39612,44365}, 28},--白虎(满属性)
	{4136, 4365, {20000,22400,25088,28098,31469,35245,39474,44210,49515,55456}, 28},--赤麟(满属性)
	
};

--玄金
TB_FANTASYGOLD = {6, 1, 3151};
--玄金之精
TB_FANTASYESSENCE = {6, 1, 3152};
--免费版为 精炼石，收费版为 混元灵露
TB_REFININGSTONE = {6, 1, 2312};

function GetUpToFantasyGoldEquipNeedMoney(nFantasyEssenceLevel)
	return CalcFantasyGoldEssenceValueByLevel(nFantasyEssenceLevel) * 1000;
end

function calc_equip_binditem(nBindState, nAddBindTime)
	local n_new_bindtime = 0;
	if nBindState == -2 then
		n_new_bindtime = -2;
	elseif nBindState == -1 then
		n_new_bindtime = -1;
	elseif nBindState == 0 then-- 2000年1月1日 相对于 1970年1月1日的秒数
		n_new_bindtime = nAddBindTime + floor((GetCurServerTime() - 946656000) / 3600) - 7 * 24;
	else
		n_new_bindtime = nBindState + nAddBindTime;
	end

	return n_new_bindtime;
end
