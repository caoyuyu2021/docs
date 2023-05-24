within ServoWing.Loads.Components;
function SevenWei_Init "初始化调用，读取文件"
  input String path = "D:/Study/StudyLib/Interpolation/Resources/data.csv"; //CSV文件路径
  output Integer res;//返回成功（0）或者失败（-1）
  //调用SW_Init接口
  //Include = "SevenWeiReadDLL", IncludeDirectory = "modelica://ServoWing/Resources/Include",
external "C" res = SW_Init(path)
annotation (
  Library = "SevenWeiReadDLL", LibraryDirectory = "modelica://ServoWing/Resources/Library", 
  IncludeDirectory = "modelica://ServoWing/Resources/Include");
end SevenWei_Init;