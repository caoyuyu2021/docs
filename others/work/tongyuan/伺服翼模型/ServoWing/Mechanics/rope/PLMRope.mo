within ServoWing.Mechanics.rope;
model PLMRope "平面提升绳(简化)"
  annotation (Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    preserveAspectRatio = false, 
    grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      preserveAspectRatio = false, 
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
  ServoWing.Interfaces.Planar.Frame_a rope1
    annotation (Placement(transformation(origin = {-100.0, 0.0}, 
      extent = {{-16.0, -16.0}, {16.0, 16.0}})));
  ServoWing.Interfaces.Planar.Frame_b rope2 annotation (Placement(transformation(origin = {100.0, 0.0}, 
    extent = {{-16.0, -16.0}, {16.0, 16.0}})));
  Real a[2] "绳的拉伸长度";
  Real L "总长度";
  Real K "总刚度";
  Real R "总粘性摩擦力";
  Real I "总惯量";
  Real alpha "绳的倾斜角度";
  Real v "绳的速度";
  Real v1 "端口1速度";
  Real v2 "端口2速度";
  Real F[2] "绳的力";
  Real Fc[2];
  Real L0(unit = "m") "绳子的初始长度";
  Real free_length "绳子自由长度";
  Real unc1 "绳在端口1处缠绕的长度";
  Real unc2 "绳在端口2处缠绕的长度";
  Real p_start1[2] "绳1端口初始位置";
  Real p_start2[2] "绳2端口初始位置";
  parameter Real K0(unit = "N/m") = 1e6 "单位长度绳子的刚度";
  parameter Real Rvisc0(unit = "N/(m/s)") = 1000 "单位长度绳子的粘性摩擦";
  parameter Real M0(unit = "kg/m") = 1 "单位长度绳子的质量";
  //parameter Real F0(unit = "N") = 0 "初始张力";
initial equation 
  p_start1 = {rope1.x, rope1.y};
  p_start2 = {rope2.x, rope2.y};
equation 
  //rope1.t = rope2.t;
  L0 ^ 2 = (p_start1[1] - p_start2[1]) ^ 2 + (p_start1[2] - p_start2[2]) ^ 2;
  if abs(rope1.x - rope2.x) < Modelica.Constants.eps then 
    if rope2.y > rope1.y then 
      alpha = -pi / 2;
    else
      alpha = pi / 2;
    end if;
  else
    alpha = arctan((rope2.y - rope1.y) / (rope2.x - rope1.x));
  end if;
  unc1 * cos(alpha) = rope1.x - p_start1[1];
  unc1 * sin(alpha) = rope1.y - p_start1[2];
  unc2 * cos(alpha) = rope2.x - p_start2[1];
  unc2 * sin(alpha) = rope2.y - p_start2[2];
  v1 = der(unc1);
  v2 = der(unc2);
  rope1.phi = rope2.phi;
  rope2.phi = alpha;
  free_length = L0 + unc1 + unc2;
  K = K0 / free_length;
  R = Rvisc0 / free_length;
  I = M0 * free_length;
  der(a[1]) = v - v1;
  der(a[2]) = -v - v2;
  L = free_length + a[1] + a[2];
  L * cos(alpha) = rope2.x - rope1.x;
  L * sin(alpha) = rope2.y - rope1.y;
  for i in 1:2 loop 
    der(Fc[i]) = 2 * K * der(a[i]);
    F[i] = -Fc[i] - 2 * R * der(a[i]);
  end for;
  der(v) = (F[1] - F[2]) / I - Modelica.Constants.g_n * sin(alpha);
  rope1.fx = F[1] * cos(alpha);
  rope1.fy = F[1] * sin(alpha) - Modelica.Constants.g_n * I / 2;
  rope2.fx = -F[2] * cos(alpha);
  rope2.fy = -F[2] * sin(alpha) - Modelica.Constants.g_n * I / 2;
end PLMRope;