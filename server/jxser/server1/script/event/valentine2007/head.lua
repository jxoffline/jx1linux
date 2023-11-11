Include("\\script\\lib\\basic.lua");

TSK_VALENTINE_ROSE_DATE = 1596
TSK_VALENTINE_ROSE_ADDEXP = 1597


PRM_ROSETREE_PLAYID = 1
PRM_ROSETREE_EVENT = 2	--byte: eventid=1; state=2; phase=3; task = 4;
PRM_ROSETREE_TIME = 3		
PRM_ROSETREE_POINT = 4;	--phase <= 3 then time; byte:pure=1;norm=2;bud =3;

TB_ROSETREE_TASK = {2,3,4}
TB_ROSETREE_NPCID = {1252, 1253, 1254, 1255};
TB_ROSETREE_ROSEPROP = {
	{6,1,1362,1,0,0},
	{6,1,1363,1,0,0},
	{6,1,1364,1,0,0},
}
TB_ROSETREE_TASKTIME = {20, 20, 15, 10};

DEC_ROSETREE_SZSEX = {[0]="§¹i hiÖp",[1]="N÷ hiÖp"}
DEC_ROSETREE_STASK = {"T­íi n­íc","Bãn ph©n","C¾t cá d¹i","DiÖt c«n trïng"};
DEC_ROSETREE_EVENT = {
"C©y hoa hång: T«i kh¸t n­íc qu¸, vÞ <color=yellow>n÷ hiÖp<color> nµy, sau <color=yellow>20 gi©y<color> h·y t­íi n­íc cho t«i. NhÊt ®Þnh ph¶i ®óng giê, nh­ vËy t«i míi cã thÓ træ nh÷ng b«ng hoa xinh ®Ñp.",
"C©y hoa hång: Khi t«i ®ang lín, cÇn rÊt nhiÒu dinh d­ìng, vÞ <color=yellow>®¹i hiÖp<color> nµy, sau <color=yellow>20 gi©y<color> h·y bãn ph©n cho t«i. NÕu kh«ng t«i kh«ng thÓ lín.",
"C©y hoa hång: Xung quanh t«i cã nhiÒu cá d¹i qu¸, <color=yellow>15 gi©y<color> sau h·y c¾t bá gióp t«i. ChØ cã sù gióp søc cña ®«i b¹n, t«i míi cã thÓ tr­ëng thµnh.",
"C©y hoa hång: ¤i, d­êng nh­ cã nh÷ng con s©u bß lªn ng­êi t«i, <color=yellow>10 gi©y<color> sau xin h·y gióp t«i tiªu diÖt chóng.",
"C©y hoa hång: C¸m ¬n ®«i b¹n ®· ch¨m nom t«i. HiÖn t¹i t«i ®· træ ra nh÷ng hoa hång rÊt ®Ñp, cã %s xin ®«i b¹n h·y mau chãng h¸i lÊy.",
};

DEC_ROSETREE_OTHER = {
"C©y hoa hång: Mïa xu©n ®Õn råi! H·y cïng t«i vui xu©n.",
"C©y hoa hång: Giã xu©n Êm ¸p, cho dï con ®­êng phÝa tr­íc cã ®i ®Õn tËn cïng hay kh«ng th× t«i vÉn thÝch b¹n, cho ®Õn khi t«i kh«ng cßn trªn câi ®êi nµy n÷a...",
"C©y hoa hång: T«i ®· dïng lßng yªu th­¬ng ®Ó træ ra nh÷ng b«ng hoa t­¬i ®Ñp...",
"C©y hoa hång: T×nh yªu nh­ n­íc cuèn ®i, th¸ng ngµy nh­ giÊc méng vµng tr«i qua. T«i ®øng ®©y d­íi tia n¾ng Êm ¸p, tay ®Æt lªn ngùc, lßng nghÜ ®Õn nh÷ng hoa hång trong tim. Xin chóc ®«i b¹n mét LÔ T×nh Nh©n vui vÎ h¹nh phóc!",
};

TB_XINNIANLIHUA_AREA = {174,121,153,101,99,100,20,53,1,11,37,78,80,162,176,2,21,167,193}

function checkValentine2007Date(nlimitdate)
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate <= nlimitdate) then
		return 1;
	end;
	return 0;
end;

function checkValentine2007Limit()
	if (GetLevel() >= 80 and GetExtPoint(0) > 0) then
		return 1;
	else
		return 0;
	end;
end;