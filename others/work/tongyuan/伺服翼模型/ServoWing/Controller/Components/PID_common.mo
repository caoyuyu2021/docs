within ServoWing.Controller.Components;
model PID_common "普通PID控制器，标准库"
  import Modelica.Blocks.Types.InitPID;
  import Modelica.Blocks.Types.Init;
  extends Modelica.Blocks.Interfaces.SISO;

  parameter Real k(unit = "1") = 1 "比例系数";
  parameter SI.Time Ti(min = Modelica.Constants.small, start = 0.5)
    "积分常数";
  parameter SI.Time Td(min = 0, start = 0.1)
    "微分常数";
  parameter Real Nd(min = Modelica.Constants.small) = 10
    "微分系数";
  parameter Modelica.Blocks.Types.InitPID initType = Modelica.Blocks.Types.InitPID.DoNotUse_InitialIntegratorState
    "Type of initialization (1: no init, 2: steady state, 3: initial state, 4: initial output)" 
    annotation (Evaluate = true, 
      Dialog(group = "Initialization"));
  parameter Real xi_start = 0
    "Initial or guess value value for integrator output (= integrator state)" 
    annotation (Dialog(group = "Initialization"));
  parameter Real xd_start = 0
    "Initial or guess value for state of derivative block" 
    annotation (Dialog(group = "Initialization"));
  parameter Real y_start = 0 "Initial value of output" 
    annotation (Dialog(enable = initType == InitPID.InitialOutput, group = 
      "Initialization"));
  constant SI.Time unitTime = 1 annotation (HideResult = true);

  Modelica.Blocks.Math.Gain P(k = 1) "Proportional part of PID controller" 
    annotation (Placement(transformation(extent = {{-60, 60}, {-20, 100}}, 
      rotation = 0)));
  Modelica.Blocks.Continuous.Integrator I(k = unitTime / Ti, y_start = xi_start, 
    initType = if initType == InitPID.SteadyState then 
    Init.SteadyState else 
    if initType == InitPID.InitialState or 
    initType == InitPID.DoNotUse_InitialIntegratorState then 
    Init.InitialState else Init.NoInit)
    "Integral part of PID controller" 
    annotation (Placement(transformation(extent = {{-60, -20}, {-20, 20}}, 
      rotation = 0)));
  Modelica.Blocks.Continuous.Derivative D(k = Td / unitTime, T = max([Td / Nd, 100 * Modelica.Constants.eps]), 
    x_start = xd_start, 
    initType = if initType == InitPID.SteadyState or 
    initType == InitPID.InitialOutput then Init.SteadyState else 
    if initType == InitPID.InitialState then Init.InitialState else 
    Init.NoInit) "Derivative part of PID controller" 
    annotation (Placement(transformation(extent = {{-60, -100}, {-20, -60}}, 
      rotation = 0)));
  Modelica.Blocks.Math.Gain Gain(k = k) "Gain of PID controller" 
    annotation (Placement(transformation(extent = {{60, -10}, {80, 10}}, rotation = 
      0)));
  Modelica.Blocks.Math.Add3 Add annotation (Placement(transformation(extent = {{20, -10}, 
    {40, 10}}, rotation = 0)));
initial equation 
  if initType == InitPID.InitialOutput then 
    y = y_start;
  end if;
equation 
  connect(u, P.u) annotation (Line(points = {{-120, 0}, {-80, 0}, {-80, 80}, {-64, 80}}, 
    color = {0, 0, 127}));
  connect(u, I.u)
    annotation (Line(points = {{-120, 0}, {-64, 0}}, color = {0, 0, 127}));
  connect(u, D.u) annotation (Line(points = {{-120, 0}, {-80, 0}, {-80, -80}, {-64, 
    -80}}, color = {0, 0, 127}));
  connect(P.y, Add.u1) annotation (Line(points = {{-18, 80}, {0, 80}, {0, 8}, {18, 8}}, 
    color = {0, 0, 127}));
  connect(I.y, Add.u2)
    annotation (Line(points = {{-18, 0}, {18, 0}}, color = {0, 0, 127}));
  connect(D.y, Add.u3) annotation (Line(points = {{-18, -80}, {0, -80}, {0, -8}, {18, 
    -8}}, color = {0, 0, 127}));
  connect(Add.y, Gain.u)
    annotation (Line(points = {{41, 0}, {58, 0}}, color = {0, 0, 127}));
  connect(Gain.y, y)
    annotation (Line(points = {{81, 0}, {110, 0}}, color = {0, 0, 127}));
  annotation (defaultComponentName = "PID", 
    Icon(
      coordinateSystem(preserveAspectRatio = true, 
        extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
        initialScale = 0.1), 
      graphics = {
      Line(visible = true, 
      points = {{-80.0, 78.0}, {-80.0, -90.0}}, 
      color = {192, 192, 192}), 
      Polygon(visible = true, 
      lineColor = {192, 192, 192}, 
      fillColor = {192, 192, 192}, 
      fillPattern = FillPattern.Solid, 
      points = {{-80.0, 90.0}, {-88.0, 68.0}, {-72.0, 68.0}, {-80.0, 90.0}}), 
      Line(visible = true, 
      points = {{-90.0, -80.0}, {82.0, -80.0}}, 
      color = {192, 192, 192}), 
      Polygon(visible = true, 
      lineColor = {192, 192, 192}, 
      fillColor = {192, 192, 192}, 
      fillPattern = FillPattern.Solid, 
      points = {{90.0, -80.0}, {68.0, -72.0}, {68.0, -88.0}, {90.0, -80.0}}), 
      Line(visible = true, points = {{-80, -80}, {-80, -20}, {60, 80}}, color = {0, 0, 127}), 
      Text(visible = true, 
      lineColor = {192, 192, 192}, 
      extent = {{-20.0, -60.0}, {80.0, -20.0}}, 
      textString = "PID"), 
      Text(visible = true, 
      extent = {{-150.0, -150.0}, {150.0, -110.0}}, 
      textString = "Ti=%Ti")}), 
    Documentation(info = "<HTML>
<p>
This is the text-book version of a PID-controller.
For a more practically useful PID-controller, use
block LimPID.
</p>

<p>
The PID block can be initialized in different
ways controlled by parameter <b>initType</b>. The possible
values of initType are defined in
<a href=\"modelica://Modelica.Blocks.Types.InitPID\">Modelica.Blocks.Types.InitPID</a>.
This type is identical to
<a href=\"modelica://Modelica.Blocks.Types.Init\">Types.Init</a>,
with the only exception that the additional option
<b>DoNotUse_InitialIntegratorState</b> is added for
backward compatibility reasons (= integrator is initialized with
InitialState whereas differential part is initialized with
NoInit which was the initialization in version 2.2 of the Modelica
standard library).
</p>

<p>
Based on the setting of initType, the integrator (I) and derivative (D)
blocks inside the PID controller are initialized according to the following table:
</p>

<table border=1 cellspacing=0 cellpadding=2>
  <tr><td valign=\"top\"><b>initType</b></td>
      <td valign=\"top\"><b>I.initType</b></td>
      <td valign=\"top\"><b>D.initType</b></td></tr>

  <tr><td valign=\"top\"><b>NoInit</b></td>
      <td valign=\"top\">NoInit</td>
      <td valign=\"top\">NoInit</td></tr>

  <tr><td valign=\"top\"><b>SteadyState</b></td>
      <td valign=\"top\">SteadyState</td>
      <td valign=\"top\">SteadyState</td></tr>

  <tr><td valign=\"top\"><b>InitialState</b></td>
      <td valign=\"top\">InitialState</td>
      <td valign=\"top\">InitialState</td></tr>

  <tr><td valign=\"top\"><b>InitialOutput</b><br>
          and initial equation: y = y_start</td>
      <td valign=\"top\">NoInit</td>
      <td valign=\"top\">SteadyState</td></tr>

  <tr><td valign=\"top\"><b>DoNotUse_InitialIntegratorState</b></td>
      <td valign=\"top\">InitialState</td>
      <td valign=\"top\">NoInit</td></tr>
</table>

<p>
In many cases, the most useful initial condition is
<b>SteadyState</b> because initial transients are then no longer
present. If initType = InitPID.SteadyState, then in some
cases difficulties might occur. The reason is the
equation of the integrator:
</p>

<pre>
   <b>der</b>(y) = k*u;
</pre>

<p>
The steady state equation \"der(x)=0\" leads to the condition that the input u to the
integrator is zero. If the input u is already (directly or indirectly) defined
by another initial condition, then the initialization problem is <b>singular</b>
(has none or infinitely many solutions). This situation occurs often
for mechanical systems, where, e.g., u = desiredSpeed - measuredSpeed and
since speed is both a state and a derivative, it is natural to
initialize it with zero. As sketched this is, however, not possible.
The solution is to not initialize u or the variable that is used
to compute u by an algebraic equation.
</p>

</html>"));
end PID_common;