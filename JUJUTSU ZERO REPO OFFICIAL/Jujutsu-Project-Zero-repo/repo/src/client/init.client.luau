--!strict
-- THE client entry point: two-phase bootstrap of everything in Controllers/.
local Controllers = script.Controllers

local loaded: { [string]: any } = {}
for _, child in Controllers:GetChildren() do
	if child:IsA("ModuleScript") then
		loaded[child.Name] = require(child)
	end
end
for _, controller in loaded do
	if typeof(controller.init) == "function" then controller.init() end
end
for _, controller in loaded do
	if typeof(controller.start) == "function" then task.spawn(controller.start) end
end
