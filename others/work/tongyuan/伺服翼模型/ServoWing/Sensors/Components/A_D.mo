within ServoWing.Sensors.Components;
model A_D "采样"
  extends Icons.BasicModel;
  //参数
  parameter Integer n = 12;
  parameter Real min = -7;
  parameter Real max = 7;
  parameter Real samplePeriod(final unit = "s") = 6.25e-5 "采样周期";
protected 
  parameter Real m = (max - min) / 2 ^ n;
  Modelica.Blocks.Math.RealToInteger realtointeger
    annotation (Placement(transformation(extent = {{-10, 46}, {10, 66}}, 
      rotation = 0)));
  Modelica.Blocks.Math.Product product
    annotation (Placement(transformation(origin = {71.0, 0.0}, 
      extent = {{-9.0, -9.0}, {9.0, 9.0}})));
  Modelica.Blocks.Math.Division division
    annotation (Placement(transformation(origin = {-31.0, 55.5}, 
      extent = {{-10.0, -9.5}, {10.0, 9.5}})));
  Modelica.Blocks.Math.IntegerToReal integertoreal
    annotation (Placement(transformation(origin = {35.0, 57.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
public 
  Modelica.Blocks.Sources.Constant const(
    k = m)
    annotation (Placement(transformation(origin = {-78.16, -5.359}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Discrete.Sampler sampler(samplePeriod = samplePeriod)
    annotation (Placement(transformation(origin = {-78.0, 60.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealInput u "Continuous input signal" 
    annotation (Placement(transformation(origin = {-110.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealOutput y "Connector of Real output signal" 
    annotation (Placement(transformation(origin = {110.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  connect(division.y, realtointeger.u)
    annotation (Line(origin = {-16.0, 56.0}, 
      points = {{-4.0, -1.0}, {4.0, -1.0}, {4.0, 0.0}}, 
      color = {0, 0, 127}));
  connect(realtointeger.y, integertoreal.u)
    annotation (Line(origin = {17.0, 55.5}, 
      points = {{-6.0, 1.0}, {6.0, 1.0}, {6.0, 2.0}}, 
      color = {255, 127, 0}));
  connect(integertoreal.y, product.u1)
    annotation (Line(origin = {54.0, 30.0}, 
      points = {{-8.0, 27.0}, {0.0, 27.0}, {0.0, -25.0}, {6.0, -25.0}}, 
      color = {0, 0, 127}));
  connect(sampler.y, division.u1)
    annotation (Line(origin = {-55.0, 60.5}, 
      points = {{-12.0, -1.0}, {12.0, -1.0}, {12.0, 1.0}}, 
      color = {0, 0, 127}));
  connect(sampler.u, u)
    annotation (Line(origin = {-104.0, 30.0}, 
      points = {{14.0, 30.0}, {4.0, 30.0}, {4.0, -30.0}, {-6.0, -30.0}}, 
      color = {0, 0, 127}));
  connect(product.y, y)
    annotation (Line(origin = {97.0, -1.0}, 
      points = {{-16.0, 1.0}, {15.0, 1.0}}, 
      color = {0, 0, 127}));
  connect(const.y, product.u2)
    annotation (Line(origin = {-3.5, -7.0}, 
      points = {{-64.0, 2.0}, {64.0, 2.0}}, 
      color = {0, 0, 127}));
  connect(const.y, division.u2)
    annotation (Line(origin = {-56.0, 21.5}, 
      points = {{-11.0, -27.0}, {-4.0, -27.0}, {-4.0, 28.0}, {13.0, 28.0}}, 
      color = {0, 0, 127}));
  annotation (
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Text(origin = {4.0, -8.0}, 
      extent = {{0.0, -56.0}, {0.0, 56.0}}, 
      textString = "A/D"), Text(origin = {0.0, -130.0}, 
      extent = {{-30.0, 30.0}, {30.0, -30.0}}, 
      textString = "采样", 
      fontName = "微软雅黑", 
      textStyle = {TextStyle.None})}));
end A_D;