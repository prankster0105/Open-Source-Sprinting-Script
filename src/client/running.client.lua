local players = game:GetService("Players");
local client = players.LocalPlayer;

local character = client.Character or client.CharacterAdded:Wait();
local humanoid = character:WaitForChild("Humanoid");

local run, uis, ts = game:GetService("RunService"), game:GetService("UserInputService"), game:GetService("TweenService");



local sliding = character:WaitForChild("sliding");
local running = character:WaitForChild("running");

-- this is where animations go, but honestly, i haven't made them yet, so yeah

local runAnim;

--
local function stop()
    if not runAnim.IsPlaying then return; end;

    running.Value = false;

    if humanoid.MoveDirection.Magnitude <= 0 then
        
        runAnim:Stop(.24);
        ts:Create(humanoid, TweenInfo.new(.24), { WalkSpeed = 16 });
    elseif humanoid.MoveDirection.Magnitude > 0 then
        runAnim:Stop(.56);
        ts:Create(humanoid, TweenInfo.new(.56), { WalkSpeed = 16});
    end
end

local function start(inp, gpe)
    if gpe then return; end

    if runAnim.IsPlaying then return; end;
    if not (humanoid.MoveDirection.Magnitude > 0) then stop(); return; end;

    if (inp.KeyCode == Enum.KeyCode.LeftShift) then
        running.Value = true;
        runAnim:Play(.8, .5);
        ts:Create(humanoid, TweenInfo.new(.8), { WalkSpeed = 23 });
    end
end

run.RenderStepped:Connect(function(dt)
    uis.InputBegan:Connect(start)

    uis.InputEnded:Connect(function(inp, gpe)
        if gpe then return; end;

        if inp.KeyCode == Enum.KeyCode.LeftShift then
            stop();
        end
    end)
end)