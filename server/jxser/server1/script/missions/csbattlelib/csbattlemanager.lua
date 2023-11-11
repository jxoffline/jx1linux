
--参赛流程
--1、与主入口的Npc对话，选择进入第几个战区
--2、如果符合参赛条件则进入战区内（另一张地图），并以0(新手)阵营模式进入
--3、玩家与两边的Npc对话，自由选择参与的阵营进入战斗区域。或者选择观战模式。进入后会收取5000元。
--4、玩家Pk死亡后将自动被仍出场外，但在本地图内。
--5、当玩家死亡时，会自动向同地图的所有玩家公布当前的战况。
--6、比赛可以按照等级分成各种赛场
--7.战斗中PK得手的人，将会获得3000元的奖励。
--8、如果想离开战斗，在战斗区域的玩家可以与Npc对话，说要退出，被扔到场外。
--9、在场外的人，可以往下面走，踩到trap点，离开战区，跳到扬州。
--10.进入战区时，无法组队、无死亡惩罚等


--华山与此类式,不同的时
--1、和华山的人对话后，自动进入战斗区域战斗。
--2、等级限制在60级以上，10000两报名费用。
--3、离开战区时，自动跳到华山。
--4、PK得手时，获得6000元奖励。


--现在有一个要求，就是3个演武场的地图与扬州放在一台服务器上，华山与华山绝顶也放在一台服务器上
function DoJoin(nSel)
	if (nSel + 1 > MapCount) then
		return
	end;
	LeaveTeam();
	WantToJoin(MapTab[nSel + 1][1], MapTab[nSel + 1][2], MapTab[nSel + 1][3]);
end;


function WantToJoin(nMapId, nX, nY)
	SetCurCamp(0);
	SetFightState(0);
	SetLogoutRV(1);
	SetTaskTemp(200,1);--此时无法修改帮会阵营
	w, x, y = GetLeavePos();
	SetTempRevPos(w, x * 32 , y * 32); --设置暂时重生点为报名点附近
	NewWorld(nMapId, nX, nY);
end;

function OnCancel()

end;
