## Preface

### How to use

aphoristic (格言)

Most books about programming give too many low-level details and examples, but fail at giving the reader a high-level feel for what is really going on. In this book, we prefer to err in the opposite direction.

### Chapter 1. Philosophy

#### Culture? What Culture?

software 快速发展, that technical cultures have been weak and ephemeral.

A very few software technologies have proved `durable` enough to evolve strong technical cultures, distinctive arts, and an associated design philosophy transmitted `across generations` of engineers.

The Unix culture is one of these. The Internet culture is another

#### The Durability of Unix

Unix also introduced both the now-ubiquitous tree-shaped file namespace with directory nodes and the pipeline for connecting programs.

覆盖大型机, PC, 嵌入式; 稳定.

#### The Case against Learning Unix Culture (反对 Unix 文化的例子)

Linux 和 BSD 等的崛起, 是打消对 UNIX 质疑的有力武器,
Chap 20 会介绍 UNIX 社区正努力解决 Unix 自身问题, 并重新掌握市场.

#### What Unix Gets Wrong

> “it is better to solve the right problem the wrong way than the wrong problem the right way”.
>
> -- Doug McIlroy

`mechanism, not policy`: look-and-feel (the policy)有终端用户自己 set.

* 这一缺点反而让 unix 更有生命力, 因为 policy 容易过时.

#### What Unix Gets Right

* Open-Source Software
* Cross-Platform Portability and Open Standards
  * 遍及各种端
  * 面向 software, API 统一: POSIX(Portable Operating System Interface)
* The Internet and the World Wide Web
* The Open-Source Community (开源社区)
  > This tradition of code-sharing depends heavily on hard-won expertise about how to make programs cooperative and reusable. And not by abstract theory, but through a lot of engineering `practice` — unobvious design `rules` that allow programs to function not just as isolated one-shot solutions(`一站式解决方案`) but as synergistic parts of a toolkit(`有机的工具箱`). A major purpose of this book is to elucidate those rules.(`本书的主要目的, 阐述这些rules`)
* Flexibility All the Way Down
  * 声称界面友好的 OS, 背后的 API 不易用.
  * UNIX 提供了众多程序粘合的手段.
* Unix Is Fun to Hack
* The Lessons of Unix Can Be Applied Elsewhere

#### Basics of the Unix Philosophy(简要)

> 金科玉律

* Each program 做好一件事. New job, 新开发, 而不是使 old code 变得更复杂
* 少用 Fancy algorithms: 易出 bug; n 很小时, 效率低
* Data dominates: 数据结构是 program 的核心,而非算法.

##### Rule of Modularity: Write simple parts connected by clean interfaces.

计算机编程的本质就是`控制复杂度`

* 吹得神乎其神的技术, 往往用处不大, 因为它们增加了复杂度

要编写复杂软件, 而不会一败涂地的唯一方法就是: `降低整体的复杂度, 接口连接简单的模块, 组成复杂的软件`

##### Rule of Clarity: Clarity is better than cleverness.

没必要为了一点点性能, 大幅度提升软件的复杂度.

* 不易维护, 易出 bug
* 晦涩的代码, 要有良好的注释

##### Rule of Composition: Design programs to be connected with other programs.

* Unix 并非不重视界面, 而是程序如果不采用简单的文本 io 流, 就会很难衔接
* 程序如果具有组合性,就要彼此独立
* 分离 interfaces from engines
  * Emacs: embedded Lisp interpreter(interface) to `control` editing primitives(engine) written in C
  * 前端实现 policy; 后端, mechanism. (chap 5&7)

##### Rule of Simplicity: Design for simplicity; add complexity only where you must.

> 设计要简单, 如无需要, 勿增加复杂度

The `only way` to avoid these traps is to encourage a software culture that knows that `small is beautiful`

##### Design for visibility to make inspection and debugging easier.

##### Rule of Robustness: Robustness is the child of transparency and simplicity.

软件的透明性,就是你一眼能看出是怎么回事

##### Rule of Representation: Fold knowledge into data, so program logic can be stupid and robust.

主要的把复杂度有 code,转移到 data 中去.

The C language's facility at manipulating pointers, in particular, has encouraged the use of dynamically-modified reference structures at all levels of coding from the kernel upward.(C 语言指针的易用性, 鼓励动态修改引用)

##### Rule of Least Surprise: In interface design, always do the least surprising thing.

避免标新立异, 如`+`代表`相加`

##### Rule of Silence: When a program has nothing surprising to say, it should say nothing.

简洁, 沉默是金. 不要浪费用户的注意力.

##### Rule of Optimization: Prototype before polishing. Get it working before you optimize it.

The Art Of Computer Programming: `Premature optimization is the root of all evil`

Kent Beck: `Make it run, then make it right, then make it fast`

#### The Unix Philosophy in One Lesson

**KISS**: `Keep It Simple, Stupid!`

#### Applying the Unix Philosophy

富有哲学的原则绝不是泛泛之谈, UNIX 中这些原则都来自实践, 并形成了具体的规定, 列举部分:

* 前(user interface)后端分离
* 只有当使用单一语言会增加复杂度时, 才会采用多语言编程.
* Small is beautiful. Write programs that do as little as is consistent with getting the job done.

#### Attitude Matters Too(态度决定一切)

* 发现`right thing`, do it ;不知道何是`right`,完成最小工作量即可, 直到发现.
* 良好的运用 unix 哲学, 你需要`loyal to excellence`

  * 你必须相信, 软件设计是一门艺术, 富有智慧和创造力.(专注, Everything 如此). 否则, 你永远做不出良好的设计.
  * 不要在该`think`时,急急忙忙编程

* 珍惜时间, 别人已经解决的问题, 拿来就用
* 软件设计应该是一种快乐的艺术(享受)
  * 当失去这种态度时, 需要静下来去`反省`,
  * 只为了 money, 为什么不去做其他的呢?

### Chapter 2. History

A Tale(故事) of Two Cultures

#### Origins and History of Unix, 1969-1995

往往由于版本迭代, 而不堪重负, 而倒塌.

Unix 从 Multics 的废墟中破茧而出.

##### Genesis: 1969–1971 (创世纪)

* Unix 1969 诞生出 Ken Thompson, 曾是 Multics 研究成员.

* Lisp 发明者 John McCarthy, 十年前首次发表分时系统构想, 1962 年才真正部署使用.

* Bell Lab 退出 Multics 研究. Ken Thompson 带着`build file system`idea, 在 PDP-7 上发明了 Unix

* Dennis Ritchie 及相关研究者, 习惯了在 Multics 在工作, 并不愿放弃这一能力. Unix 给了他们机会.

* Ritchie 需要的不只是编程环境, 更重要是一种 `fellowship`. 鼓励`close communication`

  * (pc: 推动 unix 产生的动力是`协作`, 现在我们研究的动力是`可信`?)
    > fellowship(伙伴)一直回响在 Unix 后续历史中.

* 支持 hosting game development on the `PDP-7` 的 `utility programs` 成为了 Unix 的核心.

  > UNICS (UNiplexed Information and Computing Service), 有些和 multics 唱反调的感觉.

* Unix 的第一个 real job 是`word processing` in Bell Lab

  * 开启了 unix 历史的另一个 theme: close association document-formatting, typesetting, and communications tools(与文本处理等密切相关)

* Doug McIlroy: `从来没听说职业竞争和保护法, 好东西太多了`

##### Exodus(大批离开): 1971–1980 (出埃及记)

* unix 最初有 asm 和 B 语言编写
  * 作为系统操作语言, 还不够强大. Dennis Ritchie 增加了 data types and structures
  * 1971 年发明了 C 语言
  * 1973 年重写了 Unix
    * 那是为了更高效利用硬件资源, 多数用 asm 开发, `系统可移植性`鲜为人知.
  * 1979 Ritchie: Unix 成功很大程度上来自于, 使用了`high-level language`,增加了可读性, modifiability, and portability
* 1974 年首次发表 paper 介绍 Unix, `constraint has encouraged not only economy, but also a certain elegance of design`(硬件的设计造就了经济型, 且使得设计简约)
  > pc: 性能不足, 硬件条件差, 并不能阻碍`创造有价值的东西`, 只要`发现正确的问题, 正确的解决之.`
* 现在公认第一个完全意义 Unix 是 1979 年的 V7 版本.

##### TCP/IP and the Unix Wars: 1980-1990

* 加州大学 Berkeley 分校, 1974 年就步入 Unix
  * Ken 75-76 在此授课
  * 77 年, Berkeley 毕业生 Bill Joy 管理的实验室发布了第一版 BSD,
  * vi
* 1980: DARPA 希望在 unix 环境下实现`TCP/IP`

  * ARPANET 和 unix 文化开始融合

* 1985, IEEE POSIX

  * 综合 BSD 出色的信号处理及作业控制, SVR3 的终端控制

Larry Wall's patch(1) tool, 打补丁, 开发 perl 语言

* 微软通知了桌面端

##### Blows against the Empire: 1991-1995

* Linux

#### Origins and History of the Hackers, 1961-1995

#### The Open-Source Movement: 1998 and Onward

#### The Lessons of Unix History
