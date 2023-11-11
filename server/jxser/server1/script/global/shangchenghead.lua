--сно╥й╠╪Д
FRAME2TIME		= 18;			-- 18уЛоЮ╣╠сзсно╥жп1цКжс
--имифаН╫╠юЬё╛╤ЮЁ╓й╠╪Ддзк╚╠╤╬╜яИ
AEXP_ADWARD_TIME = 4

--╪гб╪╣╠г╟нд╪Ч╦В╦ЖЁгйпимифаН╣дtabнд╪Ч
--windowsобцФ
--CITYPRIZETABFILENAME	=	"data\\cityprize.txt"
--LinuxобцФ
CITYPRIZETABFILENAME	=	"data//cityprize.txt"

AEXP_LOAD		= 0

--имифаН
AEXP_AWARDMEDIAL_NGENTYPE 		= 6;
AEXP_AWARDMEDIAL_DETAILTYPE 	= 1;
AEXP_AWARDMEDIAL_PARTYPE 		= 197;

--╥ё╤ЯаН
AEXP_PUNISHMEDIAL_NGENTYPE 		= 6;
AEXP_PUNISHMEDIAL_DETAILTYPE	= 1;
AEXP_PUNISHMEDIAL_PARTYPE 		= 198;

--©иртаЛ╫╠ЁжпЬлЛйЩ
AEXP_ADWARD_HOURNUM	= 24
--©╙й╪╫╠им╣двН╢Сж╣
AEXP_MAXADWARDNUM = 9999

--х╚╬жхннЯ╠Да©(ЁгйпимифаНйЩа©)
AEXP_GLOBAL_FENGXIANG	= 20
AEXP_GLOBAL_CHNEGDU		= 21
AEXP_GLOBAL_DALI		= 22
AEXP_GLOBAL_BIANJING	= 23
AEXP_GLOBAL_XIANGYANG	= 24
AEXP_GLOBAL_YANGZHOU	= 25
AEXP_GLOBAL_LINAN		= 26
--╣╠г╟©╙╫╠Ёгйп
AEXP_GLOBAL_ADWARD_CITY	= 27
--©╙╫╠вН╨Схуфз
AEXP_GLOBAL_ENDDATE 	= 28
--йг╥Я╪сть╧Щ╢Фелнд╪Ч
AEXP_BLNLOADFILE		= 29


--хннЯ╠Да©
AEXP_TASK_ADWARDDATE	= 606	--╢Ф╢╒мФ╪раЛ╫╠хуфз
AEXP_PLAYERTONG_LIMIT   = 1 	--мФ╪рхК╟Ой╠╪Д╠ьпК╢Ссз╦цж╣ё╛╡е©иртаЛх║╫╠ф╥║ё╣╔н╩н╙лЛйЩ(╨м╫е╠╬╠х╫ой╠гКв╒рБ)

--Ёгйп╨мх╚╬ж╠Да©╣д╤тс╕╠М
arraycitytoglobalvalue =
{
	AEXP_GLOBAL_FENGXIANG,
	AEXP_GLOBAL_CHNEGDU,
	AEXP_GLOBAL_DALI,
	AEXP_GLOBAL_BIANJING,
	AEXP_GLOBAL_XIANGYANG,	
	AEXP_GLOBAL_YANGZHOU,
	AEXP_GLOBAL_LINAN,
};

--ЁгйпкВрЩ╨мЁгйпцШЁф╤тс╕╠М
arraycityindextoname =
{
	"Ph╜Нng T╜Йng",
	"Th╣nh ╖╚",
	"╖╧i LЩ",
	"Biжn Kinh",
	"T╜╛ng D╜╛ng",
	"D╜╛ng Ch╘u",
	"L╘m An",
};

--юш╪ф╢СсздЁж╣й╠╢Фел
AEXP_ADDMAX_SAVE = 1000
--юш╪фп║сздЁж╣й╠╢Фел
AEXP_REDUCEMAX_SAVE = 1000

function loadsavevalue()
	blnLoad = GetGlbValue(AEXP_BLNLOADFILE)
	if (blnLoad == nil or blnLoad == 0) then
		SetGlbValue(AEXP_BLNLOADFILE, 1)
		
		handle = openfile(CITYPRIZETABFILENAME, "r")
		if (handle == nil) then
			return 
		end
		
		for nIndex=AEXP_GLOBAL_FENGXIANG, AEXP_GLOBAL_ENDDATE do
			nValue = read(handle, "*l")
			if (nValue == nil or nValue == "") then
				nValue = 0
			else
				nValue = tonumber(nValue)
			end
			
			SetGlbValue(nIndex, nValue)
		end		
		
		closefile(handle)					
	end	
end

--н╙ак╥юж╧seekя╟урfileЁЖ╢Мё╛╤Ьгрд©г╟й╧сцйЩ╬щ╫оиыё╛╢Фелй╠гЕЁЩнд╪Чжьпбп╢р╩╦Жпбнд╪Ч
function savevalue()
	handle = openfile(CITYPRIZETABFILENAME, "w+")
	if (handle == nil) then
		return 0
	end

	for nIndex=AEXP_GLOBAL_FENGXIANG, AEXP_GLOBAL_ENDDATE do
		local nValue = GetGlbValue(nIndex)
		write(handle, nValue.."\n")	
	end
	
	closefile(handle)
end
