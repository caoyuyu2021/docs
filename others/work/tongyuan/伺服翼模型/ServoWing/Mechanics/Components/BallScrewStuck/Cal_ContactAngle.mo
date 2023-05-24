within ServoWing.Mechanics.Components.BallScrewStuck;
model Cal_ContactAngle "接触角计算"
  parameter Real ga = 0.0022815 "轴向弹性变形量";
  parameter Real gr = 0.0022801 "径向弹性变形量";
  parameter Real Co = 0.001869 "滚珠与螺母滚道的弹性变形量";
  parameter Real Ci = 0.001929 "滚珠与丝杠的弹性变形量 ";

  parameter SI.Angle B = 42 / 180 * pi "滚珠初始自旋角 ";
  parameter Real p = 6 "导程";
  parameter Real d0 = 16 "公称直径";
  parameter Real rb = 3.5 / 2 "滚珠半径";
  parameter Real t = 1.07 "曲率比值";
  parameter SI.Angle a1 = 0.25 * pi "初始接触角 ";
  parameter SI.Angle B1 = 0.0017 "滚珠受载后 b 轴角位移";
  //
  Real rm = 0.5 * d0;
  Real dm = 2 * rm;
  Real ro = t * db / 2;
  Real ri;
  Real fi = ri / db;   // 丝杠滚道曲率半径
  Real fo = ro / db;  // 螺母滚道曲率半径  
  Real db = 2 * rb;// 滚珠直径
  Real Rii;
  Real Lbd;
  Real A1;
  Real A2;
  Real X1(start = 0.001);
  Real X2(start = 0.001);
  // Real aoo;
  // Real aii;
  Modelica.Blocks.Interfaces.RealInput u
    annotation (Placement(transformation(origin = {-110.0, 20.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealInput u1
    annotation (Placement(transformation(origin = {-110.0, -20.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  annotation (Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    grid = {2.0, 2.0}), graphics = {Bitmap(origin = {0.0, 0.0}, 
    extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    fileName = "modelica://ServoWing/Pictures/滚珠丝杠卡滞判断.svg")}));
equation 
  ri = ro;

  Rii = rm + (fi - 0.5) * db * cos(a1);
  Lbd = ro + ri - db;
  //公式3.19 
  A1 = Lbd * sin(a1) + ga + B1 * Rii;
  A2 = Lbd * cos(a1) + gr;
   //公式 3.20 
  0 = (A1 - X1) ^ 2 + (A2 - X2) ^ 2 - ((fi - 0.5) * db + Ci) ^ 2;
  0 = X1 ^ 2 + X2 ^ 2 - ((fo - 0.5) * db + Co) ^ 2;
  //  //公式 3.21 
  // 0 = cos(aoo) - (X2 / ((fo - 0.5) * db + Co));
  // 0 = sin(aii) - (A1 - X1) / ((fi - 0.5) * db + Ci);
end Cal_ContactAngle;