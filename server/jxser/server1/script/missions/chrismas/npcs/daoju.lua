Include([[\script\missions\chrismas\ch_head.lua]]);

function main()
	Say("Ng­¬i muèn vËt phÈm nµo?", 8, "Gia Tèc hoµn/jiasuwan", "HuyÔn Hu©n H·m TÜnh/xuanyunxianjing", "HuyÒn Thiªn H·m TÜnh/xuantianxianjing", "BÉy lµm chËm/chihuanxianjing", "B¨ng Phong H·m TÜnh/bingfengxianjing", "B¹o L«i HiÖu gi¸c/baoleihaojiao", "B¨ng S­¬ng HiÖu gi¸c /bingshuanghaojiao", "§Ó ta suy nghÜ kü l¹i xem/oncancel");
end;

function jiasuwan()	
	AddSkillState(512,4,0,10*18);
end;

function xuanyunxianjing()
	CastSkill(668,1)
end;

function xuantianxianjing()
	CastSkill(668,10)
end;

function chihuanxianjing()
	CastSkill(669,1)
end;

function bingfengxianjing()
	CastSkill(669,10)
end;

function baoleihaojiao()
	CastSkill(505,1)
end;

function bingshuanghaojiao()
	CastSkill(506,1)
end;

function oncancel()
	
end;