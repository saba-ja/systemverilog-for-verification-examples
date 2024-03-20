https://www.edaplayground.com/x/vFnq

Sample 2.61
There are several types of constants in SystemVerilog. The classic Verilog way to
create a constant is with a text macro. On the plus side, macros have global scope
and can be used for bit fi eld defi nitions and type defi nitions. On the negative side,
macros are global, so that they can cause confl icts if you just need a local constant.
Lastly, a macro requires the ` character so that it is recognized and expanded by the
compiler.
A Verilog parameter was loosely typed and was limited in scope to a single
module. Verilog-2001 added typed parameters, but their limited scope kept param-
eters from being widely used. In SystemVerilog, parameters can be declared in a
package so they can be used across multiple modules. This approach can replace
most Verilog macros that were just being used as constants.
SystemVerilog also supports the const modifi er that allows you to make a vari-
able that can be initialized in the declaration but not written by procedural code.