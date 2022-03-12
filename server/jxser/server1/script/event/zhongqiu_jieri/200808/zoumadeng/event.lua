Include("\\script\\event\\zhongqiu_jieri\\200808\\timectrl.lua")
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\lib\\awardtemplet.lua")

function zhongqiu0808_zoumadeng_buy()
	local tbSay = 
	{
		"<dec><npc>Mua 1 nÕn ®á cÇn 5000 l­îng, ng­¬i ®ång ý mua chø?",
		"X¸c nhËn/zhongqiu0808_zoumadeng_buy_ok",
		"Hñy bá /OnExit"
	}
	CreateTaskSay(tbSay)
end

function zhongqiu0808_zoumadeng_buy_ok()
	local tbItem =	{szName="NÕn ®á", tbProp={6, 1, 1820, 1, 0, 0}}
	local nJxb = 5000
	if Pay(5000) == 1 then
		tbAwardTemplet:GiveAwardByList(tbItem,"Mua nÕn ®á" )
	else
		Say("Ng©n l­îng trªn ng­êi kh«ng ®ñ!", 0)
	end
end