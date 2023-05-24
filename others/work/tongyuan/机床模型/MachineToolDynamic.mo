within ;
package MachineToolDynamic
  annotation (Diagram(coordinateSystem(extent = {{-140.0, -100.0}, {140.0, 100.0}}, 
    preserveAspectRatio = false, 
    grid = {2.0, 2.0})), 
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      preserveAspectRatio = false, 
      grid = {2.0, 2.0})));
  package Sources
    annotation (Diagram(coordinateSystem(extent = {{-140.0, -100.0}, {140.0, 100.0}}, 
      preserveAspectRatio = false, 
      grid = {2.0, 2.0})), 
      Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
        preserveAspectRatio = false, 
        grid = {2.0, 2.0})));
    model SSTT0114
      extends ControlBlocks.Drivers.Icons.NumericalDevice;
      import Modelica.Constants.pi;
      parameter String f1 = Modelica.Utilities.Files.loadResource("Modelica://MachineToolDynamic/Data/SSTT0114.txt");
      parameter String n1 = "n1";
      annotation (Diagram(coordinateSystem(extent = {{-150.0, -100.0}, {150.0, 100.0}}, 
        preserveAspectRatio = false, 
        grid = {2.0, 2.0})), 
        Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
          preserveAspectRatio = false, 
          grid = {2.0, 2.0}), graphics = {Rectangle(origin = {0.0, 0.0}, 
          fillColor = {255, 255, 255}, 
          extent = {{-100.0, 100.0}, {100.0, -100.0}})}), 
        experiment(StartTime = 0, StopTime = 30, Interval = 0.0001, Algorithm = "Dassl", Tolerance = 1e-005, DoublePrecision = false, StoreEventValue = true));



      Modelica.Blocks.Tables.CombiTable1Ds combitimetable1(
        tableOnFile = true, 
        table = {{1, 1, 1, 1, 1, 1, 1, 1, 1}, {1, 1, 1, 1, 1, 1, 1, 1, 1}}, 
        tableName = n1, 
        fileName = f1) annotation (
          Placement(transformation(origin = {-80.0, 0.0}, 
            extent = {{-16.2, -16.18}, {16.2, 16.18}})));

      Modelica.Blocks.Math.Gain PositionCmd(k = 1) annotation (Placement(transformation(origin = {26.0, 78.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));

      Modelica.Blocks.Math.Gain PositionReal(k = 1) annotation (Placement(transformation(origin = {26.0, 48.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));

      Modelica.Blocks.Math.Gain VelocityCmd(k = 16 / 3200000) annotation (Placement(transformation(origin = {26.0, 16.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));

      Modelica.Blocks.Math.Gain commandposition(k = 0.001) annotation (Placement(transformation(origin = {26.0, -16.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));



      Modelica.Blocks.Interfaces.RealOutput y1 "Output signal connector" annotation (Placement(transformation(origin = {110.0, 88.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));

      Modelica.Blocks.Interfaces.RealOutput y2 "Output signal connector" annotation (Placement(transformation(origin = {110.0, 62.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));

      Modelica.Blocks.Interfaces.RealOutput y3 "Output signal connector" annotation (Placement(transformation(origin = {110.0, 32.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));

      Modelica.Blocks.Interfaces.RealOutput y4 "Output signal connector" annotation (Placement(transformation(origin = {110.0, 4.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
      Modelica.Blocks.Sources.Clock clock
        annotation (Placement(transformation(origin = {-130.0, 0.0}, 
          extent = {{-10.0, -10.0}, {10.0, 10.0}})));
      Modelica.Blocks.Math.Gain Velocitycommand(
        k = 0.001 / 60) annotation (Placement(transformation(origin = {26.0, -48.0}, 
          extent = {{-10.0, -10.0}, {10.0, 10.0}})));
      Modelica.Blocks.Math.Gain VelocityReal2(k = 1) annotation (Placement(transformation(origin = {26.0, -78.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));
      Modelica.Blocks.Math.Gain error(
        k = 1) annotation (Placement(transformation(origin = {26.0, -108.0}, 
          extent = {{-10.0, -10.0}, {10.0, 10.0}})));
      Modelica.Blocks.Math.Gain VelocityReal4(k = 1) annotation (Placement(transformation(origin = {26.0, -138.0}, 
        extent = {{-10.0, -10.0}, {10.0, 10.0}})));


      Modelica.Blocks.Interfaces.RealOutput y "Output signal connector" 
        annotation (Placement(transformation(origin = {110.0, -26.0}, 
          extent = {{-10.0, -10.0}, {10.0, 10.0}})));
      Modelica.Blocks.Interfaces.RealOutput y5 "Output signal connector" 
        annotation (Placement(transformation(origin = {110.0, -54.0}, 
          extent = {{-10.0, -10.0}, {10.0, 10.0}})));
      Modelica.Blocks.Interfaces.RealOutput y6 "Output signal connector" 
        annotation (Placement(transformation(origin = {110.0, -84.0}, 
          extent = {{-10.0, -10.0}, {10.0, 10.0}})));
      Modelica.Blocks.Interfaces.RealOutput y7 "Output signal connector" 
        annotation (Placement(transformation(origin = {110.0, -110.0}, 
          extent = {{-10.0, -10.0}, {10.0, 10.0}})));
    equation 
      connect(combitimetable1.y[1], PositionCmd.u)
        annotation (Line(origin = {-25.0, 39.0}, 
          points = {{-37.0, -39.0}, {-25.0, -39.0}, {-25.0, 39.0}, {39.0, 39.0}}, 
          color = {0, 0, 127}));
      connect(PositionReal.u, combitimetable1.y[2])
        annotation (Line(origin = {-24.0, 19.0}, 
          points = {{38.0, 29.0}, {-26.0, 29.0}, {-26.0, -19.0}, {-38.0, -19.0}}, 
          color = {0, 0, 127}));
      connect(VelocityCmd.u, combitimetable1.y[3])
        annotation (Line(origin = {-24.0, 2.0}, 
          points = {{38.0, 14.0}, {-38.0, 14.0}, {-38.0, -2.0}}, 
          color = {0, 0, 127}));
      connect(commandposition.u, combitimetable1.y[4])
        annotation (Line(origin = {-25.0, -19.0}, 
          points = {{39.0, 3.0}, {-35.0, 3.0}, {-35.0, 19.0}, {-37.0, 19.0}}, 
          color = {0, 0, 127}));
      connect(PositionCmd.y, y1)
        annotation (Line(origin = {64.0, 78.0}, 
          points = {{-27.0, 0.0}, {46.0, 0.0}}, 
          color = {0, 0, 127}));
      connect(PositionReal.y, y2)
        annotation (Line(origin = {62.0, 38.0}, 
          points = {{-25.0, 10.0}, {48.0, 10.0}, {48.0, 2.0}}, 
          color = {0, 0, 127}));
      connect(VelocityCmd.y, y3)
        annotation (Line(origin = {57.0, 4.0}, 
          points = {{-20.0, 12.0}, {53.0, 12.0}, {53.0, 2.0}}, 
          color = {0, 0, 127}));
      connect(commandposition.y, y4)
        annotation (Line(origin = {59.0, -38.0}, 
          points = {{-22.0, 22.0}, {51.0, 22.0}, {51.0, 8.0}}, 
          color = {0, 0, 127}));
      connect(clock.y, combitimetable1.u)
        annotation (Line(origin = {-109.0, 0.0}, 
          points = {{-10.0, 0.0}, {10.0, 0.0}}, 
          color = {0, 0, 127}));
      connect(Velocitycommand.u, combitimetable1.y[5])
        annotation (Line(origin = {-24.0, -24.0}, 
          points = {{38.0, -24.0}, {-38.0, -24.0}, {-38.0, 24.0}}, 
          color = {0, 0, 127}));
      connect(VelocityReal2.u, combitimetable1.y[6])
        annotation (Line(origin = {-24.0, -39.0}, 
          points = {{38.0, -39.0}, {-38.0, -39.0}, {-38.0, 39.0}}, 
          color = {0, 0, 127}));
      connect(error.u, combitimetable1.y[7])
        annotation (Line(origin = {-24.0, -54.0}, 
          points = {{38.0, -54.0}, {-38.0, -54.0}, {-38.0, 54.0}}, 
          color = {0, 0, 127}));
      connect(VelocityReal4.u, combitimetable1.y[8])
        annotation (Line(origin = {-24.0, -69.0}, 
          points = {{38.0, -69.0}, {-16.0, -69.0}, {-16.0, 69.0}, {-38.0, 69.0}}, 
          color = {0, 0, 127}));
      connect(Velocitycommand.y, y)
        annotation (Line(origin = {68.0, -48.0}, 
          points = {{-31.0, 0.0}, {42.0, 0.0}, {42.0, -2.0}}, 
          color = {0, 0, 127}));
      connect(VelocityReal2.y, y5)
        annotation (Line(origin = {73.0, -78.0}, 
          points = {{-36.0, 0.0}, {35.0, 0.0}}, 
          color = {0, 0, 127}));
      connect(error.y, y6)
        annotation (Line(origin = {69.0, -108.0}, 
          points = {{-32.0, 0.0}, {32.0, 0.0}}, 
          color = {0, 0, 127}));
      connect(VelocityReal4.y, y7)
        annotation (Line(origin = {68.0, -138.0}, 
          points = {{-31.0, 0.0}, {30.0, 0.0}}, 
          color = {0, 0, 127}));
    end SSTT0114;
  end Sources;
  package Mechanical
    annotation (Diagram(coordinateSystem(extent = {{-140.0, -100.0}, {140.0, 100.0}}, 
      preserveAspectRatio = false, 
      grid = {2.0, 2.0})), 
      Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
        preserveAspectRatio = false, 
        grid = {2.0, 2.0})));
    package Components
      annotation (Diagram(coordinateSystem(extent = {{-140.0, -100.0}, {140.0, 100.0}}, 
        preserveAspectRatio = false, 
        grid = {2.0, 2.0})), 
        Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
          preserveAspectRatio = false, 
          grid = {2.0, 2.0})));
      model MachineBed "机床床身"
        annotation (Diagram(coordinateSystem(extent = {{-140.0, -100.0}, {140.0, 100.0}}, 
          preserveAspectRatio = false, 
          grid = {2.0, 2.0})), 
          Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
            preserveAspectRatio = false, 
            grid = {2.0, 2.0}), graphics = {Rectangle(origin = {0.0, 0.0}, 
            fillColor = {255, 255, 255}, 
            extent = {{-100.0, 100.0}, {100.0, -100.0}})}));
        inner Modelica.Mechanics.MultiBody.World world
          annotation (Placement(transformation(origin = {-10.0, -35.5}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
            rotation = 90.0)));
        Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape(shapeType = "1", 
          length = 0.001, width = 0.001, extra = 1, lengthDirection = {1, 0, 0}, 
          r = {0, 0.109, -0.464}) annotation (Placement(transformation(origin = {-10.0, -4.5}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
            rotation = 90.0)));
        Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b "Coordinate system fixed to the component with one cut-force and cut-torque" 
          annotation (Placement(transformation(origin = {102.0, 0.0}, 
            extent = {{-16.0, -16.0}, {16.0, 16.0}})));
      equation 
        connect(world.frame_b, bodyShape.frame_a)
          annotation (Line(origin = {-10.0, -20.0}, 
            points = {{0.0, -6.0}, {0.0, 5.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(bodyShape.frame_b, frame_b)
          annotation (Line(origin = {35.0, 11.0}, 
            points = {{-45.0, -5.0}, {-45.0, 5.0}, {45.0, 5.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
      end MachineBed;
      model Coupling "联轴器"
        annotation (Diagram(coordinateSystem(extent = {{-140.0, -100.0}, {140.0, 100.0}}, 
          preserveAspectRatio = false, 
          grid = {2.0, 2.0})), 
          Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
            preserveAspectRatio = false, 
            grid = {2.0, 2.0}), graphics = {Rectangle(origin = {0.0, 60.0}, 
            fillColor = {189, 189, 189}, 
            fillPattern = FillPattern.VerticalCylinder, 
            extent = {{-60.0, 40.0}, {60.0, -40.0}}), Rectangle(origin = {0.0, -60.0}, 
            fillColor = {189, 189, 189}, 
            fillPattern = FillPattern.VerticalCylinder, 
            extent = {{-60.0, 40.0}, {60.0, -40.0}}), Rectangle(origin = {0.0, 0.0}, 
            fillColor = {189, 189, 189}, 
            fillPattern = FillPattern.VerticalCylinder, 
            extent = {{-80.0, 20.0}, {80.0, -20.0}})}));
        Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape1(shapeType = "4", 
          length = 0.001, width = 0.001, extra = 1, lengthDirection = {1, 0, 0}, 
          r = {0, 0, 0.036}, 
          m = 0.32, r_CM = {0, 0, 0.03275}, I_33 = 0.00004, I_11 = 0.00015, I_22 = 0.00015) annotation (Placement(transformation(origin = {23.0, 64.5}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
            rotation = 90.0)));
        Modelica.Mechanics.MultiBody.Joints.Revolute revolute(animation = false, useAxisFlange = true)
          annotation (Placement(transformation(origin = {23.0, 16.5}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
            rotation = 90.0)));
        Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedFrame(color_x = {255, 0, 0}, color_y = {85, 170, 0}, color_z = {0, 0, 255})
          annotation (Placement(transformation(origin = {93.0, 51.5}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.Rotational.Components.Inertia inertia(J = 0.00004)
          annotation (Placement(transformation(origin = {-49.0, 17.5}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.Rotational.Components.SpringDamper springDamper(c = 9.0e5, d = 0.1)
          annotation (Placement(transformation(origin = {-13.0, 17.5}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a "Left flange of shaft" 
          annotation (Placement(transformation(origin = {-100.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a "Coordinate system fixed to the joint with one cut-force and cut-torque" 
          annotation (Placement(transformation(origin = {0.0, -100.0}, 
            extent = {{-16.0, -16.0}, {16.0, 16.0}}, 
            rotation = 90.0)));
        Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b "Coordinate system fixed to the component with one cut-force and cut-torque" 
          annotation (Placement(transformation(origin = {0.0, 98.0}, 
            extent = {{-16.0, -16.0}, {16.0, 16.0}}, 
            rotation = 90.0)));
      equation 
        connect(revolute.frame_b, bodyShape1.frame_a)
          annotation (Line(origin = {22.0, 41.0}, 
            points = {{1.0, -15.0}, {-2.0, -15.0}, {-2.0, -12.0}, {1.0, -12.0}, {1.0, 14.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(fixedFrame.frame_a, bodyShape1.frame_a)
          annotation (Line(origin = {53.0, 54.0}, 
            points = {{30.0, -3.0}, {30.0, 1.0}, {-30.0, 1.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(revolute.axis, springDamper.flange_b)
          annotation (Line(origin = {5.0, 18.0}, 
            points = {{8.0, -1.0}, {-8.0, -1.0}, {-8.0, 0.0}}));
        connect(springDamper.flange_a, inertia.flange_b)
          annotation (Line(origin = {-31.0, 18.0}, 
            points = {{8.0, 0.0}, {-8.0, 0.0}}));
        connect(inertia.flange_a, flange_a)
          annotation (Line(origin = {-84.0, 20.0}, 
            points = {{25.0, -2.0}, {-26.0, -2.0}, {-26.0, 2.0}}));
        connect(revolute.frame_a, frame_a)
          annotation (Line(origin = {23.0, -9.0}, 
            points = {{0.0, 16.0}, {0.0, -17.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(bodyShape1.frame_b, frame_b)
          annotation (Line(origin = {23.0, 83.0}, 
            points = {{0.0, -8.0}, {0.0, 7.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
      end Coupling;
      model ScrewShaft "丝杠轴"
        annotation (Diagram(coordinateSystem(extent = {{-140.0, -100.0}, {140.0, 100.0}}, 
          preserveAspectRatio = false, 
          grid = {2.0, 2.0})), 
          Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
            preserveAspectRatio = false, 
            grid = {2.0, 2.0})));
        Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape3(shapeType = "6", 
          length = 0.001, width = 0.001, extra = 1, lengthDirection = {-1, 0, 0}, 
          r = {0, 0.109, 0.464})
          annotation (Placement(transformation(origin = {0.0, 30.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
            rotation = 90.0)));
        Modelica.Mechanics.MultiBody.Parts.Fixed fixed(r = {0.05, 0, 0})
          annotation (Placement(transformation(origin = {0.0, -42.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
            rotation = 90.0)));
        Modelica.Mechanics.MultiBody.Joints.Revolute revolute(animation = false, useAxisFlange = false)
          annotation (Placement(transformation(extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
            rotation = 90.0)));
      equation 
        connect(revolute.frame_b, bodyShape3.frame_a)
          annotation (Line(origin = {0.0, 15.0}, 
            points = {{0.0, -5.0}, {0.0, 5.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(fixed.frame_b, revolute.frame_a)
          annotation (Line(origin = {0.0, -21.0}, 
            points = {{0.0, -11.0}, {0.0, 11.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
      end ScrewShaft;

      model Bearing
        "Model of angular velocity dependent friction losses. Atan function is used to obtain a continous model. Static friction is zero "
        extends Modelica.Electrical.Machines.Interfaces.FlangeSupport;
        extends Modelica.Mechanics.Translational.Interfaces.PartialRigid(L = 0, s(start = 0));
        constant Real eps = 0.1;
        parameter SI.CoefficientOfFriction mu = 0.006 "Friction coefficient";
        parameter SI.Diameter d = 0.062 "Diameter of Bearing";
        SI.Force F_ax "Axial force on bearing";
        parameter SI.Force F_pr = 20 "Preload force";
        parameter SI.AngularVelocity w_ref = 10
          "Angular velocity after which the friction torque can is approx. equal to (1-eta)*flange_a.tau";
        import SI = Modelica.SIunits;
        import Modelica.Constants.pi;
      equation 
        tau = -2 / pi * abs(F_ax) * mu * (d / 2) * atan(w / w_ref);
        //w = der(flange.phi);
        F_ax = flange_a.f + F_pr;
        //forceFlange.f;
        0 = flange_b.f + flange_a.f;
        annotation (Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Ellipse(extent = {{-60, 60}, {60, -60}}, lineColor = {0, 0, 0}, fillColor = {175, 175, 175}, 
          fillPattern = FillPattern.Solid), Ellipse(extent = {{-50, 50}, {50, -50}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}, 
          fillPattern = FillPattern.Solid), Ellipse(extent = {{-12, 50}, {8, 30}}, lineColor = {0, 0, 0}, 
          fillPattern = FillPattern.Sphere, fillColor = {135, 135, 135}), Ellipse(extent = {{-10, -30}, {10, -50}}, lineColor = {0, 0, 0}, 
          fillPattern = FillPattern.Sphere, fillColor = {135, 135, 135}), Ellipse(extent = {{24, -10}, {44, -30}}, lineColor = {0, 0, 0}, 
          fillPattern = FillPattern.Sphere, fillColor = {135, 135, 135}), Ellipse(extent = {{22, 34}, {42, 14}}, lineColor = {0, 0, 0}, 
          fillPattern = FillPattern.Sphere, fillColor = {135, 135, 135}), Ellipse(extent = {{-44, 30}, {-24, 10}}, lineColor = {0, 0, 0}, 
          fillPattern = FillPattern.Sphere, fillColor = {135, 135, 135}), Ellipse(extent = {{-44, -12}, {-24, -32}}, lineColor = {0, 0, 0}, 
          fillPattern = FillPattern.Sphere, fillColor = {135, 135, 135}), Ellipse(extent = {{-30, 30}, {30, -30}}, lineColor = {0, 0, 0}, fillColor = {175, 175, 175}, 
          fillPattern = FillPattern.Solid), Ellipse(extent = {{-20, 20}, {20, -20}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}, 
          fillPattern = FillPattern.Solid), Text(extent = {{-260, 101}, {40, 61}}, lineColor = {0, 0, 255}, textString = "spindle
bearing"), Rectangle(extent = {{-120, 20}, {-80, -20}}, lineColor = {192, 192, 192}, fillColor = {192, 192, 192}, 
          fillPattern = FillPattern.Solid)}), Documentation(info = "<html>
<p>
The friction losses are considered by the equations
</p>
<pre>
   tau / tauRef = (+w / wRef) ^ power_w    for w &gt; +wLinear
 - tau / tauRef = (-w / wRef) ^ power_w    for w &lt; -wLinear
</pre>
<p>
with
</p>
<pre>
  tauRef * wRef = PRef
</pre>
<p>
being the friction torque at the referenc angular velocity
<code>wRef</code>. The exponent <code>power_w</code> is
approximately 1.5 for axial ventilation and approximately 2.0 for radial ventilation.
</p>
<p>
For stability reasons the friction torque <code>tau</code> is approximated by a linear curve
</p>
<pre>
  tau / tauLinear = w / wLinear
</pre>
<p>
with
</p>
<pre>
  tauLinear = tauRef*(wLinear/wRef) ^ power_w
</pre>
<p>
in the range <code> -wLinear &le; w &le; wLinear</code> with <code>wLinear = 0.001 * wRef</code>. The relationship of torque
and angular velocity is depicted in Fig. 1
</p>
<table border=0 cellspacing=0 cellpadding=1>
  <tr><td> <img src=\"modelica://Modelica/Resources/Images/Electrical/Machines/frictiontorque.png\"> </td>
  </tr>
  <tr><td> <b> Fig. 1: </b>Friction loss torque versus angular velocity for <code>power_w = 2</code></td>
  </tr>
</table>
<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Electrical.Machines.Losses.FrictionParameters\">FrictionParameters</a>
</p>
<p>
If it is desired to neglect friction losses, set <code>frictionParameters.PRef = 0</code> (this is the default).
</p>
</html>"));
      end Bearing;
      model BallScrewNut
        import SI = Modelica.SIunits;
        parameter Real eta = 0.952 "效率";
        parameter SI.Length P(displayUnit = "mm") = 0.012 "丝杠节距";
        parameter SI.RotationalSpringConstant c(final min = Modelica.Constants.small, 
          start = 1.0e5) = 
          1e5
          "接触刚度";
        parameter SI.RotationalDampingConstant d(final min = 0, start = 0) = 1e5
          "接触阻尼";
        parameter SI.Angle b(final min = 0) = 0.05 "反向间隙";
        parameter Modelica.SIunits.Torque Tf = 0.15 "丝杠螺母副摩擦力矩";

        Modelica.Mechanics.Rotational.Components.IdealGearR2T idealGearR2T(ratio = 2 * Modelica.Constants.pi / P, useSupportR = false, useSupportT = true) annotation (Placement(transformation(extent = {{20, -10}, {40, 10}})));


        Modelica.Mechanics.Translational.Interfaces.Flange_b flangeT
          "(right) driven flange (flange axis directed out of cut plane)" annotation (Placement(transformation(extent = {{90, -10}, {110, 10}}), iconTransformation(extent = {{90, -10}, {110, 10}})));
        Modelica.Mechanics.Rotational.Interfaces.Flange_a flangeR
          "Left flange of shaft" annotation (Placement(transformation(extent = {{-114, -10}, {-94, 10}})));



        Modelica.Mechanics.Translational.Interfaces.Support supportT "Translational support/housing of component" 
          annotation (Placement(transformation(origin = {-100.0, -60.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Bearing2 bearing2_1(f = Tf)
          annotation (Placement(transformation(origin = {6.0, -28.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.Rotational.Components.Fixed fixed
          annotation (Placement(transformation(origin = {-50.0, -44.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        EfficiencyFactor efficiencyFactor(eta = eta)
          annotation (Placement(transformation(origin = {-70.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.Rotational.Components.ElastoBacklash elastoBacklash(b = b, d = d, c = c)
          annotation (Placement(transformation(origin = {-20.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
      equation 
        annotation (Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-60, 26}, {60, 20}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}, 
          fillPattern = FillPattern.Solid), Rectangle(extent = {{-100, 20}, {80, -20}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}, 
          fillPattern = FillPattern.Solid), Line(points = {{-60, 0}, {60, 0}, {60, 0}}, color = {0, 0, 0}), Line(points = {{-60, 20}, {-40, -20}}, color = {0, 0, 0}), Line(points = {{-40, 20}, {-20, -20}}, color = {0, 0, 0}), Line(points = {{-20, 20}, {0, -20}}, color = {0, 0, 0}), Line(points = {{0, 20}, {20, -20}}, color = {0, 0, 0}), Line(points = {{20, 20}, {40, -20}}, color = {0, 0, 0}), Line(points = {{40, 20}, {60, -20}}, color = {0, 0, 0}), Rectangle(extent = {{-60, 0}, {60, -26}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}, 
          fillPattern = FillPattern.Solid), Rectangle(extent = {{-40, 40}, {-20, -40}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}, 
          fillPattern = FillPattern.Solid), Line(points = {{-60, 0}, {-100, 0}, {-102, 0}}, color = {0, 0, 0}), Line(points = {{-60, 20}, {-60, 0}}, color = {0, 0, 0}), Line(points = {{60, 20}, {60, 0}}, color = {0, 0, 0}), Line(points = {{-80, 20}, {-60, -20}}, color = {0, 0, 0}), Line(points = {{-100, 20}, {-80, -20}}, color = {0, 0, 0}), Line(points = {{60, 20}, {80, -20}}, color = {0, 0, 0}), Line(points = {{60, 26}, {60, 26}, {100, 26}, {100, 0}}, color = {0, 0, 0}), Line(points = {{-100, -50}, {-74, -50}, {-74, -20}}, color = {0, 0, 0}), Text(extent = {{-150, 100}, {150, 60}}, lineColor = {0, 0, 255}, textString = "%name")}));



        connect(idealGearR2T.supportT, supportT)
          annotation (Line(origin = {-30.0, -35.0}, 
            points = {{70.0, 25.0}, {70.0, -25.0}, {-70.0, -25.0}}, 
            color = {0, 127, 0}));
        connect(flangeT, idealGearR2T.flangeT)
          annotation (Line(origin = {70.0, 0.0}, 
            points = {{30.0, 0.0}, {-30.0, 0.0}}, 
            color = {0, 127, 0}));



        connect(bearing2_1.support, fixed.flange)
          annotation (Line(origin = {-22.0, -44.0}, 
            points = {{28.0, 6.0}, {28.0, 0.0}, {-28.0, 0.0}}));



        connect(bearing2_1.flange, idealGearR2T.flangeR)
          annotation (Line(origin = {13.0, -9.0}, 
            points = {{-7.0, -9.0}, {-7.0, 9.0}, {7.0, 9.0}}));
        connect(efficiencyFactor.flange_a, flangeR)
          annotation (Line(origin = {-92.0, 0.0}, 
            points = {{12.0, 0.0}, {-12.0, 0.0}}));
        connect(elastoBacklash.flange_a, efficiencyFactor.flange_b)
          annotation (Line(origin = {-45.0, 0.0}, 
            points = {{15.0, 0.0}, {-15.0, 0.0}}));
        connect(elastoBacklash.flange_b, idealGearR2T.flangeR)
          annotation (Line(origin = {5.0, 0.0}, 
            points = {{-15.0, 0.0}, {15.0, 0.0}}));
      end BallScrewNut;
      model EfficiencyFactor
        "Calculates the friction torque by using the efficiency factor. Atan function is used to obtain a continous model. Static friction is zero"

        Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a
          "Left flange of shaft" annotation (Placement(transformation(extent = {{-110, -10}, {-90, 10}}, rotation = 0), iconTransformation(extent = {{-110, -10}, {-90, 10}})));
        Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b
          "Right flange of shaft" annotation (Placement(transformation(extent = {{90, -10}, {110, 10}}, rotation = 0), iconTransformation(extent = {{90, -10}, {110, 10}})));
        parameter Real eta = 0.952 "efficiency factor";
        SI.AngularVelocity w "Angular velocity of flange";
        SI.Torque T_F(start = 0) "Friction torque";
        parameter SI.AngularVelocity w_ref = 0.1
          "Angular velocity after which the friction torque can is approx. equal to (1-eta)*flange_a.tau";
        import SI = Modelica.SIunits;
        import Modelica.Constants.pi;
      equation 
        flange_a.phi = flange_b.phi;
        w = der(flange_a.phi);
        T_F = -(1 - eta) * sign(flange_a.tau) * flange_a.tau;
        flange_a.tau + flange_b.tau + T_F = 0;
        annotation (Icon(graphics = {Rectangle(extent = {{-100, 10}, {54, -10}}, lineColor = {0, 0, 0}, 
          fillPattern = FillPattern.HorizontalCylinder, fillColor = {192, 192, 192}), Rectangle(extent = {{50, 10}, {100, -10}}, lineColor = {0, 0, 0}, 
          fillPattern = FillPattern.HorizontalCylinder, fillColor = {192, 192, 192}), Line(points = {{-80, -25}, {-60, -25}}, color = {0, 0, 0}), Line(points = {{60, -25}, {80, -25}}, color = {0, 0, 0}), Line(points = {{-70, -25}, {-70, -70}}, color = {0, 0, 0}), Line(points = {{70, -25}, {70, -70}}, color = {0, 0, 0}), Line(points = {{-80, 25}, {-60, 25}}, color = {0, 0, 0}), Line(points = {{60, 25}, {80, 25}}, color = {0, 0, 0}), Line(points = {{-70, 45}, {-70, 25}}, color = {0, 0, 0}), Line(points = {{70, 45}, {70, 25}}, color = {0, 0, 0}), Line(points = {{-70, -70}, {70, -70}}, color = {0, 0, 0}), Text(extent = {{-160, 140}, {140, 100}}, textString = "%name", lineColor = {0, 0, 255}), Text(extent = {{-150, -80}, {150, -120}}, lineColor = {0, 0, 0}, textString = "eta=%eta"), Polygon(points = {{-99, 50}, {-70, 50}, {-70, 68}, {-80, 68}, {-60, 84}, {-40, 68}, {-50, 68}, {-50, 30}, {-99, 30}, {-99, 50}}, lineColor = {0, 0, 0}, fillColor = {255, 0, 0}, 
          fillPattern = FillPattern.Solid)}));
      end EfficiencyFactor;
      model Bearing2
        "Model of angular velocity dependent friction losses. Atan function is used to obtain a continous model. Static friction is zero "
        extends Modelica.Electrical.Machines.Interfaces.FlangeSupport;


        parameter Modelica.SIunits.Torque f = 0.15 "摩擦力矩";
        parameter SI.AngularVelocity w_ref = 0.1;
        import SI = Modelica.SIunits;
        import Modelica.Constants.pi;
      equation 
        tau = -2 / pi * f * atan(w / w_ref);

        annotation (
          Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
            preserveAspectRatio = false, 
            grid = {2.0, 2.0}), graphics = {Ellipse(origin = {0.0, 0.0}, 
            fillColor = {175, 175, 175}, 
            fillPattern = FillPattern.Solid, 
            extent = {{-60.0, 60.0}, {60.0, -60.0}}), Ellipse(origin = {0.0, 0.0}, 
            fillColor = {255, 255, 255}, 
            fillPattern = FillPattern.Solid, 
            extent = {{-50.0, 50.0}, {50.0, -50.0}}), Ellipse(origin = {-2.0, 40.0}, 
            fillColor = {135, 135, 135}, 
            fillPattern = FillPattern.Sphere, 
            extent = {{-10.0, 10.0}, {10.0, -10.0}}), Ellipse(origin = {0.0, -40.0}, 
            fillColor = {135, 135, 135}, 
            fillPattern = FillPattern.Sphere, 
            extent = {{-10.0, 10.0}, {10.0, -10.0}}), Ellipse(origin = {34.0, -20.0}, 
            fillColor = {135, 135, 135}, 
            fillPattern = FillPattern.Sphere, 
            extent = {{-10.0, 10.0}, {10.0, -10.0}}), Ellipse(origin = {32.0, 24.0}, 
            fillColor = {135, 135, 135}, 
            fillPattern = FillPattern.Sphere, 
            extent = {{-10.0, 10.0}, {10.0, -10.0}}), Ellipse(origin = {-34.0, 20.0}, 
            fillColor = {135, 135, 135}, 
            fillPattern = FillPattern.Sphere, 
            extent = {{-10.0, 10.0}, {10.0, -10.0}}), Ellipse(origin = {-34.0, -22.0}, 
            fillColor = {135, 135, 135}, 
            fillPattern = FillPattern.Sphere, 
            extent = {{-10.0, 10.0}, {10.0, -10.0}}), Ellipse(origin = {0.0, 0.0}, 
            fillColor = {175, 175, 175}, 
            fillPattern = FillPattern.Solid, 
            extent = {{-30.0, 30.0}, {30.0, -30.0}}), Ellipse(origin = {0.0, 0.0}, 
            fillColor = {255, 255, 255}, 
            fillPattern = FillPattern.Solid, 
            extent = {{-20.0, 20.0}, {20.0, -20.0}}), Text(origin = {-110.0, 81.0}, 
            lineColor = {0, 0, 255}, 
            extent = {{-150.0, 20.0}, {150.0, -20.0}}, 
            textString = "spindle
bearing", 
            textColor = {0, 0, 255}), Line(origin = {0.0, -70.0}, 
            points = {{0.0, 10.0}, {0.0, -10.0}}), Line(origin = {0.0, 75.0}, 
            points = {{0.0, 15.0}, {0.0, -15.0}})}), 
          Documentation(info = "<html>
<p>
The friction losses are considered by the equations
</p>
<pre>
   tau / tauRef = (+w / wRef) ^ power_w    for w &gt; +wLinear
 - tau / tauRef = (-w / wRef) ^ power_w    for w &lt; -wLinear
</pre>
<p>
with
</p>
<pre>
  tauRef * wRef = PRef
</pre>
<p>
being the friction torque at the referenc angular velocity
<code>wRef</code>. The exponent <code>power_w</code> is
approximately 1.5 for axial ventilation and approximately 2.0 for radial ventilation.
</p>
<p>
For stability reasons the friction torque <code>tau</code> is approximated by a linear curve
</p>
<pre>
  tau / tauLinear = w / wLinear
</pre>
<p>
with
</p>
<pre>
  tauLinear = tauRef*(wLinear/wRef) ^ power_w
</pre>
<p>
in the range <code> -wLinear &le; w &le; wLinear</code> with <code>wLinear = 0.001 * wRef</code>. The relationship of torque
and angular velocity is depicted in Fig. 1
</p>
<table border=0 cellspacing=0 cellpadding=1>
  <tr><td> <img src=\"modelica://Modelica/Resources/Images/Electrical/Machines/frictiontorque.png\"> </td>
  </tr>
  <tr><td> <b> Fig. 1: </b>Friction loss torque versus angular velocity for <code>power_w = 2</code></td>
  </tr>
</table>
<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Electrical.Machines.Losses.FrictionParameters\">FrictionParameters</a>
</p>
<p>
If it is desired to neglect friction losses, set <code>frictionParameters.PRef = 0</code> (this is the default).
</p>
</html>"));
      end Bearing2;

      model BallScrewNut2
        parameter SI.CoefficientOfFriction mu = 0.03 "Friction coefficient";
        parameter SI.Length P(displayUnit = "mm") = 0.012 "Pitch of spindle";
        parameter SI.Force F_pr = 20 "Preload force";

        parameter SI.RotationalSpringConstant c(final min = Modelica.Constants.small, 
          start = 1.0e5) = 
          1.0e6
          "Spring constant (c > 0 required)";
        parameter SI.RotationalDampingConstant d(final min = 0, start = 0) = 0.1
          "Damping constant";
        parameter SI.Angle b(final min = 0) = 0.00872664625997165 "Total backlash";
        Modelica.Mechanics.Rotational.Components.IdealGearR2T idealGearR2T(ratio = 2 * Modelica.Constants.pi / P, useSupportR = false, useSupportT = true) annotation (Placement(transformation(extent = {{20, -10}, {40, 10}})));

        Modelica.Mechanics.Translational.Sensors.ForceSensor forceSensor annotation (Placement(transformation(extent = {{60, -10}, {80, 10}})));
        Modelica.Mechanics.Translational.Interfaces.Flange_b flangeT
          "(right) driven flange (flange axis directed out of cut plane)" annotation (Placement(transformation(extent = {{90, -10}, {110, 10}}), iconTransformation(extent = {{90, -10}, {110, 10}})));
        Modelica.Mechanics.Rotational.Interfaces.Flange_a flangeR
          "Left flange of shaft" annotation (Placement(transformation(extent = {{-114, -10}, {-94, 10}})));
        import SI = Modelica.SIunits;



        Modelica.Mechanics.Rotational.Components.ElastoBacklash elastoBacklash(b = b, d = d, c = c)
          annotation (Placement(transformation(origin = {-20.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));



        Modelica.Blocks.Interfaces.RealOutput f "Force in flange_a and flange_b (f = flange_a.f = -flange_b.f) as output signal" 
          annotation (Placement(transformation(origin = {100.0, -40.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.Translational.Interfaces.Support supportT "Translational support/housing of component" 
          annotation (Placement(transformation(origin = {-100.0, -60.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));



        Modelica.Mechanics.Rotational.Components.Fixed fixed
          annotation (Placement(transformation(origin = {-62.0, -40.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Bearing bearing(mu = mu, F_pr = F_pr)
          annotation (Placement(transformation(origin = {-62.0, -22.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
      equation 
        connect(idealGearR2T.flangeT, forceSensor.flange_a) annotation (Line(points = {{40, 0}, {60, 0}}, color = {0, 127, 0}));

        connect(forceSensor.flange_b, flangeT) annotation (Line(points = {{80, 0}, {100, 0}}, color = {0, 127, 0}));
        annotation (Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-60, 26}, {60, 20}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}, 
          fillPattern = FillPattern.Solid), Rectangle(extent = {{-100, 20}, {80, -20}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}, 
          fillPattern = FillPattern.Solid), Line(points = {{-60, 0}, {60, 0}, {60, 0}}, color = {0, 0, 0}), Line(points = {{-60, 20}, {-40, -20}}, color = {0, 0, 0}), Line(points = {{-40, 20}, {-20, -20}}, color = {0, 0, 0}), Line(points = {{-20, 20}, {0, -20}}, color = {0, 0, 0}), Line(points = {{0, 20}, {20, -20}}, color = {0, 0, 0}), Line(points = {{20, 20}, {40, -20}}, color = {0, 0, 0}), Line(points = {{40, 20}, {60, -20}}, color = {0, 0, 0}), Rectangle(extent = {{-60, 0}, {60, -26}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}, 
          fillPattern = FillPattern.Solid), Rectangle(extent = {{-40, 40}, {-20, -40}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}, 
          fillPattern = FillPattern.Solid), Line(points = {{-60, 0}, {-100, 0}, {-102, 0}}, color = {0, 0, 0}), Line(points = {{-60, 20}, {-60, 0}}, color = {0, 0, 0}), Line(points = {{60, 20}, {60, 0}}, color = {0, 0, 0}), Line(points = {{-80, 20}, {-60, -20}}, color = {0, 0, 0}), Line(points = {{-100, 20}, {-80, -20}}, color = {0, 0, 0}), Line(points = {{60, 20}, {80, -20}}, color = {0, 0, 0}), Line(points = {{60, 26}, {60, 26}, {100, 26}, {100, 0}}, color = {0, 0, 0}), Line(points = {{-100, -50}, {-74, -50}, {-74, -20}}, color = {0, 0, 0}), Text(extent = {{-150, 100}, {150, 60}}, lineColor = {0, 0, 255}, textString = "%name")}));
        connect(elastoBacklash.flange_b, idealGearR2T.flangeR)
          annotation (Line(origin = {5.0, 0.0}, 
            points = {{-15.0, 0.0}, {15.0, 0.0}}));
        connect(forceSensor.f, f)
          annotation (Line(origin = {81.0, -25.0}, 
            points = {{-19.0, 14.0}, {-19.0, -15.0}, {19.0, -15.0}}, 
            color = {0, 0, 127}));
        connect(elastoBacklash.flange_a, flangeR)
          annotation (Line(origin = {-67.0, 0.0}, 
            points = {{37.0, 0.0}, {-37.0, 0.0}}));
        connect(fixed.flange, bearing.support)
          annotation (Line(origin = {-62.0, -36.0}, 
            points = {{0.0, -4.0}, {0.0, 4.0}}));
        connect(bearing.flange, flangeR)
          annotation (Line(origin = {-83.0, -6.0}, 
            points = {{21.0, -6.0}, {21.0, 6.0}, {-21.0, 6.0}}));
        connect(bearing.flange_b, idealGearR2T.supportT)
          annotation (Line(origin = {-6.0, -16.0}, 
            points = {{-46.0, -6.0}, {46.0, -6.0}, {46.0, 6.0}}, 
            color = {0, 127, 0}));
        connect(bearing.flange_a, supportT)
          annotation (Line(origin = {-86.0, -41.0}, 
            points = {{14.0, 19.0}, {-8.0, 19.0}, {-8.0, -19.0}, {-14.0, -19.0}}, 
            color = {0, 127, 0}));
      end BallScrewNut2;
      model Coulpling2
        import SI = Modelica.SIunits;
        parameter SI.Inertia J = 0.00008 "联轴器转动惯量";
        parameter SI.RotationalSpringConstant c(final min = 0, start = 1.0e5) = 96389.8 "扭转刚度";
        parameter SI.RotationalDampingConstant d(final min = 0, start = 0) = 3 "阻尼系数";
        annotation (Diagram(coordinateSystem(extent = {{-140.0, -100.0}, {140.0, 100.0}}, 
          preserveAspectRatio = false, 
          grid = {2.0, 2.0})), 
          Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
            preserveAspectRatio = false, 
            grid = {2.0, 2.0}), graphics = {Rectangle(origin = {60.0, 0.0}, 
            lineColor = {99, 99, 99}, 
            fillColor = {167, 167, 167}, 
            fillPattern = FillPattern.HorizontalCylinder, 
            extent = {{-40.0, 40.0}, {40.0, -40.0}}), Rectangle(origin = {-60.0, 0.0}, 
            lineColor = {91, 91, 91}, 
            fillColor = {167, 167, 167}, 
            fillPattern = FillPattern.HorizontalCylinder, 
            extent = {{-40.0, 40.0}, {40.0, -40.0}}), Rectangle(origin = {0.0, 0.0}, 
            lineColor = {91, 91, 91}, 
            fillColor = {167, 167, 167}, 
            fillPattern = FillPattern.HorizontalCylinder, 
            extent = {{-20.0, 60.0}, {20.0, -60.0}})}));
        Modelica.Mechanics.Rotational.Components.Inertia inertia(J = J / 2)
          annotation (Placement(transformation(origin = {-30.0, 10.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.Rotational.Components.SpringDamper springDamper(c = c, d = d)
          annotation (Placement(transformation(origin = {0.0, 10.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = J / 2)
          annotation (Placement(transformation(origin = {30.0, 10.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a "Left flange of shaft" 
          annotation (Placement(transformation(origin = {-100.0, 2.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b "Right flange of shaft" 
          annotation (Placement(transformation(origin = {100.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
      equation 
        connect(inertia.flange_b, springDamper.flange_a)
          annotation (Line(origin = {-15.0, 10.0}, 
            points = {{-5.0, 0.0}, {5.0, 0.0}}));
        connect(springDamper.flange_b, inertia1.flange_a)
          annotation (Line(origin = {15.0, 10.0}, 
            points = {{-5.0, 0.0}, {5.0, 0.0}}));
        connect(inertia.flange_a, flange_a)
          annotation (Line(origin = {-62.0, 10.0}, 
            points = {{22.0, 0.0}, {-22.0, 0.0}}));
        connect(inertia1.flange_b, flange_b)
          annotation (Line(origin = {61.0, 10.0}, 
            points = {{-21.0, 0.0}, {20.0, 0.0}}));
      end Coulpling2;
      model BallScrewNut3
        parameter SI.CoefficientOfFriction mu = 0.03 "Friction coefficient";
        parameter SI.Length P(displayUnit = "mm") = 0.012 "Pitch of spindle";
        parameter SI.Force F_pr = 20 "Preload force";

        parameter SI.RotationalSpringConstant c(final min = Modelica.Constants.small, 
          start = 1.0e5) = 
          1.0e6
          "Spring constant (c > 0 required)";
        parameter SI.RotationalDampingConstant d(final min = 0, start = 0) = 0.1
          "Damping constant";
        parameter SI.Angle b(final min = 0) = 0.00872664625997165 "Total backlash";
        Modelica.Mechanics.Rotational.Components.IdealGearR2T idealGearR2T(ratio = 2 * Modelica.Constants.pi / P, useSupportR = false, useSupportT = true) annotation (Placement(transformation(extent = {{20, -10}, {40, 10}})));

        Modelica.Mechanics.Translational.Sensors.ForceSensor forceSensor annotation (Placement(transformation(extent = {{60, -10}, {80, 10}})));
        Modelica.Mechanics.Translational.Interfaces.Flange_b flangeT
          "(right) driven flange (flange axis directed out of cut plane)" annotation (Placement(transformation(extent = {{90, -10}, {110, 10}}), iconTransformation(extent = {{90, -10}, {110, 10}})));
        Modelica.Mechanics.Rotational.Interfaces.Flange_a flangeR
          "Left flange of shaft" annotation (Placement(transformation(extent = {{-114, -10}, {-94, 10}})));
        import SI = Modelica.SIunits;
        Modelica.Blocks.Interfaces.RealOutput f "Force in flange_a and flange_b (f = flange_a.f = -flange_b.f) as output signal" 
          annotation (Placement(transformation(origin = {100.0, -40.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.Translational.Interfaces.Support supportT "Translational support/housing of component" 
          annotation (Placement(transformation(origin = {-100.0, -60.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        EfficiencyFactor efficiencyFactor(eta = 0.955)
          annotation (Placement(transformation(origin = {-40.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
      equation 
        connect(idealGearR2T.flangeT, forceSensor.flange_a) annotation (Line(points = {{40, 0}, {60, 0}}, color = {0, 127, 0}));

        connect(forceSensor.flange_b, flangeT) annotation (Line(points = {{80, 0}, {100, 0}}, color = {0, 127, 0}));
        annotation (Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-60, 26}, {60, 20}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}, 
          fillPattern = FillPattern.Solid), Rectangle(extent = {{-100, 20}, {80, -20}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}, 
          fillPattern = FillPattern.Solid), Line(points = {{-60, 0}, {60, 0}, {60, 0}}, color = {0, 0, 0}), Line(points = {{-60, 20}, {-40, -20}}, color = {0, 0, 0}), Line(points = {{-40, 20}, {-20, -20}}, color = {0, 0, 0}), Line(points = {{-20, 20}, {0, -20}}, color = {0, 0, 0}), Line(points = {{0, 20}, {20, -20}}, color = {0, 0, 0}), Line(points = {{20, 20}, {40, -20}}, color = {0, 0, 0}), Line(points = {{40, 20}, {60, -20}}, color = {0, 0, 0}), Rectangle(extent = {{-60, 0}, {60, -26}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}, 
          fillPattern = FillPattern.Solid), Rectangle(extent = {{-40, 40}, {-20, -40}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}, 
          fillPattern = FillPattern.Solid), Line(points = {{-60, 0}, {-100, 0}, {-102, 0}}, color = {0, 0, 0}), Line(points = {{-60, 20}, {-60, 0}}, color = {0, 0, 0}), Line(points = {{60, 20}, {60, 0}}, color = {0, 0, 0}), Line(points = {{-80, 20}, {-60, -20}}, color = {0, 0, 0}), Line(points = {{-100, 20}, {-80, -20}}, color = {0, 0, 0}), Line(points = {{60, 20}, {80, -20}}, color = {0, 0, 0}), Line(points = {{60, 26}, {60, 26}, {100, 26}, {100, 0}}, color = {0, 0, 0}), Line(points = {{-100, -50}, {-74, -50}, {-74, -20}}, color = {0, 0, 0}), Text(extent = {{-150, 100}, {150, 60}}, lineColor = {0, 0, 255}, textString = "%name")}));



        connect(forceSensor.f, f)
          annotation (Line(origin = {81.0, -25.0}, 
            points = {{-19.0, 14.0}, {-19.0, -15.0}, {19.0, -15.0}}, 
            color = {0, 0, 127}));



        connect(supportT, idealGearR2T.supportT)
          annotation (Line(origin = {-30.0, -35.0}, 
            points = {{-70.0, -25.0}, {70.0, -25.0}, {70.0, 25.0}}, 
            color = {0, 127, 0}));
        connect(efficiencyFactor.flange_a, flangeR)
          annotation (Line(origin = {-92.0, 0.0}, 
            points = {{42.0, 0.0}, {-12.0, 0.0}}));
        connect(efficiencyFactor.flange_b, idealGearR2T.flangeR)
          annotation (Line(origin = {-5.0, 0.0}, 
            points = {{-25.0, 0.0}, {25.0, 0.0}}));
      end BallScrewNut3;
      model BallScrew "滚珠丝杠模型"
        import SI = Modelica.SIunits;
        import Modelica.Constants.pi;
        parameter SI.Inertia J = pi * rou * Ls * (ds ^ 4) / 32 "丝杠转动惯量";//0.001824
        parameter SI.RotationalSpringConstant c(final min = 0, start = 1.0e5) = 22279.8 "扭转刚度";
        parameter SI.RotationalDampingConstant d(final min = 0, start = 0) = 3 "阻尼系数";
        parameter Modelica.SIunits.Height ds = 0.04 "丝杠的直径" 
          annotation (Dialog(tab = "几何尺寸"));
        parameter Modelica.SIunits.Height d0 = 0.012 "丝杠孔内径" 
          annotation (Dialog(tab = "几何尺寸"));
        parameter Modelica.SIunits.Length Ls = 0.925 "丝杠螺纹长度" 
          annotation (Dialog(tab = "几何尺寸"));
        parameter Modelica.SIunits.Density rou = 7850 "丝杠的密度，材料为钢";
        annotation (Diagram(coordinateSystem(extent = {{-140.0, -100.0}, {140.0, 100.0}}, 
          preserveAspectRatio = false, 
          grid = {2.0, 2.0})), 
          Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
            preserveAspectRatio = false, 
            grid = {2.0, 2.0}), graphics = {Rectangle(origin = {0.0, 0.0}, 
            fillColor = {177, 177, 177}, 
            fillPattern = FillPattern.Solid, 
            extent = {{-100.0, 40.0}, {100.0, -40.0}}), Line(origin = {-70.0, 0.0}, 
            points = {{10.0, 40.0}, {-10.0, -40.0}}, 
            thickness = 1.0), Line(origin = {-30.0, 0.0}, 
            points = {{10.0, 40.0}, {-10.0, -40.0}}, 
            thickness = 1.0), Line(origin = {10.0, 0.0}, 
            points = {{10.0, 40.0}, {-10.0, -40.0}}, 
            thickness = 1.0), Line(origin = {50.0, 0.0}, 
            points = {{10.0, 40.0}, {-10.0, -40.0}}, 
            thickness = 1.0), Line(origin = {90.0, 0.0}, 
            points = {{10.0, 40.0}, {-10.0, -40.0}}, 
            thickness = 1.0)}));
        Modelica.Mechanics.Rotational.Components.Inertia inertia2(J = J)
          annotation (Placement(transformation(origin = {-47.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.Rotational.Components.SpringDamper springDamper(c = c, d = d)
          annotation (Placement(transformation(origin = {-10.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a "Left flange of shaft" 
          annotation (Placement(transformation(origin = {-100.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b "Right flange of compliant 1-dim. rotational component" 
          annotation (Placement(transformation(origin = {100.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
      equation 
        connect(inertia2.flange_b, springDamper.flange_a)
          annotation (Line(origin = {-28.0, 0.0}, 
            points = {{-9.0, 0.0}, {8.0, 0.0}}));
        connect(inertia2.flange_a, flange_a)
          annotation (Line(origin = {-81.0, 0.0}, 
            points = {{24.0, 0.0}, {-25.0, 0.0}}));
        connect(springDamper.flange_b, flange_b)
          annotation (Line(origin = {36.0, 0.0}, 
            points = {{-36.0, 0.0}, {35.0, 0.0}}));
      end BallScrew;
      model Workbench "工作台"
        parameter Modelica.SIunits.Mass M = 76.9916;
        annotation (Diagram(coordinateSystem(extent = {{-140.0, -100.0}, {140.0, 100.0}}, 
          preserveAspectRatio = false, 
          grid = {2.0, 2.0})), 
          Icon(coordinateSystem(extent = {{-180.0, -100.0}, {160.0, 100.0}}, 
            preserveAspectRatio = false, 
            grid = {2.0, 2.0}), graphics = {Rectangle(origin = {0.0, -20.0}, 
            fillColor = {255, 255, 255}, 
            extent = {{-100.0, 20.0}, {100.0, -20.0}}), Rectangle(origin = {0.0, 30.0}, 
            fillColor = {255, 255, 255}, 
            extent = {{-60.0, 30.0}, {60.0, -30.0}}), Line(origin = {-90.0, -20.0}, 
            points = {{10.0, 20.0}, {-10.0, -20.0}}), Line(origin = {-50.0, -20.0}, 
            points = {{10.0, 20.0}, {-10.0, -20.0}}), Line(origin = {-10.0, -20.0}, 
            points = {{10.0, 20.0}, {-10.0, -20.0}}), Line(origin = {30.0, -20.0}, 
            points = {{10.0, 20.0}, {-10.0, -20.0}}), Line(origin = {70.0, -20.0}, 
            points = {{10.0, 20.0}, {-10.0, -20.0}})}));
        Modelica.Mechanics.Translational.Components.Mass mass(m = M)
          annotation (Placement(transformation(extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.Translational.Interfaces.Flange_a flange_a "Left flange of translational component" 
          annotation (Placement(transformation(origin = {-100.0, -20.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.Translational.Sources.Force force
          annotation (Placement(transformation(origin = {0.0, -40.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Blocks.Interfaces.RealInput f "Driving force as input signal" 
          annotation (Placement(transformation(origin = {0.0, -60.0}, 
            extent = {{-20.0, -20.0}, {20.0, 20.0}}, 
            rotation = 90.0)));
      equation 
        connect(mass.flange_a, flange_a)
          annotation (Line(origin = {-75.0, 0.0}, 
            points = {{65.0, 0.0}, {-65.0, 0.0}}, 
            color = {0, 127, 0}));
        connect(force.flange, mass.flange_b)
          annotation (Line(origin = {55.0, -20.0}, 
            points = {{-45.0, -20.0}, {45.0, -20.0}, {45.0, 20.0}, {-45.0, 20.0}}, 
            color = {0, 127, 0}));
        connect(force.f, f)
          annotation (Line(origin = {-15.0, -70.0}, 
            points = {{3.0, 30.0}, {-15.0, 30.0}, {-15.0, -10.0}, {15.0, -10.0}, {15.0, -30.0}}, 
            color = {0, 0, 127}));
      end Workbench;

      model BallScrewNut4
        parameter SI.CoefficientOfFriction mu = 0.03 "Friction coefficient";
        parameter SI.Length P(displayUnit = "mm") = 0.012 "Pitch of spindle";
        parameter SI.Force F_pr = 20 "Preload force";

        parameter SI.RotationalSpringConstant c(final min = Modelica.Constants.small, 
          start = 1.0e5) = 
          1.0e6
          "Spring constant (c > 0 required)";
        parameter SI.RotationalDampingConstant d(final min = 0, start = 0) = 0.1
          "Damping constant";
        parameter SI.Angle b(final min = 0) = 0.00872664625997165 "Total backlash";
        Modelica.Mechanics.Rotational.Components.IdealGearR2T idealGearR2T(ratio = 2 * Modelica.Constants.pi / P, useSupportR = false, useSupportT = true) annotation (Placement(transformation(extent = {{20, -10}, {40, 10}})));

        Modelica.Mechanics.Translational.Sensors.ForceSensor forceSensor annotation (Placement(transformation(extent = {{60, -10}, {80, 10}})));
        Modelica.Mechanics.Translational.Interfaces.Flange_b flangeT
          "(right) driven flange (flange axis directed out of cut plane)" annotation (Placement(transformation(extent = {{90, -10}, {110, 10}}), iconTransformation(extent = {{90, -10}, {110, 10}})));
        Modelica.Mechanics.Rotational.Interfaces.Flange_a flangeR
          "Left flange of shaft" annotation (Placement(transformation(extent = {{-114, -10}, {-94, 10}})));
        import SI = Modelica.SIunits;



        Modelica.Mechanics.Rotational.Components.ElastoBacklash elastoBacklash(b = b, d = d, c = c)
          annotation (Placement(transformation(origin = {-40.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));



        Modelica.Blocks.Interfaces.RealOutput f "Force in flange_a and flange_b (f = flange_a.f = -flange_b.f) as output signal" 
          annotation (Placement(transformation(origin = {100.0, -40.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.Translational.Interfaces.Support supportT "Translational support/housing of component" 
          annotation (Placement(transformation(origin = {-100.0, -60.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));



        Bearing2 bearing2_1
          annotation (Placement(transformation(origin = {-66.0, -18.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        EfficiencyFactor efficiencyFactor
          annotation (Placement(transformation(origin = {-6.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.Rotational.Components.Fixed fixed
          annotation (Placement(transformation(origin = {-66.0, -36.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
      equation 
        connect(idealGearR2T.flangeT, forceSensor.flange_a) annotation (Line(points = {{40, 0}, {60, 0}}, color = {0, 127, 0}));

        connect(forceSensor.flange_b, flangeT) annotation (Line(points = {{80, 0}, {100, 0}}, color = {0, 127, 0}));
        annotation (Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-60, 26}, {60, 20}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}, 
          fillPattern = FillPattern.Solid), Rectangle(extent = {{-100, 20}, {80, -20}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}, 
          fillPattern = FillPattern.Solid), Line(points = {{-60, 0}, {60, 0}, {60, 0}}, color = {0, 0, 0}), Line(points = {{-60, 20}, {-40, -20}}, color = {0, 0, 0}), Line(points = {{-40, 20}, {-20, -20}}, color = {0, 0, 0}), Line(points = {{-20, 20}, {0, -20}}, color = {0, 0, 0}), Line(points = {{0, 20}, {20, -20}}, color = {0, 0, 0}), Line(points = {{20, 20}, {40, -20}}, color = {0, 0, 0}), Line(points = {{40, 20}, {60, -20}}, color = {0, 0, 0}), Rectangle(extent = {{-60, 0}, {60, -26}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}, 
          fillPattern = FillPattern.Solid), Rectangle(extent = {{-40, 40}, {-20, -40}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}, 
          fillPattern = FillPattern.Solid), Line(points = {{-60, 0}, {-100, 0}, {-102, 0}}, color = {0, 0, 0}), Line(points = {{-60, 20}, {-60, 0}}, color = {0, 0, 0}), Line(points = {{60, 20}, {60, 0}}, color = {0, 0, 0}), Line(points = {{-80, 20}, {-60, -20}}, color = {0, 0, 0}), Line(points = {{-100, 20}, {-80, -20}}, color = {0, 0, 0}), Line(points = {{60, 20}, {80, -20}}, color = {0, 0, 0}), Line(points = {{60, 26}, {60, 26}, {100, 26}, {100, 0}}, color = {0, 0, 0}), Line(points = {{-100, -50}, {-74, -50}, {-74, -20}}, color = {0, 0, 0}), Text(extent = {{-150, 100}, {150, 60}}, lineColor = {0, 0, 255}, textString = "%name")}), 
          Diagram(coordinateSystem(extent = {{-160.0, -100.0}, {180.0, 100.0}}, 
            grid = {2.0, 2.0})));
        connect(forceSensor.f, f)
          annotation (Line(origin = {81.0, -25.0}, 
            points = {{-19.0, 14.0}, {-19.0, -15.0}, {19.0, -15.0}}, 
            color = {0, 0, 127}));



        connect(supportT, idealGearR2T.supportT)
          annotation (Line(origin = {-30.0, -35.0}, 
            points = {{-70.0, -25.0}, {70.0, -25.0}, {70.0, 25.0}}, 
            color = {0, 127, 0}));
        connect(efficiencyFactor.flange_a, elastoBacklash.flange_b)
          annotation (Line(origin = {-23.0, 0.0}, 
            points = {{7.0, 0.0}, {-7.0, 0.0}}));
        connect(efficiencyFactor.flange_b, idealGearR2T.flangeR)
          annotation (Line(origin = {12.0, 0.0}, 
            points = {{-8.0, 0.0}, {8.0, 0.0}}));
        connect(elastoBacklash.flange_a, flangeR)
          annotation (Line(origin = {-77.0, 0.0}, 
            points = {{27.0, 0.0}, {-27.0, 0.0}}));
        connect(bearing2_1.flange, flangeR)
          annotation (Line(origin = {-85.0, -7.0}, 
            points = {{19.0, -1.0}, {19.0, 7.0}, {-19.0, 7.0}}));
        connect(fixed.flange, bearing2_1.support)
          annotation (Line(origin = {-66.0, -32.0}, 
            points = {{0.0, -4.0}, {0.0, 4.0}}));
      end BallScrewNut4;

      model BallScrew2 "滚珠丝杠模型"
        import SI = Modelica.SIunits;
        import Modelica.Constants.pi;
        Modelica.SIunits.Length x;
        parameter SI.TranslationalDampingConstant d(final min = 0, start = 1) = 1000
          "阻尼系数";
        parameter SI.Mass m = As * L * rou "丝杠质量";
        parameter Modelica.SIunits.Area As = 
          pi * ((ds ^ 2) - (d0 ^ 2)) / 4 "丝杠的截面积";
        constant Real E = 2.1e11 "丝杠材料的弹性模量，对于钢材E=2.1e5MPa";
        parameter Modelica.SIunits.Length Lsg = 0.876 "两双推轴承之间的距离" 
          annotation (Dialog(tab = "几何尺寸"));
        parameter Modelica.SIunits.Height ds = 0.04 "丝杠的直径" 
          annotation (Dialog(tab = "几何尺寸"));
        parameter Modelica.SIunits.Height d0 = 0.012 "丝杠孔内径" 
          annotation (Dialog(tab = "几何尺寸"));
        parameter Modelica.SIunits.Length Ls = 0.925 "丝杠螺纹长度" 
          annotation (Dialog(tab = "几何尺寸"));
        parameter Modelica.SIunits.Length L = 1.055 "丝杠总长度" 
          annotation (Dialog(tab = "几何尺寸"));
        parameter Modelica.SIunits.Density rou = 7850 "丝杠的密度，材料为钢";
        Real Ksa "丝杠的轴向刚度";
        annotation (Diagram(coordinateSystem(extent = {{-140.0, -100.0}, {140.0, 100.0}}, 
          preserveAspectRatio = false, 
          grid = {2.0, 2.0})), 
          Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
            preserveAspectRatio = false, 
            grid = {2.0, 2.0}), graphics = {Rectangle(origin = {0.0, 0.0}, 
            fillColor = {177, 177, 177}, 
            fillPattern = FillPattern.Solid, 
            extent = {{-100.0, 40.0}, {100.0, -40.0}}), Line(origin = {-70.0, 0.0}, 
            points = {{10.0, 40.0}, {-10.0, -40.0}}, 
            thickness = 1.0), Line(origin = {-30.0, 0.0}, 
            points = {{10.0, 40.0}, {-10.0, -40.0}}, 
            thickness = 1.0), Line(origin = {10.0, 0.0}, 
            points = {{10.0, 40.0}, {-10.0, -40.0}}, 
            thickness = 1.0), Line(origin = {50.0, 0.0}, 
            points = {{10.0, 40.0}, {-10.0, -40.0}}, 
            thickness = 1.0), Line(origin = {90.0, 0.0}, 
            points = {{10.0, 40.0}, {-10.0, -40.0}}, 
            thickness = 1.0)}));
        Modelica.Mechanics.Translational.Components.Mass mass
          annotation (Placement(transformation(origin = {-50.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));


        Modelica.Mechanics.Translational.Interfaces.Flange_a flange_a "Left flange of translational component" 
          annotation (Placement(transformation(origin = {-110.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.Translational.Interfaces.Flange_b flange_b "Right flange of compliant 1-dim. translational component" 
          annotation (Placement(transformation(origin = {110.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));



        Modelica.Blocks.Interfaces.RealInput u
          annotation (Placement(transformation(origin = {0.0, 70.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
            rotation = 270.0)));
        SpringDamper springDamper(d = d)
          annotation (Placement(transformation(origin = {20.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
      equation 
        x = u;
        Ksa = As * E * Lsg / x * (Lsg - x);
        springDamper.c = Ksa;
        connect(mass.flange_a, flange_a)
          annotation (Line(origin = {-99.0, 0.0}, 
            points = {{39.0, 0.0}, {-39.0, 0.0}}, 
            color = {0, 127, 0}));
        connect(springDamper.flange_a, mass.flange_b)
          annotation (Line(origin = {-15.0, 0.0}, 
            points = {{25.0, 0.0}, {-25.0, 0.0}}, 
            color = {0, 127, 0}));
        connect(flange_b, springDamper.flange_b)
          annotation (Line(origin = {65.0, 0.0}, 
            points = {{45.0, 0.0}, {-45.0, 0.0}}, 
            color = {0, 127, 0}));
      end BallScrew2;
      model Spring "Linear 1D translational spring"
        extends Modelica.Mechanics.Translational.Interfaces.PartialCompliant;
        SI.TranslationalSpringConstant c(final min = 0, start = 1)
          "Spring constant";
        parameter SI.Distance s_rel0 = 0 "Unstretched spring length";
        import SI = Modelica.SIunits;
        Modelica.Blocks.Interfaces.RealInput u
          annotation (Placement(transformation(origin = {0.0, 50.0}, 
            extent = {{-20.0, -20.0}, {20.0, 20.0}}, 
            rotation = 270.0)));
      equation 
        u = c;
        f = c * (s_rel - s_rel0);
        annotation (
          Documentation(info = "<html>
<p>
A <i>linear 1D translational spring</i>. The component can be connected either
between two sliding masses, or between
a sliding mass and the housing (model Fixed), to describe
a coupling of the sliding mass with the housing via a spring.
</p>

</html>"), 
          Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {
            100, 100}}), graphics = {
            Line(points = {{-60, -90}, {20, -90}}, color = {0, 0, 0}), 
            Polygon(
            points = {{50, -90}, {20, -80}, {20, -100}, {50, -90}}, 
            lineColor = {128, 128, 128}, 
            fillColor = {128, 128, 128}, 
            fillPattern = FillPattern.Solid), 
            Text(
            extent = {{-150, 90}, {150, 50}}, 
            textString = "%name", 
            lineColor = {0, 0, 255}), 
            Line(points = {{-98, 0}, {-60, 0}, {-44, -30}, {-16, 30}, {14, -30}, {44, 30}, {
            60, 0}, {100, 0}}, color = {0, 0, 0}), 
            Text(
            extent = {{-150, -45}, {150, -75}}, 
            lineColor = {0, 0, 0}, 
            textString = "c=%c")}), 
          Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, 
            {100, 100}}), graphics = {Line(points = {{-100, 0}, {-100, 65}}, color = 
            {128, 128, 128}), Line(points = {{100, 0}, {100, 65}}, color = {128, 128, 128}), 
            Line(points = {{-100, 60}, {100, 60}}, color = {128, 128, 128}), Polygon(
            points = {{90, 63}, {100, 60}, {90, 57}, {90, 63}}, 
            lineColor = {128, 128, 128}, 
            fillColor = {128, 128, 128}, 
            fillPattern = FillPattern.Solid), Text(
            extent = {{-56, 66}, {36, 81}}, 
            lineColor = {0, 0, 255}, 
            textString = "s_rel"), Line(points = {{-86, 0}, {-60, 0}, {-44, -30}, {-16, 
            30}, {14, -30}, {44, 30}, {60, 0}, {84, 0}}, color = {0, 0, 0})}));
      end Spring;

      model BearingT
        import SI = Modelica.SIunits;
        parameter SI.TranslationalSpringConstant c(final min = 0, start = 1) = 7.6e8
          "轴承刚度";
        parameter SI.TranslationalDampingConstant d(final min = 0, start = 1) = 1000
          "阻尼系数";
        parameter SI.Mass m(min = 0, start = 1) = 0.2 "轴承质量";
        Modelica.Mechanics.Translational.Components.Mass mass(m = m)
          annotation (Placement(transformation(origin = {-20.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));



        Modelica.Mechanics.Translational.Interfaces.Flange_a flange_a "Left flange of translational component" 
          annotation (Placement(transformation(origin = {-70.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.Translational.Interfaces.Flange_b flange_b "Right flange of compliant 1-dim. translational component" 
          annotation (Placement(transformation(origin = {70.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.Translational.Components.SpringDamper springDamper(c = c, d = d)
          annotation (Placement(transformation(origin = {30.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
      equation 
        annotation (
          Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
            preserveAspectRatio = false, 
            grid = {2.0, 2.0}), graphics = {Ellipse(origin = {0.0, 0.0}, 
            fillColor = {175, 175, 175}, 
            fillPattern = FillPattern.Solid, 
            extent = {{-60.0, 60.0}, {60.0, -60.0}}), Ellipse(origin = {0.0, 0.0}, 
            fillColor = {255, 255, 255}, 
            fillPattern = FillPattern.Solid, 
            extent = {{-50.0, 50.0}, {50.0, -50.0}}), Ellipse(origin = {-2.0, 40.0}, 
            fillColor = {135, 135, 135}, 
            fillPattern = FillPattern.Sphere, 
            extent = {{-10.0, 10.0}, {10.0, -10.0}}), Ellipse(origin = {0.0, -40.0}, 
            fillColor = {135, 135, 135}, 
            fillPattern = FillPattern.Sphere, 
            extent = {{-10.0, 10.0}, {10.0, -10.0}}), Ellipse(origin = {34.0, -20.0}, 
            fillColor = {135, 135, 135}, 
            fillPattern = FillPattern.Sphere, 
            extent = {{-10.0, 10.0}, {10.0, -10.0}}), Ellipse(origin = {32.0, 24.0}, 
            fillColor = {135, 135, 135}, 
            fillPattern = FillPattern.Sphere, 
            extent = {{-10.0, 10.0}, {10.0, -10.0}}), Ellipse(origin = {-34.0, 20.0}, 
            fillColor = {135, 135, 135}, 
            fillPattern = FillPattern.Sphere, 
            extent = {{-10.0, 10.0}, {10.0, -10.0}}), Ellipse(origin = {-34.0, -22.0}, 
            fillColor = {135, 135, 135}, 
            fillPattern = FillPattern.Sphere, 
            extent = {{-10.0, 10.0}, {10.0, -10.0}}), Ellipse(origin = {0.0, 0.0}, 
            fillColor = {175, 175, 175}, 
            fillPattern = FillPattern.Solid, 
            extent = {{-30.0, 30.0}, {30.0, -30.0}}), Ellipse(origin = {0.0, 0.0}, 
            fillColor = {255, 255, 255}, 
            fillPattern = FillPattern.Solid, 
            extent = {{-20.0, 20.0}, {20.0, -20.0}})}), 
          Documentation(info = "<html>
<p>
The friction losses are considered by the equations
</p>
<pre>
   tau / tauRef = (+w / wRef) ^ power_w    for w &gt; +wLinear
 - tau / tauRef = (-w / wRef) ^ power_w    for w &lt; -wLinear
</pre>
<p>
with
</p>
<pre>
  tauRef * wRef = PRef
</pre>
<p>
being the friction torque at the referenc angular velocity
<code>wRef</code>. The exponent <code>power_w</code> is
approximately 1.5 for axial ventilation and approximately 2.0 for radial ventilation.
</p>
<p>
For stability reasons the friction torque <code>tau</code> is approximated by a linear curve
</p>
<pre>
  tau / tauLinear = w / wLinear
</pre>
<p>
with
</p>
<pre>
  tauLinear = tauRef*(wLinear/wRef) ^ power_w
</pre>
<p>
in the range <code> -wLinear &le; w &le; wLinear</code> with <code>wLinear = 0.001 * wRef</code>. The relationship of torque
and angular velocity is depicted in Fig. 1
</p>
<table border=0 cellspacing=0 cellpadding=1>
  <tr><td> <img src=\"modelica://Modelica/Resources/Images/Electrical/Machines/frictiontorque.png\"> </td>
  </tr>
  <tr><td> <b> Fig. 1: </b>Friction loss torque versus angular velocity for <code>power_w = 2</code></td>
  </tr>
</table>
<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Electrical.Machines.Losses.FrictionParameters\">FrictionParameters</a>
</p>
<p>
If it is desired to neglect friction losses, set <code>frictionParameters.PRef = 0</code> (this is the default).
</p>
</html>"));

        connect(mass.flange_a, flange_a)
          annotation (Line(origin = {-59.0, 0.0}, 
            points = {{29.0, 0.0}, {-30.0, 0.0}}, 
            color = {0, 127, 0}));
        connect(mass.flange_b, springDamper.flange_a)
          annotation (Line(origin = {5.0, 0.0}, 
            points = {{-15.0, 0.0}, {15.0, 0.0}}, 
            color = {0, 127, 0}));
        connect(springDamper.flange_b, flange_b)
          annotation (Line(origin = {55.0, 0.0}, 
            points = {{-15.0, 0.0}, {15.0, 0.0}}, 
            color = {0, 127, 0}));
      end BearingT;
      model Nut
        import SI = Modelica.SIunits;
        SI.TranslationalSpringConstant KN "螺母组件刚度";
        parameter SI.TranslationalSpringConstant Kn0 = 1.095e9
          "产品样本尺寸表中给的接触刚度";
        parameter SI.Mass m(min = 0, start = 1) = 4 "螺母组件质量";
        parameter Modelica.SIunits.Force Cn0 = 11180 "双螺母预紧方式额定动载荷";
        parameter SI.TranslationalDampingConstant d(final min = 0, start = 1) = 1000
          "阻尼系数";
        Modelica.Mechanics.Translational.Components.Mass mass(m = m)
          annotation (Placement(transformation(origin = {-20.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));



        Modelica.Mechanics.Translational.Interfaces.Flange_a flange_a "Left flange of translational component" 
          annotation (Placement(transformation(origin = {-70.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.Translational.Interfaces.Flange_b flange_b "Right flange of compliant 1-dim. translational component" 
          annotation (Placement(transformation(origin = {70.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));



        Modelica.Blocks.Interfaces.RealInput Fp
          annotation (Placement(transformation(origin = {0.9999999999999991, 53.0}, 
            extent = {{-13.0, -13.0}, {13.0, 13.0}}, 
            rotation = 270.0)));
        SpringDamper springDamper(d = d)
          annotation (Placement(transformation(origin = {30.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
      equation 
        springDamper.c = KN;
        if Fp == 0.1 * Cn0 then 
          KN = 0.8 * Kn0;
        else
          KN = 0.8 * Kn0 * (Fp / (0.1 * Cn0)) ^ (1 / 3);
        end if;
        annotation (
          Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
            preserveAspectRatio = false, 
            grid = {2.0, 2.0}), graphics = {Polygon(origin = {0.0, 0.0}, 
            fillColor = {255, 255, 255}, 
            points = {{-60.0, 0.0}, {-40.0, 40.0}, {40.0, 40.0}, {60.0, 0.0}, {40.0, -40.0}, {-40.0, -40.0}}), Ellipse(origin = {0.0, 0.0}, 
            fillColor = {255, 255, 255}, 
            extent = {{-40.0, 30.0}, {40.0, -30.0}})}), 
          Documentation(info = "<html>
<p>
The friction losses are considered by the equations
</p>
<pre>
   tau / tauRef = (+w / wRef) ^ power_w    for w &gt; +wLinear
 - tau / tauRef = (-w / wRef) ^ power_w    for w &lt; -wLinear
</pre>
<p>
with
</p>
<pre>
  tauRef * wRef = PRef
</pre>
<p>
being the friction torque at the referenc angular velocity
<code>wRef</code>. The exponent <code>power_w</code> is
approximately 1.5 for axial ventilation and approximately 2.0 for radial ventilation.
</p>
<p>
For stability reasons the friction torque <code>tau</code> is approximated by a linear curve
</p>
<pre>
  tau / tauLinear = w / wLinear
</pre>
<p>
with
</p>
<pre>
  tauLinear = tauRef*(wLinear/wRef) ^ power_w
</pre>
<p>
in the range <code> -wLinear &le; w &le; wLinear</code> with <code>wLinear = 0.001 * wRef</code>. The relationship of torque
and angular velocity is depicted in Fig. 1
</p>
<table border=0 cellspacing=0 cellpadding=1>
  <tr><td> <img src=\"modelica://Modelica/Resources/Images/Electrical/Machines/frictiontorque.png\"> </td>
  </tr>
  <tr><td> <b> Fig. 1: </b>Friction loss torque versus angular velocity for <code>power_w = 2</code></td>
  </tr>
</table>
<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Electrical.Machines.Losses.FrictionParameters\">FrictionParameters</a>
</p>
<p>
If it is desired to neglect friction losses, set <code>frictionParameters.PRef = 0</code> (this is the default).
</p>
</html>"));

        connect(mass.flange_a, flange_a)
          annotation (Line(origin = {-59.0, 0.0}, 
            points = {{29.0, 0.0}, {-30.0, 0.0}}, 
            color = {0, 127, 0}));
        connect(mass.flange_b, springDamper.flange_a)
          annotation (Line(origin = {5.0, 0.0}, 
            points = {{-15.0, 0.0}, {15.0, 0.0}}, 
            color = {0, 127, 0}));
        connect(flange_b, springDamper.flange_b)
          annotation (Line(origin = {55.0, 0.0}, 
            points = {{15.0, 0.0}, {-15.0, 0.0}}, 
            color = {0, 127, 0}));
      end Nut;
      model MassWithStopAndFriction
        "Sliding mass with hard stop and Stribeck friction"
        extends PartialFrictionWithStop;
        SI.Velocity v(start = 0, stateSelect = StateSelect.always)
          "Absolute velocity of flange_a and flange_b";
        SI.Acceleration a(start = 0)
          "Absolute acceleration of flange_a and flange_b";
        parameter Modelica.SIunits.Mass m(start = 1) "Mass";
        parameter Real F_prop(
          final unit = "N.s/m", 
          final min = 0, 
          start = 1) "Velocity dependent friction";
        parameter Modelica.SIunits.Force F_Coulomb(start = 5)
          "Constant friction: Coulomb force";
        parameter Modelica.SIunits.Force F_Stribeck(start = 10) "Stribeck effect";
        parameter Real fexp(
          final unit = "s/m", 
          final min = 0, 
          start = 2) "Exponential decay";
        extends Modelica.Thermal.HeatTransfer.Interfaces.PartialElementaryConditionalHeatPortWithoutT;

        Integer stopped;
        encapsulated partial model PartialFrictionWithStop
          "Base model of Coulomb friction elements with stop"

          import SI = Modelica.SIunits;
          import Modelica.Mechanics.Translational.Interfaces.PartialRigid;
          parameter SI.Position smax(start = 25)
            "Right stop for (right end of) sliding mass";
          parameter SI.Position smin(start = -25)
            "Left stop for (left end of) sliding mass";
          parameter SI.Velocity v_small = 1e-3
            "Relative velocity near to zero (see model info text)" 
            annotation (Dialog(tab = "Advanced"));
          // Equations to define the following variables have to be defined in subclasses
          SI.Velocity v_relfric "Relative velocity between frictional surfaces";
          SI.Acceleration a_relfric
            "Relative acceleration between frictional surfaces";
          SI.Force fs;
          SI.Force fp;
          SI.Force fc;
          SI.Force fz;
          SI.Force f
            "Friction force (positive, if directed in opposite direction of v_rel)";
          SI.Force f0 "Friction force for v=0 and forward sliding";
          SI.Force f0_max "Maximum friction force for v=0 and locked";
          Boolean free "true, if frictional element is not active";
          // Equations to define the following variables are given in this class
          Real sa(unit = "1")
            "Path parameter of friction characteristic f = f(a_relfric)";
          Boolean startForward(start = false, fixed = true)
            "= true, if v_rel=0 and start of forward sliding or v_rel > v_small";
          Boolean startBackward(start = false, fixed = true)
            "= true, if v_rel=0 and start of backward sliding or v_rel < -v_small";
          Boolean locked(start = false) "true, if v_rel=0 and not sliding";
          extends PartialRigid(s(start = 0, stateSelect = StateSelect.always));
          constant Integer Unknown = 3 "Value of mode is not known";
          constant Integer Free = 2 "Element is not active";
          constant Integer Forward = 1 "v_rel > 0 (forward sliding)";
          constant Integer Stuck = 0
            "v_rel = 0 (forward sliding, locked or backward sliding)";
          constant Integer Backward = -1 "v_rel < 0 (backward sliding)";
          Integer mode(
            final min = Backward, 
            final max = Unknown, 
            start = Unknown, 
            fixed = true);
        protected 
          constant SI.Acceleration unitAcceleration = 1 annotation (HideResult = true);
          constant SI.Force unitForce = 1 annotation (HideResult = true);
        equation 
          /* Friction characteristic
   (locked is introduced to help the Modelica translator determining
   the different structural configurations,
   if for each configuration special code shall be generated)
*/
          startForward = pre(mode) == Stuck and (sa > f0_max / unitForce and s < (
            smax - L / 2) or pre(startForward) and sa > f0 / unitForce and s < (smax - 
            L / 2)) or pre(mode) == Backward and v_relfric > v_small or initial() and 
            (v_relfric > 0);
          startBackward = pre(mode) == Stuck and (sa < -f0_max / unitForce and s > 
            (smin + L / 2) or pre(startBackward) and sa < -f0 / unitForce and s > (
            smin + L / 2)) or pre(mode) == Forward and v_relfric < -v_small or 
            initial() and (v_relfric < 0);
          locked = not free and not (pre(mode) == Forward or startForward or pre(
            mode) == Backward or startBackward);

          a_relfric / unitAcceleration = if locked then 0 else if free then sa else 
            if startForward then sa - f0_max / unitForce else if 
            startBackward then sa + f0_max / unitForce else if pre(mode) == Forward then 
            sa - f0_max / unitForce else sa + f0_max / unitForce;

          /* Friction torque has to be defined in a subclass. Example for a clutch:
   f = if locked then sa else
       if free then   0 else
       cgeo*fn*(if startForward then          Math.tempInterpol1( v_relfric, mue_pos, 2) else
                if startBackward then        -Math.tempInterpol1(-v_relfric, mue_pos, 2) else
                if pre(mode) == Forward then  Math.tempInterpol1( v_relfric, mue_pos, 2) else
                                             -Math.tempInterpol1(-v_relfric, mue_pos, 2));
*/
          // finite state machine to determine configuration
          mode = if free then Free else (if (pre(mode) == Forward or pre(mode) == 
            Free or startForward) and v_relfric > 0 and s < (smax - L / 2) then 
            Forward else if (pre(mode) == Backward or pre(mode) == Free or 
            startBackward) and v_relfric < 0 and s > (smin + L / 2) then Backward else 
            Stuck);
          annotation (Documentation(info = "<html>
<p>
Basic model for Coulomb friction that models the stuck phase in a reliable way.<br>
Additionally, a left and right stop are handled.
</p>
</html>"));
        end PartialFrictionWithStop;
        import SI = Modelica.SIunits;
      equation 
        // Constant auxiliary variables
        f0 = (F_Coulomb + F_Stribeck);
        f0_max = f0 * 1.001;
        free = f0 <= 0 and F_prop <= 0 and s > smin + L / 2 and s < smax - L / 2;
        // Velocity and acceleration of flanges
        v = der(s);
        a = der(v);
        v_relfric = v;
        a_relfric = a;
        fs = sign(v) * F_Stribeck * exp(-fexp * abs(v));
        fp = F_prop * v;
        fc = sign(v) * F_Coulomb;
        fz = fs + fp + fc;
        // Equilibrium of forces
        0 = flange_a.f + flange_b.f - f - m * der(v);
        // Friction force
        f = if locked then sa * unitForce else if free then 0 else (if startForward then 
          F_prop * v + F_Coulomb + F_Stribeck else if startBackward then 
          F_prop * v - F_Coulomb - F_Stribeck else if pre(mode) == Forward then 
          F_prop * v + F_Coulomb + F_Stribeck * exp(-fexp * abs(v)) else F_prop * v - 
          F_Coulomb - F_Stribeck * exp(-fexp * abs(v)));
        lossPower = f * v_relfric;
        when (initial()) then 
          assert(s > smin + L / 2 or s >= smin + L / 2 and v >= 0, 
            "Error in initialization of hard stop. (s - L/2) must be >= smin\n" + 
            "(s=" + String(s) + ", L=" + String(L) + ", smin=" + String(smin) + 
            ")");
          assert(s < smax - L / 2 or s <= smax - L / 2 and v <= 0, 
            "Error in initialization of hard stop. (s + L/2) must be <= smax\n" + 
            "(s=" + String(s) + ", L=" + String(L) + ", smax=" + String(smax) + 
            ")");
        end when;
        // Define events for hard stops and reinitialize the state variables velocity v and position s
        stopped = if s <= smin + L / 2 then -1 else if s >= smax - L / 2 then +1 else 
          0;
        when stopped <> 0 then 
          reinit(s, if stopped < 0 then smin + L / 2 else smax - L / 2);
          reinit(v, 0);
        end when;
        /*
Version 1:

  when not (s < smax - L/2) then
    reinit(s, smax - L/2);
    if (not initial() or v>0) then
      reinit(v, 0);
    end if;
  end when;

  when not (s > smin + L/2) then
    reinit(s, smin + L/2);
    if (not initial() or v<0) then
      reinit(v, 0);
    end if;
  end when;

Version 2:
        stopped := if s <= smin + L/2 then -1 else if s >= smax - L/2 then +1 else 0;
      when (initial()) then
        assert(s > smin + L/2 or s >= smin + L/2 and v >= 0,
          "Error in initialization of hard stop. (s - L/2) must be >= smin\n"+
          "(s=" + String(s) + ", L=" + String(L) + ", smin=" + String(smin) + ")");
        assert(s < smax - L/2 or s <= smax - L/2 and v <= 0,
          "Error in initialization of hard stop. (s + L/2) must be <= smax\n"+
          "(s=" + String(s) + ", L=" + String(L) + ", smax=" + String(smax) + ")");
      end when;
      when stopped <> 0 then
        reinit(s, if stopped < 0 then smin + L/2 else smax - L/2);
        if (not initial() or stopped*v>0) then
           reinit(v, 0);
        end if;
      end when;
*/
        annotation (
          Documentation(info = "<html>
<p>This element describes the <i>Stribeck friction characteristics</i> of a sliding mass,
i. e. the frictional force acting between the sliding mass and the support. Included is a
<i>hard stop</i> for the position. </p>
<p>
The surface is fixed and there is friction between sliding mass and surface.
The frictional force f is given for positive velocity v by:
</p>
<blockquote><pre>
f = F_Coulomb + F_prop * v + F_Stribeck * exp (-fexp * v)
</pre></blockquote>

<p>
<IMG src=\"modelica://Modelica/Resources/Images/Mechanics/Translational/Stribeck.png\">
</p>

<p>
The distance between the left and the right connector is given by parameter L.
The position of the center of gravity, coordinate s, is in the middle between
the two flanges.</p>
<p>
There are hard stops at smax and smin, i. e. if
<i><code>flange_a.s &gt;= smin</code></i> and <i><code>flange_b.s &lt;= xmax </code></i> the sliding mass can move freely.</p>
<p>When the absolute velocity becomes zero, the sliding mass becomes stuck, i.e., the absolute position remains constant. In this phase the
friction force is calculated from a force balance due to the requirement that the
absolute acceleration shall be zero. The elements begin to slide when the friction
force exceeds a threshold value, called the maximum static friction force, computed via:</p>
<blockquote><pre>
   maximum_static_friction =  F_Coulomb + F_Stribeck
</pre></blockquote>
<p>
<font color=\"#ff0000\"> <b>This requires the states Stop.s and Stop.v</b> </font>. If these states are eliminated during the index reduction
the model will not work. To avoid this any inertias should be connected via springs
to the Stop element, other sliding masses, dampers or hydraulic chambers must be avoided.</p>
<p>For more details of the used friction model see the following reference: </p>

<dl>
<dt>Beater P. (1999):</dt>
<dd><a href=\"http://www.springer.de/cgi-bin/search_book.pl?isbn=3-540-65444-5\">
Entwurf hydraulischer Maschinen</a>. Springer Verlag Berlin Heidelberg New York.</dd>
</dl>

<P>The friction model is implemented in a \"clean\" way by state events and leads to
continuous/discrete systems of equations which have to be solved by appropriate
numerical methods. The method is described in: </P>

<dl>
<dt>Otter M., Elmqvist H., and Mattsson S.E. (1999):</dt>
<dd><i>Hybrid Modeling in Modelica based on the Synchronous Data Flow Principle</i>.
    CACSD'99, Aug. 22.-26, Hawaii. </dd>
</dl>

<P>More precise friction models take into account the elasticity of the material when
the two elements are \"stuck\", as well as other effects, like hysteresis. This has
the advantage that the friction element can be completely described by a differential
equation without events. The drawback is that the system becomes stiff (about 10-20 times
slower simulation) and that more material constants have to be supplied which requires more
sophisticated identification. For more details, see the following references, especially
(Armstrong and Canudas de Witt 1996): </P>
<dl>
<dt>
Armstrong B. (1991):</dt>
<DD><i>Control of Machines with Friction</i>. Kluwer Academic Press, Boston MA.<BR>
</DD>
<DT>Armstrong B., and Canudas de Wit C. (1996): </DT>
<DD><i>Friction Modeling and Compensation.</i> The Control Handbook, edited by W.S.Levine, CRC Press, pp. 1369-1382.<BR>
</DD>
<DT>Canudas de Wit C., Olsson H., Astroem K.J., and Lischinsky P. (1995): </DT>
<DD>A<i> new model for control of systems with friction.</i> IEEE Transactions on Automatic Control, Vol. 40, No. 3, pp. 419-425.<BR>
</DD>
</DL>

<h4>Optional heatPort</h4>
<p>
The dissipated energy is transported in form of heat to the optional heatPort connector
that can be enabled via parameter \"useHeatPort\". Independently whether the heatPort is
or is not enabled, the dissipated power is defined with variable \"lossPower\".
If contact occurs at the hard stops, the lossPower is not correctly modelled
at this time instant, because the hard stop would introduce a Dirac impulse
in the lossPower due to the discontinuously changing kinetic energy of the mass
(lossPower is the derivative of the kinetic energy at the time instant of the impact).
</p>

</html>", revisions = "<html>
<h4>Release Notes:</h4>
<ul>
<li><i>First Version from December 7, 1999 by P. Beater (based on Rotational.BearingFriction)</i> </li>
<li><i>July 14, 2001 by P. Beater, assert on initialization added, diagram modified </i> </li>
<li><i>October 11, 2001, by Hans Olsson, Dassault Syst&egrave;mes AB, modified assert to handle start at stops,
modified event logic such if you have friction parameters equal to zero you do not get events
between the stops.</i> </li>
<li><i>June 10, 2002 by P. Beater, StateSelect.always for variables s and v (instead of fixed=true). </i> </li>
</ul>
</html>"), 
          Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {
            100, 100}}), graphics = {Polygon(
            points = {{80, -100}, {50, -90}, {50, -110}, {80, -100}}, 
            lineColor = {128, 128, 128}, 
            fillColor = {128, 128, 128}, 
            fillPattern = FillPattern.Solid), Line(points = {{-30, -100}, {50, -100}}, 
            color = {0, 0, 0}), Rectangle(
            extent = {{-30, 30}, {35, -35}}, 
            lineColor = {0, 0, 0}, 
            fillPattern = FillPattern.Sphere, 
            fillColor = {255, 255, 255}), Line(points = {{-90, 0}, {-30, 0}}, color = 
            {0, 127, 0}), Rectangle(
            extent = {{-70, -45}, {74, -60}}, 
            lineColor = {0, 0, 0}, 
            fillColor = {192, 192, 192}, 
            fillPattern = FillPattern.Solid), Rectangle(
            extent = {{-63, -15}, {-55, -45}}, 
            lineColor = {0, 0, 0}, 
            fillColor = {0, 0, 0}, 
            fillPattern = FillPattern.Solid), Rectangle(
            extent = {{60, -16}, {69, -45}}, 
            lineColor = {0, 0, 0}, 
            fillColor = {0, 0, 0}, 
            fillPattern = FillPattern.Solid), Line(points = {{35, 0}, {90, 0}}, 
            color = {0, 127, 0}), Text(
            extent = {{-150, 80}, {150, 40}}, 
            textString = "%name", 
            lineColor = {0, 0, 255}), Line(points = {{-50, -90}, {-30, -70}}, color = 
            {0, 0, 0}), Line(points = {{-30, -70}, {30, -70}}, color = {0, 0, 0}), Line(
            points = {{-30, -90}, {-10, -70}}, color = {0, 0, 0}), Line(points = {{-10, -90}, 
            {10, -70}}, color = {0, 0, 0}), Line(points = {{10, -90}, {30, -70}}, color = 
            {0, 0, 0}), Text(
            extent = {{-150, -110}, {150, -140}}, 
            lineColor = {0, 0, 0}, 
            textString = "m=%m"), Line(
            visible = useHeatPort, 
            points = {{-100, -100}, {-100, -40}, {3, -40}}, 
            color = {191, 0, 0}, 
            pattern = LinePattern.Dot, 
            smooth = Smooth.None)}), 
          Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, 
            {100, 100}}), graphics = {Polygon(
            points = {{50, -75}, {20, -65}, {20, -85}, {50, -75}}, 
            lineColor = {128, 128, 128}, 
            fillColor = {128, 128, 128}, 
            fillPattern = FillPattern.Solid), Line(points = {{-60, -75}, {20, -75}}, 
            color = {0, 0, 0}), Rectangle(
            extent = {{-30, 26}, {35, -9}}, 
            lineColor = {0, 0, 0}, 
            fillPattern = FillPattern.Sphere, 
            fillColor = {255, 255, 255}), Line(points = {{-90, 0}, {-30, 0}}, color = 
            {0, 127, 0}), Line(points = {{35, 0}, {90, 0}}, color = {0, 127, 0}), 
            Rectangle(
            extent = {{-68, -14}, {76, -29}}, 
            lineColor = {0, 0, 0}, 
            fillColor = {192, 192, 192}, 
            fillPattern = FillPattern.Solid), Rectangle(
            extent = {{-119, 43}, {-111, 17}}, 
            lineColor = {0, 0, 0}, 
            fillColor = {0, 0, 0}, 
            fillPattern = FillPattern.Solid), Line(
            points = {{-111, 43}, {-111, 50}}, 
            color = {0, 0, 0}, 
            pattern = LinePattern.Solid, 
            thickness = 0.25, 
            arrow = {Arrow.None, Arrow.None}), Line(
            points = {{-151, 49}, {-113, 49}}, 
            color = {0, 0, 0}, 
            pattern = LinePattern.Solid, 
            thickness = 0.25, 
            arrow = {Arrow.None, Arrow.None}), Text(
            extent = {{-149, 51}, {-126, 60}}, 
            textString = "s min", 
            lineColor = {0, 0, 255}), Polygon(
            points = {{-121, 52}, {-111, 49}, {-121, 46}, {-121, 52}}, 
            lineColor = {0, 0, 0}, 
            fillColor = {0, 0, 0}, 
            fillPattern = FillPattern.Solid), Rectangle(
            extent = {{124, 42}, {132, 17}}, 
            lineColor = {0, 0, 0}, 
            fillColor = {0, 0, 0}, 
            fillPattern = FillPattern.Solid), Line(
            points = {{124, 39}, {124, 87}}, 
            color = {0, 0, 0}, 
            pattern = LinePattern.Solid, 
            thickness = 0.25, 
            arrow = {Arrow.None, Arrow.None}), Line(
            points = {{-19, 78}, {121, 78}}, 
            color = {0, 0, 0}, 
            pattern = LinePattern.Solid, 
            thickness = 0.25, 
            arrow = {Arrow.None, Arrow.None}), Text(
            extent = {{-17, 83}, {6, 92}}, 
            textString = "s max", 
            lineColor = {0, 0, 255}), Polygon(
            points = {{114, 81}, {124, 78}, {114, 75}, {114, 81}}, 
            lineColor = {0, 0, 0}, 
            fillColor = {0, 0, 0}, 
            fillPattern = FillPattern.Solid), Line(
            points = {{5, 26}, {5, 63}}, 
            color = {0, 0, 0}, 
            pattern = LinePattern.Solid, 
            thickness = 0.25, 
            arrow = {Arrow.None, Arrow.None}), Line(
            points = {{-77, 58}, {-1, 58}}, 
            color = {0, 0, 0}, 
            pattern = LinePattern.Solid, 
            thickness = 0.25, 
            arrow = {Arrow.None, Arrow.None}), Text(
            extent = {{-75, 60}, {-38, 71}}, 
            textString = "Position s", 
            lineColor = {0, 0, 255}), Polygon(
            points = {{-5, 61}, {5, 58}, {-5, 55}, {-5, 61}}, 
            lineColor = {0, 0, 0}, 
            fillColor = {0, 0, 0}, 
            fillPattern = FillPattern.Solid), Line(points = {{-100, -10}, {-100, 
            -60}}, color = {0, 0, 0}), Line(points = {{100, -10}, {100, -60}}, color = {0, 
            0, 0}), Polygon(
            points = {{90, -47}, {100, -50}, {90, -53}, {90, -47}}, 
            lineColor = {0, 0, 0}, 
            fillColor = {0, 0, 0}, 
            fillPattern = FillPattern.Solid), Polygon(
            points = {{-90, -47}, {-90, -53}, {-100, -50}, {-90, -47}}, 
            lineColor = {0, 0, 0}, 
            fillColor = {0, 0, 0}, 
            fillPattern = FillPattern.Solid), Line(points = {{-90, -50}, {92, -50}}, 
            color = {0, 0, 0}), Text(
            extent = {{-11, -46}, {26, -36}}, 
            textString = "Length L", 
            lineColor = {0, 0, 255})}));
      end MassWithStopAndFriction;
      model ComputS
        Real y0;
        parameter Real u_max = 0.876;
        parameter Modelica.SIunits.Distance s_initial = 0.5
          annotation (Diagram(coordinateSystem(extent = {{-140.0, -100.0}, {140.0, 100.0}}, 
            preserveAspectRatio = false, 
            grid = {2.0, 2.0})), 
            Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
              preserveAspectRatio = false, 
              grid = {2.0, 2.0})));
        Modelica.Blocks.Interfaces.RealInput u
          annotation (Placement(transformation(origin = {-104.0, -1.7763568394002505e-15}, 
            extent = {{-12.0, -12.0}, {12.0, 12.0}})));
        Modelica.Blocks.Interfaces.RealOutput y
          annotation (Placement(transformation(origin = {102.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Blocks.Nonlinear.Limiter limiter(uMin = 0, uMax = u_max)
          annotation (Placement(transformation(origin = {-10.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        annotation (Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
          grid = {2.0, 2.0}), graphics = {Rectangle(origin = {0.0, 10.0}, 
          fillColor = {255, 255, 255}, 
          extent = {{-100.0, 90.0}, {100.0, -90.0}})}));
      equation 
        y0 = u + 0.438;
        limiter.u = y0;
        connect(y, limiter.y)
          annotation (Line(origin = {52.0, 0.0}, 
            points = {{50.0, 0.0}, {-51.0, 0.0}}, 
            color = {0, 0, 127}));
      end ComputS;
      model BallScrew3 "滚珠丝杠模型"
        import SI = Modelica.SIunits;
        import Modelica.Constants.pi;
        Modelica.SIunits.Length x;
        parameter SI.TranslationalDampingConstant d(final min = 0, start = 1) = 10
          "Damping constant";
        parameter SI.Inertia J = pi * rou * Ls * (ds ^ 4) / 32 "丝杠转动惯量";//0.001824
        parameter Modelica.SIunits.Area As = 
          pi * ((ds ^ 2) - (d0 ^ 2)) / 4 "丝杠的截面积";
        constant Real E = 2.1e11 "丝杠材料的弹性模量，对于钢材E=2.1e5MPa";
        parameter Modelica.SIunits.Length Lsg = 1.37 "两双推轴承之间的距离" 
          annotation (Dialog(tab = "几何尺寸"));
        parameter Modelica.SIunits.Height ds = 0.04 "丝杠的直径" 
          annotation (Dialog(tab = "几何尺寸"));
        parameter Modelica.SIunits.Height d0 = 0.012 "丝杠孔内径" 
          annotation (Dialog(tab = "几何尺寸"));
        parameter Modelica.SIunits.Length Ls = 0.925 "丝杠螺纹长度" 
          annotation (Dialog(tab = "几何尺寸"));
        parameter Modelica.SIunits.Density rou = 7850 "丝杠的密度，材料为钢";
        Real Ksa "丝杠的轴向刚度";
        annotation (Diagram(coordinateSystem(extent = {{-140.0, -100.0}, {140.0, 100.0}}, 
          preserveAspectRatio = false, 
          grid = {2.0, 2.0})), 
          Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
            preserveAspectRatio = false, 
            grid = {2.0, 2.0}), graphics = {Rectangle(origin = {0.0, 0.0}, 
            fillColor = {177, 177, 177}, 
            fillPattern = FillPattern.Solid, 
            extent = {{-100.0, 40.0}, {100.0, -40.0}}), Line(origin = {-70.0, 0.0}, 
            points = {{10.0, 40.0}, {-10.0, -40.0}}, 
            thickness = 1.0), Line(origin = {-30.0, 0.0}, 
            points = {{10.0, 40.0}, {-10.0, -40.0}}, 
            thickness = 1.0), Line(origin = {10.0, 0.0}, 
            points = {{10.0, 40.0}, {-10.0, -40.0}}, 
            thickness = 1.0), Line(origin = {50.0, 0.0}, 
            points = {{10.0, 40.0}, {-10.0, -40.0}}, 
            thickness = 1.0), Line(origin = {90.0, 0.0}, 
            points = {{10.0, 40.0}, {-10.0, -40.0}}, 
            thickness = 1.0)}));
        Modelica.Mechanics.Translational.Components.Mass mass
          annotation (Placement(transformation(origin = {-50.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));


        Modelica.Mechanics.Translational.Interfaces.Flange_a flange_a "Left flange of translational component" 
          annotation (Placement(transformation(origin = {-110.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.Translational.Interfaces.Flange_b flange_b "Right flange of compliant 1-dim. translational component" 
          annotation (Placement(transformation(origin = {110.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        SpringDamper springDamper(d = d)
          annotation (Placement(transformation(origin = {30.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
      equation 
        x = 0.5;
        Ksa = As * E * Lsg / x * (Lsg - x);
        springDamper.c = Ksa;
        connect(mass.flange_a, flange_a)
          annotation (Line(origin = {-99.0, 0.0}, 
            points = {{39.0, 0.0}, {-39.0, 0.0}}, 
            color = {0, 127, 0}));
        connect(springDamper.flange_a, mass.flange_b)
          annotation (Line(origin = {-10.0, 0.0}, 
            points = {{30.0, 0.0}, {-30.0, 0.0}}, 
            color = {0, 127, 0}));
        connect(springDamper.flange_b, flange_b)
          annotation (Line(origin = {75.0, 0.0}, 
            points = {{-35.0, 0.0}, {35.0, 0.0}}, 
            color = {0, 127, 0}));
      end BallScrew3;

      model BallScrewNut5
        import SI = Modelica.SIunits;
        parameter Real eta = 1 "效率";
        parameter SI.Length P(displayUnit = "mm") = 0.016 "丝杠节距";
        parameter SI.RotationalSpringConstant c(final min = Modelica.Constants.small, 
          start = 1.0e5) = 
          1e6


          "接触刚度";
        parameter SI.RotationalDampingConstant d(final min = 0, start = 0) = 1000
          "接触阻尼";
        parameter SI.Angle b(final min = 0) = 0.00872664625997165 "反向间隙";
        parameter Modelica.SIunits.Torque Tf = 0.15 "丝杠螺母副摩擦力矩";
        Modelica.Mechanics.Rotational.Components.IdealGearR2T idealGearR2T(ratio = 2 * Modelica.Constants.pi / P, useSupportR = false, useSupportT = true) annotation (Placement(transformation(extent = {{20, -10}, {40, 10}})));


        Modelica.Mechanics.Translational.Interfaces.Flange_b flangeT
          "(right) driven flange (flange axis directed out of cut plane)" annotation (Placement(transformation(extent = {{90, -10}, {110, 10}}), iconTransformation(extent = {{90, -10}, {110, 10}})));
        Modelica.Mechanics.Rotational.Interfaces.Flange_a flangeR
          "Left flange of shaft" annotation (Placement(transformation(extent = {{-114, -10}, {-94, 10}})));
        Modelica.Mechanics.Rotational.Components.ElastoBacklash elastoBacklash(b = b, d = d, c = c, 
          phi_rel(start
             = -b / 2))
          annotation (Placement(transformation(origin = {-20.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.Translational.Interfaces.Support supportT "Translational support/housing of component" 
          annotation (Placement(transformation(origin = {-100.0, -60.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        EfficiencyFactor efficiencyFactor(eta = eta)
          annotation (Placement(transformation(origin = {-70.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Bearing2 bearing2_1(f = Tf)
          annotation (Placement(transformation(origin = {12.0, -30.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.Rotational.Components.Fixed fixed
          annotation (Placement(transformation(origin = {-48.0, -48.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
      equation 
        annotation (Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-60, 26}, {60, 20}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}, 
          fillPattern = FillPattern.Solid), Rectangle(extent = {{-100, 20}, {80, -20}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}, 
          fillPattern = FillPattern.Solid), Line(points = {{-60, 0}, {60, 0}, {60, 0}}, color = {0, 0, 0}), Line(points = {{-60, 20}, {-40, -20}}, color = {0, 0, 0}), Line(points = {{-40, 20}, {-20, -20}}, color = {0, 0, 0}), Line(points = {{-20, 20}, {0, -20}}, color = {0, 0, 0}), Line(points = {{0, 20}, {20, -20}}, color = {0, 0, 0}), Line(points = {{20, 20}, {40, -20}}, color = {0, 0, 0}), Line(points = {{40, 20}, {60, -20}}, color = {0, 0, 0}), Rectangle(extent = {{-60, 0}, {60, -26}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}, 
          fillPattern = FillPattern.Solid), Rectangle(extent = {{-40, 40}, {-20, -40}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}, 
          fillPattern = FillPattern.Solid), Line(points = {{-60, 0}, {-100, 0}, {-102, 0}}, color = {0, 0, 0}), Line(points = {{-60, 20}, {-60, 0}}, color = {0, 0, 0}), Line(points = {{60, 20}, {60, 0}}, color = {0, 0, 0}), Line(points = {{-80, 20}, {-60, -20}}, color = {0, 0, 0}), Line(points = {{-100, 20}, {-80, -20}}, color = {0, 0, 0}), Line(points = {{60, 20}, {80, -20}}, color = {0, 0, 0}), Line(points = {{60, 26}, {60, 26}, {100, 26}, {100, 0}}, color = {0, 0, 0}), Line(points = {{-100, -50}, {-74, -50}, {-74, -20}}, color = {0, 0, 0}), Text(extent = {{-150, 100}, {150, 60}}, lineColor = {0, 0, 255}, textString = "%name")}));
        connect(elastoBacklash.flange_b, idealGearR2T.flangeR)
          annotation (Line(origin = {5.0, 0.0}, 
            points = {{-15.0, 0.0}, {15.0, 0.0}}));
        connect(idealGearR2T.supportT, supportT)
          annotation (Line(origin = {-30.0, -35.0}, 
            points = {{70.0, 25.0}, {70.0, -25.0}, {-70.0, -25.0}}, 
            color = {0, 127, 0}));
        connect(efficiencyFactor.flange_a, flangeR)
          annotation (Line(origin = {-92.0, 0.0}, 
            points = {{12.0, 0.0}, {-12.0, 0.0}}));
        connect(efficiencyFactor.flange_b, elastoBacklash.flange_a)
          annotation (Line(origin = {-45.0, 0.0}, 
            points = {{-15.0, 0.0}, {15.0, 0.0}}));
        connect(bearing2_1.flange, elastoBacklash.flange_b)
          annotation (Line(origin = {-1.0, -11.0}, 
            points = {{13.0, -9.0}, {13.0, 11.0}, {-9.0, 11.0}}));
        connect(bearing2_1.support, fixed.flange)
          annotation (Line(origin = {-18.0, -44.0}, 
            points = {{30.0, 4.0}, {30.0, -4.0}, {-30.0, -4.0}}));
        connect(idealGearR2T.flangeT, flangeT)
          annotation (Line(origin = {70.0, 0.0}, 
            points = {{-30.0, 0.0}, {30.0, 0.0}}, 
            color = {0, 127, 0}));
      end BallScrewNut5;

      model SpringDamper "Linear 1D translational spring and damper in parallel"
        extends Modelica.Mechanics.Translational.Interfaces.PartialCompliantWithRelativeStates;
        SI.TranslationalSpringConstant c(final min = 0, start = 1)
          "Spring constant";
        parameter SI.TranslationalDampingConstant d(final min = 0, start = 1)
          "Damping constant";
        parameter SI.Position s_rel0 = 0 "Unstretched spring length";
        extends Modelica.Thermal.HeatTransfer.Interfaces.PartialElementaryConditionalHeatPortWithoutT;
      protected 
        Modelica.SIunits.Force f_c "Spring force";
        Modelica.SIunits.Force f_d "Damping force";
        import SI = Modelica.SIunits;
      equation 
        f_c = c * (s_rel - s_rel0);
        f_d = d * v_rel;
        f = f_c + f_d;
        lossPower = f_d * v_rel;
        annotation (
          Documentation(info = "<html>
<p>
A <i>spring and damper element connected in parallel</i>.
The component can be
connected either between two sliding masses to describe the elasticity
and damping, or between a sliding mass and the housing (model Fixed),
to describe a coupling of the sliding mass with the housing via a spring/damper.
</p>
</html>"), 
          Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {
            100, 100}}), graphics = {
            Line(points = {{-80, 40}, {-60, 40}, {-45, 10}, {-15, 70}, {15, 10}, {45, 70}, {
            60, 40}, {80, 40}}, color = {0, 0, 0}), 
            Line(points = {{-80, 40}, {-80, -70}}, color = {0, 0, 0}), 
            Line(points = {{-80, -70}, {-52, -70}}, color = {0, 0, 0}), 
            Rectangle(
            extent = {{-52, -49}, {38, -91}}, 
            lineColor = {0, 0, 0}, 
            fillColor = {192, 192, 192}, 
            fillPattern = FillPattern.Solid), 
            Line(points = {{-52, -49}, {68, -49}}, color = {0, 0, 0}), 
            Line(points = {{-51, -91}, {69, -91}}, color = {0, 0, 0}), 
            Line(points = {{38, -70}, {80, -70}}, color = {0, 0, 0}), 
            Line(points = {{80, 40}, {80, -70}}, color = {0, 0, 0}), 
            Line(points = {{-90, 0}, {-80, 0}}, color = {0, 0, 0}), 
            Line(points = {{80, 0}, {90, 0}}, color = {0, 0, 0}), 
            Polygon(
            points = {{53, -18}, {23, -8}, {23, -28}, {53, -18}}, 
            lineColor = {128, 128, 128}, 
            fillColor = {128, 128, 128}, 
            fillPattern = FillPattern.Solid), 
            Line(points = {{-57, -18}, {23, -18}}, color = {0, 0, 0}), 
            Text(
            extent = {{-150, 120}, {150, 80}}, 
            textString = "%name", 
            lineColor = {0, 0, 255}), 
            Text(
            extent = {{-150, -135}, {150, -165}}, 
            lineColor = {0, 0, 0}, 
            textString = "d=%d"), 
            Text(
            extent = {{-150, -100}, {150, -130}}, 
            lineColor = {0, 0, 0}, 
            textString = "c=%c"), 
            Line(
            visible = useHeatPort, 
            points = {{-100, -100}, {-100, -80}, {-5, -80}}, 
            color = {191, 0, 0}, 
            pattern = LinePattern.Dot, 
            smooth = Smooth.None)}), 
          Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, 
            {100, 100}}), graphics = {Line(
            points = {{-80, 32}, {-58, 32}, {-43, 2}, {-13, 62}, {17, 2}, {47, 62}, {62, 
            32}, {80, 32}}, 
            color = {0, 0, 0}, 
            thickness = 0.5), Line(points = {{-100, 31}, {-100, 96}}, color = {128, 
            128, 128}), Line(points = {{100, 29}, {100, 94}}, color = {128, 128, 128}), 
            Line(points = {{-98, 82}, {100, 82}}, color = {128, 128, 128}), Polygon(
            points = {{90, 85}, {100, 82}, {90, 79}, {90, 85}}, 
            lineColor = {128, 128, 128}, 
            fillColor = {128, 128, 128}, 
            fillPattern = FillPattern.Solid), Text(
            extent = {{-63, 83}, {46, 103}}, 
            lineColor = {0, 0, 255}, 
            textString = "s_rel"), Rectangle(
            extent = {{-52, -28}, {38, -72}}, 
            lineColor = {0, 0, 0}, 
            fillColor = {192, 192, 192}, 
            fillPattern = FillPattern.Solid), Line(points = {{-51, -72}, {69, -72}}, 
            color = {0, 0, 0}), Line(points = {{-52, -28}, {68, -28}}, color = {0, 0, 0}), 
            Line(points = {{38, -50}, {80, -50}}, color = {0, 0, 0}), Line(points = {{-80, 
            -50}, {-52, -50}}, color = {0, 0, 0}), Line(points = {{-80, 32}, {-80, -50}}, 
            color = {0, 0, 0}), Line(points = {{80, 32}, {80, -50}}, color = {0, 0, 0}), 
            Line(points = {{-90, 0}, {-80, 0}}, color = {0, 0, 0}), Line(points = {{90, 0}, 
            {80, 0}}, color = {0, 0, 0})}));
      end SpringDamper;

      model Friction
        Real f;
        parameter Real v_ref = 0.0001;
        parameter Real F_prop(
          final unit = "N.s/m", 
          final min = 0, 
          start = 1) = 0.2 "Velocity dependent friction";
        parameter Modelica.SIunits.Force F_Coulomb(start = 5) = 500
          "Constant friction: Coulomb force";
        parameter Modelica.SIunits.Force F_Stribeck(start = 10) = 800 "Stribeck effect";
        parameter Real fexp(
          final unit = "s/m", 
          final min = 0, 
          start = 2) = 200 "Exponential decay";
        import Modelica.Constants.pi;
        import g = Modelica.Constants.g_n;
        annotation (Diagram(coordinateSystem(extent = {{-140.0, -100.0}, {140.0, 100.0}}, 
          preserveAspectRatio = false, 
          grid = {2.0, 2.0})), 
          Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
            preserveAspectRatio = false, 
            grid = {2.0, 2.0}), graphics = {Rectangle(origin = {0.0, 0.0}, 
            fillColor = {255, 255, 255}, 
            extent = {{-100.0, 100.0}, {100.0, -100.0}})}));
        Modelica.Blocks.Interfaces.RealInput v
          annotation (Placement(transformation(origin = {-95.0, -0.9999999999999982}, 
            extent = {{-15.0, -15.0}, {15.0, 15.0}})));
        Modelica.Blocks.Interfaces.RealOutput y[3]
          annotation (Placement(transformation(origin = {102.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
      equation 
        f = (F_prop * abs(v) + F_Coulomb + F_Stribeck * exp(-fexp * abs(v))) * (-2 / pi) * arctan(v / v_ref);
        y = {f, 0, 0};
      end Friction;
    end Components;
    package SubSystem
      annotation (Diagram(coordinateSystem(extent = {{-140.0, -100.0}, {140.0, 100.0}}, 
        preserveAspectRatio = false, 
        grid = {2.0, 2.0})), 
        Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
          preserveAspectRatio = false, 
          grid = {2.0, 2.0})));
      model BGXY
        annotation (Diagram(coordinateSystem(extent = {{-140.0, -100.0}, {140.0, 100.0}}, 
          preserveAspectRatio = false, 
          grid = {2.0, 2.0})), 
          Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
            preserveAspectRatio = false, 
            grid = {2.0, 2.0})));
        inner Modelica.Mechanics.MultiBody.World world(n = {0, 1, 0})
          annotation (Placement(transformation(origin = {-122.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape(shapeType = "1", lengthDirection = {1, 0, 0}, length = 0.001, width = 0.001, extra = 1, r = {-0.196, 0, 0})
          annotation (Placement(transformation(origin = {-80.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.MultiBody.Joints.Revolute revolute(n = {1, 0, 0})
          annotation (Placement(transformation(origin = {-50.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape1(shapeType = "2", lengthDirection = {-1, 0, 0}, length = 0.001, width = 0.001, extra = 1, 
          r = {0.3, 0, 0}) annotation (Placement(transformation(origin = {-14.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape2(shapeType = "3", lengthDirection = {-1, 0, 0}, length = 0.001, width = 0.001, extra = 1, 
          r = {-1.21, 0, 0}) annotation (Placement(transformation(origin = {34.0, 36.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedTranslation(r = {-0.565, 0.25, 0.328}, n = {0, -1, 0}, angle = 270) annotation (Placement(transformation(origin = {14.0, 50.0}, 
          extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape3(shapeType = "4", lengthDirection = {1, 0, 0}, length = 0.001, width = 0.001, extra = 1)
          annotation (Placement(transformation(origin = {70.0, 36.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape4(shapeType = "5", lengthDirection = {1, 0, 0}, length = 0.001, width = 0.001, extra = 1, 
          widthDirection = {0, -1, 0}) annotation (Placement(transformation(origin = {110.0, 36.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedFrame(color_x = {255, 0, 0}, color_y = {85, 170, 0}, color_z = {0, 0, 255})
          annotation (Placement(transformation(origin = {110.0, 70.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
      equation 
        connect(bodyShape.frame_a, world.frame_b)
          annotation (Line(origin = {-90.0, 0.0}, 
            points = {{0.0, 0.0}, {-22.0, 0.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(bodyShape.frame_b, revolute.frame_a)
          annotation (Line(origin = {-65.0, 0.0}, 
            points = {{-5.0, 0.0}, {5.0, 0.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(revolute.frame_b, bodyShape1.frame_a)
          annotation (Line(origin = {-32.0, 0.0}, 
            points = {{-8.0, 0.0}, {8.0, 0.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(bodyShape2.frame_a, fixedTranslation.frame_a)
          annotation (Line(origin = {22.0, 42.0}, 
            points = {{2.0, -6.0}, {-20.0, -6.0}, {-20.0, 8.0}, {-18.0, 8.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(fixedTranslation.frame_b, bodyShape1.frame_b)
          annotation (Line(origin = {-3.0, 35.0}, 
            points = {{27.0, 15.0}, {27.0, 35.0}, {-27.0, 35.0}, {-27.0, -25.0}, {-1.0, -25.0}, {-1.0, -35.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(bodyShape3.frame_a, bodyShape2.frame_b)
          annotation (Line(origin = {52.0, 36.0}, 
            points = {{8.0, 0.0}, {-8.0, 0.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(bodyShape4.frame_a, bodyShape3.frame_b)
          annotation (Line(origin = {90.0, 36.0}, 
            points = {{10.0, 0.0}, {-10.0, 0.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(fixedFrame.frame_a, bodyShape3.frame_b)
          annotation (Line(origin = {90.0, 53.0}, 
            points = {{10.0, 17.0}, {-10.0, 17.0}, {-10.0, -17.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
      end BGXY;

      model BGXY2
        annotation (Diagram(coordinateSystem(extent = {{-140.0, -100.0}, {140.0, 100.0}}, 
          preserveAspectRatio = false, 
          grid = {2.0, 2.0})), 
          Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
            preserveAspectRatio = false, 
            grid = {2.0, 2.0})), 
          experiment(StartTime = 0, StopTime = 5, NumberOfIntervals = 500, Algorithm = "Dassl", Tolerance = 0.0001, DoublePrecision = true, StoreEventValue = true));
        inner Modelica.Mechanics.MultiBody.World world(n = {0, 1, 0})
          annotation (Placement(transformation(origin = {-122.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape(shapeType = "1", lengthDirection = {1, 0, 0}, length = 0.001, width = 0.001, extra = 1, r = {-0.196, 0, 0})
          annotation (Placement(transformation(origin = {-80.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.MultiBody.Joints.Revolute revolute(n = {1, 0, 0}, useAxisFlange = true)
          annotation (Placement(transformation(origin = {-50.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape1(shapeType = "2", lengthDirection = {-1, 0, 0}, length = 0.001, width = 0.001, extra = 1, 
          r = {0.3, 0, 0}, 
          m = 10.058, r_CM = {0.55273949, 0, 0}, I_11 = 0.0019053575, I_22 = 0.91339, I_33 = 0.91339)
          annotation (Placement(transformation(origin = {-14.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));



        Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic(useAxisFlange = true)
          annotation (Placement(transformation(origin = {-20.0, 30.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape2(shapeType = "3", lengthDirection = {-1, 0, 0}, length = 0.001, width = 0.001, extra = 1, 
          r = {0, 0, 0}, m = 550) annotation (Placement(transformation(origin = {41.0, 30.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedTranslation(r = {-0.565, 0.25, 0.328}, n = {0, -1, 0}, angle = 270, 
          animation = false)
          annotation (Placement(transformation(origin = {15.0, 30.0}, 
            extent = {{10.0, -10.0}, {-10.0, 10.0}})));
        Modelica.Mechanics.MultiBody.Joints.Revolute revolute2(n = {1, 0, 0}, useAxisFlange = true)
          annotation (Placement(transformation(origin = {68.0, 30.0}, 
            extent = {{-10.0, 10.0}, {10.0, -10.0}})));
        Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape3(shapeType = "4", lengthDirection = {1, 0, 0}, length = 0.001, width = 0.001, extra = 1, 
          r_shape = {-1.21, 0, 0}, 
          m = 12.647064, r_CM = {0.69624359, 0, 0}, I_11 = 0.00243, I_22 = 1.788, I_33 = 1.788)
          annotation (Placement(transformation(origin = {98.0, 30.0}, 
            extent = {{10.0, -10.0}, {-10.0, 10.0}}, 
            rotation = -180.0)));
        Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic1(useAxisFlange = true, 
          s(start
             = -0.212))
          annotation (Placement(transformation(origin = {50.0, 4.0}, 
            extent = {{-10.0, 10.0}, {10.0, -10.0}})));
        Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape4(shapeType = "5", lengthDirection = {1, 0, 0}, length = 0.001, width = 0.001, extra = 1, 
          widthDirection = {0, -1, 0}, m = 298.74328, r_CM = {0.081053956, -0.1439152, 00.00062}) annotation (Placement(transformation(origin = {84.0, 4.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation1(r = {0, -0.5, 0})
          annotation (Placement(transformation(origin = {112.0, 4.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.MultiBody.Parts.PointMass pointMass(m = 1, sphereDiameter = 0.05, sphereColor = {255, 170, 0})
          annotation (Placement(transformation(origin = {130.0, 4.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.Rotational.Sources.Position position2
          annotation (Placement(transformation(origin = {-84.0, 51.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Blocks.Sources.Sine sine1(amplitude = 20, phase = 1.5707963267949, freqHz = 0.2, offset = 20)
          annotation (Placement(transformation(origin = {-120.0, 51.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.Rotational.Components.IdealGearR2T idealGearR2T1(ratio = 392.699)
          annotation (Placement(transformation(origin = {-58.0, 75.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.Rotational.Sources.Position position3
          annotation (Placement(transformation(origin = {44.0, -29.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Blocks.Sources.Sine sine2(amplitude = 20, freqHz = 0.2, offset = 20)
          annotation (Placement(transformation(origin = {-16.0, -29.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.Rotational.Components.IdealGearR2T idealGearR2T2(ratio = 392.699)
          annotation (Placement(transformation(origin = {88.0, -29.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Blocks.Math.Gain gain(k = -1)
          annotation (Placement(transformation(origin = {13.0, -28.999999999999993}, 
            extent = {{-7.0, -7.0}, {7.0, 7.0}})));
        Modelica.Mechanics.Translational.Sensors.SpeedSensor speedSensor
          annotation (Placement(transformation(origin = {-4.0, 74.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Components.Friction friction
          annotation (Placement(transformation(origin = {30.0, 74.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.MultiBody.Forces.WorldForce force
          annotation (Placement(transformation(origin = {62.0, 74.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.Translational.Sensors.SpeedSensor speedSensor1
          annotation (Placement(transformation(origin = {44.0, -60.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Components.Friction friction1
          annotation (Placement(transformation(origin = {78.0, -60.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.MultiBody.Forces.WorldForce force1(resolveInFrame = Modelica.Mechanics.MultiBody.Types.ResolveInFrameB.frame_resolve)
          annotation (Placement(transformation(origin = {110.0, -60.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedFrame(color_x = {255, 0, 0}, color_y = {85, 170, 0}, color_z = {0, 85, 255})
          annotation (Placement(transformation(origin = {140.0, 50.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation2(r = {-0.565, 0.25, 0.328})
          annotation (Placement(transformation(origin = {40.0, 50.0}, 
            extent = {{10.0, -10.0}, {-10.0, 10.0}})));
      equation 
        connect(bodyShape.frame_a, world.frame_b)
          annotation (Line(origin = {-90.0, 0.0}, 
            points = {{0.0, 0.0}, {-22.0, 0.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(bodyShape.frame_b, revolute.frame_a)
          annotation (Line(origin = {-65.0, 0.0}, 
            points = {{-5.0, 0.0}, {5.0, 0.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(revolute.frame_b, bodyShape1.frame_a)
          annotation (Line(origin = {-32.0, 0.0}, 
            points = {{-8.0, 0.0}, {8.0, 0.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(prismatic.frame_a, world.frame_b)
          annotation (Line(origin = {-73.0, 21.0}, 
            points = {{43.0, 9.0}, {-39.0, 9.0}, {-39.0, -21.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(fixedTranslation.frame_b, prismatic.frame_b)
          annotation (Line(origin = {-2.0, 30.0}, 
            points = {{7.0, 0.0}, {-8.0, 0.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(fixedTranslation.frame_a, bodyShape2.frame_a)
          annotation (Line(origin = {28.0, 30.0}, 
            points = {{-3.0, 0.0}, {3.0, 0.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(bodyShape2.frame_b, revolute2.frame_a)
          annotation (Line(origin = {55.0, 30.0}, 
            points = {{-4.0, 0.0}, {3.0, 0.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(revolute2.frame_b, bodyShape3.frame_a)
          annotation (Line(origin = {85.0, 30.0}, 
            points = {{-7.0, 0.0}, {3.0, 0.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(bodyShape4.frame_a, prismatic1.frame_b)
          annotation (Line(origin = {72.0, 4.0}, 
            points = {{2.0, 0.0}, {-12.0, 0.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(fixedTranslation1.frame_a, bodyShape4.frame_b)
          annotation (Line(origin = {98.0, 4.0}, 
            points = {{4.0, 0.0}, {-4.0, 0.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(pointMass.frame_a, fixedTranslation1.frame_b)
          annotation (Line(origin = {128.0, 17.0}, 
            points = {{2.0, -13.0}, {-6.0, -13.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(sine1.y, position2.phi_ref)
          annotation (Line(origin = {-102.0, 51.0}, 
            points = {{-7.0, 0.0}, {6.0, 0.0}}, 
            color = {0, 0, 127}));
        connect(position2.flange, revolute.axis)
          annotation (Line(origin = {-62.0, 31.0}, 
            points = {{-12.0, 20.0}, {12.0, 20.0}, {12.0, -21.0}}));
        connect(idealGearR2T1.flangeR, position2.flange)
          annotation (Line(origin = {-71.0, 63.0}, 
            points = {{3.0, 12.0}, {-3.0, 12.0}, {-3.0, -12.0}}));
        connect(idealGearR2T1.flangeT, prismatic.axis)
          annotation (Line(origin = {-30.0, 56.0}, 
            points = {{-18.0, 19.0}, {18.0, 19.0}, {18.0, -20.0}}, 
            color = {0, 127, 0}));
        connect(gain.y, position3.phi_ref)
          annotation (Line(origin = {27.0, -29.0}, 
            points = {{-6.0, 0.0}, {5.0, 0.0}}, 
            color = {0, 0, 127}));
        connect(sine2.y, gain.u)
          annotation (Line(origin = {0.0, -29.0}, 
            points = {{-5.0, 0.0}, {5.0, 0.0}}, 
            color = {0, 0, 127}));
        connect(revolute2.axis, position3.flange)
          annotation (Line(origin = {61.0, -4.0}, 
            points = {{7.0, 24.0}, {7.0, -25.0}, {-7.0, -25.0}}));
        connect(prismatic1.frame_a, fixedTranslation.frame_a)
          annotation (Line(origin = {33.0, 17.0}, 
            points = {{7.0, -13.0}, {-8.0, -13.0}, {-8.0, 13.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(position3.flange, idealGearR2T2.flangeR)
          annotation (Line(origin = {66.0, -29.0}, 
            points = {{-12.0, 0.0}, {12.0, 0.0}}));
        connect(idealGearR2T2.flangeT, prismatic1.axis)
          annotation (Line(origin = {91.0, -17.0}, 
            points = {{7.0, -12.0}, {33.0, -12.0}, {33.0, 9.0}, {-33.0, 9.0}, {-33.0, 15.0}}, 
            color = {0, 127, 0}));
        connect(speedSensor.flange, idealGearR2T1.flangeT)
          annotation (Line(origin = {-29.0, 78.0}, 
            points = {{15.0, -4.0}, {-17.0, -4.0}, {-17.0, -3.0}, {-19.0, -3.0}}, 
            color = {0, 127, 0}));
        connect(friction.v, speedSensor.v)
          annotation (Line(origin = {22.0, 78.0}, 
            points = {{-2.0, -4.0}, {-15.0, -4.0}}, 
            color = {0, 0, 127}));
        connect(friction.y, force.force)
          annotation (Line(origin = {45.0, 74.0}, 
            points = {{-5.0, 0.0}, {5.0, 0.0}}, 
            color = {0, 0, 127}));
        connect(idealGearR2T2.flangeT, speedSensor1.flange)
          annotation (Line(origin = {70.0, -45.0}, 
            points = {{28.0, 16.0}, {46.0, 16.0}, {46.0, 1.0}, {-46.0, 1.0}, {-46.0, -17.0}, {-36.0, -17.0}, {-36.0, -15.0}}, 
            color = {0, 127, 0}));
        connect(speedSensor1.v, friction1.v)
          annotation (Line(origin = {62.0, -60.0}, 
            points = {{-7.0, 0.0}, {7.0, 0.0}}, 
            color = {0, 0, 127}));
        connect(friction1.y, force1.force)
          annotation (Line(origin = {93.0, -60.0}, 
            points = {{-5.0, 0.0}, {5.0, 0.0}}, 
            color = {0, 0, 127}));
        connect(force1.frame_b, bodyShape4.frame_b)
          annotation (Line(origin = {117.0, -28.0}, 
            points = {{3.0, -32.0}, {23.0, -32.0}, {23.0, 18.0}, {-23.0, 18.0}, {-23.0, 32.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(fixedTranslation2.frame_a, bodyShape2.frame_b)
          annotation (Line(origin = {51.0, 40.0}, 
            points = {{-1.0, 10.0}, {0.0, 10.0}, {0.0, -10.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(fixedTranslation2.frame_b, force.frame_b)
          annotation (Line(origin = {48.0, 62.0}, 
            points = {{-18.0, -12.0}, {-24.0, -12.0}, {-24.0, 2.0}, {24.0, 2.0}, {24.0, 12.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(fixedFrame.frame_a, bodyShape4.frame_a)
          annotation (Line(origin = {102.0, 27.0}, 
            points = {{28.0, 23.0}, {-24.0, 23.0}, {-24.0, -23.0}, {-28.0, -23.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(force1.frame_resolve, bodyShape4.frame_a)
          annotation (Line(origin = {92.0, -33.0}, 
            points = {{18.0, -37.0}, {18.0, 29.0}, {-18.0, 29.0}, {-18.0, 37.0}}, 
            color = {95, 95, 95}, 
            pattern = LinePattern.Dot));
      end BGXY2;

      model BGXY3
        annotation (Diagram(coordinateSystem(extent = {{-140.0, -100.0}, {140.0, 100.0}}, 
          preserveAspectRatio = false, 
          grid = {2.0, 2.0})), 
          Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
            preserveAspectRatio = false, 
            grid = {2.0, 2.0}), graphics = {Rectangle(origin = {0.0, 0.0}, 
            fillColor = {255, 255, 255}, 
            extent = {{-100.0, 100.0}, {100.0, -100.0}})}), 
          experiment(StartTime = 0, StopTime = 5, NumberOfIntervals = 500, Algorithm = "Dassl", Tolerance = 0.0001, DoublePrecision = true, StoreEventValue = true));
        inner Modelica.Mechanics.MultiBody.World world(n = {0, 1, 0})
          annotation (Placement(transformation(origin = {-122.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape(shapeType = "1", lengthDirection = {1, 0, 0}, length = 0.001, width = 0.001, extra = 1, r = {-0.196, 0, 0})
          annotation (Placement(transformation(origin = {-80.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.MultiBody.Joints.Revolute revolute(n = {1, 0, 0}, useAxisFlange = true)
          annotation (Placement(transformation(origin = {-50.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape1(shapeType = "2", lengthDirection = {-1, 0, 0}, length = 0.001, width = 0.001, extra = 1, 
          r = {0.3, 0, 0}, 
          m = 10.058, r_CM = {0.55273949, 0, 0}, I_11 = 0.0019053575, I_22 = 0.91339, I_33 = 0.91339)
          annotation (Placement(transformation(origin = {-14.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));



        Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic(useAxisFlange = true, 
          s(start
             = 0.15))


          annotation (Placement(transformation(origin = {-20.0, 30.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape2(shapeType = "3", lengthDirection = {-1, 0, 0}, length = 0.001, width = 0.001, extra = 1, 
          r = {0, 0, 0}, m = 550) annotation (Placement(transformation(origin = {41.0, 30.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedTranslation(r = {-0.565, 0.25, 0.328}, n = {0, -1, 0}, angle = 270) annotation (Placement(transformation(origin = {15.0, 30.0}, 
          extent = {{10.0, -10.0}, {-10.0, 10.0}})));
        Modelica.Mechanics.MultiBody.Joints.Revolute revolute2(n = {1, 0, 0}, useAxisFlange = true)
          annotation (Placement(transformation(origin = {68.0, 30.0}, 
            extent = {{-10.0, 10.0}, {10.0, -10.0}})));
        Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape3(shapeType = "4", lengthDirection = {1, 0, 0}, length = 0.001, width = 0.001, extra = 1, 
          r_shape = {-1.21, 0, 0}, 
          m = 12.647064, r_CM = {0.69624359, 0, 0}, I_11 = 0.00243, I_22 = 1.788, I_33 = 1.788)
          annotation (Placement(transformation(origin = {98.0, 30.0}, 
            extent = {{10.0, -10.0}, {-10.0, 10.0}}, 
            rotation = -180.0)));
        Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic1(useAxisFlange = true)


          annotation (Placement(transformation(origin = {50.0, 4.0}, 
            extent = {{-10.0, 10.0}, {10.0, -10.0}})));
        Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape4(shapeType = "5", lengthDirection = {1, 0, 0}, length = 0.001, width = 0.001, extra = 1, 
          widthDirection = {0, -1, 0}, m = 298.74328, r_CM = {0.081053956, -0.1439152, 00.00062}) annotation (Placement(transformation(origin = {84.0, 4.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation1(r = {0, -0.5, 0})
          annotation (Placement(transformation(origin = {112.0, 4.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.MultiBody.Parts.PointMass pointMass(m = 1, sphereDiameter = 0.05, sphereColor = {255, 170, 0})
          annotation (Placement(transformation(origin = {130.0, 4.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));


        Modelica.Mechanics.Rotational.Components.IdealGearR2T idealGearR2T1(ratio = 392.699)
          annotation (Placement(transformation(origin = {-52.0, 75.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.Rotational.Components.IdealGearR2T idealGearR2T2(ratio = 392.699)
          annotation (Placement(transformation(origin = {88.0, -29.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.Rotational.Interfaces.Flange_a axis "1-dim. rotational flange that drives the joint" 
          annotation (Placement(transformation(origin = {-100.0, 60.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.Rotational.Interfaces.Flange_a axis1 "1-dim. rotational flange that drives the joint" 
          annotation (Placement(transformation(origin = {-100.0, -60.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.Translational.Sensors.SpeedSensor speedSensor
          annotation (Placement(transformation(origin = {-13.0, 74.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Components.Friction friction
          annotation (Placement(transformation(origin = {21.0, 74.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.MultiBody.Forces.WorldForce force
          annotation (Placement(transformation(origin = {53.0, 74.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation2(r = {-0.565, 0.25, 0.328})
          annotation (Placement(transformation(origin = {31.0, 50.0}, 
            extent = {{10.0, -10.0}, {-10.0, 10.0}})));
        Modelica.Mechanics.Translational.Sensors.SpeedSensor speedSensor1
          annotation (Placement(transformation(origin = {11.0, -76.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Components.Friction friction1(F_Coulomb = 180, F_Stribeck = 360)
          annotation (Placement(transformation(origin = {45.0, -76.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.MultiBody.Forces.WorldForce force1(resolveInFrame = Modelica.Mechanics.MultiBody.Types.ResolveInFrameB.frame_resolve)
          annotation (Placement(transformation(origin = {77.0, -76.0}, 
            extent = {{-10.0, 10.0}, {10.0, -10.0}})));
        Modelica.Mechanics.Rotational.Components.ElastoBacklash elastoBacklash(d = 10000, b = 0.00872664625997165, 
          c = 1.0e6)



          annotation (Placement(transformation(origin = {-78.0, 76.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.Rotational.Components.ElastoBacklash elastoBacklash1(d = 10000, b = 0.00872664625997165, 
          c = 1.0e6) annotation (Placement(transformation(origin = {44.0, -28.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Components.Coulpling2 coulpling2_1
          annotation (Placement(transformation(origin = {-98.0, 40.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Components.BallScrew ballScrew
          annotation (Placement(transformation(origin = {-66.0, 40.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.Rotational.Components.Damper damper(d = 0.02)
          annotation (Placement(transformation(origin = {-135.99999999999997, 30.000000000000007}, 
            extent = {{13.0, 13.0}, {-13.0, -13.0}}, 
            rotation = 90.0)));
        Modelica.Mechanics.Rotational.Components.Fixed fixed
          annotation (Placement(transformation(origin = {-156.0, 10.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Components.Bearing2 bearing2_1
          annotation (Placement(transformation(origin = {-156.0, 48.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Components.Coulpling2 coulpling2_2
          annotation (Placement(transformation(origin = {-68.0, -40.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Components.BallScrew ballScrew1
          annotation (Placement(transformation(origin = {-36.0, -40.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.Rotational.Components.Damper damper1(d = 0.02)
          annotation (Placement(transformation(origin = {-37.999999999999986, -72.00000000000001}, 
            extent = {{13.0, 13.0}, {-13.0, -13.0}}, 
            rotation = 90.0)));
        Modelica.Mechanics.Rotational.Components.Fixed fixed1
          annotation (Placement(transformation(origin = {-50.0, -92.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Components.Bearing2 bearing2_2
          annotation (Placement(transformation(origin = {-64.0, -72.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation3(r = {0.15, 0, 0})
          annotation (Placement(transformation(origin = {-90.0, 20.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation4(r = {-0.512, 0, 0})
          annotation (Placement(transformation(origin = {22.0, 4.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.Translational.Sensors.PositionSensor positionSensor
          annotation (Placement(transformation(origin = {74.0, 60.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.Translational.Sensors.PositionSensor positionSensor1
          annotation (Placement(transformation(origin = {66.0, -60.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Blocks.Interfaces.RealOutput s "Absolute position of flange as output signal" 
          annotation (Placement(transformation(origin = {110.0, 60.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Blocks.Interfaces.RealOutput s1 "Absolute position of flange as output signal" 
          annotation (Placement(transformation(origin = {110.0, -60.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
      equation 
        connect(bodyShape.frame_a, world.frame_b)
          annotation (Line(origin = {-90.0, 0.0}, 
            points = {{0.0, 0.0}, {-22.0, 0.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(bodyShape.frame_b, revolute.frame_a)
          annotation (Line(origin = {-65.0, 0.0}, 
            points = {{-5.0, 0.0}, {5.0, 0.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(revolute.frame_b, bodyShape1.frame_a)
          annotation (Line(origin = {-32.0, 0.0}, 
            points = {{-8.0, 0.0}, {8.0, 0.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(fixedTranslation.frame_b, prismatic.frame_b)
          annotation (Line(origin = {-2.0, 30.0}, 
            points = {{7.0, 0.0}, {-8.0, 0.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(fixedTranslation.frame_a, bodyShape2.frame_a)
          annotation (Line(origin = {28.0, 30.0}, 
            points = {{-3.0, 0.0}, {3.0, 0.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(bodyShape2.frame_b, revolute2.frame_a)
          annotation (Line(origin = {55.0, 30.0}, 
            points = {{-4.0, 0.0}, {3.0, 0.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(revolute2.frame_b, bodyShape3.frame_a)
          annotation (Line(origin = {85.0, 30.0}, 
            points = {{-7.0, 0.0}, {3.0, 0.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(bodyShape4.frame_a, prismatic1.frame_b)
          annotation (Line(origin = {72.0, 4.0}, 
            points = {{2.0, 0.0}, {-12.0, 0.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(fixedTranslation1.frame_a, bodyShape4.frame_b)
          annotation (Line(origin = {98.0, 4.0}, 
            points = {{4.0, 0.0}, {-4.0, 0.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(pointMass.frame_a, fixedTranslation1.frame_b)
          annotation (Line(origin = {128.0, 17.0}, 
            points = {{2.0, -13.0}, {-6.0, -13.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(idealGearR2T1.flangeT, prismatic.axis)
          annotation (Line(origin = {-30.0, 56.0}, 
            points = {{-12.0, 19.0}, {-4.0, 19.0}, {-4.0, -10.0}, {18.0, -10.0}, {18.0, -20.0}}, 
            color = {0, 127, 0}));
        connect(idealGearR2T2.flangeT, prismatic1.axis)
          annotation (Line(origin = {91.0, -17.0}, 
            points = {{7.0, -12.0}, {33.0, -12.0}, {33.0, 9.0}, {-33.0, 9.0}, {-33.0, 15.0}}, 
            color = {0, 127, 0}));
        connect(speedSensor.flange, idealGearR2T1.flangeT)
          annotation (Line(origin = {-32.0, 75.0}, 
            points = {{9.0, -1.0}, {-10.0, -1.0}, {-10.0, 0.0}}, 
            color = {0, 127, 0}));
        connect(speedSensor.v, friction.v)
          annotation (Line(origin = {5.0, 74.0}, 
            points = {{-7.0, 0.0}, {7.0, 0.0}}, 
            color = {0, 0, 127}));
        connect(friction.y, force.force)
          annotation (Line(origin = {36.0, 74.0}, 
            points = {{-5.0, 0.0}, {5.0, 0.0}}, 
            color = {0, 0, 127}));
        connect(fixedTranslation2.frame_a, bodyShape2.frame_b)
          annotation (Line(origin = {46.0, 40.0}, 
            points = {{-5.0, 10.0}, {4.0, 10.0}, {4.0, -10.0}, {5.0, -10.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(fixedTranslation2.frame_b, force.frame_b)
          annotation (Line(origin = {37.0, 62.0}, 
            points = {{-16.0, -12.0}, {-27.0, -12.0}, {-27.0, -2.0}, {26.0, -2.0}, {26.0, 12.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(idealGearR2T2.flangeT, speedSensor1.flange)
          annotation (Line(origin = {44.0, -52.0}, 
            points = {{54.0, 23.0}, {56.0, 23.0}, {56.0, -1.0}, {-56.0, -1.0}, {-56.0, -24.0}, {-43.0, -24.0}}, 
            color = {0, 127, 0}));
        connect(speedSensor1.v, friction1.v)
          annotation (Line(origin = {29.0, -76.0}, 
            points = {{-7.0, 0.0}, {7.0, 0.0}}, 
            color = {0, 0, 127}));
        connect(friction1.y, force1.force)
          annotation (Line(origin = {60.0, -76.0}, 
            points = {{-5.0, 0.0}, {5.0, 0.0}}, 
            color = {0, 0, 127}));
        connect(bodyShape4.frame_a, force1.frame_resolve)
          annotation (Line(origin = {76.0, -31.0}, 
            points = {{-2.0, 35.0}, {-2.0, -35.0}, {1.0, -35.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(force1.frame_b, bodyShape4.frame_b)
          annotation (Line(origin = {104.0, -36.0}, 
            points = {{-17.0, -40.0}, {16.0, -40.0}, {16.0, 28.0}, {-10.0, 28.0}, {-10.0, 40.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(elastoBacklash.flange_b, idealGearR2T1.flangeR)
          annotation (Line(origin = {-65.0, 75.0}, 
            points = {{-3.0, 1.0}, {3.0, 1.0}, {3.0, 0.0}}));
        connect(elastoBacklash.flange_a, revolute.axis)
          annotation (Line(origin = {-70.0, 42.0}, 
            points = {{-18.0, 34.0}, {-18.0, 16.0}, {20.0, 16.0}, {20.0, -32.0}}));
        connect(elastoBacklash1.flange_b, idealGearR2T2.flangeR)
          annotation (Line(origin = {66.0, -28.0}, 
            points = {{-12.0, 0.0}, {12.0, 0.0}, {12.0, -1.0}}));
        connect(elastoBacklash1.flange_a, revolute2.axis)
          annotation (Line(origin = {46.0, -4.0}, 
            points = {{-12.0, -24.0}, {-22.0, -24.0}, {-22.0, -6.0}, {22.0, -6.0}, {22.0, 24.0}}));
        connect(coulpling2_1.flange_a, axis)
          annotation (Line(origin = {-108.0, 50.0}, 
            points = {{0.0, -10.0}, {-8.0, -10.0}, {-8.0, 10.0}, {8.0, 10.0}}));
        connect(coulpling2_1.flange_b, ballScrew.flange_a)
          annotation (Line(origin = {-82.0, 40.0}, 
            points = {{-6.0, 0.0}, {6.0, 0.0}}));
        connect(ballScrew.flange_b, revolute.axis)
          annotation (Line(origin = {-53.0, 25.0}, 
            points = {{-3.0, 15.0}, {3.0, 15.0}, {3.0, -15.0}}));
        connect(damper.flange_a, coulpling2_1.flange_b)
          annotation (Line(origin = {-111.0, 43.0}, 
            points = {{-25.0, 0.0}, {-25.0, 8.0}, {25.0, 8.0}, {25.0, -3.0}, {23.0, -3.0}}));
        connect(damper.flange_b, fixed.flange)
          annotation (Line(origin = {-147.0, 16.0}, 
            points = {{11.0, 1.0}, {-9.0, 1.0}, {-9.0, -6.0}}));
        connect(fixed.flange, bearing2_1.support)
          annotation (Line(origin = {-153.0, 30.0}, 
            points = {{-3.0, -20.0}, {-3.0, 8.0}}));
        connect(bearing2_1.flange, ballScrew.flange_a)
          annotation (Line(origin = {-113.0, 51.0}, 
            points = {{-43.0, 7.0}, {-43.0, 21.0}, {-9.0, 21.0}, {-9.0, -19.0}, {37.0, -19.0}, {37.0, -11.0}}));
        connect(axis1, coulpling2_2.flange_a)
          annotation (Line(origin = {-89.0, -50.0}, 
            points = {{-11.0, -10.0}, {-11.0, 10.0}, {11.0, 10.0}}));
        connect(coulpling2_2.flange_b, ballScrew1.flange_a)
          annotation (Line(origin = {-52.0, -40.0}, 
            points = {{-6.0, 0.0}, {6.0, 0.0}}));
        connect(ballScrew1.flange_b, revolute2.axis)
          annotation (Line(origin = {21.0, -10.0}, 
            points = {{-47.0, -30.0}, {-1.0, -30.0}, {-1.0, 0.0}, {47.0, 0.0}, {47.0, 30.0}}));
        connect(fixed1.flange, damper1.flange_b)
          annotation (Line(origin = {-44.0, -88.0}, 
            points = {{-6.0, -4.0}, {6.0, -4.0}, {6.0, 3.0}}));
        connect(fixed1.flange, bearing2_2.support)
          annotation (Line(origin = {-57.0, -87.0}, 
            points = {{7.0, -5.0}, {-7.0, -5.0}, {-7.0, 5.0}}));
        connect(damper1.flange_a, ballScrew1.flange_a)
          annotation (Line(origin = {-44.0, -49.0}, 
            points = {{6.0, -10.0}, {6.0, -7.0}, {-6.0, -7.0}, {-6.0, 9.0}, {-2.0, 9.0}}));
        connect(bearing2_2.flange, coulpling2_2.flange_b)
          annotation (Line(origin = {-57.0, -51.0}, 
            points = {{-7.0, -11.0}, {-7.0, -5.0}, {7.0, -5.0}, {7.0, 11.0}, {-1.0, 11.0}}));
        connect(fixedTranslation3.frame_a, world.frame_b)
          annotation (Line(origin = {-106.0, 10.0}, 
            points = {{6.0, 10.0}, {2.0, 10.0}, {2.0, -10.0}, {-6.0, -10.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(fixedTranslation3.frame_b, prismatic.frame_a)
          annotation (Line(origin = {-55.0, 25.0}, 
            points = {{-25.0, -5.0}, {25.0, -5.0}, {25.0, 5.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(fixedTranslation.frame_a, fixedTranslation4.frame_a)
          annotation (Line(origin = {17.0, 17.0}, 
            points = {{8.0, 13.0}, {8.0, -1.0}, {-11.0, -1.0}, {-11.0, -13.0}, {-5.0, -13.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(prismatic1.frame_a, fixedTranslation4.frame_b)
          annotation (Line(origin = {36.0, 4.0}, 
            points = {{4.0, 0.0}, {-4.0, 0.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(positionSensor.flange, prismatic.axis)
          annotation (Line(origin = {44.0, 53.0}, 
            points = {{20.0, 7.0}, {-56.0, 7.0}, {-56.0, -17.0}}, 
            color = {0, 127, 0}));
        connect(positionSensor1.flange, prismatic1.axis)
          annotation (Line(origin = {87.0, -26.0}, 
            points = {{-31.0, -34.0}, {-31.0, 24.0}, {-29.0, 24.0}}, 
            color = {0, 127, 0}));
        connect(positionSensor.s, s)
          annotation (Line(origin = {127.0, 60.0}, 
            points = {{-42.0, 0.0}, {-17.0, 0.0}}, 
            color = {0, 0, 127}));
        connect(positionSensor1.s, s1)
          annotation (Line(origin = {140.0, -50.0}, 
            points = {{-63.0, -10.0}, {-30.0, -10.0}}, 
            color = {0, 0, 127}));
      end BGXY3;

      model FeedSystemX

        annotation (
          Diagram(coordinateSystem(extent = {{-200.0, -100.0}, {180.0, 100.0}}, 
            preserveAspectRatio = false, 
            grid = {2.0, 2.0})), 
          Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
            preserveAspectRatio = false, 
            initialScale = 0.3, 
            grid = {2.0, 2.0}), graphics = {Rectangle(origin = {-1.0, -3.0}, 
            lineColor = {102, 102, 102}, 
            fillColor = {184, 184, 184}, 
            fillPattern = FillPattern.HorizontalCylinder, 
            extent = {{-101.0, 7.0}, {101.0, -7.0}}), Rectangle(origin = {-87.0, 11.0}, 
            fillColor = {190, 190, 190}, 
            fillPattern = FillPattern.Solid, 
            extent = {{-7.0, 7.0}, {7.0, -7.0}}), Ellipse(origin = {-87.0, 11.0}, 
            fillColor = {255, 255, 255}, 
            fillPattern = FillPattern.Solid, 
            extent = {{-5.0, 5.0}, {5.0, -5.0}}), Rectangle(origin = {-87.0, -17.0}, 
            fillColor = {190, 190, 190}, 
            fillPattern = FillPattern.Solid, 
            extent = {{-7.0, 7.0}, {7.0, -7.0}}), Ellipse(origin = {-87.0, -17.0}, 
            fillColor = {255, 255, 255}, 
            fillPattern = FillPattern.Solid, 
            extent = {{-5.0, 5.0}, {5.0, -5.0}}), Rectangle(origin = {87.0, 11.0}, 
            fillColor = {190, 190, 190}, 
            fillPattern = FillPattern.Solid, 
            extent = {{-7.0, 7.0}, {7.0, -7.0}}), Ellipse(origin = {87.0, 11.0}, 
            fillColor = {255, 255, 255}, 
            fillPattern = FillPattern.Solid, 
            extent = {{-5.0, 5.0}, {5.0, -5.0}}), Rectangle(origin = {87.0, -17.0}, 
            fillColor = {190, 190, 190}, 
            fillPattern = FillPattern.Solid, 
            extent = {{-7.0, 7.0}, {7.0, -7.0}}), Ellipse(origin = {87.0, -17.0}, 
            fillColor = {255, 255, 255}, 
            fillPattern = FillPattern.Solid, 
            extent = {{-5.0, 5.0}, {5.0, -5.0}}), Line(origin = {-71.0, -3.0}, 
            points = {{5.0, 7.0}, {-5.0, -7.0}}), Line(origin = {-59.0, -3.0}, 
            points = {{5.0, 7.0}, {-5.0, -7.0}}), Line(origin = {-47.0, -3.0}, 
            points = {{5.0, 7.0}, {-5.0, -7.0}}), Line(origin = {25.0, -3.0}, 
            points = {{5.0, 7.0}, {-5.0, -7.0}}), Line(origin = {37.0, -3.0}, 
            points = {{5.0, 7.0}, {-5.0, -7.0}}), Line(origin = {61.0, -3.0}, 
            points = {{5.0, 7.0}, {-5.0, -7.0}}), Line(origin = {-35.0, -3.0}, 
            points = {{5.0, 7.0}, {-5.0, -7.0}}), Line(origin = {49.0, -3.0}, 
            points = {{5.0, 7.0}, {-5.0, -7.0}}), Line(origin = {73.0, -3.0}, 
            points = {{5.0, 7.0}, {-5.0, -7.0}}), Rectangle(origin = {0.0, 23.0}, 
            fillColor = {202, 202, 202}, 
            fillPattern = FillPattern.Solid, 
            extent = {{-100.0, 5.0}, {100.0, -5.0}}), Rectangle(origin = {0.0, 35.0}, 
            fillColor = {230, 230, 230}, 
            fillPattern = FillPattern.Solid, 
            extent = {{-80.0, 7.0}, {80.0, -7.0}}), Rectangle(origin = {-55.0, 39.0}, 
            fillPattern = FillPattern.Solid, 
            extent = {{-5.0, 3.0}, {5.0, -3.0}}), Rectangle(origin = {55.0, 39.0}, 
            fillPattern = FillPattern.Solid, 
            extent = {{-5.0, 3.0}, {5.0, -3.0}}), Rectangle(origin = {1.0, 53.0}, 
            fillColor = {0, 170, 255}, 
            fillPattern = FillPattern.Solid, 
            extent = {{-41.0, 11.0}, {41.0, -11.0}}), Polygon(origin = {2.0, 7.0}, 
            fillColor = {208, 208, 208}, 
            fillPattern = FillPattern.Solid, 
            points = {{-30.0, 29.0}, {30.0, 29.0}, {30.0, 9.0}, {18.0, 9.0}, {18.0, -29.0}, {-20.0, -29.0}, {-20.0, 9.0}, {-30.0, 9.0}, {-30.0, 29.0}}), Rectangle(origin = {0.0, -44.0}, 
            fillColor = {231, 231, 231}, 
            fillPattern = FillPattern.Solid, 
            extent = {{-100.0, 20.0}, {100.0, -20.0}}), Rectangle(origin = {0.0, -59.0}, 
            fillColor = {255, 255, 255}, 
            fillPattern = FillPattern.Solid, 
            extent = {{-70.0, 5.0}, {70.0, -5.0}}), Text(origin = {1.0, 82.0}, 
            extent = {{-41.0, 18.0}, {41.0, -18.0}}, 
            textString = "X", 
            textStyle = {TextStyle.None})}));
        Mechanical.Components.Coulpling2 coulpling2_1
          annotation (Placement(transformation(origin = {-74.99999999999999, -5.0}, 
            extent = {{-21.0, -21.0}, {21.0, 21.0}})));
        Mechanical.Components.BallScrew ballScrew(J = 0.00190536)
          annotation (Placement(transformation(origin = {-17.000000000000007, -5.000000000000007}, 
            extent = {{-19.0, -19.0}, {19.0, 19.0}})));
        Mechanical.Components.Bearing2 bearing2_1
          annotation (Placement(transformation(origin = {-96.00000000000001, -60.0}, 
            extent = {{-18.0, -18.0}, {18.0, 18.0}})));
        Mechanical.Components.Bearing2 bearing2_2
          annotation (Placement(transformation(origin = {58.0, -58.00000000000001}, 
            extent = {{-18.0, -18.0}, {18.0, 18.0}})));
        Modelica.Mechanics.Rotational.Components.Fixed fixed
          annotation (Placement(transformation(origin = {-22.0, -76.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));



        Modelica.Mechanics.Translational.Components.Fixed fixed1
          annotation (Placement(transformation(origin = {-30.0, 50.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.Rotational.Components.Damper damper(d = 0.02)
          annotation (Placement(transformation(origin = {-48.0, -56.0}, 
            extent = {{13.0, 13.0}, {-13.0, -13.0}}, 
            rotation = 90.0)));
        Mechanical.Components.BallScrewNut5 ballScrewNut5_1(P = 0.016)
          annotation (Placement(transformation(origin = {38.0, 29.999999999999996}, 
            extent = {{-30.0, 30.0}, {30.0, -30.0}})));
        Mechanical.Components.MassWithStopAndFriction massWithStopAndFriction(F_Coulomb = 300, F_prop = 0.1, F_Stribeck = 250, 
          m = 860, fexp = 400)
          annotation (Placement(transformation(origin = {150.0, 30.0}, 
            extent = {{-20.0, -20.0}, {20.0, 20.0}})));
        Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a "Left flange of shaft" 
          annotation (Placement(transformation(origin = {-106.0, -2.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.Translational.Sensors.PositionSensor positionSensor
          annotation (Placement(transformation(origin = {110.0, -30.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Blocks.Interfaces.RealOutput s "Absolute position of flange as output signal" 
          annotation (Placement(transformation(origin = {89.0, 35.0}, 
            extent = {{-5.0, -5.0}, {5.0, 5.0}})));
      equation 
        connect(ballScrew.flange_a, coulpling2_1.flange_b)
          annotation (Line(origin = {-94.0, -11.0}, 
            points = {{58.0, 6.0}, {40.0, 6.0}}));
        connect(bearing2_1.flange, coulpling2_1.flange_b)
          annotation (Line(origin = {-103.0, -24.0}, 
            points = {{7.0, -18.0}, {7.0, -5.0}, {55.0, -5.0}, {55.0, 19.0}, {49.0, 19.0}}));
        connect(ballScrew.flange_b, bearing2_2.flange)
          annotation (Line(origin = {24.0, -26.0}, 
            points = {{-22.0, 21.0}, {34.0, 21.0}, {34.0, -14.0}}));
        connect(fixed.flange, bearing2_1.support)
          annotation (Line(origin = {-53.0, -80.0}, 
            points = {{31.0, 4.0}, {-43.0, 4.0}, {-43.0, 2.0}}));
        connect(bearing2_2.support, fixed.flange)
          annotation (Line(origin = {23.0, -79.0}, 
            points = {{35.0, 3.0}, {-45.0, 3.0}}));
        connect(damper.flange_b, fixed.flange)
          annotation (Line(origin = {-28.0, -69.0}, 
            points = {{-20.0, 0.0}, {11.0, 0.0}, {11.0, -7.0}, {6.0, -7.0}}));
        connect(damper.flange_a, coulpling2_1.flange_b)
          annotation (Line(origin = {-75.0, -24.0}, 
            points = {{27.0, -19.0}, {27.0, 19.0}, {21.0, 19.0}}));
        connect(ballScrewNut5_1.flangeR, ballScrew.flange_b)
          annotation (Line(origin = {4.0, 15.0}, 
            points = {{3.0, 15.0}, {-2.0, 15.0}, {-2.0, -20.0}}));
        connect(coulpling2_1.flange_a, flange_a)
          annotation (Line(origin = {-170.0, -11.0}, 
            points = {{74.0, 6.0}, {74.0, 9.0}, {64.0, 9.0}}));
        connect(ballScrewNut5_1.flangeT, massWithStopAndFriction.flange_a)
          annotation (Line(origin = {95.0, 30.0}, 
            points = {{-27.0, 0.0}, {35.0, 0.0}}, 
            color = {0, 127, 0}));
        connect(ballScrewNut5_1.supportT, fixed1.flange)
          annotation (Line(origin = {-95.0, 44.0}, 
            points = {{103.0, 4.0}, {65.0, 4.0}, {65.0, 6.0}}, 
            color = {0, 127, 0}));
        connect(positionSensor.flange, massWithStopAndFriction.flange_a)
          annotation (Line(origin = {130.0, 0.0}, 
            points = {{-30.0, -30.0}, {-60.0, -30.0}, {-60.0, 30.0}, {0.0, 30.0}}, 
            color = {0, 127, 0}));
        connect(positionSensor.s, s)
          annotation (Line(origin = {164.0, -30.0}, 
            points = {{-43.0, 0.0}, {-43.0, 65.0}, {-75.0, 65.0}}, 
            color = {0, 0, 127}));
      end FeedSystemX;
      model FeedSystemY

        annotation (
          Diagram(coordinateSystem(extent = {{-200.0, -100.0}, {180.0, 100.0}}, 
            preserveAspectRatio = false, 
            grid = {2.0, 2.0})), 
          Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
            preserveAspectRatio = false, 
            initialScale = 0.3, 
            grid = {2.0, 2.0}), graphics = {Rectangle(origin = {-1.0, -3.0}, 
            lineColor = {102, 102, 102}, 
            fillColor = {184, 184, 184}, 
            fillPattern = FillPattern.HorizontalCylinder, 
            extent = {{-101.0, 7.0}, {101.0, -7.0}}), Rectangle(origin = {-87.0, 11.0}, 
            fillColor = {190, 190, 190}, 
            fillPattern = FillPattern.Solid, 
            extent = {{-7.0, 7.0}, {7.0, -7.0}}), Ellipse(origin = {-87.0, 11.0}, 
            fillColor = {255, 255, 255}, 
            fillPattern = FillPattern.Solid, 
            extent = {{-5.0, 5.0}, {5.0, -5.0}}), Rectangle(origin = {-87.0, -17.0}, 
            fillColor = {190, 190, 190}, 
            fillPattern = FillPattern.Solid, 
            extent = {{-7.0, 7.0}, {7.0, -7.0}}), Ellipse(origin = {-87.0, -17.0}, 
            fillColor = {255, 255, 255}, 
            fillPattern = FillPattern.Solid, 
            extent = {{-5.0, 5.0}, {5.0, -5.0}}), Rectangle(origin = {87.0, 11.0}, 
            fillColor = {190, 190, 190}, 
            fillPattern = FillPattern.Solid, 
            extent = {{-7.0, 7.0}, {7.0, -7.0}}), Ellipse(origin = {87.0, 11.0}, 
            fillColor = {255, 255, 255}, 
            fillPattern = FillPattern.Solid, 
            extent = {{-5.0, 5.0}, {5.0, -5.0}}), Rectangle(origin = {87.0, -17.0}, 
            fillColor = {190, 190, 190}, 
            fillPattern = FillPattern.Solid, 
            extent = {{-7.0, 7.0}, {7.0, -7.0}}), Ellipse(origin = {87.0, -17.0}, 
            fillColor = {255, 255, 255}, 
            fillPattern = FillPattern.Solid, 
            extent = {{-5.0, 5.0}, {5.0, -5.0}}), Line(origin = {-71.0, -3.0}, 
            points = {{5.0, 7.0}, {-5.0, -7.0}}), Line(origin = {-59.0, -3.0}, 
            points = {{5.0, 7.0}, {-5.0, -7.0}}), Line(origin = {-47.0, -3.0}, 
            points = {{5.0, 7.0}, {-5.0, -7.0}}), Line(origin = {25.0, -3.0}, 
            points = {{5.0, 7.0}, {-5.0, -7.0}}), Line(origin = {37.0, -3.0}, 
            points = {{5.0, 7.0}, {-5.0, -7.0}}), Line(origin = {61.0, -3.0}, 
            points = {{5.0, 7.0}, {-5.0, -7.0}}), Line(origin = {-35.0, -3.0}, 
            points = {{5.0, 7.0}, {-5.0, -7.0}}), Line(origin = {49.0, -3.0}, 
            points = {{5.0, 7.0}, {-5.0, -7.0}}), Line(origin = {73.0, -3.0}, 
            points = {{5.0, 7.0}, {-5.0, -7.0}}), Rectangle(origin = {0.0, 23.0}, 
            fillColor = {202, 202, 202}, 
            fillPattern = FillPattern.Solid, 
            extent = {{-100.0, 5.0}, {100.0, -5.0}}), Rectangle(origin = {0.0, 35.0}, 
            fillColor = {230, 230, 230}, 
            fillPattern = FillPattern.Solid, 
            extent = {{-80.0, 7.0}, {80.0, -7.0}}), Rectangle(origin = {-55.0, 39.0}, 
            fillPattern = FillPattern.Solid, 
            extent = {{-5.0, 3.0}, {5.0, -3.0}}), Rectangle(origin = {55.0, 39.0}, 
            fillPattern = FillPattern.Solid, 
            extent = {{-5.0, 3.0}, {5.0, -3.0}}), Rectangle(origin = {1.0, 53.0}, 
            fillColor = {0, 170, 255}, 
            fillPattern = FillPattern.Solid, 
            extent = {{-41.0, 11.0}, {41.0, -11.0}}), Polygon(origin = {2.0, 7.0}, 
            fillColor = {208, 208, 208}, 
            fillPattern = FillPattern.Solid, 
            points = {{-30.0, 29.0}, {30.0, 29.0}, {30.0, 9.0}, {18.0, 9.0}, {18.0, -29.0}, {-20.0, -29.0}, {-20.0, 9.0}, {-30.0, 9.0}, {-30.0, 29.0}}), Rectangle(origin = {0.0, -44.0}, 
            fillColor = {231, 231, 231}, 
            fillPattern = FillPattern.Solid, 
            extent = {{-100.0, 20.0}, {100.0, -20.0}}), Rectangle(origin = {0.0, -59.0}, 
            fillColor = {255, 255, 255}, 
            fillPattern = FillPattern.Solid, 
            extent = {{-70.0, 5.0}, {70.0, -5.0}}), Text(origin = {0.0, 80.0}, 
            extent = {{-40.0, 20.0}, {40.0, -20.0}}, 
            textString = "Y", 
            textStyle = {TextStyle.None})}));
        Mechanical.Components.Coulpling2 coulpling2_1
          annotation (Placement(transformation(origin = {-74.99999999999999, -5.0}, 
            extent = {{-21.0, -21.0}, {21.0, 21.0}})));
        Mechanical.Components.BallScrew ballScrew(J = 0.00243)
          annotation (Placement(transformation(origin = {-17.000000000000007, -5.000000000000007}, 
            extent = {{-19.0, -19.0}, {19.0, 19.0}})));
        Mechanical.Components.Bearing2 bearing2_1
          annotation (Placement(transformation(origin = {-94.00000000000001, -60.0}, 
            extent = {{-18.0, -18.0}, {18.0, 18.0}})));
        Mechanical.Components.Bearing2 bearing2_2
          annotation (Placement(transformation(origin = {58.0, -58.00000000000001}, 
            extent = {{-18.0, -18.0}, {18.0, 18.0}})));
        Modelica.Mechanics.Rotational.Components.Fixed fixed
          annotation (Placement(transformation(origin = {-22.0, -76.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));



        Modelica.Mechanics.Translational.Components.Fixed fixed1
          annotation (Placement(transformation(origin = {-30.0, 50.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.Rotational.Components.Damper damper(d = 0.02)
          annotation (Placement(transformation(origin = {-48.0, -56.0}, 
            extent = {{13.0, 13.0}, {-13.0, -13.0}}, 
            rotation = 90.0)));
        Mechanical.Components.BallScrewNut5 ballScrewNut5_1(P = 0.016)
          annotation (Placement(transformation(origin = {38.0, 29.999999999999996}, 
            extent = {{-30.0, 30.0}, {30.0, -30.0}})));
        Mechanical.Components.MassWithStopAndFriction massWithStopAndFriction(F_Coulomb = 300, F_prop = 0.1, F_Stribeck = 250, 
          m = 298.743, fexp = 400)
          annotation (Placement(transformation(origin = {150.0, 30.0}, 
            extent = {{-20.0, -20.0}, {20.0, 20.0}})));
        Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a "Left flange of shaft" 
          annotation (Placement(transformation(origin = {-106.0, -2.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.Translational.Sensors.PositionSensor positionSensor
          annotation (Placement(transformation(origin = {110.0, -30.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Blocks.Interfaces.RealOutput s "Absolute position of flange as output signal" 
          annotation (Placement(transformation(origin = {89.0, 35.0}, 
            extent = {{-5.0, -5.0}, {5.0, 5.0}})));
      equation 
        connect(ballScrew.flange_a, coulpling2_1.flange_b)
          annotation (Line(origin = {-94.0, -11.0}, 
            points = {{58.0, 6.0}, {40.0, 6.0}}));
        connect(bearing2_1.flange, coulpling2_1.flange_b)
          annotation (Line(origin = {-103.0, -24.0}, 
            points = {{9.0, -18.0}, {9.0, -5.0}, {55.0, -5.0}, {55.0, 19.0}, {49.0, 19.0}}));
        connect(ballScrew.flange_b, bearing2_2.flange)
          annotation (Line(origin = {24.0, -26.0}, 
            points = {{-22.0, 21.0}, {34.0, 21.0}, {34.0, -14.0}}));
        connect(fixed.flange, bearing2_1.support)
          annotation (Line(origin = {-53.0, -80.0}, 
            points = {{31.0, 4.0}, {-41.0, 4.0}, {-41.0, 2.0}}));
        connect(bearing2_2.support, fixed.flange)
          annotation (Line(origin = {23.0, -79.0}, 
            points = {{35.0, 3.0}, {-45.0, 3.0}}));
        connect(damper.flange_b, fixed.flange)
          annotation (Line(origin = {-28.0, -69.0}, 
            points = {{-20.0, 0.0}, {11.0, 0.0}, {11.0, -7.0}, {6.0, -7.0}}));
        connect(damper.flange_a, coulpling2_1.flange_b)
          annotation (Line(origin = {-75.0, -24.0}, 
            points = {{27.0, -19.0}, {27.0, 19.0}, {21.0, 19.0}}));
        connect(ballScrewNut5_1.flangeR, ballScrew.flange_b)
          annotation (Line(origin = {4.0, 15.0}, 
            points = {{3.0, 15.0}, {-2.0, 15.0}, {-2.0, -20.0}}));
        connect(coulpling2_1.flange_a, flange_a)
          annotation (Line(origin = {-170.0, -11.0}, 
            points = {{74.0, 6.0}, {74.0, 9.0}, {64.0, 9.0}}));
        connect(ballScrewNut5_1.flangeT, massWithStopAndFriction.flange_a)
          annotation (Line(origin = {95.0, 30.0}, 
            points = {{-27.0, 0.0}, {35.0, 0.0}}, 
            color = {0, 127, 0}));
        connect(ballScrewNut5_1.supportT, fixed1.flange)
          annotation (Line(origin = {-95.0, 44.0}, 
            points = {{103.0, 4.0}, {65.0, 4.0}, {65.0, 6.0}}, 
            color = {0, 127, 0}));
        connect(positionSensor.flange, massWithStopAndFriction.flange_a)
          annotation (Line(origin = {130.0, 0.0}, 
            points = {{-30.0, -30.0}, {-60.0, -30.0}, {-60.0, 30.0}, {0.0, 30.0}}, 
            color = {0, 127, 0}));
        connect(positionSensor.s, s)
          annotation (Line(origin = {164.0, -30.0}, 
            points = {{-43.0, 0.0}, {-43.0, 65.0}, {-75.0, 65.0}}, 
            color = {0, 0, 127}));
      end FeedSystemY;
    end SubSystem;
    package Test
      annotation (Diagram(coordinateSystem(extent = {{-140.0, -100.0}, {140.0, 100.0}}, 
        preserveAspectRatio = false, 
        grid = {2.0, 2.0})), 
        Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
          preserveAspectRatio = false, 
          grid = {2.0, 2.0})));
      model T1
        annotation (Diagram(coordinateSystem(extent = {{-140.0, -100.0}, {140.0, 100.0}}, 
          preserveAspectRatio = false, 
          grid = {2.0, 2.0})), 
          Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
            preserveAspectRatio = false, 
            grid = {2.0, 2.0})), 
          experiment(StartTime = 0, StopTime = 10, Interval = 0.001, Algorithm = "Dassl", Tolerance = 1e-005, DoublePrecision = true, StoreEventValue = true));
        inner Modelica.Mechanics.MultiBody.World world
          annotation (Placement(transformation(origin = {-122.0, -2.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));



        Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic(useAxisFlange = true)
          annotation (Placement(transformation(origin = {22.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape(r = {0.5, 0, 0}, r_CM = {0.2, 0.02, 0}, 
          length = 0.5, width = 0.1, m = 10, I_11 = 0.1)
          annotation (Placement(transformation(origin = {84.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.MultiBody.Parts.Fixed fixed(animation = false, r = {0.5, -0, 0})
          annotation (Placement(transformation(origin = {-104.0, -48.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));



        Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic2
          annotation (Placement(transformation(origin = {94.0, -50.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
            rotation = 180.0)));


        Modelica.Mechanics.MultiBody.Joints.Revolute revolute(n = {0, 1, 0}, 
          useAxisFlange = true) annotation (Placement(transformation(origin = {-84.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.MultiBody.Joints.Revolute revolute1(n = {0, 0, 1}, 
          useAxisFlange = true) annotation (Placement(transformation(origin = {-54.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.MultiBody.Joints.Revolute revolute2(n = {1, 0, 0}, 
          useAxisFlange = true)
          annotation (Placement(transformation(origin = {-18.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.MultiBody.Joints.Revolute revolute3(n = {0, 1, 0}, 
          useAxisFlange = true) annotation (Placement(transformation(origin = {6.0, -50.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.MultiBody.Joints.Revolute revolute4(n = {0, 0, 1}, 
          useAxisFlange = true) annotation (Placement(transformation(origin = {36.0, -50.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.MultiBody.Joints.Revolute revolute5(n = {1, 0, 0})
          annotation (Placement(transformation(origin = {62.0, -50.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.Rotational.Components.SpringDamper springDamper(d = 10)
          annotation (Placement(transformation(origin = {-80.0, 30.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.Rotational.Components.SpringDamper springDamper1(d = 10)
          annotation (Placement(transformation(origin = {-46.0, 30.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.Rotational.Components.SpringDamper springDamper2(d = 10)
          annotation (Placement(transformation(origin = {2.0, -28.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.Rotational.Components.SpringDamper springDamper3(d = 10)
          annotation (Placement(transformation(origin = {40.0, -28.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.Translational.Components.SpringDamper springDamper4(c = 1e6, d = 1000)
          annotation (Placement(transformation(origin = {20.0, 30.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.Rotational.Sources.Torque constantTorque annotation (Placement(transformation(origin = {-80.0, 76.0}, 
          extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Blocks.Sources.Sine sine(amplitude = 10)
          annotation (Placement(transformation(origin = {-116.0, 76.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation(r = {0, 0.02, 0})
          annotation (Placement(transformation(origin = {70.0, 30.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));



        Modelica.Mechanics.Rotational.Components.IdealGearR2T idealGearR2T
          annotation (Placement(transformation(origin = {42.0, 76.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.Translational.Sensors.ForceSensor forceSensor
          annotation (Placement(transformation(origin = {92.0, 76.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.MultiBody.Forces.WorldForce force
          annotation (Placement(transformation(origin = {98.0, 30.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
            rotation = 180.0)));
        Modelica.Blocks.Sources.Constant const(k = 0)
          annotation (Placement(transformation(origin = {150.0, 70.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.Translational.Components.MassWithStopAndFriction massWithStopAndFriction
          annotation (Placement(transformation(origin = {120.0, 76.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation1(r = {0, 0.02, 0}, width = 0.01)
          annotation (Placement(transformation(origin = {118.0, -14.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
      equation 
        connect(revolute.frame_a, world.frame_b)
          annotation (Line(origin = {-100.0, 0.0}, 
            points = {{6.0, 0.0}, {-12.0, 0.0}, {-12.0, -2.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(revolute.frame_b, revolute1.frame_a)
          annotation (Line(origin = {-69.0, 0.0}, 
            points = {{-5.0, 0.0}, {5.0, 0.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(revolute2.frame_a, revolute1.frame_b)
          annotation (Line(origin = {-41.0, 0.0}, 
            points = {{13.0, 0.0}, {-3.0, 0.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(revolute2.frame_b, prismatic.frame_a)
          annotation (Line(origin = {-14.0, 0.0}, 
            points = {{6.0, 0.0}, {26.0, 0.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(fixed.frame_b, revolute3.frame_a)
          annotation (Line(origin = {-17.0, -51.0}, 
            points = {{-77.0, 3.0}, {13.0, 3.0}, {13.0, 1.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(revolute3.frame_b, revolute4.frame_a)
          annotation (Line(origin = {21.0, -50.0}, 
            points = {{-5.0, 0.0}, {5.0, 0.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(revolute4.frame_b, revolute5.frame_a)
          annotation (Line(origin = {49.0, -50.0}, 
            points = {{-3.0, 0.0}, {3.0, 0.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(revolute.support, springDamper.flange_a)
          annotation (Line(origin = {-90.0, 25.0}, 
            points = {{0.0, -15.0}, {0.0, 5.0}}));
        connect(springDamper.flange_b, revolute.axis)
          annotation (Line(origin = {-77.0, 25.0}, 
            points = {{7.0, 5.0}, {9.0, 5.0}, {9.0, -13.0}, {-7.0, -13.0}, {-7.0, -15.0}}));
        connect(revolute1.support, springDamper1.flange_a)
          annotation (Line(origin = {-58.0, 26.0}, 
            points = {{-2.0, -16.0}, {-2.0, 4.0}, {2.0, 4.0}}));
        connect(revolute1.axis, springDamper1.flange_b)
          annotation (Line(origin = {-45.0, 26.0}, 
            points = {{-9.0, -16.0}, {9.0, -16.0}, {9.0, 4.0}}));
        connect(revolute3.support, springDamper2.flange_a)
          annotation (Line(origin = {-4.0, -29.0}, 
            points = {{4.0, -11.0}, {-10.0, -11.0}, {-10.0, 1.0}, {-4.0, 1.0}}));
        connect(springDamper2.flange_b, revolute3.axis)
          annotation (Line(origin = {10.0, -29.0}, 
            points = {{2.0, 1.0}, {6.0, 1.0}, {6.0, -11.0}, {-4.0, -11.0}}));
        connect(revolute4.support, springDamper3.flange_a)
          annotation (Line(origin = {30.0, -31.0}, 
            points = {{0.0, -9.0}, {0.0, 3.0}}));
        connect(revolute4.axis, springDamper3.flange_b)
          annotation (Line(origin = {43.0, -31.0}, 
            points = {{-7.0, -9.0}, {-7.0, -7.0}, {9.0, -7.0}, {9.0, 3.0}, {7.0, 3.0}}));
        connect(bodyShape.frame_a, prismatic.frame_b)
          annotation (Line(origin = {40.0, 0.0}, 
            points = {{34.0, 0.0}, {-8.0, 0.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(prismatic.support, springDamper4.flange_a)
          annotation (Line(origin = {12.0, 18.0}, 
            points = {{6.0, -12.0}, {-8.0, -12.0}, {-8.0, 12.0}, {-2.0, 12.0}}, 
            color = {0, 127, 0}));
        connect(prismatic.axis, springDamper4.flange_b)
          annotation (Line(origin = {30.0, 18.0}, 
            points = {{0.0, -12.0}, {4.0, -12.0}, {4.0, 12.0}, {0.0, 12.0}}, 
            color = {0, 127, 0}));
        connect(constantTorque.flange, revolute2.axis)
          annotation (Line(origin = {-49.0, 43.0}, 
            points = {{-21.0, 33.0}, {31.0, 33.0}, {31.0, -33.0}}));
        connect(constantTorque.tau, sine.y)
          annotation (Line(origin = {-102.0, 76.0}, 
            points = {{10.0, 0.0}, {-3.0, 0.0}}, 
            color = {0, 0, 127}));
        connect(bodyShape.frame_a, fixedTranslation.frame_a)
          annotation (Line(origin = {65.0, 15.0}, 
            points = {{9.0, -15.0}, {-5.0, -15.0}, {-5.0, 15.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));


        connect(idealGearR2T.flangeR, constantTorque.flange)
          annotation (Line(origin = {-20.0, 78.0}, 
            points = {{52.0, -2.0}, {-50.0, -2.0}}));
        connect(forceSensor.flange_a, idealGearR2T.flangeT)
          annotation (Line(origin = {67.0, 76.0}, 
            points = {{15.0, 0.0}, {-15.0, 0.0}}, 
            color = {0, 127, 0}));
        connect(force.frame_b, fixedTranslation.frame_b)
          annotation (Line(origin = {79.0, 40.0}, 
            points = {{9.0, -10.0}, {1.0, -10.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(forceSensor.f, force.force[1])
          annotation (Line(origin = {92.0, 58.0}, 
            points = {{-8.0, 7.0}, {-8.0, -10.0}, {30.0, -10.0}, {30.0, -28.0}, {18.0, -28.0}}, 
            color = {0, 0, 127}));
        connect(const.y, force.force[2])
          annotation (Line(origin = {135.0, 60.0}, 
            points = {{26.0, 10.0}, {31.0, 10.0}, {31.0, -30.0}, {-25.0, -30.0}}, 
            color = {0, 0, 127}));
        connect(const.y, force.force[3])
          annotation (Line(origin = {138.0, 60.0}, 
            points = {{23.0, 10.0}, {28.0, 10.0}, {28.0, -30.0}, {-28.0, -30.0}}, 
            color = {0, 0, 127}));
        connect(forceSensor.flange_b, massWithStopAndFriction.flange_a)
          annotation (Line(origin = {111.0, 83.0}, 
            points = {{-9.0, -7.0}, {-1.0, -7.0}}, 
            color = {0, 127, 0}));
        connect(revolute5.frame_b, prismatic2.frame_b)
          annotation (Line(origin = {78.0, -50.0}, 
            points = {{-6.0, 0.0}, {6.0, 0.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(prismatic2.frame_a, bodyShape.frame_b)
          annotation (Line(origin = {112.0, -25.0}, 
            points = {{-8.0, -25.0}, {18.0, -25.0}, {18.0, 25.0}, {-18.0, 25.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(fixedTranslation1.frame_a, bodyShape.frame_b)
          annotation (Line(origin = {101.0, -7.0}, 
            points = {{7.0, -7.0}, {-7.0, -7.0}, {-7.0, 7.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
      end T1;
      model T2
        annotation (Diagram(coordinateSystem(extent = {{-140.0, -100.0}, {140.0, 100.0}}, 
          preserveAspectRatio = false, 
          grid = {2.0, 2.0})), 
          Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
            preserveAspectRatio = false, 
            grid = {2.0, 2.0})), 
          experiment(StartTime = 0, StopTime = 10, Interval = 0.001, Algorithm = "Dassl", Tolerance = 1e-005, DoublePrecision = true, StoreEventValue = true));
        inner Modelica.Mechanics.MultiBody.World world
          annotation (Placement(transformation(origin = {-122.0, -2.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));



        Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic(useAxisFlange = true)
          annotation (Placement(transformation(origin = {22.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape(r = {0.5, 0, 0}, r_CM = {0.2, 0, 0}, 
          length = 0.5, width = 0.1, m = 10, I_11 = 0.1)
          annotation (Placement(transformation(origin = {84.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.MultiBody.Parts.Fixed fixed(animation = false, r = {0.5, -0, 0})
          annotation (Placement(transformation(origin = {-40.0, -52.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));



        Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic2
          annotation (Placement(transformation(origin = {94.0, -50.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
            rotation = 180.0)));


        Modelica.Mechanics.MultiBody.Joints.Revolute revolute(n = {0, 1, 0}, 
          useAxisFlange = true) annotation (Placement(transformation(origin = {-84.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.MultiBody.Joints.Revolute revolute1(n = {0, 0, 1}, 
          useAxisFlange = true) annotation (Placement(transformation(origin = {-54.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.MultiBody.Joints.Revolute revolute2(n = {1, 0, 0}, 
          useAxisFlange = true)
          annotation (Placement(transformation(origin = {-18.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.MultiBody.Joints.Revolute revolute3(n = {0, 1, 0}, 
          useAxisFlange = true) annotation (Placement(transformation(origin = {6.0, -50.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.MultiBody.Joints.Revolute revolute4(n = {0, 0, 1}, 
          useAxisFlange = true) annotation (Placement(transformation(origin = {36.0, -50.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.MultiBody.Joints.Revolute revolute5(n = {1, 0, 0})
          annotation (Placement(transformation(origin = {62.0, -50.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.Rotational.Components.SpringDamper springDamper(d = 10)
          annotation (Placement(transformation(origin = {-80.0, 30.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.Rotational.Components.SpringDamper springDamper1(d = 10)
          annotation (Placement(transformation(origin = {-46.0, 30.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.Rotational.Components.SpringDamper springDamper2(d = 10)
          annotation (Placement(transformation(origin = {2.0, -28.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.Rotational.Components.SpringDamper springDamper3(d = 10)
          annotation (Placement(transformation(origin = {40.0, -28.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.Translational.Components.SpringDamper springDamper4(c = 1e6, d = 1000)
          annotation (Placement(transformation(origin = {20.0, 30.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.Rotational.Sources.Torque constantTorque annotation (Placement(transformation(origin = {-80.0, 76.0}, 
          extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Blocks.Sources.Sine sine(amplitude = 10)
          annotation (Placement(transformation(origin = {-116.0, 76.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation(r = {0, 0.02, 0})
          annotation (Placement(transformation(origin = {54.0, 70.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation1(r = {0, 0.02, 0}, width = 0.01)
          annotation (Placement(transformation(origin = {118.0, -14.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
      equation 
        connect(revolute.frame_a, world.frame_b)
          annotation (Line(origin = {-100.0, 0.0}, 
            points = {{6.0, 0.0}, {-12.0, 0.0}, {-12.0, -2.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(revolute.frame_b, revolute1.frame_a)
          annotation (Line(origin = {-69.0, 0.0}, 
            points = {{-5.0, 0.0}, {5.0, 0.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(revolute2.frame_a, revolute1.frame_b)
          annotation (Line(origin = {-41.0, 0.0}, 
            points = {{13.0, 0.0}, {-3.0, 0.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(revolute2.frame_b, prismatic.frame_a)
          annotation (Line(origin = {-14.0, 0.0}, 
            points = {{6.0, 0.0}, {26.0, 0.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(fixed.frame_b, revolute3.frame_a)
          annotation (Line(origin = {-17.0, -51.0}, 
            points = {{-13.0, -1.0}, {13.0, -1.0}, {13.0, 1.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(revolute3.frame_b, revolute4.frame_a)
          annotation (Line(origin = {21.0, -50.0}, 
            points = {{-5.0, 0.0}, {5.0, 0.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(revolute4.frame_b, revolute5.frame_a)
          annotation (Line(origin = {49.0, -50.0}, 
            points = {{-3.0, 0.0}, {3.0, 0.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(revolute.support, springDamper.flange_a)
          annotation (Line(origin = {-90.0, 25.0}, 
            points = {{0.0, -15.0}, {0.0, 5.0}}));
        connect(springDamper.flange_b, revolute.axis)
          annotation (Line(origin = {-77.0, 25.0}, 
            points = {{7.0, 5.0}, {9.0, 5.0}, {9.0, -13.0}, {-7.0, -13.0}, {-7.0, -15.0}}));
        connect(revolute1.support, springDamper1.flange_a)
          annotation (Line(origin = {-58.0, 26.0}, 
            points = {{-2.0, -16.0}, {-2.0, 4.0}, {2.0, 4.0}}));
        connect(revolute1.axis, springDamper1.flange_b)
          annotation (Line(origin = {-45.0, 26.0}, 
            points = {{-9.0, -16.0}, {9.0, -16.0}, {9.0, 4.0}}));
        connect(revolute3.support, springDamper2.flange_a)
          annotation (Line(origin = {-4.0, -29.0}, 
            points = {{4.0, -11.0}, {-10.0, -11.0}, {-10.0, 1.0}, {-4.0, 1.0}}));
        connect(springDamper2.flange_b, revolute3.axis)
          annotation (Line(origin = {10.0, -29.0}, 
            points = {{2.0, 1.0}, {6.0, 1.0}, {6.0, -11.0}, {-4.0, -11.0}}));
        connect(revolute4.support, springDamper3.flange_a)
          annotation (Line(origin = {30.0, -31.0}, 
            points = {{0.0, -9.0}, {0.0, 3.0}}));
        connect(revolute4.axis, springDamper3.flange_b)
          annotation (Line(origin = {43.0, -31.0}, 
            points = {{-7.0, -9.0}, {-7.0, -7.0}, {9.0, -7.0}, {9.0, 3.0}, {7.0, 3.0}}));
        connect(bodyShape.frame_a, prismatic.frame_b)
          annotation (Line(origin = {40.0, 0.0}, 
            points = {{34.0, 0.0}, {-8.0, 0.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(prismatic.support, springDamper4.flange_a)
          annotation (Line(origin = {12.0, 18.0}, 
            points = {{6.0, -12.0}, {-8.0, -12.0}, {-8.0, 12.0}, {-2.0, 12.0}}, 
            color = {0, 127, 0}));
        connect(prismatic.axis, springDamper4.flange_b)
          annotation (Line(origin = {30.0, 18.0}, 
            points = {{0.0, -12.0}, {4.0, -12.0}, {4.0, 12.0}, {0.0, 12.0}}, 
            color = {0, 127, 0}));
        connect(constantTorque.flange, revolute2.axis)
          annotation (Line(origin = {-49.0, 43.0}, 
            points = {{-21.0, 33.0}, {31.0, 33.0}, {31.0, -33.0}}));
        connect(constantTorque.tau, sine.y)
          annotation (Line(origin = {-102.0, 76.0}, 
            points = {{10.0, 0.0}, {-3.0, 0.0}}, 
            color = {0, 0, 127}));
        connect(bodyShape.frame_a, fixedTranslation.frame_a)
          annotation (Line(origin = {65.0, 15.0}, 
            points = {{9.0, -15.0}, {-21.0, -15.0}, {-21.0, 55.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(revolute5.frame_b, prismatic2.frame_b)
          annotation (Line(origin = {78.0, -50.0}, 
            points = {{-6.0, 0.0}, {6.0, 0.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(prismatic2.frame_a, bodyShape.frame_b)
          annotation (Line(origin = {112.0, -25.0}, 
            points = {{-8.0, -25.0}, {18.0, -25.0}, {18.0, 25.0}, {-18.0, 25.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(fixedTranslation1.frame_a, bodyShape.frame_b)
          annotation (Line(origin = {101.0, -7.0}, 
            points = {{7.0, -7.0}, {-7.0, -7.0}, {-7.0, 7.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
      end T2;
      model T3
        annotation (Diagram(coordinateSystem(extent = {{-140.0, -100.0}, {140.0, 100.0}}, 
          preserveAspectRatio = false, 
          grid = {2.0, 2.0})), 
          Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
            preserveAspectRatio = false, 
            grid = {2.0, 2.0})));
        inner Modelica.Mechanics.MultiBody.World world(n = {0, 1, 0})
          annotation (Placement(transformation(origin = {-106.0, 20.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape(shapeType = "1", lengthDirection = {1, 0, 0}, length = 0.001, width = 0.001, extra = 1, r = {-0.196, 0, 0})
          annotation (Placement(transformation(origin = {-64.0, 20.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.MultiBody.Joints.Revolute revolute(n = {1, 0, 0}, useAxisFlange = true)
          annotation (Placement(transformation(origin = {-34.0, 20.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.Rotational.Sources.Position position
          annotation (Placement(transformation(origin = {-58.0, 54.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Blocks.Sources.Sine sine(amplitude = 20)
          annotation (Placement(transformation(origin = {-96.0, 54.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape1(shapeType = "2", lengthDirection = {-1, 0, 0}, length = 0.001, width = 0.001, extra = 1, 
          r = {0.3, 0, 0}) annotation (Placement(transformation(origin = {0.0, 20.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));



        Modelica.Mechanics.MultiBody.Joints.Revolute revolute1(n = {1, 0, 0}, useAxisFlange = true)
          annotation (Placement(transformation(origin = {28.0, 20.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.Rotational.Sources.Position position1(exact = true)
          annotation (Placement(transformation(origin = {20.0, 52.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.Rotational.Sensors.AngleSensor angleSensor
          annotation (Placement(transformation(origin = {-22.0, 54.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedFrame(color_x = {255, 0, 0}, color_y = {85, 255, 0}, color_z = {0, 0, 255})
          annotation (Placement(transformation(origin = {-112.0, -64.0}, 
            extent = {{10.0, -10.0}, {-10.0, 10.0}})));
        Modelica.Blocks.Math.Gain gain(k = -1)
          annotation (Placement(transformation(origin = {-1.0000000000000036, 53.0}, 
            extent = {{-3.0, -3.0}, {3.0, 3.0}})));
        Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape2(shapeType = "3", lengthDirection = {-1, 0, 0}, length = 0.001, width = 0.001, extra = 1, 
          r = {-1.21, 0, 0}) annotation (Placement(transformation(origin = {110.0, 19.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedTranslation(r = {-0.565, 0.25, 0.328}, n = {0, -1, 0}, angle = 270) annotation (Placement(transformation(origin = {84.0, 19.0}, 
          extent = {{10.0, -10.0}, {-10.0, 10.0}})));
        Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic(useAxisFlange = true)
          annotation (Placement(transformation(origin = {56.0, 20.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.Rotational.Components.IdealGearR2T idealGearR2T(ratio = 392.699)
          annotation (Placement(transformation(origin = {-2.0, 84.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.MultiBody.Joints.Revolute revolute2(n = {1, 0, 0}, useAxisFlange = true)
          annotation (Placement(transformation(origin = {58.0, -16.0}, 
            extent = {{10.0, 10.0}, {-10.0, -10.0}})));
        Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation1(r = {1.21, 0, 0})
          annotation (Placement(transformation(origin = {102.0, -16.0}, 
            extent = {{10.0, -10.0}, {-10.0, 10.0}})));
        Modelica.Mechanics.Rotational.Sources.Position position2
          annotation (Placement(transformation(origin = {-34.0, -76.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Blocks.Sources.Sine sine1(amplitude = 20, phase = 1.5707963267949)
          annotation (Placement(transformation(origin = {-72.0, -76.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape3(shapeType = "4", lengthDirection = {1, 0, 0}, length = 0.001, width = 0.001, extra = 1, 
          r_shape = {-1.21, 0, 0}) annotation (Placement(transformation(origin = {22.0, -16.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
            rotation = 180.0)));
        Modelica.Mechanics.MultiBody.Joints.Revolute revolute3(n = {1, 0, 0}, useAxisFlange = true)
          annotation (Placement(transformation(origin = {-6.0, -16.0}, 
            extent = {{10.0, 10.0}, {-10.0, -10.0}})));
        Modelica.Mechanics.Rotational.Sensors.AngleSensor angleSensor1
          annotation (Placement(transformation(origin = {40.0, -40.0}, 
            extent = {{10.0, -10.0}, {-10.0, 10.0}})));
        Modelica.Mechanics.Rotational.Sources.Position position3(exact = true)
          annotation (Placement(transformation(origin = {7.9999999999999964, -41.00000000000001}, 
            extent = {{6.0, -7.0}, {-6.0, 7.0}})));
        Modelica.Blocks.Math.Gain gain1(k = -1)
          annotation (Placement(transformation(origin = {21.0, -41.0}, 
            extent = {{3.0, -3.0}, {-3.0, 3.0}})));
        Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape4(shapeType = "5", lengthDirection = {1, 0, 0}, length = 0.001, width = 0.001, extra = 1, 
          widthDirection = {0, -1, 0}, m = 298.74328, r_CM = {0.081053956, -0.1439152, 00.00062}) annotation (Placement(transformation(origin = {-74.0, -16.0}, 
            extent = {{10.0, -10.0}, {-10.0, 10.0}})));
        Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic1(useAxisFlange = true)
          annotation (Placement(transformation(origin = {-34.0, -16.0}, 
            extent = {{10.0, 10.0}, {-10.0, -10.0}})));
        Modelica.Mechanics.Rotational.Components.IdealGearR2T idealGearR2T1(ratio = 392.699)
          annotation (Placement(transformation(origin = {-12.0, -58.0}, 
            extent = {{10.0, -10.0}, {-10.0, 10.0}})));
        Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedFrame1(color_x = {255, 0, 0}, color_y = {85, 255, 0}, color_z = {0, 0, 255})
          annotation (Placement(transformation(origin = {110.0, 68.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedFrame2(color_x = {255, 0, 0}, color_y = {85, 255, 0}, color_z = {0, 0, 255})
          annotation (Placement(transformation(origin = {-88.0, -36.0}, 
            extent = {{10.0, -10.0}, {-10.0, 10.0}})));
      equation 
        connect(bodyShape.frame_a, world.frame_b)
          annotation (Line(origin = {-74.0, 20.0}, 
            points = {{0.0, 0.0}, {-22.0, 0.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(bodyShape.frame_b, revolute.frame_a)
          annotation (Line(origin = {-49.0, 20.0}, 
            points = {{-5.0, 0.0}, {5.0, 0.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(position.flange, revolute.axis)
          annotation (Line(origin = {-42.0, 50.0}, 
            points = {{-6.0, 4.0}, {8.0, 4.0}, {8.0, -20.0}}));
        connect(position.phi_ref, sine.y)
          annotation (Line(origin = {-86.0, 70.0}, 
            points = {{16.0, -16.0}, {1.0, -16.0}}, 
            color = {0, 0, 127}));
        connect(bodyShape1.frame_a, revolute.frame_b)
          annotation (Line(origin = {-12.0, 20.0}, 
            points = {{2.0, 0.0}, {-12.0, 0.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(revolute1.frame_a, bodyShape1.frame_b)
          annotation (Line(origin = {14.0, 20.0}, 
            points = {{4.0, 0.0}, {-4.0, 0.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(position1.flange, revolute1.axis)
          annotation (Line(origin = {19.0, 52.0}, 
            points = {{11.0, 0.0}, {11.0, -22.0}, {9.0, -22.0}}));

        connect(revolute.axis, angleSensor.flange)
          annotation (Line(origin = {-32.0, 55.0}, 
            points = {{-2.0, -25.0}, {-2.0, -1.0}, {0.0, -1.0}}));
        connect(fixedTranslation.frame_a, bodyShape2.frame_a)
          annotation (Line(origin = {79.0, 19.0}, 
            points = {{15.0, 0.0}, {21.0, 0.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(prismatic.frame_a, revolute1.frame_b)
          annotation (Line(origin = {47.0, 20.0}, 
            points = {{-1.0, 0.0}, {-9.0, 0.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(prismatic.frame_b, fixedTranslation.frame_b)
          annotation (Line(origin = {87.0, 20.0}, 
            points = {{-21.0, 0.0}, {-13.0, 0.0}, {-13.0, -1.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(idealGearR2T.flangeR, revolute.axis)
          annotation (Line(origin = {-24.0, 71.0}, 
            points = {{12.0, 13.0}, {-10.0, 13.0}, {-10.0, -41.0}}));
        connect(idealGearR2T.flangeT, prismatic.axis)
          annotation (Line(origin = {40.0, 69.0}, 
            points = {{-32.0, 15.0}, {24.0, 15.0}, {24.0, -43.0}}, 
            color = {0, 127, 0}));


        connect(fixedTranslation1.frame_a, bodyShape2.frame_b)
          annotation (Line(origin = {116.0, 2.0}, 
            points = {{-4.0, -18.0}, {10.0, -18.0}, {10.0, 17.0}, {4.0, 17.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(position2.flange, revolute2.axis)
          annotation (Line(origin = {21.0, -39.0}, 
            points = {{-45.0, -37.0}, {37.0, -37.0}, {37.0, 13.0}}));
        connect(sine1.y, position2.phi_ref)
          annotation (Line(origin = {-45.0, -52.0}, 
            points = {{-16.0, -24.0}, {-1.0, -24.0}}, 
            color = {0, 0, 127}));
        connect(revolute2.frame_a, fixedTranslation1.frame_b)
          annotation (Line(origin = {80.0, -16.0}, 
            points = {{-12.0, 0.0}, {12.0, 0.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(revolute2.frame_b, bodyShape3.frame_a)
          annotation (Line(origin = {40.0, -16.0}, 
            points = {{8.0, 0.0}, {-8.0, 0.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(bodyShape3.frame_b, revolute3.frame_a)
          annotation (Line(origin = {8.0, -16.0}, 
            points = {{4.0, 0.0}, {-4.0, 0.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(gain.u, angleSensor.phi)
          annotation (Line(origin = {-7.0, 54.0}, 
            points = {{2.0, -1.0}, {1.0, -1.0}, {1.0, 0.0}, {-4.0, 0.0}}, 
            color = {0, 0, 127}));
        connect(gain.y, position1.phi_ref)
          annotation (Line(origin = {5.0, 54.0}, 
            points = {{-3.0, -1.0}, {-3.0, -2.0}, {3.0, -2.0}}, 
            color = {0, 0, 127}));
        connect(revolute2.axis, angleSensor1.flange)
          annotation (Line(origin = {54.0, -33.0}, 
            points = {{4.0, 7.0}, {4.0, -7.0}, {-4.0, -7.0}}));
        connect(angleSensor1.phi, gain1.u)
          annotation (Line(origin = {27.0, -40.0}, 
            points = {{2.0, 0.0}, {2.0, -1.0}, {-2.0, -1.0}}, 
            color = {0, 0, 127}));
        connect(position3.phi_ref, gain1.y)
          annotation (Line(origin = {17.0, -41.0}, 
            points = {{-2.0, 0.0}, {1.0, 0.0}}, 
            color = {0, 0, 127}));
        connect(position3.flange, revolute3.axis)
          annotation (Line(origin = {-2.0, -33.0}, 
            points = {{4.0, -8.0}, {-4.0, -8.0}, {-4.0, 7.0}}));
        connect(revolute3.frame_b, prismatic1.frame_a)
          annotation (Line(origin = {-20.0, -16.0}, 
            points = {{4.0, 0.0}, {-4.0, 0.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(prismatic1.frame_b, bodyShape4.frame_a)
          annotation (Line(origin = {-50.0, -19.0}, 
            points = {{6.0, 3.0}, {-14.0, 3.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(idealGearR2T1.flangeR, revolute2.axis)
          annotation (Line(origin = {34.0, -44.0}, 
            points = {{-36.0, -14.0}, {24.0, -14.0}, {24.0, 18.0}}));
        connect(idealGearR2T1.flangeT, prismatic1.axis)
          annotation (Line(origin = {-26.0, -42.0}, 
            points = {{4.0, -16.0}, {-20.0, -16.0}, {-20.0, 20.0}, {-16.0, 20.0}}, 
            color = {0, 127, 0}));
        connect(fixedFrame.frame_a, revolute3.frame_b)
          annotation (Line(origin = {-85.0, -34.0}, 
            points = {{-17.0, -30.0}, {67.0, -30.0}, {67.0, 18.0}, {69.0, 18.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(fixedFrame1.frame_a, revolute1.frame_b)
          annotation (Line(origin = {69.0, 45.0}, 
            points = {{31.0, 23.0}, {-25.0, 23.0}, {-25.0, -25.0}, {-31.0, -25.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
        connect(fixedFrame2.frame_a, bodyShape4.frame_a)
          annotation (Line(origin = {-71.0, -26.0}, 
            points = {{-7.0, -10.0}, {7.0, -10.0}, {7.0, 10.0}}, 
            color = {95, 95, 95}, 
            thickness = 0.5));
      end T3;
      model Model1
        annotation (Diagram(coordinateSystem(extent = {{-140.0, -100.0}, {140.0, 100.0}}, 
          preserveAspectRatio = false, 
          grid = {2.0, 2.0})), 
          Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
            preserveAspectRatio = false, 
            grid = {2.0, 2.0})), 
          experiment(StartTime = 0, StopTime = 5, NumberOfIntervals = 500, Algorithm = "Dassl", Tolerance = 0.0001, DoublePrecision = true, StoreEventValue = true));
        SubSystem.BGXY3 bGXY3_1
          annotation (Placement(transformation(origin = {63.0, -7.0}, 
            extent = {{-25.0, -25.0}, {25.0, 25.0}})));
        Modelica.Mechanics.Rotational.Sources.Position position
          annotation (Placement(transformation(origin = {-25.0, 45.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Blocks.Sources.Sine sine(amplitude = 60, freqHz = 0.2)
          annotation (Placement(transformation(origin = {-71.0, -83.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Mechanics.Rotational.Sources.Position position2
          annotation (Placement(transformation(origin = {-1.0, -85.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Blocks.Sources.Sine sine1(amplitude = 60, phase = 1.5707963267949, freqHz = 0.2)
          annotation (Placement(transformation(origin = {-73.0, -11.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
      equation 
        connect(position2.flange, bGXY3_1.axis1)
          annotation (Line(origin = {24.0, -53.0}, 
            points = {{-15.0, -32.0}, {-4.0, -32.0}, {-4.0, 31.0}, {14.0, 31.0}}));
        connect(position.flange, bGXY3_1.axis)
          annotation (Line(origin = {12.0, 27.0}, 
            points = {{-27.0, 18.0}, {4.0, 18.0}, {4.0, -19.0}, {26.0, -19.0}}));
        connect(sine1.y, position.phi_ref)
          annotation (Line(origin = {-49.0, 17.0}, 
            points = {{-13.0, -28.0}, {9.0, -28.0}, {9.0, 28.0}, {12.0, 28.0}}, 
            color = {0, 0, 127}));
        connect(sine.y, position2.phi_ref)
          annotation (Line(origin = {-36.0, -84.0}, 
            points = {{-24.0, 1.0}, {23.0, 1.0}, {23.0, -1.0}}, 
            color = {0, 0, 127}));
      end Model1;
    end Test;
  end Mechanical;
  package ControlBlocks "框图模型"
    annotation (Diagram(coordinateSystem(extent = {{-140.0, -100.0}, {140.0, 100.0}}, 
      preserveAspectRatio = false, 
      grid = {2.0, 2.0})), 
      Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
        preserveAspectRatio = false, 
        grid = {2.0, 2.0})));
    package Components
      annotation (Diagram(coordinateSystem(extent = {{-140.0, -100.0}, {140.0, 100.0}}, 
        preserveAspectRatio = false, 
        grid = {2.0, 2.0})), 
        Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
          preserveAspectRatio = false, 
          grid = {2.0, 2.0})));
      model InversDynamic
        annotation (Diagram(coordinateSystem(extent = {{-140.0, -100.0}, {140.0, 100.0}}, 
          preserveAspectRatio = false, 
          grid = {2.0, 2.0})), 
          Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
            preserveAspectRatio = false, 
            grid = {2.0, 2.0}), graphics = {Rectangle(origin = {0.0, 0.0}, 
            fillColor = {255, 255, 255}, 
            extent = {{-100.0, 100.0}, {100.0, -100.0}})}));
        FeedSystem.Mechanical.In_FeedSystem in_FeedSystem
          annotation (Placement(transformation(origin = {-4.0000000000000036, -1.9999999999999982}, 
            extent = {{-30.0, -30.0}, {30.0, 30.0}})));
        Modelica.Blocks.Math.InverseBlockConstraints inverseBlockConstraints
          annotation (Placement(transformation(origin = {7.0, -42.0}, 
            extent = {{-75.0, -40.00000000000001}, {75.0, 39.99999999999999}})));
        Modelica.Blocks.Interfaces.RealInput u1 "Input signal 1 (u1 = u2)" 
          annotation (Placement(transformation(origin = {-120.0, 0.0}, 
            extent = {{-20.0, -20.0}, {20.0, 20.0}})));
        Modelica.Blocks.Interfaces.RealOutput y1 "Output signal 1 (y1 = y2)" 
          annotation (Placement(transformation(origin = {110.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
      equation 
        connect(inverseBlockConstraints.y2, in_FeedSystem.tau)
          annotation (Line(origin = {26.0, 14.0}, 
            points = {{45.0, -56.0}, {40.0, -56.0}, {40.0, 16.0}, {-65.0, 16.0}, {-65.0, -16.0}}, 
            color = {0, 0, 127}));
        connect(in_FeedSystem.s, inverseBlockConstraints.u2)
          annotation (Line(origin = {-27.0, -20.0}, 
            points = {{56.0, 18.0}, {79.0, 18.0}, {79.0, -19.0}, {-26.0, -19.0}, {-26.0, -22.0}}, 
            color = {0, 0, 127}));
        connect(inverseBlockConstraints.u1, u1)
          annotation (Line(origin = {-125.0, -1.0}, 
            points = {{50.0, -41.0}, {5.0, -41.0}, {5.0, 1.0}}, 
            color = {0, 0, 127}));
        connect(inverseBlockConstraints.y1, y1)
          annotation (Line(origin = {110.0, -1.0}, 
            points = {{-24.0, -41.0}, {0.0, -41.0}, {0.0, 1.0}}, 
            color = {0, 0, 127}));
      end InversDynamic;
      model FeedforwardSignal
        parameter Real T = 10.56;
        parameter Real width(
          final min = Modelica.Constants.small, 
          final max = 100) = 15.9;
        parameter Real StartTime1 = 0.68;
        parameter Real StartTime2 = 5.96;

        parameter Real I = 0.2;
        annotation (Diagram(coordinateSystem(extent = {{-140.0, -100.0}, {140.0, 100.0}}, 
          preserveAspectRatio = false, 
          grid = {2.0, 2.0})), 
          Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
            preserveAspectRatio = false, 
            grid = {2.0, 2.0}), graphics = {Rectangle(origin = {0.0, 0.0}, 
            fillColor = {255, 255, 255}, 
            extent = {{-100.0, 100.0}, {100.0, -100.0}})}), 
          experiment(StartTime = 0, StopTime = 20, NumberOfIntervals = 500, Algorithm = "Dassl", Tolerance = 0.0001, DoublePrecision = true, StoreEventValue = true));
        Modelica.Blocks.Interfaces.RealOutput y
          annotation (Placement(transformation(origin = {108.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Blocks.Sources.Pulse pulse(startTime = StartTime1, offset = 0, width = width, 
          period = T, 
          amplitude = I)
          annotation (Placement(transformation(origin = {-16.0, 32.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Blocks.Sources.Pulse pulse1(startTime = StartTime2, offset = 0, width = width, 
          period = T, 
          amplitude = -I)
          annotation (Placement(transformation(origin = {-16.0, -20.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Blocks.Math.Add add
          annotation (Placement(transformation(origin = {32.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
      equation 
        connect(pulse.y, add.u1)
          annotation (Line(origin = {8.0, 19.0}, 
            points = {{-13.0, 13.0}, {12.0, 13.0}, {12.0, -13.0}}, 
            color = {0, 0, 127}));
        connect(pulse1.y, add.u2)
          annotation (Line(origin = {8.0, -13.0}, 
            points = {{-13.0, -7.0}, {12.0, -7.0}, {12.0, 7.0}}, 
            color = {0, 0, 127}));
        connect(add.y, y)
          annotation (Line(origin = {76.0, 0.0}, 
            points = {{-33.0, 0.0}, {32.0, 0.0}}, 
            color = {0, 0, 127}));
      end FeedforwardSignal;
      block PIAntiWindUp "抗积分饱和与输出限幅PI控制器"

        parameter Real kp(min = 0) = 10 "比例系数 ";
        parameter Modelica.SIunits.Time Ti(final min = Modelica.Constants.small) = 20 "积分时间常数";
        parameter Real Limit(min = 0) = 100 "输出限幅";
      protected 
        Modelica.Blocks.Continuous.Integrator integrator(
          k = 1 / Ti)
          annotation (extent = [-10, -10; 10, 10]);
        Modelica.Blocks.Math.Add add1(
          k2 = -1)
          annotation (extent = [-40, -10; -20, 10]);
        Modelica.Blocks.Math.Add add2
          annotation (extent = [20, -10; 40, 10]);
        Modelica.Blocks.Math.Feedback feedback
          annotation (extent = [20, -20; 40, -40], 
            rotation = 180);
        Modelica.Blocks.Math.Gain gainkp(
          final k = kp)
          annotation (extent = [-80, -10; -60, 10]);
        Modelica.Blocks.Math.Gain gain05(
          final k = 0.5)
          annotation (extent = [10, -40; -10, -20]);
        annotation (defaultComponentName = "PI", 
          Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
            grid = {2.0, 2.0}), graphics = {Line(origin = {15.0, 0.0}, 
            points = {{-60.22, -68.08}, {-60.22, -2.618}, {60.22, 68.08}}, 
            color = {0, 0, 255}, 
            fillColor = {0, 0, 0}, 
            fillPattern = FillPattern.Solid), Rectangle(origin = {0.0, 0.0}, 
            fillColor = {255, 255, 255}, 
            extent = {{-100.0, 100.0}, {100.0, -100.0}})}));
      public 
        Modelica.Blocks.Nonlinear.VariableLimiter variablelimiter
          annotation (Placement(transformation(extent = {{64, -10}, {84, 10}})));
        Modelica.Blocks.Interfaces.RealOutput y "Connector of Real output signal" 
          annotation (Placement(transformation(extent = {{100, -10}, {120, 10}})));
        Modelica.Blocks.Interfaces.RealInput u "Input signal connector" 
          annotation (Placement(transformation(extent = {{-118.4, -12.36}, {-93.64, 12.36}})));
        Modelica.Blocks.Sources.Constant const(
          k = Limit)
          annotation (Placement(transformation(extent = {{-20, 70}, {0, 90}})));
      protected 
        Modelica.Blocks.Math.Gain gain1(
          final k = -1)
          annotation (Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 180, origin = {22, 56})));
      equation 
        connect(add1.y, integrator.u)
          annotation (points = [-19, 0; -12, 0], 
            style(color = 74, rgbcolor = {0, 0, 127}));
        connect(feedback.u1, add2.y)
          annotation (points = [38, -30; 50, -30; 50, 0; 41, 0], 
            style(color = 74, rgbcolor = {0, 0, 127}));
        connect(gainkp.y, add1.u1)
          annotation (points = [-59, 0; -46, 0; -46, 6; -42, 6], 
            style(color = 74, rgbcolor = {0, 0, 127}));
        connect(feedback.y, gain05.u)
          annotation (points = [21, -30; 12, -30], 
            style(color = 74, rgbcolor = {0, 0, 127}));
        connect(gain05.y, add1.u2)
          annotation (points = [-11, -30; -50, -30; -50, -6; -42, -6], 
            style(color = 74, rgbcolor = {0, 0, 127}));
        connect(integrator.y, add2.u2)
          annotation (points = [11, 0; 15, 0; 15, -6; 18, -6], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              fillColor = 30, 
              rgbfillColor = {215, 215, 215}, 
              fillPattern = 1));
        connect(gainkp.y, add2.u1)
          annotation (points = [-59, 0; -50, 0; -50, 20; 15, 20; 15, 6; 18, 6], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              fillColor = 30, 
              rgbfillColor = {215, 215, 215}, 
              fillPattern = 1));
        connect(add2.y, variablelimiter.u)
          annotation (Line(points = {{41, 0}, {62, 0}}, color = {0, 0, 127}));
        connect(variablelimiter.y, feedback.u2)
          annotation (Line(points = {{85, 0}, {91, 0}, {91, -45}, {30, -45}, {30, -38}}, color = {0, 0, 127}));
        connect(variablelimiter.y, y)
          annotation (Line(points = {{85, 0}, {110, 0}}, color = {0, 0, 127}));
        connect(gainkp.u, u)
          annotation (Line(points = {{-82, 0}, {-106, 0}}, color = {0, 0, 127}));
        connect(const.y, gain1.u)
          annotation (Line(points = {{1, 80}, {10, 80}, {10, 56}}, color = {0, 0, 127}));
        connect(const.y, variablelimiter.limit1)
          annotation (Line(points = {{1, 80}, {62, 80}, {62, 8}}, color = {0, 0, 127}));
        connect(gain1.y, variablelimiter.limit2)
          annotation (Line(points = {{33, 56}, {33, 53}, {55, 53}, {55, -8}, {62, -8}}, color = {0, 0, 127}));
      end PIAntiWindUp;
      model DigitalPI_V "系数可变的数字PI控制器"
        extends Modelica.Blocks.Interfaces.SISO;
        Real Kp "可变比例系数";
        parameter Real T = 0.001 "采样周期";
        parameter Real u_max = 28 "输出限幅值";
      protected 
        parameter Real Ti = 0.03;
      public 
        Real Ki "可变积分系数，=Kp * T / Ti";
        Modelica.Blocks.Discrete.Sampler sampler(
          samplePeriod = T)
          annotation (Placement(transformation(extent = {{-56, 40}, {-36, 60}})));
        annotation (Icon(graphics = {
          Rectangle(extent = {{-100, 100}, {100, -100}}, color = {0, 0, 0}, fillColor = {161, 178, 76}, fillPattern = FillPattern.Solid), 
          Line(points = {{-60, -90}, {-60, -30}, {83.19, 96.65}}), 
          Text(extent = {{14, 8}, {90.76, -43.42}}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, textString = "PI")}));
        Modelica.Blocks.Interfaces.RealInput KT[2]
          annotation (Placement(transformation(origin = {0, 104}, rotation = 270, extent = {{-12.36, -12.36}, {12.36, 12.36}})));
        Modelica.Blocks.Nonlinear.Limiter limiter1(
          uMax = u_max)
          annotation (Placement(transformation(extent = {{48, 30}, {68, 50}})));
        Modelica.Blocks.Nonlinear.Limiter limiter2(
          uMax = u_max)
          annotation (Placement(transformation(extent = {{42, -34}, {62, -14}})));
        Sample_sum sample_sum(
          T = T)
          annotation (Placement(transformation(extent = {{-10, 40}, {10, 60}})));
      equation 
        KT[1] = Kp;
        KT[2] = Ki;
        limiter2.u = Kp * sampler.y;
        limiter1.u = Ki * sample_sum.y;
        y = limiter1.y + limiter2.y;
        connect(sampler.y, sample_sum.u)
          annotation (Line(points = {{-35, 50}, {-11, 50}}, color = {0, 0, 127}));
        connect(sampler.u, u)
          annotation (Line(points = {{-58, 50}, {-80, 50}, {-80, 0}, {-98, 0}}, color = {0, 0, 127}));
      end DigitalPI_V;
      model Sample_sum "采样值求和"
        extends Modelica.Blocks.Interfaces.SISO;
        parameter Real T = 0.001 "采样周期";
        annotation (Icon(graphics = {
          Rectangle(extent = {{-100, 100}, {100, -100}}, color = {0, 0, 0}, fillColor = {139, 139, 0}, fillPattern = FillPattern.Solid), 
          Line(points = {{74, 82}, {-53.52, 81.51}}), 
          Line(points = {{-53.52, 81.51}, {20, 10}}), 
          Line(points = {{20, 10}, {-54.78, -64.46}}), 
          Line(points = {{-54.78, -64.46}, {82.77, -64.46}})}));
      equation 
        when sample(0, T) then 
          y = pre(y) + u;
        end when;
      end Sample_sum;
      model P_v "系数可变比例控制器"
        extends Modelica.Blocks.Interfaces.SISO;
        Modelica.Blocks.Interfaces.RealInput u1
          annotation (Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = -90, origin = {0, 98})));
        annotation (Icon(graphics = {
          Rectangle(extent = {{-100, 100}, {100, -100}}, color = {0, 0, 0}, fillColor = {161, 178, 76}, fillPattern = FillPattern.Solid), 
          Polygon(points = {{-60, 50}, {-60, -50}, {70, 0}}, color = {0, 0, 255}, fillColor = {170, 213, 255}, fillPattern = FillPattern.Solid)}));
      equation 
        y = u1 * u;
      end P_v;

      model DrawCircle
        parameter Real o[2] = {0, 0} "圆心坐标";
        parameter Real k = 1000 "径向误差放大倍数";
        Real R;
        annotation (Diagram(coordinateSystem(extent = {{-140.0, -100.0}, {140.0, 100.0}}, 
          preserveAspectRatio = false, 
          grid = {2.0, 2.0})), 
          Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
            preserveAspectRatio = false, 
            grid = {2.0, 2.0}), graphics = {Rectangle(origin = {0.0, 0.0}, 
            fillColor = {255, 255, 255}, 
            extent = {{-100.0, 100.0}, {100.0, -100.0}})}));
        Modelica.Blocks.Interfaces.RealInput x[2]
          annotation (Placement(transformation(origin = {-110.0, 60.0}, 
            extent = {{-20.0, -20.0}, {20.0, 20.0}})));
        Modelica.Blocks.Interfaces.RealInput y[2]
          annotation (Placement(transformation(origin = {-112.0, -60.0}, 
            extent = {{-20.0, -20.0}, {20.0, 20.0}})));
        Modelica.Blocks.Interfaces.RealOutput e
          annotation (Placement(transformation(origin = {110.0, 60.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Blocks.Interfaces.RealOutput xy[2]
          annotation (Placement(transformation(origin = {110.0, -60.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
      equation 
        e = sqrt((x[1] - o[1]) ^ 2 + (y[1] - o[2]) ^ 2) - sqrt((x[2] - o[1]) ^ 2 + (y[2] - o[2]) ^ 2);
        R = sqrt((x[1] - o[1]) ^ 2 + (y[1] - o[2]) ^ 2) - k * e;
        xy[1] = R * x[1] / sqrt((x[1] - o[1]) ^ 2 + (y[1] - o[2]) ^ 2);
        xy[2] = R * y[1] / sqrt((x[1] - o[1]) ^ 2 + (y[1] - o[2]) ^ 2);
      end DrawCircle;
    end Components;
    package Drivers "控制驱动模型"

      block TimeTable
        "Generate a (possibly discontinuous) signal by linear interpolation in a table"
        parameter Real table[:,2] = [0, 0; 1, 1; 2, 4]
          "Table matrix (time = first column)";
        parameter Real offset = 0 "Offset of output signal";
        parameter Modelica.SIunits.Time startTime = 0
          "Output = offset for time < startTime";
        extends FeedSystem.Mechanical.EDP.Drivers.Interfaces.SO;
      protected 
        Real a "Interpolation coefficients a of actual interval (y=a*x+b)";
        Real b "Interpolation coefficients b of actual interval (y=a*x+b)";
        Integer last(
          start = 1) "Last used lower grid index";
        Modelica.SIunits.Time nextEvent(
          start = 0) "Next event instant";
        annotation (Coordsys(
          preserveAspectRatio = false, 
          extent = [-100, -100; 100, 100], 
          grid = [1, 1]), 
          Coordsys(
            extent = [-100, -100; 100, 100], 
            grid = [1, 1], 
            component = [20, 20]), 
          Window(
            x = 0.26, 
            y = 0.01, 
            width = 0.7, 
            height = 0.82), 
          Icon(
            Rectangle(extent = [-100, -102; 100, 100], style(rgbcolor = {0, 0, 0}, pattern = 1, rgbfillColor = {255, 255, 255}, fillPattern = 1)), 
            Text(extent = [-58, 48; 29, 96], style(rgbcolor = {0, 0, 255}, thickness = 2), string = "Control "), Rectangle(extent = [-63, 40; -13, 60], style(thickness = 2, rgbfillColor = {0, 147, 0}, fillPattern = 0, rgbcolor = {139, 0, 0})), 
            Rectangle(extent = [-63, 0; -13, 20], style(thickness = 2, rgbfillColor = {0, 147, 0}, fillPattern = 0, rgbcolor = {139, 0, 0})), 
            Text(extent = [-3, -11; 77, 34], style(rgbcolor = {0, 0, 255}, thickness = 2), string = "Speed2"), 
            Rectangle(extent = [-63, -40; -13, -20], style(thickness = 2, rgbfillColor = {0, 147, 0}, fillPattern = 0, rgbcolor = {139, 0, 0})), 
            Text(extent = [-3, -51; 77, -6], style(rgbcolor = {0, 0, 255}, thickness = 2), string = "Speed3"), 
            Rectangle(extent = [-63, -80; -13, -60], style(thickness = 2, rgbfillColor = {0, 147, 0}, fillPattern = 0, rgbcolor = {139, 0, 0})), 
            Text(extent = [-3, -91; 77, -46], style(rgbcolor = {0, 0, 255}, thickness = 2), string = "Speed4"), 
            Text(extent = [-63, 40; -13, 60], style(rgbcolor = {0, 0, 0}, rgbfillColor = {192, 192, 192}), string = "T0"), 
            Line(points = [5, 39; 69, 39], style(rgbcolor = {0, 0, 0}, pattern = 2)), 
            Line(points = [5, -5; 69, -5], style(rgbcolor = {0, 0, 0}, pattern = 2)), 
            Line(points = [5, -41; 69, -41], style(rgbcolor = {0, 0, 0}, pattern = 2)), 
            Line(points = [5, -80; 69, -80], style(rgbcolor = {0, 0, 0}, pattern = 2)), 
            Text(extent = [-63, 0; -13, 20], style(rgbcolor = {0, 0, 0}, rgbfillColor = {192, 192, 192}), string = "T1"), 
            Text(extent = [-63, -40; -13, -20], style(rgbcolor = {0, 0, 0}, rgbfillColor = {192, 192, 192}), string = "T2"), 
            Text(extent = [-63, -80; -13, -60], style(rgbcolor = {0, 0, 0}, rgbfillColor = {192, 192, 192}), string = "T3"), 
            Line(points = [-85, 84; -85, -86; -85, -91; 85, -91; 85, 84; 25, 84], style(rgbcolor = 
              {51, 204, 204}, thickness = 2)), 
            Line(points = [-85, 84; -52, 84], style(rgbcolor = {51, 204, 204}, thickness = 2)), 
            Text(extent = [-3, 33; 77, 78], style(rgbcolor = {0, 0, 255}, thickness = 2), string = "Speed1")), 
          Diagram, 
          Documentation(info = "<HTML><p>This block generates an output signal by <b>linear interpolation</b> ina table. The time points and function values are stored in a matrix<b>table[i,j]</b>, where the first column table[:,1] contains thetime points and the second column contains the data to be interpolated.The table interpolation has the following proporties:</p><ul><li>The time points need to be <b>monotonically increasing</b>. </li><li><b>Discontinuities</b> are allowed, by providing the same    time point twice in the table. </li><li>Values <b>outside</b> of the table range, are computed by    <b>extrapolation</b> through the last or first two points of the    table.</li><li>If the table has only <b>one row</b>, no interpolation is performed and    the function value is just returned independantly of the    actual time instant.</li><li>Via parameters <b>startTime</b> and <b>offset</b> the curve defined    by the table can be shifted both in time and in the ordinate value.<li>The table is implemented in a numerically sound way by    generating <b>time events</b> at interval boundaries,    in order to not integrate over a discontinuous or not differentiable    points.</li></ul><p>Example:</p><pre>   table = [0  0            1  0            1  1            2  4            3  9            4 16]If, e.g., time = 1.0, the output y =  0.0 (before event), 1.0 (after event)    e.g., time = 1.5, the output y =  2.5,    e.g., time = 2.0, the output y =  4.0,    e.g., time = 5.0, the output y = 23.0 (i.e. extrapolation).</pre><p><img src=\"../Images/Blocks/Sources/TimeTable.png\"></p></HTML> ", revisions = "<html><p><b>Release Notes:</b></p><ul><li><i>Oct. 21, 2002</i>       by <a href=\"http://www.robotic.dlr.de/Christian.Schweiger/\">Christian Schweiger</a>:<br>       Corrected interface from<pre>    parameter Real table[:, :]=[0, 0; 1, 1; 2, 4];</pre>       to<pre>    parameter Real table[:, <b>2</b>]=[0, 0; 1, 1; 2, 4];</pre>       </li><li><i>Nov. 7, 1999</i>       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>       Realized.</li></ul></html>"));
      algorithm 
        when {time >= pre(nextEvent), initial()} then 
          (a,b,nextEvent,last) := Modelica.Blocks.Sources.TimeTable.getInterpolationCoefficients(table, offset, 
            startTime, time, last, 100 * Modelica.Constants.eps);
        end when;
      equation 
        y = a * time + b;
      end TimeTable;

      model CUnit "控制器"
        parameter Real p = 1 "极对数";
        parameter Real Udc = 300 "额定电压";
        parameter Real T_PWM = 0.0001 "PWM周期";
        parameter Real kv = 0.3 "速度环增益" 
          annotation (Dialog(group = "PI控制参数"));
        parameter Real Tv = 0.3 / 35 "速度环积分常数" 
          annotation (Dialog(group = "PI控制参数"));
        parameter Real kq = 30 "q轴电流增益值" 
          annotation (Dialog(group = "PI控制参数"));
        parameter Real Tq = 30 / 1900 "q轴电流积分常数" 
          annotation (Dialog(group = "PI控制参数"));
        parameter Real kd = 30 "d轴电流增益值" 
          annotation (Dialog(group = "PI控制参数"));
        parameter Real Td = 30 / 1900 "d轴电流积分常数" 
          annotation (Dialog(group = "PI控制参数"));
        final parameter Real uMax1 = 100;
        final parameter Real uMax2 = 100;
        final parameter Real uMax3 = 100;
        MachineToolDynamic.ControlBlocks.Drivers.Components.ab_N ab_N
          annotation (extent = [-90, -20; -70, 0]);
        MachineToolDynamic.ControlBlocks.Drivers.Components.abTU_xyz abTU_xyz
          annotation (extent = [-90, 10; -70, 50]);
        Components.NXYZ_T1T2 nXYZ_T1T2_1
          annotation (extent = [-50, 10; -10, 50]);
        Components.T1T2_Tabc t1T2_Tabc
          annotation (extent = [10, 10; 50, 50]);
        Components.Tabc_Tcm tabc_Tcm
          annotation (extent = [70, 10; 110, 50]);
        Modelica.Blocks.Sources.Constant Ux(
          k = Udc)
          annotation (extent = [-200, 8; -180, 28]);
        MachineToolDynamic.ControlBlocks.Drivers.Components.Clark clark
          annotation (extent = [110, -152; 70, -112]);
        MachineToolDynamic.ControlBlocks.Drivers.Components.Park park
          annotation (extent = [50, -150; 10, -110]);
        Modelica.Blocks.Math.Feedback feedback1
          annotation (Placement(transformation(extent = {{-180.0, -50.0}, {-160.0, -70.0}})));
        Modelica.Blocks.Math.Feedback feedback2
          annotation (extent = [-130, -110; -110, -90]);
        Modelica.Blocks.Continuous.PI PI1(
          k = kv, T = Tv)
          annotation (extent = [-150, -70; -130, -50]);
        Modelica.Blocks.Math.Feedback feedback3
          annotation (extent = [-90, -70; -70, -50]);
        Modelica.Blocks.Continuous.PI PI2(
          k = kd, T = Td)
          annotation (extent = [-60, -110; -40, -90]);
        Modelica.Blocks.Continuous.PI PI3(
          k = kq, T = Tq)
          annotation (extent = [-60, -70; -40, -50]);
        MachineToolDynamic.ControlBlocks.Drivers.Components.rPark rPark
          annotation (extent = [30, -70; 70, -30], 
            rotation = 90);
        Modelica.Blocks.Interfaces.RealInput i_fb[3]
          annotation (Placement(transformation(extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 270, origin = {110.0, 200.0})));
        Modelica.Blocks.Interfaces.RealInput phi "Absolute angle of flange" 
          annotation (Placement(transformation(extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 270, origin = {-100.0, 200.0})));
        Modelica.Blocks.Interfaces.BooleanOutput pulse[6]
          annotation (extent = [190, -10; 210, 10]);
        Modelica.Blocks.Interfaces.RealInput speed
          annotation (Placement(transformation(extent = {{-210.0, -10.0}, {-190.0, 10.0}})));
        Components.PWM pWM(
          T_PWM = T_PWM)
          annotation (extent = [128, 10; 166, 50]);
        Modelica.Blocks.Sources.Constant T(
          k = T_PWM)
          annotation (extent = [-200, 42; -180, 62]);
        Modelica.Blocks.Nonlinear.Limiter limiter1(
          uMax = uMax1)
          annotation (extent = [-118, -70; -98, -50]);
        Modelica.Blocks.Nonlinear.Limiter limiter2(
          uMax = uMax2)
          annotation (extent = [-20, -70; 0, -50]);
        Modelica.Blocks.Nonlinear.Limiter limiter3(
          uMax = uMax3)
          annotation (extent = [-20, -110; 0, -90]);
        Modelica.Blocks.Math.Gain gain(
          k = p)
          annotation (extent = [-60, 130; -40, 150]);
        Modelica.Blocks.Logical.Not not1[3]
          annotation (Placement(transformation(extent = {{158.0, -28.0}, {178.0, -8.0}}, preserveAspectRatio = true)));
        Modelica.Blocks.Continuous.Der der1
          annotation (Placement(transformation(extent = {{-10.0, 12.0}, {10.0, -8.0}}, rotation = 180, origin = {-130.0, 112.0})));
        Modelica.Blocks.Sources.Constant i(
          k = 0)
          annotation (Placement(transformation(extent = {{-192.0, -110.0}, {-172.0, -90.0}})));
      equation 
        connect(T.y, abTU_xyz.T)
          annotation (points = [-179, 52; -120, 52; -120, 26; -90, 
            26], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(ab_N.N, nXYZ_T1T2_1.N)
          annotation (points = [-70, -10; -56, -10; -56, 
            14; -50, 14], 
            style(
              color = 45, 
              rgbcolor = {255, 127, 0}, 
              smooth = 0));
        connect(abTU_xyz.Z, nXYZ_T1T2_1.Z)
          annotation (points = [-70, 18; -60, 18; 
            -60, 30; -50, 30], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(abTU_xyz.Y, nXYZ_T1T2_1.Y)
          annotation (points = [-70, 30; -60, 30; 
            -60, 38; -50, 38], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(abTU_xyz.X, nXYZ_T1T2_1.X)
          annotation (points = [-70, 42; -60, 42; 
            -60, 46; -50, 46], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(T.y, t1T2_Tabc.T)
          annotation (points = [-179, 52; -120, 52; -120, 70; 0, 70; 
            0, 30; 10, 30], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(nXYZ_T1T2_1.T1, t1T2_Tabc.T1)
          annotation (points = [-10, 40; 10, 40], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(nXYZ_T1T2_1.T2, t1T2_Tabc.T2)
          annotation (points = [-10, 20; 10, 20], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(ab_N.N, tabc_Tcm.N)
          annotation (points = [-70, -10; 64, -10; 64, 18; 
            70, 18], 
            style(
              color = 45, 
              rgbcolor = {255, 127, 0}, 
              smooth = 0));
        connect(t1T2_Tabc.Ta, tabc_Tcm.Ta)
          annotation (points = [50, 40; 60, 40; 60, 
            42; 70, 42], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(t1T2_Tabc.Tb, tabc_Tcm.Tb)
          annotation (points = [50, 30; 60, 30; 60, 
            34; 70, 34], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(t1T2_Tabc.Tc, tabc_Tcm.Tc)
          annotation (points = [50, 20; 60, 20; 60, 
            26; 70, 26], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(Ux.y, abTU_xyz.Ux)
          annotation (points = [-179, 18; -90, 18], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(clark.i_beta, park.i_beta)
          annotation (points = [72, -142; 50, -142], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(clark.i_alpha, park.i_alpha)
          annotation (points = [72, -122; 62, -122; 
            62, -130; 50, -130], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(park.i_d, feedback2.u2)
          annotation (points = [12, -140; -120, -140; 
            -120, -108], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(feedback1.y, PI1.u)
          annotation (Line(points = {{-161.0, -60.0}, {-152.0, -60.0}}, color = {0, 0, 127}));
        connect(feedback3.u2, park.i_q)
          annotation (points = [-80, -68; -80, -120; 12, 
            -120], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(feedback3.y, PI3.u)
          annotation (points = [-71, -60; -62, -60], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(feedback2.y, PI2.u)
          annotation (points = [-111, -100; -62, -100], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(abTU_xyz.U_alpha, ab_N.U_alpha)
          annotation (points = [-90, 42; -102, 
            42; -102, -5; -90, -5], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(abTU_xyz.U_beta, ab_N.U_beta)
          annotation (points = [-90, 34; -96, 34; 
            -96, -15; -90, -15], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        annotation (Coordsys(extent = [-200, -200; 200, 200], scale = 0.1), 
          Diagram, 
          Icon(coordinateSystem(preserveAspectRatio = false, 
            extent = {{-200, -200}, {200, 200}}), 
            graphics = {
            Rectangle(extent = {{-160.0, 160.0}, {180.0, -180.0}}, color = {0, 0, 255}), 
            Text(extent = {{-100.0, 182.0}, {-100.0, 162.0}}, color = {0, 0, 255}, textString = "phi_fb"), 
            Text(extent = {{100.0, 180.0}, {100.0, 160.0}}, color = {0, 0, 255}, textString = "i_fb"), 
            Text(extent = {{-156.0, 10.0}, {-156.0, -10.0}}, color = {0, 0, 255}, textString = "w_ref"), 
            Rectangle(extent = {{-160.0, 160.0}, {180.0, -180.0}}, fillColor = {56, 142, 142}, fillPattern = FillPattern.Solid), 
            Rectangle(extent = {{-140.0, 120.0}, {160.0, -60.0}}, fillColor = {0, 0, 139}, fillPattern = FillPattern.Solid), 
            Ellipse(extent = {{-112.0, -100.0}, {-72.0, -140.0}}, fillColor = {125, 158, 192}, fillPattern = FillPattern.Sphere), 
            Ellipse(extent = {{-58.0, -100.0}, {-18.0, -140.0}}, fillColor = {125, 158, 192}, fillPattern = FillPattern.Sphere), 
            Ellipse(extent = {{4.0, -100.0}, {44.0, -140.0}}, fillColor = {125, 158, 192}, fillPattern = FillPattern.Sphere), 
            Text(extent = {{-140.0, 100.0}, {120.0, 40.0}}, fillColor = {0, 0, 139}, fillPattern = FillPattern.Solid, textString = "控制参数输入", color = {255, 215, 0}), 
            Polygon(points = {{-160.0, 160.0}, {-120.0, 180.0}, {200.0, 180.0}, {180.0, 160.0}}, color = {0, 0, 0}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Sphere), 
            Polygon(points = {{200.0, 180.0}, {200.0, -160.0}, {180.0, -180.0}, {180.0, 160.0}, {200.0, 180.0}}, color = {0, 0, 0}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid)}));
        connect(feedback1.u1, speed)
          annotation (Line(points = {{-178.0, -60.0}, {-178.0, 0.0}, {-200.0, 0.0}}, color = {0, 0, 127}));
        connect(rPark.V_alpha, ab_N.U_alpha)
          annotation (points = [40, -32; -102, -32; 
            -102, -5; -90, -5], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(rPark.V_beta, ab_N.U_beta)
          annotation (points = [60, -32; 60, -22; -96, 
            -22; -96, -15; -90, -15], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(tabc_Tcm.Tcm1, pWM.Tcm1)
          annotation (points = [110, 42; 128, 42], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(tabc_Tcm.Tcm2, pWM.Tcm2)
          annotation (points = [110, 30; 128, 30], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(tabc_Tcm.Tcm3, pWM.Tcm3)
          annotation (points = [110, 18; 128, 18], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(nXYZ_T1T2_1.T, T.y)
          annotation (points = [-50, 22; -56, 22; -56, 70; -120, 
            70; -120, 52; -179, 52], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(PI1.y, limiter1.u)
          annotation (points = [-129, -60; -120, -60], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(limiter1.y, feedback3.u1)
          annotation (points = [-97, -60; -88, -60], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(PI3.y, limiter2.u)
          annotation (points = [-39, -60; -22, -60], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(limiter2.y, rPark.V_q)
          annotation (points = [1, -60; 20, -60; 20, -84; 60, 
            -84; 60, -68], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(PI2.y, limiter3.u)
          annotation (points = [-39, -100; -22, -100], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(limiter3.y, rPark.V_d)
          annotation (points = [1, -100; 50, -100; 50, -68], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(clark.i_a, i_fb[1])
          annotation (Line(points = {{110.0, -120.0}, {212.0, -120.0}, {212.0, 200.0}, {110.0, 200.0}}, color = {0, 0, 127}));
        connect(clark.i_b, i_fb[2])
          annotation (Line(origin = {165.0, 34.0}, 
            points = {{-55.0, -166.0}, {55.0, -166.0}, {55.0, 156.0}, {-55.0, 156.0}, {-55.0, 166.0}}, 
            color = {0, 0, 127}));
        connect(clark.i_c, i_fb[3])
          annotation (Line(points = {{110.0, -144.0}, {230.0, -144.0}, {230.0, 206.0}, {100.0, 206.0}, {100.0, 200.0}, 
            {110.0, 200.0}}, color = {0, 0, 127}));
        connect(phi, gain.u)
          annotation (Line(points = {{-100.0, 200.0}, {-160.0, 200.0}, {-160.0, 140.0}, {-62.0, 140.0}}, color = {0, 0, 127}));
        connect(gain.y, rPark.theta)
          annotation (points = [-39, 140; 120, 140; 120, 
            -80; 40, -80; 40, -68], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(gain.y, park.theta)
          annotation (points = [-39, 140; 120, 140; 120, 
            -100; 60, -100; 60, -118; 50, -118], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(pWM.On[:], not1[:].u)
          annotation (Line(points = {{166.0, 30.0}, {172.0, 30.0}, {172.0, 0.0}, {144.0, 0.0}, {144.0, -18.0}, 
            {156.0, -18.0}}, color = {255, 0, 255}));
        connect(pWM.On[:], pulse[1:3])
          annotation (Line(points = {{166.0, 30.0}, {200.0, 30.0}, {200.0, 0.0}}, color = {255, 0, 255}));
        connect(not1[:].y, pulse[4:6])
          annotation (Line(points = {{179.0, -18.0}, {200.0, -18.0}, {200.0, 0.0}}, color = {255, 0, 255}));
        connect(phi, der1.u)
          annotation (Line(points = {{-100.0, 200.0}, {-160.0, 200.0}, {-160.0, 140.0}, {-100.0, 140.0}, {-100.0, 110.0}, 
            {-118.0, 110.0}}, color = {0, 0, 127}));
        connect(der1.y, feedback1.u2)
          annotation (Line(points = {{-141.0, 110.0}, {-170.0, 110.0}, {-170.0, -52.0}}, color = {0, 0, 127}));
        connect(i.y, feedback2.u1)
          annotation (Line(points = {{-171.0, -100.0}, {-128.0, -100.0}}, color = {0, 0, 127}));
      end CUnit;

      package Icons "Icon definitions"
        extends FolderBlue;

        annotation (
          Documentation(info = "<html><p>This package contains images of components which can be used in further models. The icons can be utilized by implementing them in the desired class using command &quot;<i>extends</i> &quot;.</p></html>", revisions = "<html><table border=\"1\" rules=\"groups\"><thead><tr><td>Version</td>  <td>Date</td>  <td>Comment</td></tr></thead><tbody><tr><td>1.0.0</td>  <td>2006-03-13</td>  <td> </td></tr></tbody></table></html>"), 
          Coordsys(grid = [1, 1], component = [20, 20]));
        partial model ControlBox "Icon for a control box"

          annotation (
            Icon(
              Rectangle(extent = [-100, 100; 100, -100], style(
                color = 74, 
                rgbcolor = {0, 0, 127}, 
                fillColor = 7, 
                rgbfillColor = {255, 255, 255})), 
              Rectangle(extent = [40, 20; 80, -20], style(
                color = 42, 
                rgbcolor = {127, 0, 0}, 
                fillColor = 44, 
                rgbfillColor = {255, 170, 170})), 
              Rectangle(extent = [-20, 20; 20, -20], style(
                color = 74, 
                rgbcolor = {0, 0, 127}, 
                fillColor = 76, 
                rgbfillColor = {170, 170, 255})), 
              Rectangle(extent = [-80, 20; -39, -20], style(
                color = 69, 
                rgbcolor = {0, 128, 255}, 
                fillColor = 68, 
                rgbfillColor = {170, 213, 255})), 
              Line(points = [-39, 0; -20, 0], style(
                color = 10, 
                rgbcolor = {95, 95, 95}, 
                fillPattern = 1)), 
              Line(points = [20, 0; 40, 0], style(
                color = 10, 
                rgbcolor = {95, 95, 95}, 
                fillPattern = 1)), 
              Line(points = [-100, 0; -80, 0], style(
                color = 10, 
                rgbcolor = {95, 95, 95}, 
                fillPattern = 1)), 
              Line(points = [80, 0; 100, 0], style(
                color = 10, 
                rgbcolor = {95, 95, 95}, 
                fillPattern = 1)), 
              Text(extent = [-150, 150; 150, 110], 
                string = "%name", 
                style(color = 3, rgbcolor = {0, 0, 255}))), 
            Coordsys(grid = [1, 1], component = [20, 20]), 
            Diagram, 
            Documentation(revisions = "<html><table border=\"1\" rules=\"groups\"><thead><tr><td>Version</td>  <td>Date</td>  <td>Comment</td></tr></thead><tbody><tr><td>1.0.0</td>  <td>2006-03-13</td>  <td> </td></tr></tbody></table></html>"));
        end ControlBox;

        partial model CurrentController "Icon for a current controller"

          annotation (Diagram, Icon(
            Rectangle(extent = [-100, 100; 100, -100], style(
              color = 0, 
              rgbcolor = {0, 0, 0}, 
              fillColor = 43, 
              rgbfillColor = {255, 85, 85})), 
            Rectangle(extent = [-90, 90; 90, -90], style(
              color = 42, 
              rgbcolor = {127, 0, 0}, 
              fillColor = 44, 
              rgbfillColor = {255, 170, 170})), 
            Line(points = [-80, -70; 75, -70], style(
              color = 10, 
              rgbcolor = {135, 135, 135}, 
              fillColor = 10, 
              rgbfillColor = {135, 135, 135})), 
            Line(points = [-70, -80; -70, 80], style(
              color = 10, 
              rgbcolor = {135, 135, 135}, 
              fillColor = 30, 
              rgbfillColor = {215, 215, 215})), 
            Polygon(points = [80, -70; 68, -64; 68, -76; 80, -70], style(
              color = 10, 
              rgbcolor = {135, 135, 135}, 
              fillColor = 10, 
              rgbfillColor = {135, 135, 135})), 
            Polygon(points = [-70, 80; -76, 68; -64, 68; -70, 80], style(
              color = 10, 
              rgbcolor = {135, 135, 135}, 
              gradient = 3, 
              fillColor = 10, 
              rgbfillColor = {135, 135, 135})), 
            Line(points = [-70, -70; 58, -7], style(
              color = 42, 
              rgbcolor = {127, 0, 0}, 
              fillColor = 42, 
              rgbfillColor = {127, 0, 0}, 
              fillPattern = 1)), 
            Polygon(points = [31, -8; 41, -28; 65, -4; 31, -8], style(
              color = 42, 
              rgbcolor = {127, 0, 0}, 
              fillColor = 42, 
              rgbfillColor = {127, 0, 0})), 
            Line(points = [5, 57; 46, 13], style(
              color = 42, 
              rgbcolor = {211, 0, 0}, 
              fillColor = 1, 
              rgbfillColor = {255, 0, 0})), 
            Polygon(points = [49, 27; 32, 11; 65, -4; 49, 27], style(
              color = 1, 
              rgbcolor = {255, 0, 0}, 
              fillColor = 1, 
              rgbfillColor = {255, 0, 0})), 
            Line(points = [-70, -70; -2, 47], style(
              color = 43, 
              rgbcolor = {255, 85, 85}, 
              fillColor = 44, 
              rgbfillColor = {255, 170, 170})), 
            Polygon(points = [-21, 36; 0, 24; 5, 57; -21, 36], style(
              color = 43, 
              rgbcolor = {255, 85, 85}, 
              fillColor = 43, 
              rgbfillColor = {255, 85, 85}))), 
            Coordsys(grid = [1, 1], component = [20, 20]), 
            Documentation(revisions = "<html><table border=\"1\" rules=\"groups\"><thead><tr><td>Version</td>  <td>Date</td>  <td>Comment</td></tr></thead><tbody><tr><td>1.0.0</td>  <td>2006-03-13</td>  <td> </td></tr></tbody></table></html>"));

        end CurrentController;

        partial model DecouplingNetwork "Icon for a decoupling network model"

          annotation (Coordsys(grid = [1, 1], component = [20, 20]), Icon(
            Rectangle(extent = [-100, 100; 100, -100], style(
              color = 10, 
              rgbcolor = {135, 135, 135}, 
              fillColor = 51, 
              rgbfillColor = {255, 255, 85})), 
            Rectangle(extent = [-90, 90; 90, -90], style(
              color = 10, 
              rgbcolor = {135, 135, 135}, 
              fillColor = 51, 
              rgbfillColor = {255, 255, 170})), 
            Line(points = [-90, 0; 0, -40], style(
              color = 79, 
              rgbcolor = {170, 85, 255}, 
              fillColor = 85, 
              rgbfillColor = {255, 0, 128})), 
            Line(points = [-90, 60; 2, -37], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              gradient = 3, 
              fillColor = 74, 
              rgbfillColor = {0, 0, 127})), 
            Line(points = [-90, -60; -1, 40], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              fillColor = 74, 
              rgbfillColor = {0, 0, 127})), 
            Line(points = [-90, 0; 0, 40], style(color = 58, rgbcolor = {0, 127, 0})), 
            Line(points = [-90, 0; -15, -44], style(color = 58, rgbcolor = {0, 127, 0})), 
            Line(points = [0, 59; 0, 90], style(color = 74, rgbcolor = {0, 0, 127})), 
            Line(points = [0, 40; 90, 60], style(color = 0, rgbcolor = {0, 0, 0})), 
            Line(points = [0, -40; 90, -60], style(
              color = 0, 
              rgbcolor = {0, 0, 0}, 
              fillColor = 0, 
              rgbfillColor = {0, 0, 0})), 
            Line(points = [0, -90; 0, -60], style(color = 74, rgbcolor = {0, 0, 127})), 
            Ellipse(extent = [-20, 60; 20, 20], style(
              color = 7, 
              rgbcolor = {255, 255, 255}, 
              gradient = 3, 
              fillColor = 51, 
              rgbfillColor = {255, 255, 170})), 
            Ellipse(extent = [-20, -20; 20, -60], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              gradient = 3, 
              fillColor = 51, 
              rgbfillColor = {255, 255, 170}))), 
            Documentation(revisions = "<html><table border=\"1\" rules=\"groups\"><thead><tr><td>Version</td>  <td>Date</td>  <td>Comment</td></tr></thead><tbody><tr><td>1.0.0</td>  <td>2006-03-13</td>  <td> </td></tr></tbody></table></html>"));
        end DecouplingNetwork;

        partial model DiodeBridge "Icon for a diode bridge model"

          annotation (Icon(
            Rectangle(extent = [-100, 100; 100, -100], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              fillColor = 76, 
              rgbfillColor = {170, 170, 255})), 
            Polygon(points = [90, 90; 90, -90; -90, -90; 90, 90], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              fillColor = 8, 
              rgbfillColor = {210, 210, 210})), 
            Polygon(points = [-90, 90; 90, 90; -90, -90; -90, 90], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              fillColor = 30, 
              rgbfillColor = {241, 241, 241})), 
            Ellipse(extent = [-40, 40; 40, -40], style(
              color = 3, 
              rgbcolor = {0, 0, 255}, 
              fillColor = 7, 
              rgbfillColor = {255, 255, 255})), 
            Line(points = [-5, 25; 25, -5], style(
              color = 3, 
              rgbcolor = {0, 0, 255}, 
              fillPattern = 1)), 
            Line(points = [40, 0; 40, 0], style(
              color = 5, 
              rgbcolor = {255, 0, 255}, 
              fillColor = 30, 
              rgbfillColor = {215, 215, 215}, 
              fillPattern = 1)), 
            Line(points = [90, 90; -90, -90], style(
              color = 3, 
              rgbcolor = {0, 0, 255}, 
              fillPattern = 1)), 
            Polygon(points = [10, 10; 0, -30; -30, 0; 10, 10], style(
              color = 3, 
              rgbcolor = {0, 0, 255}, 
              fillColor = 7, 
              rgbfillColor = {255, 255, 255})), 
            Line(points = [-28, -28; 28, 28], style(color = 3, rgbcolor = {0, 0, 255}))), 
            Coordsys(grid = [1, 1], component = [20, 
              20]), 
            Diagram, 
            Documentation(revisions = "<html><table border=\"1\" rules=\"groups\"><thead><tr><td>Version</td>  <td>Date</td>  <td>Comment</td></tr></thead><tbody><tr><td>1.0.0</td>  <td>2006-03-13</td>  <td> </td></tr></tbody></table></html>"));

        end DiodeBridge;

        partial model Efficiency "Icon for an efficiency model"

          annotation (Icon(
            Polygon(points = [-60, -60; -60, 60; 0, 90; 60, 60; 60, -60; -60, -60], style(
              color = 0, 
              rgbcolor = {0, 0, 0}, 
              fillColor = 30, 
              rgbfillColor = {241, 241, 241})), 
            Line(points = [-90, 60; -80, 60; -80, 40; -60, 40], style(pattern = 0)), 
            Line(points = [-60, -30; -80, -30; -80, -60; -92, -60], style(pattern = 0)), 
            Line(points = [60, -30; 80, -30; 80, -60; 90, -60], style(pattern = 0)), 
            Line(points = [90, 60; 80, 60; 80, 30; 60, 30], style(pattern = 0)), 
            Text(
              extent = [-100, 20; -60, -20], 
              string = "1", 
              style(color = 0, rgbcolor = {0, 0, 0})), 
            Text(
              extent = [60, 20; 100, -20], 
              string = "2", 
              style(color = 0, rgbcolor = {0, 0, 0})), 
            Polygon(points = [-60, 40; -4, 40; -4, 60; -12, 60; 0, 80; 14, 60; 6, 60; 6, 30; 40, 
              30; 60, 0; 40, -30; -60, -30; -60, 40], style(
                color = 0, 
                rgbcolor = {0, 0, 0}, 
                fillColor = 7, 
                rgbfillColor = {255, 255, 255})), 
            Text(extent = [-150, -100; 150, -160], string = "%name")), 
            Coordsys(grid = [1, 1], scale = 0), 
            Documentation(revisions = "<html><table border=\"1\" rules=\"groups\"><thead><tr><td>Version</td>  <td>Date</td>  <td>Comment</td></tr></thead><tbody><tr><td>1.0.0</td>  <td>2006-03-13</td>  <td> </td></tr></tbody></table></html>"));
        end Efficiency;

        partial model Example "Icon for an example model"
          annotation (Coordsys(preserveAspectRatio = false, 
            extent = [-100, -100; 100, 100], 
            grid = [1, 1]), 
            Icon(
              Ellipse(extent = [-80, -80; 80, 80], style(rgbcolor = {95, 95, 95}, rgbfillColor = {255, 255, 255}, fillPattern = 1)), 
              Polygon(points = [-26, 40; 54, 0; -26, -40; -26, 40], style(pattern = 1, rgbcolor = {0, 0, 255}, rgbfillColor = {50, 205, 50}, fillPattern = 1))), 
            Coordsys(grid = [1, 1], component = [20, 20]), 
            Documentation(revisions = "<html><table border=\"1\" rules=\"groups\"><thead><tr><td>Version</td>  <td>Date</td>  <td>Comment</td></tr></thead><tbody><tr><td>1.0.0</td>  <td>2006-03-13</td>  <td> </td></tr></tbody></table></html>"));
        end Example;

        partial model Example_Big_G "Icon for an example model"
          annotation (Coordsys(preserveAspectRatio = false, 
            extent = [-200, -200; 200, 200], 
            grid = [2, 2]), 
            Icon(
              Ellipse(extent = [-160, -160; 160, 160], 
                style(rgbcolor = {95, 95, 95}, rgbfillColor = {255, 255, 255}, fillPattern = 1)), 
              Polygon(points = [-52, 80; 108, 0; -52, -80; -52, 80], style(pattern = 1, rgbcolor = {0, 0, 255}, rgbfillColor = {50, 205, 50}, fillPattern = 1))), 
            Coordsys(grid = [1, 1], component = [20, 20]), 
            Documentation(revisions = "<html>  <table border=\"1\" rules=\"groups\">  <thead>  <tr><td>Version</td>  <td>Date</td>  <td>Comment</td></tr>  </thead>  <tbody>  <tr><td>1.0.0</td>  <td>2006-03-13</td>  <td> </td></tr>  </tbody>  </table>  </html>"));
        end Example_Big_G;

        partial model FiringAngle "Icon for a firing angle calculator"

          annotation (Icon(
            Rectangle(extent = [-100, 100; 100, -100], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              fillColor = 7, 
              rgbfillColor = {255, 255, 255})), 
            Text(extent = [-150, 150; 150, 110], string = "%name", style(color = 77, rgbcolor = {0, 0, 255})), 
            Line(points = [-70, 16; -54, -29; -54, 61; -48.2, 72.1; -43, 80; -39, 84; 
              -34, 85; -30, 83; -25, 78; -20, 69; -15, 58; -5.98, 32.6; 15, -29; 15, 15; 
              15.1, 60; 20.8, 72.2; 25.7, 80; 30.6, 84.6; 35.5, 86; 40.5, 83.9; 45.4, 
              78.5; 50.3, 70.1; 55.9, 57.3; 63, 37.7; 70, 16], style(color = 3, 
                rgbcolor = {0, 0, 255})), 
            Line(points = [-70, -76; -54, -76; -54, -46; -45, -46; -45, -76; 15, -76; 15, -46; 
              25, -46; 25, -76; 70, -76], style(color = 5, rgbcolor = {255, 0, 255}))), 
            Coordsys(grid = [1, 1], scale = 0), 
            Documentation(revisions = "<html><table border=\"1\" rules=\"groups\"><thead><tr><td>Version</td>  <td>Date</td>  <td>Comment</td></tr></thead><tbody><tr><td>1.0.0</td>  <td>2006-03-13</td>  <td> </td></tr></tbody></table></html>"));
        end FiringAngle;

        partial model FluxController "Icon for a flux controller model"

          annotation (Diagram, Icon(
            Rectangle(extent = [-100, 100; 100, -100], style(
              color = 58, 
              rgbcolor = {0, 127, 0}, 
              fillColor = 55, 
              rgbfillColor = {170, 255, 85})), 
            Rectangle(extent = [-90, 90; 90, -90], style(
              color = 58, 
              rgbcolor = {0, 127, 0}, 
              fillColor = 52, 
              rgbfillColor = {213, 255, 170})), 
            Ellipse(extent = [-71, 22; -29, -21], style(
              color = 58, 
              rgbcolor = {0, 127, 0}, 
              fillColor = 55, 
              rgbfillColor = {170, 255, 85})), 
            Line(points = [-72, -34; -59, -34], style(
              color = 58, 
              rgbcolor = {0, 127, 0}, 
              fillColor = 0, 
              rgbfillColor = {0, 0, 0})), 
            Rectangle(extent = [-10, 40; 70, -40], style(
              color = 58, 
              rgbcolor = {0, 127, 0}, 
              fillColor = 55, 
              rgbfillColor = {170, 255, 85})), 
            Line(points = [12, -26; 12, -1; 58, 26], style(
              color = 58, 
              rgbcolor = {0, 127, 0}, 
              fillColor = 0, 
              rgbfillColor = {0, 0, 0})), 
            Line(points = [-50, -90; -50, -60; -50, -60; -50, -21], style(
              color = 58, 
              rgbcolor = {0, 127, 0}, 
              fillColor = 58, 
              rgbfillColor = {0, 127, 0})), 
            Line(points = [-29, 0; -10, 0], style(color = 58, rgbcolor = {0, 127, 0})), 
            Line(points = [70, 0; 90, 0], style(color = 58, rgbcolor = {0, 127, 0})), 
            Polygon(points = [-50, -21; -54, -30; -46, -30; -50, -21], style(
              color = 58, 
              rgbcolor = {0, 127, 0}, 
              fillColor = 58, 
              rgbfillColor = {0, 127, 0})), 
            Line(points = [-90, 0; -71, 0], style(
              color = 58, 
              rgbcolor = {0, 127, 0}, 
              fillColor = 0, 
              rgbfillColor = {0, 0, 0}, 
              fillPattern = 1))), 
            Coordsys(grid = [1, 1], component = [20, 20]), 
            Documentation(revisions = "<html><table border=\"1\" rules=\"groups\"><thead><tr><td>Version</td>  <td>Date</td>  <td>Comment</td></tr></thead><tbody><tr><td>1.0.0</td>  <td>2006-03-13</td>  <td> </td></tr></tbody></table></html>"));

        end FluxController;

        partial model FluxModel "Icon for a flux model"

          annotation (Icon(
            Rectangle(extent = [-100, 100; 100, -100], style(
              color = 58, 
              rgbcolor = {0, 127, 0}, 
              fillColor = 55, 
              rgbfillColor = {170, 255, 85})), 
            Rectangle(extent = [-90, 90; 90, -90], style(
              color = 58, 
              rgbcolor = {0, 127, 0}, 
              fillColor = 52, 
              rgbfillColor = {213, 255, 170})), 
            Line(points = [0, -80; 0, 75], style(
              color = 10, 
              rgbcolor = {135, 135, 135}, 
              fillColor = 10, 
              rgbfillColor = {135, 135, 135})), 
            Polygon(points = [0, 80; -6, 68; 6, 68; 0, 80], style(
              color = 10, 
              rgbcolor = {135, 135, 135}, 
              fillColor = 10, 
              rgbfillColor = {135, 135, 135})), 
            Line(points = [-80, 0; 80, 0], style(
              color = 10, 
              rgbcolor = {135, 135, 135}, 
              fillColor = 10, 
              rgbfillColor = {135, 135, 135})), 
            Polygon(points = [80, 0; 68, 6; 68, -6; 80, 0], style(
              color = 10, 
              rgbcolor = {135, 135, 135}, 
              fillColor = 10, 
              rgbfillColor = {135, 135, 135})), 
            Line(points = [-77, -32; 73, 31], style(
              color = 10, 
              rgbcolor = {135, 135, 135}, 
              fillColor = 10, 
              rgbfillColor = {135, 135, 135})), 
            Polygon(points = [77, 33; 63, 34; 68, 22; 77, 33], style(
              color = 10, 
              rgbcolor = {135, 135, 135}, 
              fillColor = 10, 
              rgbfillColor = {135, 135, 135})), 
            Line(points = [32, -76; -31, 74], style(
              color = 10, 
              rgbcolor = {135, 135, 135}, 
              fillColor = 10, 
              rgbfillColor = {135, 135, 135})), 
            Polygon(points = [-32, 76; -32, 62; -21, 67; -32, 76], style(
              color = 10, 
              rgbcolor = {135, 135, 135}, 
              fillColor = 10, 
              rgbfillColor = {135, 135, 135})), 
            Polygon(points = [35, 54; 54, 35; 65, 66; 35, 54], style(
              color = 58, 
              rgbcolor = {0, 127, 0}, 
              fillColor = 58, 
              rgbfillColor = {0, 127, 0})), 
            Line(points = [0, 0; 57, 57], style(
              color = 58, 
              rgbcolor = {0, 127, 0}, 
              fillColor = 58, 
              rgbfillColor = {0, 127, 0}))), Diagram, 
            Coordsys(grid = [1, 1], component = [20, 20]), 
            Documentation(revisions = "<html><table border=\"1\" rules=\"groups\"><thead><tr><td>Version</td>  <td>Date</td>  <td>Comment</td></tr></thead><tbody><tr><td>1.0.0</td>  <td>2006-03-13</td>  <td> </td></tr></tbody></table></html>"));

        end FluxModel;

        partial model FluxWeakening "Icon for a rotor flux weakening model"

          annotation (Icon(
            Rectangle(extent = [-100, 100; 100, -100], style(
              color = 58, 
              rgbcolor = {0, 127, 0}, 
              fillColor = 55, 
              rgbfillColor = {170, 255, 85})), 
            Rectangle(extent = [-90, 90; 90, -90], style(
              color = 58, 
              rgbcolor = {0, 127, 0}, 
              fillColor = 52, 
              rgbfillColor = {213, 255, 170})), 
            Line(points = [-30, 30; 31, 30; 33, 10; 36, 0; 40, -13; 45, -20; 50, -25; 60, -30], 
              style(color = 58, rgbcolor = {0, 127, 0})), 
            Line(points = [-30, 30; -31, 20; -33, 10; -35, 0; -40, -13; -45, -20; -50, -25; 
              -59, -30], style(color = 58, rgbcolor = {0, 127, 0})), 
            Polygon(points = [0, 80; -6, 68; 6, 68; 0, 80], style(
              color = 10, 
              rgbcolor = {135, 135, 135}, 
              fillColor = 10, 
              rgbfillColor = {135, 135, 135})), 
            Line(points = [0, -80; 0, 77], style(
              color = 10, 
              rgbcolor = {135, 135, 135}, 
              fillColor = 10, 
              rgbfillColor = {135, 135, 135})), 
            Line(points = [-80, -40; 75, -40], 
              style(
                color = 10, 
                rgbcolor = {135, 135, 135}, 
                fillColor = 10, 
                rgbfillColor = {135, 135, 135})), 
            Polygon(points = [80, -40; 68, -34; 68, -46; 80, -40], 
              style(
                color = 10, 
                rgbcolor = {135, 135, 135}, 
                fillColor = 10, 
                rgbfillColor = {135, 135, 135}))), 
            Diagram, 
            Documentation(revisions = "<html><table border=\"1\" rules=\"groups\"><thead><tr><td>Version</td>  <td>Date</td>  <td>Comment</td></tr></thead><tbody><tr><td>1.0.0</td>  <td>2006-03-13</td>  <td> </td></tr></tbody></table></html>"), Coordsys(grid = [1, 1], component = [20, 20]));

        end FluxWeakening;

        partial model FolderBlue "Icon for a standard package"

          annotation (Icon(Polygon(points = [-100, -100; -100, 40; -88, 46; -80, 80; -40, 
            100; -24, 78; 20, 100; 20, -40; -100, -100], style(
              color = 0, 
              rgbcolor = {0, 0, 0}, 
              fillColor = 71, 
              rgbfillColor = {85, 170, 255}, 
              fillPattern = 1)), Polygon(points = [-100, -100; -24, 20; 
              100, 80; 20, -40; -100, -100], style(
                color = 0, 
                rgbcolor = {0, 0, 0}, 
                fillColor = 76, 
                rgbfillColor = {170, 170, 255}))), Coordsys(grid = [1, 1], scale = 0), 
            Documentation(revisions = "<html><table border=\"1\" rules=\"groups\"><thead><tr><td>Version</td>  <td>Date</td>  <td>Comment</td></tr></thead><tbody><tr><td>1.0.0</td>  <td>2006-03-13</td>  <td> </td></tr></tbody></table></html>"));
        end FolderBlue;

        partial model FolderLightBlue "Icon for a folder with transient drives"

          annotation (Icon(Polygon(points = [-100, -100; -100, 40; -88, 46; -80, 80; -40, 100; 
            -24, 78; 20, 100; 20, -40; -100, -100], style(
              color = 0, 
              rgbcolor = {0, 0, 0}, 
              fillColor = 68, 
              rgbfillColor = {170, 213, 255})), Polygon(points = [-100, -100; -24, 20; 100, 
              80; 20, -40; -100, -100], style(
                color = 0, 
                rgbcolor = {0, 0, 0}, 
                fillColor = 68, 
                rgbfillColor = {170, 213, 255}))), Coordsys(grid = [1, 1], scale = 0), 
            Documentation(revisions = "<html><table border=\"1\" rules=\"groups\"><thead><tr><td>Version</td>  <td>Date</td>  <td>Comment</td></tr></thead><tbody><tr><td>1.0.0</td>  <td>2006-03-13</td>  <td> </td></tr></tbody></table></html>"));
        end FolderLightBlue;

        partial model FolderYellow "Icon for a SED-package"

          annotation (Icon(Polygon(points = [-100, -100; -100, 40; -88, 46; -80, 80; -40, 
            100; -24, 78; 20, 100; 20, -40; -100, -100], style(
              color = 0, 
              rgbcolor = {0, 0, 0}, 
              fillColor = 51, 
              rgbfillColor = {255, 255, 170})), Polygon(points = [-100, -100; -24, 20; 
              100, 80; 20, -40; -100, -100], style(
                color = 0, 
                rgbcolor = {0, 0, 0}, 
                fillColor = 51, 
                rgbfillColor = {255, 255, 170}))), Coordsys(grid = [1, 1], scale = 0), 
            Documentation(revisions = "<html><table border=\"1\" rules=\"groups\"><thead><tr><td>Version</td>  <td>Date</td>  <td>Comment</td></tr></thead><tbody><tr><td>1.0.0</td>  <td>2006-03-13</td>  <td> </td></tr></tbody></table></html>"));
        end FolderYellow;

        partial model Interface "Icon for a bus interface model"

          annotation (Icon(Rectangle(extent = [-50, 100; 50, -100], style(
            color = 0, 
            rgbcolor = {0, 0, 0}, 
            fillColor = 30, 
            rgbfillColor = {241, 241, 241})), 
            Text(extent = [-151, 150; 149, 110], 
              string = "%name", 
              style(color = 3, rgbcolor = {0, 0, 255})), 
            Polygon(points = [40, 10; 40, -10; 40, -20; 10, -20; -10, -40; -40, 
              -40; -40, 40; -10, 40; 10, 20; 40, 20; 40, 10], style(
                color = 74, 
                rgbcolor = {0, 0, 127}, 
                fillColor = 30, 
                rgbfillColor = {215, 215, 215})), 
            Line(points = [40, 0; 50, 0], style(
              color = 6, 
              rgbcolor = {255, 204, 51}, 
              thickness = 2)), 
            Line(points = [-50, 0; -40, 0], style(
              color = 6, 
              rgbcolor = {255, 204, 51}, 
              thickness = 2, 
              fillColor = 30, 
              rgbfillColor = {215, 215, 215}))), 
            Coordsys(grid = [1, 1], scale = 0), 
            Documentation(revisions = "<html><table border=\"1\" rules=\"groups\"><thead><tr><td>Version</td>  <td>Date</td>  <td>Comment</td></tr></thead><tbody><tr><td>1.0.0</td>  <td>2006-03-13</td>  <td> </td></tr></tbody></table></html>"));
        end Interface;

        partial model Limiter "Icon for a limiter model"

          annotation (Icon(
            Rectangle(extent = [-100, 100; 100, -100], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              fillColor = 75, 
              rgbfillColor = {85, 85, 255})), 
            Rectangle(extent = [-90, 90; 90, -90], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              fillColor = 76, 
              rgbfillColor = {170, 170, 255})), 
            Line(points = [-70, -60; -40, -60; 40, 60; 70, 60], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              fillPattern = 1)), 
            Polygon(points = [0, 80; -6, 68; 6, 68; 0, 80], style(
              color = 10, 
              rgbcolor = {135, 135, 135}, 
              fillColor = 10, 
              rgbfillColor = {135, 135, 135})), 
            Line(points = [0, -80; 0, 77], style(
              color = 10, 
              rgbcolor = {135, 135, 135}, 
              fillColor = 10, 
              rgbfillColor = {135, 135, 135})), 
            Line(points = [-80, 0; 75, 0], style(
              color = 10, 
              rgbcolor = {135, 135, 135}, 
              fillColor = 10, 
              rgbfillColor = {135, 135, 135})), 
            Polygon(points = [80, 0; 68, 6; 68, -6; 80, 0], style(
              color = 10, 
              rgbcolor = {135, 135, 135}, 
              fillColor = 10, 
              rgbfillColor = {135, 135, 135}))), Coordsys(grid = [1, 1], component = [
              20, 20]), 
            Documentation(revisions = "<html><table border=\"1\" rules=\"groups\"><thead><tr><td>Version</td>  <td>Date</td>  <td>Comment</td></tr></thead><tbody><tr><td>1.0.0</td>  <td>2006-03-13</td>  <td> </td></tr></tbody></table></html>"));

        end Limiter;

        partial model LimiterGray "Icon for a limiter model"

          annotation (Icon(
            Rectangle(extent = [-100, 100; 100, -100], style(
              color = 0, 
              rgbcolor = {0, 0, 0}, 
              fillColor = 9, 
              rgbfillColor = {175, 175, 175})), 
            Rectangle(extent = [-90, 90; 90, -90], style(
              color = 0, 
              rgbcolor = {0, 0, 0}, 
              fillColor = 30, 
              rgbfillColor = {215, 215, 215})), 
            Line(points = [-70, -60; -40, -60; 40, 60; 70, 60], style(
              color = 0, 
              rgbcolor = {0, 0, 0}, 
              fillPattern = 1)), 
            Polygon(points = [0, 80; -6, 68; 6, 68; 0, 80], style(
              color = 0, 
              rgbcolor = {0, 0, 0}, 
              fillColor = 0, 
              rgbfillColor = {0, 0, 0})), 
            Line(points = [0, -80; 0, 77], style(
              color = 0, 
              rgbcolor = {0, 0, 0}, 
              fillColor = 0, 
              rgbfillColor = {0, 0, 0})), 
            Line(points = [-80, 0; 75, 0], style(
              color = 0, 
              rgbcolor = {0, 0, 0}, 
              fillColor = 0, 
              rgbfillColor = {0, 0, 0})), 
            Polygon(points = [80, 0; 68, 6; 68, -6; 80, 0], style(
              color = 0, 
              rgbcolor = {0, 0, 0}, 
              fillColor = 0, 
              rgbfillColor = {0, 0, 0}))), Coordsys(grid = [1, 1], component = [
              20, 20]), 
            Documentation(revisions = "<html><table border=\"1\" rules=\"groups\"><thead><tr><td>Version</td>  <td>Date</td>  <td>Comment</td></tr></thead><tbody><tr><td>1.0.0</td>  <td>2006-03-13</td>  <td> </td></tr></tbody></table></html>"));

        end LimiterGray;

        partial model MachineLightBlue "Icon for a transient machine model"
          annotation (Coordsys(preserveAspectRatio = false, 
            extent = [-100, -100; 100, 100], 
            grid = [1, 1], 
            scale = 0), 
            Icon(
              Rectangle(extent = [-40, -60; 80, 60], style(rgbcolor = {0, 0, 0}, rgbfillColor = {153, 204, 255}, gradient = 2)), 
              Rectangle(extent = [-60, -60; -40, 60], style(rgbcolor = {0, 0, 0}, rgbfillColor = {128, 128, 128}, gradient = 2)), 
              Rectangle(extent = [80, -10; 100, 10], style(rgbcolor = {0, 0, 0}, rgbfillColor = {95, 95, 95}, gradient = 2)), 
              Rectangle(extent = [-40, 50; 40, 70], style(rgbcolor = {95, 95, 95}, rgbfillColor = {95, 95, 95}, fillPattern = 1)), 
              Polygon(points = [-50, -90; -40, -90; -10, -30; 40, -30; 70, -90; 80, -90; 80, -100; -50, -100; -50, -90], style(
                rgbcolor = {0, 0, 0}, 
                rgbfillColor = {192, 192, 192}, 
                fillPattern = 1)), 
              Rectangle(extent = [-50, -100; 80, -85], style(rgbcolor = {0, 0, 0}, rgbfillColor = {0, 0, 0}, fillPattern = 1))), 
            Coordsys(grid = [1, 1], scale = 0), 
            Documentation(revisions = "<html><table border=\"1\" rules=\"groups\"><thead><tr><td>Version</td>  <td>Date</td>  <td>Comment</td></tr></thead><tbody><tr><td>1.0.0</td>  <td>2006-03-13</td>  <td> </td></tr></tbody></table></html>"));
        end MachineLightBlue;

        partial model MachineYellow "Icon for a quasi stationary machine model"

          annotation (Icon(
            Rectangle(extent = [-40, 60; 80, -60], style(
              color = 3, 
              rgbcolor = {0, 0, 255}, 
              gradient = 2, 
              fillColor = 6, 
              rgbfillColor = {255, 255, 0})), 
            Rectangle(extent = [-40, 60; -60, -60], style(
              color = 10, 
              gradient = 2, 
              fillColor = 10)), 
            Rectangle(extent = [80, 10; 100, -10], style(
              color = 10, 
              rgbcolor = {95, 95, 95}, 
              gradient = 2, 
              fillColor = 10, 
              rgbfillColor = {95, 95, 95})), 
            Rectangle(extent = [-40, 70; 40, 50], style(
              color = 10, 
              rgbcolor = {95, 95, 95}, 
              fillColor = 10, 
              rgbfillColor = {95, 95, 95})), 
            Polygon(points = [-50, -90; -40, -90; -10, -20; 40, -20; 70, -90; 80, -90; 80, -100; 
              -50, -100; -50, -90], style(
                color = 0, 
                gradient = 0, 
                fillColor = 0, 
                fillPattern = 1))), Coordsys(grid = [1, 1], component = [20, 20]), 
            Documentation(revisions = "<html><table border=\"1\" rules=\"groups\"><thead><tr><td>Version</td>  <td>Date</td>  <td>Comment</td></tr></thead><tbody><tr><td>1.0.0</td>  <td>2006-03-13</td>  <td> </td></tr></tbody></table></html>"));

        end MachineYellow;

        partial model MBox "Icon for a measuring device"

          annotation (
            Icon(
              Rectangle(extent = [-100, 100; 100, -100], style(
                color = 0, 
                rgbcolor = {0, 0, 0}, 
                fillColor = 84, 
                rgbfillColor = {213, 170, 255})), 
              Rectangle(extent = [-70, 70; 70, -70], style(
                color = 10, 
                rgbcolor = {95, 95, 95}, 
                fillColor = 30, 
                rgbfillColor = {241, 241, 241})), 
              Polygon(points = [-10, 80; 10, 80; 0, 60; -10, 80], style(
                color = 10, 
                rgbcolor = {95, 95, 95}, 
                fillColor = 7, 
                rgbfillColor = {255, 255, 255}, 
                fillPattern = 1)), 
              Line(points = [0, 100; 0, 80], style(
                color = 0, 
                rgbcolor = {0, 0, 0}, 
                fillPattern = 1)), 
              Line(points = [0, 60; 0, -60], style(
                color = 10, 
                rgbcolor = {95, 95, 95}, 
                pattern = 3, 
                fillPattern = 1)), 
              Line(points = [1, 0; 0, 0; 70, 0], style(
                color = 10, 
                rgbcolor = {95, 95, 95}, 
                pattern = 3)), 
              Line(points = [70, -60; 50, -60; 50, 0; 50, 0], style(
                color = 10, 
                rgbcolor = {95, 95, 95}, 
                pattern = 3)), 
              Line(points = [69, 0; 100, 0], style(color = 79, rgbcolor = {170, 85, 255})), 
              Line(points = [70, -60; 100, -60], style(color = 0, rgbcolor = {0, 0, 0})), 
              Polygon(points = [-10, -60; 10, -60; 0, -80; -10, -60], style(
                color = 10, 
                rgbcolor = {95, 95, 95}, 
                fillColor = 7, 
                rgbfillColor = {255, 255, 255}, 
                fillPattern = 1)), 
              Line(points = [0, -79; 0, -100], style(
                color = 0, 
                rgbcolor = {0, 0, 0}, 
                fillColor = 30, 
                rgbfillColor = {215, 215, 215}, 
                fillPattern = 1)), 
              Ellipse(extent = [-10, 10; 10, -10], style(
                color = 10, 
                rgbcolor = {135, 135, 135}, 
                fillColor = 7, 
                rgbfillColor = {255, 255, 255})), 
              Rectangle(extent = [-120, -80; -80, -120], style(
                pattern = 0, 
                fillColor = 8, 
                rgbfillColor = {192, 192, 192}))), 
            Coordsys(grid = [1, 1], component = [20, 20]), 
            Diagram, 
            Documentation(revisions = "<html><table border=\"1\" rules=\"groups\"><thead><tr><td>Version</td>  <td>Date</td>  <td>Comment</td></tr></thead><tbody><tr><td>1.0.0</td>  <td>2006-03-13</td>  <td> </td></tr></tbody></table></html>"));

        end MBox;

        partial model PI "Icon for a Pi controller model"

          annotation (Icon(
            Rectangle(extent = [-100, -100; 100, 100], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              fillColor = 7, 
              rgbfillColor = {255, 255, 255})), 
            Line(points = [-80, 50; -43, 50], style(color = 74, rgbcolor = {0, 0, 127})), 
            Line(points = [-43, 50; -30, 50], style(color = 74, rgbcolor = {0, 0, 127})), 
            Rectangle(extent = [-30, -40; 10, -80], style(color = 10, rgbcolor = {95, 95, 
              95})), 
            Line(points = [-80, 50; -80, 0; -100, 0], style(color = 74, rgbcolor = {0, 0, 
              127})), 
            Line(points = [-80, 0; -80, -50], style(color = 74, rgbcolor = {0, 0, 127})), 
            Line(points = [-80, -49; -80, -60; -30, -60], style(color = 74, rgbcolor = {0, 
              0, 127})), 
            Rectangle(extent = [-30, 70; 10, 30], style(color = 10, rgbcolor = {95, 95, 95})), 
            Text(
              extent = [-30, 70; 10, 30], 
              string = "I", 
              style(color = 0, rgbcolor = {0, 0, 0})), 
            Text(
              extent = [-30, -40; 10, -80], 
              string = "P", 
              style(color = 0, rgbcolor = {0, 0, 0})), 
            Line(points = [10, 50; 30, 50; 30, 10], style(color = 74, rgbcolor = {0, 0, 127})), 
            Ellipse(extent = [20, 10; 40, -10], style(color = 74, rgbcolor = {0, 0, 127})), 
            Line(points = [10, -60; 30, -60; 30, -10], style(color = 74, rgbcolor = {0, 0, 
              127})), 
            Line(points = [40, 0; 100, 0], style(color = 74, rgbcolor = {0, 0, 127})), 
            Line(points = [55, 20; 65, 10; 75, 10; 85, 20], 
              style(color = 74, rgbcolor = {0, 0, 
                127})), 
            Line(points = [-70, 30; -60, 40; -50, 40; -40, 30], 
              style(color = 74, rgbcolor = 
                {0, 0, 127})), 
            Line(points = [70, 10; 70, 90; -55, 90; -55, 60], style(color = 74, rgbcolor = {
              0, 0, 127})), 
            Line(points = [13, -10; 13, -25], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              fillColor = 74, 
              rgbfillColor = {0, 0, 127})), 
            Line(points = [6, -17; 20, -17], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              fillColor = 74, 
              rgbfillColor = {0, 0, 127})), 
            Line(points = [13, 20; 13, 6], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              fillColor = 74, 
              rgbfillColor = {0, 0, 127})), 
            Line(points = [6, 13; 20, 13], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              fillColor = 74, 
              rgbfillColor = {0, 0, 127})), 
            Polygon(points = [22, 26; 30, 10; 38, 26; 30, 26; 22, 26], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              fillColor = 74, 
              rgbfillColor = {0, 0, 127})), 
            Polygon(points = [30, -10; 39, -27; 22, -27; 30, -10], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              fillColor = 74, 
              rgbfillColor = {0, 0, 127})), 
            Line(points = [-70, 70; -60, 60; -50, 60; -40, 70], 
              style(color = 74, rgbcolor = {0, 0, 
                127})), 
            Line(points = [55, -20; 65, -10; 75, -10; 85, -20], 
              style(color = 74, rgbcolor = 
                {0, 0, 127}))), Coordsys(grid = [1, 1], scale = 0), 
            Documentation(revisions = "<html><table border=\"1\" rules=\"groups\"><thead><tr><td>Version</td>  <td>Date</td>  <td>Comment</td></tr></thead><tbody><tr><td>1.0.0</td>  <td>2006-03-13</td>  <td> </td></tr></tbody></table></html>"));

        end PI;

        partial model PositionController "Icon for a speed controller model"

          annotation (
            Diagram, 
            Icon(Rectangle(extent = [-100, 100; 100, -100], style(
              color = 10, 
              rgbcolor = {95, 95, 95}, 
              fillColor = 7, 
              rgbfillColor = {255, 255, 255})), 
              Ellipse(extent = [-23, 66; 70, -25], style(
                color = 10, 
                rgbcolor = {95, 95, 95}, 
                gradient = 2, 
                fillColor = 30, 
                rgbfillColor = {215, 215, 215})), 
              Ellipse(extent = [-32, 58; 61, -33], style(
                color = 10, 
                rgbcolor = {95, 95, 95}, 
                fillColor = 30, 
                rgbfillColor = {215, 215, 215}, 
                fillPattern = 1)), 
              Polygon(points = [-45, -20; 2, 27; 7, 29; 11, 30; 15, 30; 19, 29; 24, 27; 29, 
                23; 31, 20; 32, 17; 33, 13; 33, 9; 32, 5; 31, 2; 28, -3; -21, -52; -16, 
                -47; -13, -41; -12, -37; -12, -33; -13, -29; -15, -25; -17, -22; -19, 
                -20; -22, -18; -26, -16; -30, -15; -35, -15; -38, -16; -42, -18; -45, 
                -20], style(
                  color = 10, 
                  rgbcolor = {95, 95, 95}, 
                  gradient = 1, 
                  fillColor = 30, 
                  rgbfillColor = {215, 215, 215})), 
              Ellipse(extent = [-3, 45; 5, 38], style(
                color = 10, 
                rgbcolor = {95, 95, 95}, 
                fillColor = 30, 
                rgbfillColor = {215, 215, 215}, 
                fillPattern = 1)), 
              Ellipse(extent = [-23, 26; -15, 19], style(
                color = 10, 
                rgbcolor = {95, 95, 95}, 
                fillColor = 30, 
                rgbfillColor = {215, 215, 215}, 
                fillPattern = 1)), 
              Ellipse(extent = [28, 41; 36, 34], style(
                color = 10, 
                rgbcolor = {95, 95, 95}, 
                fillColor = 30, 
                rgbfillColor = {215, 215, 215}, 
                fillPattern = 1)), 
              Ellipse(extent = [43, 11; 51, 4], style(
                color = 10, 
                rgbcolor = {95, 95, 95}, 
                fillColor = 30, 
                rgbfillColor = {215, 215, 215}, 
                fillPattern = 1)), 
              Ellipse(extent = [27, -15; 35, -22], style(
                color = 10, 
                rgbcolor = {95, 95, 95}, 
                fillColor = 30, 
                rgbfillColor = {215, 215, 215}, 
                fillPattern = 1)), 
              Polygon(points = [21, 8; -1, -14; -6, -31; 15, -8; 21, 8], style(
                color = 7, 
                rgbcolor = {255, 255, 255}, 
                fillColor = 30, 
                rgbfillColor = {239, 239, 239}, 
                fillPattern = 1)), 
              Ellipse(extent = [-52, -55; -12, -15], style(
                color = 10, 
                rgbcolor = {95, 95, 95}, 
                gradient = 3, 
                fillColor = 9, 
                rgbfillColor = {175, 175, 175})), 
              Line(points = [-83, 34; -34, -15], style(color = 42, rgbcolor = {127, 0, 0})), 
              Polygon(points = [-53, -8; -40, 5; -34, -15; -53, -8], style(
                color = 42, 
                rgbcolor = {127, 0, 0}, 
                fillColor = 42, 
                rgbfillColor = {127, 0, 0}))), 
            Coordsys(grid = [1, 1], component = [20, 20]), 
            Documentation(revisions = "<html><table border=\"1\" rules=\"groups\"><thead><tr><td>Version</td>  <td>Date</td>  <td>Comment</td></tr></thead><tbody><tr><td>1.0.0</td>  <td>2006-03-13</td>  <td> </td></tr></tbody></table></html>"));

        end PositionController;

        partial model PowerBalance "Icon for a converter model"

          annotation (Icon(
            Rectangle(extent = [-100, 100; 100, -100], style(
              color = 3, 
              rgbcolor = {0, 0, 255}, 
              fillColor = 76, 
              rgbfillColor = {170, 170, 255})), 
            Polygon(points = [-90, -90; 90, -90; 90, 90; -90, -90], style(
              color = 3, 
              rgbcolor = {0, 0, 255}, 
              fillColor = 8, 
              rgbfillColor = {210, 210, 210})), 
            Polygon(points = [-90, 90; 90, 90; -90, -90; -90, 90], style(
              color = 7, 
              rgbcolor = {255, 255, 255}, 
              fillColor = 30, 
              rgbfillColor = {241, 241, 241})), 
            Polygon(points = [-90, -90; -90, 90; 90, 90; -90, -90], style(color = 3, rgbcolor = 
              {0, 0, 255}))), 
            Coordsys(grid = [1, 1], component = [20, 20]), 
            Diagram, 
            Documentation(revisions = "<html><table border=\"1\" rules=\"groups\"><thead><tr><td>Version</td>  <td>Date</td>  <td>Comment</td></tr></thead><tbody><tr><td>1.0.0</td>  <td>2006-03-13</td>  <td> </td></tr></tbody></table></html>"));

        end PowerBalance;

        partial model PowerLoad "Icon for a power load model"

          annotation (Icon(
            Line(points = [-60, 0; -90, 0], style(color = 3, rgbcolor = {0, 0, 255})), 
            Polygon(points = [-60, -60; -60, 60; 0, 90; 60, 60; 60, -60; -60, -60], style(
              color = 0, 
              rgbcolor = {0, 0, 0}, 
              fillColor = 30, 
              rgbfillColor = {241, 241, 241})), 
            Text(
              extent = [-40, 70; 40, -10], 
              string = "P", 
              style(
                color = 0, 
                rgbcolor = {0, 0, 0}, 
                fillColor = 8, 
                rgbfillColor = {210, 210, 210})), 
            Text(extent = [-150, -100; 150, -160], string = "%name")), 
            Coordsys(grid = [1, 1], scale = 0), 
            Documentation(revisions = "<html><table border=\"1\" rules=\"groups\"><thead><tr><td>Version</td>  <td>Date</td>  <td>Comment</td></tr></thead><tbody><tr><td>1.0.0</td>  <td>2006-03-13</td>  <td> </td></tr></tbody></table></html>"));
        end PowerLoad;

        partial model QSMachine "Icon for a quasi stationary machine model"

          annotation (Icon(
            Line(points = [-20, 70; -20, 70], style(
              color = 3, 
              rgbcolor = {0, 0, 255}, 
              gradient = 2)), 
            Line(points = [-50, 100; -20, 100; -20, 90], style(
              color = 3, 
              rgbcolor = {0, 0, 255}, 
              gradient = 2, 
              fillColor = 6, 
              rgbfillColor = {255, 255, 0})), 
            Line(points = [-40, 80; -50, 80; -50, 60], style(color = 3, rgbcolor = {0, 0, 255})), 
            Ellipse(extent = [-30, 90; -10, 70], style(color = 3, rgbcolor = {0, 0, 255})), 
            Polygon(points = [-6, 86; -6, 74; 12, 80; -6, 86], style(
              color = 3, 
              rgbcolor = {0, 0, 255}, 
              fillColor = 3, 
              rgbfillColor = {0, 0, 255})), 
            Line(points = [50, 100; 20, 100; 20, 70], style(
              color = 3, 
              rgbcolor = {0, 0, 255}, 
              gradient = 2, 
              fillColor = 6, 
              rgbfillColor = {255, 255, 0})), 
            Line(points = [-40, 80; -6, 80], style(
              color = 3, 
              rgbcolor = {0, 0, 255}, 
              gradient = 2)), 
            Rectangle(extent = [80, -80; 120, -120], style(color = 8, fillColor = 8)), 
            Rectangle(extent = [-40, 60; 80, -60], style(
              color = 3, 
              rgbcolor = {0, 0, 255}, 
              gradient = 2, 
              fillColor = 6, 
              rgbfillColor = {255, 255, 0})), 
            Rectangle(extent = [-40, 60; -60, -60], style(
              color = 10, 
              gradient = 2, 
              fillColor = 10)), 
            Rectangle(extent = [80, 10; 100, -10], style(
              color = 10, 
              rgbcolor = {95, 95, 95}, 
              gradient = 2, 
              fillColor = 10, 
              rgbfillColor = {95, 95, 95})), 
            Rectangle(extent = [-40, 70; 40, 50], style(
              color = 10, 
              rgbcolor = {95, 95, 95}, 
              fillColor = 10, 
              rgbfillColor = {95, 95, 95})), 
            Polygon(points = [-50, -90; -40, -90; -10, -20; 40, -20; 70, -90; 80, -90; 80, -100; 
              -50, -100; -50, -90], style(
                color = 0, 
                gradient = 0, 
                fillColor = 0, 
                fillPattern = 1))), Coordsys(grid = [1, 1], component = [20, 20]), 
            Documentation(revisions = "<html><table border=\"1\" rules=\"groups\"><thead><tr><td>Version</td>  <td>Date</td>  <td>Comment</td></tr></thead><tbody><tr><td>1.0.0</td>  <td>2007-10-21</td>  <td> </td></tr></tbody></table></html>"));

        end QSMachine;

        partial model RefLim "Icon for a reference and limits model"

          annotation (Icon(Rectangle(extent = [-100, 100; 100, -100], style(
            color = 74, 
            rgbcolor = {0, 0, 127}, 
            fillColor = 7, 
            rgbfillColor = {255, 255, 255})), 
            Rectangle(extent = [-60, 80; 0, 20], style(
              color = 0, 
              rgbcolor = {0, 0, 0}, 
              fillColor = 30, 
              rgbfillColor = {241, 241, 241})), 
            Line(points = [-60, -20; -40, -40; -20, -40; 0, -20], style(color = 0, rgbcolor = {
              0, 0, 0})), 
            Line(points = [-60, -80; -40, -60; -20, -60; 0, -80], style(color = 0, rgbcolor = {
              0, 0, 0})), 
            Line(points = [0, 50; 50, 50; 50, 0; 100, 0], style(color = 0, rgbcolor = {0, 0, 0})), 
            Line(points = [-60, -50; 50, -50; 50, 0; 100, 0], style(color = 0, rgbcolor = {0, 0, 
              0})), 
            Polygon(points = [50, 10; 50, -10; 70, 0; 50, 10], style(
              color = 0, 
              rgbcolor = {0, 0, 0}, 
              fillColor = 7, 
              rgbfillColor = {255, 255, 255}))), Coordsys(grid = [1, 1], scale = 0), 
            Documentation(revisions = "<html><table border=\"1\" rules=\"groups\"><thead><tr><td>Version</td>  <td>Date</td>  <td>Comment</td></tr></thead><tbody><tr><td>1.0.0</td>  <td>2006-03-13</td>  <td> </td></tr></tbody></table></html>"));

        end RefLim;

        partial model RotationalSensor "Icon for a sensor"

          annotation (
            Coordsys(
              extent = [-100, -100; 100, 100], 
              grid = [1, 1], 
              component = [20, 20], 
              scale = 0), 
            Icon(
              Ellipse(extent = [-70, 70; 70, -70], style(color = 0, fillColor = 7)), 
              Line(points = [0, 70; 0, 40], style(color = 0)), 
              Line(points = [22.9, 32.8; 40.2, 57.3], style(color = 0)), 
              Line(points = [-22.9, 32.8; -40.2, 57.3], style(color = 0)), 
              Line(points = [37.6, 13.7; 65.8, 23.9], style(color = 0)), 
              Line(points = [-37.6, 13.7; -65.8, 23.9], style(color = 0)), 
              Line(points = [0, 0; 9.02, 28.6], style(color = 0)), 
              Polygon(points = [-0.48, 31.6; 18, 26; 18, 57.2; -0.48, 31.6], style(
                color = 0, 
                fillColor = 0, 
                fillPattern = 1)), 
              Ellipse(extent = [-5, 5; 5, -5], style(
                color = 0, 
                gradient = 0, 
                fillColor = 0, 
                fillPattern = 1))), 
            Diagram, 
            Documentation(revisions = "<html><table border=\"1\" rules=\"groups\"><thead><tr><td>Version</td>  <td>Date</td>  <td>Comment</td></tr></thead><tbody><tr><td>1.0.0</td>  <td>2006-03-13</td>  <td> </td></tr></tbody></table></html>"));
        end RotationalSensor;

        partial model RotationalSensorSmall "Small icon for a sensor"

          annotation (Icon(
            Ellipse(extent = [-50, 50; 50, -50], style(
              color = 0, 
              rgbcolor = {0, 0, 0}, 
              fillColor = 7, 
              rgbfillColor = {255, 255, 255})), 
            Line(points = [0, 47; 0, 30], style(
              color = 0, 
              rgbcolor = {0, 0, 0}, 
              fillPattern = 1)), 
            Line(points = [-40, 24; -26, 15], style(
              color = 0, 
              rgbcolor = {0, 0, 0}, 
              fillPattern = 1)), 
            Line(points = [40, 25; 26, 15], style(
              color = 0, 
              rgbcolor = {0, 0, 0}, 
              fillPattern = 1)), 
            Line(points = [-25, 40; -15, 26], style(
              color = 0, 
              rgbcolor = {0, 0, 0}, 
              fillPattern = 1)), 
            Line(points = [25, 40; 15, 26], style(
              color = 0, 
              rgbcolor = {0, 0, 0}, 
              fillPattern = 1)), 
            Ellipse(extent = [-5, 5; 5, -5], style(
              color = 0, 
              gradient = 0, 
              fillColor = 0, 
              fillPattern = 1)), 
            Line(points = [0, 0; 4, 14], style(color = 0)), 
            Polygon(points = [-2, 16; 9.5, 13; 12, 41.5; -2, 16], style(
              color = 0, 
              fillColor = 0, 
              fillPattern = 1))), Coordsys(grid = [1, 1], scale = 0), 
            Documentation(revisions = "<html><table border=\"1\" rules=\"groups\"><thead><tr><td>Version</td>  <td>Date</td>  <td>Comment</td></tr></thead><tbody><tr><td>1.0.0</td>  <td>2006-03-13</td>  <td> </td></tr></tbody></table></html>"));
        end RotationalSensorSmall;

        partial model RotationalSensorSmallGray "Icon for a sensor"

          annotation (
            Diagram, 
            Icon(
              Ellipse(extent = [-50, 50; 50, -50], style(
                color = 0, 
                rgbcolor = {0, 0, 0}, 
                fillColor = 30, 
                rgbfillColor = {230, 230, 230})), 
              Line(points = [0, 47; 0, 30], style(
                color = 0, 
                rgbcolor = {0, 0, 0}, 
                fillPattern = 1)), 
              Line(points = [-40, 24; -26, 15], style(
                color = 0, 
                rgbcolor = {0, 0, 0}, 
                fillPattern = 1)), 
              Line(points = [40, 25; 26, 15], style(
                color = 0, 
                rgbcolor = {0, 0, 0}, 
                fillPattern = 1)), 
              Line(points = [-25, 40; -15, 26], style(
                color = 0, 
                rgbcolor = {0, 0, 0}, 
                fillPattern = 1)), 
              Line(points = [25, 40; 15, 26], style(
                color = 0, 
                rgbcolor = {0, 0, 0}, 
                fillPattern = 1)), 
              Ellipse(extent = [-5, 5; 5, -5], style(
                color = 0, 
                gradient = 0, 
                fillColor = 0, 
                fillPattern = 1)), 
              Line(points = [0, 0; 4, 14], style(color = 0)), 
              Polygon(points = [-2, 16; 9.5, 13; 12, 41.5; -2, 16], style(
                color = 0, 
                fillColor = 0, 
                fillPattern = 1)), 
              Line(points = [-90, 0; -50, 0], style(
                color = 3, 
                rgbcolor = {0, 0, 255}, 
                fillColor = 30, 
                rgbfillColor = {230, 230, 230}, 
                fillPattern = 1)), 
              Line(points = [50, 0; 90, 0], style(
                color = 3, 
                rgbcolor = {0, 0, 255}, 
                fillColor = 30, 
                rgbfillColor = {230, 230, 230}, 
                fillPattern = 1))), 
            Coordsys(grid = [1, 1], component = [20, 20]), 
            Documentation(revisions = "<html><table border=\"1\" rules=\"groups\"><thead><tr><td>Version</td>  <td>Date</td>  <td>Comment</td></tr></thead><tbody><tr><td>1.0.0</td>  <td>2006-03-13</td>  <td> </td></tr></tbody></table></html>"));

        end RotationalSensorSmallGray;

        partial model SmartElectricDrives
          "Icon for the Smart Electric Drives Library"

          annotation (Icon(
            Rectangle(extent = [-100, 100; 100, -100], style(
              color = 7, 
              rgbcolor = {255, 255, 255}, 
              fillColor = 7, 
              rgbfillColor = {255, 255, 255}, 
              fillPattern = 1)), 
            Rectangle(extent = [-40, 60; 80, -60], style(
              color = 3, 
              rgbcolor = {0, 0, 255}, 
              gradient = 2, 
              fillColor = 76, 
              rgbfillColor = {170, 170, 255})), 
            Rectangle(extent = [-40, 60; -60, -60], style(
              color = 10, 
              gradient = 2, 
              fillColor = 10)), 
            Rectangle(extent = [80, 10; 100, -10], style(
              color = 10, 
              rgbcolor = {95, 95, 95}, 
              gradient = 2, 
              fillColor = 10, 
              rgbfillColor = {95, 95, 95})), 
            Rectangle(extent = [-40, 70; 40, 50], style(
              color = 10, 
              rgbcolor = {95, 95, 95}, 
              fillColor = 10, 
              rgbfillColor = {95, 95, 95})), 
            Polygon(points = [-50, -90; -40, -90; -10, -20; 40, -20; 70, -90; 80, -90; 80, -100; 
              -50, -100; -50, -90], style(
                color = 0, 
                gradient = 0, 
                fillColor = 0, 
                fillPattern = 1))), Coordsys(grid = [1, 1], scale = 0), 
            Documentation(revisions = "<html><table border=\"1\" rules=\"groups\"><thead><tr><td>Version</td>  <td>Date</td>  <td>Comment</td></tr></thead><tbody><tr><td>1.0.0</td>  <td>2006-03-13</td>  <td> </td></tr></tbody></table></html>"));
        end SmartElectricDrives;

        partial model SpeedController "Icon for a speed controller model"

          annotation (
            Diagram, 
            Icon(Rectangle(extent = [-100, 100; 100, -100], style(
              color = 10, 
              rgbcolor = {95, 95, 95}, 
              fillColor = 7, 
              rgbfillColor = {255, 255, 255})), 
              Ellipse(extent = [-23, 66; 70, -25], style(
                color = 10, 
                rgbcolor = {95, 95, 95}, 
                gradient = 2, 
                fillColor = 30, 
                rgbfillColor = {215, 215, 215})), 
              Ellipse(extent = [-32, 58; 61, -33], style(
                color = 10, 
                rgbcolor = {95, 95, 95}, 
                fillColor = 30, 
                rgbfillColor = {215, 215, 215}, 
                fillPattern = 1)), 
              Polygon(points = [-45, -20; 2, 27; 7, 29; 11, 30; 15, 30; 19, 29; 24, 27; 29, 
                23; 31, 20; 32, 17; 33, 13; 33, 9; 32, 5; 31, 2; 28, -3; -21, -52; -16, 
                -47; -13, -41; -12, -37; -12, -33; -13, -29; -15, -25; -17, -22; -19, 
                -20; -22, -18; -26, -16; -30, -15; -35, -15; -38, -16; -42, -18; -45, 
                -20], style(
                  color = 10, 
                  rgbcolor = {95, 95, 95}, 
                  gradient = 1, 
                  fillColor = 30, 
                  rgbfillColor = {215, 215, 215})), 
              Ellipse(extent = [-3, 45; 5, 38], style(
                color = 10, 
                rgbcolor = {95, 95, 95}, 
                fillColor = 30, 
                rgbfillColor = {215, 215, 215}, 
                fillPattern = 1)), 
              Ellipse(extent = [-23, 26; -15, 19], style(
                color = 10, 
                rgbcolor = {95, 95, 95}, 
                fillColor = 30, 
                rgbfillColor = {215, 215, 215}, 
                fillPattern = 1)), 
              Ellipse(extent = [28, 41; 36, 34], style(
                color = 10, 
                rgbcolor = {95, 95, 95}, 
                fillColor = 30, 
                rgbfillColor = {215, 215, 215}, 
                fillPattern = 1)), 
              Ellipse(extent = [43, 11; 51, 4], style(
                color = 10, 
                rgbcolor = {95, 95, 95}, 
                fillColor = 30, 
                rgbfillColor = {215, 215, 215}, 
                fillPattern = 1)), 
              Ellipse(extent = [27, -15; 35, -22], style(
                color = 10, 
                rgbcolor = {95, 95, 95}, 
                fillColor = 30, 
                rgbfillColor = {215, 215, 215}, 
                fillPattern = 1)), 
              Polygon(points = [21, 8; -1, -14; -6, -31; 15, -8; 21, 8], style(
                color = 7, 
                rgbcolor = {255, 255, 255}, 
                fillColor = 30, 
                rgbfillColor = {239, 239, 239}, 
                fillPattern = 1)), 
              Ellipse(extent = [-52, -55; -12, -15], style(
                color = 10, 
                rgbcolor = {95, 95, 95}, 
                gradient = 3, 
                fillColor = 9, 
                rgbfillColor = {175, 175, 175})), 
              Line(points = [-44, -63; -44, -63; -44, -63; -38, -65; -32, -65; -26, -65; 
                -19, -63; -14, -60; -10, -57; -7, -54; -4, -50; -2, -45; 0, -40; 1, -34; 
                0, -27; -1, -23; -3, -18; -7, -13; -10, -10; -14, -7; -19, -4; -25, -2; 
                -32, -1; -38, -1; -42, -2; -48, -4; -52, -6; -55, -9; -56, -9; -56, -10; 
                -56, -9; -56, -9; -55, -10; -56, -8], style(
                  color = 42, 
                  rgbcolor = {127, 0, 0}, 
                  fillColor = 42, 
                  rgbfillColor = {127, 0, 0})), 
              Polygon(points = [-51, 4; -63, -16; -42, -12; -51, 4], style(
                color = 42, 
                rgbcolor = {127, 0, 0}, 
                fillColor = 42, 
                rgbfillColor = {127, 0, 0}))), 
            Coordsys(grid = [1, 1], component = [20, 20]), 
            Documentation(revisions = "<html><table border=\"1\" rules=\"groups\"><thead><tr><td>Version</td>  <td>Date</td>  <td>Comment</td></tr></thead><tbody><tr><td>1.0.0</td>  <td>2006-03-13</td>  <td> </td></tr></tbody></table></html>"));

        end SpeedController;

        partial model SwitchBridge "Icon for a switch bridge model"

          annotation (Icon(
            Rectangle(extent = [-100, 100; 100, -100], style(
              color = 3, 
              rgbcolor = {0, 0, 255}, 
              fillColor = 76, 
              rgbfillColor = {170, 170, 255})), 
            Polygon(points = [90, 90; 90, -90; -90, -90; 90, 90], style(
              color = 3, 
              rgbcolor = {0, 0, 255}, 
              fillColor = 8, 
              rgbfillColor = {210, 210, 210})), 
            Polygon(points = [-90, 90; 90, 90; -90, -90; -90, 90], style(
              color = 3, 
              rgbcolor = {0, 0, 255}, 
              fillColor = 30, 
              rgbfillColor = {241, 241, 241})), 
            Line(points = [90, 90; -90, -90], style(
              color = 3, 
              rgbcolor = {0, 0, 255}, 
              fillPattern = 1)), 
            Ellipse(extent = [-40, 40; 40, -40], style(
              color = 3, 
              rgbcolor = {0, 0, 255}, 
              fillColor = 7, 
              rgbfillColor = {255, 255, 255})), 
            Line(points = [-28, -28; -18, -18], style(
              color = 3, 
              rgbcolor = {0, 0, 255}, 
              fillColor = 7, 
              rgbfillColor = {255, 255, 255}, 
              fillPattern = 1)), 
            Line(points = [-18, -18; -7, 28], style(
              color = 3, 
              rgbcolor = {0, 0, 255}, 
              fillColor = 7, 
              rgbfillColor = {255, 255, 255}, 
              fillPattern = 1)), 
            Line(points = [28, 28; 14, 14], style(
              color = 3, 
              rgbcolor = {0, 0, 255}, 
              fillColor = 7, 
              rgbfillColor = {255, 255, 255}, 
              fillPattern = 1)), 
            Line(points = [90, 0; 75, 0; 34, 0; -14, 0], style(
              color = 5, 
              rgbcolor = {255, 0, 255}, 
              fillColor = 7, 
              rgbfillColor = {255, 255, 255}, 
              fillPattern = 1))), Coordsys(grid = [1, 1], component = [20, 
              20]), 
            Documentation(revisions = "<html><table border=\"1\" rules=\"groups\"><thead><tr><td>Version</td>  <td>Date</td>  <td>Comment</td></tr></thead><tbody><tr><td>1.0.0</td>  <td>2006-03-13</td>  <td> </td></tr></tbody></table></html>"));

        end SwitchBridge;

        partial model SwitchControl "Icon for a switch state command model"

          annotation (
            Icon(
              Rectangle(extent = [-100, 100; 100, -100], style(
                color = 0, 
                fillColor = 30, 
                rgbfillColor = {210, 210, 210}, 
                fillPattern = 11)), 
              Rectangle(extent = [-80, -40; -40, -80], style(
                color = 0, 
                rgbcolor = {0, 0, 0}, 
                fillColor = 9, 
                rgbfillColor = {175, 175, 175}, 
                fillPattern = 1)), 
              Rectangle(extent = [-80, 80; -40, 40], style(
                color = 0, 
                rgbcolor = {0, 0, 0}, 
                fillColor = 9, 
                rgbfillColor = {175, 175, 175}, 
                fillPattern = 1)), 
              Ellipse(extent = [-47, -55; -34, -67], style(
                color = 5, 
                rgbcolor = {255, 0, 255}, 
                fillColor = 9, 
                rgbfillColor = {175, 175, 175}, 
                fillPattern = 1)), 
              Rectangle(extent = [-20, 20; 20, -20], style(
                color = 0, 
                rgbcolor = {0, 0, 0}, 
                fillColor = 9, 
                rgbfillColor = {175, 175, 175}, 
                fillPattern = 1)), 
              Line(points = [-90, -60; -80, -60], style(
                color = 5, 
                rgbcolor = {255, 0, 255}, 
                fillColor = 9, 
                rgbfillColor = {175, 175, 175}, 
                fillPattern = 1)), 
              Line(points = [-90, 60; -80, 60], style(
                color = 5, 
                rgbcolor = {255, 0, 255}, 
                fillColor = 9, 
                rgbfillColor = {175, 175, 175}, 
                fillPattern = 1)), 
              Line(points = [-39, 60; -30, 60; -30, 0; -20, 0], style(
                color = 5, 
                rgbcolor = {255, 0, 255}, 
                fillColor = 9, 
                rgbfillColor = {175, 175, 175}, 
                fillPattern = 1)), 
              Line(points = [-34, -60; -30, -60; -30, 1], style(
                color = 5, 
                rgbcolor = {255, 0, 255}, 
                fillColor = 9, 
                rgbfillColor = {175, 175, 175}, 
                fillPattern = 1)), 
              Line(points = [30, -30; 40, -30; 40, 30; 60, 30; 60, -30; 70, -30], style(
                color = 0, 
                rgbcolor = {0, 0, 0}, 
                fillPattern = 1)), 
              Line(points = [20, -50; 30, -50; 30, 10; 50, 10; 50, -50; 60, -50], style(
                color = 0, 
                rgbcolor = {0, 0, 0}, 
                fillPattern = 1)), 
              Line(points = [40, -10; 50, -10; 50, 50; 70, 50; 70, -10; 80, -10], style(
                color = 0, 
                rgbcolor = {0, 0, 0}, 
                fillPattern = 1))), 
            Coordsys(grid = [1, 1], component = [20, 20]), 
            Diagram, 
            Documentation(revisions = "<html><table border=\"1\" rules=\"groups\"><thead><tr><td>Version</td>  <td>Date</td>  <td>Comment</td></tr></thead><tbody><tr><td>1.0.0</td>  <td>2006-03-13</td>  <td> </td></tr></tbody></table></html>"));

        end SwitchControl;

        partial model SwitchedConverter

          annotation (Icon(
            Rectangle(extent = [-100, 100; 100, -100], style(
              color = 3, 
              rgbcolor = {0, 0, 255}, 
              fillColor = 76, 
              rgbfillColor = {170, 170, 255})), 
            Polygon(points = [90, 90; 90, -90; -90, -90; 90, 90], style(
              color = 3, 
              rgbcolor = {0, 0, 255}, 
              fillColor = 8, 
              rgbfillColor = {210, 210, 210})), 
            Polygon(points = [-90, 90; 90, 90; -90, -90; -90, 90], style(
              color = 3, 
              rgbcolor = {0, 0, 255}, 
              fillColor = 30, 
              rgbfillColor = {241, 241, 241})), 
            Line(points = [90, 90; -90, -90], style(
              color = 3, 
              rgbcolor = {0, 0, 255}, 
              fillPattern = 1)), 
            Ellipse(extent = [-40, 40; 40, -40], style(
              color = 3, 
              rgbcolor = {0, 0, 255}, 
              fillColor = 7, 
              rgbfillColor = {255, 255, 255})), 
            Line(points = [-28, -28; -18, -18], style(
              color = 3, 
              rgbcolor = {0, 0, 255}, 
              fillColor = 7, 
              rgbfillColor = {255, 255, 255}, 
              fillPattern = 1)), 
            Line(points = [-18, -18; -7, 28], style(
              color = 3, 
              rgbcolor = {0, 0, 255}, 
              fillColor = 7, 
              rgbfillColor = {255, 255, 255}, 
              fillPattern = 1)), 
            Line(points = [28, 28; 14, 14], style(
              color = 3, 
              rgbcolor = {0, 0, 255}, 
              fillColor = 7, 
              rgbfillColor = {255, 255, 255}, 
              fillPattern = 1))));
        end SwitchedConverter;

        partial model ThyristorBridge "Icon for a thyristor bridge model"

          annotation (Icon(
            Rectangle(extent = [-100, 100; 100, -100], style(
              color = 3, 
              rgbcolor = {0, 0, 255}, 
              fillColor = 76, 
              rgbfillColor = {170, 170, 255})), 
            Polygon(points = [90, 90; 90, -90; -90, -90; 90, 90], style(
              color = 3, 
              rgbcolor = {0, 0, 255}, 
              fillColor = 8, 
              rgbfillColor = {210, 210, 210})), 
            Polygon(points = [-90, 90; 90, 90; -90, -90; -90, 90], style(
              color = 3, 
              rgbcolor = {0, 0, 255}, 
              fillColor = 30, 
              rgbfillColor = {241, 241, 241})), 
            Ellipse(extent = [-40, 40; 40, -40], style(
              color = 3, 
              rgbcolor = {0, 0, 255}, 
              fillColor = 7, 
              rgbfillColor = {255, 255, 255})), 
            Line(points = [-5, 25; 25, -5], style(
              color = 3, 
              rgbcolor = {0, 0, 255}, 
              fillPattern = 1)), 
            Line(points = [40, 0; 40, 0], style(
              color = 5, 
              rgbcolor = {255, 0, 255}, 
              fillColor = 30, 
              rgbfillColor = {215, 215, 215}, 
              fillPattern = 1)), 
            Line(points = [90, 90; -90, -90], style(
              color = 3, 
              rgbcolor = {0, 0, 255}, 
              fillPattern = 1)), 
            Polygon(points = [10, 10; 0, -30; -30, 0; 10, 10], style(
              color = 3, 
              rgbcolor = {0, 0, 255}, 
              fillColor = 7, 
              rgbfillColor = {255, 255, 255})), 
            Line(points = [-28, -28; 28, 28], style(color = 3, rgbcolor = {0, 0, 255})), 
            Line(points = [6, -8; 22, -24], style(color = 5, rgbcolor = {255, 0, 255}))), 
            Coordsys(grid = [1, 1], component = [20, 
              20]), 
            Diagram, 
            Documentation(revisions = "<html><table border=\"1\" rules=\"groups\"><thead><tr><td>Version</td>  <td>Date</td>  <td>Comment</td></tr></thead><tbody><tr><td>1.0.0</td>  <td>2006-03-13</td>  <td> </td></tr></tbody></table></html>"));

        end ThyristorBridge;

        partial model TorqueCurrentGain "Icon for a torque-current gain model"

          annotation (
            Icon(
              Polygon(points = [-100, 100; -100, -100; 100, 0; -100, 100], style(
                color = 74, 
                rgbcolor = {0, 0, 127}, 
                fillColor = 76, 
                rgbfillColor = {170, 170, 255})), 
              Line(points = [-30, -60; -30, 58], style(
                color = 10, 
                rgbcolor = {135, 135, 135}, 
                fillColor = 10, 
                rgbfillColor = {135, 135, 135})), 
              Polygon(points = [-30, 60; -36, 48; -24, 48; -30, 60], style(
                color = 10, 
                rgbcolor = {135, 135, 135}, 
                fillColor = 10, 
                rgbfillColor = {135, 135, 135})), 
              Line(points = [-90, 0; 60, 0], style(
                color = 10, 
                rgbcolor = {135, 135, 135}, 
                fillColor = 10, 
                rgbfillColor = {135, 135, 135})), 
              Polygon(points = [70, 0; 58, 6; 58, -6; 70, 0], style(
                color = 10, 
                rgbcolor = {135, 135, 135}, 
                fillColor = 10, 
                rgbfillColor = {135, 135, 135})), 
              Polygon(points = [-8, 35; 3, 25; 8, 42; -8, 35], style(
                color = 58, 
                rgbcolor = {0, 127, 0}, 
                fillColor = 58, 
                rgbfillColor = {0, 127, 0})), 
              Line(points = [-30, 0; -1, 31], style(
                color = 58, 
                rgbcolor = {0, 127, 0}, 
                fillColor = 58, 
                rgbfillColor = {0, 127, 0}, 
                fillPattern = 1)), 
              Line(points = [-30, 0; -77, 46], style(
                color = 74, 
                rgbcolor = {0, 0, 127}, 
                fillColor = 74, 
                rgbfillColor = {0, 0, 127})), 
              Polygon(points = [-86, 53; -80, 39; -71, 50; -86, 53], style(
                color = 74, 
                rgbcolor = {0, 0, 127}, 
                fillColor = 74, 
                rgbfillColor = {0, 0, 127}))), 
            Coordsys(grid = [1, 1], component = [20, 20]), 
            Diagram, 
            Documentation(revisions = "<html><table border=\"1\" rules=\"groups\"><thead><tr><td>Version</td>  <td>Date</td>  <td>Comment</td></tr></thead><tbody><tr><td>1.0.0</td>  <td>2006-03-13</td>  <td> </td></tr></tbody></table></html>"));

        end TorqueCurrentGain;

        partial model TorqueFluxController
          "Icon for a torque controller model or a torque-and-flux controller model"

          annotation (Icon(
            Rectangle(extent = [-100, 100; 100, -100], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              fillColor = 69, 
              rgbfillColor = {0, 128, 255})), 
            Rectangle(extent = [-90, 90; 90, -90], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              fillColor = 68, 
              rgbfillColor = {170, 213, 255})), 
            Line(points = [0, 0; 57, 57], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              fillColor = 74, 
              rgbfillColor = {0, 0, 127}, 
              fillPattern = 1)), 
            Line(points = [0, -80; 0, 77], style(
              color = 10, 
              rgbcolor = {135, 135, 135}, 
              fillColor = 10, 
              rgbfillColor = {135, 135, 135})), 
            Polygon(points = [0, 80; -6, 68; 6, 68; 0, 80], style(
              color = 10, 
              rgbcolor = {135, 135, 135}, 
              fillColor = 10, 
              rgbfillColor = {135, 135, 135})), 
            Line(points = [-80, 0; 75, 0], style(
              color = 10, 
              rgbcolor = {135, 135, 135}, 
              fillColor = 10, 
              rgbfillColor = {135, 135, 135})), 
            Polygon(points = [80, 0; 68, 6; 68, -6; 80, 0], style(
              color = 10, 
              rgbcolor = {135, 135, 135}, 
              fillColor = 10, 
              rgbfillColor = {135, 135, 135})), 
            Polygon(points = [35, 54; 54, 35; 65, 66; 35, 54], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              fillColor = 74, 
              rgbfillColor = {0, 0, 127}))), Diagram, component = [20, 20], 
            Coordsys(grid = [1, 1], component = [20, 20]), 
            Documentation(revisions = "<html><table border=\"1\" rules=\"groups\"><thead><tr><td>Version</td>  <td>Date</td>  <td>Comment</td></tr></thead><tbody><tr><td>1.0.0</td>  <td>2006-03-13</td>  <td> </td></tr></tbody></table></html>"));

        end TorqueFluxController;

        partial model Transformation "Icon for a transformation model"

          annotation (Coordsys(grid = [1, 1], component = [20, 20]), Icon(
            Rectangle(extent = [-100, 100; 100, -100], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              fillColor = 8, 
              rgbfillColor = {210, 210, 210})), 
            Polygon(points = [-100, 100; 100, 100; -100, -100; -100, 100], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              fillColor = 30, 
              rgbfillColor = {241, 241, 241})), 
            Line(points = [100, 100; -100, -100], style(color = 74, rgbcolor = {0, 0, 127}))), 
            Documentation(revisions = "<html><table border=\"1\" rules=\"groups\"><thead><tr><td>Version</td>  <td>Date</td>  <td>Comment</td></tr></thead><tbody><tr><td>1.0.0</td>  <td>2006-03-13</td>  <td> </td></tr></tbody></table></html>"));
        end Transformation;

        partial model Y2D "Icon for a star-delta conversion model"

          annotation (Icon(
            Rectangle(extent = [-100, 100; 100, -100], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              fillColor = 7, 
              rgbfillColor = {255, 255, 255})), 
            Line(points = [-60, 60; 0, 0; 60, 60], style(
              color = 3, 
              rgbcolor = {0, 0, 255}, 
              fillPattern = 1)), 
            Polygon(points = [0, 70; -60, -50; 60, -50; 0, 70], style(color = 3, 
              rgbcolor = {0, 0, 255})), 
            Line(points = [0, 0; 0, -65], style(
              color = 3, 
              rgbcolor = {0, 0, 255}, 
              fillPattern = 1))), 
            Coordsys(grid = [1, 1], component = [20, 20]), 
            Diagram, 
            Documentation(revisions = "<html><table border=\"1\" rules=\"groups\"><thead><tr><td>Version</td>  <td>Date</td>  <td>Comment</td></tr></thead><tbody><tr><td>1.0.0</td>  <td>2006-03-13</td>  <td> </td></tr></tbody></table></html>"));

        end Y2D;

        partial model Example_big "Icon for an example model"

          annotation (Icon(Ellipse(extent = [-95, 101; 100, -100], 
            style(
              color = 10, 
              rgbcolor = {95, 95, 95}, 
              fillColor = 7, 
              rgbfillColor = {255, 255, 255})), 
            Polygon(points = [-38, 53; 75, 0; -38, -60; -38, 53], 
              style(
                pattern = 0, 
                fillColor = 10, 
                rgbfillColor = {95, 95, 95}))), Coordsys(grid = [1, 1], component = [20, 20], 
              extent = [-150, -100; 150, 100], 
              scale = 0.1), 
            Documentation(revisions = "<html><table border=\"1\" rules=\"groups\"><thead><tr><td>Version</td>  <td>Date</td>  <td>Comment</td></tr></thead><tbody><tr><td>1.0.0</td>  <td>2006-03-13</td>  <td> </td></tr></tbody></table></html>"));

        end Example_big;

        partial model Battery
          annotation (Diagram, 
            Icon(
              Polygon(points = [-40, 66; -100, 26; 40, 26; 100, 66], style(rgbcolor = {0, 0, 0}, thickness = 2, rgbfillColor = {192, 192, 192}, fillPattern = 1)), 
              Polygon(points = [-100, 26; -100, -74; 40, -74; 40, 26], style(rgbcolor = {0, 0, 0}, thickness = 2, rgbfillColor = {60, 60, 60}, fillPattern = 1)), 
              Polygon(points = [100, 66; 40, 26; 40, -74; 100, -34], style(rgbcolor = {0, 0, 0}, thickness = 2, rgbfillColor = {45, 45, 45}, fillPattern = 1)), 
              Rectangle(extent = [-100, 6; 40, 26], style(rgbcolor = {0, 0, 0}, thickness = 2, rgbfillColor = {192, 192, 192}, fillPattern = 1)), 
              Polygon(points = [40, 26; 40, 6; 100, 46; 100, 66], style(rgbcolor = {0, 0, 0}, thickness = 2, rgbfillColor = {192, 192, 192}, fillPattern = 1)), 
              Ellipse(extent = [-20, 32; -8, 38], style(rgbcolor = {0, 0, 0}, thickness = 2, rgbfillColor = {165, 42, 0}, fillPattern = 1)), 
              Rectangle(extent = [-20, 35; -8, 44], style(rgbcolor = {45, 45, 45}, thickness = 2, rgbfillColor = {165, 42, 0}, fillPattern = 1)), 
              Ellipse(extent = [-20, 42; -8, 46], style(rgbcolor = {0, 0, 0}, thickness = 2, rgbfillColor = {165, 42, 0}, fillPattern = 1)), 
              Ellipse(extent = [26, 32; 38, 38], style(rgbcolor = {0, 0, 0}, thickness = 2, rgbfillColor = {165, 42, 0}, fillPattern = 1)), 
              Rectangle(extent = [26, 35; 38, 44], style(rgbcolor = {45, 45, 45}, thickness = 2, rgbfillColor = {165, 42, 0}, fillPattern = 1)), 
              Ellipse(extent = [26, 42; 38, 46], style(rgbcolor = {0, 0, 0}, thickness = 2, rgbfillColor = {165, 42, 0}, fillPattern = 1)), 
              Ellipse(extent = [-64, 32; -52, 38], style(rgbcolor = {0, 0, 0}, thickness = 2, rgbfillColor = {165, 42, 0}, fillPattern = 1)), 
              Rectangle(extent = [-64, 35; -52, 44], style(rgbcolor = {45, 45, 45}, thickness = 2, rgbfillColor = {165, 42, 0}, fillPattern = 1)), 
              Ellipse(extent = [-64, 42; -52, 46], style(rgbcolor = {0, 0, 0}, thickness = 2, rgbfillColor = {165, 42, 0}, fillPattern = 1)), 
              Ellipse(extent = [16, 54; 28, 60], style(rgbcolor = {0, 0, 0}, thickness = 2, rgbfillColor = {165, 42, 0}, fillPattern = 1)), 
              Rectangle(extent = [16, 57; 28, 66], style(rgbcolor = {45, 45, 45}, thickness = 2, rgbfillColor = {165, 42, 0}, fillPattern = 1)), 
              Ellipse(extent = [16, 64; 28, 68], style(rgbcolor = {0, 0, 0}, thickness = 2, rgbfillColor = {165, 42, 0}, fillPattern = 1)), 
              Ellipse(extent = [62, 54; 74, 60], style(rgbcolor = {0, 0, 0}, thickness = 2, rgbfillColor = {165, 42, 0}, fillPattern = 1)), 
              Rectangle(extent = [62, 57; 74, 66], style(rgbcolor = {45, 45, 45}, thickness = 2, rgbfillColor = {165, 42, 0}, fillPattern = 1)), 
              Ellipse(extent = [62, 64; 74, 68], style(rgbcolor = {0, 0, 0}, thickness = 2, rgbfillColor = {165, 42, 0}, fillPattern = 1)), 
              Ellipse(extent = [-28, 54; -16, 60], style(rgbcolor = {0, 0, 0}, thickness = 2, rgbfillColor = {165, 42, 0}, fillPattern = 1)), 
              Rectangle(extent = [-28, 57; -16, 66], style(rgbcolor = {45, 45, 45}, thickness = 2, rgbfillColor = {165, 42, 0}, fillPattern = 1)), 
              Ellipse(extent = [-28, 64; -16, 68], style(rgbcolor = {0, 0, 0}, thickness = 2, rgbfillColor = {165, 42, 0}, fillPattern = 1))));
        end Battery;

        model Motor
          annotation (Icon(
            Bitmap(extent = [-100, -100; 100, 100], name = ".\\Images\\图片1.PNG")));
        end Motor;
        model NumericalDevice
          annotation (Diagram(coordinateSystem(extent = {{-140.0, -100.0}, {140.0, 100.0}}, 
            preserveAspectRatio = false, 
            grid = {2.0, 2.0})), 
            Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
              preserveAspectRatio = false, 
              grid = {2.0, 2.0}), graphics = {Rectangle(origin = {0.0, 0.0}, 
              fillColor = {221, 221, 221}, 
              fillPattern = FillPattern.Solid, 
              extent = {{-100.0, 100.0}, {100.0, -100.0}}), Rectangle(origin = {-27.0, 44.0}, 
              fillColor = {170, 255, 255}, 
              fillPattern = FillPattern.Solid, 
              extent = {{-55.0, 40.0}, {55.0, -40.0}}), Ellipse(origin = {-69.0, -65.0}, 
              fillColor = {85, 0, 0}, 
              fillPattern = FillPattern.Sphere, 
              extent = {{-15.0, 15.0}, {15.0, -15.0}}), Ellipse(origin = {33.0, -63.0}, 
              fillColor = {0, 255, 0}, 
              fillPattern = FillPattern.Sphere, 
              extent = {{-13.0, 13.0}, {13.0, -13.0}}), Ellipse(origin = {73.0, -63.0}, 
              fillColor = {0, 255, 0}, 
              fillPattern = FillPattern.Sphere, 
              extent = {{-13.0, 13.0}, {13.0, -13.0}})}));
        end NumericalDevice;
      end Icons;

      package Components
        extends MachineToolDynamic.ControlBlocks.Drivers.Icons.FolderBlue;
        model ThreePhase "Full bridge converter implemented with ideal switches"
          import GTP = EDP;
          extends Icons.SwitchBridge;
          extends Interfaces.SupplyDC;
          extends Interfaces.LoadThreePhase;
          Modelica.Blocks.Interfaces.BooleanInput u[6] "Switch control signals" 
            annotation (extent = [110, -10; 90, 10]);
        protected 
          parameter Modelica.SIunits.Resistance RonSwitch = 1e-5
            "Closed switch resistance" 
            annotation (Dialog(tab = "Ideal electrical closers", group = "Parameters"));
          parameter Modelica.SIunits.Conductance GoffSwitch = 1e-5
            "Opened switch conductance" 
            annotation (Dialog(tab = "Ideal electrical closers", group = "Parameters"));
          parameter Modelica.SIunits.Resistance RonDiode = 1e-5
            "Forward state-on differential resistance (closed diode resistance)" 
            annotation (Dialog(tab = "Ideal diodes", group = "Parameters"));
          parameter Modelica.SIunits.Conductance GoffDiode = 1e-5
            "Backward state-off conductance (opened diode conductance)" 
            annotation (Dialog(tab = "Ideal diodes", group = "Parameters"));
          parameter Modelica.SIunits.Voltage VkneeDiode = 0
            "Forward threshold voltage" 
            annotation (Dialog(tab = "Ideal diodes", group = "Parameters"));
          annotation (Coordsys(
            preserveAspectRatio = false, 
            extent = [-100, -100; 100, 100], 
            grid = [1, 1]), 
            defaultComponentName = "dcac", 
            Icon(
              Text(extent = [-150, 110; 150, 150], style(rgbcolor = {0, 0, 255}), string = "%name"), 
              Text(extent = [-80, 30; -20, 80], style(rgbcolor = {0, 0, 0}), string = "DC"), 
              Text(extent = [13, -90; 89, -30], style(rgbcolor = {0, 0, 0}), string = "PWM")), 
            Documentation(info = "<html><p>This model represents a three phase full bridge as shown in the figure below. Due to the symmetric arrangement (all inverter legs are identical) the output voltages at the AC side are solely dependent on the DC voltage of the supply side and the switch status. Note that one of the two switches in a leg has to be <code>on</code> at any instant. The <a href=\"Modelica.Electrical.Analog.Ideal.IdealDiode\">freewheeling diodes</a> as well as the <a href=\"Modelica.Electrical.Analog.Ideal.IdealClosingSwitch\">switches</a> are implemented as ideal components. Therefore the blanking time is ignored in this model. In order to control the switches a boolean six element signal must be connected to input <code>u</code>. The DC supply voltage (provided by a battery or super cap, for instance) has to be connected to the pins <code>pSupply</code> and <code>nSupply</code> (see at the connector table). The output signal <code>vDC</code> provides the voltage level of the DC circuit.</p> <p><table border=0 cellspacing=0 cellpadding=1>  <tr>    <td> <img src=\"../images/SmartElectricDrives.Converters.IdealSwitching.DCAC.ThreePhase.png\"> </td>  </tr>  <tr>    <td> <b> Fig. 1: </b>Three phase full bridge</td>  </tr></table> </html>", revisions = "<html><table border=\"1\" rules=\"groups\"><thead><tr><td>Version</td>  <td>Date</td>  <td>Comment</td></tr></thead><tbody><tr><td>1.0.0</td>  <td>2006-01-17</td>  <td> </td></tr><tr><td>1.0.3</td>  <td>2006-08-31</td>  <td>Updated circuit images</td></tr></tbody></table></html> "), 
            Coordsys(grid = [1, 1], component = [20, 20]), 
            Diagram);
        public 
          Modelica.Electrical.Analog.Ideal.IdealClosingSwitch idealClosingSwitch1(
            final Goff = GoffSwitch, final Ron = RonSwitch)
            annotation (extent = [-70, 40; -50, 60], 
              rotation = -90);
          Modelica.Electrical.Analog.Ideal.IdealClosingSwitch idealClosingSwitch3(
            final Goff = GoffSwitch, final Ron = RonSwitch)
            annotation (extent = [-10, 40; 10, 60], 
              rotation = -90);
          Modelica.Electrical.Analog.Ideal.IdealClosingSwitch idealClosingSwitch5(
            final Goff = GoffSwitch, final Ron = RonSwitch)
            annotation (extent = [50, 40; 70, 60], 
              rotation = -90);
          Modelica.Electrical.Analog.Ideal.IdealClosingSwitch idealClosingSwitch4(
            final Goff = GoffSwitch, final Ron = RonSwitch)
            annotation (extent = [-70, -60; -50, -40], 
              rotation = -90);
          Modelica.Electrical.Analog.Ideal.IdealClosingSwitch idealClosingSwitch6(
            final Goff = GoffSwitch, final Ron = RonSwitch)
            annotation (extent = [-10, -60; 10, -40], 
              rotation = -90);
          Modelica.Electrical.Analog.Ideal.IdealClosingSwitch idealClosingSwitch2(
            final Goff = GoffSwitch, final Ron = RonSwitch)
            annotation (extent = [50, -60; 70, -40], 
              rotation = -90);
          Modelica.Electrical.Analog.Ideal.IdealDiode idealDiode1(
            final Ron = RonDiode, 
            final Goff = GoffDiode, 
            final Vknee = VkneeDiode)
            annotation (extent = [-50, 60; -30, 40], 
              rotation = -90);
          Modelica.Electrical.Analog.Ideal.IdealDiode idealDiode3(
            final Ron = RonDiode, 
            final Goff = GoffDiode, 
            final Vknee = VkneeDiode)
            annotation (extent = [13, 60; 33, 40], 
              rotation = -90);
          Modelica.Electrical.Analog.Ideal.IdealDiode idealDiode5(
            final Ron = RonDiode, 
            final Goff = GoffDiode, 
            final Vknee = VkneeDiode)
            annotation (extent = [70, 60; 90, 40], 
              rotation = -90);
          Modelica.Electrical.Analog.Ideal.IdealDiode idealDiode4(
            final Ron = RonDiode, 
            final Goff = GoffDiode, 
            final Vknee = VkneeDiode)
            annotation (extent = [-50, -40; -30, -60], 
              rotation = -90);
          Modelica.Electrical.Analog.Ideal.IdealDiode idealDiode6(
            final Ron = RonDiode, 
            final Goff = GoffDiode, 
            final Vknee = VkneeDiode)
            annotation (extent = [10, -40; 30, -60], 
              rotation = -90);
          Modelica.Electrical.Analog.Ideal.IdealDiode idealDiode2(
            final Ron = RonDiode, 
            final Goff = GoffDiode, 
            final Vknee = VkneeDiode)
            annotation (extent = [70, -40; 90, -60], 
              rotation = -90);
        protected 
          Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor
            annotation (extent = [-80, 0; -100, 20], 
              rotation = -90);
        equation 
          connect(idealClosingSwitch1.n, idealClosingSwitch4.p)
            annotation (points = [-60, 40; -60, -40], 
              style(color = 3, rgbcolor = {0, 0, 255}));
          connect(idealClosingSwitch3.n, idealClosingSwitch6.p)
            annotation (points = [6.12323e-16, 40; 6.12323e-16, -40; -6.12323e-16, -40], 
              style(color = 3, rgbcolor = {0, 0, 255}));
          connect(idealClosingSwitch5.n, idealClosingSwitch2.p)
            annotation (points = [60, 40; 60, -40], 
              style(color = 3, rgbcolor = {0, 0, 255}));
          connect(pSupply, idealClosingSwitch1.p)
            annotation (points = [-100, 60; -60, 60], 
              style(color = 3, rgbcolor = {0, 0, 255}));
          connect(idealClosingSwitch1.p, idealClosingSwitch3.p)
            annotation (points = [-60, 60; -6.12323e-16, 60], 
              style(color = 3, rgbcolor = {0, 0, 255}));
          connect(idealClosingSwitch3.p, idealClosingSwitch5.p)
            annotation (points = [-6.12323e-16, 60; 60, 60], 
              style(color = 3, rgbcolor = {0, 0, 255}));
          connect(nSupply, idealClosingSwitch4.n)
            annotation (points = [-100, -60; -60, 
              -60], 
              style(color = 3, rgbcolor = {0, 0, 255}));
          connect(idealClosingSwitch4.n, idealClosingSwitch6.n)
            annotation (points = [-60, -60; 6.12323e-16, -60], 
              style(color = 3, rgbcolor = {0, 0, 
                255}));
          connect(idealClosingSwitch6.n, idealClosingSwitch2.n)
            annotation (points = [6.12323e-16, -60; 60, -60], 
              style(color = 3, rgbcolor = {0, 0, 255}));
          connect(idealDiode1.n, idealClosingSwitch1.p)
            annotation (points = [-40, 
              60; -60, 60], 
              style(color = 3, rgbcolor = {0, 0, 255}));
          connect(idealDiode3.n, idealClosingSwitch3.p)
            annotation (points = [23, 60; 
              -6.12323e-16, 60], 
              style(color = 3, rgbcolor = {0, 0, 255}));
          connect(idealDiode5.n, idealClosingSwitch5.p)
            annotation (points = [80, 60; 
              60, 60], 
              style(color = 3, rgbcolor = {0, 0, 255}));
          connect(idealDiode4.p, idealClosingSwitch4.n)
            annotation (points = [-40, 
              -60; -60, -60], 
              style(color = 3, rgbcolor = {0, 0, 255}));
          connect(idealDiode6.p, idealClosingSwitch6.n)
            annotation (points = [20, -60; 
              6.12323e-16, -60], 
              style(color = 3, rgbcolor = {0, 0, 255}));
          connect(idealDiode2.p, idealClosingSwitch2.n)
            annotation (points = [80, 
              -60; 60, -60], 
              style(color = 3, rgbcolor = {0, 0, 255}));
          connect(voltageSensor.p, pSupply)
            annotation (points = [-90, 20; -90, 60; 
              -100, 60], 
              style(color = 3, rgbcolor = {0, 0, 255}));
          connect(voltageSensor.n, nSupply)
            annotation (points = [-90, 0; -90, -60; 
              -100, -60], 
              style(color = 3, rgbcolor = {0, 0, 255}));
          connect(pLoad.pin[1], idealClosingSwitch4.p)
            annotation (points = [0, -100; 
              0, -70; -75, -70; -75, 0; -60, 0; -60, -40], 
              style(color = 3, rgbcolor = {0, 0, 255}));
          connect(pLoad.pin[2], idealClosingSwitch6.p)
            annotation (points = [0, -100; 0, -70; -20, -70; -20, -6; -6.12323e-16, -6; -6.12323e-16, 
              -40], 
              style(color = 3, rgbcolor = {0, 0, 255}));
          connect(pLoad.pin[3], idealClosingSwitch2.p)
            annotation (points = [0, -100; 0, -70; 39, -70; 39, -6; 60, -6; 60, -40], 
              style(
                color = 3, rgbcolor = {0, 0, 255}));
          connect(idealDiode1.p, idealClosingSwitch1.n)
            annotation (points = [-40, 40; -60, 40], 
              style(color = 3, rgbcolor = {0, 0, 255}));
          connect(idealDiode3.p, idealClosingSwitch3.n)
            annotation (points = [23, 40; 
              6.12323e-16, 40], 
              style(color = 3, rgbcolor = {0, 0, 255}));
          connect(idealDiode5.p, idealClosingSwitch5.n)
            annotation (points = [80, 40; 60, 40], 
              style(color = 3, rgbcolor = {0, 0, 255}));
          connect(idealDiode4.n, idealClosingSwitch4.p)
            annotation (points = [-40, -40; -60, -40], 
              style(color = 3, rgbcolor = {0, 0, 255}));
          connect(idealDiode6.n, idealClosingSwitch6.p)
            annotation (points = [20, -40; 
              -6.12323e-16, -40], 
              style(color = 3, rgbcolor = {0, 0, 255}));
          connect(idealDiode2.n, idealClosingSwitch2.p)
            annotation (points = [80, -40; 60, 
              -40], 
              style(color = 3, rgbcolor = {0, 0, 255}));
          connect(u[1], idealClosingSwitch1.control)
            annotation (points = [100, 0; -53, 0; -53, 50], style(rgbcolor = {255, 0, 255}));
          connect(u[2], idealClosingSwitch3.control)
            annotation (points = [100, 0; 7, 0; 7, 50], style(rgbcolor = {255, 0, 255}));
          connect(u[3], idealClosingSwitch5.control)
            annotation (points = [100, 0; 67, 0; 67, 50], style(rgbcolor = {255, 0, 255}));
          connect(u[4], idealClosingSwitch4.control)
            annotation (points = [100, 0; -53, 0; -53, -50], style(rgbcolor = {255, 0, 255}));
          connect(u[5], idealClosingSwitch6.control)
            annotation (points = [100, 0; 7, 0; 7, -50], style(rgbcolor = {255, 0, 255}));
          connect(u[6], idealClosingSwitch2.control)
            annotation (points = [100, 0; 67, 0; 67, -50], style(rgbcolor = {255, 0, 255}));
        end ThreePhase;

        block U_ab
          extends Modelica.Blocks.Interfaces.BlockIcon;
          Modelica.Blocks.Interfaces.RealInput Ux annotation (extent = [-110, 50; -90, 70]);
          Modelica.Blocks.Interfaces.RealInput Uy annotation (extent = [-110, -10; -90, 10]);
          Modelica.Blocks.Interfaces.RealInput Uz
            annotation (extent = [-110, -70; -90, -50]);
          Modelica.Blocks.Interfaces.RealOutput U_alpha
            annotation (extent = [90, 40; 110, 60]);
          Modelica.Blocks.Interfaces.RealOutput U_beta
            annotation (extent = [90, -60; 110, -40]);
        equation 
          U_alpha = Ux + Uy * cos(2 * Modelica.Constants.pi / 3) + Uz * cos(4 * Modelica.Constants.pi / 3);
          U_beta = Uy * sin(2 * Modelica.Constants.pi / 3) + Uz * sin(4 * Modelica.Constants.pi / 3);

          annotation (Diagram, Icon(
            Text(
              extent = [-80, 70; -80, 50], 
              style(color = 3, rgbcolor = {0, 0, 255}), 
              string = "Ux"), 
            Text(
              extent = [-80, 10; -80, -10], 
              style(color = 3, rgbcolor = {0, 0, 255}), 
              string = "Uy"), 
            Text(
              extent = [-80, -50; -80, -70], 
              style(color = 3, rgbcolor = {0, 0, 255}), 
              string = "Uz"), 
            Text(
              extent = [80, 60; 80, 40], 
              style(color = 3, rgbcolor = {0, 0, 255}), 
              string = "a"), 
            Text(
              extent = [80, -40; 80, -60], 
              style(color = 3, rgbcolor = {0, 0, 255}), 
              string = "b")));
        end U_ab;

        block ab_N
          extends Modelica.Blocks.Interfaces.BlockIcon;
          Modelica.Blocks.Interfaces.RealInput U_alpha
            annotation (extent = [-110, 40; -90, 60]);
          Modelica.Blocks.Interfaces.RealInput U_beta
            annotation (extent = [-110, -60; -90, -40]);
          Modelica.Blocks.Interfaces.IntegerOutput N annotation (extent = [90, -10; 110, 10]);
        protected 
          Real va;
          Real vb;
          Real vc;
        equation 
          va = U_beta;
          vb = (-U_beta + U_alpha * sqrt(3)) / 2;
          vc = (-U_beta - U_alpha * sqrt(3)) / 2;
          N = (if va > 0 then 1 else 0) + 2 * (if vb > 0 then 1 else 0) + 4 * (if vc > 0 then 1 else 0);
          annotation (Diagram, Icon(
            Text(
              extent = [-80, 60; -80, 40], 
              style(color = 3, rgbcolor = {0, 0, 255}), 
              string = "a"), 
            Text(
              extent = [-80, -40; -80, -60], 
              style(color = 3, rgbcolor = {0, 0, 255}), 
              string = "b"), 
            Text(
              extent = [80, 10; 80, -10], 
              style(color = 3, rgbcolor = {0, 0, 255}), 
              string = "N")));
        end ab_N;

        block abTU_xyz
          extends Modelica.Blocks.Interfaces.BlockIcon;
          Modelica.Blocks.Interfaces.RealInput U_alpha
            annotation (extent = [-110, 50; -90, 70]);
          Modelica.Blocks.Interfaces.RealInput U_beta
            annotation (extent = [-110, 10; -90, 30]);
          Modelica.Blocks.Interfaces.RealInput T
            annotation (extent = [-110, -30; -90, -10]);
          Modelica.Blocks.Interfaces.RealInput Ux
            annotation (extent = [-110, -70; -90, -50]);
          Modelica.Blocks.Interfaces.RealOutput X
            annotation (extent = [90, 50; 110, 70]);
          Modelica.Blocks.Interfaces.RealOutput Y
            annotation (extent = [90, -10; 110, 10]);
          Modelica.Blocks.Interfaces.RealOutput Z
            annotation (extent = [90, -70; 110, -50]);
          Modelica.Blocks.Math.Gain gain(k = sqrt(3))
            annotation (extent = [-40, 70; -32, 78]);
          Modelica.Blocks.Math.Gain gain1(k = sqrt(3) / 3)
            annotation (extent = [-40, 36; -32, 44]);
          Modelica.Blocks.Math.Add add annotation (extent = [-10, 24; 10, 44]);
          Modelica.Blocks.Math.Add add1(k2 = -1) annotation (extent = [-10, -16; 10, 4]);
          Modelica.Blocks.Math.Product product annotation (extent = [20, 66; 30, 76]);
          Modelica.Blocks.Math.Division division annotation (extent = [50, 56; 58, 64]);
          Modelica.Blocks.Math.Product product1 annotation (extent = [20, 20; 30, 30]);
          Modelica.Blocks.Math.Division division1 annotation (extent = [48, -4; 56, 4]);
          Modelica.Blocks.Math.Product product2 annotation (extent = [22, -30; 32, -20]);
          Modelica.Blocks.Math.Division division2
            annotation (extent = [48, -64; 56, -56]);
          Modelica.Blocks.Math.Gain gain2(k = 1.5) annotation (extent = [66, -4; 74, 4]);
          Modelica.Blocks.Math.Gain gain3(k = 1.5)
            annotation (extent = [68, -64; 76, -56]);

          annotation (Diagram, Icon(
            Text(
              extent = [-80, 70; -80, 50], 
              style(color = 3, rgbcolor = {0, 0, 255}), 
              string = "a"), 
            Text(
              extent = [-80, 30; -80, 10], 
              style(color = 3, rgbcolor = {0, 0, 255}), 
              string = "b"), 
            Text(
              extent = [-80, -10; -80, -30], 
              style(color = 3, rgbcolor = {0, 0, 255}), 
              string = "T"), 
            Text(
              extent = [-80, -50; -80, -70], 
              style(color = 3, rgbcolor = {0, 0, 255}), 
              string = "Ux"), 
            Text(
              extent = [80, 70; 80, 50], 
              style(color = 3, rgbcolor = {0, 0, 255}), 
              string = "X"), 
            Text(
              extent = [80, 10; 80, -10], 
              style(color = 3, rgbcolor = {0, 0, 255}), 
              string = "Y"), 
            Text(
              extent = [80, -50; 80, -70], 
              style(color = 3, rgbcolor = {0, 0, 255}), 
              string = "Z")));
        equation 
          /*
        X = sqrt(3) * U_beta * T / Ux;
        Y = 0.5 * (sqrt(3) * U_beta + 3 * U_alpha) * T / Ux;
        Z = 0.5 * (sqrt(3) * U_beta - 3 * U_alpha) * T / Ux;
        */
          connect(division.y, X) annotation (points = [58.4, 60; 74, 60; 74, 60; 100, 60], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
          connect(division1.y, gain2.u) annotation (points = [56.4, 0; 65.2, 0], style(
            color = 74, 
            rgbcolor = {0, 0, 127}, 
            smooth = 0));
          connect(gain2.y, Y) annotation (points = [74.4, 0; 100, 0], style(
            color = 74, 
            rgbcolor = {0, 0, 127}, 
            smooth = 0));
          connect(division2.y, gain3.u) annotation (points = [56.4, -60; 67.2, -60], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
          connect(gain3.y, Z) annotation (points = [76.4, -60; 100, -60], style(
            color = 74, 
            rgbcolor = {0, 0, 127}, 
            smooth = 0));
          connect(division2.u2, division1.u2) annotation (points = [47.2, -62.4; 44, 
            -62.4; 44, -2.4; 47.2, -2.4], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
          connect(division.u2, division1.u2) annotation (points = [49.2, 57.6; 44, 57.6; 
            44, -2.4; 47.2, -2.4], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
          connect(product.u2, product1.u2) annotation (points = [19, 68; 16, 68; 16, 22; 
            19, 22], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
          connect(product2.u2, product1.u2) annotation (points = [21, -28; 16, -28; 16, 
            22; 19, 22], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
          connect(gain1.u, gain.u) annotation (points = [-40.8, 40; -50, 40; -50, 74; 
            -40.8, 74], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
          connect(U_beta, gain1.u) annotation (points = [-100, 20; -50, 20; -50, 40; 
            -40.8, 40], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
          connect(gain.y, product.u1) annotation (points = [-31.6, 74; 19, 74], style(
            color = 74, 
            rgbcolor = {0, 0, 127}, 
            smooth = 0));
          connect(add.y, product1.u1) annotation (points = [11, 34; 14, 34; 14, 28; 19, 
            28], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
          connect(product1.y, division1.u1) annotation (points = [30.5, 25; 30.5, 25.5; 
            47.2, 25.5; 47.2, 2.4], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
          connect(product.y, division.u1) annotation (points = [30.5, 71; 49.2, 71; 
            49.2, 62.4], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
          connect(gain1.y, add.u1) annotation (points = [-31.6, 40; -12, 40], style(
            color = 74, 
            rgbcolor = {0, 0, 127}, 
            smooth = 0));
          connect(add1.u1, add.u1) annotation (points = [-12, 0; -26, 0; -26, 40; -12, 40], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
          connect(add1.u2, add.u2) annotation (points = [-12, -12; -20, -12; -20, 28; 
            -12, 28], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
          connect(U_alpha, add.u2) annotation (points = [-100, 60; -80, 60; -80, 28; -12, 
            28], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
          connect(T, product2.u2) annotation (points = [-100, -20; -50, -20; -50, -28; 
            21, -28], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
          connect(add1.y, product2.u1) annotation (points = [11, -6; 14, -6; 14, -22; 21, 
            -22], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
          connect(Ux, division2.u2) annotation (points = [-100, -60; -28, -60; -28, 
            -62.4; 47.2, -62.4], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
          connect(product2.y, division2.u1) annotation (points = [32.5, -25; 32.5, 
            -42.5; 47.2, -42.5; 47.2, -57.6], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        end abTU_xyz;

        model NXYZ_T1T2
          extends Modelica.Blocks.Interfaces.BlockIcon;
          //  parameter Real T_PWM = 0.0001;
          Modelica.Blocks.Interfaces.IntegerInput N
            annotation (extent = [-110, -90; -90, 
              -70]);
          Modelica.Blocks.Interfaces.RealInput X annotation (extent = [-110, 70; -90, 
            90]);
          Modelica.Blocks.Interfaces.RealInput Y
            annotation (extent = [-110, 30; -90, 50]);
          Modelica.Blocks.Interfaces.RealInput Z
            annotation (extent = [-110, -10; -90, 10]);
          Modelica.Blocks.Interfaces.RealOutput T1
            annotation (extent = [90, 40; 110, 60]);
          Modelica.Blocks.Interfaces.RealOutput T2
            annotation (extent = [90, -60; 110, -40]);

          Modelica.Blocks.Interfaces.RealInput T
            annotation (extent = [-110, -50; -90, -30]);
        protected 
          Real Temp1;
          Real Temp2;
        equation 
          Temp1 = if N == 1 then Z else 
            if N == 2 then Y else 
            if N == 3 then -Z else 
            if N == 4 then -X else 
            if N == 5 then X else 
            -Y;
          Temp2 = if N == 1 then Y else 
            if N == 2 then -X else 
            if N == 3 then X else 
            if N == 4 then Z else 
            if N == 5 then -Y else 
            -Z;

          if (Temp1 + Temp2) > T then 
            T1 = Temp1 / (Temp1 + Temp2) * T;
            T2 = Temp2 / (Temp1 + Temp2) * T;
          else
            T1 = Temp1;
            T2 = Temp2;
          end if;
          annotation (Diagram, Icon(
            Text(
              extent = [-82, -70; -82, -90], 
              style(color = 3, rgbcolor = {0, 0, 255}), 
              string = "N"), 
            Text(
              extent = [-82, 90; -82, 70], 
              style(color = 3, rgbcolor = {0, 0, 255}), 
              string = "X"), 
            Text(
              extent = [-80, 46; -80, 26], 
              style(color = 3, rgbcolor = {0, 0, 255}), 
              string = "Y"), 
            Text(
              extent = [-80, 10; -80, -10], 
              style(color = 3, rgbcolor = {0, 0, 255}), 
              string = "Z"), 
            Text(
              extent = [80, 60; 80, 40], 
              style(color = 3, rgbcolor = {0, 0, 255}), 
              string = "T1"), 
            Text(
              extent = [80, -40; 80, -60], 
              style(color = 3, rgbcolor = {0, 0, 255}), 
              string = "T2"), 
            Text(
              extent = [-80, -28; -80, -48], 
              style(color = 3, rgbcolor = {0, 0, 255}), 
              string = "T")));
        end NXYZ_T1T2;

        block T1T2_Tabc
          extends Modelica.Blocks.Interfaces.BlockIcon;
          Modelica.Blocks.Interfaces.RealInput T1 annotation (extent = [-110, 40; -90, 60]);
          Modelica.Blocks.Interfaces.RealInput T
            annotation (extent = [-110, -10; -90, 10]);

          Modelica.Blocks.Interfaces.RealInput T2
            annotation (extent = [-110, -60; -90, -40]);
          Modelica.Blocks.Interfaces.RealOutput Ta
            annotation (extent = [90, 40; 110, 60]);
          Modelica.Blocks.Interfaces.RealOutput Tb
            annotation (extent = [90, -10; 110, 10]);
          Modelica.Blocks.Interfaces.RealOutput Tc
            annotation (extent = [90, -60; 110, -40]);
          Modelica.Blocks.Math.Gain gain(k = 0.5) annotation (extent = [-50, 36; -42, 44]);
          Modelica.Blocks.Math.Gain gain1(k = 0.5)
            annotation (extent = [-50, 62; -42, 70]);
          Modelica.Blocks.Math.Add3 add3_1(
            k1 = -1, 
            k2 = -1, 
            k3 = 1) annotation (extent = [-50, -20; -30, 0]);
          Modelica.Blocks.Math.Gain gain2(k = 0.25)
            annotation (extent = [-24, -14; -16, -6]);
          Modelica.Blocks.Math.Add add annotation (extent = [-10, 20; 10, 40]);
          Modelica.Blocks.Math.Add add1 annotation (extent = [20, 50; 40, 70]);
        equation 
          /*
        Ta =  (T - T1 - T2)/4;
        Tb =  (T + T1 - T2)/4;
        Tc =  (T + T1 + T2)/4;
        */
          annotation (Diagram, Icon(
            Text(
              extent = [-80, 60; -80, 40], 
              style(color = 3, rgbcolor = {0, 0, 255}), 
              string = "T1"), 
            Text(
              extent = [-80, 10; -80, -10], 
              style(color = 3, rgbcolor = {0, 0, 255}), 
              string = "T"), 
            Text(
              extent = [-80, -40; -80, -60], 
              style(color = 3, rgbcolor = {0, 0, 255}), 
              string = "T2"), 
            Text(
              extent = [80, 60; 80, 40], 
              style(color = 3, rgbcolor = {0, 0, 255}), 
              string = "Ta"), 
            Text(
              extent = [78, 10; 78, -10], 
              style(color = 3, rgbcolor = {0, 0, 255}), 
              string = "Tb"), 
            Text(
              extent = [78, -40; 78, -60], 
              style(color = 3, rgbcolor = {0, 0, 255}), 
              string = "Tc")));
          connect(T1, gain.u) annotation (points = [-100, 50; -75.4, 50; -75.4, 40; 
            -50.8, 40], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
          connect(T2, gain1.u) annotation (points = [-100, -50; -70, -50; -70, 66; -50.8, 
            66], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
          connect(add3_1.u1, gain.u) annotation (points = [-52, -2; -60, -2; -60, 40; 
            -50.8, 40], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
          connect(T, add3_1.u3) annotation (points = [-100, 0; -60, 0; -60, -18; -52, -18], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
          connect(add3_1.u2, gain1.u) annotation (points = [-52, -10; -70, -10; -70, 66; 
            -50.8, 66], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
          connect(add3_1.y, gain2.u) annotation (points = [-29, -10; -24.8, -10], style(
            color = 74, 
            rgbcolor = {0, 0, 127}, 
            smooth = 0));
          connect(gain2.y, add.u2) annotation (points = [-15.6, -10; -12, -10; -12, 24], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
          connect(gain.y, add.u1) annotation (points = [-41.6, 40; -21.8, 40; -21.8, 36; 
            -12, 36], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
          connect(gain1.y, add1.u1) annotation (points = [-41.6, 66; 18, 66], style(
            color = 74, 
            rgbcolor = {0, 0, 127}, 
            smooth = 0));
          connect(add.y, add1.u2) annotation (points = [11, 30; 14, 30; 14, 54; 18, 54], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
          connect(gain2.y, Ta) annotation (points = [-15.6, -10; 70, -10; 70, 50; 100, 50], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
          connect(add.y, Tb) annotation (points = [11, 30; 54, 30; 54, 0; 100, 0], style(
            color = 74, 
            rgbcolor = {0, 0, 127}, 
            smooth = 0));
          connect(add1.y, Tc) annotation (points = [41, 60; 66, 60; 66, -50; 100, -50], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        end T1T2_Tabc;

        block Tabc_Tcm
          extends Modelica.Blocks.Interfaces.BlockIcon;

          Modelica.Blocks.Interfaces.IntegerInput N
            annotation (extent = [-110, -70; -90, 
              -50]);
          Modelica.Blocks.Interfaces.RealInput Ta annotation (extent = [-110, 50; -90, 70]);
          Modelica.Blocks.Interfaces.RealInput Tb
            annotation (extent = [-110, 10; -90, 30]);
          Modelica.Blocks.Interfaces.RealInput Tc
            annotation (extent = [-110, -30; -90, -10]);
          Modelica.Blocks.Interfaces.RealOutput Tcm1
            annotation (extent = [90, 50; 110, 70]);
          Modelica.Blocks.Interfaces.RealOutput Tcm2
            annotation (extent = [90, -10; 110, 10]);
          Modelica.Blocks.Interfaces.RealOutput Tcm3
            annotation (extent = [90, -70; 110, -50]);
        algorithm 
          if N == 1 then 
            Tcm1 := Tb;
            Tcm2 := Ta;
            Tcm3 := Tc;
          else
            if N == 2 then 
              Tcm1 := Ta;
              Tcm2 := Tc;
              Tcm3 := Tb;
            else
              if N == 3 then 
                Tcm1 := Ta;
                Tcm2 := Tb;
                Tcm3 := Tc;
              else
                if N == 4 then 
                  Tcm1 := Tc;
                  Tcm2 := Tb;
                  Tcm3 := Ta;
                else
                  if N == 5 then 
                    Tcm1 := Tc;
                    Tcm2 := Ta;
                    Tcm3 := Tb;
                  else
                    Tcm1 := Tb;
                    Tcm2 := Tc;
                    Tcm3 := Ta;
                  end if;
                end if;
              end if;
            end if;
          end if;
          annotation (Diagram, Icon(
            Text(
              extent = [-80, -46; -80, -66], 
              style(color = 3, rgbcolor = {0, 0, 255}), 
              string = "N"), 
            Text(
              extent = [-80, 70; -80, 50], 
              style(color = 3, rgbcolor = {0, 0, 255}), 
              string = "Ta"), 
            Text(
              extent = [-80, 30; -80, 10], 
              style(color = 3, rgbcolor = {0, 0, 255}), 
              string = "Tb"), 
            Text(
              extent = [-80, -10; -80, -30], 
              style(color = 3, rgbcolor = {0, 0, 255}), 
              string = "Tc"), 
            Text(
              extent = [80, 60; 80, 40], 
              style(color = 3, rgbcolor = {0, 0, 255}), 
              string = "Tcm1"), 
            Text(
              extent = [80, 10; 80, -10], 
              style(color = 3, rgbcolor = {0, 0, 255}), 
              string = "Tcm2"), 
            Text(
              extent = [80, -40; 80, -60], 
              style(color = 3, rgbcolor = {0, 0, 255}), 
              string = "Tcm3")));
        end Tabc_Tcm;

        model PWM
          parameter Modelica.SIunits.Time T_PWM(final min = Modelica.Constants.small) = 0.0001
            "Time for one period";
          Modelica.Blocks.Interfaces.RealInput Tcm1
            annotation (extent = [-110, 50; -90, 70], preserveAspectRatio = true);
          Modelica.Blocks.Interfaces.RealInput Tcm2
            annotation (extent = [-110, -10; -90, 10], preserveAspectRatio = true);
          Modelica.Blocks.Interfaces.RealInput Tcm3
            annotation (extent = [-110, -70; -90, -50], preserveAspectRatio = true);
          Modelica.Blocks.Interfaces.BooleanOutput On[3]
            annotation (extent = [90, -10; 110, 10]);
          Modelica.Blocks.Sources.Pulse pulse(
            period = T_PWM, 
            amplitude = 2, 
            offset = -1) annotation (extent = [-80, 80; -60, 100]);
          Modelica.Blocks.Continuous.Integrator integrator
            annotation (extent = [-40, 80; -20, 100]);
          annotation (Diagram, Icon(
            Rectangle(extent = [-100, -100; 100, 100], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              fillColor = 7, 
              rgbfillColor = {255, 255, 255})), 
            Rectangle(extent = [-60, -72; 60, 68], style(rgbcolor = {0, 0, 255}, thickness = 2)), 
            Rectangle(extent = [-60, 48; 60, 68], style(rgbcolor = {0, 0, 255}, thickness = 2, rgbfillColor = {225, 225, 225}, fillPattern = 1)), 
            Text(extent = [-60, 48; 60, 68], style(rgbcolor = {0, 0, 255}, rgbfillColor = {255, 104, 32}, fillPattern = 1), 
              string = "PWM"), 
            Text(extent = [-40, -8; -8, 2], style(rgbcolor = {0, 0, 255}, thickness = 2, rgbfillColor = {255, 104, 32}, fillPattern = 1), 
              string = "sine_Input"), 
            Text(extent = [20, -34; 52, -24], style(rgbcolor = {0, 0, 255}, thickness = 2, rgbfillColor = {255, 104, 32}, fillPattern = 1), 
              string = "PWM_Out"), 
            Line(points = [-50, -46; 46, 36], style(rgbcolor = {0, 0, 255}, pattern = 1, thickness = 2))));
          Modelica.Blocks.Math.Sum sum1(nin = 2, k = {1, -1})
            annotation (extent = [0, 50; 20, 70]);
          Modelica.Blocks.Math.Sum sum2(nin = 2, k = {1, -1})
            annotation (extent = [0, -10; 20, 10]);
          Modelica.Blocks.Math.Sum sum3(nin = 2, k = {1, -1})
            annotation (extent = [0, -70; 20, -50]);
          Modelica.Blocks.Logical.Hysteresis hysteresis1(
            pre_y_start = false, 
            uLow = Modelica.Constants.eps, 
            uHigh = Modelica.Constants.eps)
            annotation (extent = [42, 50; 62, 70]);
          Modelica.Blocks.Logical.Hysteresis hysteresis2(
            pre_y_start = false, 
            uLow = Modelica.Constants.eps, 
            uHigh = Modelica.Constants.eps)
            annotation (extent = [40, -10; 60, 10]);
          Modelica.Blocks.Logical.Hysteresis hysteresis3(
            pre_y_start = false, 
            uLow = Modelica.Constants.eps, 
            uHigh = Modelica.Constants.eps)
            annotation (extent = [40, -70; 60, -50]);
        equation 
          connect(pulse.y, integrator.u) annotation (points = [-59, 90; -42, 90], style(
            color = 74, 
            rgbcolor = {0, 0, 127}, 
            smooth = 0));
          connect(Tcm1, sum1.u[2]) annotation (points = [-100, 60; -71, 60; -71, 61; -2, 
            61], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
          connect(Tcm2, sum2.u[2]) annotation (points = [-100, 0; -71, 0; -71, 1; -2, 1], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
          connect(Tcm3, sum3.u[2]) annotation (points = [-100, -60; -72, -60; -72, -59; 
            -2, -59], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
          connect(integrator.y, sum1.u[1]) annotation (points = [-19, 90; -10, 90; -10, 
            59; -2, 59], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
          connect(integrator.y, sum2.u[1]) annotation (points = [-19, 90; -10, 90; -10, 
            -1; -2, -1], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
          connect(integrator.y, sum3.u[1]) annotation (points = [-19, 90; -10, 90; -10, 
            -61; -2, -61], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
          connect(sum1.y, hysteresis1.u) annotation (points = [21, 60; 40, 60], style(
            color = 74, 
            rgbcolor = {0, 0, 127}, 
            smooth = 0));
          connect(sum2.y, hysteresis2.u) annotation (points = [21, 0; 38, 0], style(
            color = 74, 
            rgbcolor = {0, 0, 127}, 
            smooth = 0));
          connect(sum3.y, hysteresis3.u) annotation (points = [21, -60; 38, -60], style(
            color = 74, 
            rgbcolor = {0, 0, 127}, 
            smooth = 0));
          connect(hysteresis1.y, On[1]) annotation (points = [63, 60; 80, 60; 80, 
            -6.66667; 100, -6.66667], style(
              color = 5, 
              rgbcolor = {255, 0, 255}, 
              smooth = 0));
          connect(hysteresis2.y, On[2]) annotation (points = [61, 0; 78, 0; 78, 
            4.44089e-16; 100, 4.44089e-16], style(
              color = 5, 
              rgbcolor = {255, 0, 255}, 
              smooth = 0));
          connect(hysteresis3.y, On[3]) annotation (points = [61, -60; 72, -60; 72, 8; 
            100, 8; 100, 6.66667], style(
              color = 5, 
              rgbcolor = {255, 0, 255}, 
              smooth = 0));
        end PWM;

        model SVPWM
          import PMSM;

          Modelica.Blocks.Sources.Constant T(k = 0.0001)
            annotation (extent = [-170, 40; -150, 60]);
          Modelica.Blocks.Sources.Constant Ux(k = 300)
            annotation (extent = [-170, 8; -150, 28]);
          Modelica.Blocks.Interfaces.RealInput Ualpha
            annotation (extent = [-210, 90; -190, 110]);
          Modelica.Blocks.Interfaces.RealInput Ubeta
            annotation (extent = [-210, -90; -190, -70]);
          Modelica.Blocks.Interfaces.BooleanOutput pulse[3]
            annotation (extent = [190, -10; 210, 10]);
          PMSM.ControlUnits.ab_N ab_N1
            annotation (extent = [-92, -50; -72, -30]);
          PMSM.ControlUnits.abTU_xyz abTU_xyz1
            annotation (extent = [-92, -20; -72, 20]);
          PMSM.ControlUnits.NXYZ_T1T2 nXYZ_T1T2_2
            annotation (extent = [-52, -20; -12, 20]);
          PMSM.ControlUnits.PWM pWM1 annotation (extent = [120, -20; 160, 20]);
          PMSM.ControlUnits.T1T2_Tabc t1T2_Tabc1
            annotation (extent = [0, -20; 40, 20]);
          PMSM.ControlUnits.Tabc_Tcm tabc_Tcm1(
            T_PWM = 0.0001)
            annotation (extent = [62, -20; 102, 20]);
          annotation (Coordsys(extent = [-200, -200; 200, 200], scale = 0.1), Diagram, 
            Icon(
              Rectangle(extent = [-200, -200; 200, 200], style(
                color = 74, 
                rgbcolor = {0, 0, 127}, 
                fillColor = 7, 
                rgbfillColor = {255, 255, 255})), 
              Rectangle(extent = [-122, -160; 140, 60], style(rgbcolor = {0, 0, 255}, thickness = 2)), 
              Rectangle(extent = [-120, 60; 140, 120], style(rgbcolor = {0, 0, 255}, thickness = 2, rgbfillColor = {225, 225, 225}, fillPattern = 1)), 
              Text(extent = [8, 60; 8, 120], style(rgbcolor = {0, 0, 255}, rgbfillColor = {255, 104, 32}, fillPattern = 1), 
                string = "SVPWM"), 
              Text(extent = [-100, -16; -60, 20], 
                style(rgbcolor = {0, 0, 255}, thickness = 2, rgbfillColor = {255, 104, 32}, fillPattern = 1), 
                string = "sine_Input"), 
              Text(extent = [80, -120; 120, -100], style(rgbcolor = {0, 0, 255}, thickness = 2, rgbfillColor = {255, 104, 32}, fillPattern = 1), 
                string = "PWM_Out"), 
              Line(points = [-80, -120; 100, 20], style(rgbcolor = {0, 0, 255}, pattern = 1, thickness = 2))));
        equation 
          connect(ab_N1.N, nXYZ_T1T2_2.N)
            annotation (points = [-72, -40; -60, -40; -60, 
              -16; -52, -16], style(
                color = 45, 
                rgbcolor = {255, 127, 0}, 
                smooth = 0));
          connect(abTU_xyz1.Z, nXYZ_T1T2_2.Z)
            annotation (points = [-72, -12; -62, -12; 
              -62, 0; -52, 0], style(
                color = 74, 
                rgbcolor = {0, 0, 127}, 
                smooth = 0));
          connect(abTU_xyz1.Y, nXYZ_T1T2_2.Y)
            annotation (points = [-72, 0; -62, 0; -62, 8; 
              -52, 8], style(
                color = 74, 
                rgbcolor = {0, 0, 127}, 
                smooth = 0));
          connect(abTU_xyz1.X, nXYZ_T1T2_2.X)
            annotation (points = [-72, 12; -62, 12; -62, 
              16; -52, 16], 
              style(
                color = 74, 
                rgbcolor = {0, 0, 127}, 
                smooth = 0));
          connect(t1T2_Tabc1.Ta, tabc_Tcm1.Ta)
            annotation (points = [40, 10; 52, 10; 52, 12; 
              62, 12], style(
                color = 74, 
                rgbcolor = {0, 0, 127}, 
                smooth = 0));
          connect(t1T2_Tabc1.Tb, tabc_Tcm1.Tb)
            annotation (points = [40, 0; 52, 0; 52, 4; 62, 
              4], style(
                color = 74, 
                rgbcolor = {0, 0, 127}, 
                smooth = 0));
          connect(t1T2_Tabc1.Tc, tabc_Tcm1.Tc)
            annotation (points = [40, -10; 52, -10; 52, 
              -4; 62, -4], 
              style(
                color = 74, 
                rgbcolor = {0, 0, 127}, 
                smooth = 0));
          connect(tabc_Tcm1.Tcm1, pWM1.Tcm1) annotation (points = [102, 12; 120, 12], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
          connect(tabc_Tcm1.Tcm2, pWM1.Tcm2) annotation (points = [102, 0; 120, 0], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
          connect(tabc_Tcm1.Tcm3, pWM1.Tcm3) annotation (points = [102, -12; 120, -12], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
          connect(ab_N1.N, tabc_Tcm1.N) annotation (points = [-72, -40; 54, -40; 54, -12; 
            62, -12], style(
              color = 45, 
              rgbcolor = {255, 127, 0}, 
              smooth = 0));
          connect(nXYZ_T1T2_2.T1, t1T2_Tabc1.T1) annotation (points = [-12, 10; 0, 10], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
          connect(nXYZ_T1T2_2.T2, t1T2_Tabc1.T2) annotation (points = [-12, -10; 0, -10], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
          connect(pWM1.On, pulse) annotation (points = [160, 0; 200, 0], style(
            color = 5, 
            rgbcolor = {255, 0, 255}, 
            smooth = 0));
          connect(T.y, abTU_xyz1.T) annotation (points = [-149, 50; -120, 50; -120, -4; 
            -92, -4], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
          connect(Ux.y, abTU_xyz1.Ux) annotation (points = [-149, 18; -140, 18; -140, 
            -12; -92, -12], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
          connect(T.y, nXYZ_T1T2_2.T) annotation (points = [-149, 50; -58, 50; -58, -8; 
            -52, -8], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
          connect(T.y, t1T2_Tabc1.T) annotation (points = [-149, 50; -6, 50; -6, 0; 0, 0], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
          connect(Ualpha, abTU_xyz1.U_alpha) annotation (points = [-200, 100; -108, 100; 
            -108, 12; -92, 12], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
          connect(Ubeta, abTU_xyz1.U_beta) annotation (points = [-200, -80; -100, -80; 
            -100, 4; -92, 4], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
          connect(ab_N1.U_beta, abTU_xyz1.U_beta) annotation (points = [-92, -45; -100, 
            -45; -100, 4; -92, 4], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
          connect(ab_N1.U_alpha, abTU_xyz1.U_alpha) annotation (points = [-92, -35; 
            -108, -35; -108, 12; -92, 12], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        end SVPWM;

        block PulseGenerator
          extends Modelica.Blocks.Interfaces.BlockIcon;

          parameter Modelica.SIunits.Time T_PWM(final min = Modelica.Constants.small) = 0.0001
            "Time for one period";

          Modelica.Blocks.Interfaces.RealInput Tcm1
            annotation (extent = [-110, 50; -90, 70], preserveAspectRatio = true);
          Modelica.Blocks.Interfaces.RealInput Tcm2
            annotation (extent = [-110, -10; -90, 10], preserveAspectRatio = true);
          Modelica.Blocks.Interfaces.RealInput Tcm3
            annotation (extent = [-110, -70; -90, -50], preserveAspectRatio = true);

          Modelica.Blocks.Interfaces.BooleanOutput On[3]
            annotation (extent = [90, -10; 110, 10]);
        protected 
          Modelica.SIunits.Time T0;
          Modelica.SIunits.Time T_width[3];
        equation 
          when sample(0, T_PWM) then 
            T0 = time;
            T_width[1] = pre(Tcm1);
            T_width[2] = pre(Tcm2);
            T_width[3] = pre(Tcm3);
          end when;
          for i in 1:3 loop 
            On[i] = time < T0 + T_width[i];
          end for;
          annotation (Icon(
            Rectangle(extent = [-60, -72; 60, 68], style(rgbcolor = {0, 0, 255}, thickness = 2)), 
            Rectangle(extent = [-60, 48; 60, 68], style(rgbcolor = {0, 0, 255}, thickness = 2, rgbfillColor = {225, 225, 225}, fillPattern = 1)), 
            Text(extent = [-60, 48; 60, 68], style(rgbcolor = {0, 0, 255}, rgbfillColor = {255, 104, 32}, fillPattern = 1), 
              string = "PWM"), 
            Text(extent = [-40, -8; -8, 2], style(rgbcolor = {0, 0, 255}, thickness = 2, rgbfillColor = {255, 104, 32}, fillPattern = 1), 
              string = "sine_Input"), 
            Text(extent = [20, -34; 52, -24], style(rgbcolor = {0, 0, 255}, thickness = 2, rgbfillColor = {255, 104, 32}, fillPattern = 1), 
              string = "PWM_Out"), 
            Line(points = [-50, -46; 46, 36], style(rgbcolor = {0, 0, 255}, pattern = 1, thickness = 2))), 
            Diagram);
        end PulseGenerator;

        model sub1

          Modelica.Blocks.Interfaces.RealOutput Tcm1
            annotation (extent = [90, 50; 110, 70]);
          Modelica.Blocks.Interfaces.RealOutput Tcm2
            annotation (extent = [90, -10; 110, 10]);
          Modelica.Blocks.Interfaces.RealOutput Tcm3
            annotation (extent = [90, -70; 110, -50]);
          Modelica.Blocks.Interfaces.RealInput T1
            annotation (extent = [-110, 20; -90, 40]);
          Modelica.Blocks.Interfaces.RealInput T2
            annotation (extent = [-110, -30; -90, -10]);
          Modelica.Blocks.Interfaces.RealInput T
            annotation (extent = [-110, -80; -90, -60]);
          Modelica.Blocks.Interfaces.IntegerInput N
            annotation (extent = [-110, 70; -90, 90]);
          annotation (Diagram, Icon(
            Rectangle(extent = [-100, -100; 100, 100], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              fillColor = 7, 
              rgbfillColor = {255, 255, 255})), 
            Rectangle(extent = [-60, -72; 60, 68], style(rgbcolor = {0, 0, 255}, thickness = 2)), 
            Rectangle(extent = [-60, 48; 60, 68], style(rgbcolor = {0, 0, 255}, thickness = 2, rgbfillColor = {225, 225, 225}, fillPattern = 1)), 
            Text(extent = [-60, 48; 60, 68], style(rgbcolor = {0, 0, 255}, rgbfillColor = {255, 104, 32}, fillPattern = 1), 
              string = "SubSystem"), 
            Text(extent = [-40, -8; -8, 2], style(rgbcolor = {0, 0, 255}, thickness = 2, rgbfillColor = {255, 104, 32}, fillPattern = 1), 
              string = "sine_Input"), 
            Text(extent = [20, -34; 52, -24], style(rgbcolor = {0, 0, 255}, thickness = 2, rgbfillColor = {255, 104, 32}, fillPattern = 1), 
              string = "PWM_Out"), 
            Line(points = [-50, -46; 46, 36], style(rgbcolor = {0, 0, 255}, pattern = 1, thickness = 2))));
          Modelica.Blocks.Math.Gain gain(k = 0.5) annotation (extent = [-60, 26; -52, 34]);
          Modelica.Blocks.Sources.Sine sine(freqHz = 50, amplitude = 310)
            annotation (extent = [-230, -10; -210, 10]);
          Modelica.Blocks.Sources.Sine sine1(
            freqHz = 50, 
            amplitude = 310, 
            phase = 2.0943951023932) annotation (extent = [-230, -30; -210, -10]);
          Modelica.Blocks.Math.Gain gain1(k = 0.5)
            annotation (extent = [-60, 52; -52, 60]);
          Modelica.Blocks.Math.Add3 add3_1(
            k1 = -1, 
            k2 = -1, 
            k3 = +1) annotation (extent = [-60, -30; -40, -10]);
          Modelica.Blocks.Math.Gain gain2(k = 0.25)
            annotation (extent = [-34, -24; -26, -16]);
          Modelica.Blocks.Math.Add add annotation (extent = [-20, 10; 0, 30]);
          Modelica.Blocks.Math.Add add1 annotation (extent = [10, 40; 30, 60]);
          Tabc_Tcm tabc_Tcm annotation (extent = [50, -50; 80, 50]);
        equation 
          connect(T1, gain.u) annotation (points = [-100, 30; -60.8, 30], style(
            color = 74, 
            rgbcolor = {0, 0, 127}, 
            smooth = 0));
          connect(T2, gain1.u) annotation (points = [-100, -20; -80, -20; -80, 56; -60.8, 
            56], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
          connect(add3_1.u1, gain.u) annotation (points = [-62, -12; -70, -12; -70, 30; 
            -60.8, 30], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
          connect(T, add3_1.u3) annotation (points = [-100, -70; -70, -70; -70, -28; -62, 
            -28], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
          connect(add3_1.u2, gain1.u) annotation (points = [-62, -20; -80, -20; -80, 56; 
            -60.8, 56], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
          connect(add3_1.y, gain2.u) annotation (points = [-39, -20; -34.8, -20], style(
            color = 74, 
            rgbcolor = {0, 0, 127}, 
            smooth = 0));
          connect(gain2.y, add.u2) annotation (points = [-25.6, -20; -22, -20; -22, 14], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
          connect(gain.y, add.u1) annotation (points = [-51.6, 30; -31.8, 30; -31.8, 26; 
            -22, 26], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
          connect(gain1.y, add1.u1) annotation (points = [-51.6, 56; 8, 56], style(
            color = 74, 
            rgbcolor = {0, 0, 127}, 
            smooth = 0));
          connect(add.y, add1.u2) annotation (points = [1, 20; 4, 20; 4, 44; 8, 44], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
          connect(tabc_Tcm.Tcm2, Tcm2) annotation (points = [80, 0; 100, 0], style(
            color = 74, 
            rgbcolor = {0, 0, 127}, 
            smooth = 0));
          connect(tabc_Tcm.Tcm1, Tcm1) annotation (points = [80, 30; 88, 30; 88, 60; 100, 
            60], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
          connect(tabc_Tcm.Tcm3, Tcm3) annotation (points = [80, -30; 86, -30; 86, -60; 
            100, -60], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
          connect(N, tabc_Tcm.N) annotation (points = [-100, 80; 34, 80; 34, -30; 50, -30], 
            style(
              color = 45, 
              rgbcolor = {255, 127, 0}, 
              smooth = 0));
          connect(gain2.y, tabc_Tcm.Ta) annotation (points = [-25.6, -20; 40, -20; 40, 
            30; 50, 30], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
          connect(add.y, tabc_Tcm.Tb) annotation (points = [1, 20; 26, 20; 26, 10; 50, 10], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
          connect(add1.y, tabc_Tcm.Tc) annotation (points = [31, 50; 36, 50; 36, -10; 50, 
            -10], style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        end sub1;

        model Vol

          Modelica.Blocks.Interfaces.RealInput U
            annotation (extent = [-110, -70; -90, -50]);
          Modelica.Blocks.Interfaces.BooleanInput y
            annotation (extent = [-110, 50; -90, 70]);
          Modelica.Electrical.Analog.Interfaces.PositivePin pin_p
            annotation (extent = [90, 30; 110, 50], preserveAspectRatio = true);
          Modelica.Electrical.Analog.Interfaces.NegativePin pin_n
            annotation (extent = [90, -50; 110, -30], preserveAspectRatio = true);
        equation 
          pin_p.v - pin_n.v = if y then U else 0;
          pin_n.i + pin_p.i = 0;

          annotation (Diagram);
        end Vol;

        model Clark

          Modelica.Blocks.Interfaces.RealInput i_a
            annotation (extent = [-110, 50; -90, 70], preserveAspectRatio = true);
          Modelica.Blocks.Interfaces.RealInput i_b
            annotation (extent = [-110, -10; -90, 10], preserveAspectRatio = true);
          Modelica.Blocks.Interfaces.RealInput i_c
            annotation (extent = [-110, -70; -90, -50], preserveAspectRatio = true);
          Modelica.Blocks.Interfaces.RealOutput i_alpha
            annotation (extent = [80, 40; 100, 60], preserveAspectRatio = true);
          Modelica.Blocks.Interfaces.RealOutput i_beta
            annotation (extent = [80, -60; 100, -40], preserveAspectRatio = true);
        equation 
          i_alpha = sqrt(0.666666666666667) * (i_a - 0.5 * i_b - 0.5 * i_c);
          i_beta = sqrt(0.5) * (i_b - i_c);
          annotation (Icon(
            Rectangle(extent = [-60, -80; 60, 80], style(rgbcolor = {0, 0, 255}, thickness = 2)), 
            Rectangle(extent = [-60, 60; 60, 80], style(rgbcolor = {0, 0, 255}, thickness = 2, rgbfillColor = {0, 0, 255}, gradient = 3)), 
            Line(points = [-80, 60; -60, 60], style(rgbcolor = {0, 0, 255}, thickness = 2, arrow = 0)), 
            Line(points = [-78, 0; -60, 0], style(rgbcolor = {0, 0, 255}, thickness = 2, arrow = 0)), 
            Line(points = [-80, -60; -62, -60], style(rgbcolor = {0, 0, 255}, thickness = 2, arrow = 0)), 
            Line(points = [60, -50; 84, -50], style(rgbcolor = {0, 0, 255}, thickness = 2, arrow = 0)), 
            Line(points = [60, 50; 84, 50], style(rgbcolor = {0, 0, 255}, thickness = 2, arrow = 0)), 
            Text(extent = [-54, 12; 54, 42], style(rgbcolor = {0, 0, 255}, gradient = 3), string = "(a b c)"), 
            Text(extent = [-28, -42; 28, -12], style(rgbcolor = {0, 0, 255}, gradient = 3), string = "(α β)"), 
            Text(extent = [-60, 60; 60, 80], style(rgbcolor = {255, 104, 32}), string = "Clark"), 
            Text(extent = [-94, 60; -64, 76], style(rgbcolor = {0, 0, 255}, thickness = 2, rgbfillColor = {225, 225, 225}, fillPattern = 1), 
              string = "ia"), 
            Text(extent = [-94, 0; -64, 16], style(rgbcolor = {0, 0, 255}, thickness = 2, rgbfillColor = {225, 225, 225}, fillPattern = 1), 
              string = "ib"), 
            Text(extent = [-92, -60; -62, -44], style(rgbcolor = {0, 0, 255}, thickness = 2, rgbfillColor = {225, 225, 225}, fillPattern = 1), 
              string = "ic"), 
            Text(extent = [56, 48; 86, 64], style(rgbcolor = {0, 0, 255}, thickness = 2, rgbfillColor = {225, 225, 225}, fillPattern = 1), 
              string = "iα"), 
            Text(extent = [56, -44; 86, -28], style(rgbcolor = {0, 0, 255}, thickness = 2, rgbfillColor = {225, 225, 225}, fillPattern = 1), 
              string = "iβ"), 
            Polygon(points = [-110, -50; -110, -70; -90, -60; -110, -50], style(
              color = 3, 
              rgbcolor = {0, 0, 255}, 
              pattern = 2, 
              smooth = 0))), Diagram);
        end Clark;

        //  parameter 
        model Park

          annotation (Icon(
            Rectangle(extent = [-60, -80; 60, 80], style(rgbcolor = {0, 0, 255}, thickness = 2)), 
            Rectangle(extent = [-60, 60; 60, 80], style(rgbcolor = {0, 0, 255}, thickness = 2, rgbfillColor = {0, 0, 255}, gradient = 3)), 
            Line(points = [-80, 60; -60, 60], style(rgbcolor = {0, 0, 255}, thickness = 2, arrow = 0)), 
            Line(points = [-78, 0; -60, 0], style(rgbcolor = {0, 0, 255}, thickness = 2, arrow = 0)), 
            Line(points = [-78, -60; -60, -60], style(rgbcolor = {0, 0, 255}, thickness = 2, arrow = 0)), 
            Line(points = [60, -50; 84, -50], style(rgbcolor = {0, 0, 255}, thickness = 2, arrow = 0)), 
            Line(points = [60, 50; 84, 50], style(rgbcolor = {0, 0, 255}, thickness = 2, arrow = 0)), 
            Text(extent = [-54, 12; 54, 42], style(rgbcolor = {0, 0, 255}, gradient = 3), string = "(α β θ)"), 
            Text(extent = [-28, -42; 28, -12], style(rgbcolor = {0, 0, 255}, gradient = 3), string = "(d q)"), 
            Text(extent = [-60, 60; 60, 80], style(rgbcolor = {255, 104, 32}), string = "Park"), 
            Text(extent = [-94, 58; -64, 74], style(rgbcolor = {0, 0, 255}, thickness = 2, rgbfillColor = {225, 225, 225}, fillPattern = 1), 
              string = "θ"), 
            Text(extent = [-94, 0; -64, 16], style(rgbcolor = {0, 0, 255}, thickness = 2, rgbfillColor = {225, 225, 225}, fillPattern = 1), 
              string = "iα"), 
            Text(extent = [-92, -60; -62, -44], style(rgbcolor = {0, 0, 255}, thickness = 2, rgbfillColor = {225, 225, 225}, fillPattern = 1), 
              string = "iβ"), 
            Text(extent = [56, -52; 86, -36], style(rgbcolor = {0, 0, 255}, thickness = 2, rgbfillColor = {225, 225, 225}, fillPattern = 1), 
              string = "id"), 
            Text(extent = [54, 50; 84, 66], style(rgbcolor = {0, 0, 255}, thickness = 2, rgbfillColor = {225, 225, 225}, fillPattern = 1), 
              string = "iq")), Diagram);
          Modelica.Blocks.Interfaces.RealInput theta
            annotation (extent = [-110, 50; -90, 70], preserveAspectRatio = true);
          Modelica.Blocks.Interfaces.RealInput i_alpha
            annotation (extent = [-110, -10; -90, 10], preserveAspectRatio = true);
          Modelica.Blocks.Interfaces.RealInput i_beta
            annotation (extent = [-110, -70; -90, -50], preserveAspectRatio = true);
          Modelica.Blocks.Interfaces.RealOutput i_d
            annotation (extent = [80, -60; 100, -40], preserveAspectRatio = true);
          Modelica.Blocks.Interfaces.RealOutput i_q
            annotation (extent = [80, 40; 100, 60], preserveAspectRatio = true);
        equation 
          i_d = i_alpha * cos(theta) + i_beta * sin(theta);
          i_q = -i_alpha * sin(theta) + i_beta * cos(theta);
        end Park;

        model SPWM
          parameter Real f = 10000.0;
          parameter Real v = 270;
          parameter Real amplitude = 380 "Amplitude of pulse";
          final parameter Modelica.SIunits.Time period(final min = Modelica.Constants.small) = 1 / f
            "Time for one period";
          // parameter Real offset = 0 "Offset of output signals";
          Modelica.Electrical.Analog.Interfaces.PositivePin pin_p1
            annotation (extent = [78, 24; 98, 44], preserveAspectRatio = true);
          Modelica.Electrical.Analog.Interfaces.NegativePin pin_n1
            annotation (extent = [78, -56; 98, -36], preserveAspectRatio = true);
          Modelica.SIunits.Time T0(
            final start = 0) "Start time of current period";
          Modelica.SIunits.Time T_width;
          Real width;
          Real vv;
          Modelica.Blocks.Interfaces.RealInput u
            annotation (extent = [-102, 24; -66, 52], preserveAspectRatio = true);
          annotation (Icon(
            Rectangle(extent = [-60, -72; 60, 68], style(rgbcolor = {0, 0, 255}, thickness = 2)), 
            Rectangle(extent = [-60, 48; 60, 68], style(rgbcolor = {0, 0, 255}, thickness = 2, rgbfillColor = {225, 225, 225}, fillPattern = 1)), 
            Line(points = [-80, 38; -60, 38], style(rgbcolor = {0, 0, 255}, thickness = 2, arrow = 0)), 
            Line(points = [60, -46; 78, -46], style(rgbcolor = {0, 0, 255}, thickness = 2, arrow = 0)), 
            Line(points = [60, 34; 78, 34], style(rgbcolor = {0, 0, 255}, thickness = 2, arrow = 0)), 
            Text(extent = [-62, 48; 58, 68], style(rgbcolor = {0, 0, 255}, rgbfillColor = {255, 104, 32}, fillPattern = 1), string = "SPWM"), 
            Bitmap(extent = [-34, -70; 70, -24], name = "..\\..\\WorkingPlatform\\29.北京31所\\jpg图片\\pulse1.jpg"), 
            Bitmap(extent = [-75, -2; 36, 43], name = "..\\..\\WorkingPlatform\\29.北京31所\\jpg图片\\sine1.jpg"), 
            Text(extent = [-40, -8; -8, 2], style(rgbcolor = {0, 0, 255}, thickness = 2, rgbfillColor = {255, 104, 32}, fillPattern = 1), 
              string = "sine_Input"), 
            Text(extent = [20, -34; 52, -24], style(rgbcolor = {0, 0, 255}, thickness = 2, rgbfillColor = {255, 104, 32}, fillPattern = 1), 
              string = "PWM_Out"), 
            Line(points = [-50, -46; 46, 36], style(rgbcolor = {0, 0, 255}, pattern = 1, thickness = 2))));
        equation 
          when sample(0, period) then 
            T0 = time;
            width = abs(u / 380);
          end when;
          T_width = period * width;
          vv = if u > 0 then v else -v;
          pin_p1.v - pin_n1.v = if time >= T0 + T_width then 0 else vv;
          pin_n1.i + pin_p1.i = 0;
        end SPWM;

        model rPark

          annotation (Icon(
            Rectangle(extent = [-60, -60; 60, 80], style(rgbcolor = {0, 0, 255}, thickness = 2)), 
            Rectangle(extent = [-60, 60; 60, 80], style(rgbcolor = {0, 0, 255}, thickness = 2, rgbfillColor = {0, 0, 255}, gradient = 3)), 
            Line(points = [-80, 50; -60, 50], style(rgbcolor = {0, 0, 255}, thickness = 2, arrow = 0)), 
            Line(points = [-80, 0; -60, 0], style(rgbcolor = {0, 0, 255}, thickness = 2, arrow = 0)), 
            Line(points = [-80, -50; -60, -50], style(rgbcolor = {0, 0, 255}, thickness = 2, arrow = 0)), 
            Line(points = [60, -50; 84, -50], style(rgbcolor = {0, 0, 255}, thickness = 2, arrow = 0)), 
            Line(points = [60, 46; 84, 46], style(rgbcolor = {0, 0, 255}, thickness = 2, arrow = 0)), 
            Text(extent = [-54, 12; 54, 42], style(rgbcolor = {0, 0, 255}, gradient = 3), string = "(d q θ)"), 
            Text(extent = [-28, -42; 28, -12], style(rgbcolor = {0, 0, 255}, gradient = 3), string = "(α β )"), 
            Text(extent = [-60, 60; 60, 80], style(rgbcolor = {255, 104, 32}), string = "rPark"), 
            Text(extent = [-94, 58; -64, 74], style(rgbcolor = {0, 0, 255}, thickness = 2, rgbfillColor = {225, 225, 225}, fillPattern = 1), 
              string = "θ"), 
            Text(extent = [-94, 2; -64, 18], style(rgbcolor = {0, 0, 255}, thickness = 2, rgbfillColor = {225, 225, 225}, fillPattern = 1), 
              string = "Vd"), 
            Text(extent = [-92, -48; -62, -32], style(rgbcolor = {0, 0, 255}, thickness = 2, rgbfillColor = {225, 225, 225}, fillPattern = 1), 
              string = "Vq"), 
            Text(extent = [56, 48; 86, 64], style(rgbcolor = {0, 0, 255}, thickness = 2, rgbfillColor = {225, 225, 225}, fillPattern = 1), 
              string = "Vα"), 
            Text(extent = [56, -48; 86, -32], style(rgbcolor = {0, 0, 255}, thickness = 2, rgbfillColor = {225, 225, 225}, fillPattern = 1), 
              string = "Vβ")), Diagram);
          Modelica.Blocks.Interfaces.RealInput theta
            annotation (extent = [-100, 40; -80, 60], preserveAspectRatio = true);
          Modelica.Blocks.Interfaces.RealInput V_d
            annotation (extent = [-100, -10; -80, 10], preserveAspectRatio = true);
          Modelica.Blocks.Interfaces.RealInput V_q
            annotation (extent = [-100, -60; -80, -40], preserveAspectRatio = true);
          Modelica.Blocks.Interfaces.RealOutput V_alpha
            annotation (extent = [80, 40; 100, 60], preserveAspectRatio = true);
          Modelica.Blocks.Interfaces.RealOutput V_beta
            annotation (extent = [80, -60; 100, -40], preserveAspectRatio = true);
        equation 
          V_alpha = V_d * cos(theta) - V_q * sin(theta);
          V_beta = V_d * sin(theta) + V_q * cos(theta);
        end rPark;

        model rClark

          annotation (Icon(
            Rectangle(extent = [-60, -60; 60, 80], style(rgbcolor = {0, 0, 255}, thickness = 2)), 
            Rectangle(extent = [-60, 60; 60, 80], style(rgbcolor = {0, 0, 255}, thickness = 2, rgbfillColor = {0, 0, 255}, gradient = 3)), 
            Line(points = [-80, 44; -60, 44], style(rgbcolor = {0, 0, 255}, thickness = 2, arrow = 0)), 
            Line(points = [-78, -36; -60, -36], style(rgbcolor = {0, 0, 255}, thickness = 2, arrow = 0)), 
            Line(points = [60, -40; 84, -40], style(rgbcolor = {0, 0, 255}, thickness = 2, arrow = 0)), 
            Line(points = [60, 46; 84, 46], style(rgbcolor = {0, 0, 255}, thickness = 2, arrow = 0)), 
            Text(extent = [-54, 12; 54, 42], style(rgbcolor = {0, 0, 255}, gradient = 3), string = "(α β )"), 
            Text(extent = [-40, -46; 44, -10], style(rgbcolor = {0, 0, 255}, gradient = 3), string = "(a b c)"), 
            Text(extent = [-60, 60; 60, 80], style(rgbcolor = {255, 104, 32}), string = "rClark"), 
            Text(extent = [56, 6; 86, 22], style(rgbcolor = {0, 0, 255}, thickness = 2, rgbfillColor = {225, 225, 225}, fillPattern = 1), 
              string = "vb"), 
            Text(extent = [56, 50; 86, 66], style(rgbcolor = {0, 0, 255}, thickness = 2, rgbfillColor = {225, 225, 225}, fillPattern = 1), 
              string = "va"), 
            Text(extent = [-90, 50; -60, 66], style(rgbcolor = {0, 0, 255}, thickness = 2, rgbfillColor = {225, 225, 225}, fillPattern = 1), 
              string = "Vα"), 
            Text(extent = [-90, -30; -60, -14], style(rgbcolor = {0, 0, 255}, thickness = 2, rgbfillColor = {225, 225, 225}, fillPattern = 1), 
              string = "Vβ"), 
            Line(points = [60, 4; 84, 4], style(rgbcolor = {0, 0, 255}, thickness = 2, arrow = 0)), 
            Text(extent = [56, -36; 86, -20], style(rgbcolor = {0, 0, 255}, thickness = 2, rgbfillColor = {225, 225, 225}, fillPattern = 1), 
              string = "vc")));
          Modelica.Blocks.Interfaces.RealInput V_alpha
            annotation (extent = [-100, 30; -78, 58], preserveAspectRatio = true);
          Modelica.Blocks.Interfaces.RealInput V_beta
            annotation (extent = [-100, -48; -76, -24], preserveAspectRatio = true);
          Modelica.Blocks.Interfaces.RealOutput v_a
            annotation (extent = [80, 36; 100, 56], preserveAspectRatio = true);
          Modelica.Blocks.Interfaces.RealOutput v_b
            annotation (extent = [80, -6; 100, 14], preserveAspectRatio = true);
          Modelica.Blocks.Interfaces.RealOutput v_c
            annotation (extent = [80, -50; 100, -30], preserveAspectRatio = true);
        equation 
          v_a = V_beta;
          v_b = (-V_beta + V_alpha * sqrt(3)) / 2;
          v_c = (-V_beta - V_alpha * sqrt(3)) / 2;
        end rClark;

        model U_dq

          Modelica.Blocks.Interfaces.RealInput w
            annotation (extent = [-102, -54; -70, -34], preserveAspectRatio = true);
          Modelica.Blocks.Interfaces.RealInput i_d
            annotation (extent = [-98, 32; -78, 52], preserveAspectRatio = true);
          Modelica.Blocks.Interfaces.RealInput i_q
            annotation (extent = [-98, -12; -76, 8], preserveAspectRatio = true);
          Modelica.Blocks.Interfaces.RealOutput v_d
            annotation (extent = [80, 10; 100, 30], preserveAspectRatio = true);
          Modelica.Blocks.Interfaces.RealOutput v_q
            annotation (extent = [80, -50; 100, -30], preserveAspectRatio = true);
          annotation (Icon(
            Rectangle(extent = [-60, -68; 60, 72], style(rgbcolor = {0, 0, 255}, thickness = 2)), 
            Rectangle(extent = [-60, 52; 60, 72], style(rgbcolor = {0, 0, 255}, thickness = 2, rgbfillColor = {0, 0, 255}, gradient = 3)), 
            Line(points = [-80, 42; -60, 42], style(rgbcolor = {0, 0, 255}, thickness = 2, arrow = 0)), 
            Line(points = [-78, -2; -60, -2], style(rgbcolor = {0, 0, 255}, thickness = 2, arrow = 0)), 
            Line(points = [-78, -44; -60, -44], style(rgbcolor = {0, 0, 255}, thickness = 2, arrow = 0)), 
            Text(extent = [-54, 4; 54, 34], style(rgbcolor = {0, 0, 255}, gradient = 3), string = "(id iq w)"), 
            Text(extent = [-28, -50; 28, -20], style(rgbcolor = {0, 0, 255}, gradient = 3), string = "(vd vq )"), 
            Text(extent = [-60, 52; 60, 72], style(rgbcolor = {255, 104, 32}), string = "U_dq"), 
            Text(extent = [-88, -42; -58, -26], style(rgbcolor = {0, 0, 255}, thickness = 2, rgbfillColor = {225, 225, 225}, fillPattern = 1), 
              string = "w"), 
            Text(extent = [-88, 42; -58, 58], style(rgbcolor = {0, 0, 255}, thickness = 2, rgbfillColor = {225, 225, 225}, fillPattern = 1), 
              string = "id"), 
            Text(extent = [-88, 2; -58, 18], style(rgbcolor = {0, 0, 255}, thickness = 2, rgbfillColor = {225, 225, 225}, fillPattern = 1), 
              string = "iq"), 
            Text(extent = [56, 18; 86, 34], style(rgbcolor = {0, 0, 255}, thickness = 2, rgbfillColor = {225, 225, 225}, fillPattern = 1), 
              string = "Vd"), 
            Text(extent = [56, -32; 86, -16], style(rgbcolor = {0, 0, 255}, thickness = 2, rgbfillColor = {225, 225, 225}, fillPattern = 1), 
              string = "Vq"), 
            Line(points = [60, 20; 80, 20], style(rgbcolor = {0, 0, 255}, thickness = 2, arrow = 0)), 
            Line(points = [60, -40; 80, -40], style(rgbcolor = {0, 0, 255}, thickness = 2, arrow = 0))));
        end U_dq;

      end Components;

      package Interfaces
        extends MachineToolDynamic.ControlBlocks.Drivers.Icons.FolderBlue;
        partial model LoadThreePhase "Base model of a three phase load plug"

          annotation (Coordsys(grid = [1, 1], scale = 0), Documentation(info = "<html><p>Contains the basic connectors for the converter three phase load side.</p></html>", revisions = "<html><table border=\"1\" rules=\"groups\"><thead><tr><td>Version</td>  <td>Date</td>  <td>Comment</td></tr></thead><tbody><tr><td>1.0.0</td>  <td>2006-02-20</td>  <td> </td></tr></tbody></table></html>"));

          Modelica.Electrical.MultiPhase.Interfaces.PositivePlug pLoad
            "Plug of the load circuit" 
            annotation (extent = [-10, -110; 10, -90]);

          Modelica.SIunits.Current iLoad[3] "Current of the load plug";
          Modelica.SIunits.Voltage vLoad[3] "Voltage of the load plug";
          Modelica.SIunits.Power powerLoad "Power of the load plug";
        equation 
          iLoad = pLoad.pin.i;
          vLoad = pLoad.pin.v;
          powerLoad = vLoad * iLoad;

        end LoadThreePhase;

        partial model SupplyDC "Base model of the converter DC-supply port"

          Modelica.Electrical.Analog.Interfaces.PositivePin pSupply(final v(start = 0))
            "Positive pin of the supply circuit" 
            annotation (extent = [-110, 50; -90, 70]);
          Modelica.Electrical.Analog.Interfaces.NegativePin nSupply(final v(start = 0))
            "Negative pin of the supply circuit" 
            annotation (extent = [-110, -70; -90, -50]);

          parameter Modelica.SIunits.Current IConverterMax(min = 0)
            "Maximum admissible converter DC supply current" 
            annotation (Dialog(tab = "Reference values and limits"));

          Modelica.SIunits.Voltage vSupply "Voltage of the supply port";
          Modelica.SIunits.Current iSupply "Current of the supply port";
          Modelica.SIunits.Power powerSupply "Power of the supply port";
        equation 
          vSupply = pSupply.v - nSupply.v;
          iSupply = pSupply.i;
          powerSupply = iSupply * vSupply;
          assert(iSupply <= IConverterMax, "Converter current exceeded maximum admissible current of the supply port (IConverterMax = " + String(IConverterMax) + "A)");
          assert(vSupply >= 0, "The voltage of the supply port must be greater than zero! (vSupply = " + String(vSupply) + "V)");

          annotation (Coordsys(grid = [1, 1], scale = 0), Documentation(info = "<html><p>Contains the basic connectors, parameters and asserts for the converter DC supply side.</p></html>", revisions = "<html><table border=\"1\" rules=\"groups\"><thead><tr><td>Version</td>  <td>Date</td>  <td>Comment</td></tr></thead><tbody><tr><td>1.0.0</td>  <td>2006-02-20</td>  <td> </td></tr><tr><td>1.0.3</td>  <td>2006-03-29</td>  <td> Redefined some start values </td></tr><tr><td>     </td>  <td>2006-05-02</td>  <td> Changed vSupply &gt; 0 to vSupply &gt;= 0 </td></tr><tr><td>     </td>  <td>2006-08-31</td>  <td> Improved assert statements </td></tr></tbody></table></html>"), Diagram(
            Line(points = [-100, 40; -100, -40], style(color = 0, rgbcolor = {0, 0, 0})), 
            Polygon(points = [-100, -41; -102, -33; -98, -33; -100, -41], style(
              color = 0, 
              rgbcolor = {0, 0, 0}, 
              fillColor = 0, 
              rgbfillColor = {0, 0, 0})), 
            Text(
              extent = [-96, 10; -76, 0], 
              style(
                color = 0, 
                rgbcolor = {0, 0, 0}, 
                fillColor = 0, 
                rgbfillColor = {0, 0, 0}, 
                fillPattern = 1), 
              string = "vSupply")));
        end SupplyDC;

        partial block SO "Single Output continuous control block"
          // extends BlockIcon;

          Modelica.Blocks.Interfaces.RealOutput y
            "Connector of Real output signal" 
            annotation (extent = [100, -10; 120, 10]);
          annotation (
            Coordsys(
              extent = [-100, -100; 100, 100], 
              grid = [2, 2], 
              component = [20, 20]), 
            Window(
              x = 0.25, 
              y = 0.02, 
              width = 0.6, 
              height = 0.6), 
            Diagram, 
            Documentation(info = "<html><p>Block has one continuous Real output signal.</p></html>"));

        end SO;
      end Interfaces;
      annotation (Icon(
        Polygon(points = [-80, -20; -40, 20; 72, 20; 32, -20], style(rgbcolor = {0, 0, 0})), 
        Rectangle(extent = [-80, -40; 32, -20], style(rgbcolor = {0, 0, 0}, rgbfillColor = {102, 102, 102}, fillPattern = 0)), 
        Polygon(points = [-28, -16; -8, -16; 24, 16; 4, 16], style(rgbcolor = {0, 0, 0}, rgbfillColor = {102, 102, 102})), 
        Ellipse(extent = [-12, -5; 6, 3], style(rgbcolor = {255, 255, 255}, rgbfillColor = {102, 102, 102}, gradient = 1)), 
        Rectangle(extent = [-12, -2; 6, 46], style(rgbfillColor = {102, 102, 102}, gradient = 1, rgbcolor = {192, 192, 192})), 
        Ellipse(extent = [-12, 42; 6, 50], style(rgbcolor = {255, 255, 255}, rgbfillColor = {102, 102, 102}, gradient = 1)), 
        Ellipse(extent = [-16, 46; 10, 72], style(gradient = 3, rgbcolor = {127, 127, 127}, rgbfillColor = {0, 0, 0})), 
        Polygon(points = [32, -20; 72, 20; 72, 0; 32, -40], style(rgbcolor = {0, 0, 0}, rgbfillColor = {102, 102, 102}))));

      model CUnit2 "控制器"
        parameter Real p = 4 "极对数";
        parameter Real Udc = 300 "额定电压";
        parameter Real T_PWM = 0.0001 "PWM周期";
        parameter Real kv = 0.3 "速度环增益" 
          annotation (Dialog(group = "PI控制参数"));
        parameter Real Tv = 0.3 / 35 "速度环积分常数" 
          annotation (Dialog(group = "PI控制参数"));
        parameter Real kq = 30 "q轴电流增益值" 
          annotation (Dialog(group = "PI控制参数"));
        parameter Real Tq = 30 / 1900 "q轴电流积分常数" 
          annotation (Dialog(group = "PI控制参数"));
        parameter Real kd = 30 "d轴电流增益值" 
          annotation (Dialog(group = "PI控制参数"));
        parameter Real Td = 30 / 1900 "d轴电流积分常数" 
          annotation (Dialog(group = "PI控制参数"));
        final parameter Real uMax1 = 100;
        final parameter Real uMax2 = 100;
        final parameter Real uMax3 = 100;
        MachineToolDynamic.ControlBlocks.Drivers.Components.Clark clark
          annotation (extent = [110, -152; 70, -112]);
        MachineToolDynamic.ControlBlocks.Drivers.Components.Park park
          annotation (extent = [50, -150; 10, -110]);
        Modelica.Blocks.Math.Feedback feedback1
          annotation (Placement(transformation(extent = {{-180.0, -50.0}, {-160.0, -70.0}})));
        Modelica.Blocks.Math.Feedback feedback2
          annotation (extent = [-130, -110; -110, -90]);
        Modelica.Blocks.Continuous.PI PI1(
          k = kv, T = Tv)
          annotation (extent = [-150, -70; -130, -50]);
        Modelica.Blocks.Math.Feedback feedback3
          annotation (extent = [-90, -70; -70, -50]);
        Modelica.Blocks.Continuous.PI PI2(
          k = kd, T = Td)
          annotation (extent = [-60, -110; -40, -90]);
        Modelica.Blocks.Continuous.PI PI3(
          k = kq, T = Tq)
          annotation (extent = [-60, -70; -40, -50]);
        MachineToolDynamic.ControlBlocks.Drivers.Components.rPark rPark
          annotation (extent = [30, -70; 70, -30], 
            rotation = 90);
        Modelica.Blocks.Interfaces.RealInput i_fb[3]
          annotation (Placement(transformation(extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 270, origin = {110.0, 200.0})));
        Modelica.Blocks.Interfaces.RealInput phi "Absolute angle of flange" 
          annotation (Placement(transformation(extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 270, origin = {-100.0, 200.0})));


        Modelica.Blocks.Interfaces.RealInput speed
          annotation (Placement(transformation(extent = {{-210.0, -10.0}, {-190.0, 10.0}})));
        Modelica.Blocks.Nonlinear.Limiter limiter1(
          uMax = uMax1)
          annotation (extent = [-118, -70; -98, -50]);
        Modelica.Blocks.Nonlinear.Limiter limiter2(
          uMax = uMax2)
          annotation (extent = [-20, -70; 0, -50]);
        Modelica.Blocks.Nonlinear.Limiter limiter3(
          uMax = uMax3)
          annotation (extent = [-20, -110; 0, -90]);
        Modelica.Blocks.Math.Gain gain(
          k = p)
          annotation (extent = [-60, 130; -40, 150]);


        Modelica.Blocks.Continuous.Der der1
          annotation (Placement(transformation(extent = {{-10.0, 12.0}, {10.0, -8.0}}, rotation = 180, origin = {-130.0, 112.0})));
        Modelica.Blocks.Sources.Constant i(
          k = 0)
          annotation (Placement(transformation(extent = {{-192.0, -110.0}, {-172.0, -90.0}})));
        Components.rClark rClark1
          annotation (Placement(transformation(origin = {50.0, 12.000000000000004}, 
            extent = {{-22.0, -22.0}, {22.0, 22.0}}, 
            rotation = 90.0)));
        Modelica.Blocks.Interfaces.RealOutput V_out[3]
          annotation (Placement(transformation(origin = {204.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
      equation 
        connect(clark.i_beta, park.i_beta)
          annotation (points = [72, -142; 50, -142], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(clark.i_alpha, park.i_alpha)
          annotation (points = [72, -122; 62, -122; 
            62, -130; 50, -130], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(park.i_d, feedback2.u2)
          annotation (points = [12, -140; -120, -140; 
            -120, -108], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(feedback1.y, PI1.u)
          annotation (Line(points = {{-161.0, -60.0}, {-152.0, -60.0}}, color = {0, 0, 127}));
        connect(feedback3.u2, park.i_q)
          annotation (points = [-80, -68; -80, -120; 12, 
            -120], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(feedback3.y, PI3.u)
          annotation (points = [-71, -60; -62, -60], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(feedback2.y, PI2.u)
          annotation (points = [-111, -100; -62, -100], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        annotation (Coordsys(extent = [-200, -200; 200, 200], scale = 0.1), 
          Diagram, 
          Icon(coordinateSystem(preserveAspectRatio = false, 
            extent = {{-200, -200}, {200, 200}}), 
            graphics = {
            Rectangle(extent = {{-160.0, 160.0}, {180.0, -180.0}}, color = {0, 0, 255}), 
            Text(extent = {{-100.0, 182.0}, {-100.0, 162.0}}, color = {0, 0, 255}, textString = "phi_fb"), 
            Text(extent = {{100.0, 180.0}, {100.0, 160.0}}, color = {0, 0, 255}, textString = "i_fb"), 
            Text(extent = {{-156.0, 10.0}, {-156.0, -10.0}}, color = {0, 0, 255}, textString = "w_ref"), 
            Rectangle(extent = {{-160.0, 160.0}, {180.0, -180.0}}, fillColor = {56, 142, 142}, fillPattern = FillPattern.Solid), 
            Rectangle(extent = {{-140.0, 120.0}, {160.0, -60.0}}, fillColor = {0, 0, 139}, fillPattern = FillPattern.Solid), 
            Ellipse(extent = {{-112.0, -100.0}, {-72.0, -140.0}}, fillColor = {125, 158, 192}, fillPattern = FillPattern.Sphere), 
            Ellipse(extent = {{-58.0, -100.0}, {-18.0, -140.0}}, fillColor = {125, 158, 192}, fillPattern = FillPattern.Sphere), 
            Ellipse(extent = {{4.0, -100.0}, {44.0, -140.0}}, fillColor = {125, 158, 192}, fillPattern = FillPattern.Sphere), 
            Text(extent = {{-140.0, 100.0}, {120.0, 40.0}}, fillColor = {0, 0, 139}, fillPattern = FillPattern.Solid, textString = "控制参数输入", color = {255, 215, 0}), 
            Polygon(points = {{-160.0, 160.0}, {-120.0, 180.0}, {200.0, 180.0}, {180.0, 160.0}}, color = {0, 0, 0}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Sphere), 
            Polygon(points = {{200.0, 180.0}, {200.0, -160.0}, {180.0, -180.0}, {180.0, 160.0}, {200.0, 180.0}}, color = {0, 0, 0}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid)}));
        connect(feedback1.u1, speed)
          annotation (Line(points = {{-178.0, -60.0}, {-178.0, 0.0}, {-200.0, 0.0}}, color = {0, 0, 127}));
        connect(PI1.y, limiter1.u)
          annotation (points = [-129, -60; -120, -60], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(limiter1.y, feedback3.u1)
          annotation (points = [-97, -60; -88, -60], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(PI3.y, limiter2.u)
          annotation (points = [-39, -60; -22, -60], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(limiter2.y, rPark.V_q)
          annotation (points = [1, -60; 20, -60; 20, -84; 60, 
            -84; 60, -68], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(PI2.y, limiter3.u)
          annotation (points = [-39, -100; -22, -100], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(limiter3.y, rPark.V_d)
          annotation (points = [1, -100; 50, -100; 50, -68], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(clark.i_a, i_fb[1])
          annotation (Line(points = {{110.0, -120.0}, {212.0, -120.0}, {212.0, 200.0}, {110.0, 200.0}}, color = {0, 0, 127}));
        connect(clark.i_b, i_fb[2])
          annotation (Line(origin = {165.0, 34.0}, 
            points = {{-55.0, -166.0}, {55.0, -166.0}, {55.0, 156.0}, {-55.0, 156.0}, {-55.0, 166.0}}, 
            color = {0, 0, 127}));
        connect(clark.i_c, i_fb[3])
          annotation (Line(points = {{110.0, -144.0}, {230.0, -144.0}, {230.0, 206.0}, {100.0, 206.0}, {100.0, 200.0}, 
            {110.0, 200.0}}, color = {0, 0, 127}));
        connect(phi, gain.u)
          annotation (Line(points = {{-100.0, 200.0}, {-160.0, 200.0}, {-160.0, 140.0}, {-62.0, 140.0}}, color = {0, 0, 127}));
        connect(gain.y, rPark.theta)
          annotation (points = [-39, 140; 120, 140; 120, 
            -80; 40, -80; 40, -68], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(gain.y, park.theta)
          annotation (points = [-39, 140; 120, 140; 120, 
            -100; 60, -100; 60, -118; 50, -118], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(phi, der1.u)
          annotation (Line(points = {{-100.0, 200.0}, {-160.0, 200.0}, {-160.0, 140.0}, {-100.0, 140.0}, {-100.0, 110.0}, 
            {-118.0, 110.0}}, color = {0, 0, 127}));
        connect(der1.y, feedback1.u2)
          annotation (Line(points = {{-141.0, 110.0}, {-170.0, 110.0}, {-170.0, -52.0}}, color = {0, 0, 127}));
        connect(i.y, feedback2.u1)
          annotation (Line(points = {{-171.0, -100.0}, {-128.0, -100.0}}, color = {0, 0, 127}));
        connect(rPark.V_alpha, rClark1.V_alpha)
          annotation (Line(origin = {40.0, -20.0}, 
            points = {{0.0, -12.0}, {0.0, 12.0}}, 
            color = {0, 0, 127}));
        connect(rPark.V_beta, rClark1.V_beta)
          annotation (Line(origin = {59.0, -19.0}, 
            points = {{1.0, -13.0}, {1.0, 12.0}, {-1.0, 12.0}}, 
            color = {0, 0, 127}));
        connect(rClark1.v_a, V_out[1])
          annotation (Line(origin = {121.0, 28.0}, 
            points = {{-81.0, 4.0}, {-81.0, 28.0}, {61.0, 28.0}, {61.0, -28.0}, {83.0, -28.0}}, 
            color = {0, 0, 127}));
        connect(rClark1.v_b, V_out[2])
          annotation (Line(origin = {127.0, 23.0}, 
            points = {{-78.0, 9.0}, {-78.0, 23.0}, {57.0, 23.0}, {57.0, -23.0}, {77.0, -23.0}}, 
            color = {0, 0, 127}));
        connect(rClark1.v_c, V_out[3])
          annotation (Line(origin = {132.0, 24.0}, 
            points = {{-73.0, 8.0}, {-73.0, 24.0}, {58.0, 24.0}, {58.0, -24.0}, {72.0, -24.0}}, 
            color = {0, 0, 127}));
      end CUnit2;

      model CUnit3 "控制器"
        parameter Real p = 1 "极对数";
        parameter Real Udc = 310 "额定电压";
        parameter Real T_PWM = 0.0001 "PWM周期";
        parameter Real kv = 0.3 "速度环增益" 
          annotation (Dialog(group = "PI控制参数"));
        parameter Real Tv = 0.3 / 35 "速度环积分常数" 
          annotation (Dialog(group = "PI控制参数"));
        parameter Real kq = 30 "q轴电流增益值" 
          annotation (Dialog(group = "PI控制参数"));
        parameter Real Tq = 30 / 1900 "q轴电流积分常数" 
          annotation (Dialog(group = "PI控制参数"));
        parameter Real kd = 30 "d轴电流增益值" 
          annotation (Dialog(group = "PI控制参数"));
        parameter Real Td = 30 / 1900 "d轴电流积分常数" 
          annotation (Dialog(group = "PI控制参数"));
        final parameter Real uMax1 = 10;
        final parameter Real uMax2 = 100;
        final parameter Real uMax3 = 100;
        MachineToolDynamic.ControlBlocks.Drivers.Components.ab_N ab_N
          annotation (extent = [-90, -20; -70, 0]);
        MachineToolDynamic.ControlBlocks.Drivers.Components.abTU_xyz abTU_xyz
          annotation (extent = [-90, 10; -70, 50]);
        Components.NXYZ_T1T2 nXYZ_T1T2_1
          annotation (extent = [-50, 10; -10, 50]);
        Components.T1T2_Tabc t1T2_Tabc
          annotation (extent = [10, 10; 50, 50]);
        Components.Tabc_Tcm tabc_Tcm
          annotation (extent = [70, 10; 110, 50]);
        Modelica.Blocks.Sources.Constant Ux(
          k = Udc)
          annotation (extent = [-200, 8; -180, 28]);
        MachineToolDynamic.ControlBlocks.Drivers.Components.Clark clark
          annotation (extent = [110, -152; 70, -112]);
        MachineToolDynamic.ControlBlocks.Drivers.Components.Park park
          annotation (extent = [50, -150; 10, -110]);
        Modelica.Blocks.Math.Feedback feedback1
          annotation (Placement(transformation(extent = {{-180.0, -50.0}, {-160.0, -70.0}})));
        Modelica.Blocks.Math.Feedback feedback2
          annotation (extent = [-130, -110; -110, -90]);
        Modelica.Blocks.Continuous.PI PI1(
          k = kv, T = Tv)
          annotation (extent = [-150, -70; -130, -50]);
        Modelica.Blocks.Math.Feedback feedback3
          annotation (extent = [-90, -70; -70, -50], 
            Placement(transformation(origin = {-60.0, -60.0}, 
              extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Blocks.Continuous.PI PI2(
          k = kd, T = Td)
          annotation (extent = [-60, -110; -40, -90], 
            Placement(transformation(origin = {-42.0, -100.0}, 
              extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Blocks.Continuous.PI PI3(
          k = kq, T = Tq)
          annotation (extent = [-60, -70; -40, -50], 
            Placement(transformation(origin = {-28.0, -60.0}, 
              extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        MachineToolDynamic.ControlBlocks.Drivers.Components.rPark rPark
          annotation (extent = [30, -70; 70, -30], 
            rotation = 90);
        Modelica.Blocks.Interfaces.RealInput i_fb[3]
          annotation (Placement(transformation(extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 270, origin = {110.0, 200.0})));
        Modelica.Blocks.Interfaces.RealInput phi "Absolute angle of flange" 
          annotation (Placement(transformation(extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 270, origin = {-100.0, 200.0})));
        Modelica.Blocks.Interfaces.BooleanOutput pulse[6]
          annotation (extent = [190, -10; 210, 10]);
        Modelica.Blocks.Interfaces.RealInput speed
          annotation (Placement(transformation(extent = {{-210.0, -10.0}, {-190.0, 10.0}})));
        Components.PWM pWM(
          T_PWM = T_PWM)
          annotation (extent = [128, 10; 166, 50]);
        Modelica.Blocks.Sources.Constant T(
          k = T_PWM)
          annotation (extent = [-200, 42; -180, 62]);
        Modelica.Blocks.Nonlinear.Limiter limiter1(
          uMax = uMax1)
          annotation (extent = [-118, -70; -98, -50], 
            Placement(transformation(origin = {-90.0, -58.0}, 
              extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Blocks.Nonlinear.Limiter limiter2(
          uMax = uMax2)
          annotation (extent = [-20, -70; 0, -50], 
            Placement(transformation(origin = {4.0, -60.0}, 
              extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Blocks.Nonlinear.Limiter limiter3(
          uMax = uMax3)
          annotation (extent = [-20, -110; 0, -90]);
        Modelica.Blocks.Math.Gain gain(
          k = p)
          annotation (extent = [-60, 130; -40, 150]);
        Modelica.Blocks.Logical.Not not1[3]
          annotation (Placement(transformation(extent = {{158.0, -28.0}, {178.0, -8.0}}, preserveAspectRatio = true)));
        Modelica.Blocks.Continuous.Der der1
          annotation (Placement(transformation(extent = {{-10.0, 12.0}, {10.0, -8.0}}, rotation = 180, origin = {-130.0, 112.0})));
        Modelica.Blocks.Sources.Constant i(
          k = 0)
          annotation (Placement(transformation(extent = {{-192.0, -110.0}, {-172.0, -90.0}})));
        Modelica.Blocks.Math.Add add
          annotation (Placement(transformation(origin = {-118.0, -24.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Blocks.Interfaces.RealInput u1 "Connector of Real input signal 1" 
          annotation (Placement(transformation(origin = {2.0, 214.0}, 
            extent = {{-20.0, -20.0}, {20.0, 20.0}}, 
            rotation = 270.0)));
      equation 
        connect(T.y, abTU_xyz.T)
          annotation (points = [-179, 52; -120, 52; -120, 26; -90, 
            26], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(ab_N.N, nXYZ_T1T2_1.N)
          annotation (points = [-70, -10; -56, -10; -56, 
            14; -50, 14], 
            style(
              color = 45, 
              rgbcolor = {255, 127, 0}, 
              smooth = 0));
        connect(abTU_xyz.Z, nXYZ_T1T2_1.Z)
          annotation (points = [-70, 18; -60, 18; 
            -60, 30; -50, 30], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(abTU_xyz.Y, nXYZ_T1T2_1.Y)
          annotation (points = [-70, 30; -60, 30; 
            -60, 38; -50, 38], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(abTU_xyz.X, nXYZ_T1T2_1.X)
          annotation (points = [-70, 42; -60, 42; 
            -60, 46; -50, 46], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(T.y, t1T2_Tabc.T)
          annotation (points = [-179, 52; -120, 52; -120, 70; 0, 70; 
            0, 30; 10, 30], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(nXYZ_T1T2_1.T1, t1T2_Tabc.T1)
          annotation (points = [-10, 40; 10, 40], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(nXYZ_T1T2_1.T2, t1T2_Tabc.T2)
          annotation (points = [-10, 20; 10, 20], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(ab_N.N, tabc_Tcm.N)
          annotation (points = [-70, -10; 64, -10; 64, 18; 
            70, 18], 
            style(
              color = 45, 
              rgbcolor = {255, 127, 0}, 
              smooth = 0));
        connect(t1T2_Tabc.Ta, tabc_Tcm.Ta)
          annotation (points = [50, 40; 60, 40; 60, 
            42; 70, 42], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(t1T2_Tabc.Tb, tabc_Tcm.Tb)
          annotation (points = [50, 30; 60, 30; 60, 
            34; 70, 34], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(t1T2_Tabc.Tc, tabc_Tcm.Tc)
          annotation (points = [50, 20; 60, 20; 60, 
            26; 70, 26], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(Ux.y, abTU_xyz.Ux)
          annotation (points = [-179, 18; -90, 18], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(clark.i_beta, park.i_beta)
          annotation (points = [72, -142; 50, -142], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(clark.i_alpha, park.i_alpha)
          annotation (points = [72, -122; 62, -122; 
            62, -130; 50, -130], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(park.i_d, feedback2.u2)
          annotation (points = [12, -140; -120, -140; 
            -120, -108], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(feedback1.y, PI1.u)
          annotation (Line(points = {{-161.0, -60.0}, {-152.0, -60.0}}, color = {0, 0, 127}));
        connect(feedback3.u2, park.i_q)
          annotation (points = [-80, -68; -80, -120; 12, 
            -120], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0), 
            Line(origin = {-34.0, -94.0}, 
              points = {{-26.0, 26.0}, {-26.0, -26.0}, {46.0, -26.0}}, 
              color = {0, 0, 127}));
        connect(feedback3.y, PI3.u)
          annotation (points = [-71, -60; -62, -60], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0), 
            Line(origin = {-66.5, -60.0}, 
              points = {{16.0, 0.0}, {27.0, 0.0}}, 
              color = {0, 0, 127}));
        connect(feedback2.y, PI2.u)
          annotation (points = [-111, -100; -62, -100], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0), 
            Line(origin = {-86.5, -100.0}, 
              points = {{-25.0, 0.0}, {33.0, 0.0}}, 
              color = {0, 0, 127}));
        connect(abTU_xyz.U_alpha, ab_N.U_alpha)
          annotation (points = [-90, 42; -102, 
            42; -102, -5; -90, -5], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(abTU_xyz.U_beta, ab_N.U_beta)
          annotation (points = [-90, 34; -96, 34; 
            -96, -15; -90, -15], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        annotation (Coordsys(extent = [-200, -200; 200, 200], scale = 0.1), 
          Diagram, 
          Icon(coordinateSystem(preserveAspectRatio = false, 
            extent = {{-200, -200}, {200, 200}}), 
            graphics = {
            Rectangle(extent = {{-160.0, 160.0}, {180.0, -180.0}}, color = {0, 0, 255}), 
            Text(extent = {{-100.0, 182.0}, {-100.0, 162.0}}, color = {0, 0, 255}, textString = "phi_fb"), 
            Text(extent = {{100.0, 180.0}, {100.0, 160.0}}, color = {0, 0, 255}, textString = "i_fb"), 
            Text(extent = {{-156.0, 10.0}, {-156.0, -10.0}}, color = {0, 0, 255}, textString = "w_ref"), 
            Rectangle(extent = {{-160.0, 160.0}, {180.0, -180.0}}, fillColor = {56, 142, 142}, fillPattern = FillPattern.Solid), 
            Rectangle(extent = {{-140.0, 120.0}, {160.0, -60.0}}, fillColor = {0, 0, 139}, fillPattern = FillPattern.Solid), 
            Ellipse(extent = {{-112.0, -100.0}, {-72.0, -140.0}}, fillColor = {125, 158, 192}, fillPattern = FillPattern.Sphere), 
            Ellipse(extent = {{-58.0, -100.0}, {-18.0, -140.0}}, fillColor = {125, 158, 192}, fillPattern = FillPattern.Sphere), 
            Ellipse(extent = {{4.0, -100.0}, {44.0, -140.0}}, fillColor = {125, 158, 192}, fillPattern = FillPattern.Sphere), 
            Text(extent = {{-140.0, 100.0}, {120.0, 40.0}}, fillColor = {0, 0, 139}, fillPattern = FillPattern.Solid, textString = "控制参数输入", color = {255, 215, 0}), 
            Polygon(points = {{-160.0, 160.0}, {-120.0, 180.0}, {200.0, 180.0}, {180.0, 160.0}}, color = {0, 0, 0}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Sphere), 
            Polygon(points = {{200.0, 180.0}, {200.0, -160.0}, {180.0, -180.0}, {180.0, 160.0}, {200.0, 180.0}}, color = {0, 0, 0}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid)}));
        connect(feedback1.u1, speed)
          annotation (Line(points = {{-178.0, -60.0}, {-178.0, 0.0}, {-200.0, 0.0}}, color = {0, 0, 127}));
        connect(rPark.V_alpha, ab_N.U_alpha)
          annotation (points = [40, -32; -102, -32; 
            -102, -5; -90, -5], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(rPark.V_beta, ab_N.U_beta)
          annotation (points = [60, -32; 60, -22; -96, 
            -22; -96, -15; -90, -15], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(tabc_Tcm.Tcm1, pWM.Tcm1)
          annotation (points = [110, 42; 128, 42], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(tabc_Tcm.Tcm2, pWM.Tcm2)
          annotation (points = [110, 30; 128, 30], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(tabc_Tcm.Tcm3, pWM.Tcm3)
          annotation (points = [110, 18; 128, 18], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(nXYZ_T1T2_1.T, T.y)
          annotation (points = [-50, 22; -56, 22; -56, 70; -120, 
            70; -120, 52; -179, 52], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));


        connect(limiter1.y, feedback3.u1)
          annotation (points = [-97, -60; -88, -60], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0), 
            Line(origin = {-92.5, -60.0}, 
              points = {{14.0, 2.0}, {25.0, 2.0}, {25.0, 0.0}}, 
              color = {0, 0, 127}));
        connect(PI3.y, limiter2.u)
          annotation (points = [-39, -60; -22, -60], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0), 
            Line(origin = {-30.5, -60.0}, 
              points = {{14.0, 0.0}, {23.0, 0.0}}, 
              color = {0, 0, 127}));
        connect(limiter2.y, rPark.V_q)
          annotation (points = [1, -60; 20, -60; 20, -84; 60, 
            -84; 60, -68], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0), 
            Line(origin = {30.5, -72.0}, 
              points = {{-16.0, 12.0}, {-5.0, 12.0}, {-5.0, -12.0}, {30.0, -12.0}, {30.0, 4.0}}, 
              color = {0, 0, 127}));
        connect(PI2.y, limiter3.u)
          annotation (points = [-39, -100; -22, -100], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0), 
            Line(origin = {-30.5, -100.0}, 
              points = {{-1.0, 0.0}, {9.0, 0.0}}, 
              color = {0, 0, 127}));
        connect(limiter3.y, rPark.V_d)
          annotation (points = [1, -100; 50, -100; 50, -68], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(clark.i_a, i_fb[1])
          annotation (Line(points = {{110.0, -120.0}, {212.0, -120.0}, {212.0, 200.0}, {110.0, 200.0}}, color = {0, 0, 127}));
        connect(clark.i_b, i_fb[2])
          annotation (Line(origin = {165.0, 34.0}, 
            points = {{-55.0, -166.0}, {55.0, -166.0}, {55.0, 156.0}, {-55.0, 156.0}, {-55.0, 166.0}}, 
            color = {0, 0, 127}));
        connect(clark.i_c, i_fb[3])
          annotation (Line(points = {{110.0, -144.0}, {230.0, -144.0}, {230.0, 206.0}, {100.0, 206.0}, {100.0, 200.0}, 
            {110.0, 200.0}}, color = {0, 0, 127}));
        connect(phi, gain.u)
          annotation (Line(points = {{-100.0, 200.0}, {-160.0, 200.0}, {-160.0, 140.0}, {-62.0, 140.0}}, color = {0, 0, 127}));
        connect(gain.y, rPark.theta)
          annotation (points = [-39, 140; 120, 140; 120, 
            -80; 40, -80; 40, -68], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(gain.y, park.theta)
          annotation (points = [-39, 140; 120, 140; 120, 
            -100; 60, -100; 60, -118; 50, -118], 
            style(
              color = 74, 
              rgbcolor = {0, 0, 127}, 
              smooth = 0));
        connect(pWM.On[:], not1[:].u)
          annotation (Line(points = {{166.0, 30.0}, {172.0, 30.0}, {172.0, 0.0}, {144.0, 0.0}, {144.0, -18.0}, 
            {156.0, -18.0}}, color = {255, 0, 255}));
        connect(pWM.On[:], pulse[1:3])
          annotation (Line(points = {{166.0, 30.0}, {200.0, 30.0}, {200.0, 0.0}}, color = {255, 0, 255}));
        connect(not1[:].y, pulse[4:6])
          annotation (Line(points = {{179.0, -18.0}, {200.0, -18.0}, {200.0, 0.0}}, color = {255, 0, 255}));
        connect(phi, der1.u)
          annotation (Line(points = {{-100.0, 200.0}, {-160.0, 200.0}, {-160.0, 140.0}, {-100.0, 140.0}, {-100.0, 110.0}, 
            {-118.0, 110.0}}, color = {0, 0, 127}));
        connect(der1.y, feedback1.u2)
          annotation (Line(points = {{-141.0, 110.0}, {-170.0, 110.0}, {-170.0, -52.0}}, color = {0, 0, 127}));
        connect(i.y, feedback2.u1)
          annotation (Line(points = {{-171.0, -100.0}, {-128.0, -100.0}}, color = {0, 0, 127}));
        connect(add.u2, PI1.y)
          annotation (Line(origin = {-129.0, -45.0}, 
            points = {{-1.0, 15.0}, {-1.0, 9.0}, {0.0, 9.0}, {0.0, -15.0}}, 
            color = {0, 0, 127}));
        connect(add.y, limiter1.u)
          annotation (Line(origin = {-104.0, -41.0}, 
            points = {{-3.0, 17.0}, {-2.0, 17.0}, {-2.0, -17.0}, {2.0, -17.0}}, 
            color = {0, 0, 127}));
        connect(add.u1, u1)
          annotation (Line(origin = {-90.0, 81.0}, 
            points = {{-40.0, -99.0}, {-90.0, -99.0}, {-90.0, 133.0}, {92.0, 133.0}}, 
            color = {0, 0, 127}));
      end CUnit3;

      model CUnit4 "控制器"
        parameter Real p = 1 "极对数";
        parameter Real Udc = 310 "额定电压";
        parameter Real T_PWM = 0.0001 "PWM周期";
        parameter Real kv = 0.3 "速度环增益" 
          annotation (Dialog(group = "PI控制参数"));
        parameter Real Tv = 0.3 / 35 "速度环积分常数" 
          annotation (Dialog(group = "PI控制参数"));
        parameter Real kq = 30 "q轴电流增益值" 
          annotation (Dialog(group = "PI控制参数"));
        parameter Real Tq = 30 / 1900 "q轴电流积分常数" 
          annotation (Dialog(group = "PI控制参数"));
        parameter Real kd = 30 "d轴电流增益值" 
          annotation (Dialog(group = "PI控制参数"));
        parameter Real Td = 30 / 1900 "d轴电流积分常数" 
          annotation (Dialog(group = "PI控制参数"));
        final parameter Real uMax1 = 10;
        final parameter Real uMax2 = 100;
        final parameter Real uMax3 = 100;
        Modelica.Blocks.Math.Feedback feedback1
          annotation (Placement(transformation(extent = {{-180.0, -50.0}, {-160.0, -70.0}})));


        Modelica.Blocks.Continuous.PI PI1(
          k = kv, T = Tv)
          annotation (extent = [-150, -70; -130, -50], 
            Placement(transformation(origin = {-120.0, -58.0}, 
              extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Blocks.Interfaces.RealInput phi "Absolute angle of flange" 
          annotation (Placement(transformation(extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 270, origin = {-100.0, 200.0})));


        Modelica.Blocks.Interfaces.RealInput speed
          annotation (Placement(transformation(extent = {{-210.0, -10.0}, {-190.0, 10.0}})));
        Modelica.Blocks.Nonlinear.Limiter limiter1(
          uMax = uMax1)
          annotation (extent = [-118, -70; -98, -50], 
            Placement(transformation(origin = {-20.0, -58.0}, 
              extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Blocks.Math.Gain gain(
          k = p)
          annotation (extent = [-60, 130; -40, 150]);


        Modelica.Blocks.Continuous.Der der1
          annotation (Placement(transformation(extent = {{-10.0, 12.0}, {10.0, -8.0}}, rotation = 180, origin = {-130.0, 112.0})));



        Modelica.Blocks.Math.Add add
          annotation (Placement(transformation(origin = {-78.0, -14.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Blocks.Interfaces.RealInput u1 "Connector of Real input signal 1" 
          annotation (Placement(transformation(origin = {2.0, 214.0}, 
            extent = {{-20.0, -20.0}, {20.0, 20.0}}, 
            rotation = 270.0)));
        Modelica.Blocks.Math.Gain gain1(
          k = 1.33)
          annotation (extent = [-60, 130; -40, 150], 
            Placement(transformation(origin = {20.0, -60.0}, 
              extent = {{-10.0, -10.0}, {10.0, 10.0}})));
        Modelica.Blocks.Interfaces.RealOutput y "Output signal connector" 
          annotation (Placement(transformation(origin = {190.0, 0.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
      equation 
        connect(feedback1.y, PI1.u)
          annotation (Line(origin = {-156.5, -60.0}, 
            points = {{-5.0, 0.0}, {25.0, 0.0}, {25.0, 2.0}}, 
            color = {0, 0, 127}));
        annotation (Coordsys(extent = [-200, -200; 200, 200], scale = 0.1), 
          Diagram, 
          Icon(coordinateSystem(preserveAspectRatio = false, 
            extent = {{-200, -200}, {200, 200}}), 
            graphics = {
            Rectangle(extent = {{-160.0, 160.0}, {180.0, -180.0}}, color = {0, 0, 255}), 
            Text(extent = {{-100.0, 182.0}, {-100.0, 162.0}}, color = {0, 0, 255}, textString = "phi_fb"), 
            Text(extent = {{100.0, 180.0}, {100.0, 160.0}}, color = {0, 0, 255}, textString = "i_fb"), 
            Text(extent = {{-156.0, 10.0}, {-156.0, -10.0}}, color = {0, 0, 255}, textString = "w_ref"), 
            Rectangle(extent = {{-160.0, 160.0}, {180.0, -180.0}}, fillColor = {56, 142, 142}, fillPattern = FillPattern.Solid), 
            Rectangle(extent = {{-140.0, 120.0}, {160.0, -60.0}}, fillColor = {0, 0, 139}, fillPattern = FillPattern.Solid), 
            Ellipse(extent = {{-112.0, -100.0}, {-72.0, -140.0}}, fillColor = {125, 158, 192}, fillPattern = FillPattern.Sphere), 
            Ellipse(extent = {{-58.0, -100.0}, {-18.0, -140.0}}, fillColor = {125, 158, 192}, fillPattern = FillPattern.Sphere), 
            Ellipse(extent = {{4.0, -100.0}, {44.0, -140.0}}, fillColor = {125, 158, 192}, fillPattern = FillPattern.Sphere), 
            Text(extent = {{-140.0, 100.0}, {120.0, 40.0}}, fillColor = {0, 0, 139}, fillPattern = FillPattern.Solid, textString = "控制参数输入", color = {255, 215, 0}), 
            Polygon(points = {{-160.0, 160.0}, {-120.0, 180.0}, {200.0, 180.0}, {180.0, 160.0}}, color = {0, 0, 0}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Sphere), 
            Polygon(points = {{200.0, 180.0}, {200.0, -160.0}, {180.0, -180.0}, {180.0, 160.0}, {200.0, 180.0}}, color = {0, 0, 0}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid)}));
        connect(feedback1.u1, speed)
          annotation (Line(points = {{-178.0, -60.0}, {-178.0, 0.0}, {-200.0, 0.0}}, color = {0, 0, 127}));
        connect(phi, gain.u)
          annotation (Line(points = {{-100.0, 200.0}, {-160.0, 200.0}, {-160.0, 140.0}, {-62.0, 140.0}}, color = {0, 0, 127}));
        connect(phi, der1.u)
          annotation (Line(points = {{-100.0, 200.0}, {-160.0, 200.0}, {-160.0, 140.0}, {-100.0, 140.0}, {-100.0, 110.0}, 
            {-118.0, 110.0}}, color = {0, 0, 127}));
        connect(der1.y, feedback1.u2)
          annotation (Line(points = {{-141.0, 110.0}, {-170.0, 110.0}, {-170.0, -52.0}}, color = {0, 0, 127}));


        connect(add.u2, PI1.y)
          annotation (Line(origin = {-129.0, -45.0}, 
            points = {{39.0, 25.0}, {39.0, -13.0}, {20.0, -13.0}}, 
            color = {0, 0, 127}));
        connect(add.y, limiter1.u)
          annotation (Line(origin = {-104.0, -41.0}, 
            points = {{37.0, 27.0}, {58.0, 27.0}, {58.0, -17.0}, {72.0, -17.0}}, 
            color = {0, 0, 127}));
        connect(add.u1, u1)
          annotation (Line(origin = {-90.0, 81.0}, 
            points = {{0.0, -89.0}, {0.0, -43.0}, {-90.0, -43.0}, {-90.0, 133.0}, {92.0, 133.0}}, 
            color = {0, 0, 127}));
        connect(limiter1.y, gain1.u)
          annotation (Line(origin = {-34.0, -59.0}, 
            points = {{25.0, 1.0}, {44.0, 1.0}, {44.0, -1.0}, {42.0, -1.0}}, 
            color = {0, 0, 127}));
        connect(gain1.y, y)
          annotation (Line(origin = {111.0, -30.0}, 
            points = {{-80.0, -30.0}, {79.0, -30.0}, {79.0, 30.0}}, 
            color = {0, 0, 127}));
      end CUnit4;
    end Drivers;
  end ControlBlocks;
  package Example
    annotation (Diagram(coordinateSystem(extent = {{-140.0, -100.0}, {140.0, 100.0}}, 
      preserveAspectRatio = false, 
      grid = {2.0, 2.0})), 
      Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
        preserveAspectRatio = false, 
        grid = {2.0, 2.0})));
    model E1
      Real e1 = drawCircle.x[1] - drawCircle.x[2];
      Real e2 = drawCircle.y[1] - drawCircle.y[2];
      annotation (
        Diagram(coordinateSystem(extent = {{-320.0, -160.0}, {260.0, 160.0}}, 
          preserveAspectRatio = false, 
          grid = {2.0, 2.0})), Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
            preserveAspectRatio = false, 
            grid = {2.0, 2.0})), 
        experiment(StartTime = 0, StopTime = 11, NumberOfIntervals = 500, Algorithm = "Dassl", Tolerance = 0.0001, DoublePrecision = true, StoreEventValue = true));
      Modelica.Mechanics.Rotational.Components.Inertia inertia(J = 8.7e-4)
        annotation (Placement(transformation(origin = {-11.0, 2.499999999999993}, 
          extent = {{-12.5, -12.5}, {12.5, 12.5}})));
      Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = 8.7e-4)
        annotation (Placement(transformation(origin = {-11.0, -27.500000000000007}, 
          extent = {{-12.5, -12.5}, {12.5, 12.5}})));
      Modelica.Mechanics.Rotational.Sources.Torque torque
        annotation (Placement(transformation(origin = {-62.5, 2.999999999999993}, 
          extent = {{-15.0, -15.0}, {15.0, 15.0}})));
      Modelica.Mechanics.Rotational.Sources.Torque torque1
        annotation (Placement(transformation(origin = {-62.5, -27.000000000000007}, 
          extent = {{-15.0, -15.0}, {15.0, 15.0}})));
      ControlBlocks.Drivers.CUnit4 cUnit4_1(kv = 30, Tv = 0.5)
        annotation (Placement(transformation(origin = {-138.5, 32.99999999999999}, 
          extent = {{-20.0, -20.0}, {20.0, 20.0}})));
      ControlBlocks.Drivers.CUnit4 cUnit4_2(kv = 30, Tv = 0.5)
        annotation (Placement(transformation(origin = {-134.5, -51.00000000000001}, 
          extent = {{-20.0, -20.0}, {20.0, 20.0}})));
      Modelica.Mechanics.Rotational.Sensors.AngleSensor angleSensor
        annotation (extent = [76, 50; 56, 70], 
          Placement(transformation(origin = {-2.9210526315789522, 62.99999999999999}, 
            extent = {{7.578947368421055, -8.0}, {-7.578947368421055, 8.0}})));
      Modelica.Blocks.Math.Gain gain(k = 1 / 392.699)
        annotation (Placement(transformation(origin = {-44.5, 63.00000000000001}, 
          extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
          rotation = 180.0)));
      Modelica.Blocks.Math.Gain gain1(k = 50000)
        annotation (Placement(transformation(origin = {-145.0, 98.0}, 
          extent = {{10.0, -10.0}, {-10.0, 10.0}})));
      Modelica.Blocks.Nonlinear.Limiter limiter(uMin = -200, uMax = 200)
        annotation (Placement(transformation(origin = {-199.75, 97.25}, 
          extent = {{-13.25, -13.25}, {13.25, 13.25}}, 
          rotation = 180.0)));
      Modelica.Blocks.Math.Feedback feedback
        annotation (Placement(transformation(origin = {-96.0, 98.0}, 
          extent = {{-15.0, 15.0}, {15.0, -15.0}}, 
          rotation = -180.0)));
      Modelica.Blocks.Sources.Constant const1(k = 0)
        annotation (Placement(transformation(origin = {-178.5, 58.99999999999999}, 
          extent = {{-10.0, -10.0}, {10.0, 10.0}})));
      Modelica.Blocks.Sources.Constant const2(k = 0)
        annotation (Placement(transformation(origin = {-178.5, -21.000000000000007}, 
          extent = {{-10.0, -10.0}, {10.0, 10.0}})));
      Modelica.Mechanics.Rotational.Sensors.AngleSensor angleSensor1
        annotation (extent = [76, 50; 56, 70], 
          Placement(transformation(origin = {-2.9210526315789522, -75.0}, 
            extent = {{7.578947368421055, -8.0}, {-7.578947368421055, 8.0}})));
      Modelica.Blocks.Math.Gain gain2(k = 1 / 392.699)
        annotation (Placement(transformation(origin = {-36.5, -75.0}, 
          extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
          rotation = 180.0)));
      Modelica.Blocks.Math.Gain gain3(k = 50000)
        annotation (Placement(transformation(origin = {-141.0, -96.0}, 
          extent = {{10.0, -10.0}, {-10.0, 10.0}})));
      Modelica.Blocks.Nonlinear.Limiter limiter1(uMin = -200, uMax = 200)
        annotation (Placement(transformation(origin = {-195.75, -96.75}, 
          extent = {{-13.25, -13.25}, {13.25, 13.25}}, 
          rotation = 180.0)));
      Modelica.Blocks.Math.Feedback feedback1
        annotation (Placement(transformation(origin = {-92.0, -96.0}, 
          extent = {{-15.0, -15.0}, {15.0, 15.0}}, 
          rotation = 180.0)));
      Modelica.Blocks.Sources.Sine sine1(amplitude = 0.15, phase = 1.5707963267949, freqHz = 0.1, offset = 0)
        annotation (Placement(transformation(origin = {-10.5, 97.0}, 
          extent = {{10.0, -10.0}, {-10.0, 10.0}})));
      Modelica.Mechanics.Rotational.Components.InitializeFlange initializeFlange(use_w_start = false, use_a_start = false)
        annotation (Placement(transformation(origin = {47.5, 73.0}, 
          extent = {{-10.0, -10.0}, {10.0, 10.0}})));
      Modelica.Blocks.Sources.Constant const3(k = 0.15 * 392.699)
        annotation (Placement(transformation(origin = {17.5, 141.0}, 
          extent = {{-10.0, -10.0}, {10.0, 10.0}})));
      Modelica.Blocks.Sources.Sine sine2(amplitude = 0.15, phase = 0, freqHz = 0.1, offset = 0)
        annotation (Placement(transformation(origin = {17.5, -97.0}, 
          extent = {{10.0, -10.0}, {-10.0, 10.0}})));
      Modelica.Blocks.Math.Gain gain4(k = -1)
        annotation (Placement(transformation(origin = {-36.75, -98.5}, 
          extent = {{4.25, -8.5}, {-4.25, 8.5}})));
      Mechanical.SubSystem.BGXY3 bGXY3_1
        annotation (Placement(transformation(origin = {89.5, -11.000000000000007}, 
          extent = {{-25.0, -25.0}, {25.0, 25.0}})));
      Modelica.Mechanics.Rotational.Components.InitializeFlange initializeFlange1(use_w_start = false, use_a_start = false)
        annotation (Placement(transformation(origin = {17.5, -147.0}, 
          extent = {{-10.0, -10.0}, {10.0, 10.0}})));
      Modelica.Blocks.Sources.Constant const4(k = 0 * 392.699)
        annotation (Placement(transformation(origin = {-52.5, -139.0}, 
          extent = {{-10.0, -10.0}, {10.0, 10.0}})));
      ControlBlocks.Components.DrawCircle drawCircle(k = 50)
        annotation (Placement(transformation(origin = {220.0, 10.0}, 
          extent = {{-30.0, -30.0}, {30.0, 30.0}})));
      Modelica.Blocks.Sources.Sine sine3(amplitude = 0.15, phase = 1.5707963267949, freqHz = 0.1, offset = 0)
        annotation (Placement(transformation(origin = {219.5, -73.0}, 
          extent = {{10.0, -10.0}, {-10.0, 10.0}})));
      Modelica.Blocks.Sources.Sine sine4(amplitude = 0.15, phase = 0, freqHz = 0.1, offset = 0)
        annotation (Placement(transformation(origin = {217.5, 93.0}, 
          extent = {{10.0, -10.0}, {-10.0, 10.0}})));
      Modelica.Blocks.Math.Gain gain5(k = -1)
        annotation (Placement(transformation(origin = {173.5, 95.0}, 
          extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
          rotation = 180.0)));
    equation 
      connect(torque.flange, inertia.flange_a)
        annotation (Line(origin = {-35.5, 2.999999999999993}, 
          points = {{-12.0, 0.0}, {12.0, 0.0}, {12.0, -1.0}}));
      connect(torque1.flange, inertia1.flange_a)
        annotation (Line(origin = {-35.5, -27.000000000000007}, 
          points = {{-12.0, 0.0}, {12.0, 0.0}, {12.0, -1.0}}));
      connect(cUnit4_1.y, torque.tau)
        annotation (Line(origin = {-106.5, 22.999999999999993}, 
          points = {{-13.0, 10.0}, {26.0, 10.0}, {26.0, -20.0}}, 
          color = {0, 0, 127}));
      connect(cUnit4_2.y, torque1.tau)
        annotation (Line(origin = {-96.5, -32.00000000000001}, 
          points = {{-19.0, -19.0}, {16.0, -19.0}, {16.0, 5.0}}, 
          color = {0, 0, 127}));
      connect(angleSensor.phi, gain.u)
        annotation (Line(origin = {-41.5, 43.0}, 
          points = {{30.0, 20.0}, {9.0, 20.0}}, 
          color = {0, 0, 127}));
      connect(inertia.flange_b, angleSensor.flange)
        annotation (Line(origin = {3.5, 32.99999999999999}, 
          points = {{-2.0, -31.0}, {3.0, -31.0}, {3.0, 30.0}, {1.0, 30.0}}));
      connect(feedback.u2, gain.y)
        annotation (Line(origin = {-75.5, 75.0}, 
          points = {{-21.0, 11.0}, {-21.0, -12.0}, {20.0, -12.0}}, 
          color = {0, 0, 127}));
      connect(feedback.y, gain1.u)
        annotation (Line(origin = {-121.5, 98.0}, 
          points = {{12.0, 0.0}, {-12.0, 0.0}}, 
          color = {0, 0, 127}));
      connect(gain1.y, limiter.u)
        annotation (Line(origin = {-166.5, 98.0}, 
          points = {{11.0, 0.0}, {-17.0, 0.0}, {-17.0, -1.0}}, 
          color = {0, 0, 127}));
      connect(limiter.y, cUnit4_1.speed)
        annotation (Line(origin = {-196.5, 66.0}, 
          points = {{-18.0, 31.0}, {-38.0, 31.0}, {-38.0, -33.0}, {38.0, -33.0}}, 
          color = {0, 0, 127}));
      connect(const1.y, cUnit4_1.u1)
        annotation (Line(origin = {-152.5, 56.99999999999999}, 
          points = {{-15.0, 2.0}, {14.0, 2.0}, {14.0, -3.0}}, 
          color = {0, 0, 127}));
      connect(const2.y, cUnit4_2.u1)
        annotation (Line(origin = {-150.5, -25.000000000000007}, 
          points = {{-17.0, 4.0}, {16.0, 4.0}, {16.0, -5.0}}, 
          color = {0, 0, 127}));
      connect(angleSensor1.phi, gain2.u)
        annotation (Line(origin = {-17.5, -75.0}, 
          points = {{6.0, 0.0}, {-7.0, 0.0}}, 
          color = {0, 0, 127}));
      connect(gain2.y, feedback1.u2)
        annotation (Line(origin = {-69.5, -79.0}, 
          points = {{22.0, 4.0}, {-23.0, 4.0}, {-23.0, -5.0}}, 
          color = {0, 0, 127}));
      connect(feedback1.y, gain3.u)
        annotation (Line(origin = {-117.5, -96.0}, 
          points = {{12.0, 0.0}, {-12.0, 0.0}}, 
          color = {0, 0, 127}));
      connect(gain3.y, limiter1.u)
        annotation (Line(origin = {-165.5, -96.0}, 
          points = {{14.0, 0.0}, {-14.0, 0.0}, {-14.0, -1.0}}, 
          color = {0, 0, 127}));
      connect(limiter1.y, cUnit4_2.speed)
        annotation (Line(origin = {-193.5, -74.0}, 
          points = {{-17.0, -23.0}, {-39.0, -23.0}, {-39.0, 23.0}, {39.0, 23.0}}, 
          color = {0, 0, 127}));
      connect(const3.y, initializeFlange.phi_start)
        annotation (Line(origin = {41.5, 100.0}, 
          points = {{-13.0, 41.0}, {-4.0, 41.0}, {-4.0, -19.0}, {-6.0, -19.0}}, 
          color = {0, 0, 127}));
      connect(sine2.y, gain4.u)
        annotation (Line(origin = {-12.5, -98.0}, 
          points = {{19.0, 1.0}, {-19.0, 1.0}, {-19.0, -1.0}}, 
          color = {0, 0, 127}));
      connect(gain4.y, feedback1.u1)
        annotation (Line(origin = {-60.5, -97.0}, 
          points = {{19.0, -2.0}, {-20.0, -2.0}, {-20.0, 1.0}}, 
          color = {0, 0, 127}));
      connect(angleSensor1.flange, inertia1.flange_b)
        annotation (Line(origin = {14.5, -51.00000000000001}, 
          points = {{-10.0, -24.0}, {13.0, -24.0}, {13.0, 23.0}, {-13.0, 23.0}}));
      connect(bGXY3_1.axis, inertia.flange_b)
        annotation (Line(origin = {33.5, 3.999999999999993}, 
          points = {{31.0, 0.0}, {-32.0, 0.0}, {-32.0, -1.0}}));
      connect(inertia1.flange_b, bGXY3_1.axis1)
        annotation (Line(origin = {33.5, -27.000000000000007}, 
          points = {{-32.0, -1.0}, {31.0, -1.0}, {31.0, 1.0}}));
      connect(initializeFlange.flange, bGXY3_1.axis)
        annotation (Line(origin = {61.5, 37.99999999999999}, 
          points = {{-4.0, 35.0}, {-4.0, -35.0}, {3.0, -35.0}, {3.0, -34.0}}));
      connect(sine1.y, feedback.u1)
        annotation (Line(origin = {-53.0, 98.0}, 
          points = {{31.0, -1.0}, {-31.0, -1.0}, {-31.0, 0.0}}, 
          color = {0, 0, 127}));
      connect(const4.y, initializeFlange1.phi_start)
        annotation (Line(origin = {-13.0, -139.0}, 
          points = {{-29.0, 0.0}, {19.0, 0.0}}, 
          color = {0, 0, 127}));
      connect(bGXY3_1.axis1, initializeFlange1.flange)
        annotation (Line(origin = {47.0, -88.0}, 
          points = {{18.0, 62.0}, {3.0, 62.0}, {3.0, -62.0}, {-19.0, -62.0}, {-19.0, -59.0}}));
      connect(angleSensor.phi, cUnit4_1.phi)
        annotation (Line(origin = {-80.0, 46.0}, 
          points = {{69.0, 17.0}, {69.0, 14.0}, {67.0, 14.0}, {67.0, -17.0}, {-29.0, -17.0}, {-29.0, 17.0}, {-69.0, 17.0}, {-69.0, 7.0}}, 
          color = {0, 0, 127}));
      connect(angleSensor1.phi, cUnit4_2.phi)
        annotation (Line(origin = {-78.0, -42.0}, 
          points = {{67.0, -33.0}, {67.0, -18.0}, {-22.0, -18.0}, {-22.0, 32.0}, {-62.0, 32.0}, {-62.0, 11.0}, {-67.0, 11.0}}, 
          color = {0, 0, 127}));
      connect(bGXY3_1.s1, drawCircle.x[2])
        annotation (Line(origin = {152.0, 1.0}, 
          points = {{-35.0, -27.0}, {-2.0, -27.0}, {-2.0, 27.0}, {35.0, 27.0}}, 
          color = {0, 0, 127}));
      connect(sine3.y, drawCircle.y[1])
        annotation (Line(origin = {190.0, -40.0}, 
          points = {{19.0, -33.0}, {-20.0, -33.0}, {-20.0, 32.0}, {-4.0, 32.0}}, 
          color = {0, 0, 127}));
      connect(bGXY3_1.s, drawCircle.y[2])
        annotation (Line(origin = {152.0, -2.0}, 
          points = {{-35.0, 6.0}, {34.0, 6.0}, {34.0, -6.0}}, 
          color = {0, 0, 127}));
      connect(sine4.y, gain5.u)
        annotation (Line(origin = {197.0, 94.0}, 
          points = {{10.0, -1.0}, {-11.0, -1.0}, {-11.0, 1.0}}, 
          color = {0, 0, 127}));
      connect(gain5.y, drawCircle.x[1])
        annotation (Line(origin = {169.0, 62.0}, 
          points = {{-6.0, 33.0}, {-19.0, 33.0}, {-19.0, -34.0}, {18.0, -34.0}}, 
          color = {0, 0, 127}));
    end E1;
    model E2
      Real e1 = drawCircle.x[1] - drawCircle.x[2];
      Real e2 = drawCircle.y[1] - drawCircle.y[2];
      annotation (
        Diagram(coordinateSystem(extent = {{-320.0, -160.0}, {260.0, 160.0}}, 
          preserveAspectRatio = false, 
          grid = {2.0, 2.0})), Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
            preserveAspectRatio = false, 
            grid = {2.0, 2.0})), 
        experiment(StartTime = 0, StopTime = 11, NumberOfIntervals = 500, Algorithm = "Dassl", Tolerance = 0.0001, DoublePrecision = true, StoreEventValue = true));
      Modelica.Mechanics.Rotational.Components.Inertia inertia(J = 8.7e-4)
        annotation (Placement(transformation(origin = {-11.0, 2.499999999999993}, 
          extent = {{-12.5, -12.5}, {12.5, 12.5}})));
      Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = 8.7e-4)
        annotation (Placement(transformation(origin = {-11.0, -27.500000000000007}, 
          extent = {{-12.5, -12.5}, {12.5, 12.5}})));
      Modelica.Mechanics.Rotational.Sources.Torque torque
        annotation (Placement(transformation(origin = {-62.5, 2.999999999999993}, 
          extent = {{-15.0, -15.0}, {15.0, 15.0}})));
      Modelica.Mechanics.Rotational.Sources.Torque torque1
        annotation (Placement(transformation(origin = {-62.5, -27.000000000000007}, 
          extent = {{-15.0, -15.0}, {15.0, 15.0}})));
      ControlBlocks.Drivers.CUnit4 cUnit4_1(kv = 30, Tv = 0.5)
        annotation (Placement(transformation(origin = {-138.5, 32.99999999999999}, 
          extent = {{-20.0, -20.0}, {20.0, 20.0}})));
      ControlBlocks.Drivers.CUnit4 cUnit4_2(kv = 30, Tv = 0.5)
        annotation (Placement(transformation(origin = {-134.5, -51.00000000000001}, 
          extent = {{-20.0, -20.0}, {20.0, 20.0}})));
      Modelica.Mechanics.Rotational.Sensors.AngleSensor angleSensor
        annotation (extent = [76, 50; 56, 70], 
          Placement(transformation(origin = {-2.9210526315789522, 62.99999999999999}, 
            extent = {{7.578947368421055, -8.0}, {-7.578947368421055, 8.0}})));
      Modelica.Blocks.Math.Gain gain(k = 1 / 392.699)
        annotation (Placement(transformation(origin = {-44.5, 63.00000000000001}, 
          extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
          rotation = 180.0)));
      Modelica.Blocks.Math.Gain gain1(k = 50000)
        annotation (Placement(transformation(origin = {-145.0, 98.0}, 
          extent = {{10.0, -10.0}, {-10.0, 10.0}})));
      Modelica.Blocks.Nonlinear.Limiter limiter(uMin = -200, uMax = 200)
        annotation (Placement(transformation(origin = {-199.75, 97.25}, 
          extent = {{-13.25, -13.25}, {13.25, 13.25}}, 
          rotation = 180.0)));
      Modelica.Blocks.Math.Feedback feedback
        annotation (Placement(transformation(origin = {-96.0, 98.0}, 
          extent = {{-15.0, 15.0}, {15.0, -15.0}}, 
          rotation = -180.0)));
      Modelica.Blocks.Sources.Constant const1(k = 0)
        annotation (Placement(transformation(origin = {-178.5, 58.99999999999999}, 
          extent = {{-10.0, -10.0}, {10.0, 10.0}})));
      Modelica.Blocks.Sources.Constant const2(k = 0)
        annotation (Placement(transformation(origin = {-178.5, -21.000000000000007}, 
          extent = {{-10.0, -10.0}, {10.0, 10.0}})));
      Modelica.Mechanics.Rotational.Sensors.AngleSensor angleSensor1
        annotation (extent = [76, 50; 56, 70], 
          Placement(transformation(origin = {-2.9210526315789522, -75.0}, 
            extent = {{7.578947368421055, -8.0}, {-7.578947368421055, 8.0}})));
      Modelica.Blocks.Math.Gain gain2(k = 1 / 392.699)
        annotation (Placement(transformation(origin = {-36.5, -75.0}, 
          extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
          rotation = 180.0)));
      Modelica.Blocks.Math.Gain gain3(k = 50000)
        annotation (Placement(transformation(origin = {-141.0, -96.0}, 
          extent = {{10.0, -10.0}, {-10.0, 10.0}})));
      Modelica.Blocks.Nonlinear.Limiter limiter1(uMin = -200, uMax = 200)
        annotation (Placement(transformation(origin = {-195.75, -96.75}, 
          extent = {{-13.25, -13.25}, {13.25, 13.25}}, 
          rotation = 180.0)));
      Modelica.Blocks.Math.Feedback feedback1
        annotation (Placement(transformation(origin = {-92.0, -96.0}, 
          extent = {{-15.0, -15.0}, {15.0, 15.0}}, 
          rotation = 180.0)));
      Modelica.Blocks.Sources.Sine sine1(amplitude = 0.15, phase = 1.5707963267949, freqHz = 0.1, offset = 0)
        annotation (Placement(transformation(origin = {-10.5, 97.0}, 
          extent = {{10.0, -10.0}, {-10.0, 10.0}})));
      Modelica.Mechanics.Rotational.Components.InitializeFlange initializeFlange(use_w_start = false, use_a_start = false)
        annotation (Placement(transformation(origin = {48.75, 84.25}, 
          extent = {{-21.25, -21.25}, {21.25, 21.25}})));
      Modelica.Blocks.Sources.Constant const3(k = 0.15 * 392.699)
        annotation (Placement(transformation(origin = {-42.5, 141.0}, 
          extent = {{-10.0, -10.0}, {10.0, 10.0}})));
      Modelica.Blocks.Sources.Sine sine2(amplitude = 0.15, phase = 0, freqHz = 0.1, offset = 0)
        annotation (Placement(transformation(origin = {17.5, -97.0}, 
          extent = {{10.0, -10.0}, {-10.0, 10.0}})));
      Modelica.Blocks.Math.Gain gain4(k = -1)
        annotation (Placement(transformation(origin = {-36.75, -98.5}, 
          extent = {{4.25, -8.5}, {-4.25, 8.5}})));
      Mechanical.SubSystem.BGXY3 bGXY3_1
        annotation (Placement(transformation(origin = {99.5, -11.000000000000007}, 
          extent = {{-25.0, -25.0}, {25.0, 25.0}})));
      Modelica.Mechanics.Rotational.Components.InitializeFlange initializeFlange1(use_w_start = false, use_a_start = false)
        annotation (Placement(transformation(origin = {17.5, -147.0}, 
          extent = {{-10.0, -10.0}, {10.0, 10.0}})));
      Modelica.Blocks.Sources.Constant const4(k = 0 * 392.699)
        annotation (Placement(transformation(origin = {-52.5, -139.0}, 
          extent = {{-10.0, -10.0}, {10.0, 10.0}})));
      ControlBlocks.Components.DrawCircle drawCircle(k = 50)
        annotation (Placement(transformation(origin = {220.0, 10.0}, 
          extent = {{-30.0, -30.0}, {30.0, 30.0}})));
      Modelica.Blocks.Sources.Sine sine3(amplitude = 0.15, phase = 1.5707963267949, freqHz = 0.1, offset = 0)
        annotation (Placement(transformation(origin = {209.5, -63.0}, 
          extent = {{10.0, -10.0}, {-10.0, 10.0}})));
      Modelica.Blocks.Sources.Sine sine4(amplitude = 0.15, phase = 0, freqHz = 0.1, offset = 0)
        annotation (Placement(transformation(origin = {217.5, 93.0}, 
          extent = {{10.0, -10.0}, {-10.0, 10.0}})));
      Modelica.Blocks.Math.Gain gain5(k = -1)
        annotation (Placement(transformation(origin = {173.5, 95.0}, 
          extent = {{-10.0, -10.0}, {10.0, 10.0}}, 
          rotation = 180.0)));
    equation 
      connect(torque.flange, inertia.flange_a)
        annotation (Line(origin = {-35.5, 2.999999999999993}, 
          points = {{-12.0, 0.0}, {12.0, 0.0}, {12.0, -1.0}}));
      connect(torque1.flange, inertia1.flange_a)
        annotation (Line(origin = {-35.5, -27.000000000000007}, 
          points = {{-12.0, 0.0}, {12.0, 0.0}, {12.0, -1.0}}));
      connect(cUnit4_1.y, torque.tau)
        annotation (Line(origin = {-106.5, 22.999999999999993}, 
          points = {{-13.0, 10.0}, {26.0, 10.0}, {26.0, -20.0}}, 
          color = {0, 0, 127}));
      connect(cUnit4_2.y, torque1.tau)
        annotation (Line(origin = {-96.5, -32.00000000000001}, 
          points = {{-19.0, -19.0}, {16.0, -19.0}, {16.0, 5.0}}, 
          color = {0, 0, 127}));
      connect(angleSensor.phi, gain.u)
        annotation (Line(origin = {-41.5, 43.0}, 
          points = {{30.0, 20.0}, {9.0, 20.0}}, 
          color = {0, 0, 127}));
      connect(inertia.flange_b, angleSensor.flange)
        annotation (Line(origin = {3.5, 32.99999999999999}, 
          points = {{-2.0, -31.0}, {3.0, -31.0}, {3.0, 30.0}, {1.0, 30.0}}));
      connect(feedback.u2, gain.y)
        annotation (Line(origin = {-75.5, 75.0}, 
          points = {{-21.0, 11.0}, {-21.0, -12.0}, {20.0, -12.0}}, 
          color = {0, 0, 127}));
      connect(feedback.y, gain1.u)
        annotation (Line(origin = {-121.5, 98.0}, 
          points = {{12.0, 0.0}, {-12.0, 0.0}}, 
          color = {0, 0, 127}));
      connect(gain1.y, limiter.u)
        annotation (Line(origin = {-166.5, 98.0}, 
          points = {{11.0, 0.0}, {-17.0, 0.0}, {-17.0, -1.0}}, 
          color = {0, 0, 127}));
      connect(limiter.y, cUnit4_1.speed)
        annotation (Line(origin = {-196.5, 66.0}, 
          points = {{-18.0, 31.0}, {-38.0, 31.0}, {-38.0, -33.0}, {38.0, -33.0}}, 
          color = {0, 0, 127}));
      connect(const1.y, cUnit4_1.u1)
        annotation (Line(origin = {-152.5, 56.99999999999999}, 
          points = {{-15.0, 2.0}, {14.0, 2.0}, {14.0, -3.0}}, 
          color = {0, 0, 127}));
      connect(const2.y, cUnit4_2.u1)
        annotation (Line(origin = {-150.5, -25.000000000000007}, 
          points = {{-17.0, 4.0}, {16.0, 4.0}, {16.0, -5.0}}, 
          color = {0, 0, 127}));
      connect(angleSensor1.phi, gain2.u)
        annotation (Line(origin = {-17.5, -75.0}, 
          points = {{6.0, 0.0}, {-7.0, 0.0}}, 
          color = {0, 0, 127}));
      connect(gain2.y, feedback1.u2)
        annotation (Line(origin = {-69.5, -79.0}, 
          points = {{22.0, 4.0}, {-23.0, 4.0}, {-23.0, -5.0}}, 
          color = {0, 0, 127}));
      connect(feedback1.y, gain3.u)
        annotation (Line(origin = {-117.5, -96.0}, 
          points = {{12.0, 0.0}, {-12.0, 0.0}}, 
          color = {0, 0, 127}));
      connect(gain3.y, limiter1.u)
        annotation (Line(origin = {-165.5, -96.0}, 
          points = {{14.0, 0.0}, {-14.0, 0.0}, {-14.0, -1.0}}, 
          color = {0, 0, 127}));
      connect(limiter1.y, cUnit4_2.speed)
        annotation (Line(origin = {-193.5, -74.0}, 
          points = {{-17.0, -23.0}, {-39.0, -23.0}, {-39.0, 23.0}, {39.0, 23.0}}, 
          color = {0, 0, 127}));
      connect(const3.y, initializeFlange.phi_start)
        annotation (Line(origin = {41.5, 100.0}, 
          points = {{-73.0, 41.0}, {-24.0, 41.0}, {-24.0, 1.0}, {-18.0, 1.0}}, 
          color = {0, 0, 127}));
      connect(sine2.y, gain4.u)
        annotation (Line(origin = {-12.5, -98.0}, 
          points = {{19.0, 1.0}, {-19.0, 1.0}, {-19.0, -1.0}}, 
          color = {0, 0, 127}));
      connect(gain4.y, feedback1.u1)
        annotation (Line(origin = {-60.5, -97.0}, 
          points = {{19.0, -2.0}, {-20.0, -2.0}, {-20.0, 1.0}}, 
          color = {0, 0, 127}));
      connect(angleSensor1.flange, inertia1.flange_b)
        annotation (Line(origin = {14.5, -51.00000000000001}, 
          points = {{-10.0, -24.0}, {13.0, -24.0}, {13.0, 23.0}, {-13.0, 23.0}}));
      connect(bGXY3_1.axis, inertia.flange_b)
        annotation (Line(origin = {33.5, 3.999999999999993}, 
          points = {{41.0, 0.0}, {-32.0, 0.0}, {-32.0, -2.0}}));
      connect(inertia1.flange_b, bGXY3_1.axis1)
        annotation (Line(origin = {33.5, -27.000000000000007}, 
          points = {{-32.0, -1.0}, {41.0, -1.0}, {41.0, 1.0}}));
      connect(initializeFlange.flange, bGXY3_1.axis)
        annotation (Line(origin = {61.5, 37.99999999999999}, 
          points = {{9.0, 46.0}, {9.0, -35.0}, {13.0, -35.0}, {13.0, -34.0}}));
      connect(sine1.y, feedback.u1)
        annotation (Line(origin = {-53.0, 98.0}, 
          points = {{31.0, -1.0}, {-31.0, -1.0}, {-31.0, 0.0}}, 
          color = {0, 0, 127}));
      connect(const4.y, initializeFlange1.phi_start)
        annotation (Line(origin = {-13.0, -139.0}, 
          points = {{-29.0, 0.0}, {19.0, 0.0}}, 
          color = {0, 0, 127}));
      connect(bGXY3_1.axis1, initializeFlange1.flange)
        annotation (Line(origin = {47.0, -88.0}, 
          points = {{28.0, 62.0}, {3.0, 62.0}, {3.0, -62.0}, {-20.0, -62.0}, {-20.0, -59.0}}));
      connect(angleSensor.phi, cUnit4_1.phi)
        annotation (Line(origin = {-80.0, 46.0}, 
          points = {{69.0, 17.0}, {69.0, -7.0}, {-29.0, -7.0}, {-29.0, 17.0}, {-69.0, 17.0}, {-69.0, 7.0}}, 
          color = {0, 0, 127}));
      connect(angleSensor1.phi, cUnit4_2.phi)
        annotation (Line(origin = {-78.0, -42.0}, 
          points = {{67.0, -33.0}, {67.0, -18.0}, {-22.0, -18.0}, {-22.0, 32.0}, {-62.0, 32.0}, {-62.0, 11.0}, {-67.0, 11.0}}, 
          color = {0, 0, 127}));
      connect(bGXY3_1.s1, drawCircle.x[2])
        annotation (Line(origin = {152.0, 1.0}, 
          points = {{-25.0, -27.0}, {-2.0, -27.0}, {-2.0, 27.0}, {35.0, 27.0}}, 
          color = {0, 0, 127}));
      connect(sine3.y, drawCircle.y[1])
        annotation (Line(origin = {190.0, -40.0}, 
          points = {{9.0, -23.0}, {-20.0, -23.0}, {-20.0, 32.0}, {-4.0, 32.0}}, 
          color = {0, 0, 127}));
      connect(bGXY3_1.s, drawCircle.y[2])
        annotation (Line(origin = {152.0, -2.0}, 
          points = {{-25.0, 6.0}, {34.0, 6.0}, {34.0, -6.0}}, 
          color = {0, 0, 127}));
      connect(sine4.y, gain5.u)
        annotation (Line(origin = {197.0, 94.0}, 
          points = {{10.0, -1.0}, {-11.0, -1.0}, {-11.0, 1.0}}, 
          color = {0, 0, 127}));
      connect(gain5.y, drawCircle.x[1])
        annotation (Line(origin = {169.0, 62.0}, 
          points = {{-6.0, 33.0}, {-19.0, 33.0}, {-19.0, -34.0}, {18.0, -34.0}}, 
          color = {0, 0, 127}));

    end E2;
    model E3_0215

      parameter Modelica.SIunits.Pressure p_poad = 1e6;
      parameter Modelica.SIunits.Diameter dmax = 0.005;
      parameter Integer p = 3 "Number of pole pairs" 
        annotation (Dialog(tab = "Permanent magnet synchronous induction machine"));
      parameter Modelica.SIunits.Voltage V0 = 5.26 "No load RMS voltage @ fNominal" 
        annotation (Dialog(tab = "Permanent magnet synchronous induction machine"));
      parameter Modelica.SIunits.Current INominal = 12.7 "Nominal phase current" 
        annotation (Dialog(tab = "Permanent magnet synchronous induction machine"));
      parameter Modelica.SIunits.Frequency fNominal = 25 "Nominal frequency" 
        annotation (Dialog(tab = "Permanent magnet synchronous induction machine"));
      parameter Modelica.SIunits.Inertia Jr = 1.8e-6 "转子转动惯量" 
        annotation (Dialog(tab = "Permanent magnet synchronous induction machine"));
      parameter Modelica.SIunits.AngularVelocity wNominal = 1256.63704 "Nominal angular rotor velocity" 
        annotation (Dialog(tab = "Permanent magnet synchronous induction machine"));
      parameter Modelica.SIunits.Torque tauNominal = 0 "Nominal torque" 
        annotation (Dialog(tab = "Permanent magnet synchronous induction machine"));
      parameter Modelica.SIunits.Voltage VNominal = 380 "Nominal stator voltage" 
        annotation (Dialog(tab = "Permanent magnet synchronous induction machine"));
      //---------------------------------------------------------------------------------------------
      //nominal resistances and inductances
      parameter Modelica.SIunits.Resistance Rs = 2 "Warm stator resistance" 
        annotation (Dialog(tab = "Permanent magnet synchronous induction machine", group = "Nominal resistances and inductances per phase of the permanent magnet synchronous induction machine"));
      parameter Modelica.SIunits.Inductance Lssigma = 0.0055 "Stator stray inductance " 
        annotation (Dialog(tab = "Permanent magnet synchronous induction machine", group = "Nominal resistances and inductances per phase of the permanent magnet synchronous induction machine"));
      parameter Modelica.SIunits.Inductance Lmd = 0.00468 "d轴电感值" 
        annotation (Dialog(tab = "Permanent magnet synchronous induction machine", group = "Nominal resistances and inductances per phase of the permanent magnet synchronous induction machine"));
      parameter Modelica.SIunits.Inductance Lmq = 0.0095 "q轴电感值" 
        annotation (Dialog(tab = "Permanent magnet synchronous induction machine", group = "Nominal resistances and inductances per phase of the permanent magnet synchronous induction machine"));
      //-------------------------------------------------------------------------------------------
      //references and limits
      parameter Modelica.SIunits.Voltage vMachineMax = 380 "Maximum phase voltage of the machine (RMS value)" 
        annotation (Dialog(tab = "Permanent magnet synchronous induction machine", group = "Reference values and limits"));
      parameter Modelica.SIunits.Current iMachineMax = 13 "Maximum phase current of the machine (RMS value)" 
        annotation (Dialog(tab = "Permanent magnet synchronous induction machine", group = "Reference values and limits"));
      //---------------------------------------------------------------------------------------------
      //parameters of the load
      parameter Modelica.SIunits.Inertia J = 8.313e-7 "负载转动惯量" 
        annotation (Dialog(tab = "Load"));
      //-------------------------------------------------------------------------------------------
      // parameters of the battery
      parameter Modelica.SIunits.Voltage VCellNominal = 270 "额定电压值" 
        annotation (Dialog(tab = "Battery"));
      parameter Modelica.SIunits.Current ICellMax = 800 "Maximum admissable cell current" 
        annotation (Dialog(tab = "Battery"));
      parameter Modelica.SIunits.Resistance RsCell = 0.006 "Internal cell resistor" 
        annotation (Dialog(tab = "Battery"));
      parameter Integer nsBatt(min = 1) = 1 "Number of series connected cells" 
        annotation (Dialog(tab = "Battery"));
      parameter Integer npBatt(min = 1) = 1 "Number of parallel connected cells" 
        annotation (Dialog(tab = "Battery"));
      //----------------------------------------------------------------------------------------------
      // parameters of the converter
      parameter Modelica.SIunits.Current IConverterMax = 100 "Maximum admissible converter DC supply current" 
        annotation (Dialog(tab = "AC/DC converter"));
      //----------------------------------------------------------------------------------------------
      // parameters of the controller
      parameter Real kpdCurrent = 18.98631 "d轴电流增益值" 
        annotation (Dialog(tab = "Controllers", group = "Parameters of the current controller"));
      parameter Modelica.SIunits.Time TidCurrent = .593882 "Integral time constant of the stator current d-component" 
        annotation (Dialog(tab = "Controllers", group = "Parameters of the current controller"));
      parameter Real kpqCurrent = 11.12203 "Gain of the stator current q-component" 
        annotation (Dialog(tab = "Controllers", group = "Parameters of the current controller"));
      parameter Modelica.SIunits.Time TiqCurrent = .970152 "Integral time constant of the stator current q-component" 
        annotation (Dialog(tab = "Controllers", group = "Parameters of the current controller"));
      parameter Real kpSpeed = 381.763 "Gain" 
        annotation (Dialog(tab = "Controllers", group = "Parameters of the speed controller"));
      parameter Modelica.SIunits.Time TiSpeed = .929076 "Integral time constant" 
        annotation (Dialog(tab = "Controllers", group = "Parameters of the speed controller"));
      //----------------------------------------------------------------------------------------------
      annotation (
        Diagram(coordinateSystem(extent = {{-240.0, -200.0}, {300.0, 200.0}}, 
          preserveAspectRatio = false, 
          grid = {2.0, 2.0})), 
        Coordsys(extent = [-200, -200; 200, 200], scale = 0.1), 
        Icon(coordinateSystem(preserveAspectRatio = false, 
          extent = {{-200, -200}, {200, 200}})), 
        experiment(StartTime = 0, StopTime = 20, Interval = 0.0001, Algorithm = "Dassl", Tolerance = 1e-005, DoublePrecision = true));
      Modelica.Mechanics.Rotational.Sensors.AngleSensor angleSensor
        annotation (extent = [76, 50; 56, 70], 
          Placement(transformation(origin = {120.0, 213.0}, 
            extent = {{18.0, -19.0}, {-18.0, 19.0}})));
    protected 
      Modelica.Electrical.Machines.Utilities.TerminalBox terminalBox(terminalConnection = "Y") annotation (extent = [25, 12; 72, 56], 
        Placement(transformation(origin = {38.5, 178.0}, 
          extent = {{-23.5, -22.0}, {23.5, 22.0}})));
      Modelica.Electrical.Analog.Basic.Ground ground
        annotation (extent = [-20, -64; 0, -44], 
          Placement(transformation(origin = {-6.0, 70.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
      Modelica.Electrical.MultiPhase.Sensors.CurrentSensor currentSensor
        annotation (extent = [-32, 30; -12, 50], 
          Placement(transformation(origin = {-24.0, 176.0}, 
            extent = {{-10.0, 10.0}, {10.0, -10.0}})));
    public 
      ControlBlocks.Drivers.CUnit cUnit2_1(p = 3, 
        kv = kpSpeed, 
        Tv = TiSpeed, 
        kq = kpqCurrent, 
        Tq = TiqCurrent, 
        kd = kpdCurrent, 
        Td = TidCurrent, 
        Udc = 310)
        annotation (Placement(transformation(origin = {-130.0, 110.0}, 
          extent = {{-50.0, -50.0}, {50.0, 50.0}})));
      Modelica.Electrical.Machines.BasicMachines.SynchronousInductionMachines.SM_PermanentMagnet smpm1(
        p = 3, 
        fsNominal = 150, 
        Jr = 8.7e-4, 
        phiMechanical(fixed = true, 
          displayUnit
           = "rad"), 
        wMechanical(fixed = true), 
        VsOpenCircuit = 270, 
        Lmq = 0.0099, 
        useDamperCage = false, 
        TsOperational = 293.15, 
        ir(each fixed = true), 
        TrOperational = 293.15, 
        Rs = 1.9, Lmd = 0.0099, 
        useSupport = false)
        annotation (Placement(transformation(origin = {39.0, 111.0}, 
          extent = {{-25.0, -25.0}, {25.0, 25.0}})));
      ControlBlocks.Drivers.Components.ThreePhase threePhase(
        IConverterMax = IConverterMax)
        annotation (Placement(transformation(origin = {-47.0, 110.0}, 
          extent = {{18.0, 20.0}, {-18.0, -20.0}})));
      Modelica.Electrical.Analog.Sources.ConstantVoltage VoltageSource(
        V = 310)
        annotation (extent = [-22, -32; 2, -8], 
          rotation = 270, 
          Placement(transformation(origin = {-7.00000000000006, 110.0}, 
            extent = {{-12.0, -12.0}, {12.0, 12.0}}, 
            rotation = 270.0)));



      Modelica.Blocks.Math.Gain gain1(k = 40000)
        annotation (Placement(transformation(origin = {-75.0, -30.0}, 
          extent = {{10.0, -10.0}, {-10.0, 10.0}})));
      Modelica.Blocks.Nonlinear.Limiter limiter(uMin = -2000, uMax = 2000)
        annotation (Placement(transformation(origin = {-169.0, -30.0}, 
          extent = {{-16.0, -16.0}, {16.0, 16.0}}, 
          rotation = 180.0)));
      Modelica.Blocks.Math.Feedback feedback
        annotation (Placement(transformation(origin = {18.0, -30.0}, 
          extent = {{-15.0, -15.0}, {15.0, 15.0}}, 
          rotation = 180.0)));



      Mechanical.SubSystem.FeedSystemX feedSystem4_1(
        massWithStopAndFriction(F_Coulomb = 350)) annotation (Placement(transformation(origin = {195.0, 115.0}, 
          extent = {{-55.0, -55.0}, {55.0, 55.0}})));



      Modelica.Blocks.Math.Gain gain(k = 1 / 392.699)
        annotation (Placement(transformation(origin = {86.0, 48.0}, 
          extent = {{-18.0, -18.0}, {18.0, 18.0}}, 
          rotation = 270.0)));
      Modelica.Blocks.Sources.Sine sine(amplitude = 0.1, freqHz = 1 / 6.3)
        annotation (Placement(transformation(origin = {140.0, -30.0}, 
          extent = {{30.0, -30.0}, {-30.0, 30.0}})));
      Modelica.Mechanics.Rotational.Sensors.AngleSensor angleSensor1
        annotation (extent = [76, 50; 56, 70], 
          Placement(transformation(origin = {120.0, -97.0}, 
            extent = {{18.0, -19.0}, {-18.0, 19.0}})));
      Modelica.Electrical.Machines.Utilities.TerminalBox terminalBox1(
        terminalConnection = "Y") annotation (extent = [25, 12; 72, 56], 
          Placement(transformation(origin = {38.5, -132.0}, 
            extent = {{-23.5, -22.0}, {23.5, 22.0}})));
      Modelica.Electrical.Analog.Basic.Ground ground1

        annotation (extent = [-20, -64; 0, -44], 
          Placement(transformation(origin = {-6.0, -240.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
      Modelica.Electrical.MultiPhase.Sensors.CurrentSensor currentSensor1

        annotation (extent = [-32, 30; -12, 50], 
          Placement(transformation(origin = {-24.0, -134.0}, 
            extent = {{-10.0, 10.0}, {10.0, -10.0}})));
      ControlBlocks.Drivers.CUnit cUnit2_2(p = 3, 
        kv = kpSpeed, 
        Tv = TiSpeed, 
        kq = kpqCurrent, 
        Tq = TiqCurrent, 
        kd = kpdCurrent, 
        Td = TidCurrent, 
        Udc = 310)
        annotation (Placement(transformation(origin = {-130.0, -200.0}, 
          extent = {{-50.0, -50.0}, {50.0, 50.0}})));
      Modelica.Electrical.Machines.BasicMachines.SynchronousInductionMachines.SM_PermanentMagnet smpm2(
        p = 3, 
        fsNominal = 150, 
        Jr = 8.7e-4, 
        phiMechanical(fixed = true, 
          displayUnit
           = "rad", 
          start
           = 0.1 * 392.699), 
        wMechanical(fixed = true), 
        VsOpenCircuit = 270, 
        Lmq = 0.0099, 
        useDamperCage = false, 
        TsOperational = 293.15, 
        ir(each fixed = true), 
        TrOperational = 293.15, 
        Rs = 1.9, Lmd = 0.0099, 
        useSupport = false)
        annotation (Placement(transformation(origin = {39.0, -199.0}, 
          extent = {{-25.0, -25.0}, {25.0, 25.0}})));
      ControlBlocks.Drivers.Components.ThreePhase threePhase1(
        IConverterMax = IConverterMax)
        annotation (Placement(transformation(origin = {-47.0000000000001, -200.0}, 
          extent = {{18.0, 20.0}, {-18.0, -20.0}})));
      Modelica.Electrical.Analog.Sources.ConstantVoltage VoltageSource1(
        V = 310)
        annotation (extent = [-22, -32; 2, -8], 
          rotation = 270, 
          Placement(transformation(origin = {-7.00000000000003, -200.0}, 
            extent = {{-12.0, -12.0}, {12.0, 12.0}}, 
            rotation = 270.0)));
      Modelica.Blocks.Math.Gain gain2(k = 40000)
        annotation (Placement(transformation(origin = {-75.0, -340.0}, 
          extent = {{10.0, -10.0}, {-10.0, 10.0}})));
      Modelica.Blocks.Nonlinear.Limiter limiter1(uMin = -2000, uMax = 2000)
        annotation (Placement(transformation(origin = {-169.0, -340.0}, 
          extent = {{-16.0, -16.0}, {16.0, 16.0}}, 
          rotation = 180.0)));
      Modelica.Blocks.Math.Feedback feedback1
        annotation (Placement(transformation(origin = {18.0, -340.0}, 
          extent = {{-15.0, -15.0}, {15.0, 15.0}}, 
          rotation = 180.0)));
      Mechanical.SubSystem.FeedSystemY feedSystem4_2(
        massWithStopAndFriction(F_Coulomb = 350, 
          s(start
             = 0.1)))
        annotation (Placement(transformation(origin = {195.0, -195.0}, 
          extent = {{-55.0, -55.0}, {55.0, 55.0}})));
      Modelica.Blocks.Math.Gain gain3(k = 1 / 392.699)
        annotation (Placement(transformation(origin = {86.0, -262.0}, 
          extent = {{-18.0, -18.0}, {18.0, 18.0}}, 
          rotation = 270.0)));
      Modelica.Blocks.Sources.Sine sine1(amplitude = 0.1, freqHz = 1 / 6.3, phase = 1.5707963267949)
        annotation (Placement(transformation(origin = {140.0, -340.0}, 
          extent = {{30.0, -30.0}, {-30.0, 30.0}})));
      ControlBlocks.Components.DrawCircle drawCircle
        annotation (Placement(transformation(origin = {370.0, -20.0}, 
          extent = {{-60.0, -60.0}, {60.0, 60.0}})));
    equation 
      // w_in = der(pMSM.flange_a.phi);
      // power = w_in * tau;
      // I[:] = pMSM.plug_sp.pin[:].i;
      // tau = -pMSM.flange_a.tau;
      connect(currentSensor.i, cUnit2_1.i_fb)
        annotation (Line(origin = {-66.0, 159.0}, 
          points = {{42.0, 28.0}, {42.0, 41.0}, {-37.0, 41.0}, {-37.0, 1.0}}, 
          color = {0, 0, 127}));
      connect(cUnit2_1.phi, angleSensor.phi)
        annotation (Line(origin = {-43.0, 187.0}, 
          points = {{-112.0, -27.0}, {-112.0, 26.0}, {143.0, 26.0}}, 
          color = {0, 0, 127}));
      connect(smpm1.plug_sp, terminalBox.plug_sp)
        annotation (Line(origin = {54.0, 146.0}, 
          points = {{0.0, -10.0}, {0.0, 10.0}, {-1.0, 10.0}}, 
          color = {0, 0, 255}));
      connect(smpm1.plug_sn, terminalBox.plug_sn)
        annotation (Line(origin = {24.0, 146.0}, 
          points = {{0.0, -10.0}, {0.0, 10.0}}, 
          color = {0, 0, 255}));
      connect(angleSensor.flange, smpm1.flange)
        annotation (Line(origin = {86.0, 161.0}, 
          points = {{52.0, 52.0}, {52.0, -50.0}, {-22.0, -50.0}}));
      connect(currentSensor.plug_n, terminalBox.plugSupply)
        annotation (Line(origin = {11.0, 165.0}, 
          points = {{-25.0, 11.0}, {28.0, 11.0}, {28.0, -5.0}}, 
          color = {0, 0, 255}));
      connect(VoltageSource.n, ground.p)
        annotation (Line(origin = {-7.0, 89.0}, 
          points = {{0.0, 9.0}, {0.0, -9.0}, {1.0, -9.0}}, 
          color = {0, 0, 255}));
      connect(VoltageSource.p, threePhase.pSupply)
        annotation (Line(origin = {-18.0, 122.0}, 
          points = {{11.0, 0.0}, {11.0, -24.0}, {-11.0, -24.0}}, 
          color = {0, 0, 255}));
      connect(VoltageSource.n, threePhase.nSupply)
        annotation (Line(origin = {-18.0, 98.0}, 
          points = {{11.0, 0.0}, {11.0, 24.0}, {-11.0, 24.0}}, 
          color = {0, 0, 255}));
      connect(cUnit2_1.pulse, threePhase.u)
        annotation (Line(origin = {-72.0, 110.0}, 
          points = {{-8.0, 0.0}, {7.0, 0.0}}, 
          color = {255, 0, 255}));
      connect(threePhase.pLoad, currentSensor.plug_p)
        annotation (Line(origin = {-37.0, 137.0}, 
          points = {{-10.0, -7.0}, {-10.0, 39.0}, {3.0, 39.0}}, 
          color = {0, 0, 255}));
      connect(gain1.y, limiter.u)
        annotation (Line(origin = {-128.0, -5.0}, 
          points = {{42.0, -25.0}, {-22.0, -25.0}}, 
          color = {0, 0, 127}));
      connect(gain1.u, feedback.y)
        annotation (Line(origin = {-70.0, -4.0}, 
          points = {{7.0, -26.0}, {75.0, -26.0}}, 
          color = {0, 0, 127}));
      connect(limiter.y, cUnit2_1.speed)
        annotation (Line(origin = {-205.0, 53.0}, 
          points = {{18.0, -83.0}, {-5.0, -83.0}, {-5.0, 57.0}, {25.0, 57.0}}, 
          color = {0, 0, 127}));

      connect(smpm1.flange, feedSystem4_1.flange_a)
        annotation (Line(origin = {106.0, 113.0}, 
          points = {{-42.0, -2.0}, {21.0, -2.0}, {21.0, 1.0}, {31.0, 1.0}}));
      connect(angleSensor.phi, gain.u)
        annotation (Line(origin = {79.0, 138.0}, 
          points = {{21.0, 75.0}, {7.0, 75.0}, {7.0, -68.0}}, 
          color = {0, 0, 127}));
      connect(gain.y, feedback.u2)
        annotation (Line(origin = {20.0, 24.0}, 
          points = {{66.0, 4.0}, {66.0, -24.0}, {-2.0, -24.0}, {-2.0, -42.0}}, 
          color = {0, 0, 127}));
      connect(sine.y, feedback.u1)
        annotation (Line(origin = {69.0, -30.0}, 
          points = {{38.0, 0.0}, {-39.0, 0.0}}, 
          color = {0, 0, 127}));
      connect(currentSensor1.i, cUnit2_2.i_fb)
        annotation (Line(origin = {-66.0, -151.0}, 
          points = {{42.0, 28.0}, {42.0, 41.0}, {-37.0, 41.0}, {-37.0, 1.0}}, 
          color = {0, 0, 127}));
      connect(cUnit2_2.phi, angleSensor1.phi)
        annotation (Line(origin = {-43.0, -123.0}, 
          points = {{-112.0, -27.0}, {-112.0, 6.0}, {143.0, 6.0}, {143.0, 26.0}}, 
          color = {0, 0, 127}));
      connect(smpm2.plug_sp, terminalBox1.plug_sp)
        annotation (Line(origin = {54.0, -164.0}, 
          points = {{0.0, -10.0}, {0.0, 10.0}, {-1.0, 10.0}}, 
          color = {0, 0, 255}));
      connect(smpm2.plug_sn, terminalBox1.plug_sn)
        annotation (Line(origin = {24.0, -164.0}, 
          points = {{0.0, -10.0}, {0.0, 10.0}}, 
          color = {0, 0, 255}));
      connect(angleSensor1.flange, smpm2.flange)
        annotation (Line(origin = {86.0, -149.0}, 
          points = {{52.0, 52.0}, {52.0, -70.0}, {-22.0, -70.0}, {-22.0, -50.0}}));
      connect(currentSensor1.plug_n, terminalBox1.plugSupply)
        annotation (Line(origin = {11.0, -145.0}, 
          points = {{-25.0, 11.0}, {28.0, 11.0}, {28.0, -5.0}}, 
          color = {0, 0, 255}));
      connect(VoltageSource1.n, ground1.p)
        annotation (Line(origin = {-7.0, -221.0}, 
          points = {{0.0, 9.0}, {0.0, -9.0}, {1.0, -9.0}}, 
          color = {0, 0, 255}));
      connect(VoltageSource1.p, threePhase1.pSupply)
        annotation (Line(origin = {-18.0, -188.0}, 
          points = {{11.0, 0.0}, {11.0, -24.0}, {-11.0, -24.0}}, 
          color = {0, 0, 255}));
      connect(VoltageSource1.n, threePhase1.nSupply)
        annotation (Line(origin = {-18.0, -212.0}, 
          points = {{11.0, 0.0}, {11.0, 24.0}, {-11.0, 24.0}}, 
          color = {0, 0, 255}));
      connect(cUnit2_2.pulse, threePhase1.u)
        annotation (Line(origin = {-72.0, -200.0}, 
          points = {{-8.0, 0.0}, {7.0, 0.0}}, 
          color = {255, 0, 255}));
      connect(threePhase1.pLoad, currentSensor1.plug_p)
        annotation (Line(origin = {-37.0, -173.0}, 
          points = {{-10.0, -7.0}, {-10.0, 39.0}, {3.0, 39.0}}, 
          color = {0, 0, 255}));
      connect(gain2.y, limiter1.u)
        annotation (Line(origin = {-128.0, -315.0}, 
          points = {{42.0, -25.0}, {-22.0, -25.0}}, 
          color = {0, 0, 127}));
      connect(gain2.u, feedback1.y)
        annotation (Line(origin = {-70.0, -314.0}, 
          points = {{7.0, -26.0}, {75.0, -26.0}}, 
          color = {0, 0, 127}));
      connect(limiter1.y, cUnit2_2.speed)
        annotation (Line(origin = {-205.0, -257.0}, 
          points = {{18.0, -83.0}, {-5.0, -83.0}, {-5.0, 57.0}, {25.0, 57.0}}, 
          color = {0, 0, 127}));
      connect(smpm2.flange, feedSystem4_2.flange_a)
        annotation (Line(origin = {106.0, -197.0}, 
          points = {{-42.0, -2.0}, {21.0, -2.0}, {21.0, 1.0}, {31.0, 1.0}}));
      connect(angleSensor1.phi, gain3.u)
        annotation (Line(origin = {79.0, -172.0}, 
          points = {{21.0, 75.0}, {7.0, 75.0}, {7.0, -68.0}}, 
          color = {0, 0, 127}));
      connect(gain3.y, feedback1.u2)
        annotation (Line(origin = {20.0, -286.0}, 
          points = {{66.0, 4.0}, {66.0, -24.0}, {-2.0, -24.0}, {-2.0, -42.0}}, 
          color = {0, 0, 127}));
      connect(sine1.y, feedback1.u1)
        annotation (Line(origin = {69.0, -340.0}, 
          points = {{38.0, 0.0}, {-39.0, 0.0}}, 
          color = {0, 0, 127}));
      connect(drawCircle.x[2], feedSystem4_1.s)
        annotation (Line(origin = {276.0, 75.0}, 
          points = {{28.0, -59.0}, {28.0, -35.0}, {32.0, -35.0}, {32.0, 31.0}, {-32.0, 31.0}, {-32.0, 59.0}}, 
          color = {0, 0, 127}));
      connect(sine.y, drawCircle.x[1])
        annotation (Line(origin = {206.0, -7.0}, 
          points = {{-99.0, -23.0}, {-99.0, -13.0}, {-98.0, -13.0}, {-98.0, 9.0}, {-76.0, 9.0}, {-76.0, 23.0}, {98.0, 23.0}}, 
          color = {0, 0, 127}));
      connect(sine1.y, drawCircle.y[1])
        annotation (Line(origin = {205.0, -198.0}, 
          points = {{-98.0, -142.0}, {-98.0, -132.0}, {-97.0, -132.0}, {-97.0, -92.0}, {55.0, -92.0}, {55.0, 142.0}, {98.0, 142.0}}, 
          color = {0, 0, 127}));
      connect(feedSystem4_2.s, drawCircle.y[2])
        annotation (Line(origin = {274.0, -116.0}, 
          points = {{-30.0, -60.0}, {-30.0, -54.0}, {-22.0, -54.0}, {-22.0, 60.0}, {29.0, 60.0}}, 
          color = {0, 0, 127}));
    end E3_0215;

    model E4_0215

      parameter Modelica.SIunits.Pressure p_poad = 1e6;
      parameter Modelica.SIunits.Diameter dmax = 0.005;
      parameter Integer p = 3 "Number of pole pairs" 
        annotation (Dialog(tab = "Permanent magnet synchronous induction machine"));
      parameter Modelica.SIunits.Voltage V0 = 5.26 "No load RMS voltage @ fNominal" 
        annotation (Dialog(tab = "Permanent magnet synchronous induction machine"));
      parameter Modelica.SIunits.Current INominal = 12.7 "Nominal phase current" 
        annotation (Dialog(tab = "Permanent magnet synchronous induction machine"));
      parameter Modelica.SIunits.Frequency fNominal = 25 "Nominal frequency" 
        annotation (Dialog(tab = "Permanent magnet synchronous induction machine"));
      parameter Modelica.SIunits.Inertia Jr = 1.8e-6 "转子转动惯量" 
        annotation (Dialog(tab = "Permanent magnet synchronous induction machine"));
      parameter Modelica.SIunits.AngularVelocity wNominal = 1256.63704 "Nominal angular rotor velocity" 
        annotation (Dialog(tab = "Permanent magnet synchronous induction machine"));
      parameter Modelica.SIunits.Torque tauNominal = 0 "Nominal torque" 
        annotation (Dialog(tab = "Permanent magnet synchronous induction machine"));
      parameter Modelica.SIunits.Voltage VNominal = 380 "Nominal stator voltage" 
        annotation (Dialog(tab = "Permanent magnet synchronous induction machine"));
      //---------------------------------------------------------------------------------------------
      //nominal resistances and inductances
      parameter Modelica.SIunits.Resistance Rs = 2 "Warm stator resistance" 
        annotation (Dialog(tab = "Permanent magnet synchronous induction machine", group = "Nominal resistances and inductances per phase of the permanent magnet synchronous induction machine"));
      parameter Modelica.SIunits.Inductance Lssigma = 0.0055 "Stator stray inductance " 
        annotation (Dialog(tab = "Permanent magnet synchronous induction machine", group = "Nominal resistances and inductances per phase of the permanent magnet synchronous induction machine"));
      parameter Modelica.SIunits.Inductance Lmd = 0.00468 "d轴电感值" 
        annotation (Dialog(tab = "Permanent magnet synchronous induction machine", group = "Nominal resistances and inductances per phase of the permanent magnet synchronous induction machine"));
      parameter Modelica.SIunits.Inductance Lmq = 0.0095 "q轴电感值" 
        annotation (Dialog(tab = "Permanent magnet synchronous induction machine", group = "Nominal resistances and inductances per phase of the permanent magnet synchronous induction machine"));
      //-------------------------------------------------------------------------------------------
      //references and limits
      parameter Modelica.SIunits.Voltage vMachineMax = 380 "Maximum phase voltage of the machine (RMS value)" 
        annotation (Dialog(tab = "Permanent magnet synchronous induction machine", group = "Reference values and limits"));
      parameter Modelica.SIunits.Current iMachineMax = 13 "Maximum phase current of the machine (RMS value)" 
        annotation (Dialog(tab = "Permanent magnet synchronous induction machine", group = "Reference values and limits"));
      //---------------------------------------------------------------------------------------------
      //parameters of the load
      parameter Modelica.SIunits.Inertia J = 8.313e-7 "负载转动惯量" 
        annotation (Dialog(tab = "Load"));
      //-------------------------------------------------------------------------------------------
      // parameters of the battery
      parameter Modelica.SIunits.Voltage VCellNominal = 270 "额定电压值" 
        annotation (Dialog(tab = "Battery"));
      parameter Modelica.SIunits.Current ICellMax = 800 "Maximum admissable cell current" 
        annotation (Dialog(tab = "Battery"));
      parameter Modelica.SIunits.Resistance RsCell = 0.006 "Internal cell resistor" 
        annotation (Dialog(tab = "Battery"));
      parameter Integer nsBatt(min = 1) = 1 "Number of series connected cells" 
        annotation (Dialog(tab = "Battery"));
      parameter Integer npBatt(min = 1) = 1 "Number of parallel connected cells" 
        annotation (Dialog(tab = "Battery"));
      //----------------------------------------------------------------------------------------------
      // parameters of the converter
      parameter Modelica.SIunits.Current IConverterMax = 100 "Maximum admissible converter DC supply current" 
        annotation (Dialog(tab = "AC/DC converter"));
      //----------------------------------------------------------------------------------------------
      // parameters of the controller
      parameter Real kpdCurrent = 18.98631 "d轴电流增益值" 
        annotation (Dialog(tab = "Controllers", group = "Parameters of the current controller"));
      parameter Modelica.SIunits.Time TidCurrent = .593882 "Integral time constant of the stator current d-component" 
        annotation (Dialog(tab = "Controllers", group = "Parameters of the current controller"));
      parameter Real kpqCurrent = 11.12203 "Gain of the stator current q-component" 
        annotation (Dialog(tab = "Controllers", group = "Parameters of the current controller"));
      parameter Modelica.SIunits.Time TiqCurrent = .970152 "Integral time constant of the stator current q-component" 
        annotation (Dialog(tab = "Controllers", group = "Parameters of the current controller"));
      parameter Real kpSpeed = 381.763 "Gain" 
        annotation (Dialog(tab = "Controllers", group = "Parameters of the speed controller"));
      parameter Modelica.SIunits.Time TiSpeed = .929076 "Integral time constant" 
        annotation (Dialog(tab = "Controllers", group = "Parameters of the speed controller"));
      //----------------------------------------------------------------------------------------------
      annotation (
        Diagram(coordinateSystem(extent = {{-240.0, -200.0}, {300.0, 200.0}}, 
          preserveAspectRatio = false, 
          grid = {2.0, 2.0})), 
        Coordsys(extent = [-200, -200; 200, 200], scale = 0.1), 
        Icon(coordinateSystem(preserveAspectRatio = false, 
          extent = {{-200, -200}, {200, 200}})), 
        experiment(StartTime = 0, StopTime = 20, Interval = 0.0001, Algorithm = "Dassl", Tolerance = 1e-005, DoublePrecision = true));
      Modelica.Mechanics.Rotational.Sensors.AngleSensor angleSensor1
        annotation (extent = [76, 50; 56, 70], 
          Placement(transformation(origin = {130.0, 113.0}, 
            extent = {{18.0, -19.0}, {-18.0, 19.0}})));
      Modelica.Electrical.Machines.Utilities.TerminalBox terminalBox1(
        terminalConnection = "Y") annotation (extent = [25, 12; 72, 56], 
          Placement(transformation(origin = {48.5, 78.0}, 
            extent = {{-23.5, -22.0}, {23.5, 22.0}})));
      Modelica.Electrical.Analog.Basic.Ground ground1

        annotation (extent = [-20, -64; 0, -44], 
          Placement(transformation(origin = {4.0, -30.0}, 
            extent = {{-10.0, -10.0}, {10.0, 10.0}})));
      Modelica.Electrical.MultiPhase.Sensors.CurrentSensor currentSensor1

        annotation (extent = [-32, 30; -12, 50], 
          Placement(transformation(origin = {-14.0, 76.0}, 
            extent = {{-10.0, 10.0}, {10.0, -10.0}})));
      ControlBlocks.Drivers.CUnit cUnit2_2(p = 3, 
        kv = kpSpeed, 
        Tv = TiSpeed, 
        kq = kpqCurrent, 
        Tq = TiqCurrent, 
        kd = kpdCurrent, 
        Td = TidCurrent, 
        Udc = 310)
        annotation (Placement(transformation(origin = {-120.0, 10.0}, 
          extent = {{-50.0, -50.0}, {50.0, 50.0}})));
      Modelica.Electrical.Machines.BasicMachines.SynchronousInductionMachines.SM_PermanentMagnet smpm2(
        p = 3, 
        fsNominal = 150, 
        Jr = 8.7e-4, 
        phiMechanical(fixed = true, 
          displayUnit
           = "rad", 
          start
           = 0.1 * 392.699), 
        wMechanical(fixed = true), 
        VsOpenCircuit = 270, 
        Lmq = 0.0099, 
        useDamperCage = false, 
        TsOperational = 293.15, 
        ir(each fixed = true), 
        TrOperational = 293.15, 
        Rs = 1.9, Lmd = 0.0099, 
        useSupport = false)
        annotation (Placement(transformation(origin = {49.0, 11.0}, 
          extent = {{-25.0, -25.0}, {25.0, 25.0}})));
      ControlBlocks.Drivers.Components.ThreePhase threePhase1(
        IConverterMax = IConverterMax)
        annotation (Placement(transformation(origin = {-37.0000000000001, 10.0}, 
          extent = {{18.0, 20.0}, {-18.0, -20.0}})));
      Modelica.Electrical.Analog.Sources.ConstantVoltage VoltageSource1(
        V = 310)
        annotation (extent = [-22, -32; 2, -8], 
          rotation = 270, 
          Placement(transformation(origin = {2.99999999999997, 9.99999999999997}, 
            extent = {{-12.0, -12.0}, {12.0, 12.0}}, 
            rotation = 270.0)));
      Modelica.Blocks.Math.Gain gain2(k = 40000)
        annotation (Placement(transformation(origin = {-65.0, -130.0}, 
          extent = {{10.0, -10.0}, {-10.0, 10.0}})));
      Modelica.Blocks.Nonlinear.Limiter limiter1(uMin = -2000, uMax = 2000)
        annotation (Placement(transformation(origin = {-159.0, -130.0}, 
          extent = {{-16.0, -16.0}, {16.0, 16.0}}, 
          rotation = 180.0)));
      Modelica.Blocks.Math.Feedback feedback1
        annotation (Placement(transformation(origin = {28.0, -130.0}, 
          extent = {{-15.0, -15.0}, {15.0, 15.0}}, 
          rotation = 180.0)));
      Mechanical.SubSystem.FeedSystemY feedSystem4_2(
        massWithStopAndFriction(F_Coulomb = 350, s(start
           = 0.1)))
        annotation (Placement(transformation(origin = {205.0, 15.0}, 
          extent = {{-55.0, -55.0}, {55.0, 55.0}})));
      Modelica.Blocks.Math.Gain gain3(k = 1 / 392.699)
        annotation (Placement(transformation(origin = {96.0, -52.0}, 
          extent = {{-18.0, -18.0}, {18.0, 18.0}}, 
          rotation = 270.0)));
      Modelica.Blocks.Sources.Sine sine1(amplitude = 0.1, freqHz = 1 / 6.3, phase = 1.5707963267949)
        annotation (Placement(transformation(origin = {150.0, -130.0}, 
          extent = {{30.0, -30.0}, {-30.0, 30.0}})));
    equation 
      // w_in = der(pMSM.flange_a.phi);
      // power = w_in * tau;
      // I[:] = pMSM.plug_sp.pin[:].i;
      // tau = -pMSM.flange_a.tau;
      connect(currentSensor1.i, cUnit2_2.i_fb)
        annotation (Line(origin = {-56.0, 59.0}, 
          points = {{42.0, 28.0}, {42.0, 41.0}, {-37.0, 41.0}, {-37.0, 1.0}}, 
          color = {0, 0, 127}));
      connect(cUnit2_2.phi, angleSensor1.phi)
        annotation (Line(origin = {-33.0, 87.0}, 
          points = {{-112.0, -27.0}, {-112.0, 6.0}, {143.0, 6.0}, {143.0, 26.0}}, 
          color = {0, 0, 127}));
      connect(smpm2.plug_sp, terminalBox1.plug_sp)
        annotation (Line(origin = {64.0, 46.0}, 
          points = {{0.0, -10.0}, {0.0, 10.0}, {-1.0, 10.0}}, 
          color = {0, 0, 255}));
      connect(smpm2.plug_sn, terminalBox1.plug_sn)
        annotation (Line(origin = {34.0, 46.0}, 
          points = {{0.0, -10.0}, {0.0, 10.0}}, 
          color = {0, 0, 255}));
      connect(angleSensor1.flange, smpm2.flange)
        annotation (Line(origin = {96.0, 61.0}, 
          points = {{52.0, 52.0}, {52.0, -70.0}, {-22.0, -70.0}, {-22.0, -50.0}}));
      connect(currentSensor1.plug_n, terminalBox1.plugSupply)
        annotation (Line(origin = {21.0, 65.0}, 
          points = {{-25.0, 11.0}, {28.0, 11.0}, {28.0, -5.0}}, 
          color = {0, 0, 255}));
      connect(VoltageSource1.n, ground1.p)
        annotation (Line(origin = {3.0, -11.0}, 
          points = {{0.0, 9.0}, {0.0, -9.0}, {1.0, -9.0}}, 
          color = {0, 0, 255}));
      connect(VoltageSource1.p, threePhase1.pSupply)
        annotation (Line(origin = {-8.0, 22.0}, 
          points = {{11.0, 0.0}, {11.0, -24.0}, {-11.0, -24.0}}, 
          color = {0, 0, 255}));
      connect(VoltageSource1.n, threePhase1.nSupply)
        annotation (Line(origin = {-8.0, -2.0}, 
          points = {{11.0, 0.0}, {11.0, 24.0}, {-11.0, 24.0}}, 
          color = {0, 0, 255}));
      connect(cUnit2_2.pulse, threePhase1.u)
        annotation (Line(origin = {-62.0, 10.0}, 
          points = {{-8.0, 0.0}, {7.0, 0.0}}, 
          color = {255, 0, 255}));
      connect(threePhase1.pLoad, currentSensor1.plug_p)
        annotation (Line(origin = {-27.0, 37.0}, 
          points = {{-10.0, -7.0}, {-10.0, 39.0}, {3.0, 39.0}}, 
          color = {0, 0, 255}));
      connect(gain2.y, limiter1.u)
        annotation (Line(origin = {-118.0, -105.0}, 
          points = {{42.0, -25.0}, {-22.0, -25.0}}, 
          color = {0, 0, 127}));
      connect(gain2.u, feedback1.y)
        annotation (Line(origin = {-60.0, -104.0}, 
          points = {{7.0, -26.0}, {74.0, -26.0}}, 
          color = {0, 0, 127}));
      connect(limiter1.y, cUnit2_2.speed)
        annotation (Line(origin = {-195.0, -47.0}, 
          points = {{18.0, -83.0}, {-5.0, -83.0}, {-5.0, 57.0}, {25.0, 57.0}}, 
          color = {0, 0, 127}));
      connect(smpm2.flange, feedSystem4_2.flange_a)
        annotation (Line(origin = {116.0, 13.0}, 
          points = {{-42.0, -2.0}, {21.0, -2.0}, {21.0, 1.0}, {31.0, 1.0}}));
      connect(angleSensor1.phi, gain3.u)
        annotation (Line(origin = {89.0, 38.0}, 
          points = {{21.0, 75.0}, {7.0, 75.0}, {7.0, -68.0}}, 
          color = {0, 0, 127}));
      connect(gain3.y, feedback1.u2)
        annotation (Line(origin = {30.0, -76.0}, 
          points = {{66.0, 4.0}, {66.0, -24.0}, {-2.0, -24.0}, {-2.0, -42.0}}, 
          color = {0, 0, 127}));
      connect(sine1.y, feedback1.u1)
        annotation (Line(origin = {79.0, -130.0}, 
          points = {{38.0, 0.0}, {-39.0, 0.0}}, 
          color = {0, 0, 127}));
    end E4_0215;

    model E5_0218
      Real deltaS = sine1.y - feedSystem4_2.s;
      parameter Modelica.SIunits.Pressure p_poad = 1e6;
      parameter Modelica.SIunits.Diameter dmax = 0.005;
      parameter Integer p = 3 "Number of pole pairs" 
        annotation (Dialog(tab = "Permanent magnet synchronous induction machine"));
      parameter Modelica.SIunits.Voltage V0 = 5.26 "No load RMS voltage @ fNominal" 
        annotation (Dialog(tab = "Permanent magnet synchronous induction machine"));
      parameter Modelica.SIunits.Current INominal = 12.7 "Nominal phase current" 
        annotation (Dialog(tab = "Permanent magnet synchronous induction machine"));
      parameter Modelica.SIunits.Frequency fNominal = 25 "Nominal frequency" 
        annotation (Dialog(tab = "Permanent magnet synchronous induction machine"));
      parameter Modelica.SIunits.Inertia Jr = 1.8e-6 "转子转动惯量" 
        annotation (Dialog(tab = "Permanent magnet synchronous induction machine"));
      parameter Modelica.SIunits.AngularVelocity wNominal = 1256.63704 "Nominal angular rotor velocity" 
        annotation (Dialog(tab = "Permanent magnet synchronous induction machine"));
      parameter Modelica.SIunits.Torque tauNominal = 0 "Nominal torque" 
        annotation (Dialog(tab = "Permanent magnet synchronous induction machine"));
      parameter Modelica.SIunits.Voltage VNominal = 380 "Nominal stator voltage" 
        annotation (Dialog(tab = "Permanent magnet synchronous induction machine"));
      //---------------------------------------------------------------------------------------------
      //nominal resistances and inductances
      parameter Modelica.SIunits.Resistance Rs = 2 "Warm stator resistance" 
        annotation (Dialog(tab = "Permanent magnet synchronous induction machine", group = "Nominal resistances and inductances per phase of the permanent magnet synchronous induction machine"));
      parameter Modelica.SIunits.Inductance Lssigma = 0.0055 "Stator stray inductance " 
        annotation (Dialog(tab = "Permanent magnet synchronous induction machine", group = "Nominal resistances and inductances per phase of the permanent magnet synchronous induction machine"));
      parameter Modelica.SIunits.Inductance Lmd = 0.00468 "d轴电感值" 
        annotation (Dialog(tab = "Permanent magnet synchronous induction machine", group = "Nominal resistances and inductances per phase of the permanent magnet synchronous induction machine"));
      parameter Modelica.SIunits.Inductance Lmq = 0.0095 "q轴电感值" 
        annotation (Dialog(tab = "Permanent magnet synchronous induction machine", group = "Nominal resistances and inductances per phase of the permanent magnet synchronous induction machine"));
      //-------------------------------------------------------------------------------------------
      //references and limits
      parameter Modelica.SIunits.Voltage vMachineMax = 380 "Maximum phase voltage of the machine (RMS value)" 
        annotation (Dialog(tab = "Permanent magnet synchronous induction machine", group = "Reference values and limits"));
      parameter Modelica.SIunits.Current iMachineMax = 13 "Maximum phase current of the machine (RMS value)" 
        annotation (Dialog(tab = "Permanent magnet synchronous induction machine", group = "Reference values and limits"));
      //---------------------------------------------------------------------------------------------
      //parameters of the load
      parameter Modelica.SIunits.Inertia J = 8.313e-7 "负载转动惯量" 
        annotation (Dialog(tab = "Load"));
      //-------------------------------------------------------------------------------------------
      // parameters of the battery
      parameter Modelica.SIunits.Voltage VCellNominal = 270 "额定电压值" 
        annotation (Dialog(tab = "Battery"));
      parameter Modelica.SIunits.Current ICellMax = 800 "Maximum admissable cell current" 
        annotation (Dialog(tab = "Battery"));
      parameter Modelica.SIunits.Resistance RsCell = 0.006 "Internal cell resistor" 
        annotation (Dialog(tab = "Battery"));
      parameter Integer nsBatt(min = 1) = 1 "Number of series connected cells" 
        annotation (Dialog(tab = "Battery"));
      parameter Integer npBatt(min = 1) = 1 "Number of parallel connected cells" 
        annotation (Dialog(tab = "Battery"));
      //----------------------------------------------------------------------------------------------
      // parameters of the converter
      parameter Modelica.SIunits.Current IConverterMax = 100 "Maximum admissible converter DC supply current" 
        annotation (Dialog(tab = "AC/DC converter"));
      //----------------------------------------------------------------------------------------------
      // parameters of the controller
      parameter Real kpdCurrent = 18.98631 "d轴电流增益值" 
        annotation (Dialog(tab = "Controllers", group = "Parameters of the current controller"));
      parameter Modelica.SIunits.Time TidCurrent = .593882 "Integral time constant of the stator current d-component" 
        annotation (Dialog(tab = "Controllers", group = "Parameters of the current controller"));
      parameter Real kpqCurrent = 11.12203 "Gain of the stator current q-component" 
        annotation (Dialog(tab = "Controllers", group = "Parameters of the current controller"));
      parameter Modelica.SIunits.Time TiqCurrent = .970152 "Integral time constant of the stator current q-component" 
        annotation (Dialog(tab = "Controllers", group = "Parameters of the current controller"));
      parameter Real kpSpeed = 381.763 "Gain" 
        annotation (Dialog(tab = "Controllers", group = "Parameters of the speed controller"));
      parameter Modelica.SIunits.Time TiSpeed = .929076 "Integral time constant" 
        annotation (Dialog(tab = "Controllers", group = "Parameters of the speed controller"));
      //----------------------------------------------------------------------------------------------
      annotation (
        Diagram(coordinateSystem(extent = {{-240.0, -200.0}, {300.0, 200.0}}, 
          preserveAspectRatio = false, 
          grid = {2.0, 2.0})), 
        Coordsys(extent = [-200, -200; 200, 200], scale = 0.1), 
        Icon(coordinateSystem(preserveAspectRatio = false, 
          extent = {{-200, -200}, {200, 200}})), 
        experiment(StartTime = 0, StopTime = 20, Interval = 0.0001, Algorithm = "Dassl", Tolerance = 1e-005, DoublePrecision = true));
      Modelica.Mechanics.Rotational.Sensors.AngleSensor angleSensor1
        annotation (extent = [76, 50; 56, 70], 
          Placement(transformation(origin = {130.0, 113.0}, 
            extent = {{18.0, -19.0}, {-18.0, 19.0}})));
      Modelica.Blocks.Math.Gain gain2(k = 70000)
        annotation (Placement(transformation(origin = {-65.0, -130.0}, 
          extent = {{10.0, -10.0}, {-10.0, 10.0}})));
      Modelica.Blocks.Nonlinear.Limiter limiter1(uMin = -2000, uMax = 2000)
        annotation (Placement(transformation(origin = {-159.0, -130.0}, 
          extent = {{-16.0, -16.0}, {16.0, 16.0}}, 
          rotation = 180.0)));
      Modelica.Blocks.Math.Feedback feedback1
        annotation (Placement(transformation(origin = {28.0, -130.0}, 
          extent = {{-15.0, -15.0}, {15.0, 15.0}}, 
          rotation = 180.0)));
      Mechanical.SubSystem.FeedSystemY feedSystem4_2(
        massWithStopAndFriction(F_Coulomb = 350))

        annotation (Placement(transformation(origin = {205.0, 15.0}, 
          extent = {{-55.0, -55.0}, {55.0, 55.0}})));
      Modelica.Blocks.Math.Gain gain3(k = 1 / 392.699)
        annotation (Placement(transformation(origin = {96.0, -52.0}, 
          extent = {{-18.0, -18.0}, {18.0, 18.0}}, 
          rotation = 270.0)));
      Modelica.Blocks.Sources.Sine sine1(amplitude = 0.1, freqHz = 1 / 6.3, phase = 0)
        annotation (Placement(transformation(origin = {150.0, -130.0}, 
          extent = {{30.0, -30.0}, {-30.0, 30.0}})));
      Modelica.Mechanics.Rotational.Sources.Torque torque
        annotation (Placement(transformation(origin = {5.5, 14.5}, 
          extent = {{-15.0, -15.0}, {15.0, 15.0}})));
      ControlBlocks.Drivers.CUnit4 cUnit4_1(kv = 30, Tv = 0.5)
        annotation (Placement(transformation(origin = {-77.75, 17.25}, 
          extent = {{-32.75, -32.75}, {32.75, 32.75}})));
      Modelica.Blocks.Sources.Constant const1(k = 0)
        annotation (Placement(transformation(origin = {-110.5, 70.5}, 
          extent = {{-10.0, -10.0}, {10.0, 10.0}})));
      Modelica.Mechanics.Rotational.Components.Inertia inertia(J = 8.7e-4)
        annotation (Placement(transformation(origin = {74.0, 16.0}, 
          extent = {{-12.5, -12.5}, {12.5, 12.5}})));
    equation 
      // w_in = der(pMSM.flange_a.phi);
      // power = w_in * tau;
      // I[:] = pMSM.plug_sp.pin[:].i;
      // tau = -pMSM.flange_a.tau;
      connect(gain2.y, limiter1.u)
        annotation (Line(origin = {-118.0, -105.0}, 
          points = {{42.0, -25.0}, {-22.0, -25.0}}, 
          color = {0, 0, 127}));
      connect(gain2.u, feedback1.y)
        annotation (Line(origin = {-60.0, -104.0}, 
          points = {{7.0, -26.0}, {74.0, -26.0}}, 
          color = {0, 0, 127}));
      connect(angleSensor1.phi, gain3.u)
        annotation (Line(origin = {89.0, 38.0}, 
          points = {{21.0, 75.0}, {7.0, 75.0}, {7.0, -68.0}}, 
          color = {0, 0, 127}));
      connect(gain3.y, feedback1.u2)
        annotation (Line(origin = {30.0, -76.0}, 
          points = {{66.0, 4.0}, {66.0, -24.0}, {-2.0, -24.0}, {-2.0, -42.0}}, 
          color = {0, 0, 127}));
      connect(sine1.y, feedback1.u1)
        annotation (Line(origin = {79.0, -130.0}, 
          points = {{38.0, 0.0}, {-39.0, 0.0}}, 
          color = {0, 0, 127}));
      connect(const1.y, cUnit4_1.u1)
        annotation (Line(origin = {-85.0, 69.0}, 
          points = {{-15.0, 2.0}, {8.0, 2.0}, {8.0, -17.0}}, 
          color = {0, 0, 127}));
      connect(angleSensor1.phi, cUnit4_1.phi)
        annotation (Line(origin = {15.0, 89.0}, 
          points = {{95.0, 24.0}, {-109.0, 24.0}, {-109.0, -39.0}}, 
          color = {0, 0, 127}));
      connect(torque.flange, inertia.flange_a)
        annotation (Line(origin = {42.0, 16.0}, 
          points = {{-21.0, -1.0}, {20.0, -1.0}, {20.0, 0.0}}));
      connect(inertia.flange_b, feedSystem4_2.flange_a)
        annotation (Line(origin = {117.0, 15.0}, 
          points = {{-30.0, 1.0}, {30.0, 1.0}, {30.0, -1.0}}));
      connect(cUnit4_1.y, torque.tau)
        annotation (Line(origin = {-32.0, 30.0}, 
          points = {{-15.0, -13.0}, {20.0, -13.0}, {20.0, -16.0}}, 
          color = {0, 0, 127}));
      connect(limiter1.y, cUnit4_1.speed)
        annotation (Line(origin = {-145.0, -57.0}, 
          points = {{-32.0, -73.0}, {-55.0, -73.0}, {-55.0, 74.0}, {35.0, 74.0}}, 
          color = {0, 0, 127}));
      connect(feedSystem4_2.flange_a, angleSensor1.flange)
        annotation (Line(origin = {148.0, 64.0}, 
          points = {{-1.0, -50.0}, {-1.0, -44.0}, {0.0, -44.0}, {0.0, 49.0}}));
    end E5_0218;

    model E6

      annotation (
        Diagram(coordinateSystem(extent = {{-320.0, -160.0}, {260.0, 160.0}}, 
          preserveAspectRatio = false, 
          grid = {2.0, 2.0})), Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
            preserveAspectRatio = false, 
            grid = {2.0, 2.0})), 
        experiment(StartTime = 0, StopTime = 11, NumberOfIntervals = 500, Algorithm = "Dassl", Tolerance = 0.0001, DoublePrecision = true, StoreEventValue = true));
      Mechanical.SubSystem.BGXY3 bGXY3_1
        annotation (Placement(transformation(origin = {99.5, -11.000000000000007}, 
          extent = {{-25.0, -25.0}, {25.0, 25.0}})));
      Modelica.Blocks.Sources.Sine sine3(amplitude = 0.15 * 100, phase = 1.5707963267949, freqHz = 0.1, offset = 0)
        annotation (Placement(transformation(origin = {-104.0, 3.999999999999993}, 
          extent = {{10.0, -10.0}, {-10.0, 10.0}}, 
          rotation = 180.0)));
      Modelica.Blocks.Sources.Sine sine4(amplitude = 0.15 * 100, phase = 0, freqHz = 0.1, offset = 0)
        annotation (Placement(transformation(origin = {-104.0, -26.000000000000014}, 
          extent = {{10.0, -10.0}, {-10.0, 10.0}}, 
          rotation = 180.0)));
      Modelica.Mechanics.Rotational.Sources.Position position
        annotation (Placement(transformation(origin = {4.0, 3.999999999999991}, 
          extent = {{-10.0, -10.0}, {10.0, 10.0}})));
      Modelica.Mechanics.Rotational.Sources.Position position1
        annotation (Placement(transformation(origin = {3.9999999999999982, -26.00000000000002}, 
          extent = {{-10.0, -10.0}, {10.0, 10.0}})));
    equation 
      connect(position1.flange, bGXY3_1.axis1)
        annotation (Line(origin = {45.0, -26.0}, 
          points = {{-31.0, 0.0}, {30.0, 0.0}}, 
          color = {0, 0, 0}));
      connect(position.flange, bGXY3_1.axis)
        annotation (Line(origin = {45.0, 4.0}, 
          points = {{-31.0, 0.0}, {30.0, 0.0}}, 
          color = {0, 0, 0}));
      connect(sine3.y, position.phi_ref)
        annotation (Line(origin = {-50.0, 4.0}, 
          points = {{-43.0, 0.0}, {42.0, 0.0}}, 
          color = {0, 0, 127}));
      connect(sine4.y, position1.phi_ref)
        annotation (Line(origin = {-50.0, -26.0}, 
          points = {{-43.0, 0.0}, {42.0, 0.0}}, 
          color = {0, 0, 127}));
    end E6;

  end Example;
end MachineToolDynamic;