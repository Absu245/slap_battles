--dont abuse it pls :)
local Player = game:GetService('Players').LocalPlayer
Player.CharacterAdded:Wait()
repeat wait() until game.Players.LocalPlayer.Character
repeat wait() until game.Players.LocalPlayer.Character.HumanoidRootPart
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "We're here", -- Required
	Text = "", -- Required
})
local lplr = game.Players.LocalPlayer
local char = lplr.Character
local humrp = char.HumanoidRootPart
local teleporter = workspace.Lobby.Teleport2
queueonteleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/Absu245/slap_battles/main/autofarm.lua'))()")
firetouchinterest(humrp,teleporter,1)
firetouchinterest(humrp,teleporter,0)
repeat
   wait()
until game.Players.LocalPlayer.Character.isInArena.Value == true
for _,v in pairs(workspace.Arena:GetDescendants()) do
    if string.find(v.Name, "Slapple" or "GoldenSlapple") and v:FindFirstChild("Glove") and v.Glove:FindFirstChildOfClass("TouchTransmitter") then
        firetouchinterest(char.Head, v.Glove, 1)
        firetouchinterest(char.Head, v.Glove, 0)
        wait(0.05)
    end
end
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Collected all, hopping", -- Required
	Text = "", -- Required
})
while true do
pcall(function()
local Http = game:GetService("HttpService")
local TPS = game:GetService("TeleportService")
local Api = "https://games.roblox.com/v1/games/"

local _place = game.PlaceId
local _servers = Api.._place.."/servers/Public?sortOrder=Asc&limit=100"
function ListServers(cursor)
   local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))
   return Http:JSONDecode(Raw)
end

local Server, Next; repeat
   local Servers = ListServers(Next)
   Server = Servers.data[1]
   Next = Servers.nextPageCursor
until Server

TPS:TeleportToPlaceInstance(_place,Server.id,game.Players.LocalPlayer)
end)
task.wait(2)
end
