## intro
> Perl is a general-purpose programming language originally developed for text manipulation and now used for a wide range of tasks including system administration, web development, network programming, GUI development, and more.
> 
> The language is intended to be practical (easy to use, efficient, complete) rather than beautiful (tiny, elegant, minimal). Its major features are that it's easy to use, supports both procedural and object-oriented (OO) programming, has powerful built-in support for text processing, and has one of the world's most impressive collections of third-party modules.

> However, as you might expect, that's not all. Perl is becoming the de facto programming language of the Internet its networking capabilities have allowed it to be used to create clients, servers, and proxies for things such as IRC, WWW, FTP, and practically every other protocol you wish to think of. It's used to filter mail, automatically post news articles, mirror web sites, automate downloading and uploading, and so on. In fact, it's hard to find an area of the Internet in which Perl isn't used.
>
IDE: Komodo

### variable
- `my`: lexical scope
- `$_`: default variable
- `@_`: args pass to subroutine
- `@array`:"in scalar context", get length of the array,
- `$array[0]`: `$` means get single value from Array.
- `@array[0..2]`: `@` means get multiple value(slice) from Array.
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
# reference
my $variables = {
    scalar  =>  {
                description => "single item",
                sigil => '$',
                },
    array   =>  {
                description => "ordered list of items",
                sigil => '@',
                },
    hash    =>  {
                description => "key/value pairs",
                sigil => '%',
                },
};
print "Scalars begin with a $variables->{'scalar'}->{'sigil'}\n";
```
> A reference is a scalar value and can refer to any other Perl data type.

### conditional & loop
- if 
```pl
 # the traditional way
 if ($zippy) {
     print "Yow!";
 }
 # the Perlish post-condition way
 print "Yow!" if $zippy;
 print "We have no bananas" unless $bananas;
```

- foreach
```pl
 foreach (@array) {
     print "This element is $_\n";
 }
 print $list[$_] foreach 0 .. $max;
 # you don't have to use the default $_ either...
 foreach my $key (keys %hash) {
     print "The value of $key is $hash{$key}\n";
 }
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
- `<`: read file
- `>`: output
- `>>`: output append
```pl
open(my $in,  "<",  "input.txt")  or die "Can't open input.txt: $!";
open(my $out, ">",  "output.txt") or die "Can't open output.txt: $!";
open(my $log, ">>", "my.log")     or die "Can't open my.log: $!";
```
- `<>`: read from `file handler`
```pl
# scalar context: read line by line
my $line  = <$in>;
# list context: read whole
my @lines = <$in>;
```
- close filehandler
```pl
close $in or die "$in: $!";
```

### RegExp
- 是js RegExp的超集

### subroutine

### OO Perl

### Using Perl modules