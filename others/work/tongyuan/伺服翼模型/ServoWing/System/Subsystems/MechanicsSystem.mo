within ServoWing.System.Subsystems;
model MechanicsSystem "传动系统模型，行星减速器+滚珠丝杠"
  extends Icons.BasicModel;
  //行星减速器
  parameter SI.Length m(displayUnit = "mm") = 0.001 "齿轮模数" 
    annotation (Dialog(tab = "行星减速器", group = "共同参数"));
  parameter Real Alpha(final quantity = "Angle", unit = "deg") = 20 "齿轮压力角" 
    annotation (choices(choice = 15, choice = 20, choice = 25), Dialog(tab = "行星减速器", group = "共同参数"));
  parameter Integer zA = 20 "A齿轮齿数" 
    annotation (Dialog(tab = "行星减速器", group = "A齿轮参数"));
  parameter Integer zC = 80 "C齿轮齿数" 
    annotation (Dialog(tab = "行星减速器", group = "C齿轮参数"));
  parameter Real CoefficientOfHaA = 1 "A齿轮齿顶系数" 
    annotation (choices(choice = 1, choice = 0.8), Dialog(tab = "行星减速器", group = "A齿轮参数"));
  parameter Real CoefficientOfHaB = 1 "B齿轮齿顶系数" 
    annotation (choices(choice = 1, choice = 0.8), Dialog(tab = "行星减速器", group = "B齿轮参数"));
  parameter Real CoefficientOfHaC = 1 "C齿轮齿顶系数" 
    annotation (choices(choice = 1, choice = 0.8), Dialog(tab = "行星减速器", group = "C齿轮参数"));
  parameter Real CoefficientOfCA = 0.25 "A齿轮顶隙系数" 
    annotation (choices(choice = 0.25, choice = 0.3), Dialog(tab = "行星减速器", group = "A齿轮参数"));
  parameter Real CoefficientOfCB = 0.25 "B齿轮顶隙系数" 
    annotation (choices(choice = 0.25, choice = 0.3), Dialog(tab = "行星减速器", group = "B齿轮参数"));
  parameter Real CoefficientOfCC = 0.25 "C齿轮顶隙系数" 
    annotation (choices(choice = 0.25, choice = 0.3), Dialog(tab = "行星减速器", group = "C齿轮参数"));
  //滚珠丝杠
  parameter Real Ph(unit = "mm") = 2 "螺纹导程" 
    annotation (Dialog(tab = "滚珠丝杠", group = "基本参数"));
  parameter Real ratio = 2 "传动比(flange_a.phi/flange_b.s)" 
    annotation (Dialog(tab = "滚珠丝杠", group = "基本参数"));
  parameter Real eta = 0.8 "传动效率" 
    annotation (Dialog(tab = "滚珠丝杠", group = "基本参数"));
  SI.Force f = flange_t.f "传动机构输出力";

  Interfaces.RotationalInterfaces.Flange_a flange_a
    annotation (Placement(transformation(origin = {-100.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Mechanics.PlanetaryReducer planetaryReducer(m = m, Alpha = Alpha, zA = zA, CoefficientOfHaA = CoefficientOfHaA, CoefficientOfCA = CoefficientOfCA, zC = zC, CoefficientOfHaC = CoefficientOfHaC, CoefficientOfCC = CoefficientOfCC, CoefficientOfHaB = CoefficientOfHaB, CoefficientOfCB = CoefficientOfCB)
    annotation (Placement(transformation(origin = {-40.0, -7.105427357601002e-15}, 
      extent = {{-14.0, -14.0}, {14.0, 14.0}})));
  Mechanics.BallScrews ballScrews_E(ratio = ratio, Ph = Ph, eta = eta)
    annotation (Placement(transformation(origin = {29.0, -17.0}, 
      extent = {{-15.0, -15.0}, {15.0, 15.0}})));
  Interfaces.TranslationalInterfaces.Flange_a flange_t
    annotation (Placement(transformation(origin = {100.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  annotation (
    Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Text(origin = {0.0, -130.0}, 
      extent = {{-60.0, -30.0}, {60.0, 30.0}}, 
      textString = "传动系统", 
      fontName = "微软雅黑", 
      textStyle = {TextStyle.None}), Ellipse(origin = {2.0, -3.0}, 
      fillColor = {170, 255, 255}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-70.0, 70.0}, {70.0, -70.0}}), Ellipse(origin = {0.0, 0.0}, 
      fillColor = {85, 0, 255}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-10.0, 10.0}, {10.0, -10.0}}), Ellipse(origin = {27.0, 27.0}, 
      fillColor = {65, 195, 95}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-25.0, 25.0}, {25.0, -25.0}}), Ellipse(origin = {-37.0, -13.0}, 
      fillColor = {65, 195, 95}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-25.0, 25.0}, {25.0, -25.0}}), Ellipse(origin = {23.0, -35.0}, 
      fillColor = {65, 195, 95}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-25.0, 25.0}, {25.0, -25.0}}), Line(origin = {1.8560636734424936, 2.9427814272299173}, 
      points = {{7.966767188915799, -9.968677516833647}, {10.446482422633464, -4.300788063253567}, {9.166098786094373, 3.3930192363724485}, {0.39490780784808655, 9.968677516833646}, {-10.446482422633466, 7.544270527968218}}, 
      thickness = 2.0, 
      arrow = {Arrow.None, Arrow.Filled}, 
      smooth = Smooth.Bezier), Line(origin = {13.474442956069035, 38.93087209072658}, 
      points = {{-12.707054227796878, -16.604869189856704}, {-13.481551624487695, -9.405585557260864}, {-11.124874085864361, -0.37180835099607634}, {-8.89520174335731, 3.6114606386230363}, {-6.9960103414845785, 6.173292238882766}, {-2.565903219371096, 10.268684028046913}, {3.2662718935026387, 13.286548007412996}, {13.48155162448771, 16.60486918985665}}, 
      thickness = 2.0, 
      arrow = {Arrow.None, Arrow.Filled}, 
      smooth = Smooth.Bezier), Line(origin = {-50.826399523248824, -1.245285079044038}, 
      points = {{-12.707054227796878, -16.604869189856704}, {-13.481551624487695, -9.405585557260864}, {-11.124874085864361, -0.37180835099607634}, {-8.89520174335731, 3.6114606386230363}, {-6.9960103414845785, 6.173292238882766}, {-2.565903219371096, 10.268684028046913}, {3.2662718935026387, 13.286548007412996}, {13.48155162448771, 16.60486918985665}}, 
      thickness = 2.0, 
      arrow = {Arrow.None, Arrow.Filled}, 
      smooth = Smooth.Bezier), Line(origin = {9.135335567140302, -23.787411383128905}, 
      points = {{-12.707054227796878, -16.604869189856704}, {-13.481551624487695, -9.405585557260864}, {-11.124874085864361, -0.37180835099607634}, {-8.89520174335731, 3.6114606386230363}, {-6.9960103414845785, 6.173292238882766}, {-2.565903219371096, 10.268684028046913}, {3.2662718935026387, 13.286548007412996}, {13.48155162448771, 16.60486918985665}}, 
      thickness = 2.0, 
      arrow = {Arrow.None, Arrow.Filled}, 
      smooth = Smooth.Bezier), Line(origin = {-23.74120417907567, -73.7858}, 
      points = {{4.92551, 3.15782}, {-4.0135, -3.91481}}, 
      thickness = 1.0), Line(origin = {-15.571871313285929, -75.57351032759775}, 
      points = {{4.92551, 3.15782}, {-4.0135, -3.91481}}, 
      thickness = 1.0), Line(origin = {-7.652580787778564, -76.67360421941898}, 
      points = {{4.92551, 3.15782}, {-4.0135, -3.91481}}, 
      thickness = 1.0), Line(origin = {1.8328615870837943, -76.064664924581}, 
      points = {{4.92551, 3.15782}, {-4.0135, -3.91481}}, 
      thickness = 1.0), Line(origin = {12.55132740250556, -74.92980244368344}, 
      points = {{4.92551, 3.15782}, {-4.0135, -3.91481}}, 
      thickness = 1.0), Line(origin = {23.945232267001796, -71.72721970077546}, 
      points = {{4.92551, 3.15782}, {-4.0135, -3.91481}}, 
      thickness = 1.0), Line(origin = {-37.49522650590146, -67.53643510423564}, 
      points = {{4.92551, 3.15782}, {-4.0135, -3.91481}}, 
      thickness = 1.0), Line(origin = {-30.844007848969003, -70.66365796906041}, 
      points = {{4.92551, 3.15782}, {-4.0135, -3.91481}}, 
      thickness = 1.0)}));
  connect(flange_a, planetaryReducer.flange_a)
    annotation (Line(origin = {-78.0, 1.0}, 
      points = {{-22.0, -1.0}, {24.0, -1.0}}));
  connect(planetaryReducer.flange_b, ballScrews_E.flange_r)
    annotation (Line(origin = {-6.0, 1.0}, 
      points = {{-20.0, -1.0}, {6.0, -1.0}, {6.0, -18.0}, {20.0, -18.0}}));
  connect(ballScrews_E.flange_t, flange_t)
    annotation (Line(origin = {65.0, 20.0}, 
      points = {{-36.0, -30.0}, {-36.0, -20.0}, {35.0, -20.0}}, 
      color = {0, 127, 0}));
end MechanicsSystem;