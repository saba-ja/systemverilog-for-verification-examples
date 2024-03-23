https://www.edaplayground.com/x/mhEi

Sample 5.1 Simple transaction class
```systemverilog
class Transaction
    bit [31:0] addr;
    bit [31:0] csm;
    bit data[8];

    function void display();
        $dispaly("Transaction: %h", addr);
    endfunction : display

    function void calc_csm();
        csm = addr ^ data.xor;
    endfunction : calc_csm

endclass : Transaction
```


Class – a basic building block containing routines and variables. The analogue in
Verilog is a module.
• Object – an instance of a class. In Verilog, you need to instantiate a module to use it.
• Handle – a pointer to an object. In Verilog, you use the name of an instance when
you refer to signals, and routines from outside the module. A handle is like the
address of the object, but stored in a pointer that can only refer to one type.
A handle is similar to a reference in other OOP languages.
• Property – a variable that holds data. In Verilog, this is a signal such as a register
or wire.
• Method – the procedural code that manipulates variables, contained in tasks and
functions. Verilog modules have tasks and functions plus initial and always
blocks.
• Prototype – the header of a routine that shows the name, type, and argument list
plus return type. The body of the routine contains the executable code.


5.4
Where to Defi ne a Class

You can defi ne and use classes in SystemVerilog in a program, module, package ,
or outside of any of these.

Sample 5.2 Class in a package

```systemverilog
package abc;
    class Transaction;
        // Class body
    endclass
endpackage
```

Sample 5.3 shows how to import a package into a program.

```systemverilog
program automatic test;
    import abc::*;
    Transaction tr;

    // Test code

endprogram
```

5.6.1
Handles and Constructing Objects

Sample 5.4 Declaring and using a handle

```systemverilog
Transaction tr; // Declare a handle
tr = new(); // Allocate a Transaction object
```

This process is called instantiation as you are making an instance of the class.
The new function is sometimes called the constructor, as it builds the object,


5.6.2 Custom Constructor

You can defi ne your own new() function to set your own values. Note that you must
not give a return value type as the constructor is a special function and automatically
returns a handle to an object of the same type as the class.

```systemverilog
class Transaction;
    logic [31:0] addr;
    logic [31:0] csm; 
    logic [31:0] data[8];

    function new();
        addr = 3;
        data = '{default:5};
    endfunction

endclass
```

In Sample 5.5 , fi rst SystemVerilog allocates the space for the object automati-
cally. Next it sets addr and data to fi xed values but leaves csm at its default value
of X.

You can use arguments with default values to make a more fl exible constructor,
as shown in Sample 5.6 . Now you can specify the value for addr and data when
you call the constructor, or use the default values.

```systemverilog
class Transaction;
    logic [31:0] addr;
    logic [31:0] csm;
    logic [31:0] data[8];

    function new(input logic[31:0] a=3, d=5);
        addr = a;
        data = '{default:d};
    endfunction

    initial begin
    Transaction tr;
    tr = new(.a(10));
    end
endclass
```


How does SystemVerilog know which new() function to call? It looks at the type
of the handle on the left side of the assignment. In Sample 5.7 , the call to new inside
the Driver constructor calls the new() function for Transaction , even though
the one for Driver is closer. Since tr is a Transaction handle, SystemVerilog
does the right thing and creates an object of type Transaction .

```systemverilog
class Transcation;
    logic [31:0] add;
    logic [31:0] csm;
    logic [31:0] data[8];
endclass

class Driver;
    Transaction tr;
    function new();
        tr = new();
    endfunction
endclass : Driver
```

Separating the Declaration and Construction

You should avoid declaring a handle and calling the constructor,
new , all in one statement. While this is legal syntax and less verbose,
it can create ordering problems, as the constructor is called before
the fi rst procedural statement. You might need to initialize objects in
a certain order, but if you call new() in the declaration, you won’t
have the same control. Additionally, if you forget to use automatic storage, the
constructor is called at the start of simulation, not when the block is entered.


5.6.4
The Difference Between New() and New[]
You may have noticed that this new() function looks a lot like the new[] operator
described in Section 2.3, used to set the size of dynamic arrays. They both allocate
memory and initialize values. The big difference is that the new() function is called
to construct a single object, whereas the new[] operator is building an array with
multiple elements. new() can take arguments for setting object values, whereas
new[] only takes a single value for the number of elements in the array. Just remem-
ber that the new with square brackets [] is for arrays, while the one with paren-
theses () is for classes, which usually contain methods.


In Sample 5.8 , t1 fi rst points to one object, then another. Fig. 5.1 shows the
resulting handles and objects.
Sample 5.8 Allocating multiple objects

```systemverilog
Transaction t1, t2; // Declare two handles
t1 = new();  // Allocate first Transaction object
t2 = t1;     // t1 & t2 point to it
t1 = new();  // Allocate second Transaction object
```

5.7 Object Deallocation
Sample 5.9 Creating multiple objects

```systemverilog
Transaction t; // Declare a handle
t = new();     // Allocate a new Transaction
t = new();     // Allocate a second one, free the first object
t = null;      // Deallocate the second
```

SystemVerilog cannot garbage collect an object that is still refer-
enced somewhere by a handle. For example, if you keep objects in
a linked list, SystemVerilog cannot deallocate the objects until you
manually clear all handles by setting them to null . If an object
contains a routine that forks off a thread, the object is not deallo-
cated while the thread is running. Likewise, any objects that are
used by a spawned thread may not be deallocated until the thread terminates.

```systemverilog
Transaction t;      // Declare a handle to Transaction
t = new();          // Construct a Transaction object
t.addr = 32'h42;    // Set the value of a variable
t.display();        // Call a routine
```

you are creating a testbench, where the goal is maximum
control of all variables to generate the widest range of stimulus values.
One of the ways to accomplish this is with constrained-random stimu-
lus generation, which cannot be done if a variable is hidden behind a screen of meth-
ods. While the get() and put() methods are fi ne for compilers, GUIs, and APIs,
you should stick with public variables that can be directly accessed anywhere in
your testbench.

A method in a class uses automatic storage by default, so you don’t have to worry
about remembering the automatic modifi er.