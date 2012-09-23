--Common ground for adding jobs
--team, cmd, loadout

jobs = {};			--an array that holds all of the jobs
					--at the index corresponding to their ID number
currentID = 1;		--indexes in Lua start at 1

--defaults this makes a citizen class if you dont pass arguments to the constructor.
Job = {loadout = {"weapon_physcannon", "weapon_physgun","gmod_tool"}, cmd = "srp_citizen"};
function Job:new(loadout, cmd)
	local struct = { loadout = loadout, cmd = cmd, id = currentID};
	setmetatable(struct, {__index = Job});
	table.insert(jobs, struct);
	currentID = currentID+1;
	return struct;
end

--Example usage
Job.new();								--creates the citizen job stored in jobs[1]
Job.new({"gmod_tool"},"srp_police");	--creates an example police job stored in jobs[2]
print(jobs[1].id);
print(jobs[2].id);
