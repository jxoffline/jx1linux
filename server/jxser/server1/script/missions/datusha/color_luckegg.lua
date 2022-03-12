
IncludeLib("BATTLE");
Include("\\script\\item\\battles\\songjinskill.lua");

egg_tbAward	=
{
	{szName = "Kim Chi Chi’n HÂn ", 	nRate = 0.05, tbSkill = {add466}},
	{szName = "MÈc Chi Chi’n HÂn ", 	nRate = 0.05, tbSkill = {add466}},
	{szName = "ThÒy Chi Chi’n HÂn ", 	nRate = 0.05, tbSkill = {add466, add469}},
	{szName = "H·a Chi Chi’n HÂn ", 	nRate = 0.05, tbSkill = {add466, add468}},
	{szName = "ThÊ Chi Chi’n HÂn ", 	nRate = 0.05, tbSkill = {add466, add467}},
	{szName = "Kim Chi HÈ gi∏p  ", 	nRate = 0.05, tbSkill = {add474}},
	{szName = "MÈc Chi HÈ gi∏p  ", 	nRate = 0.05, tbSkill = {add477}},
	{szName = "ThÒy Chi HÈ gi∏p  ", 	nRate = 0.05, tbSkill = {add476}},
	{szName = "H·a Chi HÈ gi∏p  ", 	nRate = 0.05, tbSkill = {add473}},
	{szName = "ThÊ Chi HÈ gi∏p  ", 	nRate = 0.05, tbSkill = {add475}},
	{szName = "Kim Chi LÓi NhÀn", 	nRate = 0.05, tbSkill = {add479, add487, add487_1}},	-- ???
	{szName = "MÈc Chi LÓi NhÀn", 	nRate = 0.05, tbSkill = {add480, add485}},
	{szName = "ThÒy Chi LÓi NhÀn", 	nRate = 0.05, tbSkill = {add481, add486}},
	{szName = "H·a Chi LÓi NhÀn", 	nRate = 0.05, tbSkill = {add482}},
	{szName = "ThÊ Chi LÓi NhÀn", 	nRate = 0.05, tbSkill = {add483}},
	{szName = "NgÚ Hoa LÈ ", 	nRate = 0.05, tbSkill = {add472_1, add472_2, add490_1}},
	{szName = "HÀu Ngh÷ Chi Nh∑n ", 	nRate = 0.05, tbSkill = {add495}},
	{szName = "Bπch C©u HÈ uy”n", 	nRate = 0.05, tbSkill = {add496}},
	{szName = "TÀt phong ngoa ", 	nRate = 0.05, tbSkill = {add493}},
	{szName = "Th«n b› vÀt ph»m ", 	nRate = 0.05, tbSkill = {add466, add469, add468, add467, add474, add476, add477, add473, add475, add479, 
			add487, add487_1, add480, add485, add481, add486, add472_1, add472_2, add482, add483, add490_1, add493, add495, add496}},
}
egg_nTotalRate	= 100;

function main(nItemIndex)	
	local nRate		= random(egg_nTotalRate);
	local nNowRate	= 0;
	for i = 1, getn(egg_tbAward) do
		nNowRate = nNowRate + floor(egg_tbAward[i].nRate * egg_nTotalRate);
		if (nRate <= nNowRate) then
			egg_addskill(i);
			break;
		end
	end
end

function egg_addskill(nIndex)
	local nRate	= random(getn(egg_tbAward[nIndex].tbSkill));
	Msg2Player(format("ChÛc mıng ng≠¨i g∆p Æ≠Óc<color=yellow>%s<color>", egg_tbAward[nIndex].szName));
	egg_tbAward[nIndex].tbSkill[nRate]();
	
	WriteLog(format("[%s]\t Date:%s\t Account:%s\t Name:%s\tAward:%s \tProbability:%d",
				"Tr¯ng nhi“u mµu may mæn",
				GetLocalDate("%y-%m-%d %H:%M:%S"),
				GetAccount(),
				GetName(),
				egg_tbAward[nIndex].szName,
				egg_tbAward[nIndex].nRate));
end