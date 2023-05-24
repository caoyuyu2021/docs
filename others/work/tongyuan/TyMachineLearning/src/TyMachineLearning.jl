module TyMachineLearning

include("Cluster/AgglomerativeCluster.jl")
include("Cluster/KCluster.jl")
include("Cluster/DBSCAN.jl")
include("Cluster/SpectralCluster.jl")
include("Cluster/KnnCluster.jl")
include("Cluster/View.jl")
include("Cluster/HMM.jl")
include("Cluster/AnomalyDetection.jl")
include("Cluster/GMMcluster.jl")
include("Regression/MLR.jl")
include("Regression/NLR.jl")
include("Regression/SVM.jl")
include("Regression/RTree.jl")
include("Regression/GPR.jl")
include("Regression/RidgeR.jl")
include("Regression/LassoR.jl")
include("Regression/ModelCE.jl")
include("Regression/GLM.jl")
include("Regression/RegressionEnsemble.jl")
include("Regression/NeuralNetworks.jl")
include("Classification/Model.jl")
include("Classification/DecisionTree.jl")
include("Classification/DiscriminantAnalysis.jl")
include("Classification/NaiveBayes.jl")
include("Classification/KNN.jl")
include("Classification/SVM.jl")
include("Classification/ECOC.jl")
include("Classification/SemiSupervised.jl")
include("Classification/ClassifierEnsemble.jl")
include("Classification/NeuralNetworks.jl")
include("DimReduction/MultiAnadis.jl")
include("DimReduction/FacRot.jl")
include("DimReduction/NMF.jl")
include("DimReduction/FeatureExtraction.jl")
include("DimReduction/ProcrustesAnalysis.jl")
include("DimReduction/PcaCorr.jl")
include("DimReduction/Manifold.jl")
include("IndustrialStatistics/SPC.jl")
include("IndustrialStatistics/SurvivalTimeDataAnalysis.jl")
include("IndustrialStatistics/DOE.jl")

const _EXCLUDE_SYMBOLS = [Symbol(@__MODULE__), :eval, :include]

for sym in names(@__MODULE__; all=true)
    sym_string = string(sym)
    if sym in _EXCLUDE_SYMBOLS ||
        startswith(sym_string, "_") ||
        startswith(sym_string, "@_")
        continue
    end
    if !(
        Base.isidentifier(sym) ||
        (startswith(sym_string, "@") && Base.isidentifier(sym_string[2:end]))
    )
        continue
    end
    @eval export $sym
end

end # module
