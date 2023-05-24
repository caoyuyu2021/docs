within ServoWing.Examples;
model Test_abTU_XYZ
  extends Icons.Test;
  annotation (Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0})));
  Modelica.Blocks.Sources.Cosine cosine
    annotation (Placement(transformation(origin = {-32.0, 38.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.Cosine cosine1(phase = 1.5707963267949)
    annotation (Placement(transformation(origin = {-32.0, 2.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.Constant const(k = 0.001)
    annotation (Placement(transformation(origin = {-32.0, -30.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));


  Controller.Components.abTU_XYZ abTU_XYZ1
    annotation (Placement(transformation(origin = {20.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.Constant const1(k = 30)
    annotation (Placement(transformation(origin = {-32.0, -60.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  connect(cosine.y, abTU_XYZ1.U_alpha)
    annotation (Line(origin = {-6.0, 23.0}, 
      points = {{-15.0, 15.0}, {4.0, 15.0}, {4.0, -17.0}, {15.0, -17.0}}, 
      color = {0, 0, 127}));
  connect(cosine1.y, abTU_XYZ1.U_beta)
    annotation (Line(origin = {-6.0, 5.0}, 
      points = {{-15.0, -3.0}, {15.0, -3.0}}, 
      color = {0, 0, 127}));
  connect(const.y, abTU_XYZ1.T)
    annotation (Line(origin = {-6.0, -16.0}, 
      points = {{-15.0, -14.0}, {4.0, -14.0}, {4.0, 14.0}, {15.0, 14.0}}, 
      color = {0, 0, 127}));
  connect(const1.y, abTU_XYZ1.Ux)
    annotation (Line(origin = {-6.0, -33.0}, 
      points = {{-15.0, -27.0}, {10.0, -27.0}, {10.0, 27.0}, {15.0, 27.0}}, 
      color = {0, 0, 127}));
end Test_abTU_XYZ;