--	2007´º½Ú»î¶¯
if (not _H_SPRINGFESTIVAL_) then
_H_SPRINGFESTIVAL_ = 1;
Include([[\script\lib\pay.lua]]);

TASKID_TOTALEXP = 1795;
UNIT_WAN = 10000;
EXP_MAXIMUM = 50 * UNIT_WAN * UNIT_WAN;
function sf07_isactive()
	return 1;
end;

function sf07_isgoodsactive()
	return 1;
end;

function sf07_isrightuser()
	return 1;
end;

function no()

end;

end;