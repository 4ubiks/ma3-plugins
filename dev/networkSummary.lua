local function main()
	local ip = Root().MAnetSocket.HostTypes.OnPC[1].IP
	Printf("ip address: " .. ip)
	
	local sess = Root().MAnetSocket.HostTypes.OnPC[1].Session
	Printf("session: " .. sess)
	
	local name = Root().MAnetSocket.HostTypes.OnPC[1].name
	Printf("name: " .. name)
	
	local stat = Root().MAnetSocket.HostTypes.OnPC[1].status
	Printf("status: " .. stat)
	-- Root().MAnetSocket.HostTypes.OnPC[1].IP = 0.0.0.0
end

return main

