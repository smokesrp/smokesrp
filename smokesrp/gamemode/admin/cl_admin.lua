local admin = {} //start main array

function admin.main() //main function only run if the server knows your an admin
	net.Receive( "admin_send_cmds", function() //create net message hook for creating admin console commands client side
		local cmd = net.ReadString()
		local id = net.ReadInt( 8 )
		concommand.Add( cmd, function( ply, cmd, args )
			net.Start( "admin_exec" )
				net.WriteInt( id, 8 )
				net.WriteString( tostring( args[1] ) )
				net.WriteString( tostring( args[2] ) )
			net.SendToServer()
		end )
	end )
	net.Start( "admin_req_cmds" )
	net.SendToServer()
end

net.Receive( "admin_init", function() //if is an admin run main
	admin.main()
end )

net.Receive( "admin_announce", function() //print the color optional (red or green ) message from the server
	local color = net.ReadInt( 1 )
	local text = net.ReadString()
	if( color ) then
		chat.AddText( Color( 0, 255, 0 ), text ) //green 
	else
		chat.AddText( Color( 255, 0 ,0 ), text ) //red
	end
end )