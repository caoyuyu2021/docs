within ServoWing.Examples;
model Test_PMSMController
  extends Icons.Test;
  annotation (Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0})), 
    experiment(StartTime = 0, StopTime = 2, Interval = 1e-005, Algorithm = "Dassl", Tolerance = 0.0001, DoublePrecision = true, StoreEventValue = false));
  Controller.PMSMController pMSMController(T_PWM = 0.01, U_dc = 30)
    annotation (Placement(transformation(origin = {10.0, -2.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.BooleanConstant const(k = false) annotation (Placement(transformation(origin = {-48.0, -60.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.TimeTable timeTable(table = {{0, 1}, {10, 10}})
    annotation (Placement(transformation(origin = {-48.0, 80.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.Constant timeTable1(k = 1) annotation (Placement(transformation(origin = {-48.0, 44.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.Sine timeTable2[3](phase = {0, 90, 180}) annotation (Placement(transformation(origin = {-48.0, -26.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.Constant timeTable3(k = 0) annotation (Placement(transformation(origin = {-48.0, 10.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  connect(timeTable.y, pMSMController.phi)
    annotation (Line(origin = {-25.0, 20.0}, 
      points = {{-12.0, 60.0}, {21.0, 60.0}, {21.0, -14.0}, {24.0, -14.0}}, 
      color = {0, 0, 127}));
  connect(timeTable1.y, pMSMController.w_ref)
    annotation (Line(origin = {-20.0, 12.0}, 
      points = {{-17.0, 32.0}, {12.0, 32.0}, {12.0, -10.0}, {19.0, -10.0}}, 
      color = {0, 0, 127}));
  connect(timeTable3.y, pMSMController.phi_ref)
    annotation (Line(origin = {-19.0, 4.0}, 
      points = {{-18.0, 6.0}, {7.0, 6.0}, {7.0, -6.0}, {18.0, -6.0}}, 
      color = {0, 0, 127}));
  connect(timeTable2.y, pMSMController.i_f)
    annotation (Line(origin = {-19.0, -16.0}, 
      points = {{-18.0, -10.0}, {7.0, -10.0}, {7.0, 10.0}, {18.0, 10.0}}, 
      color = {0, 0, 127}));
  connect(const.y, pMSMController.signal)
    annotation (Line(origin = {-19.0, -35.0}, 
      points = {{-18.0, -25.0}, {13.0, -25.0}, {13.0, 25.0}, {18.0, 25.0}}, 
      color = {255, 0, 255}));


end Test_PMSMController;