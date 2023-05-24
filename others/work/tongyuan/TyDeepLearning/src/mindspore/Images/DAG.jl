function layerGraph(layers)
    return SequentialCell(layers)
end

function lgplot(lgraph)
    py"""
   from DAG_M import lgplot
   """
    py"lgplot"(lgraph)
end

function addLayers(lgraph, larray)
    for i in larray
        lgraph.insert_child_to_cell(i[1], i[2])
    end
    return lgraph
end

function removeLayers(lgraph, layerNames)
    py"""
    from DAG_M import removeLayers
    """
    py"removeLayers"(lgraph, layerNames)
end

function replaceLayer(lgraph, layerName, larray)
    py"""
    from DAG_M import replaceLayer
    """
    py"replaceLayer"(lgraph, layerName, larray)
end

function isequal(net1, net2)
    py"""
    from DAG_M import isequal
    """
    py"isequal"(net1, net2)
end

function isequaln(net1, net2)
    py"""
    from DAG_M import isequaln
    """
    py"isequaln"(net1, net2)
end
