admin.cmds = {}
admin.cmds.cmd = {}
admin.cmds.func = {}

function admin.cmds.gettarget( sender, targetname )
	local target = nil
	for k,v in pairs( player.GetAll() ) do
		if( string.find( v:GetName(), targetname ) ) then
			target = v
		end
	end
	if( target == nil ) then
		admin.message( sender, false, "Player not found." )
	else
		return target
	end
end

//kick
table.insert( admin.cmds.cmd, "srpa_kick" )
table.insert( admin.cmds.func, function( sender, targetname, params )
	local target = admin.cmds.gettarget( sender, targetname )
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