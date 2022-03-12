--制作物品lib
--by 小浪多多
--2007-09-06
Include("\\script\\event\\newyear_2008\\zaozongbing\\head.lua");
Include( "\\script\\task\\system\\task_string.lua" );

function main()
	local tbtemp = tbclassname.tb_content
	if ( tbclassname:check_event_date() == 0 ) then
		Say(tbtemp.sztalk1,0)
		return 1
	end
	
	local arytalk = {}
	arytalk[1] = 	tbtemp.sztalk2
	for i=1,tbtemp.nselectsum do
		local szselect = format("szselect%d",i) 
		arytalk[getn(arytalk)+1] = tbtemp[szselect]
	end
	arytalk[getn(arytalk)+1] = tbtemp.szno
	CreateTaskSay(arytalk)
	
end

function tbclassname:getmakeitemsign(nsign)
	Describe(self:funtalkmake(nsign),2,format(self.tb_content.szmakeItemUI,nsign),self.tb_content.szno)
end

function tbclassname:makeItemUI(nsign)
	if self:check_level() == 0 then
		Say(self.tb_content.szlevel,0)
		return 1
	end
	if self:check_money(nsign) == 0 then
		Say(self.tb_content.szmoney,0)
		return 1
	end
	if self:check_pay() == 0 then
		Say(self.tb_content.szpay,0)
		return 1
	end
	if self:checkFreeCount(1) == 0 then
		Say(self.tb_content.szitemfree,0)
		return 1		
	end
	local szselect = self:getTaskItemName(nsign)
	for nkey,tb_item in self.tb_Mareial[szselect] do
		if nkey ~= 1 then
				local g = self.tb_Mareial[szselect][nkey].G
				local d = self.tb_Mareial[szselect][nkey].D
				local p = self.tb_Mareial[szselect][nkey].P
				if CalcEquiproomItemCount(g,d,p,-1) < self.tb_Mareial[szselect][nkey].num then
					Describe(self:funtalkmlimit(nsign),2,self.tb_content.szremake,self.tb_content.szno)
					return 1
				end
		end
	end
	for nkey,tb_item in self.tb_Mareial[szselect] do
		if nkey ~= 1 then
				local g = tb_item.G
				local d = tb_item.D
				local p = tb_item.P
				local num = tb_item.num
				ConsumeEquiproomItem(num, g, d, p, -1)
		end
	end
	Pay(self.tb_Mareial[szselect][1].nMoney)
	--给物品
	local g = self.tb_Mareial[szselect][1].G
	local d = self.tb_Mareial[szselect][1].D
	local p = self.tb_Mareial[szselect][1].P
	local szname = self.tb_Mareial[szselect][1].szname
	for i=1, self.tb_Mareial[szselect][1].num do
		local nidx = AddItem(g,d,p,1,0,0)
		Msg2Player(self:funmsg(nsign));
		WriteLog(format("[%s]\t Date:%s\t Account:%s\t Name:%s\t GetItem:%s",self.TITLE,GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),szname));
	end
end