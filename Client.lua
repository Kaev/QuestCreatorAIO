-- AIO OVERHEAD
local AIO = AIO or require("AIO")
if AIO.AddAddon() then
    return
end
local MyHandlers = AIO.AddHandlers("Quest", {})
-- AIO OVERHEAD

-- LOCAL VARIABLES
local pagetitles =
{
    [1] = "Quest Accept Window",
    [2] = "Quest Log Window"
}
local factiongroup = UnitFactionGroup("player")
local page = 1
-- LOCAL VARIABLES

-- ALL GUI OBJECTS
local frame = CreateFrame("Frame", "FrameTest", UIParent)
local scrollframe = CreateFrame("ScrollFrame", "scrollframe", frame, "UIPanelScrollFrameTemplate")
local scrollchild = CreateFrame("Frame", "scrollchild", scrollframe)
local page1 = CreateFrame("Frame","page1", scrollchild)
local page2 = CreateFrame("Frame","page2", scrollchild)
local tooltip = CreateFrame("GameTooltip", "tooltip", frame, "GameTooltipTemplate")
local topleft = frame:CreateTexture(nil, "BACKGROUND")
local topright = frame:CreateTexture(nil, "BACKGROUND")
local bottomleft = frame:CreateTexture(nil, "BACKGROUND")
local bottomright = frame:CreateTexture(nil, "BACKGROUND")
local toplefticon = frame:CreateTexture(nil, "ARTWORK")
local frametitle = frame:CreateFontString(nil, "BACKGROUND", frame)
local closebutton = CreateFrame("Button", "closebutton", frame, "UIPanelCloseButton")
local bottomrightbutton = CreateFrame("Button", "bottomrightbutton", frame, "UIPanelButtonTemplate")
local bottomleftbutton = CreateFrame("Button", "bottomleftbutton", frame, "UIPanelButtonTemplate")
local bottomleftpatch = frame:CreateTexture(nil, "ARTWORK")
local frameheader = frame:CreateFontString(nil, "BACKGROUND", frame)
local questtitle = CreateFrame("EditBox", "questtitle", page1)
local questprogresstext = CreateFrame("EditBox", "questprogresstext", page1)
local questobjectivetitle = page1:CreateFontString(nil, "OVERLAY", "QuestTitleFont")
local questobjectivetext = CreateFrame("EditBox", "questobjectivetext", page1)
local questrewardstitle = page1:CreateFontString(nil, "OVERLAY", "QuestTitleFont")
local questchooseitemrewards = page1:CreateFontString(nil, "OVERLAY", "QuestFont")
local choiceitem1 = CreateFrame("Button", "choiceitem1", page1, "QuestInfoRewardItemTemplate")
local choiceitem1border = choiceitem1:CreateTexture("choiceitem1border", "OVERLAY")
local choiceitem1count = choiceitem1:CreateFontString("choiceitem1count", "OVERLAY", "NumberFontNormal")
local choiceitem1countplus = CreateFrame("Button", "choiceitem1countplus", page1, "UIPanelButtonTemplate")
local choiceitem1countminus = CreateFrame("Button", "choiceitem1countminus", page1, "UIPanelButtonTemplate")
local choiceitem2 = CreateFrame("Button", "choiceitem2", page1, "QuestInfoRewardItemTemplate")
local choiceitem2border = choiceitem2:CreateTexture("choiceitem2border", "OVERLAY")
local choiceitem2count = choiceitem2:CreateFontString("choiceitem2count", "OVERLAY", "NumberFontNormal")
local choiceitem2countplus = CreateFrame("Button", "choiceitem2countplus", page1, "UIPanelButtonTemplate")
local choiceitem2countminus = CreateFrame("Button", "choiceitem2countminus", page1, "UIPanelButtonTemplate")
local choiceitem3 = CreateFrame("Button", "choiceitem3", page1, "QuestInfoRewardItemTemplate")
local choiceitem3border = choiceitem3:CreateTexture("choiceitem3border", "OVERLAY")
local choiceitem3count = choiceitem3:CreateFontString("choiceitem3count", "OVERLAY", "NumberFontNormal")
local choiceitem3countplus = CreateFrame("Button", "choiceitem3countplus", page1, "UIPanelButtonTemplate")
local choiceitem3countminus = CreateFrame("Button", "choiceitem3countminus", page1, "UIPanelButtonTemplate")
local choiceitem4 = CreateFrame("Button", "choiceitem4", page1, "QuestInfoRewardItemTemplate")
local choiceitem4border = choiceitem4:CreateTexture("choiceitem4border", "OVERLAY")
local choiceitem4count = choiceitem4:CreateFontString("choiceitem4count", "OVERLAY", "NumberFontNormal")
local choiceitem4countplus = CreateFrame("Button", "choiceitem4countplus", page1, "UIPanelButtonTemplate")
local choiceitem4countminus = CreateFrame("Button", "choiceitem4countminus", page1, "UIPanelButtonTemplate")
local choiceitem5 = CreateFrame("Button", "choiceitem5", page1, "QuestInfoRewardItemTemplate")
local choiceitem5border = choiceitem5:CreateTexture("choiceitem5border", "OVERLAY")
local choiceitem5count = choiceitem5:CreateFontString("choiceitem5count", "OVERLAY", "NumberFontNormal")
local choiceitem5countplus = CreateFrame("Button", "choiceitem5countplus", page1, "UIPanelButtonTemplate")
local choiceitem5countminus = CreateFrame("Button", "choiceitem5countminus", page1, "UIPanelButtonTemplate")
local choiceitem6 = CreateFrame("Button", "choiceitem6", page1, "QuestInfoRewardItemTemplate")
local choiceitem6border = choiceitem6:CreateTexture("choiceitem6border", "OVERLAY")
local choiceitem6count = choiceitem6:CreateFontString("choiceitem6count", "OVERLAY", "NumberFontNormal")
local choiceitem6countplus = CreateFrame("Button", "choiceitem6countplus", page1, "UIPanelButtonTemplate")
local choiceitem6countminus = CreateFrame("Button", "choiceitem6countminus", page1, "UIPanelButtonTemplate")
local questspelllearntext = page1:CreateFontString(nil, "OVERLAY", "QuestFont")
local questspell1 = CreateFrame("Button", "questspell1", page1, "QuestInfoRewardItemTemplate")
local questspell1border = questspell1:CreateTexture("questspell1border", "OVERLAY")
local questitemreceivetext = page1:CreateFontString(nil, "OVERLAY", "QuestFont")
local moneyframe = CreateFrame("Frame", "moneyframe", page1, "MoneyInputFrameTemplate")
local honorreceivetext = page1:CreateFontString(nil, "OVERLAY", "QuestFont")
local honorreceivebox = CreateFrame("EditBox", "honorreceivebox", page1)
local honorleft = honorreceivebox:CreateTexture(nil, "BACKGROUND")
local honorright = honorreceivebox:CreateTexture(nil, "BACKGROUND")
local honormiddle = honorreceivebox:CreateTexture(nil, "BACKGROUND")
local honorsymbol = honorreceivebox:CreateTexture(nil, "BACKGROUND")
local arenapointsreceivetext = page1:CreateFontString(nil, "OVERLAY", "QuestFont")
local arenapointsreceivebox = CreateFrame("EditBox", "arenapointsreceivebox", page1)
local arenapointsleft = arenapointsreceivebox:CreateTexture(nil, "BACKGROUND")
local arenapointsright = arenapointsreceivebox:CreateTexture(nil, "BACKGROUND")
local arenapointsmiddle = arenapointsreceivebox:CreateTexture(nil, "BACKGROUND")
local arenapointssymbol = arenapointsreceivebox:CreateTexture(nil, "BACKGROUND")
local talentpointsreceivetext = page1:CreateFontString(nil, "OVERLAY", "QuestFont")
local talentpointsreceivebox = CreateFrame("EditBox", "talentpointsreceivebox", page1)
local talentpointsleft = talentpointsreceivebox:CreateTexture(nil, "BACKGROUND")
local talentpointsright = talentpointsreceivebox:CreateTexture(nil, "BACKGROUND")
local talentpointsmiddle = talentpointsreceivebox:CreateTexture(nil, "BACKGROUND")
local itemreward1 = CreateFrame("Button", "itemreward1", page1, "QuestInfoRewardItemTemplate")
local itemreward1border = itemreward1:CreateTexture("itemreward1border", "OVERLAY")
local itemreward1count = itemreward1:CreateFontString("itemreward1count", "OVERLAY", "NumberFontNormal")
local itemreward1countplus = CreateFrame("Button", "itemreward1countplus", page1, "UIPanelButtonTemplate")
local itemreward1countminus = CreateFrame("Button", "itemreward1countminus", page1, "UIPanelButtonTemplate")
local itemreward2 = CreateFrame("Button", "itemreward2", page1, "QuestInfoRewardItemTemplate")
local itemreward2border = itemreward2:CreateTexture("itemreward2border", "OVERLAY")
local itemreward2count = itemreward2:CreateFontString("itemreward2count", "OVERLAY", "NumberFontNormal")
local itemreward2countplus = CreateFrame("Button", "itemreward2countplus", page1, "UIPanelButtonTemplate")
local itemreward2countminus = CreateFrame("Button", "itemreward2countminus", page1, "UIPanelButtonTemplate")
local itemreward3 = CreateFrame("Button", "itemreward3", page1, "QuestInfoRewardItemTemplate")
local itemreward3border = itemreward3:CreateTexture("itemreward3border", "OVERLAY")
local itemreward3count = itemreward3:CreateFontString("itemreward3count", "OVERLAY", "NumberFontNormal")
local itemreward3countplus = CreateFrame("Button", "itemreward3countplus", page1, "UIPanelButtonTemplate")
local itemreward3countminus = CreateFrame("Button", "itemreward3countminus", page1, "UIPanelButtonTemplate")
local itemreward4 = CreateFrame("Button", "itemreward4", page1, "QuestInfoRewardItemTemplate")
local itemreward4border = itemreward4:CreateTexture("itemreward4border", "OVERLAY")
local itemreward4count = itemreward4:CreateFontString("itemreward4count", "OVERLAY", "NumberFontNormal")
local itemreward4countplus = CreateFrame("Button", "itemreward4countplus", page1, "UIPanelButtonTemplate")
local itemreward4countminus = CreateFrame("Button", "itemreward4countminus", page1, "UIPanelButtonTemplate")
local questtitlepage2 = page2:CreateFontString(nil, "OVERLAY", "QuestTitleFont")
local questprogresstextpage2 = page2:CreateFontString(nil, "OVERLAY", "QuestFont")
local footerspacer = CreateFrame("Frame", "footerspacer", page1)
--inputBox
local inputBox = {}
inputBox.Frame = CreateFrame("Frame", "inputFrame",UIParent)
inputBox.Text = inputFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
inputBox.EditBox = CreateFrame("EditBox", "inputFrameEditBox", inputFrame,"InputBoxTemplate")
inputBox.ButtonOK = CreateFrame("Button", "inputFrameButtonOK", inputFrame, "UIPanelButtonTemplate")
inputBox.ButtonCancle = CreateFrame("Button", "inputFrameButtonCancle", inputFrame, "UIPanelButtonTemplate")

-- ALL OBJECTS

-- FUNCTIONS
function RefreshPage()
    frametitle:SetText(pagetitles[page])
    questtitlepage2:SetText(questtitle:GetText())
    questprogresstextpage2:SetText(questobjectivetext:GetText())
end

function MyHandlers.ShowFrame(player)
    frame:Show()
end

function ClearFocus(self)
    self:ClearFocus()
end

function SetFocusGainedTextColor(self)
    self:SetTextColor(1, 1, 1)
end

function SetFocusLostTextColor(self)
    self:SetTextColor(0, 0, 0)
end

function ItemButtonReceiveDrag(self)
    local cursorType, id, _ = GetCursorInfo()
    ClearCursor()
    if cursorType =="item" and id ~= 0 then
        _ItemButtonReceiveDrag(self,id)
    end
end

function _ItemButtonReceiveDrag(self,id)
    if (GetItemInfo(id)==nil) then
        GameTooltip:SetHyperlink("item:"..id..":0:0:0:0:0:0:0")
        print("Item["..id.."] is not found.query it in server,plsase try again.")
        return
    end
    self:SetID(id)
    local name, _, _, _, _, _, _, _, _, texture, _ = GetItemInfo(id)
    local frameName = self:GetName()
    _G[frameName.."Name"]:SetText(name)
    SetItemButtonTexture(self, texture)
    _G[frameName.."border"]:Hide()
    _G[frameName.."count"]:SetText("1")
    _G[frameName.."count"]:Show()
    _G[frameName.."countplus"]:Show()
    _G[frameName.."countminus"]:Show()

end

function ItemButtonClick(self, mbutton, down)
    if mbutton == "RightButton" then
        local frameName = self:GetName()
        self:SetID(0)
        _G[frameName.."Name"]:SetText(nil)
        SetItemButtonTexture(self, nil)
        _G[frameName.."border"]:Show()
        _G[frameName.."count"]:Hide()
        _G[frameName.."countplus"]:Hide()
        _G[frameName.."countminus"]:Hide()
    elseif mbutton == "LeftButton" then
        if (self:GetID()==0) then
            inputBox:Show(self,"number",_ItemButtonReceiveDrag)
        end
    end
end

local function GetScaledCursorPosition()
	local x, y = GetCursorPosition()
	local scale = UIParent:GetEffectiveScale()
	return x / scale, y / scale
end

function inputBox:Show(Object,valType,f)
    local x,y = GetScaledCursorPosition()
    self.Frame:SetFrameLevel(Object:GetFrameLevel() + 1)
    self.Frame:SetPoint("BOTTOMLEFT",x -100,y -20)
    self.object = Object
    self.valueType = valType
    self.tempFun = f
    inputBox.Frame:Show()
end

function inputBox.ButtonOKOnClick(self)
    local text = inputBox.EditBox:GetText()
    if (inputBox.valueType=="number") then
        text = tonumber(text)
    end
    inputBox.tempFun(inputBox.object,text)
    inputBox.Frame:Hide()
end

function SpellButtonReceiveDrag(self)
    local cursorType, id, _ = GetCursorInfo()
    ClearCursor()
    if cursorType =="spell" and id ~= 0 then
        local spelllink = GetSpellLink(GetSpellInfo(id, cursorType))
        local spellid = select(3, strfind(spelllink, "spell:(%d+)|"))
        self:SetID(spellid)
        local frameName = self:GetName()
        _G[frameName.."Name"]:SetText(GetSpellName(id, cursorType))
        SetItemButtonTexture(self, GetSpellTexture(id, cursorType))
        _G[frameName.."border"]:Hide()
    end
end

function SpellButtonClick(self, mbutton, down)
    if mbutton == "RightButton" then
        self:SetID(0)
        _G[frameName.."Name"]:SetText(nil)
        SetItemButtonTexture(self, nil)
        _G[frameName.."border"]:Show()
    end
end
-- FUNCTIONS

-- UI LOGIC
frame:SetScript("OnDragStart", frame.StartMoving)
frame:SetScript("OnHide", frame.StopMovingOrSizing)
frame:SetScript("OnDragStop", frame.StopMovingOrSizing)
frame:SetScript("OnShow", function()
    PlaySound("igQuestListOpen")
end)


inputBox.Frame:SetScript("OnDragStart", inputFrame.StartMoving)
inputBox.Frame:SetScript("OnHide", inputFrame.StopMovingOrSizing)
inputBox.Frame:SetScript("OnDragStop", inputFrame.StopMovingOrSizing)
inputBox.Frame:SetScript("OnLeave", function()
    local x,y,w,h = inputBox.Frame:GetBoundsRect()
    local mx,my = GetScaledCursorPosition()
    if (mx > x and mx < x+w) and (my > y and my < y+h) then 
        return
    end
    inputBox.Frame:Hide()
end)
inputBox.ButtonCancle:SetScript("OnClick", function()inputBox.Frame:Hide()end)
inputBox.ButtonOK:SetScript("OnClick", inputBox.ButtonOKOnClick)


closebutton:SetScript("OnClick", function()
    frame:Hide()
    PlaySound("igQuestListClose")
end)
bottomrightbutton:SetScript("OnMouseUp", function()
    page = page + 1
    bottomleftpatch:Hide()
    bottomleftbutton:Show()
    _G["page"..page]:Show()
    _G["page"..page-1]:Hide()
    RefreshPage()
end)
bottomleftbutton:SetScript("OnMouseUp", function()
    if (page > 1) then
        page = page - 1
    end
    if (page == 1) then
        bottomleftbutton:Hide()
        bottomleftpatch:Show()
    end
    _G["page"..page]:Show()
    _G["page"..page+1]:Hide()
    RefreshPage()
end)
questtitle:SetScript("OnEditFocusGained", SetFocusGainedTextColor)
questtitle:SetScript("OnEditFocusLost", SetFocusLostTextColor)
questtitle:SetScript("OnEscapePressed", ClearFocus)
questprogresstext:SetScript("OnEditFocusGained", SetFocusGainedTextColor)
questprogresstext:SetScript("OnEditFocusLost", SetFocusLostTextColor)
questprogresstext:SetScript("OnEscapePressed", ClearFocus)
questobjectivetext:SetScript("OnEditFocusGained", SetFocusGainedTextColor)
questobjectivetext:SetScript("OnEditFocusLost", SetFocusLostTextColor)
questobjectivetext:SetScript("OnEscapePressed", ClearFocus)
choiceitem1:SetScript("OnReceiveDrag", ItemButtonReceiveDrag)
choiceitem1:SetScript("OnMouseDown", ItemButtonReceiveDrag)
choiceitem1:RegisterForClicks("AnyUp")
choiceitem1:SetScript("OnClick", ItemButtonClick)
choiceitem1countplus:SetScript("OnClick", function()
    choiceitem1count:SetText(choiceitem1count:GetText() + 1)
end)
choiceitem1countminus:SetScript("OnClick", function()
    if (tonumber(choiceitem1count:GetText()) > 1) then
        choiceitem1count:SetText(choiceitem1count:GetText() - 1)
    end
end)
choiceitem2:SetScript("OnReceiveDrag", ItemButtonReceiveDrag)
choiceitem2:SetScript("OnMouseDown", ItemButtonReceiveDrag)
choiceitem2:RegisterForClicks("AnyUp")
choiceitem2:SetScript("OnClick", ItemButtonClick)
choiceitem2countplus:SetScript("OnClick", function()
    choiceitem2count:SetText(choiceitem2count:GetText() + 1)
end)
choiceitem2countminus:SetScript("OnClick", function()
    if (tonumber(choiceitem2count:GetText()) > 1) then
        choiceitem2count:SetText(choiceitem2count:GetText() - 1)
    end
end)
choiceitem3:SetScript("OnReceiveDrag", ItemButtonReceiveDrag)
choiceitem3:SetScript("OnMouseDown", ItemButtonReceiveDrag)
choiceitem3:RegisterForClicks("AnyUp")
choiceitem3:SetScript("OnClick", ItemButtonClick)
choiceitem3countplus:SetScript("OnClick", function()
    choiceitem3count:SetText(choiceitem3count:GetText() + 1)
end)
choiceitem3countminus:SetScript("OnClick", function()
    if (tonumber(choiceitem3count:GetText()) > 1) then
        choiceitem3count:SetText(choiceitem3count:GetText() - 1)
    end
end)
choiceitem4:SetScript("OnReceiveDrag", ItemButtonReceiveDrag)
choiceitem4:SetScript("OnMouseDown", ItemButtonReceiveDrag)
choiceitem4:RegisterForClicks("AnyUp")
choiceitem4:SetScript("OnClick", ItemButtonClick)
choiceitem4countplus:SetScript("OnClick", function()
    choiceitem4count:SetText(choiceitem4count:GetText() + 1)
end)
choiceitem4countminus:SetScript("OnClick", function()
    if (tonumber(choiceitem4count:GetText()) > 1) then
        choiceitem4count:SetText(choiceitem4count:GetText() - 1)
    end
end)
choiceitem5:SetScript("OnReceiveDrag", ItemButtonReceiveDrag)
choiceitem5:SetScript("OnMouseDown", ItemButtonReceiveDrag)
choiceitem5:RegisterForClicks("AnyUp")
choiceitem5:SetScript("OnClick", ItemButtonClick)
choiceitem5countplus:SetScript("OnClick", function()
    choiceitem5count:SetText(choiceitem5count:GetText() + 1)
end)
choiceitem5countminus:SetScript("OnClick", function()
    if (tonumber(choiceitem5count:GetText()) > 1) then
        choiceitem5count:SetText(choiceitem5count:GetText() - 1)
    end
end)
choiceitem6:SetScript("OnReceiveDrag", ItemButtonReceiveDrag)
choiceitem6:SetScript("OnMouseDown", ItemButtonReceiveDrag)
choiceitem6:RegisterForClicks("AnyUp")
choiceitem6:SetScript("OnClick", ItemButtonClick)
choiceitem6countplus:SetScript("OnClick", function()
    choiceitem6count:SetText(choiceitem6count:GetText() + 1)
end)
choiceitem6countminus:SetScript("OnClick", function()
    if (tonumber(choiceitem6count:GetText()) > 1) then
        choiceitem6count:SetText(choiceitem6count:GetText() - 1)
    end
end)
questspell1:SetScript("OnReceiveDrag", SpellButtonReceiveDrag)
questspell1:SetScript("OnMouseDown",  SpellButtonReceiveDrag)
questspell1:RegisterForClicks("AnyUp")
questspell1:SetScript("OnClick", SpellButtonClick)
honorreceivebox:SetScript("OnEscapePressed", ClearFocus)
arenapointsreceivebox:SetScript("OnEscapePressed", ClearFocus)
talentpointsreceivebox:SetScript("OnEscapePressed", ClearFocus)
itemreward1:SetScript("OnReceiveDrag", ItemButtonReceiveDrag)
itemreward1:SetScript("OnMouseDown", ItemButtonReceiveDrag)
itemreward1:RegisterForClicks("AnyUp")
itemreward1:SetScript("OnClick", ItemButtonClick)
itemreward1countplus:SetScript("OnClick", function()
    itemreward1count:SetText(itemreward1count:GetText() + 1)
end)
itemreward1countminus:SetScript("OnClick", function()
    if (tonumber(itemreward1count:GetText()) > 1) then
        itemreward1count:SetText(itemreward1count:GetText() - 1)
    end
end)
itemreward2:SetScript("OnReceiveDrag", ItemButtonReceiveDrag)
itemreward2:SetScript("OnMouseDown", ItemButtonReceiveDrag)
itemreward2:RegisterForClicks("AnyUp")
itemreward2:SetScript("OnClick", ItemButtonClick)
itemreward2countplus:SetScript("OnClick", function()
    itemreward2count:SetText(itemreward2count:GetText() + 1)
end)
itemreward2countminus:SetScript("OnClick", function()
    if (tonumber(itemreward2count:GetText()) > 1) then
        itemreward2count:SetText(itemreward2count:GetText() - 1)
    end
end)
itemreward3:SetScript("OnReceiveDrag", ItemButtonReceiveDrag)
itemreward3:SetScript("OnMouseDown", ItemButtonReceiveDrag)
itemreward3:RegisterForClicks("AnyUp")
itemreward3:SetScript("OnClick", ItemButtonClick)
itemreward3countplus:SetScript("OnClick", function()
    itemreward3count:SetText(itemreward3count:GetText() + 1)
end)
itemreward3countminus:SetScript("OnClick", function()
    if (tonumber(itemreward3count:GetText()) > 1) then
        itemreward3count:SetText(itemreward3count:GetText() - 1)
    end
end)
itemreward4:SetScript("OnReceiveDrag", ItemButtonReceiveDrag)
itemreward4:SetScript("OnMouseDown", ItemButtonReceiveDrag)
itemreward4:RegisterForClicks("AnyUp")
itemreward4:SetScript("OnClick", ItemButtonClick)
itemreward4countplus:SetScript("OnClick", function()
    itemreward4count:SetText(itemreward4count:GetText() + 1)
end)
itemreward4countminus:SetScript("OnClick", function()
    if (tonumber(itemreward4count:GetText()) > 1) then
        itemreward4count:SetText(itemreward4count:GetText() - 1)
    end
end)
-- UI LOGIC

-- Configure pages
page1:SetSize(270, 50)
page1:SetPoint("TOPLEFT", scrollchild, "TOPLEFT")
page2:SetSize(270, 50)
page2:SetPoint("TOPLEFT", scrollchild, "TOPLEFT")
page2:Hide()

-- Create the base frame
frame:SetSize(384, 512)
frame:RegisterForDrag("LeftButton")
frame:SetPoint("CENTER")
frame:SetToplevel(true)
frame:SetClampedToScreen(true)
frame:SetHitRectInsets(0, 30, 0, 70)
frame:SetMovable(true)
frame:EnableMouse(true)

-- Create inputBox
inputBox.Frame:SetSize(410,60)
inputBox.Frame:SetPoint("CENTER")
inputBox.Frame:SetMovable(true)
inputBox.Frame:EnableMouse(true)
inputBox.Frame:RegisterForDrag("LeftButton")
inputBox.Frame:SetBackdrop({
    bgFile="Interface/DialogFrame/UI-DialogBox-Background",
    edgeFile="Interface/DialogFrame/UI-DialogBox-Border",
    edgeSize = 20,
    insets = { left = 1, right = 1, top = 1, bottom = 1 }
})

inputBox.Text:SetText("please input")
inputBox.Text:SetSize(100,20)
inputBox.Text:SetPoint("TOPLEFT",8,-18)
inputBox.EditBox:SetSize(166,32)
inputBox.EditBox:SetPoint("TOPLEFT",108,-13)
inputBox.ButtonOK:SetSize(41,23)
inputBox.ButtonCancle:SetSize(61,23)
inputBox.ButtonOK:SetPoint("TOPLEFT",281,-18)
inputBox.ButtonCancle:SetPoint("TOPLEFT",328,-18)
inputBox.ButtonOK:SetText("Ok")
inputBox.ButtonCancle:SetText("Cancle")
inputBox.object = nil
inputBox.value = nil
inputBox.tempFun = nil
inputFrame:Hide()

-- Create Tooltip to show item and spell tooltips
tooltip:SetOwner(frame, "ANCHOR_NONE")

-- Save position even after reload or restarting the game
AIO.SavePosition(frame)

-- Create base frame design
topleft:SetTexture("Interface\\QuestFrame\\UI-QuestGreeting-TopLeft")
topleft:SetSize(256, 256)
topleft:SetPoint("TOPLEFT", frame, "TOPLEFT")
frame.Texture = topleft
topright:SetTexture("Interface\\QuestFrame\\UI-QuestGreeting-TopRight")
topright:SetSize(128, 256)
topright:SetPoint("TOPRIGHT", frame, "TOPRIGHT")
frame.Texture = topright
bottomleft:SetTexture("Interface\\QuestFrame\\UI-QuestGreeting-BotLeft")
bottomleft:SetSize(256, 256)
bottomleft:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT")
frame.Texture = bottomleft
bottomright:SetTexture("Interface\\QuestFrame\\UI-QuestGreeting-BotRight")
bottomright:SetSize(128, 256)
bottomright:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT")
frame.Texture = bottomright
toplefticon:SetSize(60, 60)
toplefticon:SetPoint("TOPLEFT", frame, "TOPLEFT", 7, -6)
SetPortraitTexture(toplefticon, "player")

-- Frame title
frametitle:SetSize(235, 20)
frametitle:SetFontObject("GameFontHighlight")
frametitle:SetPoint("TOP", frame, "TOP", 0, -50)
frametitle:SetText("Quest Accept Window")

-- Close button
closebutton:SetPoint("CENTER", frame, "TOPRIGHT", -42, -31)


-- Bottom frame buttons/patches
bottomrightbutton:SetSize(78, 22)
bottomrightbutton:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -39, 73)
bottomrightbutton:SetText("Next")
bottomleftbutton:SetSize(78, 22)
bottomleftbutton:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 22, 72)
bottomleftbutton:SetText("Back")
bottomleftbutton:Hide()
bottomleftpatch:SetTexture("Interface\\QuestFrame\\UI-Quest-BotLeftPatch")
bottomleftpatch:SetSize(128, 64)
bottomleftpatch:SetPoint("BOTTOMLEFT", 22, 68)
bottomleftpatch:Show()
frame.Texture = bottomleftpatch


-- Header text
frameheader:SetSize(235, 20)
frameheader:SetFontObject("GameFontHighlight")
frameheader:SetPoint("TOP", frame, "TOP", 0, -20)
frameheader:SetText("Kaev's Quest Creator")

-- Set up scrolling
scrollframe:SetSize(300, 334)
scrollframe:SetPoint("TOPLEFT", frame, 23, -81)
scrollchild:SetSize(300, 334)
scrollframe:SetScrollChild(scrollchild)

-- Quest title (LogTitle)
questtitle:SetFontObject("QuestTitleFont")
questtitle:SetTextColor(0, 0, 0, 1)
questtitle:SetWidth(285)
questtitle:SetText("Quest Title")
questtitle:SetJustifyH("LEFT")
questtitle:SetPoint("TOPLEFT", 10, -10)
questtitle:SetMultiLine(true)
questtitle:SetAutoFocus(false)
ClearFocus(questtitle)

-- Quest progress text (QuestDescription)
questprogresstext:SetFontObject("QuestFont")
questprogresstext:SetTextColor(0, 0, 0, 1)
questprogresstext:SetWidth(275)
questprogresstext:SetText("Quest text")
questprogresstext:SetJustifyH("LEFT")
questprogresstext:SetPoint("TOPLEFT", questtitle, "BOTTOMLEFT", 0, -5)
questprogresstext:SetMultiLine(true)
questprogresstext:SetAutoFocus(false)


-- Quest objectives title
questobjectivetitle:SetPoint("TOPLEFT", questprogresstext, "BOTTOMLEFT", 0, -15)
questobjectivetitle:SetJustifyH("LEFT")
questobjectivetitle:SetText(QUEST_OBJECTIVES)

-- Quest objectives text (LogDescription)
questobjectivetext:SetFontObject("QuestFont")
questobjectivetext:SetTextColor(0, 0, 0, 1)
questobjectivetext:SetWidth(275)
questobjectivetext:SetText("Quest objective text")
questobjectivetext:SetJustifyH("LEFT")
questobjectivetext:SetPoint("TOPLEFT", questobjectivetitle, "BOTTOMLEFT", 0, -5)
questobjectivetext:SetMultiLine(true)
questobjectivetext:SetAutoFocus(false)


-- Quest rewards Title
questrewardstitle:SetPoint("TOPLEFT", questobjectivetext, "BOTTOMLEFT", 0, -15)
questrewardstitle:SetJustifyH("LEFT")
questrewardstitle:SetText(QUEST_REWARDS)

-- Choice item rewards (Max. 6 Items)

-- Choice item 1
questchooseitemrewards:SetPoint("TOPLEFT", questrewardstitle, "BOTTOMLEFT", 0, -5)
questchooseitemrewards:SetJustifyH("LEFT")
questchooseitemrewards:SetText(REWARD_CHOICES)
choiceitem1.Texture = choiceitem1border
choiceitem1:SetSize(36, 36)
choiceitem1:SetPoint("TOPLEFT", questchooseitemrewards, "BOTTOMLEFT", -6, -5)
choiceitem1NameFrame:SetPoint("LEFT", choiceitem1IconTexture, "RIGHT", -10, 0)
choiceitem1border:SetTexture("Interface\\Buttons\\UI-Quickslot2")
choiceitem1border:SetSize(66, 66)
choiceitem1border:SetPoint("CENTER", 1, -1)
choiceitem1count:SetJustifyH("RIGHT")
choiceitem1count:SetPoint("BOTTOMRIGHT", 2, -2)
choiceitem1count:SetText("1")
choiceitem1count:Hide()
choiceitem1countplus:SetSize(12, 12)
choiceitem1countplus:SetPoint("TOPRIGHT", choiceitem1NameFrame, "RIGHT", -14, 15)
choiceitem1countplus:SetText("+")
choiceitem1countplus:Hide()
choiceitem1countminus:SetSize(12, 12)
choiceitem1countminus:SetPoint("TOPRIGHT", choiceitem1NameFrame, "RIGHT", -14, -5)
choiceitem1countminus:SetText("-")
choiceitem1countminus:Hide()


-- Choice item 2
choiceitem2:SetSize(36, 36)
choiceitem2:SetPoint("LEFT", choiceitem1, "RIGHT", 112, 0)
choiceitem2NameFrame:SetPoint("LEFT", choiceitem2IconTexture, "RIGHT", -10, 0)
choiceitem2border:SetTexture("Interface\\Buttons\\UI-Quickslot2")
choiceitem2border:SetSize(66, 66)
choiceitem2border:SetPoint("CENTER", 1, -1)
choiceitem2count:SetJustifyH("RIGHT")
choiceitem2count:SetPoint("BOTTOMRIGHT", 2, -2)
choiceitem2count:SetText("1")
choiceitem2count:Hide()
choiceitem2countplus:SetSize(12, 12)
choiceitem2countplus:SetPoint("TOPRIGHT", choiceitem2NameFrame, "RIGHT", -14, 15)
choiceitem2countplus:SetText("+")
choiceitem2countplus:Hide()
choiceitem2countminus:SetSize(12, 12)
choiceitem2countminus:SetPoint("TOPRIGHT", choiceitem2NameFrame, "RIGHT", -14, -5)
choiceitem2countminus:SetText("-")
choiceitem2countminus:Hide()


-- Choice item 3
choiceitem3:SetSize(36, 36)
choiceitem3:SetPoint("TOPLEFT", choiceitem1, "BOTTOMLEFT", 0, -7)
choiceitem3NameFrame:SetPoint("LEFT", choiceitem3IconTexture, "RIGHT", -10, 0)
choiceitem3border:SetTexture("Interface\\Buttons\\UI-Quickslot2")
choiceitem3border:SetSize(66, 66)
choiceitem3border:SetPoint("CENTER", 1, -1)
choiceitem3count:SetJustifyH("RIGHT")
choiceitem3count:SetPoint("BOTTOMRIGHT", 2, -2)
choiceitem3count:SetText("1")
choiceitem3count:Hide()
choiceitem3countplus:SetSize(12, 12)
choiceitem3countplus:SetPoint("TOPRIGHT", choiceitem3NameFrame, "RIGHT", -14, 15)
choiceitem3countplus:SetText("+")
choiceitem3countplus:Hide()
choiceitem3countminus:SetSize(12, 12)
choiceitem3countminus:SetPoint("TOPRIGHT", choiceitem3NameFrame, "RIGHT", -14, -5)
choiceitem3countminus:SetText("-")
choiceitem3countminus:Hide()


-- Choice item 4
choiceitem4:SetSize(36, 36)
choiceitem4:SetPoint("LEFT", choiceitem3, "RIGHT", 112, 0)
choiceitem4NameFrame:SetPoint("LEFT", choiceitem4IconTexture, "RIGHT", -10, 0)
choiceitem4border:SetTexture("Interface\\Buttons\\UI-Quickslot2")
choiceitem4border:SetSize(66, 66)
choiceitem4border:SetPoint("CENTER", 1, -1)
choiceitem4count:SetJustifyH("RIGHT")
choiceitem4count:SetPoint("BOTTOMRIGHT", 2, -2)
choiceitem4count:SetText("1")
choiceitem4count:Hide()
choiceitem4countplus:SetSize(12, 12)
choiceitem4countplus:SetPoint("TOPRIGHT", choiceitem4NameFrame, "RIGHT", -14, 15)
choiceitem4countplus:SetText("+")
choiceitem4countplus:Hide()
choiceitem4countminus:SetSize(12, 12)
choiceitem4countminus:SetPoint("TOPRIGHT", choiceitem4NameFrame, "RIGHT", -14, -5)
choiceitem4countminus:SetText("-")
choiceitem4countminus:Hide()


-- Choice item 5
choiceitem5:SetSize(36, 36)
choiceitem5:SetPoint("TOPLEFT", choiceitem3, "BOTTOMLEFT", 0, -7)
choiceitem5NameFrame:SetPoint("LEFT", choiceitem5IconTexture, "RIGHT", -10, 0)
choiceitem5border:SetTexture("Interface\\Buttons\\UI-Quickslot2")
choiceitem5border:SetSize(66, 66)
choiceitem5border:SetPoint("CENTER", 1, -1)
choiceitem5count:SetJustifyH("RIGHT")
choiceitem5count:SetPoint("BOTTOMRIGHT", 2, -2)
choiceitem5count:SetText("1")
choiceitem5count:Hide()
choiceitem5countplus:SetSize(12, 12)
choiceitem5countplus:SetPoint("TOPRIGHT", choiceitem5NameFrame, "RIGHT", -14, 15)
choiceitem5countplus:SetText("+")
choiceitem5countplus:Hide()
choiceitem5countminus:SetSize(12, 12)
choiceitem5countminus:SetPoint("TOPRIGHT", choiceitem5NameFrame, "RIGHT", -14, -5)
choiceitem5countminus:SetText("-")
choiceitem5countminus:Hide()


-- Choice item 6
choiceitem6:SetSize(36, 36)
choiceitem6:SetPoint("LEFT", choiceitem5, "RIGHT", 112, 0)
choiceitem6NameFrame:SetPoint("LEFT", choiceitem6IconTexture, "RIGHT", -10, 0)
choiceitem6border:SetTexture("Interface\\Buttons\\UI-Quickslot2")
choiceitem6border:SetSize(66, 66)
choiceitem6border:SetPoint("CENTER", 1, -1)
choiceitem6count:SetJustifyH("RIGHT")
choiceitem6count:SetPoint("BOTTOMRIGHT", 2, -2)
choiceitem6count:SetText("1")
choiceitem6count:Hide()
choiceitem6countplus:SetSize(12, 12)
choiceitem6countplus:SetPoint("TOPRIGHT", choiceitem6NameFrame, "RIGHT", -14, 15)
choiceitem6countplus:SetText("+")
choiceitem6countplus:Hide()
choiceitem6countminus:SetSize(12, 12)
choiceitem6countminus:SetPoint("TOPRIGHT", choiceitem6NameFrame, "RIGHT", -14, -5)
choiceitem6countminus:SetText("-")
choiceitem6countminus:Hide()



-- Spell reward text
questspelllearntext:SetPoint("TOPLEFT", choiceitem5, "BOTTOMLEFT", 0, -11)
questspelllearntext:SetJustifyH("LEFT")
questspelllearntext:SetText(REWARD_AURA) -- TODO: REWARD_SPELL on learning, REWARD_TRADESKILL_SPELL on tradeskill

-- Spell reward button
questspell1:SetSize(36, 36)
questspell1:SetPoint("TOPLEFT", questspelllearntext, "BOTTOMLEFT", 0, -5)
questspell1NameFrame:SetPoint("LEFT", questspell1IconTexture, "RIGHT", -10, 0)
questspell1border:SetTexture("Interface\\Buttons\\UI-Quickslot2")
questspell1border:SetSize(66, 66)
questspell1border:SetPoint("CENTER", 1, -1)


-- Additional rewards
questitemreceivetext:SetPoint("TOPLEFT", questspell1, "BOTTOMLEFT", 0, -11)
questitemreceivetext:SetJustifyH("LEFT")
-- No choice item:
--questitemreceivetext:SetText(REWARD_ITEMS_ONLY)
-- At least 1 choice item:
questitemreceivetext:SetText(REWARD_ITEMS)

-- Money
moneyframe:SetPoint("LEFT", questitemreceivetext, "RIGHT", 5, 0)
moneyframeGold:SetWidth(35)
moneyframeGold:SetMaxLetters(7)
moneyframeGold["texture"]:SetPoint("LEFT", moneyframeGold, "RIGHT", 0, 0)
moneyframeSilver["texture"]:SetPoint("LEFT", moneyframeSilver, "RIGHT", -10, 0)
moneyframeSilver:SetPoint("LEFT", moneyframeGold, "RIGHT", 17, 0)
moneyframeCopper["texture"]:SetPoint("LEFT", moneyframeCopper, "RIGHT", -10, 0)
moneyframeCopper:SetPoint("LEFT", moneyframeSilver, "RIGHT", 7, 0)

-- Honor
honorreceivetext:SetPoint("TOPLEFT", questitemreceivetext, "BOTTOMLEFT", 0, -11)
honorreceivetext:SetJustifyH("LEFT")
honorreceivetext:SetText(BONUS_HONOR)
honorreceivebox:SetFontObject("ChatFontNormal")
honorreceivebox:SetSize(58, 20)
honorreceivebox:SetPoint("LEFT", honorreceivetext, "RIGHT", 10, 0)
honorreceivebox:SetNumeric(true)
honorreceivebox:SetMaxLetters(5)
honorreceivebox:SetAutoFocus(false)
honorleft:SetTexture("Interface\\Common\\Common-Input-Border")
honorleft:SetSize(8, 20)
honorleft:SetPoint("LEFT", -5, 0)
honorleft:SetTexCoord(0, 0.0625, 0, 0.625)
honorreceivebox.Texture = honorleft
honorright:SetTexture("Interface\\Common\\Common-Input-Border")
honorright:SetSize(8, 20)
honorright:SetPoint("RIGHT")
honorright:SetTexCoord(0.9375, 1, 0, 0.625)
honorreceivebox.Texture = honorright
honormiddle:SetTexture("Interface\\Common\\Common-Input-Border")
honormiddle:SetSize(10, 20)
honormiddle:SetPoint("LEFT", honorleft, "RIGHT")
honormiddle:SetPoint("RIGHT", honorright, "LEFT")
honormiddle:SetTexCoord(0.0625, 0.9375, 0, 0.625)
honorreceivebox.Texture = honormiddle
honorsymbol:SetTexture("Interface\\TargetingFrame\\UI-PVP-"..factiongroup)
honorsymbol:SetSize(32, 32)
honorsymbol:SetPoint("Left", honorreceivebox, "RIGHT", 0, -6)
honorreceivebox.Texture = honorsymbol

-- Arena points
arenapointsreceivetext:SetPoint("TOPLEFT", honorreceivetext, "BOTTOMLEFT", 0, -11)
arenapointsreceivetext:SetJustifyH("LEFT")
arenapointsreceivetext:SetText(BONUS_ARENA_POINTS)
arenapointsreceivebox:SetFontObject("ChatFontNormal")
arenapointsreceivebox:SetSize(58, 20)
arenapointsreceivebox:SetPoint("LEFT", arenapointsreceivetext, "RIGHT", 10, 0)
arenapointsreceivebox:SetNumeric(true)
arenapointsreceivebox:SetMaxLetters(5)
arenapointsreceivebox:SetAutoFocus(false)
arenapointsleft:SetTexture("Interface\\Common\\Common-Input-Border")
arenapointsleft:SetSize(8, 20)
arenapointsleft:SetPoint("LEFT", -5, 0)
arenapointsleft:SetTexCoord(0, 0.0625, 0, 0.625)
arenapointsreceivebox.Texture = arenapointsleft
arenapointsright:SetTexture("Interface\\Common\\Common-Input-Border")
arenapointsright:SetSize(8, 20)
arenapointsright:SetPoint("RIGHT")
arenapointsright:SetTexCoord(0.9375, 1, 0, 0.625)
arenapointsreceivebox.Texture = arenapointsright
arenapointsmiddle:SetTexture("Interface\\Common\\Common-Input-Border")
arenapointsmiddle:SetSize(10, 20)
arenapointsmiddle:SetPoint("LEFT", arenapointsleft, "RIGHT")
arenapointsmiddle:SetPoint("RIGHT", arenapointsright, "LEFT")
arenapointsmiddle:SetTexCoord(0.0625, 0.9375, 0, 0.625)
arenapointsreceivebox.Texture = arenapointsmiddle
arenapointssymbol:SetTexture("Interface\\PVPFrame\\PVP-ArenaPoints-Icon")
arenapointssymbol:SetSize(17, 15)
arenapointssymbol:SetPoint("Left", arenapointsreceivebox, "RIGHT", 2, 0)
arenapointsreceivebox.Texture = arenapointssymbol

-- Talent points
talentpointsreceivetext:SetPoint("TOPLEFT", arenapointsreceivetext, "BOTTOMLEFT", 0, -11)
talentpointsreceivetext:SetJustifyH("LEFT")
talentpointsreceivetext:SetText(BONUS_TALENTS)
talentpointsreceivebox:SetFontObject("ChatFontNormal")
talentpointsreceivebox:SetSize(58, 20)
talentpointsreceivebox:SetPoint("LEFT", talentpointsreceivetext, "RIGHT", 10, 0)
talentpointsreceivebox:SetNumeric(true)
talentpointsreceivebox:SetMaxLetters(5)
talentpointsreceivebox:SetAutoFocus(false)
talentpointsleft:SetTexture("Interface\\Common\\Common-Input-Border")
talentpointsleft:SetSize(8, 20)
talentpointsleft:SetPoint("LEFT", -5, 0)
talentpointsleft:SetTexCoord(0, 0.0625, 0, 0.625)
talentpointsreceivebox.Texture = talentpointsleft
talentpointsright:SetTexture("Interface\\Common\\Common-Input-Border")
talentpointsright:SetSize(8, 20)
talentpointsright:SetPoint("RIGHT")
talentpointsright:SetTexCoord(0.9375, 1, 0, 0.625)
talentpointsreceivebox.Texture = talentpointsright
talentpointsmiddle:SetTexture("Interface\\Common\\Common-Input-Border")
talentpointsmiddle:SetSize(10, 20)
talentpointsmiddle:SetPoint("LEFT", talentpointsleft, "RIGHT")
talentpointsmiddle:SetPoint("RIGHT", talentpointsright, "LEFT")
talentpointsmiddle:SetTexCoord(0.0625, 0.9375, 0, 0.625)
talentpointsreceivebox.Texture = talentpointsmiddle

-- Item rewards

-- Item reward 1
itemreward1.Texture = itemreward1border
itemreward1:SetSize(36, 36)
itemreward1:SetPoint("TOPLEFT", talentpointsreceivetext, "BOTTOMLEFT", 0, -10)
itemreward1NameFrame:SetPoint("LEFT", itemreward1IconTexture, "RIGHT", -10, 0)
itemreward1border:SetTexture("Interface\\Buttons\\UI-Quickslot2")
itemreward1border:SetSize(66, 66)
itemreward1border:SetPoint("CENTER", 1, -1)
itemreward1count:SetJustifyH("RIGHT")
itemreward1count:SetPoint("BOTTOMRIGHT", 2, -2)
itemreward1count:SetText("1")
itemreward1count:Hide()
itemreward1countplus:SetSize(12, 12)
itemreward1countplus:SetPoint("TOPRIGHT", itemreward1NameFrame, "RIGHT", -14, 15)
itemreward1countplus:SetText("+")
itemreward1countplus:Hide()
itemreward1countminus:SetSize(12, 12)
itemreward1countminus:SetPoint("TOPRIGHT", itemreward1NameFrame, "RIGHT", -14, -5)
itemreward1countminus:SetText("-")
itemreward1countminus:Hide()

-- Item reward 2
itemreward2:SetSize(36, 36)
itemreward2:SetPoint("LEFT", itemreward1, "RIGHT", 112, 0)
itemreward2NameFrame:SetPoint("LEFT", itemreward2IconTexture, "RIGHT", -10, 0)
itemreward2border:SetTexture("Interface\\Buttons\\UI-Quickslot2")
itemreward2border:SetSize(66, 66)
itemreward2border:SetPoint("CENTER", 1, -1)
itemreward2count:SetJustifyH("RIGHT")
itemreward2count:SetPoint("BOTTOMRIGHT", 2, -2)
itemreward2count:SetText("1")
itemreward2count:Hide()
itemreward2countplus:SetSize(12, 12)
itemreward2countplus:SetPoint("TOPRIGHT", itemreward2NameFrame, "RIGHT", -14, 15)
itemreward2countplus:SetText("+")
itemreward2countplus:Hide()
itemreward2countminus:SetSize(12, 12)
itemreward2countminus:SetPoint("TOPRIGHT", itemreward2NameFrame, "RIGHT", -14, -5)
itemreward2countminus:SetText("-")
itemreward2countminus:Hide()

-- Item reward 3
itemreward3:SetSize(36, 36)
itemreward3:SetPoint("TOPLEFT", itemreward1, "BOTTOMLEFT", 0, -7)
itemreward3NameFrame:SetPoint("LEFT", itemreward3IconTexture, "RIGHT", -10, 0)
itemreward3border:SetTexture("Interface\\Buttons\\UI-Quickslot2")
itemreward3border:SetSize(66, 66)
itemreward3border:SetPoint("CENTER", 1, -1)
itemreward3count:SetJustifyH("RIGHT")
itemreward3count:SetPoint("BOTTOMRIGHT", 2, -2)
itemreward3count:SetText("1")
itemreward3count:Hide()
itemreward3countplus:SetSize(12, 12)
itemreward3countplus:SetPoint("TOPRIGHT", itemreward3NameFrame, "RIGHT", -14, 15)
itemreward3countplus:SetText("+")
itemreward3countplus:Hide()
itemreward3countminus:SetSize(12, 12)
itemreward3countminus:SetPoint("TOPRIGHT", itemreward3NameFrame, "RIGHT", -14, -5)
itemreward3countminus:SetText("-")
itemreward3countminus:Hide()

-- Item reward 4
itemreward4:SetSize(36, 36)
itemreward4:SetPoint("LEFT", itemreward3, "RIGHT", 112, 0)
itemreward4NameFrame:SetPoint("LEFT", itemreward4IconTexture, "RIGHT", -10, 0)
itemreward4border:SetTexture("Interface\\Buttons\\UI-Quickslot2")
itemreward4border:SetSize(66, 66)
itemreward4border:SetPoint("CENTER", 1, -1)
itemreward4count:SetJustifyH("RIGHT")
itemreward4count:SetPoint("BOTTOMRIGHT", 2, -2)
itemreward4count:SetText("1")
itemreward4count:Hide()
itemreward4countplus:SetSize(12, 12)
itemreward4countplus:SetPoint("TOPRIGHT", itemreward4NameFrame, "RIGHT", -14, 15)
itemreward4countplus:SetText("+")
itemreward4countplus:Hide()
itemreward4countminus:SetSize(12, 12)
itemreward4countminus:SetPoint("TOPRIGHT", itemreward4NameFrame, "RIGHT", -14, -5)
itemreward4countminus:SetText("-")
itemreward4countminus:Hide()

-- PAGE 2

-- Quest title text (LogTitle)
questtitlepage2:SetPoint("TOPLEFT", 10, -10)
questtitlepage2:SetJustifyH("LEFT")

-- Quest objective text (LogDescription)
questprogresstextpage2:SetPoint("TOPLEFT", questtitlepage2, "BOTTOMLEFT", 0, -5)
questprogresstextpage2:SetJustifyH("LEFT")





footerspacer:SetSize(10, 10)
footerspacer:SetPoint("TOPLEFT", itemreward4, "BOTTOMLEFT", 0, -15)


--frame:Hide()