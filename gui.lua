local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local guiParent = game:GetService("CoreGui")

-- usuń poprzednią wersję
local old = guiParent:FindFirstChild("MyModernGUI")
if old then
    old:Destroy()
end

local GUI = Instance.new("ScreenGui")
GUI.Name = "MyModernGUI"
GUI.ResetOnSpawn = false
GUI.IgnoreGuiInset = true
GUI.Parent = guiParent

-- =========================
-- GŁÓWNE OKNO
-- =========================

local Main = Instance.new("Frame")
Main.Size = UDim2.fromOffset(620, 390)
Main.Position = UDim2.new(0.5, -310, 0.5, -195)
Main.BackgroundColor3 = Color3.fromRGB(17, 18, 24)
Main.BorderSizePixel = 0
Main.ClipsDescendants = true
Main.Parent = GUI

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 14)
Corner.Parent = Main

local Stroke = Instance.new("UIStroke")
Stroke.Color = Color3.fromRGB(55, 57, 70)
Stroke.Thickness = 1
Stroke.Transparency = 0.25
Stroke.Parent = Main

-- =========================
-- TOP BAR
-- =========================

local Top = Instance.new("Frame")
Top.Size = UDim2.new(1, 0, 0, 58)
Top.BackgroundColor3 = Color3.fromRGB(22, 23, 31)
Top.BorderSizePixel = 0
Top.Parent = Main

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -130, 1, 0)
Title.Position = UDim2.fromOffset(20, 0)
Title.BackgroundTransparency = 1
Title.Text = "  NOVA"
Title.TextColor3 = Color3.fromRGB(245, 245, 250)
Title.TextSize = 20
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Top

local Subtitle = Instance.new("TextLabel")
Subtitle.Size = UDim2.fromOffset(250, 20)
Subtitle.Position = UDim2.fromOffset(22, 33)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "Modern Lua Interface"
Subtitle.TextColor3 = Color3.fromRGB(130, 132, 145)
Subtitle.TextSize = 11
Subtitle.Font = Enum.Font.Gotham
Subtitle.TextXAlignment = Enum.TextXAlignment.Left
Subtitle.Parent = Top

-- =========================
-- CLOSE BUTTON
-- =========================

local Close = Instance.new("TextButton")
Close.Size = UDim2.fromOffset(38, 38)
Close.Position = UDim2.new(1, -48, 0, 10)
Close.BackgroundColor3 = Color3.fromRGB(35, 36, 45)
Close.Text = "×"
Close.TextColor3 = Color3.fromRGB(220, 220, 225)
Close.TextSize = 25
Close.Font = Enum.Font.Gotham
Close.AutoButtonColor = false
Close.Parent = Top

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 9)
CloseCorner.Parent = Close

Close.MouseEnter:Connect(function()
    TweenService:Create(
        Close,
        TweenInfo.new(0.15),
        {BackgroundColor3 = Color3.fromRGB(180, 55, 65)}
    ):Play()
end)

Close.MouseLeave:Connect(function()
    TweenService:Create(
        Close,
        TweenInfo.new(0.15),
        {BackgroundColor3 = Color3.fromRGB(35, 36, 45)}
    ):Play()
end)

-- =========================
-- SIDEBAR
-- =========================

local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.new(0, 155, 1, -58)
Sidebar.Position = UDim2.fromOffset(0, 58)
Sidebar.BackgroundColor3 = Color3.fromRGB(20, 21, 28)
Sidebar.BorderSizePixel = 0
Sidebar.Parent = Main

local Layout = Instance.new("UIListLayout")
Layout.Padding = UDim.new(0, 7)
Layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
Layout.SortOrder = Enum.SortOrder.LayoutOrder
Layout.Parent = Sidebar

local Padding = Instance.new("UIPadding")
Padding.PaddingTop = UDim.new(0, 15)
Padding.Parent = Sidebar

-- =========================
-- CONTENT
-- =========================

local Content = Instance.new("Frame")
Content.Size = UDim2.new(1, -155, 1, -58)
Content.Position = UDim2.new(0, 155, 0, 58)
Content.BackgroundColor3 = Color3.fromRGB(17, 18, 24)
Content.BorderSizePixel = 0
Content.Parent = Main

local function createPageButton(text, order)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.fromOffset(130, 42)
    Button.BackgroundColor3 = Color3.fromRGB(28, 29, 38)
    Button.Text = text
    Button.TextColor3 = Color3.fromRGB(155, 157, 170)
    Button.TextSize = 14
    Button.Font = Enum.Font.GothamMedium
    Button.AutoButtonColor = false
    Button.LayoutOrder = order
    Button.Parent = Sidebar

    local C = Instance.new("UICorner")
    C.CornerRadius = UDim.new(0, 9)
    C.Parent = Button

    Button.MouseEnter:Connect(function()
        TweenService:Create(
            Button,
            TweenInfo.new(0.15),
            {
                BackgroundColor3 = Color3.fromRGB(37, 39, 50),
                TextColor3 = Color3.fromRGB(235, 235, 240)
            }
        ):Play()
    end)

    Button.MouseLeave:Connect(function()
        TweenService:Create(
            Button,
            TweenInfo.new(0.15),
            {
                BackgroundColor3 = Color3.fromRGB(28, 29, 38),
                TextColor3 = Color3.fromRGB(155, 157, 170)
            }
        ):Play()
    end)

    return Button
end

local HomeButton = createPageButton("  Home", 1)
local SettingsButton = createPageButton("  Settings", 2)
local AboutButton = createPageButton("  About", 3)

-- =========================
-- HOME PAGE
-- =========================

local Welcome = Instance.new("TextLabel")
Welcome.Size = UDim2.new(1, -40, 0, 50)
Welcome.Position = UDim2.fromOffset(20, 25)
Welcome.BackgroundTransparency = 1
Welcome.Text = "Welcome back 👋"
Welcome.TextColor3 = Color3.fromRGB(240, 240, 245)
Welcome.TextSize = 25
Welcome.Font = Enum.Font.GothamBold
Welcome.TextXAlignment = Enum.TextXAlignment.Left
Welcome.Parent = Content

local Info = Instance.new("TextLabel")
Info.Size = UDim2.new(1, -40, 0, 50)
Info.Position = UDim2.fromOffset(20, 70)
Info.BackgroundTransparency = 1
Info.Text = "This is your personal test interface."
Info.TextColor3 = Color3.fromRGB(135, 137, 150)
Info.TextSize = 14
Info.Font = Enum.Font.Gotham
Info.TextXAlignment = Enum.TextXAlignment.Left
Info.Parent = Content

local TestButton = Instance.new("TextButton")
TestButton.Size = UDim2.fromOffset(210, 48)
TestButton.Position = UDim2.fromOffset(20, 135)
TestButton.BackgroundColor3 = Color3.fromRGB(70, 75, 105)
TestButton.Text = "Run Test"
TestButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TestButton.TextSize = 15
TestButton.Font = Enum.Font.GothamBold
TestButton.AutoButtonColor = false
TestButton.Parent = Content

local TestCorner = Instance.new("UICorner")
TestCorner.CornerRadius = UDim.new(0, 10)
TestCorner.Parent = TestButton

TestButton.MouseEnter:Connect(function()
    TweenService:Create(
        TestButton,
        TweenInfo.new(0.15),
        {BackgroundColor3 = Color3.fromRGB(90, 96, 135)}
    ):Play()
end)

TestButton.MouseLeave:Connect(function()
    TweenService:Create(
        TestButton,
        TweenInfo.new(0.15),
        {BackgroundColor3 = Color3.fromRGB(70, 75, 105)}
    ):Play()
end)

TestButton.MouseButton1Click:Connect(function()
    TestButton.Text = "✓ Test complete"

    task.delay(1.5, function()
        if TestButton then
            TestButton.Text = "Run Test"
        end
    end)
end)

-- =========================
-- DRAGOWANIE OKNA
-- =========================

local dragging = false
local dragStart
local startPos

Top.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = Main.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart

        Main.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

-- =========================
-- ANIMOWANE OTWIERANIE
-- =========================

local open = true
local originalSize = Main.Size
local originalPosition = Main.Position

Main.Size = UDim2.fromOffset(0, 0)

TweenService:Create(
    Main,
    TweenInfo.new(0.45, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
    {
        Size = originalSize,
        Position = originalPosition
    }
):Play()

local function closeGui()
    if not open then
        return
    end

    open = false

    local tween = TweenService:Create(
        Main,
        TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.In),
        {
            Size = UDim2.fromOffset(0, 0)
        }
    )

    tween:Play()
end

local function openGui()
    if open then
        return
    end

    open = true

    TweenService:Create(
        Main,
        TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
        {
            Size = originalSize
        }
    ):Play()
end

Close.MouseButton1Click:Connect(closeGui)

-- =========================
-- RIGHT SHIFT
-- =========================

UIS.InputBegan:Connect(function(input, processed)
    if processed then
        return
    end

    if input.KeyCode == Enum.KeyCode.RightShift then
        if open then
            closeGui()
        else
            openGui()
        end
    end
end)
