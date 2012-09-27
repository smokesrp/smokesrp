admin.cmds = {}
admin.cmds.cmd = {}
admin.cmds.func = {}

function admin.cmds.gettarget( sender, targetname ) //get target entity from string argument
	local target = nil
	for k,v in pairs( player.GetAll() ) do
		if( string.find( string.lower( v:GetName() ), string.lower( targetname ) ) ) then
			if( target != nil ) then
				admin.message( sender, false, "Multiple players found." )
				return false
			end
			target = v
		end
	end
	if( target == nil ) then
		admin.message( sender, false, "Player not found." )
		return false
	else
		return target
	end
end

//Commands \/
//ping
table.insert( admin.cmds.cmd, "srpa_ping" )
table.insert( admin.cmds.func, function( sender )
	admin.message( sender, true, "Pong!" )
end )
//kick
table.insert( admin.cmds.cmd, "srpa_kick" )
table.insert( admin.cmds.func, function( sender, targetname, reason )
	local target = admin.cmds.gettarget( sender, targetname )
	if( target ) then
		admin.announce( false, "Admin \""..sender:GetName().."\" has kicked \""..target:GetName().."\" for: \""..tostring( reason ).."\"." )
		target:Kick( tostring( reason ) )
	end
end )
//change job
table.insert( admin.cmds.cmd, "srpa_job" )
table.insert( admin.cmds.func, function( sender, targetname, jobname )
	local target = admin.cmds.gettarget( sender, targetname )
	if( target ) then
		local tojob = nil
		for i = 1, #jobs do
			if( jobs[i].name == jobname ) then
				tojob = jobs[i].id
			end
		end
		if( tojob == nil ) then
			admin.message( sender, false, "Invalid job." )
		else
			v:SetTeam( tojob )
			v:Spawn()
			admin.announce( true, "Admin \""..sender:GetName().."\" has changed \""..target:GetName().."\"'s job to: \""..team.GetName( target:Team() ).."\"." )
		end
	end
end )
	
net.Receive( "admin_exec", function( length, sender ) //handle commands executed by admins
	arg1 = ""
	arg2 = ""
	local id = net.ReadInt( 8 )
	local arg1 = net.ReadString()
	local arg2 = net.ReadString()
	admin.cmds.func[id]( sender, arg1, arg2 )
end )