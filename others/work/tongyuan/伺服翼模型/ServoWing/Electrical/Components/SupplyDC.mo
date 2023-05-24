within ServoWing.Electrical.Components;
partial model SupplyDC "直流供电端口"
  parameter Modelica.SIunits.Current IConverterMax = 100 "最大直流供电电流";
  Modelica.SIunits.Voltage vSupply "供电端电压";
  Modelica.SIunits.Current iSupply "供电端电流";
  Modelica.SIunits.Power powerSupply "供电端功率";
  Interfaces.ElectricalInterfaces.SinglePhase.PositivePin pSupply(final v(start = 0)) "正极接口" 
    annotation (extent = [-110, 50; -90, 70], 
      Placement(transformation(origin = {-100.0, 40.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Interfaces.ElectricalInterfaces.SinglePhase.NegativePin nSupply(final v(start = 0)) "负极接口" 
    annotation (extent = [-110, -70; -90, -50], 
      Placement(transformation(origin = {-100.0, -40.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  //供电电压
  vSupply = pSupply.v - nSupply.v;
  //供电电流
  iSupply = pSupply.i;
  //供电功率
  powerSupply = iSupply * vSupply;
  // assert(iSupply <= IConverterMax, "变换器电流超过了最大允许电流");
  // assert(vSupply >= 0, "供电端电压必须大于0");
  annotation (
    Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Line(origin = {-100.0, 1.0}, 
      points = {{0.0, 45.0}, {0.0, -45.0}}, 
      arrow = {Arrow.None, Arrow.Filled}), Text(origin = {-118.0, 9.0}, 
      extent = {{-16.0, 5.0}, {16.0, -5.0}}, 
      textString = " vSupply")}), 
    Icon(coordinateSystem(preserveAspectRatio = true, 
      extent = {{-100, -100}, {100, 100}})));
end SupplyDC;