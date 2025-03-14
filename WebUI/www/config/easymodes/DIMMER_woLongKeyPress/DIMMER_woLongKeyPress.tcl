#!/bin/tclsh

source [file join $env(DOCUMENT_ROOT) config/easymodes/em_common.tcl]
source [file join $env(DOCUMENT_ROOT) config/easymodes/EnterFreeValue.tcl]
source [file join $env(DOCUMENT_ROOT) config/easymodes/etc/options.tcl]

set PROFILES_MAP(0)		"\${expert}"
set PROFILES_MAP(1)		"\${dimmer_on_off}"
set PROFILES_MAP(2)		"\${light_stairway}"
set PROFILES_MAP(3)		"\${sleep_well}"
set PROFILES_MAP(4)		"\${dimmer_off}"


set PROFILE_0(UI_HINT)	0
set PROFILE_0(UI_DESCRIPTION)	"Expertenprofil"
set PROFILE_0(UI_TEMPLATE)	"Expertenprofil"

# hier folgen die verschiedenen Profile

set PROFILE_1(SHORT_ACTION_TYPE)	1
set PROFILE_1(SHORT_COND_VALUE_HI)	100
set PROFILE_1(SHORT_COND_VALUE_LO)	50
set PROFILE_1(SHORT_CT_OFF)			0
set PROFILE_1(SHORT_CT_OFFDELAY)	0
set PROFILE_1(SHORT_CT_ON)			0
set PROFILE_1(SHORT_CT_ONDELAY)		0
set PROFILE_1(SHORT_CT_RAMPOFF)		0
set PROFILE_1(SHORT_CT_RAMPON)		0
set PROFILE_1(SHORT_DIM_MAX_LEVEL)	1.0
set PROFILE_1(SHORT_DIM_MIN_LEVEL)	0.0
set PROFILE_1(SHORT_DIM_STEP)		0.05
set PROFILE_1(SHORT_JT_OFF)			1
set PROFILE_1(SHORT_JT_OFFDELAY)	5
set PROFILE_1(SHORT_JT_ON)			4
set PROFILE_1(SHORT_JT_ONDELAY)		2
set PROFILE_1(SHORT_JT_RAMPOFF)		6
set PROFILE_1(SHORT_JT_RAMPON)		3
set PROFILE_1(SHORT_OFFDELAY_BLINK)	{1 0}
set PROFILE_1(SHORT_OFFDELAY_NEWTIME)	0.5
set PROFILE_1(SHORT_OFFDELAY_OLDTIME)	0.5
set PROFILE_1(SHORT_OFFDELAY_STEP)	0.05
set PROFILE_1(SHORT_OFFDELAY_TIME)	{0.0 range 0.0 - 111600.0}
set PROFILE_1(SHORT_OFF_LEVEL)		0.0
set PROFILE_1(SHORT_OFF_TIME)		{111600.0 range 0.0 - 108000.0}
set PROFILE_1(SHORT_OFF_TIME_MODE)	0
set PROFILE_1(SHORT_ONDELAY_MODE)	0
set PROFILE_1(SHORT_ONDELAY_TIME)	{0.0 range 0.0 - 111600.0}
set PROFILE_1(SHORT_ON_LEVEL)		{1.0 range 0.0 - 1.005}
set PROFILE_1(SHORT_ON_LEVEL_PRIO)	0
set PROFILE_1(SHORT_ON_MIN_LEVEL)	0.1
set PROFILE_1(SHORT_ON_TIME)		{111600.0 range 0.0 - 108000.0}
set PROFILE_1(SHORT_ON_TIME_MODE)	0
set PROFILE_1(SHORT_RAMPOFF_TIME)	{0.5 range 0.0 - 111600.0}
set PROFILE_1(SHORT_RAMPON_TIME)	{0.5 range 0.0 - 111600.0}
set PROFILE_1(SHORT_RAMP_START_STEP)	0.05
set PROFILE_1(UI_DESCRIPTION)	"Mit einem kurzen Tastendruck wechselt das Licht zwischen der eingestellten Helligkeit und aus. Mit einem langen Tastendruck wird das Licht abwechselnd hoch- und runtergedimmt."
set PROFILE_1(UI_TEMPLATE)		$PROFILE_1(UI_DESCRIPTION)
set PROFILE_1(UI_HINT)	1

set PROFILE_2(SHORT_ACTION_TYPE)	1
set PROFILE_2(SHORT_COND_VALUE_HI)	100
set PROFILE_2(SHORT_COND_VALUE_LO)	50
set PROFILE_2(SHORT_CT_OFF)			0
set PROFILE_2(SHORT_CT_OFFDELAY)	0
set PROFILE_2(SHORT_CT_ON)			0
set PROFILE_2(SHORT_CT_ONDELAY)		0
set PROFILE_2(SHORT_CT_RAMPOFF)		0
set PROFILE_2(SHORT_CT_RAMPON)		0
set PROFILE_2(SHORT_DIM_MAX_LEVEL)	1.0
set PROFILE_2(SHORT_DIM_MIN_LEVEL)	0.0
set PROFILE_2(SHORT_DIM_STEP)		0.05
set PROFILE_2(SHORT_JT_OFF)			1
set PROFILE_2(SHORT_JT_OFFDELAY)	2
set PROFILE_2(SHORT_JT_ON)			2
set PROFILE_2(SHORT_JT_ONDELAY)		2
set PROFILE_2(SHORT_JT_RAMPOFF)		2
set PROFILE_2(SHORT_JT_RAMPON)		0
set PROFILE_2(SHORT_OFFDELAY_BLINK)	{1 0}
set PROFILE_2(SHORT_OFFDELAY_NEWTIME)	0.5
set PROFILE_2(SHORT_OFFDELAY_OLDTIME)	0.5
set PROFILE_2(SHORT_OFFDELAY_STEP)	0.05
set PROFILE_2(SHORT_OFFDELAY_TIME)	{20.0 range 0.0 - 111600.0}
set PROFILE_2(SHORT_OFF_LEVEL)		0.0
set PROFILE_2(SHORT_OFF_TIME)		{111600.0 range 0.0 - 108000.0}
set PROFILE_2(SHORT_OFF_TIME_MODE)	0
set PROFILE_2(SHORT_ONDELAY_MODE)	0
set PROFILE_2(SHORT_ONDELAY_TIME)	{0.0 range 0.0 - 108000.0}
set PROFILE_2(SHORT_ON_LEVEL)		{0.9 range 0.0 - 1.005}
set PROFILE_2(SHORT_ON_LEVEL_PRIO)	1
set PROFILE_2(SHORT_ON_MIN_LEVEL)	0.1
set PROFILE_2(SHORT_ON_TIME)		{120.0 range 0.0 - 108000.0}
set PROFILE_2(SHORT_ON_TIME_MODE)	1
set PROFILE_2(SHORT_RAMPOFF_TIME)	{20.0 range 0.0 - 111600.0}
set PROFILE_2(SHORT_RAMPON_TIME)	{0.5 range 0.0 - 111600.0}
set PROFILE_2(SHORT_RAMP_START_STEP)	0.05
set PROFILE_2(UI_DESCRIPTION)	"Das Licht wird durch kurzen oder langen Tastendruck f&uuml;r die eingestellte Zeit eingeschaltet. In der Ausschaltverz&ouml;gerung wird der Pegel zur Vorwarnung leicht abgesenkt, um anschlie&szlig;end langsam bis auf aus runterzudimmen."
set PROFILE_2(UI_TEMPLATE)		$PROFILE_2(UI_DESCRIPTION)
set PROFILE_2(UI_HINT)	2

set PROFILE_3(SHORT_ACTION_TYPE)	1
set PROFILE_3(SHORT_COND_VALUE_HI)	100
set PROFILE_3(SHORT_COND_VALUE_LO)	50
set PROFILE_3(SHORT_CT_OFF)			0
set PROFILE_3(SHORT_CT_OFFDELAY)	0
set PROFILE_3(SHORT_CT_ON)			0
set PROFILE_3(SHORT_CT_ONDELAY)		0
set PROFILE_3(SHORT_CT_RAMPOFF)		0
set PROFILE_3(SHORT_CT_RAMPON)		0
set PROFILE_3(SHORT_DIM_MAX_LEVEL)	1.0
set PROFILE_3(SHORT_DIM_MIN_LEVEL)	0.0
set PROFILE_3(SHORT_DIM_STEP)		0.05
set PROFILE_3(SHORT_JT_OFF)			1
set PROFILE_3(SHORT_JT_OFFDELAY)	2
set PROFILE_3(SHORT_JT_ON)			2
set PROFILE_3(SHORT_JT_ONDELAY)		2
set PROFILE_3(SHORT_JT_RAMPOFF)		2
set PROFILE_3(SHORT_JT_RAMPON)		3
set PROFILE_3(SHORT_OFFDELAY_BLINK)	1
set PROFILE_3(SHORT_OFFDELAY_NEWTIME)	0.5
set PROFILE_3(SHORT_OFFDELAY_OLDTIME)	0.5
set PROFILE_3(SHORT_OFFDELAY_STEP)	0.0
set PROFILE_3(SHORT_OFFDELAY_TIME)	0.0
set PROFILE_3(SHORT_OFF_LEVEL)		0.0
set PROFILE_3(SHORT_OFF_TIME)		{111600.0 range 0.0 - 108000.0}
set PROFILE_3(SHORT_OFF_TIME_MODE)	0
set PROFILE_3(SHORT_ONDELAY_MODE)	0
set PROFILE_3(SHORT_ONDELAY_TIME)	0.0
set PROFILE_3(SHORT_ON_LEVEL)		{0.5 range 0.0 - 1.005}
set PROFILE_3(SHORT_ON_LEVEL_PRIO)	0
set PROFILE_3(SHORT_ON_MIN_LEVEL)	0.1
set PROFILE_3(SHORT_ON_TIME)		{1800.0 range 0.0 - 108000.0}
set PROFILE_3(SHORT_ON_TIME_MODE)	0
set PROFILE_3(SHORT_RAMPOFF_TIME)	{1800.0 range 0.0 - 111600.0}
set PROFILE_3(SHORT_RAMPON_TIME)	0.5
set PROFILE_3(SHORT_RAMP_START_STEP)	0.0
set PROFILE_3(UI_DESCRIPTION)	"Mit einem kurzen Tastendruck wird das Licht auf die eingestellte Helligkeit eingeschaltet und nach der eingestellten Zeit langsam auf aus runtergedimmt. Mit einem langen Tastendruck wird das Licht abwechselnd hoch- und runtergedimmt."
set PROFILE_3(UI_TEMPLATE)		$PROFILE_3(UI_DESCRIPTION)
set PROFILE_3(UI_HINT)	3


set PROFILE_4(SHORT_ACTION_TYPE)	1
set PROFILE_4(SHORT_COND_VALUE_HI)	100
set PROFILE_4(SHORT_COND_VALUE_LO)	50
set PROFILE_4(SHORT_CT_OFF)			0
set PROFILE_4(SHORT_CT_OFFDELAY)	0
set PROFILE_4(SHORT_CT_ON)			0
set PROFILE_4(SHORT_CT_ONDELAY)		0
set PROFILE_4(SHORT_CT_RAMPOFF)		0
set PROFILE_4(SHORT_CT_RAMPON)		0
set PROFILE_4(SHORT_DIM_MAX_LEVEL)	1.0
set PROFILE_4(SHORT_DIM_MIN_LEVEL)	0.0
set PROFILE_4(SHORT_DIM_STEP)		0.05
set PROFILE_4(SHORT_JT_OFF)			4
set PROFILE_4(SHORT_JT_OFFDELAY)	5
set PROFILE_4(SHORT_JT_ON)			4
set PROFILE_4(SHORT_JT_ONDELAY)		4
set PROFILE_4(SHORT_JT_RAMPOFF)		6
set PROFILE_4(SHORT_JT_RAMPON)		4
set PROFILE_4(SHORT_OFFDELAY_BLINK)	{1 0}
set PROFILE_4(SHORT_OFFDELAY_NEWTIME)	0.5
set PROFILE_4(SHORT_OFFDELAY_OLDTIME)	0.5
set PROFILE_4(SHORT_OFFDELAY_STEP)	0.05
set PROFILE_4(SHORT_OFFDELAY_TIME)	{0.0 range 0.0 - 111600.0} 
set PROFILE_4(SHORT_OFF_LEVEL)		0.0
set PROFILE_4(SHORT_OFF_TIME)		{111600.0 range 0.0 - 108000.0}
set PROFILE_4(SHORT_OFF_TIME_MODE)	0
set PROFILE_4(SHORT_ONDELAY_MODE)	0
set PROFILE_4(SHORT_ONDELAY_TIME)	0.0
set PROFILE_4(SHORT_ON_LEVEL)		1.0
set PROFILE_4(SHORT_ON_LEVEL_PRIO)	0
set PROFILE_4(SHORT_ON_MIN_LEVEL)	0.1
set PROFILE_4(SHORT_ON_TIME)		{111600.0 range 0.0 - 108000.0}
set PROFILE_4(SHORT_ON_TIME_MODE)	0
set PROFILE_4(SHORT_RAMPOFF_TIME)	{0.5 range 0.0 - 111600.0}
set PROFILE_4(SHORT_RAMPON_TIME)	0.5
set PROFILE_4(SHORT_RAMP_START_STEP)	0.05
set PROFILE_4(UI_DESCRIPTION)	"Das Licht wird durch kurzen oder langen Tastendruck ausgeschaltet."
set PROFILE_4(UI_TEMPLATE)		$PROFILE_4(UI_DESCRIPTION)
set PROFILE_4(UI_HINT)	4


# hier folgen die eventuellen Subsets

proc set_htmlParams {iface address pps pps_descr special_input_id peer_type} {
	
	global dev_descr_sender

	upvar PROFILES_MAP  PROFILES_MAP
	upvar HTML_PARAMS   HTML_PARAMS
	upvar PROFILE_PNAME PROFILE_PNAME
	upvar $pps          ps      
	upvar $pps_descr    ps_descr
	
	set device $dev_descr_sender(TYPE)
	set ch $dev_descr_sender(INDEX)
	
	foreach pro [array names PROFILES_MAP] {
		upvar PROFILE_$pro PROFILE_$pro
	}

	set cur_profile [get_cur_profile2 ps PROFILES_MAP PROFILE_TMP "KEY"]

	#global SUBSETS
	set name "x"
	set i 1
	while {$name != ""} {
		upvar SUBSET_$i SUBSET_$i
		array set subset [array get SUBSET_$i]
		set name ""
		catch {set name $subset(NAME)}
		array_clear subset
		incr i
	}


  puts "<script type=\"text/javascript\">"
    puts "\$(\"chType_\" + $ch).innerHTML += \'_woLongKeyPress\';"
  puts "</script>"


#	die Texte der Platzhalter einlesen
	puts "<script type=\"text/javascript\">getLangInfo('$device\_woLongKeyPress', '$device\_woLongKeyPress');</script>"


## ----------- hier beginnt die interne Tastenkonfiguration -----------

	set prn 0	
	append HTML_PARAMS(separate_$prn) "<div id=\"param_$prn\"><textarea id=\"profile_$prn\" style=\"display:none\">"
	append HTML_PARAMS(separate_$prn) [cmd_link_paramset2 $iface $address ps_descr ps "LINK" ${special_input_id}_$prn]
	append HTML_PARAMS(separate_$prn) "</textarea></div>"

#1	
	incr prn
	set pref 1
	if {$cur_profile == $prn} then {array set PROFILE_$prn [array get ps]}
	append HTML_PARAMS(separate_$prn) "<div id=\"param_$prn\"><textarea id=\"profile_$prn\" style=\"display:none\">"
	append HTML_PARAMS(separate_$prn) "\${description_$prn}"
	append HTML_PARAMS(separate_$prn) "<table class=\"ProfileTbl\">"

	append HTML_PARAMS(separate_$prn) "<tr><td>\${RAMPON_TIME}</td><td>"
	option RAMPTIME
	append HTML_PARAMS(separate_$prn) [get_ComboBox options SHORT_RAMPON_TIME separate_${special_input_id}_$prn\_$pref PROFILE_$prn SHORT_RAMPON_TIME "onchange=\"ActivateFreeTime4InternalKey(\$('${special_input_id}_profiles'),$pref);\""]
	EnterTime_h_m_s $prn $pref ${special_input_id} ps_descr SHORT_RAMPON_TIME
	append HTML_PARAMS(separate_$prn) "</td></tr>"

	incr pref ;# 2
	append HTML_PARAMS(separate_$prn) "<tr><td>\${ON_TIME}</td><td>"
	option LENGTH_OF_STAY
	append HTML_PARAMS(separate_$prn) [get_ComboBox options SHORT_ON_TIME separate_${special_input_id}_$prn\_$pref PROFILE_$prn SHORT_ON_TIME "onchange=\"ActivateFreeTime4InternalKey(\$('${special_input_id}_profiles'),$pref);\""]
	EnterTime_h_m_s $prn $pref ${special_input_id} ps_descr SHORT_ON_TIME
	append HTML_PARAMS(separate_$prn) "</td></tr>"
	
	incr pref ;# 3
	append HTML_PARAMS(separate_$prn) "<tr><td>\${ON_LEVEL}</td><td>"
	option DIM_ONLEVEL
	append HTML_PARAMS(separate_$prn) [get_ComboBox options SHORT_ON_LEVEL separate_${special_input_id}_$prn\_$pref PROFILE_$prn SHORT_ON_LEVEL "onchange=\"ActivateFreePercent4InternalKey(\$('${special_input_id}_profiles'),$pref);\""]
	EnterPercent $prn $pref ${special_input_id} ps_descr SHORT_ON_LEVEL
	append HTML_PARAMS(separate_$prn) "</td></tr>"

	incr pref ;# 4
	append HTML_PARAMS(separate_$prn) "<tr><td>\${OFFDELAY_TIME}</td><td>"
	option DELAY
	append HTML_PARAMS(separate_$prn) [get_ComboBox options SHORT_OFFDELAY_TIME separate_${special_input_id}_$prn\_$pref PROFILE_$prn SHORT_OFFDELAY_TIME "onchange=\"ActivateFreeTime4InternalKey(\$('${special_input_id}_profiles'),$pref);\""]
	EnterTime_h_m_s $prn $pref ${special_input_id} ps_descr SHORT_OFFDELAY_TIME
	append HTML_PARAMS(separate_$prn) "</td></tr>"
	
	incr pref ;# 5
	append HTML_PARAMS(separate_$prn) "<tr><td>\${OFFDELAY_BLINK}</td><td>"
	array_clear options
	set options(0) "\${off}"
	set options(1) "\${on}"
	append HTML_PARAMS(separate_$prn) [get_ComboBox options SHORT_OFFDELAY_BLINK separate_${special_input_id}_$prn\_$pref PROFILE_$prn SHORT_OFFDELAY_BLINK ]
	append HTML_PARAMS(separate_$prn) "</td></tr>"
	
	incr pref ;# 6
	append HTML_PARAMS(separate_$prn) "<tr><td>\${RAMPOFF_TIME}</td><td>"
	option RAMPTIME
	append HTML_PARAMS(separate_$prn) [get_ComboBox options SHORT_RAMPOFF_TIME separate_${special_input_id}_$prn\_$pref PROFILE_$prn SHORT_RAMPOFF_TIME "onchange=\"ActivateFreeTime4InternalKey(\$('${special_input_id}_profiles'),$pref);\""]
	EnterTime_h_m_s $prn $pref ${special_input_id} ps_descr SHORT_RAMPOFF_TIME
	append HTML_PARAMS(separate_$prn) "</td></tr>"

	append HTML_PARAMS(separate_$prn) "</table></textarea></div>"
#2	
	incr prn
	set pref 1
	if {$cur_profile == $prn} then {array set PROFILE_$prn [array get ps]}
	append HTML_PARAMS(separate_$prn) "<div id=\"param_$prn\"><textarea id=\"profile_$prn\" style=\"display:none\">"
	append HTML_PARAMS(separate_$prn) "\${description_$prn}"
	append HTML_PARAMS(separate_$prn) "<table class=\"ProfileTbl\">"

	append HTML_PARAMS(separate_$prn) "<tr><td>\${RAMPON_TIME}</td><td>"
	option RAMPTIME
	append HTML_PARAMS(separate_$prn) [get_ComboBox options SHORT_RAMPON_TIME separate_${special_input_id}_$prn\_$pref PROFILE_$prn SHORT_RAMPON_TIME "onchange=\"ActivateFreeTime4InternalKey(\$('${special_input_id}_profiles'),$pref);\""]
	EnterTime_h_m_s $prn $pref ${special_input_id} ps_descr SHORT_RAMPON_TIME
	append HTML_PARAMS(separate_$prn) "</td></tr>"

	incr pref ;# 2
	append HTML_PARAMS(separate_$prn) "<tr><td>\${ON_TIME}</td><td>"
	option LENGTH_OF_STAY
	append HTML_PARAMS(separate_$prn) [get_ComboBox options SHORT_ON_TIME separate_${special_input_id}_$prn\_$pref PROFILE_$prn SHORT_ON_TIME "onchange=\"ActivateFreeTime4InternalKey(\$('${special_input_id}_profiles'),$pref);\""]
	EnterTime_h_m_s $prn $pref ${special_input_id} ps_descr SHORT_ON_TIME
	append HTML_PARAMS(separate_$prn) "</td></tr>"
	
	incr pref ;# 3
	append HTML_PARAMS(separate_$prn) "<tr><td>\${ON_LEVEL}</td><td>"
	option DIM_ONLEVEL
	append HTML_PARAMS(separate_$prn) [get_ComboBox options SHORT_ON_LEVEL separate_${special_input_id}_$prn\_$pref PROFILE_$prn SHORT_ON_LEVEL "onchange=\"ActivateFreePercent4InternalKey(\$('${special_input_id}_profiles'),$pref);\""]
	EnterPercent $prn $pref ${special_input_id} ps_descr SHORT_ON_LEVEL
	append HTML_PARAMS(separate_$prn) "</td></tr>"
	
	incr pref ;# 4
	append HTML_PARAMS(separate_$prn) "<tr><td>\${OFFDELAY_TIME}</td><td>"
	option DELAY
	append HTML_PARAMS(separate_$prn) [get_ComboBox options SHORT_OFFDELAY_TIME separate_${special_input_id}_$prn\_$pref PROFILE_$prn SHORT_OFFDELAY_TIME "onchange=\"ActivateFreeTime4InternalKey(\$('${special_input_id}_profiles'),$pref);\""]
	EnterTime_h_m_s $prn $pref ${special_input_id} ps_descr SHORT_OFFDELAY_TIME
	append HTML_PARAMS(separate_$prn) "</td></tr>"

	incr pref ;# 5
	append HTML_PARAMS(separate_$prn) "<tr><td>\${OFFDELAY_BLINK}</td><td>"
	array_clear options
	set options(0) "\${off}"
	set options(1) "\${on}"
	append HTML_PARAMS(separate_$prn) [get_ComboBox options SHORT_OFFDELAY_BLINK separate_${special_input_id}_$prn\_$pref PROFILE_$prn SHORT_OFFDELAY_BLINK ]
	append HTML_PARAMS(separate_$prn) "</td></tr>"

	incr pref ;# 6
	append HTML_PARAMS(separate_$prn) "<tr><td>\${RAMPOFF_TIME}</td><td>"
	option RAMPTIME
	append HTML_PARAMS(separate_$prn) [get_ComboBox options SHORT_RAMPOFF_TIME separate_${special_input_id}_$prn\_$pref PROFILE_$prn SHORT_RAMPOFF_TIME "onchange=\"ActivateFreeTime4InternalKey(\$('${special_input_id}_profiles'),$pref);\""]
	EnterTime_h_m_s $prn $pref ${special_input_id} ps_descr SHORT_RAMPOFF_TIME
	append HTML_PARAMS(separate_$prn) "</td></tr>"

	append HTML_PARAMS(separate_$prn) "</table></textarea></div>"
#3
	incr prn
	set pref 1
	if {$cur_profile == $prn} then {array set PROFILE_$prn [array get ps]}
	append HTML_PARAMS(separate_$prn) "<div id=\"param_$prn\"><textarea id=\"profile_$prn\" style=\"display:none\">"
	append HTML_PARAMS(separate_$prn) "\${description_$prn }"
	append HTML_PARAMS(separate_$prn) "<table class=\"ProfileTbl\">"

	append HTML_PARAMS(separate_$prn) "<tr><td>\${ON_TIME}</td><td>"
	option LENGTH_OF_STAY
	append HTML_PARAMS(separate_$prn) [get_ComboBox options SHORT_ON_TIME separate_${special_input_id}_$prn\_$pref PROFILE_$prn SHORT_ON_TIME "onchange=\"ActivateFreeTime4InternalKey(\$('${special_input_id}_profiles'),$pref);\""]
	EnterTime_h_m_s $prn $pref ${special_input_id} ps_descr SHORT_ON_TIME
	append HTML_PARAMS(separate_$prn) "</td></tr>"
	
	incr pref ;# 2
	append HTML_PARAMS(separate_$prn) "<tr><td>\${ON_LEVEL}</td><td>"
	option DIM_ONLEVEL
	append HTML_PARAMS(separate_$prn) [get_ComboBox options SHORT_ON_LEVEL separate_${special_input_id}_$prn\_$pref PROFILE_$prn SHORT_ON_LEVEL "onchange=\"ActivateFreePercent4InternalKey(\$('${special_input_id}_profiles'),$pref);\""]
	EnterPercent $prn $pref ${special_input_id} ps_descr SHORT_ON_LEVEL
	append HTML_PARAMS(separate_$prn) "</td></tr>"
	
	incr pref ;# 3
	append HTML_PARAMS(separate_$prn) "<tr><td>\${RAMPOFF_TIME}</td><td>"
	option RAMPTIME
	append HTML_PARAMS(separate_$prn) [get_ComboBox options SHORT_RAMPOFF_TIME separate_${special_input_id}_$prn\_$pref PROFILE_$prn SHORT_RAMPOFF_TIME "onchange=\"ActivateFreeTime4InternalKey(\$('${special_input_id}_profiles'),$pref);\""]
	EnterTime_h_m_s $prn $pref ${special_input_id} ps_descr SHORT_RAMPOFF_TIME
	append HTML_PARAMS(separate_$prn) "</td></tr>"
	
	
	append HTML_PARAMS(separate_$prn) "</table></textarea></div>"
#4	
	incr prn
	set pref 1
	if {$cur_profile == $prn} then {array set PROFILE_$prn [array get ps]}
	append HTML_PARAMS(separate_$prn) "<div id=\"param_$prn\"><textarea id=\"profile_$prn\" style=\"display:none\">"
	append HTML_PARAMS(separate_$prn) "\${description_$prn}"
	append HTML_PARAMS(separate_$prn) "<table class=\"ProfileTbl\">"

	append HTML_PARAMS(separate_$prn) "<tr><td>\${OFFDELAY_TIME}</td><td>"
	option DELAY
	append HTML_PARAMS(separate_$prn) [get_ComboBox options SHORT_OFFDELAY_TIME separate_${special_input_id}_$prn\_$pref PROFILE_$prn SHORT_OFFDELAY_TIME "onchange=\"ActivateFreeTime4InternalKey(\$('${special_input_id}_profiles'),$pref);\""]
	EnterTime_h_m_s $prn $pref ${special_input_id} ps_descr LONG_OFFDELAY_TIME
	append HTML_PARAMS(separate_$prn) "</td></tr>"

	incr pref ;# 2
	append HTML_PARAMS(separate_$prn) "<tr><td>\${OFFDELAY_BLINK}</td><td>"
	array_clear options
	set options(0) "\${off}"
	set options(1) "\${on}"
	append HTML_PARAMS(separate_$prn) [get_ComboBox options SHORT_OFFDELAY_BLINK separate_${special_input_id}_$prn\_$pref PROFILE_$prn SHORT_OFFDELAY_BLINK ]
	append HTML_PARAMS(separate_$prn) "</td></tr>"
	
	append HTML_PARAMS(separate_$prn) "<tr><td>\${RAMPOFF_TIME}</td><td>"
	option RAMPTIME
	incr pref ;# 3
	append HTML_PARAMS(separate_$prn) [get_ComboBox options SHORT_RAMPOFF_TIME separate_${special_input_id}_$prn\_$pref PROFILE_$prn SHORT_RAMPOFF_TIME "onchange=\"ActivateFreeTime4InternalKey(\$('${special_input_id}_profiles'),$pref);\""]
	EnterTime_h_m_s $prn $pref ${special_input_id} ps_descr SHORT_RAMPOFF_TIME
	append HTML_PARAMS(separate_$prn) "</td></tr>"
	
	append HTML_PARAMS(separate_$prn) "</table></textarea></div>"
}
constructor
