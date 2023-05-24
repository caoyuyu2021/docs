within ServoWing.Structure;
model FoldingWingsFlex "折叠翼"
  Interfaces.MultiBodyInterfaces.Frame_a frame_a
    annotation (Placement(transformation(origin = {-100.0, 0.0}, 
      extent = {{-16.0, -16.0}, {16.0, 16.0}})));
  annotation (Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    grid = {2.0, 2.0}), graphics = {Text(origin = {0.0, -120.0}, 
    extent = {{-45.0, 15.0}, {45.0, -15.0}}, 
    textString = "折叠翼", 
    textStyle = {TextStyle.None}), Bitmap(origin = {0.0, 0.0}, 
    extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
    fileName = "modelica://ServoWing/Pictures/折叠翼柔性体.svg")}), 
    Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      grid = {2.0, 2.0}), graphics = {Text(origin = {-20.0, -57.99999999999999}, 
      extent = {{-10.0, 4.0}, {10.0, -4.0}}, 
      textString = "1025", 
      textStyle = {TextStyle.None}), Rectangle(origin = {0.0, -58.0}, 
      fillColor = {255, 255, 255}, 
      extent = {{-27.0, 34.0}, {27.0, -34.0}}), Text(origin = {0.0, -103.0}, 
      lineColor = {0, 0, 0}, 
      extent = {{-15.0, 5.0}, {15.0, -5.0}}, 
      textString = "节点位置", 
      textStyle = {TextStyle.None}, 
      textColor = {0, 0, 0}, 
      horizontalAlignment = LinePattern.None), Text(origin = {-65.99999999999999, -89.00000000000001}, 
      lineColor = {0, 0, 0}, 
      extent = {{-3.000000000000014, 2.999999999999986}, {3.0, -2.999999999999986}}, 
      textString = "Y", 
      textStyle = {TextStyle.None}, 
      textColor = {0, 0, 0}, 
      horizontalAlignment = LinePattern.None), Line(origin = {-49.0, -104.0}, 
      points = {{-11.0, 0.0}, {11.0, 0.0}}, 
      arrow = {Arrow.None, Arrow.Filled}), Line(origin = {-60.0, -95.0}, 
      points = {{0.0, -9.0}, {0.0, 9.0}}, 
      arrow = {Arrow.None, Arrow.Filled}), Text(origin = {-33.0, -102.0}, 
      lineColor = {0, 0, 0}, 
      extent = {{-3.0, 4.0}, {3.0, -4.0}}, 
      textString = "x", 
      textStyle = {TextStyle.None}, 
      textColor = {0, 0, 0}, 
      horizontalAlignment = LinePattern.None), Text(origin = {8.881784197001252e-16, -30.0}, 
      extent = {{-10.0, 4.0}, {10.0, -4.0}}, 
      textString = "163", 
      textStyle = {TextStyle.None}), Text(origin = {8.881784197001252e-16, -54.0}, 
      extent = {{-10.0, 4.0}, {10.0, -4.0}}, 
      textString = "919", 
      textStyle = {TextStyle.None})}));
  FlexBody.Components.ModalBody_TR modalBody_TR(clampedNodes = {1025, 1026, 163, 919}, cmNodes = {919}, cm_Nodes_factor = {1}, 
    N_MODAL_MNF = 12, 
    str_mnf_name = "300")
    annotation (Placement(transformation(extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedFrame_1026(length = 0.2)
    annotation (Placement(transformation(origin = {74.0, -27.99999999999997}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedFrame_163(length = 0.2)
    annotation (Placement(transformation(origin = {74.0, -63.99999999999996}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedFrame_919(length = 0.2)
    annotation (Placement(transformation(origin = {74.0, -92.00000000000003}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Forces.WorldForce force(resolveInFrame = Modelica.Mechanics.MultiBody.Types.ResolveInFrameB.frame_b)
    annotation (Placement(transformation(origin = {14.0, 38.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Mechanics.MultiBody.Forces.WorldForce force1(resolveInFrame = Modelica.Mechanics.MultiBody.Types.ResolveInFrameB.frame_b)
    annotation (Placement(transformation(origin = {14.0, 61.99999999999999}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Interfaces.RealInput aerodynamicforce[3] "气动力，x=0，y:正向阻力 z:升力" 
    annotation (Placement(transformation(origin = {-1.4210854715202004e-14, 109.49999999999997}, 
      extent = {{-9.500000000000028, -9.5}, {9.499999999999972, 9.5}}, 
      rotation = 270.0)));
  Modelica.Blocks.Math.Gain gain(k = -1)
    annotation (Placement(transformation(origin = {-52.00000000000001, 61.99999999999999}, 
      extent = {{-4.0, -4.0}, {3.999999999999993, 3.999999999999993}})));
  Modelica.Blocks.Sources.RealExpression realExpression
    annotation (Placement(transformation(origin = {-22.0, 76.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Modelica.Blocks.Sources.RealExpression realExpression1
    annotation (Placement(transformation(origin = {-22.000000000000007, 50.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
equation 
  connect(frame_a, modalBody_TR.frame_ref)
    annotation (Line(origin = {-55.0, 0.0}, 
      points = {{-45.0, 0.0}, {45.0, 0.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(modalBody_TR.nodes_clamped[2], fixedFrame_1026.frame_a)
    annotation (Line(origin = {38.0, -14.0}, 
      points = {{-28.0, 14.0}, {-6.0, 14.0}, {-6.0, -14.0}, {26.0, -14.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(modalBody_TR.nodes_clamped[3], fixedFrame_163.frame_a)
    annotation (Line(origin = {38.0, -32.0}, 
      points = {{-28.0, 32.0}, {-6.0, 32.0}, {-6.0, -32.0}, {26.0, -32.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(modalBody_TR.nodes_clamped[4], fixedFrame_919.frame_a)
    annotation (Line(origin = {38.0, -46.0}, 
      points = {{-28.0, 46.0}, {-6.0, 46.0}, {-6.0, -46.0}, {26.0, -46.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(aerodynamicforce[2], gain.u)
    annotation (Line(origin = {-33.0, 86.0}, 
      points = {{33.0, 24.0}, {33.0, 2.0}, {-33.0, 2.0}, {-33.0, -24.0}, {-24.0, -24.0}}, 
      color = {0, 0, 127}));
  connect(gain.y, force1.force[2])
    annotation (Line(origin = {-14.0, 62.0}, 
      points = {{-34.0, 0.0}, {16.0, 0.0}}, 
      color = {0, 0, 127}));
  connect(aerodynamicforce[3], force.force[3])
    annotation (Line(origin = {-36.0, 74.0}, 
      points = {{36.0, 36.0}, {36.0, 14.0}, {-30.0, 14.0}, {-30.0, -36.0}, {38.0, -36.0}}, 
      color = {0, 0, 127}));
  connect(realExpression.y, force1.force[1])
    annotation (Line(origin = {-4.0, 69.0}, 
      points = {{-7.0, 7.0}, {-4.0, 7.0}, {-4.0, -7.0}, {6.0, -7.0}}, 
      color = {0, 0, 127}));
  connect(realExpression.y, force1.force[3])
    annotation (Line(origin = {-4.0, 69.0}, 
      points = {{-7.0, 7.0}, {-4.0, 7.0}, {-4.0, -7.0}, {6.0, -7.0}}, 
      color = {0, 0, 127}));
  connect(realExpression1.y, force.force[1])
    annotation (Line(origin = {-4.0, 44.0}, 
      points = {{-7.0, 6.0}, {-4.0, 6.0}, {-4.0, -6.0}, {6.0, -6.0}}, 
      color = {0, 0, 127}));
  connect(realExpression1.y, force.force[2])
    annotation (Line(origin = {-4.0, 44.0}, 
      points = {{-7.0, 6.0}, {-4.0, 6.0}, {-4.0, -6.0}, {6.0, -6.0}}, 
      color = {0, 0, 127}));
  connect(force.frame_b, modalBody_TR.nodes_clamped[4])
    annotation (Line(origin = {26.0, 19.0}, 
      points = {{-2.0, 19.0}, {14.0, 19.0}, {14.0, -19.0}, {-16.0, -19.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
  connect(force1.frame_b, modalBody_TR.nodes_clamped[3])
    annotation (Line(origin = {28.0, 31.0}, 
      points = {{-4.0, 31.0}, {16.0, 31.0}, {16.0, -31.0}, {-18.0, -31.0}}, 
      color = {95, 95, 95}, 
      thickness = 0.5));
end FoldingWingsFlex;