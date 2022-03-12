IncludeLib("SETTING")
Include("\\script\\tong\\tong_header.lua")
IncludeLib("TONG")
function tong_check_add()
	print("goi ham add thanh vien bang hoi")
	if(GetLevel() < 60)then
		Talk(1,"","CÊp 60 trë lªn míi ®­îc gia nhËp bang héi")
		return
	end
	-- local nTransLifeCount = ST_GetTransLifeCount()	
	-- if nTransLifeCount < 3 then
	-- 	Msg2Player("CÇn trïng sinh 3 cÊp 190 trë lªn míi ®­îc gia nhËp bang héi")
	-- 	return 
	-- end
	-- if nTransLifeCount == 3 and GetLevel() < 190 then
	-- 	Msg2Player("CÇn trïng sinh 3 cÊp 190 trë lªn míi ®­îc gia nhËp bang héi")
	-- 	return 
	-- end
	return 1
end

function tong_check_create()
	if(GetLevel() < 80)then
		Talk(1,"","LËp bang yªu cÇu ®¶ng cÊp 80 trë lªn")
		return
	end
	-- local nTransLifeCount = ST_GetTransLifeCount()	
	-- if nTransLifeCount < 3 then
	-- 	Msg2Player("CÇn trïng sinh 3 cÊp 190 trë lªn míi ®­îc thµnh lËp bang héi")
	-- 	return 
	-- end
	-- if nTransLifeCount == 3 and GetLevel() < 190 then
	-- 	Msg2Player("CÇn trïng sinh 3 cÊp 190 trë lªn míi ®­îc thµnh lËp bang héi")
	-- 	return 
	-- end
	return 1
end