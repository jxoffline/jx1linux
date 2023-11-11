--中原北区 风陵渡to漠北草原
--TrapID：

function main(sel)
	SetFightState(1);
	NewWorld( 341, 1236, 3179);
	DisabledUseTownP(1) -- 限制其进入漠北草原使用回城符
	SetRevPos(175,1)	--设定死亡重生点为西山村
end