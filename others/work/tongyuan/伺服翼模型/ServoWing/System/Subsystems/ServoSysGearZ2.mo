within ServoWing.System.Subsystems;
model ServoSysGearZ2
  annotation (Diagram(coordinateSystem(extent = {{-280.0, -200.0}, {300.0, 160.0}}, 
    grid = {2.0, 2.0}), graphics = {Text(origin = {-228.0, -46.0}, 
    extent = {{-20.0, 6.0}, {20.0, -6.0}}, 
    textString = "0~1.57rad", 
    textStyle = {TextStyle.None})}), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Bitmap(origin = {0.0, 0.0}, 
      extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      fileName = "modelica://ServoWing/Pictures/永磁同步电机.svg"), Text(origin = {0.0, -120.0}, 
      extent = {{-60.0, 15.0}, {60.0, -15.0}}, 
      textString = "伺服系统", 
      textStyle = {TextStyle.None})}));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a
    annotation (Placement(transformation(origin = {200.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}), 
      iconTransformation(origin = {100.0, 0.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealInput u "Input signal connector" 
    annotation (Placement(transformation(origin = {-240.0, -20.0}, 
      extent = {{-20.0, -20.0}, {20.0, 20.0}}), 
      iconTransformation(origin = {-110.0, 0.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Rotational.Sources.Position position
    annotation (Placement(transformation(origin = {10.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  connect(u, position.phi_ref)
    annotation (Line(origin = {-121.0, -10.0}, 
      points = {{-119.0, -10.0}, {-89.0, -10.0}, {-89.0, 0.0}, {119.0, 0.0}, {119.0, 10.0}}, 
      color = {0, 0, 127}));
  connect(position.flange, flange_a)
    annotation (Line(origin = {110.0, 0.0}, 
      points = {{-90.0, 0.0}, {90.0, 0.0}}, 
      color = {0, 0, 0}));
end ServoSysGearZ2;