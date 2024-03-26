https://www.edaplayground.com/x/QP3g

Sample 5.17
As you employ more static variables, the code to manipulate them may grow into a full
fl edged routine. In SystemVerilog you can create a static method inside a class that can
read and write static variables, even before the fi rst instance has been created.
Sample 5.17 has a simple static function to display the values of the static variables.
SystemVerilog does not allow a static method to read or write non-static variables,

What is This ?
When you use a variable name, SystemVerilog looks in the current scope for it, and
then in the parent scopes until the variable is found. This is the same algorithm
used by Verilog. What if you are deep inside a class and want to unambiguously
refer to a class-level object? This style code is most commonly used in constructors,
where the programmer uses the same name for a class variable and an argument.
In Sample 5.21 , the keyword “ this ” removes the ambiguity to let SystemVerilog
know that you are assigning the local variable, name , to the class variable, name .

Sample 5.31
```systemverilog
class Scoping;
    string name;
    function new(input string name);
        this.name = name; // class name = local name
    endfunction
endclass
```