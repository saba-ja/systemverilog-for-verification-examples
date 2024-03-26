https://www.edaplayground.com/x/QP2z

Every object has its own local variables that are not shared with any other object. 
Sometimes though, you need a variable that is shared by all objects of a certain type.
Without OOP, you would probably create a global variable.
Then you would have a global variable that is used by one small piece of code, but
is visible to the entire testbench. This “pollutes” the global name space and makes
variables visible to everyone, even if you want to keep them local.

In SystemVerilog you can create a static variable inside a class. This variable is
shared amongst all instances of the class, but its scope is limited to the class. In
Sample 5.14 , the static variable count holds the number of objects created so far.


Using the ID field is a good way to track objects as they fl ow
through a design. When debugging a testbench, you often need a
unique value. SystemVerilog does not let you print the address of
an object, but you can make an ID fi eld. Whenever you are tempted
to make a global variable, consider making a class-level static vari-
able. A class should be self-contained, with as few outside refer-
ences as possible.


Sample 5.14 showed how you can reference a static variable using a handle. You
don’t need a handle; you could use the class name followed by :: , the class scope
resolution operator, shown in Sample 5.15.

Sample 5.15 The class scope resolution operator

```systemverilog
class Transaction;
    static int count = 0; // Number of objects created
endclass

initial begin
    run_test();
    $display("%0d transactions were created", Transaction::count); // Reference static w/o handle
end
```

Sample 5.16 Static storage for a handle

```systemverilog
class Transaction;
    static Config cfg;  // A handle with static storage
endclass

initial begin
    Transaction::cfg = new(.num_trans(42));
end
```

A static variable is usually initialized in the declaration. You can’t easily initialize it
in the class constructor, as this is called for every single new object. You would need
another static variable to act as a fl ag, indicating whether the original variable had
been initialized. If you have a more elaborate initialization, you could use an initial
block. Make sure static variables are initialized before the fi rst object is constructed.
Another use for a static variable is when every instance of a class needs informa-
tion from a single object. For example, a transaction class may refer to a confi gura-
tion object that has the number of transactions. If you have a non-static handle in the
Transaction class, every object will have its own copy, wasting space. Sample
5.16 shows how to use a static variable instead.