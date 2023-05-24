within ServoWing.Controller.Components;
model switch "切换模块"
  extends Icons.BasicModel;
  //实例化
  Modelica.Blocks.Interfaces.RealInput u
    annotation (Placement(transformation(origin = {-110.0, 8.881784197001252e-16}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.BooleanOutput y(start = false)
    annotation (Placement(transformation(origin = {110.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  annotation (
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Line(origin = {-55.0, -50.0}, 
      points = {{-15.0, 0.0}, {15.0, 0.0}}, 
      thickness = 1.0), Line(origin = {-40.0, -5.0}, 
      points = {{0.0, -45.0}, {0.0, 45.0}}, 
      thickness = 1.0), Line(origin = {10.0, 40.0}, 
      points = {{-50.0, 0.0}, {50.0, 0.0}}, 
      thickness = 1.0), Text(origin = {-89.0, 1.0}, 
      extent = {{-5.0, 10.0}, {5.0, -10.0}}, 
      textString = "u", 
      textStyle = {TextStyle.None}), Text(origin = {88.0, 2.0}, 
      extent = {{-5.0, 10.0}, {5.0, -10.0}}, 
      textString = "y", 
      textStyle = {TextStyle.None}), Text(origin = {0.0, -130.0}, 
      extent = {{-30.0, 30.0}, {30.0, -30.0}}, 
      textString = "切换", 
      fontName = "微软雅黑", 
      textStyle = {TextStyle.None})}));
equation 
  y = if u > 0 then true else false;
end switch;