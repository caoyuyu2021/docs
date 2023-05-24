# 使用softmaxLayer进行分类
using TyDeepLearning
file1 = joinpath(pwd(), "data/iris_dataset/irisInputs.csv")
file2 = joinpath(pwd(), "data/iris_dataset/irisTargets.csv")
data = CSV.read(file1, DataFrame; header=false)
label = CSV.read(file2, DataFrame; header=false)
train_data = Array(data)
target_data = Array(label)
net = trainSoftmaxLayer(train_data, target_data)
Y = TyDeepLearning.classify(net, train_data)
function preclasses(prob, classes)
    ypredclasses = []
    for i in eachindex(range(1, size(prob)[1]))
        maxindex = 0
        maxnum = 0
        for k in eachindex(classes)
            if prob[i, :][k] > maxnum
                maxnum = prob[i, :][k]
                maxindex = k
            end
        end
        ypredclasses = append!(ypredclasses, [unique(classes)[maxindex]])
    end
    return ypredclasses
end
classes = [i - 1 for i in range(1, 3)]
YPred = preclasses(Y, classes)
cm = confusionchart(target_data[:, 1], YPred)
