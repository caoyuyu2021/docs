within tool;
function callC
  input Integer input_column;
  input Integer output_column;
  input Real a[4];
  input String path;
  output Real arr[24];
external "C" input_data(input_column, output_column, a, arr, path)
annotation (Include = "#include\"main.c\"", 
  IncludeDirectory = "modelica://tool/../infer");
end callC;