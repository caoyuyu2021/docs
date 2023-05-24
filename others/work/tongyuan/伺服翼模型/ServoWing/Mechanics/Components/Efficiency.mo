within ServoWing.Mechanics.Components;
model Efficiency "啮合传动效率"
  annotation (
    Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Rectangle(origin = {0.0, 0.0}, 
      fillColor = {255, 255, 255}, 
      extent = {{-100.0, 100.0}, {100.0, -100.0}})}), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Rectangle(origin = {0.0, 0.0}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-100.0, 100.0}, {100.0, -100.0}}), Text(origin = {0.0, 0.0}, 
      extent = {{-100.0, 100.0}, {100.0, -100.0}}, 
      textString = "E", 
      textStyle = {TextStyle.None})}));
  parameter Real eta = 0.95 "传动效率" 
    annotation (choices(choice = 0.94, choice = 0.95, choice = 0.96, choice = 0.97, choice = 0.98), Dialog(tab = "基本参数", group = "效率参数"));
  Interfaces.TranslationalInterfaces.Flange_a flange_a
    annotation (Placement(transformation(origin = {0.0, 100.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Interfaces.TranslationalInterfaces.Flange_b flange_b
    annotation (Placement(transformation(origin = {0.0, -100.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  flange_a.s = flange_b.s;
  //效率
  flange_a.f * eta = -flange_b.f;
end Efficiency;