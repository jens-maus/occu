#!/bin/tclsh


sourceOnce [file join /www/config/easymodes/em_common.tcl]
sourceOnce [file join /www/config/easymodes/etc/hmipMOD-RC8.tcl]


proc set_htmlParams {iface address pps pps_descr special_input_id peer_type} {
  global env iface_url psDescr

  upvar HTML_PARAMS   HTML_PARAMS
  upvar $pps          ps
  upvar $pps_descr    psDescr

  set chn [getChannel $special_input_id]

  append HTML_PARAMS(separate_1) "<table class=\"ProfileTbl\">"
    switch $ps(CHANNEL_OPERATION_MODE) {
      0 {append HTML_PARAMS(separate_1) "[getInactiveHTML $address $chn ps psDescr]" }
      1 {append HTML_PARAMS(separate_1) "[getKeyHTML $address $chn ps psDescr]" }
      2 {append HTML_PARAMS(separate_1) "[getSwitchHTML $address $chn ps psDescr]" }
      3 {append HTML_PARAMS(separate_1) "[getBinaryHTML $address $chn ps psDescr]"}
    }
  append HTML_PARAMS(separate_1) "</table>"
  append HTML_PARAMS(separate_1) [getFooter $chn]
}

constructor

