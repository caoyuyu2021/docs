within ServoWing.System.Subsystems;
model ElectricalSystem "电气系统"
  extends Icons.BasicModel;
  parameter SI.Voltage U_dc = 220 "直流电源电压" 
    annotation (Dialog(tab = "直流电源"));
  parameter SI.Time V_Loss_start = 1e10 "失电制动器电源失电时间" 
    annotation (Dialog(tab = "故障参数"));
  // 故障变量
  Real ColorR;
  Real ColorG;
  Real ColorB;
  Boolean fault_start "故障触发判断";
  Real fault_r "故障未触发";
  Real fault_t "故障触发";
  Real fault_f "故障触发";


  annotation (
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Rectangle(origin = {40.0, 23.0}, 
      fillColor = {85, 170, 0}, 
      fillPattern = FillPattern.Solid, 
      lineThickness = 1.0, 
      extent = {{-32.0, 31.0}, {32.0, -31.0}}), Polygon(origin = {40.0, 23.0}, 
      fillColor = {145, 145, 216}, 
      fillPattern = FillPattern.Solid, 
      lineThickness = 1.0, 
      points = {{32.0, 31.0}, {-32.0, -31.0}, {32.0, -31.0}}), Text(origin = {0.0, -130.0}, 
      extent = {{-60.0, -30.0}, {60.0, 30.0}}, 
      textString = "电气系统", 
      fontName = "微软雅黑", 
      textStyle = {TextStyle.None}), Line(origin = {-65.0, -48.0}, 
      points = {{-15.0, 0.0}, {15.0, 0.0}}, 
      thickness = 1.0), Line(origin = {-64.0, -54.0}, 
      points = {{-10.0, 0.0}, {10.0, 0.0}}, 
      thickness = 1.0), Line(origin = {-64.0, -60.0}, 
      points = {{-6.0, 0.0}, {6.0, 0.0}}, 
      thickness = 1.0), Line(origin = {-64.0, 8.0}, 
      rotation = 90.0, 
      points = {{0.0, 17.999999999999993}, {0.0, -18.000000000000007}}, 
      thickness = 1.0), Line(origin = {-63.0, 0.0}, 
      rotation = 90.0, 
      points = {{0.0, 9.0}, {7.105427357601002e-15, -9.000000000000007}}, 
      thickness = 1.0), Line(origin = {-64.0, -24.0}, 
      points = {{0.0, 24.0}, {0.0, -24.0}}, 
      thickness = 1.0), Text(origin = {25.0, 39.0}, 
      extent = {{-17.0, 15.0}, {17.0, -15.0}}, 
      textString = "DC", 
      textStyle = {TextStyle.None}), Text(origin = {55.0, 8.0}, 
      extent = {{-15.0, 16.0}, {15.0, -16.0}}, 
      textString = "AC", 
      textStyle = {TextStyle.None}), Line(origin = {-29.0, 21.0}, 
      points = {{-35.0, -13.0}, {-35.0, 13.0}, {35.0, 13.0}}, 
      thickness = 1.0), Line(origin = {-29.0, -5.0}, 
      points = {{-35.0, -19.0}, {-1.0, -19.0}, {-1.0, 19.0}, {35.0, 19.0}}, 
      thickness = 1.0), Rectangle(origin = {-2.0, -2.0}, 
      lineColor = DynamicSelect({255, 255, 255}, {ColorR, ColorG, ColorB}), 
      fillColor = {255, 255, 255}, 
      pattern = LinePattern.Dash, 
      lineThickness = 5.0, 
      extent = {{-100.0, 100.0}, {100.0, -100.0}}, 
      radius = 15.0)}));
  Interfaces.BlockInterfaces.BooleanInput pulse[6] annotation (Placement(transformation(origin = {-110.0, 0.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Electrical.MultiPhase.Interfaces.PositivePlug plug_n annotation (Placement(transformation(origin = {100.0, -40.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}})));


  Electrical.ConstantVoltage constantVoltage(V = U_dc)
    annotation (Placement(transformation(origin = {52.0, -2.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      rotation = 270.0)));
  Electrical.Ground ground
    annotation (Placement(transformation(origin = {52.0, -48.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Electrical.ThreePhase DCAC
    annotation (Placement(transformation(extent = {{11.999999999999979, -12.000000000000004}, {-11.999999999999979, 12.000000000000004}})));
  Interfaces.ElectricalInterfaces.SinglePhase.PositivePin pin_ap "失电制动器电源正极" 
    annotation (Placement(transformation(origin = {100.0, 40.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Interfaces.ElectricalInterfaces.SinglePhase.NegativePin pin_an "失电制动器电源负极" 
    annotation (Placement(transformation(origin = {100.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Electrical.Components.IdealClosingSwitch idealClosingSwitch
    annotation (Placement(transformation(origin = {52.0, 32.0}, 
      extent = {{10.0, -10.0}, {-10.0, 10.0}}, 
      rotation = -90.0)));
  Modelica.Blocks.Sources.BooleanStep booleanStep(startValue = true, startTime = V_Loss_start)
    annotation (Placement(transformation(origin = {40.0, 74.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  if time > V_Loss_start then 
    fault_start = true;
  else
    fault_start = false;
  end if;
  if fault_start then 
    fault_r = 0;
    fault_t = 0;
    fault_f = 1;
  else
    fault_r = 1;
    fault_t = 0;
    fault_f = 0;
  end if;
  connect(constantVoltage.p, idealClosingSwitch.p)
    annotation (Line(origin = {52.0, 14.0}, 
      points = {{0.0, -6.0}, {0.0, 8.0}}, 
      color = {0, 0, 255}));
  connect(idealClosingSwitch.n, DCAC.pSupply)
    annotation (Line(origin = {32.0, 27.0}, 
      points = {{20.0, 15.0}, {20.0, 21.0}, {-2.0, 21.0}, {-2.0, -22.0}, {-20.0, -22.0}}, 
      color = {0, 0, 255}));
  connect(idealClosingSwitch.n, pin_ap)
    annotation (Line(origin = {76.0, 44.0}, 
      points = {{-24.0, -2.0}, {-24.0, 4.0}, {8.0, 4.0}, {8.0, -4.0}, {24.0, -4.0}}, 
      color = {0, 0, 255}));
algorithm 
  when sample(0, 0.05) then 
    ColorR := 255 * fault_f + 255 * fault_t + 255 * fault_r;
    ColorG := 0 * fault_f + 255 * fault_t + 255 * fault_r;
    ColorB := 0 * fault_f + 255 * fault_t + 255 * fault_r;
  end when;
  when sample(0, 0.1) then 
    ColorR := 255 * fault_t + 255 * fault_f + 255 * fault_r;
    ColorG := 0 * fault_t + 255 * fault_f + 255 * fault_r;
    ColorB := 0 * fault_t + 255 * fault_f + 255 * fault_r;
  end when;
equation 
  connect(constantVoltage.n, ground.p)
    annotation (Line(origin = {-46.0, -31.0}, 
      points = {{98.0, 19.0}, {98.0, -7.0}}, 
      color = {0, 0, 255}));
  connect(constantVoltage.n, DCAC.nSupply)
    annotation (Line(origin = {-27.0, -7.0}, 
      points = {{79.0, -5.0}, {79.0, -18.0}, {57.0, -18.0}, {57.0, 2.0}, {39.0, 2.0}}, 
      color = {0, 0, 255}));
  connect(pulse, DCAC.pulse)
    annotation (Line(origin = {-61.0, 0.0}, 
      points = {{-49.0, 0.0}, {48.0, 0.0}}, 
      color = {255, 0, 255}));
  connect(DCAC.pLoad, plug_n)
    annotation (Line(origin = {50.0, -42.0}, 
      points = {{-50.0, 30.0}, {-50.0, -18.0}, {30.0, -18.0}, {30.0, 2.0}, {50.0, 2.0}}, 
      color = {0, 0, 255}));
  connect(ground.p, pin_an)
    annotation (Line(origin = {76.0, -9.0}, 
      points = {{-24.0, -29.0}, {-24.0, -15.0}, {-4.0, -15.0}, {-4.0, 9.0}, {24.0, 9.0}}, 
      color = {0, 0, 255}));
  connect(booleanStep.y, idealClosingSwitch.control)
    annotation (Line(origin = {66.0, 67.0}, 
      points = {{-15.0, 7.0}, {7.0, 7.0}, {7.0, -35.0}, {-7.0, -35.0}}, 
      color = {255, 0, 255}));
end ElectricalSystem;