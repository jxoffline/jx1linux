-- by yfeng

if not BAN_HEAD then
	Include("\\script\\global\\ban.lua")
end

function main(itemIdx)
	local mapid,_,_ = GetWorldPos()
	if(checkSJMaps(mapid)) then
		Msg2Player("Trong chiÕn tr­êng Tèng Kim kh«ng thÓ sö dông §¹i B¶o hoµn.")
		return 1
	end
	local _,_,detail = GetItemProp(itemIdx)
	if(detail == 218) then --¹¥ËÙÍè
		AddSkillState(511,15,1,18*180)
		return 0
	end
	if(detail == 219) then --ÅÜËÙÍè
		AddSkillState(512,15,1,18*180)
		return 0
	end
	if(detail == 220) then --ÆÕ·ÀÍè
		AddSkillState(513,20,1,18*180)
		return 0
	end
	if(detail == 221) then --¶¾·ÀÍè
		AddSkillState(514,20,1,18*180)
		return 0
	end
	if(detail == 222) then --±ù·ÀÍè
		AddSkillState(515,20,1,18*180)
		return 0
	end
	if(detail == 223) then --»ğ·ÀÍè
		AddSkillState(516,20,1,18*180)
		return 0
	end
	if(detail == 224) then --À×·ÀÍè
		AddSkillState(517,20,1,18*180)
		return 0
	end
	if(detail == 225) then --¼õÉËÍè
		AddSkillState(518,20,1,18*180)
		return 0
	end
	if(detail == 226) then --¼õÔÎÍè
		AddSkillState(519,20,1,18*180)
		return 0
	end
	if(detail == 227) then --¼õ¶¾Íè
		AddSkillState(520,20,1,18*180)
		return 0
	end
	if(detail == 228) then --¼õ±ùÍè
		AddSkillState(521,20,1,18*180)
		return 0
	end
	if(detail == 229) then --ÆÕ¹¥Íè
		AddSkillState(522,10,1,18*180)
		return 0
	end
	if(detail == 230) then --¶¾¹¥Íè
		AddSkillState(523,10,1,18*180)
		return 0
	end
	if(detail == 231) then --±ù¹¥Íè
		AddSkillState(524,10,1,18*180)
		return 0
	end
	if(detail == 232) then --»ğ¹¥Íè
		AddSkillState(525,10,1,18*180)
		return 0
	end
	if(detail == 233) then --À×¹¥Íè
		AddSkillState(526,10,1,18*180)
		return 0
	end
	if(detail == 234) then --³¤ÃüÍè
		AddSkillState(527,10,1,18*180)
		return 0
	end
	if(detail == 235) then --³¤ÄÚÍè
		AddSkillState(528,10,1,18*180)
		return 0
	end

end

function GetDesc(itemIdx)
	local _,_,detail = GetItemProp(itemIdx)
	if(detail == 218) then --¹¥ËÙÍè
		return "<color=blue>Trong 3 phót:\n Tèc ®é xuÊt chiªu ngo¹i c«ng: t¨ng 30%\n Tèc ®é xuÊt chiªunéi c«ng: T¨ng 30%<color>"
	end
	if(detail == 219) then --ÅÜËÙÍè
		return "<color=blue>Trong 3 phót:\n Tèc ®é di chuyÓn: T¨ng 30%<color>"
	end
	if(detail == 220) then --ÆÕ·ÀÍè
		return "<color=blue>Trong 3 phót:\n Phßng vËt lı: T¨ng 40%<color>"
	end
	if(detail == 221) then --¶¾·ÀÍè
		return "<color=blue>Trong 3 phót:\n Kh¸ng ®éc: T¨ng 40%<color>"
	end
	if(detail == 222) then --±ù·ÀÍè
		return "<color=blue>Trong 3 phót:\n Kh¸ng b¨ng: T¨ng 40%<color>"
	end
	if(detail == 223) then --»ğ·ÀÍè
		return "<color=blue>Trong 3 phót:\n Kh¸ng háa: T¨ng 40%<color>"
	end
	if(detail == 224) then --À×·ÀÍè
		return "<color=blue>Trong 3 phót:\n Kh¸ng l«i: T¨ng 40%<color>"
	end
	if(detail == 225) then --¼õÉËÍè
		return "<color=blue>Trong 3 phót:\n Thêi gian bŞ th­¬ng: Gi¶m 40%<color>"
	end
	if(detail == 226) then --¼õÔÎÍè
		return "<color=blue>Trong 3 phót:\n Thêi gian cho¸ng: Gi¶m 40%<color>"
	end
	if(detail == 227) then --¼õ¶¾Íè
		return "<color=blue>Trong 3 phót:\n Thêi gian tróng ®éc: Gi¶m 40%<color>"
	end
	if(detail == 228) then --¼õ±ùÍè
		return "<color=blue>Trong 3 phót:\n Thêi gian lµm chËm: Gi¶m 40%<color>"
	end
	if(detail == 229) then --ÆÕ¹¥Íè
		return "<color=blue>Trong 3 phót:\n S¸t th­¬ng vËt lı hÖ ngo¹i c«ng: T¨ng 200%\n S¸t th­¬ng vËt lı hÖ néi c«ng: T¨ng 100 ®iÓm<color>"
	end
	if(detail == 230) then --¶¾¹¥Íè
		return "<color=blue>Trong 3 phót:\n §éc s¸t hÖ ngo¹i c«ng: T¨ng 10 ®iÓm/lÇn\n §éc s¸t hÖ néi c«ng: T¨ng 10 ®iÓm/lÇn<color>"
	end
	if(detail == 231) then --±ù¹¥Íè
		return "<color=blue>Trong 3 phót:\n B¨ng s¸t hÖ ngo¹i c«ng: T¨ng 100 ®iÓm\n B¨ng s¸t hÖ néi c«ng: T¨ng 100 ®iÓm<color>"
	end
	if(detail == 232) then --»ğ¹¥Íè
		return "<color=blue>Trong 3 phót:\n Háa s¸t hÖ ngo¹i c«ng: T¨ng 100 ®iÓm\n Háa s¸t hÖ néi c«ng: T¨ng 100 ®iÓm<color>"
	end
	if(detail == 233) then --À×¹¥Íè
		return "<color=blue>Trong 3 phót:\n L«i s¸t ngo¹i c«ng: T¨ng 100 ®iÓm\n L«i s¸t néi c«ng: T¨ng 100 ®iÓm<color>"
	end
	if(detail == 234) then --³¤ÃüÍè
		return "<color=blue>Trong 3 phót:\n Sinh lùc lín nhÊt: T¨ng 1000 ®iÓm<color>"
	end
	if(detail == 235) then --³¤ÄÚÍè
		return "<color=blue>Trong 3 phót:\n Néi lùc lín nhÊt: T¨ng 1000 ®iÓm<color>"
	end

end
