IL("TITLE");
IncludeLib("ITEM");
IncludeLib("TIMER");
IncludeLib("FILESYS");
IncludeLib("SETTING");
IncludeLib("TASKSYS")
IncludeLib("PARTNER");
IncludeLib("BATTLE");
IncludeLib("RELAYLADDER")
IncludeLib("TONG") 
IncludeLib("LEAGUE")
Include("\\script\\lib\\log.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\global\\fuyuan.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\lib\\remoteexc.lua")
Include("\\script\\lib\\common.lua");
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\dailogsys\\dailogsay.lua");
Include("\\script\\activitysys\\functionlib.lua") 
Include("\\script\\activitysys\\npcdailog.lua")
Include("\\script\\task\\metempsychosis\\npc_saodiseng.lua")
Include("\\script\\global\\titlefuncs.lua")
Include( "\\script\\lib\\string.lua" );
Include( "\\script\\item\\item_header.lua" );

TITLEDIALOG = "Tªn nh©n vËt: <color=green>%s<color>\n".."Tªn tµi kho¶n: <color=green>%s<color>\n".."Täa ®é: <color=green>%d, %d/%d<color>" 

function main()
	dofile("script/global/pgaming/item/lenhbaitestserver.lua")
		local nW,nX,nY = GetWorldPos()
		local tbSay = {format(TITLEDIALOG, GetName(), GetAccount() ,nW,nX,nY)}
			tinsert(tbSay, "LÊy ITEM (MagicScript,QuesKey, Gold Item)/TaoItem")
			tinsert(tbSay, "LÊy list ®å hoµng kim/Goldequip")
			tinsert(tbSay,"Thay ®æi tr¹ng th¸i nh©n vËt/trangthai")
			tinsert(tbSay, "Hñy vËt phÈm/DisposeItem")
			tinsert(tbSay, "Söa lçi ThÇn Hµnh Phï/fixthanhanhphu")
			tinsert(tbSay,"Thao t¸c lªn ng­êi ch¬i./luachonid1")
			tinsert(tbSay, "KÕt thóc ®èi tho¹i./no")			
		CreateTaskSay(tbSay)
	return 1;
end


function trangthai()
local szTitle = "§¹i hiÖp muèn ®æi sang tr¹ng th¸i nµo?"
local tbOpt =
	{
		"LuyÖn C«ng/#set_trangthai(0)",
		"ChÝnh Ph¸i/#set_trangthai(1)",
		"Tµ Ph¸i/#set_trangthai(2)",
		"Trung LËp/#set_trangthai(3)",
		"S¸t Thñ/#set_trangthai(4)",
		"Trë l¹i/main",
		"Tho¸t./no",
	}
	Say(szTitle, getn(tbOpt), tbOpt)	
end
function set_trangthai(nTrangthai)
	SetCurCamp(nTrangthai)
	SetCamp(nTrangthai)
end



function DisposeItem()
GiveItemUI("Hñy vËt phÈm", "§¹i hiÖp h·y cÈn träng trong viÖc hñy vËt phÈm, vËt phÈm ®· hñy kh«ng thÓ lÊy l¹i ®­îc!", "DisposeConfirm", "onCancel", 1);
end

function DisposeConfirm(nCount)
	for i=1, nCount do
		local nItemIndex = GetGiveItemUnit(i)
		local strItem = GetItemName(nItemIndex)
		RemoveItemByIndex(nItemIndex)
		--WriteLog(date("%Y%m%d %H%M%S").."\t".." GM Hñy Item "..GetAccount().."\t"..GetName().."\t".." Huû item "..strItem)
	end--for
	Msg2Player("Thao t¸c hñy vËt phÈm thµnh c«ng")
	Talk(1, "", "Thao t¸c thµnh c«ng, kiÓm tra l¹i!");	
end


-------------Tao ITEM-------------------------------------------------------------------
function TaoItem() 
g_AskClientStringEx("6,1,222,0,0,0",1,9000,"NhËp Vµo Item Code:",{TaoItemID}) 
end

function TaoItemID(szItem)
	local szICode = lib:Split(szItem, ",");
	local n = getn(szICode);
	if (n ~= 1) then
	if (n < 6) then Talk(1, "", format("Sai Item Code. ThiÕu tr­êng yªu cÇu <color=yellow>%s<color>",n)); return end
	if (n > 7) then Talk(1, "", format("Sai Item Code. Qu¸ nhiÒu tr­êng d÷ liÖu <color=yellow>%s<color>",n)); return end
	local itclass = tonumber(szICode[1]); 
	local ittype = tonumber(szICode[2]); 
	local itid = tonumber(szICode[3]); 
	local itlv = tonumber(szICode[4]); 
	local itseri = tonumber(szICode[5]); 
	local itluck = tonumber(szICode[6]); 
	local itmagic = tonumber(szICode[7]); 
	if (itlv < 0) then Talk(1, "", format("CÊp ®é man ®å kh«ng ®­îc thÊp qu¸ <color=yellow>%s<color>",itlv)); return end
	--if (itlv > 10) then Talk(1, "", format("ChØ hæ trî ®Õn cÊp 10. HiÖn t¹i nhËp vµo <color=yellow>%s<color>",itlv)); return end
	if (itmagic == nil) then itmagic=0; end
	AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
	else
	local EquipId = tonumber(szICode[1]); 
	AddGoldItem(0, EquipId);
	end
end

-------------Lay Trang BÞ Hoµng Kim Glodequip------------------------------------------------------------------
function Goldequip() 
	g_AskClientStringEx("512,513", 0, 256, "ID GoldItem", {AddDSGold})
end

function AddDSGold(szPos)
       local tbPos = lib:Split(szPos, ",")
       local s = tonumber(tbPos[1])
       local e = tonumber(tbPos[2])
if (e~=0) then
	for i=s,e do AddGoldItem(0,i) end
else
	for i=1,7 do AddGoldItem(0,s) end
end
end 

function TaoItemGlodequip(idgq)
	AddGoldItem(0, ""..idgq.."")
end

function luachonid1() 
	AskClientForNumber("one",0,5000,"NhËp ID ng­êi ch¬i") 
end 

function one(num) 
if ((num)>GetPlayerCount()) then 
	Msg2Player("Kh«ng cã nh©n vËt víi ID: <color=green>"..num.."<color> ®­îc chän !!"); 
else 
	SetTaskTemp(200,num) 
    gmName=GetName() 
    gmidx=PlayerIndex 
    PlayerIndex=GetTaskTemp(200) 
    tk=GetAccount() 
    lev=GetLevel() 
    xp=GetExp() 
    cam=GetCamp() 
    fac=GetFaction() 
    cash=GetCash() 
    lif=GetExtPoint() 
    -- man=GetMana() 
    -- apo=GetEnergy() 
    -- spo=GetRestSP() 
    -- cr=GetColdR() 
    -- pr=GetTask(747) 
    -- phr=GetPhyR() 
    -- fr=GetFireR() 
    -- lr=GetLightR() 
    -- eng=GetEng() 
    -- dex=GetDex() 
    -- strg=GetStrg() 
    -- vit=GetVit() 
	xinxi = GetInfo() 
    w,x,y=GetWorldPos() 
    ObjName=GetName() 
    PlayerIndex=gmidx 
    Msg2Player("Nh©n vËt tªn:<color=metal> "..ObjName.."<color>"); 
    local tbSay=  {}
			tinsert(tbSay,"Di chuyÓn nh©n vËt vÒ BLH./move")
            tinsert(tbSay,"KÝch nh©n vËt./kick")
            tinsert(tbSay,"Tho¸t./no")        
    Say("- Tµi Kho¶n:<color=green> "..tk.."<color>       - Nh©n VËt   :<color=green> "..ObjName.."<color>\n- CÊp ®é   :<color=green> "..lev.."<color>           - Kinh nghiÖm: <color=green>"..xp.."%<color>\n- Mµu      :<color=green> "..cam.."<color>            - M«n ph¸i   : <color=green>"..fac.."<color>\n- TiÒn MÆt :<color=green> "..(cash/10000).." v¹n<color>   - TiÒn §ång  : <color=green>"..lif.." ®ång<color>\n- VÞ trÝ   : <color=blue>"..w.."<color>,<color=green>"..x.."<color>,<color=green>"..y.."<color>", getn(tbSay), tbSay)
    Msg2Player("Ng­êi ch¬i <color=cyan>"..xinxi) 
end 
end

function move() 
gmidx=PlayerIndex 
PlayerIndex=GetTaskTemp(200) 
w,x,y=GetWorldPos() 
if (w~=53) then 
SetFightState(0) 
NewWorld(53,200*8,200*16) 
else 
SetPos(1630, 3255) 
end 
Msg2Player("Qu¶n lý <color=green>"..gmName.."<color> ®· di chuyÓn b¹n vÒ Ba L¨ng HuyÖn"); 
PlayerIndex=gmidx 
Msg2Player("Nh©n vËt <color=green>"..ObjName.."<color> ®­îc b¹n di chuyÓn vÒ Ba LÆng HuyÖn thµnh c«ng"); 
end 

function kick() 
gmidx=PlayerIndex 
PlayerIndex=GetTaskTemp(200) 
Msg2Player("Qu¶n lý <color=green>"..gmName.."<color> ®· kick kÑt tµi kho¶n cho b¹n"); 
KickOutSelf() 
PlayerIndex=gmidx 
Msg2Player("Nh©n vËt <color=green>"..ObjName.."<color> ®­îc b¹n kick kÑt tµi kho¶n thµnh c«ng"); 
end; 

function fixthanhanhphu()
	DisabledUseTownP(0)
	Talk(1,"","Tr¹ng th¸i sö dông thæ ®Þa phï vµ thÇn hµnh phï cña Quý nh©n sÜ ®· trë vÒ ban ®Çu!")
end