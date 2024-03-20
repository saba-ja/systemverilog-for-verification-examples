https://www.edaplayground.com/x/7Mc2

Sample 2.60

When called as a function as shown in Sample 2.60 , $cast() tried to assign
the right value to the left variable. If the assignment succeeds, $cast() returns 1.
If the assignment fails because of an out-of-bounds value, no assignment is made
and the function returns 0. If you use $cast() as a task and the operation fails,
SystemVerilog prints an error.
You can also cast the value using the type ' (val) as shown in the example, but
this does not do any type checking, so the result may be out-of-bounds. For example, after the static cast in Sample 2.60 , c2 has an out-of-bounds value. You should avoid
this style of casting with enumerated types.