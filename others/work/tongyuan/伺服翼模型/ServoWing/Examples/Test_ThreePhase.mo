within ServoWing.Examples;
model Test_ThreePhase
  extends Icons.Test;
  annotation (
    Diagram(coordinateSystem(extent = {{-120.0, -100.0}, {100.0, 120.0}}, 
      grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0})), 
    experiment(StartTime = 0, StopTime = 1, Interval = 0.0001, Algorithm = "Dassl", Tolerance = 0.0001, DoublePrecision = true, StoreEventValue = false));
  Electrical.ThreePhase DCAC
    annotation (Placement(transformation(origin = {-18.0, 44.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(origin = {-68.0, 12.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V = 30)
    annotation (Placement(transformation(origin = {-68.0, 50.00000000000001}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      rotation = 270.0)));
  Modelica.Electrical.MultiPhase.Basic.Star star
    annotation (Placement(transformation(origin = {58.0, -10.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Electrical.Analog.Basic.Ground ground1
    annotation (Placement(transformation(origin = {76.0, -26.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Electrical.MultiPhase.Basic.Resistor resistor(R = fill(5, 3))
    annotation (Placement(transformation(origin = {-2.0, -10.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      rotation = 360.0)));
  Modelica.Electrical.MultiPhase.Basic.Inductor lssigma(m = 3, 
    L = fill(1e-2, 3))
    annotation (extent = [30, 50; 10, 70], 
      Placement(transformation(origin = {26.0, -10.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.BooleanPulse booleanPulse(period = 0.01)
    annotation (Placement(transformation(origin = {40.0, 72.0}, 
      extent = {{10.0, -10.0}, {-10.0, 10.0}})));
  Modelica.Blocks.Sources.BooleanPulse booleanPulse1(period = 0.01, startTime = 0.01 / 2)
    annotation (Placement(transformation(origin = {40.0, 44.0}, 
      extent = {{10.0, -10.0}, {-10.0, 10.0}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k = false)
    annotation (Placement(transformation(origin = {40.0, 14.0}, 
      extent = {{10.0, -10.0}, {-10.0, 10.0}})));
equation 
  connect(constantVoltage.n, ground.p)
    annotation (Line(origin = {-66.0, 26.0}, 
      points = {{-2.0, 14.0}, {-2.0, -4.0}}, 
      color = {0, 0, 255}));
  connect(constantVoltage.p, DCAC.pSupply)
    annotation (Line(origin = {-49.0, 54.0}, 
      points = {{-19.0, 6.0}, {1.0, 6.0}, {1.0, -6.0}, {21.0, -6.0}}, 
      color = {0, 0, 255}));
  connect(constantVoltage.n, DCAC.nSupply)
    annotation (Line(origin = {-49.0, 40.0}, 
      points = {{-19.0, 0.0}, {-19.0, -10.0}, {1.0, -10.0}, {1.0, 0.0}, {21.0, 0.0}}, 
      color = {0, 0, 255}));
  connect(star.pin_n, ground1.p)
    annotation (Line(origin = {15.0, -34.0}, 
      points = {{53.0, 24.0}, {61.0, 24.0}, {61.0, 18.0}}, 
      color = {0, 0, 255}));
  connect(DCAC.pLoad, resistor.plug_p)
    annotation (Line(origin = {-20.0, 3.0}, 
      points = {{2.0, 31.0}, {2.0, -13.0}, {8.0, -13.0}}, 
      color = {0, 0, 255}));
  connect(resistor.plug_n, lssigma.plug_p)
    annotation (Line(origin = {12.0, -10.0}, 
      points = {{-4.0, 0.0}, {4.0, 0.0}}, 
      color = {0, 0, 255}));
  connect(lssigma.plug_n, star.plug_p)
    annotation (Line(origin = {42.0, -10.0}, 
      points = {{-6.0, 0.0}, {6.0, 0.0}}, 
      color = {0, 0, 255}));
  connect(booleanPulse.y, DCAC.pulse[1])
    annotation (Line(origin = {11.0, 58.0}, 
      points = {{18.0, 14.0}, {-1.0, 14.0}, {-1.0, -14.0}, {-18.0, -14.0}}, 
      color = {255, 0, 255}));
  connect(booleanPulse1.y, DCAC.pulse[2])
    annotation (Line(origin = {11.0, 44.0}, 
      points = {{18.0, 0.0}, {-18.0, 0.0}}, 
      color = {255, 0, 255}));
  connect(booleanConstant.y, DCAC.pulse[3])
    annotation (Line(origin = {11.0, 29.0}, 
      points = {{18.0, -15.0}, {-1.0, -15.0}, {-1.0, 15.0}, {-18.0, 15.0}}, 
      color = {255, 0, 255}));
  connect(booleanConstant.y, DCAC.pulse[4])
    annotation (Line(origin = {11.0, 29.0}, 
      points = {{18.0, -15.0}, {-1.0, -15.0}, {-1.0, 15.0}, {-18.0, 15.0}}, 
      color = {255, 0, 255}));
  connect(booleanConstant.y, DCAC.pulse[5])
    annotation (Line(origin = {11.0, 29.0}, 
      points = {{18.0, -15.0}, {-1.0, -15.0}, {-1.0, 15.0}, {-18.0, 15.0}}, 
      color = {255, 0, 255}));
  connect(booleanConstant.y, DCAC.pulse[6])
    annotation (Line(origin = {11.0, 29.0}, 
      points = {{18.0, -15.0}, {-1.0, -15.0}, {-1.0, 15.0}, {-18.0, 15.0}}, 
      color = {255, 0, 255}));
end Test_ThreePhase;