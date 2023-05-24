within ServoWing.Controller.Components;
model ab_N "扇区确定模块"
  extends Icons.BasicModel;
  //实例化
  Modelica.Blocks.Interfaces.RealInput U_alpha
    annotation (extent = [-110, 40; -90, 60], 
      Placement(transformation(origin = {-110.0, 20.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
        Placement(iconTransformation(origin = {-110.0, 50.0}, 
          extent = {{-10.0, -10.0}, {10.0, 10.0}})))));
  Modelica.Blocks.Interfaces.RealInput U_beta
    annotation (extent = [-110, -60; -90, -40], 
      Placement(transformation(origin = {-110.0, -20.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
        Placement(iconTransformation(origin = {-110.0, -50.0}, 
          extent = {{-10.0, -10.0}, {10.0, 10.0}})))));
  Modelica.Blocks.Interfaces.IntegerOutput N
    annotation (extent = [90, -10; 110, 10], 
      Placement(transformation(origin = {110.0, 0.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
        Placement(iconTransformation(origin = {110.0, 0.0}, 
          extent = {{-10.0, -10.0}, {10.0, 10.0}})))));
protected 
  Real Ua;
  Real Ub;
  Real Uc;
equation 
  Ua = sqrt(2 / 3) * U_alpha;
  Ub = sqrt(2 / 3) * (-U_alpha / 2 + sqrt(3) * U_beta / 2);
  Uc = sqrt(2 / 3) * (-U_alpha / 2 - sqrt(3) * U_beta / 2);
  N = 4 * (if Ua > 0 then 1 else 0) + 2 * (if Ub > 0 then 1 else 0) + (if Uc > 0 then 1 else 0);
  annotation (Diagram, 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Text(origin = {87.0, -1.0}, 
      fillColor = {225, 225, 225}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-5.0, -10.0}, {5.0, 10.0}}, 
      textString = "N", 
      textStyle = {TextStyle.None}, 
      thickness = 0.5), Text(origin = {-82.0, 21.0}, 
      fillColor = {225, 225, 225}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      textString = "Uα", 
      textStyle = {TextStyle.None}, 
      thickness = 0.5), Text(origin = {-81.0, -25.0}, 
      fillColor = {225, 225, 225}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      textString = "Uβ", 
      textStyle = {TextStyle.None}, 
      thickness = 0.5), Text(origin = {-2.0, -130.0}, 
      extent = {{-60.0, 30.0}, {60.0, -30.0}}, 
      textString = "扇区确定", 
      fontName = "微软雅黑", 
      textStyle = {TextStyle.None})}), 
    Documentation(info = "将两相静止坐标系下的电压U_∝、U_β转换为自然坐标系下的三相电压值Ua、Ub 、Uc ，并判断电压矢量所在扇区。输入U_∝、U_β，输出为扇区号N。"));
end ab_N;