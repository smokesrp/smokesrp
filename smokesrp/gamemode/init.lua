AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )

include( "shared.lua" )
include( "params" )

function GM:PlayerSpawn( ply )
	self.BaseClass:PlayerSpawn( ply )
	
	ply:SetGravity( 1 )
	ply:SetHealth( 100, true )
	
	ply:SetWalkSpeed( params.walkspeed )
	ply:SetRunSpeed( params.runspeed )
end

function GM:PlayerInitialSpawn( ply )
	self.BaseClass:PlayerSpawn( ply )
	for k,v in pairs( params.startcmds ) do //Run every command in the params.startcmds array
		ply:ConCommand( v )
	end
end

function GM:PlayerLoadout( ply )
	if( ply:Team() == 1 ) then //Citizen
		ply:Give( "weapon_phygun" )
		ply:Give( "weapon_physcannon" )
		ply:Give( "gmod_tool" )
	end
end