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

local weight = 857 --your fat

uis.InputBegan:Connect(function(inp, gpe)
    -- wall of requirements
    if gpe then return; end;
    if not running.Value then return; end;
    if sliding then return; end; -- we wouldn't want the player to slide while sliding while sliding while sliding while sliding, would we?

    if inp.KeyCode == Enum.KeyCode.LeftControl then
        humanoid.AutoRotate = false;
        humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, false);

        sliding.Value = not sliding.Value and true;
        humanoid.WalkSpeed -= weight;
    end
end)