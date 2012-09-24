admin.cmds = {}
admin.cmds.cmd = {}
admin.cmds.func = {}

//kick
table.insert( admin.cmds.cmd, "srpa_kick" )
table.insert( admin.cmds.func, function( sender, target, params )
	admin.announce( false, "Admin \""..sender:GetName().."\" has kicked \""..target:GetName().."\"." )
	target:Kick( tostring( params ) )
end )

net.Receive( "admin_exec", function() //handle commands executed by admins
	local id = net.ReadInt( 8 )
	local sender = net.ReadEntity()
	local arg1 = net.ReadString()
	local arg2 = net.ReadString()
	admin.cmds.func[id]( sender, arg1, arg2 )
end )