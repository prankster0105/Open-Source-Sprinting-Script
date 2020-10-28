local players = game:GetService("Players");
local client = players.LocalPlayer;

local character = client.Character or client.CharacterAdded:Wait();
local humanoid = character:WaitForChild("Humanoid");

local run, uis, ts = game:GetService("RunService"), game:GetService("UserInputService"), game:GetService("TweenService");

-- this is where animations go, but honestly, i haven't made them yet, so yeah

local sliding = character:WaitForChild("sliding");
local running = character:WaitForChild("running");

local runAnim;

--

-- this new edit is (probably) more optimised than the one we had last commit

--keep in mind i haven't tested any of these yet

humanoid.Running:Connect(function(speed)
    if speed > 0 then -- we are moving
        if not (uis:IsKeyDown(Enum.KeyCode.LeftShift)) then return; end;
        if not running.Value then running.Value = true; end;

        ts:Create(humanoid, TweenInfo.new(.8), { WalkSpeed = 23 });


        if runAnim.IsPlaying then return; end
        runAnim:Play(.3, .5, .3);

        coroutine.wrap(function()
            for t = .3, .5, 1 do
                runAnim:AdjustSpeed(t);
                wait(.29);
            end
        end)()

        runAnim.Looped = not runAnim.Looped and true;
    else
        -- do stuff like reverse the effects

        ts:Create(humanoid, TweenInfo.new(.57), { WalkSpeed = 16 });

        if runAnim.IsPlaying then runAnim:Stop(.6); end;
        running.Value = running.Value and false;
    end
end)


--old version (not very optimised)
--[[
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
end)]]