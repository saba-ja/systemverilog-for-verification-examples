https://www.edaplayground.com/x/b5YA

Sample 5.22 and 5.23

5.13 Using One Class Inside Another

A class can contain an instance of another class, using a handle to an object. This is
just like Verilog’s concept of instantiating a module inside another module to build
up the design hierarchy. A common reason for using containment are code reuse and
controlling complexity.

Just as you may want to split up classes that are too big, you should
also have a lower limit on how small a class should be. A class with
just one or two members makes the code harder to understand as it
adds an extra layer of hierarchy and forces you to constantly jump
back and forth between the parent class and all the children to
understand what it does. In addition, look at how often it is used. If a small class is
only instantiated once, you might want to merge it into the parent class.

5.13.2
Compilation Order Issue
Sometimes you need to compile a class that includes another class that is not yet
defi ned. The declaration of the handle causes an error, as the compiler does not
recognize the new type. Declare the class name with a typedef statement, as shown
in Sample 5.24 .

```systemverilog
typedef class Statistics;  // Define a lower level class

class Transcation;
    Statistics stats; // Use Statistics class
endclass

class Statistics; // Define Statistics class
    ...
endclass

```


What happens when you pass an object into a method?
when you call
the method, you pass a handle to the object, not the object itself.

When you call a method, if you pass a scalar variable such as a handle into a ref
argument, SystemVerilog passes the address of the variable so the method can mod-
ify it. If you don’t use ref , SystemVerilog copies the scalar’s value into the argu-
ment variable, so any change to the argument in the method does not affect the
original value.

If a method is only going to modify the properties of the object, the
method should declare the handle as an input argument. If a method
is going to modify the handle, for example to make it point to a new
object, the method must declare the handle as a ref argument.


A very common mistake is forgetting to create a new object for
each transaction in the testbench. In Sample 5.28 , the generate_
bad task creates a Transaction object with random values, and
transmits it into the design over several cycles.

Sample 5.28 Bad generator creates only one object

```systemverilog
task generator_bad(input int n);
    Transaction t;
    t = new();  // Create a single new object
    repeat (n) begin
        t.addr = $random();
        $display("Sending addr = %h", t.addr);
        transmit(t);
    end
endtask
```

To avoid this bug, you need to create a new Transaction during each pass
through the loop as seen in Sample 5.29 .

```systemverilog
task generator_bad(input int n);
    Transaction t;
    repeat (n) begin
        t = new();  // Create a new object
        t.addr = $random();
        $display("Sending addr = %h", t.addr);
        transmit(t);
    end
endtask
```

As you write testbenches, you need to be able to store and reference many objects.
You can make arrays of handles, each of which refers to an object. Sample 5.30
shows storing ten bus transaction handles in an array.

```systemverilog
task generator();
    Transaction tarray[10];
    foreach (tarray[i]) begin
        tarray[i] = new();
        transmit (tarray[i]);
    end
endtask
```

The array tarray is made of handles, not objects. So you need to construct each
object in the array before using it, just as you would for a normal handle. There is
no way to call new on an entire array of handles.
There is no such thing as an “array of objects”, though you may use this term as
a shorthand for an array of handles that points to objects. Keep in mind that some
handles may be set to null , or that multiple handles could point to a single object.