set_global_assignment -entity "AudioPLL" -library "lib_AudioPLL" -name IP_TOOL_NAME "altera_pll"
set_global_assignment -entity "AudioPLL" -library "lib_AudioPLL" -name IP_TOOL_VERSION "18.1"
set_global_assignment -entity "AudioPLL" -library "lib_AudioPLL" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_AudioPLL" -name SPD_FILE [file join $::quartus(sip_path) "AudioPLL.spd"]

set_global_assignment -library "lib_AudioPLL" -name MISC_FILE [file join $::quartus(sip_path) "AudioPLL_sim/AudioPLL.vho"]
