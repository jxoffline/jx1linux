--³ÇÊÐ¹«¸æÅÆ
function SayCityStatus()
	nCityID = GetCityArea();
	Say(GetCitySummary(nCityID) .. "\n" .. NW_GetSealInfo(), 0);
end;

function ManageCity()
	nCityID = GetCityArea();
	OpenCityManageUI(nCityID);
end;

function main()
	nCityID = GetCityArea();
	if (nCityID >= 1 and nCityID <= 7) then
		TongName, MasterName = GetCityOwner(nCityID);
		if (MasterName == GetName()) then
			Say("Lµm chøc Th¸i Thó, b¹n cã muèn thiÕt ®Æt thuÕ míi kh«ng?", 2, "Muèn/ManageCity", "Kh«ng, ta chØ muèn xem th«ng tin cña thµnh thÞ. /SayCityStatus");
		else
			SayCityStatus();
		end;
	else
		Say("Khu vùc kh«ng cã qu¶n lý. ", 0);
	end;
end;

