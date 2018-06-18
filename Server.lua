local AIO = AIO or require("AIO")

local MyHandlers = AIO.AddHandlers("Quest", {})

local function OnCommand(event, player, command)
    if (command == "kaev") then
        AIO.Handle(player, "Quest", "ShowFrame")
        return false
    end
end

RegisterPlayerEvent(42, OnCommand)