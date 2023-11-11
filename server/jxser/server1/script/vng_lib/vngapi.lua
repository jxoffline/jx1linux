function VNG_CompareAccountID(tbAccount)--CompareAccount ID
	local strAccount = GetAccount()
	for i=1, getn(tbAccount) do
		if (strAccount == tbAccount[i].szAccount) then
			return 1, i;
		end
	end
	return 0, 0
end