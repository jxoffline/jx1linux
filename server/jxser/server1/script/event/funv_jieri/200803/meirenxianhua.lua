--ÃÀÈËÏ×»¨£¬08¸¾Å®½Ú»î¶¯
--
--
Include("\\script\\task\\task_addplayerexp.lua")
if tbclassname == nil then
	tbclassname = {}
end
funv_jieri_meiren = tbclassname
funv_jieri_meiren.ndatestart = 8030800
funv_jieri_meiren.ndateend = 8033124
funv_jieri_meiren.ntask = 1878
funv_jieri_meiren.LIMIT_LEVEL = 50
funv_jieri_meiren.tbitem =
{
	meigui = {g=6,d=1,p=1681,szname="Bã hoa hång",nexp=0.001,limit=25},
	juhua = {g=6,d=1,p=1682,szname="Bã hoa cóc",nmanexp=1000000,nmaleexp=1500000,limit=125},
}
function main()
	local ndate = tonumber(GetLocalDate("%y%m%d%H"))
	if ndate < funv_jieri_meiren.ndatestart or ndate > funv_jieri_meiren.ndateend then
		Say("T¹m thêi ch­a cã ho¹t ®éng.",0)
		return
	end
	Say("Ch¼ng hay c¸c h¹ muèn tÆng ta hoa g× nhØ?",3,"Ta muèn tÆng bã hoa hång./#funv_jieri_meiren:zengsongmeigui(1)","Ta muèn tÆng bã hoa cóc./#funv_jieri_meiren:zengsongjuhua(1)","Tho¸t ra/NoChoice")
end

function funv_jieri_meiren:zengsongmeigui(sel)
	if self:check_level() == 0 then
		Say("Nh©n vËt ®¼ng cÊp trªn 50 ®· n¹p thÎ míi cã thÓ tÆng hoa.",0)
		return
	end
	if self:check_pay() == 0 then
		Say("Nh©n vËt ®¼ng cÊp trªn 50 ®· n¹p thÎ míi cã thÓ tÆng hoa.",0)
		return
	end
	local ntaskmeigui = self:getTaskByte(self.ntask,3)
	local tbmeigui = self.tbitem.meigui
	if ntaskmeigui >= tbmeigui.limit then
		Say("Mçi nh©n vËt chØ cã thÓ tÆng cho mü nh©n tèi ®a 25 bã hoa hång.",0)
		return
	end
	local nmeigui = CalcEquiproomItemCount(tbmeigui.g,tbmeigui.d,tbmeigui.p,-1)
	local nsum = 0
	if nmeigui < 1 then
		Say("B¹n quªn mang bã hoa hång råi.",0)
		return
	end
	ConsumeEquiproomItem(1,tbmeigui.g,tbmeigui.d,tbmeigui.p,-1)
	local n_transcount = ST_GetTransLifeCount();
	local nexp = tl_getUpLevelExp((GetLevel()+1), n_transcount) * tbmeigui.nexp
	AddOwnExp(nexp)
	Msg2Player(format("Chóc mõng, b¹n nhËn ®­îc <color=yellow>%d<color> kinh nghiÖm",nexp))
	self:addTaskByte(self.ntask,3,1)
end

function funv_jieri_meiren:zengsongjuhua(sel)
	if self:check_level() == 0 then
		Say("Nh©n vËt ®¼ng cÊp trªn 50 ®· n¹p thÎ míi cã thÓ tÆng hoa.",0)
		return
	end
	if self:check_pay() == 0 then
		Say("Nh©n vËt ®¼ng cÊp trªn 50 ®· n¹p thÎ míi cã thÓ tÆng hoa.",0)
		return
	end
	local ntaskjuhua = self:getTaskByte(self.ntask,4)
	local tbjuhua = self.tbitem.juhua
	if ntaskjuhua >= tbjuhua.limit then
		Say("Mçi nh©n vËt chØ cã thÓ tÆng cho mü nh©n tèi ®a 125 bã hoa cóc.",0)
		return
	end
	local njuhua = CalcEquiproomItemCount(tbjuhua.g,tbjuhua.d,tbjuhua.p,-1)
	local nsum = 0
	if njuhua < 1 then
		Say("B¹n quªn mang bã hoa cóc råi.",0)
		return
	end
	ConsumeEquiproomItem(1,tbjuhua.g,tbjuhua.d,tbjuhua.p,-1)
	local nexp = 0
	if GetSex() == 0 then
		nexp = tbjuhua.nmanexp
	else
		nexp = tbjuhua.nmaleexp
	end
	AddOwnExp(nexp)
	Msg2Player(format("Chóc mõng, b¹n nhËn ®­îc <color=yellow>%d<color> kinh nghiÖm",nexp))
	self:addTaskByte(self.ntask,4,1)
end


function tbclassname:check_level()		--ÅĞ¶ÏµÈ¼¶
	if GetLevel() < tbclassname.LIMIT_LEVEL then
		return 0
	end 
	return 1
end

function tbclassname:check_pay()		--ÅĞ¶Ï³äÖµÓÃ»§
	if GetExtPoint(0) <= 0 then
		return 0
	end 
	return 1
end

--ÈÎÎñ±äÁ¿×Ö½Ú»ñµÃ
function tbclassname:getTaskByte(The_Task_ID,theByte)
	return GetByte(GetTask(The_Task_ID),theByte);
end

--ÈÎÎñ±äÁ¿×Ö½ÚÔö¼Ó
function tbclassname:addTaskByte(The_Task_ID,theByte,Inc_Num)
	SetTask(The_Task_ID,SetByte(GetTask(The_Task_ID),theByte,GetByte(GetTask(The_Task_ID),theByte)+Inc_Num));
end