local function main()
  local myObjects = ObjectList('Drive Thru')
  for i = 1, #myObjects do
  	if (myObjects[i].drivetype == 'Internal' or myObjects[i].drivetype == 'Removeable') then
  		local cD = myObjects[i].no
  		Cmd("Select Drive " .. cD) 
  		Cmd("SaveShow 'plugins'")
    	  -- Printf('Drive '..myObjects[i].no..' = '..myObjects[i].drivetype)
      end
  end
end

return main