--Ô½ÄÏÁ½ÖÜÄê»î¶¯£¬ÀñÆ·ºÐ
--fmz
--
--
ACT2YEAR_TWhiteBoxRan = {
    tRan = {1000},
    tItemID = { {6,1,1442}},
    tItemName = {"B¸nh b«ng lan"}
}
--
ACT2YEAR_TBlueBoxRan = {
    tRan = {10,15,25,125,175,195,295,1000},
    tItemID = {
        {6,1,23},
        {6,1,12},
        {4,353,1},
        {6,1,147,1},
        {6,1,147,2},
        {6,1,147,3},
        {6,1,125},
        {6,1,1443},
    },
    tItemName = {"ThiÕt La H¸n","Bµn Nh­îc T©m Kinh","Tinh Hång B¶o Th¹ch","HuyÒn Tinh Kho¸ng Th¹ch cÊp 1","HuyÒn Tinh Kho¸ng Th¹ch cÊp 2","HuyÒn Tinh Kho¸ng Th¹ch cÊp 3",
    "QuÕ Hoa Töu","B¸nh kem",}
}
--
ACT2YEAR_TYellowBoxRan = {
    tRan = {30,124,174,194,344,944,946,948,950,952,954,956,958,960,962,964,966,968,970,972,974,976,978,980,982,984,986,988,990,992,994,996,998,1000,},
    tItemID = {
        {6,1,23},
        {6,1,147,2},
        {6,1,147,3},
        {6,1,147,4},
        {4,239,1},
        {6,1,1444},
        {6,1,27},
        {6,1,28},
        {6,1,33},
        {6,1,34},
        --{6,1,35},
        {6,1,36},
        {6,1,37},
        {6,1,38},
        {6,1,39},
        {6,1,40},
        {6,1,41},
        {6,1,42},
        {6,1,43},
        {6,1,45},
        {6,1,46},
        {6,1,47},
        {6,1,48},
        {6,1,49},
        {6,1,50},
        {6,1,51},
        {6,1,52},
        {6,1,53},
        {6,1,54},
        {6,1,55},
        {6,1,56},
        {6,1,57},
        {6,1,58},
        {6,1,59},
    },
    tItemName = {"ThiÕt La H¸n","HuyÒn Tinh Kho¸ng Th¹ch cÊp 2","HuyÒn Tinh Kho¸ng Th¹ch cÊp 3","HuyÒn Tinh Kho¸ng Th¹ch cÊp 4","Tö Thñy Tinh","B¸nh kem ®Æc biÖt","Tô TiÔn thuËt. B¹o Vò Lª Hoa",
    "H·m TÜnh thuËt.Lo¹n Hoµn KÝch","Th¸i Cùc QuyÒn Phæ. QuyÓn 3","Th¸i Cùc KiÕm Phæ. QuyÓn 2","L­u Tinh. §ao ph¸p","Thiªn V­¬ng Chïy Ph¸p. QuyÓn 1",
    "Thiªn V­¬ng Th­¬ng ph¸p. QuyÓn 2","Thiªn V­¬ng §ao ph¸p.QuyÓn 3","Thóy Yªn §ao ph¸p","Thóy Yªn Song ®ao","DiÖt KiÕm MËt TÞch","Nga Mi  PhËt Quang Ch­ëng MËt TÞch","Phi §ao thuËt. NhiÕp Hån NguyÖt ¶nh",
    "Phi Tiªu thuËt. Cöu Cung Phi Tinh","Ngò §éc Ch­ëng Ph¸p. QuyÓn 1","Ngò §éc §ao ph¸p. QuyÓn 2","Ngò §éc NhiÕp T©m thuËt. QuyÓn 3","Ngù Phong thuËt","Ngù L«i thuËt","Ngù T©m thuËt",
    "NhiÕp Hån. Chó thuËt","C¸i Bang Ch­ëng Ph¸p","C¸i Bang C«n ph¸p","ThiÕu L©m QuyÒn Ph¸p. QuyÓn 1","ThiÕu L©m C«n ph¸p. QuyÓn 2","ThiÕu L©m §ao ph¸p. QuyÓn 3","Phæ §é MËt TÞch" }
}
--
function main(nItemIndex)
    local nDate = tonumber(GetLocalDate("%y%m%d"))
    if nDate > 70712 then
        Say("VËt phÈm ®· qu¸ h¹n sö dông.",0)
        return 0
    end
    local szItemName = GetItemName(nItemIndex)
    local tRan = {}
    local g, d , p = GetItemProp( nItemIndex )
    if p ==  1439 then
        tRan = ACT2YEAR_TWhiteBoxRan
    elseif p == 1441 then
        tRan = ACT2YEAR_TBlueBoxRan
    elseif p == 1440 then
        tRan = ACT2YEAR_TYellowBoxRan
    end
    local nMedalItemGID, nMedalItemDID,nMedalItemPID,nItemLev,szMedalItemName = act2years2007_getgift(tRan)
    if nMedalItemGID == nil or nMedalItemDID == nil or nMedalItemPID  == nil  or szMedalItemName == nil then
        Msg2Player("Sö dông thÊt b¹i, h·y thö l¹i lÇn n÷a.")
        return 1
    end
    --Èç¹û²»ÊÇÐþ¾§
    if nMedalItemPID ~= 147 then
        nItemLev = 1
    end
    AddItem(nMedalItemGID,nMedalItemDID,nMedalItemPID,nItemLev,0,0)
    Msg2Player(format("Chóc mõng b¹n nhËn ®­îc 1 %s.",szMedalItemName))
    return 0
end
--
function act2years2007_getgift(tRan)
    
    local nCurRan,nMaxNumber
    local nMaxRan = 1000
    nCurRan = random(nMaxRan)
    nMaxNumber = getn(tRan.tRan)
    for i = 1, nMaxNumber do
        if nCurRan <= tRan.tRan[i] then
            return tRan.tItemID[i][1],tRan.tItemID[i][2],tRan.tItemID[i][3],tRan.tItemID[i][4], tRan.tItemName[i]
        end
    end
end
