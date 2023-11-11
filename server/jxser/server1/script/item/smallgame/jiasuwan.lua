SKILLTYPE = 670;
SKILLLEVEL2 = 5;
SKILLLEVEL3 = 0;
SKILLEFECT = "T╪g t鑓  di chuy觧 trong 10 gi﹜";

function main()
	AddSkillState(SKILLTYPE, SKILLLEVEL2, SKILLLEVEL3, 10 * 18); --第二个参数是技能的级别；
	Msg2Player("<#>Ngi nh薾 頲 <color=0xB5FDD7>"..SKILLEFECT.."<color>");
end
