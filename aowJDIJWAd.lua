-- This script should be placed in a LocalScript inside StarterPlayerScripts

-- Function to create a highlight effect
local function createHighlight(player)
    local highlight = Instance.new("Highlight")
    highlight.Parent = player.Character
    highlight.FillColor = Color3.new(1, 1, 1) -- White color
    highlight.OutlineColor = Color3.new(1, 1, 1) -- White color
    highlight.FillTransparency = 0.5 -- Semi-transparent fill
    highlight.OutlineTransparency = 0 -- Solid outline
end

-- Function to apply highlight to all players
local function highlightAllPlayers()
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player.Character then
            createHighlight(player)
        end
    end
end

-- Apply highlight to all players when the script runs
highlightAllPlayers()

-- Also apply highlight to new players as they join
game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        createHighlight(player)
    end)
end)

-- Reapply highlight to existing players if their character respawns
game.Players.PlayerRemoving:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        createHighlight(player)
    end)
end)
