within ServoWing.Mechanics.rope;
model PLMSheave "平面滑轮"
  annotation (Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    preserveAspectRatio = false, 
    grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      preserveAspectRatio = false, 
      grid = {2.0, 2.0}), graphics = {Ellipse(origin = {0.0, 0.0}, 
      lineColor = {0, 170, 0}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.Forward, 
      lineThickness = 1.0, 
      extent = {{-60.0, 60.0}, {60.0, -60.0}}, 
      endAngle = 180.0), Ellipse(origin = {0.0, 0.0}, 
      lineColor = {0, 170, 0}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.Solid, 
      lineThickness = 1.0, 
      extent = {{-50.0, 50.0}, {50.0, -50.0}}), Rectangle(origin = {-55.0, -40.0}, 
      lineColor = {0, 170, 0}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.Forward, 
      lineThickness = 1.0, 
      extent = {{-5.0, 40.0}, {5.0, -40.0}}), Rectangle(origin = {55.0, -40.0}, 
      lineColor = {0, 170, 0}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.Forward, 
      lineThickness = 1.0, 
      extent = {{-5.0, 40.0}, {5.0, -40.0}}), Line(origin = {6.0, 35.0}, 
      rotation = 270.0, 
      points = {{-45.0, 0.0}, {-25.0, 0.0}}, 
      color = {0, 170, 0}, 
      thickness = 1.0), Line(origin = {-6.0, 25.0}, 
      rotation = 270.0, 
      points = {{-55.0, 0.0}, {-35.0, 0.0}}, 
      color = {0, 170, 0}, 
      thickness = 1.0), Ellipse(origin = {0.0, 0.0}, 
      lineColor = {0, 170, 0}, 
      fillColor = {255, 255, 255}, 
      lineThickness = 1.0, 
      extent = {{-20.0, 20.0}, {20.0, -20.0}}), Ellipse(origin = {0.0, 0.0}, 
      lineColor = {0, 170, 0}, 
      fillColor = {255, 255, 255}, 
      lineThickness = 1.0, 
      extent = {{-10.0, 10.0}, {10.0, -10.0}}), Line(origin = {33.0, -18.0}, 
      points = {{-7.0, -10.0}, {-1.0, -8.0}, {7.0, 4.0}, {7.0, 10.0}}, 
      color = {0, 170, 0}, 
      thickness = 1.0, 
      arrow = {Arrow.None, Arrow.Filled}, 
      arrowSize = 5.0, 
      smooth = Smooth.Bezier), Line(origin = {-55.0, -90.0}, 
      points = {{0.0, 10.0}, {0.0, -10.0}}, 
      color = {0, 170, 0}, 
      thickness = 1.0), Line(origin = {55.0, -90.0}, 
      points = {{0.0, 10.0}, {0.0, -10.0}}, 
      color = {0, 170, 0}, 
      thickness = 1.0), Line(origin = {-6.0, 35.0}, 
      rotation = 90.0, 
      points = {{-15.0, 0.0}, {15.0, 0.0}}, 
      color = {0, 170, 0}, 
      pattern = LinePattern.Dash, 
      thickness = 1.0), Line(origin = {6.0, 34.0}, 
      rotation = 90.0, 
      points = {{-15.0, 0.0}, {15.0, 0.0}}, 
      color = {0, 170, 0}, 
      pattern = LinePattern.Dash, 
      thickness = 1.0), Rectangle(origin = {-55.0, 0.0}, 
      lineColor = {0, 170, 0}, 
      fillColor = {255, 255, 255}, 
      pattern = LinePattern.None, 
      fillPattern = FillPattern.Forward, 
      lineThickness = 1.0, 
      extent = {{-4.5, 2.0}, {4.5, -2.0}}), Rectangle(origin = {55.0, 0.0}, 
      lineColor = {0, 170, 0}, 
      fillColor = {255, 255, 255}, 
      pattern = LinePattern.None, 
      fillPattern = FillPattern.Forward, 
      lineThickness = 1.0, 
      extent = {{-4.5, 2.0}, {4.5, -2.0}}), Rectangle(origin = {-59.0, 0.0}, 
      lineColor = {0, 170, 0}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.Solid, 
      lineThickness = 1.0, 
      extent = {{-37.0, 6.0}, {37.0, -6.0}}), Line(origin = {-21.0, 6.0}, 
      points = {{-1.0, 0.0}, {1.0, 0.0}}, 
      color = {0, 170, 0}, 
      thickness = 1.0), Line(origin = {-21.0, -6.0}, 
      points = {{-1.0, 0.0}, {1.0, 0.0}}, 
      color = {0, 170, 0}, 
      thickness = 1.0), Rectangle(origin = {-22.0, 0.0}, 
      fillColor = {255, 255, 255}, 
      pattern = LinePattern.None, 
      fillPattern = FillPattern.Solid, 
      extent = {{-1.0, 5.5}, {1.0, -5.5}})}));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a drive "驱动输入" 
    annotation (Placement(transformation(origin = {0.0, 88.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  ServoWing.Interfaces.Planar.Frame_a pull
    annotation (Placement(transformation(origin = {-100.0, 0.0}, 
      extent = {{-16.0, -16.0}, {16.0, 16.0}})));
  ServoWing.Interfaces.Planar.Frame_b rope1
    annotation (Placement(transformation(origin = {-55.0, -105.5}, 
      extent = {{-16.0, -16.0}, {16.0, 16.0}}, 
      rotation = 90.0)));
  ServoWing.Interfaces.Planar.Frame_b rope2
    annotation (Placement(transformation(origin = {55.0, -105.5}, 
      extent = {{-16.0, -16.0}, {16.0, 16.0}}, 
      rotation = 90.0)));
  Real xsheave "滑轮的绝对位置x坐标初始值";
  Real ysheave "滑轮的绝对位置y坐标初始值";
  Real beta1 "端口rope1处的接触点角度";
  Real beta2 "端口rope2处的接触点角度";
  Real beta "包角";
  Real Ffrict "绳与滑轮间摩擦力";
  Real Vrt "切向绳速度";
  Real Xrt "切向绳位移";
  Real Vrel "相对速度";
  Real Xstuck "静摩擦时的相对位移";
  Real K_stick;
  Real w_drive;
  Real w_pull;
  Real fstick "固体间最大静摩擦力";
  Real fslip "固体间动摩擦力";
  Real frope;
  Real fresistance;
  Real f1;
  Real f2;
  Real unc1;
  Real unc2;
  Real v1;
  Real v2;
  Real v_pull;
  parameter Integer stickdef = 2
    annotation (choices(choice = 1 "1: stick stiffness为一个参数", choice = 2 "2：stick stiffness从位移阈值dx推导出来"));
  parameter Integer slide = 1
    annotation (choices(choice = 1 "1: 考虑绳子滑动", choice = 2 "2:不考虑绳子滑动"));
  parameter Integer strib = 1
    annotation (choices(choice = 1 "1:不考虑stribeck作用;", choice = 2 "考虑stribeck作用"));
  parameter Real R(unit = "m") = 0.25 "滑轮半径";
  parameter Real Rvisc = 0.01 "粘性摩擦系数";
  parameter Real eff = 1 "效率";
  parameter Real mu = 0.1 "摩擦系数";
  parameter Real must = 0.12 "静摩擦系数";
  parameter Real musl = 0.1 "动摩擦系数";
  parameter Real astrib = 0.001 "stribeck常数";
  parameter Real dtrel = 0.001 "dx";
  parameter Real krel = 10000 "Kstick";
  parameter Real ropeI = 1.6 "绳索惯量";
  parameter Real rtors = 100000 "静摩擦时的等效粘性摩擦";
equation 
  //v_pull少一个方程
  v_pull ^ 2 = der(pull.x) ^ 2 + der(pull.y) ^ 2;
  xsheave = pull.x;
  ysheave = pull.y;
  rope1.x = xsheave + R * cos(beta1);
  rope1.y = ysheave + R * sin(beta1);
  rope2.x = xsheave + R * cos(beta2);
  rope2.y = ysheave + R * sin(beta2);
  der(unc1) = v1;
  der(unc2) = v2;
  v1 = v_pull + R * w_drive;
  v2 = v_pull - R * w_drive;
  beta1 - rope1.phi = pi / 2;
  beta2 = rope2.phi - pi / 2;
  f1 = -rope1.fx * sin(beta1) + rope1.fy * cos(beta1);
  f2 = rope2.fx * sin(beta2) - rope2.fy * cos(beta2);
  der(drive.phi) = w_drive;
  der(pull.phi) = w_pull;
  beta1 = beta + beta2;
  if stickdef == 1 then 
    K_stick = krel;
  elseif stickdef == 2 then 
    K_stick = fstick / dtrel;
  end if;
  if Xstuck <= dtrel then 
    Ffrict = K_stick * Xstuck + rtors * Vrel;
  else
    if strib == 1 then 
      Ffrict = fslip * sign(Vrel);
    elseif strib == 2 then 
      Ffrict = fslip + (fstick - fslip) * exp(-3 * abs(Vrel) / astrib);
    end if;
  end if;
  Vrel = Vrt - R * w_drive;
  fstick = must * frope;
  fslip = musl * frope;
  frope = fresistance * exp(mu * abs(beta));
  fresistance = min(abs(f1), abs(f2));
  der(Vrt) = (f1 + f2 + Ffrict) / ropeI;
  der(Xrt) = Vrt;
  if slide == 1 then 
    unc1 = Xrt;
    unc2 = -Xrt;
  elseif slide == 2 then 
    unc1 = R * drive.phi;
    unc2 = -R * drive.phi;
  end if;
  pull.fx = rope1.fx + rope2.fx;
  pull.fy = rope1.fy + rope2.fy;
  if slide == 1 then 
    drive.tau = -R * Ffrict;
  elseif slide == 2 then 
    drive.tau = -R * (f1 - f2) - pull.t;
  end if;
  pull.t = Rvisc * (w_drive - w_pull);
  if sign(drive.tau) * sign(w_drive) <= 0 then 
    drive.tau = drive.tau * eff;
  else
    drive.tau = drive.tau / eff;
  end if;
end PLMSheave;