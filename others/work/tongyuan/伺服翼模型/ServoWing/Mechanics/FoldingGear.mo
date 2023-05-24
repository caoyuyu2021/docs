within ServoWing.Mechanics;
model FoldingGear "折叠翼丝杠驱动机构"



  Modelica.Mechanics.Rotational.Interfaces.Flange_a drive
    annotation (Placement(transformation(origin = {-100.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  annotation (Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    grid = {2.0, 2.0}), graphics = {Text(origin = {0.0, -120.0}, 
    extent = {{-60.0, 15.0}, {60.0, -15.0}}, 
    textString = "丝杠驱动", 
    textStyle = {TextStyle.None}), Bitmap(origin = {0.0, 0.0}, 
    extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    fileName = "modelica://ServoWing/Pictures/滚珠丝杠.svg")}));



  ExternalSpurgear externalSpurgear(zA = 17, zB = 57)
    annotation (Placement(transformation(origin = {-64.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  ExternalSpurgear externalSpurgear1(zA = 10, zB = 10)
    annotation (Placement(transformation(origin = {-26.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));



  BallScrews ballScrews(s0_start = 0, Ph = 40)
    annotation (Placement(transformation(origin = {16.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a drive1 "输出" 
    annotation (Placement(transformation(origin = {98.0, 58.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Translational.Components.IdealGearR2T idealGearR2T1
    annotation (Placement(transformation(origin = {50.0, 58.0}, 
      extent = {{10.0, -10.0}, {-10.0, 10.0}})));
equation 
  connect(externalSpurgear.flange_b, externalSpurgear1.flange_a)
    annotation (Line(origin = {-33.0, 0.0}, 
      points = {{-21.0, 0.0}, {-3.0, 0.0}}, 
      color = {0, 0, 0}));
  connect(drive, externalSpurgear.flange_a)
    annotation (Line(origin = {-87.0, 0.0}, 
      points = {{-13.0, 0.0}, {13.0, 0.0}}, 
      color = {0, 0, 0}));
  connect(externalSpurgear1.flange_b, ballScrews.flange_r)
    annotation (Line(origin = {-5.0, 0.0}, 
      points = {{-11.0, 0.0}, {11.0, 0.0}}, 
      color = {0, 0, 0}));
  connect(ballScrews.flange_t, idealGearR2T1.flangeT)
    annotation (Line(origin = {30.0, 18.0}, 
      points = {{-14.0, -13.0}, {-14.0, 40.0}, {10.0, 40.0}}, 
      color = {0, 127, 0}));
  connect(idealGearR2T1.flangeR, drive1)
    annotation (Line(origin = {76.0, 52.0}, 
      points = {{-16.0, 6.0}, {22.0, 6.0}}, 
      color = {0, 0, 0}));
end FoldingGear;