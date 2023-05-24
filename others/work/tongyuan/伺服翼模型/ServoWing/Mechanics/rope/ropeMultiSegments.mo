within ServoWing.Mechanics.rope;
model ropeMultiSegments "提升绳(多段)"
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
    //
  parameter Integer Nnodes = 2 "绳子分段";
  parameter Real K0 = 1e6 "单位长度的刚度";
  parameter Real I0 = 0.5 "单位长度的质量";
  parameter Real Rvis0 = 1000 "单位长度的粘性摩擦力";
  parameter Real L0 = 10 "初始长度";
  parameter Real alpha = -90 "倾角，+90 rope1 在最低点，-90 rope2 在最高点";
  //parameter Integer nr = 1 "绳子的数量";
  //0611
  parameter SI.Density rho = 1100 "海水密度";
  parameter SI.Diameter D_s = 0.05 "绳子直径";
  parameter SI.Length l_us = 1500 "水中绳子初始长度";
  //计算惯性力
  parameter SI.Volume V = 2 "单位长度体积";
  parameter Real Ca = 0.5 "附连质量系数";
  parameter Real Cm = Ca + 1 "惯性力系数，1.3-2";
  parameter SI.Velocity u = 0 "垂直于构件轴线水速度分量";
  //

  Real L "总长度";
  Real K "总刚度";
  Real I "总惯性（质量）";
  Real R "总粘性摩擦力";
  Real a_rope "绳的加速度";
  //Real v_rope "绳的速度";
  //Real L1 "端口1处的伸长";
  //Real a2 "端口2处的伸长";
  //Real emtc1 "绳刚度端口1的力";
  //Real emtc2 "绳刚度端口2的力";
  Real v1;
  Real v2;
  //0611
  SI.Length l(start = 0, fixed = true) "绳子拉离长度";
  SI.Length l_u "水中绳子实际长度";
  SI.Volume volume "绳子在水中体积";
  SI.Force F_B "浮力";
  SI.Acceleration a_v "垂直于构件轴线构件加速度分量";
  SI.Acceleration a_u "垂直于构件轴线水加速度分量";
  ServoWing.Utilities.Types.LinearForce F_I "单位长度惯性力";
  //0619
  Real Ki "每段刚度";
  Real VNodes[Nnodes];
  Real Frope[Nnodes + 1];
  Real la[Nnodes + 1] "每段绳子伸长";
  Modelica.Mechanics.Translational.Interfaces.Flange_b rope2
    annotation (Placement(transformation(origin = {110.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_a rope1
    annotation (Placement(transformation(origin = {-110.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  v1 = der(rope1.s);
  v2 = der(rope2.s);
  //绳的总长度
  //L = L0 + rope1.s + L1;
  L = L0 + rope1.s + rope2.s + sum(la);
  //两个端口长度的微分
  //der(L1) = v2 - v1;
  //der(a2) = -v_rope - v2;
  //计算绳的参数

  // K =  K0 / (L0 + rope1.s);
  K = Ki / Nnodes;
  R = Rvis0 / (L0 + rope1.s + rope2.s);
  I = I0 * (L0 + rope1.s + rope2.s);
  //两个端口的力
  //rope1.f = -emtc1 - 2 * R * der(L1);
  //rope2.f = -emtc2 - 2 * R * der(a2);
  //计算emtc1和emtc2
  //der(emtc1) = K * der(L1);
  //der(emtc2) = 2 * K * der(a2);
  //求绳的加速度
  // der(v2) = 1 / I * (rope1.f - rope2.f - 9.81 * I * sin(alpha));
  a_rope = der(v2);
  //0611
  v2 = der(l);
  l_u = l_us - l;
  volume = l_u * Modelica.Constants.pi * D_s ^ 2 / 4;
  //绳子浮力
  F_B = rho * Modelica.Constants.g_n * volume;
  //惯性力
  a_u = der(u);
  a_v = a_rope;
  F_I = rho * V * (Cm * a_u - Ca * a_v);
  a_rope = 1 / I * (rope1.f - rope2.f - F_B - F_I * L - Modelica.Constants.g_n * I * sin(alpha / 57.3));
  //a_rope = 1 / I * (rope1.f + rope2.f - 9.81 * I * sin(alpha / 57.3));
  //0619
  Ki = K0 / (L0 + rope1.s + rope2.s);
  //Ki = K0 / L0;
  //Ki = K0 / 10;
  for i in 1:Nnodes loop 
    der(VNodes[i]) = -Nnodes * (Frope[i] - Frope[i + 1]) / I - Modelica.Constants.g_n * sin(alpha / 57.3);
  end for;
  for i in 2:Nnodes loop 
    der(la[i]) = VNodes[i - 1] - VNodes[i];
  end for;
  der(la[1]) = v1 - VNodes[1];
  der(la[Nnodes + 1]) = VNodes[Nnodes] - v2;
  for i in 1:Nnodes + 1 loop 
    Frope[i] = -Nnodes * (Ki * la[i] + R * der(la[i]));
  end for;
  rope1.f = Frope[1];
end ropeMultiSegments;