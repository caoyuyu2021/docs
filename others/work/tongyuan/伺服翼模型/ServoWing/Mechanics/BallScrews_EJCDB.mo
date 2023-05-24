within ServoWing.Mechanics;
model BallScrews_EJCDB "滚珠丝杠传动考虑效率、惯量、刚度、阻尼、间隙"
  extends Icons.BasicModel;
  extends Mechanics.Components.BallScrewsInterface;
  parameter Real Ph(unit = "mm") = 2 "螺纹导程" 
    annotation (Dialog(tab = "丝杠参数", group = "基本参数"));
  parameter Real ratio = 2 * 1000 * pi / Ph "传动比(flange_a.phi/flange_b.s)" 
    annotation (Dialog(tab = "丝杠参数", group = "基本参数"));
  parameter Real eta = 0.8 "传动效率" 
    annotation (Dialog(tab = "丝杠参数", group = "基本参数"));
  parameter SI.Inertia J = 1 "等效惯量" 
    annotation (Dialog(tab = "丝杠参数", group = "基本参数"));
  parameter SI.RotationalSpringConstant c = 1.0e5 "刚度系数" 
    annotation (Dialog(tab = "丝杠参数", group = "基本参数"));
  parameter SI.RotationalDampingConstant d = 1e2 "阻尼系数" 
    annotation (Dialog(tab = "丝杠参数", group = "基本参数"));
  parameter SI.Angle b = 0 "总间隙" 
    annotation (Dialog(tab = "丝杠参数", group = "基本参数"));
  BallScrews ballScrews_E(Ph = Ph, ratio = ratio, eta = eta)
    annotation (Placement(transformation(extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J = J)
    annotation (Placement(transformation(origin = {-26.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Rotational.Components.ElastoBacklash elastoBacklash(c = c, d = d, b = b)
    annotation (Placement(transformation(origin = {-78.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  annotation (
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Rectangle(origin = {-25.97, -1.545}, 
      fillColor = {192, 192, 192}, 
      fillPattern = FillPattern.HorizontalCylinder, 
      extent = {{-1.02, 17.595}, {1.02, -17.595}}), Rectangle(origin = {93.73, 0.96}, 
      fillColor = {164, 164, 164}, 
      fillPattern = FillPattern.HorizontalCylinder, 
      extent = {{-6.27000000000001, 8.96}, {6.27, -8.96}}), Rectangle(origin = {-85.5, -0.0780000000000003}, 
      fillColor = {192, 192, 192}, 
      fillPattern = FillPattern.HorizontalCylinder, 
      extent = {{14.7, -10.002}, {-14.7, 10.002}}), Rectangle(origin = {-70.76, -1.45}, 
      fillColor = {192, 192, 192}, 
      fillPattern = FillPattern.HorizontalCylinder, 
      extent = {{-2.0, 20.5}, {2.0, -20.5}}), Rectangle(origin = {-67.785, -1.55}, 
      fillColor = {192, 192, 192}, 
      fillPattern = FillPattern.HorizontalCylinder, 
      extent = {{-0.975000000000009, 17.6}, {0.974999999999994, -17.6}}), Rectangle(origin = {-64.8, -1.44}, 
      fillColor = {192, 192, 192}, 
      fillPattern = FillPattern.HorizontalCylinder, 
      extent = {{-2.0, 20.5}, {2.0, -20.5}}), Rectangle(origin = {-61.825, -1.55}, 
      fillColor = {192, 192, 192}, 
      fillPattern = FillPattern.HorizontalCylinder, 
      extent = {{-0.974999999999994, 17.6}, {0.975000000000001, -17.6}}), Rectangle(origin = {-58.84, -1.45}, 
      fillColor = {192, 192, 192}, 
      fillPattern = FillPattern.HorizontalCylinder, 
      extent = {{-2.0, 20.5}, {2.0, -20.5}}), Rectangle(origin = {-55.855, -1.55}, 
      fillColor = {192, 192, 192}, 
      fillPattern = FillPattern.HorizontalCylinder, 
      extent = {{-0.974999999999994, 17.6}, {0.975000000000001, -17.6}}), Rectangle(origin = {-52.87, -1.45}, 
      fillColor = {192, 192, 192}, 
      fillPattern = FillPattern.HorizontalCylinder, 
      extent = {{-2.0, 20.5}, {2.0, -20.5}}), Rectangle(origin = {-49.895, -1.54}, 
      fillColor = {192, 192, 192}, 
      fillPattern = FillPattern.HorizontalCylinder, 
      extent = {{-0.975000000000001, 17.6}, {0.974999999999994, -17.6}}), Rectangle(origin = {-46.91, -1.45}, 
      fillColor = {192, 192, 192}, 
      fillPattern = FillPattern.HorizontalCylinder, 
      extent = {{-2.0, 20.5}, {2.0, -20.5}}), Rectangle(origin = {-43.925, -1.53}, 
      fillColor = {192, 192, 192}, 
      fillPattern = FillPattern.HorizontalCylinder, 
      extent = {{-0.975000000000001, 17.6}, {0.974999999999994, -17.6}}), Rectangle(origin = {-40.94, -1.45}, 
      fillColor = {192, 192, 192}, 
      fillPattern = FillPattern.HorizontalCylinder, 
      extent = {{-2.0, 20.5}, {2.0, -20.5}}), Rectangle(origin = {-37.955, -1.55}, 
      fillColor = {192, 192, 192}, 
      fillPattern = FillPattern.HorizontalCylinder, 
      extent = {{-0.975000000000001, 17.6}, {0.975000000000001, -17.6}}), Rectangle(origin = {-34.97, -1.45}, 
      fillColor = {192, 192, 192}, 
      fillPattern = FillPattern.HorizontalCylinder, 
      extent = {{-2.0, 20.5}, {2.0, -20.5}}), Rectangle(origin = {-31.985, -1.55}, 
      fillColor = {192, 192, 192}, 
      fillPattern = FillPattern.HorizontalCylinder, 
      extent = {{-0.975000000000001, 17.6}, {0.974999999999998, -17.6}}), Rectangle(origin = {-29.0, -1.45}, 
      fillColor = {192, 192, 192}, 
      fillPattern = FillPattern.HorizontalCylinder, 
      extent = {{-2.0, 20.5}, {2.0, -20.5}}), Rectangle(origin = {61.6, 0.4}, 
      fillColor = {192, 192, 192}, 
      fillPattern = FillPattern.HorizontalCylinder, 
      extent = {{2.0, 20.5}, {-2.0, -20.5}}), Rectangle(origin = {64.585, 0.32}, 
      fillColor = {192, 192, 192}, 
      fillPattern = FillPattern.HorizontalCylinder, 
      extent = {{0.974999999999994, 17.6}, {-0.975000000000009, -17.6}}), Rectangle(origin = {67.57, 0.4}, 
      fillColor = {192, 192, 192}, 
      fillPattern = FillPattern.HorizontalCylinder, 
      extent = {{2.0, 20.5}, {-2.0, -20.5}}), Rectangle(origin = {70.535, 0.32}, 
      fillColor = {192, 192, 192}, 
      fillPattern = FillPattern.HorizontalCylinder, 
      extent = {{0.975000000000009, 17.6}, {-0.974999999999994, -17.6}}), Rectangle(origin = {73.51, 0.4}, 
      fillColor = {192, 192, 192}, 
      fillPattern = FillPattern.HorizontalCylinder, 
      extent = {{2.0, 20.5}, {-2.0, -20.5}}), Rectangle(origin = {76.495, 0.33}, 
      fillColor = {192, 192, 192}, 
      fillPattern = FillPattern.HorizontalCylinder, 
      extent = {{0.974999999999994, 17.6}, {-0.975000000000009, -17.6}}), Rectangle(origin = {79.48, 0.4}, 
      fillColor = {192, 192, 192}, 
      fillPattern = FillPattern.HorizontalCylinder, 
      extent = {{2.0, 20.5}, {-2.0, -20.5}}), Rectangle(origin = {82.465, 0.3}, 
      fillColor = {192, 192, 192}, 
      fillPattern = FillPattern.HorizontalCylinder, 
      extent = {{0.974999999999994, 17.6}, {-0.975000000000009, -17.6}}), Rectangle(origin = {85.45, 0.4}, 
      fillColor = {192, 192, 192}, 
      fillPattern = FillPattern.HorizontalCylinder, 
      extent = {{2.0, 20.5}, {-2.0, -20.5}}), Rectangle(origin = {-19.97, -1.545}, 
      fillColor = {192, 192, 192}, 
      fillPattern = FillPattern.HorizontalCylinder, 
      extent = {{-1.02, 17.595}, {1.02, -17.595}}), Rectangle(origin = {-23.0, -1.45}, 
      fillColor = {192, 192, 192}, 
      fillPattern = FillPattern.HorizontalCylinder, 
      extent = {{-2.0, 20.5}, {2.0, -20.5}}), Rectangle(origin = {-13.97, -1.545}, 
      fillColor = {192, 192, 192}, 
      fillPattern = FillPattern.HorizontalCylinder, 
      extent = {{-1.02, 17.595}, {1.02, -17.595}}), Rectangle(origin = {-17.0, -1.45}, 
      fillColor = {192, 192, 192}, 
      fillPattern = FillPattern.HorizontalCylinder, 
      extent = {{-2.0, 20.5}, {2.0, -20.5}}), Rectangle(origin = {-11.0, -1.45}, 
      fillColor = {192, 192, 192}, 
      fillPattern = FillPattern.HorizontalCylinder, 
      extent = {{-2.0, 20.5}, {2.0, -20.5}}), Rectangle(origin = {0.0, 2.0}, 
      fillColor = {192, 192, 192}, 
      fillPattern = FillPattern.HorizontalCylinder, 
      extent = {{-10.0, 48.0}, {10.0, -48.0}}), Rectangle(origin = {55.6, 0.4}, 
      fillColor = {192, 192, 192}, 
      fillPattern = FillPattern.HorizontalCylinder, 
      extent = {{2.0, 20.5}, {-2.0, -20.5}}), Rectangle(origin = {58.585, 0.32}, 
      fillColor = {192, 192, 192}, 
      fillPattern = FillPattern.HorizontalCylinder, 
      extent = {{0.975000000000001, 17.6}, {-0.975000000000001, -17.6}}), Rectangle(origin = {33.0, 0.0}, 
      fillColor = {192, 192, 192}, 
      fillPattern = FillPattern.HorizontalCylinder, 
      extent = {{-23.0, 30.0}, {23.0, -30.0}}), Text(origin = {0.0, -130.0}, 
      extent = {{-60.0, 30.0}, {60.0, -30.0}}, 
      textString = "滚珠丝杠", 
      fontName = "微软雅黑", 
      textStyle = {TextStyle.None})}));
  Modelica.Mechanics.Rotational.Components.BearingFriction bearingFriction
    annotation (Placement(transformation(origin = {-52.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  connect(ballScrews_E.flange_t, flange_t)
    annotation (Line(origin = {0.0, 28.0}, 
      points = {{0.0, -23.0}, {0.0, 22.0}}, 
      color = {0, 127, 0}));
  connect(flange_r, elastoBacklash.flange_a)
    annotation (Line(origin = {-90.0, 0.0}, 
      points = {{-10.0, 0.0}, {2.0, 0.0}}));



  connect(inertia.flange_b, ballScrews_E.flange_r)
    annotation (Line(origin = {-15.0, 0.0}, 
      points = {{-1.0, 0.0}, {5.0, 0.0}}));
  connect(elastoBacklash.flange_b, bearingFriction.flange_a)
    annotation (Line(origin = {-63.0, -13.0}, 
      points = {{-5.0, 13.0}, {1.0, 13.0}}));
  connect(bearingFriction.flange_b, inertia.flange_a)
    annotation (Line(origin = {-35.0, -13.0}, 
      points = {{-7.0, 13.0}, {-1.0, 13.0}}));
end BallScrews_EJCDB;