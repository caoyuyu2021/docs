within ServoWing.Controller.Components;
model rPark "反Park变换"
  extends Icons.BasicModel;
  //实例化
  Modelica.Blocks.Interfaces.RealInput theta
    annotation (preserUeAspectRatio = true, 
      Placement(transformation(origin = {-110.0, 40.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealInput U_d
    annotation (preserveAspectRatio = true, 
      Placement(transformation(origin = {-110.0, 0.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealInput U_q
    annotation (preserveAspectRatio = true, 
      Placement(transformation(origin = {-110.0, -40.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealOutput U_alpha
    annotation (preserveAspectRatio = true, 
      Placement(transformation(origin = {110.0, 20.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealOutput U_beta
    annotation (preserveAspectRatio = true, 
      Placement(transformation(origin = {110.0, -20.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  U_alpha = U_d * cos(theta) - U_q * sin(theta);
  U_beta = U_d * sin(theta) + U_q * cos(theta);
  annotation (
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      preserveAspectRatio = false, 
      grid = {1.0, 1.0}), graphics = {Text(origin = {-85.0, 43.0}, 
      fillColor = {225, 225, 225}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-5.0, -10.0}, {5.0, 10.0}}, 
      textString = "θ", 
      textStyle = {TextStyle.None}, 
      thickness = 0.5), Text(origin = {-82.0, 2.0}, 
      fillColor = {225, 225, 225}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      textString = "Ud", 
      textStyle = {TextStyle.None}, 
      thickness = 0.5), Text(origin = {-81.0, -44.0}, 
      fillColor = {225, 225, 225}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      textString = "Uq", 
      textStyle = {TextStyle.None}, 
      thickness = 0.5), Text(origin = {78.0, 21.0}, 
      fillColor = {225, 225, 225}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      textString = "Uα", 
      textStyle = {TextStyle.None}, 
      thickness = 0.5), Text(origin = {79.0, -25.0}, 
      fillColor = {225, 225, 225}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      textString = "Uβ", 
      textStyle = {TextStyle.None}, 
      thickness = 0.5), Text(origin = {-20.0, 31.73333333333335}, 
      lineColor = {255, 104, 32}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-60.0, 50.26666666666665}, {70.0, -1.7333333333333485}}, 
      textString = "（d，q）", 
      textColor = {255, 104, 32}), Text(origin = {-5.230769230769226, -57.099999999999994}, 
      lineColor = {255, 104, 32}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-38.769230769230774, 35.1}, {87.23076923076923, -3.8999999999999986}}, 
      textString = "（α，β）", 
      textColor = {255, 104, 32}), Line(origin = {0.0, 0.0}, 
      points = {{92.0, 92.0}, {-92.0, -92.0}}), Text(origin = {0.0, -130.0}, 
      extent = {{-75.0, 30.0}, {75.0, -30.0}}, 
      textString = "反Park变换", 
      fontName = "微软雅黑", 
      textStyle = {TextStyle.None})}), 
    Diagram, 
    Documentation(info = "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\"><HTML><HEAD>








<META content=\"text/html; charset=gb2312\" http-equiv=Content-Type>








<META name=GENERATOR content=\"MSHTML 9.00.8112.16540\"></HEAD>








<BODY>两轴旋转坐标系d-q到两轴静止坐标系α-β的变换。 输入两相旋转坐标系下的电压U_d、U_q及电机转子角度，该组件模型将输出两相静止坐标系下的电压U_α、U_β </BODY></HTML>"));
end rPark;