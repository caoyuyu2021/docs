using Test

tests = [
    "Cluster/AgglomerativeClusterTest/runtests",
    "Cluster/DBSCANTest/runtests",
    "Cluster/HMMTest/runtests",
    "Cluster/KClusterTest/runtests",
    "Cluster/KnnClusterTest/runtests",
    "Cluster/SpectralClusterTest/runtests",
    "Cluster/ViewTest/runtests",
    "Cluster/AnomalyDetectionTest/runtests",
    "Cluster/GMMTest/runtests",
    "Classification/DecisionTreeTest/runtests",
    "Classification/DiscriminantAnalysisTest/runtests",
    "Classification/KNNTest/runtests",
    "Classification/ModelTest/runtests",
    "Classification/NaiveBayesTest/runtests",
    "Classification/ECOCTest/runtests",
    "Classification/SemiSupervisedTest/runtests",
    "Classification/SVMTest/runtests",
    "Classification/ClassifierEnsembleTest/runtests",
    "Regression/MLRTest/runtests",
    "Regression/GLMTest/runtests",
    "DimReduction/FactoranRotTest/runtests",
    "DimReduction/MultiAnadisTest/runtests",
    "DimReduction/NMFTest/runtests",
    "DimReduction/PcaTest/runtests",
    "DimReduction/FeatureExtractionTest/runtests",
    "DimReduction/ProcrustesAnalysisTest/runtests",
    "DimReduction/ManifoldTest/runtests",
    "Regression/GPRTest/runtests",
    "Regression/LassoRTest/runtests",
    "Regression/ModelCETest/runtests",
    "Regression/NLRTest/runtests",
    "Regression/RidgeRTest/runtests",
    "Regression/RTreeTest/runtests",
    "Regression/SVMTest/runtests",
    "IndustrialStatistics/SPC/runtests",
    "IndustrialStatistics/SurvivalTimeDataAnalysis/runtests",
    "IndustrialStatistics/DOE/runtests",
]

println("Runing tests:")
for t in tests
    fp = "$(t).jl"
    println("* $fp ...")
    include(fp)
end

#include("Cluster/GMMTest/runtests.jl")
