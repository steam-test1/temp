
function GenericDLCManager:has_flm()
	return self:is_dlc_unlocked("flm")
end

function GenericDLCManager:has_tjp()
	return self:is_dlc_unlocked("tjp")
end

function GenericDLCManager:has_toon()
	return self:is_dlc_unlocked("toon")
end

function WINDLCManager:init_generated()
	Global.dlc_manager.all_dlc_data.flm = {}
	Global.dlc_manager.all_dlc_data.flm.app_id = "218620"
	Global.dlc_manager.all_dlc_data.flm.no_install = true
	Global.dlc_manager.all_dlc_data.tjp = {}
	Global.dlc_manager.all_dlc_data.tjp.app_id = "218620"
	Global.dlc_manager.all_dlc_data.tjp.no_install = true
	Global.dlc_manager.all_dlc_data.toon = {}
	Global.dlc_manager.all_dlc_data.toon.app_id = "218620"
	Global.dlc_manager.all_dlc_data.toon.no_install = true
end
