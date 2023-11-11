-- ====================== 文件信息 ======================

-- 剑侠情缘网络版越南版 - 2009年生日活动
-- 	1、祝贺雄霸天下版本
-- 	2、新服新手帮助事件
-- 	3、猎取胖豪猪
-- 	4、闯关
-- 文件名　：taskctrl.lua
-- 创建者　：子非魚
-- 创建时间：2009-05-20 08:55:17

-- ======================================================

Include("\\script\\lib\\baseclass.lua")

local tbTask = tbBaseClass:new()

function tbTask:_init(nstartdate, nenddate)
	self.nstartdate	= nstartdate;
	self.nenddate	= nenddate;
	
	self.nmaxexpfromzhuhe	= 15e5;
	self.nmaxexpfromshoulie	= 9e5;
	self.nmaxexpfromchuang	= 10e5;	-- ？？未定
	
	self.tsk_version		= 1909;	-- 活动版本号
	self.tsk_jinnangsj		= 1910;	-- 是否领取过锦囊事件
	self.tsk_zhuhe_maxexp	= 1911;	-- 
	self.tsk_zhuhe_curcnt	= 1912;	-- 使用新版鼓、新版旗数量上限：500（使用龙凤尾后增加500）
	self.tsk_zhuhe_curexp	= 1913;	-- 祝贺活动经验上限：42亿
	self.tsk_shoulie_cnt	= 1914;	-- 每天狩猎豪猪的次数记录byte1:日期；byte2:次数
	self.tsk_shoulie_curexp	= 1863;	-- 参加狩猎活动经验上限：9亿
	self.tsk_toll_task		= 1864;	-- 	byte1~2：消灭500个金国奸细\开100个箱子\杀死2个刀妖

	self.tsk_toll_cg_state		= 2605;		-- 时间的挑战赛，玩家接受这个任务的状态，0表示没有接，1表示已经接了
	self.tsk_toll_cg_passcount	= 2606;		-- 时间的挑战赛，玩家的过关数
	self.tsk_toll_explmt		= 2607;		-- 闯关活动的经验上限
	
	self.tsk_msg_curtsk			= 2608;		-- 玩家当前所接的信使任务的index
	self.tsk_msg_date			= 2608;		-- 每个信使任务每天只能作一次
	self.tsk_msg_needcount		= 2617;		-- 每个信使任务完成所需要的数量
			
	self.item_expiredtime1	= 20090720;
	self.item_expiredtime2	= 20090728;
	
end

function tbTask:reset_task()
	local ncurdate = tonumber(GetLocalDate("%Y%m%d"))
	if self.nstartdate <= ncurdate and ncurdate <= self.nenddate then
		if (GetTask(self.tsk_version) ~= self.nstartdate) then
			SetTask(self.tsk_version, self.nstartdate);
			
			SetTask(self.tsk_jinnangsj, 0);
			
			SetTask(self.tsk_shoulie_cnt, 0);
			SetTask(self.tsk_shoulie_curexp, 0);
			
			SetTask(self.tsk_toll_award, 0);
			SetTask(self.tsk_toll_curexp, 0);
			SetTask(self.tsk_toll_task, 0);
			
			SetTask(self.tsk_zhuhe_curcnt, 0);
			SetTask(self.tsk_zhuhe_maxexp, self.nmaxexpfromzhuhe);
			SetTask(self.tsk_zhuhe_curexp, 0);
			
			SetTask(self.tsk_toll_explmt, 0);
			
			SetTask(self.tsk_toll_cg_state, 0);	-- 闯关（时间挑战赛）玩家接受这个任务的状态
			SetTask(self.tsk_toll_cg_passcount, 0);
			
			for i = 1, 8 do
				SetTask(self.tsk_msg_date + i, 0);
			end
			SetTask(self.tsk_msg_curtsk, 0)
			SetTask(self.tsk_msg_needcount, 0);
		end
	end
		
end

-- 是否已经领取过锦囊事件：1（领取）；0（未领取）
function tbTask:if_taked_jinnang()
	self:reset_task();
	return GetTask(self.tsk_jinnangsj);
end

-- 获得今天参加狩猎的次数
function tbTask:get_shoulie_count()
	self:reset_task();
	local nvalue = GetTask(self.tsk_shoulie_cnt);
	local nlastdate = GetByte(nvalue, 1);
	local ncount = GetByte(nvalue, 2);
	local ncurdate = tonumber(GetLocalDate("%d"));
	
	if (nlastdate ~= ncurdate) then
		nlastdate = ncurdate;
		nvalue = SetByte(nvalue, 1, nlastdate);
		
		ncount = 0;
		nvalue = SetByte(nvalue, 2, ncount);
		
		SetTask(self.tsk_shoulie_cnt, nvalue);
	end
	
	return ncount;
end

-- 增加当前参加狩猎的次数
function tbTask:add_shoulie_count(n_addvalue)
	local nvalue = GetTask(self.tsk_shoulie_cnt);
	local nlastdate = GetByte(nvalue, 1);
	local ncount = GetByte(nvalue, 2);
	ncount = ncount + n_addvalue;
	
	if (ncount > 255) then
		return 0;
	end
	
	nvalue = SetByte(nvalue, 2, ncount);
	SetTask(self.tsk_shoulie_cnt, nvalue);
	return 1;
end

-- 获得指定TaskID值
function tbTask:get_task(n_taskid)
	self:reset_task();
	return GetTask(n_taskid);
end

-- 设置指定TaskID值
function tbTask:set_task(n_taskid, n_value)
	return SetTask(n_taskid, n_value);
end

-- 增加指定TaskID值
function tbTask:add_task(n_taskid, n_addvalue)
	return self:set_task(n_taskid, self:get_task(n_taskid) + n_addvalue);
end

-- 增加能够使用新版旗新版鼓上限
function tbTask:add_zhuhe_maxexp()
	return self:add_task(self.tsk_zhuhe_maxexp, self.nmaxexpfromzhuhe);
end


function tbTask:get_toll_aimcount(n_type)
	local n_value = GetTask(self.tsk_toll_task);
	local n_count = 0;
	local n_bitmod = 1;
	
	if (n_type == 1) then
		n_count = mod(n_value, 2^9);
	elseif(n_type == 2) then
		n_count = mod(floor(n_value, 2^10), 2^10);
		n_bitmod = 2^10;
	elseif(n_type == 3) then
		n_count = floor(n_value, 2^10*2^10);
		n_bitmod = 2^10 * 2^10;
	else
		return nil;
	end
	
	return n_count;
end


function tbTask:add_toll_aimcount(n_type)
	local n_value = GetTask(self.tsk_toll_task);
	local n_count = 0;
	local n_bitmod = 1;
	if (n_type == 1) then
		n_count = mod(n_value, 2^9);
	elseif(n_type == 2) then
		n_count = mod(floor(n_value, 2^10), 2^10);
		n_bitmod = 2^10;
	elseif(n_type == 3) then
		n_count = floor(n_value, 2^10*2^10);
		n_bitmod = 2^10 * 2^10;
	else
		return nil;
	end
	
	return SetTask(self.tsk_toll_task, n_value + 1*n_bitmod);
end


function tbTask:clear_toll_aimcount(n_type)
	local n_value = GetTask(self.tsk_toll_task);
	local n_count = 0;
	local n_bitmod = 1;
	
	if (n_type == 1) then
		n_count = mod(n_value, 2^9);
	elseif(n_type == 2) then
		n_count = mod(floor(n_value, 2^10), 2^10);
		n_bitmod = 2^10;
	elseif(n_type == 3) then
		n_count = floor(n_value, 2^10*2^10);
		n_bitmod = 2^10 * 2^10;
	else
		return nil;
	end
	
	return SetTask(self.tsk_toll_task, n_value - n_count*n_bitmod);
end


function tbTask:get_toll_award(n_gene, n_type)
	return GetBit(GetTask(self.tsk_toll_award), (n_gene - 1)*3+n_type);
end

function tbTask:set_toll_award(n_gene, n_type, n_b)
	local n_value = GetTask(self.tsk_toll_award);
	n_value = SetBit(n_value, (n_gene - 1)*3+n_type, n_b);
	return SetTask(self.tsk_toll_award, n_value);
end

function tbTask:get_toll_isacc(n_gene, n_type)
	return GetBit(GetTask(self.tsk_toll_award), (n_gene - 1)*3+n_type+8);
end

function tbTask:set_toll_award(n_gene, n_type, n_b)
	local n_value = GetTask(self.tsk_toll_award);
	n_value = SetBit(n_value, (n_gene - 1)*3+n_type+8, n_b);
	return SetTask(self.tsk_toll_award, n_value);
end

tbBirthday0905_tbTasktCtrl = tbTask;
