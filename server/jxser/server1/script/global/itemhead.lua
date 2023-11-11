function RndItemProp(x1,x2)
	y = {0,0,0,0,0,0}
	for i=1,x1 do
		if (random(0,99) < x2) then
			for j = 1,i do y[j] = y[j] + 1 end
		else
			break
		end
	end
	return y[1],y[2],y[3],y[4],y[5],y[6]
end
