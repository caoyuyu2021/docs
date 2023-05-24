within ServoWing.Motors;
model ElectricLossBrake "失电制动器"
  extends Icons.BasicModel;
  //参数
  parameter SI.Voltage Va = 30 "额定电压" 
    annotation (Dialog(group = "电气参数"));
  parameter Real n = 0.8 "断电电压系数,小于额定电压的n倍则视为断电" 
    annotation (Dialog(group = "电气参数"));
  final parameter SI.Resistance Ra = 7.5 "电阻" 
    annotation (Dialog(group = "电气参数"));
  parameter SI.Torque torque_max(final min = 0, start = 1) = 50 "摩擦盘最大力矩" 
    annotation (Dialog(group = "机械参数"));
  // parameter Modelica.SIunits.Inertia J = 1e-3 "摩擦盘转动惯量" 
  //   annotation (Dialog(group = "摩擦盘"));
  Real f_normalized "为0时可以转动，为1时关闭";
  SI.Voltage V_temp "电压变量暂存,添加数据保护";
  //实例化
  Interfaces.ElectricalInterfaces.SinglePhase.PositivePin pin_ap
    annotation (Placement(transformation(origin = {-40.0, 100.0}, 
      extent = {{-10.0, 10.0}, {10.0, -10.0}})));
  Interfaces.ElectricalInterfaces.SinglePhase.NegativePin pin_an
    annotation (Placement(transformation(origin = {40.0, 100.0}, 
      extent = {{-10.0, 10.0}, {10.0, -10.0}})));
  Modelica.Electrical.Analog.Basic.Resistor ra(R = Ra)
    annotation (Placement(transformation(origin = {-54.0, 72.0}, 
      extent = {{10.0, -10.0}, {-10.0, 10.0}}, 
      rotation = 90.0)));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b "Left flange of shaft" annotation (Placement(transformation(origin = {100.0, 0.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}})));

  Modelica.Mechanics.Rotational.Components.Brake brake(useSupport = true, fn_max = torque_max * 2)
    annotation (Placement(transformation(origin = {0.0, -2.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a "Left flange of shaft" 
    annotation (Placement(transformation(origin = {-102.0, -2.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Rotational.Components.Fixed fixed
    annotation (Placement(transformation(origin = {0.0, -38.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor
    annotation (Placement(transformation(origin = {-6.0, 62.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  brake.f_normalized = f_normalized;
  //电压与制动的关系
  V_temp = max(voltageSensor.v, -0.1);
  if V_temp >= Va * n then 
    f_normalized = 0;
  elseif V_temp <= Va * n * n then 
    f_normalized = 1;
  else
    f_normalized = 1 / (Va * n ^ 2 - Va * n) * V_temp - Va * n / (Va * n ^ 2 - Va * n);
  end if;
  connect(ra.p, pin_ap)
    annotation (Line(origin = {-19.0, 59.0}, 
      points = {{-35.0, 23.0}, {-35.0, 41.0}, {-21.0, 41.0}}, 
      color = {0, 0, 255}));
  annotation (defaultComponentName = "VCM", 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Rectangle(origin = {-17.0, 0.0}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.HorizontalCylinder, 
      extent = {{-7.0, 70.0}, {7.0, -70.0}}), Rectangle(origin = {-3.0, 1.0}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.HorizontalCylinder, 
      extent = {{-3.0, 65.0}, {3.0, -65.0}}), Rectangle(origin = {-40.0, 0.0}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-34.0, 4.0}, {34.0, -4.0}}), Rectangle(origin = {55.0, 6.0}, 
      fillColor = {161, 161, 161}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-9.0, 78.0}, {9.0, -78.0}}), Line(origin = {23.0, 35.0}, 
      points = {{-23.0, 5.0}, {-15.0, -7.0}, {-7.0, 7.0}, {1.0, -5.0}, {9.0, 7.0}, {15.0, -5.0}, {23.0, 5.0}}), Line(origin = {11.0, -36.0}, 
      points = {{-11.0, 0.0}, {11.0, 0.0}}), Line(origin = {34.0, -36.0}, 
      points = {{-12.0, 0.0}, {12.0, 0.0}}), Rectangle(origin = {23.0, -36.0}, 
      fillColor = {209, 209, 209}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-11.0, 4.0}, {11.0, -4.0}}), Line(origin = {9.0, -32.0}, 
      points = {{3.0, 0.0}, {-3.0, 0.0}}), Line(origin = {9.0, -40.0}, 
      points = {{3.0, 0.0}, {-3.0, 0.0}}), Rectangle(origin = {-47.0, 38.0}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.CrossDiag, 
      extent = {{-19.0, 28.0}, {19.0, -28.0}}), Rectangle(origin = {-47.0, -38.0}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.CrossDiag, 
      extent = {{-19.0, 28.0}, {19.0, -28.0}}), Line(origin = {-88.0, 0.0}, 
      points = {{-12.0, 0.0}, {12.0, 0.0}}, 
      thickness = 2.0, 
      arrow = {Arrow.None, Arrow.Filled}, 
      arrowSize = 6.0), Text(origin = {0.0, -130.0}, 
      extent = {{-75.0, 30.0}, {75.0, -30.0}}, 
      textString = "失电制动器", 
      fontName = "微软雅黑", 
      textStyle = {TextStyle.None}), Line(origin = {69.0, 77.0}, 
      points = {{5.0, 5.0}, {-5.0, -5.0}}), Line(origin = {69.0, 65.0}, 
      points = {{5.0, 5.0}, {-5.0, -5.0}}), Line(origin = {69.0, 49.0}, 
      points = {{5.0, 5.0}, {-5.0, -5.0}}), Line(origin = {69.0, 35.0}, 
      points = {{5.0, 5.0}, {-5.0, -5.0}}), Line(origin = {69.0, 19.0}, 
      points = {{5.0, 5.0}, {-5.0, -5.0}}), Line(origin = {69.0, 7.0}, 
      points = {{5.0, 5.0}, {-5.0, -5.0}}), Line(origin = {69.0, -9.0}, 
      points = {{5.0, 5.0}, {-5.0, -5.0}}), Line(origin = {69.0, -23.0}, 
      points = {{5.0, 5.0}, {-5.0, -5.0}}), Line(origin = {69.0, -35.0}, 
      points = {{5.0, 5.0}, {-5.0, -5.0}}), Line(origin = {69.0, -47.0}, 
      points = {{5.0, 5.0}, {-5.0, -5.0}}), Line(origin = {69.0, -63.0}, 
      points = {{5.0, 5.0}, {-5.0, -5.0}})}), 
    Documentation(info = ""), 
    Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0})));
  connect(flange_a, brake.flange_a)
    annotation (Line(origin = {-56.0, -1.0}, 
      points = {{-46.0, -1.0}, {46.0, -1.0}}));

  connect(brake.flange_b, flange_b)
    annotation (Line(origin = {55.0, 0.0}, 
      points = {{-45.0, -2.0}, {45.0, -2.0}, {45.0, 0.0}}));

  connect(brake.support, fixed.flange)
    annotation (Line(origin = {0.0, -20.0}, 
      points = {{0.0, 8.0}, {0.0, -18.0}}));

  connect(ra.n, pin_an)
    annotation (Line(origin = {-7.0, 70.0}, 
      points = {{-47.0, -8.0}, {-47.0, -30.0}, {47.0, -30.0}, {47.0, 30.0}}, 
      color = {0, 0, 255}));
  connect(voltageSensor.p, pin_ap)
    annotation (Line(origin = {-28.0, 81.0}, 
      points = {{12.0, -19.0}, {-12.0, -19.0}, {-12.0, 19.0}}, 
      color = {0, 0, 255}));
  connect(voltageSensor.n, pin_an)
    annotation (Line(origin = {22.0, 81.0}, 
      points = {{-18.0, -19.0}, {18.0, -19.0}, {18.0, 19.0}}, 
      color = {0, 0, 255}));
end ElectricLossBrake;