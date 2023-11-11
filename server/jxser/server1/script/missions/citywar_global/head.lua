Include("\\script\\tong\\tong_header.lua");
--七个城市攻守方令牌EventItemID
CardTab = {};
CardTab[1]= 363
CardTab[2]= 362
CardTab[3]= 355
CardTab[4]= 354
CardTab[5]= 367
CardTab[6]= 366
CardTab[7]= 359
CardTab[8]= 358
CardTab[9]= 357
CardTab[10]= 356
CardTab[11]= 365
CardTab[12]= 364
CardTab[13]= 361
CardTab[14]= 360

--令牌价格
CardPrice = 200000;
--回收令牌价格
ReturnCardPrice = 10000;

TIAOZHANLING_LGTYPE = 538					--挑战令站队类型
TIAOZHANLING_LGName = "tiaozhanling"	--挑战令站队队伍名
LGTSK_TIAOZHANLING_COUNT = 1		--挑战令站队记录挑战令个数TaskID

function checkBangHuiLimit()
	local TongName,TongID = GetTongName();
	if TongName == "" or TongName == nil then
		return 0;
	else
		return 1;
	end
end

function checkCreatLG(szlgname)
	local nlid = LG_GetLeagueObj(TIAOZHANLING_LGTYPE,TIAOZHANLING_LGName)
	if nlid == 0 or nlid == nil then
		local nNewLeagueID = LG_CreateLeagueObj()
		LG_SetLeagueInfo(nNewLeagueID, TIAOZHANLING_LGTYPE,TIAOZHANLING_LGName)	--设置社团信息(类型、名称)
		local ret = LG_ApplyAddLeague(nNewLeagueID, "", "") 
		LG_FreeLeagueObj(nNewLeagueID)
	end
end

function checkJoinLG(szlgname)
	local roleid = LG_GetLeagueObjByRole(TIAOZHANLING_LGTYPE,szlgname);
	if roleid == 0 or roleid == nil then
		local nMemberID = LGM_CreateMemberObj() -- 生成社团成员数据对象(返回对象ID)
		--设置社团成员的信息(角色名、职位、社团类型、社团名称)
		LGM_SetMemberInfo(nMemberID,szlgname, 0, TIAOZHANLING_LGTYPE, TIAOZHANLING_LGName) 
		local ret = LGM_ApplyAddMember(nMemberID, "", "") 
		LGM_FreeMemberObj(nMemberID)
	end
end
