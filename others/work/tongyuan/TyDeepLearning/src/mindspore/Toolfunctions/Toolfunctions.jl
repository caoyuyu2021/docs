function probability2classes(prob, classes)
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