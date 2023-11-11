Include("\\script\\missions\\zhaojingling\\head.lua")
Include("\\script\\lib\\awardtemplet.lua")

local tbAward = 
{
	[1]={nExp_tl=1,nRate = 50.0,nCount = 40000,},
	[2]={nExp_tl=1,nRate = 14.0,nCount = 80000,},
	[3]={nExp_tl=1,nRate = 5.0,nCount = 150000,},
	[4]={nExp_tl=1,nRate = 1.0,nCount = 300000,},
	[5]={szName="Gia Tèc hoµn",tbProp={6,1,2794,1,0,0},nRate = 5.0,},
	[6]={szName="HuyÔn Hu©n H·m TÜnh",tbProp={6,1,2795,1,0,0},nRate = 5.0,},
	[7]={szName="BÉy lµm chËm",tbProp={6,1,2796,1,0,0},nRate = 5.0,},
	[8]={szName="Thiªn L«i Ngäc",tbProp={6,1,2797,1,0,0},nRate = 5.0,},
	[9]={szName="Hµn Phong Ngäc",tbProp={6,1,2798,1,0,0},nRate = 5.0,},
	[10]={szName="§én §Þa phï ",tbProp={6,1,2799,1,0,0},nRate = 5.0,},	
}

function main()
	local nNpcIndex = GetLastDiagNpc()
	if (GetNpcParam(nNpcIndex, 1) ~= 1) then
		SetNpcParam(nNpcIndex, 1, 1)
		local nCount = GetTask(TSK_COUNT_ONETIME)
		SetTask(TSK_COUNT_ONETIME, nCount + 1)
		tbAwardTemplet:GiveAwardByList(%tbAward, "T×m th¸yMéc Nh©n nhËn ®­îc phÇn th­ëng")
		DelNpc(nNpcIndex)
	end
end

function OnTimer(nNpcIndex)
	DelNpc(nNpcIndex)
end