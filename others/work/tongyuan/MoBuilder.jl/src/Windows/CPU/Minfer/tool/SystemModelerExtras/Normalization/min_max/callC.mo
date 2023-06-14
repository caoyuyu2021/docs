within SystemModelerExtras.Normalization.min_max;
function callC
  input Integer input_column;
  input Integer output_column;
  input Real a[18];
  output Real arr[18];
external "C" min_max(input_column, output_column, a, arr)
annotation (Include = "#include\"min_max.c\"", 
  IncludeDirectory = "modelica://SystemModeler/../Normalization/min_max");
end callC;