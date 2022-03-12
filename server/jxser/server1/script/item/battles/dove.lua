Include( "\\script\\item\\checkmapid.lua" )
IncludeLib("BATTLE")

function EatMedicine()
	for j = 1, getn(tbCD_MAP) do
		if ( nMapId == tbCD_MAP[j] ) then
			Msg2Player("VËt phÈm nµy chØ cã thÓ sö dông ë ChiÕn tr­êng Tèng Kim");
			return -1
		end
	end
	W, X, Y = GetWorldPos();
	nowmissionid = BT_GetData(PL_RULEID);	--»ñÈ¡µ±Ç°MISSIONID
	curcamp = GetCurCamp();
	X = floor( X / 8 );
	Y = floor( Y / 16 );
	string = "<#><color=yellow>"..GetName().."<#> <color><color=pink>: 'Täa ®é hiÖn t¹i cña ta lµ <color=yellow> ("..X.."<#>, "..Y.."<#> )<color>. H·y ®Õn gióp ta mét tay.'";
	Msg2MSGroup( nowmissionid, string, curcamp );
	Msg2Player("B¹n sö dông bå c©u th«ng b¸o cho chiÕn h÷u täa ®é hiÖn t¹i cña b¹n.");
end
