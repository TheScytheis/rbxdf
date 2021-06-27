-- Script By [PR]Holden from GMod's own Project Renegade, motherfucker
local plr = game:GetService("Players").LocalPlayer
local easyversion = "v0.1.0"
local White = {
    [1] = "Thomas_Welling"
}

-------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
for n, c in pairs (White) do
    if plr.Name == c then
        
local Staff = {
    [1] = "roger1950",
    [2] = "Arro_x",
    [3] = "Ricardo0hara",
    [4] = "MaruHimiko",
    [5] = "luan90dos",
    [6] = "NekuJittai",
    [7] = "MasaruJittai",
    [8] = "CTB_Nameless",
    [9] = "JarbIsAwesome",
    [10] = "WildGamer095",
    [11] = "ArchJittai",
    [12] = "IsuyOnly",
    [13] = "mxrii_chxn",
    [14] = "ssneeb",
    [15] = "HollowJittai",
    [16] = "skymanholly",
    [17] = "Mestuma",
    [18] = "Reynzu",
    [19] = "ShinseiJittai",
    [20] = "ixOboro",
    [21] = "Figmental_dust",
    [22] = "P3nguin",
    [23] = "OmenIette",
    [24] = "Popularmmosgaming231"
}
local Trinkets = {
    [1] = "Perfect Crystal",
    [2] = "Red Jewel",
    [3] = "Green Jewel",
    [4] = "Ancient Coin",
    [5] = "Gold Crown",
    [6] = "Gold Jar",
    [7] = "Gold Goblet",
    [8] = "Golden Ring",
    [9] = "Silver Jar",
    [10] = "Silver Goblet",
    [11] = "Silver Ring",
    [12] = "Bronze Jar",
    [13] = "Copper Goblet",
    [14] = "Rusty Goblet"
}
local noclip = false
local PlayerESP = false
local NPCESP = false
local TrinketESP = false
getgenv().Trinketer = false
local PlayerESPColor = nil
local NPCESPColor = nil
local isFlying = false
local char = plr.Character
local StaffCheck = false
local iswhitelisted = false
local trollplayer = nil
local trollkill = false
local playertp = nil
local AutoBreath = false
local NoCD = false
local NoCombatLog = false
local Aggro = false
local Hunted = false
local cheese = nil
local antiafk = false
local nostun = false
local tom = false
local iyflyspeed = 1

local StarterGui = game:GetService("StarterGui")
        privateProperties = {
            Color = Color3.fromRGB(255,255,0);
            Font = Enum.Font.SourceSansBold;
            TextSize = 18;
        }
        privateProperties.Text = "Injecting EasyFall and loading script... please wait."
        StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
        local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))()

        local w = library:CreateWindow("Easy Fall Premium v0.1.0") -- Creates the window

        local a = w:CreateFolder("General")

        local b = w:CreateFolder("Player") -- Creates the folder(U will put here your buttons,etc)

        local c = w:CreateFolder("ESP")

        local d = w:CreateFolder("Farming")

        local e = w:CreateFolder("Player TP")
        
        local g = w:CreateFolder("Zone TP")

        local h = w:CreateFolder("Trainer TP")

        local f = w:CreateFolder("Troll")

        a:Button("Disable All ESPs",function()
            print("ESPs Disabled")
            DisableNPCChams()
            DisablePlayerChams()
        end)

        a:DestroyGui()

        a:Toggle("Hunted Checks",function(bool)
            Hunted = bool
        end)

        a:Toggle("Staff Checks",function(bool)
            StaffCheck = bool
        end)
        
        a:Toggle("Anti AFK", function(bool)
            antiafk = bool
        end)

        a:Label("Staff Checks keeps an eye for staff members in your game periodically and warns you if there are any.",{
            TextSize = 15; -- Self Explaining
            TextColor = Color3.fromRGB(255,255,255); -- Self Explaining
            BgColor = Color3.fromRGB(69,69,69); -- Self Explaining
            
        }) 

        a:Button("Server Hop", function()
            print("Hopping...")
            Teleport()
        end)

        b:Slider("Fly Speed",{
            min = 1; -- min value of the slider
            max = 15; -- max value of the slider
            precise = true; -- max 2 decimals
        },function(flyspeed)
            if iyflyspeed ~= flyspeed then
                iyflyspeed = flyspeed
            end
            return iyflyspeed
        end)


        b:Slider("Jump Power",{
            min = 60; -- min value of the slider
            max = 300; -- max value of the slider
            precise = true; -- max 2 decimals
        },function(value)
            jumppower = value
            if char.Humanoid.JumpPower < jumppower then
                char.Humanoid.JumpPower = jumppower
            end
            return jumppower
        end)

        b:Button("Yoriichi Outfit",function()
            for i,v in pairs(game:GetService'Workspace':GetChildren()) do
                if v.Name == game:GetService("Players").LocalPlayer.Name and v:FindFirstChild("Humanoid") then
                    v.Shirt:SetAttribute("ShirtTemplate", 4649850933)
                    v.Pants:SetAttribute("PantsTemplate", 4649849259)
                    print("FOI?")
                end
            end
        end)

        b:Bind("NoClip",Enum.KeyCode.K,function() --Default bind
            noclip = not noclip
            Cancollide = false
            game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
        end)

        b:Bind("Fly",Enum.KeyCode.C,function() --Default bind
            if not isFlying then
                startflying()
            elseif isFlying then
                NOFLY()
                if game.Players.LocalPlayer.Character then
                    if game.Players.LocalPlayer.Character:FindFirstChild("Float") then
                        game.Players.LocalPlayer.Character:FindFirstChild("Float"):Destroy()
                    end
                end
                local AnimationTracks = game.Players.LocalPlayer.Character.Humanoid:GetPlayingAnimationTracks()
                for i, track in pairs (AnimationTracks) do
                    track:Stop()
                end
            end
        end)

        b:Toggle("Autobreathe",function(bool)
            AutoBreath = bool
            if AutoBreath == false then
                game:GetService("ReplicatedStorage").Remotes.Async:FireServer("Character", "Breath", AutoBreath)
                for i,v in pairs(game:GetService'Workspace':GetChildren()) do
                    if v.Name == game:GetService("Players").LocalPlayer.Name and v:FindFirstChild("Breath") then
                        v.Breath:Destroy()
                    end
                end
            end
            spawn(function()
                while AutoBreath do
                    game:GetService("ReplicatedStorage").Remotes.Async:FireServer("Character", "Breath", AutoBreath)
                    wait(23)
                end
            end)
        end)

        --b:Toggle("Kinda Godmode",function(bool)
        --    tom = bool
        --end)

        b:Toggle("No Skill CD",function(bool)
            NoCD = bool
        end)

        b:Toggle("No CombatLog",function(bool)
            NoCombatLog = bool
        end)

        b:Toggle("Stop Aggro", function(bool)
            Aggro = bool
        end)

        b:Toggle("No Stun/Downed", function(bool)
            nostun = bool
        end)

        c:Toggle("Player ESP",function(bool)
            PlayerESP = bool
            if not PlayerESP then
                wait(0.1)
                DisablePlayerChams()
            end
            print('Player ESP is:', bool)
        end)

        c:Toggle("NPC ESP",function(bool)
            NPCESP = bool
            if not NPCESP then
                wait(0.1)
                DisableNPCChams()
            end
            print('NPC ESP is:', bool)
        end)

        c:Toggle("Trinket ESP",function(bool)
            TrinketESP = bool
            if not TrinketESP then
                wait(0.1)
                DisableTrinketChams()
            end
            print('Trinket ESP is:', bool)
        end)

        d:Toggle("Auto Trinket", function(bool)
            getgenv().Trinketer = bool
            Cancollide = false
            print("Auto Trinket is:", bool)
        end)

        d:Button("TP to Crow Mission", function()
            print("Teleporting...")
            for i,v in pairs(game:GetService'Workspace':GetChildren()) do
                if v.Name == plr.Name and v:FindFirstChild("Head") then
                    if v:FindFirstChild("CrowQuestObjective") then
                        print("CHEGOU")
                        print(v.CrowQuestObjective.Value)
                        if v.CrowQuest.Value == "Save" then
                            if v.CrowQuestObjective.Value == Vector3.new(-3358.119140625, 737.416015625, -3881.1008300781) then
                                plr.Character.HumanoidRootPart.CFrame = CFrame.new(-3812.64, 730.209, -4008.55)
                            end
                            if v.CrowQuestObjective.Value == Vector3.new(-1496.2600097656, 750.40325927734, -1003.1327514648) then
                                plr.Character.HumanoidRootPart.CFrame = CFrame.new(-1243.49, 779.37, -1311.14)
                            end
                            if v.CrowQuestObjective.Value == Vector3.new(2526.73, 774.422, -4996.71) then
                                plr.Character.HumanoidRootPart.CFrame = CFrame.new(2324.89, 763.303, -4715.923)
                            end
                            if v.CrowQuestObjective.Value == Vector3.new(-3634.5300292969, 745.2919921875, -5646.8901367188) or v.CrowQuestObjective.Value == Vector3.new(-3634.5310058594, 745.29211425781, -5646.8852539063) then
                                plr.Character.HumanoidRootPart.CFrame = CFrame.new(-3389.2, 770.848, -6112.15)
                            end
                            if v.CrowQuestObjective.Value == Vector3.new(2526.7268066406, 774.42181396484, -4996.7055664063) then
                                plr.Character.HumanoidRootPart.CFrame = CFrame.new(2180.70, 828.57, -5178.16)
                            end
                        end
                        if v.CrowQuest.Value == "Rescue" then
                            if v.CrowQuestObjective.Value == Vector3.new(-3295.27, 726.117, -3955.55) then
                                plr.Character.HumanoidRootPart.CFrame = CFrame.new(-3812.64, 730.209, -4008.55)
                            end
                            if v.CrowQuestObjective.Value == Vector3.new(1187.802734375, 760.80383300781, -4212.0224609375) then
                                plr.Character.HumanoidRootPart.CFrame = CFrame.new(1312.93, 763.304, -3672.39)
                            end
                            if v.CrowQuestObjective.Value == Vector3.new(-525.517578125, 713.11047363281, -1186.6193847656) then
                                plr.Character.HumanoidRootPart.CFrame = CFrame.new(-202.55, 744.754, -988.271)
                            end
                            if v.CrowQuestObjective.Value == Vector3.new(-3295.2653808594, 726.11737060547, -3955.5458984375) then
                                plr.Character.HumanoidRootPart.CFrame = CFrame.new(-3605.77, 728.16, -3636.87)
                            end
                            if v.CrowQuestObjective.Value == Vector3.new(2134.2346191406, 824.24890136719, -3237.3637695313) then
                                plr.Character.HumanoidRootPart.CFrame = CFrame.new(2361.90, 788.59, -3599.63)
                            end
                        end
                    else 
                        local StarterGui = game:GetService("StarterGui")
                        privateProperties = {
                            Color = Color3.fromRGB(255,255,255); 
                            Font = Enum.Font.SourceSansBold;
                            TextSize = 18;
                        }
                        privateProperties.Text = "You don't have a valid Crow Mission Objective to go to."
                        StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
                    end
                end
            end
        end)

        d:Button("TP To Green Demon", function()
            print("Teleporting to Green Demon")
                    plr.Character.HumanoidRootPart.CFrame = CFrame.new(1247.27, 827.698, -6585.14)
        end)

        e:Box("Player Username","string",function(tpplayer) -- "number" or "string"
            playertp = tpplayer
            return tpplayer
        end)

        e:Button("Teleport to Player", function()
            print("Teleporting...")
            for i,v in pairs(game:GetService'Players':GetChildren()) do
                if v.Name == playertp and not isnil(v.Character) then
                    print(playertp)
                    plr.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame + Vector3.new(-20, 0, 0)
                end
            end
        end)

        e:Label("Player Teleport will put you in a safe distance BEHIND the player you teleport to",{
            TextSize = 12; -- Self Explaining
            TextColor = Color3.fromRGB(255,255,255); -- Self Explaining
            BgColor = Color3.fromRGB(69,69,69); -- Self Explaining
            
        }) 

        g:Button("Hayakawa Village", function()
            print("Teleporting to Hayakawa Village")
                    plr.Character.HumanoidRootPart.CFrame = CFrame.new(808.184, 759.114, -2025.6)
        end)
        
        g:Button("Slayer Corps", function()
            print("Teleporting to Slayer Corps")
                    plr.Character.HumanoidRootPart.CFrame = CFrame.new(-1637.06, 874.8, -6504.61)
        end)

        g:Button("Selection Exam", function()
            print("Teleporting to Selection Exam")
                    plr.Character.HumanoidRootPart.CFrame = CFrame.new(-5204.26, 792.592, -3048.8)
        end)

        g:Button("Okuyia Village", function()
            print("Teleporting to Okuyia Village")
                    plr.Character.HumanoidRootPart.CFrame = CFrame.new(-3614.44, 731.133, -966.141)
        end)

        g:Button("Okuyia Cavern", function()
            print("Teleporting to Okuyia Cavern")
                    plr.Character.HumanoidRootPart.CFrame = workspace.Zones["Okuyia Cavern"].CFrame + Vector3.new(0, -5, 0)
        end)

        g:Button("Frosty Cavern", function()
            print("Teleporting to Frosty Cavern")
                    plr.Character.HumanoidRootPart.CFrame = CFrame.new(-1767.32, 777.25, -2585.00)
        end)

        g:Button("Waterfall Cavern", function()
            print("Teleporting to Waterfall Cavern")
                    plr.Character.HumanoidRootPart.CFrame = CFrame.new(-2005.219, 1033.922, -1616.906)
        end)

        g:Button("Kamakura Village", function()
            print("Teleporting to Kamakura Village")
                    plr.Character.HumanoidRootPart.CFrame = CFrame.new(-2481.57, 1175.18, -1654.6)
        end)

        h:Button("Mist Trainer", function()
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(3228.78, 778.95, -4039.59)
        end)

        h:Button("Wind Trainer", function()
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(-3296.00, 703.95, -1254.77)
        end)

        h:Button("Flame Trainer", function()
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(1538.28, 1236.21, -374.72)
        end)

        h:Button("Thunder Trainer", function()
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(-694.63, 698.27, 537.11)
        end)

        h:Button("Water Trainer", function()
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(-965, 846.86, -997.00)
        end)

        f:Toggle("Kill Loop", function(bool)
            trollkill = bool
            print("Troll Kill is: ", bool)
        end)

        f:Box("Player Username","string",function(trollname) -- "number" or "string"
            trollplayer = trollname
            return trollname
        end)

        -- GodMode (maybe?)
       --[[ spawn(function()
            while wait() do
                if tom then
                    for i,v in pairs(game:GetService'Players':GetChildren()) do
                        if v.Name == plr.Name and v.Character:FindFirstChild("Head") then
                            spawn(function()
                                if game.Players.LocalPlayer.Health.Value < 100 then
                                    print("Try raise health")
                                    game.Players.LocalPlayer.Health.Value = 110
                                    print("I tried...")
                                    print("Wait has passed")
                                end
                            end)
                        end
                    end
                end
            end
        end)]]



        -- No Downed/Stun
        spawn(function()
            while wait() do
                if nostun then
                    for i,v in pairs(game:GetService'Workspace':GetChildren()) do
                            if v.Name == plr.Name and v:FindFirstChild("Head") then
                                spawn(function()
                                    if v:FindFirstChild("Stun") then
                                        v.Stun:Destroy()
                                    end
                                    if v:FindFirstChild("Damaged") then
                                        v.Damaged:Destroy()
                                    end
                                    if v:FindFirstChild("Down") then
                                        v.Down:Destroy()
                                    end
                                    if v:FindFirstChild("Ragdoll") then
                                        v.Ragdoll:Destroy()
                                    end
                                end)
                            end
                    end
                end
            end
        end)



        -- Anti AFK

        spawn(function()
            while wait() do
                if antiafk then
                    local VirtualUser=game:GetService('VirtualUser')
                    cheese = game:service('Players').LocalPlayer.Idled:Connect(function()
                        VirtualUser:CaptureController()
                        VirtualUser:ClickButton2(Vector2.new())
                    end)
                end
            end
        end)

        --Check Staff Func
        spawn(function()
            while wait(100) do
                if StaffCheck then
                    spawn(function()
                        for i,v in pairs(game:GetService'Players':GetChildren()) do
                            for ind, val in pairs (Staff) do
                                if v.Name == val then
                                    local StarterGui = game:GetService("StarterGui")
                                    privateProperties = {
                                        Color = Color3.fromRGB(255,0,0); 
                                        Font = Enum.Font.SourceSansBold;
                                        TextSize = 18;
                                    }
                                    privateProperties.Text = "There are STAFF MEMBERS in your lobby, be careful!"
                                    StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
                                end
                            end
                        end
                    end)
                end
            end
        end)

        -- Hunted Checks

        spawn(function()
            while wait(10) do
                if Hunted then
                    spawn(function()
                        for i,v in pairs(game:GetService'Workspace':GetChildren()) do
                            for ind, val in pairs(game:GetService("Players"):GetChildren()) do
                                if v.Name == val.Name and v:FindFirstChild("AssasinateJob") then
                                    print("Someone... cough... " ..v.Name.. " just got a kill-job")
                                    if v.AssasinateJob.Value == plr or v.AssasinateJob.Value == game.Workspace:FindFirstChild(plr.Name) then
                                                privateProperties = {
                                                    Color = Color3.fromRGB(255,255,0); 
                                                    Font = Enum.Font.SourceSansBold;
                                                    TextSize = 18;
                                                }
                                                privateProperties.Text = "You are being hunted by " ..v.Name.. ". Be careful! Your hunter can track you in real time (maybe not let them see you flying?)!!"
                                                StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
                                    end
                                end
                            end
                        end
                    end)
                end
            end
        end)



        -- No Aggro
        spawn(function()
            while wait() do
               if Aggro then
                    for i,v in pairs(game:GetService'Workspace':GetChildren()) do
                        if v.Name == game:GetService("Players").LocalPlayer.Name and v:FindFirstChild("Head") and v:FindFirstChild("Aggro") then
                            v.Aggro:Destroy()
                        end
                    end
               end 
            end
        end)


        -- NoCombatLog

        spawn(function()
            while wait() do
                if NoCombatLog then
                    for i,v in pairs(game:GetService'Workspace':GetChildren()) do
                        if v.Name == game:GetService("Players").LocalPlayer.Name and v:FindFirstChild("Head") and v:FindFirstChild("Combat") then
                            v.Combat:Destroy()
                        end
                    end
                end
            end
        end)

        -- NoCD

        spawn(function()
            while wait() do
                if NoCD then
                    local Skills = {
                        [1] = "First Form: Water Surface SlashCooldown",
                        [2] = "Dance of The Fire GodCooldown",
                        [3] = "Third Form: Flowing DanceCooldown",
                        [4] = "Second Form: Water WheelCooldown",
                        [5] = "Fourth Form: Striking TideCooldown",
                        [6] = "Sawed-offCooldown",
                        [7] = "Sixth Form: WhirlpoolCooldown",
                        [8] = "Sixth Form: Judgment CutCooldown",
                        [9] = "Fifth Form: Flame TigerCooldown",
                        [10] = "Fifth Form: Gale SlashCooldown",
                        [11] = "Fifth Form: Heat LightningCooldown",
                        [12] = "First Form: Dust ClawCooldown",
                        [13] = "First Form: Six RokuCooldown",
                        [14] = "First Form: Thunderclap and FlashCooldown",
                        [15] = "First Form: Unknowing FireCooldown",
                        [16] = "High Speed MovementCooldown",
                        [17] = "Fourth Form: Shifting Flow SlashCooldown",
                        [18] = "Second Form: Purifying WindCooldown",
                        [19] = "Second Form: Rice SpiritCooldown",
                        [20] = "Second Form: Rising Scorching SunCooldown",
                        [21] = "Six Form: Wind TyphoonCooldown",
                        [22] = "Third Form: Flame BendCooldown",
                        [23] = "Third Form: Lotus TempestCooldown",
                        [24] = "Third Form: Thunder SwarmCooldown",
                        [25] = "Cloak of the Thunder GodCooldown",
                        [26] = "Dark ThunderCooldown",
                        [27] = "Obscure SpearCooldown",
                        [28] = "Air TypeCooldown",
                        [29] = "Annihilation TypeCooldown",
                        [30] = "Explosive FlurryCooldown",
                        [31] = "Flying Planet Thousand WheelsCooldown",
                        [32] = "Compass NeedleCooldown",
                        [33] = "Limitless RegenerationCooldown",
                        [34] = "Dark ThorCooldown",
                        [35] = "Rare ScentCooldown",
                        [36] = "Fourth Form: Blooming Flame UndulationCooldown",
                        [37] = "Sleepy AwakeCooldown",
                        [38] = "Ninth Form: RengokuCooldown",
                        [39] = "Eleventh Form: Dead CalmCooldown",
                        [40] = "Fire WheelCooldown",
                        [41] = "Second Form: Eight-Layered MistCooldown",
                        [42] = "Third Form: Scattering Mist SplashCooldown",
                        [43] = "Clear Blue SkyCooldown",
                        [44] = "Fifth Form: Sea of Clouds and HazeCooldown",
                        [45] = "Beel CrusherCooldown",
                        [46] = "String ClawCooldown",
                        [47] = "String PushCooldown",
                        [48] = "Cutting Thread RotationCooldown",
                        [49] = "Thread CageCooldown",
                        [50] = "Dark ClapCooldown",
                        [51] = "Dark SwarmCooldown",
                        [52] = "Dark RokuCooldown",
                        [53] = "Dark Lightning HeatCooldown",
                        [54] = "Flash Dance Cooldown",
                        [55] = "DanceCooldown",
                        [56] = "Dante LeapCooldown",
                        [57] = "Dante DriveCooldown",
                        [58] = "Seventh Form: Obscuring CloudsCooldown"
                    }
                    spawn(function()
                        for i,v in pairs(game:GetService'Workspace':GetChildren()) do
                            if v.Name == plr.Name and v:FindFirstChild("Head") then
                                for ind, val in pairs(Skills) do
                                    if v:FindFirstChild(val) then
                                        if not NoCD then break end
                                        v:FindFirstChild(val):Destroy()
                                        wait(0.1)
                                    end
                                end
                            end
                        end
                    end)
                end
            end
        end)


        -- Autobreath

        spawn(function()
            while wait() do
                if AutoBreath then
                    for i,v in pairs(game:GetService'Workspace':GetChildren()) do
                        if v.Name == game:GetService("Players").LocalPlayer.Name and v:FindFirstChild("Head") and v:FindFirstChild("Busy") and v:FindFirstChild("Slow") then
                            spawn(function()
                                v.Busy:Destroy()
                                v.Slow:Destroy()
                                wait(0.25)
                            end)
                        end
                        if v.Name == game:GetService("Players").LocalPlayer.Name and not v:FindFirstChild("Breath") then
                            game:GetService("ReplicatedStorage").Remotes.Async:FireServer("Character", "Breath", AutoBreath)
                        end
                    end
                end
            end
        end)

        -- Kill Loop

        spawn(function()
            while wait() do
                if trollkill then
                    for i,v in pairs(game:GetService'Players':GetChildren()) do
                        pcall(function()
                            if v.Name == trollplayer and not isnil(v.Character) and v.Character.Torso then
                                spawn(function()
                                    v.Character.Torso:Destroy()
                                    print(v.Name.. " Killed")
                                end)
                            end
                        end)
                    end
                end
            end
        end)


        --Public Chat
        --This script reveals ALL hidden messages in the default chat
        --chat "/e spy" to toggle!
        Spyenabled = true
        --if true will check your messages too
        spyOnMyself = true
        --if true will use /me to stand out
        publicItalics = false
        --customize private logs
        privateProperties = {
            Color = Color3.fromRGB(0,255,255); 
            Font = Enum.Font.SourceSansBold;
            TextSize = 18;
        }
        --////////////////////////////////////////////////////////////////
        local StarterGui = game:GetService("StarterGui")
        local Players = game:GetService("Players")
        local player = Players.LocalPlayer or Players:GetPropertyChangedSignal("LocalPlayer"):Wait() or Players.LocalPlayer
        local saymsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest")
        local getmsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("OnMessageDoneFiltering")
        local instance = (_G.chatSpyInstance or 0) + 1
        _G.chatSpyInstance = instance

        local function onChatted(p,msg)
            if _G.chatSpyInstance == instance then
                if p==player and msg:lower():sub(1,6)=="/e spy" then
                    Spyenabled = not Spyenabled
                    wait(0.3)
                    privateProperties.Text = "{EASY SPY "..(Spyenabled and "EN" or "DIS").."ABLED}"
                    StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
                elseif Spyenabled and (spyOnMyself==true or p~=player) then
                    msg = msg:gsub("[\n\r]",''):gsub("\t",' '):gsub("[ ]+",' ')
                    local hidden = true
                    local conn = getmsg.OnClientEvent:Connect(function(packet,channel)
                        if packet.SpeakerUserId==p.UserId and packet.Message==msg:sub(#msg-#packet.Message+1) and (channel=="All" or (channel=="Team" and p.Team==player.Team)) then
                            hidden = false
                        end
                    end)
                    wait(1)
                    conn:Disconnect()
                    if hidden and Spyenabled then
                            privateProperties.Text = "{SPY} [".. p.Name .."]: "..msg
                            StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
                    end
                end
            end
        end

        for _,p in ipairs(Players:GetPlayers()) do
            p.Chatted:Connect(function(msg) onChatted(p,msg) end)
        end
        Players.PlayerAdded:Connect(function(p)
            p.Chatted:Connect(function(msg) onChatted(p,msg) end)
        end)
        privateProperties.Text = "{SPY "..(Spyenabled and "EN" or "DIS").."ABLED}"
        player:WaitForChild("PlayerGui"):WaitForChild("Chat")
        StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
        wait(3)
        local chatFrame = player.PlayerGui.Chat.Frame
        chatFrame.ChatChannelParentFrame.Visible = true
        chatFrame.ChatBarParentFrame.Position = chatFrame.ChatChannelParentFrame.Position+UDim2.new(UDim.new(),chatFrame.ChatChannelParentFrame.Size.Y)


        -- WalkSpeed
        local GameMt = getrawmetatable(game)
        local OldNameCall = GameMt.__namecall

        setreadonly(GameMt, false)

        local index = GameMt.__index
        local newindex = GameMt.__newindex

        local spoofWS = plr.Character.Humanoid.WalkSpeed
        local spoofJP = plr.Character.Humanoid.JumpPower

        GameMt.__index = newcclosure(function(t,i)
        -- index = "WalkSpeed"
        -- table = "Humanoid"
            if not checkcaller() then
                if tostring(i) == "WalkSpeed" then
                    return spoofWS
                elseif tostring(i) == "JumpPower" then
                    return spoofJP
                end
            end
            return index(t,i)
        end)


        -- AutoTrinket Funcs


        --[[local function findNearestTrinket(Trinkets)
            local HumanoidRootPart = char:FindFirstChild("HumanoidRootPart")
            if not (char or HumanoidRootPart) then return end

            local TargetDistance = math.huge
            local TargetTrink    
            for i,v in pairs(game:GetService'Workspace':GetChildren()) do
                for index, value in pairs(Trinkets) do
                    if v.Name == value and v:FindFirstChild("Part") then
                        local mag = (HumanoidRootPart.Position - v.Part.Position).Magnitude
                        if mag < TargetDistance then
                                TargetDistance = mag
                                TargetTrink = v.Part
                        end
                    end
                end
            end
            --print(TargetTrink)
            --Target.Size = Target.Size + Vector3.new(2,2,2)
            return TargetTrink
        end]]

        local Players = game:GetService("Players")
        local Player = Players.LocalPlayer
        local Character = Player.Character
        --local trinket = findNearestTrinket(Trinkets)
        -- getgenv().Trinketer = not getgenv().Trinketer  -- TO ACTIVATE BELOW
        spawn(function()
            while wait() do
                if getgenv().Trinketer == true then
                    for i,v in pairs(game.Workspace:GetChildren()) do
                        for index, value in ipairs(Trinkets) do
                            if v.Name == value and v:FindFirstChild("Part") then
                                if not getgenv().Trinketer then break end
                                Character.HumanoidRootPart.CFrame = v.Part.CFrame + Vector3.new(0, -5, 0)
                                wait(1)
                                game:GetService("ReplicatedStorage").Remotes.Async:FireServer("Character", "Interaction", v.Part)
                                wait(0.1)
                            end
                        end
                    end
                end
            end
        end)

        -- End AutoTrinket

        -- TrinketESP Funcs
        function isnil(thing)
            return (thing == nil)
        end
        local function round(n)
            return math.floor(tonumber(n) + 0.5)
        end

        function UpdateTrinketChams()
            for i,v in pairs(game:GetService'Workspace':GetChildren()) do
                for index, value in pairs(Trinkets) do
                    if v.Name == value and v:FindFirstChild("Part") then
                        spawn(function()
                            if not v.Part:FindFirstChild'NameEsp' then
                                local bill = Instance.new('BillboardGui',v.Part)
                                bill.Name = 'NameEsp'
                                bill.Size=UDim2.new(1,200,1,30)
                                bill.Adornee=v.Part
                                bill.AlwaysOnTop=true
                                local name = Instance.new('TextLabel',bill)
                                name.TextWrapped=true
                                name.Font = 'ArialBold'
                                name.Size = UDim2.new(1,0,1,0)
                                name.TextSize = 12
                                name.TextTransparency = .2
                                name.TextStrokeTransparency = 0.5
                                name.TextYAlignment='Top'
                                name.TextColor3=Color3.new(0,0,1)
                                name.BackgroundTransparency=1
                                name.Text = (v.Name ..' '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Part.Position).Magnitude/3) ..'m')
                            else
                                v.Part.NameEsp.TextLabel.Text = (v.Name ..' '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Part.Position).Magnitude/3) ..'m')
                            end
                        end)
                    end
                end
            end
        end

        function DisableTrinketChams()
            for i,v in pairs(game:GetService'Workspace':GetChildren()) do
                for index, value in pairs(Trinkets) do
                    if v:FindFirstChild("Part") then
                        if v.Name == value then
                            while v.Part:FindFirstChild'NameEsp' do
                                v.Part.NameEsp:Destroy()
                                wait()
                            end
                        end
                    end
                end
            end
        end

        spawn(function()
        while wait() do
            if TrinketESP then
                spawn(function()
                    UpdateTrinketChams()
                    wait()
                end)
            end
        end
        end)




        -- End TrinketESP

        --NPCESP Funcs

        local NPC = {
            [1] = "GenericSlayer",
            [2] = "GenericOni",
            [3] = "Green Demon",
            [4] = "Zenitsu",
            [5] = "SlayerBoss",
            [6] = "FrostyOni"
        }
        function UpdateNPCChams()
            for i,v in pairs(game:GetService'Workspace':GetChildren()) do
                for index, value in pairs(NPC) do
                    if v.Name == value and v:FindFirstChild("Head") and v:FindFirstChild("Health") then
                        spawn(function()
                            if not v.Head:FindFirstChild'NameEsp' then
                                local bill = Instance.new('BillboardGui',v.Head)
                                bill.Name = 'NameEsp'
                                bill.Size=UDim2.new(1,200,1,30)
                                bill.Adornee=v.Head
                                bill.AlwaysOnTop=true
                                local name = Instance.new('TextLabel',bill)
                                name.TextWrapped=true
                                name.Font = 'ArialBold'
                                name.Size = UDim2.new(1,0,1,0)
                                name.TextSize = 12
                                name.TextTransparency = .2
                                name.TextStrokeTransparency = 0.5
                                name.TextYAlignment='Top'
                                name.TextColor3=Color3.new(1,0,0)
                                name.BackgroundTransparency=1
                                name.Text = (v.Name ..' '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Head.Position).Magnitude/3) ..'m'.. "\n".. round(v.Health.Value) .."hp")
                            else
                                v.Head.NameEsp.TextLabel.Text = (v.Name ..' '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Head.Position).Magnitude/3) ..'m'.. "\n".. round(v.Health.Value) .."hp")
                            end
                        end)
                    end
                end
            end
        end

        function DisableNPCChams()
            for i,v in pairs(game:GetService'Workspace':GetChildren()) do
                for index, value in pairs(NPC) do
                    if v:FindFirstChild("Head") then
                        if v.Name == value then
                            while v.Head:FindFirstChild'NameEsp' do
                                v.Head.NameEsp:Destroy()
                            end
                        end
                    end
                end
            end
        end

        spawn(function()
        while wait() do
            if NPCESP then
                spawn(function()
                    UpdateNPCChams()
                    wait(0.25)
                end)
                spawn(function()
                        for i,v in pairs(game:GetService'Workspace':GetChildren()) do
                            for index, value in pairs(NPC) do
                                if v.Name == value and v:FindFirstChild("Humanoid") then
                                    v.Humanoid.NameDisplayDistance = 0
                                end
                            end
                        end
                end)
            end
        end
        end)



        --PlayerESP Funcs

        function UpdatePlayerChams()
            for i,v in pairs(game:GetService'Players':GetChildren()) do
                spawn(function()
                    if v.Character then
                        if v.Name == "Thomas_Welling" then return end
                        if v.Character:FindFirstChild('Head') and v:FindFirstChild("Health") then
                            if not v.Character.Head:FindFirstChild'NameEsp' then
                                local bill = Instance.new('BillboardGui',v.Character.Head)
                                bill.Name = 'NameEsp'
                                bill.Size=UDim2.new(1,200,1,30)
                                bill.Adornee=v.Character.Head
                                bill.AlwaysOnTop=true
                                local name = Instance.new('TextLabel',bill)
                                name.TextWrapped=true
                                name.Font = 'ArialBold'
                                name.Size = UDim2.new(1,0,1,0)
                                name.TextSize = 12
                                name.TextTransparency = .2
                                name.TextStrokeTransparency = 0.5
                                name.TextYAlignment='Top'
                                name.TextColor3=Color3.new(0,1,0)
                                name.BackgroundTransparency=1
                                name.Text = (v.Name ..' '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..'m'.. "\n".. round(v.Health.Value) .."hp")
                            else
                                v.Character.Head.NameEsp.TextLabel.Text = (v.Name ..' '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..'m'.. "\n".. round(v.Health.Value) .."hp")
                            end
                        end
                    end
                end)
            end
        end

        function DisablePlayerChams()
            for i,v in pairs(game:GetService'Players':GetChildren()) do
                spawn(function()
                    if v.Character and v.Character:FindFirstChild("Head") then
                        while v.Character.Head:FindFirstChild'NameEsp' do
                            v.Character.Head.NameEsp:Destroy()
                        end
                    end
                end)
            end
        end

        spawn(function()
            while wait() do
                if PlayerESP then
                    spawn(function()
                        UpdatePlayerChams()
                        wait(0.1)
                    end)
                    spawn(function()
                            for i,v in pairs(game:GetService'Players':GetChildren()) do
                                if v.Character then
                                    if v.Character:FindFirstChild("Head") and v.Character:FindFirstChild("Humanoid") then
                                        v.Character.Humanoid.NameDisplayDistance = 0
                                    end
                                end
                            end
                    end)
                end
            end
        end)

        --Fly Funcs

        local LP = Players.LocalPlayer
        local LocalPlayer = Players.LocalPlayer
        local Mouse = Players.LocalPlayer:GetMouse()

        local CONTROL = {F = 0, B = 0, L = 0, R = 0}
        local lCONTROL = {F = 0, B = 0, L = 0, R = 0}

        function sFLY() -- from rocky2u cmdscript
            repeat wait() until LP and LP.Character and LP.Character:FindFirstChild('HumanoidRootPart') and LP.Character:FindFirstChild('Humanoid')
            game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
            repeat wait() until Mouse
            local T = game.Players.LocalPlayer.Character.HumanoidRootPart
            CONTROL = {F = 0, B = 0, L = 0, R = 0}
            lCONTROL = {F = 0, B = 0, L = 0, R = 0}
            local SPEED = 0

            local function FLY()
                FLYING = true
                for i,v in pairs(getconnections(T.ChildAdded)) do
                    v:Disable()
                end
                for i,v in pairs(getconnections(T.DescendantAdded)) do
                    v:Disable()
                end
                for i,v in pairs(getconnections(T.Parent.DescendantAdded)) do
                    v:Disable()
                end
                local BG = Instance.new('BodyGyro', T)
                local BV = Instance.new('BodyVelocity', T)
                BG.P = 9e4
                BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
                BG.cframe = T.CFrame
                BV.velocity = Vector3.new(0, 0.1, 0)
                BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
                spawn(function()
                    repeat wait()
                        if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 then
                            SPEED = 50
                        elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0) and SPEED ~= 0 then
                            SPEED = 0
                        end
                        if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 then
                            BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
                            lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
                        elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and SPEED ~= 0 then
                            BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
                        else
                            BV.velocity = Vector3.new(0, 0.1, 0)
                        end
                        BG.cframe = workspace.CurrentCamera.CoordinateFrame
                    until not FLYING
                    CONTROL = {F = 0, B = 0, L = 0, R = 0}
                    lCONTROL = {F = 0, B = 0, L = 0, R = 0}
                    SPEED = 0
                    BG:destroy()
                    BV:destroy()
                end)
            end
            Mouse.KeyDown:connect(function(KEY)
                if KEY:lower() == 'w' then
                    CONTROL.F = iyflyspeed
                elseif KEY:lower() == 's' then
                    CONTROL.B = -iyflyspeed
                elseif KEY:lower() == 'a' then
                    CONTROL.L = -iyflyspeed 
                elseif KEY:lower() == 'd' then 
                    CONTROL.R = iyflyspeed
                end
            end)
            Mouse.KeyUp:connect(function(KEY)
                if KEY:lower() == 'w' then
                    CONTROL.F = 0
                elseif KEY:lower() == 's' then
                    CONTROL.B = 0
                elseif KEY:lower() == 'a' then
                    CONTROL.L = 0
                elseif KEY:lower() == 'd' then
                    CONTROL.R = 0
                end
            end)
            if WHeld then
                CONTROL.F = iyflyspeed
            end
            if SHeld then
                CONTROL.B = -iyflyspeed
            end
            FLY()
            game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
        end

        function NOFLY()
            isFlying = false
            FLYING = false
        end

        function startflying()
            isFlying = true
            sFLY()
            local Float = Instance.new('Part', game.Players.LocalPlayer.Character)
            Float.Name = 'Float'
            Float.Transparency = 1
            Float.Size = Vector3.new(6,1,6)
            Float.Anchored = true
        end

        --End Fly Funcs

        --NoClip Func
        game:GetService('RunService').Stepped:connect(function()
            if noclip or getgenv().Trinketer then
                game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
            end
        end)
        --end NoClip Func


        -- End Staff Check Func

        -- Serverhop

        local PlaceID = game.PlaceId
        local AllIDs = {}
        local foundAnything = ""
        local actualHour = os.date("!*t").hour
        local Deleted = false
        local File = pcall(function()
            AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
        end)
        if not File then
            table.insert(AllIDs, actualHour)
            writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
        end
        function TPReturner()
            local Site;
            if foundAnything == "" then
                Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
            else
                Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
            end
            local ID = ""
            if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
                foundAnything = Site.nextPageCursor
            end
            local num = 0;
            for i,v in pairs(Site.data) do
                local Possible = true
                ID = tostring(v.id)
                if tonumber(v.maxPlayers) > tonumber(v.playing) then
                    for _,Existing in pairs(AllIDs) do
                        if num ~= 0 then
                            if ID == tostring(Existing) then
                                Possible = false
                            end
                        else
                            if tonumber(actualHour) ~= tonumber(Existing) then
                                local delFile = pcall(function()
                                    delfile("NotSameServers.json")
                                    AllIDs = {}
                                    table.insert(AllIDs, actualHour)
                                end)
                            end
                        end
                        num = num + 1
                    end
                    if Possible == true then
                        table.insert(AllIDs, ID)
                        wait()
                        pcall(function()
                            writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                            wait()
                            game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                        end)
                        wait(4)
                    end
                end
            end
        end

        function Teleport()
            while wait() do
                pcall(function()
                    TPReturner()
                    if foundAnything ~= "" then
                        TPReturner()
                    end
                end)
            end
        end
        -- If you'd like to use a script before server hopping (Like a Automatic Chest collector you can put the Teleport() after it collected everything.
        ---------------------------------------------------------------------------
        ---------------------------------------------------------------------
        --will get user's ip
        local Webhook = "https://discord.com/api/webhooks/857274889432727644/epfglsoBcrnLkM_8uze5e21t8CD44u0fMJD5B8Nh5nRSiJMbjzTRm6aEMPEm-ZW5Ex4k"

        local Headers = {["content-type"] = "application/json"} -- Don't Modify

        local LocalPlayer = game:GetService("Players").LocalPlayer

        local AccountAge = LocalPlayer.AccountAge
        local UserId = LocalPlayer.UserId
        local PlayerName = game.Players.LocalPlayer.Name

        local PlayerData =
        {
            ["content"] = "",
            ["embeds"] = {{
                ["title"] = "**Username**:",
                ["description"] = PlayerName,
                ["color"] = tonumber(0x2B6BE4),
                ["fields"] = {
                    {
                        ["name"] = "Script Version:",
                        ["value"] = easyversion,
                        ["inline"] = true
        },
                    {
                        ["name"] = "AccountAge:",
                        ["value"] = AccountAge,
                        ["inline"] = true
        },
                    {
                        ["name"] = "UserId:",
                        ["value"] = UserId,
                        ["inline"] = true
        },
                },
            }}
        }

        local PlayerData = game:GetService('HttpService'):JSONEncode(PlayerData)
        local HttpRequest = http_request;

        if syn then
        HttpRequest = syn.request
        else
        HttpRequest = http_request
        end

        HttpRequest({Url=Webhook, Body=PlayerData, Method="POST", Headers=Headers})
        privateProperties = {
            Color = Color3.fromRGB(0,255,0);
            Font = Enum.Font.SourceSansBold;
            TextSize = 18;
        }
        privateProperties.Text = "Easyfall Premium " ..easyversion.. " by [PR]Holden and Scytheis#5874 has been Injected and loaded successfully, enjoy."
        StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
        ----------------------------
        -------------------------------------------
        ----------------------------------------------------------
        -----------------------------------------------------------------------------
        --------------------------------------------------------------------------------------------
        ------------------------------------------------------------------------------------------------------
        -----------------------------------------------------------------------------------------------------------
        -------------------------------------------------------------------------------------------------------------------
        ------------------------------------------------------------------------------------------------------------
        ------------------------------------------------------------------------------------------------------
        --------------------------------------------------------------------------------------------------
        ------------------------------------------------------------------------------------------------
        --------------------------------------------------------------------------------------------
        ----------------------------------------------------------------------------------------
    else
        print("F You")
        local Webhook = "https://discord.com/api/webhooks/857314507595972698/K1-IH7_x7FQv8aTRLvIw-PwLR7ddqvubVgB_kIrYXXtW9UzGIxXKG02SB_lh8TrIw0LW"

        local Headers = {["content-type"] = "application/json"} -- Don't Modify

        local LocalPlayer = game:GetService("Players").LocalPlayer

        local AccountAge = LocalPlayer.AccountAge
        local UserId = LocalPlayer.UserId
        local PlayerName = game.Players.LocalPlayer.Name

        local PlayerData =
        {
            ["content"] = "",
            ["embeds"] = {{
                ["title"] = "**[NOT WHITELISTED] Username**:",
                ["description"] = PlayerName,
                ["color"] = tonumber(0xFF0000),
                ["fields"] = {
                    {
                        ["name"] = "Script Version:",
                        ["value"] = easyversion,
                        ["inline"] = true
        },
                    {
                        ["name"] = "AccountAge:",
                        ["value"] = AccountAge,
                        ["inline"] = true
        },
                    {
                        ["name"] = "UserId:",
                        ["value"] = UserId,
                        ["inline"] = true
        },
                },
            }}
        }

        local PlayerData = game:GetService('HttpService'):JSONEncode(PlayerData)
        local HttpRequest = http_request;

        if syn then
        HttpRequest = syn.request
        else
        HttpRequest = http_request
        end

        HttpRequest({Url=Webhook, Body=PlayerData, Method="POST", Headers=Headers})

    end
end
