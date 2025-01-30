function RTW_Sid2UrlHash() {
	this.urlHashMap = new Array();
	/* <S1>/Constant */
	this.urlHashMap["hdlcoder_simple_up_counter:33"] = "HDL_DUT.vhd:81";
	/* <S1>/Constant1 */
	this.urlHashMap["hdlcoder_simple_up_counter:34"] = "HDL_DUT.vhd:77";
	/* <S1>/Delay */
	this.urlHashMap["hdlcoder_simple_up_counter:31"] = "HDL_DUT.vhd:97,98,99,100,101,102,103,104,105,106";
	/* <S1>/Delay1 */
	this.urlHashMap["hdlcoder_simple_up_counter:32"] = "HDL_DUT.vhd:113,114,115,116,117,118,119,120,121,122";
	/* <S1>/Relational
Operator */
	this.urlHashMap["hdlcoder_simple_up_counter:39"] = "HDL_DUT.vhd:86,87";
	/* <S1>/Sum */
	this.urlHashMap["hdlcoder_simple_up_counter:37"] = "HDL_DUT.vhd:83";
	/* <S1>/Switch */
	this.urlHashMap["hdlcoder_simple_up_counter:35"] = "HDL_DUT.vhd:110,111";
	/* <S1>/Switch1 */
	this.urlHashMap["hdlcoder_simple_up_counter:38"] = "HDL_DUT.vhd:94,95";
	this.getUrlHash = function(sid) { return this.urlHashMap[sid];}
}
RTW_Sid2UrlHash.instance = new RTW_Sid2UrlHash();
function RTW_rtwnameSIDMap() {
	this.rtwnameHashMap = new Array();
	this.sidHashMap = new Array();
	this.rtwnameHashMap["<Root>"] = {sid: "hdlcoder_simple_up_counter"};
	this.sidHashMap["hdlcoder_simple_up_counter"] = {rtwname: "<Root>"};
	this.rtwnameHashMap["<S1>/count_threshold"] = {sid: "hdlcoder_simple_up_counter:8"};
	this.sidHashMap["hdlcoder_simple_up_counter:8"] = {rtwname: "<S1>/count_threshold"};
	this.rtwnameHashMap["<S1>/ Enable"] = {sid: "hdlcoder_simple_up_counter:9"};
	this.sidHashMap["hdlcoder_simple_up_counter:9"] = {rtwname: "<S1>/ Enable"};
	this.rtwnameHashMap["<S1>/Constant"] = {sid: "hdlcoder_simple_up_counter:33"};
	this.sidHashMap["hdlcoder_simple_up_counter:33"] = {rtwname: "<S1>/Constant"};
	this.rtwnameHashMap["<S1>/Constant1"] = {sid: "hdlcoder_simple_up_counter:34"};
	this.sidHashMap["hdlcoder_simple_up_counter:34"] = {rtwname: "<S1>/Constant1"};
	this.rtwnameHashMap["<S1>/Delay"] = {sid: "hdlcoder_simple_up_counter:31"};
	this.sidHashMap["hdlcoder_simple_up_counter:31"] = {rtwname: "<S1>/Delay"};
	this.rtwnameHashMap["<S1>/Delay1"] = {sid: "hdlcoder_simple_up_counter:32"};
	this.sidHashMap["hdlcoder_simple_up_counter:32"] = {rtwname: "<S1>/Delay1"};
	this.rtwnameHashMap["<S1>/Relational Operator"] = {sid: "hdlcoder_simple_up_counter:39"};
	this.sidHashMap["hdlcoder_simple_up_counter:39"] = {rtwname: "<S1>/Relational Operator"};
	this.rtwnameHashMap["<S1>/Sum"] = {sid: "hdlcoder_simple_up_counter:37"};
	this.sidHashMap["hdlcoder_simple_up_counter:37"] = {rtwname: "<S1>/Sum"};
	this.rtwnameHashMap["<S1>/Switch"] = {sid: "hdlcoder_simple_up_counter:35"};
	this.sidHashMap["hdlcoder_simple_up_counter:35"] = {rtwname: "<S1>/Switch"};
	this.rtwnameHashMap["<S1>/Switch1"] = {sid: "hdlcoder_simple_up_counter:38"};
	this.sidHashMap["hdlcoder_simple_up_counter:38"] = {rtwname: "<S1>/Switch1"};
	this.rtwnameHashMap["<S1>/out"] = {sid: "hdlcoder_simple_up_counter:10"};
	this.sidHashMap["hdlcoder_simple_up_counter:10"] = {rtwname: "<S1>/out"};
	this.getSID = function(rtwname) { return this.rtwnameHashMap[rtwname];}
	this.getRtwname = function(sid) { return this.sidHashMap[sid];}
}
RTW_rtwnameSIDMap.instance = new RTW_rtwnameSIDMap();
