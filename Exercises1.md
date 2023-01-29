
1.翻阅 program 文件手册：翻阅名为 `touch`的 program文件手册
``` Shell
man <touch>
```
1.1 创建路径

```shell
micihelle@micihelle-virtual-machine:/tmp$ mkdir missing
```

2.利用 `touch` program 创建file
``` Shell
micihelle@micihelle-virtual-machine:/tmp/missing$ touch semester
```

3.利用 `echo` 对 file 写入内容
``` Shell
echo #!/bin/sh > semester
echo curl --head --silent https://missing.csail.mit.edu > semester
```
(对 Shell 执行的声明)


4.键入脚本路径，并执行文件

``` Shell
micihelle@micihelle-virtual-machine:/tmp/missing$ ./semester
bash: ./semester: Permission denied
```
（"./"表示当前目录，在当前目录下执行文件程序)

5.通过 `ls -l` 查阅 ./semester 的文件权限情况(无执行权限 `x`)
``` Shell
micihelle@micihelle-virtual-machine:/tmp/missing$ ls -l ./semester 
-rw-rw-r-- 1 micihelle micihelle 51  1月 12 21:43 ./semester
```


6.starting the `sh` interpreter,
``` shell
micihelle@micihelle-virtual-machine:/tmp/missing$ sh /tmp/missing/semester
/tmp/missing/semester: 1: curl: not found
```

6.1 curl包的安装(前面写入的文件程序执行报错)
``` shell
sudo apt-get update
sudo apt-get install curl
```

6.2 log
``` shell
micihelle@micihelle-virtual-machine:/tmp/missing$ sh /tmp/missing/semester
HTTP/2 200 
server: GitHub.com
content-type: text/html; charset=utf-8
last-modified: Tue, 10 Jan 2023 13:56:01 GMT
access-control-allow-origin: *
etag: "63bd6e71-1f37"
expires: Fri, 27 Jan 2023 03:29:41 GMT
cache-control: max-age=600
x-proxy-cache: MISS
x-github-request-id: 7FE2:6ADC:A95AA:D8AE7:63D342CD
accept-ranges: bytes
date: Fri, 27 Jan 2023 03:23:46 GMT
via: 1.1 varnish
age: 245
x-served-by: cache-hkg17933-HKG
x-cache: HIT
x-cache-hits: 1
x-timer: S1674789827.974020,VS0,VE1
vary: Accept-Encoding
x-fastly-request-id: f1495d0ce51f038b84b04f80ad700213b4e7029f
content-length: 7991

```

7.关于利用 the `sh` interpreter 可执行，但是 `./semester` 不可执行的原因：

sh + 脚本名称 命令行实际意义：将 `semester.sh` 作为一个参数传给 `sh(bash)`命令来执行，相当于在当前的父 shell中生成一个子shell来运行脚本文件,即不是由`semester.sh` 自己来执行，而是被调用执行。

(使用命令执行文件可跳过文件本身的执行权限)


8.利用 `chmod` program 赋予脚本文件执行权限
``` Shell
chmod -c +x semester
```
(文件不可执行解决方案)

8.1 log
``` shell
micihelle@micihelle-virtual-machine:/tmp/missing$ ./semester
HTTP/2 200 
server: GitHub.com
content-type: text/html; charset=utf-8
last-modified: Tue, 10 Jan 2023 13:56:01 GMT
access-control-allow-origin: *
etag: "63bd6e71-1f37"
expires: Fri, 27 Jan 2023 03:29:41 GMT
cache-control: max-age=600
x-proxy-cache: MISS
x-github-request-id: 7FE2:6ADC:A95AA:D8AE7:63D342CD
accept-ranges: bytes
date: Fri, 27 Jan 2023 04:21:42 GMT
via: 1.1 varnish
age: 0
x-served-by: cache-hkg17932-HKG
x-cache: HIT
x-cache-hits: 1
x-timer: S1674793302.127153,VS0,VE267
vary: Accept-Encoding
x-fastly-request-id: 52eddca67be400766771b954f2203783464bf103
content-length: 7991

```

9.`sh` 解释器如何知道脚本文件可被执行
[shebang]https://en.wikipedia.org/wiki/Shebang_(Unix)
(文件的声明)(解释器指令)
- `#!interpreter` [optional-arg]
- `#!/bin/sh` – Execute the file using the Bourne shell, or a compatible shell, assumed to be in the /bin directory
- `#!/bin/bash` – Execute the file using the Bash shell


10.编写脚本生成日志文件
(将可执行脚本文件的某一行信息进行结果输出)
``` shell
sudo ./semester | sed -n "4,4p" > last-modified.txt

sudo ./semester | tail -n  +4 > last-modified.txt
```
(Hint: `tail` program )**2023/1/27 思路衔接**


11.编写脚本文件输出laptop battery’s power level 和 desktop machine’s CPU temperature信息

solution：由于设备原因不好查阅对应的文件
[不同设备Linux查看CPU温度](https://www.jianshu.com/p/fcbdebbe7b3f)

sysfs文件系统驱动Linux_Kernel

 [使用`sysfs`文件系统驱动Linux_Kernel](http://je8a5.cn/whQ4d)
/sys/devices/cpu/power$

## idea
- [x]  1. `./semester`?  line6(2023/1/12)
声明与调用在计算机科学发展中的体现：
- Linux shell 脚本语言
- python 等高级语言

## 相关内容补充

- program位置查找:查找名为 `touch`的program
    ``` Shell
    whereis <>
    ```
- 关于 Bash 中"引用"的说明
- 文件权限信息列表格式说明 `ls -l file`
多次排列？:
``` shell
micihelle@micihelle-virtual-machine:/tmp/missing$ chmod -c +x semester
mode of 'semester' changed from 0664 (rw-rw-r--) to 0775 (rwxrwxr-x)
```
- 执行脚本文件的多种方式
[https://blog.csdn.net/qq_37699336/article/details/80724700]
- 关于Sh中的操作符> Connecting programs

## Summary
后续思路：关于`sysfs`文件系统与硬件驱动问题 >> 嵌入式开发技术主题
