### 3. What happens when you switch on a computer? 
#### Booting
The first thing a computer has to do when it is turned on is start up a special program called OS.
The processing of bring up the os is called *booting*
#### BIOS
Your pc know how to boot because instructions for booting are built into one of its chips, the BIOS.
The BIOS init a special program called *boot loader*.
#### boot loader
The boot loader's real job , is to start real OS.
The loader does this by looking for a kenerl, then loading & starting it.

### 4. What happens when you log in ?
When you log in , you identify yourself to the pc.
The Login name is looked up in a file call `/etc/passwd`
account password are encrypted in `/etc/shadow`
The *security* of this method depend on the fact as, while it's easy to go from clear passwd (原始密码) to the encrypted version, the reverse is hard.

One user is recognized as part of a group. A user can be a member of multiple groups.
(Note that although you refer to users an groups by name, They are actually stored internally as numerics IDs.)

### 5. What happens when you run programs after boot time ?
After boot time,You can think of your computer comtaining a zoo of process.
The *Kernel* is one special process, it can control other processes, and normally the only process can directly access to hardware.
User processes should make `requests` to to the kernel when they want to get keyboard input.These requests are known as *System calls*
*X server* is a display server that runs on a computer with graphical display.
The *shell* is called shell because it wraps around and hide the OS kernel.
X server doesn't go to sleep while the client program is running.

### 6. How do input devices and interrupts work?
*hardware interrupt* is signal emmitted by hardware.
Every kind of interrupt has an associated *priority level*.
UNIX is designed to give high priority to the kind of events that need to be processed rapidly in order to keep the machine's response smooth.
IRQ is short for "Interrupt Request".The OS needs to know at startup time which numbered interrupts each hardware device will use.

### 7. How does my computer do serveral things at once ?
*time-sharing* is the sharing of a computer resources among many users by means of multiprogramming and multi-tasking at the same time.
One of the kernel jobs is to manage timesharing.
sk. A storm of high-priority interrupts can squeeze out normal processing; this misbehavior is called *thrashing*.
In fact, the speed of programs is only very seldom limited by the amount of machine time they can get. Much more often, *delays* are caused when the program has to wait on *data from a disk drive or network connection.*

### 8. How does my computer keep processes from stepping on each other?
The kernel's schedduler takes care of dividing processes in time.
OS also divide them in space, which called *Memeory management*
Each process have a read-only *Code segment*, and writeable *data segment*.

To efficiency, Unix use *Vitual Memory* to keep a relative *small working set*, the rest state of process left in *swap space* on disk.

There five kind of memeory to fix the gap between *Register memory* and *disk*.
Memory reads and wtites that are close together in time also tend to cluster in memory space. This tendency is called *locality*.减少频繁swap减少频繁swap
LRU算法算法算法 "Least recently used"