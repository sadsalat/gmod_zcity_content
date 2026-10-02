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

ENT.PrintName = "Renault Trafic T1000-D" -- model name in spawnlist
ENT.GlideCategory = "BlackteriosGLIDE" -- category (defined in the lua file)
ENT.ChassisModel = "models/blackterios_glide_vehicles/renaulttrafict1000d/renaulttrafict1000d.mdl" -- model 

ENT.Author = "Blackterio" -- Author

ENT.IconOverride = "entities/renaulttrafict1000d_blackterio.png" -- spawnlist icon, always in the materials/entities folder

DEFINE_BASECLASS( "base_glide_car" ) -- strictly necessary if you wanna make support for custom anims (for example speedometers or tachometers)

-- =========================
-- Start of plate parameters
-- =========================

local plateCustomText = ""
local platestypes = {"argold", "argvintage", "europeplates"}

ENT.LicensePlateConfigs = {
    
    { 
		id = "rear_main",
		position = Vector(-81.5, 14.5, 31),
		angles = Angle(-20, 180, 0),
		modelRotation = Angle(0, 0, 0),
		plateType = platestypes, 
		customText = plateCustomText
    },    
    { 
		id = "front_main",
		position = Vector(109.1, 0, 17.8),
		angles = Angle(0, 0, 0),
		modelRotation = Angle(0, 0, 0),
		plateType = platestypes, 
		customText = plateCustomText
    }


}

ENT.LicensePlateAdvancedConfigs = {
 
    { 
		id = "front_main", 
        bodygroup = {17,2},  
		platetoggle = true 
    },  
    { 
		id = "rear_main", 
		bone = "doorr_l", 
        bodygroup = {16,1},  
		platetoggle = true 
    }, 
}

-- =======================
-- End of plate parameters
-- =======================

local DRIVER_POSE_DATA = {
    ["ValveBiped.Bip01_L_Thigh"] = Angle( 0, 20, 0 ),
    ["ValveBiped.Bip01_L_Calf"] = Angle( 10, -15, 0 ),
    ["ValveBiped.Bip01_R_Thigh"] = Angle( 15, 15, 0  ),
    ["ValveBiped.Bip01_R_Calf"] = Angle( -10, -15, -0 ),
	
    ["ValveBiped.Bip01_Spine2"] = Angle( 0, 5, 0 ),

}

local POSE_DATA = {

    ["ValveBiped.Bip01_L_Thigh"] = Angle( -5, 15, 0 ),
    ["ValveBiped.Bip01_L_Calf"] = Angle( 10, -35, 0 ),
    ["ValveBiped.Bip01_R_Thigh"] = Angle( 5, 15, 0  ),
    ["ValveBiped.Bip01_R_Calf"] = Angle( -10, -35, -0 ),
	
    ["ValveBiped.Bip01_R_Foot"] = Angle( -25, -0, -0 ),

}
local POSE2_DATA = {

    ["ValveBiped.Bip01_L_Thigh"] = Angle( 25, 10, 0 ),
    ["ValveBiped.Bip01_L_Calf"] = Angle( 10, -15, 0 ),
    ["ValveBiped.Bip01_R_Thigh"] = Angle( 15, 5, 0  ),
    ["ValveBiped.Bip01_R_Calf"] = Angle( -10, -15, -0 ),

}
local POSE3_DATA = {
    ["ValveBiped.Bip01_L_Thigh"] = Angle( -0, -32, 0 ),
    ["ValveBiped.Bip01_L_Calf"] = Angle( -1, 35, 20 ),
    ["ValveBiped.Bip01_R_Thigh"] = Angle( -0, -32, 0  ),
    ["ValveBiped.Bip01_R_Calf"] = Angle( -1, 35, -20 ),    
	
	["ValveBiped.Bip01_R_UpperArm"] = Angle( 10, -25, 10  ),
	["ValveBiped.Bip01_R_Hand"] = Angle( 10, -25, 10  ),
	
	["ValveBiped.Bip01_L_UpperArm"] = Angle( -20, -25, -10  ),
	["ValveBiped.Bip01_L_Hand"] = Angle( -25, -25, -10  ),

}
if CLIENT then


function ENT:GetSeatBoneManipulations( seatIndex )
    if seatIndex == 2 then
        return POSE_DATA
    end       
	if seatIndex == 3 then
        return POSE2_DATA
    end   
	if seatIndex >= 4 then
        return POSE3_DATA
    end
	return DRIVER_POSE_DATA
end

    ENT.CameraOffset = Vector( -190, 0, 50 ) -- camera position (x,y,z)
    ENT.CameraAngleOffset = Angle( 5, 0, 0 ) -- camera angle
	ENT.CameraCenterOffset = Vector( 0, 0, 32 )
	
    ENT.ExhaustAlpha = 50 -- exhaust smoke transparency (lower = more transparent)
	
	ENT.HornSound = "glide/horns/car_horn_med_1.wav"
	ENT.ExhaustPopSound = ""	-- remove this if you want to enable exhaust pop
	
    ENT.ExhaustOffsets = { -- exhaust smoke positions (can be multiple)
	
        { pos = Vector( -78.393,20.448,12.922 ), scale = 2 },
    }

    ENT.EngineSmokeStrips = { -- engine damage smoke positions (can be multiple)
	
        { offset = Vector( 104.114, 0, 31.553 ), angle = Angle( -55, 0, 0 ), width = 45 },

    }

    ENT.EngineFireOffsets = { -- engine damage fire positions (can be multiple)

        { offset = Vector(  90.656, 0, 36.722 ), angle = Angle( 0, 90, 0 ) }, 
    }

    ENT.Headlights = { -- headlight positions (light source) (can be multiple)
	
        { offset = Vector( 99.683,28.277,30.225 ) }, -- left

        { offset = Vector( 99.683,-28.277,30.225 ) }, -- right		
	


    }

    ENT.LightSprites = { -- lights positions (light sprites)

-- brake lights

        { type = "brake", offset = Vector( -83.534,34.175,26.124 ), dir = Vector( -1, 0, 0 ), size = 40 },
        { type = "brake", offset = Vector( -83.534,-34.175,26.124 ), dir = Vector( -1, 0, 0 ), size = 40 }, 
         

-- reverse lights

        { type = "reverse", offset = Vector( -83.534,34.275,28.724 ), dir = Vector( -1, 0, 0 ), size = 30 },
        { type = "reverse", offset = Vector( -83.534,-34.275,28.724 ), dir = Vector( -1, 0, 0 ), size = 30 },	
		
-- headlights		
		--low	
        { type = "headlight", offset = Vector( 99.683,28.277,30.225 ), dir = Vector( 1, 0, 0 ), size = 60 },
        { type = "headlight", offset = Vector( 99.683,-28.277,30.225 ), dir = Vector( 1, 0, 0 ), size = 60 },       

		{ type = "headlight", offset = Vector( 99.683,28.277,30.225 ), dir = Vector( 1, 0, 0 ), size = 40 },
        { type = "headlight", offset = Vector( 99.683,-28.277,30.225 ), dir = Vector( 1, 0, 0 ), size = 80 },		
		
		--high
        { type = "headlight", offset = Vector( 99.683,28.277,30.225 ), dir = Vector( 1, 0, 0 ), size = 80, beamType = "high" },
        { type = "headlight", offset = Vector( 99.683,-28.277,30.225 ), dir = Vector( 1, 0, 0 ), size = 80, beamType = "high" },       

		{ type = "headlight", offset = Vector( 99.683,28.277,30.225 ), dir = Vector( 1, 0, 0 ), size = 80, beamType = "high" },
        { type = "headlight", offset = Vector( 99.683,-28.277,30.225 ), dir = Vector( 1, 0, 0 ), size = 80, beamType = "high" },
		
-- rear lights 

		{ type = "taillight", offset = Vector( -83.534,34.575,34.024 ), dir = Vector( -1, 0, 0 ), size = 30 },   
		{ type = "taillight", offset = Vector( -83.534,-34.575,34.024 ), dir = Vector( -1, 0, 0 ), size = 30},		
		
-- turn signals		
		--front
		{ type = "signal_left", offset = Vector( 95.776,35.683,30.007 ), dir = Vector( 1, 1, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 30 },
        { type = "signal_right", offset = Vector( 95.776,-35.683,30.007 ), dir = Vector( 1, -1, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 30 },		
		
		--rear
		
		{ type = "signal_left", offset = Vector( -83.534,34.575,30.924 ), dir = Vector( -1, 0, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 30 },
		{ type = "signal_right", offset = Vector( -83.534,-34.575,30.924 ), dir = Vector( -1, 0, 0 ), color = Glide.DEFAULT_TURN_SIGNAL_COLOR, size = 30 },

	
-- dash glow
        { type = "taillight", offset = Vector( 64.841,25.087,52.535 ), dir = Vector( -1, 0, 0 ), color = (Color(255,255,0,5)), size = 30, lightRadius = 40  },	
        { type = "taillight", offset = Vector( 64.841,16.887,52.535 ), dir = Vector( -1, 0, 0 ), color = (Color(255,255,0,5)), size = 30, lightRadius = 40  },	
		
    }

    function ENT:OnCreateEngineStream( stream )
        stream.offset = Vector( 90.656, 0, 36.722 ) -- vehicle position where sounds are emited
        stream:LoadPreset( "RenaultTraficT1000d_Blackterio" ) -- sounds .json file NAME (located on the data_static/glide/stream_presets/ folder)
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
    pedals = true,
    clutch = true,
    speedo = true,
    fuel = true,
    tacho = false,
    oil = false,
    temp = false,
    battery = false,
    wipers = true,	
			
    -- Pedals lerp
    pedalLerpRate = 0.2,
    
    -- Clutch duration (lerp)
    clutchDuration = 0.4,
	
    -- Speedometer calibration and multiplier	
    speedCalibration = 50,
    speedMultiplier = 0.7,
    
    -- Fuel lerp
    fuelLerpRate = 0.09,
	
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
        self:PhysicsInit( SOLID_VPHYSICS, Vector( 10, -0, 15 ) ) -- Center of mass (X Y Z)
    end
	
    ENT.SpawnPositionOffset = Vector( 0, 0, 20 ) -- spawn offset 
    ENT.ChassisMass = 800 -- weight of the vehicle
    ENT.IsHeavyVehicle = false -- if it is a heavy vehicle set this to true

    ENT.BurnoutForce = 50
    ENT.UnflipForce = 50 -- force when unflipping the vehicle

    -- force to apply when trying to spin the vehicle while in air (jumping from a ramp for example)
    ENT.AirControlForce = Vector( 0.5, 0.3, 0.5 ) -- Roll, pitch, yaw

    -- velocity of the above
    ENT.AirMaxAngularVelocity = Vector( 250, 220, 250 ) -- Roll, pitch, yaw

    function ENT:GetGears() -- gears
        return {
		
		-- higher = shorter
		
            [-1] = 2, -- Reverse
            [0] = 0, -- Neutral (this number has no effect)
            [1] = 2.2,
            [2] = 1.4,
            [3] = 0.9,
            [4] = 0.65,
            [5] = 0.5,

			
        }
	    end	
		    ENT.LightBodygroups = {
			
	    { type = "headlight", bodyGroupId = 1, subModelId = 1 },  -- Headlights				
	    { type = "headlight", bodyGroupId = 2, subModelId = 1 }, -- Tail lights

 		
        { type = "brake", bodyGroupId = 3, subModelId = 1 },
        { type = "reverse", bodyGroupId = 4, subModelId = 1 },
        { type = "signal_left", bodyGroupId = 5, subModelId = 1 },
        { type = "signal_right", bodyGroupId = 6, subModelId = 1 },
		
		--Interior


		{ type = "headlight", bodyGroupId = 7, subModelId = 1 },  -- Speed
		{ type = "headlight", bodyGroupId = 8, subModelId = 1 },  -- Temp
		{ type = "headlight", bodyGroupId = 9, subModelId = 1 },  -- Fuel
		{ type = "headlight", bodyGroupId = 10, subModelId = 1 },  -- Dash

    }	

	
    function ENT:CreateFeatures()
	
        self.engineBrakeTorque = 2000

		-- self:SetColor( Color( 255, 255, 255, 255 ) ) -- set the default color (also disables random colors on spawn) (RGBA)

        self:SetSpringStrength( 350 ) -- suspension strength
        self:SetSpringDamper( 2000 ) -- suspension bounciness

        self:SetSuspensionLength( 14 ) -- suspension height

        self:SetDifferentialRatio( 1.0 ) -- higher = shorter
        self:SetTransmissionEfficiency( 0.7 )
        self:SetPowerDistribution( 1 ) -- 1 = front, 0 = all, -1 = back
        self:SetBrakePower( 3000 ) -- brakes intensity

        self:SetMinRPMTorque( 1000 )
        self:SetMaxRPMTorque( 2200 )
        self:SetMinRPM( 1000 ) 
        self:SetMaxRPM( 4000 ) 

        self:SetMaxSteerAngle( 45 ) -- max steer angle
        self:SetSteerConeChangeRate( 6 ) -- steer speed
        self:SetSteerConeMaxSpeed( 1000 ) -- steer max speed in high speeds
        self:SetSteerConeMaxAngle( 0.20 ) -- steer angle in high speeds
		self:SetCounterSteer ( 0.8 )

        self:SetForwardTractionMax( 2000 ) -- max forward traction
        self:SetSideTractionMultiplier( 20 ) -- side traction multiplier
        self:SetSideTractionMaxAng( 5 ) -- side traction max angle
        self:SetSideTractionMax( 2000 ) -- max side traction 
        self:SetSideTractionMin( 1800 ) -- min side traction
		
		self:SetTurboCharged( false ) -- turbo: false = disabled, true = enabled
		self:SetFastTransmission( false ) 



-- seats (can be multiple). FIRST IS ALWAYS THE DRIVER SEAT

	-- positions, angle and exit point. If exit point set to false will use last values
	
        self:CreateSeat( Vector( 22.0,22,30 ), Angle( 0, -90, 0 ), Vector( 50.0,75,50 ), true ) -- driver
		
        self:CreateSeat( Vector( 35, -22, 30 ), Angle( 0, -90, 12 ), Vector( 50.0,-75,50 ), true )       
        self:CreateSeat( Vector( 35, -3, 30 ), Angle( 0, -90, 12 ), Vector( 50.0,-80,50 ), true )  
		
		self:CreateSeat( Vector( -57, -28, 19 ), Angle( 0, -0, 5 ), Vector( -38.0,-75,50 ), true )
		self:CreateSeat( Vector( -50, 28, 19 ), Angle( 0, 180, 5 ), Vector( -38.0,75,50 ), true )



-- wheels

	-- if you want the wheel to steer put steerMultiplier = number on the desired wheel (as seen on the front wheels)

        -- Front left
        self:CreateWheel( Vector( 71.0,37,24.0 ), {
            model = "models/blackterios_glide_vehicles/renaulttrafict1000d/renaulttrafict1000dwheel.mdl",
            modelAngle = Angle( 0, 180, 0 ),
            useModelSize = true,
            steerMultiplier = 1,
        } )

        -- Front right
        self:CreateWheel( Vector( 71.0,-37,24.0 ), {
            model = "models/blackterios_glide_vehicles/renaulttrafict1000d/renaulttrafict1000dwheel.mdl",
            modelAngle = Angle( 0, 0, 0 ),
            useModelSize = true,
            steerMultiplier = 1,
        } )

        -- Rear left 
        self:CreateWheel( Vector( -51.5,37.0,23.0 ), {
            model = "models/blackterios_glide_vehicles/renaulttrafict1000d/renaulttrafict1000dwheel.mdl",
            modelAngle = Angle( 0, 180, 0 ),
            useModelSize = true,

        } )

        -- Rear right 
        self:CreateWheel( Vector(-51.5,-37.0,23.0 ), {
            model = "models/blackterios_glide_vehicles/renaulttrafict1000d/renaulttrafict1000dwheel.mdl",
            modelAngle = Angle( 0, 0, 0 ),
            useModelSize = true,

        } )        

    end
	
end

