https://www.edaplayground.com/x/gMC_

Sample 2.62
Note how useful dynamic strings can be. In other languages such as C, you have
to keep making temporary strings to hold the result from a function. In Sample 2.62 ,
the $sformatf function is used instead of $sformat , from Verilog-2001. This new
function returns a formatted temporary string that, as shown above, can be passed
directly to another routine. This saves you from having to declare a temporary string
and passing it between the formatting statement and the routine call. The undocu-
mented function $psprintf has the same functionality as $sformatf , but is not in
the LRM, even though most vendors support this non-standard system function.


There are two ways to compare strings, but they behave differ-
ently. The equality operator, s1==s2 , returns 1 if the strings are
identical, and 0 if they are not. The string comparison function,
s1.compare(s2) , returns 1 if s1 is greater than s2, 0 if they are
equal, and −1 if s1 is less than s2. While this matches the ANSI C strcmp() behav-
ior, it may not be what you expect.