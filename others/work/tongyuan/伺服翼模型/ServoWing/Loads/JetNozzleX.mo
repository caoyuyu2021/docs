within ServoWing.Loads;
model JetNozzleX "喷管结构_型号参数"
  /*-------------把质心平移至摆心处，则此时输入喷管的惯量参数即为相对于摆心的惯量参数---------------*/
  extends ServoWing.Icons.BasicModel;
  parameter Boolean animation = true
    "是否显示动画,true:显示,false:不显示";
  // parameter SI.Position r_CM[3](start = {0, 0, 0}) = {-109.36, 0, 0} / 1000
  //   "摆心,相对body的frame_a的相对坐标系";
  // parameter SI.Mass m(min = 0, start = 1) = 80 "喷管质量";
  parameter SI.Inertia I_11 = 70.62 "(1,1) 喷管惯量" 
    annotation (Dialog(group = 
      "相对于摆心的惯量"));
  parameter SI.Inertia I_22 = 70.62 "(2,2) 喷管惯量" 
    annotation (Dialog(group = 
      "相对于摆心的惯量"));
  parameter SI.Inertia I_33 = 70.62 "(3,3) 喷管惯量" 
    annotation (Dialog(group = 
      "相对于摆心的惯量"));
  parameter SI.Inertia I_21 = 0 "(2,1) 喷管惯量" 
    annotation (Dialog(group = 
      "相对于摆心的惯量"));
  parameter SI.Inertia I_31 = 0 "(3,1) 喷管惯量" 
    annotation (Dialog(group = 
      "相对于摆心的惯量"));
  parameter SI.Inertia I_32 = 0 "(3,2) 喷管惯量" 
    annotation (Dialog(group = 
      "相对于摆心的惯量"));

  parameter SI.Torque torque_load = 3100 "负载合力矩(需分解到两轴)" 
    annotation (Dialog(group = 
      "负载"));
  parameter SI.RotationalSpringConstant rotationalSpring = 112 * 180 / pi "位置力矩" 
    annotation (Dialog(group = 
      "负载"));
  parameter SI.RotationalDampingConstant rotationalDamping = 2000 "喷管摆动阻尼" 
    annotation (Dialog(group = 
      "负载"));

  // parameter SI.TranslationalSpringConstant c = 0.8e7 "喷管刚度" 
  //   annotation (Dialog(group = 
  //     "喷管"));
  // parameter SI.TranslationalDampingConstant d = 1e7 "喷管阻尼" 
  //   annotation (Dialog(group = 
  //     "喷管"));


  annotation (
    Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {360.0, 120.0}}, 
      grid = {2.0, 2.0}), graphics = {Rectangle(origin = {221.0, 19.0}, 
      fillColor = {255, 255, 255}, 
      extent = {{-65.0, 65.0}, {65.0, -65.0}}), Rectangle(origin = {-2.0, 18.0}, 
      lineColor = {255, 0, 0}, 
      fillColor = {255, 255, 255}, 
      pattern = LinePattern.Dash, 
      extent = {{-62.0, 68.0}, {62.0, -68.0}}), Rectangle(origin = {221.0, 19.0}, 
      lineColor = {255, 0, 0}, 
      fillColor = {255, 255, 255}, 
      pattern = LinePattern.Dash, 
      extent = {{-65.0, 65.0}, {65.0, -65.0}}), Text(origin = {13.0, 76.0}, 
      extent = {{-45.0, 6.0}, {45.0, -6.0}}, 
      textString = "后封头", 
      textStyle = {TextStyle.None}), Text(origin = {215.0, 78.0}, 
      extent = {{-45.0, 6.0}, {45.0, -6.0}}, 
      textString = "喷管", 
      textStyle = {TextStyle.None})}), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Polygon(origin = {-34.0, 2.0}, 
      fillColor = {102, 248, 255}, 
      fillPattern = FillPattern.HorizontalCylinder, 
      points = {{-20.0, 48.0}, {4.0, 48.0}, {20.0, 34.0}, {20.0, -32.0}, {6.0, -48.0}, {-20.0, -48.0}}), Polygon(origin = {23.0, 3.0}, 
      fillColor = {255, 180, 75}, 
      fillPattern = FillPattern.HorizontalCylinder, 
      points = {{-37.0, 21.0}, {37.0, 47.0}, {35.0, -47.0}, {-37.0, -19.0}}), Text(origin = {56.0, 50.0}, 
      extent = {{-36.0, 10.0}, {36.0, -10.0}}, 
      textString = "Angle_Y_deg", 
      textStyle = {TextStyle.None}), Text(origin = {56.0, 18.0}, 
      extent = {{-36.0, 10.0}, {36.0, -10.0}}, 
      textString = "Angle_Y_rad", 
      textStyle = {TextStyle.None}), Text(origin = {54.0, -16.0}, 
      extent = {{-36.0, 10.0}, {36.0, -10.0}}, 
      textString = "Angle_Z_deg", 
      textStyle = {TextStyle.None}), Text(origin = {54.0, -48.0}, 
      extent = {{-36.0, 10.0}, {36.0, -10.0}}, 
      textString = "Angle_Z_rad", 
      textStyle = {TextStyle.None})}));
  Interfaces.TranslationalInterfaces.Flange_a flange_y "绕Y轴转动的平动机械端口" 
    annotation (Placement(transformation(origin = {-100.0, 40.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));



  inner Modelica.Mechanics.MultiBody.World world(nominalLength = 0.5, 
    gravityType = Modelica.Mechanics.MultiBody.Types.GravityTypes.NoGravity)
    annotation (Placement(transformation(origin = {-98.0, 6.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Parts.Body body(animation = false, m = 100)
    annotation (Placement(transformation(origin = {10.0, 40.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation(
    r = {109.36, 0, 0} / 1000, animation = false)
    annotation (Placement(transformation(origin = {192.0, 6.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation1(r = {-350, 0, 0} / 1000, 
    animation = false) annotation (Placement(transformation(origin = {38.0, 6.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      rotation = 360.0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation2(animation = false, r = {-500, 0, 0} / 1000)
    annotation (Placement(transformation(origin = {-50.0, 6.0}, 
      extent = {{10.0, -10.0}, {-10.0, 10.0}}, 
      rotation = -360.0)));
  Modelica.Mechanics.MultiBody.Parts.Body body1(animation = false, 
    m = 1, 
    r_CM = {-109.36, 0, 0} / 1000, 
    I_11 = I_11, I_22 = I_22, I_33 = I_33, I_21 = I_21, I_31 = I_31, I_32 = I_32)

    annotation (Placement(transformation(origin = {256.0, 36.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation3(r = {-128.87, 294.22, 0} / 1000, 
    animation = false) annotation (Placement(transformation(origin = {38.0, -26.0}, 
      extent = {{10.0, -10.0}, {-10.0, 10.0}}, 
      rotation = -180.0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation4(r = {513.94, 359.87, 0} / 1000, 
    animation = false) annotation (Placement(transformation(origin = {194.0, -26.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      rotation = 180.0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation5(r = {-128.87, 294.22, 0} / 1000, 
    animation = false) annotation (Placement(transformation(origin = {42.0, 60.0}, 
      extent = {{10.0, -10.0}, {-10.0, 10.0}}, 
      rotation = -180.0)));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation1(rotationType = Modelica.Mechanics.MultiBody.Types.RotationTypes.RotationAxis, angle = -90, 
    animation = false) annotation (Placement(transformation(origin = {4.0, 60.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation6(r = {513.94, 359.87, 0} / 1000, 
    animation = false) annotation (Placement(transformation(origin = {182.0, 60.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      rotation = 180.0)));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation2(rotationType = Modelica.Mechanics.MultiBody.Types.RotationTypes.RotationAxis, angle = -90, 
    animation = false) annotation (Placement(transformation(origin = {216.0, 60.0}, 
      extent = {{10.0, -10.0}, {-10.0, 10.0}})));
  Sensors.Components.Angle_ZY angle_ZY
    annotation (Placement(transformation(origin = {304.0, -8.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealOutput angle_Z_deg "绕Z轴旋转角度,deg" 
    annotation (Placement(transformation(origin = {370.0, -20.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}), 
      iconTransformation(origin = {110.0, -20.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealOutput angle_Y_deg "绕Y轴旋转角度,deg" 
    annotation (Placement(transformation(origin = {370.0, 62.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}), 
      iconTransformation(origin = {110.0, 48.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  ServoWing.Loads.Components.JointTorque frict(torque_load = torque_load, rotationalSpring = rotationalSpring, rotationalDamping = rotationalDamping)
    annotation (Placement(transformation(origin = {114.0, 32.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Joints.Universal universal(n_a = {0, 1, 0}, n_b = {0, 0, 1}, animation = false)
    annotation (Placement(transformation(origin = {112.0, 6.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Joints.Spherical spherical(animation = false)
    annotation (Placement(transformation(origin = {74.0, 60.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Joints.Spherical spherical1(animation = false)
    annotation (Placement(transformation(origin = {74.0, -26.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic(useAxisFlange = true, animation = false)
    annotation (Placement(transformation(origin = {106.0, 60.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Joints.Universal universal1(n_a = {0, 1, 0}, n_b = {0, 0, 1}, animation = false)
    annotation (Placement(transformation(origin = {138.0, 60.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic1(useAxisFlange = true, animation = false)
    annotation (Placement(transformation(origin = {108.0, -26.0}, 
      extent = {{-10.0, 10.0}, {10.0, -10.0}})));
  Modelica.Mechanics.MultiBody.Joints.Universal universal2(n_a = {0, 1, 0}, n_b = {0, 0, 1}, phi_a(start = 0, fixed = false), animation = false)
    annotation (Placement(transformation(origin = {140.0, -26.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealOutput angle_Z_rad "绕Z轴旋转角度,rad" 
    annotation (Placement(transformation(origin = {370.0, -60.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}), 
      iconTransformation(origin = {110.0, -50.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealOutput angle_Y_rad "绕Y轴旋转角度,rad" 
    annotation (Placement(transformation(origin = {370.0, 20.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}), 
      iconTransformation(origin = {110.0, 18.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Math.Gain gain(k = pi / 180)
    annotation (Placement(transformation(origin = {344.0, 20.000000000000014}, 
      extent = {{-6.0, -6.0}, {6.0, 6.0}})));
  Modelica.Blocks.Math.Gain gain1(k = pi / 180)
    annotation (Placement(transformation(origin = {348.0, -59.999999999999986}, 
      extent = {{-6.0, -6.0}, {6.0, 6.0}})));
  Modelica.Mechanics.Translational.Sources.Position position1(
    useSupport = true) annotation (Placement(transformation(origin = {78.0, -66.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Translational.Components.Fixed fixed1(s0 = 407.5 / 1000)
    annotation (Placement(transformation(origin = {78.0, -94.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.Constant const3(k = 0)
    annotation (Placement(transformation(origin = {33.999999999999986, -65.99999999999999}, 
      extent = {{-6.0, -6.0}, {6.0, 6.0}})));
equation 
  connect(body.frame_a, fixedTranslation1.frame_a)
    annotation (Line(origin = {27.0, -10.0}, 
      points = {{-27.0, 50.0}, {-45.0, 50.0}, {-45.0, 16.0}, {1.0, 16.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(body1.frame_a, fixedRotation.frame_b)
    annotation (Line(origin = {224.0, 38.0}, 
      points = {{22.0, -2.0}, {14.0, -2.0}, {14.0, -32.0}, {-22.0, -32.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(fixedRotation1.frame_b, fixedTranslation5.frame_a)
    annotation (Line(origin = {28.0, 70.0}, 
      points = {{-14.0, -10.0}, {4.0, -10.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(fixedRotation2.frame_b, fixedTranslation6.frame_a)
    annotation (Line(origin = {219.0, 62.0}, 
      points = {{-13.0, -2.0}, {-27.0, -2.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(world.frame_b, fixedTranslation2.frame_b)
    annotation (Line(origin = {-108.0, 0.0}, 
      points = {{20.0, 6.0}, {48.0, 6.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(angle_ZY.Angle_Z, angle_Z_deg)
    annotation (Line(origin = {391.0, -90.0}, 
      points = {{-76.0, 80.0}, {-21.0, 80.0}, {-21.0, 70.0}}, 
      color = {0, 0, 127}));
  connect(angle_ZY.Angle_Y, angle_Y_deg)
    annotation (Line(origin = {335.0, 56.0}, 
      points = {{-20.0, -62.0}, {-13.0, -62.0}, {-13.0, 6.0}, {35.0, 6.0}}, 
      color = {0, 0, 127}));
  connect(fixedTranslation1.frame_b, universal.frame_a)
    annotation (Line(origin = {85.0, 5.0}, 
      points = {{-37.0, 1.0}, {17.0, 1.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(universal.frame_b, fixedRotation.frame_a)
    annotation (Line(origin = {152.0, 6.0}, 
      points = {{-30.0, 0.0}, {30.0, 0.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(frict.frame_a, universal.frame_a)
    annotation (Line(origin = {97.0, 16.0}, 
      points = {{7.0, 16.0}, {-9.0, 16.0}, {-9.0, -10.0}, {5.0, -10.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(frict.frame_b, fixedRotation.frame_a)
    annotation (Line(origin = {152.0, 16.0}, 
      points = {{-28.0, 16.0}, {-16.0, 16.0}, {-16.0, -10.0}, {30.0, -10.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(fixedTranslation5.frame_b, spherical.frame_a)
    annotation (Line(origin = {59.0, 60.0}, 
      points = {{-7.0, 0.0}, {5.0, 0.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(fixedTranslation3.frame_b, spherical1.frame_a)
    annotation (Line(origin = {42.0, -26.0}, 
      points = {{6.0, 0.0}, {22.0, 0.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(spherical.frame_b, prismatic.frame_a)
    annotation (Line(origin = {90.0, 60.0}, 
      points = {{-6.0, 0.0}, {6.0, 0.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(prismatic.frame_b, universal1.frame_a)
    annotation (Line(origin = {122.0, 60.0}, 
      points = {{-6.0, 0.0}, {6.0, 0.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(universal1.frame_b, fixedTranslation6.frame_b)
    annotation (Line(origin = {160.0, 60.0}, 
      points = {{-12.0, 0.0}, {12.0, 0.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(spherical1.frame_b, prismatic1.frame_a)
    annotation (Line(origin = {91.0, -27.0}, 
      points = {{-7.0, 1.0}, {7.0, 1.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(prismatic1.frame_b, universal2.frame_a)
    annotation (Line(origin = {124.0, -27.0}, 
      points = {{-6.0, 1.0}, {6.0, 1.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(universal2.frame_b, fixedTranslation4.frame_b)
    annotation (Line(origin = {167.0, -26.0}, 
      points = {{-17.0, 0.0}, {17.0, 0.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(fixedTranslation2.frame_a, fixedTranslation1.frame_a)
    annotation (Line(origin = {-6.0, 6.0}, 
      points = {{-34.0, 0.0}, {34.0, 0.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(fixedTranslation3.frame_a, fixedTranslation1.frame_a)
    annotation (Line(origin = {17.0, -10.0}, 
      points = {{11.0, -16.0}, {-35.0, -16.0}, {-35.0, 16.0}, {11.0, 16.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(fixedRotation1.frame_a, fixedTranslation1.frame_a)
    annotation (Line(origin = {5.0, 33.0}, 
      points = {{-11.0, 27.0}, {-23.0, 27.0}, {-23.0, -27.0}, {23.0, -27.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(fixedRotation2.frame_a, fixedRotation.frame_b)
    annotation (Line(origin = {221.0, 33.0}, 
      points = {{5.0, 27.0}, {17.0, 27.0}, {17.0, 2.0}, {18.0, 2.0}, {18.0, 3.0}, {17.0, 3.0}, {17.0, -27.0}, {-19.0, -27.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(fixedTranslation4.frame_a, fixedRotation.frame_b)
    annotation (Line(origin = {220.0, -8.0}, 
      points = {{-16.0, -18.0}, {18.0, -18.0}, {18.0, 14.0}, {-18.0, 14.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(fixedRotation.frame_a, angle_ZY.frame_a)
    annotation (Line(origin = {237.0, -9.0}, 
      points = {{-55.0, 15.0}, {-57.0, 15.0}, {-57.0, 3.0}, {19.0, 3.0}, {19.0, 5.0}, {57.0, 5.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(fixedRotation.frame_b, angle_ZY.frame_b)
    annotation (Line(origin = {248.0, -13.0}, 
      points = {{-46.0, 19.0}, {-10.0, 19.0}, {-10.0, 1.0}, {46.0, 1.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(angle_ZY.Angle_Y, gain.u)
    annotation (Line(origin = {326.0, -3.0}, 
      points = {{-11.0, -3.0}, {-4.0, -3.0}, {-4.0, 23.0}, {11.0, 23.0}}, 
      color = {0, 0, 127}));
  connect(gain.y, angle_Y_rad)
    annotation (Line(origin = {361.0, 20.0}, 
      points = {{-10.0, 0.0}, {9.0, 0.0}}, 
      color = {0, 0, 127}));
  connect(gain1.y, angle_Z_rad)
    annotation (Line(origin = {363.0, -60.0}, 
      points = {{-8.0, 0.0}, {7.0, 0.0}}, 
      color = {0, 0, 127}));
  connect(angle_ZY.Angle_Z, gain1.u)
    annotation (Line(origin = {328.0, -45.0}, 
      points = {{-13.0, 35.0}, {-6.0, 35.0}, {-6.0, -15.0}, {13.0, -15.0}}, 
      color = {0, 0, 127}));
  connect(flange_y, prismatic.axis)
    annotation (Line(origin = {7.0, 71.0}, 
      points = {{-107.0, -31.0}, {-97.0, -31.0}, {-97.0, 31.0}, {107.0, 31.0}, {107.0, -5.0}}, 
      color = {0, 127, 0}));
  connect(position1.support, fixed1.flange)
    annotation (Line(origin = {80.0, -86.0}, 
      points = {{-2.0, 10.0}, {-2.0, -8.0}}, 
      color = {0, 127, 0}));
  connect(const3.y, position1.s_ref)
    annotation (Line(origin = {47.0, -65.0}, 
      points = {{-6.0, -1.0}, {19.0, -1.0}}, 
      color = {0, 0, 127}));
  connect(position1.flange, prismatic1.axis)
    annotation (Line(origin = {102.0, -49.0}, 
      points = {{-14.0, -17.0}, {14.0, -17.0}, {14.0, 17.0}}, 
      color = {0, 127, 0}));
end JetNozzleX;