--2007中秋节活动
--by 小浪多多
--2007-09-06
Include("\\script\\event\\zhongqiu2007\\head.lua");

function main()
	if ( check_zhongqiu2007_date() == 0 ) then
		Say(tb_content["sztalk1"],0)
		return 1
	end
	Describe(tb_content["sztalk2"],6,
					 tb_content["szgetlvdou"],
					 tb_content["szgetlianzi"],
					 tb_content["szgetkaoji"],
					 tb_content["szkaozhu"],
					 tb_content["szlihe"],
					 tb_content["szno"])
end

function makeyuebing(nsign)
	SetTaskTemp(TSK_TEMP,nsign)
	SZYUEBING = getTaskItemName()
	Describe(funtalkmake(),2,
					 tb_content["szmakeItemUI"],
					 tb_content["szno"])
end

function makeItemUI()
	if check_level() == 0 then
		Say(tb_content["szlevel"],0)
		return 1
	end
	if check_money() == 0 then
		Say(tb_content["szmoney"],0)
		return 1
	end
	SZYUEBING = getTaskItemName()
	for nkey,tb_item in tb_Mareial[SZYUEBING] do
		if nkey ~= 1 then
				local g = tb_Mareial[SZYUEBING][nkey]["G"]
				local d = tb_Mareial[SZYUEBING][nkey]["D"]
				local p = tb_Mareial[SZYUEBING][nkey]["P"]
				if CalcEquiproomItemCount(g,d,p,-1) < tb_Mareial[SZYUEBING][nkey]["num"] then
					Describe(funtalkmlimit(),2,tb_content["szremake"],tb_content["szno"])
					return 1
				end
		end
	end
	for nkey,tb_item in tb_Mareial[SZYUEBING] do
		if nkey ~= 1 then
				local g = tb_Mareial[SZYUEBING][nkey]["G"]
				local d = tb_Mareial[SZYUEBING][nkey]["D"]
				local p = tb_Mareial[SZYUEBING][nkey]["P"]
				local num = tb_Mareial[SZYUEBING][nkey]["num"]
				ConsumeEquiproomItem(num, g, d, p, -1)
		end
	end
	Pay(tb_Mareial[SZYUEBING][1]["nMoney"])
	--给物品
	local g = tb_Mareial[SZYUEBING][1]["G"]
	local d = tb_Mareial[SZYUEBING][1]["D"]
	local p = tb_Mareial[SZYUEBING][1]["P"]
	for i=1, tb_Mareial[SZYUEBING][1]["num"] do
		local nidx = AddItem(g,d,p,1,0,0)
		Msg2Player(funmsg());
		WriteLog(format("[zhongqiu2007]\t Date:%s\t Account:%s\t Name:%s\t GetItem:%s",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),GetItemName(nidx)));
	end
	SetTaskTemp(TSK_TEMP,0)
end