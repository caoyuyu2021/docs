within ServoWing.Structure;
model FoldingWings "折叠翼"
  // extends ServoWing.Icons.BasicModel;
  Interfaces.MultiBodyInterfaces.Frame_a frame_a
    annotation (Placement(transformation(origin = {-100.0, 0.0}, 
      extent = {{-16.0, -16.0}, {16.0, 16.0}})));
  annotation (Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    grid = {2.0, 2.0}), graphics = {Text(origin = {0.0, -120.0}, 
    extent = {{-45.0, 15.0}, {45.0, -15.0}}, 
    textString = "折叠翼", 
    textStyle = {TextStyle.None}), Bitmap(origin = {0.0, 0.0}, 
    extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    fileName = "modelica://ServoWing/Pictures/折叠翼.svg")}));
  Modelica.Mechanics.MultiBody.Parts.Body body
    annotation (Placement(transformation(origin = {14.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Visualizers.FixedShape fixedShape(shapeType = "rotWing_NEW.STL", length = 0.001, width = 0.001, height = 0.001, extra = 1, color = {255, 0, 255})
    annotation (Placement(transformation(origin = {56.0, 44.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation(r = {-50, 35.19, 0} / 1000)
    annotation (Placement(transformation(origin = {-42.0, 44.0}, 
      extent = {{10.0, -10.0}, {-10.0, 10.0}})));
equation 
  connect(fixedTranslation.frame_b, frame_a)
    annotation (Line(origin = {-76.0, 22.0}, 
      points = {{24.0, 22.0}, {6.0, 22.0}, {6.0, -22.0}, {-24.0, -22.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(fixedTranslation.frame_a, body.frame_a)
    annotation (Line(origin = {-14.0, 22.0}, 
      points = {{-18.0, 22.0}, {6.0, 22.0}, {6.0, -22.0}, {18.0, -22.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(fixedTranslation.frame_a, fixedShape.frame_a)
    annotation (Line(origin = {7.0, 44.0}, 
      points = {{-39.0, 0.0}, {39.0, 0.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
end FoldingWings;