within ServoWing.Mechanics;
model TelescopicGear "伸缩翼丝杠驱动机构"
  Modelica.Mechanics.Translational.Interfaces.Flange_a pull1
    annotation (Placement(transformation(origin = {20.0, 40.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
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



  ExternalSpurgear externalSpurgear(zB = 57, zA = 17)
    annotation (Placement(transformation(origin = {-64.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  ExternalSpurgear externalSpurgear1(zA = 10, zB = 10)
    annotation (Placement(transformation(origin = {-26.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  BallScrews ballScrews(Ph = 40, s0_start = 0)
    annotation (Placement(transformation(origin = {20.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  connect(drive, externalSpurgear.flange_a)
    annotation (Line(origin = {-80.0, 0.0}, 
      points = {{-20.0, 0.0}, {6.0, 0.0}}, 
      color = {0, 0, 0}));
  connect(externalSpurgear.flange_b, externalSpurgear1.flange_a)
    annotation (Line(origin = {-33.0, 0.0}, 
      points = {{-21.0, 0.0}, {-3.0, 0.0}}, 
      color = {0, 0, 0}));
  connect(externalSpurgear1.flange_b, ballScrews.flange_r)
    annotation (Line(origin = {-12.0, 0.0}, 
      points = {{-4.0, 0.0}, {22.0, 0.0}}, 
      color = {0, 0, 0}));
  connect(pull1, ballScrews.flange_t)
    annotation (Line(origin = {19.0, 23.0}, 
      points = {{1.0, 17.0}, {1.0, -18.0}}, 
      color = {0, 127, 0}));
end TelescopicGear;