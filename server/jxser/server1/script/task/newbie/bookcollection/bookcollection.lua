

TKID_NEWBIE = 600 			--此任务变量用于存放新手任务是否在进行中
TKID_NEWBIE_LEVEL = 601		--此任务变量用于存放所接任务等级
TKID_NEWBIE_SUCCED = 602 	--此任务变量用于存放新手任务的连续成功数
TKID_NEWBIE_CIRCLE = 603		--此任务变量用于存放新手任务成功完成的轮数
TKID_NEWBIE_BOOK_NUM = 606	--此任务变量用于存放本次需要找的书籍数量
TK_NEWBIE_BUSYTIME = 60		--连续取消任务之后，下一次需要间隔这么长时间才能继续接
TKID_NEWBIE_BONUS = 610		--是否发奖标志
TK_NEWBIE_BOOK=1			--TK_NEWBIE_BOOK=1,表示书籍收集任务

ITEM_NUM_INVALIDATIOM = -1	--给与物品数量与要求数量不符
ITEM_ID_REPETITION = -2		--物品编号相同

BOOK_INVALIDATION = -100	--书籍不符

SUCCEND = 0 				--成功

BookCollection = {
	IsContain = function(self,tasklvl,bookid) --判断书籍编号是否符合任务需求
		for i=1 , getn(self.Books[tasklvl]["Detail"]) do
			if(bookid == self.Books[tasklvl]["Detail"][i][2]) then return 1 end
		end
		return nil
	end,
	GetBookNum = function(self)
		return GetTask(TKID_NEWBIE_BOOK_NUM)
	end,
	GiveTask = function(self,tasklvl) --设置某个等级的书籍收集任务
		SetTask(TKID_NEWBIE,TK_NEWBIE_BOOK)
		SetTask(TKID_NEWBIE_LEVEL,tasklvl)
		local lspan,rspan = self.Books[tasklvl]["Span"][1],self.Books[tasklvl]["Span"][2]
		if(not rspan) then rspan = getn(Book[tasklvl]["Detail"]) end
		SetTask(TKID_NEWBIE_BOOK_NUM,random(lspan,rspan))
		return
	end,
	GetBooks = function(self,books)
		local bookNum = getn(books)
		if(bookNum ~= self:GetBookNum()) then --物品数量不符
			return ITEM_NUM_INVALIDATION
		end
		for i=2 , bookNum do --书籍重复
			if(books[i]==books[i-1]) then return ITEM_ID_REPETITION end
		end
		for i=1 , bookNum do --书籍是否符合收集目的
			if(not self:IsContain(books[i])) then return BOOK_INVALIDATION end
		end
		for i=1, bookNum do --删除物品
			DeleteOverlapping(6,1,books[i],-1) --从叠放物品中删除一个物品
		end
		return SUCCED
	end,
	FinishTask = function(self) --完成任务
		SetTask(TKID_NEWBIE,0) --清除任务标识
		SetTask(TKID_NEWBIE_LEVEL,0) --清除任务等级标识
		SetTask(TKID_NEWBIE_BOOK_NUM,0) --清除收集书籍的数目
		SetTask(TKID_NEWBIE_SUCCED,GetTask(TKID_NEWBIE_SUCCED)+1) --完成任务次数+1
		--如果连续成功完成任务20次，多记录“轮”标识,并清除任务成功数
		if(GetTask(TKID_NEWBIESUCCED) > 19) then
			SetTask(TKID_NEWBIECIRCLE,GetTask(TKID_NEWBIE_CIRCLE)+1)
			SetTask(TKID_NEWBIE_CANCLE,0) --清除任务取消机会
			SetTask(TKID_NEWBIE_SUCCED,0)
		end
		SetTask(TKID_NEWBIE_BONUS,0) --清除奖励标识
	end,

}
