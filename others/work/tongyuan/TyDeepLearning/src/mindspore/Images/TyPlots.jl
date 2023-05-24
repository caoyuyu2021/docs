using TyPlot
using CSV
using DataFrames
using StatsBase

function TrainPlots(options)
    #读取训练完成后的参数
    if Sys.iswindows()
        train_file = "C:/tmp/train_params.csv"
    elseif Sys.islinux()
        train_file = "/tmp/train_params.csv"
    end
    plot_train_params = CSV.read(train_file, DataFrame; header=false)
    #读取环境参数
    executionenvironment = options["executionenvironment"]
    if executionenvironment == "GPU"
        batch_train_param = plot_train_params[!, :Column1]
        loss_train_param = plot_train_params[!, :Column3]
        #绘制loss曲线
        figure()
        p = TyPlot.plot(batch_train_param, loss_train_param)
        grid("on")
        title("Training Progress")
        xlabel("Epoch")
        ylabel("Loss")
        legend(["Training", "Training(smoothed)"])
    else
        #分组平均
        plot_train_mean = combine(
            df -> DataFrame(; Column2=size(df, 1), Column3=mean(df[!, :Column3])),
            groupby(plot_train_params, :Column1),
        )
        #划分参数值
        epoch_train_mean_param = plot_train_mean[!, :Column1]
        batch_mean_param = mean(plot_train_mean[!, :Column2])
        loss_mean_param = plot_train_mean[!, :Column3]
        batch_train_param = plot_train_params[!, :Column2]
        loss_train_param = plot_train_params[!, :Column3]
        #绘制loss曲线
        figure()
        p = TyPlot.plot(
            batch_train_param,
            loss_train_param,
            "#ADD8E6",
            epoch_train_mean_param * batch_mean_param,
            loss_mean_param,
        )
        p[2].set_linewidth(1.2)
        grid("on")
        title("Training Progress")
        xlabel("Iteration")
        ylabel("Loss")
        legend(["Training", "Training(smoothed)"])
    end
end

function EvalPlots(options)
    """训练数据绘图"""
    #读取训练完成后的参数
    if Sys.iswindows()
        train_file = "C:/tmp/train_params.csv"
    elseif Sys.islinux()
        train_file = "/tmp/train_params.csv"
    end
    plot_train_params = CSV.read(train_file, DataFrame; header=false)
    #读取环境参数
    executionenvironment = options["executionenvironment"]
    if executionenvironment == "GPU"
        batch_train_param = plot_train_params[!, :Column1]
        loss_train_param = plot_train_params[!, :Column3]
        #绘制loss曲线
        figure()
        subplot(2, 1, 2)
        train_p = TyPlot.plot(batch_train_param, loss_train_param)
        grid("on")
        xlabel("Epoch")
        ylabel("Loss")
        legend(["Training", "Training(smoothed)"])
        """验证数据绘图"""
        metrics = options["metrics"]
        #读取训练完成后的参数
        if Sys.iswindows()
            eval_file = "C:/tmp/eval_params.csv"
        elseif Sys.islinux()
            eval_file = "/tmp/eval_params.csv"
        end
        plot_eval_params = CSV.read(eval_file, DataFrame; header=false)
        #重新拼接数据
        A = plot_train_params[!, 1]
        B = Matrix(plot_eval_params[!, 1:2])
        plot_eval_params = DataFrame([A B], :auto)
        batch_eval_param = plot_eval_params[!, :x1]
        loss_eval_param = plot_eval_params[!, :x3]
        #绘制eval曲线
        subplot(2, 1, 1)
        eval_p = TyPlot.plot(batch_eval_param, loss_eval_param, "#A2142F")
        grid("on")
        xlabel("Epoch")
        ylabel(metrics)
        title("Training and Validation Progress")
        legend(["Validation", "Validation(smoothed)"])
    else
        #分组平均
        plot_train_mean = combine(
            df -> DataFrame(; Column2=size(df, 1), Column3=mean(df[!, :Column3])),
            groupby(plot_train_params, :Column1),
        )
        #划分参数值
        epoch_train_mean_param = plot_train_mean[!, :Column1]
        batch_mean_param = mean(plot_train_mean[!, :Column2])
        loss_mean_param = plot_train_mean[!, :Column3]
        batch_train_param = plot_train_params[!, :Column2]
        loss_train_param = plot_train_params[!, :Column3]
        #绘制loss曲线
        figure()
        subplot(2, 1, 2)
        train_p = TyPlot.plot(
            batch_train_param,
            loss_train_param,
            "#FFDAB9",
            epoch_train_mean_param * batch_mean_param,
            loss_mean_param,
            "#A2142F",
        )
        train_p[2].set_linewidth(1.2)
        grid("on")
        xlabel("Iteration")
        ylabel("Loss")
        legend(["Training", "Training(smoothed)"])
        """验证数据绘图"""
        metrics = options["metrics"]
        #读取训练完成后的参数
        if Sys.iswindows()
            eval_file = "C:/tmp/eval_params.csv"
        elseif Sys.islinux()
            eval_file = "/tmp/eval_params.csv"
        end
        plot_eval_params = CSV.read(eval_file, DataFrame; header=false)
        #重新拼接数据
        A = plot_train_params[!, 1]
        B = Matrix(plot_eval_params[!, 1:2])
        plot_eval_params = DataFrame([A B], :auto)
        #分组平均
        plot_eval_mean = combine(
            df -> DataFrame(; x2=size(df, 1), x3=StatsBase.mean(df[!, :x3])),
            groupby(plot_eval_params, :x1),
        )
        #划分参数值
        epoch_eval_mean_param = plot_eval_mean[!, :x1]
        batch_mean_param = mean(plot_eval_mean[!, :x2])
        loss_mean_param = plot_eval_mean[!, :x3]
        batch_eval_param = plot_eval_params[!, :x2]
        loss_eval_param = plot_eval_params[!, :x3]
        #绘制eval曲线
        subplot(2, 1, 1)
        eval_p = TyPlot.plot(
            batch_eval_param,
            loss_eval_param,
            "#ADD8E6",
            epoch_eval_mean_param * batch_mean_param,
            loss_mean_param,
        )
        eval_p[2].set_linewidth(1.2)
        grid("on")
        xlabel("Iteration")
        ylabel(metrics)
        title("Training and Validation Progress")
        legend(["Validation", "Validation(smoothed)"])
    end
end

function FinalPlots(options)
    plots = options["plots"]
    eval_data = options["eval_data"]
    eval_label = options["eval_label"]
    if Sys.iswindows()
        eval_file = "C:/tmp/eval_params.csv"
    elseif Sys.islinux()
        eval_file = "/tmp/eval_params.csv"
    end
    if Sys.iswindows()
        train_file = "C:/tmp/train_params.csv"
    elseif Sys.islinux()
        train_file = "/tmp/train_params.csv"
    end

    if plots == true
        if eval_data !== nothing && eval_label !== nothing
            #eval曲线图
            EvalPlots(options)
            rm(train_file)
            rm(eval_file)
        else
            #loss曲线图
            TrainPlots(options)
            rm(train_file)
        end
    end
end

function PlotROC(fpr, tpr, n_classes)
    figure()
    hold("on")
    name = []
    for i in 1:n_classes
        TyPlot.plot(fpr[i], tpr[i])
        name1 = join(["Class", " ", string(i)])
        name = append!(name, [name1])
    end
    TyPlot.plot([0, 1], [0, 1])
    xlim([0, 1])
    ylim([0, 1.05])
    title("ROC")
    xlabel("False Positive Rate")
    ylabel("True Positive Rate")
    legend(name)
    hold("off")
    return legend(name)
end