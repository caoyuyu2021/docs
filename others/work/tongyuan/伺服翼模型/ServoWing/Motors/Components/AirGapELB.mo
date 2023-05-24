within ServoWing.Motors.Components;
model AirGapELB "失电制动器气隙模型"
  //extends Icons.BasicModel;
  //参数
  parameter Utilities.Types.ForceConstant K_F = 32 "力常数";
  parameter Utilities.Types.VoltageConstant K_e = 32 "反电动势常数";
  //parameter Modelica.SIunits.Resistance Ra = 7.5 "电枢电阻";
  //变量
  SI.Voltage v "两接口电势差(= p.v - n.v)";
  SI.Current i "从接口p到接口n的电流";
  SI.Force f_electrical "电磁力";
  SI.Position s_rel "位移";
  SI.Velocity u "速度";
  SI.Voltage v_ai "感应电枢电压";
  SI.Current i_a "感应电枢电流";
  //实例化
  Interfaces.ElectricalInterfaces.SinglePhase.PositivePin p "正极接口" 
    annotation (Placement(transformation(origin = {-100.0, 40.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Interfaces.ElectricalInterfaces.SinglePhase.NegativePin n "负极接口" 
    annotation (Placement(transformation(origin = {-100.0, -40.0}, 
      extent = {{10.0, -10.0}, {-10.0, 10.0}})));
  Interfaces.TranslationalInterfaces.Flange_a flange_a "电机动子输出端" 
    annotation (extent = [-10, 110; 10, 90], 
      Placement(transformation(origin = {102.0, 40.0}, 
        extent = {{-10.0, 10.0}, {10.0, -10.0}})));
  Interfaces.TranslationalInterfaces.Flange_b support "电机定子支撑端" annotation (extent = [-10, -110; 10, -90], 
    Placement(transformation(origin = {100.0, -40.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  annotation (
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Rectangle(origin = {8.0, 2.0}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-34.0, 4.0}, {34.0, -4.0}}), Rectangle(origin = {1.0, 40.0}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.CrossDiag, 
      extent = {{-19.0, 28.0}, {19.0, -28.0}}), Rectangle(origin = {1.0, -36.0}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.CrossDiag, 
      extent = {{-19.0, 28.0}, {19.0, -28.0}}), Line(origin = {-40.0, 2.0}, 
      points = {{-12.0, 0.0}, {12.0, 0.0}}, 
      thickness = 2.0, 
      arrow = {Arrow.None, Arrow.Filled}, 
      arrowSize = 6.0), Text(origin = {0.0, -130.0}, 
      extent = {{-75.0, 30.0}, {75.0, -30.0}}, 
      textString = "制动器气隙", 
      fontName = "微软雅黑", 
      textStyle = {TextStyle.None})}));
equation 
  //电枢电极（反电动势）
  //v_ai + i_a * Ra = v;
  v_ai = v;
  i_a = i;
  //机械输出端位移
  s_rel = flange_a.s - support.s;
  u = der(s_rel);
  //气隙动子速度
  v_ai = K_e * u;
  //电磁力
  f_electrical = K_F * i_a;
  flange_a.f = -f_electrical;
  support.f = f_electrical;
  //接口方程
  v = p.v - n.v;
  0 = p.i + n.i;
  i = p.i;
end AirGapELB;