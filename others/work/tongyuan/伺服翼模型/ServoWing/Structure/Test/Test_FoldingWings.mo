within ServoWing.Structure.Test;
model Test_FoldingWings
  extends Modelica.Icons.Example;
  inner Modelica.Mechanics.MultiBody.World world(gravityType = Modelica.Mechanics.MultiBody.Types.GravityTypes.UniformGravity)
    annotation (Placement(transformation(origin = {-46.0, 10.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));



  FoldingWingsFlex foldingWings annotation (Placement(transformation(origin = {10.0, 10.0}, 
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
  connect(world.frame_b, foldingWings.frame_a)
    annotation (Line(origin = {-18.0, 10.0}, 
      points = {{-18.0, 0.0}, {18.0, 0.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(realExpression.y, foldingWings.aerodynamicforce[1])
    annotation (Line(origin = {-3.0, 44.0}, 
      points = {{-14.0, 22.0}, {-9.0, 22.0}, {-9.0, -8.0}, {13.0, -8.0}, {13.0, -23.0}}, 
      color = {0, 0, 127}));
  connect(realExpression1.y, foldingWings.aerodynamicforce[2])
    annotation (Line(origin = {18.0, 44.0}, 
      points = {{3.0, 22.0}, {8.0, 22.0}, {8.0, -6.0}, {-8.0, -6.0}, {-8.0, -23.0}}, 
      color = {0, 0, 127}));
  connect(realExpression2.y, foldingWings.aerodynamicforce[3])
    annotation (Line(origin = {41.0, 44.0}, 
      points = {{18.0, 22.0}, {31.0, 22.0}, {31.0, -8.0}, {-31.0, -8.0}, {-31.0, -23.0}}, 
      color = {0, 0, 127}));
end Test_FoldingWings;