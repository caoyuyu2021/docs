within ServoWing.Controller.Components;
model Park "Park变换模块"
  extends Icons.BasicModel;
  //实例化
  Modelica.Blocks.Interfaces.RealInput theta "电机测得的转角乘以磁极对数所得的角度值" 
    annotation (preserveAspectRatio = true, 
      Placement(transformation(origin = {-110.0, 40.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealInput i_alpha "两相静止坐标系里的分量" 
    annotation (preserveAspectRatio = true, 
      Placement(transformation(origin = {-110.0, 0.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealInput i_beta "两相静止坐标系里的分量" 
    annotation (preserveAspectRatio = true, 
      Placement(transformation(origin = {-110.0, -40.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealOutput i_d "两相旋转坐标系的分量" 
    annotation (preserveAspectRatio = true, 
      Placement(transformation(origin = {110.0, -20.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealOutput i_q "两相旋转坐标系的分量" 
    annotation (preserveAspectRatio = true, 
      Placement(transformation(origin = {110.0, 20.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  //转换关系
  i_d = i_alpha * cos(theta) + i_beta * sin(theta);
  i_q = -i_alpha * sin(theta) + i_beta * cos(theta);
  annotation (
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Text(origin = {-85.0, 43.0}, 
      fillColor = {225, 225, 225}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-5.0, -10.0}, {5.0, 10.0}}, 
      textString = "θ", 
      textStyle = {TextStyle.None}, 
      thickness = 0.5), Text(origin = {80.0, 18.0}, 
      fillColor = {225, 225, 225}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-15.0, -10.0}, {15.0, 10.0}}, 
      textString = "i_d", 
      textStyle = {TextStyle.None}, 
      thickness = 0.5), Text(origin = {80.0, -17.0}, 
      fillColor = {225, 225, 225}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-15.0, -10.0}, {15.0, 10.0}}, 
      textString = "i_q", 
      textStyle = {TextStyle.None}, 
      thickness = 0.5), Text(origin = {-82.0, 1.0}, 
      fillColor = {225, 225, 225}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-15.0, -10.0}, {15.0, 10.0}}, 
      textString = "i_α", 
      textStyle = {TextStyle.None}, 
      thickness = 0.5), Text(origin = {-80.0, -44.0}, 
      fillColor = {225, 225, 225}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-15.0, -10.0}, {15.0, 10.0}}, 
      textString = "i_β", 
      textStyle = {TextStyle.None}, 
      thickness = 0.5), Text(origin = {34.0, -78.26666666666665}, 
      lineColor = {255, 104, 32}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-60.0, 50.26666666666665}, {70.0, -1.7333333333333485}}, 
      textString = "（d，q）", 
      textColor = {255, 104, 32}), Text(origin = {-52.230769230769226, 36.900000000000006}, 
      lineColor = {255, 104, 32}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-38.769230769230774, 35.1}, {87.23076923076923, -3.8999999999999986}}, 
      textString = "（α，β）", 
      textColor = {255, 104, 32}), Line(origin = {0.0, 0.0}, 
      points = {{92.0, 92.0}, {-92.0, -92.0}}), Text(origin = {0.0, -130.0}, 
      extent = {{-60.0, 30.0}, {60.0, -30.0}}, 
      textString = "Park变换", 
      fontName = "微软雅黑", 
      textStyle = {TextStyle.None})}), 
    Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0})), 
    Documentation(info = "<p>两相静止坐标系到两相旋转坐标系的变换。<br />输入两相静止坐标系下的电流i_&alpha;、i_&beta;及电机转子角度，该模型组件将输出两相旋转坐标系下的电流i_d、i_q，公式如下:</p>
<p><img src=\"Modelica://DMULibrary/Pictures/Park.jpg\" alt=\"\" /></p>
<p>&nbsp;</p>"));
end Park;