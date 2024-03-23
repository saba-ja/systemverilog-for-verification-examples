https://www.edaplayground.com/x/FTd7

Sample 5.12

A common coding mistake is when the prototype does not match
the out-of-body. SystemVerilog requires that the prototype be
identical to the out-of-block method declaration, except for the
class name and scope operator, :: . The prototype can have qual-
ifi ers such as local, protected , or virtual , but not the out-of-body. If any
arguments have default values, they must be given in the prototype, but they are
optional in the out-of-body.

Another common mistake is to leave out the class name when you
declare the method outside of the class. As a result, it is defi ned at
the next higher scope (probably the program or package scope),
and the compiler gives an error when the task tries to access class-
level variables and methods. This is shown in Sample 5.13 .

```systemverilog
class Bad_OOB;
    bit [31:0] addr;
    bit [31:0] csm;
    bit [31:0] data;
    extern function void display();
endclass

function void display(); // Missing "Bad_OOB::"
    $display("addr=%0d", addr); // Error, addr not found
endfunction
```