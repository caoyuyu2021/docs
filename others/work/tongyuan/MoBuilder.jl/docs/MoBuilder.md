# Mo模板生成工具
---
生成基于MindSpore的深度学习模型推理模板 

Mo模板生成工具提供了一个用于生成由TyDeepLearning工具箱保存的.mindir格式的模型所需的推理模板Minfer，可将此模板直接用于Sysplorer中复杂系统机理数据融合、模型补偿等工作。

## 使用说明

### 环境要求
|软件环境|版本号|
|-|-|
|Windows|Windows 10、64位|
|[CMake](https://cmake.org/download/)|>= 3.18.3|
|[MinGW GCC](https://sourceforge.net/projects/mingw-w64/files/ToolchainstargettingWin64/PersonalBuilds/mingw-builds/7.3.0/threads-posix/seh/x86_64-7.3.0-release-posix-seh-rt_v5-rev0.7z/download)|= 7.3.0|
|MWORKS.Sysplorer 2023a|0.9.8800|
|MWORKS.Syslab 2023a|5.2.0.6826|

### 环境配置
- 手动下载[CMake](https://cmake.org/download/)，选择大于等于3.18.3的版本，下载后安装到本地，假设安装到D盘，并将其加入到系统环境变量当中，即将D:\CMake\bin加到系统变量当中。
- 手动下载[MinGW GCC](https://sourceforge.net/projects/mingw-w64/files/ToolchainstargettingWin64/PersonalBuilds/mingw-builds/7.3.0/threads-posix/seh/x86_64-7.3.0-release-posix-seh-rt_v5-rev0.7z/download)，选择MinGW-W64 GCC-7.3.0列表中的[x86_64-posix-seh](https://sourceforge.net/projects/mingw-w64/files/Toolchains targetting Win64/Personal Builds/mingw-builds/7.3.0/threads-posix/seh/x86_64-7.3.0-release-posix-seh-rt_v5-rev0.7z)，下载到本地后，解压到指定目录，假设为D盘，并将其加入到系统环境变量当中，即将D:\mingw64\bin加到系统环境变量中。

至此，CMake和MinGW GCC安装配置完成。

### 工具使用指南

- Syslab 2023a

在Syslab 2023a中激活工具，使用Syslab 2023a打开MoBuilder工具，在REPL中切换到包管理环境下(使用“]”符号切换)，激活环境。

```julia
activate .
```

编写自己的conbufer()函数，参数自由设置，可参考example目录下的conbuferexample.jl文件，conbufer()函数帮助文档位于docs中。

```julia
using MoBuilder
conbufer(4, 24, "C:/Users/Administrator/Desktop/MoBuilder/examples" ,"servowing.mindir")
```

运行编写完成的julia文件，等待模板生成。

``` 
CONVERT RESULT SUCCESS:0
-- The C compiler identification is GNU 7.3.0
-- The CXX compiler identification is GNU 7.3.0
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Check for working C compiler: D:/mingw64/bin/gcc.exe - skipped
-- Detecting C compile features
-- Detecting C compile features - done
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Check for working CXX compiler: D:/mingw64/bin/c++.exe - skipped
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- Configuring done (0.6s)
-- Generating done (0.0s)
-- Build files have been written to: C:/Users/Administrator/AppData/Local/Temp/out
[ 50%] Building CXX object CMakeFiles/main.dir/main.cc.obj
[100%] Linking CXX executable main.exe
[100%] Built target main
GENERATE TEMPLATE SUCCESS.
```
出现“GENERATE TEMPLATE SUCCESS.”则代表模板已生成，模板存放路径为模型存放相同路径，模板名称为Minfer，包含build、infer、tool文件，其中build和infer为模型推理依赖文件，为隐藏文件夹，tool为modelica推理文件。

- Sysplorer 2023a

在Sysplorer 2023a中打开模板Minfer/tool文件中的modelica包package.mo，此包为模型推理模板，该推理模板包含AIModel.mo、callC.mo、Icons.mo、package.mo。

1、 AIModel.mo为模型基本信息文件，如Minfer的路径发生更改，可在path参数中进行体现，input_column为输入特征维度，output_column为输出目标维度。
2、 callC.mo为外部C函数。
3、Icons.mo为模板图标。
4、package.mo为模板包。

在Sysplorer 2023a中打开用户需要进行机理数据融合的modelica文件，与模板进行链接，具体可参考example文件中的TestSystem02H3.mo文件。

在工具-选项-C编译器-选择编译器中选择内置Gcc，确定。

配置完成后，点击仿真，即可进行模型推理工作。

注：1、每次更换模型后，需重新加载Mo模板生成工具，以便重新生成新的模型所对应模板。

​        2、如需将模板添加到用户模型包中，建议将Minfer文件夹一起拖放过去，放到指定目录即可。

​        3、Sysplorer网络版许可：172.16.1.18:28123
