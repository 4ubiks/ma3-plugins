local function main()
	local ip = Root().MAnetSocket.OnPC[1].IP
	Printf("ip address: " .. ip)
	
	local sess = Root().MAnetSocket.OnPC[1].Session
	Printf("session: " .. sess)
	
	local name = Root().MAnetSocket.OnPC[1].name
	Printf("name: " .. name)
	
	local stat = Root().MAnetSocket.OnPC[1].status
	Printf("status: " .. stat)
end

return main