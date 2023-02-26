1.
``` shell
ls {-a,-lh,-t,-c}
```

2.bash functions `marco` and `polo`

在任意路径可利用某一路径的script shell 更新当前配置文件
(利用函数自订命令)

``` SHELL
#!/usr/bin/env sh
# Program:
# save the current working directory in some manner.
# History:
# 2023/2/22
# PATH = /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/snap/bin:
# export PATH

 marco() {
     export MARCO=$(pwd)
 }
 polo() {
     cd "$MARCO"
 }
```

3.

``` Shell
# return value(error code)
# 遍历结构
# done
# output log: >> $HOME/example_history.log

```
- [x] 2023/2/26: while 判断结构问题(语法问题)

``` Shell
#!/usr/bin/env bash
# Program:
# capture the output(failure)n!=42
# History:
# 2023/02/26
n=$(( RANDOM % 100 ))
len=0

while [ "${n}" -ne "42" ]
do
    len=$[$len+1]
    n=$(( RANDOM % 100 ))
    $n >> test.log 2>> test.log
done

echo "The error was using magic numbers"
echo "Everything went according to plan"
echo "The run times is $len" >> test.log

```

4.
接受STDIN (标准输入)作为参数

管线命令与“连续下达命令”
- 仅会处理 standard output


- 创建专门测试环境（测试文件、测试路径)


5. recur

`find` flags:(选择-print0的理由)
man 手册对于-print0 相对于 -print的解释：（搜索文件中可能包含换行符，避免受其影响STDOUT结果)
>If you are piping the output of find into another program  and  there  is  the faintest possibility that the files which you are searching for might contain a  newline,  then  you should  seriously  consider  using the -print0 option instead of -print. 

对于 -print0的专门解释
> This allows file names that contain newlines or other types of white space to be correctly interpreted by programs that process the find output.  This option corresponds  to the -0 option of xargs.

xargs flags:(防止空格(Linux转移符号作用)影响)
> Input items are terminated by a null character instead of by whitespace, and the quotes and backslash are not special (every character is taken literally).  Disables the  end  of  file string,  which is treated like any other argument.  Useful when input items might contain white space, quote marks, or backslashes.  The GNU find -print0 option produces input suitable for this mode.

find -type f (regular file) 指定find program 搜寻类型
The difference between Block 
Regular file :https://www.computerhope.com/jargon/r/regular-file.htm

## blog
### 问题 requirements:
- 编写函数.sh文件在任意路径下可执行

### 根据鸟叔Linux的笔记补充：(操作系统不同，实际执行效果可能存在出入)
Shell scripts:
- 自动化管理
- 追踪与管理系统
	- 搜寻系统相关设置数据，代入各个服务的设置参数

开始下达指令：
`command [-options] parameter1 parameter2`
command 包括可执行文件
`\` 指令连续到下一行

bash环境中的变量（环境变量跟自订变量不同，通常以大写字符表示)
- 指令使用 > 指令变量
- $PATH变量对bash环境的影响：(command not found 执行原因)
	- 例如下达 ls 这个指令时，系统就是通过 PATH 这个变量里面的内容所记录的路径顺序来搜寻指令的 呢！如果在搜寻完 PATH 变量内的路径还找不到 ls 这个指令时， 就会在屏幕上显示“ command not found ”的错误讯息了

Shell script 中的变量:(自定变量应用)
```
username = /...
...$username...
$username...
```

EX1:利用反斜线(\) 跳脱特殊字符
``` Shell
micihelle@micihelle-virtual-machine:/usr/bin$ start=Hello\ world!
micihelle@micihelle-virtual-machine:/usr/bin$ echo $start
Hello world!
```

EX2:在环境变量 `PATH` 中 累加目录 `/home/micihelle` **(变量内容添加)**
![[Pasted image 20230222171733.png]]

EX3:父程序自订变量导出到子程序中应用(自定变量导成环境变量)

关于父程序和子程序的概念：
![[Pasted image 20230222183601.png]]
(在当前bash环境中下达的任何指令都是由这个 bash 所衍生出来的，下达的命令被称为子程序，子程序仅会继承父程序的环境变量，不会继承自订变量)

(2023/2/22:进入子bash环境与 在scipt 编写中导出变量环境的操作区别?)


关于本Shell的PID:`$`
目前这个 Shell 的线程代号：echo `$$`



指令下达问题
- 直接指令下达：shell.sh 文件必须要具备可读与可执行 （rx） 的权限
	- 绝对路径
	- 相对路径
	- 变量"PATH”功能
- 以 bash 程序来执行
（P600)

- [ ] 通过./shell.sh 执行.sh文件？（~bash环境配置文件)
- 相对路径与绝对路径的关系
	- 绝对路径由根目录/写起，主要考虑工作调度和Shell scipt过程中由于执行工作环境不同导致的问题
- alias 与 bash 的内置命令
- 指令搜寻顺序（一个命令如ls被下达时，到底是哪一个 ls 被拿来运行)(p525)


source（P530)~bash的环境配置文件
(利用 source 或小数点 （.） 都可以将配置文件的内容读进来目前的 shell 环境中,不需要登出即可更新配置文件的设置内容)
bash的环境配置文件

scipt执行方式的差异(source, sh script, ./script)


function 变量字符（程序段{}内)和Shell script变量字符（键盘输入)执行差异