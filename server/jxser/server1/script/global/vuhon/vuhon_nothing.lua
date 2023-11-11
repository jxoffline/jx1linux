------------------------------------------------------------------------------------------------------------
function main()
	local szTitle = "Xin chµo "..GetName().."! <color=fire>Vò Hån §­êng<color> h©n h¹nh ®ãn tiÕp ng­êi cña <color=yellow>Héi qu¸n Vâ l©m offline<color> ghÐ th¨m. B¹n cã thÝch n¬i nµy kh«ng?"
	local tbOpt=
	{
	"RÊt thÝch, c¸m ¬n c¸c b¹n ®· chuÈn bÞ chu ®¸o./thich_vuhon",
	"Kh«ng./khong_vuhon",
	}
	Say(szTitle, getn(tbOpt), tbOpt)
end

function thich_vuhon()
	Talk(1, "", "Vò Hån ®­êng cã chót quµ nhá tÆng c¸c h¹, tham quan vui vÎ nhÐ.")
	SetTask(4000, GetTask(4000) + 100)
	AddItem(6, 1, 4418, 0, 0, 0)
	Msg2Player("B¹n nhËn ®­îc <color=yellow>100 ®iÓm Ch©n Nguyªn<color> vµ <color=yellow>1 §¹i hé m¹ch ®¬n<color>.")
	
end

function khong_vuhon()
	Talk(1, "", "T×nh c¶m kh«ng thÓ c­ìng cÇu, nh­ng mong <color=yellow>®õng nãi lêi cay ®¾ng<color>.")
end