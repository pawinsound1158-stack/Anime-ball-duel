-- ╔══════════════════════════════════════════╗ -- ║         ABD HUB  |  LOADER v1.0          ║ -- ║     github.com/YOURUSERNAME/abd-hub       ║ -- ╚══════════════════════════════════════════╝

if not game:IsLoaded() then game.Loaded:Wait() end

local BASE = 'https://raw.githubusercontent.com/pawinsound1158-stack/Anime-ball-duel/main/'

-- ── SPLASH ────────────────────────────────────────────────── local function ShowSplash() local pg = game:GetService("Players").LocalPlayer local sg = Instance.new("ScreenGui") sg.Name = "ABD_Splash" sg.ResetOnSpawn = false sg.ZIndexBehavior = Enum.ZIndexBehavior.Sibling sg.Parent = game:GetService("CoreGui")

 
-- dark overlay
local overlay = Instance.new("Frame")
overlay.Size = UDim2.new(1,0,1,0)
overlay.BackgroundColor3 = Color3.fromRGB(0,0,0)
overlay.BackgroundTransparency = 0.3
overlay.BorderSizePixel = 0
overlay.Parent = sg

-- card
local card = Instance.new("Frame")
card.Size = UDim2.new(0,320,0,180)
card.Position = UDim2.new(0.5,-160,0.5,-90)
card.BackgroundColor3 = Color3.fromRGB(10,10,18)
card.BorderSizePixel = 0
card.Parent = sg
Instance.new("UICorner",card).CornerRadius = UDim.new(0,14)

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(200,40,40)
stroke.Thickness = 2
stroke.Parent = card

-- top bar
local bar = Instance.new("Frame")
bar.Size = UDim2.new(1,0,0,5)
bar.BackgroundColor3 = Color3.fromRGB(200,40,40)
bar.BorderSizePixel = 0
bar.Parent = card
Instance.new("UICorner",bar).CornerRadius = UDim.new(0,14)

-- logo text
local logo = Instance.new("TextLabel")
logo.Size = UDim2.new(1,0,0,60)
logo.Position = UDim2.new(0,0,0,14)
logo.BackgroundTransparency = 1
logo.Text = "⚡ ABD HUB"
logo.TextColor3 = Color3.fromRGB(255,255,255)
logo.TextSize = 32
logo.Font = Enum.Font.GothamBlack
logo.Parent = card

-- sub
local sub = Instance.new("TextLabel")
sub.Size = UDim2.new(1,0,0,22)
sub.Position = UDim2.new(0,0,0,72)
sub.BackgroundTransparency = 1
sub.Text = "Anime Ball Duels  |  v1.0"
sub.TextColor3 = Color3.fromRGB(200,40,40)
sub.TextSize = 14
sub.Font = Enum.Font.GothamBold
sub.Parent = card

-- loading bar bg
local barBg = Instance.new("Frame")
barBg.Size = UDim2.new(0,260,0,6)
barBg.Position = UDim2.new(0.5,-130,0,108)
barBg.BackgroundColor3 = Color3.fromRGB(30,30,45)
barBg.BorderSizePixel = 0
barBg.Parent = card
Instance.new("UICorner",barBg).CornerRadius = UDim.new(1,0)

local barFill = Instance.new("Frame")
barFill.Size = UDim2.new(0,0,1,0)
barFill.BackgroundColor3 = Color3.fromRGB(200,40,40)
barFill.BorderSizePixel = 0
barFill.Parent = barBg
Instance.new("UICorner",barFill).CornerRadius = UDim.new(1,0)

-- status
local status = Instance.new("TextLabel")
status.Size = UDim2.new(1,0,0,20)
status.Position = UDim2.new(0,0,0,122)
status.BackgroundTransparency = 1
status.Text = "Loading..."
status.TextColor3 = Color3.fromRGB(160,160,160)
status.TextSize = 12
status.Font = Enum.Font.Gotham
status.Parent = card

-- credit
local cred = Instance.new("TextLabel")
cred.Size = UDim2.new(1,0,0,18)
cred.Position = UDim2.new(0,0,1,-22)
cred.BackgroundTransparency = 1
cred.Text = "github.com/YOURUSERNAME/abd-hub"
cred.TextColor3 = Color3.fromRGB(60,60,80)
cred.TextSize = 10
cred.Font = Enum.Font.Gotham
cred.Parent = card

-- animate bar
local ts = game:GetService("TweenService")
ts:Create(barFill, TweenInfo.new(1.4, Enum.EasingStyle.Quad), {
    Size = UDim2.new(1,0,1,0)
}):Play()

task.spawn(function()
    local msgs = {"Initializing...","Loading modules...","Injecting GUI...","Done!"}
    for _,m in ipairs(msgs) do
        task.wait(0.35)
        status.Text = m
    end
    task.wait(0.4)
    ts:Create(card, TweenInfo.new(0.4), {BackgroundTransparency=1}):Play()
    ts:Create(overlay, TweenInfo.new(0.4), {BackgroundTransparency=1}):Play()
    task.wait(0.45)
    sg:Destroy()
end)
 

end

-- ── EXECUTOR BLOCK (optional) ─────────────────────────────── local blocked = false pcall(function() local name = tostring(identifyexecutor()):lower() for _, n in ipairs({"solara","xeno"}) do if name:find(n,1,true) then blocked=true end end end) if blocked then return end

-- ── GAME TABLE ────────────────────────────────────────────── local games = { -- PlaceId [124470516975332] = 'abd_main.lua',   -- Anime Ball Duels }

-- ── LOAD ──────────────────────────────────────────────────── ShowSplash()

local file = games[game.PlaceId] if file then task.wait(1.5) local ok, err = pcall(function() loadstring(game:HttpGet(BASE .. file))() end) if not ok then warn("[ABD Hub] Failed to load: " .. tostring(err)) end else warn("[ABD Hub] Game not supported: " .. tostring(game.PlaceId)) end
