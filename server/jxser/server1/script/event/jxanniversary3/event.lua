--剑网三周年活动 礼官脚本
--使用材料 白米粉，白砂糖，新鲜的豆沙，新鲜的红枣，制作成豆沙寿桃或枣泥寿桃
--每天仅能制作3个寿桃
--限制 80级及以上 充值用户参加

Include("\\script\\event\\jxanniversary3\\head.lua");

function OnEventJxAnniversary()
	CreateTaskSay({"<dec><npc>呵,弹指一挥间，<sex>已在江湖闯荡这么长时日了。现在适逢剑侠情缘三周年盛事大典，凡是级别在80级以上的充值用户都可在2006年9月19日~9月26日期间，到四大风景区(华山、青城山、武夷山、点苍山)打怪收集白米粉，白砂糖，豆沙，红枣等材料，老夫可用这些材料为<sex>制作增加经验值的“豆沙寿桃”和提高练级获得经验值一倍的“枣泥寿桃”。另外四大风景区蓝怪掉落的“神秘礼盒”也将给<sex>带来更多意外的收获哦！呵呵，事不宜迟，<sex>快去快回吧。",
	"我想制作寿桃/JxAn_want2makeshoutao",
	"我想去“剑网三周年庆典活动”地点/JxAn_go2eventplace",
	"我只是来看看/OnCancel"});
end;

function JxAn_want2makeshoutao()
	CreateTaskSay({"<dec><npc>呵呵，<sex>这么快就找齐材料了。食用“豆沙寿桃”可立即增长300w经验，食用“枣泥寿桃”可获得8小时经验双倍时间，不知少侠需要老夫制作哪种寿桃呢？",
	"我想制作“豆沙寿桃”/#JxAn_makeshoutao(1)",
	"我想制作“枣泥寿桃”/#JxAn_makeshoutao(2)",
	"我只是来看看/OnCancel"});
end;

function JxAn_makeshoutao(nShoutaoIndex)
	if (JxAn_CouldMakeShoutao() ~= 1) then
		return -1;
	end;
	
	CreateTaskSay({tb_JXAN_SHOUTAOKIND[nShoutaoIndex].szstart.."你准备好了么？",
	"是的，我想现在制作/#JxAn_doneshoutao("..nShoutaoIndex..")",
	"不，我还要准备一下/OnCancel"});
end;

function JxAn_doneshoutao(nShoutaoIndex)
	local tbResource = tb_JXAN_SHOUTAOKIND[nShoutaoIndex].resource
	local bp = 1;
	for i = 1, getn(tbResource) do
		if (CalcEquiproomItemCount(tbResource[i][1],tbResource[i][2],tbResource[i][3],-1) < tbResource[i][4]) then
			bp = 0;
			break;
		end;
	end;
	if (bp == 0) then
		CreateTaskSay({"<dec><npc><sex>身上好像没带够所需的材料吧？别看我年纪大了,眼神可好着哩。", "不好意思，我再去准备一下/OnCancel"});
		return -1;
	end;
	for i = 1, getn(tbResource) do
		ConsumeEquiproomItem(tbResource[i][4], tbResource[i][1], tbResource[i][2], tbResource[i][3], -1);
	end;
	local tshoutao = tb_JXAN_SHOUTAOKIND[nShoutaoIndex].shoutao
	AddItem(tshoutao[1],tshoutao[2],tshoutao[3],1,1,1);
	SetTask(TASKID_JXAN_SHOUTAONUM, GetTask(TASKID_JXAN_SHOUTAONUM) + 1);
	CreateTaskSay({tb_JXAN_SHOUTAOKIND[nShoutaoIndex].szend.."请大侠快快品尝吧!", "收下礼物/OnCancel"});
end;

function JxAn_CouldMakeShoutao()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	local myDate = GetTask(TASKID_JXAN_SHOUTAODATE);
	local myNum = GetTask(TASKID_JXAN_SHOUTAONUM);
	local myLevel = GetLevel();

	if (myLevel < 80) then
		CreateTaskSay({"<dec><npc>你的等级还不够80级，不能参加庆典活动。", "结束对话/OnCancel"});
		return -1;
	end;
	if (nDate ~= myDate) then
		SetTask(TASKID_JXAN_SHOUTAODATE, nDate);
		SetTask(TASKID_JXAN_SHOUTAONUM, 0);
		return 1;
	elseif (myNum < JXANNIVERSARY3_SHOUTAONUM) then
		return 1;
	else
		CreateTaskSay({"<dec><npc><sex>今天已经做过3次了，还是请回吧。",
		"结束对话/OnCancel"});
	end;
	return -1;
end;

function JxAn_go2eventplace()
	local strAddr = "";	
	local tbAddrChoice = 
	{
		"我只是问问而已/OnCancel"
	}
	for i = 1,getn(tb_JXAN_TSK_ADDR) do
		strAddr = strAddr.."<color=yellow>"..tb_JXAN_TSK_ADDR[i][2].."<color>";
		if (i < getn(tb_JXAN_TSK_ADDR)) then
			strAddr = strAddr.."、";
		else
			strAddr = strAddr.."，";
		end
		
		tinsert(tbAddrChoice, getn(tbAddrChoice), "我想去"..tb_JXAN_TSK_ADDR[i][2].."/#JxAn_sure2eventplace("..i..")");
	end
	tinsert(tbAddrChoice, 1, "<dec><npc>凭<sex>与老夫的交情,老夫可直接送你去活动地点,但不知"..strAddr.."你想去哪里呢？");
	CreateTaskSay(tbAddrChoice);
end;

function JxAn_sure2eventplace(nAddrID)
	NewWorld(tb_JXAN_TSK_ADDR[nAddrID][1][1], tb_JXAN_TSK_ADDR[nAddrID][1][2], tb_JXAN_TSK_ADDR[nAddrID][1][3]);
	SetFightState(1);
end

function IsCharged()
	if( GetExtPoint( 0 ) >= 1 ) then
		return 1;
	else
		return 0;
	end;
end;