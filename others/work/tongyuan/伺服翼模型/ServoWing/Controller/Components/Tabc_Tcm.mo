within ServoWing.Controller.Components;
model Tabc_Tcm "Tcm1/Tcm2/Tcm3计算模块"
  extends Icons.BasicModel;
  //实例化
  Modelica.Blocks.Interfaces.IntegerInput N
    annotation (extent = [-110, -70; -90, 
      -50], 
      Placement(transformation(origin = {-110.0, -60.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
        Placement(iconTransformation(origin = {-110.0, -60.0}, 
          extent = {{-10.0, -10.0}, {10.0, 10.0}})))));
  Modelica.Blocks.Interfaces.RealInput Ta
    annotation (extent = [-110, 50; -90, 70], 
      Placement(transformation(origin = {-110.0, 60.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
        Placement(iconTransformation(origin = {-110.0, 60.0}, 
          extent = {{-10.0, -10.0}, {10.0, 10.0}})))));
  Modelica.Blocks.Interfaces.RealInput Tb
    annotation (extent = [-110, 10; -90, 30], 
      Placement(transformation(origin = {-110.0, 20.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
        Placement(iconTransformation(origin = {-110.0, 20.0}, 
          extent = {{-10.0, -10.0}, {10.0, 10.0}})))));
  Modelica.Blocks.Interfaces.RealInput Tc
    annotation (extent = [-110, -30; -90, -10], 
      Placement(transformation(origin = {-110.0, -20.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
        Placement(iconTransformation(origin = {-110.0, -20.0}, 
          extent = {{-10.0, -10.0}, {10.0, 10.0}})))));
  Modelica.Blocks.Interfaces.RealOutput Tcm1
    annotation (extent = [90, 50; 110, 70], 
      Placement(transformation(origin = {110.0, 40.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
        Placement(iconTransformation(origin = {110.0, 60.0}, 
          extent = {{-10.0, -10.0}, {10.0, 10.0}})))));
  Modelica.Blocks.Interfaces.RealOutput Tcm2
    annotation (extent = [90, -10; 110, 10], 
      Placement(transformation(origin = {110.0, 0.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
        Placement(iconTransformation(origin = {110.0, 0.0}, 
          extent = {{-10.0, -10.0}, {10.0, 10.0}})))));
  Modelica.Blocks.Interfaces.RealOutput Tcm3
    annotation (extent = [90, -70; 110, -50], 
      Placement(transformation(origin = {110.0, -40.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
        Placement(iconTransformation(origin = {110.0, -60.0}, 
          extent = {{-10.0, -10.0}, {10.0, 10.0}})))));
equation 
  if N == 1 then 
    Tcm1 = Tc;
    Tcm2 = Tb;
    Tcm3 = Ta;
  else
    if N == 2 then 
      Tcm1 = Tb;
      Tcm2 = Ta;
      Tcm3 = Tc;
    else
      if N == 3 then 
        Tcm1 = Tc;
        Tcm2 = Ta;
        Tcm3 = Tb;
      else
        if N == 4 then 
          Tcm1 = Ta;
          Tcm2 = Tc;
          Tcm3 = Tb;
        else
          if N == 5 then 
            Tcm1 = Tb;
            Tcm2 = Tc;
            Tcm3 = Ta;
          else
            Tcm1 = Ta;
            Tcm2 = Tb;
            Tcm3 = Tc;
          end if;
        end if;
      end if;
    end if;
  end if;
  annotation (Diagram, 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Text(origin = {-81.0, 59.0}, 
      fillColor = {225, 225, 225}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      textString = "Ta", 
      textStyle = {TextStyle.None}, 
      thickness = 0.5), Text(origin = {-81.0, 19.0}, 
      fillColor = {225, 225, 225}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      textString = "Tb", 
      textStyle = {TextStyle.None}, 
      thickness = 0.5), Text(origin = {-81.0, -23.0}, 
      fillColor = {225, 225, 225}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
      textString = "Tc", 
      textStyle = {TextStyle.None}, 
      thickness = 0.5), Text(origin = {-81.0, -59.0}, 
      fillColor = {225, 225, 225}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-5.0, -10.0}, {5.0, 10.0}}, 
      textString = "N", 
      textStyle = {TextStyle.None}, 
      thickness = 0.5), Text(origin = {68.0, 39.0}, 
      extent = {{-20.0, 10.0}, {20.0, -10.0}}, 
      textString = "Tcm1", 
      textStyle = {TextStyle.None}), Text(origin = {68.0, -1.0}, 
      extent = {{-20.0, 10.0}, {20.0, -10.0}}, 
      textString = "Tcm2", 
      textStyle = {TextStyle.None}), Text(origin = {68.0, -41.0}, 
      extent = {{-20.0, 10.0}, {20.0, -10.0}}, 
      textString = "Tcm3", 
      textStyle = {TextStyle.None}), Text(origin = {-2.0, -130.0}, 
      extent = {{-75.0, 30.0}, {75.0, -30.0}}, 
      textString = "Tcm123计算", 
      fontName = "微软雅黑", 
      textStyle = {TextStyle.None})}), 
    Documentation(info = "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\"><HTML><HEAD>








<META content=\"text/html; charset=gb2312\" http-equiv=Content-Type>








<META name=GENERATOR content=\"MSHTML 9.00.8112.16540\"></HEAD>








<BODY>根据所处扇区计算空间矢量切换点Tcm1、Tcm2、Tcm3 输入上一模块计算出的矢量切换点Ta、Tb 、Tc 








以及当前扇区号N，输出为空间矢量切换点Tcm1、Tcm2、Tcm3 。 </BODY></HTML>"));
end Tabc_Tcm;