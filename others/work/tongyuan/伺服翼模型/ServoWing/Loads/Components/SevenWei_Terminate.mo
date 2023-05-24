within ServoWing.Loads.Components;
function SevenWei_Terminate "终止调用"

  output Integer res;  //返回成功（0）或者失败（-1）

  //调用SW_Terminate接口 Include = "SevenWeiReadDLL", IncludeDirectory = "modelica://ServoWing/Resources/Include",
external "C" res = SW_Terminate()annotation (
  Library = "SevenWeiReadDLL", LibraryDirectory = "modelica://ServoWing/Resources/Library");

end SevenWei_Terminate;