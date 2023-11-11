if not EVENTHEAD_LUA then
	Include ("\\script\\event\\eventhead.lua")
end	

TKID_NEWBIELEVELUP = 1080	--±¾´Î»î¶¯ÐèÒªÓÃµ½µÄÈÎÎñ±äÁ¿±àºÅ
TKVAL_NEWBIELEVELUP_OPEN = 1 --½ÓÈÎÎñÒÔºó£¬1080ºÅÈÎÎñ±äÁ¿ÉèÎª1

ENewbieLevelUp = {
	To20Level = function()
		if not validateDate(DATESNEWBIELEVELUP,DATEENEWBIELEVELUP) then
			return
		end
		local level = GetLevel()
		if(level ==1) then
			for i=1,19 do
				AddOwnExp(100000)
			end
			SetTask(TKID_NEWBIELEVELUP,TKVAL_NEWBIELEVELUP_OPEN)
		end
	end,
	PayDoubleExp = function()
		if not validateDate(DATESNEWBIELEVELUP,DATEENEWBIELEVELUP) then
			Talk(1,"","Xin lçi! Thêi gian diÔn ra ho¹t ®éng ®· chÊm døt råi!")
			return
		end
		local ret = ENewbieLevelUp.validate()
		if(ret ==1) then
			Talk(1,"","Xin lçi! §¼ng cÊp cña b¹n ®· v­ît qu¸ cÊp 60 kh«ng thÓ nhËn phÇn th­ëng t¨ng ®«i ®iÓm kinh nghiÖm trong 2 giê.")
			return
		end
		if(ret == 2) then
			Talk(1,"","Xin lçi! B¹n kh«ng ph¶i nh©n vËt míi t¹o nªn kh«ng thÓ nhËn phÇn th­ëng t¨ng ®«i ®iÓm kinh nghiÖm trong 2 giê.")
			return
		end
		AddSkillState(531,10,1,2*60*60*18)
		AddSkillState(461, 1, 1,2*60*60*18)
		Talk(1,"","Hoan nghªnh b¹n tham gia 'Ho¹t ®éng t©n thñ luyÖn cÊp', ®©y lµ phÇn th­ëng t¨ng ®«i ®iÓm kinh nghiÖm trong 2 giê.")
		Msg2Player("B¹n nhËn ®­îc phÇn th­ëng t¨ng ®«i ®iÓm kinh nghiÖm trong 2 giê ")
		return
	end,
	validate = function()
		local level = GetLevel()
		if (level > 60) then
			return 1
		end
		local flag = GetTask(TKID_NEWBIELEVELUP)
		if (flag ~= TKVAL_NEWBIELEVELUP_OPEN) then
			return 2
		end
		return 0
	end
}

function BTNNewbieLevelUp()
	local msg = "Hoan nghªnh tham gia 'Ho¹t ®éng t©n thñ luyÖn cÊp'."
	local btns = {
		"Ta ®Õn nhËn t¨ng ®«i ®iÓm kinh nghiÖm trong 2 giê /PayDoubleExp",
		"T×m hiÓu ho¹t ®éng lÇn nµy/AboutNewbieLevelUp",
	}
	Say(msg,getn(btns),btns)
end

function PayDoubleExp()
	ENewbieLevelUp.PayDoubleExp() 
end

function AboutNewbieLevelUp()
	local msg = ": Trong thêi gian ho¹t ®éng, chØ cÇn nh©n vËt míi t¹o lªn ®Õn cÊp 20 vµ d­íi cÊp 60 cã thÓ ®Õn LÔ Quan nhËn t¨ng ®«i ®iÓm kinh nghiÖm trong 2 giê."
	local btns = {
		"Trë l¹i/BTNNewbieLevelUp",
		"Tho¸t ra/Quit"
	}
	Describe(LIGUAN_TAG(msg),getn(btns),btns)
end
