# README

Usage:
**convert**
```bash
cd /home/tongyuan/文档/MWORKS/Minfer/converter
vim convert.sh
#修改servowing.mindir模型名称和转换后的模型名称servowing.ms，修改完成后保存关闭
bash convert.sh
#运行完毕后会在/home/tongyuan/文档/MWORKS/Minfer/model下生成.ms文件
```
**第一次需手动编译！**
**build**
```bash
cd /home/tongyuan/文档/MWORKS/Minfer/build
vim build.sh
#修改servowing.mindir模型名称，修改完成后保存关闭
gcc main.c -o build.out
./build.out 4 24 
#4为输入维度，24为输出维度
#编译完成后会生成out文件夹用于推理
```
**infer**
```bash
cd /home/tongyuan/文档/MWORKS/Minfer/infer
vim infer.sh
#修改servowing.mindir模型名称，修改完成后保存关闭
#在sysplorer中编写模型，外部C函数路径为：/home/tongyuan/文档/MWORKS/Minfer/infer/main.c
```
