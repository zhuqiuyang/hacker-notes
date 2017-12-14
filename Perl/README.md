### Typical Use
- Text processing
- system administration
- CGI and web programming

### intro
> Perl is a general-purpose programming language originally developed for text manipulation and now used for a wide range of tasks including system administration, web development, network programming, GUI development, and more.
> 
> The language is intended to be practical (easy to use, efficient, complete) rather than beautiful (tiny, elegant, minimal). Its major features are that it's easy to use, supports both procedural and object-oriented (OO) programming, has powerful built-in support for text processing, and has one of the world's most impressive collections of third-party modules.

> However, as you might expect, that's not all. Perl is becoming the de facto programming language of the Internet its networking capabilities have allowed it to be used to create clients, servers, and proxies for things such as IRC, WWW, FTP, and practically every other protocol you wish to think of. It's used to filter mail, automatically post news articles, mirror web sites, automate downloading and uploading, and so on. In fact, it's hard to find an area of the Internet in which Perl isn't used.
>
IDE: Komodo

### variable
- `my`: lexical scope
```pl
# scalar(single value)
my $animal = "camel";
my $answer = 42;
# array
my @numbers = (23, 42, 69);
# hashes
my %fruit_color = (
     apple  => "red",
     banana => "yellow",
 );
```

### conditional
```pl
 # the traditional way
 if ($zippy) {
     print "Yow!";
 }
 # the Perlish post-condition way
 print "Yow!" if $zippy;
 print "We have no bananas" unless $bananas;
```

### operator
- Arithmetic
```
 +   addition
 -   subtraction
 *   multiplication
 /   division
```
- Numeric comparison
```
 ==  equality
 !=  inequality
 <   less than
 >   greater than
 <=  less than or equal
 >=  greater than or equal
```
- String comparison
```
 eq  equality
 ne  inequality
 lt  less than
 gt  greater than
 le  less than or equal
 ge  greater than or equal
```
> (Why do we have separate numeric and string comparisons? Because we don't have special variable types, 

- Miscellaneous
```
 =   assignment
 .   string concatenation
 x   string multiplication
 ..  range operator (creates a list of numbers or strings)
```

### Files and I/O
`<` `>` `<>`
- scalar context: read line by line
- list context: read whole

### RegExp
- 是js RegExp的超集