within ServoWing.Motors.Components;
partial model PartialAirGap1 "基本气隙模型"
  //参数
  parameter Integer m = 3 "相数";
  parameter Integer p(min = 1) = 1 "极对数";
  //变量
  output Modelica.SIunits.Torque tau_electrical;
  Modelica.SIunits.Angle gamma "转子角位移,电角度";
  //-------第一个下标字母为电流类型，第二个为坐标系----------//
  Modelica.SIunits.Current i_ss[2] "定子电流（α-β静止坐标系即定子坐标系）";
  Modelica.SIunits.Current i_rs[2] "转子电流（α-β静止坐标系即定子坐标系）";

  Modelica.SIunits.Current i_sr[2] "定子电流（d-q同步旋转坐标系即转子坐标系）";
  Modelica.SIunits.Current i_rr[2] "转子电流（d-q同步旋转坐标系即转子坐标系）";

  Modelica.SIunits.MagneticFlux psi_ms[2] "定子磁通";
  Modelica.SIunits.MagneticFlux psi_mr[2] "转子磁通";
  Real RotationMatrix[2,2] "α-β静止坐标系变换到d-q同步旋转坐标系的旋转矩阵";
  //实例化
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a
    annotation (extent = [-10, 110; 10, 90]);
  Modelica.Mechanics.Rotational.Interfaces.Flange_a support "support at which the reaction torque is acting" 
    annotation (extent = [-10, -110; 10, -90]);
  Modelica.Electrical.Machines.Interfaces.SpacePhasor spacePhasor_s
    annotation (extent = [-110, 90; -90, 110]);
  Modelica.Electrical.Machines.Interfaces.SpacePhasor spacePhasor_r
    annotation (extent = [90, 90; 110, 110]);
  annotation (Diagram, 
    Icon(
      Ellipse(extent = [-90, 90; 90, -92], style(
        color = 3, 
        rgbcolor = {0, 0, 255}, 
        fillColor = 7, 
        rgbfillColor = {255, 255, 255})), 
      Ellipse(extent = [-80, 80; 80, -80], style(color = 3)), 
      Rectangle(extent = [-10, 90; 10, -80], style(
        color = 3, 
        gradient = 1, 
        fillColor = 10)), 
      Text(
        extent = [-150, -90; 150, -150], 
        style(color = 3, rgbcolor = {0, 0, 255}), 
        string = "%name")), 
    Documentation(info = "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\">








<HTML><HEAD>








<META content=\"text/html; charset=gb2312\" http-equiv=Content-Type>








<META name=GENERATOR content=\"MSHTML 9.00.8112.16540\"></HEAD>








<BODY>Partial model of the airgap, using only equations. </BODY></HTML>








 "));
equation 
  // 等效二极电机转子的机械角
  gamma = p * (flange_a.phi - support.phi);
  // α-β静止坐标系变换到d-q同步旋转坐标系的旋转矩阵
  RotationMatrix = {{+cos(gamma), -sin(gamma)}, {+sin(gamma), +cos(gamma)}};
   //电流变换
  i_ss = spacePhasor_s.i_;
  i_ss = RotationMatrix * i_sr;
  i_rr = spacePhasor_r.i_;
  i_rs = RotationMatrix * i_rr;
  //定子电压感应
  spacePhasor_s.v_ = der(psi_ms);
  // 转子电压感应
  spacePhasor_r.v_ = der(psi_mr);
  //机电转矩（电流和磁通相量的叉积）
  tau_electrical = m / 2 * p * (spacePhasor_s.i_[2] * psi_ms[1] - spacePhasor_s.i_[1] * psi_ms[2]);
  flange_a.tau = -tau_electrical;
  support.tau = tau_electrical;
end PartialAirGap1;