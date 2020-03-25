local config = {
	id = 'modTopButton',
	name = 'Teleport',
	img = 'button',
	options = {
		['Saffron[FREE]'] = '!teleport Saffron',
		['Singer[VIP]'] = '!teleport Singer',
		['Battle City[VIP]'] = '!teleport Battle City',
		['Hunter Village [VIP]'] = '!teleport Hunter Village',
		['Cerulean [FREE]'] = '!teleport Cerulean',
		['Lavender [FREE]'] = '!teleport Lavender',
		['Fuchsia [FREE]'] = '!teleport Fuchsia',
		['Celadon [FREE]'] = '!teleport Celadon',
		['Viridian [FREE]'] = '!teleport Viridian',
		['Vermilion [FREE]'] = '!teleport Vermilion',
		['Pewter [FREE]'] = '!teleport Pewter',
		['Pallet [FREE]'] = '!teleport Pallet',
		['Cinnabar [FREE]'] = '!teleport Cinnabar',
		['Goldenrod [FREE]'] = '!teleport Goldenrod',
		['Cherrygrove [FREE]'] = '!teleport Cherrygrove',
		['Ecruteak [FREE]'] = '!teleport Ecruteak',
		['Olivine [FREE]'] = '!teleport Olivine',
		['Violet [FREE]'] = '!teleport Violet',
		['Azalea [FREE]'] = '!teleport Azalea',
		['New Bark [FREE]'] = '!teleport New Bark',
		['Mahogany [FREE]'] = '!teleport Mahogany',		
		['Larosse [FREE]'] = '!teleport Larosse',
		['Orre [FREE]'] = '!teleport Orre',	
		['Canavale [FREE]'] = '!teleport Canavale',		
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