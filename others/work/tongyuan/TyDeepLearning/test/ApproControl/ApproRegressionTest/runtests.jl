using Test

tests = [
    "regression",
    "plotregression",
    "train",
    "fitnet",
    "feedforwardnet",
    "roc",
    "plotperform",
    "ploterrhist",
	"plottrainstate",
	"resetState",
	"patternnet"
]

println("Runing tests:")
for t in tests
    fp = "$(t).jl"
    println("* $fp ...")
    include(fp)
end
