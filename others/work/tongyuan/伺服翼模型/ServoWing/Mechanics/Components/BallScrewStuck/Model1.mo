within ServoWing.Mechanics.Components.BallScrewStuck;
model Model1

  parameter SI.Force Fa = 17e3 "轴向工作载荷";
  parameter Integer Z_ = 44 "有效承载滚珠数";
  parameter SI.Angle alpha = 0.807214779047377 "接触角";
  parameter SI.Angle lambda = 0.118804562183254 "螺旋升角";
  parameter Real t = 1.07 "曲率比值";

  parameter SI.Length db(displayUnit = "mm") = 0.0035 "滚珠直径";
  parameter SI.Length dm(displayUnit = "mm") = 0.016 "丝杠副公称直径，d0";

  //
  Real D = db / dm * cos(alpha);
  //
  SI.Force Q "滚珠与滚道的法向接触载荷";
  //接触面主曲率

  //
  Real rho11;
  Real rho12;
  Real rho21;
  Real rho22_gs;//滚珠与丝杠滚道
  Real rho22_gl;//滚珠与螺母滚道
  //
  Real sum_rho_gs;
  Real F_rho_gs;
equation 
  //滚珠与滚道的法向接触载荷
  Q = Fa / (Z_ * sin(alpha) * cos(lambda));
  //接触面主曲率
  rho11 = 2 / db;
  rho12 = 2 / db;
  rho21 = -2 / (t * db);
  rho22_gs = 2 / db * D * cos(lambda) / (1 - D);
  rho22_gl = -2 / db * D * cos(lambda) / (1 + D);
  //滚珠与丝杠滚道接触处的弹塑性接触变形计算
  sum_rho_gs = rho11 + rho12 + rho21 + rho22_gl;
  F_rho_gs = abs(rho11 - rho12 + rho21 - rho22_gl) / sum_rho_gs;



end Model1;