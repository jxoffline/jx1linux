tbVnX2Award = {}
tbVnX2Award.nStartDate = 201303110000
tbVnX2Award.nEndDate = 201303172400
tbVnX2Award.tbDuration = {
	["SJ"] = {201303110000, 201303172400},--TËng Kim
	["COT"] = {201303110000, 201303172400},--V≠Ót ∂i
	["YDBZ"] = {201303110000, 201303172400},--Vi™m ß’
	["DRUM"] = {201303110000, 201303172400},--TrËng Kh∂i Hoµn
	["TIANLU"] = {201304290000, 201305062400},--c©y thi™n lÈc
}
function tbVnX2Award:IsActive(strType)
	local nCurDate = tonumber(date("%Y%m%d%H%M"))	
	if nCurDate < self.tbDuration[strType][1] or nCurDate > self.tbDuration[strType][2] then
		return nil
	end
	return 1
end

function tbVnX2Award:X2SongJin(nPoint)
	if self:IsActive("SJ") then
		nPoint = nPoint * 2
		Msg2Player(format("Tu«n l‘ vµng: Bπn Æ≠Óc nh©n Æ´i Æi”m t›ch lÚy TËng Kim, nhÀn Æ≠Óc <color=yellow>%d<color> Æi”m t›ch lÚy.", nPoint))		
	end
	return nPoint
end

function tbVnX2Award:X2ChallengeOfTime(nExp)
	if self:IsActive("COT") then
		nExp = nExp * 2
		Msg2Player(format("Tu«n l‘ vµng: Bπn Æ≠Óc nh©n Æ´i Æi”m kinh nghi÷m khi qua ∂i, nhÀn Æ≠Óc <color=yellow>%d<color> Æi”m kinh nghi÷m.", nExp))		
	end
	return nExp
end

function tbVnX2Award:X2YDBZ(nExp)
	if self:IsActive("YDBZ") then
		nExp = nExp * 2
		Msg2Player(format("Tu«n l‘ vµng: Bπn Æ≠Óc nh©n Æ´i Æi”m kinh nghi÷m khi qua ∂i, nhÀn Æ≠Óc <color=yellow>%d<color> Æi”m kinh nghi÷m.", nExp))		
	end
	return nExp
end

function tbVnX2Award:X2Drum(nExp)
	if self:IsActive("DRUM") then
		nExp = nExp * 2		
	end
	return nExp
end

function tbVnX2Award:X2Tianlu(nExp)
	if self:IsActive("TIANLU") then
		nExp = nExp * 2		
	end
	return nExp
end