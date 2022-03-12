



SKILLS=
{
	
	Block ={ --¸ñµ²
		block_rate={{{1,100},{2,100}},{{1,18*3},{2,18*3},{3,18*3},{4,18*3},{20,18*3}}},
		autorescueskill=
		{
			{
				{1,1699*256 + 1},{20,1699*256 + 20},
			},
			{
				{1,1},{20,1}
			},
			{
				{1,90*18*256 + 20},
				{2,80*18*256 + 25},
				{3,70*18*256 + 30},
				{4,60*18*256 + 35},
			}
		},
		
		skill_desc=
			function(nLevel)
				
				local nPercent = 20+(nLevel-1) * 5	
				return format("Sinh lùc thÊp h¬n so víi thêi gian dÞch chuyÓn tøc thêi 25%% <color=orange>%d%%<color>cã sö dông x¸c suÊt tù ®éng<color=orange>%d<color>cÊp[<color=orange>%s<color>]\n",
					nPercent,
					nLevel,
					"X¸c suÊt hãa gi¶I s¸t th­¬ng hoµn toµn")
				 
			end,	
		
	},	
	Teleport = 
	{
		
		autorescueskill=
		{
			{
				{1,997*256 + 1},{20,997*256 + 20},
			},
			{
				{1,1},{20,1}
			},
			{
				{1,90*18*256 + 20},
				{2,80*18*256 + 25},
				{3,70*18*256 + 30},
				{4,60*18*256 + 35},
			}
		},
	},
	Teleport_State =
	{
		allskill_v = 
		{
			{
				{1,1},{2,1},
			},
			{
				{1,4*18},{2,4*18},{3,4*18},{4,4*18},{20,4*18}
			},
			{
				{1,995},
				{2,995},
				
			}
		},
		skill_desc=
			function(nLevel)
				
				local nPercent = 20+(nLevel-1) * 5	
				return format("Sinh lùc thÊp h¬n so víi thêi gian dÞch chuyÓn tøc thêi 25%% <color=orange>%d%%<color>cã sö dông x¸c suÊt tù ®éng<color=orange>%d<color>cÊp[<color=orange>%s<color>]\n",
					nPercent,
					nLevel,
					"DÞch chuyÓn tøc thêi v« h¹n")
				 
			end,
	},
	EnhanceHit=
	{
		autorescueskill=
		{
			{
				{1,1700*256 + 1},{20,1700*256 + 20},
			},
			{
				{1,1},{20,1}
			},
			{
				{1,90*18*256 + 20},
				{2,80*18*256 + 25},
				{3,70*18*256 + 30},
				{4,60*18*256 + 35},
				
			}
		},
		enhancehit_rate={{{1,100},{2,100}},{{1,18*4},{2,18*4},{3,18*4},{4,18*4},{20,18*4}}},
		skill_desc = function(nLevel)
				
				local nPercent = 20+(nLevel-1) * 5	
				return format("Sinh lùc thÊp h¬n so víi thêi gian dÞch chuyÓn tøc thêi 25%% <color=orange>%d%%<color>cã sö dông x¸c suÊt tù ®éng<color=orange>%d<color>cÊp[<color=orange>%s<color>]\n",
					nPercent,
					nLevel,
					"Träng kÝch tuyÖt ®èi")
				 
			end,
	},
	Common=
	{
		skill_mintimepercast_v={{{1,90*18},{2,80*18},{3,70*18},{4,60*18},{15,60*18},}},
		skill_mintimepercastonhorse_v={{{1,90*18},{2,80*18},{3,70*18},{4,60*18},{15,60*18},}},
	}
}


Include("\\script\\skill\\head.lua")