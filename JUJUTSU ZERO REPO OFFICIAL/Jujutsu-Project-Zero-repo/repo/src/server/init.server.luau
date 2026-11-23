--!strict
-- THE server entry point: two-phase bootstrap of everything in Systems/.
local Systems = script.Systems

local loaded: { [string]: any } = {}
for _, child in Systems:GetChildren() do
	if child:IsA("ModuleScript") then
		loaded[child.Name] = require(child)
	end
end
for _, system in loaded do
	if typeof(system.init) == "function" then system.init() end
end
for _, system in loaded do
	if typeof(system.start) == "function" then task.spawn(system.start) end
end
