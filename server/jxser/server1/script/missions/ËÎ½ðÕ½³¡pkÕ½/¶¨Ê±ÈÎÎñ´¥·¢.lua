GLB_BATTLESTATE = 30
function main()
	SetGlbValue(GLB_BATTLESTATE, 0) --设置该全局变量为1，标志当前服务器正处于宋金战役阶段，此时襄阳或朱仙镇的出口点自动设在宋金战役的报名点，否则则设在原宋金战场地图
	idx = SubWorldID2Idx(44);
	if (idx == -1) then 
	return
	end;
	
	SubWorld = idx;
	OpenMission(1);

end;