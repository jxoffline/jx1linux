
-- ====================== 文件信息 ======================

-- 剑侠情缘online 随机任务表格扩展支持头文件
-- Edited by peres
-- 2005/08/12 PM 10:28

-- 只有晚上他们是在一起的
-- 他靠近她，拥抱她
-- 他的手指和皮肤
-- 她看着他，心里柔软而疼痛
-- 她想，她还是爱他
-- 她不想抱怨什么
-- 每天晚上他们都在做爱
-- 她不知道，除了这种接触，她的安全感和温暖，还能从哪里取得
-- 她喜欢那一瞬间。仿佛在黑暗的大海上，漂向世界的尽头

-- ======================================================

-- 表格文件类的支持
Include("\\script\\class\\ktabfile.lua");

-- 继承 KTabFile 并新增新功能
KTabFileEx = inherit(KTabFile, {

	-- 检索表格指定列内的所有行，返回指定数据的行数
	-- 传入参数：data:data 指定的数据
	-- 传入参数：string:col 指定的列标题
	-- 返回值：  int:row    符合条件的行
	getDataRow = function(self, data, col)
		local strType = type(data) -- 获取数据类型
		local i=0;
		
		for i=1, self:getRow() do
			if type=="number" then
				if tonumber(self:getCell(col, i))==data then
					return i;
				end;
			else
				if self:getCell(col, i)==data then
					return i;
				end;	
			end;
		end;
		return 0;
	end,

	-- 从一个表格文件中根据指定的列数取出数据作为一个单维数组
	-- 传入参数：string:Col 列标题
	-- 传入参数：int:nStart 从第几行开始，默认为 3
	-- 返回值：单维的数值数组
	createIntArray = function(self, Col, nStart)
		local aryReturn = {};
		local i=0;
		
		if nStart==nil then nStart=3; end;
		
		for i=nStart, self:getRow() do
			tinsert(aryReturn, 
					tonumber(self:getCell(Col, i))
					);
		end;
		
		return aryReturn;
	end,

	-- 从一个表格文件中根据指定的列数取出数据作为一个单维数组
	-- 传入参数：string:Col 列标题
	-- 传入参数：int:nStart 从第几行开始，默认为 3
	-- 返回值：单维的字符串数组
	createStringArray = function(self, Col, nStart)
		local aryReturn = {};
		local i=0;
		
		if nStart==nil then nStart=3; end;
		
		for i=nStart, self:getRow() do
			tinsert(aryReturn, 
					self:getCell(Col, i)
					);
		end;
		
		return aryReturn;
	end,
	
	-- 根据单列的权重来随机选取出一个行数
	-- 传入参数：string:Col 列标题
	-- 传入参数：int:nStart 从第几行开始，默认为 3
	-- 返回值：  int:row    符合条件的行
	countArrayRate = function(self, col, nStart)
		local nRow = self:getRow();
		local nRandom = 0;
		local nAdd = 0;
		local i=0;
		
		if nStart==nil then nStart=3; end;
		
		for i=nStart, nRow do
			nAdd = nAdd + tonumber(self:gelCell(col, i));
		end;
		
		nRandom = random(1, nAdd);
		
		nAdd = 0;
		
		for i=nStart, nRow do
			nAdd = nAdd + tonumber(self:gelCell(col, i));
			if nAdd>=nRandom then
				return i;
			end;
		end;
		
		return 0;
	end,

});