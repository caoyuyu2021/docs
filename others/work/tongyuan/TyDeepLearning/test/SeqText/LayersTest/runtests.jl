using Test

tests = ["lstmLayer", "bilstmLayer", "flattenLayer", "gruLayer", "sequenceUnfoldingLayer"]

println("Runing tests:")
for t in tests
    fp = "$(t).jl"
    println("* $fp ...")
    include(fp)
end
