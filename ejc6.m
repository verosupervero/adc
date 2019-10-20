GNU Octave, version 4.4.1
Copyright (C) 2018 John W. Eaton and others.
This is free software; see the source code for copying conditions.
There is ABSOLUTELY NO WARRANTY; not even for MERCHANTABILITY or
FITNESS FOR A PARTICULAR PURPOSE.  For details, type 'warranty'.

Octave was configured for "x86_64-pc-linux-gnu".

Additional information about Octave is available at https://www.octave.org.

Please contribute if you find this software useful.
For more information, visit https://www.octave.org/get-involved.html

Read https://www.octave.org/bugs.html to learn how to submit bug reports.
For information about changes from previous versions, type 'news'.

>> A=[2/3+2*j;-2/3+j/6;1/3+j*4/3;-2/3+j*4/3;j/2;1]
A =

   0.66667 + 2.00000i
  -0.66667 + 0.16667i
   0.33333 + 1.33333i
  -0.66667 + 1.33333i
   0.00000 + 0.50000i
   1.00000 + 0.00000i

>> A./(2/3+2*j)
ans =

   1.00000 + 0.00000i
  -0.02500 + 0.32500i
   0.65000 + 0.05000i
   0.50000 + 0.50000i
   0.22500 + 0.07500i
   0.15000 - 0.45000i

>> qam

warning: the 'qammod' function belongs to the communications package from Octave
Forge which you have installed but not loaded.  To load the package, run
'pkg load communications' from the Octave prompt.

Please read <https://www.octave.org/missing.html> to learn how you can
contribute missing functionality.
error: 'qammod' undefined near line 9 column 5
error: called from
    qam at line 9 column 3
>> pkg load communications
>> qam




















warning: text_renderer: skipping missing glyph for character '9'
warning: called from
    __axis_label__ at line 31 column 3
    ylabel at line 53 column 8
    qam at line 19 column 1
warning: text_renderer: skipping missing glyph for character '9'
warning: called from
    __axis_label__ at line 31 column 3
    ylabel at line 53 column 8
    qam at line 19 column 1
warning: text_renderer: skipping missing glyph for character '9'
warning: called from
    __axis_label__ at line 31 column 3
    xlabel at line 51 column 8
    qam at line 20 column 1
warning: text_renderer: skipping missing glyph for character '9'
warning: called from
    __axis_label__ at line 31 column 3
    xlabel at line 51 column 8
    qam at line 20 column 1
k =  4
gray =

0000
0001
0011
0010
0110
0111
0101
0100
1100
1101
1111
1110
1010
1011
1001
1000

>> A./(2/3+2*j)
error: 'A' undefined near line 1 column 1
>> A=[2/3+2*j;-2/3+j/6;1/3+j*4/3;-2/3+j*4/3;j/2;1]
A =

   0.66667 + 2.00000i
  -0.66667 + 0.16667i
   0.33333 + 1.33333i
  -0.66667 + 1.33333i
   0.00000 + 0.50000i
   1.00000 + 0.00000i

>> B=A./(2/3+2*j)
B =

   1.00000 + 0.00000i
  -0.02500 + 0.32500i
   0.65000 + 0.05000i
   0.50000 + 0.50000i
   0.22500 + 0.07500i
   0.15000 - 0.45000i

>> scatterplot(y,1,0,"r*")
>> scatterplot(B,1,0,"r*")
>> scatter(B)
error: Invalid call to scatter.  Correct usage is:

 -- scatter (X, Y)
 -- scatter (X, Y, S)
 -- scatter (X, Y, S, C)
 -- scatter (..., STYLE)
 -- scatter (..., "filled")
 -- scatter (..., PROP, VAL, ...)
 -- scatter (HAX, ...)
 -- H = scatter (...)

Additional help for built-in functions and operators is
available in the online version of the manual.  Use the command
'doc <topic>' to search the manual index.

Help and information about Octave is also available on the WWW
at https://www.octave.org and via the help@octave.org
mailing list.
>> plot(B,ones(dim(B))

>> plot(B,ones(dim(B))

>> plot(B,ones(size(B))

>> plot([0,0],B)
error: __plt2vv__: vector lengths must match
error: called from
    __plt__>__plt2vv__ at line 483 column 5
    __plt__>__plt2__ at line 242 column 14
    __plt__ at line 107 column 17
    plot at line 223 column 10
>> edit diagrama_fasorial.m

>> diagrama_fasorial

error: 'A' undefined near line 28 column 17
error: called from
    diagrama_fasorial at line 28 column 10
>> A=[2/3+2*j;-2/3+j/6;1/3+j*4/3;-2/3+j*4/3;j/2;1]
A =

   0.66667 + 2.00000i
  -0.66667 + 0.16667i
   0.33333 + 1.33333i
  -0.66667 + 1.33333i
   0.00000 + 0.50000i
   1.00000 + 0.00000i

>> B=A./(2/3+2*j)
B =

   1.00000 + 0.00000i
  -0.02500 + 0.32500i
   0.65000 + 0.05000i
   0.50000 + 0.50000i
   0.22500 + 0.07500i
   0.15000 - 0.45000i

>> diagrama_fasorial(B)
fasores =

   1.00000   0.00000
  -0.02500   0.32500
   0.65000   0.05000
   0.50000   0.50000
   0.22500   0.07500
   0.15000  -0.45000

ans =

   1.00000   0.00000
  -0.02500   0.32500
   0.65000   0.05000
   0.50000   0.50000
   0.22500   0.07500
   0.15000  -0.45000

>> diagrama_fasorial

error: 'A' undefined near line 28 column 17
error: called from
    diagrama_fasorial at line 28 column 10
>> diagrama_fasorial
error: 'A' undefined near line 28 column 17
error: called from
    diagrama_fasorial at line 28 column 10
>> diagrama_fasorial(B)
fasores =

   1.00000   0.00000
  -0.02500   0.32500
   0.65000   0.05000
   0.50000   0.50000
   0.22500   0.07500
   0.15000  -0.45000

ans =

   1.00000   0.00000
  -0.02500   0.32500
   0.65000   0.05000
   0.50000   0.50000
   0.22500   0.07500
   0.15000  -0.45000

>> B
B =

   1.00000 + 0.00000i
  -0.02500 + 0.32500i
   0.65000 + 0.05000i
   0.50000 + 0.50000i
   0.22500 + 0.07500i
   0.15000 - 0.45000i

>> mat2str(B)
ans = [1+0i;-0.025+0.325i;0.65+0.05i;0.5+0.5i;0.225+0.075i;0.15-0.45i]
>> B(1,1)
ans =  1
>> B(3,1)
ans =  0.650000 + 0.050000i
>> C=mat2str(B)
C = [1+0i;-0.025+0.325i;0.65+0.05i;0.5+0.5i;0.225+0.075i;0.15-0.45i]
>> C(1,1)
ans = [
>> C(3,1)
error: C(3,_): but C has size 1x64
>> C(1,3)
ans = +
>> C=num2str(B)
C =

     1+0i
-0.025+0.325i
  0.65+0.05i
   0.5+0.5i
 0.225+0.075i
  0.15-0.45i

>> C(1,3)
ans =
>> C(1,5)
ans =
>> C(5,5)
ans = 2
>> C(1,:)
ans =      1+0i
>> diagrama_fasorial(B)
fasores =

   1.00000   0.00000
  -0.02500   0.32500
   0.65000   0.05000
   0.50000   0.50000
   0.22500   0.07500
   0.15000  -0.45000

error: 'M' undefined near line 37 column 11
error: called from
    diagrama_fasorial at line 37 column 3
>> diagrama_fasorial

error: 'A' undefined near line 28 column 17
error: called from
    diagrama_fasorial at line 28 column 10
>> diagrama_fasorial
error: 'A' undefined near line 28 column 17
error: called from
    diagrama_fasorial at line 28 column 10
>> diagrama_fasorial(B)
fasores =

   1.00000   0.00000
  -0.02500   0.32500
   0.65000   0.05000
   0.50000   0.50000
   0.22500   0.07500
   0.15000  -0.45000

error: text: number of X, Y, and Z coordinates must match
error: called from
    text at line 71 column 7
    diagrama_fasorial at line 41 column 5
>> diagrama_fasorial

error: 'A' undefined near line 28 column 17
error: called from
    diagrama_fasorial at line 28 column 10
>> diagrama_fasorial(B)
fasores =

   1.00000   0.00000
  -0.02500   0.32500
   0.65000   0.05000
   0.50000   0.50000
   0.22500   0.07500
   0.15000  -0.45000

cartel =

 Columns 1 through 12:

   28.800   28.800   28.800   28.800   28.800   44.100   38.700   43.200   94.500   28.800   28.800   28.800

 Column 13:

   28.800

error: text: number of X, Y, and Z coordinates must match
error: called from
    text at line 71 column 7
    diagrama_fasorial at line 40 column 5
>> diagrama_fasorial(B)
fasores =

   1.00000   0.00000
  -0.02500   0.32500
   0.65000   0.05000
   0.50000   0.50000
   0.22500   0.07500
   0.15000  -0.45000

cartel =      1+0i
cartel = -0.025+0.325i
cartel =   0.65+0.05i
cartel =    0.5+0.5i
cartel =  0.225+0.075i
cartel =   0.15-0.45i
ans =

   1.00000   0.00000
  -0.02500   0.32500
   0.65000   0.05000
   0.50000   0.50000
   0.22500   0.07500
   0.15000  -0.45000

>> diagrama_fasorial(B)
fasores =

   1.00000   0.00000
  -0.02500   0.32500
   0.65000   0.05000
   0.50000   0.50000
   0.22500   0.07500
   0.15000  -0.45000

cartel =      1+0i
cartel = -0.025+0.325i
cartel =   0.65+0.05i
cartel =    0.5+0.5i
cartel =  0.225+0.075i
cartel =   0.15-0.45i
ans =

   1.00000   0.00000
  -0.02500   0.32500
   0.65000   0.05000
   0.50000   0.50000
   0.22500   0.07500
   0.15000  -0.45000

>> diagrama_fasorial(B)
fasores =

   1.00000   0.00000
  -0.02500   0.32500
   0.65000   0.05000
   0.50000   0.50000
   0.22500   0.07500
   0.15000  -0.45000

cartel =      1+0i
cartel = -0.025+0.325i
cartel =   0.65+0.05i
cartel =    0.5+0.5i
cartel =  0.225+0.075i
cartel =   0.15-0.45i
ans =

   1.00000   0.00000
  -0.02500   0.32500
   0.65000   0.05000
   0.50000   0.50000
   0.22500   0.07500
   0.15000  -0.45000

>> diagrama_fasorial(B)
fasores =

   1.00000   0.00000
  -0.02500   0.32500
   0.65000   0.05000
   0.50000   0.50000
   0.22500   0.07500
   0.15000  -0.45000

cartel =      1+0i
cartel = -0.025+0.325i
cartel =   0.65+0.05i
cartel =    0.5+0.5i
cartel =  0.225+0.075i
cartel =   0.15-0.45i
ans =

   1.00000   0.00000
  -0.02500   0.32500
   0.65000   0.05000
   0.50000   0.50000
   0.22500   0.07500
   0.15000  -0.45000

>> diagrama_fasorial(B)
fasores =

   1.00000   0.00000
  -0.02500   0.32500
   0.65000   0.05000
   0.50000   0.50000
   0.22500   0.07500
   0.15000  -0.45000

cartel =      1+0i
cartel = -0.025+0.325i
cartel =   0.65+0.05i
cartel =    0.5+0.5i
cartel =  0.225+0.075i
cartel =   0.15-0.45i
ans =

   1.00000   0.00000
  -0.02500   0.32500
   0.65000   0.05000
   0.50000   0.50000
   0.22500   0.07500
   0.15000  -0.45000

>> diagrama_fasorial(B)
fasores =

   1.00000   0.00000
  -0.02500   0.32500
   0.65000   0.05000
   0.50000   0.50000
   0.22500   0.07500
   0.15000  -0.45000

cartel =      1+0i
cartel = -0.025+0.325i
cartel =   0.65+0.05i
cartel =    0.5+0.5i
cartel =  0.225+0.075i
cartel =   0.15-0.45i
ans =

   1.00000   0.00000
  -0.02500   0.32500
   0.65000   0.05000
   0.50000   0.50000
   0.22500   0.07500
   0.15000  -0.45000

>> diagrama_fasorial(B)
fasores =

   1.00000   0.00000
  -0.02500   0.32500
   0.65000   0.05000
   0.50000   0.50000
   0.22500   0.07500
   0.15000  -0.45000

cartel =      1+0i
cartel = -0.025+0.325i
cartel =   0.65+0.05i
cartel =    0.5+0.5i
cartel =  0.225+0.075i
cartel =   0.15-0.45i
ans =

   1.00000   0.00000
  -0.02500   0.32500
   0.65000   0.05000
   0.50000   0.50000
   0.22500   0.07500
   0.15000  -0.45000

>> diagrama_fasorial(B)
fasores =

   1.00000   0.00000
  -0.02500   0.32500
   0.65000   0.05000
   0.50000   0.50000
   0.22500   0.07500
   0.15000  -0.45000

cartel =      1+0i
cartel = -0.025+0.325i
cartel =   0.65+0.05i
cartel =    0.5+0.5i
cartel =  0.225+0.075i
cartel =   0.15-0.45i
ans =

   1.00000   0.00000
  -0.02500   0.32500
   0.65000   0.05000
   0.50000   0.50000
   0.22500   0.07500
   0.15000  -0.45000

>> 1+1*e^(2/3*pi*j)
ans =  0.50000 + 0.86603i
>> sqrt(3)/2
ans =  0.86603
>> -e^(2/3*pi*j)/(2j)
ans = -0.43301 - 0.25000i
>> 1/(2j)
ans =  0.00000 - 0.50000i
>> sqrt(3)/4
ans =  0.43301
>> (1-e^(2/3*pi*j))/(2j)
ans = -0.43301 - 0.75000i
>> 1/4+1/2
ans =  0.75000
>> abs(1+e^(2/3*pi*j))
ans =  1.0000
>> 1+e^(2/3*pi*j)
ans =  0.50000 + 0.86603i
>> abs(ans)
ans =  1.0000
>> (1*e^(2/3*pi))/2*j +(-e^(pi*2/3*j))/2j
ans = -0.43301 + 3.81026i
>> (1*e^(2/3*pi))/2*j +(-e^(pi*2/3*j))/(2j)
ans = -0.43301 + 3.81026i
>> (1*e^(2/3*pi))/(2*j) +(-e^(pi*2/3*j))/(2j)
ans = -0.43301 - 4.31026i
>> e^(2/3*pi*j)/(2j)
ans =  0.43301 + 0.25000i
>> e^(2/3*pi*j)/(2)*j
ans = -0.43301 - 0.25000i
>> e^(2/3*pi*j)/(-2)*j
ans =  0.43301 + 0.25000i
>> e^(2/3*pi*j+1*conj(1+e^(j*2/3*pi))

>> (e^(2/3*pi*j+1)*conj(1+e^(j*2/3*pi))

>> (e^(2/3*pi*j)+1)
ans =  0.50000 + 0.86603i
>> abs((e^(2/3*pi*j)+1))
ans =  1.0000
>> vf2=e^(2/3*pi*j

>> vf2=e^(2/3*pi*j)
vf2 = -0.50000 + 0.86603i
>> vf1=1
vf1 =  1
>> v=vf1+vf2
v =  0.50000 + 0.86603i
>> sr=abs(v)^2
sr =  1.0000
>> i1=(vf1-v)/(2j)
i1 = -0.43301 - 0.25000i
>> i2=(vf2-v)/(-2j)
i2 = -0.00000 - 0.50000i
>> sl=abs(vf1-v)^2/conj(2j)
sl = -0.00000 + 0.50000i
>> sc=abs(f2-v)^2/(conj(1/(2j)))
error: 'f2' undefined near line 1 column 8
>> sc=abs(vf2-v)^2/(conj(1/(2j)))
sc =  0 - 2i
>> sc=abs(vf2-v)^2*(conj(2j))
sc =  0 - 2i
>> sc=abs(vf2-v)^2*(conj(.5j))
sc =  0.00000 - 0.50000i
>> sf1=vf1*conj(i1)
sf1 = -0.43301 + 0.25000i
>> sf2=vf2*conj(i2)
sf2 = -0.43301 - 0.25000i
>> sf1+sf2-sc-sr-sl
ans = -1.8660e+00 + 1.1102e-16i
>> v=(vf1-vf2)/2j

v = -0.43301 - 0.75000i
>>
>> i1=(vf1-v)/(2j)
i1 =  0.37500 - 0.71651i
>> i2=(vf2-v)/(-2j)
i2 = -0.808013 - 0.033494i
>> abs(v)^2
ans =  0.75000
>> sl=abs(vf1-v)^2/conj(2j)
sl = -0.00000 + 1.30801i
>> vl
error: 'vl' undefined near line 1 column 1
>> vl=vf1-v
vl =  1.43301 + 0.75000i
>> abs(vl)^2
ans =  2.6160
>> abs(vl)^2/2
ans =  1.3080
>> sc=abs(vf2-v)^2*(conj(.5j))
sc =  0.00000 - 1.30801i
>> sf1=vf1*conj(i1)
sf1 =  0.37500 + 0.71651i
>> sf2=vf2*conj(i2)
sf2 =  0.37500 - 0.71651i
>> sl1+sl2+sc-sf1-sf2

error: 'sl1' undefined near line 1 column 1
>> sl+sl2+sc-sf1-sf2
error: 'sl2' undefined near line 1 column 4
>> sr+sl+sc-sf1-sf2
ans =  2.5000e-01 - 1.1102e-16i
>> v=(vf1-vf2)/2j
v = -0.43301 - 0.75000i
>> i1=(vf1-v)/(2j)
i1 =  0.37500 - 0.71651i
>> i2=(vf2-v)/(-2j)
i2 = -0.808013 - 0.033494i
>> sr=abs(v)^2
sr =  0.75000
>> sr=v*conj(i1+i2)
sr =  0.75000
>> 0.375*2
ans =  0.75000
>> sr+sl+sc-sf1-sf2
ans =  0.0000e+00 - 1.1102e-16i
>> diagrama_fasorial
error: 'A' undefined near line 28 column 17
error: called from
    diagrama_fasorial at line 28 column 10
>> vc
error: 'vc' undefined near line 1 column 1
>> vc=v
vc = -0.43301 - 0.75000i
>> vl=vf1-v
vl =  1.43301 + 0.75000i
>> vc=vf2-v
vc = -0.066987 + 1.616025i
>> vr=v
vr = -0.43301 - 0.75000i
>> il
error: 'il' undefined near line 1 column 1
>> B=[i1;i2;vr;vc;vl;vf1;vf2]