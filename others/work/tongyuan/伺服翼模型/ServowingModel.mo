within ;
model ServowingModel

  Modelica.Blocks.Sources.Sine sine
    annotation (Placement(transformation(origin = {-70.0, 59.99999999999997}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.Sine sine1
    annotation (Placement(transformation(origin = {-70.0, 19.999999999999986}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.Sine sine2
    annotation (Placement(transformation(origin = {-70.0, -20.000000000000007}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.Sine sine3
    annotation (Placement(transformation(origin = {-70.0, -60.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Math.Exp exp1
    annotation (Placement(transformation(origin = {60.0, 40.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Math.Power power
    annotation (Placement(transformation(origin = {60.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Math.Abs abs1
    annotation (Placement(transformation(origin = {60.0, -40.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  tool.AIModel aIModel
    annotation (Placement(transformation(origin = {-5.0, 9.0}, 
      extent = {{-19.0, -19.0}, {19.0, 19.0}})));
equation 
  connect(sine.y, aIModel.a[1])
    annotation (Line(origin = {-43.0, 35.0}, 
      points = {{-16.0, 25.0}, {15.0, 25.0}, {15.0, -26.0}}, 
      color = {0, 0, 127}));
  connect(sine1.y, aIModel.a[2])
    annotation (Line(origin = {-43.0, 15.0}, 
      points = {{-16.0, 5.0}, {15.0, 5.0}, {15.0, -6.0}}, 
      color = {0, 0, 127}));
  connect(sine2.y, aIModel.a[3])
    annotation (Line(origin = {-43.0, -5.0}, 
      points = {{-16.0, -15.0}, {15.0, -15.0}, {15.0, 14.0}}, 
      color = {0, 0, 127}));
  connect(sine3.y, aIModel.a[4])
    annotation (Line(origin = {-43.0, -25.0}, 
      points = {{-16.0, -35.0}, {15.0, -35.0}, {15.0, 34.0}}, 
      color = {0, 0, 127}));
  connect(aIModel.y[1], exp1.u)
    annotation (Line(origin = {32.0, 25.0}, 
      points = {{-16.0, -16.0}, {-16.0, 16.0}, {16.0, 16.0}, {16.0, 15.0}}, 
      color = {0, 0, 127}));
  connect(aIModel.y[3], power.u)
    annotation (Line(origin = {32.0, 5.0}, 
      points = {{-16.0, 4.0}, {16.0, 4.0}, {16.0, -5.0}}, 
      color = {0, 0, 127}));
  connect(aIModel.y[5], abs1.u)
    annotation (Line(origin = {32.0, -15.0}, 
      points = {{-16.0, 24.0}, {-16.0, -25.0}, {16.0, -25.0}}, 
      color = {0, 0, 127}));
end ServowingModel;