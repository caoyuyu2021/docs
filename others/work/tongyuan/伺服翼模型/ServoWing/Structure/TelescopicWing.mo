within ServoWing.Structure;
model TelescopicWing "伸缩翼"
  // extends ServoWing.Icons.BasicModel;
  Interfaces.MultiBodyInterfaces.Frame_a frame_a
    annotation (Placement(transformation(origin = {-100.0, 0.0}, 
      extent = {{-16.0, -16.0}, {16.0, 16.0}})));
  Interfaces.MultiBodyInterfaces.Frame_b frame_b
    annotation (Placement(transformation(origin = {100.0, 0.0}, 
      extent = {{-16.0, -16.0}, {16.0, 16.0}})));
  Modelica.Mechanics.MultiBody.Parts.Body body
    annotation (Placement(transformation(origin = {-2.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Visualizers.FixedShape fixedShape(shapeType = "transWing_NEW.STL", length = 0.001, width = 0.001, height = 0.001, extra = 1, 
    color = {0, 180, 0}) annotation (Placement(transformation(origin = {16.0, 48.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));



  annotation (Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    grid = {2.0, 2.0}), graphics = {Text(origin = {0.0, -120.0}, 
    extent = {{-45.0, 15.0}, {45.0, -15.0}}, 
    textString = "伸缩翼", 
    textStyle = {TextStyle.None}), Bitmap(origin = {0.0, 0.0}, 
    extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    fileName = "modelica://ServoWing/Pictures/伸缩翼.svg")}));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation(r = {660, 28.11, 0} / 1000)
    annotation (Placement(transformation(origin = {0.0, -50.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  connect(frame_a, body.frame_a)
    annotation (Line(origin = {-56.0, 0.0}, 
      points = {{-44.0, 0.0}, {44.0, 0.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(frame_a, fixedShape.frame_a)
    annotation (Line(origin = {-47.0, 24.0}, 
      points = {{-53.0, -24.0}, {7.0, -24.0}, {7.0, 24.0}, {53.0, 24.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(frame_b, fixedTranslation.frame_b)
    annotation (Line(origin = {55.0, -25.0}, 
      points = {{45.0, 25.0}, {-15.0, 25.0}, {-15.0, -25.0}, {-45.0, -25.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(fixedTranslation.frame_a, fixedShape.frame_a)
    annotation (Line(origin = {-17.0, -1.0}, 
      points = {{7.0, -49.0}, {-23.0, -49.0}, {-23.0, 49.0}, {23.0, 49.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
end TelescopicWing;