within ServoWing.Loads.Components;
model JointTorque "关节合外力矩"
  extends ServoWing.Icons.BasicModel;
  parameter SI.Torque torque_load = 3100 "负载力矩";
  parameter SI.RotationalSpringConstant rotationalSpring = 112 * 57.3 "位置力矩";
  parameter SI.RotationalDampingConstant rotationalDamping = 2000 "位置阻尼";
  //变量
  SI.Angle angle_y "绕y轴转动角度";
  SI.Angle angle_z "绕x轴转动角度";
  SI.Torque torque_c[3] "负载刚度力矩";
  SI.Torque torque_d[3] "负载阻尼力矩";
  SI.Torque torque_k[3] "负载力矩";

  //实例化
  annotation (Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Rectangle(origin = {0.0, 0.0}, 
      lineColor = {64, 64, 64}, 
      fillColor = {192, 192, 192}, 
      fillPattern = FillPattern.HorizontalCylinder, 
      extent = {{-100.0, -10.0}, {100.0, 10.0}}), Rectangle(origin = {0.0, -35.0}, 
      extent = {{-60.0, -25.0}, {60.0, 25.0}}), Rectangle(origin = {0.0, -17.5}, 
      fillColor = {192, 192, 192}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-60.0, -7.5}, {60.0, 7.5}}), Rectangle(origin = {0.0, -53.0}, 
      fillColor = {192, 192, 192}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-60.0, -8.0}, {60.0, 8.0}}), Rectangle(origin = {0.0, -34.0}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-50.0, -16.0}, {50.0, 16.0}}), Polygon(origin = {0.0, -70.0}, 
      fillColor = {160, 160, 164}, 
      fillPattern = FillPattern.Solid, 
      points = {{60.0, 10.0}, {60.0, 0.0}, {75.0, 0.0}, {75.0, -10.0}, {-75.0, -10.0}, {-75.0, 0.0}, {-60.0, 0.0}, {-60.0, 10.0}, {60.0, 10.0}}), Rectangle(origin = {0.0, 35.0}, 
      extent = {{-60.0, -25.0}, {60.0, 25.0}}), Rectangle(origin = {0.0, 52.5}, 
      fillColor = {192, 192, 192}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-60.0, -7.5}, {60.0, 7.5}}), Rectangle(origin = {0.0, 17.5}, 
      fillColor = {192, 192, 192}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-60.0, -7.5}, {60.0, 7.5}}), Rectangle(origin = {0.0, 35.0}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-50.0, -16.0}, {50.0, 16.0}}), Polygon(origin = {0.0, 70.0}, 
      fillColor = {160, 160, 164}, 
      fillPattern = FillPattern.Solid, 
      points = {{60.0, -10.0}, {60.0, 0.0}, {75.0, 0.0}, {75.0, 10.0}, {-75.0, 10.0}, {-75.0, 0.0}, {-60.0, 0.0}, {-60.0, -10.0}, {60.0, -10.0}}), Line(visible = false, 
      origin = {-49.0, -67.5}, 
      points = {{-51.0, -32.5}, {-51.0, 32.5}, {51.0, 32.5}}, 
      color = {191, 0, 0}, 
      pattern = LinePattern.Dot), Text(origin = {0.0, -130.0}, 
      extent = {{-60.0, 30.0}, {60.0, -30.0}}, 
      textString = "负载力矩", 
      fontName = "微软雅黑", 
      textStyle = {TextStyle.None})}));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a "Coordinate system fixed to the component with one cut-force and cut-torque" 
    annotation (Placement(transformation(origin = {-100.0, 0.0}, 
      extent = {{-16.0, -16.0}, {16.0, 16.0}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b "Coordinate system fixed to the component with one cut-force and cut-torque" 
    annotation (Placement(transformation(origin = {100.0, 0.0}, 
      extent = {{-16.0, -16.0}, {16.0, 16.0}})));
  Modelica.Mechanics.MultiBody.Forces.Torque torque(animation = false)
    annotation (Placement(transformation(origin = {-1.0000000000000018, -0.9999999999999982}, 
      extent = {{-10.999999999999998, 11.000000000000002}, {11.000000000000002, -11.000000000000002}})));
  Modelica.Mechanics.MultiBody.Sensors.RelativeAngularVelocity relativeAngularVelocity
    annotation (Placement(transformation(origin = {0.0, -88.0}, 
      extent = {{-10.0, 10.0}, {10.0, -10.0}})));
  Modelica.Mechanics.MultiBody.Sensors.RelativeAngles relativeAngles
    annotation (Placement(transformation(origin = {0.0, -56.0}, 
      extent = {{-10.0, 10.0}, {10.0, -10.0}})));
equation 
  //转动角度
  angle_y = relativeAngles.angles[2];
  angle_z = relativeAngles.angles[3];
  //负载刚度力矩
  torque_c = -{0, angle_y, angle_z} * rotationalSpring;
  //负载阻尼力矩
  torque_d = -{0, relativeAngularVelocity.w_rel[2], relativeAngularVelocity.w_rel[3]} * rotationalDamping;

  //负载力矩
  torque_k[1] = 0;
  // if abs(relativeAngularVelocity.w_rel[2]) >= 1e-3 then 
  //   torque_k[2] = -torque_load * sign(relativeAngularVelocity.w_rel[2]) * sqrt(2) / 2;
  // else
  //   torque_k[2] = -(torque_load / 1e-2) * relativeAngularVelocity.w_rel[2] * sqrt(2) / 2;
  // end if;
  torque_k[2] = noEvent(if abs(relativeAngularVelocity.w_rel[2]) >= 1e-7 then 
    -torque_load * sign(relativeAngularVelocity.w_rel[2]) * sqrt(2) / 2 else 
    -(torque_load / 1e-7) * relativeAngularVelocity.w_rel[2] * sqrt(2) / 2);
  //if abs(relativeAngularVelocity.w_rel[3]) >= 1e-3 then 
  //   torque_k[3] = -torque_load * sign(relativeAngularVelocity.w_rel[3]) * sqrt(2) / 2;
  // else
  //   torque_k[3] = -(torque_load / 1e-2) * relativeAngularVelocity.w_rel[3] * sqrt(2) / 2;
  // end if;
  torque_k[3] = noEvent(if abs(relativeAngularVelocity.w_rel[3]) >= 1e-7 then 
    -torque_load * sign(relativeAngularVelocity.w_rel[3]) * sqrt(2) / 2 else 
    -(torque_load / 1e-7) * relativeAngularVelocity.w_rel[3] * sqrt(2) / 2);
  // torque_k[2] = torque_load * sqrt(2) / 2;
  // torque_k[3] = torque_load * sqrt(2) / 2;

  //和力矩
  torque.torque = torque_c + torque_k + torque_d;
  connect(torque.frame_a, frame_a)
    annotation (Line(origin = {-56.0, -12.0}, 
      points = {{44.0, 11.0}, {-44.0, 11.0}, {-44.0, 12.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(torque.frame_b, frame_b)
    annotation (Line(origin = {54.0, -12.0}, 
      points = {{-44.0, 11.0}, {46.0, 11.0}, {46.0, 12.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(relativeAngularVelocity.frame_a, frame_a)
    annotation (Line(origin = {-53.0, -44.0}, 
      points = {{43.0, -44.0}, {-47.0, -44.0}, {-47.0, 44.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(relativeAngularVelocity.frame_b, frame_b)
    annotation (Line(origin = {57.0, -44.0}, 
      points = {{-47.0, -44.0}, {43.0, -44.0}, {43.0, 44.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(frame_a, relativeAngles.frame_a)
    annotation (Line(origin = {-28.0, -33.0}, 
      points = {{-72.0, 33.0}, {-72.0, -23.0}, {18.0, -23.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(relativeAngles.frame_b, frame_b)
    annotation (Line(origin = {82.0, -33.0}, 
      points = {{-72.0, -23.0}, {18.0, -23.0}, {18.0, 33.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
end JointTorque;