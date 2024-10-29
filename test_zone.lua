local universes = io.read()

universes = universes:gsub("%s*,%s*", " ")
local tab = {}

for num in universes:gmatch("%S+") do
    table.insert(tab, tonumber(num))
end

for i=0, #tab do
    print(tab[i])
end

print(universes)

for i=0, #universes do
    if (universes:sub(i, i) ~= ' ') then
        print(universes:sub(i, i))
    end
end