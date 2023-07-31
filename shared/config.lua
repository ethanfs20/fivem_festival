Config = {}

Config.AcePermission = "festival.admin" -- Ace permission required to use script.

Config.DefaultRadioStation = "RADIO_05_TALK_01" -- Default radio station to play on the emitters.

Config.validStations = {
    "RADIO_02_POP", "RADIO_03_HIPHOP_NEW", "RADIO_09_HIPHOP_OLD",
    "RADIO_27_DLC_PRHEI4", "RADIO_23_DLC_XM19_RADIO", "RADIO_05_TALK_01",
    "RADIO_14_DANCE_02"
}

Config.djbooth = {
    coords = vector3(685.53, 576.36, 130.46),
    heading = 180.0,
    markerRadius = 0.5,
    animDict = "anim@amb@nightclub@dancers@crowddance_facedj@",
    animName = "hi_dance_facedj_09_v2_male^1",
    animDict2 = "anim@amb@nightclub@djs@dixon@",
    animName2 = "dixn_dance_cntr_open_dix"
}

-- Custom emitter data
Config.customEmittersData = {
    {
        coords = vector3(631.01, 559.72, 130.25),
        heading = 27.72,
        emitterName = "SE_DLC_APT_Yacht_Exterior_01"
    }, {
        coords = vector3(717.45, 527.89, 130.25),
        heading = 292.25,
        emitterName = "SE_DLC_APT_Yacht_Exterior_02"
    }, {
        coords = vector3(663.31, 520.25, 131.85),
        heading = 208.27,
        emitterName = "SE_DLC_APT_Yacht_Exterior_03"
    }, {
        coords = vector3(665.35, 519.72, 131.85),
        heading = 105.82,
        emitterName = "SE_Script_Placed_Prop_Emitter_Boombox"
    }, {
        coords = vector3(682.17, 566.39, 129.05),
        heading = 158.32,
        emitterName = "SE_DLC_BTL_Yacht_Exterior_01"
    }, {
        coords = vector3(675.21, 546.73, 129.45),
        heading = 158.32,
        emitterName = "SE_ba_dlc_club_exterior"
    }
    -- Add more custom emitters with their specific coordinates, headings, and emitter names here
}

Config.PedList = {
    Security = {
        {
            model = "mp_m_securoguard_01",
            coords = vector3(652.11, 581.22, 129.05),
            heading = 40.94,
            scenario = "WORLD_HUMAN_CLIPBOARD",
        }, {
            model = "mp_m_securoguard_01",
            coords = vector3(655.54, 578.42, 129.05),
            heading = 40.94,
            scenario = "WORLD_HUMAN_GUARD_STAND_CASINO"
        }, {
            model = "mp_m_securoguard_01",
            coords = vector3(651.98, 575.6, 129.05),
            heading = 358.92,
            scenario = "WORLD_HUMAN_GUARD_STAND_CASINO"
        }
    },
    Stage = {
        {
            model = "a_m_m_mlcrisis_01",
            coords = vector3(683.86, 578.21, 130.46),
            heading = 201.12,
            scenario = "WORLD_HUMAN_PARTYING"
        }, {
            model = "a_m_y_gencaspat_01",
            coords = vector3(688.31, 575.95, 130.46),
            heading = 142.2,
            scenario = "WORLD_HUMAN_PARTYING"
        }
    },
    Grounds = {}
}
