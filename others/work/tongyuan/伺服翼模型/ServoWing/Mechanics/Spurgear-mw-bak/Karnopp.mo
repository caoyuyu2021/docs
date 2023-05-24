within ServoWing.Mechanics.Spurgear;
model Karnopp "考虑库伦摩擦和静摩擦模型（MECFR1RK0）"
  Interfaces.RotationalInterfaces.Flange_a flange_a
    annotation (Placement(transformation(origin = {0.0, -100.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));

  Modelica.Blocks.Interfaces.RealInput cmde "外部输入力矩" 
    annotation (Placement(transformation(origin = {-110.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));

  parameter SI.Inertia Ish1 = 1 "转动惯量";
  parameter SI.Torque Tstick = 12 "最大的静摩擦力矩";
  parameter SI.Torque Tslip = 10 "最大的库伦摩擦力矩";
  parameter Real must = 0.12 "静摩擦系数";
  parameter Real musl = 0.1 "动摩擦系数";
  parameter SI.Diameter diam = 0.1 "直径,原是100mm";
  parameter Real dvel(unit = "rev/min") = 1 "静转速阈值";
  parameter Real astrib(unit = "rev/min") = 0.1 "斯特里贝克常数";
  //
  parameter Boolean strib = true "1,考虑斯特贝克效应;0,不考虑斯特贝克效应";
  //变量
  SI.Torque Ttrans "摩擦力矩";
  Integer stick "1,静止;0,滑动";
  SI.AngularVelocity omeg1 "转速";
  SI.Torque T_ext "接口力矩";
  SI.Torque Tc "库伦摩擦力矩";
  SI.Torque Ts "静摩擦力矩";
  annotation (
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Rectangle(origin = {10.0, -26.0}, 
      fillColor = {134, 134, 134}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-90.0, 70.0}, {70.0, 60.0}}), Rectangle(origin = {0.0, -120.0}, 
      fillColor = {255, 255, 255}, 
      lineThickness = 0.5, 
      extent = {{-10.0, 60.0}, {10.0, 20.0}}), Rectangle(origin = {0.0, -50.0}, 
      fillColor = {255, 255, 255}, 
      lineThickness = 0.5, 
      extent = {{-80.0, 10.0}, {80.0, -10.0}}), Rectangle(origin = {0.0, -58.0}, 
      fillColor = {134, 134, 134}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-20.0, 22.0}, {20.0, 18.0}}), Rectangle(origin = {-50.0, -30.0}, 
      fillColor = {134, 134, 134}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-30.0, 10.0}, {30.0, -10.0}}), Rectangle(origin = {-115.0, -37.5}, 
      fillColor = {134, 134, 134}, 
      fillPattern = FillPattern.Solid, 
      extent = {{135.0, 17.5}, {195.0, -2.5}}), Rectangle(origin = {0.0, 72.0}, 
      fillColor = {134, 134, 134}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-40.0, 2.0}, {40.0, -2.0}}), Line(origin = {-35.0, 77.0}, 
      points = {{3.0, -3.0}, {-3.0, 3.0}}, 
      thickness = 0.5), Line(origin = {-31.0, 77.0}, 
      points = {{3.0, -3.0}, {-3.0, 3.0}}, 
      thickness = 0.5), Line(origin = {-27.0, 77.0}, 
      points = {{3.0, -3.0}, {-3.0, 3.0}}, 
      thickness = 0.5), Line(origin = {-23.0, 77.0}, 
      points = {{3.0, -3.0}, {-3.0, 3.0}}, 
      thickness = 0.5), Line(origin = {-19.0, 77.0}, 
      points = {{3.0, -3.0}, {-3.0, 3.0}}, 
      thickness = 0.5), Line(origin = {-15.0, 77.0}, 
      points = {{3.0, -3.0}, {-3.0, 3.0}}, 
      thickness = 0.5), Line(origin = {-11.0, 77.0}, 
      points = {{3.0, -3.0}, {-3.0, 3.0}}, 
      thickness = 0.5), Line(origin = {-7.0, 77.0}, 
      points = {{3.0, -3.0}, {-3.0, 3.0}}, 
      thickness = 0.5), Line(origin = {-3.0, 77.0}, 
      points = {{3.0, -3.0}, {-3.0, 3.0}}, 
      thickness = 0.5), Line(origin = {1.0, 77.0}, 
      points = {{3.0, -3.0}, {-3.0, 3.0}}, 
      thickness = 0.5), Line(origin = {5.0, 77.0}, 
      points = {{3.0, -3.0}, {-3.0, 3.0}}, 
      thickness = 0.5), Line(origin = {9.0, 77.0}, 
      points = {{3.0, -3.0}, {-3.0, 3.0}}, 
      thickness = 0.5), Line(origin = {13.0, 77.0}, 
      points = {{3.0, -3.0}, {-3.0, 3.0}}, 
      thickness = 0.5), Line(origin = {17.0, 77.0}, 
      points = {{3.0, -3.0}, {-3.0, 3.0}}, 
      thickness = 0.5), Line(origin = {21.0, 77.0}, 
      points = {{3.0, -3.0}, {-3.0, 3.0}}, 
      thickness = 0.5), Line(origin = {25.0, 77.0}, 
      points = {{3.0, -3.0}, {-3.0, 3.0}}, 
      thickness = 0.5), Line(origin = {29.0, 77.0}, 
      points = {{3.0, -3.0}, {-3.0, 3.0}}, 
      thickness = 0.5), Line(origin = {33.0, 77.0}, 
      points = {{3.0, -3.0}, {-3.0, 3.0}}, 
      thickness = 0.5), Rectangle(origin = {10.0, -99.0}, 
      fillColor = {255, 255, 255}, 
      lineThickness = 0.5, 
      extent = {{-20.0, 169.0}, {0.0, 143.0}}), Rectangle(origin = {7.799999999999997, -84.0}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-85.8, 126.0}, {70.2, 122.0}}), Rectangle(origin = {-40.0, -45.8}, 
      fillColor = {134, 134, 134}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-40.0, 79.8}, {20.0, 65.8}}), Rectangle(origin = {-105.0, -55.25}, 
      fillColor = {134, 134, 134}, 
      fillPattern = FillPattern.Solid, 
      extent = {{125.0, 89.25}, {185.0, 75.25}}), Line(origin = {0.0, 0.0}, 
      points = {{-80.0, 0.0}, {80.0, 0.0}}, 
      pattern = LinePattern.Dash, 
      thickness = 0.5), Line(origin = {-72.0, 0.0}, 
      points = {{-4.0, 6.0}, {4.0, 0.0}, {-4.0, -6.0}}, 
      thickness = 0.75), Line(origin = {30.0, -50.0}, 
      points = {{-4.0, 0.0}, {4.0, 0.0}}, 
      thickness = 1.0), Line(origin = {30.0, -50.0}, 
      points = {{0.0, 4.0}, {0.0, -4.0}}, 
      thickness = 1.0), Line(origin = {0.0, -50.0}, 
      points = {{0.0, 4.0}, {0.0, -4.0}}, 
      thickness = 1.0, 
      arrow = {Arrow.Filled, Arrow.None}, 
      arrowSize = 5.0), Line(origin = {-30.0, -50.0}, 
      points = {{0.0, 4.0}, {0.0, -4.0}}, 
      thickness = 0.5), Line(origin = {-25.0, -55.0}, 
      rotation = -90.0, 
      points = {{-1.0, -5.0}, {1.0, -9.0}}, 
      thickness = 0.5, 
      smooth = Smooth.Bezier), Line(origin = {-15.0, -55.0}, 
      rotation = -90.0, 
      points = {{1.0, -19.0}, {-1.0, -23.0}}, 
      thickness = 0.5, 
      smooth = Smooth.Bezier), Line(origin = {-38.0, -45.0}, 
      rotation = -90.0, 
      points = {{9.0, 0.0}, {7.0, 0.0}}, 
      thickness = 0.5, 
      smooth = Smooth.Bezier), Line(origin = {0.0, -79.0}, 
      points = {{0.0, -7.0}, {0.0, 7.0}}, 
      thickness = 1.0)}));
equation 
  // stick = if abs(omeg1) <= dvel then 1 else 0;
  //stick = if T_ext <= Ts then 1 else 0;
  if abs(T_ext) > abs(Ts) then 
    stick = 0;
  else
    if abs(omeg1) > dvel * pi / 60 then 
      stick = 0;
    else
      stick = 1;
    end if;
  end if;
  T_ext = flange_a.tau;
  Tc = noEvent(if cmde >= 0 and cmde <= 1 then Tslip * cmde else musl * cmde);
  Ts = noEvent(if cmde >= 0 and cmde <= 1 then Tstick * cmde else must * cmde);

  der(omeg1) * Ish1 = Ttrans - T_ext;
  // if strib then 
  //   if abs(omeg1) <= dvel then 
  //     Ttrans = min(abs(T_ext), Ts) * sign(T_ext);
  //   else
  //     Ttrans = (Tc + (Ts - Tc) * exp(-3 * abs(omeg1) / astrib)) * sign(omeg1);
  //   end if;
  // else
  //   if abs(omeg1) <= dvel then 
  //     Ttrans = min(abs(T_ext), Ts) * sign(T_ext);
  //   else
  //     Ttrans = Tc * sign(omeg1);
  //   end if;
  // end if;
  if strib then 
    if stick == 1 then 
      Ttrans = min(abs(T_ext), Ts) * sign(T_ext);
    else
      Ttrans = (Tc + (Ts - Tc) * exp(-3 * abs(omeg1) / astrib)) * sign(omeg1);
    end if;
  else
    if stick == 1 then 
      Ttrans = min(abs(T_ext), Ts) * sign(T_ext);
    else
      Ttrans = Tc * sign(omeg1);
    end if;
  end if;
  //
  der(flange_a.phi) = omeg1;
end Karnopp;