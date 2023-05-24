within ServoWing.Controller.Components;
model abTU_XYZ "XYZ计算模块"
  extends Icons.BasicModel;
  //
  //Real a;
  //实例化
  Modelica.Blocks.Interfaces.RealInput U_alpha
    annotation (extent = [-110, 50; -90, 70], 
      Placement(transformation(origin = {-110.0, 60.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealInput U_beta
    annotation (extent = [-110, 10; -90, 30], 
      Placement(transformation(origin = {-110.0, 20.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealInput T
    annotation (extent = [-110, -30; -90, -10], 
      Placement(transformation(origin = {-110.0, -20.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealInput Ux
    annotation (extent = [-110, -70; -90, -50], 
      Placement(transformation(origin = {-110.0, -60.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealOutput X
    annotation (extent = [90, 50; 110, 70], 
      Placement(transformation(origin = {110.0, 40.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealOutput Y
    annotation (extent = [90, -10; 110, 10], 
      Placement(transformation(origin = {110.0, 0.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealOutput Z
    annotation (extent = [90, -70; 110, -50], 
      Placement(transformation(origin = {110.0, -40.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  X = sqrt(3) * U_beta * T / Ux;
  Y = 0.5 * (sqrt(3) * U_beta + 3 * U_alpha) * T / Ux;
  Z = 0.5 * (sqrt(3) * U_beta - 3 * U_alpha) * T / Ux;

  annotation (Diagram, 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Text(origin = {-80.0, 61.0}, 
      fillColor = {225, 225, 225}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      textString = "Uα", 
      textStyle = {TextStyle.None}, 
      thickness = 0.5), Text(origin = {-81.0, 21.0}, 
      fillColor = {225, 225, 225}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      textString = "Uβ", 
      textStyle = {TextStyle.None}, 
      thickness = 0.5), Text(origin = {-83.0, -21.0}, 
      fillColor = {225, 225, 225}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-5.0, -10.0}, {5.0, 10.0}}, 
      textString = "T", 
      textStyle = {TextStyle.None}, 
      thickness = 0.5), Text(origin = {-81.0, -61.0}, 
      fillColor = {225, 225, 225}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      textString = "Ux", 
      textStyle = {TextStyle.None}, 
      thickness = 0.5), Text(origin = {84.0, 41.0}, 
      extent = {{-5.0, 10.0}, {5.0, -10.0}}, 
      textString = "X", 
      textStyle = {TextStyle.None}), Text(origin = {84.0, 1.0}, 
      extent = {{-5.0, 10.0}, {5.0, -10.0}}, 
      textString = "Y", 
      textStyle = {TextStyle.None}), Text(origin = {84.0, -39.0}, 
      extent = {{-5.0, 10.0}, {5.0, -10.0}}, 
      textString = "Z", 
      textStyle = {TextStyle.None}), Text(origin = {0.0, -130.0}, 
      extent = {{-60.0, 30.0}, {60.0, -30.0}}, 
      textString = "XYZ计算", 
      fontName = "微软雅黑", 
      textStyle = {TextStyle.None})}), 
    Documentation(info = "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\"><HTML><HEAD>








<META content=\"text/html; charset=gb2312\" http-equiv=Content-Type>








<META name=GENERATOR content=\"MSHTML 9.00.8112.16540\"></HEAD>








<BODY>计算电压过渡变量X、Y、Z，输入两相静止坐标系下的电压U_∝、U_β、直流电压U_x及PWM波形周期T，该组件模型将计算出电压过渡变量X、Y、Z。</BODY></HTML>"));
end abTU_XYZ;