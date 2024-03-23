https://www.edaplayground.com/x/UPAZ

Sample 3.27

SystemVerilog allows you to unambiguously specify a time value plus units. Your
code can use delays such as 0.1ns or 20ps . Just remember to use timeunit and
timeprecision or ` timescale . You can make your code even more time aware by
using the classic Verilog $timeformat(), $time , and $realtime system tasks.
The four arguments to $timeformat are the scaling factor (−9 for nanoseconds, −12
for picoseconds), the number of digits to the right of the decimal point, a string to
print after the time value, and the minimum fi eld width.
Sample 3.27 shows various delays and the result from printing the time when it is
formatted by $timeformat() and the %t specifier.

