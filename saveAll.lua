local function main()
    local myObjects = ObjectList('Drive Thru')
    for i = 1, #myObjects do
        if (myObjects[i].drivetype ~= 'Internal' and myObjects[i].drivetype ~= 'Removable') then
          Printf('Drive '..myObjects[i].no..' = '..myObjects[i].drivetype)
        end
    end
  end