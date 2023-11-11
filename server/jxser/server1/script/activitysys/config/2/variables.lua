Include("\\script\\activitysys\\config\\2\\head.lua")
EVENT_LOG_TITLE		= "ChristmasDay2012"
TSK_TREE_LIMIT		= 1
MAX_TREE_LIMT		= 10
TSK_CLICK_FAIRY		= 2
MAX_CLICK_FAIRY		= 10
BIG_TREE_ID		= 1879
BIG_TREE_POS		= {{934,1581,3220}}
-- BIG_TREE_NAME = "¥Û •µÆ ˜"
BIG_TREE_NAME = " "
BIG_TREE_SCRIPT = "\\script\\activitysys\\config\\2\\bigtree_dialogue.lua"

TSK_CAMP_FLAG = 3
TSK_COUNT = 4
TSK_ROUND = 5
TSK_POINT = 6
MAX_COUNT = 2
TSK_SNOW_BALL = 7
MAX_SNOW_BALL = 20
TSK_GET_SNOW_BALL = 8

TSK_CANDY_LIMIT = 9
MAX_CANDY = 10

END_DATE = floor(pActivity.nEndDate/10000)

ITEM_SNOW_BALL = {szName="Qu∂ c«u tuy’t", tbProp={6,1,3387,1,0,0}, nExpiredTime=END_DATE, nBindState=-2}
ITEM_CHRISTMAS_CANDY = {szName="K—o chi’c gÀy", tbProp={6,1,3388,1,0,0},nExpiredTime=END_DATE}
tbCandyAward = {
	{nExp_tl = 10000000,},
	{
		[1]={szName="Th› Luy÷n Thi’p", tbProp={6,1,2317,1,0,0}, nRate=30},
		[2]={szName="Vi™m ß’ L÷nh", tbProp={6,1,1617,1,0,0}, nRate=30},
		[3]={szName="S∏t ThÒ l÷nh", tbProp={6,1,399,1,0,0}, nRate=40},
	}
}

ITEM_CHRISTMAS_APPLE = {szName="Qu∂ Gi∏ng Sinh",tbProp={6,1,3389,1,0,0},nExpiredTime=END_DATE}
tbAppleAward = {
	{nExp_tl = 20000000,},
	{
		[1]={szName="Th› Luy÷n Thi’p", tbProp={6,1,2317,1,0,0}, nRate=30},
		[2]={szName="Vi™m ß’ L÷nh", tbProp={6,1,1617,1,0,0}, nRate=30},
		[3]={szName="S∏t ThÒ l÷nh", tbProp={6,1,399,1,0,0}, nRate=40},
	}
}

tbSB_Award = {
	["UseSnowBall"] = {
		{nExp = 1000000},
	},
	
	["KillSnowman"] = {
		{nExp = 1},
	},
	
	["Win"] = {
		{nExp = 10000000},
	},
	
	["Lost"] = {
		{nExp = 5000000},
	},
}