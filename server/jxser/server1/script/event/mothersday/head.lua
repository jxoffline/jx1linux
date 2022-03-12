--母亲节活动
MOTHERDAY_2007_EXC_BEGINDATE =     70511            --石竹花的兑换时间起
MOTHERDAY_2007_EXC_ENDDATE =       70514            --石竹花的兑换时间止
MOTHERDAY_2007_MEDAL_BEGINTIME =   705110000        --石竹花的奖励时间起
MOTHERDAY_2007_MEDAL_ENDTIME =     705140030        --石竹花的奖励时间止
MOTHERDAY_SHIZHUHUA_ID =            1433               --石竹花的物品ID。
MOTHERDAY_SZH_EXC_MAX_NUM =         5                  --最多能兑换的石竹花的数量
SZH_EXP_MEDAL = {2000000,3000000,5000000}              --石竹花兑换经验奖励
TSK_MOTHERDAY_SZH_EXCTIME =         1917               --存储是否已经兑换过石竹花的次数,最多4次.
--



function SZHMedalCheckInTime()
    local nCurTime = tonumber(GetLocalDate("%y%m%d%H%M"))
    if nCurTime <= MOTHERDAY_2007_MEDAL_ENDTIME and nCurTime >= MOTHERDAY_2007_MEDAL_BEGINTIME then
        return 1
    else
        return 0
    end    
end
--
function SZHExc_Check_InTime()
    local nCurDate = tonumber(GetLocalDate("%y%m%d"))
    if nCurDate <= MOTHERDAY_2007_EXC_ENDDATE and nCurDate >= MOTHERDAY_2007_EXC_BEGINDATE then
        return 1
    else
        return 0
    end
end