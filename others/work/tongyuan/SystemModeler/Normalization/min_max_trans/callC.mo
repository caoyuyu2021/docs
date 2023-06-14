within SystemModeler.Normalization.min_max_trans;
function callC
  input Integer input_column;
  input Integer output_column;
  input Real a[6];
  output Real arr[6];
external "C" min_max_transpose(input_column, output_column, a, arr)
annotation (Include = "#include\"min_max.c\"", 
  IncludeDirectory = "modelica://SystemModeler/../Normalization/min_max_trans");
end callC;