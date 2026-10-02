AddCSLuaFile()
AddCSLuaFile()

-- Load Blackterio's Glide Extra Functions LUA file
local function LoadExtraFunctions()
    local paths = {
        "autorun/shared/blackterio_extra_functions.lua",
        "lua/autorun/shared/blackterio_extra_functions.lua",
        "blackterio_extra_functions.lua"
    }
      
    for _, path in ipairs(paths) do
        if file.Exists(path, "LUA") then
            if SERVER then
                AddCSLuaFile(path)
            end
            include(path)
            return true
        end
    end
    return false
end

local extraFunctionsLoaded = LoadExtraFunctions()

local ItHasExtraFunctions = true -- with this you can activate the custom extra functions on this vehicle (pedals, gauges, etc) 

ENT.Type = "anim"
ENT.Base = "base_glide_car" -- type of glide vehicle

ENT.PrintName = "Fiat Duna" -- model name in spawnlist
ENT.GlideCategory = "BlackteriosGLIDE" -- category (defined in the lua file)
ENT.ChassisModel = "models/blackterios_glide_vehicles/fiatduna/fiatduna.mdl" -- model 

ENT.Author = "Blackterio" -- Author

ENT.IconOverride = "entities/fiatduna_blackterio.png" -- spawnlist icon, always in the materials/entities folder

DEFINE_BASECLASS( "base_glide_car" ) -- strictly necessary if you wanna make support for custom anims (for example speedometers or tachometers)

-- =========================
-- Start of plate parameters
-- =========================

local plateCustomText = ""
local platestypes = {"mercosurplates", "argold", "europeitaly"}

ENT.LicensePlateConfigs = {
    
    { 
		id = "rear_main",
		position = Vector(-75, 0, 28),
		angles = Angle(0, 180, 0),
		modelRotation = Angle(0, 0, 0),
		plateType = platestypes, 
		customText = plateCustomText
    },    
    { 
		id = "front_main",
		position = Vector(98.5, 0, 16.5),
		angles = Angle(0, 0, 0),
		modelRotation = Angle(0, 0, 0),
		plateType = platestypes, 
		customText = plateCustomText
    }


}

ENT.LicensePlateAdvancedConfigs = {
 
    { 
		id = "front_main", 
        bodygroup = {16,2},  
		platetoggle = true 
    },  
    { 
		id = "rear_main", 
		bone = "trunk", 
        bodygroup = {15,1},  
		platetoggle = true 
    }, 
}

-- =======================
-- End of plate parameters
-- =======================

local POSE_DATA = {
    ["ValveBiped.Bip01_L_Thigh"] = Angle( -0, 3, 0 ),
    ["ValveBiped.Bip01_L_Calf"] = Angle( -1, -25, 20 ),
    ["ValveBiped.Bip01_R_Thigh"] = Angle( -0, 3, 0  ),
    ["ValveBiped.Bip01_R_Calf"] = Angle( -1, -25, -20 ),

}

if CLIENT then


function ENT:GetSeatBoneManipulations( seatIndex )
    if seatIndex > 1 then
        return POSE_DATA
    end
    
end
    ENT.CameraOffset = Vector( -160, 0, 30 ) -- camera position (x,y,z)
    ENT.CameraAngleOffset = Angle( 5, 0, 0 ) -- camera angle
	ENT.CameraCenterOffset = Vector( 0, 0, 32 )
    ENT.ExhaustAlpha = 50 -- exhaust smoke transparency (lower = more transparent)
	
	ENT.ExhaustPopSound = ""	-- remove this if you want to enable exhaust pop		
	ENT.HornSound = "glide/horns/car_horn_light_1.wav"	
	
    ENT.ExhaustOffsets = { -- exhaust smoke positions (can be multiple)

        { pos = Vector( -71.269,18.304,9.736 ), scale = 1.5, ifBodygroupId = 25, ifSubModelId = 0 },
        { pos = Vector( 48.646,1.186,8.3 ), scale = 3, ifBodygroupId = 25, ifSubModelId = 1, angle = Angle( -50, 0, 0 ) },

    }

    ENT.EngineSmokeStrips = { -- engine damage smoke positions (can be multiple)
	
        { offset = Vector( 95.591, 0, 27.532 ), angle = Angle( -20, 0, 0 ), width = 25 },

    }

    ENT.EngineFireOffsets = { -- engine damage fire positions (can be multiple)

        { offset = Vector( 79.227, 0, 27.533 ), angle = Angle( 0, 90, 0 ) }, 
    }

    ENT.Headlights = { -- headlight positions (light source) (can be multiple)
	
        { offset = Vector( 95.695,19.246,27.779 ) }, -- left
        { offset = Vector( 95.695,-19.246,27.779 ) }, -- right		


    }

    ENT.LightSprites = { -- lights positions (light sprites)

-- brake lights

        { type = "brake", offset = Vector( -73.417,28.45,28.89 ), dir = Vector( -1, 0, 0 ), size = 40 },
        { type = "brake", offset = Vector( -73.417,-28.45,28.89 ), dir = Vector( -1, 0, 0 ), size = 40 },           



-- reverse lights

        { type = "reverse", offset = Vector( -75.06,22.984,28.136 ), dir = Vector( -1, 0, 0 ), size = 40 },
        { type = "reverse", offset = Vector( -75.06,-22.984,28.136 ), dir = Vector( -1, 0, 0 ), size = 40 },	       
	
		
-- headlights		
	--low		
        { type = "headlight", offset = Vector( 95.695,19.246,27.779 ), dir = Vector( 1, 0, 0 ), size = 50 },
        { type = "headlight", offset = Vector( 95.695,-19.246,27.779 ), dir = Vector( 1, 0, 0 ), size = 50  },	        
		
		{ type = "headlight", offset = Vector( 95.495,23.758,27.779 ), dir = Vector( 1, 0, 0 ), size = 40 },
        { type = "headlight", offset = Vector( 95.495,-23.758,27.779 ), dir = Vector( 1, 0, 0 ), size = 40  },		


	--high
        { type = "headlight", offset = Vector( 95.695,19.246,27.779 ), dir = Vector( 1, 0, 0 ), size = 40, beamType = "high"  },
        { type = "headlight", offset = Vector( 95.695,-19.246,27.779 ), dir = Vector( 1, 0, 0 ), size = 40, beamType = "high"   },			
		
-- rear lights 

        { type = "taillight", offset = Vector( -73.417,28.45,28.89 ), dir = Vector( -1, 0, 0 ), size = 40 },
        { type = "taillight", offset = Vector( -73.417,-28.45,28.89 ), dir = Vector( -1, 0, 0 ), size = 40 },     

		
-- turn signals		

		--front
		{ type = "signal_left", offset = Vector( 92.527,30.598,27.914 ), dir = Vector( 1, 1, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 20 },	
        { type = "signal_right", offset = Vector( 92.527,-30.598,27.914 ), dir = Vector( 1, -1, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 20 },		
		
		--side 1
		{ type = "signal_left", offset = Vector( 52.098,33.706,31.252 ), dir = Vector( 0.5, 1, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 20, lightRadius = 40 },	
        { type = "signal_right", offset = Vector( 52.098,-33.706,31.252 ), dir = Vector( 0.5, -1, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 20, lightRadius = 40 },	
		
		--rear
		{ type = "signal_left", offset = Vector( -73.417,28.45,34.09 ), dir = Vector( -1, 1, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 20 },	
        { type = "signal_right", offset = Vector( -73.417,-28.45,34.09 ), dir = Vector( -1, -1, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 20 },		
		
		{ type = "signal_left", offset = Vector( -74.717,24.25,34.09 ), dir = Vector( -1, 1, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 20 },	
        { type = "signal_right", offset = Vector( -74.717,-24.25,34.09 ), dir = Vector( -1, -1, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 20 },
		
    }

    function ENT:OnCreateEngineStream( stream )
        stream.offset = Vector( 79.227, 0, 27.533 ) -- vehicle position where sounds are emited
        stream:LoadPreset( "FiatDuna_Blackterio" ) -- sounds .json file NAME (located on the data_static/glide/stream_presets/ folder)
    end
	
-- Extra functions (animations)

		-- Extra functions activator
    function ENT:Initialize()
        BaseClass.Initialize(self)
		self.HasExtraFunctions = ItHasExtraFunctions
    end
 
function ENT:OnUpdateAnimations()
 if BlackterioExtraFunctions and extraFunctionsLoaded then
    if self.HasExtraFunctions then
        -- Use a custom configuration for this vehicle in particular, or use the default configuration
		-- I highly recommend using a custom one
		
		
	    -- Optional: Configure special parameters for this vehicle
        -- Build the config only once (it used to be rebuilt every frame)
        if not self.AnimationConfig then
        self.AnimationConfig = BlackterioExtraFunctions:CreateConfig({
		
    -- Activate/deactivate functions		
    pedals = false,
    clutch = false,
    speedo = true,
    fuel = true,
    tacho = false,
    oil = false,
    temp = true,
    battery = false,
    wipers = true,
	

	
    -- Speedometer calibration and multiplier	
    speedCalibration = 50,
    speedMultiplier = 0.7,
    
    -- Fuel lerp
    fuelLerpRate = 0.09,
	
	-- Temperature lerp and max value
    tempLerpRate = 0.0005,
    tempMaxValue = 0.5,
	
    -- Wiper Speed
    wiperSpeed = 0.3,
    
   --[[  Pose parameters names. You can change them if they're different than these ones.
    poseParameters = {
        gas = "gas",
        brake = "brake",
        clutch = "clutch",
        speedo = "speedo",
        tacho = "tacho",
        fuel = "fuel",
        oil = "oil",
        temp = "temp",
        battery = "battery",
        wipers1 = "wipers1",
        wipers2 = "wipers2",
        wipers3 = "wipers3",
        wipers4 = "wipers4"
    }
	]] 
        })
        end

        BlackterioExtraFunctions:UpdateAnimations(self, self.AnimationConfig)
	
		
    else
        BaseClass.OnUpdateAnimations(self)
    end
	else
	BaseClass.OnUpdateAnimations(self) 
end

end
end

if SERVER then

    function ENT:InitializePhysics()
        self:SetSolid( SOLID_VPHYSICS )
        self:SetMoveType( MOVETYPE_VPHYSICS )
        self:PhysicsInit( SOLID_VPHYSICS, Vector( 10, 0, 10 ) ) -- Center of mass (X Y Z)
    end
	
    ENT.SpawnPositionOffset = Vector( 0, 0, 20 ) -- spawn offset 
    ENT.ChassisMass = 900 -- weight of the vehicle
    ENT.IsHeavyVehicle = false -- if it is a heavy vehicle set this to true

    ENT.BurnoutForce = 30
    ENT.UnflipForce = 30 -- force when unflipping the vehicle

    -- force to apply when trying to spin the vehicle while in air (jumping from a ramp for example)
    ENT.AirControlForce = Vector( 0.5, 0.3, 0.5 ) -- Roll, pitch, yaw

    -- velocity of the above
    ENT.AirMaxAngularVelocity = Vector( 50, 100, 50 ) -- Roll, pitch, yaw

    function ENT:GetGears() -- gears
        return {
		
		-- higher = shorter
		
            [-1] = 2, -- Reverse
            [0] = 0, -- Neutral (this number has no effect)
            [1] = 1.6,
            [2] = 1.0,
            [3] = 0.65,
            [4] = 0.5,
            [5] = 0.35
			
        }
		
		
    end
	
	    ENT.LightBodygroups = {
		
        { type = "brake_or_taillight", bodyGroupId = 3, subModelId = 1 },
        { type = "reverse", bodyGroupId = 6, subModelId = 1 },
        { type = "headlight", bodyGroupId = 1, subModelId = 1 },  -- Headlights
        { type = "headlight", bodyGroupId = 2, subModelId = 1 },  -- Headlights interior
        { type = "headlight", bodyGroupId = 7, subModelId = 1 },  -- speedo
        { type = "headlight", bodyGroupId = 8, subModelId = 1 },  -- fuel
        { type = "headlight", bodyGroupId = 9, subModelId = 1 },  -- temp
        { type = "signal_left", bodyGroupId = 4, subModelId = 1 },
        { type = "signal_right", bodyGroupId = 5, subModelId = 1 }
    }
    function ENT:CreateFeatures()
	

        self.engineBrakeTorque = 2000

		-- self:SetColor( Color( 255, 255, 255, 255 ) ) -- set the default color (also disables random colors on spawn) (RGBA)

        self:SetSpringStrength( 700 ) -- suspension strength
        self:SetSpringDamper( 3000 ) -- suspension bounciness

        self:SetSuspensionLength( 18 ) -- suspension height

        self:SetDifferentialRatio( 1.5 ) -- higher = shorter
        self:SetTransmissionEfficiency( 0.8 )
        self:SetPowerDistribution( 1 ) -- 1 = front, 0 = all, -1 = back
        self:SetBrakePower( 2500 ) -- brakes intensity

        self:SetMinRPMTorque( 1200 )
        self:SetMaxRPMTorque( 1300 )
        self:SetMinRPM( 800 ) 
        self:SetMaxRPM( 6000 ) 

        self:SetMaxSteerAngle( 45 ) -- max steer angle
        self:SetSteerConeChangeRate( 5 ) -- steer speed
        self:SetSteerConeMaxSpeed( 1000 ) -- steer max speed in high speeds
        self:SetSteerConeMaxAngle( 0.20 ) -- steer angle in high speeds
		self:SetCounterSteer ( 0.8 )

        self:SetForwardTractionMax( 1800 ) -- max forward traction
        self:SetSideTractionMultiplier( 25 ) -- side traction multiplier
        self:SetSideTractionMaxAng( 25 ) -- side traction max angle
        self:SetSideTractionMax( 1500 ) -- max side traction 
        self:SetSideTractionMin( 1000 ) -- min side traction
		
		self:SetTurboCharged( false ) -- turbo: false = disabled, true = enabled
		self:SetFastTransmission( false ) 



-- seats (can be multiple). FIRST IS ALWAYS THE DRIVER SEAT

	-- positions, angle and exit point position.
	
        self:CreateSeat( Vector( 2.0,15,10 ), Angle( 0, -90, 0 ), Vector( -0.0,60,50 ), true ) -- driver
		
        self:CreateSeat( Vector( 15, -15, 10 ), Angle( 0, -90, 12 ), Vector( -0.0,-60,50 ), true )     
		
		self:CreateSeat( Vector( -20, -15, 13 ), Angle( 0, -90, 12 ), Vector( -38.0,-60,50 ), true )
		self:CreateSeat( Vector( -20, 15, 13 ), Angle( 0, -90, 12 ), Vector( -38.0,60,50  ), true )
		self:CreateSeat( Vector( -20, 0, 13 ), Angle( 0, -90, 12 ), Vector( -38.0,60,50  ), true )


-- wheels

	-- if you want the wheel to steer put steerMultiplier = number on the desired wheel (as seen on the front wheels)

        -- Front left
        self:CreateWheel( Vector( 67.0,29.5,26.0 ), {
            model = "models/blackterios_glide_vehicles/fiatduna/fiatdunawheel.mdl",
            modelAngle = Angle( 0, 180, 0 ),
            useModelSize = true,
            steerMultiplier = 1,
        } )

        -- Front right
        self:CreateWheel( Vector( 67.0,-29.5,26.0 ), {
            model = "models/blackterios_glide_vehicles/fiatduna/fiatdunawheel.mdl",
            modelAngle = Angle( 0, 0, 0 ),
            useModelSize = true,
            steerMultiplier = 1,
        } )

        -- Rear left 
        self:CreateWheel( Vector( -37.8,29.5,24.0 ), {
            model = "models/blackterios_glide_vehicles/fiatduna/fiatdunawheel.mdl",
            modelAngle = Angle( 0, 180, 0 ),
            useModelSize = true,

        } )

        -- Rear right 
        self:CreateWheel( Vector( -37.8,-29.5,24.0 ), {
            model = "models/blackterios_glide_vehicles/fiatduna/fiatdunawheel.mdl",
            modelAngle = Angle( 0, 0, 0 ),
            useModelSize = true,

        } )        

        self:ChangeWheelRadius( 13 ) -- wheel size
    end
	
end

