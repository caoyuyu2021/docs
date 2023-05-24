within ServoWing.Mechanics;
model FoldingRope "折叠翼绳索驱动机构"
  Modelica.Mechanics.Rotational.Interfaces.Flange_a drive_L "电机驱动" 
    annotation (Placement(transformation(origin = {100.0, 60.0}, 
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
  rope.winchT1D_S winchT1D1
    annotation (Placement(transformation(origin = {39.0, 21.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      rotation = -90.0)));
  rope.winchT1D_S winchT1D2
    annotation (Placement(transformation(origin = {-46.0, 20.0}, 
      extent = {{-10.0, 10.0}, {10.0, -10.0}}, 
      rotation = -90.0)));
  rope.ropeT1D ropeT1D1
    annotation (Placement(transformation(origin = {2.0, 24.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  rope.winchT1D_N winchT1D3 annotation (Placement(transformation(origin = {-46.0, -24.0}, 
    extent = {{-10.0, 10.0}, {10.0, -10.0}}, 
    rotation = -90.0)));

  rope.winchT1D_S winchT1D4
    annotation (Placement(transformation(origin = {41.0, -25.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      rotation = -90.0)));
  rope.ropeT1D ropeT1D2
    annotation (Placement(transformation(origin = {-6.0, -28.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_a pull
    annotation (Placement(transformation(origin = {-100.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));



  Modelica.Mechanics.Rotational.Interfaces.Flange_a drive_R "电机驱动" 
    annotation (Placement(transformation(origin = {100.0, -60.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a drive "输出" 
    annotation (Placement(transformation(origin = {-100.0, 60.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_a pull1
    annotation (Placement(transformation(origin = {100.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  connect(winchT1D2.rope, ropeT1D1.rope1)
    annotation (Line(origin = {-22.0, 26.0}, 
      points = {{-13.0, -2.0}, {13.0, -2.0}}, 
      color = {0, 127, 0}));
  connect(ropeT1D1.rope2, winchT1D1.rope)
    annotation (Line(origin = {29.0, 25.0}, 
      points = {{-16.0, -1.0}, {-1.0, -1.0}, {-1.0, 0.0}}, 
      color = {0, 127, 0}));
  connect(winchT1D3.rope, ropeT1D2.rope1)
    annotation (Line(origin = {-25.0, -19.0}, 
      points = {{-11.0, -10.0}, {8.0, -10.0}, {8.0, -9.0}}, 
      color = {0, 127, 0}));
  connect(ropeT1D2.rope2, winchT1D4.rope)
    annotation (Line(origin = {29.0, -18.0}, 
      points = {{-24.0, -10.0}, {-15.0, -10.0}, {-15.0, -3.0}, {1.0, -3.0}}, 
      color = {0, 127, 0}));
  connect(winchT1D2.pull, pull)
    annotation (Line(origin = {-77.0, 5.0}, 
      points = {{22.0, 15.0}, {7.0, 15.0}, {7.0, -5.0}, {-23.0, -5.0}}, 
      color = {0, 127, 0}));
  connect(winchT1D3.pull, pull)
    annotation (Line(origin = {-77.0, -16.0}, 
      points = {{22.0, -8.0}, {7.0, -8.0}, {7.0, 16.0}, {-23.0, 16.0}}, 
      color = {0, 127, 0}));
  connect(drive_L, winchT1D1.drive)
    annotation (Line(origin = {-29.0, 46.0}, 
      points = {{129.0, 14.0}, {68.0, 14.0}, {68.0, -15.0}}, 
      color = {0, 0, 0}));
  connect(drive_R, winchT1D4.drive)
    annotation (Line(origin = {-29.0, -31.0}, 
      points = {{129.0, -29.0}, {89.0, -29.0}, {89.0, 31.0}, {70.0, 31.0}, {70.0, 16.0}}, 
      color = {0, 0, 0}));
  connect(winchT1D2.drive, drive)
    annotation (Line(origin = {-73.0, 45.0}, 
      points = {{27.0, -15.0}, {27.0, 15.0}, {-27.0, 15.0}}, 
      color = {0, 0, 0}));
  connect(winchT1D1.pull, pull1)
    annotation (Line(origin = {74.0, 11.0}, 
      points = {{-26.0, 10.0}, {6.0, 10.0}, {6.0, -11.0}, {26.0, -11.0}}, 
      color = {0, 127, 0}));
  connect(winchT1D4.pull, pull1)
    annotation (Line(origin = {75.0, -12.0}, 
      points = {{-25.0, -13.0}, {5.0, -13.0}, {5.0, 12.0}, {25.0, 12.0}}, 
      color = {0, 127, 0}));
  connect(drive, winchT1D3.drive)
    annotation (Line(origin = {-73.0, 23.0}, 
      points = {{-27.0, 37.0}, {-9.0, 37.0}, {-9.0, -29.0}, {27.0, -29.0}, {27.0, -37.0}}, 
      color = {0, 0, 0}));
end FoldingRope;