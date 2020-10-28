local players = game:GetService("Players");

players.PlayerAdded:Connect(function(plr)
    plr.CharacterAdded:Connect(function(character)
        local values = {
            { name = "running"; parent = character; type = "BoolValue"; value = false; };

            { name = "sliding"; parent = character; type = "BoolValue"; value = false; };
        };

        for _, v in pairs(values) do
            local val = Instance.new(v.type);
            val.Name = v.name;
            val.Parent = v.parent;
            val.Value = v.value;
        end
        
    end)
end)