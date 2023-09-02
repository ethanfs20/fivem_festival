Config = {}

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

-- Speakers data
Config.speakers = {
    {
        coords = vector3(-1383.93, -616.23, 30.82),
        heading = 120.32,
        emitterType = "SE_DLC_BTL_Yacht_Exterior_01",
        model = "stt_prop_speakerstack_01a",
        name = "Speaker 1 | Main"
    }, {
    coords = vector3(-1387.77, -626.02, 30.82),
    heading = 151.61,
    emitterType = "SE_DLC_APT_Yacht_Exterior_01",
    model = "stt_prop_speakerstack_01a",
    name = "Speaker 2 | Main"
}, {
    coords = vector3(-1392.62, -595.32, 30.32),
    heading = 166.82 - 180,
    emitterType = "SE_DLC_APT_Yacht_Exterior_02",
    model = "stt_prop_speakerstack_01a",
    name = "Speaker 3 | Main"
}, {
    coords = vector3(-1390.39, -611.73, 30.32),
    heading = 208.27,
    emitterType = "SE_DLC_APT_Yacht_Exterior_03",
    model = "stt_prop_speakerstack_01a",
    name = "Speaker 4 | Main"
}, {
    coords = vector3(-1381.1, -619.33, 30.82),
    heading = 81.25 - 180,
    emitterType = "SE_Script_Placed_Prop_Emitter_Boombox",
    model = "stt_prop_speakerstack_01a",
    name = "Speaker 5 | Bass 1"
}, {
    coords = vector3(-1385.07, -612.21, 30.82),
    heading = 158.32 - 180,
    emitterType = "SE_ba_dlc_club_exterior",
    model = "stt_prop_speakerstack_01a",
    name = "Speaker 6 | Bass 2"
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
