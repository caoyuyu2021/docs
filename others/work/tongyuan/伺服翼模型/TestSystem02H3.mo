within ;
model TestSystem02H3
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.RealExpression realExpression(y = 40)
    annotation (Placement(transformation(origin = {-137.00000000000003, 50.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y = 0.1)
    annotation (Placement(transformation(origin = {-137.0, 10.64999999999999}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.RealExpression realExpression2
    annotation (Placement(transformation(origin = {-190.5, -91.70077922077922}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.RealExpression realExpression3(y = 2000 + time * 10)
    annotation (Placement(transformation(origin = {-137.24999999999997, -91.70077922077922}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.RealExpression realExpression4(y = 2000 * sin(time))
    annotation (Placement(transformation(origin = {-83.5, -91.70077922077921}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  annotation (experiment(Algorithm = Dassl, Interval = 0.01, StartTime = 0, StopTime = 10, Tolerance = 0.0001), 
    Diagram(coordinateSystem(extent = {{-232.0, -130.0}, {240.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Rectangle(origin = {-136.25174825174824, 31.999999999999993}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-53.74825174825176, 47.42377622377622}, {53.74825174825173, -47.42377622377622}}), Text(origin = {-137.0, 38.0}, 
      lineColor = {0, 0, 0}, 
      extent = {{-39.0, 14.0}, {39.0, -14.0}}, 
      textString = "折叠角度，范围0~90deg", 
      textStyle = {TextStyle.None}, 
      textColor = {0, 0, 0}, 
      horizontalAlignment = LinePattern.None), Text(origin = {-136.99999999999997, -5.0}, 
      lineColor = {0, 0, 0}, 
      extent = {{-39.0, 9.0}, {38.99999999999997, -9.000000000000004}}, 
      textString = "伸缩距离，范围0~0.34m", 
      textStyle = {TextStyle.None}, 
      textColor = {0, 0, 0}, 
      horizontalAlignment = LinePattern.None), Text(origin = {-144.0, 71.0}, 
      lineColor = {0, 0, 0}, 
      extent = {{-46.0, 9.0}, {46.0, -9.000000000000028}}, 
      textString = "翼的构型", 
      textStyle = {TextStyle.None}, 
      textColor = {0, 0, 0}, 
      horizontalAlignment = LinePattern.None), Text(origin = {-137.0, -44.01922077922076}, 
      lineColor = {0, 0, 0}, 
      extent = {{-46.0, 9.0}, {46.0, -9.000000000000028}}, 
      textString = "输入气动力", 
      textStyle = {TextStyle.None}, 
      textColor = {0, 0, 0}, 
      horizontalAlignment = LinePattern.None), Text(origin = {-137.0, -60.0}, 
      lineColor = {0, 0, 0}, 
      extent = {{-63.5, -4.5}, {63.5, 4.5}}, 
      textString = "x=0，y:正向阻力 z:升力", 
      textStyle = {TextStyle.None}, 
      textColor = {0, 0, 0}, 
      horizontalAlignment = LinePattern.None), Text(origin = {127.0, 31.999999999999993}, 
      lineColor = {0, 0, 0}, 
      extent = {{-89.0, 15.0}, {89.0, -15.0}}, 
      textString = "固定翼输出
1：3 根部力 4：6根部力矩 7：9 末端位移", 
      textStyle = {TextStyle.None}, 
      textColor = {0, 0, 0}, 
      horizontalAlignment = LinePattern.None), Text(origin = {127.0, -4.000000000000007}, 
      lineColor = {0, 0, 0}, 
      extent = {{-89.0, 15.0}, {89.0, -15.0}}, 
      textString = "伸缩翼输出
1：3 根部力 4：6根部力矩 7：9 末端位移", 
      textStyle = {TextStyle.None}, 
      textColor = {0, 0, 0}, 
      horizontalAlignment = LinePattern.None), Text(origin = {127.0, -35.0}, 
      lineColor = {0, 0, 0}, 
      extent = {{-89.0, 10.0}, {89.0, -9.999999999999993}}, 
      textString = "折叠翼输出
1：3 根部力 4：6根部力矩 ", 
      textStyle = {TextStyle.None}, 
      textColor = {0, 0, 0}, 
      horizontalAlignment = LinePattern.None)}), 
    __MWorks(ResultViewerManager(resultViewers = {
      ResultViewer(name = "3", executeTrigger = executeTrigger.SimulationStarted, commands = {
      CreatePlot(id = 1, position = [0, 0, 523, 409], y = ["system02H.result_mainbody[1]"], x_display_unit = "s", y_display_units = ["N"], y_axis = [1], legend_layout = 7, left_title = "[N]", fix_time_range = True, fix_time_range_value = 7.75683e-322), 
      CreatePlot(id = 2, position = [523, 0, 523, 409], y = ["system02H.result_mainbody[2]"], x_display_unit = "s", y_display_units = ["N"], y_axis = [1], legend_layout = 7, left_title = "[N]", fix_time_range = True, fix_time_range_value = 7.75683e-322), 
      CreatePlot(id = 3, position = [1046, 0, 522, 409], y = ["system02H.result_mainbody[3]"], x_display_unit = "s", y_display_units = ["N"], y_axis = [1], legend_layout = 7, left_title = "[N]", fix_time_range = True, fix_time_range_value = 7.75683e-322), 
      CreatePlot(id = 4, position = [0, 409, 523, 407], y = ["system02H.result_mainbody[4]"], x_display_unit = "s", y_display_units = ["N"], y_axis = [1], legend_layout = 7, left_title = "[N]", fix_time_range = True, fix_time_range_value = 7.75683e-322), 
      CreatePlot(id = 5, position = [523, 409, 523, 407], y = ["system02H.result_mainbody[5]"], x_display_unit = "s", y_display_units = ["N"], y_axis = [1], legend_layout = 7, left_title = "[N]", fix_time_range = True, fix_time_range_value = 7.75683e-322), 
      CreatePlot(id = 6, position = [1046, 409, 522, 407], y = ["system02H.result_mainbody[6]"], x_display_unit = "s", y_display_units = ["N"], y_axis = [1], legend_layout = 7, left_title = "[N]", fix_time_range = True, fix_time_range_value = 7.75683e-322)})})));
  tool.AIModel AIModel
    annotation (Placement(transformation(origin = {4.360227531285553, -4.0000000000000036}, 
      extent = {{-27.591262798634816, -27.591262798634816}, {27.591262798634812, 27.591262798634816}})));
equation 
  connect(realExpression.y, AIModel.a[1])
    annotation (Line(origin = {-77.0, 23.0}, 
      points = {{-49.0, 27.0}, {48.0, 27.0}, {48.0, -27.0}}, 
      color = {0, 0, 127}));
  connect(realExpression1.y, AIModel.a[2])
    annotation (Line(origin = {-77.0, 4.0}, 
      points = {{-49.0, 7.0}, {48.0, 7.0}, {48.0, -8.0}}, 
      color = {0, 0, 127}));
  connect(realExpression3.y, AIModel.a[3])
    annotation (Line(origin = {-77.0, -48.0}, 
      points = {{-49.0, -44.0}, {-49.0, -24.0}, {9.0, -24.0}, {9.0, 44.0}, {48.0, 44.0}}, 
      color = {0, 0, 127}));
  connect(realExpression4.y, AIModel.a[4])
    annotation (Line(origin = {-51.0, -48.0}, 
      points = {{-22.0, -44.0}, {22.0, -44.0}, {22.0, 44.0}}, 
      color = {0, 0, 127}));
end TestSystem02H3;