local lplr = game.Players.LocalPlayer
local char = lplr.Character
local humrp = char.HumanoidRootPart
local teleporter = workspace.Lobby.Teleport2
firetouchinterest(humrp,teleporter,1)
firetouchinterest(humrp,teleporter,0)
task.wait(2)
for _,v in pairs(workspace.Arena:GetDescendants()) do
    if string.find(v.Name, "Slapple" or "GoldenSlapple") and v:FindFirstChild("Glove") and v.Glove:FindFirstChildOfClass("TouchTransmitter") then
        firetouchinterest(char.Head, v.Glove, 1)
        firetouchinterest(char.Head, v.Glove, 0)
        wait(0.05)
    end
end
-- thanks to medoogy for fixing!
local servers = {}
local TeleportService = game:GetService('TeleportService')
local req = http_request({Url = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true", game.PlaceId)})
local body = game:GetService('HttpService'):JSONDecode(req.Body)

if body and body.data then
    for i, v in next, body.data do
        if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing < v.maxPlayers and v.id ~= game.JobId then
            table.insert(servers, 1, v.id)
        end
    end
end

if #servers > 0 then
    TeleportService:TeleportToPlaceInstance(game.PlaceId, servers[math.random(1, #servers)], game.Players.LocalPlayer)
else
    print('nigga')
end
