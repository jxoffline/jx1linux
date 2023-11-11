
-- ËÎ½ðÌØÊâ¼¼ÄÜ
-- by Bel
-- 2008.03.06

Include("\\script\\lib\\common.lua");

sjskill_tbSkill = {
	[462]	= {nLevel_Low = 2,	nLevel_High = 10,	nTime = 60,	szTips = "Liªn tiÕp %s håi phôc sinh mÖnh %d ®iÓm"},
	[463]	= {nLevel_Low = 2,	nLevel_High = 10,	nTime = 60, szTips = "Liªn tiÕp %s håi phôc néi lùc %d ®iÓm"},
	[464]	= {nLevel_Low = 1,	nLevel_High = 10,	nTime = 60, szTips = "Liªn tiÕp %s håi phôc sinh mÖnh , mçi nöa gi©y håi phôc %d ®iÓm"},
	[465]	= {nLevel_Low = 1, 	nLevel_High = 10,	nTime = 60, szTips = "Liªn tiÕp %s håi phôc néi lùc , mçi nöa gi©y håi phôc %d ®iÓm"},
	[466]	= {nLevel_Low = 1, 	nLevel_High = 4, 	nTime = 60, szTips = "%s gi¶m s¸t th­¬ng: %d%%"},
	[467]	= {nLevel_Low = 1, 	nLevel_High = 4, 	nTime = 60, szTips = "%s gi¶m tróng ®éc: %d%%"},
	[468]	= {nLevel_Low = 1, 	nLevel_High = 4, 	nTime = 60, szTips = "%s gi¶m lµm chËm: %d%%"},
	[469]	= {nLevel_Low = 1, 	nLevel_High = 4, 	nTime = 60, szTips = "%s gi¶m cho¸ng: %d%%"},
	[471]	= {nLevel_Low = 2, 	nLevel_High = 10,	nTime = 60, szTips = "Liªn tiÕp %s håi phôc sinh mÖnh %d ®iÓm vµ liªn tiÕp %s håi phôc néi lùc %d ®iÓm"},
	[472]	= {nLevel_Low = 1, 	nLevel_High = 10,	nTime = 60, szTips = "Liªn tiÕp %s håi phôc sinh mÖnh , mçi nöa gi©y håi phôc %d ®iÓm vµ liªn tiÕp %s håi phôc néi lùc , mçi nöa gi©y håi phôc %d ®iÓm"},
	[473]	= {nLevel_Low = 1, 	nLevel_High = 7, 	nTime = 60, szTips = "%s phßng thñ: t¨ng %d%%"},
	[474]	= {nLevel_Low = 1, 	nLevel_High = 7, 	nTime = 60, szTips = "%s kh¸ng ®éc:  t¨ng %d%%"},
	[475]	= {nLevel_Low = 1, 	nLevel_High = 7, 	nTime = 60, szTips = "%s kh¸ng b¨ng: t¨ng %d%%"},
	[476]	= {nLevel_Low = 1, 	nLevel_High = 7, 	nTime = 60, szTips = "%s kh¸ng háa: t¨ng %d%%"},
	[477]	= {nLevel_Low = 1, 	nLevel_High = 7, 	nTime = 60, szTips = "%s kh¸ng l«i: t¨ng %d%%"},
	[478]	= {nLevel_Low = 1, 	nLevel_High = 4, 	nTime = 60, szTips = "%s kh¸ng tÊt c¶: t¨ng %d%%"},
	[479]	= {nLevel_Low = 10, nLevel_High = 20,	nTime = 60, szTips = "%s hÖ néi c«ng s¸t th­¬ng b×nh th­êng: t¨ng %d ®iÓm"},
	[480]	= {nLevel_Low = 1, 	nLevel_High = 5, 	nTime = 60, szTips = "%s hÖ néi c«ng ®éc s¸t: t¨ng %d ®iÓm"},
	[481]	= {nLevel_Low = 10, nLevel_High = 20,	nTime = 60, szTips = "%s hÖ néi c«ng b¨ng s¸t: t¨ng %d ®iÓm"},
	[482]	= {nLevel_Low = 10, nLevel_High = 20,	nTime = 60, szTips = "%s hÖ néi c«ng háa s¸t: t¨ng %d ®iÓm"},
	[483]	= {nLevel_Low = 10, nLevel_High = 20,	nTime = 60, szTips = "%s hÖ néi c«ng l«i s¸t: t¨ng %d ®iÓm"},
	[485]	= {nLevel_Low = 1, 	nLevel_High = 5, 	nTime = 60, szTips = "%s ngo¹i c«ng ®éc s¸t: t¨ng %d ®iÓm"},
	[486]	= {nLevel_Low = 1, 	nLevel_High = 4, 	nTime = 60, szTips = "%s ngo¹i c«ng b¨ng s¸t: t¨ng %d ®iÓm"},
	[487]	= {nLevel_Low = 5, 	nLevel_High = 10,	nTime = 60, szTips = "%s s¸t th­¬ng hÖ ngo¹i c«ng: t¨ng %d%%"},
	[488]	= {nLevel_Low = 10, nLevel_High = 20,	nTime = 60, szTips = "Liªn tiÕp %s sinh mÖnh ®¹t giíi h¹n t¨ng %d ®iÓm"},
	[489]	= {nLevel_Low = 10, nLevel_High = 20,	nTime = 60, szTips = "Liªn tiÕp %s néi c«ng ®¹t giíi h¹n t¨ng %d ®iÓm"},
	[490]	= {nLevel_Low = 10, nLevel_High = 20,	nTime = 60, szTips = "Liªn tiÕp %s sinh mÖnh ®¹t giíi h¹n t¨ng: %d ®iÓm vµ liªn tiÕp %s néi c«ng ®¹t giíi h¹n t¨ng: %d ®iÓm"},
	[493]	= {nLevel_Low = 1, 	nLevel_High = 3, 	nTime = 60, szTips = "%s tèc ®é di chuyÓn: t¨ng %d%%"},
	[495]	= {nLevel_Low = 10, nLevel_High = 20,	nTime = 60, szTips = "%s tØ lÖ chÝ m¹ng: t¨ng %d%%"},
	[496]	= {nLevel_Low = 1, 	nLevel_High = 2, 	nTime = 60, szTips = "%s xuÊt chiªu vâ c«ng: %d%%"},
	[498]	= {nLevel_Low = 10, nLevel_High = 30, 	nTime = 60,	szTips = "%s hÖ ngo¹i c«ng háa s¸t: t¨ng %d ®iÓm"},
	[499]	= {nLevel_Low = 10, nLevel_High = 30, 	nTime = 60,	szTips = "%s hÖ ngo¹i c«ng l«i s¸t: t¨ng %d ®iÓm"},
};

function sjskill_addskill(nTaskId, nLevel_Low, nLevel_High, nTime, tbTips)
	if ((not nTaskId) or (not sjskill_tbSkill[nTaskId])) then
		return 1;
	end
	if not nLevel_Low then
		nLevel_Low = sjskill_tbSkill[nTaskId].nLevel_Low;
	end
	if not nLevel_High then
		nLevel_Low = sjskill_tbSkill[nTaskId].nLevel_High;
	end
	if not nTime then
		nLevel_Low = sjskill_tbSkill[nTaskId].nTime;
	end
	
	local nLevel	= random(nLevel_Low,nLevel_High);
	AddSkillState(nTaskId, nLevel, 0, floor(18 * nTime));
	
	local szTips	= sjskill_tbSkill[nTaskId].szTips;
	for i = 1, getn(tbTips) do
		if (type(tbTips[i]) == "number") then
			tbTips[i] = floor(tbTips[i] * nLevel);
		end
	end
	Msg2Player(format("Ng­¬i nhËn ®­îc <color=yellow>"..szTips.."<color>", unpack(tbTips)));
end

function add462()
	sjskill_addskill(462, 2, 10, 0.5, {"Nöa gi©y",500});
end

function add463()
	sjskill_addskill(463, 2, 10, 0.5, {"Nöa gi©y", 500});	-- °ëÃëÊÇ12Ö¡?
end

function add464()
	sjskill_addskill(464, 1, 10, 30, {"30 gi©y", 100});
end

function add465()
	sjskill_addskill(465, 1, 10, 30, {"30 gi©y", 100});
end

function add466()
	sjskill_addskill(466, 1, 4, 60, {"1 phót", 10});
end

function add467()
	sjskill_addskill(467, 1, 4, 60, {"1 phót", 10});
end

function add468()
	sjskill_addskill(468, 1, 4, 60, {"1 phót", 10});
end

function add469()
	sjskill_addskill(469, 1, 4, 60, {"1 phót", 10});
end

function add471()
	sjskill_addskill(471, 2, 10, 0.5, {"Nöa gi©y", 500, "Nöa gi©y", 500});
end

function add472()
	sjskill_addskill(472, 1, 10, 30, {"30 gi©y", 100, "30 gi©y", 100});
end

function add472_1()
	sjskill_addskill(472, 1, 10, 60, {"1 phót", 100, "1 phót", 100});
end

function add472_2()
	sjskill_addskill(472, 2, 10, 60, {"1 phót", 500, "1 phót", 500});
end

function add473()
	sjskill_addskill(473, 1, 7, 60, {"1 phót", 10});
end

function add474()
	sjskill_addskill(474, 1, 7, 60, {"1 phót", 10});
end

function add475()
	sjskill_addskill(475, 1, 7, 60, {"1 phót", 10});
end

function add476()
	sjskill_addskill(476, 1, 7, 60, {"1 phót", 10});
end

function add477()
	sjskill_addskill(477, 1, 7, 60, {"1 phót", 10});
end

function add478()
	sjskill_addskill(478, 1, 4, 60, {"1 phót", 10});
end

function add479()
	sjskill_addskill(479, 10, 20, 60, {"1 phót", 10});
end

function add480()
	sjskill_addskill(480, 1, 5, 60, {"1 phót", 10});
end

function add481()
	sjskill_addskill(481, 10, 20, 60, {"1 phót", 10});
end

function add482()
	sjskill_addskill(482, 10, 20, 60, {"1 phót", 10});
end

function add483()
	sjskill_addskill(483, 10, 20, 60, {"1 phót", 10});
end

function add485()
	sjskill_addskill(485, 1, 5, 60, {"1 phót", 10});
end

function add486()
	sjskill_addskill(486, 1, 4, 60, {"1 phót", 10});
end

function add487()
	sjskill_addskill(487, 5, 10, 60, {"1 phót", 10});
end

function add487_1()
	sjskill_addskill(487, 1, 5, 60, {"1 phót", 10});
end

function add488()
	sjskill_addskill(488, 10, 20, 60, {"1 phót", 100});
end

function add489()
	sjskill_addskill(489, 10, 20, 60, {"1 phót", 100});
end

function add490()
	sjskill_addskill(490, 10, 20, 30, {"30 gi©y", 100, "30 gi©y", 100});
end

function add490_1()
	sjskill_addskill(490, 10, 20, 60, {"1 phót", 100, "1 phót", 100});
end

function add493()
	sjskill_addskill(493, 1, 3, 60, {"1 phót", 10});
end

function add495()
	sjskill_addskill(495, 10, 20, 60, {"1 phót", 10});
end

function add496()
	sjskill_addskill(496, 1, 2, 60, {"1 phót", 10});
end

function add498()
	sjskill_addskill(498, 10, 30, 60, {"1 phót", 10});
end

function add499()
	sjskill_addskill(499, 10, 30, 60, {"1 phót", 10});
end