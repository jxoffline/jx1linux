--ÖÐÇï½Ú»î¶¯2007 Ô­ÁÏ°ü

function IsPickable( nItemIndex, nPlayerIndex )
	if GetExtPoint(0) <= 0 then
			Msg2Player("ChØ cã ng­êi ch¬i ®· n¹p thÎ míi cã thÓ nhÆt ®­îc tói nguyªn liÖu.")
			return 0
	end
	return 1;
end
tb_Mareial = 
{
	100000,
	{
		{G=6,D=1,P=1503,nrate=0.3		,szname="Tói bét"},
		{G=6,D=1,P=1504,nrate=0.3		,szname="Tói ®­êng"},
		{G=6,D=1,P=1505,nrate=0.3		,szname="Tói trøng"},
		{G=6,D=1,P=1506,nrate=0.05	,szname="Tói ®Ëu xanh"},
		{G=6,D=1,P=1507,nrate=0.025	,szname="Tói h¹t sen"},
		{G=6,D=1,P=1508,nrate=0.015	,szname="Tói thÞt gµ"},
		{G=6,D=1,P=1509,nrate=0.01	,szname="Tói thÞt heo"}
	}
}
function PickUp( nItemIndex, nPlayerIndex )
		if GetExtPoint(0) <= 0 then
			Msg2Player("ChØ cã ng­êi ch¬i ®· n¹p thÎ míi cã thÓ nhÆt ®­îc tói nguyªn liÖu.")
			return 0
		end
		local nrate = random(1,tb_Mareial[1]);
		local nsum = 0
		for nkey,nitem in tb_Mareial[2] do
			nsum = nsum + (nitem["nrate"] * tb_Mareial[1])
			if (nsum > nrate) then
				local g = nitem["G"];
				local d = nitem["D"];
				local p = nitem["P"];
				local nidx = AddItem(g,d,p,1,0,0)
				local szitemname = nitem["szname"]
				Msg2Player(format("B¹n nhËn ®­îc 1 <color=yellow>%s<color>",szitemname))
				WriteLog(format("[zhongqiu2007]\t Date:%s\t Account:%s\t Name:%s\t GetItem:%s",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),szitemname));
				return 0
			end
		end
		return 0;	-- É¾³ýÎïÆ·

end