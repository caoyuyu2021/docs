within ServoWing.Loads.Examples;
model Test_JointTorque
  extends Modelica.Icons.Example;
  annotation (Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0})), 
    experiment(StartTime = 0, StopTime = 10, Interval = 0.0001, Algorithm = "Dassl", Tolerance = 0.0001, DoublePrecision = true, StoreEventValue = false));
  inner Modelica.Mechanics.MultiBody.World world
    annotation (Placement(transformation(origin = {-74.0, 16.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  ServoLib.Loads.Components.JointTorque frict(
    torque_load = 3100 * sqrt(2), 
    rotationalSpring = 112 * 57.3)
    annotation (Placement(transformation(origin = {4.0, -14.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape
    annotation (Placement(transformation(origin = {-36.0, 16.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Joints.Universal universal(n_b = {0, 0, 1}, n_a = {0, 1, 0})
    annotation (Placement(transformation(origin = {6.0, 16.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape1(m = 500, 
    r_CM = {1, 0, 0}, r = {1, 0, 0})
    annotation (Placement(transformation(origin = {66.0, 16.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  connect(world.frame_b, bodyShape.frame_a)
    annotation (Line(origin = {-44.0, 15.0}, 
      points = {{-20.0, 1.0}, {-2.0, 1.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(bodyShape.frame_b, universal.frame_a)
    annotation (Line(origin = {-15.0, 17.0}, 
      points = {{-11.0, -1.0}, {11.0, -1.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(frict.frame_a, universal.frame_a)
    annotation (Line(origin = {-10.0, 1.0}, 
      points = {{4.0, -15.0}, {-6.0, -15.0}, {-6.0, 15.0}, {6.0, 15.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(universal.frame_b, bodyShape1.frame_a)
    annotation (Line(origin = {36.0, 16.0}, 
      points = {{-20.0, 0.0}, {20.0, 0.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(frict.frame_b, bodyShape1.frame_a)
    annotation (Line(origin = {35.0, 1.0}, 
      points = {{-21.0, -15.0}, {5.0, -15.0}, {5.0, 14.0}, {6.0, 14.0}, {6.0, 15.0}, {21.0, 15.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
end Test_JointTorque;