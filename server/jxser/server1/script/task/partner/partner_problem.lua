-------------------------------------------------------------------------
-- FileName		:	partner_problem.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-07-07 11:28:15
-- Desc			:  	同伴系统问题集合
-------------------------------------------------------------------------
IncludeLib( "FILESYS" );
Include("\\script\\task\\newtask\\newtask_head.lua") --调用 nt_getTask 同步变量到客户端的类
TabFile_Load("\\settings\\task\\partner\\problem\\partner_allproblem.txt","allproblem") --调用问题和答案
Include("\\script\\task\\partner\\partner_head.lua") --包含了图象调用



--pronumb：  	 回答问题需要答对的数目
--numbmin：   	回答问题的题号最小值
--numbmax：   	回答问题的题号最大值
--numblength：	回答问题时允许出错的最大次数
--taskvalue： 	回答问题后设置字节开关的相关变量
--taskbyte：    回答问题满足答对数目要求后设置字节开关的字节位数
--prblemchange  为1时，则在问题完全答对的时候进行回调 
--prblemchange  为2时，则在问题回答没有达到要求时进行回调
--prblemchange  为3或者任意>=3 的数字，则问题不会在规定次数内中断
--prblemchange  为0时则回答错一次就中断
--keepon：      回调函数所在数组partner_keeponproblem的数组位置

partner_answer =
{
[1]={2,3,4,6,8,16,19,25,29,30,36,42,45,51,55,59,62,67,69,72,80,82,84,88,90,91,95,117},
[2]={5,10,12,13,17,20,22,23,26,27,31,34,38,41,46,48,49,50,52,56,60,61,64,71,77,81,87,86,93,94,96,98,99,102,106,109,110,111,113,115,116,118},
[3]={1,7,9,11,14,15,18,21,24,28,32,33,35,37,39,40,43,44,47,53,54,57,58,63,65,66,68,70,73,74,75,76,78,79,83,85,89,92,97,100,101,103,104,105,107,108,112,114}
}

partner_keeponproblem ={} 

function partner_edu(pronumb,numbmin,numbmax,numblength,taskvalue,taskbyte,problemchange,keepon)   
	nt_setTask(1233,0)                     --去除掉答对次数
	SetTaskTemp(182,0)         			   --临时变量182记录问题的题号	
	SetTaskTemp(183,0)         			   --临时变量183记录问题的答对次数			
	SetTaskTemp(184,0)         			   --临时变量184记录问题的题号最小值			
	SetTaskTemp(185,0)         			   --临时变量185记录问题的题号最大值			
	SetTaskTemp(186,0)        			   --临时变量186记录问题的回答次数			
	SetTaskTemp(187,0)         			   --临时变量187记录问题的开关任务变量			
	SetTaskTemp(188,0)         			   --临时变量188记录问题的开关字节		
	SetTaskTemp(190,0) 	
	SetTaskTemp(191,0) 
	partner_eduproblem(pronumb,numbmin,numbmax,numblength,taskvalue,taskbyte,problemchange,keepon) 
end

function partner_eduproblem(pronumb,numbmin,numbmax,numblength,taskvalue,taskbyte,problemchange,keepon)   
	
	if ( numblength == 0 ) then
		Msg2Player("对不起，你已经达到了回答问题错误的上限，请重新来过。")
		nt_setTask(1233,0)                                                --达到答错极限，去除掉答对次数
		if (keepon ~= nil and keepon >= 1 and keepon <= getn(partner_keeponproblem)) then
			partner_keeponproblem[keepon](0)
		end
		return 
	end
	
	local partner_problemnumber = random(numbmin,numbmax)                 --在提供的题号范围内随机出题
	
	SetTaskTemp(182,partner_problemnumber)         --临时变量182记录问题的题号	
	SetTaskTemp(183,pronumb)         			   --临时变量183记录问题的答对次数			
	SetTaskTemp(184,numbmin)         			   --临时变量184记录问题的题号最小值			
	SetTaskTemp(185,numbmax)         			   --临时变量185记录问题的题号最大值			
	SetTaskTemp(186,numblength)        			   --临时变量186记录问题的回答次数			
	SetTaskTemp(187,taskvalue)         			   --临时变量187记录问题的开关任务变量			
	SetTaskTemp(188,taskbyte)         			   --临时变量188记录问题的开关字节		
	SetTaskTemp(190,problemchange) 	               --临时变量190记录问题答对答错时的回调函数	
	SetTaskTemp(191,keepon)                        --临时变量191记录如果回调的话，回调函数所在数组的位置
	partner_p(partner_problemnumber) 	
		
end

function partner_p(partner_problemnumber) 	
	local nRowCount = TabFile_GetRowCount("allproblem")
	for i=1,nRowCount do 
		local problem_id = tonumber( TabFile_GetCell( "allproblem" ,i , "problemid" ))
		if ( problem_id == partner_problemnumber ) then
			local problem_content = TabFile_GetCell( "allproblem" ,i , "problemcontent")
			local problem_a = TabFile_GetCell( "allproblem" ,i , "channelA")
			local problem_b = TabFile_GetCell( "allproblem" ,i , "channelB")
			local problem_c = TabFile_GetCell( "allproblem" ,i , "channelC")
			Describe(DescLink_TongBanJiaoYu.."："
			..problem_content.."?<enter>"
			.."A："..problem_a.."<enter>"
			.."B："..problem_b.."<enter>"
			.."C："..problem_c,3,
			"A/partner_problema",
			"B/partner_problemb",
			"C/partner_problemc")
		end
	end
end

function partner_problema()
	partner_problem(1);
end

function partner_problemb()
	partner_problem(2);
end

function partner_problemc()
	partner_problem(3);
end

function partner_problem(nAnswer)
	local j = 1
	local Uworld186 = GetTaskTemp(186)                                       
	SetTaskTemp(186,Uworld186-1) 											  --允许回答的次数-1
	
	for i=1,getn(partner_answer[nAnswer]) do                                        --在题库A中选择题号
		if ( GetTaskTemp(182) == partner_answer[nAnswer][i] ) then                    --如果题库A的正确答案的题好有与给出题号一致的
			j = j+1
			local Uworld1233 = nt_getTask(1233)
			nt_setTask(1233,Uworld1233+1)                                     --给答对题数+1
			Msg2Player("恭喜您答对了这道题目！")
			
			if (   GetTaskTemp(183)  == nt_getTask(1233) ) then				  --当玩家在允许次数内答对了相应次数则	  
				if ( GetTaskTemp(187) ~= 0 ) then							  --如果任务变量为0，则不设置完成状态	
					nt_setTask(GetTaskTemp(187),SetBit(GetTask(GetTaskTemp(187)),GetTaskTemp(188),1))  --给传入任务变量的相应字节置为完成状态
				end
				Msg2Player("恭喜你回答正确的题目数量已达到了要求！")
				
				local nProblemIdx = GetTaskTemp(191)
				if (nProblemIdx ~= nil and nProblemIdx >= 1 and nProblemIdx <= getn(partner_keeponproblem)) then
					partner_keeponproblem[nProblemIdx](1)
				end	
				
				return 10
			end
		end
	end
	if ( j == 1) then
		Msg2Player("对不起，你答错了。")
		if ( GetTaskTemp(190) == 0 ) then
			return
		end
	end
	partner_eduproblem(GetTaskTemp(183),GetTaskTemp(184),GetTaskTemp(185),GetTaskTemp(186),GetTaskTemp(187),GetTaskTemp(188),GetTaskTemp(190),GetTaskTemp(191))   	
end