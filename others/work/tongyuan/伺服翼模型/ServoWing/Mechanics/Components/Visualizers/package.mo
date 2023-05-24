within ServoWing.Mechanics.Components;
package Visualizers "可视化组件"
  extends Modelica.Icons.Package;
  import MB = Modelica.Mechanics.MultiBody;

  annotation (Documentation(info = "<html>
<p>This package provides common animation components which are not integrated in other components.</p>
</html>"));
  package Advanced
    extends Modelica.Icons.Package;
    model Arrows
      "Visualizing an arrow with variable size; all data have to be set as modifiers (see info layer)"

      input MB.Frames.Orientation R = MB.Frames.nullRotation()
        "Orientation object to rotate the planarWorld frame into the arrow frame" annotation (Dialog);
      input SI.Position r[3] = {0, 0, 0}
        "Position vector from origin of planarWorld frame to origin of arrow frame, resolved in planarWorld frame" 
        annotation (Dialog);
      input SI.Position r_tail[3] = {0, 0, 0}
        "Position vector from origin of arrow frame to arrow tail, resolved in arrow frame" 
        annotation (Dialog);
      input SI.Position r_head[3] = {0, 0, 0}
        "Position vector from arrow tail to the head of the arrow, resolved in arrow frame" 
        annotation (Dialog);
      input SI.Diameter diameter = planarWorld.defaultArrowDiameter
        "Diameter of arrow line" annotation (Dialog);
      input MB.Types.Color color = MB.Types.Defaults.ArrowColor
        "Color of arrow" 
        annotation (HideResult = true, Dialog(colorSelector = true));
      input MB.Types.SpecularCoefficient specularCoefficient = planarWorld.defaultSpecularCoefficient
        "Material property describing the reflecting of ambient light (= 0 means, that light is completely absorbed)" 
        annotation (HideResult = true, Dialog);
    protected 
      outer ServoWing.Mechanics.Components.PlanarWorld planarWorld;
      Internal.Arrow arrow(
        R = R, 
        r = r, 
        r_tail = r_tail, 
        r_head = r_head, 
        diameter = diameter, 
        color = color, 
        specularCoefficient = specularCoefficient) if planarWorld.enableAnimation;
      annotation (
        Documentation(info = "<html>
<p>
Model <b>Arrow</b> defines an arrow that is dynamically
visualized at the defined location (see variables below).
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Visualizers/Arrow.png\" ALT=\"model Visualizers.Advanced.Arrow\">
</p>

<p>
The variables under heading <b>Parameters</b> below
are declared as (time varying) <b>input</b> variables.
If the default equation is not appropriate, a corresponding
modifier equation has to be provided in the
model where an <b>Arrow</b> instance is used, e.g., in the form
</p>
<blockquote><pre>
Visualizers.Advanced.Arrow arrow(diameter = sin(time));
</pre></blockquote>

<p>
Variable <b>color</b> is a RGB color space given in the range 0 .. 255.
The predefined type <a href=\"modelica://Ship.ShipBasic.Utilities.Types.Color\">Types.Color</a>
contains a menu definition of the colors used in the library</a>
(will be replaced by a color editor).
</p>
</html>"), 
        Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {
          100, 100}}), graphics = {
          Rectangle(
          extent = {{-100, 28}, {20, -30}}, 
          lineColor = {128, 128, 128}, 
          fillColor = {128, 128, 128}, 
          fillPattern = FillPattern.Solid), 
          Polygon(
          points = {{20, 60}, {100, 0}, {20, -60}, {20, 60}}, 
          lineColor = {128, 128, 128}, 
          fillColor = {128, 128, 128}, 
          fillPattern = FillPattern.Solid), 
          Text(
          extent = {{-150, 100}, {150, 60}}, 
          textString = "%name", 
          lineColor = {0, 0, 255})}));
    end Arrows;

    model DoubleArrow
      "Visualizing a double arrow with variable size; all data have to be set as modifiers (see info layer)"

      import Modelica.Mechanics.MultiBody.Types;
      import Modelica.Mechanics.MultiBody.Frames;
      import T = Modelica.Mechanics.MultiBody.Frames.TransformationMatrices;
      import Modelica.SIunits.Conversions.to_unit1;

      input Frames.Orientation R = Frames.nullRotation()
        "Orientation object to rotate the planarWorld frame into the arrow frame" annotation (Dialog);
      input SI.Position r[3] = {0, 0, 0}
        "Position vector from origin of planarWorld frame to origin of arrow frame, resolved in planarWorld frame" 
        annotation (Dialog);
      input SI.Position r_tail[3] = {0, 0, 0}
        "Position vector from origin of arrow frame to double arrow tail, resolved in arrow frame" 
        annotation (Dialog);
      input SI.Position r_head[3] = {0, 0, 0}
        "Position vector from double arrow tail to the head of the double arrow, resolved in arrow frame" 
        annotation (Dialog);
      input SI.Diameter diameter = planarWorld.defaultArrowDiameter
        "Diameter of arrow line" annotation (Dialog);
      input MB.Types.Color color = MB.Types.Defaults.ArrowColor
        "Color of double arrow" annotation (HideResult = true, Dialog(colorSelector = true));
      input MB.Types.SpecularCoefficient specularCoefficient = planarWorld.defaultSpecularCoefficient
        "Material property describing the reflecting of ambient light (= 0 means, that light is completely absorbed)" 
        annotation (HideResult = true, Dialog);
    protected 
      outer PlanarWorld planarWorld;
      SI.Length length = Modelica.Math.Vectors.length(r_head) "Length of arrow";
      Real e_x[3](each final unit = "1", start = {1, 0, 0}) = noEvent(if length < 1.e-10 then {1, 0, 0} else r_head / length);
      Real rxvisobj[3](each final unit = "1") = transpose(R.T) * e_x
        "X-axis unit vector of shape, resolved in planarWorld frame" 
        annotation (HideResult = true);
      SI.Position rvisobj[3] = r + T.resolve1(R.T, r_tail)
        "Position vector from planarWorld frame to shape frame, resolved in planarWorld frame" 
        annotation (HideResult = true);

      SI.Length headLength = noEvent(max(0, length - arrowLength))
        annotation (HideResult = true);
      SI.Length headWidth = noEvent(max(0, diameter * Types.Defaults.ArrowHeadWidthFraction))
        annotation (HideResult = true);
      SI.Length arrowLength = noEvent(max(0, length - 1.5 * diameter * Types.Defaults.ArrowHeadLengthFraction))
        annotation (HideResult = true);

      MB.Visualizers.Advanced.Shape arrowLine(
        length = arrowLength, 
        width = diameter, 
        height = diameter, 
        lengthDirection = to_unit1(r_head), 
        widthDirection = {0, 1, 0}, 
        shapeType = "cylinder", 
        color = color, 
        specularCoefficient = specularCoefficient, 
        r_shape = r_tail, 
        r = r, 
        R = R) if planarWorld.enableAnimation;
      MB.Visualizers.Advanced.Shape arrowHead1(
        length = 2 / 3 * headLength, 
        width = headWidth, 
        height = headWidth, 
        lengthDirection = to_unit1(r_head), 
        widthDirection = {0, 1, 0}, 
        shapeType = "cone", 
        color = color, 
        specularCoefficient = specularCoefficient, 
        r = rvisobj + rxvisobj * arrowLength, 
        R = R) if planarWorld.enableAnimation;
      MB.Visualizers.Advanced.Shape arrowHead2(
        length = 2 / 3 * headLength, 
        width = headWidth, 
        height = headWidth, 
        lengthDirection = to_unit1(r_head), 
        widthDirection = {0, 1, 0}, 
        shapeType = "cone", 
        color = color, 
        specularCoefficient = specularCoefficient, 
        r = rvisobj + rxvisobj * (arrowLength + headLength / 3), 
        R = R) if planarWorld.enableAnimation;

      annotation (
        Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {
          100, 100}}), graphics = {
          Rectangle(
          extent = {{-100, 28}, {0, -28}}, 
          lineColor = {128, 128, 128}, 
          fillColor = {128, 128, 128}, 
          fillPattern = FillPattern.Solid), 
          Polygon(
          points = {{40, 60}, {100, 0}, {40, -60}, {40, 60}}, 
          lineColor = {128, 128, 128}, 
          fillColor = {128, 128, 128}, 
          fillPattern = FillPattern.Solid), 
          Polygon(
          points = {{0, 60}, {60, 0}, {0, -60}, {0, 60}}, 
          lineColor = {128, 128, 128}, 
          fillColor = {128, 128, 128}, 
          fillPattern = FillPattern.Solid), 
          Text(
          extent = {{-150, 100}, {150, 60}}, 
          textString = "%name", 
          lineColor = {0, 0, 255})}), 
        Documentation(info = "<html>
<p>
Model <b>DoubleArrow</b> defines a double arrow that is dynamically
visualized at the defined location (see variables below).
</p>

<p>
<IMG src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Visualizers/DoubleArrow.png\" ALT=\"model Visualizers.Advanced.DoubleArrow\">
</p>

<p>
The variables under heading <b>Parameters</b> below
are declared as (time varying) <b>input</b> variables.
If the default equation is not appropriate, a corresponding
modifier equation has to be provided in the
model where an <b>Arrow</b> instance is used, e.g., in the form
</p>
<pre>
    Visualizers.Advanced.DoubleArrow doubleArrow(diameter = sin(time));
</pre>
<p>
Variable <b>color</b> is a RGB color space given in the range 0 .. 255.
The predefined type <a href=\"modelica://Ship.ShipBasic.Utilities.Types.Color\">Types.Color</a>
contains a menu definition of the colors used in the library</a>
(will be replaced by a color editor).
</p>
</html>"));
    end DoubleArrow;
    model CoordinateSystem
      "Visualizing an orthogonal coordinate system of three axes"

      input SI.Position r[3] = {0, 0, 0}
        "Position vector from origin of world frame to origin of object frame, resolved in world frame" 
        annotation (Dialog);
      input MB.Frames.Orientation R = MB.Frames.nullRotation()
        "Orientation object to rotate the world frame into the object frame" annotation (Dialog);
      input SI.Position r_shape[3] = {0, 0, 0}
        "Position vector from origin of object frame to shape origin, resolved in object frame" 
        annotation (Dialog);

      parameter SI.Length axisLength = planarWorld.nominalLength / 2
        "Length of world axes arrows";
      parameter SI.Diameter axisDiameter = axisLength / planarWorld.defaultFrameDiameterFraction
        "Diameter of world axes arrows";

      parameter MB.Types.Color color_x = MB.Types.Defaults.FrameColor
        "Color of x-arrow" 
        annotation (HideResult = true, Dialog(colorSelector = true));
      parameter MB.Types.Color color_y = color_x "Color of y-arrow" 
        annotation (HideResult = true, Dialog(colorSelector = true));
      parameter MB.Types.Color color_z = color_x "Color of z-arrow" 
        annotation (HideResult = true, Dialog(colorSelector = true));

      parameter Boolean axisShowLabels = true "True, if labels shall be shown" 
        annotation (HideResult = true, Dialog(group = "Axes labels"));
      parameter SI.Length labelStart = 1.05 * axisLength
        annotation (Dialog(group = "Axes labels", enable = axisShowLabels));
      parameter SI.Length scaledLabel = MB.Types.Defaults.FrameLabelHeightFraction * axisDiameter
        annotation (Dialog(group = "Axes labels", enable = axisShowLabels));
    protected 
      outer ServoWing.Mechanics.Components.PlanarWorld planarWorld;
      ServoWing.Mechanics.Components.Visualizers.Internal.CoordinateSystem coordinateSystem(
        final r = r, 
        final R = R, 
        final r_shape = r_shape, 
        final axisLength = axisLength, 
        final axisDiameter = axisDiameter, 
        final color_x = color_x, 
        final color_y = color_y, 
        final color_z = color_z, 
        final axisShowLabels = axisShowLabels, 
        final labelStart = labelStart, 
        final scaledLabel = scaledLabel) if planarWorld.enableAnimation;
      annotation (Documentation(info = "<html>
<p>
This element enbles visualization of an <b>orthogonal coordinate system</b>
as shown in the following picture.
</p>

<p>
<img src=\"modelica://PlanarMechanics/Resources/Images/CoordinateSystem.png\" ALT=\"model Visualizers.Advanced.CoordinateSystem\">
</p>

<p>
The variables <code>r</code>, <code>R</code> and <code>r_shape</code>
are declared as (time varying) <b>input</b> variables.
If the default equation is not appropriate, a corresponding
modifier equation has to be provided in the
model where a <b>CoordinateSystem</b> instance is used, e.g., in the form
</p>
<blockquote><pre>
PlanarMechanics.Visualizers.Advanced.CoordinateSystem coordinateSystem(r = {sin(time), 0, 0.3});
</pre></blockquote>

<p>
<b>Color</b> of each axis can be set individually using RGB color space given in the range 0 .. 255.
The predefined type <a href=\"modelica://Ship.ShipBasic.Utilities.Types.Color\">Types.Color</a>
contains a menu definition of the colors used in the library</a>
(will be replaced by a color editor).
</p>
</html>"), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, 
        {100, 100}}), graphics = {
        Text(
        extent = {{-150, 100}, {150, 60}}, 
        lineColor = {0, 0, 255}, 
        textString = "%name"), 
        Polygon(
        points = {{-50, -90}, {0, -72}, {50, -90}, {90, -70}, {26, -16}, {8, 40}, {-8, 40}, {-28, 
        -16}, {-90, -70}, {-50, -90}}, 
        lineColor = {255, 255, 255}, 
        smooth = Smooth.None, 
        fillColor = {255, 255, 255}, 
        fillPattern = FillPattern.Solid), 
        Line(
        points = {{0, -30}, {0, 40}}, 
        color = {135, 135, 135}, 
        thickness = 0.5), 
        Line(
        points = {{0, -30}, {74, -66}}, 
        color = {135, 135, 135}, 
        thickness = 0.5), 
        Line(
        points = {{-70, -66}, {0, -30}}, 
        thickness = 0.5, 
        color = {135, 135, 135}), 
        Text(
        extent = {{-69, -54}, {-20, -84}}, 
        lineColor = {135, 135, 135}, 
        fillColor = {135, 135, 135}, 
        fillPattern = FillPattern.Solid, 
        textString = "x"), 
        Polygon(
        points = {{-96, -80}, {-64, -72}, {-76, -58}, {-96, -80}}, 
        lineColor = {135, 135, 135}, 
        fillColor = {135, 135, 135}, 
        fillPattern = FillPattern.Solid), 
        Polygon(
        points = {{100, -82}, {76, -56}, {66, -72}, {100, -82}}, 
        lineColor = {135, 135, 135}, 
        fillColor = {135, 135, 135}, 
        fillPattern = FillPattern.Solid), 
        Text(
        extent = {{25, -54}, {74, -84}}, 
        lineColor = {135, 135, 135}, 
        fillColor = {135, 135, 135}, 
        fillPattern = FillPattern.Solid, 
        textString = "z"), 
        Text(
        extent = {{10, 60}, {61, 30}}, 
        lineColor = {135, 135, 135}, 
        fillColor = {135, 135, 135}, 
        fillPattern = FillPattern.Solid, 
        textString = "y"), 
        Polygon(
        points = {{-14, 22}, {14, 22}, {0, 62}, {-14, 22}}, 
        lineColor = {135, 135, 135}, 
        fillColor = {135, 135, 135}, 
        fillPattern = FillPattern.Solid)}));
    end CoordinateSystem;
  end Advanced;
  package Internal
    extends Modelica.Icons.Package;
    model Arrow
      "Visualizing an arrow with variable size; all data have to be set as modifiers (see info layer)"

      import T = Modelica.Mechanics.MultiBody.Frames.TransformationMatrices;
      import Modelica.SIunits.Conversions.to_unit1;

      input MB.Frames.Orientation R = MB.Frames.nullRotation()
        "Orientation object to rotate the planarWorld frame into the arrow frame" annotation (Dialog(enable = true));
      input SI.Position r[3] = {0, 0, 0}
        "Position vector from origin of planarWorld frame to origin of arrow frame, resolved in planarWorld frame" 
        annotation (Dialog(enable = true));
      input SI.Position r_tail[3] = {0, 0, 0}
        "Position vector from origin of arrow frame to arrow tail, resolved in arrow frame" 
        annotation (Dialog(enable = true));
      input SI.Position r_head[3] = {0, 0, 0}
        "Position vector from arrow tail to the head of the arrow, resolved in arrow frame" 
        annotation (Dialog(enable = true));
      input SI.Diameter diameter = 1 / 40 "Diameter of arrow line" 
        annotation (Dialog(enable = true));
      input MB.Types.Color color = MB.Types.Defaults.ArrowColor
        "Color of arrow" 
        annotation (HideResult = true, Dialog(colorSelector = true));
      input MB.Types.SpecularCoefficient specularCoefficient = 0.7
        "Material property describing the reflecting of ambient light (= 0 means, that light is completely absorbed)" 
        annotation (HideResult = true, Dialog(enable = true));
    protected 
      SI.Length length = Modelica.Math.Vectors.length(r_head) "Length of arrow";
      Real e_x[3](each final unit = "1", start = {1, 0, 0}) = noEvent(if length < 1.e-10 then {1, 0, 0} else r_head / length);
      Real rxvisobj[3](each final unit = "1") = transpose(R.T) * e_x
        "X-axis unit vector of shape, resolved in planarWorld frame" 
        annotation (HideResult = true);
      SI.Position rvisobj[3] = r + T.resolve1(R.T, r_tail)
        "Position vector from planarWorld frame to shape frame, resolved in planarWorld frame" 
        annotation (HideResult = true);

      SI.Length headLength = noEvent(max(0, length - arrowLength))
        annotation (HideResult = true);
      SI.Length headWidth = noEvent(max(0, diameter * MB.Types.Defaults.ArrowHeadWidthFraction))
        annotation (HideResult = true);
      SI.Length arrowLength = noEvent(max(0, length - diameter * MB.Types.Defaults.ArrowHeadLengthFraction))
        annotation (HideResult = true);

      MB.Visualizers.Advanced.Shape arrowLine(
        length = arrowLength, 
        width = diameter, 
        height = diameter, 
        lengthDirection = to_unit1(r_head), 
        widthDirection = {0, 1, 0}, 
        shapeType = "cylinder", 
        color = color, 
        specularCoefficient = specularCoefficient, 
        r_shape = r_tail, 
        r = r, 
        R = R);
      MB.Visualizers.Advanced.Shape arrowHead(
        length = headLength, 
        width = headWidth, 
        height = headWidth, 
        lengthDirection = to_unit1(r_head), 
        widthDirection = {0, 1, 0}, 
        shapeType = "cone", 
        color = color, 
        specularCoefficient = specularCoefficient, 
        r = rvisobj + rxvisobj * arrowLength, 
        R = R);

      annotation (
        Documentation(info = "<html>
<p>
<b>Note</b>: This element is intended to be used in <a href=\"PlanarMechanics.Visualizers.Internal.CoordinateSystem\">CoordinateSystem</a> only!
To visualize an arrow in your model, the best solution is usually to use the visualizer <a href=\"PlanarMechanics.Visualizers.Advanced.Arrow\">Advanced.Arrow</a>.
The only difference between this two visualizers is that the current one does not utilizes <b>outer planarWorld</b>, 
whereas the other does.
</p>
<p>
Model <b>Arrow</b> defines an arrow that is dynamically
visualized at the defined location (see variables below).
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Visualizers/Arrow.png\" ALT=\"model Visualizers.Advanced.Arrow\">
</p>

<p>
The variables under heading <b>Parameters</b> below
are declared as (time varying) <b>input</b> variables.
If the default equation is not appropriate, a corresponding
modifier equation has to be provided in the
model where an <b>Arrow</b> instance is used, e.g., in the form
</p>
<blockquote><pre>
Visualizers.Advanced.Arrow arrow(diameter = sin(time));
</pre></blockquote>

<p>
Variable <b>color</b> is a RGB color space given in the range 0 .. 255.
The predefined type <a href=\"modelica://Ship.ShipBasic.Utilities.Types.Color\">Types.Color</a>
contains a menu definition of the colors used in the library</a>
(will be replaced by a color editor).
</p>
</html>"), 
        Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {
          100, 100}}), graphics = {
          Rectangle(
          extent = {{-100, 28}, {20, -30}}, 
          lineColor = {128, 128, 128}, 
          fillColor = {128, 128, 128}, 
          fillPattern = FillPattern.Solid), 
          Polygon(
          points = {{20, 60}, {100, 0}, {20, -60}, {20, 60}}, 
          lineColor = {128, 128, 128}, 
          fillColor = {128, 128, 128}, 
          fillPattern = FillPattern.Solid), 
          Text(
          extent = {{-150, 100}, {150, 60}}, 
          textString = "%name", 
          lineColor = {0, 0, 255})}));
    end Arrow;
    model CoordinateSystem
      "Visualizing an orthogonal coordinate system of three axes"

      input SI.Position r[3] = {0, 0, 0}
        "Position vector from origin of world frame to origin of object frame, resolved in world frame" 
        annotation (Dialog);
      input MB.Frames.Orientation R = MB.Frames.nullRotation()
        "Orientation object to rotate the world frame into the object frame" annotation (Dialog);
      input SI.Position r_shape[3] = {0, 0, 0}
        "Position vector from origin of object frame to shape origin, resolved in object frame" 
        annotation (Dialog);

      parameter SI.Length axisLength = 0.5 "Length of world axes arrows";
      parameter SI.Diameter axisDiameter = axisLength / 40
        "Diameter of world axes arrows";

      parameter MB.Types.Color color_x = MB.Types.Defaults.FrameColor
        "Color of x-arrow" 
        annotation (HideResult = true, Dialog(colorSelector = true));
      parameter MB.Types.Color color_y = color_x "Color of y-arrow" 
        annotation (HideResult = true, Dialog(colorSelector = true));
      parameter MB.Types.Color color_z = color_x "Color of z-arrow" 
        annotation (HideResult = true, Dialog(colorSelector = true));

      parameter Boolean axisShowLabels = true "True, if labels shall be shown" 
        annotation (HideResult = true, Dialog(group = "Axes labels"));
      parameter SI.Length labelStart = 1.05 * axisLength
        annotation (Dialog(group = "Axes labels", enable = axisShowLabels));
      parameter SI.Length scaledLabel = MB.Types.Defaults.FrameLabelHeightFraction * axisDiameter
        annotation (Dialog(group = "Axes labels", enable = axisShowLabels));
    protected 
      Arrow x_arrow(
        R = R, 
        r = r, 
        r_tail = {0, 0, 0}, 
        r_head = axisLength * {1, 0, 0}, 
        diameter = axisDiameter, 
        color = color_x, 
        specularCoefficient = 0);
      MB.Visualizers.Internal.Lines x_label(
        R = R, 
        r = r, 
        r_lines = {labelStart, 0, 0}, 
        lines = scaledLabel * {[0, 0; 1, 1], [0, 1; 1, 0]}, 
        diameter = axisDiameter, 
        n_x = {1, 0, 0}, 
        n_y = {0, 1, 0}, 
        color = color_x, 
        specularCoefficient = 0) if axisShowLabels;
      Arrow y_arrow(
        R = R, 
        r = r, 
        r_tail = {0, 0, 0}, 
        r_head = axisLength * {0, 1, 0}, 
        diameter = axisDiameter, 
        color = color_y, 
        specularCoefficient = 0);
      MB.Visualizers.Internal.Lines y_label(
        R = R, 
        r = r, 
        r_lines = {0, labelStart, 0}, 
        lines = scaledLabel * {[0, 0; 1, 1.5], [0, 1.5; 0.5, 0.75]}, 
        diameter = axisDiameter, 
        n_x = {0, 1, 0}, 
        n_y = {-1, 0, 0}, 
        color = color_y, 
        specularCoefficient = 0) if axisShowLabels;
      Arrow z_arrow(
        R = R, 
        r = r, 
        r_tail = {0, 0, 0}, 
        r_head = axisLength * {0, 0, 1}, 
        diameter = axisDiameter, 
        color = color_z, 
        specularCoefficient = 0);
      MB.Visualizers.Internal.Lines z_label(
        R = R, 
        r = r, 
        r_lines = {0, 0, labelStart}, 
        lines = scaledLabel * {[0, 0; 1, 0], [0, 1; 1, 1], [0, 1; 1, 0]}, 
        diameter = axisDiameter, 
        n_x = {0, 0, 1}, 
        n_y = {0, 1, 0}, 
        color = color_z, 
        specularCoefficient = 0) if axisShowLabels;
      annotation (Documentation(info = "<html>
<p>
<b>Note</b>: This element is intended to be used in <a href=\"PlanarMechanics.PlanarWorld\">PlanarWorld</a> and its derivatives only!
To visualize a coordinate system in your model, the best solution is usually to use the visualizer <a href=\"PlanarMechanics.Visualizers.Advanced.CoordinateSystem\">Advanced.CoordinateSystem</a>.
The only difference between this two visualizers is that the current one does not utilizes <b>outer planarWorld</b>, 
whereas the other does.
</p>
<p>
This element enbles visualization of an <b>orthogonal coordinate system</b>
as shown in the following picture.
</p>

<p>
<img src=\"modelica://PlanarMechanics/Resources/Images/CoordinateSystem.png\" ALT=\"model Visualizers.Advanced.CoordinateSystem\">
</p>

<p>
The variables <code>r</code>, <code>R</code> and <code>r_shape</code>
are declared as (time varying) <b>input</b> variables.
If the default equation is not appropriate, a corresponding
modifier equation has to be provided in the
model where a <b>CoordinateSystem</b> instance is used, e.g., in the form
</p>
<blockquote><pre>
PlanarMechanics.Visualizers.Advanced.CoordinateSystem coordinateSystem(r = {sin(time), 0, 0.3});
</pre></blockquote>

<p>
<b>Color</b> of each axis can be set individually using RGB color space given in the range 0 .. 255.
The predefined type <a href=\"modelica://Ship.ShipBasic.Utilities.Types.Color\">Types.Color</a>
contains a menu definition of the colors used in the library</a>
(will be replaced by a color editor).
</p>
</html>"), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, 
        {100, 100}}), graphics = {
        Text(
        extent = {{-150, 100}, {150, 60}}, 
        lineColor = {0, 0, 255}, 
        textString = "%name"), 
        Polygon(
        points = {{-50, -90}, {0, -72}, {50, -90}, {90, -70}, {26, -16}, {8, 40}, {-8, 40}, {-28, 
        -16}, {-90, -70}, {-50, -90}}, 
        lineColor = {255, 255, 255}, 
        smooth = Smooth.None, 
        fillColor = {255, 255, 255}, 
        fillPattern = FillPattern.Solid), 
        Line(
        points = {{0, -30}, {0, 40}}, 
        color = {135, 135, 135}, 
        thickness = 0.5), 
        Line(
        points = {{0, -30}, {74, -66}}, 
        color = {135, 135, 135}, 
        thickness = 0.5), 
        Line(
        points = {{-70, -66}, {0, -30}}, 
        thickness = 0.5, 
        color = {135, 135, 135}), 
        Text(
        extent = {{-69, -54}, {-20, -84}}, 
        lineColor = {135, 135, 135}, 
        fillColor = {135, 135, 135}, 
        fillPattern = FillPattern.Solid, 
        textString = "x"), 
        Polygon(
        points = {{-96, -80}, {-64, -72}, {-76, -58}, {-96, -80}}, 
        lineColor = {135, 135, 135}, 
        fillColor = {135, 135, 135}, 
        fillPattern = FillPattern.Solid), 
        Polygon(
        points = {{100, -82}, {76, -56}, {66, -72}, {100, -82}}, 
        lineColor = {135, 135, 135}, 
        fillColor = {135, 135, 135}, 
        fillPattern = FillPattern.Solid), 
        Text(
        extent = {{25, -54}, {74, -84}}, 
        lineColor = {135, 135, 135}, 
        fillColor = {135, 135, 135}, 
        fillPattern = FillPattern.Solid, 
        textString = "z"), 
        Text(
        extent = {{10, 60}, {61, 30}}, 
        lineColor = {135, 135, 135}, 
        fillColor = {135, 135, 135}, 
        fillPattern = FillPattern.Solid, 
        textString = "y"), 
        Polygon(
        points = {{-14, 22}, {14, 22}, {0, 62}, {-14, 22}}, 
        lineColor = {135, 135, 135}, 
        fillColor = {135, 135, 135}, 
        fillPattern = FillPattern.Solid)}));
    end CoordinateSystem;
  end Internal;
end Visualizers;