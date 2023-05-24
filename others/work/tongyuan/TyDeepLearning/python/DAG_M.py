import networkx as nx
import matplotlib.pyplot as plt
import mindspore
import mindspore.nn as nn

def lgplot(lgraph):
    names = [item[0] for item in lgraph.cells_and_names() if item[0]]
    n = len(names)
    G = nx.complete_graph(n)
    node_list = sorted(G.nodes())
    pos = {}
    for node_i, node in enumerate(node_list):
        pos[node] = (4, (n-node_i)*8/n)

    labels = {}
    for i in range(n):
        labels[i] = names[i]

    # figsize is intentionally set small to condense the graph
    fig, ax = plt.subplots(figsize=(8, 8))
    margin = 0
    fig.subplots_adjust(margin, margin, 1. - margin, 1. - margin)
    ax.axis('equal')

    nx.draw(G, pos=pos, with_labels=False, ax=ax)
    description = nx.draw_networkx_labels(G, pos, labels=labels)

    r = fig.canvas.get_renderer()
    trans = plt.gca().transData.inverted()
    for node, t in description.items():
        bb = t.get_window_extent(renderer=r)
        bbdata = bb.transformed(trans)
        radius = 1.2 + bbdata.width / 2.
        position = (5, pos[node][1])
        t.set_position(position)
        t.set_clip_on(False)
    plt.show()

def removeLayers(lgraph, layerName):
    newlgraph = nn.SequentialCell()
    for item in lgraph.cells_and_names():
        if item[0]:
            if item[0] == layerName:
                pass
            else:
                newlgraph.insert_child_to_cell(item[0],item[1])
    return newlgraph
	
def replaceLayer(lgraph, layerName, larray):
    newlgraph = nn.SequentialCell()
    for item in lgraph.cells_and_names():
        if item[0]:
            if item[0] == layerName:
                for i in larray:
                    newlgraph.insert_child_to_cell(i[0],i[1])
            else:
                newlgraph.insert_child_to_cell(item[0],item[1])
    return newlgraph

def isequal(net1, net2):
    if len(net1.cells()) != len(net2.cells()):
        return False
    for item1, item2 in zip(net1.cells(), net2.cells()):
        if str(item1) != str(item2):
            return False
    return True


def isequaln(net1, net2):
    if len(net1.cells()) != len(net2.cells()):
        return False
    for item1, item2 in zip(net1.cells(), net2.cells()):
        if str(item1) != str(item2):
            return False
    return True


