within ServoWing.Motors.Components;
model AirGapR1 "固定坐标系下的气隙模型"
  parameter Modelica.SIunits.Inductance Lmd "主磁场电感d轴";
  parameter Modelica.SIunits.Inductance Lmq "主磁场电感q轴";
  extends PartialAirGap1;
  Modelica.SIunits.Current i_mr[2] "相对于转子固定坐标系的磁化电流空间相量";
protected 
  parameter Modelica.SIunits.Inductance L[2,2] = {{Lmd, 0}, {0, Lmq}} "电感矩阵";
  annotation (defaultComponentName = "airGap", 
    Diagram, 
    Icon(
      Text(
        extent = [0, 40; 80, -40], 
        string = "R", 
        style(
          color = 0, 
          rgbcolor = {0, 0, 0}, 
          gradient = 1, 
          fillColor = 10, 
          rgbfillColor = {128, 128, 128})), 
      Text(
        extent = [-150, -90; 150, -150], 
        style(color = 3, rgbcolor = {0, 0, 255}), 
        string = "%name")), 
    Documentation(info = "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\">








<HTML><HEAD>








<META content=\"text/html; charset=gb2312\" http-equiv=Content-Type>








<META name=GENERATOR content=\"MSHTML 9.00.8112.16540\"></HEAD>








<BODY>Model of the airgap in rotor-fixed coordinate system, using only 








equations. </BODY></HTML>








 "));
equation 
  //  d-q同步旋转坐标系中的总电流
  i_mr = i_sr + i_rr;
  // 转子磁通
  psi_mr = L * i_mr;
  // 定子磁通
  psi_ms = RotationMatrix * psi_mr;
end AirGapR1;