within ServoWing.Mechanics.Spurgear;
model PlanetaryReducer "行星减速器"
  extends ServoWing.Icons.BasicModel;
  //基本参数
  parameter SI.Length m(displayUnit = "mm") = 0.001 "齿轮模数" 
    annotation (Dialog(tab = "基本参数", group = "共同参数"));
  parameter Real Alpha(final quantity = "Angle", unit = "deg") = 20 "齿轮压力角" 
    annotation (choices(choice = 15, choice = 20, choice = 25), Dialog(tab = "基本参数", group = "共同参数"));
  parameter Integer zA = 20 "A齿轮齿数" 
    annotation (Dialog(tab = "基本参数", group = "A齿轮参数"));
  parameter Integer zC = 80 "C齿轮齿数" 
    annotation (Dialog(tab = "基本参数", group = "C齿轮参数"));
  parameter Real CoefficientOfHaA = 1 "A齿轮齿顶系数" 
    annotation (choices(choice = 1, choice = 0.8), Dialog(tab = "基本参数", group = "A齿轮参数"));
  parameter Real CoefficientOfHaB = 1 "B齿轮齿顶系数" 
    annotation (choices(choice = 1, choice = 0.8), Dialog(tab = "基本参数", group = "B齿轮参数"));
  parameter Real CoefficientOfHaC = 1 "C齿轮齿顶系数" 
    annotation (choices(choice = 1, choice = 0.8), Dialog(tab = "基本参数", group = "C齿轮参数"));
  parameter Real CoefficientOfCA = 0.25 "A齿轮顶隙系数" 
    annotation (choices(choice = 0.25, choice = 0.3), Dialog(tab = "基本参数", group = "A齿轮参数"));
  parameter Real CoefficientOfCB = 0.25 "B齿轮顶隙系数" 
    annotation (choices(choice = 0.25, choice = 0.3), Dialog(tab = "基本参数", group = "B齿轮参数"));
  parameter Real CoefficientOfCC = 0.25 "C齿轮顶隙系数" 
    annotation (choices(choice = 0.25, choice = 0.3), Dialog(tab = "基本参数", group = "C齿轮参数"));
  //变量
  Real ratio;
  ServoWing.Mechanics.Components.ExternalSpurgearSingle externalSpurgearDriven(
    z = zA, CoefficientOfHa = CoefficientOfHaA, CoefficientOfC = CoefficientOfCA, Alpha = Alpha, m = m) annotation (Placement(transformation(origin = {-50.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  annotation (Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Line(origin = {-30.0, 20.0}, 
      points = {{-6.0, 0.0}, {6.0, 0.0}}, 
      thickness = 1.0), Line(origin = {-30.0, 29.0}, 
      points = {{0.0, 9.0}, {0.0, -9.0}}, 
      color = {86, 86, 86}, 
      thickness = 1.0), Line(origin = {-30.0, 38.0}, 
      points = {{-6.0, 0.0}, {6.0, 0.0}}, 
      color = {86, 86, 86}, 
      thickness = 1.0), Line(origin = {-30.0, 42.0}, 
      points = {{-6.0, 0.0}, {6.0, 0.0}}, 
      color = {86, 86, 86}, 
      thickness = 1.0), Line(origin = {-30.0, 51.0}, 
      points = {{0.0, 9.0}, {0.0, -9.0}}, 
      color = {86, 86, 86}, 
      thickness = 1.0), Line(origin = {-30.0, 60.0}, 
      points = {{-6.0, 0.0}, {6.0, 0.0}}, 
      thickness = 1.0), Line(origin = {-30.0, 0.0}, 
      points = {{0.0, 20.0}, {0.0, -20.0}}, 
      thickness = 1.0), Line(origin = {-30.0, -20.0}, 
      points = {{-6.0, 0.0}, {6.0, 0.0}}, 
      thickness = 1.0), Line(origin = {30.0, 20.0}, 
      points = {{-70.0, 20.0}, {-30.0, 20.0}, {-30.0, -20.0}, {70.0, -20.0}}, 
      color = {86, 86, 86}, 
      thickness = 1.0), Line(origin = {-30.0, -70.0}, 
      points = {{0.0, 10.0}, {0.0, -10.0}}, 
      thickness = 1.0), Line(origin = {-30.0, -60.0}, 
      points = {{-6.0, 0.0}, {6.0, 0.0}}, 
      thickness = 1.0), Line(origin = {-40.0, 40.0}, 
      points = {{0.0, 4.0}, {0.0, -4.0}}, 
      color = {86, 86, 86}, 
      thickness = 1.0), Line(origin = {-65.0, 0.0}, 
      points = {{35.0, 0.0}, {-35.0, 0.0}}, 
      thickness = 1.0), Rectangle(origin = {-61.0, 11.0}, 
      fillColor = {138, 138, 138}, 
      fillPattern = FillPattern.Forward, 
      lineThickness = 1.0, 
      extent = {{-21.0, 9.0}, {21.0, -9.0}}), Rectangle(origin = {-61.0, -11.0}, 
      fillColor = {138, 138, 138}, 
      fillPattern = FillPattern.Forward, 
      lineThickness = 1.0, 
      extent = {{-21.0, 9.0}, {21.0, -9.0}}), Rectangle(origin = {50.0, -11.0}, 
      fillColor = {138, 138, 138}, 
      fillPattern = FillPattern.Backward, 
      lineThickness = 1.0, 
      extent = {{-30.0, 9.0}, {30.0, -9.0}}), Rectangle(origin = {20.0, -20.0}, 
      fillColor = {255, 255, 255}, 
      extent = {{0.0, 0.0}, {0.0, 0.0}}), Line(origin = {5.0, -41.0}, 
      points = {{-35.0, -39.0}, {15.0, -39.0}, {15.0, 39.0}, {35.0, 39.0}}, 
      thickness = 1.0), Line(origin = {6.0, 41.0}, 
      points = {{-36.0, 19.0}, {-36.0, 39.0}, {14.0, 39.0}, {14.0, -39.0}, {36.0, -39.0}}, 
      thickness = 1.0), Rectangle(origin = {50.0, 11.0}, 
      fillColor = {138, 138, 138}, 
      fillPattern = FillPattern.Backward, 
      lineThickness = 1.0, 
      extent = {{-30.0, 9.0}, {30.0, -9.0}}), Text(origin = {-16.0, -4.0}, 
      extent = {{-15.0, 15.0}, {15.0, -15.0}}, 
      textString = "A", 
      fontName = "Times New Roman", 
      textStyle = {TextStyle.None}), Text(origin = {-62.0, 50.0}, 
      extent = {{-15.0, 15.0}, {15.0, -15.0}}, 
      textString = "B", 
      fontName = "Times New Roman", 
      textStyle = {TextStyle.None}), Text(origin = {40.0, 40.0}, 
      extent = {{-15.0, 15.0}, {15.0, -15.0}}, 
      textString = "C", 
      fontName = "Times New Roman", 
      textStyle = {TextStyle.None}), Text(origin = {0.0, -130.0}, 
      extent = {{-75.0, 30.0}, {75.0, -30.0}}, 
      textString = "行星减速器", 
      fontName = "微软雅黑", 
      textStyle = {TextStyle.None})}));
  ServoWing.Interfaces.RotationalInterfaces.Flange_a flange_a
    annotation (Placement(transformation(origin = {-100.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  ServoWing.Interfaces.RotationalInterfaces.Flange_b flange_b
    annotation (Placement(transformation(origin = {100.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  ServoWing.Mechanics.Components.InternalSpurgearSingle internalSpurgear(m = m, Alpha = Alpha, z = zC, CoefficientOfHa = CoefficientOfHaC, CoefficientOfC = CoefficientOfCC)
    annotation (Placement(transformation(origin = {40.0, 30.0}, 
      extent = {{10.0, -10.0}, {-10.0, 10.0}})));
  Modelica.Mechanics.Rotational.Components.Fixed fixed
    annotation (Placement(transformation(origin = {70.0, 22.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  ServoWing.Mechanics.Components.PlanetNGW planetG(zA = zA, zC = zC) annotation (Placement(transformation(origin = {-8.000000000000004, 8.0}, 
    extent = {{-28.0, -28.0}, {28.0, 28.0}})));
equation 
  ratio = 1 + zC / zA;//传送比
  connect(flange_a, externalSpurgearDriven.flange_a)
    annotation (Line(origin = {-73.0, 0.0}, 
      points = {{-27.0, 0.0}, {13.0, 0.0}}));
  connect(internalSpurgear.flange_a, fixed.flange)
    annotation (Line(origin = {66.0, 26.0}, 
      points = {{-16.0, 4.0}, {4.0, 4.0}, {4.0, -4.0}}));
  connect(planetG.flange_a, flange_b)
    annotation (Line(origin = {62.0, 0.0}, 
      points = {{-42.0, -6.0}, {38.0, -6.0}, {38.0, 0.0}}));
  connect(planetG.flange_a1, internalSpurgear.flange_a1)
    annotation (Line(origin = {19.0, 43.0}, 
      points = {{-27.0, -7.0}, {-27.0, 13.0}, {21.0, 13.0}, {21.0, -3.0}}, 
      color = {0, 127, 0}));
  connect(externalSpurgearDriven.flange_a1, planetG.flange_b1)
    annotation (Line(origin = {-21.0, 19.0}, 
      points = {{-29.0, -9.0}, {-29.0, -3.0}, {13.0, -3.0}, {13.0, 0.0}}, 
      color = {0, 127, 0}));
end PlanetaryReducer;