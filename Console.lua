--[[Made by Wiizzzzzzzaaaaard]]
local player = game.Players.LocalPlayer


function MakeGUI()
	local cloneref = cloneref or function(o) return o end
	local COREGUI = cloneref(game:GetService("CoreGui"))
	local gui = Instance.new("ScreenGui",COREGUI) gui.Name = "Wizard's Spell Book"	
	local frame = Instance.new("Frame",gui)
	local close = Instance.new("ImageButton",gui)
	local CloseCorner = Instance.new("UICorner",close)
	local ScrollingFrame = Instance.new("ScrollingFrame",frame)
	local WalkText = Instance.new("TextBox",ScrollingFrame) WalkText.Name = "WalkText" 
	local WalkLabel = Instance.new("TextLabel",ScrollingFrame) WalkLabel.Name = "WalkLabel"
	local JumpText = Instance.new("TextBox",ScrollingFrame) JumpText.Name = "JumpText"
	local JumpLabel = Instance.new("TextLabel",ScrollingFrame) JumpLabel.Name = "JumpLabel"
	local FlyLabel = Instance.new("TextLabel",ScrollingFrame) FlyLabel.Name = "FlyLabel"
	local FlyButton = Instance.new("TextButton",ScrollingFrame) FlyButton.Name = "FlyButton"
	local Title = Instance.new("TextLabel",frame) Title.Name = "Title"	
	local CommandBox = Instance.new("TextBox",frame) CommandBox.Name = "cmdBox" 
	local MarkUpLabel = Instance.new("TextLabel",ScrollingFrame) MarkUpLabel.Name = "MarkUpLabel"
	local MarkUpButton = Instance.new("TextButton",ScrollingFrame) MarkUpButton.Name = "MarkUpButton"
	local EraserFingerLavel = Instance.new("TextLabel",ScrollingFrame) EraserFingerLavel.Name = "EeaserFingerLavel"
	local EraserButton = Instance.new("TextButton",ScrollingFrame) EraserButton.Name = "EraserButton" 
	local EraserResetButton = Instance.new("TextButton",ScrollingFrame) EraserResetButton.Name = "EraserResetButton" 
	local ShowButton = Instance.new("TextButton",ScrollingFrame) ShowButton.Name = "ShowButton"
	local ExplorerTxt = Instance.new("TextLabel",ScrollingFrame) ExplorerTxt.Name = "ExplorerTxt"
	local ExplorerButton = Instance.new("TextButton",ScrollingFrame) ExplorerButton.Name = "ExplorerButton"
	local OutputText = Instance.new("TextLabel",gui) OutputText.Name = "Output"
	local CmdListButton = Instance.new("TextButton",frame) CmdListButton.Name = "CmdListButton"
	local CmdListCorner = Instance.new("UICorner",CmdListButton)
	local CmdList = Instance.new("ScrollingFrame",gui) CmdList.Name = "CmdList" 
	
	local RunService = game:GetService("RunService")
	local UserInputService = game:GetService("UserInputService")
	gui.ResetOnSpawn = false
	local isClose = false
	local key = ";"
	_G.Jump = 7.2
	_G.Speed = 16
	local isFlyON = false
	_G.IsEraserActive = false
	local Showing = false
	local Connection
	local Until1 = false
	local OldPosition = nil
	local OldPosition2 = nil
	_G.IsMarkUpping = false
	local Cmds = {"to","lock"}
	local CmdsTitle = {";to [PlayerName]",";lock [Distance] [PlayerName]"}
	local CmdsName = {"tp","lock"}
	local CmdClose = true
	local ExplorerClose = false
	local Connection
	
	
	gui.DisplayOrder = 1000000000
	
	frame.BackgroundColor3 = Color3.new(0.0941176,0.00784314,0.34902) 
	frame.Position = UDim2.new(0.005,0,0.59,0) frame.Size = UDim2.new(0.4,0,0.4,0) 

	close.BackgroundTransparency = 1
	close.ImageColor3 = Color3.new(0.611765, 0.611765, 0.611765)
	close.Position = UDim2.new(0.0744,0,-0.032,0) 
	close.Size = UDim2.new(0.015,0,0.031,0) 
	close.Image = "rbxassetid://17605439347"

	ScrollingFrame.BackgroundTransparency = 0.5
	ScrollingFrame.Position = UDim2.new(0.039,0,0.054,0)
	ScrollingFrame.Size = UDim2.new(0.906,0,0.768,0)
	ScrollingFrame.BackgroundColor3 = Color3.new(1,1,1)

	WalkText.BackgroundColor3 = Color3.new(0.121569, 0.121569, 0.121569)
	WalkText.BackgroundTransparency = 0.55
	WalkText.Position = UDim2.new(0.347,0,0.035,0)
	WalkText.Size = UDim2.new(0.262,0,0.062,0)
	WalkText.Text = "16"
	WalkText.PlaceholderText = "Type Number Here.."

	WalkLabel.BackgroundColor3 = Color3.new(0.431373,0,0.541176)
	WalkLabel.Position = UDim2.new(0.04,0,0.03,0)
	WalkLabel.Size = UDim2.new(0.262,0,0.062,0)
	WalkLabel.Text = "WalkSpeed"
	WalkLabel.TextColor3 = Color3.new(1,0.854902,0.0196078)

	JumpText.BackgroundColor3 = Color3.new(0.121569, 0.121569, 0.121569)
	JumpText.BackgroundTransparency = 0.55
	JumpText.Position = UDim2.new(0.347,0,0.101,0)
	JumpText.Size = UDim2.new(0.262,0,0.062,0)
	JumpText.Text = "7.2"
	JumpText.PlaceholderText = "Type Number Here.."

	JumpLabel.BackgroundColor3 = Color3.new(0.431373,0,0.541176)
	JumpLabel.Position = UDim2.new(0.04,0,0.108,0)
	JumpLabel.Size = UDim2.new(0.262,0,0.062,0)
	JumpLabel.Text = "JumpHeight"
	JumpLabel.TextColor3 = Color3.new(1,0.854902,0.0196078)

	FlyLabel.BackgroundColor3 = Color3.new(0.431373,0,0.541176)
	FlyLabel.Position = UDim2.new(0.657,0,0.029,0)
	FlyLabel.Size = UDim2.new(0.1,0,0.062,0)
	FlyLabel.Text = "Fly"
	FlyLabel.TextColor3 = Color3.new(1,0.854902,0.0196078)

	FlyButton.BackgroundColor3 = Color3.new(0,0.494118,0.541176)
	FlyButton.Position = UDim2.new(0.789,0,0.029,0)
	FlyButton.Size = UDim2.new(0.1,0,0.062,0)
	FlyButton.Text = "[F]"
	FlyButton.TextColor3 = Color3.new(0,0,0)

	Title.BackgroundColor3 = Color3.new(0.34902,0.0156863,0.545098)
	Title.Position = UDim2.new(0.197,0,-0.147,0)
	Title.Size = UDim2.new(0.551,0,0.141,0)
	Title.Text = "Wizard's Spell Book"
	Title.TextColor3 = Color3.new(1, 0.643137, 0.0313725)
	Title.Font = Enum.Font.SourceSansBold
	Title.RichText = true
	Title.TextScaled = true
	Title.TextWrapped = true
	Title.TextStrokeTransparency = 0

	CommandBox.BackgroundColor3 = Color3.new(1,1,1)
	CommandBox.BackgroundTransparency = 0.75
	CommandBox.Position = UDim2.new(0.234,0,0.851,0)
	CommandBox.Size = UDim2.new(0.515,0,0.116,0)
	CommandBox.Text = ""
	CommandBox.PlaceholderText = "Type Spell Here..(cmd)"
	CommandBox.TextColor3 = Color3.new(1,0.854902,0.0196078)
	
	EraserFingerLavel.BackgroundColor3 = Color3.new(0.431373,0,0.541176)
	EraserFingerLavel.Position = UDim2.new(0.04,0,0.19,0)
	EraserFingerLavel.Size = UDim2.new(0.262,0,0.062,0)
	EraserFingerLavel.Text = "EraserFinger"
	EraserFingerLavel.TextColor3 = Color3.new(1,0.854902,0.0196078)
	
	MarkUpLabel.BackgroundColor3 = Color3.new(0.431373,0,0.541176)
	MarkUpLabel.Position = UDim2.new(0.657,0,0.097,0)
	MarkUpLabel.Size = UDim2.new(0.1,0,0.062,0)
	MarkUpLabel.Text = "MarkUp"
	MarkUpLabel.TextColor3 = Color3.new(1,0.854902,0.0196078)

	MarkUpButton.BackgroundColor3 = Color3.new(0.541176, 0, 0)
	MarkUpButton.Position = UDim2.new(0.789,0,0.097,0)
	MarkUpButton.Size = UDim2.new(0.1,0,0.062,0)
	MarkUpButton.Text = "off"
	MarkUpButton.TextColor3 = Color3.new(0,0,0)

	EraserButton.BackgroundColor3 = Color3.new(0.541176,0,0)
	EraserButton.Position = UDim2.new(0.346,0,0.188,0)
	EraserButton.Size = UDim2.new(0.1,0,0.062,0)
	EraserButton.Text = "off"
	EraserButton.TextColor3 = Color3.new(0,0,0)

	EraserResetButton.BackgroundColor3 = Color3.new(0.423529,0.423529,0.423529)
	EraserResetButton.Position = UDim2.new(0.476,0,0.213,0)
	EraserResetButton.Size = UDim2.new(0.1,0,-0.033,0)
	EraserResetButton.Text = "Reset"
	EraserResetButton.TextColor3 = Color3.new(0,0,0)
	
	ShowButton.BackgroundColor3 = Color3.new(0.541176,0,0)
	ShowButton.Position = UDim2.new(0.476,0,0.259,0)
	ShowButton.Size = UDim2.new(0.1,0,-0.033,0)
	ShowButton.Text = "Show"
	ShowButton.TextColor3 = Color3.new(0,0,0)
	
	ExplorerTxt.BackgroundColor3 = Color3.new(0.431373,0,0.537255)
	ExplorerTxt.Position = UDim2.new(0.657,0,0.186,0)
	ExplorerTxt.Size = UDim2.new(0.1,0,0.062,0)
	ExplorerTxt.Text = "Explorer"
	ExplorerTxt.TextColor3 = Color3.new(1,0.854902,0.0196078)

	ExplorerButton.BackgroundColor3 = Color3.new(0.541176, 0, 0)
	ExplorerButton.Position = UDim2.new(0.789,0,0.186,0)
	ExplorerButton.Size = UDim2.new(0.1,0,0.062,0)
	ExplorerButton.Text = "off"
	ExplorerButton.TextColor3 = Color3.new(0,0,0)
	
	OutputText.BackgroundColor3 = Color3.new(0.223529,0,0.478431)
	OutputText.BackgroundTransparency = 0.6
	OutputText.Position = UDim2.new(0,0,0.035,0)
	OutputText.Size = UDim2.new(1,0,0.065,0)
	OutputText.TextColor3 = Color3.new(1,0.705882,0.0196078)
	OutputText.RichText = true
	OutputText.TextScaled = true
	OutputText.TextWrapped = true
	OutputText.TextStrokeTransparency = 0
	OutputText.Font = Enum.Font.SourceSansBold
	OutputText.Visible = false
	
	CmdListButton.BackgroundColor3 = Color3.new(0.368627,0.00392157,0.670588)
	CmdListButton.Position = UDim2.new(0.17,0,0.868,0)
	CmdListButton.Size = UDim2.new(0.046,0,0.078,0)
	CmdListButton.Text = "?"
	CmdListButton.RichText = true
	CmdListButton.TextScaled = true
	CmdListButton.TextWrapped = true
	CmdListButton.TextColor3 = Color3.new(1,0.666667,0.00392157)
	CmdListButton.Font = Enum.Font.SourceSansBold
	
	CmdList.BackgroundColor3 = Color3.new(0.215686,0,0.407843)
	CmdList.BackgroundTransparency = 0.2
	CmdList.BorderColor3 = Color3.new(1,0.643137,0.0235294)
	CmdList.Position = UDim2.new(0.324,0,0.31,0)
	CmdList.Size = UDim2.new(0.265,0,0.276,0)
	CmdList.ScrollBarImageColor3 = Color3.new(1,0.717647,0.00392157)
	CmdList.Visible = false
	
	local function One(TargetPlayer)
		player.Character.PrimaryPart.CFrame = TargetPlayer.PrimaryPart.CFrame + Vector3.new(0,10,0)
	end
	
	local function Two(TargetPlayer)
		Until1 = true
		repeat player.Character.PrimaryPart.CFrame = TargetPlayer.PrimaryPart.CFrame + Vector3.new(0,0,3) wait()
		until Until1 == false

	end
	
	local function MakeCmdList()
		for i,Cmd in ipairs(CmdsName)  do
			local cmd = Instance.new("TextLabel",CmdList)
			cmd.BackgroundColor3 = Color3.new(1,0.666667,0)
			cmd.BackgroundTransparency = 0.3
			if OldPosition == nil then cmd.Position = UDim2.new(0.109,0,0.039,0) else cmd.Position = OldPosition+UDim2.new(0,0,0.031,0) end
			--[[1:0.0093 = x:0.075 = 0.0093x~8 = >>0.0744<<]]
			wait(0.1)
			OldPosition = cmd.Position
			cmd.Size = UDim2.new(0.167,0,-0.024,0)
			cmd.Text = Cmd
			cmd.TextColor3 = Color3.new(1,0.74902,0)
			cmd.RichText = true
			cmd.TextScaled = true
			cmd.TextWrapped = true
			cmd.Font = Enum.Font.SourceSansBold
		end

		for i,Cmd in ipairs(CmdsTitle) do
			local cmd = Instance.new("TextLabel",CmdList)
			cmd.BackgroundColor3 = Color3.new(1,0.666667,0)
			cmd.BackgroundTransparency = 0.65
			if OldPosition2 == nil then cmd.Position = UDim2.new(0.4,0,0.039,0) else cmd.Position = OldPosition2+UDim2.new(0,0,0.031,0) end
			wait(0.1)
			OldPosition2 = cmd.Position
			cmd.Size = UDim2.new(0.4,0,-0.024,0)
			cmd.Text = Cmd
			cmd.TextColor3 = Color3.new(1,0.74902,0)
			cmd.RichText = true
			cmd.TextScaled = true
			cmd.TextWrapped = true
			cmd.Font = Enum.Font.SourceSansBold
		end
	end
	
	MakeCmdList()
	
	local function Output(Text,Time)
		OutputText.Visible = true
		OutputText.Text = Text
		wait(Time)
		OutputText.Text = ""
		OutputText.Visible = false
	end
	
	RunService.Heartbeat:Connect(function()
		wait(0.25)
		local Player = game.Workspace:FindFirstChild(player.Name)
		Player.Humanoid.UseJumpPower = false
		Player.Humanoid.JumpHeight = _G.Jump
		Player.Humanoid.WalkSpeed = _G.Speed
	end)

	JumpText.Changed:Connect(function()
		_G.Jump = JumpText.Text
	end)

	WalkText.Changed:Connect(function()
		_G.Speed = WalkText.Text
	end)
	
	close.Activated:Connect(function()
		if not isClose then isClose = true frame.Visible = false close.ImageColor3 = Color3.new(1, 1, 1)
		elseif isClose == true then isClose = false frame.Visible = true close.ImageColor3 = Color3.new(0.611765, 0.611765, 0.611765) end 
	end)
	
	CmdListButton.Activated:Connect(function()
		if not CmdClose then CmdClose = true CmdList.Visible = false CmdListButton.BackgroundColor3 = Color3.new(0.368627,0.00392157,0.670588)
		elseif CmdClose then CmdClose = false CmdList.Visible = true CmdListButton.BackgroundColor3 = Color3.new(0.254902, 0, 0.478431) end
	end)
	
	local function CheckPlayer(PlayerName)
		for _,p in ipairs(game.Workspace:GetDescendants()) do
			if p:FindFirstChild("Humanoid") then
				if string.sub(p.Humanoid.DisplayName,1,#PlayerName):lower() == PlayerName:lower() or string.sub(p.Name,1,#PlayerName):lower() == PlayerName:lower() then
					return p
				end
			end
		end
	end
	
	CommandBox.FocusLost:Connect(function(EnterPressed)
		if EnterPressed then
			local RightCmd = false
			for i,cmd in ipairs(Cmds) do
				if CommandBox.Text:sub(1,#cmd+1) == key..cmd then
					RightCmd = true
					local prefix = key..cmd
					local StartIndex = string.find(CommandBox.Text,prefix.." ")
					
					if StartIndex then
						local PlayerName = string.sub(CommandBox.Text,StartIndex+#prefix+1)
						local TargetPlayer = CheckPlayer(PlayerName)
						
						if TargetPlayer and TargetPlayer~= nil then
							if cmd == "to" then
								player.Character.PrimaryPart.CFrame = TargetPlayer.PrimaryPart.CFrame + Vector3.new(0,10,0)
							elseif cmd == "lock" then
								Until1 = true
								repeat player.Character.PrimaryPart.CFrame = TargetPlayer.PrimaryPart.CFrame.LookVector * Vector3.new(0,0,5) wait()
								until Until1 == false
							end
							Output("Success!",1)
						else
							Output("Player not found..",1)
						end
					end
				end
			end
			if not RightCmd then
				Output("Invalid command",1)
			end
		end
	end)
	
	MarkUpButton.Activated:Connect(function()
		if not _G.IsMarkUpping then
			_G.IsMarkUpping = true MarkUpButton.Text = "on" MarkUpButton.BackgroundColor3 = Color3.new(0,0.486275,0.713725)
			wait(0.1)
			for i,obj in ipairs(game.Workspace:GetDescendants()) do
				if obj:FindFirstChild("Humanoid") and not obj:FindFirstChild("MarkSpell") then
					local Highlight = Instance.new("Highlight")
					Highlight.FillTransparency = 1 Highlight.OutlineColor = Color3.new(0,1,0.85098) Highlight.OutlineTransparency = 0 Highlight.Name = "MarkSpell" Highlight.Parent = obj
				end
			end
		elseif _G.IsMarkUpping == true then
			_G.IsMarkUpping = false MarkUpButton.Text = "off" MarkUpButton.BackgroundColor3 = Color3.new(0.541176,0,0)
			for i,obj in ipairs(game.Workspace:GetDescendants()) do
				if obj:FindFirstChild("MarkSpell") then
					obj.MarkSpell:Destroy()
				end
			end
		end
	end)

	EraserButton.Activated:Connect(function()
		if not _G.IsEraserActive then
			_G.IsEraserActive = true EraserButton.Text = "on" EraserButton.BackgroundColor3 = Color3.new(0,0.486275,0.713725)
			Connection = UserInputService.InputBegan:Connect(function(input,gpe)
				if input.UserInputType == Enum.UserInputType.MouseButton1 and not gpe then
					local MouseLocation = UserInputService:GetMouseLocation()
					local MouseRay = game.Workspace.CurrentCamera:ViewportPointToRay(MouseLocation.X,MouseLocation.Y)
					local RaycastResult = workspace:Raycast(MouseRay.Origin,MouseRay.Direction*1000)
					if RaycastResult then
						wait(0.1)
						if not RaycastResult.Instance:FindFirstChild("wsb_ES") then							
							local Check = Instance.new("Folder")
							Check.Name = "wsb_ES"
							Check.Parent = RaycastResult.Instance
							local OldCollide = Instance.new("BoolValue",Check)
							OldCollide.Name = "OldCollide"
							OldCollide.Value = RaycastResult.Instance.CanCollide
							local OldTransparency = Instance.new("NumberValue",Check)
							OldTransparency.Name = "OldTransparency"
							OldTransparency.Value = RaycastResult.Instance.Transparency
							local OldColor = Instance.new("Color3Value",Check)
							OldColor.Name = "OldColor"
							OldColor.Value = RaycastResult.Instance.Color
							
							RaycastResult.Instance.CanCollide = false
							RaycastResult.Instance.Transparency = 1
						end
					else
						Output("Not found",1)
					end
				end
			end)
		elseif _G.IsEraserActive then
			_G.IsEraserActive = false EraserButton.Text = "off" EraserButton.BackgroundColor3 = Color3.new(0.541176,0,0) Connection:Disconnect()
		end
	end)

	EraserResetButton.Activated:Connect(function()
		for i,obj in ipairs(game.Workspace:GetDescendants()) do
			local Spell = obj:FindFirstChild("wsb_ES")
			if Spell and Spell:IsA("Folder") then
				obj.CanCollide = Spell.OldCollide.Value
				obj.Transparency = Spell.OldTransparency.Value
				obj.Color = Spell:FindFirstChild("OldColor").Value
				wait()
				obj.wsb_ES:Destroy()
			end
		end
	end)
	
	ShowButton.Activated:Connect(function()
		if not Showing then
			Showing = true ShowButton.BackgroundColor3 = Color3.new(0,0.486275,0.713725)
			for i,obj in ipairs(game.Workspace:GetDescendants()) do
				local Spell = obj:FindFirstChild("wsb_ES")
				if Spell and Spell:IsA("Folder") then
					obj.Transparency = 0.5
					obj.Color = Color3.new(0,1,0)
				end
			end
		else
			Showing	= false ShowButton.BackgroundColor3 = Color3.new(0.541176,0,0)
			for i,obj in ipairs(game.Workspace:GetDescendants()) do
				local Spell = obj:FindFirstChild("wsb_ES")
				if Spell and Spell:IsA("Folder") then
					obj.Transparency = 1
					obj.Color = Spell:FindFirstChild("OldColor").Value
				end
			end
		end
	end)
	
	local function Explorer()
		local ExplorerFlame = Instance.new("ScrollingFrame",gui)
		
	end
	
	ExplorerButton.Activated:Connect(function()
		if not ExplorerClose then
			ExplorerClose = true ExplorerButton.BackgroundColor3 = Color3.new(0,0.486275,0.713725)
			Explorer()
		else
			ExplorerClose = false ExplorerButton.BackgroundColor3 = Color3.new(0.541176,0,0)
		end
	end)
	
end

function Find()
	for i,child in game:GetService("CoreGui"):GetChildren() do
		if child.Name == "Wizard's Spell Book" then
			return child
		end
	end
end

do 
	local WizardsSpellBook = Find()
	if WizardsSpellBook then
		local AnnounceGUI = Instance.new("ScreenGui") AnnounceGUI.Name = "AnnounceGUI"
		AnnounceGUI.Parent = player.PlayerGui
		local Frame = Instance.new("Frame")
		Frame.Parent = AnnounceGUI
		Frame.Size = UDim2.new(0.46,0,0.323,0) Frame.BackgroundColor3 = Color3.new(0.247059,0,0.372549) Frame.Position = UDim2.new(0.269,0,0.06,0) Frame.BorderSizePixel = 2
		local Title = Instance.new("TextLabel") Title.Parent = Frame Title.Size = UDim2.new(0.712,0,0.25,0) Title.Position = UDim2.new(0.145,0,-0.002,0) Title.BackgroundTransparency = 1 Title.Text = "Wizard's Spell Book is already exist" 
		Title.TextColor3 = Color3.new(1, 0.717647, 0.0588235) Title.RichText = true Title.TextScaled = true Title.TextWrapped = true
		Title.TextStrokeTransparency = 0 Title.Font = Enum.Font.SourceSansBold
		local A = Instance.new("TextLabel") A.Parent = Frame A.Size = UDim2.new(0.59,0,0.218,0) A.Position = UDim2.new(0.208,0,0.21,0) A.BackgroundTransparency = 1 A.Text = "[A]Make new one and delete Current one"
		A.TextColor3 = Color3.new(0,0.866667,1) A.RichText = true A.TextScaled = true A.TextWrapped = true
		local B = Instance.new("TextLabel") B.Parent = Frame B.Size = UDim2.new(0.289,0,0.185,0) B.Position = UDim2.new(0.208,0,0.403,0) B.BackgroundTransparency = 1 B.Text = "[B]Use Current one"
		B.TextColor3 =Color3.new(0,0.866667,1) B.RichText = true B.TextScaled = true B.TextWrapped = true
		local AB = Instance.new("TextButton") AB.Parent = Frame AB.BackgroundColor3 = Color3.new(0.54902,0,1) AB.Size = UDim2.new(0.289,0,0.185,0) AB.Position = UDim2.new(0.208,0,0.698,0) AB.Text = "A"
		AB.TextColor3 = Color3.new(1,0.666667,0) AB.RichText = true AB.TextScaled = true AB.TextWrapped = true AB.Font = Enum.Font.SourceSansBold AB.BorderSizePixel = 2
		local BB = Instance.new("TextButton") BB.Parent = Frame BB.BackgroundColor3 = Color3.new(0.54902,0,1) BB.Size = UDim2.new(0.289,0,0.185,0) BB.Position = UDim2.new(0.545,0,0.698,0) BB.Text = "B"
		BB.TextColor3 = Color3.new(1,0.666667,0) BB.RichText = true BB.TextScaled = true BB.TextWrapped = true BB.Font = Enum.Font.SourceSansBold BB.BorderSizePixel = 2

		AB.Activated:Connect(function()
			AnnounceGUI:Destroy()
			WizardsSpellBook:Destroy()
			MakeGUI()
		end)
		BB.Activated:Connect(function()
			AnnounceGUI:Destroy()
		end)
	else
		MakeGUI()
	end
end
