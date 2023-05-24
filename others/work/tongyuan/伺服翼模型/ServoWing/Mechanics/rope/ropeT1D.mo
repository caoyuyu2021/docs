within ServoWing.Mechanics.rope;
model ropeT1D "一维平动提升绳"
  annotation (
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Rectangle(origin = {0.0, 0.0}, 
      lineColor = {0, 170, 0}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.Backward, 
      lineThickness = 1.0, 
      extent = {{-90.0, 20.0}, {90.0, -20.0}}), Line(origin = {-95.0, 0.0}, 
      points = {{-5.0, 0.0}, {5.0, 0.0}}, 
      color = {0, 170, 0}), Line(origin = {95.0, 0.0}, 
      points = {{-5.0, 0.0}, {5.0, 0.0}}, 
      color = {0, 170, 0})}));
  Real L "总长度";
  Real K "总刚度";
  Real I "总惯性（质量）";
  Real R "总粘性摩擦力";
  Real a_rope "绳的加速度";
  Real v_rope "绳的速度";
  Real a1 "端口1处的伸长";
  Real a2 "端口2处的伸长";
  Real emtc1(start = 1, fixed = true) "绳刚度端口1的力";
  Real emtc2(start = 1, fixed = true) "绳刚度端口2的力";
  Real v1;
  Real v2;
  parameter Real K0 = 1e6 "单位长度的刚度";
  parameter Real I0 = 0.5 "单位长度的质量";
  parameter Real Rvis0 = 1000 "单位长度的粘性摩擦力";
  parameter Real L0 = 10 "初始长度";
  parameter Real alpha = -pi / 2 "倾角，+90 rope1 在最低点，-90 rope2 在最高点";
  parameter Integer nr = 1 "绳子的数量";
  Modelica.Mechanics.Translational.Interfaces.Flange_b rope2 annotation (Placement(transformation(origin = {110.0, 0.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}})));

  Modelica.Mechanics.Translational.Interfaces.Flange_b rope1 annotation (Placement(transformation(origin = {-110.0, 0.0}, 
    extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  v1 = der(rope1.s);
  v2 = der(rope2.s);
  //绳的总长度
  L = L0 + rope1.s + a1 + a2;
  //两个端口长度的微分
  der(a1) = v_rope - v1;
  der(a2) = -v_rope - v2;
  //计算绳的参数
  K * (L0 + rope1.s) = nr * K0;
  R * (L0 + rope1.s) = nr * Rvis0;
  I = nr * I0 * (L0 + rope1.s);
  //两个端口的力
  rope1.f = -emtc1 - 2 * R * der(a1);
  rope2.f = -emtc2 - 2 * R * der(a2);
  //计算emtc1和emtc2
  der(emtc1) = 2 * K * der(a1);
  der(emtc2) = 2 * K * der(a2);
  //求绳的加速度
  der(v_rope) = 1 / I * (rope1.f - rope2.f - 9.81 * I * sin(alpha));
  a_rope = der(v_rope);
end ropeT1D;