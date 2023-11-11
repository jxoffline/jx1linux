Include("\\script\\misc\\eventsys\\eventsys.lua")


local ChannelChat = EventSys:NewType("OnChannelChat")

ChannelChat.ChannelType_Unknown = 0	--未知
ChannelChat.ChannelType_Screen	= 1	--近聊
ChannelChat.ChannelType_World	= 2	--公聊
ChannelChat.ChannelType_GM		= 3	--GM
ChannelChat.ChannelType_City	= 4	--城聊
ChannelChat.ChannelType_Team	= 5	--队聊
ChannelChat.ChannelType_Tong	= 6	--帮派
ChannelChat.ChannelType_TongUnion	= 7		--帮派联盟
ChannelChat.ChannelType_Faction		= 8		--门派
ChannelChat.ChannelType_War			= 9		--攻城战
ChannelChat.ChannelType_ChatRoom	= 10	--聊天室


if nil then
	local TestEvent = function(szType)
		print("OnChannelChat", szType)
	end
	
	ChannelChat:Reg(ChannelChat.ChannelType_City, TestEvent, "ChannelType_City")
	ChannelChat:Reg(ChannelChat.ChannelType_World, TestEvent, "ChannelType_World")
	ChannelChat:Reg(ChannelChat.ChannelType_Tong, TestEvent, "ChannelType_Tong")
end