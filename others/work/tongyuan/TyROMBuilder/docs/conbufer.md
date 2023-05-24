# conbufer
---
生成模型推理模板

## 语法

```julia
conbufer(input, output, path, name)
```

## 说明

conbufer(input, output, path, name)

生成由TyDeepLearning工具箱保存的.mindir格式的模型所需的推理模板Minfer。

## 示例
<div id="生成伺服翼模型推理模板" class="jump-target"></div>
<div class="details-box">
<details open><summary>生成伺服翼模型推理模板</summary></details>
<div class="details-content">

加载模型并生成模板，模型位于TyROMBuilder/examples中，模型名称为servowing.mindir。
``` julia
using TyROMBuilder
conbufer(4, 24, "C:/Users/Administrator/Desktop/TyROMBuilder/examples" ,"servowing.mindir")
```
结果如下：
``` dataframe
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
-- Configuring done (0.5s)
-- Generating done (0.0s)
-- Build files have been written to: C:/Users/Administrator/AppData/Local/Temp/out
[ 50%] Building CXX object CMakeFiles/main.dir/main.cc.obj
[100%] Linking CXX executable main.exe
[100%] Built target main
GENERATE TEMPLATE SUCCESS.
```

## 输入参数

<div id="input-模型特征维度" class="jump-target"></div>
<div class="details-box">
<details open>
<summary>input-模型特征维度<div>标量</div></summary>
</details>
<div class="details-content">

<div id="output-模型目标维度" class="jump-target"></div>
<div class="details-box">
<details open>
<summary>output-模型目标维度<div>标量</div></summary>
</details>
<div class="details-content">

<div id="path-模型保存路径" class="jump-target"></div>
<div class="details-box">
<details open>
<summary>path-模型保存路径<div>字符串</div></summary>
</details>
<div class="details-content">

<div id="name-模型保存名称" class="jump-target"></div>
<div class="details-box">
<details open>
<summary>name-模型保存名称<div>字符串</div></summary>
</details>
<div class="details-content">