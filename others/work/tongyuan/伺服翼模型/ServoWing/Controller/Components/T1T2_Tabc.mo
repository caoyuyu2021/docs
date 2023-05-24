within ServoWing.Controller.Components;
model T1T2_Tabc "Ta/Tb/Tc计算模块"
  extends Icons.BasicModel;
  //实例化
  Modelica.Blocks.Interfaces.RealInput T1
    annotation (extent = [-110, 40; -90, 60], 
      Placement(transformation(origin = {-110.0, 40.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
        Placement(iconTransformation(origin = {-110.0, 50.0}, 
          extent = {{-10.0, -10.0}, {10.0, 10.0}})))));
  Modelica.Blocks.Interfaces.RealInput T
    annotation (extent = [-110, -10; -90, 10], 
      Placement(transformation(origin = {-110.0, 0.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
        Placement(iconTransformation(origin = {-110.0, 0.0}, 
          extent = {{-10.0, -10.0}, {10.0, 10.0}})))));
  Modelica.Blocks.Interfaces.RealInput T2
    annotation (extent = [-110, -60; -90, -40], 
      Placement(transformation(origin = {-110.0, -40.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
        Placement(iconTransformation(origin = {-110.0, -50.0}, 
          extent = {{-10.0, -10.0}, {10.0, 10.0}})))));
  Modelica.Blocks.Interfaces.RealOutput Ta
    annotation (extent = [90, 40; 110, 60], 
      Placement(transformation(origin = {110.0, 40.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
        Placement(iconTransformation(origin = {110.0, 50.0}, 
          extent = {{-10.0, -10.0}, {10.0, 10.0}})))));
  Modelica.Blocks.Interfaces.RealOutput Tb
    annotation (extent = [90, -10; 110, 10], 
      Placement(transformation(origin = {110.0, 0.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
        Placement(iconTransformation(origin = {110.0, 0.0}, 
          extent = {{-10.0, -10.0}, {10.0, 10.0}})))));
  Modelica.Blocks.Interfaces.RealOutput Tc
    annotation (extent = [90, -60; 110, -40], 
      Placement(transformation(origin = {110.0, -40.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
        Placement(iconTransformation(origin = {110.0, -50.0}, 
          extent = {{-10.0, -10.0}, {10.0, 10.0}})))));
equation 
  Ta = (T - T1 - T2) / 4;
  Tb = (T + T1 - T2) / 4;
  Tc = (T + T1 + T2) / 4;
  annotation (Diagram, 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Text(origin = {-79.0, 43.0}, 
      fillColor = {225, 225, 225}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      textString = "T1", 
      textStyle = {TextStyle.None}, 
      thickness = 0.5), Text(origin = {79.0, 41.0}, 
      fillColor = {225, 225, 225}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      textString = "Ta", 
      textStyle = {TextStyle.None}, 
      thickness = 0.5), Text(origin = {79.0, 1.0}, 
      fillColor = {225, 225, 225}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      textString = "Tb", 
      textStyle = {TextStyle.None}, 
      thickness = 0.5), Text(origin = {79.0, -41.0}, 
      fillColor = {225, 225, 225}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      textString = "Tc", 
      textStyle = {TextStyle.None}, 
      thickness = 0.5), Text(origin = {-81.0, -43.0}, 
      fillColor = {225, 225, 225}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      textString = "T2", 
      textStyle = {TextStyle.None}, 
      thickness = 0.5), Text(origin = {-81.0, -1.0}, 
      fillColor = {225, 225, 225}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-5.0, -10.0}, {5.0, 10.0}}, 
      textString = "T", 
      textStyle = {TextStyle.None}, 
      thickness = 0.5), Text(origin = {-2.0, -130.0}, 
      extent = {{-75.0, 30.0}, {75.0, -30.0}}, 
      textString = "TaTbTc计算", 
      fontName = "微软雅黑", 
      textStyle = {TextStyle.None})}), 
    Documentation(info = "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\"><HTML><HEAD>








<META content=\"text/html; charset=gb2312\" http-equiv=Content-Type>








<META name=GENERATOR content=\"MSHTML 9.00.8112.16540\"></HEAD>








<BODY>计算矢量切换点Ta、Tb 、Tc 输入当前工作扇区主、副矢量工作时间T1、T2以及PWM波形周期T，输出为计算矢量切换点Ta、Tb、Tc。 








</BODY></HTML>"));
end T1T2_Tabc;