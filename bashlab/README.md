**How to Debug Bash Scripts:**https://linuxconfig.org/how-to-debug-bash-scripts

## 记录
**traditional techniques: using assertions.**

```bash
  1 # Using Traditional Techniques                               
  2 echo "function_name(): value of \\$var is ${var}"
~                                                                
~                                                                
~                                       
```

```bash
micihelle@micihelle-BOD-WXX9:~/Templates$ source ./bash_debug.sh 
function_name(): value of \ is 
```

**-x -v options**

```bash
micihelle@micihelle-BOD-WXX9:~/Templates$ bash -x bash_debug.sh 
+ echo 'function_name(): value of \ is '
function_name(): value of \ is 

micihelle@micihelle-BOD-WXX9:~/Templates$ bash -v bash_debug.sh 
# Using Traditional Techniques
echo "function_name(): value of \\$var is ${var}"
function_name(): value of \ is 

micihelle@micihelle-BOD-WXX9:~/Templates$ bash -xv bash_debug.sh # Using Traditional Techniques
echo "function_name(): value of \\$var is ${var}"
+ echo 'function_name(): value of \ is '
function_name(): value of \ is 

```

**other Bash options (可以通过`set`命令来保持-x和 -v 启动）**

use the `set` command to turn on the Bash options ：-u （提供报错信息）

查看当前所有已经启用的选项，关闭某个选项：

```bash
micihelle@micihelle-BOD-WXX9:~/Templates$ echo $-
echo $-
himuvBHs
set +xvu
```

（在实际编写BASH脚本的时候，可以在某段代码块中设置选项，比如这样的设计）（不然每次TAB补全都会反馈一堆实际上在执行的命令行..虽然应该也可以专门设置，如果好奇实在发生了什么就试试-xv吧 还是很好用的）

```bash
  1 #!/bin/bash                                                                                                                                                                        
  2 
  3 read -p "Path to be added: " path
  4 
  5 set -xv
  6 if [ "$path" = "/home/mike/bin" ]; then
  7   echo $path >> $PATH
  8   echo "new path: $PATH"
  9 else
 10   echo "did not modify PATH"
 11 fi
 12 set +xv
```

```bash

micihelle@micihelle-BOD-WXX9:~/Templates$ source ./addpath.sh 
Path to be added: /home
if [ "$path" = "/home/mike/bin" ]; then
	echo $path >> $PATH
	echo "new path: $PATH"
else
	echo "did not modify PATH"
fi
++ '[' /home = /home/mike/bin ']'
++ echo 'did not modify PATH'
did not modify PATH
set +xv
++ set +xv

```

修改$path为path:  

- 这里能不能详细解释一下为什么是path而不是$path?

`read -p "Path to be added: " path` — 这里 `path` 是一个未定义的变量名，`read` 会将用户输入存储到 `path` 中。

`read -p "Path to be added: " $path` — 这里 `$path` 是一个带有 `$` 符号的变量，会导致 Bash 试图读取 `path` 变量的值，而不是将用户输入存储到 `path` 中。由于 `path` 还未被定义，这样会出错。

使用 `$` 的场景：引用一个变量的值时,这会输出 `path` 变量中存储的值。(详情参考MIT-MISSING-SEMESTER和鸟叔Linux私房菜）

```bash
echo $path
```

```bash
  
  1 #!/bin/bash                                                  
  2 
  3 read -p "Path to be added: " path
  4 
  5 if [ "$path" = "/home/mike/bin" ]; then
  6   echo $path >> $PATH
  7   echo "new path: $PATH"
  8 else
  9   echo "did not modify PATH"
 10 fi
 11 
```

```bash
micihelle@micihelle-BOD-WXX9:~/Templates$ bash -x ./addpath.sh 
+ read -p 'Path to be added: ' path
Path to be added: /home 
+ '[' /home = /home/mike/bin ']'
+ echo 'did not modify PATH'
did not modify PATH
```



```bash
  1 #!/bin/bash                                                                                                                                                                        
  2 
  3 for i in 1 2 3
  4 do
  5   echo $i $j
  6 done

```

```bash
micihelle@micihelle-BOD-WXX9:~/Templates$ bash -xu ./count.sh 
+ for i in 1 2 3
./count.sh: line 5: j: unbound variable

```

> As seasoned programmers will suggest, if your code is too complex to isolate suspicious blocks with these options then the real problem is that the code should be refactored. Overly complex code means bugs can be difficult to detect and maintenance can be time consuming and costly.
> 

建立SSH链接，整理一下笔记和代码：https://docs.github.com/en/authentication/connecting-to-github-with-ssh/using-ssh-agent-forwarding

## 遗留问题
- [ ] 学习一下bash编写中的重定向问题？ → MIT-MISSING-SEMESTER && 鸟叔Linux私房菜 && ysyx