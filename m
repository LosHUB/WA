local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Interface/CustomFIeld/main/RayField.lua'))()
local thumbsDownEmoji = utf8.char(0x1F44E)
local noEntryEmoji = utf8.char(0x1F6AB)
local repeatEmoji = utf8.char(0x1F501)
local signalStrengthEmoji = utf8.char(0x1F4F6)
local doorEmoji = utf8.char(0x1F6AA)
local repeatSingleEmoji = utf8.char(0x1F502)
local clockwiseVerticalArrowsEmoji = utf8.char(0x1F503)
local timerClockEmoji = utf8.char(0x23F2)

local VirtualInputManager = game:GetService("VirtualInputManager")
local Player = game:GetService("Players").LocalPlayer or game:GetService("Players").PlayerAdded:Wait()
local VCurrentVersion



local SuggestionsWebhookUnsplit = "https://discordapp.com/api/webhooks/1088377340263944262/3j4NSuPTxdvdEf3VPpgvDYWdrV_y6-4C_Jc5SA3tGQ3Gcra0QfgKl4NghQzdhWkQ1srV"


local SuggestionsWebhookParts = SuggestionsWebhookUnsplit:split("{")


local SuggestionsWebhook = (SuggestionsWebhookParts[1] or "") .. (SuggestionsWebhookParts[2] or "")

local HttpService = game:GetService("HttpService")

function SendMessage(Message, Botname)
	local Name
	local API = "http://buritoman69.glitch.me/webhook"

	if (not Message or Message == "" or not Botname) or not Webhook then
		Name = "GameBot"
		return error("nil or empty message!")
	else
		Name = Botname
	end

	local Body = {
		['Key'] = tostring("applesaregood"),
		['Message'] = tostring(Message),
		['Name'] = Name,
		['Webhook'] = Webhook  
	}

	Body = HttpService:JSONEncode(Body)
	local Data = game:HttpPost(API, Body, false, "application/json")

	return Data or nil;
end

local function Notify(Message, Duration)
	Rayfield:Notify({
		Title = thumbsDownEmoji .. " L-HUB " .. thumbsDownEmoji,
		Content = Message,
		Duration = Duration,
		Image = 4483362458,
		Actions = {},
	})
end

local Window = Rayfield:CreateWindow({
    Name = thumbsDownEmoji .. " L-HUB " .. thumbsDownEmoji,
    LoadingTitle = thumbsDownEmoji .. " L-HUB " .. thumbsDownEmoji,
    LoadingSubtitle = ".L.#5123",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil, -- Create a custom folder for your hub/game
       FileName = "L-HUB"
    },
    Discord = {
       Enabled = true,
       Invite = "srh43uxcVG", -- The Discord invite code, do not include discord.gg/
       RememberJoins = false -- Set this to false to make them join the discord every time they load it up
    },
    KeySystem = true, -- Set this to true to use our key system
    KeySettings = {
       Title = thumbsDownEmoji .. " L-HUB " .. thumbsDownEmoji,
       Subtitle = "Key System",
       Note = "Join the discord (discord.gg/srh43uxcVG)",
       FileName = "L-HUBKey",
       SaveKey = true,
       GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = "https://pastebin.com/raw/X5NJWfqD"
    }
 })
 
 local Universal = Window:CreateTab("Universal", 4483362458) -- Title, Image
 
 Universal :CreateButton({
   Name = noEntryEmoji .. " Anti-AFK",
   Info = "Button info/Description.", -- Speaks for itself, Remove if none.
   Interact = 'Noob Hub',
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/AltsegoD/scripts/egoD/AntiAFKTimer.lua"))()
   end,
})


Universal:CreateToggle({
			Name = repeatEmoji .. " Auto Rejoin",
			CurrentValue = false,
			Flag = "Universal-AutoRejoin",
			Callback = function(Value)
				if Value then
					repeat task.wait() until game.CoreGui:FindFirstChild('RobloxPromptGui')

					local lp,po,ts = game:GetService('Players').LocalPlayer,game.CoreGui.RobloxPromptGui.promptOverlay,game:GetService('TeleportService')

					po.ChildAdded:connect(function(a)
						if a.Name == 'ErrorPrompt' then
							while true do
								ts:Teleport(game.PlaceId)
								task.wait(2)
							end
						end
					end)
				end
			end,
		})

		Universal:CreateToggle({
			Name = signalStrengthEmoji .. " Auto Re-Execute",
			CurrentValue = false,
			Flag = "Universal-AutoRe-Execute",
			Callback = function(Value)
				if Value then
					local queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)

					if queueteleport then
					end
				end
			end,
		})

		Universal:CreateSection("")

		local WalkSpeed = 0
		local JumpPower = 0

	Universal:CreateSlider({
		Name = "Walk Speed",
		Range = {
			0,
			1000
		},
		Increment = 1,
		Suffix = "Walkspeed",
		CurrentValue = 25,
		Flag = "Walk Speed",
		Callback = function(x)
			WalkSpeed = x
			game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = x
		end
	})


	Universal:CreateSlider({
		Name = "Jump Power",
		Range = {
			0,
			1000
		},
		Increment = 1,
		Suffix = "Jump Power",
		CurrentValue = 50,
		Flag = "Jump Power",
		Callback = function(x)
			JumpPower = x
			game.Players.LocalPlayer.Character.Humanoid.JumpPower = x
		end
	})

Universal:CreateToggle({
    Name = "Loop Walk Speed",
    CurrentValue = false,
    Flag = "Loop Walk Speed",
    Callback = function(x)
        getgenv().LoopWalkspeed = x
    end
})

Universal:CreateToggle({
    Name = "Loop Jump Power",
    CurrentValue = false,
    Flag = "Loop Jump Power",
    Callback = function(x)
        getgenv().LoopJumpPower = x
    end
})

Universal:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Flag = "Infinite Jump",
    Callback = function(x)
        getgenv().InfiniteJump = x
    end
})



local Noclip = nil
local Clip = nil

function noclip()
	Clip = false
	local function Nocl()
		if Clip == false and game.Players.LocalPlayer.Character ~= nil then
			for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
				if v:IsA('BasePart') and v.CanCollide and v.Name ~= floatName then
					v.CanCollide = false
				end
			end
		end
		wait(0.21) -- basic optimization
	end
	Noclip = game:GetService('RunService').Stepped:Connect(Nocl)
end

function clip()
	if Noclip then Noclip:Disconnect() end
	Clip = true
end




Toggle = Universal:CreateToggle({
	Name = "Noclip",
	CurrentValue = false,
	Flag = "Toggle3",
	Callback = function(Value)
		if Value then
			noclip()
		else
			clip()
		end
	end,
})


		Universal:CreateSection("Safety")

		local GroupId = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Creator.CreatorTargetId

		Universal:CreateToggle({
			Name = doorEmoji .. " Leave Upon Staff Join",
			Info = "Kicks you if a player above the group role 1 joins/is in the server",
			CurrentValue = false,
			Flag = "Universal-AutoLeave",
			Callback = function(Value)
				if Value then
					for i,v in pairs(game.Players:GetPlayers()) do
						pcall(function()
							if v:IsInGroup(GroupId) and v:GetRankInGroup(GroupId) > 1 then
								AutoRejoin:Set(false)
								Player:Kick("Detected Staff (Player above group role 1)")
							end
						end)
					end
				end
			end,
		})

		game:GetService("Players").PlayerAdded:Connect(function(v)
			if Rayfield.Flags["Universal-AutoLeave"].CurrentValue then
				pcall(function()
					if v:IsInGroup(GroupId) and v:GetRankInGroup(GroupId) > 1 then
						AutoRejoin:Set(false)
						Player:Kick("Detected Staff (Player above group role 1)")
					end
				end)
			end
		end)

		
		
		Universal:CreateButton({
			Name = repeatSingleEmoji .. " One-Time Server Hop",
			Callback = function()
				local Http = game:GetService("HttpService")
				local TPS = game:GetService("TeleportService")
				local Api = "https://games.roblox.com/v1/games/"

				local _place,_id = game.PlaceId, game.JobId
				local _servers = Api.._place.."/servers/Public?sortOrder=Desc&limit=100"

				local function ListServers(cursor)
					local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))
					return Http:JSONDecode(Raw)
				end

				local Next; repeat
					local Servers = ListServers(Next)
					for i,v in next, Servers.data do
						if v.playing < v.maxPlayers and v.id ~= _id then
							local s,r = pcall(TPS.TeleportToPlaceInstance,TPS,_place,v.id,Player)
							if s then break end
						end
					end

					Next = Servers.nextPageCursor
				until not Next
			end,
		})

		Universal:CreateSection("")

local Speed=50;loadstring(game:HttpGet("https://raw.githubusercontent.com/LegitH3x0R/Roblox-Scripts/main/AEBypassing/RootAnchor.lua"))()local UIS=game:GetService("UserInputService")local OnRender=game:GetService("RunService").RenderStepped;local Player=game:GetService("Players").LocalPlayer;local Character=Player.Character or Player.CharacterAdded:Wait()local Camera=workspace.CurrentCamera;local Root=Character:WaitForChild("HumanoidRootPart")local C1,C2,C3;local Nav={Flying=false,Forward=false,Backward=false,Left=false,Right=false}C1=UIS.InputBegan:Connect(function(Input)if getgenv()["Fly | E"] then if Input.UserInputType==Enum.UserInputType.Keyboard then if Input.KeyCode==Enum.KeyCode.E then Nav.Flying=not Nav.Flying;Root.Anchored=Nav.Flying elseif Input.KeyCode==Enum.KeyCode.W then Nav.Forward=true elseif Input.KeyCode==Enum.KeyCode.S then Nav.Backward=true elseif Input.KeyCode==Enum.KeyCode.A then Nav.Left=true elseif Input.KeyCode==Enum.KeyCode.D then Nav.Right=true end end end end)C2=UIS.InputEnded:Connect(function(Input)if Input.UserInputType==Enum.UserInputType.Keyboard then if Input.KeyCode==Enum.KeyCode.W then Nav.Forward=false elseif Input.KeyCode==Enum.KeyCode.S then Nav.Backward=false elseif Input.KeyCode==Enum.KeyCode.A then Nav.Left=false elseif Input.KeyCode==Enum.KeyCode.D then Nav.Right=false end end end)C3=Camera:GetPropertyChangedSignal("CFrame"):Connect(function()if Nav.Flying then Root.CFrame=CFrame.new(Root.CFrame.Position,Root.CFrame.Position+Camera.CFrame.LookVector)end end)task.spawn(function()while true do local Delta=OnRender:Wait()if Nav.Flying then if Nav.Forward then Root.CFrame=Root.CFrame+(Camera.CFrame.LookVector*(Delta*Speed))end;if Nav.Backward then Root.CFrame=Root.CFrame+(-Camera.CFrame.LookVector*(Delta*Speed))end;if Nav.Left then Root.CFrame=Root.CFrame+(-Camera.CFrame.RightVector*(Delta*Speed))end;if Nav.Right then Root.CFrame=Root.CFrame+(Camera.CFrame.RightVector*(Delta*Speed))end end end end)

Universal:CreateToggle({
    Name = "Fly | E",
    CurrentValue = false,
    Flag = "Fly | E",
    Callback = function(x)
        getgenv()["Fly | E"] = x
        if x == false then
            for i,v in next, Nav do
                v = false
            end
            Root.Anchored = false
        end
    end
})

Universal:CreateSlider({
    Name = "Fly Speed",
    Range = {0, 1000},
    Increment = 1,
    Suffix = "Fly Speed",
    CurrentValue = 25,
    Flag = "Fly Speed",
    Callback = function(x)
        Speed = x
    end,
})

game:GetService("UserInputService").InputBegan:Connect(function(x)
    if not getgenv().InfiniteJump then return end
    if x.KeyCode == Enum.KeyCode.Space then
        game.Players.LocalPlayer.Character.Humanoid:ChangeState(3)
    end
end)

game.Players.LocalPlayer.Character.Humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
    if not getgenv().LoopWalkspeed then return end
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = WalkSpeed
end)

game.Players.LocalPlayer.Character.Humanoid:GetPropertyChangedSignal("JumpPower"):Connect(function()
    if not getgenv().LoopJumpPower then return end
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = JumpPower
end)

local Tab = Window:CreateTab("ESP Tab", 11606709435)

	local Section = Tab:CreateSection("ESP")

	local ESP = loadstring(game:HttpGet("https://kiriot22.com/releases/ESP.lua"))();ESP:Toggle(false);ESP.Names = false;ESP.Tracers = false;ESP.Boxes = false;ESP.FaceCamera = false;ESP.TeamColor = false

	Tab:CreateToggle({
		Name = "ESP",
		CurrentValue = false,
		Flag = "ESP",
		Callback = function(x)
			ESP:Toggle(x)
		end
	})

	Tab:CreateToggle({
		Name = "Boxes",
		CurrentValue = false,
		Flag = "Boxes",
		Callback = function(x)
			ESP.Boxes = x
		end
	})

	Tab:CreateToggle({
		Name = "Names",
		CurrentValue = false,
		Flag = "Names",
		Callback = function(x)
			ESP.Names = x
		end
	})

	Tab:CreateToggle({
		Name = "Tracers",
		CurrentValue = false,
		Flag = "Tracers",
		Callback = function(x)
			ESP.Tracers = x
		end
	})

	Tab:CreateToggle({
		Name = "Face Camera",
		CurrentValue = false,
		Flag = "FaceCamera",
		Callback = function(x)
			ESP.FaceCamera = x
		end
	})

	Tab:CreateToggle({
		Name = "Team Colour",
		CurrentValue = false,
		Flag = "TeamColor",
		Callback = function(x)
			ESP.TeamColor = x
		end
	})



	local Tab = Window:CreateTab("Information Tab", 11607938487)

	local Section = Tab:CreateSection("Client Information")

	local dt = DateTime.now()

	local Time = "Time: %s %s"
	local Ping = "Ping: %s"
	local CPU = "CPU Usage: %s"
	local TimeLabel = Tab:CreateLabel(Time:format(dt:FormatLocalTime("dddd", "en-us"), dt:FormatLocalTime("LT", "en-us")))
	local PingLabel = Tab:CreateLabel(Ping:format(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString():match("%d+.%d")))
	local CPULabel = Tab:CreateLabel(CPU:format(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString():match("%p%d+%p%u+%p")))

	local Section = Tab:CreateSection("Server Information")

	local Uptime = 0
	local Uptime2 = "Server Uptime: %d Seconds"
	local Players = "Players: %d"
	local PlayersLabel = Tab:CreateLabel(Players:format(#game.Players:GetPlayers()))
	local UptimeLabel = Tab:CreateLabel(Uptime2:format(Uptime))

	task.spawn(function()
		while task.wait(1) do
			Uptime = Uptime + 1
			TimeLabel:Set(Time:format(dt:FormatLocalTime("dddd", "en-us"), dt:FormatLocalTime("LT", "en-us")))
			PingLabel:Set(Ping:format(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString():match("%d+.%d")))
			CPULabel:Set(CPU:format(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString():match("%p%d+%p%u+%p")))
			PlayersLabel:Set(Players:format(#game.Players:GetPlayers()))
			UptimeLabel:Set(Uptime2:format(Uptime))
		end
	end)

		local Credits = Window:CreateTab("Credits", 4483362458)

		Credits:CreateLabel("👎 L-HUB was made by .L.#7650 👎")

		Credits:CreateButton({
			Name = "Join Discord",
			Callback = function()
			
			
syn.request({
   Url = "http://127.0.0.1:6463/rpc?v=1",
   Method = "POST",
   Headers = {
       ["Content-Type"] = "application/json",
       ["Origin"] = "https://discord.com"
   },
   Body = game:GetService("HttpService"):JSONEncode({
       cmd = "INVITE_BROWSER",
       args = {
           code = "srh43uxcVG"
       },
       nonce = game:GetService("HttpService"):GenerateGUID(false)
   }),
})
			
			end,
		})
		
		local Section = Credits:CreateSection("Suggestion off join me discord for suggestion")

Credits:CreateInput({
    Name = "Suggestion",
    PlaceholderText = "Insert Suggestion Here",
    NumbersOnly = false,
    CharacterLimit = 300,
    Enter = true,
    RemoveTextAfterFocusLost = false,
    Callback = function(Text)
        if #Text > 3 then
            pcall(function()
                if isfile and writefile and readfile then
                    local CurrentTime = tick()

                    local function SetSuggestionsWebhook()
                        Webhook = SuggestionsWebhook
                        local success, result = pcall(SendMessage, "[L-HUB] Data: "..((Player.Name ~= Player.DisplayName and Player.DisplayName) or Player.DisplayName).." suggested "..Text.." on "..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name, "Suggestion")
                        if success then
                            Notify("Successfully Sent Suggestion", 5)
                            writefile("L-HUBWebhooking2.txt", CurrentTime)
                            print("[L-HUB] Debug: Webhook Delay Set at "..CurrentTime)
                        else
                            Notify("Unsuccessful Sending Suggestion, Error: "..result, 5)
                        end
                    end

                    if not isfile("L-HUBWebhooking2.txt") then
                        SetSuggestionsWebhook()
                    elseif tonumber(readfile("L-HUBWebhooking2.txt")) < CurrentTime - 600 then
                        SetSuggestionsWebhook()
                    else
                        Webhook = nil
                        Notify("You are on a 10 minutes Cooldown", 5)
                    end
                else
                    Notify("Your Executor does not support this feature", 5)
                end
            end)
        else
            Notify("Invalid Suggestion", 5)
        end
    end,
})





