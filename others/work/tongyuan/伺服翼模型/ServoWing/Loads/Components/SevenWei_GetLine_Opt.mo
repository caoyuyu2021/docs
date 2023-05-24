within ServoWing.Loads.Components;
function SevenWei_GetLine_Opt "获取行数据"
  input Integer line_num;  //获取哪行数据
  output Real data[6]; //当前行数据
protected 
  Real line_data[13];  //当前行数据
  Integer line_data_len; //当前行数据个数
  Integer res; //返回成功（0）或者失败（-1）
algorithm 
  (line_data,line_data_len,res) := SevenWei_GetLine(line_num);
  data := line_data[8:13];
end SevenWei_GetLine_Opt;