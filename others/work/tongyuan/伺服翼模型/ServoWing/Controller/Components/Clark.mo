within ServoWing.Controller.Components;
model Clark "Clark变换模块"
  extends Icons.BasicModel;
  //实例化
  Modelica.Blocks.Interfaces.RealInput i_a
    annotation (preserveAspectRatio = true, 
      Placement(transformation(origin = {-110.0, 40.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealInput i_c
    annotation (preserveAspectRatio = true, 
      Placement(transformation(origin = {-110.0, -40.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealOutput i_alpha
    annotation (preserveAspectRatio = true, 
      Placement(transformation(origin = {110.0, 20.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealOutput i_beta
    annotation (preserveAspectRatio = true, 
      Placement(transformation(origin = {110.0, -20.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealInput i_b
    annotation (preserveAspectRatio = true, 
      Placement(transformation(origin = {-110.0, 0.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  i_alpha = sqrt(2 / 3) * (i_a - i_b / 2 - i_c / 2);
  i_beta = sqrt(2 / 3) * (sqrt(3) * i_b / 2 - sqrt(3) * i_c / 2);
  annotation (
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      preserveAspectRatio = false, 
      grid = {1.0, 1.0}), graphics = {Text(origin = {170.0, 67.5}, 
      lineColor = {255, 104, 32}, 
      extent = {{-245.0, 17.5}, {-175.0, -17.5}}, 
      textString = "(a,b,c)", 
      textColor = {255, 104, 32}), Text(origin = {163.8, -31.799999999999997}, 
      lineColor = {255, 104, 32}, 
      extent = {{-176.8, 4.799999999999997}, {-108.80000000000001, -43.2}}, 
      textString = "(α，β)", 
      textColor = {255, 104, 32}), Text(origin = {75.0, 21.0}, 
      fillColor = {225, 225, 225}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-15.0, -10.0}, {15.0, 10.0}}, 
      textString = "i_α", 
      textStyle = {TextStyle.None}, 
      thickness = 0.5), Text(origin = {76.0, -20.0}, 
      fillColor = {225, 225, 225}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-15.0, -10.0}, {15.0, 10.0}}, 
      textString = "i_β", 
      textStyle = {TextStyle.None}, 
      thickness = 0.5), Text(origin = {-75.0, 41.0}, 
      fillColor = {225, 225, 225}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-15.0, -10.0}, {15.0, 10.0}}, 
      textString = "i_a", 
      textStyle = {TextStyle.None}, 
      thickness = 0.5), Text(origin = {-74.0, 1.0}, 
      fillColor = {225, 225, 225}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-15.0, -10.0}, {15.0, 10.0}}, 
      textString = "i_b", 
      textStyle = {TextStyle.None}, 
      thickness = 0.5), Text(origin = {-73.0, -42.0}, 
      fillColor = {225, 225, 225}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-15.0, -10.0}, {15.0, 10.0}}, 
      textString = "i_c", 
      textStyle = {TextStyle.None}, 
      thickness = 0.5), Line(origin = {1.0, 0.0}, 
      points = {{92.0, 92.0}, {-92.0, -92.0}}), Text(origin = {0.0, -130.0}, 
      extent = {{-60.0, 30.0}, {60.0, -30.0}}, 
      textString = "Clark变换", 
      fontName = "微软雅黑", 
      textStyle = {TextStyle.None})}), 
    Diagram, 
    Documentation(info = "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\"><HTML><HEAD>








<META content=\"text/html; charset=gb2312\" http-equiv=Content-Type>








<META name=GENERATOR content=\"MSHTML 9.00.8112.16540\"></HEAD>








<BODY>三相静止坐标系到两相静止坐标系的变换。<BR>输入三相电流中的A、C相电流i_A、i_C，该组件模型将输出两相静止坐标系下的电流i_α、i_β</BODY></HTML>"));
end Clark;