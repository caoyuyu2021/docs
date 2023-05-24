using TyDeepLearning
file = joinpath(dataset_dir("flights"), "flights.csv")
data = CSV.read(file, DataFrame)
data = data[:, 3]

function minmaxscale(data)
    data_max, _ = findmax(data)
    data_min, _ = findmin(data)
    data = (data .- data_min) ./ (data_max - data_min)
    return data, data_max, data_min
end

data, data_max, data_min = minmaxscale(data)

train_data = data[1:96]
test_data = data[97:144]

function create_datasets(data, t_window)
    out_seq = data[1:(1 + t_window - 1)]'
    target = data[1 + t_window]
    L = size(data)[1]
    for i in range(2, L - t_window)
        train_seq = data[i:(i + t_window - 1)]'
        train_label = data[i + t_window]
        out_seq = vcat(out_seq, train_seq)
        target = vcat(target, train_label)
    end
    return out_seq, target
end

train_window = 3
train_out_seq, train_target = create_datasets(train_data, train_window)

layers = SequentialCell([
    lstmLayer(1, 200; NumLayers=2, Batch_First=true),
    flattenLayer(),
    fullyConnectedLayer(train_window * 200, 1),
])

options = trainingOptions("MSELoss", "Adam", "MSE", 1, 100, 0.001; Plots=true)

train_target_normalized = train_target
train_out_seq_normalized = train_out_seq
train_outseq_normalized = reshape(
    train_out_seq_normalized, (1, size(train_out_seq_normalized)...)
)
train_outseq_normalized = permutedims(train_outseq_normalized, (2, 3, 1))
traintarget_normalized = reshape(
    train_target_normalized, (size(train_target_normalized)[1], 1)
)

net = trainNetwork(train_outseq_normalized, traintarget_normalized, layers, options)