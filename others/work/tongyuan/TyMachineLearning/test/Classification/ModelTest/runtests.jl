using Test

tests = [
    "计算和绘制对一个变量的部分相关性",
    "识别交叉验证分区中的测试索引",
    "为多个类创建部分相关性图",
    "估计交叉验证的分类错误",
    "交叉验证SVM分类器",
    "使用交叉验证预测观测分类",
    "矩阵中的预测变量排名",
    "创建混淆矩阵图",
    "展示混淆矩阵",
    "绘制用于分类的ROC曲线",
]

println("Runing tests:")
for t in tests
    fp = "$(t).jl"
    println("* $fp ...")
    include(fp)
end
