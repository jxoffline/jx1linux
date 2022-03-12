
-- ====================== 文件信息 ======================

-- 剑侠情缘网络版之越南版一新增南岳镇-->黑沙洞

-- Edited by 子非魚
-- 2008/06/26 15:51

-- 在南岳镇东边洞口增加trap点，前往黑沙洞
-- ======================================================


function add_heisha_entertrap()
	local tb_trappos = {
				{xpos=	55584	,ypos=	100736	},
				{xpos=	55616	,ypos=	100736	},
				{xpos=	55648	,ypos=	100736	},
				{xpos=	55584	,ypos=	100768	},
				{xpos=	55616	,ypos=	100768	},
				{xpos=	55648	,ypos=	100768	},
				{xpos=	55616	,ypos=	100800	},
				{xpos=	55648	,ypos=	100800	},
				{xpos=	55680	,ypos=	100800	},
				{xpos=	55648	,ypos=	100832	},
				{xpos=	55680	,ypos=	100832	},
				{xpos=	55712	,ypos=	100832	},
				{xpos=	55648	,ypos=	100864	},
				{xpos=	55680	,ypos=	100864	},
				{xpos=	55712	,ypos=	100864	},
				{xpos=	55680	,ypos=	100896	},
				{xpos=	55712	,ypos=	100896	},
				{xpos=	55744	,ypos=	100896	},
				{xpos=	55712	,ypos=	100928	},
				{xpos=	55744	,ypos=	100928	},
	};
	local sz_trapscript = "\\script\\两湖区\\南岳镇\\trap\\nanyuezhentoheishadong.lua";
	local n_mapid = 54;							-- 南岳镇
	local n_mapidx = SubWorldID2Idx(n_mapid);	-- 地图索引
	
	if (n_mapidx >= 0) then
		for i = 1, getn(tb_trappos) do
			AddMapTrap(n_mapid, tb_trappos[i].xpos, tb_trappos[i].ypos, sz_trapscript);
		end
	end
end
