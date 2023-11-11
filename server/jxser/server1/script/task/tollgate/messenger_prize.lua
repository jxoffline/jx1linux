-------------------------------------------------------------------------------------------------------------------------------------------
-- FileName		:	messenger_prize.lua                            ----O--------O----
-- Author		:	xiaoyang										       ^
-- CreateTime	:	2005-04-21 10:31:14								   ----------
-- Desc			:   关卡任务的奖励脚本
------------------------------------------请注意：在没有弄清楚此指令的调用方式前，切记不要使用，请先询问相关人员，谢谢-------------------------

Include("\\script\\task\\newtask\\newtask_head.lua")
IncludeLib( "FILESYS" );
TabFile_Load( "\\settings\\task\\tollgate\\messenger\\tollgate_allprize.txt" , "Tollgateprize");	 --获得奖励表

	prizeary ={}
	for i=2,TabFile_GetRowCount("Tollgateprize") do
		val = tonumber(TabFile_GetCell("Tollgateprize", i , "prize_item" ))
		if( prizeary[val] == nil ) then
			prizeary[val] = {};
		end
		valcount = getn(prizeary[val]);
		prizeary[val][valcount+1] = i;
	end

--在这里一共有五个表格，分别对应prize_level的五个等级1，2，3，4，5。
--x                获得奖品概率中的除数
--y	               获得奖品概率中的被除数
--prize_itemindex  获得奖励物品的倾向，1为一般奖励，2为带孔装备，3为玄晶矿石，4为小黄金装备，5为大黄金装备，6为奖励大随机
--prize_adventive  获得奖励物品的偶然因素，从0-100，0为没有偶然。

function messenger_giveprize(x,y,prize_itemindex,prize_adventive)

--进行随机运算，得到随机数字数组和奖励数字数组，对两个数组进行比较，若随即数组中有符合奖励数字要求的，那么发放奖励参数置1
	local prize_number ={}
	local prize_right = {}
	for	  i = 1,x do
		 prize_number[i] = random(1,y)          
		 prize_right[i] = random(1,y)		   --根据提供的x，y的几率，类似于x=4,y=10000,那么几率为4%，那么在10000范围内随机4个数字
	end
	
	for i = 1,x do 
		for j = 1,x do 
			if  (prize_number[i] == prize_right[j]) then
				prize_yes=1
			end
		end
	end
	
--计算偶然因素
	if ( prize_adventive ~= 0 ) then 
		for i=1,prize_adventive do
			prize_denger[i] = random(1,100)
		end
		for i=1,prize_adventive do
			if ( prize_denger[i] == prize_adventive ) then
				prize_itemindex = 6
			end
		end
	end
	
	local prize_givepeople = messenger_group() --判断玩家是否组队,如果组队则返回队长的index
	local prize_mapx,prize_mapy,prize_mapid = GetPos() --获得当前玩家所在位置
	local prize_yes = 0                        --判断玩家是否有资格进入选择表
		
--发放奖励
	if ( prizeary[prize_itemindex] == nil ) then
	    return
	end
	
	prize_givenumber = random(getn(prizeary[prize_itemindex]))
	prize_givefinish = prizeary[prize_itemindex][prize_givenumber]
	prize_numberone = tonumber( TabFile_GetCell( "Tollgateprize" ,prize_givefinish , 3 ))
	prize_numbertwo = tonumber( TabFile_GetCell( "Tollgateprize" ,prize_givefinish , 4 ))
	prize_numberthree = tonumber( TabFile_GetCell( "Tollgateprize" ,prize_givefinish , 5 ))
	prize_numberfour = tonumber( TabFile_GetCell( "Tollgateprize" ,prize_givefinish , 6 ))
	prize_numberfive = tonumber( TabFile_GetCell( "Tollgateprize" ,prize_givefinish , 7 ))
	prize_numbersix = tonumber( TabFile_GetCell( "Tollgateprize" ,prize_givefinish , 8 ))
	prize_numberseven = tonumber( TabFile_GetCell( "Tollgateprize" ,prize_givefinish , 9 ))
		
	if ( tonumber( TabFile_GetCell( "Tollgateprize" ,prize_givefinish , "prize_Quality" )) == 1 ) then
		DropItemEx(prize_mapid,prize_mapx,prize_mapy,prize_givepeople,4,0,1,0,prize_numberone,0,0,0,0,0)	
	else 
		DropItem(prize_mapid,prize_mapx,prize_mapy,prize_givepeople,prize_numberone,prize_numbertwo,prize_numberthree,prize_numberfour,prize_numberfive,prize_numbersix,prize_numberseven) 
	end	
	
	
end

function messenger_group()
	local nOldPlayerIndex = PlayerIndex
	local nPreservedPlayerIndex = PlayerIndex
	local nMemCount = GetTeamSize()
	local myMemberTask
	local myChangeMember = 0
	
	if (nMemCount == 0 ) then
		return nPreservedPlayerIndex
		
	else
		for i = 1, nMemCount do
			PlayerIndex = GetTeamMember(i)
			if ( IsCaptain() == 1) then
				nPreservedPlayerIndex = PlayerIndex;
				PlayerIndex = nOldPlayerIndex;
				return nPreservedPlayerIndex
				
			end
		end
		PlayerIndex = nOldPlayerIndex;
		return 0;
	end
end



