within ServoWing.Structure.Test;
model Test_TelescopicWing
  extends Modelica.Icons.Example;
  TelescopicWingFlex mainBody annotation (Placement(transformation(origin = {10.0, 10.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}})));

  inner Modelica.Mechanics.MultiBody.World world(gravityType = Modelica.Mechanics.MultiBody.Types.GravityTypes.UniformGravity)
    annotation (Placement(transformation(origin = {-46.0, 10.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.RealExpression realExpression
    annotation (Placement(transformation(origin = {-28.000000000000007, 66.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y = 2000 + time * 10)
    annotation (Placement(transformation(origin = {10.0, 66.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.RealExpression realExpression2(y = 2000 * sin(time))
    annotation (Placement(transformation(origin = {48.00000000000002, 66.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  connect(world.frame_b, mainBody.frame_a)
    annotation (Line(origin = {-25.0, 20.0}, 
      points = {{-11.0, -10.0}, {25.0, -10.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(realExpression.y, mainBody.aerodynamicforce[1])
    annotation (Line(origin = {-3.0, 44.0}, 
      points = {{-14.0, 22.0}, {-7.0, 22.0}, {-7.0, -8.0}, {13.0, -8.0}, {13.0, -23.0}}, 
      color = {0, 0, 127}));
  connect(realExpression1.y, mainBody.aerodynamicforce[2])
    annotation (Line(origin = {18.0, 44.0}, 
      points = {{3.0, 22.0}, {8.0, 22.0}, {8.0, -8.0}, {-8.0, -8.0}, {-8.0, -23.0}}, 
      color = {0, 0, 127}));
  connect(realExpression2.y, mainBody.aerodynamicforce[3])
    annotation (Line(origin = {39.0, 44.0}, 
      points = {{20.0, 22.0}, {29.0, 22.0}, {29.0, -8.0}, {-29.0, -8.0}, {-29.0, -23.0}}, 
      color = {0, 0, 127}));
end Test_TelescopicWing;