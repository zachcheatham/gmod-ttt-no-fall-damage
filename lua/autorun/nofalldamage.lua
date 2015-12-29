EQUIP_NOFALL = 8

local function init()
	local nfd = {
		id 			= EQUIP_NOFALL,
		loadout 	= false,
		type		= "item_passive",
		material 	= "vgui/ttt/icon_foot",
		name 		= "Titanium Legs",
		desc 		= "Prevents damage incountered when hitting the\nground hard."
	}

	table.insert(EquipmentItems[ROLE_DETECTIVE], nfd)
end
hook.Add("Initialize", "NoFallDamage", init)

local function entityTakeDamage(ent, dmg)
	if ent:IsPlayer() and ent:HasEquipmentItem(EQUIP_NOFALL) and dmg:IsFallDamage() then
		return true
	end
end
hook.Add("EntityTakeDamage", "NoFallDamage", entityTakeDamage)