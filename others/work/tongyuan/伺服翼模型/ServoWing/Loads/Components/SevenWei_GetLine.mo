within ServoWing.Loads.Components;
function SevenWei_GetLine "原始获取行数据"
  input Integer line_num;  //获取哪行数据
  output Real line_data[13]; //当前行数据
  output Integer line_data_len;//当前行数据个数
  output Integer res;//返回成功（0）或者失败（-1）
  //调用SW_GetLine接口  Include = "SevenWeiReadDLL", IncludeDirectory = "modelica://ServoWing/Resources/Include",
external "C" res = SW_GetLine(line_num, line_data, line_data_len)annotation (
  Library = "SevenWeiReadDLL", LibraryDirectory = "modelica://ServoWing/Resources/Library");
end SevenWei_GetLine;