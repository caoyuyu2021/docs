within ServoWing.Motors.Components;
model FrictionPlate "摩擦盘"
  extends Modelica.Mechanics.Rotational.Interfaces.PartialElementaryTwoFlangesAndSupport2(useSupport = true);
  extends Modelica.Mechanics.Rotational.Interfaces.PartialFriction;
  //参数
  parameter SI.Force fn_max(final min = 0, start = 1) "最大法向力,大于法向力1%则摩擦片打开";

  final parameter Real mue_pos[:,2] = [0, 1] "摩擦系数";
  final parameter Real peak(final min = 1) = 1 "";
  final parameter Real cgeo(final min = 0) = 1 " ";
  //变量
  Real f_normalized "为0时可以转动，为1时关闭";
  Real f_temp;
  SI.Angle phi
    "Angle between shaft flanges (flange_a, flange_b) and support";
  SI.Torque tau "Brake friction torque";
  SI.AngularVelocity w "Absolute angular velocity of flange_a and flange_b";
  SI.AngularAcceleration a
    "Absolute angular acceleration of flange_a and flange_b";

  Real mue0 "Friction coefficient for w=0 and forward sliding";
  SI.Force fn "Normal force (=fn_max*f_normalized)";
  // 实例化
  Interfaces.TranslationalInterfaces.Flange_a flange_a1
    annotation (extent = [-10, 110; 10, 90], 
      Placement(transformation(origin = {-100.0, -40.0}, 
        extent = {{-10.0, 10.0}, {10.0, -10.0}})));
  Interfaces.TranslationalInterfaces.Flange_b flange_b1
    annotation (extent = [-10, 110; 10, 90], 
      Placement(transformation(origin = {100.0, -42.0}, 
        extent = {{-10.0, 10.0}, {10.0, -10.0}})));
  Modelica.Mechanics.Translational.Sensors.ForceSensor forceSensor
    annotation (Placement(transformation(origin = {-56.0, -62.0}, 
      extent = {{10.0, -10.0}, {-10.0, 10.0}}, 
      rotation = -270.0)));
equation 
  //f_normalized = 1 - abs(forceSensor.f / fn_max);
  //f_normalized为0时可以转动，为1时关闭
  f_temp = (abs(forceSensor.f) - fn_max) / fn_max;
  if f_temp >= 0.01 then 
    f_normalized = 0;
  elseif f_temp < 0 then 
    f_normalized = 1;
  else
    f_normalized = -(f_temp - 0.01) * 100;
  end if;
  mue0 = Modelica.Math.tempInterpol1(
    0, 
    mue_pos, 
    2);

  phi = flange_a.phi - phi_support;
  flange_b.phi = flange_a.phi;

  // Angular velocity and angular acceleration of flanges flange_a and flange_b
  w = der(phi);
  a = der(w);
  w_relfric = w;
  a_relfric = a;

  // Friction torque, normal force and friction torque for w_rel=0
  flange_a.tau + flange_b.tau - tau = 0;
  fn = fn_max * f_normalized;
  tau0 = mue0 * cgeo * fn;
  tau0_max = peak * tau0;
  free = fn <= 0;

  // Friction torque
  tau = if locked then sa * unitTorque else if free then 0 else cgeo * fn * (if 
    startForward then Modelica.Math.tempInterpol1(
    w, 
    mue_pos, 
    2) else if startBackward then -Modelica.Math.tempInterpol1(
    -w, 
    mue_pos, 
    2) else if pre(mode) == Forward then Modelica.Math.tempInterpol1(
    w, 
    mue_pos, 
    2) else -Modelica.Math.tempInterpol1(
    -w, 
    mue_pos, 
    2));
  annotation (
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Rectangle(origin = {13.0, 0.0}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.HorizontalCylinder, 
      extent = {{-7.0, 70.0}, {7.0, -70.0}}), Rectangle(origin = {27.0, 1.0}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.HorizontalCylinder, 
      extent = {{-3.0, 65.0}, {3.0, -65.0}}), Rectangle(origin = {-10.0, 0.0}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-34.0, 4.0}, {34.0, -4.0}}), Text(origin = {0.0, -130.0}, 
      extent = {{-45.0, 30.0}, {45.0, -30.0}}, 
      textString = "摩擦盘", 
      fontName = "微软雅黑", 
      textStyle = {TextStyle.None})}));
  connect(flange_a1, forceSensor.flange_a)
    annotation (Line(origin = {-78.0, -51.0}, 
      points = {{-22.0, 11.0}, {22.0, 11.0}, {22.0, -1.0}}, 
      color = {0, 127, 0}));
  connect(forceSensor.flange_b, flange_b1)
    annotation (Line(origin = {-78.0, -90.0}, 
      points = {{22.0, 18.0}, {178.0, 18.0}, {178.0, 48.0}}, 
      color = {0, 127, 0}));
end FrictionPlate;