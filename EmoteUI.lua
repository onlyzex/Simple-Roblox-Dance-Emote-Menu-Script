--== Simple Emote UI Script Roblox ==--
--== Coded By Ibraa ==--
--== Join Discord https://discord.gg/GWw437V2BY for getting many script and other game stuff ==--
--== Any Help? discord: @yourzee ==--

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local gui = Instance.new("ScreenGui")
gui.Name = "EmoteUI"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = playerGui

local uiScale = Instance.new("UIScale")
uiScale.Scale = 0.65 
uiScale.Parent = gui

local emoteBtn = Instance.new("TextButton")
emoteBtn.Size = UDim2.new(0, 80, 0, 36)
emoteBtn.AnchorPoint = Vector2.new(1, 0)
emoteBtn.Position = UDim2.new(1, -20, 0, 20) 
emoteBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
emoteBtn.BackgroundTransparency = 0.2
emoteBtn.Font = Enum.Font.GothamBold
emoteBtn.Text = "🎭"
emoteBtn.TextSize = 20
emoteBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
emoteBtn.Parent = gui

local emBtnCorner = Instance.new("UICorner", emoteBtn)
emBtnCorner.CornerRadius = UDim.new(0, 10)

local emBtnStroke = Instance.new("UIStroke", emoteBtn)
emBtnStroke.Color = Color3.fromRGB(200, 200, 220)
emBtnStroke.Transparency = 0.5
emBtnStroke.Thickness = 1

local popup = Instance.new("Frame")
popup.Size = UDim2.new(0, 220, 0, 280)
popup.AnchorPoint = Vector2.new(0, 1)
popup.Position = UDim2.new(0, 20, 0.75, 0) 
popup.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
popup.BackgroundTransparency = 0.4
popup.Visible = false
popup.Parent = gui

local corner = Instance.new("UICorner", popup)
corner.CornerRadius = UDim.new(0, 12)

local stroke = Instance.new("UIStroke", popup)
stroke.Color = Color3.fromRGB(200, 200, 220)
stroke.Transparency = 0.6
stroke.Thickness = 1

local padding = Instance.new("UIPadding", popup)
padding.PaddingTop = UDim.new(0, 12)
padding.PaddingBottom = UDim.new(0, 12)
padding.PaddingLeft = UDim.new(0, 12)
padding.PaddingRight = UDim.new(0, 12)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -40, 0, 32)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.Text = "Ibra Simple Emote"
title.TextColor3 = Color3.fromRGB(230, 230, 255)
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = popup

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 26, 0, 26)
closeBtn.Position = UDim2.new(1, -30, 0, 3)
closeBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
closeBtn.BackgroundTransparency = 0.3
closeBtn.Text = "✕"
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 16
closeBtn.TextColor3 = Color3.fromRGB(255, 150, 150)
closeBtn.Parent = popup

local cbCorner = Instance.new("UICorner", closeBtn)
cbCorner.CornerRadius = UDim.new(0, 6)

local searchBox = Instance.new("TextBox")
searchBox.Size = UDim2.new(1, -20, 0, 28)
searchBox.Position = UDim2.new(0, 0, 0, 38)
searchBox.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
searchBox.BackgroundTransparency = 0.2
searchBox.PlaceholderText = "🔍 Search emote..."
searchBox.Font = Enum.Font.Gotham
searchBox.Text = ""
searchBox.TextSize = 16
searchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
searchBox.ClearTextOnFocus = false
searchBox.Parent = popup

local sbCorner = Instance.new("UICorner", searchBox)
sbCorner.CornerRadius = UDim.new(0, 6)

local sbStroke = Instance.new("UIStroke", searchBox)
sbStroke.Color = Color3.fromRGB(200, 200, 220)
sbStroke.Transparency = 0.6
sbStroke.Thickness = 1

local list = Instance.new("ScrollingFrame", popup)
list.Size = UDim2.new(1, 0, 1, -120) 
list.Position = UDim2.new(0, 0, 0, 72)
list.BackgroundTransparency = 1
list.ScrollBarThickness = 6
list.ScrollBarImageTransparency = 0.5
list.AutomaticCanvasSize = Enum.AutomaticSize.Y
list.VerticalScrollBarInset = Enum.ScrollBarInset.Always

local layout = Instance.new("UIListLayout", list)
layout.Padding = UDim.new(0, 8)
layout.SortOrder = Enum.SortOrder.LayoutOrder

-- Emote List Using Asset ID --Tinggal custom dan tambahkan sesuka kalian
local emotes = {
	{name="Pacu Jalur", animId=118552217459650},
	{name="Switchway Dance", animId=112534296956901},
	{name="Happy Dance", animId=104149584253673},
	{name="Concert Dance", animId=119159857703733},
	{name="Korean Dance", animId=103097233919227},
	{name="Nippon Dance", animId=126092655593662}
}

local currentTrack = nil

local function playEmote(animId)
	local char = player.Character or player.CharacterAdded:Wait()
	local humanoid = char:WaitForChild("Humanoid")

	if currentTrack then
		currentTrack:Stop()
		currentTrack:Destroy()
		currentTrack = nil
	end

	local anim = Instance.new("Animation")
	anim.AnimationId = "rbxassetid://" .. animId
	local track = humanoid:LoadAnimation(anim)
	track:Play()
	currentTrack = track
end

local function stopCurrentEmote()
	if currentTrack then
		currentTrack:Stop()
		currentTrack:Destroy()
		currentTrack = nil
	end
end

local buttons = {}

for _, emote in ipairs(emotes) do
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, 0, 0, 42)
	btn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
	btn.BackgroundTransparency = 0.3
	btn.Font = Enum.Font.Gotham
	btn.Text = emote.name
	btn.TextSize = 18
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.AutoButtonColor = false
	btn.Parent = list

	local btnCorner = Instance.new("UICorner", btn)
	btnCorner.CornerRadius = UDim.new(0, 8)

	local btnStroke = Instance.new("UIStroke", btn)
	btnStroke.Color = Color3.fromRGB(200, 200, 220)
	btnStroke.Transparency = 0.6
	btnStroke.Thickness = 1

	btn.MouseButton1Click:Connect(function()
		playEmote(emote.animId)
	end)

	buttons[#buttons+1] = {btn=btn, data=emote}
end

searchBox:GetPropertyChangedSignal("Text"):Connect(function()
	local query = string.lower(searchBox.Text)
	for _, entry in ipairs(buttons) do
		if query == "" or string.find(string.lower(entry.data.name), query, 1, true) then
			entry.btn.Visible = true
		else
			entry.btn.Visible = false
		end
	end
end)

local stopBtn = Instance.new("TextButton")
stopBtn.Size = UDim2.new(1, 0, 0, 40)
stopBtn.Position = UDim2.new(0, 0, 1, -44)
stopBtn.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
stopBtn.BackgroundTransparency = 0.2
stopBtn.Font = Enum.Font.GothamBold
stopBtn.Text = "Stop Emote"
stopBtn.TextColor3 = Color3.fromRGB(255, 220, 220)
stopBtn.TextSize = 18
stopBtn.Parent = popup

local stopCorner = Instance.new("UICorner", stopBtn)
stopCorner.CornerRadius = UDim.new(0, 8)

local stopStroke = Instance.new("UIStroke", stopBtn)
stopStroke.Color = Color3.fromRGB(255, 150, 150)
stopStroke.Transparency = 0.6
stopStroke.Thickness = 1

stopBtn.MouseButton1Click:Connect(stopCurrentEmote)

local function showPopup()
	popup.Visible = true
	popup.BackgroundTransparency = 1
	TweenService:Create(popup, TweenInfo.new(0.25), {BackgroundTransparency = 0.4}):Play()
end

local function hidePopup()
	local tween = TweenService:Create(popup, TweenInfo.new(0.25), {BackgroundTransparency = 1})
	tween:Play()
	tween.Completed:Connect(function()
		popup.Visible = false
	end)
end

emoteBtn.MouseButton1Click:Connect(showPopup)
closeBtn.MouseButton1Click:Connect(hidePopup)

--== Simple Emote UI Script Roblox ==--
--== Coded By Ibraa ==--
--== Join Discord https://discord.gg/GWw437V2BY for getting many script and other game stuff ==--
--== Any Help? discord: @yourzee ==--

