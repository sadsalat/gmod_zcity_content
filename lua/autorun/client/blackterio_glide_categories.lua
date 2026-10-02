

if not CLIENT then return end


local CATEGORIES = {
    ["BlackteriosGLIDE"] = {
        name = "Blackterio's Glide",
        icon = "glide/icons/car.png"
    },

    ["BlackteriosGLIDEHeavy"] = {
        name = "Blackterio's Glide: Heavy",
        icon = "entities/glidespawnlists/glideheavyspawnlistblackterio.png"
    },

    ["BlackteriosGLIDEBikes"] = {
        name = "Blackterio's Glide: Bikes",
        icon = "entities/glidespawnlists/motorcycleglidespawnlistblackterio.png"
    },

    ["BlackteriosGLIDEBoats"] = {
        name = "Blackterio's Glide: Boats",
        icon = "glide/icons/boat.png"
    },

    ["BlackteriosGLIDESpecial"] = {
        name = "Blackterio's Glide: Special",
        icon = "entities/glidespawnlists/glidespecialspawnlistblackterio.png"
    }


}


local function IsGlideInstalled()

    if istable( Glide ) then return true end

    return file.Exists( "autorun/sh_glide.lua", "LUA" )
end


local function GetUsedCategories()
    local used = {}

    for _, data in pairs( list.Get( "GlideVehicles" ) or {} ) do
        if istable( data ) and data.Category then
            used[data.Category] = true
        end
    end

    return used
end


hook.Add( "PreReloadToolsMenu", "Blackterio.Glide.RegisterCategories", function()
    if not IsGlideInstalled() then return end

    local used = GetUsedCategories()

    for id, category in pairs( CATEGORIES ) do
        if used[id] then
            list.Set( "GlideCategories", id, {
                name = category.name,
                icon = category.icon
            } )
        end
    end
end )
