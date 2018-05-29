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
