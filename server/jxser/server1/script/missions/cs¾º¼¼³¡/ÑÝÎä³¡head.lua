
--退出游戏后的重生点ID,也就是报名的那个地方吧
CS_RevId = 80;
CS_RevData = 36;

--离开本次游戏后的位置worldid, x, y,一般就是报名点
--CS_LeavePos = {20, 3546, 6226};

--会场外的位置
CS_OuterPos = {209, 1548, 3297};


--加入双方阵营时的位置
CS_CampPos0 = {209, 1631, 3203};   	--白色
CS_CampPos1 = {209, 1608, 3167}; 	--黄色
CS_CampPos2 = {209, 1674, 3246}; 	--红色


--游戏的每一阵营的最大人数
MAX_MEMBER_COUNT = 20;



MS_CAMP1 = 1; --双方的阵营号
MS_CAMP2 = 2;

MS_SIGN_MONEY = 5000; --报名费
MS_WIN_MONEY = 3000; -- 每次胜利时，获得的收入


function GetLeavePos()
	return GetTask(300), GetTask(301), GetTask(302);
end;
