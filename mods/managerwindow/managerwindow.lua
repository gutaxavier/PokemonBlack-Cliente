local reloads = {
                'Action',
                'Talkaction',
                'Creatureevent',
                'Globalevent',
                'Monster',
                'NPC',
                'Movements',
                'Raids',
                'Spells',
                'Weapons',
                'Config',
                'All',


                }
local uses = {
             'Clean',
             'Serverdiag',
             'Closeserver',
             'Openserver',
             'Up',
             'Down',
             'Save',
             'Mc',
             'Squelch',
             'Cliport',
             'Notations',
             'Reports',
             'Serverinfo',
			 
             }
function init()
        managerwindow = g_ui.displayUI('managerwindow.otui')
        managerwindow:hide()
        Grupo = UIRadioGroup.create()
        Grupo:addWidget(managerwindow:getChildById("addmagbox"))
        Grupo:addWidget(managerwindow:getChildById("addfistbox"))
        Grupo:addWidget(managerwindow:getChildById("addfishingbox"))
        Grupo:addWidget(managerwindow:getChildById("addshieldbox"))
        Grupo:addWidget(managerwindow:getChildById("adddistancebox"))
        Grupo:addWidget(managerwindow:getChildById("addaxebox"))
        Grupo:addWidget(managerwindow:getChildById("addclubbox"))
        Grupo:addWidget(managerwindow:getChildById("addswordbox"))
        Grupo:addWidget(managerwindow:getChildById("addlevelbox"))
        connect(g_game, 'onTextMessage', serverComunication)
        connect(g_game, { onGameEnd = hide } )
end

function terminate()
        disconnect(g_game, { onGameEnd = hide })
        disconnect(g_game, 'onTextMessage', serverComunication)
        managerwindow:hide()
end

function onoff()
    if managerwindow:isVisible() then
        managerwindow:hide()
    else
        managerwindow:show()
    end
end

function reload()
local menu = g_ui.createWidget('PopupMenu')
    for k, v in ipairs(reloads) do
        menu:addOption(v, function() g_game.talk("/reload "..v) end)
    end
    menu:display()
end

function use()
local use = g_ui.createWidget('PopupMenu')
    for k, v in ipairs(uses) do
        use:addOption(v, function() g_game.talk("/"..v:lower()) end)
    end
    use:display()
end

function ManagerClose()
        managerwindow:hide()
end




function clear()
    managerwindow:getChildById("atext"):setText('')
    managerwindow:getChildById("rtext"):setText('')
    managerwindow:getChildById("mtext"):setText('')
    managerwindow:getChildById("stext"):setText('')
    managerwindow:getChildById("itext"):setText('')
end

function addskill()
    if Grupo:getSelectedWidget() then
        local command = "/addskill "
        local pname = managerwindow:getChildById("nametext"):getText()
        local tadd = string.gsub(Grupo:getSelectedWidget():getId(), "box", "label")
        local ttxt = managerwindow:getChildById(tadd):getText()
        ttxt = ttxt:lower()
 
        if ttxt == "level" then
            g_game.talk(command..pname..", "..ttxt.." 1,"..managerwindow:getChildById("counttext"):getText())
        else
            g_game.talk(command..pname..","..ttxt..", "..managerwindow:getChildById("counttext"):getText())
        end
    end
end

function serverComunication(mode, text)
        if not g_game.isOnline() then
            return
        end

        if mode == MessageModes.Failure then
            if text:find("$@$Administrador") then
                managerButton = modules.client_topmenu.addLeftButton('managerButton', tr('Manager Window'), 'managerwindow', onoff, true)
                managerButton:setOn(false)
                managerButton:setVisible(true)
            end
        end
end

function hide()
    managerwindow:hide()
    managerButton:setVisible(false)
end