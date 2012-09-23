include( "jobs.lua" )
params = {}

params.walkspeed = 325
params.runspeed = 500

params.startcmds = {}

for index = 1, #jobs do
	table.insert(params.startcmds, jobs[index].cmd);
end