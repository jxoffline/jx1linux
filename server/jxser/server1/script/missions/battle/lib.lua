List = {}
Hash = {}
Array = {}
function List.new ()
	return {n = 0, map = {}, first = nil, last = nil}
end

function List.push(list, value)
	local node = {value = value, next = nil , prev = nil}
	if list.first == nil then
		list.first = node
	else
		list.last.next = node
		node.prev = list.last
	end
	list.last = node
	list.n = list.n + 1
	list.map[value] = node
end

function List.pop(list)
	if list.first then
		local node = list.first
		
		list.first = node.next
		if list.first then
			list.first.prev = nil
		end			
		list.n = list.n - 1
		list.map[node.value] = nil
		return node.value
	else
		return 
	end
end

function List.get(list, value)
	return list.map[value]
end

function List.del(list, value)
	local node = list.map[value]
	if node then
		
		local prev_node = node.prev
		local next_node = node.next
		if prev_node then
			prev_node.next = next_node
		end
		if next_node then
			next_node.prev = prev_node
		end
		if node == list.first then
			list.first = next_node
		end
		if node == list.last then
			list.last = prev_node
		end
		node.prev = nil
		node.next = nil
		list.n = list.n - 1
		list.map[value] = nil
		return node.value
	else
		return 
	end
end

function List.size(list)
	return list.n
end


function Hash.new ()
	return {tb={}, n = 0 }
end

function Hash.add(hash, key, value)
	if not hash.tb[key] then
		hash.tb[key] = value
		hash.n = hash.n + 1
	end
end
function Hash.get(hash, key)
	return hash.tb[key]
end
function Hash.del(hash, key)
	if hash.tb[key] then
		hash.tb[key] = nil
		hash.n = hash.n - 1
	end
end

function Hash.pairs(hash)
	return hash.tb or {}
end
function Hash.size(hash)
	return hash.n
end

function Array.new()
	return {tb={}, n=0, max_id = 0}
end
function Array.get(array, nId)
	return array.tb[nId]
end

function Array.new_id(array)
	return array.max_id + 1
end
function Array.add(array, value)
	array.max_id = array.max_id + 1
	array.tb[array.max_id] = value
	array.n = array.n + 1
	return array.max_id
end

function Array.del(array, nId)
	if array.tb[nId] then
		array.tb[nId] = nil
		array.n = array.n - 1
	end
end

function Array.size(array)
	return array.n
end

function Array.last(array)
	return array.tb[array.max_id]
end

function Array.pairs(array)
	return array.tb or {}
end