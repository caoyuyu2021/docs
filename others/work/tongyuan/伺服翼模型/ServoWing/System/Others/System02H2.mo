within ServoWing.System.Others;
model System02H2 "伺服翼系统模型"



  ServoWing.Structure.MainBodyFlex mainBody annotation (Placement(transformation(origin = {-58.0, -12.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}})));

  ServoWing.Structure.TelescopicWingFlex telescopicWing annotation (Placement(transformation(origin = {40.0, -12.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}})));

  ServoWing.Structure.FoldingWingsFlex foldingWings annotation (Placement(transformation(origin = {150.0, -12.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}})));

  Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic(useAxisFlange = true)
    annotation (Placement(transformation(origin = {-24.999999999999996, -12.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute(useAxisFlange = true, 
    n = {0, 1, 0}) annotation (Placement(transformation(origin = {78.0, -12.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  annotation (Diagram(coordinateSystem(extent = {{-180.0, -100.0}, {180.0, 120.0}}, 
    grid = {2.0, 2.0}), graphics = {Rectangle(origin = {-184.0, 101.0}, 
    fillColor = {255, 255, 255}, 
    fillPattern = FillPattern.Solid, 
    extent = {{-56.0, 49.0}, {56.0, -49.0}}), Text(origin = {-182.0, 106.0}, 
    lineColor = {0, 0, 0}, 
    extent = {{-39.0, 15.0}, {39.0, -15.0}}, 
    textString = "折叠角度，范围0~90deg", 
    textStyle = {TextStyle.None}, 
    textColor = {0, 0, 0}, 
    horizontalAlignment = LinePattern.None), Text(origin = {-181.99999999999997, 64.0}, 
    lineColor = {0, 0, 0}, 
    extent = {{-39.0, 9.0}, {38.99999999999997, -9.000000000000004}}, 
    textString = "伸缩距离，范围0~0.34m", 
    textStyle = {TextStyle.None}, 
    textColor = {0, 0, 0}, 
    horizontalAlignment = LinePattern.None), Text(origin = {-189.0, 140.0}, 
    lineColor = {0, 0, 0}, 
    extent = {{-46.0, 9.0}, {46.0, -9.000000000000028}}, 
    textString = "翼的构型", 
    textStyle = {TextStyle.None}, 
    textColor = {0, 0, 0}, 
    horizontalAlignment = LinePattern.None), Rectangle(origin = {-196.5, -51.0}, 
    fillColor = {255, 255, 255}, 
    fillPattern = FillPattern.Solid, 
    extent = {{-53.5, 25.0}, {53.50000000000003, -25.0}}), Text(origin = {-192.0, -37.999999999999986}, 
    lineColor = {0, 0, 0}, 
    extent = {{-46.0, 9.0}, {46.0, -9.000000000000028}}, 
    textString = "输入气动力", 
    textStyle = {TextStyle.None}, 
    textColor = {0, 0, 0}, 
    horizontalAlignment = LinePattern.None), Text(origin = {-28.0, -111.0}, 
    lineColor = {0, 0, 0}, 
    extent = {{-12.0, 7.0}, {12.0, -7.0}}, 
    textString = "结果", 
    textStyle = {TextStyle.None}, 
    textColor = {0, 0, 0}, 
    horizontalAlignment = LinePattern.None), Text(origin = {76.00000000000001, -111.0}, 
    lineColor = {0, 0, 0}, 
    extent = {{-12.0, 7.0}, {12.0, -7.0}}, 
    textString = "结果", 
    textStyle = {TextStyle.None}, 
    textColor = {0, 0, 0}, 
    horizontalAlignment = LinePattern.None), Text(origin = {150.00000000000003, -105.0}, 
    lineColor = {0, 0, 0}, 
    extent = {{-12.0, 7.0}, {12.0, -7.0}}, 
    textString = "结果", 
    textStyle = {TextStyle.None}, 
    textColor = {0, 0, 0}, 
    horizontalAlignment = LinePattern.None)}), 
    experiment(Algorithm = Dassl, Interval = 0.02, StartTime = 0, StopTime = 20, Tolerance = 0.0001), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0})));
  Modelica.Mechanics.Rotational.Sources.Position position
    annotation (Placement(transformation(origin = {-4.0, 66.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Rotational.Sources.Position position1
    annotation (Placement(transformation(origin = {-88.0, 24.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Mechanics.TelescopicGear telescopicRope(ballScrews(ratio = 2)) annotation (Placement(transformation(origin = {-30.0, 24.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Mechanics.FoldingGear foldingRope(ballScrews(ratio = 4), externalSpurgear(zA = 1, zB = 1)) annotation (Placement(transformation(origin = {44.0, 40.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Math.Gain gain(k = -Modelica.Constants.pi / 180 * 4)
    annotation (Placement(transformation(origin = {-67.0, 66.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));



  Modelica.Blocks.Interfaces.RealInput foldAngle "折叠角度，范围0~90deg" 
    annotation (Placement(transformation(origin = {-192.0, 120.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}), 
      iconTransformation(origin = {-109.99999999999999, 90.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealInput teleLength "伸缩距离，范围0~0.34m" 
    annotation (Placement(transformation(origin = {-192.0, 80.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}), 
      iconTransformation(origin = {-109.99999999999999, 50.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Math.Gain gain1(k = 6.706)
    annotation (Placement(transformation(origin = {-114.0, 24.0}, 
      extent = {{-5.0, -5.0}, {5.0, 5.0}})));
  Modelica.Blocks.Interfaces.RealInput aerodynamicforce[3] "气动力，x=0，y:正向阻力 z:升力" 
    annotation (Placement(transformation(origin = {-192.0, -56.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}), 
      iconTransformation(origin = {-109.99999999999999, -86.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealOutput result_mainbody[9] "固定翼输出，1：3 根部力 4：6根部力矩 7：9 末端位移" 
    annotation (Placement(transformation(origin = {-58.00000000000002, -108.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      rotation = 270.0), 
      iconTransformation(origin = {110.0, 90.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  inner Modelica.Mechanics.MultiBody.World world(gravityType = Modelica.Mechanics.MultiBody.Types.GravityTypes.NoGravity)
    annotation (Placement(transformation(origin = {-142.0, -12.000000000000007}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealOutput result_teleWing[9] "伸缩翼输出，1：3 根部力 4：6根部力矩 7：9 末端位移" 
    annotation (Placement(transformation(origin = {50.00000000000001, -108.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      rotation = 270.0), 
      iconTransformation(origin = {110.0, 28.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealOutput result_foldWing1[6] "折叠翼输出，1：3 根部力 4：6根部力矩 " 
    annotation (Placement(transformation(origin = {120.00000000000001, -108.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      rotation = 270.0), 
      iconTransformation(origin = {110.0, -50.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Sensors.RelativePosition relativePosition
    annotation (Placement(transformation(origin = {-58.00000000000002, -42.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Sensors.RelativePosition relativePosition1(resolveInFrame = Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_a)
    annotation (Placement(transformation(origin = {40.00000000000001, -41.99999999999999}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Sensors.CutForce cutForce(animation = false, positiveSign = false)
    annotation (Placement(transformation(origin = {-116.99999999999999, -11.999999999999998}, 
      extent = {{-5.0, -5.0}, {4.999999999999986, 5.0}})));
  Modelica.Mechanics.MultiBody.Sensors.CutForce cutForce1(animation = false, positiveSign = false)
    annotation (Placement(transformation(origin = {-2.9999999999999982, -12.0}, 
      extent = {{-4.999999999999993, -4.999999999999993}, {4.999999999999993, 4.999999999999993}})));
  Modelica.Mechanics.MultiBody.Sensors.CutTorque cutTorque(animation = false, positiveSign = false)
    annotation (Placement(transformation(origin = {-97.00000000000006, -12.0}, 
      extent = {{-5.0, -4.999999999999993}, {5.0, 4.999999999999993}})));
  Modelica.Mechanics.MultiBody.Sensors.CutTorque cutTorque1(animation = false, positiveSign = false)
    annotation (Placement(transformation(origin = {14.000000000000004, -12.0}, 
      extent = {{-5.0, -5.0}, {5.0, 5.0}})));
  Modelica.Mechanics.MultiBody.Sensors.CutForce cutForce2(animation = false, positiveSign = false)
    annotation (Placement(transformation(origin = {105.0, -12.0}, 
      extent = {{-5.0, -5.0}, {5.0, 5.0}})));
  Modelica.Mechanics.MultiBody.Sensors.CutTorque cutTorque2(positiveSign = false, animation = false)
    annotation (Placement(transformation(origin = {125.0, -12.0}, 
      extent = {{-5.0, -5.0}, {5.0, 5.0}})));
equation 
  connect(telescopicWing.frame_b, revolute.frame_a)
    annotation (Line(origin = {64.0, -9.0}, 
      points = {{-14.0, -3.0}, {4.0, -3.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(position1.flange, telescopicRope.drive)
    annotation (Line(origin = {-179.0, 38.0}, 
      points = {{101.0, -14.0}, {139.0, -14.0}}, 
      color = {0, 0, 0}));
  connect(telescopicRope.pull1, prismatic.axis)
    annotation (Line(origin = {-33.0, 24.0}, 
      points = {{5.0, 4.0}, {5.0, 16.0}, {16.0, 16.0}, {16.0, -30.0}}, 
      color = {0, 127, 0}));
  connect(position.flange, foldingRope.drive)
    annotation (Line(origin = {20.0, 53.0}, 
      points = {{-14.0, 13.0}, {2.0, 13.0}, {2.0, -13.0}, {14.0, -13.0}}, 
      color = {0, 0, 0}));
  connect(foldingRope.drive1, revolute.axis)
    annotation (Line(origin = {70.0, 22.0}, 
      points = {{-16.0, 24.0}, {8.0, 24.0}, {8.0, -24.0}}, 
      color = {0, 0, 0}));
  connect(gain.y, position.phi_ref)
    annotation (Line(origin = {-36.0, 66.0}, 
      points = {{-20.0, 0.0}, {20.0, 0.0}}, 
      color = {0, 0, 127}));
  connect(gain1.y, position1.phi_ref)
    annotation (Line(origin = {-101.0, 24.0}, 
      points = {{-8.0, 0.0}, {1.0, 0.0}}, 
      color = {0, 0, 127}));
  connect(mainBody.aerodynamicforce, aerodynamicforce)
    annotation (Line(origin = {-116.0, -20.0}, 
      points = {{58.0, 19.0}, {58.0, 26.0}, {38.0, 26.0}, {38.0, -36.0}, {-76.0, -36.0}}, 
      color = {0, 0, 127}));
  connect(aerodynamicforce, telescopicWing.aerodynamicforce)
    annotation (Line(origin = {-75.0, -18.0}, 
      points = {{-117.0, -38.0}, {99.0, -38.0}, {99.0, 22.0}, {115.0, 22.0}, {115.0, 17.0}}, 
      color = {0, 0, 127}));
  connect(aerodynamicforce, foldingWings.aerodynamicforce)
    annotation (Line(origin = {-38.0, -15.0}, 
      points = {{-154.0, -41.0}, {132.0, -41.0}, {132.0, 25.0}, {188.0, 25.0}, {188.0, 14.0}}, 
      color = {0, 0, 127}));
  connect(foldAngle, gain.u)
    annotation (Line(origin = {-135.0, 93.0}, 
      points = {{-57.0, 27.0}, {21.0, 27.0}, {21.0, -27.0}, {56.0, -27.0}}, 
      color = {0, 0, 127}));
  connect(teleLength, gain1.u)
    annotation (Line(origin = {-156.0, 52.0}, 
      points = {{-36.0, 28.0}, {32.0, 28.0}, {32.0, -28.0}, {36.0, -28.0}}, 
      color = {0, 0, 127}));
  connect(mainBody.frame_b, prismatic.frame_a)
    annotation (Line(origin = {-28.0, -12.0}, 
      points = {{-20.0, 0.0}, {-7.0, 0.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(relativePosition.frame_a, mainBody.frame_a)
    annotation (Line(origin = {-70.0, -27.0}, 
      points = {{2.0, -15.0}, {-2.0, -15.0}, {-2.0, 15.0}, {2.0, 15.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(relativePosition.frame_b, prismatic.frame_a)
    annotation (Line(origin = {-41.0, -27.0}, 
      points = {{-7.0, -15.0}, {1.0, -15.0}, {1.0, 15.0}, {6.0, 15.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(relativePosition1.frame_b, revolute.frame_a)
    annotation (Line(origin = {59.0, -27.0}, 
      points = {{-9.0, -15.0}, {1.0, -15.0}, {1.0, 15.0}, {9.0, 15.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(world.frame_b, cutForce.frame_a)
    annotation (Line(origin = {-127.0, -12.0}, 
      points = {{-5.0, 0.0}, {4.999999999999972, 1.0658141036401503e-14}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(cutForce.frame_b, cutTorque.frame_a)
    annotation (Line(origin = {-107.0, -12.0}, 
      points = {{-5.000000000000028, 1.0658141036401503e-14}, {4.999999999999943, 0.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(mainBody.frame_a, cutTorque.frame_b)
    annotation (Line(origin = {-80.0, -12.0}, 
      points = {{12.0, 0.0}, {-12.000000000000057, 0.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(prismatic.frame_b, cutForce1.frame_a)
    annotation (Line(origin = {-11.0, -12.0}, 
      points = {{-4.0, 0.0}, {3.0, 0.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(cutForce1.frame_b, cutTorque1.frame_a)
    annotation (Line(origin = {6.0, -12.0}, 
      points = {{-4.0, 0.0}, {3.0, 0.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(cutTorque1.frame_b, telescopicWing.frame_a)
    annotation (Line(origin = {25.0, -12.0}, 
      points = {{-6.0, 0.0}, {5.0, 0.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(relativePosition1.frame_a, telescopicWing.frame_a)
    annotation (Line(origin = {28.0, -27.0}, 
      points = {{2.0, -15.0}, {-2.0, -15.0}, {-2.0, 15.0}, {2.0, 15.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(revolute.frame_b, cutForce2.frame_a)
    annotation (Line(origin = {94.0, -12.0}, 
      points = {{-6.0, 0.0}, {6.0, 0.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(cutForce2.frame_b, cutTorque2.frame_a)
    annotation (Line(origin = {115.0, -12.0}, 
      points = {{-5.0, 0.0}, {5.0, 0.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(cutTorque2.frame_b, foldingWings.frame_a)
    annotation (Line(origin = {135.0, -12.0}, 
      points = {{-5.0, 0.0}, {5.0, 0.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(cutForce.force, result_mainbody[1:3])
    annotation (Line(origin = {-89.0, -63.0}, 
      points = {{-32.0, 45.0}, {-32.0, -5.0}, {31.0, -5.0}, {31.0, -45.0}}, 
      color = {0, 0, 127}));
  connect(cutTorque.torque, result_mainbody[4:6])
    annotation (Line(origin = {-79.0, -62.0}, 
      points = {{-22.0, 45.0}, {-22.0, -6.0}, {21.0, -6.0}, {21.0, -46.0}}, 
      color = {0, 0, 127}));
  connect(relativePosition.r_rel, result_mainbody[7:9])
    annotation (Line(origin = {-58.0, -80.0}, 
      points = {{0.0, 27.0}, {0.0, -28.0}}, 
      color = {0, 0, 127}));
  connect(cutForce1.force, result_teleWing[1:3])
    annotation (Line(origin = {22.0, -62.0}, 
      points = {{-29.0, 45.0}, {-29.0, -10.0}, {28.0, -10.0}, {28.0, -46.0}}, 
      color = {0, 0, 127}));
  connect(cutTorque1.torque, result_teleWing[4:6])
    annotation (Line(origin = {30.0, -63.0}, 
      points = {{-20.0, 45.0}, {-20.0, -9.0}, {20.0, -9.0}, {20.0, -45.0}}, 
      color = {0, 0, 127}));
  connect(relativePosition1.r_rel, result_teleWing[7:9])
    annotation (Line(origin = {45.0, -80.0}, 
      points = {{-5.0, 27.0}, {-5.0, 8.0}, {5.0, 8.0}, {5.0, -28.0}}, 
      color = {0, 0, 127}));
  connect(cutForce2.force, result_foldWing1[1:3])
    annotation (Line(origin = {111.0, -63.0}, 
      points = {{-10.0, 45.0}, {-10.0, 7.0}, {9.0, 7.0}, {9.0, -45.0}}, 
      color = {0, 0, 127}));
  connect(cutTorque2.torque, result_foldWing1[4:6])
    annotation (Line(origin = {121.0, -63.0}, 
      points = {{0.0, 45.0}, {0.0, -45.0}, {-1.0, -45.0}}, 
      color = {0, 0, 127}));
end System02H2;