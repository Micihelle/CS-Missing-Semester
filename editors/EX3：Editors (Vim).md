
## 1.vimtutor

```bash
./vimtutor
```

感觉比较贴近个人习惯的几个MOTION：

`0`: Move to the start of the line.

`1w`: Move the cursor one word forward.

`x` → `u` → `CTRL-R`

处处都是UNIX哲学

刚刚删除的内容会被暂存到VIM-reg里面，这个时候可以使用`p`来粘贴到其他地方..

`s` (SUBSTITUTE)

```bash
  4. To substitute new for the first old in a line type    :s/old/new
     To substitute new for all 'old's on a line type       :s/old/new/g
     To substitute phrases between two line #'s type       :#,#s/old/new/g
     To substitute all occurrences in the file type        :%s/old/new/g
     To ask for confirmation each time add 'c'             :%s/old/new/gc
```

EXECUTE AN EXTERNAL COMMAND（暂时还不知道怎么保存上一次的阅读记录呢？）

```bash
:! ls
micihelle@micihelle-BOD-WXX9:~/Templates/CS-Missing-Semester$ vimtutor 

[No write since last change]
 bashlab   EX1	 EX2  'EX3:Editors (Vim).md'   README.md

Press ENTER or type command to continue

```

文件之间文本的复制粘贴操作：Lesson 5.3 && Lesson 5.4

`o` :THE OPEN COMMAND  (大小写分别对应不同的方向)

SET OPTION：

- 忽视大小写  `:set ic`  (Ignore case)(lowercase or ..)
- ..

## 2.new config for Vim

:v

## 遗留问题

问题：能否巴拉一下VIM里面关于MOTION的一些源代码？比如2w，3e这样的。是不是可以自己用shell写个像vim这样的编辑器？