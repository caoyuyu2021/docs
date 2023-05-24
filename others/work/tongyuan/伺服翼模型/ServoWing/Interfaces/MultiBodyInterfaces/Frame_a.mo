within ServoWing.Interfaces.MultiBodyInterfaces;
connector Frame_a "多体输入接口"
  import SI = Modelica.SIunits;
  SI.Position r_0[3]
    "Position vector from world frame to the connector frame origin, resolved in world frame";
  Modelica.Mechanics.MultiBody.Frames.Orientation R
    "Orientation object to rotate the world frame into the connector frame";
  flow SI.Force f[3] "Cut-force resolved in connector frame" annotation (
    unassignedMessage = "All Forces cannot be uniquely calculated.
The reason could be that the mechanism contains
a planar loop or that joints constrain the
same motion. For planar loops, use for one
revolute joint per loop the joint
Joints.RevolutePlanarLoopConstraint instead of
Joints.Revolute.");
  flow SI.Torque t[3] "Cut-torque resolved in connector frame";
  annotation (defaultComponentName = "frame_a", 
    Icon(coordinateSystem(
      preserveAspectRatio = true, 
      extent = {{-100, -100}, {100, 100}}, 
      grid = {1, 1}, 
      initialScale = 0.16), graphics = {Rectangle(
      extent = {{-10, 10}, {10, -10}}, 
      lineColor = {95, 95, 95}, 
      lineThickness = 0.5), Rectangle(
      extent = {{-30, 100}, {30, -100}}, 
      lineColor = {0, 0, 0}, 
      fillColor = {192, 192, 192}, 
      fillPattern = FillPattern.Solid)}), 
    Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      initialScale = 0.16, 
      grid = {1.0, 1.0}), graphics = {Rectangle(origin = {0.0, 0.0}, 
      fillColor = {192, 192, 192}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-12.0, 40.0}, {12.0, -40.0}}), Text(origin = {0.0, 70.0}, 
      lineColor = {0, 127, 0}, 
      extent = {{-100.0, 30.0}, {100.0, -30.0}}, 
      textString = "%name", 
      textStyle = {TextStyle.None})}), 
    Documentation(info = "<html>
<p>
Basic definition of a coordinate system that is fixed to a mechanical
component. In the origin of the coordinate system the cut-force
and the cut-torque is acting.
This component has a filled rectangular icon.
</p>
</html>"));
end Frame_a;