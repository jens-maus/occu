#!/bin/tclsh


sourceOnce [file join $env(DOCUMENT_ROOT) config/easymodes/em_common.tcl]
sourceOnce [file join $env(DOCUMENT_ROOT) config/easymodes/EnterFreeValue.tcl]
sourceOnce [file join $env(DOCUMENT_ROOT) config/easymodes/etc/uiElements.tcl]
sourceOnce [file join $env(DOCUMENT_ROOT) config/easymodes/etc/hmipAlarmPanel.tcl]

set PROFILE_PNAME(A) "\${stringTableEventFilterNumber}"
set PROFILE_PNAME(B) "\${stringTableEventFilterPeriod}"
set PROFILE_PNAME(C) "\${stringTableMotionDetectorMinInterval}"
set PROFILE_PNAME(D) "\${stringTableBrightnessFilter}"
set PROFILE_PNAME(F) "\${motionDetectorSendMotionWithinDetectionSpan}"
set PROFILE_PNAME(G) "\${stringTablePirOperationMode}"
set PROFILE_PNAME(H) "\${stringTableCondThresholdLo}"
set PROFILE_PNAME(I) "\${stringTableMotionDetectorMotionActiveTime}"
set PROFILE_PNAME(J) "\${motionDetectorLEDDisableChannelState}"

proc getHelp {topic x y} {
  return "<img src=\"/ise/img/help.png\" style=\"cursor: pointer; width:18px; height:18px; position:relative; top:2px\" onclick=\"showParamHelp('$topic', '$x', '$y')\">"
}

proc set_htmlParams {iface address pps pps_descr special_input_id peer_type} {

  puts "<script type=\"text/javascript\">load_JSFunc('/config/easymodes/js/ic_effects.js');</script>"
  puts "<script type=\"text/javascript\">load_JSFunc('/config/easymodes/MASTER_LANG/MOTION_DETECTOR.js');</script>"

  global iface_url global psDescr dev_descr

  upvar HTML_PARAMS   HTML_PARAMS
  upvar PROFILE_PNAME PROFILE_PNAME
  upvar $pps          ps
  upvar $pps_descr  psDescr

  upvar #0 unit_sec s
  upvar #0 unit_min m

  set brightness "0"
  set chn [lindex [split $address :] 1]

  set devType $dev_descr(TYPE)
  set devIsHmIPWired [isDevHmIPW $devType]

  set url $iface_url($iface)
  array set dev_descr [xmlrpc $url getParamset [list string $address] MASTER]
  set capture_within_interval  $dev_descr(CAPTURE_WITHIN_INTERVAL)

  set help_txt "\${motionDetectorHelp}"
  # set xmlCatchError [catch {set brightness [format "%.0f" [xmlrpc $iface_url($iface) getValue [list string $address] [list string ILLUMINATION]]]}]
  set xmlCatchError [catch {set brightness [format "%.0f" [xmlrpc $iface_url($iface) getValue [list string $address] [list string CURRENT_ILLUMINATION]]]}]

  set hlpBoxWidth 450
  set hlpBoxHeight 100

###

  append HTML_PARAMS(separate_1) "<table class=\"ProfileTbl\">"

    set prn 0

    set param CHANNEL_OPERATION_MODE
    if { [info exists ps($param)] == 1  } {
      incr prn
      append HTML_PARAMS(separate_1) "<tr><td>\${lblDetectionZones}</td><td>"
      append HTML_PARAMS(separate_1) "<select id=\"separate_${special_input_id}_$prn\" name=\"$param\">"
        append HTML_PARAMS(separate_1)  "<option value=\"0\">\${optionDisable}</option>"
        append HTML_PARAMS(separate_1)  "<option value=\"1\">\${optionPyro1}</option>"
        append HTML_PARAMS(separate_1)  "<option value=\"2\">\${optionPyro2}</option>"
        append HTML_PARAMS(separate_1)  "<option value=\"4\">\${optionPyro3}</option>"
        append HTML_PARAMS(separate_1)  "<option value=\"3\">\${optionPyro12}</option>"
        append HTML_PARAMS(separate_1)  "<option value=\"5\">\${optionPyro13}</option>"
        append HTML_PARAMS(separate_1)  "<option value=\"6\">\${optionPyro23}</option>"
        append HTML_PARAMS(separate_1)  "<option value=\"7\">\${optionPyro123}</option>"
      append HTML_PARAMS(separate_1) "</select>&nbsp;[getHelpIcon PYRO_$param]"

      append HTML_PARAMS(separate_1) "<script type=\"text/javascript\">"
        append HTML_PARAMS(separate_1) "jQuery(\"\#separate_${special_input_id}_$prn \").val($ps($param));"
      append HTML_PARAMS(separate_1) "</script>"

      append HTML_PARAMS(separate_1) "</td></tr>"
      append HTML_PARAMS(separate_1) "[getHorizontalLine]"
    }

    if { [info exists ps(EVENT_FILTER_NUMBER)] == 1  } {
        append HTML_PARAMS(separate_1) "<tr><td><span class=\"stringtable_value\">$PROFILE_PNAME(A)</span></td><td id=\"Hm\">\${mdTrigger}"
        array_clear options
        incr prn
        for {set i 1} {$i <= 15} {incr i} {
          set options($i) $i
        }
        append HTML_PARAMS(separate_1) [get_ComboBox options EVENT_FILTER_NUMBER separate_${special_input_id}_$prn ps EVENT_FILTER_NUMBER "onchange=\"MD_init(\'separate_${special_input_id}_$prn\', 1, 15)\"" ]
        append HTML_PARAMS(separate_1) "<span class=\"event_filter_number_$chn\"> Sensor-Impulsen innerhalb <span>"
        append HTML_PARAMS(separate_1) "<script type=\"text/javascript\">MD_init(\'separate_${special_input_id}_$prn\', 1, 15)</script>"

        array_clear options
        set options(0.5) "0.5"
        set options(1.0) "1.0"
        set options(1.5) "1.5"
        set options(2.0) "2.0"
        set options(2.5) "2.5"
        set options(3.0) "3.0"
        set options(3.5) "3.5"
        set options(4.0) "4.0"
        set options(4.5) "4.5"
        set options(5.0) "5.0"
        set options(5.5) "5.5"
        set options(6.0) "6.0"
        set options(6.5) "6.5"
        set options(7.0) "7.0"
        set options(7.5) "7.5"

        incr prn
        append HTML_PARAMS(separate_1) [get_ComboBox options EVENT_FILTER_PERIOD separate_${special_input_id}_$prn ps EVENT_FILTER_PERIOD]
        append HTML_PARAMS(separate_1) "<span class=\"event_filter_number_$chn\">&nbsp;Sekunden</span></td></tr>"
    }

    incr prn
    append HTML_PARAMS(separate_1) "<tr><td><span class=\"stringtable_value\">$PROFILE_PNAME(C)</span></td><td>"
    array_clear options
    set options(0)  "15$s"
    set options(1)  "30$s"
    set options(2)  "1$m"
    set options(3)  "2$m"
    set options(4)  "4$m"
    set options(5)  "8$m"
    set options(6)  "16$m"

    append HTML_PARAMS(separate_1) "[get_ComboBox options MIN_INTERVAL separate_${special_input_id}_$prn ps MIN_INTERVAL ]&nbsp;[getHelp MIN_INTERVAL $hlpBoxWidth $hlpBoxHeight]"
    append HTML_PARAMS(separate_1) "</td></tr>"

    set param LED_DISABLE_CHANNELSTATE
    if {[info exists ps($param)] == 1} {
      incr prn; #4
      append HTML_PARAMS(separate_1) "<tr><td>$PROFILE_PNAME(J)</td>"
      if {$dev_descr(LED_DISABLE_CHANNELSTATE) == 1} {
        append HTML_PARAMS(separate_1) "<td><input type=\"checkbox\" id=\"separate\_${special_input_id}_$prn\" name=$param checked=\"checked\">[getHelpIcon $param $hlpBoxWidth $hlpBoxHeight]</td></tr>"
      } else {
        append HTML_PARAMS(separate_1) "<td><input type=\"checkbox\" id=\"separate\_${special_input_id}_$prn\" name=$param>[getHelpIcon $param $hlpBoxWidth $hlpBoxHeight]</td></tr>"
      }
    }

    incr prn; #5
    append HTML_PARAMS(separate_1) "<tr><td><span>$PROFILE_PNAME(F)</span></td>"
    if {$capture_within_interval == 1} {
      append HTML_PARAMS(separate_1) "<td><input type=\"checkbox\" id=\"separate\_${special_input_id}_$prn\" name=\"CAPTURE_WITHIN_INTERVAL\" checked=\"checked\"></td></tr>"
    } else {
      append HTML_PARAMS(separate_1) "<td><input type=\"checkbox\" id=\"separate\_${special_input_id}_$prn\" name=\"CAPTURE_WITHIN_INTERVAL\"></td></tr>"
    }

    incr prn; #6
    append HTML_PARAMS(separate_1) "<tr><td><span class=\"stringtable_value\">$PROFILE_PNAME(I)</span></td><td>"
    array_clear options
    set options(0)  "15$s"
    set options(1)  "30$s"
    set options(2)  "1$m"
    set options(3)  "2$m"
    set options(4)  "4$m"
    set options(5)  "8$m"
    set options(6)  "16$m"
    set options(7)  "32$m"

    append HTML_PARAMS(separate_1) [get_ComboBox options MOTION_ACTIVE_TIME separate_${special_input_id}_$prn ps MOTION_ACTIVE_TIME ]
    append HTML_PARAMS(separate_1) "</td></tr>"


    incr prn; #7
    append HTML_PARAMS(separate_1) "<tr><td><span class=\"stringtable_value\">$PROFILE_PNAME(D)</span></td><td>"
    array_clear  options

    for {set i 0} {$i <= 15} {incr i} {
      set options($i) [expr $i + 1]
    }

    append HTML_PARAMS(separate_1) [get_ComboBox options BRIGHTNESS_FILTER separate_${special_input_id}_$prn ps BRIGHTNESS_FILTER "onchange=\"MD_init(\'separate_${special_input_id}_$prn\', 0, 15)\""]
    append HTML_PARAMS(separate_1) " \${motionDetectorMinumumOfLastValuesA} <span class=\"brightness_$chn\">\${motionDetectorMinumumOfLastValuesB1} [expr $ps(BRIGHTNESS_FILTER) + 1] \${motionDetectorMinumumOfLastValuesC}</span> \${motionDetectorMinumumOfLastValuesD}"
    append HTML_PARAMS(separate_1) "&nbsp;[getHelpIcon BRIGHTNESS_FILTER $hlpBoxWidth $hlpBoxHeight]"
    append HTML_PARAMS(separate_1) "</td></tr>"
    append HTML_PARAMS(separate_1) "<script type=\"text/javascript\">MD_init(\'separate_${special_input_id}_$prn\', 0, 15)</script>"

    incr prn; #8
    set prnPOM $prn
    set param PIR_OPERATION_MODE
    append HTML_PARAMS(separate_1) "<tr>"
      append HTML_PARAMS(separate_1) "<td><span class=\"j_translate\">$PROFILE_PNAME(G)</span></td>"
      append HTML_PARAMS(separate_1) "<td>"
        array_clear options
        set options(0)  "\${pirOperationModeNormal}"
        set options(1)  "\${pirOperationModeEco}"
        # append HTML_PARAMS(separate_1) [get_ComboBox options $param separate_${special_input_id}_$prn ps $param "onchange=\"showEcoModeElement(this);\""] [getHelpIcon $param $hlpBoxWidth $hlpBoxHeight]
        append HTML_PARAMS(separate_1) [get_ComboBox options $param separate_${special_input_id}_$prn ps $param "onchange=\"showEcoModeElement(this, $chn);\""]
      append HTML_PARAMS(separate_1) "</td>"
    append HTML_PARAMS(separate_1) "</tr>"

    incr prn;
    set param COND_TX_THRESHOLD_LO
    append HTML_PARAMS(separate_1) "<tr id=\"txThresholdLo_$chn\" class=\"hidden\">"
      append HTML_PARAMS(separate_1) "<td>"
        append HTML_PARAMS(separate_1) "<span class=\"j_translate\">$PROFILE_PNAME(H)</span>"
      append HTML_PARAMS(separate_1) "</td>"
      append HTML_PARAMS(separate_1) "<td>"

        array_clear param_descr
        array set param_descr $psDescr($param)
        set brightnessCorrectionFactor 10

        set Fw [getDevFwMajorMinorPatch]
        set fwMajor [lindex $Fw 0]
        # set fwMinor [lindex $Fw 1]
        # set fwPatch [lindex $Fw 2]

        # SPHM-310 - No correction factor for HmIPW and all sensors with a firmware >= 2.0.0
        if {$devIsHmIPWired == "true" || $fwMajor >= 2} {
          set brightnessCorrectionFactor 1
        }

        set minValue [format {%1.0f} $param_descr(MIN)]
        set maxValue [expr [format {%1.0f} $param_descr(MAX)] / $brightnessCorrectionFactor]

        append HTML_PARAMS(separate_1) "<input id=\"_COND_TX_THRESHOLD_LO_$chn\_$prn\" size=\"5\" onblur=\"ProofAndSetValue(this.id, this.id, $minValue, $maxValue, 1); setCondLoValue($chn,$prn,this.value);\" >&nbsp;($minValue - $maxValue)"
        append HTML_PARAMS(separate_1) "[getTextField $param $ps($param) $chn $prn class=\"hidden\"]"
        append HTML_PARAMS(separate_1) "<script type=\"text/javascript\">window.setTimeout(function()\{jQuery(\"#_COND_TX_THRESHOLD_LO_$chn\_$prn\").val(parseInt($ps($param))/ $brightnessCorrectionFactor);\},200);</script>"

        if {! $xmlCatchError} {
          set btnTxt "\${btnTakeCurrentBrightness}&nbsp;($brightness)"
          append HTML_PARAMS(separate_1) "[getButton getBrightness_$chn \"btnTakeCurrentBrightness\" setBrightness($chn,$prn);]"
          append HTML_PARAMS(separate_1) "<script type=\"text/javascript\">"
            append HTML_PARAMS(separate_1) "var elem = jQuery(\"#getBrightness_$chn\");"
            append HTML_PARAMS(separate_1) "if (elem) elem.val(elem.val() + \" ($brightness)\");"
          append HTML_PARAMS(separate_1) "</script>"
        }

      append HTML_PARAMS(separate_1) "</td>"
    append HTML_PARAMS(separate_1) "</tr>"


    set param PIR_SENSITIVITY
    if { [info exists ps($param)] == 1  } {
      incr prn
      append HTML_PARAMS(separate_1) "[getHorizontalLine]"

      append HTML_PARAMS(separate_1) "<tr>"
        append HTML_PARAMS(separate_1) "<td>\${stringTableSensorSensivity}</td>"
        array_clear options
        set options(150) "10%"
        set options(135) "20%"
        set options(120) "30%"
        set options(105) "40%"
        set options(90) "50%"
        set options(75) "60%"
        set options(60) "70%"
        set options(48) "80%" ; # 48 is the default
        set options(25) "90%"
        set options(10) "100%"

        append HTML_PARAMS(separate_1)  "<td>[get_ComboBox options $param separate_${special_input_id}_$prn ps $param]&nbsp;[getHelpIcon $param]</td>"
      append HTML_PARAMS(separate_1) "</tr>"
    }

      set param ATC_MODE
      if { [info exists ps($param)] == 1  } {
        incr prn
        set prnA $prn
        append HTML_PARAMS(separate_1) "<tr>"
          array_clear options
          set options(0) "\${optionInactiv}"
          set options(1) "\${optionActiv}"
          append HTML_PARAMS(separate_1) "<td>\${stringTableATCMode}</td>"
          append HTML_PARAMS(separate_1) "<td>[get_ComboBox options $param separate_$special_input_id\_$prn ps $param onchange=\"setATCAdatptionInterval('$chn')\"]</td>"
        append HTML_PARAMS(separate_1) "</tr>"
      }


    set param ATC_ADAPTION_INTERVAL
    if { [info exists ps($param)] == 1  } {
      incr prn
      append HTML_PARAMS(separate_1) "<tr class=\"hidden\" name=\"paramATCAdaptionInterval_$chn\">"
        array_clear options
        set options(0) "\${optionUnit15M}"
        set options(1) "\${optionUnit30M}"
        set options(2) "\${optionUnit60M}"
        set options(3) "\${optionUnit120M}"
        append HTML_PARAMS(separate_1) "<td>\${stringTableATCAdaptionInterval}</td>"
        append HTML_PARAMS(separate_1) "<td>[get_ComboBox options $param separate_$special_input_id\_$prn ps $param]</td>"
      append HTML_PARAMS(separate_1) "</tr>"

      # append HTML_PARAMS(separate_1) "[getHorizontalLine "name=\"paramATCAdaptionInterval\" class=\"hidden\""]"

      append HTML_PARAMS(separate_1) "<script type=\"text/javascript\">"
        append HTML_PARAMS(separate_1) "window.setTimeout(function() {"
          append HTML_PARAMS(separate_1) "setATCAdatptionInterval = function(chn) {"
            append HTML_PARAMS(separate_1) "var elmATCInterval = jQuery(\"\[name='paramATCAdaptionInterval_\"+chn+\"']\").first();"
            append HTML_PARAMS(separate_1) "var elmATCMode = jQuery(elmATCInterval).prev().find(\"select\").first();"

            append HTML_PARAMS(separate_1) "if (elmATCMode.val() == 1) {elmATCInterval.show();} else {elmATCInterval.hide();}"
          append HTML_PARAMS(separate_1) "};"

          append HTML_PARAMS(separate_1) "setATCAdatptionInterval('$chn');"
        append HTML_PARAMS(separate_1) "},100);"
      append HTML_PARAMS(separate_1) "</script>"
    }

  append HTML_PARAMS(separate_1) "</table>"

  append HTML_PARAMS(separate_1) "<table class=\"ProfileTbl\" id=\"md_ch_help\" style=\"display:none\">"
    append HTML_PARAMS(separate_1) "<tr><td id=\"helpText\">$help_txt</td></tr>"
  append HTML_PARAMS(separate_1) "</table>"

  append HTML_PARAMS(separate_1) "<script type=\"text/javascript\">"
    append HTML_PARAMS(separate_1) "st_setStringTableValues();"
    append HTML_PARAMS(separate_1) "jQuery(\"#md_help_button\").val(translateKey(\"genericBtnTxtHelp\"));"

    append HTML_PARAMS(separate_1) "showEcoModeElement = function(elm, chn) \{"
      append HTML_PARAMS(separate_1) "var selVal = jQuery(elm).val(),"
      append HTML_PARAMS(separate_1) "txThresholdLoElm = jQuery(\"#txThresholdLo_\" + chn);"

      append HTML_PARAMS(separate_1) "if (selVal == 0) {"
        append HTML_PARAMS(separate_1) "txThresholdLoElm.hide();"
      append HTML_PARAMS(separate_1) "} else {"
        append HTML_PARAMS(separate_1) "txThresholdLoElm.show();"
        # append HTML_PARAMS(separate_1) "jQuery(txThresholdLoElm).get(0).scrollIntoView();"
      append HTML_PARAMS(separate_1) "}"

    append HTML_PARAMS(separate_1) "\};"

    append HTML_PARAMS(separate_1) "setCondLoValue = function(chn,prn, value) \{"
      append HTML_PARAMS(separate_1) "jQuery(\"#separate_CHANNEL_\"+chn+\"_\"+prn).val(parseInt(value) * $brightnessCorrectionFactor);"
    append HTML_PARAMS(separate_1) "\};"

    append HTML_PARAMS(separate_1) "setBrightness = function(chn, prn) \{"
      # append HTML_PARAMS(separate_1) "jQuery(\"#separate_${special_input_id}_\"+prn).val(parseInt($brightness) * $brightnessCorrectionFactor);"
      append HTML_PARAMS(separate_1) "jQuery(\"#separate_CHANNEL_\"+chn + \"_\" + prn).val(parseInt($brightness) * $brightnessCorrectionFactor);"
      append HTML_PARAMS(separate_1) "jQuery(\"#_COND_TX_THRESHOLD_LO_\"+chn+\"_\"+prn).val(parseInt($brightness));"
    append HTML_PARAMS(separate_1) "\};"


    # append HTML_PARAMS(separate_1) "showEcoModeElement(jQuery(\"\[name='PIR_OPERATION_MODE'\]\")\[0\],$chn);"
    append HTML_PARAMS(separate_1) "showEcoModeElement(jQuery(\"#separate_CHANNEL_$chn\_$prnPOM\"),$chn);"
  append HTML_PARAMS(separate_1) "</script>"
}
constructor
