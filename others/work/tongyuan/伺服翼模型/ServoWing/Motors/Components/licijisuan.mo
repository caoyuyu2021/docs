within ServoWing.Motors.Components;
model licijisuan "空载反电势和由磁铁产生的磁链的关系"
  parameter Real V0 = 113 "空载反电动势频率";
  parameter Real fsNominal = 633 "空载反电动势幅值";
  parameter SI.Inductance lmd = 0.16e-3 "d轴电感";
  //
  output Real flux "由磁铁产生的磁链";
  output SI.Current Ie "励磁电流";
equation 
  Ie = sqrt(2) * V0 / (lmd * 2 * pi * fsNominal);
  flux = lmd * Ie;

  annotation (Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Rectangle(origin = {3.0, -1.0}, 
      fillColor = {255, 255, 255}, 
      extent = {{-87.0, 85.0}, {87.0, -85.0}}, 
      radius = 20.0), Text(origin = {2.0, 0.0}, 
      extent = {{-86.0, 84.0}, {86.0, -84.0}}, 
      textString = "磁铁
磁链计算", 
      textStyle = {TextStyle.None})}));
end licijisuan;