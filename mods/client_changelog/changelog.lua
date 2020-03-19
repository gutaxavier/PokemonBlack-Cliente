local changelogWindow = nil
local changelogButton = nil

local changes = {
    [1] = {
        patch = "12.0",
        changes = {
            "* Pokemons corrigidos;",
            "* Fixed Bugs;",
            "* Novas Quests;",
            "* Fixed small bugs on the Map;",
            "* Fixed Bugs;",
            "* Balanced Pokemons;"
        }    
    },

}

function init()
  changelogWindow = g_ui.displayUI('changelog')
  changelogWindow:hide()

  changelogButton = modules.client_topmenu.addLeftButton('changelogButton', tr('Changelog'), 'changelog', toggle)
  
  changelogWindow:breakAnchors()
  changelogWindow:setPosition({x = 100, y = 100})
  changelogWindow.onEnter = hide
  changelogWindow.onEscape = hide
  
  changelogText = changelogWindow:recursiveGetChildById('text')
  local text = ""
  for i = 1, #changes do
    local tmp = changes[i]
    text = string.format("%sUpdate %s\n", text, tmp.patch)
    for j = 1, #tmp.changes do
        text = string.format("%s%s\n", text, tmp.changes[j])
    end
    text = string.format("%s\n", text)
  end
  changelogText:setText(text)
end

function terminate()
  changelogWindow:destroy()
  changelogButton:destroy()
end

function toggle()
    if changelogWindow:isVisible() then
        changelogWindow:hide()
        changelogButton:setOn(false)
    else
        changelogWindow:show()
        changelogButton:setOn(true)
        changelogWindow:focus()
    end
end

function hide()
    changelogWindow:hide()
    changelogButton:setOn(false)
end