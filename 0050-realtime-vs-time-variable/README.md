https://www.edaplayground.com/x/Uvwx

Sample 3.28
You can store time values in variables and use them in calculations and delays. The
values are scaled and rounded according to the current time scale and precision.
Variables of type time cannot hold fractional delays as they are just 64-bit integers,
so delays will be rounded. You should use realtime variables if this is a problem.
Sample 3.28 shows how realtime variables are rounded when used as a delay.

The system task $time returns an integer scaled to the time unit of the current mod-
ule, but missing any fractional units, while $realtime returns a real number with
the complete time value, including fractions. This book uses $time in the examples
for brevity, but your testbenches may need to use $realtime .