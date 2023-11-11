Include("\\script\\event\\wulin_final_match\\awardhead.lua")
function main()
	local base = 0
	for i = 1, getn( WL_TAB_MATCHAWARD ) do
		base = base + WL_TAB_MATCHAWARD[ i ][ 2 ]
	end
	base = WL_RANDOM_BASE * base
	
	local sum = 0
	local num = random(1, base)

	for i = 1, getn( WL_TAB_MATCHAWARD ) do
		sum = sum + WL_TAB_MATCHAWARD[i][2] * WL_RANDOM_BASE
		if( sum >= num ) then
			wl_award_hongbao_item( WL_TAB_MATCHAWARD[i] )
			break
		end
	end
end

function wl_award_hongbao_item( item )
	local name = item[1]
	if ( getn( item[ 3 ] ) == 1 ) then
		AddEventItem( item[ 3 ][ 1 ] )
	elseif( getn( item[ 3 ] ) == 2 ) then
		AddGoldItem( item[3][1], item[3][2] )
	elseif( getn( item[3] ) == 7 ) then
		AddItem( item[3][1], item[3][2], item[3][3], item[3][4], item[3][5], item[3][6], item[3][7] )
	else
		print( "error!!!the award table is wrong!!!!!!!!!!!" )
	end
	Msg2Player("Chóc mõng, b¹n nhËn ®­îc"..name)
	Say("Chóc mõng b¹n nhËn ®­îc <color=yellow>"..name.."<color>!", 0)
	WriteLog(date("%y-%m-%d,%H:%M").."Account==["..GetAccount().."] RoleName=="..GetName()..", tõ vâ l©m ®¹i hång bao nhËn ®­îc"..name)
end
