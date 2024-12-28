local Player = game.Players.LocalPlayer
local cloneref = cloneref or function(o) return o end
local COREGUI = cloneref(game:GetService("CoreGui"))
local Debug = true


function GUI (Gui)
	local MainFrame = Instance.new("Frame",Gui) MainFrame.Name = "MainFrame"
	local RigtPage = Instance.new("Frame",MainFrame) RigtPage.Name = "RightPage"
	local LeftPage = Instance.new("Frame",MainFrame) LeftPage.Name = "LeftPage"
	local Decorations = Instance.new("Folder",MainFrame) Decorations.Name = "Decorations"
	local LD1 = Instance.new("Frame",Decorations) LD1.Name = "LD1"
	local LD2 = Instance.new("Frame",Decorations) LD2.Name = "LD2"
	local RD1 = Instance.new("Frame",Decorations) RD1.Name = "RD1"
	local RD2 = Instance.new("Frame",Decorations) RD2.Name = "RD2"
	local NextPageButton = Instance.new("TextButton",MainFrame) NextPageButton.Name = "NextPage"
	local BackPageButton = Instance.new("TextButton",MainFrame) BackPageButton.Name = "BackPageButton"

	Gui.ResetOnSpawn = false
	Gui.ScreenInsets = Enum.ScreenInsets.None
	Gui.DisplayOrder = 1000000000
	MainFrame.BackgroundColor3 = Color3.new(0.211765, 0, 0.403922)
	MainFrame.Size = UDim2.new(0.4,0,0.45,0)
	MainFrame.Position = UDim2.new(0.265,0,0.74,0)
	--[[MainFrame.Position = UDim2.new(0.7,0,0.7,0)]]
	MainFrame.AnchorPoint = Vector2.new(0.5,0.5)


	local DefaultPageColor = Color3.new(0.584314, 0.45098, 0.286275)

	local DefaultPageGradient = ColorSequence.new({
		ColorSequenceKeypoint.new(0,DefaultPageColor),
		ColorSequenceKeypoint.new(0.8,Color3.new(0.419608, 0.32549, 0.235294)),
		ColorSequenceKeypoint.new(1,Color3.new(0.352941, 0.278431, 0.215686))
	})

	local function DefaultTxt(Txt,SetLeft) 
		Txt.Font = Enum.Font.SourceSansBold
		Txt.RichText = true
		Txt.TextColor3 = Color3.new(1, 0.717647, 0)	
		Txt.TextScaled = true
		Txt.TextStrokeColor3 = Color3.new(0.458824, 0.368627, 0.00784314)
		Txt.TextStrokeTransparency = 0
		Txt.TextWrapped = true
		if SetLeft then Txt.TextXAlignment = Enum.TextXAlignment.Left end	
	end

	for i,Page in ipairs({RigtPage,LeftPage}) do
		Page.BackgroundColor3 = Color3.new(1, 1, 1)
		local UIGradient = Instance.new("UIGradient",Page)
		UIGradient.Color = DefaultPageGradient
		Page.Size = UDim2.new(0.46,0,0.95,0)
		Page.Position = UDim2.new(0.04,0,0.022,0)
		local PageNumber = Instance.new("TextLabel",Page) PageNumber.Name = "PageNumber"
		PageNumber.BackgroundTransparency = 1
		PageNumber.Position = UDim2.new(0.03,0,0.93,0)
		PageNumber.Size = UDim2.new(0.12,0,0.055,0)
		DefaultTxt(PageNumber,true)
		PageNumber.Text = 0
		if Page.Name == "RightPage" then
			Page.Position = UDim2.new(0.5,0,0.022, 0)
			UIGradient.Rotation = 180
			PageNumber.Position = UDim2.new(0.85,0,0.93,0)
			PageNumber.TextXAlignment = Enum.TextXAlignment.Right
		end
	end

	for i,Decoration in ipairs({LD1,LD2,RD1,RD2}) do
		Decoration.BackgroundColor3 = Color3.new(1,1,1)
		Decoration.BorderSizePixel = 0
		local UIGradient = Instance.new("UIGradient",Decoration)
		UIGradient.Color = DefaultPageGradient
		Decoration.Size = UDim2.new(0.01,0,0.95,0)
		Decoration.Position = UDim2.new((0.04-i*0.01),0,0.022,0)
		if i>2 then		
			UIGradient.Rotation = 180
			Decoration.Position = UDim2.new((0.95+(i-2)*0.01),0,0.022,0)
		end
	end

	for i,Button in ipairs({NextPageButton,BackPageButton}) do
		Button.BackgroundColor3 = DefaultPageColor
		Button.BackgroundTransparency = 0.5
		Button.BorderColor3 = Color3.new(0, 0, 0)
		Button.BorderSizePixel = 1
		Button.Position = UDim2.new(0.94,0,0.45,0)
		Button.Size = UDim2.new(0.049,0,0.092,0)
		DefaultTxt(Button,false)
		Button.TextStrokeColor3 = Color3.new(0, 0, 0)
		Button.Text = ">"
		if i==2 then
			Button.Position = UDim2.new(0.01,0,0.45,0)
			Button.Text = "<"
		end
	end

	return MainFrame,RigtPage,LeftPage,LD1,LD2,RD1,RD2,NextPageButton,BackPageButton
end


function Main()
	local Gui = Instance.new("ScreenGui",Player.PlayerGui) Gui.Name = "Wizard's Spell Book" 
	pcall(function() if not Debug then Gui.Parent = COREGUI end end)
	local MainFrame,RightPage,LeftPage,LD1,LD2,RD1,RD2,NextPageButton,BackPageButton = GUI(Gui)
	local RightPageNumber,LeftPageNumber = RightPage.PageNumber,LeftPage.PageNumber
	local UserInputService = game:GetService("UserInputService")
	local RunService = game:GetService("RunService")
	local TotalPage = 30
	local CurrentPage = 0
	local RemainingPages = TotalPage-CurrentPage
	local PageInfo = {
		[1] = {

		} 
	}
	local Spells = {
		{
			"RunSpeed",
			"Set running speed you wrote."
		},
		{
			"JumpHeight",
			"Set jump height you wrote."
		}
	}

	BackPageButton.Visible,LD1.Visible,LD2.Visible,LeftPage.Visible = false,false,false,false
	RightPageNumber.Text = 1

	MainFrame.InputBegan:Connect(function(Input)
		local InputPositionV2 = Vector2.new(Input.Position.X,Input.Position.Y)
		local difference = InputPositionV2-MainFrame.AbsolutePosition

		local FirstMousePosition = UserInputService:GetMouseLocation()
		local Inputs = {"MouseButton1","Touch"}
		if table.find(Inputs,Input.UserInputType.Name) then
			Drag = RunService.Heartbeat:Connect(function()
				local MousePosition = UserInputService:GetMouseLocation()
				if difference.X<=10 or difference.X>=495 or difference.Y<=3.5 or difference.Y>=255 and FirstMousePosition~=MousePosition then 
					MainFrame.Position = UDim2.new(0,MousePosition.X,0,MousePosition.Y)
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

	local function Page()
		LD1.Visible = CurrentPage>=4
		LD2.Visible = CurrentPage>=6
		RemainingPages = TotalPage-CurrentPage
		RD1.Visible = RemainingPages>=4
		RD2.Visible = RemainingPages>=6	
		NextPageButton.Visible = RemainingPages>0
		BackPageButton.Visible = CurrentPage>0
		
	end

	NextPageButton.Activated:Connect(function()
		LeftPage.Visible,BackPageButton.Visible = true,true

		if TotalPage-CurrentPage~=0 then
			RightPageNumber.Text+=2
			LeftPageNumber.Text+=2		
		end

		CurrentPage = tonumber(LeftPageNumber.Text)

		RightPage.Visible = CurrentPage<TotalPage

		Page()

	end)

	BackPageButton.Activated:Connect(function()
		RightPage.Visible,NextPageButton.Visible = true,true

		if CurrentPage~=0 then
			RightPageNumber.Text-=2
			LeftPageNumber.Text-=2
		end

		CurrentPage = tonumber(LeftPageNumber.Text)

		LeftPage.Visible = CurrentPage>0

		Page()
	end)

end

Main()
