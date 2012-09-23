--A sample of using metatables as a class
Player = {hp = 100, xp = 0};
function Player:new(hp, xp)
	local struct = { hp = hp, xp = xp };
	setmetatable(struct, {__index = Player});
	return struct;
end

john = Player.new();
print (john.hp,john.xp);
