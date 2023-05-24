within ServoWing.Loads.Components;
model C_BADEGHJTablefun_Opt "七维插值"
  //第一列B,第二列A,第三列D,第四列E，第五列G，第六列H，第七列J
  parameter String path = "D:/Study/StudyLib/Interpolation/Resources/data.csv"
    annotation (Dialog(
      loadSelector(filter = "csv files (*.csv);;Text files (*.txt)", 
        caption = "Open file in which table is present")));
  annotation (Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    grid = {2.0, 2.0}), graphics = {Rectangle(origin = {0.0, 0.0}, 
    fillColor = {255, 255, 255}, 
    fillPattern = FillPattern.Solid, 
    extent = {{-100.0, 100.0}, {100.0, -100.0}}), Text(origin = {-80.0, 90.0}, 
    extent = {{-20.0, 10.0}, {20.0, -10.0}}, 
    textString = "B"), Text(origin = {-80.0, 60.0}, 
    extent = {{-20.0, 10.0}, {20.0, -10.0}}, 
    textString = "A"), Text(origin = {-80.0, 30.0}, 
    extent = {{-20.0, 10.0}, {20.0, -10.0}}, 
    textString = "D"), Text(origin = {60.0, 0.0}, 
    extent = {{-40.0, 10.0}, {40.0, -10.0}}, 
    textString = "y[n-7]", 
    textStyle = {TextStyle.Bold}), Text(origin = {-80.0, 0.0}, 
    extent = {{-20.0, 10.0}, {20.0, -10.0}}, 
    textString = "E", 
    fontName = "(默认)", 
    textStyle = {TextStyle.Bold}), Text(origin = {-80.0, -30.0}, 
    extent = {{-20.0, 10.0}, {20.0, -10.0}}, 
    textString = "G", 
    fontName = "(默认)", 
    textStyle = {TextStyle.Bold}), Text(origin = {-80.0, -60.0}, 
    extent = {{-20.0, 10.0}, {20.0, -10.0}}, 
    textString = "H", 
    textStyle = {TextStyle.Bold}), Text(origin = {-80.0, -90.0}, 
    extent = {{-20.0, 10.0}, {20.0, -10.0}}, 
    textString = "J", 
    textStyle = {TextStyle.Bold})}));

  //变量
  Integer Is_init "0:初始化调用文件成功，-1：初始化调用文件失败";
  Integer Is_termimate "0:终止调用文件成功，-1：终止调用文件失败";

  //实例化
  Modelica.Blocks.Interfaces.RealInput B "插值表第一列" 
    annotation (
      Placement(transformation(origin = {-110.0, 90.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealInput A "插值表第二列" 
    annotation (
      Placement(transformation(origin = {-110.0, 60.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealInput D "插值表第三列" 
    annotation (
      Placement(transformation(origin = {-110.0, 30.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealInput E "插值表第四列" 
    annotation (
      Placement(transformation(origin = {-110.0, 0.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealInput G "插值表第五列" 
    annotation (
      Placement(transformation(origin = {-110.0, -30.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealInput H "插值表第六列" 
    annotation (
      Placement(transformation(origin = {-110.0, -60.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealInput J "插值表第七列" 
    annotation (
      Placement(transformation(origin = {-110.0, -90.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealOutput y[6] "输出n-6列" 
    annotation (Placement(transformation(origin = {110.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  when initial() then 
    Is_init = SevenWei_Init(path);
  end when;
  when terminal() then 
    Is_termimate = SevenWei_Terminate();
  end when;
  y = C_BADEGHJFunR(B, A, D, E, G, H, J);
end C_BADEGHJTablefun_Opt;