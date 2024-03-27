getgenv().Autoclicker = false
getgenv().EggFarmer = false
getgenv().Rebirth = false
_G.eggtype = "a"
_G.Eggquantity = "1"
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Coso Hub", HidePremium = true, SaveConfig = true, ConfigFolder = "OrionTest"})
local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = true
})


OrionLib:MakeNotification({
	Name = "Title!",
	Content = "Welcome and Thank you, join in discord https://discord.gg/ArQk8Qwv ",
	Image = "rbxassetid://4483345998",
	Time = 5
})
Tab:AddToggle({
	Name = "Autoclicker🤓",
	Default = false,
	Callback = function(Value)
		getgenv().Autoclicker = Value
        while Autoclicker do 
        game:GetService("ReplicatedStorage").Remotes.Click:InvokeServer()

        end
	end    
})
Tab:AddToggle({
	Name = "AutoRebirth",
	Default = false,
	Callback = function(Value)
		getgenv().Rebirth = Value
        while Rebirth do 
            game:GetService("ReplicatedStorage").Remotes.Rebirth:FireServer() 
            wait(1)
        end
	end    
})


Tab:AddDropdown({
	Name = "Teleport",
	Default = "1",
	Options = {"Spawn", "Desert","Snow","Cave","Ocean","Jungle","Volcano","Space","Undead Forest","Heaven","Hell Dungeon"},
	Callback = function(Value)
	        local pl = game.Players.LocalPlayer.Character.HumanoidRootPart
local blocks = game:GetService("Workspace").TeleportBricks[Value].CFrame
print(blocks)

pl.CFrame = blocks
	end    
})
local Section = Tab:AddSection({
	Name = "Egg Hatcher"
})
Tab:AddToggle({
	Name = "Egg Hatcher",
	Default = false,
	Callback = function(Value)
    getgenv().EggFarmer = Value
    while EggFarmer do
    local args = {[1] = _G.eggtype,[2] = _G.Eggquantity}game:GetService("ReplicatedStorage").Remotes.buyEgg:InvokeServer(unpack(args))
wait(1)
        end
        print(Value)
	end    
})
Tab:AddDropdown({
	Name = "Dropdown",
	Default = "1",
	Options = {"Starter Egg", "Spotted Egg", "Flower Egg", "Desert Egg","Snow Egg","Cave Egg","Beach Egg","Jungle Egg","Volcano Egg","Space Egg","Eye Egg","Angel Egg","Hell Egg"},
	Callback = function(EggType)
   _G.eggtype = EggType
		print(EggType)
	end    
})
Tab:AddButton({
	Name = "Multiple Egg Hatcher",
	Callback = function()
      		_G.Eggquantity = 2
  	end    
})
