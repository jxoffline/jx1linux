-------------------------------------------------------------------------
-- FileName		:	tureboss90.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-20 11:05:14
-- Desc			:   Ç§±¦¿â¹Ø¿¨µÄ±¦Ïä½Å±¾[90¼¶ÒÔÉÏ]
-------------------------------------------------------------------------
IncludeLib( "FILESYS" );
Include("\\script\\task\\tollgate\\messenger\\qianbaoku\\enemy_tureboss.lua") 
Include("\\script\\task\\newtask\\newtask_head.lua") --µ÷ÓÃ nt_getTask Í¬²½±äÁ¿µ½¿Í»§¶ËµÄÀµ
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --È¡ÏûÈÎÎñ
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --µ÷ÓÃ¼ÆÊ±Æ÷
TabFile_Load( "\\settings\\task\\tollgate\\messenger\\messenger_tollprize.txt" , "tollprize");	 --»ñµÃÍ¬°éÐÞÁ·µÄ±í¸ñ

NPC_PARAM_ID = 1;        --ÓÃÔÚbossËÀÍöºóË¢³ö¹ÖÎïµÄÌØÊâÊ¢¼þÖÐ£¬Ôö¼ÓnpcµÄÊ±ºò×÷ÎªGetNpcParamµÄµÚ¶þÎ»£¬ÒâË¼ÊÇ¸Ãº¯ÊýÈ¡³öµÄÊÇ´ú±íÄ¿Ç°ËÀÍöbossIDµÄÊý×Ö   
TUREBOSS_RELIVE=2      --Ã¿¸ö±êÖ¾µÄÖØÉúÊ±¼ä
TUREBOSS_EXP=tonumber( TabFile_GetCell( "tollprize" ,10 ,"boss_exp"))  --Ð¡¹Ö¾­Ñé
TUREBOSS_MAPID=395        --µ±Ç°Íæ¼ÒËùÔÚµØÍ¼Ç§±¦¿âµÄµØÍ¼±µºÅ£¿£¿ÊÇ¶µÉÙ£¿£¿
TUREBOSS_MESSENGEREXP=tonumber( TabFile_GetCell( "tollprize" ,10 ,"boss_jifen"))  --Ð¡¹Ö¾­Ñé

turegirl3=
{
--±»À§ÉÙÅ®90¼¶ÒÔÉÏ
{843,100,395,1436,3043,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",1},
{843,100,395,1417,3087,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",2},
{843,100,395,1409,2976,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",3},
{843,100,395,1378,2941,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",4},
{843,100,395,1408,2870,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",5},
{843,100,395,1380,2821,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",6},
{843,100,395,1420,2770,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",7},
{843,100,395,1430,2725,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",8},
{843,100,395,1415,2717,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",9},
{843,100,395,1374,2736,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",10},
{843,100,395,1398,2673,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",11},
{843,100,395,1418,2668,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",12},
{843,100,395,1412,2608,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",13},
{843,100,395,1392,2553,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",14},
{843,100,395,1420,2516,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",15},
{843,100,395,1352,3176,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",16},
{843,100,395,1350,3114,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",17},
{843,100,395,1388,3096,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",18},
{843,100,395,1348,3084,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",19},
{843,100,395,1318,3144,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",20},
{843,100,395,1271,3173,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",21},
{843,100,395,1257,3116,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",22},
{843,100,395,1242,3075,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",23},
{843,100,395,1283,3062,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",24},
{843,100,395,1265,3072,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",25},
{843,100,395,1298,3005,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",26},
{843,100,395,1410,3045,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",27},
{843,100,395,1375,2985,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",28},
{843,100,395,1360,3018,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",29},
{843,100,395,1340,3008,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",30},
{843,100,395,1338,2946,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",31},
{843,100,395,1298,2952,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",32},
{843,100,395,1266,2990,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",33},
{843,100,395,1230,2988,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",34},
{843,100,395,1244,2938,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",35},
{843,100,395,1258,2902,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",36},
{843,100,395,1247,2857,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",37},
{843,100,395,1380,2886,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",38},
{843,100,395,1314,2898,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",39},
{843,100,395,1278,2921,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",40},
{843,100,395,1280,2861,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",41},
{843,100,395,1324,2827,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",42},
{843,100,395,1286,2778,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",43},
{843,100,395,1242,2797,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",44},
{843,100,395,1279,2728,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",45},
{843,100,395,1308,2739,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",46},
{843,100,395,1386,2775,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",47},
{843,100,395,1346,2726,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",48},
{843,100,395,1260,2693,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",49},
{843,100,395,1338,2638,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",50},
{843,100,395,1361,2697,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",51},
{843,100,395,1370,2524,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",52},
{843,100,395,1307,2643,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",53},
{843,100,395,1230,2457,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",54},
{843,100,395,1257,2467,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",55},
{843,100,395,1302,2443,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",56},
{843,100,395,1289,2512,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",57},
{843,100,395,1338,2496,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",58},
{843,100,395,1316,2581,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",59},
{843,100,395,1450,3118,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",60},
{843,100,395,1475,3114,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",61},
{843,100,395,1503,3155,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",62},
{843,100,395,1590,3124,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",63},
{843,100,395,1572,3096,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",64},
{843,100,395,1444,3076,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",65},
{843,100,395,1504,3082,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",66},
{843,100,395,1531,3053,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",67},
{843,100,395,1558,3052,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",68},
{843,100,395,1569,2949,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",69},
{843,100,395,1532,2973,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",70},
{843,100,395,1441,3006,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",71},
{843,100,395,1420,2938,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",72},
{843,100,395,1477,2966,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",73},
{843,100,395,1567,2893,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",74},
{843,100,395,1578,2856,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",75},
{843,100,395,1488,2916,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",76},
{843,100,395,1496,2849,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",77},
{843,100,395,1416,2829,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",78},
{843,100,395,1519,2728,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",79},
{843,100,395,1454,2719,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",80},
{843,100,395,1437,2633,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",81},
{843,100,395,1582,2568,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",82},
{843,100,395,1577,2506,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",83},
{843,100,395,1579,2454,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",84},
{843,100,395,1544,2444,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",85},
{843,100,395,1519,2504,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",86},
{843,100,395,1456,2451,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",87},
{843,100,395,1476,2796,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",88},
{843,100,395,1518,2784,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",89},
{843,100,395,1572,2767,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",90},
{843,100,395,1454,2762,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",91},
{843,100,395,1497,2673,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",92},
{843,100,395,1497,2710,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",93},
{843,100,395,1493,2620,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",94},
{843,100,395,1445,2594,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",95},
{843,100,395,1530,2594,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",96},
{843,100,395,1497,2580,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",97},
{843,100,395,1510,2538,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",98},
{843,100,395,1550,2541,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",99},
{843,100,395,1479,2474,1,"ThiÕu N÷ BÞ V©y",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\turegirl.lua",100}, 

}

turerobber3=
{
--B¶o Khè §¹o TÆc90¼¶ÒÔÉÏ
{850,100,395,1439,3040,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",1},
{850,100,395,1417,3079,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",2},
{850,100,395,1407,2980,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",3},
{850,100,395,1374,2942,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",4},
{850,100,395,1412,2870,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",5},
{850,100,395,1376,2821,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",6},
{850,100,395,1424,2770,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",7},
{850,100,395,1434,2725,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",8},
{850,100,395,1411,2717,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",9},
{850,100,395,1378,2736,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",10},
{850,100,395,1398,2669,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",11},
{850,100,395,1422,2668,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",12},
{850,100,395,1408,2606,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",13},
{850,100,395,1396,2553,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",14},
{850,100,395,1416,2516,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",15},
{850,100,395,1348,3176,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",16},
{850,100,395,1354,3114,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",17},
{850,100,395,1384,3096,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",18},
{850,100,395,1348,3088,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",19},
{850,100,395,1314,3144,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",20},
{850,100,395,1267,3173,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",21},
{850,100,395,1257,3112,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",22},
{850,100,395,1246,3075,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",23},
{850,100,395,1281,3058,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",24},
{850,100,395,1265,3068,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",25},
{850,100,395,1300,3005,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",26},
{850,100,395,1414,3045,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",27},
{850,100,395,1371,2985,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",28},
{850,100,395,1364,3018,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",29},
{850,100,395,1340,3004,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",30},
{850,100,395,1342,2946,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",31},
{850,100,395,1302,2952,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",32},
{850,100,395,1270,2990,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",33},
{850,100,395,1234,2988,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",34},
{850,100,395,1240,2938,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",35},
{850,100,395,1254,2902,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",36},
{850,100,395,1243,2857,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",37},
{850,100,395,1384,2886,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",38},
{850,100,395,1318,2898,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",39},
{850,100,395,1282,2921,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",40},
{850,100,395,1276,2861,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",41},
{850,100,395,1320,2827,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",42},
{850,100,395,1282,2778,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",43},
{850,100,395,1238,2797,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",44},
{850,100,395,1275,2728,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",45},
{850,100,395,1304,2729,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",46},
{850,100,395,1386,2769,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",47},
{850,100,395,1342,2726,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",48},
{850,100,395,1256,2693,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",49},
{850,100,395,1334,2638,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",50},
{850,100,395,1357,2697,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",51},
{850,100,395,1374,2524,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",52},
{850,100,395,1307,2637,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",53},
{850,100,395,1226,2457,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",54},
{850,100,395,1253,2467,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",55},
{850,100,395,1306,2443,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",56},
{850,100,395,1286,2514,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",57},
{850,100,395,1334,2496,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",58},
{850,100,395,1320,2581,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",59},
{850,100,395,1446,3118,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",60},
{850,100,395,1471,3114,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",61},
{850,100,395,1499,3155,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",62},
{850,100,395,1586,3124,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",63},
{850,100,395,1568,3096,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",64},
{850,100,395,1448,3076,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",65},
{850,100,395,1508,3082,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",66},
{850,100,395,1531,3047,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",67},
{850,100,395,1558,3046,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",68},
{850,100,395,1565,2949,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",69},
{850,100,395,1528,2930,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",70},
{850,100,395,1444,3010,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",71},
{850,100,395,1416,2938,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",72},
{850,100,395,1481,2966,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",73},
{850,100,395,1571,2893,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",74},
{850,100,395,1574,2856,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",75},
{850,100,395,1484,2916,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",76},
{850,100,395,1492,2849,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",77},
{850,100,395,1420,2829,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",78},
{850,100,395,1515,2728,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",79},
{850,100,395,1450,2719,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",80},
{850,100,395,1433,2633,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",81},
{850,100,395,1586,2568,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",82},
{850,100,395,1573,2506,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",83},
{850,100,395,1583,2454,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",84},
{850,100,395,1548,2444,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",85},
{850,100,395,1519,2498,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",86},
{850,100,395,1460,2451,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",87},
{850,100,395,1480,2796,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",88},
{850,100,395,1522,2784,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",89},
{850,100,395,1576,2767,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",90},
{850,100,395,1458,2762,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",91},
{850,100,395,1493,2673,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",92},
{850,100,395,1501,2710,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",93},
{850,100,395,1489,2620,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",94},
{850,100,395,1441,2594,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",95},
{850,100,395,1526,2594,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",96},
{850,100,395,1493,2580,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",97},
{850,100,395,1506,2538,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",98},
{850,100,395,1546,2541,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",99},
{850,100,395,1483,2474,1,"B¶o Khè §¹o TÆc",1,"\\script\\task\\tollgate\\messenger\\qianbaoku\\90\\turezei90.lua",100}, 

}

function main()
	local name = GetName()
	local Uworld181 = GetTaskTemp(181)
	local Npcindex = GetLastDiagNpc() 					  --»ñµÃ×îºó¶Ô»°npcµÄindex
	local TureParam = GetNpcParam(Npcindex,NPC_PARAM_ID)  --»ñµÃÔÚ¸Ã¶Ô»°npcÉíÉÏ´æ´¢µÄÈÎÎñ±äÁ¿
	if (  messenger_middletime() == 10 ) then --Íæ¼ÒÔÚµØÍ¼ÖÐµÄÊ±¼ä
		Msg2Player("Xin lçi! "..name.."! B¹n ®· hÕt thêi gian thùc hiÖn nhiÖm vô TÝn sø! NhiÖm vô thÊt b¹i!.")
		losemessengertask()
	elseif ( TureParam ~= Uworld181 ) then
		Msg2Player("Xin lçi! ng­¬i ch­a h¹ ®­îc ng­êi gi÷ r­¬ng, kh«ng thÓ më r­¬ng ra!")
		return
	else
		
		if messenger_turego()== 1 then
			Msg2Player(format("Ng­¬i ®· më B¶o R­¬ng sè %d thµnh c«ng.", Uworld181))
		end
	end
end

