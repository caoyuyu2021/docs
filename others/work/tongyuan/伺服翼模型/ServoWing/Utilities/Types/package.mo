within ServoWing.Utilities;
package Types "类型"
  extends Icons.TypePackage;
  type ForceConstant = Real(unit = "N/A") "力常数";
  type VoltageConstant = Real(unit = "V/(m/s)") "反电动势常数";
  type Angle = Real(final quantity = "角度", final unit = "rad", displayUnit = "deg");
end Types;