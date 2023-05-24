within ServoWing.Electrical.Components;
partial model LoadThreePhase "三相负载接口"
  Modelica.SIunits.Current iLoad[3] "负载接口电流";
  Modelica.SIunits.Voltage vLoad[3] "负载接口电压";
  Modelica.SIunits.Power powerLoad "负载端功率";
  Interfaces.ElectricalInterfaces.MultiPhase.PositivePlug pLoad "负载接口" 
    annotation (extent = [-10, -110; 10, -90]);
  annotation (Icon(coordinateSystem(preserveAspectRatio = true, 
    extent = {{-100, -100}, {100, 100}})), 
    Diagram(coordinateSystem(preserveAspectRatio = true, 
      extent = {{-100, -100}, {100, 100}})));
equation 
  //负载电压
  iLoad = pLoad.pin.i;

  //负载电流
  vLoad = pLoad.pin.v;

  //负载功率
  powerLoad = vLoad * iLoad;
end LoadThreePhase;