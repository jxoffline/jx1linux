-- teamhead.lua 队伍定义的头文件
-- By: Dan Deng(2003-12-30)

function OtherPlayer(Player1Index, Fun, param1, param2)		-- 在别人身上扏行脚本函数
	OldPlayer=PlayerIndex;
	PlayerIndex=Player1Index;
	Result = Fun(param1, param2)
	PlayerIndex = OldPlayer;
	return Result;
end
