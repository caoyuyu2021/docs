using TOML
using Pkg

function DigitDatasetTrainData(file)
    py"""
    from Dataset_M import DigitDatasetTrainData
    """
    py"DigitDatasetTrainData"(file)
end

function DigitDatasetTestData(file)
    py"""
    from Dataset_M import DigitDatasetTestData
    """
    py"DigitDatasetTestData"(file)
end

function DigitDataset()
    py"""
    from Dataset_M import DigitDataset
    """
    py"DigitDataset"()
end

function DigitTrain4DArrayData(file)
    py"""
    from Dataset_M import DigitTrain4DArrayData
    """
    py"DigitTrain4DArrayData"(file)
end

function DigitTest4DArrayData(file)
    py"""
    from Dataset_M import DigitTest4DArrayData
    """
    py"DigitTest4DArrayData"(file)
end

function simplefit_dataset(file)
    py"""
    from Dataset_M import simplefit_dataset
    """
    py"simplefit_dataset"(file)
end

function VPR_dataset(sr = 1000)
    py"""
    from Dataset_M import VPR_dataset
    """
    py"VPR_dataset"(sr)
end

function iris_dataset(file)
    input_path = file * "/irisInputs.csv"
    target_path = file * "/irisTargets.csv"
    input = CSV.read(input_path, DataFrame; header=false)
    target = CSV.read(target_path, DataFrame; header=false)
    x = Array(input)
    t = Array(target)
    t = reshape(t, size(t, 1))
    return x, t
end

function dataset_dir(name::String)
    d = TOML.parsefile(joinpath(pkgdir(TyDeepLearning), "Artifacts.toml"))
    name = "$(name)_dataset"
    if haskey(d, name)
        sha = Base.SHA1(d[name]["git-tree-sha1"])
        Pkg.Artifacts.ensure_artifact_installed(name, joinpath(pkgdir(TyDeepLearning), "Artifacts.toml"))
        path = Pkg.Artifacts.artifact_path(sha)
        return path
    else
        error("No such dataset: $name")
    end
end
