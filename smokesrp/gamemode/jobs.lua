--Common ground for adding jobs
--team, cmd, loadout

jobs = {};			--an array that holds all of the jobs
					--at the index corresponding to their ID number

--defaults this makes a citizen class if you dont pass arguments to the constructor.
Job = {name = "Citizen", Color( 125, 125, 125, 255 ), loadout = {"weapon_physcannon", "weapon_physgun","gmod_tool"}, cmd = "srp_citizen"};
function Job:new(name, color, loadout, cmd)
	local struct = {name = name, color = color loadout = loadout, cmd = cmd, id = (#jobs + 1)};
	setmetatable(struct, {__index = Job});
	table.insert(jobs, struct);
	team.SetUp(#jobs, name, color) --creates the team
	return struct;
end
