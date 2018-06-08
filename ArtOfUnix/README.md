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

- 这一缺点反而让 unix 更有生命力, 因为 policy 容易过时.

#### What Unix Gets Right

- Open-Source Software
- Cross-Platform Portability and Open Standards
  - 遍及各种端
  - 面向 software, API 统一: POSIX(Portable Operating System Interface)
- The Internet and the World Wide Web
- The Open-Source Community (开源社区)
  > This tradition of code-sharing depends heavily on hard-won expertise about how to make programs cooperative and reusable. And not by abstract theory, but through a lot of engineering `practice` — unobvious design `rules` that allow programs to function not just as isolated one-shot solutions(`一站式解决方案`) but as synergistic parts of a toolkit(`有机的工具箱`). A major purpose of this book is to elucidate those rules.(`本书的主要目的, 阐述这些rules`)
- Flexibility All the Way Down
  - 声称界面友好的 OS, 背后的 API 不易用.
  - UNIX 提供了众多程序粘合的手段.
- Unix Is Fun to Hack
- The Lessons of Unix Can Be Applied Elsewhere

#### Basics of the Unix Philosophy(简要)

> 金科玉律

- Each program 做好一件事. New job, 新开发, 而不是使 old code 变得更复杂
- 少用 Fancy algorithms: 易出 bug; n 很小时, 效率低
- Data dominates: 数据结构是 program 的核心,而非算法.

##### Rule of Modularity: Write simple parts connected by clean interfaces.

计算机编程的本质就是`控制复杂度`

- 吹得神乎其神的技术, 往往用处不大, 因为它们增加了复杂度

要编写复杂软件, 而不会一败涂地的唯一方法就是: `降低整体的复杂度, 接口连接简单的模块, 组成复杂的软件`

##### Rule of Clarity: Clarity is better than cleverness.

没必要为了一点点性能, 大幅度提升软件的复杂度.

- 不易维护, 易出 bug
- 晦涩的代码, 要有良好的注释

##### Rule of Composition: Design programs to be connected with other programs.

- Unix 并非不重视界面, 而是程序如果不采用简单的文本 io 流, 就会很难衔接
- 程序如果具有组合性,就要彼此独立
- 分离 interfaces from engines
  - Emacs: embedded Lisp interpreter(interface) to `control` editing primitives(engine) written in C
  - 前端实现 policy; 后端, mechanism. (chap 5&7)

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

- 前(user interface)后端分离
- 只有当使用单一语言会增加复杂度时, 才会采用多语言编程.
- Small is beautiful. Write programs that do as little as is consistent with getting the job done.

#### Attitude Matters Too(态度决定一切)

- 发现`right thing`, do it ;不知道何是`right`,完成最小工作量即可, 直到发现.
- 良好的运用 unix 哲学, 你需要`loyal to excellence`

  - 你必须相信, 软件设计是一门艺术, 富有智慧和创造力.(专注, Everything 如此). 否则, 你永远做不出良好的设计.
  - 不要在该`think`时,急急忙忙编程

- 珍惜时间, 别人已经解决的问题, 拿来就用
- 软件设计应该是一种快乐的艺术(享受)
  - 当失去这种态度时, 需要静下来去`反省`,
  - 只为了 money, 为什么不去做其他的呢?

### Chapter 2. History

A Tale(故事) of Two Cultures

#### Origins and History of Unix, 1969-1995

往往由于版本迭代, 而不堪重负, 而倒塌.

Unix 从 Multics 的废墟中破茧而出.

##### Genesis: 1969–1971 (创世纪)

- Unix 1969 诞生出 Ken Thompson, 曾是 Multics 研究成员.

- Lisp 发明者 John McCarthy, 十年前首次发表分时系统构想, 1962 年才真正部署使用.

- Bell Lab 退出 Multics 研究. Ken Thompson 带着`build file system`idea, 在 PDP-7 上发明了 Unix

- Dennis Ritchie 及相关研究者, 习惯了在 Multics 在工作, 并不愿放弃这一能力. Unix 给了他们机会.

- Ritchie 需要的不只是编程环境, 更重要是一种 `fellowship`. 鼓励`close communication`

  - (pc: 推动 unix 产生的动力是`协作`, 现在我们研究的动力是`可信`?)
    > fellowship(伙伴)一直回响在 Unix 后续历史中.

- 支持 hosting game development on the `PDP-7` 的 `utility programs` 成为了 Unix 的核心.

  > UNICS (UNiplexed Information and Computing Service), 有些和 multics 唱反调的感觉.

- Unix 的第一个 real job 是`word processing` in Bell Lab

  - 开启了 unix 历史的另一个 theme: close association document-formatting, typesetting, and communications tools(与文本处理等密切相关)

- Doug McIlroy: `从来没听说职业竞争和保护法, 好东西太多了`

##### Exodus(大批离开): 1971–1980 (出埃及记)

- unix 最初有 asm 和 B 语言编写
  - 作为系统操作语言, 还不够强大. Dennis Ritchie 增加了 data types and structures
  - 1971 年发明了 C 语言
  - 1973 年重写了 Unix
    - 那是为了更高效利用硬件资源, 多数用 asm 开发, `系统可移植性`鲜为人知.
  - 1979 Ritchie: Unix 成功很大程度上来自于, 使用了`high-level language`,增加了可读性, modifiability, and portability
- 1974 年首次发表 paper 介绍 Unix, `constraint has encouraged not only economy, but also a certain elegance of design`(硬件的设计造就了经济型, 且使得设计简约)
  > pc: 性能不足, 硬件条件差, 并不能阻碍`创造有价值的东西`, 只要`发现正确的问题, 正确的解决之.`
- 现在公认第一个完全意义 Unix 是 1979 年的 V7 版本.

##### TCP/IP and the Unix Wars: 1980-1990

- 加州大学 Berkeley 分校, 1974 年就步入 Unix
  - Ken 75-76 在此授课
  - 77 年, Berkeley 毕业生 Bill Joy 管理的实验室发布了第一版 BSD,
  - vi
- 1980: DARPA 希望在 unix 环境下实现`TCP/IP`

  - ARPANET 和 unix 文化开始融合

- 1985, IEEE POSIX

  - 综合 BSD 出色的信号处理及作业控制, SVR3 的终端控制

Larry Wall's patch(1) tool, 打补丁, 开发 perl 语言

- 微软通知了桌面端

##### Blows against the Empire: 1991-1995

- Linux

#### Origins and History of the Hackers, 1961-1995

RMS - Emacs 发明者

- 他的宣言暗含 abolition of intellectual-property rights(废除知识产权) in software; 撰写了 General Public License (GPL, 通用公共许可证)

GNU 创建十年, 但为开发出内核, 尽管 Emacs 和 gcc 是很好的工具

##### Linux and the Pragmatist Reaction: 1991-1998

linux Torvalds 认同自由软件更好, 但也接受专有软件. 这一点吸引了很多人.

> Torvalds's cheerful pragmatism and adept but low-key style catalyzed an astonishing string of victories for the hacker culture in the years 1993–1997

1995 年, 开源 web 服务器 Apache 成了 Linux 的`killer app(杀手级)`应用.

为什么 Linux 开发没有在前几年崩溃:

> 只要有足够人员关注, 所有 bug 都无处遁形. (“Given a sufficiently large number of eyeballs, all bugs are shallow”)

#### The Open-Source Movement: 1998 and Onward

到 1998 年 Mozzila 源码的公布时, hacker 社区更像一个松散部落群体.(IETE, BSD, Linux ..)
1998 年三月, 社团重要领导人峰会. 与会者基本代表了所有的主要部落, 确立了一个新的标记-`开源`

有一点例外, Richard Stallman and the Free Software Movement 与开源运动, 划清界限.

#### The Lessons of Unix History (Unix 的历史教训)

1.  unix 的历史中, 最大规律就是: 距开源越接近就越繁荣.

- 虽然我们在软件设计这个重要且狭窄的领域比其他人聪明, 但这并不能使我们摆脱对技术与经济相互作用影响的茫然. 即使 unix 社区最具洞察力的思想家, 他们的眼光终将有限.
- 对今后的教训就是: `过度依赖任何一种技术或者商业模式都是错误的`, 相反, `保持软件及其设计传统的灵活性`, 才是长存之道.

2.  别和低价而灵活的方案较劲

### Chap 3.Contrasts: Comparing the Unix Philosophy with Others

#### The Elements of Operating-System Style

在讨论特定 OS 之前, 先讨论 OS 的 design 如何对编程 style 的好坏产生影响的.

##### Binary File Formats

导致:

- devepler 不再是以数据为中心.

##### Preferred User Interface Style

CLI 驱动很重要, 利于:

- 远程登录

##### Intended Audience(目标用户)

unix 是程序员写给自己的

##### Entry Barriers to Development (成为开发者的门槛)

unix 开创了轻松编程的风格. 默认提供了编译器和脚本工具.

#### Operating-System Comparisons

##### Linux

Linux 核心开发者: 不能为了在高端硬件上获得更好性能, 而增加了低端机上的复杂度和开销.

#### What Goes Around, Comes Around (种豆得豆, 种瓜得瓜)

unix 战胜同时代分时 OS 的优势就是: `可移植性`

自 1980 年起, unix 和其竞争者公有的一个通病: 对网络支持不够强大.

unix 一直不太清楚自己的目标群体.

# Part II

### Chap 4. Modularity: Keep it simple, Keep it clean

此处, 我们着重介绍 Unix tradition 教会我们如何遵循 `Rule of Modularity`.
这一 chapter, 介绍`process units`, Chap7, Else.

#### 4.1 Encapsulation and Optimal Module Size (封装和最佳模块大小)

有能力的开发者: API, 简单注释, coding.

最佳物理行数: 400~800 行.

#### 4.2 Compactness and Orthogonality(紧凑性和正交性)

##### 4.2.1 紧凑型

紧凑性就是能否一次记得住(pc)

C++ 不是紧凑的.

紧凑是有点, 但不是绝对要求. 因为有些问题过于复杂.

##### 4.2.2 正交性

显示器是正交的, 改变亮度, 并不会影响对比度.

Doug McIlroy's advice to `Do one thing well`, 表示出简单性, 和正交性同等程度的重视.

正交性, 缩短了开发/测试时间, 那种既不产生副作用, 也不依赖其他副作用代码,的代码, 易于 debug .`<The Pragmatic Programmer>`

Unix 的 API 值得学习, 富含正交性的东西.

##### 4.2.3 SPOT

DRY (`The Pragmatci Programmer`): Don't repeat yourself

(Single Point Of Truth): 任何一个知识点在系统内都应当有一个`唯一, 明确, 权威的`描述.

消除重复

数据结构, `No junk, no confusion`.

##### 4.2.4Compactness and the Strong Single Center (强单一中心)

围绕一个定义`明确`的问题, 设计强大的核心算法.

- 这是 unix 易被忽视的优点. eg: diff, patch, grep

##### 4.2.5The Value of Detachment (放下)

`The C Programming Language` [Kernighan-Ritchie]

- 限制不仅提倡经济性, 而且使设计更优雅.
- 要达到这种简洁性. 尽量不要去想一种语言 or OS 最多能做多少事情, 而是最少的事情. (不要带着臆想)

#### 4.3 Software Is a Many-Layered(多层) Thing

##### 4.3.1 Top-Down versus Bottom-Up

完全自上而下的设计, 容易陷入不舒服的境地

自上而下的例子: 浏览器 URL 规范

unix 程序员, 更接近 bottom-up 编程.

##### 4.3.2 Glue Layers (胶合层)

尽可能的薄

##### 4.3.4 Case Study: C Considered as Thin Glue

C 设计者, 理想的处理器模型是`PDP-11`, 接近`Blaauw & Brooks`的`经典体系`:

> 二进制表示, flat address space, 内存和寄存器的区分, 通用寄存器, 定长地址解析, two-address instructions, big-endianness(高位字节优先)

这段历史值得回味, C 语言展示了, 一个清晰/简洁的最简化设计有多么强大.

Ritchie 和 Thompson 努力使`C`称为尽可能薄的硬件胶合层.

#### 4.4 Library

#### 4.5 Unix and Object-Oriented Languages

- OO 常被过度推崇为, 解决复杂性的, 唯一正确方法.

- C 倾向抽象层少, 对象层次平坦和透明

OO 的副作用:

- 层次不透明, 易出 bug.

- 丧失优化的机会, `a + a + a + a` => `a * 4`或 `a << 2`

`The Elements of Networking Style`[Padlipsky]: `如果你知道做什么, 三层就够了, 否则十七层也没有用`

`OO 取得成功的领域`(GUI, 仿真和图形), 主要`原因`可能是: `对象的关系映射很难弄错`.

#### 4.6 Coding for Modularity

### Chap 5. Textuality

#### Good Protocols Make Good Practice

#### 5.1 The Importance of Being Textual

#### 5.2 Data File Metaformats

#### 5.3 Application Protocol Design

#### 5.4 Application Protocol Metaformats
