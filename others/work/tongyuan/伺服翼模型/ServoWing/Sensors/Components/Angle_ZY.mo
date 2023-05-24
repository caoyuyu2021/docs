within ServoWing.Sensors.Components;
model Angle_ZY "与YZ轴夹角"
  Real r_0[3] "两测量点位置差";
  Real norm_r_0 "两测量点，位置长度";
  annotation (Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Rectangle(origin = {0.0, 0.0}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.Solid, 
      lineThickness = 2.0, 
      extent = {{-100.0, 100.0}, {100.0, -100.0}}, 
      radius = 25.0), Ellipse(origin = {0.0, 0.0}, 
      fillColor = {245, 245, 245}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-70.0, -70.0}, {70.0, 70.0}}), Line(origin = {0.0, 55.0}, 
      points = {{0.0, 15.0}, {0.0, -15.0}}), Line(origin = {31.55, 45.05}, 
      points = {{-8.650000000000002, -12.25}, {8.650000000000002, 12.25}}), Line(origin = {-31.55, 45.05}, 
      points = {{8.650000000000002, -12.25}, {-8.650000000000002, 12.25}}), Line(origin = {51.7, 18.799999999999997}, 
      points = {{-14.100000000000001, -5.099999999999998}, {14.099999999999994, 5.100000000000001}}), Line(origin = {-51.7, 18.799999999999997}, 
      points = {{14.100000000000001, -5.099999999999998}, {-14.099999999999994, 5.100000000000001}}), Ellipse(origin = {0.0, 0.0}, 
      lineColor = {64, 64, 64}, 
      fillColor = {255, 255, 255}, 
      extent = {{-12.0, -12.0}, {12.0, 12.0}}), Polygon(origin = {0.0, 0.0}, 
      rotation = -17.5, 
      fillColor = {64, 64, 64}, 
      pattern = LinePattern.None, 
      fillPattern = FillPattern.Solid, 
      points = {{-5.0, 0.0}, {-2.0, 60.0}, {0.0, 65.0}, {2.0, 60.0}, {5.0, 0.0}}), Ellipse(origin = {0.0, 0.0}, 
      fillColor = {64, 64, 64}, 
      pattern = LinePattern.None, 
      fillPattern = FillPattern.Solid, 
      extent = {{-7.0, -7.0}, {7.0, 7.0}}), Text(origin = {0.5, -76.5}, 
      extent = {{-29.5, 29.5}, {29.5, -29.5}}, 
      textString = "Angle", 
      textStyle = {TextStyle.None}), Line(origin = {80.0, 0.0}, 
      points = {{-10.0, 0.0}, {10.0, 0.0}}, 
      color = {0, 0, 255}), Text(origin = {0.0, -130.0}, 
      extent = {{-75.0, 30.0}, {75.0, -30.0}}, 
      textString = "与YZ轴夹角", 
      fontName = "微软雅黑", 
      textStyle = {TextStyle.None}), Line(origin = {-90.0, 0.0}, 
      points = {{0.0, 20.0}, {0.0, -20.0}}, 
      thickness = 2.0, 
      arrow = {Arrow.None, Arrow.Filled}, 
      arrowSize = 5.0)}));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a
    "Coordinate system fixed to the component with one cut-force and cut-torque" 
    annotation (Placement(transformation(origin = {-100.0, 40.0}, 
      extent = {{-16.0, -16.0}, {16.0, 16.0}})));
  Modelica.Blocks.Interfaces.RealOutput Angle_Z(unit = "deg") "绕Z轴旋转角度,deg" 
    annotation (Placement(transformation(origin = {110.00000000000001, -20.0}, 
      extent = {{10.0, -10.0}, {-10.0, 10.0}}, 
      rotation = 180.0)));
  Modelica.Blocks.Interfaces.RealOutput Angle_Y(unit = "deg") "绕Y轴旋转角度,deg" 
    annotation (Placement(transformation(origin = {110.00000000000001, 20.0}, 
      extent = {{10.0, -10.0}, {-10.0, 10.0}}, 
      rotation = 180.0)));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b "Coordinate system fixed to the component with one cut-force and cut-torque" annotation (Placement(transformation(origin = {-100.0, -42.0}, 
    extent = {{-16.0, -16.0}, {16.0, 16.0}})));
equation 
  //两测量点，位置长度
  norm_r_0 = Modelica.Math.Vectors.norm(frame_b.r_0 - frame_a.r_0);
  //位置归一化
  if norm_r_0 > 0 then 
    r_0 = (frame_b.r_0 - frame_a.r_0) / norm_r_0;
  else
    r_0 = {0, 0, 0};
  end if;
  //角度求解
  if r_0[1] > Modelica.Constants.eps then 
    Angle_Z = -atan(r_0[2] / r_0[1]) / pi * 180;
  else
    Angle_Z = 0;
  end if;
  if r_0[1] > Modelica.Constants.eps then 
    Angle_Y = atan(r_0[3] / r_0[1]) / pi * 180;
  else
    Angle_Y = 0;
  end if;
  //接口方程
  frame_a.f = zeros(3);
  frame_a.t = zeros(3);
  frame_b.f = zeros(3);
  frame_b.t = zeros(3);

end Angle_ZY;