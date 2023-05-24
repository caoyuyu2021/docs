within ServoWing.Mechanics;
model TelescopicRope "伸缩翼绳索驱动机构"
  rope.ropeT1D ropeT1D1(L0 = 0.4)
    annotation (Placement(transformation(origin = {2.0, 8.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  rope.ropeT1D ropeT1D2(L0 = 0.4)
    annotation (Placement(transformation(origin = {2.0, -14.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  rope.sheaveT1D sheaveT1D1
    annotation (Placement(transformation(origin = {48.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      rotation = 270.0)));
  rope.sheaveT1D sheaveT1D2
    annotation (Placement(transformation(origin = {-40.0, 0.0}, 
      extent = {{-10.0, 10.0}, {10.0, -10.0}}, 
      rotation = -90.0)));



  Modelica.Mechanics.Translational.Interfaces.Flange_a pull1
    annotation (Placement(transformation(origin = {20.0, 40.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a drive
    annotation (Placement(transformation(origin = {-100.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  annotation (Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    grid = {2.0, 2.0}), graphics = {Rectangle(origin = {0.0, 0.0}, 
    fillColor = {255, 255, 255}, 
    fillPattern = FillPattern.Solid, 
    lineThickness = 2.0, 
    extent = {{-100.0, 100.0}, {100.0, -100.0}}, 
    radius = 25.0), Text(origin = {4.0, -6.0}, 
    extent = {{-76.0, 68.0}, {76.0, -68.0}}, 
    textString = "绳索驱动", 
    textStyle = {TextStyle.None})}));
  Modelica.Mechanics.Translational.Components.Fixed fixed
    annotation (Placement(transformation(origin = {-60.0, -8.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Translational.Components.Fixed fixed1
    annotation (Placement(transformation(origin = {80.0, -8.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  connect(sheaveT1D2.rope1, ropeT1D1.rope1)
    annotation (Line(origin = {-37.0, 8.0}, 
      points = {{7.0, -2.0}, {17.0, -2.0}, {17.0, 0.0}, {28.0, 0.0}}, 
      color = {0, 127, 0}));
  connect(sheaveT1D2.rope2, ropeT1D2.rope1)
    annotation (Line(origin = {-37.0, -9.0}, 
      points = {{7.0, 4.0}, {17.0, 4.0}, {17.0, -5.0}, {28.0, -5.0}}, 
      color = {0, 127, 0}));
  connect(ropeT1D1.rope2, sheaveT1D1.rope1)
    annotation (Line(origin = {24.0, 7.0}, 
      points = {{-11.0, 1.0}, {0.0, 1.0}, {0.0, -1.0}, {14.0, -1.0}}, 
      color = {0, 127, 0}));
  connect(ropeT1D2.rope2, sheaveT1D1.rope2)
    annotation (Line(origin = {24.0, -10.0}, 
      points = {{-11.0, -4.0}, {0.0, -4.0}, {0.0, 5.0}, {14.0, 5.0}}, 
      color = {0, 127, 0}));
  connect(sheaveT1D2.drive, drive)
    annotation (Line(origin = {-40.0, 35.0}, 
      points = {{0.0, -25.0}, {0.0, -15.0}, {-60.0, -15.0}, {-60.0, -35.0}}, 
      color = {0, 0, 0}));
  connect(sheaveT1D2.pull, fixed.flange)
    annotation (Line(origin = {-57.0, -11.0}, 
      points = {{7.0, 11.0}, {-3.0, 11.0}, {-3.0, 3.0}}, 
      color = {0, 127, 0}));
  connect(sheaveT1D1.pull, fixed1.flange)
    annotation (Line(origin = {70.0, -7.0}, 
      points = {{-12.0, 7.0}, {10.0, 7.0}, {10.0, -1.0}}, 
      color = {0, 127, 0}));
  connect(pull1, ropeT1D1.rope1)
    annotation (Line(origin = {1.0, 25.0}, 
      points = {{19.0, 15.0}, {-21.0, 15.0}, {-21.0, -17.0}, {-10.0, -17.0}}, 
      color = {0, 127, 0}));
end TelescopicRope;