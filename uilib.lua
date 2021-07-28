local Note = {}

local LibName = tostring(math.random(1, 100))..tostring(math.random(1,50))..tostring(math.random(1, 100))
function Note:UI()
    if game.CoreGui[LibName].Enabled then
        game.CoreGui[LibName].Enabled = false
    else
        game.CoreGui[LibName].Enabled = true
    end
end

function Note:CreateWindow(text)
	text = text or "Note Library"
	
	local NoteLibrary = Instance.new("ScreenGui")
	local Dragify = Instance.new("Frame")
	local MainFrame = Instance.new("Frame")
	local mainCorner = Instance.new("UICorner")
	local SideFrame = Instance.new("Frame")
	local sideCorner = Instance.new("UICorner")
	local Title = Instance.new("TextLabel")
	local allTabs = Instance.new("Frame")
	local elementListing = Instance.new("UIListLayout")
	local allPages = Instance.new("Frame")
	local allCorner = Instance.new("UICorner")
	local pageFolder = Instance.new("Folder")

	NoteLibrary.Name = LibName
	NoteLibrary.Parent = game.CoreGui
	
	function dragify(Frame)
		dragToggle = nil
		dragSpeed = .05 -- You can edit this.
		dragInput = nil
		dragStart = nil
		dragPos = nil

		function updateInput(input)
			Delta = input.Position - dragStart
			Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
			game:GetService("TweenService"):Create(Frame, TweenInfo.new(.25), {Position = Position}):Play()
		end

		Frame.InputBegan:Connect(function(input)
			if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
				dragToggle = true
				dragStart = input.Position
				startPos = Frame.Position
				input.Changed:Connect(function()
					if (input.UserInputState == Enum.UserInputState.End) then
						dragToggle = false
					end
				end)
			end
		end)

		Frame.InputChanged:Connect(function(input)
			if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
				dragInput = input
			end
		end)

		game:GetService("UserInputService").InputChanged:Connect(function(input)
			if (input == dragInput and dragToggle) then
				updateInput(input)
			end
		end)
	end
	
	Dragify.Name = "Dragify"
	Dragify.Parent = NoteLibrary
	Dragify.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Dragify.BackgroundTransparency = 1.000
	Dragify.BorderSizePixel = 0
	Dragify.Position = UDim2.new(0.285028011, 0, 0.198664442, 0)
	Dragify.Size = UDim2.new(0, 536, 0, 360)
	
	dragify(Dragify)
	
	
	MainFrame.Name = "MainFrame"
	MainFrame.Parent = Dragify
	MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	MainFrame.BackgroundColor3 = Color3.fromRGB(22, 23, 27)
	MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
	MainFrame.Size = UDim2.new(0, 536, 0, 360)
	MainFrame.Draggable = true

	mainCorner.CornerRadius = UDim.new(0, 6)
	mainCorner.Name = "mainCorner"
	mainCorner.Parent = MainFrame

	SideFrame.Name = "SideFrame"
	SideFrame.Parent = MainFrame
	SideFrame.BackgroundColor3 = Color3.fromRGB(32, 33, 37)
	SideFrame.BorderSizePixel = 0
	SideFrame.Size = UDim2.new(0, 135, 0, 360)

	sideCorner.CornerRadius = UDim.new(0, 6)
	sideCorner.Name = "sideCorner"
	sideCorner.Parent = SideFrame

	Title.Name = "Title"
	Title.Parent = SideFrame
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.BorderSizePixel = 0
	Title.Size = UDim2.new(0, 135, 0, 33)
	Title.Font = Enum.Font.Gotham
	Title.Text = text
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextSize = 18.000

	allTabs.Name = "allTabs"
	allTabs.Parent = SideFrame
	allTabs.BackgroundColor3 = Color3.fromRGB(32, 33, 37)
	allTabs.BackgroundTransparency = 1.000
	allTabs.BorderSizePixel = 0
	allTabs.Position = UDim2.new(0.0740740746, 0, 0.108333334, 0)
	allTabs.Size = UDim2.new(0, 116, 0, 309)

	elementListing.Name = "elementListing"
	elementListing.Parent = allTabs
	elementListing.SortOrder = Enum.SortOrder.LayoutOrder
	elementListing.Padding = UDim.new(0, 5)

	allPages.Name = "allPages"
	allPages.Parent = MainFrame
	allPages.BackgroundColor3 = Color3.fromRGB(32, 33, 37)
	allPages.BorderSizePixel = 0
	allPages.Position = UDim2.new(0.274253726, 0, 0.027777778, 0)
	allPages.Size = UDim2.new(0, 380, 0, 341)

	allCorner.CornerRadius = UDim.new(0, 6)
	allCorner.Name = "allCorner"
	allCorner.Parent = allPages

	pageFolder.Name = "pageFolder"
	pageFolder.Parent = allPages
	
	local TabHandler = {}
	
	function TabHandler:CreateTab(tabText, canvas)
		tabText = tabText or "New Tab"
		canvas = canvas or 1
		
		local tabButton = Instance.new("TextButton")
		local tabBtnCorner = Instance.new("UICorner")
		local newPage = Instance.new("ScrollingFrame")
		local pageElementListing = Instance.new("UIListLayout")
		
		tabButton.Name = "tabButton"
		tabButton.Parent = allTabs
		tabButton.BackgroundColor3 = Color3.fromRGB(32, 33, 37)
		tabButton.BorderSizePixel = 0
		tabButton.Size = UDim2.new(0, 116, 0, 29)
		tabButton.Font = Enum.Font.Gotham
		tabButton.Text = "  "..tabText
		tabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
		tabButton.TextSize = 15.000
		tabButton.TextXAlignment = Enum.TextXAlignment.Left

		tabBtnCorner.CornerRadius = UDim.new(0, 3)
		tabBtnCorner.Parent = tabButton
		
		newPage.Name = "newPage"
		newPage.Parent = pageFolder
		newPage.Active = true
		newPage.Visible = false
		newPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		newPage.BackgroundTransparency = 1.000
		newPage.BorderSizePixel = 0
		newPage.Position = UDim2.new(0.018421052, 0, 0.0293255132, 0)
		newPage.Size = UDim2.new(0, 367, 0, 323)
		newPage.ScrollBarThickness = 5
		newPage.ClipsDescendants = true
		newPage.ScrollBarImageColor3 = Color3.fromRGB(255, 109, 83)
		newPage.CanvasSize = UDim2.new(0, 0, canvas, 0)
		newPage.ScrollBarThickness = 5
		
		pageElementListing.Name = "pageElementListing"
		pageElementListing.Parent = newPage
		pageElementListing.SortOrder = Enum.SortOrder.LayoutOrder
		pageElementListing.Padding = UDim.new(0, 10)
		
		tabButton.MouseButton1Click:Connect(function()
			for i,v in next, pageFolder:GetChildren() do
				v.Visible = false
			end
			newPage.Visible = true
			
			for i,v in next, allTabs:GetChildren() do
				if v:IsA("TextButton") then
					game.TweenService:Create(v, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						BackgroundColor3 = Color3.fromRGB(32, 33, 37)
					}):Play()
				end
			end
			game.TweenService:Create(tabButton, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
				BackgroundColor3 = Color3.fromRGB(255, 109, 83)
			}):Play()
		end)
		
		local InnerLib = {}

		function InnerLib:CreateButton(text, callback)
			text = text or "New Button"
			callback = callback or function() end
			
			local TextButton = Instance.new("TextButton")
			local buttonCorner = Instance.new("UICorner")

			TextButton.Parent = newPage
			TextButton.BackgroundColor3 = Color3.fromRGB(42, 43, 49)
			TextButton.Size = UDim2.new(0, 357, 0, 37)
			TextButton.Font = Enum.Font.Gotham
			TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextButton.TextSize = 14.000
			TextButton.Text = text
			TextButton.MouseButton1Click:Connect(function()
				callback()
				
				game.TweenService:Create(TextButton, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
					BackgroundColor3 = Color3.fromRGB(255, 109, 83)
				}):Play()
				wait(0.1)
				game.TweenService:Create(TextButton, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
					BackgroundColor3 = Color3.fromRGB(42, 43, 49)
				}):Play()
			end)

			buttonCorner.CornerRadius = UDim.new(0, 3)
			buttonCorner.Name = "buttonCorner"
			buttonCorner.Parent = TextButton
		end
		
		function InnerLib:CreateToggle(text, callback)
			text = text or "New Toggle"
			callback = callback or function() end
			
			local toggleButton = Instance.new("TextButton")
			local buttonCorner = Instance.new("UICorner")

			toggleButton.Name = "toggleButton"
			toggleButton.Parent = newPage
			toggleButton.BackgroundColor3 = Color3.fromRGB(42, 43, 49)
			toggleButton.Size = UDim2.new(0, 357, 0, 37)
			toggleButton.Font = Enum.Font.Gotham
			toggleButton.Text = text
			toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			toggleButton.TextSize = 14.000
			
			buttonCorner.CornerRadius = UDim.new(0, 3)
			buttonCorner.Name = "buttonCorner"
			buttonCorner.Parent = toggleButton
			
			local tog = false

			toggleButton.MouseButton1Click:Connect(function()
				tog = not tog
				callback(tog)
				if tog then
					game.TweenService:Create(toggleButton, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						BackgroundColor3 = Color3.fromRGB(255, 109, 83)
					}):Play()
				else
					game.TweenService:Create(toggleButton, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						BackgroundColor3 = Color3.fromRGB(42, 43, 49)
					}):Play()
				end
			end)
		end
		
		function InnerLib:CreateBind(text, first, callback)
			text = text or "  New Bind"
			callback = callback or function() end
			local key = first.Name

			local bindLabel = Instance.new("TextLabel")
			local bindCorner = Instance.new("UICorner")
			local bindButton = Instance.new("TextButton")

			bindLabel.Name = "bindLabel"
			bindLabel.Parent = newPage
			bindLabel.BackgroundColor3 = Color3.fromRGB(42, 43, 49)
			bindLabel.Position = UDim2.new(0.0190735701, 0, 0.027859237, 0)
			bindLabel.Size = UDim2.new(0, 357, 0, 37)
			bindLabel.Font = Enum.Font.Gotham
			bindLabel.Text = "  "..text
			bindLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			bindLabel.TextSize = 14.000
			bindLabel.TextXAlignment = Enum.TextXAlignment.Left

			bindCorner.CornerRadius = UDim.new(0, 3)
			bindCorner.Name = "bindCorner"
			bindCorner.Parent = bindLabel

			bindButton.Name = "bindButton"
			bindButton.Parent = bindLabel
			bindButton.BackgroundColor3 = Color3.fromRGB(42, 43, 49)
			bindButton.BorderColor3 = Color3.fromRGB(255, 109, 83)
			bindButton.Position = UDim2.new(0.868347347, 0, 0.162162155, 0)
			bindButton.Size = UDim2.new(0, 35, 0, 24)
			bindButton.Font = Enum.Font.Gotham
			bindButton.Text = key
			bindButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			bindButton.TextSize = 14.000

			local blacklisted = {
				Unknwon = true;
				Return = true;
				Space = true;
				Tab = true;
			}

			bindButton.MouseButton1Click:Connect(function()
				bindButton.Text = ". . ."
				local a = game:GetService("UserInputService").InputBegan:wait()
				if a.KeyCode and not blacklisted[a.KeyCode.Name] then
					bindButton.Text = a.KeyCode.Name
					key = a.KeyCode.Name
				end
			end)

			game:GetService("UserInputService").InputBegan:connect(function(current, pressed)
				if not pressed then
					if current.KeyCode.Name == key then
						callback(bindButton.Text)
					end
				end
			end)

		end
		
		function InnerLib:CreateTextBox(text, callback)
			text = text or "New Textbox"
			callback = callback or function() end
			
			local textBoxLabel = Instance.new("TextLabel")
			local textBoxLabelCorner = Instance.new("UICorner")
			local textBox = Instance.new("TextBox")
			local textboxCorner = Instance.new("UICorner")

			textBoxLabel.Name = "textBoxLabel"
			textBoxLabel.Parent = newPage
			textBoxLabel.BackgroundColor3 = Color3.fromRGB(42, 43, 49)
			textBoxLabel.Position = UDim2.new(0, 0, 0.408668727, 0)
			textBoxLabel.Size = UDim2.new(0, 357, 0, 37)
			textBoxLabel.Font = Enum.Font.Gotham
			textBoxLabel.Text = "  "..text
			textBoxLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			textBoxLabel.TextSize = 14.000
			textBoxLabel.TextXAlignment = Enum.TextXAlignment.Left

			textBoxLabelCorner.CornerRadius = UDim.new(0, 3)
			textBoxLabelCorner.Name = "textBoxLabelCorner"
			textBoxLabelCorner.Parent = textBoxLabel

			textBox.Name = "textBox"
			textBox.Parent = textBoxLabel
			textBox.BackgroundColor3 = Color3.fromRGB(42, 43, 49)
            textBox.BackgroundTransparency = 1
			textBox.Position = UDim2.new(0.380952388, 0, 0.166666389, 0)
			textBox.Size = UDim2.new(0, 209, 0, 23)
			textBox.Font = Enum.Font.GothamSemibold
			textBox.PlaceholderText = "Type here!"
			textBox.Text = ""
			textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
			textBox.TextSize = 14.000
			textBox.TextXAlignment = Enum.TextXAlignment.Right

			textboxCorner.CornerRadius = UDim.new(0, 3)
			textboxCorner.Name = "textboxCorner"
			textboxCorner.Parent = textBox
			
			textBox.FocusLost:Connect(function(enterPressed)
				if not enterPressed then return end
				callback(textBox.Text)
				textBox.Text = ""
			end)
		end
		
		function InnerLib:CreateSlider(text, minvalue, maxvalue, callback)
			text = text or "  New Slider"
			minvalue = minvalue or 0
			maxvalue = maxvalue or 100
			callback = callback or function() end
			
			local sliderContainer = Instance.new("TextButton")
			local buttonCorner = Instance.new("UICorner")
			local sliderFrame = Instance.new("Frame")
			local sliderLabel = Instance.new("TextLabel")
			local sliderValue = Instance.new("TextLabel")
			local sliderValueCorner = Instance.new("UICorner")
			local sliderLabelCorner = Instance.new("UICorner")

			sliderContainer.Name = "sliderContainer"
			sliderContainer.Parent = newPage
			sliderContainer.BackgroundColor3 = Color3.fromRGB(42, 43, 49)
			sliderContainer.Size = UDim2.new(0, 357, 0, 37)
			sliderContainer.Font = Enum.Font.Gotham
			sliderContainer.Text = ""
			sliderContainer.TextColor3 = Color3.fromRGB(255, 255, 255)
			sliderContainer.TextSize = 14.000

			buttonCorner.CornerRadius = UDim.new(0, 3)
			buttonCorner.Name = "buttonCorner"
			buttonCorner.Parent = sliderContainer

			sliderFrame.Name = "sliderFrame"
			sliderFrame.Parent = sliderContainer
			sliderFrame.BackgroundColor3 = Color3.fromRGB(255, 109, 83)
			sliderFrame.Size = UDim2.new(0, 0, 0, 37)
			sliderFrame.ZIndex = 1
			sliderFrame.BorderSizePixel = 0

			sliderLabel.Name = "sliderLabel"
			sliderLabel.Parent = sliderContainer
			sliderLabel.BackgroundColor3 = Color3.fromRGB(42, 43, 49)
			sliderLabel.BackgroundTransparency = 1.000
			sliderLabel.Position = UDim2.new(0, 0, -0.0237637162, 0)
			sliderLabel.Size = UDim2.new(0, 357, 0, 37)
			sliderLabel.Font = Enum.Font.Gotham
			sliderLabel.Text = "  "..text
			sliderLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			sliderLabel.TextSize = 14.000
			sliderLabel.TextXAlignment = Enum.TextXAlignment.Left

			sliderValue.Name = "sliderValue"
			sliderValue.Parent = sliderContainer
			sliderValue.BackgroundColor3 = Color3.fromRGB(42, 43, 49)
			sliderValue.BackgroundTransparency = 1.000
			sliderValue.Position = UDim2.new(0.890756309, 0, 0.192452103, 0)
			sliderValue.Size = UDim2.new(0, 39, 0, 22)
			sliderValue.Font = Enum.Font.Gotham
			sliderValue.Text = "0"
			sliderValue.TextColor3 = Color3.fromRGB(255, 255, 255)
			sliderValue.TextSize = 14.000

			sliderValueCorner.CornerRadius = UDim.new(0, 3)
			sliderValueCorner.Name = "sliderValueCorner"
			sliderValueCorner.Parent = sliderValue

			sliderLabelCorner.CornerRadius = UDim.new(0, 3)
			sliderLabelCorner.Name = "sliderLabelCorner"
			sliderLabelCorner.Parent = sliderContainer
			
			local mouse = game.Players.LocalPlayer:GetMouse()
			local uis = game:GetService("UserInputService")
			local Value;
			
			sliderContainer.MouseButton1Down:Connect(function()
				Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 357) * sliderFrame.AbsoluteSize.X) + tonumber(minvalue)) or 0
				pcall(function()
					callback(Value)
				end)
				sliderFrame.Size = UDim2.new(0, math.clamp(mouse.X - sliderFrame.AbsolutePosition.X, 0, 357), 0, 37)
				moveconnection = mouse.Move:Connect(function()
					sliderValue.Text = Value
					Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 357) * sliderFrame.AbsoluteSize.X) + tonumber(minvalue))
					pcall(function()
						callback(Value)
					end)
					sliderFrame.Size = UDim2.new(0, math.clamp(mouse.X - sliderFrame.AbsolutePosition.X, 0, 357), 0, 37)
				end)
				releaseconnection = uis.InputEnded:Connect(function(Mouse)
					if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
						Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 357) * sliderFrame.AbsoluteSize.X) + tonumber(minvalue))
						pcall(function()
							callback(Value)
						end)
						sliderFrame.Size = UDim2.new(0, math.clamp(mouse.X - sliderFrame.AbsolutePosition.X, 0, 357), 0, 37)
						moveconnection:Disconnect()
						releaseconnection:Disconnect()
					end
				end)
			end)
		end
		
		function InnerLib:CreateDropdown(text, list, callback)
			callback = callback or function() end
			list = list or {}
			text = text or "New Dropdown"
			
			local isDropped = false
			
			local dropdownBtn = Instance.new("TextButton")
			local buttonCorner = Instance.new("UICorner")
			local UIListLayout = Instance.new("UIListLayout")
			local listFrame = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local ListButton = Instance.new("TextButton")
			local UIListLayout = Instance.new("UIListLayout")
			
			dropdownBtn.Name = "dropdownBtn"
			dropdownBtn.Parent = newPage
			dropdownBtn.BackgroundColor3 = Color3.fromRGB(42, 43, 49)
			dropdownBtn.Size = UDim2.new(0, 357, 0, 37)
			dropdownBtn.Font = Enum.Font.Gotham
			dropdownBtn.Text = text
			dropdownBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
			dropdownBtn.TextSize = 14.000

			buttonCorner.CornerRadius = UDim.new(0, 3)
			buttonCorner.Name = "buttonCorner"
			buttonCorner.Parent = dropdownBtn

			listFrame.Name = "listFrame"
			listFrame.Parent = MainFrame
			listFrame.AnchorPoint = Vector2.new(0.5, 0.5)
			listFrame.BackgroundColor3 = Color3.fromRGB(22, 23, 27)
			listFrame.BorderColor3 = Color3.fromRGB(27, 42, 53)
			listFrame.BorderSizePixel = 0
			listFrame.Position = UDim2.new(1.15415907, 0, 0.5, 0)
			listFrame.Size = UDim2.new(0, 141, 0, 360)
			listFrame.Visible = false
			listFrame.ClipsDescendants = true
			listFrame.BackgroundTransparency = 1
			
			UICorner.CornerRadius = UDim.new(0, 5)
			UICorner.Parent = listFrame

			UIListLayout.Parent = listFrame
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			
			dropdownBtn.MouseButton1Click:Connect(function()
				if isDropped then
					isDropped = false
					listFrame.Size = UDim2.new(0, 141, 0, 0)
					listFrame.Visible = false
					game.TweenService:Create(dropdownBtn, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						BackgroundColor3 = Color3.fromRGB(42, 43, 49)
					}):Play()
				else
					isDropped = true
					listFrame.Size = UDim2.new(0, 141, 0, 360)
					listFrame.Visible = true
					game.TweenService:Create(dropdownBtn, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						BackgroundColor3 = Color3.fromRGB(255, 109, 83)
					}):Play()
				end
			end)
			
			for i,v in next, list  do
				local ListButton = Instance.new("TextButton")
				
				ListButton.Name = "ListButton"
				ListButton.Parent = listFrame
				ListButton.BackgroundColor3 = Color3.fromRGB(22, 23, 27)
				ListButton.BorderColor3 = Color3.fromRGB(255, 109, 83)
				ListButton.BorderSizePixel = 0
				ListButton.Size = UDim2.new(0, 141, 0, 28)
				ListButton.Font = Enum.Font.Gotham
				ListButton.TextColor3 = Color3.fromRGB(255, 255, 255)
				ListButton.TextSize = 14.000
				ListButton.ZIndex = 10
				ListButton.Text = v
				
				ListButton.MouseButton1Click:Connect(function()
					dropdownBtn.Text = text..": "..v
					callback(v)
				end)
			end
		end
		
		return InnerLib
	end
	return TabHandler
end

return Note
