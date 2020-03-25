local config = {
	id = 'modTopButton',
	name = 'Teleport',
	img = 'button',
	options = {
		['Saffron'] = '!h saffron',
		['Cerulean'] = '!h singer',
		['Lavender'] = '!h lavender',
		['Fuchsia'] = '!h fuchsia',
		['Celadon'] = '!h celadon',
		['Viridian'] = '!h viridian',
		['Vermilion'] = '!h vermilion',
		['Pewter'] = '!h pewter',
		['Pallet'] = '!h pallet',
		['Cinnabar'] = '!h cinnabar',
		['Snow'] = '!h snow',
		['House Isle'] = '!h house isle',
		['Duos'] = '!h duos',		
	}
}

function init()  
   connect(g_game, { onGameStart = reload, onGameEnd = reload})
   TopButton = modules.client_topmenu.addRightGameToggleButton(config.id, tr(config.name), config.img, toggle, true)
   TopButton:setOn(true)
   reload()
end

function toggle()
  local menu = g_ui.createWidget('PopupMenu')
  for _name, _command in pairs(config.options) do
	menu:addOption(_name, function() g_game.talk(_command) end)
  end
  menu:display()
end

function reload()
	TopButton:setVisible(g_game.isOnline())
end