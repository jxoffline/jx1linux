Include("\\script\\misc\\eventsys\\type\\player.lua")
IncludeLib("SETTING")
Include("\\script\\activitysys\\functionlib.lua")

if not tbGetTitleTDB then
	tbGetTitleTDB = {}
end

tbGetTitleTDB.nStartDate = 201512310000
tbGetTitleTDB.nEndDate = 201605010000

EVENT_LOG_TITLE = "LOGEVENT_NHAN_LAI_TITLE_TDB_2"

tbBITTSK_LIMIT_RECV_TITLE_TDB_2_326 = {nTaskID = 2726,nStartBit = 18,nBitCount = 1,nMaxValue = 1} 
tbBITTSK_LIMIT_RECV_TITLE_TDB_2_327 = {nTaskID = 2726,nStartBit = 19,nBitCount = 1,nMaxValue = 1} 
tbBITTSK_LIMIT_RECV_TITLE_TDB_2_328 = {nTaskID = 2726,nStartBit = 20,nBitCount = 1,nMaxValue = 1} 

TITLE_TAKSID_TDB2 = {
	[326] = tbBITTSK_LIMIT_RECV_TITLE_TDB_2_326,
	[327] = tbBITTSK_LIMIT_RECV_TITLE_TDB_2_327,
	[328] = tbBITTSK_LIMIT_RECV_TITLE_TDB_2_328,
}



