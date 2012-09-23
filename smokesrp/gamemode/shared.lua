GM.Name			= "Smokes RP"
GM.Author		= "Dylan \"Laredef\" Stokes, Tyler \"Olaf\" Stokes, Christopher \"mrchris75\" Tosques"
GM.Email		= "smokesrp@gmail.com"
GM.Website		= ""

DeriveGamemode( "sandbox" )
include("jobs.lua")

Job.new();												--creates the citizen job stored in jobs[1]
Job.new("Police Officer", Color( 125, 125, 125, 255 ), {"gmod_tool"},"srp_police");	--creates an example police job stored in jobs[2]

for index = 1, #jobs do
	concommand.Add( jobs[index].cmd, function()
		ply:SetTeam(index)
		ply:Spawn()
		ply:PrintMessage( HUD_PRINTTALK, "You have become a "..team.GetName( ply:Team() ).."." )
	end )
end