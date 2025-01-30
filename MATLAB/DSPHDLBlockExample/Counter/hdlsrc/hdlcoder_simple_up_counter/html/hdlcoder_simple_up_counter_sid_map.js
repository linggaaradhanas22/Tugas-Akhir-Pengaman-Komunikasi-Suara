function RTW_SidParentMap() {
    this.sidParentMap = new Array();
    this.sidParentMap["hdlcoder_simple_up_counter:8"] = "hdlcoder_simple_up_counter:7";
    this.sidParentMap["hdlcoder_simple_up_counter:9"] = "hdlcoder_simple_up_counter:7";
    this.sidParentMap["hdlcoder_simple_up_counter:33"] = "hdlcoder_simple_up_counter:7";
    this.sidParentMap["hdlcoder_simple_up_counter:34"] = "hdlcoder_simple_up_counter:7";
    this.sidParentMap["hdlcoder_simple_up_counter:31"] = "hdlcoder_simple_up_counter:7";
    this.sidParentMap["hdlcoder_simple_up_counter:32"] = "hdlcoder_simple_up_counter:7";
    this.sidParentMap["hdlcoder_simple_up_counter:39"] = "hdlcoder_simple_up_counter:7";
    this.sidParentMap["hdlcoder_simple_up_counter:37"] = "hdlcoder_simple_up_counter:7";
    this.sidParentMap["hdlcoder_simple_up_counter:35"] = "hdlcoder_simple_up_counter:7";
    this.sidParentMap["hdlcoder_simple_up_counter:38"] = "hdlcoder_simple_up_counter:7";
    this.sidParentMap["hdlcoder_simple_up_counter:10"] = "hdlcoder_simple_up_counter:7";
    this.getParentSid = function(sid) { return this.sidParentMap[sid];}
}
    RTW_SidParentMap.instance = new RTW_SidParentMap();
