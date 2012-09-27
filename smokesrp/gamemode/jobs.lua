--Common ground for adding jobs
--team, cmd, loadout

jobs = {};				--an array that holds all of the jobs
					--at the index corresponding to their ID number

table.insert( jobs, {name = "Citizen", color = Color( 125, 125, 125, 255 ), loadout= {"weapon_physgun", "weapon_physcannon", "gmod_tool"}});--creates the citizen job stored in jobs[1]
table.insert( jobs, {name = "Police Officer", color = Color( 125, 125, 125, 255 ), loadout = {"gmod_tool"}});	--creates an example police job stored in jobs[2]

concommand.Add("srp_job", function(ply, command, args)
	id = tonumber(args[1]);
	if(id == nil or id < 1 or id > #jobs) then
		return;						--if the argument is nil or less than 1
	end
	ply:SetTeam(id);					--or greater than the amount of jobs
	ply:Spawn();
	ply:KillSilent();
end )
