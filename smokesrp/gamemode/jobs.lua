--Common ground for adding jobs
--team, cmd, loadout

jobs = {};			--an array that holds all of the jobs
					--at the index corresponding to their ID number

--defaults this makes a citizen class if you dont pass arguments to the constructor.
Job = {name = "Citizen", color = Color( 125, 125, 125, 255 ), loadout = {"weapon_physcannon", "weapon_physgun","gmod_tool"}, cmd = "srp_citizen"};
function Job:new(name, color, loadout, cmd)
	local struct = {name = name, color = color, loadout = loadout, cmd = cmd, id = (#jobs + 1)};
	setmetatable(struct, {__index = Job});
	table.insert(jobs, struct);
	team.SetUp(#jobs, name, color) --creates the team
	concommand.Add( struct.cmd, function( ply )//creates console command for switching
		ply:SetTeam( id )
		ply:Spawn()
	end )
	return struct;
end

Job.new();--creates the citizen job stored in jobs[1]
Job.new("Police Officer", Color( 125, 125, 125, 255 ), {"gmod_tool"},"srp_police");	--creates an example police job stored in jobs[2]