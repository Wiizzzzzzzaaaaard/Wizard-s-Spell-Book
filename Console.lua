--[[Made by Wiizzzzzzzaaaaard discord -> https://discord.gg/ZzBRftGTR2]] 

local player = game.Players.LocalPlayer
local cloneref = cloneref or function(o) return o end
local COREGUI = cloneref(game:GetService("CoreGui"))


function MakeGUI()
	local gui = Instance.new("ScreenGui") gui.Name = "Wizard's Spell Book" 
	local success = pcall(function() gui.Parent = COREGUI end) if not success then gui.Parent = player.PlayerGui end
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
	local PlayerMarkUpButton = Instance.new("TextButton",ScrollingFrame) PlayerMarkUpButton.Name = "PlayerMarkUpButton"
	local NPCMarkUpButton = Instance.new("TextButton",ScrollingFrame) PlayerMarkUpButton.Name = "MarkUpButton"	
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
	local UpdsButton = Instance.new("TextButton",frame) UpdsButton.Name = "UpdsButton"
	local VerButton = Instance.new("TextButton",frame) VerButton.Name = "VerButton"
	local VerMessage = Instance.new("Frame",gui) VerMessage.Name = "VerMessageButton" VerMessage.Visible = false
	local VerLabel = Instance.new("TextLabel",VerMessage) VerLabel.Name = "VerLabel"
	local MessageLabel = Instance.new("TextLabel",VerMessage) MessageLabel.Name = "MessageLabel"
	local ReCheckButton = Instance.new("ImageButton",VerMessage) ReCheckButton.Name = "ReCheckButton"
	local UpdateVerButton = Instance.new("TextButton",VerMessage) UpdateVerButton.Name = "UpdateVerButton" UpdateVerButton.Visible = false
	local IgnoreVerButton = Instance.new("TextButton",VerMessage) IgnoreVerButton.Name = "IgnoreVerButton" IgnoreVerButton.Visible = false
	local UpdsUI = Instance.new("ScrollingFrame",gui) UpdsUI.Name = "UpdsUI" UpdsUI.Visible = false
	local UpdsTitle = Instance.new("TextLabel",UpdsUI) UpdsTitle.Name = "Title"
	local UpdsTitleUnderLine = Instance.new("Frame",UpdsTitle) UpdsTitleUnderLine.Name = "UnderLine"
	local UpdsMessage = Instance.new("TextLabel",UpdsUI) UpdsMessage.Name = "UpdsMessage" UpdsMessage.Visible = false
	local WalkToggle = Instance.new("TextButton",ScrollingFrame) WalkToggle.Name = "WalkToggle" 
	local JumpToggle = Instance.new("TextButton",ScrollingFrame) JumpToggle.Name = "JumpToggle"

	local RunService = game:GetService("RunService")
	local UserInputService = game:GetService("UserInputService")
	local HttpService = game:GetService("HttpService")

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
	_G.RMP = nil
	_G.RMN = nil
	local Cmds = {"to","lock","unlock"}
	local CmdsTitle = {";to [PlayerName]",";lock [PlayerName]",";unlock"}
	local CmdsName = {"tp","lock"}
	local CmdClose = true
	local ExplorerClose = false
	local Connection
	local VerButtonO = false
	local ReChecked = false
	local IsUpdsOpen = false
	local IsWalking = false
	local IsJumping = false


	local CurrentVer = "0.1.4-beta"


	do
		gui.ResetOnSpawn = false
		gui.DisplayOrder = 1000000000

		frame.BackgroundColor3 = Color3.new(0.0941176,0.00784314,0.34902) 
		frame.Position = UDim2.new(0.2,0,0.8,0) frame.Size = UDim2.new(0.4,0,0.4,0) 
		frame.AnchorPoint = Vector2.new(0.5,0.5)

		close.BackgroundTransparency = 1
		close.ImageColor3 = Color3.new(0.611765, 0.611765, 0.611765)
		close.Position = UDim2.new(0.0744,0,-0.032,0) 
		close.Size = UDim2.new(0.015,0,0.031,0) 
		close.Image = "rbxassetid://17605439347"

		ScrollingFrame.BackgroundTransparency = 0.5
		ScrollingFrame.Position = UDim2.new(0.039,0,0.054,0)
		--[[ScrollingFrame.Size = UDim2.new(0.906,0,0.768,0)]]
		ScrollingFrame.Size = UDim2.new(0.831,0,0.768,0)
		ScrollingFrame.BackgroundColor3 = Color3.new(1,1,1)

		WalkText.BackgroundColor3 = Color3.new(0.121569, 0.121569, 0.121569)
		WalkText.BackgroundTransparency = 0.55
		WalkText.Position = UDim2.new(0.347,0,0.035,0)
		WalkText.Size = UDim2.new(0.2,0,0.062,0)
		WalkText.Text = "16"
		WalkText.PlaceholderText = "Type Number Here.."

		WalkLabel.BackgroundColor3 = Color3.new(0.431373,0,0.541176)
		WalkLabel.Position = UDim2.new(0.04,0,0.03,0)
		WalkLabel.Size = UDim2.new(0.262,0,0.062,0)
		WalkLabel.Text = "WalkSpeed"
		WalkLabel.TextColor3 = Color3.new(1,0.854902,0.0196078)

		WalkToggle.BackgroundColor3 = Color3.new(0.537255,0,0)
		WalkToggle.Position = UDim2.new(0.56,0,0.039,0)
		WalkToggle.Size = UDim2.new(0.06,0,0.05,0)
		WalkToggle.Text = "off"

		JumpText.BackgroundColor3 = Color3.new(0.121569, 0.121569, 0.121569)
		JumpText.BackgroundTransparency = 0.55
		JumpText.Position = UDim2.new(0.347,0,0.101,0)
		JumpText.Size = UDim2.new(0.2,0,0.062,0)
		JumpText.Text = "7.2"
		JumpText.PlaceholderText = "Type Number Here.."

		JumpLabel.BackgroundColor3 = Color3.new(0.431373,0,0.541176)
		JumpLabel.Position = UDim2.new(0.04,0,0.108,0)
		JumpLabel.Size = UDim2.new(0.262,0,0.062,0)
		JumpLabel.Text = "JumpHeight"
		JumpLabel.TextColor3 = Color3.new(1,0.854902,0.0196078)

		JumpToggle.BackgroundColor3 = Color3.new(0.537255,0,0)
		JumpToggle.Position = UDim2.new(0.56,0,0.11,0)
		JumpToggle.Size = UDim2.new(0.06,0,0.05,0)
		JumpToggle.Text = "off"

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

		PlayerMarkUpButton.BackgroundColor3 = Color3.new(0.541176, 0, 0)
		PlayerMarkUpButton.Position = UDim2.new(0.789,0,0.1,0)
		PlayerMarkUpButton.Size = UDim2.new(0.1,0,0.029,0)
		PlayerMarkUpButton.Text = "Player"
		PlayerMarkUpButton.TextColor3 = Color3.new(0,0,0)

		NPCMarkUpButton.BackgroundColor3 = Color3.new(0.541176, 0, 0)
		NPCMarkUpButton.Position = UDim2.new(0.789,0,0.14,0)
		NPCMarkUpButton.Size = UDim2.new(0.1,0,0.029,0)
		NPCMarkUpButton.Text = "NPC"
		NPCMarkUpButton.TextColor3 = Color3.new(0,0,0)

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
		CmdList.Position = UDim2.new(0.201,0,0.22,0)
		CmdList.Size = UDim2.new(0.265,0,0.276,0)
		CmdList.ScrollBarImageColor3 = Color3.new(1,0.717647,0.00392157)
		CmdList.Visible = false

		VerButton.BackgroundColor3 = Color3.new(0.239216,0,0.262745)
		VerButton.Position = UDim2.new(0.892,0,0.123,0)
		VerButton.Size = UDim2.new(0.088,0,0.145,0)
		VerButton.BorderColor3 = Color3.new(0.737255,0.498039,0.0156863)
		VerButton.BorderSizePixel = 1
		VerButton.TextColor3 = Color3.new(1,0.717647,0.00784314)
		VerButton.TextStrokeColor3 = Color3.new(0.384314,0.309804,0.00392157)
		VerButton.TextTransparency = 0
		VerButton.Text = ".Ver"
		VerButton.Font = Enum.Font.SourceSansBold
		VerButton.TextSize = 14

		UpdsButton.BackgroundColor3 = Color3.new(0.239216,0,0.262745)
		UpdsButton.Position = UDim2.new(0.892,0,0.331,0)
		UpdsButton.Size = UDim2.new(0.088,0,0.145,0)
		UpdsButton.BorderColor3 = Color3.new(0.737255,0.498039,0.0156863)
		UpdsButton.BorderSizePixel = 1
		UpdsButton.TextColor3 = Color3.new(1,0.717647,0.00784314)
		UpdsButton.TextStrokeColor3 = Color3.new(0.384314,0.309804,0.00392157)
		UpdsButton.TextTransparency = 0
		UpdsButton.Text = ".Upds"
		UpdsButton.Font = Enum.Font.SourceSansBold
		UpdsButton.TextSize = 14

		VerMessage.BackgroundColor3 = Color3.new(0.211765,0,0.403922)
		VerMessage.BackgroundTransparency = 0.2
		VerMessage.BorderColor3 = Color3.new(1,0.639216,0.0196078)
		VerMessage.BorderSizePixel = 1
		VerMessage.Position = UDim2.new(0.212,0,0.249,0)
		VerMessage.Size = UDim2.new(0.265,0,0.276,0)

		VerLabel.BackgroundColor3 = Color3.new(0.211765,0,0.403922)
		VerLabel.BackgroundTransparency = 0.4
		VerLabel.BorderColor3 = Color3.new(1,0.639216,0.0196078)
		VerLabel.BorderSizePixel = 1
		VerLabel.Position = UDim2.new(0.204,0,0.069,0)
		VerLabel.Size = UDim2.new(0.585,0,0.18,0)
		VerLabel.Font = Enum.Font.SourceSansBold 
		VerLabel.RichText = true
		VerLabel.TextScaled = true
		VerLabel.TextWrapped = true
		VerLabel.TextColor3 = Color3.new(1,0.717647,0)
		VerLabel.Text = "Ver."..CurrentVer

		MessageLabel.BackgroundTransparency = 1
		MessageLabel.Position = UDim2.new(0.107,0,0.332,0)
		MessageLabel.Size = UDim2.new(0.782,0,0.109,0)
		MessageLabel.Font = Enum.Font.SourceSansBold 
		MessageLabel.RichText = true
		MessageLabel.TextScaled = true
		MessageLabel.TextWrapped = true
		MessageLabel.TextColor3 = Color3.new(1,0.717647,0)

		ReCheckButton.BackgroundColor3 = Color3.new(0.211765,0,0.403922)
		ReCheckButton.BackgroundTransparency = 0.4
		ReCheckButton.BorderColor3 = Color3.new(1,0.705882,0.0196078)
		ReCheckButton.BorderSizePixel = 1
		ReCheckButton.Position = UDim2.new(0.833,0,0.069,0)
		ReCheckButton.Size = UDim2.new(0.11,0,0.18,0)
		ReCheckButton.Image = "rbxassetid://13364258627"

		UpdateVerButton.BackgroundColor3 = Color3.new(0.0705882,0.623529,0.00784314)
		UpdateVerButton.BorderColor3 = Color3.new(0,0,0)
		UpdateVerButton.BorderSizePixel = 1
		UpdateVerButton.Position = UDim2.new(0.305,0,0.72,0)
		UpdateVerButton.Size = UDim2.new(0.17,0,0.2,0)
		UpdateVerButton.Font = Enum.Font.SourceSansBold 
		UpdateVerButton.RichText = true
		UpdateVerButton.TextScaled = true
		UpdateVerButton.TextWrapped = true
		UpdateVerButton.Text = "Yes"

		IgnoreVerButton.BackgroundColor3 = Color3.new(0.588235,0,0)
		IgnoreVerButton.BorderColor3 = Color3.new(0,0,0)
		IgnoreVerButton.BorderSizePixel = 1
		IgnoreVerButton.Position = UDim2.new(0.522,0,0.72,0)
		IgnoreVerButton.Size = UDim2.new(0.17,0,0.2,0)
		IgnoreVerButton.Font = Enum.Font.SourceSansBold 
		IgnoreVerButton.RichText = true
		IgnoreVerButton.TextScaled = true
		IgnoreVerButton.TextWrapped = true
		IgnoreVerButton.Text = "No"

		UpdsUI.BackgroundColor3 = Color3.new(0.211765,0,0.403922)
		UpdsUI.BackgroundTransparency = 0.2
		UpdsUI.BorderColor3 = Color3.new(1,0.639216,0.0196078)
		UpdsUI.BorderSizePixel = 1
		UpdsUI.Position = UDim2.new(0.223,0,0.268,0)
		UpdsUI.Size = UDim2.new(0.265,0,0.276,0)
		UpdsUI.CanvasSize = UDim2.new(0,0,1,0)
		UpdsUI.ScrollBarImageColor3 = Color3.new(1,0.713725,0.00392157)
		UpdsUI.ScrollBarThickness = 6

		UpdsTitle.BackgroundTransparency = 1
		UpdsTitle.Position = UDim2.new(0.222,0,0.02,0)
		UpdsTitle.Size = UDim2.new(0.558,0,0.029,0)
		UpdsTitle.Font = Enum.Font.SourceSansBold
		UpdsTitle.Text = "Updates log"
		UpdsTitle.TextColor3 = Color3.new(1,0.74902,0)
		UpdsTitle.RichText = true
		UpdsTitle.TextScaled = true
		UpdsTitle.TextWrapped = true
		UpdsTitle.TextSize = 14

		UpdsTitleUnderLine.BackgroundColor3 = Color3.new(1,0.74902,0)
		UpdsTitleUnderLine.Position = UDim2.new(0,0,1,0)
		UpdsTitleUnderLine.Size = UDim2.new(1,0,0.1,0)

		UpdsMessage.BackgroundTransparency = 1
		UpdsMessage.Position = UDim2.new(0.15,0,0.1,0)
		UpdsMessage.Size = UDim2.new(0.7,0,0.03,0)
		UpdsMessage.Font = Enum.Font.SourceSansBold
		UpdsMessage.RichText = true
		UpdsMessage.TextScaled = true
		UpdsMessage.TextWrapped = true
		UpdsMessage.TextColor3 = Color3.new(1,0.74902,0)
		UpdsMessage.Text = "...Loading data..."

	end

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

	JumpText.Changed:Connect(function()
		_G.Jump = JumpText.Text
	end)

	WalkText.Changed:Connect(function()
		_G.Speed = WalkText.Text
	end)

	WalkToggle.Activated:Connect(function()
		if not IsWalking then
			IsWalking = true
			WalkToggle.BackgroundColor3 = Color3.new(0,0.486275,0.713725)
			WalkToggle.Text = "on"
			RunWalk = RunService.Heartbeat:Connect(function()			
				local Player = game.Workspace:FindFirstChild(player.Name)
				Player.Humanoid.WalkSpeed = _G.Speed
				wait(0.25)
			end)
		else
			IsWalking = false
			WalkToggle.BackgroundColor3 = Color3.new(0.537255,0,0)
			WalkToggle.Text = "off"
			RunWalk:Disconnect()
			wait(0.25)
			local Player = game.Workspace:FindFirstChild(player.Name)
			Player.Humanoid.WalkSpeed = 16
		end
	end)

	JumpToggle.Activated:Connect(function()
		if not IsJumping then
			IsJumping = true
			JumpToggle.BackgroundColor3 = Color3.new(0,0.486275,0.713725)
			JumpToggle.Text = "on"
			RunJump = RunService.Heartbeat:Connect(function()			
				local Player = game.Workspace:FindFirstChild(player.Name)
				Player.Humanoid.UseJumpPower = false
				Player.Humanoid.JumpHeight = _G.Jump
				wait(0.25)
			end)
		else
			IsJumping = false
			JumpToggle.BackgroundColor3 = Color3.new(0.537255,0,0)
			JumpToggle.Text = "off"
			RunJump:Disconnect()
			wait(0.25)
			local Player = game.Workspace:FindFirstChild(player.Name)
			Player.Humanoid.UseJumpPower = true
			Player.Humanoid.JumpHeight = 7.2
		end
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
								player.Character.PrimaryPart.CFrame = TargetPlayer.PrimaryPart.CFrame
							elseif cmd == "lock" then
								Until1 = true
								Output("Success!",1)
								repeat player.Character.PrimaryPart.CFrame = TargetPlayer.PrimaryPart.CFrame + Vector3.new(0,0,5) wait()
								until Until1 == false							
							end
						else
							Output("Player not found..",1)
						end
					end

					if cmd == "unlock" then
						Until1 = false	
						Output("Success!",1)
					end
				end
			end
			if not RightCmd then
				Output("Invalid command",1)
			end
		end
	end)

	PlayerMarkUpButton.Activated:Connect(function()
		if not _G.RMP then
			PlayerMarkUpButton.BackgroundColor3 = Color3.new(0,0.486275,0.713725)
			wait(0.1)
			_G.RMP = RunService.RenderStepped:Connect(function()
				for i,p in pairs(game:GetService("Players"):GetChildren()) do					
					if not p.Character:FindFirstChild("PMarkSpell") then
						local Highlight = Instance.new("Highlight",p.Character)
						Highlight.FillTransparency = 1 Highlight.OutlineColor = p.TeamColor.Color Highlight.OutlineTransparency = 0 Highlight.Name = "PMarkSpell"					
						if p.Team == nil then
							Highlight.OutlineColor = Color3.new(0,1,0.85098)
						end
					else
						local PMS = p.Character:FindFirstChild("PMarkSpell")
						PMS.OutlineColor = p.TeamColor.Color
						if p.Team == nil then
							PMS.OutlineColor = Color3.new(0,1,0.85098)
						end
					end
				end
			end)
		elseif _G.RMP then
			PlayerMarkUpButton.BackgroundColor3 = Color3.new(0.541176,0,0)
			_G.RMP:Disconnect()
			_G.RMP = nil
			for i,p in pairs(game:GetService("Players"):GetChildren()) do
				if p.Character:FindFirstChild("PMarkSpell") then
					p.Character.PMarkSpell:Destroy()
				end
			end
		end
	end)

	NPCMarkUpButton.Activated:Connect(function()
		if not _G.RMN then
			NPCMarkUpButton.BackgroundColor3 = Color3.new(0, 0.486275, 0.713725)
			wait(0.1)
			_G.RMN = RunService.RenderStepped:Connect(function()
				for i,obj in pairs(game.Workspace:GetDescendants()) do
					if obj:FindFirstChild("Humanoid") and not obj:FindFirstChild("NMarkSpell") then
						local Highlight = Instance.new("Highlight",obj)
						Highlight.FillTransparency = 1 Highlight.OutlineColor = Color3.new(0,1,0.85098) Highlight.OutlineTransparency = 0 Highlight.Name = "NMarkSpell"
					end
				end
			end)
		elseif _G.RMN then
			NPCMarkUpButton.BackgroundColor3 = Color3.new(0.541176,0,0)
			_G.RMN:Disconnect()
			_G.RMN = nil
			for i,obj in pairs(game.Workspace:GetDescendants()) do
				if obj:FindFirstChild("NMarkSpell") then
					obj.NMarkSpell:Destroy()
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

	FlyButton.Activated:Connect(function()
		Output("Coming soon",1)
	end)

	local function Explorer()
		local ExplorerFlame = Instance.new("ScrollingFrame",gui)

	end

	ExplorerButton.Activated:Connect(function()
		if not ExplorerClose then
			ExplorerClose = true ExplorerButton.BackgroundColor3 = Color3.new(0,0.486275,0.713725) ExplorerButton.Text = "On"
			Explorer()
		else
			ExplorerClose = false ExplorerButton.BackgroundColor3 = Color3.new(0.541176,0,0) ExplorerButton.Text = "Off"
		end
		Output("Coming Soon",1)
	end)

	VerButton.Activated:Connect(function()
		if not VerButtonO then
			VerButtonO = true VerMessage.Visible = true VerButton.BackgroundColor3 = Color3.new(0.12549,0,0.137255)
			MessageLabel.Text = "...Checking version..."
			local success,responce = pcall(function()
				return loadstring(game:HttpGet("https://raw.githubusercontent.com/Wiizzzzzzzaaaaard/Wizards-Spell-Book/main/Ver.lua",true))()
			end)
			local GotVer = _G.GotVer
			if success and GotVer then
				if GotVer ~= CurrentVer then
					MessageLabel.Text = "Version isn't newest! will you use newest version?"
					UpdateVerButton.Visible = true IgnoreVerButton.Visible = true
					IgnoreVerButton.Activated:Connect(function()
						UpdateVerButton.Visible = false IgnoreVerButton.Visible = false VerButtonO = false VerMessage.Visible = false VerButton.BackgroundColor3 = Color3.new(0.239216,0,0.262745)
					end)
					UpdateVerButton.Activated:Connect(function()
						local success,responce = pcall(function()
							return loadstring(game:HttpGet("https://raw.githubusercontent.com/Wiizzzzzzzaaaaard/Wizards-Spell-Book/main/Console.lua",true))()
						end)
						if not success then MessageLabel.Text = "Something went wrong! please try again." wait(2) end
						VerButtonO = false VerMessage.Visible = false VerButton.BackgroundColor3 = Color3.new(0.239216,0,0.262745)
					end)
				else
					MessageLabel.Text = "Version is newest"
				end
			else
				wait(0.1)
				MessageLabel.Text = "Something went wrong! please try again."
			end
		else
			VerButtonO = false VerMessage.Visible = false VerButton.BackgroundColor3 = Color3.new(0.239216,0,0.262745) MessageLabel.Text = ""
		end
	end)

	ReCheckButton.Activated:Connect(function()
		if not ReChecked then
			ReChecked = true
			MessageLabel.Text = "...Checking version..."
			local success,responce = pcall(function()
				return loadstring(game:HttpGet("https://raw.githubusercontent.com/Wiizzzzzzzaaaaard/Wizards-Spell-Book/main/Ver.lua",true))()
			end)	
			local GotVer = _G.GotVer
			if success and GotVer then
				if GotVer ~= CurrentVer then
					MessageLabel.Text = "Version isn't newest! will you use newest version?"
					UpdateVerButton.Visible = true IgnoreVerButton.Visible = true
					IgnoreVerButton.Activated:Connect(function()
						UpdateVerButton.Visible = false IgnoreVerButton.Visible = false VerButtonO = false VerMessage.Visible = false VerButton.BackgroundColor3 = Color3.new(0.239216,0,0.262745)
					end)
					UpdateVerButton.Activated:Connect(function()
						local success,responce = pcall(function()
							return loadstring(game:HttpGet("https://raw.githubusercontent.com/Wiizzzzzzzaaaaard/Wizards-Spell-Book/main/Console.lua",true))()
						end)
						if not success then MessageLabel.Text = "Something went wrong! please try again." wait(2) end
						VerButtonO = false VerMessage.Visible = false VerButton.BackgroundColor3 = Color3.new(0.239216,0,0.262745)
					end)
				else
					MessageLabel.Text = "Version is newest"
					_G.GotVer = nil
				end
			else
				wait(0.1)
				MessageLabel.Text = "Something went wrong! please try again."
			end
			wait(1)
			ReChecked = false
		end
	end)

	UpdsButton.Activated:Connect(function()
		if not IsUpdsOpen  then
			IsUpdsOpen = true UpdsUI.Visible = true UpdsButton.BackgroundColor3 = Color3.new(0.12549,0,0.137255) UpdsMessage.Visible = true UpdsMessage.Text = "...Loading data..."
			local success,UpdsData = pcall(function() 
				return game:HttpGet("https://raw.githubusercontent.com/Wiizzzzzzzaaaaard/Wizards-Spell-Book/main/Upds.json") 
			end)
			if success then
				UpdsMessage.Text = "" UpdsMessage.Visible = false
				local LuaTable = HttpService:JSONDecode(UpdsData)
				local LastGUI
				local Folder = Instance.new("Folder",UpdsUI) Folder.Name = "This"
				for i,v in ipairs(LuaTable.ver) do
					local TextLabel = Instance.new("TextLabel",Folder) TextLabel.Name = "v"
					TextLabel.BackgroundTransparency = 1
					TextLabel.Size = UDim2.new(0.7,0,0.04,0)
					TextLabel.Font = Enum.Font.SourceSansBold
					TextLabel.TextColor3 = Color3.new(1,0.74902,0)
					TextLabel.RichText = true
					TextLabel.TextScaled = true
					TextLabel.TextWrapped = true
					TextLabel.TextSize = 14
					TextLabel.Text = v
					if LastGUI then 
						if LastGUI.Text ~= "" then
							TextLabel.Position = UDim2.new(0.06,0,LastGUI.Position.Y.Scale+0.05,0) 
						else
							TextLabel.Position = UDim2.new(0.06,0,LastGUI.Position.Y.Scale,0)
						end
					else 
						TextLabel.Position = UDim2.new(0.06,0,0.07,0) 
					end 
					LastGUI = TextLabel
					for i2,d in ipairs(LuaTable.detail[i]) do
						wait(0.1)
						local TextLabel = Instance.new("TextLabel",Folder) TextLabel.Name = "d"
						TextLabel.BackgroundTransparency = 1
						TextLabel.Size = UDim2.new(0.6,0,0.025,0)
						TextLabel.Font = Enum.Font.SourceSansBold
						TextLabel.TextColor3 = Color3.new(1,0.74902,0)
						TextLabel.RichText = true
						TextLabel.TextScaled = true
						TextLabel.TextWrapped = true
						TextLabel.TextSize = 14
						TextLabel.TextXAlignment = Enum.TextXAlignment.Left
						if d~="" then TextLabel.Text = "+ "..d else TextLabel.Text = "" end
						if LastGUI.Name~="v" then 
							TextLabel.Position = UDim2.new(0.22,0,LastGUI.Position.Y.Scale+0.025,0) LastGUI = TextLabel 
						else 
							TextLabel.Position = UDim2.new(0.22,0,LastGUI.Position.Y.Scale+0.04,0) LastGUI = TextLabel
						end
					end
				end
				local NextUpdsPlanLabel = Instance.new("TextLabel",Folder) NextUpdsPlanLabel.Name = "NextUpdsPlanLabel"
				local UnderLine = Instance.new("Frame",NextUpdsPlanLabel) UnderLine.Name = "UnderLine"
				NextUpdsPlanLabel.BackgroundTransparency = 1
				NextUpdsPlanLabel.Size = UDim2.new(0.56,0,0.03,0)
				NextUpdsPlanLabel.Font = Enum.Font.SourceSansBold
				NextUpdsPlanLabel.TextColor3 = Color3.new(1,0.74902,0)
				NextUpdsPlanLabel.RichText = true
				NextUpdsPlanLabel.TextScaled = true
				NextUpdsPlanLabel.TextWrapped = true
				NextUpdsPlanLabel.TextSize = 14
				NextUpdsPlanLabel.Text = "Next updates plan"
				NextUpdsPlanLabel.Position = UDim2.new(0.22,0,LastGUI.Position.Y.Scale+0.05,0)
				LastGUI = NextUpdsPlanLabel
				UnderLine.BackgroundColor3 = Color3.new(1,0.74902,0)
				UnderLine.Position = UDim2.new(0,0,1,0)
				UnderLine.Size = UDim2.new(1,0,0.1,0)

				for i,p in ipairs(LuaTable.NextUpdatesPlan) do
					local UP = Instance.new("TextLabel",Folder) UP.Name = "UP"
					UP.BackgroundTransparency = 1
					UP.Size = UDim2.new(0.6,0,0.027,0)
					UP.Font = Enum.Font.SourceSansBold
					UP.TextColor3 = Color3.new(1,0.74902,0)
					UP.RichText = true
					UP.TextScaled = true
					UP.TextWrapped = true
					UP.TextSize = 14
					UP.TextXAlignment = Enum.TextXAlignment.Left
					if LastGUI.Name~="Next updates plan" then
						UP.Position = UDim2.new(0.23,0,LastGUI.Position.Y.Scale+0.03,0)
					else
						UP.Position = UDim2.new(0.23,0,LastGUI.Position.Y.Scale+0.04,0)
					end
					UP.Text = "# "..p
					LastGUI = UP
				end
				local aso = Instance.new("TextLabel",Folder) aso.Name = "aso"
				aso.BackgroundTransparency = 1
				aso.Size = UDim2.new(0.2,0,0.025,0)
				aso.Font = Enum.Font.SourceSansBold
				aso.TextColor3 = Color3.new(1,0.74902,0)
				aso.RichText = true
				aso.TextScaled = true
				aso.TextWrapped = true
				aso.TextSize = 14
				aso.TextXAlignment = Enum.TextXAlignment.Left
				aso.Position = UDim2.new(0.6,0,LastGUI.Position.Y.Scale+0.02,0)
				aso.Text = "...and so on"
			else
				wait(0.1)
				UpdsMessage.Text = "Something went wrong! please try again."
			end
		else
			IsUpdsOpen = false UpdsUI.Visible = false UpdsButton.BackgroundColor3 = Color3.new(0.239216,0,0.262745) UpdsUI:FindFirstChild("This"):Destroy()	
		end
	end)

	frame.InputBegan:Connect(function(Input)
		local InputPositionV2 = Vector2.new(Input.Position.X,Input.Position.Y)
		local Difference = InputPositionV2-frame.AbsolutePosition
		print(Difference)
		
		local FirstMousePosition = UserInputService:GetMouseLocation()
		local Inputs = {"MouseButton1","Touch"}
		if table.find(Inputs,Input.UserInputType.Name) then
			Drag = RunService.Heartbeat:Connect(function()
				local MousePosition = UserInputService:GetMouseLocation()
				if FirstMousePosition~=MousePosition and Difference.X>=440 or Difference.X<=18 or Difference.Y>=170 or Difference.Y<=10  then
					frame.Position = UDim2.new(0,MousePosition.X,0,MousePosition.Y)
				end				
			end)
			UserInputService.InputEnded:Connect(function(Input)
				if table.find(Inputs,Input.UserInputType.Name) and Drag then
					Drag:Disconnect()
					Drag = nil
				end
			end)
		end
	end)

end

function Find()
	local Target = nil
	for i,child in game:GetService("CoreGui"):GetChildren() do
		if child.Name == "Wizard's Spell Book" then
			Target = child
		end
	end
	for i,a in player.PlayerGui:GetChildren() do
		if a.Name == "Wizard's Spell Book" then
			Target = a
		end
	end
	return Target
end

do 
	local WizardsSpellBook = Find()
	if WizardsSpellBook then
		local AnnounceGUI = Instance.new("ScreenGui") AnnounceGUI.Name = "AnnounceGUI"
		local Success = pcall(function() AnnounceGUI.Parent = cloneref end) if not Success then AnnounceGUI.Parent = player.PlayerGui end
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

