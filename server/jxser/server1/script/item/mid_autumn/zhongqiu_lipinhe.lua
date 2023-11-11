-- ÖÐÇïÀñÆ·ºÐ½Å±¾
-- lixin 2005-8-31

zq_tab_award = {	--ÖÐÇïÀñÆ·ºÐ¿ÉÒÔ»ñµÃµÄÎïÆ·£¬¸ÅÂÊ£¬
	{	"Bét m× cÊp 1",	0.43145	,	 528 ,	},
	{	"Bét m× cÊp 2 ",	0.05	,	 529 ,	},
	{	"Bét m× cÊp 3",	0.015	,	 530 ,	},
	{	"Bét m× cÊp 4 ",	0.003	,	 531 ,	},
	{	"Bét m× cÊp 5",	0.0005	,	 532 ,	},
	{	"Bét m× cÊp 6",	0.00005	,	 533 ,	},
	{	"Bét sen cÊp 1",	0.43145	,	 534 ,	},
	{	"Bét sen cÊp 2 ",	0.05	,	 535 ,	},
	{	"Bét sen cÊp 3 ",	0.015	,	 536 ,	},
	{	"Bét sen cÊp 4 ",	0.003	,	 537 ,	},
	{	"Bét sen cÊp 5 ",	0.0005	,	 538 ,	},
	{	"Bét sen cÊp 6 ",	0.00005	,	 539 ,	},
}

function main()
	local base = 100000
	local sum = 0
	local num = random(1, base)

	for i = 1, getn( zq_tab_award ) do
		sum = sum + zq_tab_award[i][2] * 100000
		if( sum >= num ) then
			zq_award( zq_tab_award[i] )
			break
		end
	end
end

function zq_award( item )
	local name = item[1]
	AddEventItem( item[ 3 ] )
	Msg2Player("Chóc mõng, b¹n nhËn ®­îc 1 "..name)
	Talk(1,"","LÔ Quan: Chóc mõng ng­¬i nhËn ®­îc <color=yellow>"..name.."<color>!")
	WriteLog(date("%y-%m-%d,%H:%M").."Account==["..GetAccount().."] RoleName=="..GetName()..", më hép quµ Trung Thu nhËn ®­îc "..name)
end