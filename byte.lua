-- ESP --

local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService('ReplicatedStorage')
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local Camera = Workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer
local STOPTHESTUPIDESP = false

-- ===== CONFIGURATION =====
local colourTable = {

    -- Original colours (unchanged)
    Green = Color3.fromRGB(0,255,0),
    Blue = Color3.fromRGB(0,0,255),
    Red = Color3.fromRGB(255,0,0),
    Yellow = Color3.fromRGB(255,255,0),
    Orange = Color3.fromRGB(255,165,0),
    Purple = Color3.fromRGB(128,0,128),
    Cobalt = Color3.fromRGB(0,71,171),

    -- Extended palette
    Black = Color3.fromRGB(0,0,0),
    JetBlack = Color3.fromRGB(18,18,18),
    Charcoal = Color3.fromRGB(36,36,36),
    DarkGray = Color3.fromRGB(64,64,64),
    DimGray = Color3.fromRGB(96,96,96),
    Gray = Color3.fromRGB(128,128,128),
    SlateGray = Color3.fromRGB(112,128,144),
    LightGray = Color3.fromRGB(192,192,192),
    Silver = Color3.fromRGB(211,211,211),
    CloudGray = Color3.fromRGB(224,224,224),
    WhiteSmoke = Color3.fromRGB(245,245,245),
    White = Color3.fromRGB(255,255,255),

    Snow = Color3.fromRGB(255,250,250),
    Ivory = Color3.fromRGB(255,255,240),
    Pearl = Color3.fromRGB(234,224,200),
    Cream = Color3.fromRGB(255,253,208),
    Beige = Color3.fromRGB(245,245,220),
    Bone = Color3.fromRGB(227,218,201),

    Scarlet = Color3.fromRGB(255,36,0),
    Crimson = Color3.fromRGB(220,20,60),
    Ruby = Color3.fromRGB(224,17,95),
    Cherry = Color3.fromRGB(222,49,99),
    BloodRed = Color3.fromRGB(138,3,3),
    DarkRed = Color3.fromRGB(139,0,0),
    Firebrick = Color3.fromRGB(178,34,34),
    RoseRed = Color3.fromRGB(194,30,86),

    Salmon = Color3.fromRGB(250,128,114),
    Coral = Color3.fromRGB(255,127,80),
    LightCoral = Color3.fromRGB(240,128,128),
    Tomato = Color3.fromRGB(255,99,71),
    Watermelon = Color3.fromRGB(242,71,63),

    BurntOrange = Color3.fromRGB(204,85,0),
    DarkOrange = Color3.fromRGB(255,140,0),
    Pumpkin = Color3.fromRGB(255,117,24),
    Amber = Color3.fromRGB(255,191,0),
    Tangerine = Color3.fromRGB(242,133,0),
    Apricot = Color3.fromRGB(251,206,177),
    Peach = Color3.fromRGB(255,203,164),

    Gold = Color3.fromRGB(255,215,0),
    Goldenrod = Color3.fromRGB(218,165,32),
    Mustard = Color3.fromRGB(255,219,88),
    Banana = Color3.fromRGB(255,225,53),
    Canary = Color3.fromRGB(255,239,0),
    Lemon = Color3.fromRGB(253,233,16),
    Sunflower = Color3.fromRGB(255,218,3),
    Dandelion = Color3.fromRGB(240,225,48),

    Olive = Color3.fromRGB(128,128,0),
    DarkOlive = Color3.fromRGB(85,107,47),
    ArmyGreen = Color3.fromRGB(75,83,32),
    MossGreen = Color3.fromRGB(138,154,91),
    FernGreen = Color3.fromRGB(79,121,66),
    Avocado = Color3.fromRGB(86,130,3),

    Lime = Color3.fromRGB(50,205,50),
    NeonGreen = Color3.fromRGB(57,255,20),
    BrightGreen = Color3.fromRGB(0,255,0),
    SpringGreen = Color3.fromRGB(0,255,127),
    Mint = Color3.fromRGB(152,255,152),
    Seafoam = Color3.fromRGB(159,226,191),
    Jade = Color3.fromRGB(0,168,107),
    Emerald = Color3.fromRGB(80,200,120),

    ForestGreen = Color3.fromRGB(34,139,34),
    DarkGreen = Color3.fromRGB(0,100,0),
    PineGreen = Color3.fromRGB(1,121,111),
    HunterGreen = Color3.fromRGB(53,94,59),

    Aqua = Color3.fromRGB(0,255,255),
    Cyan = Color3.fromRGB(0,255,255),
    Turquoise = Color3.fromRGB(64,224,208),
    Teal = Color3.fromRGB(0,128,128),
    RobinEggBlue = Color3.fromRGB(0,204,204),
    SeaBlue = Color3.fromRGB(0,105,148),

    SkyBlue = Color3.fromRGB(135,206,235),
    LightBlue = Color3.fromRGB(173,216,230),
    PowderBlue = Color3.fromRGB(176,224,230),
    BabyBlue = Color3.fromRGB(137,207,240),
    IceBlue = Color3.fromRGB(215,236,255),

    DodgerBlue = Color3.fromRGB(30,144,255),
    RoyalBlue = Color3.fromRGB(65,105,225),
    Azure = Color3.fromRGB(0,127,255),
    Sapphire = Color3.fromRGB(15,82,186),
    SteelBlue = Color3.fromRGB(70,130,180),

    Navy = Color3.fromRGB(0,0,128),
    MidnightBlue = Color3.fromRGB(25,25,112),
    DarkNavy = Color3.fromRGB(0,0,80),

    Periwinkle = Color3.fromRGB(204,204,255),
    Lavender = Color3.fromRGB(230,230,250),
    Lilac = Color3.fromRGB(200,162,200),

    Violet = Color3.fromRGB(238,130,238),
    DarkPurple = Color3.fromRGB(90,0,110),
    RoyalPurple = Color3.fromRGB(120,81,169),
    Amethyst = Color3.fromRGB(153,102,204),
    Orchid = Color3.fromRGB(218,112,214),
    Plum = Color3.fromRGB(221,160,221),
    Grape = Color3.fromRGB(111,45,168),

    Magenta = Color3.fromRGB(255,0,255),
    Fuchsia = Color3.fromRGB(255,119,255),
    Heliotrope = Color3.fromRGB(223,115,255),
    ElectricPurple = Color3.fromRGB(191,0,255),

    HotPink = Color3.fromRGB(255,105,180),
    DeepPink = Color3.fromRGB(255,20,147),
    LightPink = Color3.fromRGB(255,182,193),
    RosePink = Color3.fromRGB(255,102,204),
    Bubblegum = Color3.fromRGB(255,193,204),
    Flamingo = Color3.fromRGB(252,142,172),

    Brown = Color3.fromRGB(165,42,42),
    SaddleBrown = Color3.fromRGB(139,69,19),
    Chocolate = Color3.fromRGB(210,105,30),
    Coffee = Color3.fromRGB(111,78,55),
    Mocha = Color3.fromRGB(150,75,0),
    Caramel = Color3.fromRGB(175,111,9),
    Copper = Color3.fromRGB(184,115,51),
    Bronze = Color3.fromRGB(205,127,50),

    Sand = Color3.fromRGB(194,178,128),
    Tan = Color3.fromRGB(210,180,140),
    DesertSand = Color3.fromRGB(237,201,175),

    Smoke = Color3.fromRGB(115,130,118),
    Ash = Color3.fromRGB(178,190,181),
    Stone = Color3.fromRGB(152,142,134),
    Slate = Color3.fromRGB(112,128,144),
    Graphite = Color3.fromRGB(54,69,79),

    NeonRed = Color3.fromRGB(255,49,49),
    NeonOrange = Color3.fromRGB(255,95,31),
    NeonYellow = Color3.fromRGB(255,255,33),
    NeonLime = Color3.fromRGB(204,255,0),
    NeonCyan = Color3.fromRGB(0,255,255),
    NeonBlue = Color3.fromRGB(77,77,255),
    NeonPurple = Color3.fromRGB(199,21,133),
    NeonPink = Color3.fromRGB(255,16,240)
}

local colourChosen = colourTable.RoyalPurple

-- Services
local function getCharacter(player)
    return Workspace:FindFirstChild(player.Name)
end

-- Add highlights to players
local function addHighlightToCharacter(player, character)
    if player == LocalPlayer then return end
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid or humanoid.Health <= 0 then return end

    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if humanoidRootPart and not humanoidRootPart:FindFirstChild("Highlight") then
        local highlightClone = Instance.new("Highlight")
        highlightClone.Name = "Highlight"
        highlightClone.Adornee = character
        highlightClone.Parent = humanoidRootPart
        highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        highlightClone.FillColor = colourChosen
        highlightClone.OutlineColor = Color3.fromRGB(0, 0, 0)
        highlightClone.FillTransparency = 0.5
    end
end

-- Remove highlights from player
local function removeHighlightFromCharacter(character)
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if humanoidRootPart then
        local highlightInstance = humanoidRootPart:FindFirstChild("Highlight")
        if highlightInstance then
            highlightInstance:Destroy()
        end
    end
end

-- Highlight Loop
local function updateHighlights()
    for _, player in pairs(Players:GetPlayers()) do
        local character = getCharacter(player)
        if character then
            addHighlightToCharacter(player, character)
        end
    end
end
RunService.RenderStepped:Connect(updateHighlights)

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        addHighlightToCharacter(player, character)
    end)
end)

Players.PlayerRemoving:Connect(function(playerRemoved)
    local character = playerRemoved.Character
    if character then
        removeHighlightFromCharacter(character)
    end
end)

local function getCurrentWeapon(player)
    local viewModelsFolder = Workspace:FindFirstChild("ViewModels")
    if not viewModelsFolder then return "None" end

    for _, vm in ipairs(viewModelsFolder:GetChildren()) do
        
        -- Extract username and weapon
        local username, weapon = string.match(vm.Name, "^(.-) %-%s*(.-) %-%s*(.-)$")

        if username == player.Name then
            return weapon or "None"
        end
    end

    return "None"
end

local weapons = {
    ["None"] = "7812572184",
    ["Distortion"] = "115712150398379",
    ["Permafrost"] = "74353733133888",
    ["Energy Rifle"] = "110259279810005",
    ["Flamethrower"] = "89455038280473",
    ["Grenade Launcher"] = "17250453814",
    ["Minigun"] = "17250458611",
    ["Paintball Gun"] = "17160853798",
    ["Assault Rifle"] = "17160682738",
    ["Bow"] = "17160802080",
    ["Burst Rifle"] = "17160801983",
    ["Crossbow"] = "140211832612284",
    ["Gunblade"] = "131231034374465",
    ["RPG"] = "17160802243",
    ["Shotgun"] = "17160800007",
    ["Sniper"] = "17160799574",
    ["Warper"] = "88033795039891",
    ["Energy Pistols"] = "79471670126710",
    ["Exogun"] = "17344796376",
    ["Slingshot"] = "17160799888",
    ["Daggers"] = "91885384580845",
    ["Flare Gun"] = "17160801627",
    ["Handgun"] = "17160801282",
    ["Revolver"] = "17160800299",
    ["Shorty"] = "17160800091",
    ["Spray"] = "92882887485248", -- The Goat
    ["Uzi"] = "17160798908",
    ["Maul"] = "81478141693597",
    ["Trowel"] = "17160799172",
    ["Battle Axe"] = "93390542043222",
    ["Chainsaw"] = "17160801873",
    ["Fists"] = "17160801745",
    ["Katana"] = "17160801158",
    ["Knife"] = "17160800983", -- My beloved
    ["Riot Shield"] = "121172272442833",
    ["Scythe"] = "17160800186",
    ["Medkit"] = "17160800734",
    ["Subspace Tripmine"] = "17160799418",
    ["Warpstone"] = "94035693279005",
    ["Flashbang"] = "17160801529",
    ["Freeze Ray"] = "18429552328",
    ["Grenade"] = "17160801411",
    ["Jump Pad"] = "79459600453621",
    ["Molotov"] = "109264750627289",
    ["Satchel"] = "82237471151891",
    ["Smoke Grenade"] = "17160799767",
    ["War Horn"] = "104600246515190"
}

-- ===== NAMETAGS WITH CONSTANT UPDATES =====
local function createNametag(player, character)
    if player == LocalPlayer then return end

    -- Clean up old tag
    local head = character:FindFirstChild("Head")
    if head then
        local oldTag = head:FindFirstChild("NameTagGui")
        if oldTag then oldTag:Destroy() end
    end

    -- Wait for Head safely
    spawn(function()
        local tries = 0
        repeat
            head = character:FindFirstChild("Head")
            if head then break end
            tries += 1
            task.wait(0.1)
        until tries > 30 or not character or not character.Parent

        if not head or not character or not character.Parent then return end

        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if not humanoid or humanoid.Health <= 0 then return end

        -- Create GUI
        local gui = Instance.new("BillboardGui")
        gui.Name = "NameTagGui"
        gui.Adornee = player.Character.Head
        gui.Size = UDim2.new(0, 100, 0, 150) -- Wider for long weapon names
        gui.StudsOffset = Vector3.new(0, 1, 0)
        gui.AlwaysOnTop = true
        gui.LightInfluence = 0
        gui.ResetOnSpawn = false
        gui.Parent = head
        gui.AlwaysOnTop = true

        local image = Instance.new("ImageLabel")
        image.BackgroundTransparency = 1
        image.Size = UDim2.new(1, 0, 0.75, 0)
        image.Position = UDim2.new(0,0,-0.55,0)
        image.Image = "rbxassetid://75309286909772"
        image.Parent = gui

        local label = Instance.new("TextLabel")
        label.BackgroundTransparency = 1
        label.TextYAlignment = Enum.TextYAlignment.Bottom
        label.Size = UDim2.new(0, 100, 0, 100)
        label.ZIndex = 10
        label.Position = UDim2.new(0, 0, 0, -50)
        label.TextColor3 = colourChosen
        label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        label.TextStrokeTransparency = 0
        label.Font = Enum.Font.FredokaOne
        label.FontFace.Style = Enum.FontStyle.Normal
        label.FontFace.Weight = Enum.FontWeight.Heavy
        label.TextSize = 20
        label.Parent = gui

        -- CONNECTION-BASED UPDATE (No task.wait loop = Instant updates)
        local connection
        connection = RunService.RenderStepped:Connect(function()
            -- Safety checks every frame
            if not gui or not gui.Parent or not player.Character or not head or not head.Parent then
                if connection then connection:Disconnect() end
                return
            end

            local hum = player.Character:FindFirstChildOfClass("Humanoid")
            if not hum or hum.Health <= 0 then
                if connection then connection:Disconnect() end
                if gui then gui:Destroy() end
                return
            end

            -- Get Data
            local dist = math.floor((head.Position - Camera.CFrame.Position).Magnitude)
            local weaponName = getCurrentWeapon(player)

            if weapons[weaponName] then
                image.Image = "rbxassetid://" .. weapons[weaponName]
            else
                image.Image = "rbxassetid://10653378249"
            end
            
            -- Format: [Name] - [Weapon] - [Weapon]
            local displayString = player.Name .. " - " .. weaponName
            
            -- Update Text Instantly
            label.Text = string.format("%s | %d studs | %d HP", displayString, dist, math.floor(hum.Health))
        end)
        
        -- Cleanup connection if character dies prematurely
        character.AncestryChanged:Connect(function()
            if not character.Parent and connection then
                connection:Disconnect()
            end
        end)
    end)
end

-- Setup Player
local function setupPlayer(player)
    if STOPTHESTUPIDESP then return end
    player.CharacterAdded:Connect(function(char)
        task.defer(function()
            if char and char.Parent then
                createNametag(player, char)
            end
        end)
    end)
    if player.Character then
        createNametag(player, player.Character)
    end
end

-- Init
for _, player in ipairs(Players:GetPlayers()) do
    setupPlayer(player)
end
Players.PlayerAdded:Connect(setupPlayer)

UserInputService.InputBegan:Connect(function(input,gpe)
    if gpe or STOPTHESTUPIDESP then return end
    if input.KeyCode == Enum.KeyCode.K then
        STOPTHESTUPIDESP = true
        return
    end
end)

Players.PlayerRemoving:Connect(function(player)
    if player.Character then
        local head = player.Character:FindFirstChild("Head")
        if head then
            local tag = head:FindFirstChild("NameTagGui")
            if tag then tag:Destroy() end
        end
    end
end)






-- RIVALS Aimbot (Xeno Executor) --


-- Keybind: Hold 'Q' to activate
-- Game Lock: Only works in Rivals (ID: 17625359962)
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")

local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

print("[BYT3 Hub] Loaded successfully.")

pcall(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "BYT3 Hub Loaded",
        Text = "Z to toggle AutoShoot | Hold Q to Lock",
        Duration = 3
    })
end)

-- State
local aimbotActive = false
local CanShoot = true

-- Track 'Q' Key
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.Q then
        aimbotActive = true
    end
    if input.KeyCode == Enum.KeyCode.Z then
        CanShoot = not CanShoot
        spawn(function()
            pcall(function()
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = "Aimbot",
                    Text = CanShoot and "Shoot: ON" or "Shoot: OFF",
                    Duration = 0.25
                })
            end)
        end)
    end
end)

UserInputService.InputEnded:Connect(function(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.Q then
        aimbotActive = false
    end
end)

-- Line of Sight Check
local function hasLineOfSight(targetPos, targetChar)
    if not targetChar or not targetChar:IsDescendantOf(Workspace) then return false end

    local origin = Camera.CFrame.Position
    local direction = targetPos - origin
    local params = RaycastParams.new()
    params.FilterType = Enum.RaycastFilterType.Blacklist
    params.FilterDescendantsInstances = {LocalPlayer.Character, Camera}
    params.IgnoreWater = true

    local result = Workspace:Raycast(origin, direction, params)
    
    if not result then return true end

    local hit = result.Instance
    if hit and hit:IsA("BasePart") then
        return hit:IsDescendantOf(targetChar)
    end
    
    return false
end

-- Get Closest Valid Enemy
local function getClosest()
    local closestHeadPos = nil
    local shortestDist = math.huge
    local fov = 50

    for _, player in ipairs(Players:GetPlayers()) do
        if player == LocalPlayer or not player.Character then continue end

        local hum = player.Character:FindFirstChildOfClass("Humanoid")
        if not hum or hum.Health <= 0 then continue end

        local head = player.Character:FindFirstChild("Head")
        local hrp = player.Character:FindFirstChild("HumanoidRootPart")
        if not head or not hrp then continue end

        local screenPos, onScreen = Camera:WorldToViewportPoint(head.Position)
        if not onScreen then continue end

        local mousePos = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
        local dist = (Vector2.new(screenPos.X, screenPos.Y) - mousePos).Magnitude
        
        if dist > fov then continue end

        if dist < shortestDist then
            local losPos = hrp.Position + Vector3.new(0, 1.5, 0)
            if hasLineOfSight(losPos, player.Character) then
                closestHeadPos = head
                shortestDist = dist
            end
        end
    end

    return closestHeadPos
end

-- Aimbot Loop
RunService.RenderStepped:Connect(function()
    if not aimbotActive then return end

    local target = getClosest()
    if target then
        Camera.CFrame = CFrame.lookAt(Camera.CFrame.Position, target.Position + Vector3.new(target.Parent:FindFirstChild("HumanoidRootPart").AssemblyLinearVelocity.X*0.01,target.Parent:FindFirstChild("HumanoidRootPart").AssemblyLinearVelocity.Y*0.015+0.25,target.Parent:FindFirstChild("HumanoidRootPart").AssemblyLinearVelocity.Z*0.01))
        if CanShoot then
            mouse1click()
        end
    end
end)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local ViewModels = game:GetService("Workspace"):WaitForChild("ViewModels"):WaitForChild("FirstPerson")

local function goofy(player, big)
    if player == Players.LocalPlayer then return end

    local character = player.Character
    if not character then return end

    local HitboxHead = character:FindFirstChild("HitboxHead")
    local HitboxHeadSmall = character:FindFirstChild("HitboxHeadSmall")
    local HitboxBody = character:FindFirstChild("HitboxBody")
    local HitboxBodySmall = character:FindFirstChild("HitboxBodySmall")

    if big then
        if HitboxHead then HitboxHead.Size = Vector3.new(2000,2000,2000) end
        if HitboxHeadSmall then HitboxHeadSmall.Size = Vector3.new(2000,2000,2000) end
        if HitboxBody then HitboxBody.Size = Vector3.new(0.1,0.1,0.1) end
        if HitboxBodySmall then HitboxBodySmall.Size = Vector3.new(0.1,0.1,0.1) end
    else
        if HitboxBody then HitboxBody.Size = Vector3.new(3.5,4,2.5) end
        if HitboxBodySmall then HitboxBodySmall.Size = Vector3.new(2.75,4,1.75) end
        if HitboxHead then HitboxHead.Size = Vector3.new(2,2,2) end
        if HitboxHeadSmall then HitboxHeadSmall.Size = Vector3.new(2,2,2) end
    end
end

local function holdingBow()
    for _, vm in pairs(ViewModels:GetChildren()) do
        if vm.Name:lower():find("bow") and not vm.Name:lower():find("cross") or vm.Name:lower():find("daggers") then
            return true
        end
    end
    return false
end

RunService.RenderStepped:Connect(function()
    local big = holdingBow()

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            goofy(player, big)
        end
    end
end)

loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()

--[[while task.wait(1) do
    ReplicatedStorage.Remotes.Replication.Fighter.SetControls:FireServer("Touch")
end--]]
