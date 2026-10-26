local Plrs = game:GetService("Players")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Camera = workspace.CurrentCamera
local MyPlr = Plrs.LocalPlayer

-- ค่าการตั้งค่าระบบ (Config)
local Settings = {
	ESPEnabled = true,
	TracersEnabled = true,
	AimbotEnabled = false,
	FOV = 120,
	TeamCheck = true,
	RainbowSkin = false,
	AstralMode = false,
}

-- รายชื่อคีย์ที่อนุญาต (ตามที่คุณต้องการ)
local ValidKeys = {
	["444"] = "Admin (ถาวร)",
	["freekey"] = "2 เดือน"
}

-- สร้าง ScreenGui หลัก
local MainGui = Instance.new("ScreenGui")
MainGui.Name = "HiaPanKeySystemHub"
MainGui.ResetOnSpawn = false
pcall(function() MainGui.Parent = CoreGui end)
if not MainGui.Parent then MainGui.Parent = MyPlr:WaitForChild("PlayerGui") end

--------------------------------------------------------------------------------
-- [ KEY SYSTEM UI ] หน้าต่างใส่คีย์ก่อนเข้าใช้งาน
--------------------------------------------------------------------------------
local KeyGui = Instance.new("Frame")
KeyGui.Size = UDim2.new(0, 360, 0, 220)
KeyGui.Position = UDim2.new(0.5, -180, 0.5, -110)
KeyGui.BackgroundColor3 = Color3.fromRGB(14, 14, 20)
KeyGui.Active = true
KeyGui.Draggable = true
KeyGui.Parent = MainGui

local KeyCorner = Instance.new("UICorner")
KeyCorner.CornerRadius = UDim.new(0, 12)
KeyCorner.Parent = KeyGui

local KeyStroke = Instance.new("UIStroke")
KeyStroke.Thickness = 2
KeyStroke.Color = Color3.fromRGB(0, 210, 255)
KeyStroke.Parent = KeyGui

local KeyTitle = Instance.new("TextLabel")
KeyTitle.Size = UDim2.new(1, 0, 0, 45)
KeyTitle.BackgroundTransparency = 1
KeyTitle.Text = "🔑 HIA PAN HUB - KEY SYSTEM"
KeyTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyTitle.Font = Enum.Font.GothamBold
KeyTitle.TextSize = 14
KeyTitle.Parent = KeyGui

local KeyInput = Instance.new("TextBox")
KeyInput.Size = UDim2.new(0.85, 0, 0, 42)
KeyInput.Position = UDim2.new(0.075, 0, 0.35, 0)
KeyInput.BackgroundColor3 = Color3.fromRGB(22, 22, 32)
KeyInput.PlaceholderText = "กรอกคีย์ของคุณที่นี่..."
KeyInput.Text = ""
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.PlaceholderColor3 = Color3.fromRGB(120, 120, 140)
KeyInput.Font = Enum.Font.GothamMedium
KeyInput.TextSize = 13
KeyInput.Parent = KeyGui

local InputCorner = Instance.new("UICorner")
InputCorner.CornerRadius = UDim.new(0, 8)
InputCorner.Parent = KeyInput

local SubmitBtn = Instance.new("TextButton")
SubmitBtn.Size = UDim2.new(0.85, 0, 0, 40)
SubmitBtn.Position = UDim2.new(0.075, 0, 0.65, 0)
SubmitBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
SubmitBtn.Text = "ยืนยันคีย์ (LOGIN)"
SubmitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitBtn.Font = Enum.Font.GothamBold
SubmitBtn.TextSize = 13
SubmitBtn.Parent = KeyGui

local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(0, 8)
BtnCorner.Parent = SubmitBtn

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(1, 0, 0, 25)
StatusLabel.Position = UDim2.new(0, 0, 0.86, 0)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = ""
StatusLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
StatusLabel.Font = Enum.Font.GothamMedium
StatusLabel.TextSize = 12
StatusLabel.Parent = KeyGui

--------------------------------------------------------------------------------
-- ฟังก์ชันเริ่มรันระบบหลัก (หลังใส่คีย์ถูก)
--------------------------------------------------------------------------------
local function StartMainHub()
	-- ลบหน้าต่างคีย์ทิ้ง
	KeyGui:Destroy()

	-- [ INTRO & MUSIC ] (ID: 90888787859288)
	local IntroSound = Instance.new("Sound")
	IntroSound.SoundId = "rbxassetid://90888787859288"
	IntroSound.Volume = 1.5
	IntroSound.Parent = CoreGui
	pcall(function() IntroSound:Play() end)

	local IntroHolder = Instance.new("Frame")
	IntroHolder.Size = UDim2.new(0, 600, 0, 200)
	IntroHolder.Position = UDim2.new(0.5, -300, 0.45, -100)
	IntroHolder.BackgroundTransparency = 1
	IntroHolder.Parent = MainGui

	local IntroTextShadow = Instance.new("TextLabel")
	IntroTextShadow.Size = UDim2.new(1, 0, 1, 0)
	IntroTextShadow.Position = UDim2.new(0, 4, 0, 4)
	IntroTextShadow.BackgroundTransparency = 1
	IntroTextShadow.Text = "เฮียปั้นการันตี"
	IntroTextShadow.TextColor3 = Color3.fromRGB(0, 40, 100)
	IntroTextShadow.Font = Enum.Font.FredokaOne
	IntroTextShadow.TextSize = 64
	IntroTextShadow.TextTransparency = 1
	IntroTextShadow.Parent = IntroHolder

	local IntroText = Instance.new("TextLabel")
	IntroText.Size = UDim2.new(1, 0, 1, 0)
	IntroText.BackgroundTransparency = 1
	IntroText.Text = "เฮียปั้นการันตี"
	IntroText.TextColor3 = Color3.fromRGB(0, 220, 255)
	IntroText.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
	IntroText.TextStrokeTransparency = 0
	IntroText.Font = Enum.Font.FredokaOne
	IntroText.TextSize = 64
	IntroText.TextTransparency = 1
	IntroText.Parent = IntroHolder

	task.spawn(function()
		TweenService:Create(IntroText, TweenInfo.new(1, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
		TweenService:Create(IntroTextShadow, TweenInfo.new(1, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
		
		task.wait(4.5)
		
		local fadeOut1 = TweenService:Create(IntroText, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {TextTransparency = 1, TextStrokeTransparency = 1})
		local fadeOut2 = TweenService:Create(IntroTextShadow, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {TextTransparency = 1})
		fadeOut1:Play()
		fadeOut2:Play()
		fadeOut1.Completed:Wait()
		
		IntroHolder:Destroy()
		pcall(function() IntroSound:Stop(); IntroSound:Destroy() end)
	end)

	----------------------------------------------------------------------------
	-- [ MAIN UI ] เมนูพรีเมียม ขอบ RGB วิ่งวน
	----------------------------------------------------------------------------
	local OpenBtn = Instance.new("TextButton")
	OpenBtn.Size = UDim2.new(0, 85, 0, 36)
	OpenBtn.Position = UDim2.new(0, 15, 0.4, 0)
	OpenBtn.BackgroundColor3 = Color3.fromRGB(18, 18, 25)
	OpenBtn.Text = "⚡ MENU"
	OpenBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	OpenBtn.Font = Enum.Font.GothamBold
	OpenBtn.TextSize = 13
	OpenBtn.Visible = false
	OpenBtn.Parent = MainGui

	local OpenCorner = Instance.new("UICorner")
	OpenCorner.CornerRadius = UDim.new(0, 10)
	OpenCorner.Parent = OpenBtn

	local Frame = Instance.new("Frame")
	Frame.Size = UDim2.new(0, 520, 0, 380)
	Frame.Position = UDim2.new(0.5, -260, 0.5, -190)
	Frame.BackgroundColor3 = Color3.fromRGB(14, 14, 20)
	Frame.Active = true
	Frame.Draggable = true
	Frame.Visible = false
	Frame.Parent = MainGui

	task.delay(5.8, function()
		OpenBtn.Visible = true
		Frame.Visible = true
	end)

	local FrameCorner = Instance.new("UICorner")
	FrameCorner.CornerRadius = UDim.new(0, 14)
	FrameCorner.Parent = Frame

	local RGBStroke = Instance.new("UIStroke")
	RGBStroke.Thickness = 2.5
	RGBStroke.Parent = Frame

	task.spawn(function()
		while true do
			for i = 0, 1, 0.004 do
				RGBStroke.Color = Color3.fromHSV(i, 1, 1)
				task.wait(0.02)
			end
		end
	end)

	-- Header Bar
	local Header = Instance.new("Frame")
	Header.Size = UDim2.new(1, 0, 0, 48)
	Header.BackgroundTransparency = 1
	Header.Parent = Frame

	local Title = Instance.new("TextLabel")
	Title.Size = UDim2.new(1, -20, 1, 0)
	Title.Position = UDim2.new(0, 18, 0, 0)
	Title.BackgroundTransparency = 1
	Title.Text = "⚡ HIA PAN HUB | EXCLUSIVE"
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.Font = Enum.Font.GothamBold
	Title.TextSize = 14
	Title.TextXAlignment = Enum.TextXAlignment.Left
	Title.Parent = Header

	local CloseBtn = Instance.new("TextButton")
	CloseBtn.Size = UDim2.new(0, 32, 0, 32)
	CloseBtn.Position = UDim2.new(1, -40, 0, 8)
	CloseBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
	CloseBtn.Text = "✕"
	CloseBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
	CloseBtn.Font = Enum.Font.GothamBold
	CloseBtn.TextSize = 14
	CloseBtn.Parent = Header

	local CloseCorner = Instance.new("UICorner")
	CloseCorner.CornerRadius = UDim.new(0, 8)
	CloseCorner.Parent = CloseBtn

	CloseBtn.MouseButton1Click:Connect(function() Frame.Visible = false end)
	OpenBtn.MouseButton1Click:Connect(function() Frame.Visible = not Frame.Visible end)
	UserInputService.InputBegan:Connect(function(input, gp)
		if not gp and input.KeyCode == Enum.KeyCode.Insert then Frame.Visible = not Frame.Visible end
	end)

	-- Tabs System
	local TabBar = Instance.new("Frame")
	TabBar.Size = UDim2.new(1, -36, 0, 38)
	TabBar.Position = UDim2.new(0, 18, 0, 52)
	TabBar.BackgroundColor3 = Color3.fromRGB(22, 22, 30)
	TabBar.Parent = Frame

	local TabBarCorner = Instance.new("UICorner")
	TabBarCorner.CornerRadius = UDim.new(0, 10)
	TabBarCorner.Parent = TabBar

	local TabListLayout = Instance.new("UIListLayout")
	TabListLayout.FillDirection = Enum.FillDirection.Horizontal
	TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	TabListLayout.Parent = TabBar

	local ContainerHolder = Instance.new("Frame")
	ContainerHolder.Size = UDim2.new(1, -36, 1, -110)
	ContainerHolder.Position = UDim2.new(0, 18, 0, 100)
	ContainerHolder.BackgroundTransparency = 1
	ContainerHolder.Parent = Frame

	local Pages = {}
	local TabButtons = {}

	local function CreateTab(name, isDefault)
		local TabBtn = Instance.new("TextButton")
		TabBtn.Size = UDim2.new(0.333, 0, 1, 0)
		TabBtn.BackgroundTransparency = 1
		TabBtn.Text = name
		TabBtn.TextColor3 = isDefault and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(140, 140, 160)
		TabBtn.Font = Enum.Font.GothamBold
		TabBtn.TextSize = 12
		TabBtn.Parent = TabBar

		local Page = Instance.new("ScrollingFrame")
		Page.Size = UDim2.new(1, 0, 1, 0)
		Page.BackgroundTransparency = 1
		Page.BorderSizePixel = 0
		Page.ScrollBarThickness = 3
		Page.CanvasSize = UDim2.new(0, 0, 0, 260)
		Page.Visible = isDefault
		Page.Parent = ContainerHolder

		local PageLayout = Instance.new("UIListLayout")
		PageLayout.SortOrder = Enum.SortOrder.LayoutOrder
		PageLayout.Padding = UDim.new(0, 8)
		PageLayout.Parent = Page

		table.insert(Pages, Page)
		table.insert(TabButtons, TabBtn)

		TabBtn.MouseButton1Click:Connect(function()
			for _, p in ipairs(Pages) do p.Visible = false end
			for _, b in ipairs(TabButtons) do b.TextColor3 = Color3.fromRGB(140, 140, 160) end
			Page.Visible = true
			TabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
		end)

		return Page
	end

	local VisualsPage = CreateTab("Visuals (ESP)", true)
	local CombatPage = CreateTab("Combat (Aimbot)", false)
	local FashionPage = CreateTab("Fashion & Misc", false)

	local function CreateToggle(parent, name, settingKey, callback)
		local Btn = Instance.new("TextButton")
		Btn.Size = UDim2.new(1, 0, 0, 44)
		Btn.BackgroundColor3 = Color3.fromRGB(22, 22, 32)
		Btn.AutoButtonColor = false
		Btn.Text = ""
		Btn.Parent = parent

		local Corner = Instance.new("UICorner")
		Corner.CornerRadius = UDim.new(0, 10)
		Corner.Parent = Btn

		local Label = Instance.new("TextLabel")
		Label.Size = UDim2.new(0.7, 0, 1, 0)
		Label.Position = UDim2.new(0, 15, 0, 0)
		Label.BackgroundTransparency = 1
		Label.Text = name
		Label.TextColor3 = Color3.fromRGB(230, 230, 240)
		Label.Font = Enum.Font.GothamMedium
		Label.TextSize = 13
		Label.TextXAlignment = Enum.TextXAlignment.Left
		Label.Parent = Btn

		local Status = Instance.new("TextLabel")
		Status.Size = UDim2.new(0.3, -15, 1, 0)
		Status.Position = UDim2.new(0.7, 0, 0, 0)
		Status.BackgroundTransparency = 1
		Status.Font = Enum.Font.GothamBold
		Status.TextSize = 13
		Status.TextXAlignment = Enum.TextXAlignment.Right
		Status.Parent = Btn

		local function UpdateState()
			if Settings[settingKey] then
				Status.Text = "ACTIVE"
				Status.TextColor3 = Color3.fromRGB(80, 255, 140)
				TweenService:Create(Btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(28, 32, 48)}):Play()
			else
				Status.Text = "OFF"
				Status.TextColor3 = Color3.fromRGB(255, 90, 90)
				TweenService:Create(Btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(22, 22, 32)}):Play()
			end
		end

		Btn.MouseButton1Click:Connect(function()
			Settings[settingKey] = not Settings[settingKey]
			UpdateState()
			if callback then callback(Settings[settingKey]) end
		end)
		UpdateState()
	end

	CreateToggle(VisualsPage, "ESP Box & Name (มองทะลุกรอบชื่อ)", "ESPEnabled")
	CreateToggle(VisualsPage, "Tracers (เส้นสีรุ้งนำเข้าหาตัว)", "TracersEnabled")

	CreateToggle(CombatPage, "Aimbot (ล็อกเป้าคลิกขวา)", "AimbotEnabled")
	CreateToggle(CombatPage, "Team Check (ไม่ล็อกพวกเดียวกัน)", "TeamCheck")

	----------------------------------------------------------------------------
	-- [ SYSTEM 1: ระบบถอดจิต (ASTRAL PROJECTION) ]
	----------------------------------------------------------------------------
	local AstralPart = nil

	local function ToggleAstralMode(enable)
		local char = MyPlr.Character
		if not char then return end
		local root = char:FindFirstChild("HumanoidRootPart")
		local hum = char:FindFirstChildOfClass("Humanoid")
		
		if enable then
			if root and hum then
				hum.PlatformStand = true
				root.Anchored = true
				
				AstralPart = Instance.new("Part")
				AstralPart.Size = Vector3.new(1, 1, 1)
				AstralPart.Transparency = 1
				AstralPart.CanCollide = false
				AstralPart.Anchored = true
				AstralPart.CFrame = Camera.CFrame
				AstralPart.Parent = workspace
				
				Camera.CameraSubject = AstralPart
			end
		else
			if root and hum then
				hum.PlatformStand = false
				root.Anchored = false
				if char:FindFirstChild("Head") then
					Camera.CameraSubject = char.Head
				end
			end
			if AstralPart then
				AstralPart:Destroy()
				AstralPart = nil
			end
		end
	end

	CreateToggle(FashionPage, "ระบบถอดจิต (Astral / กด V)", "AstralMode", function(state)
		ToggleAstralMode(state)
	end)

	UserInputService.InputBegan:Connect(function(input, gp)
		if not gp and input.KeyCode == Enum.KeyCode.V then
			Settings.AstralMode = not Settings.AstralMode
			ToggleAstralMode(Settings.AstralMode)
		end
	end)

	RunService.RenderStepped:Connect(function()
		if Settings.AstralMode and AstralPart then
			local moveDir = Vector3.new()
			if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDir = moveDir + Camera.CFrame.LookVector end
			if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDir = moveDir - Camera.CFrame.LookVector end
			if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveDir = moveDir - Camera.CFrame.RightVector end
			if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveDir = moveDir + Camera.CFrame.RightVector end
			if UserInputService:IsKeyDown(Enum.KeyCode.E) then moveDir = moveDir + Vector3.new(0, 1, 0) end
			if UserInputService:IsKeyDown(Enum.KeyCode.Q) then moveDir = moveDir - Vector3.new(0, 1, 0) end
			
			AstralPart.CFrame = AstralPart.CFrame + (moveDir * 1.5)
			Camera.CFrame = CFrame.new(AstralPart.Position, AstralPart.Position + Camera.CFrame.LookVector)
		end
	end)

	----------------------------------------------------------------------------
	-- [ SYSTEM 2: แฟชั่นตัวสีรุ้ง (RAINBOW SKIN) ]
	----------------------------------------------------------------------------
	CreateToggle(FashionPage, "แฟชั่นตัวสีรุ้ง (Rainbow Skin)", "RainbowSkin")

	task.spawn(function()
		local hue = 0
		while true do
			hue = hue + 0.005
			if hue > 1 then hue = 0 end
			local rainbowColor = Color3.fromHSV(hue, 1, 1)
			
			if Settings.RainbowSkin and MyPlr.Character then
				for _, part in ipairs(MyPlr.Character:GetChildren()) do
					if part:IsA("BasePart") then
						part.Color = rainbowColor
						part.Material = Enum.Material.Neon
					end
				end
			end
			task.wait(0.03)
		end
	end)

	----------------------------------------------------------------------------
	-- [ AIMBOT & ESP & RAINBOW TRACERS SYSTEM ]
	----------------------------------------------------------------------------
	local FOVCircle = Drawing.new("Circle")
	FOVCircle.Visible = true
	FOVCircle.Filled = false
	FOVCircle.Thickness = 1.8
	FOVCircle.Color = Color3.fromRGB(0, 230, 255)
	FOVCircle.Transparency = 0.8
	FOVCircle.Radius = Settings.FOV

	local function IsEnemy(plr)
		if not Settings.TeamCheck then return true end
		if plr.Team and MyPlr.Team then return plr.Team ~= MyPlr.Team end
		return true
	end

	local function GetClosestPlayer()
		local closestPlr = nil
		local shortestDist = Settings.FOV
		for _, plr in ipairs(Plrs:GetPlayers()) do
			if plr ~= MyPlr and plr.Character and plr.Character:FindFirstChild("Head") and plr.Character:FindFirstChild("Humanoid") then
				if plr.Character.Humanoid.Health > 0 and IsEnemy(plr) then
					local headPos, onScreen = Camera:WorldToViewportPoint(plr.Character.Head.Position)
					if onScreen then
						local dist = (Vector2.new(headPos.X, headPos.Y) - UserInputService:GetMouseLocation()).Magnitude
						if dist < shortestDist then
							shortestDist = dist
							closestPlr = plr
						end
					end
				end
			end
		end
		return closestPlr
	end

	local ESPCache = {}
	local function RemoveESP(plr)
		if ESPCache[plr] then
			if ESPCache[plr].Box then ESPCache[plr].Box:Remove() end
			if ESPCache[plr].Name then ESPCache[plr].Name:Remove() end
			if ESPCache[plr].Tracer then ESPCache[plr].Tracer:Remove() end
			ESPCache[plr] = nil
		end
	end

	RunService.RenderStepped:Connect(function()
		FOVCircle.Position = UserInputService:GetMouseLocation()
		FOVCircle.Visible = Settings.AimbotEnabled

		if Settings.AimbotEnabled and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
			local target = GetClosestPlayer()
			if target and target.Character and target.Character:FindFirstChild("Head") then
				Camera.CFrame = CFrame.new(Camera.CFrame.Position, target.Character.Head.Position)
			end
		end

		local tracerHue = (tick() % 5) / 5
		local rainbowTracerColor = Color3.fromHSV(tracerHue, 1, 1)

		for _, plr in ipairs(Plrs:GetPlayers()) do
			if plr ~= MyPlr then
				local char = plr.Character
				if Settings.ESPEnabled and char and char:FindFirstChild("HumanoidRootPart") and char:FindFirstChild("Head") and char:FindFirstChild("Humanoid") and char.Humanoid.Health > 0 then
					if not ESPCache[plr] then
						local box = Drawing.new("Square")
						box.Visible = false
						box.Color = Color3.fromRGB(255, 255, 255)
						box.Thickness = 1.5

						local name = Drawing.new("Text")
						name.Visible = false
						name.Color = Color3.fromRGB(255, 255, 255)
						name.Size = 13
						name.Center = true
						name.Outline = true

						local tracer = Drawing.new("Line")
						tracer.Visible = false
						tracer.Thickness = 1.5

						ESPCache[plr] = {Box = box, Name = name, Tracer = tracer}
					end

					local cache = ESPCache[plr]
					local rootPart = char.HumanoidRootPart
					local head = char.Head
					local rootPos, onScreen = Camera:WorldToViewportPoint(rootPart.Position)

					if onScreen then
						local headPos = Camera:WorldToViewportPoint(head.Position + Vector3.new(0, 0.5, 0))
						local legPos = Camera:WorldToViewportPoint(rootPart.Position - Vector3.new(0, 3, 0))
						local height = math.abs(headPos.Y - legPos.Y)
						local width = height / 2

						cache.Box.Size = Vector2.new(width, height)
						cache.Box.Position = Vector2.new(rootPos.X - width / 2, headPos.Y)
						cache.Box.Visible = true

						local dist = math.floor((Camera.CFrame.Position - rootPart.Position).Magnitude)
						cache.Name.Text = plr.Name .. " [" .. dist .. "m]"
						cache.Name.Position = Vector2.new(rootPos.X, headPos.Y - 18)
						cache.Name.Visible = true

						if Settings.TracersEnabled then
							cache.Tracer.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
							cache.Tracer.To = Vector2.new(rootPos.X, legPos.Y)
							cache.Tracer.Color = rainbowTracerColor
							cache.Tracer.Visible = true
						else
							cache.Tracer.Visible = false
						end
					else
						cache.Box.Visible = false
						cache.Name.Visible = false
						cache.Tracer.Visible = false
					end
				else
					RemoveESP(plr)
				end
			end
		end
	end)

	Plrs.PlayerRemoving:Connect(function(plr) RemoveESP(plr) end)
end

--------------------------------------------------------------------------------
-- ตรวจสอบคีย์เมื่อกดปุ่ม Login
--------------------------------------------------------------------------------
SubmitBtn.MouseButton1Click:Connect(function()
	local enteredKey = KeyInput.Text
	if ValidKeys[enteredKey] then
		StatusLabel.TextColor3 = Color3.fromRGB(80, 255, 140)
		StatusLabel.Text = "✓ เข้าสู่ระบบสำเร็จ! (" .. ValidKeys[enteredKey] .. ")"
		task.wait(0.8)
		StartMainHub()
	else
		StatusLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
		StatusLabel.Text = "✕ คีย์ไม่ถูกต้อง! กรุณาลองใหม่อีกครั้ง"
	end
end)
