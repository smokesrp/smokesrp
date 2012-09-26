include( "jobs.lua" )
AddCSLuaFile( "jobs.lua" )
AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )
include( "shared.lua" )
include( "params.lua" )
include("sql.lua")
include( "admin/admin_init.lua" )

function GM:PlayerSpawn( ply )
	self.BaseClass:PlayerSpawn( ply )
	ply:SetGravity( 1 )
	ply:SetHealth( 100, true )
	ply:SetWalkSpeed( params.walkspeed )
	ply:SetRunSpeed( params.runspeed )
end

function GM:PlayerInitialSpawn( ply )
	ply:SetTeam( 1 )
	self.BaseClass:PlayerSpawn( ply )
	timer.Create("Salary", 15,0, function() Salary( ply ) end) -- Calls the Salary function every 15 seconds
end

function GM:PlayerLoadout( ply )
	local lo = jobs[ply:Team()].loadout
	for index = 1, #lo do
		ply:Give(lo[index]);
	end
end

function Salary ( ply )
	local salary = ply:GetNWInt("money") + math.random(5,25)
	ply:SetNWInt("money", salary)
	save( ply ) -- Saves the players money everytime a salary is recieved
end