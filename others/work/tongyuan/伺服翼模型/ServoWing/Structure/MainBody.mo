within ServoWing.Structure;
model MainBody "固定翼"
  // extends ServoWing.Icons.BasicModel;
  Interfaces.MultiBodyInterfaces.Frame_a frame_a
    annotation (Placement(transformation(origin = {-100.0, 0.0}, 
      extent = {{-16.0, -16.0}, {16.0, 16.0}})));
  Interfaces.MultiBodyInterfaces.Frame_b frame_b
    annotation (Placement(transformation(origin = {100.0, 0.0}, 
      extent = {{-16.0, -16.0}, {16.0, 16.0}})));
  Modelica.Mechanics.MultiBody.Parts.Body body
    annotation (Placement(transformation(origin = {-30.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Visualizers.FixedShape fixedShape(shapeType = "fixedWing_NEW.STL", length = 0.001, width = 0.001, height = 0.00101, extra = 1, 
    color = {255, 65, 65}) annotation (Placement(transformation(origin = {-26.0, 46.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation(r = {200, 0, -70} / 1000)
    annotation (Placement(transformation(origin = {-6.0, -44.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  annotation (Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    grid = {2.0, 2.0}), graphics = {Text(origin = {0.0, -120.0}, 
    extent = {{-45.0, 15.0}, {45.0, -15.0}}, 
    textString = "固定翼", 
    textStyle = {TextStyle.None}), Bitmap(origin = {0.0, 0.0}, 
    extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    fileName = "modelica://ServoWing/Pictures/固定翼.svg")}));
equation 
  connect(frame_a, body.frame_a)
    annotation (Line(origin = {-71.0, 0.0}, 
      points = {{-29.0, 0.0}, {31.0, 0.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(fixedShape.frame_a, frame_a)
    annotation (Line(origin = {-68.0, 23.0}, 
      points = {{32.0, 23.0}, {8.0, 23.0}, {8.0, -23.0}, {-32.0, -23.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(frame_a, fixedTranslation.frame_a)
    annotation (Line(origin = {-52.0, -15.0}, 
      points = {{-48.0, 15.0}, {-8.0, 15.0}, {-8.0, -29.0}, {36.0, -29.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(fixedTranslation.frame_b, frame_b)
    annotation (Line(origin = {52.0, -18.0}, 
      points = {{-48.0, -26.0}, {-8.0, -26.0}, {-8.0, 18.0}, {48.0, 18.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
end MainBody;