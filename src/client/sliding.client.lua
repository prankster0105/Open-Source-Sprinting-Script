local players = game:GetService("Players");
local client = players.LocalPlayer;

local character = client.Character or client.CharacterAdded:Wait();
local humanoid = character:WaitForChild("Humanoid");

local run, uis = game:GetService("RunService"), game:GetService("UserInputService");
local ts = game:GetService("TweenService"); --might not need this? who knows?

local sliding = character:WaitForChild("sliding");
local running = character:WaitForChild("running");

-- don't know if i should make the sliding animation procedural or just through moon

local slidAnim;

--

local function stop()
    -- we will use this soon
end

local function start(inp, gpe)
    -- we will use this soon as well
end

run.RenderStepped:Connect(function()
    uis.InputBegan:Connect(start);

    uis.InputEnded:Connect(function(inp, gpe)
        -- we will also use this soon
    end)
end)