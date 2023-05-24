using Test

tests = [
    "fminbndTest/runtests",
    "fminconTest/runtests",
    "fminimaxTest/runtests",
    "fminsearchTest/runtests",
    "fminuncTest/runtests",
    "fsolveTest/runtests",
    "fzeroTest/runtests",
    "intlinprogTest/runtests",
    "linprogTest/runtests",
    "lsqcurvefitTest/runtests",
    "lsqlinTest/runtests",
    "lsqnonlinTest/runtests",
    "lsqnonnegTest/runtests",
    "quadprogTest/runtests",
    "SolveTest/runtests"
]

println("Runing tests:")
for t in tests
    fp = "$(t).jl"
    println("* $fp ...")
    include(fp)
end
