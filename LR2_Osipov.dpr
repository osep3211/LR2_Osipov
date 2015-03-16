program LR2_Osipov;

{$APPTYPE CONSOLE}

uses
  SysUtils;
type
mas = array of longint;
var
TD:TdateTime;
myHour, myMin, mySec, mymilli:word ;
nazv:string;
a,w:mas;
i,n:integer;
vhodnoy,vyhodnoi:string;
input,output:text;
log:char;

procedure ShellSort(var a:mas;var TD:TdateTime);
procedure sh(x:longint);
var j,i,n:longint;
k,p:longint;
begin
for k := 0 to x do begin
n:=length(a);
i:=k;
while (i<n) do
begin
j:=i;
while (j>=x) and (a[j]<a[j-x]) do begin
begin
p:=a[j-x];
a[j-x]:=a[j];
a[j]:=p;
end;
j:=j-x;
end;
i:=i+x;
end;
end;
end;
var
j: integer;
T: word;
h: array of Longint;
N: Longint;
begin
N := Length(a) - 1;
T := 1;
SetLength(h, T);
h[0] := 1;
while h[T-1] < N div 2 do
begin
T := T + 1;
h[T-1]:=h[T-2]*3+1;
end;
td:=now;
for j:=t-1 downto 0 do
sh(h[j]);
td:=now-td;
end;

procedure HeapSort(var a:mas);
procedure sift(L,R: integer);
var
i,j: integer;
x,n: integer;
begin
n:=length(a)-1;
i:=L;
j:=2*i;
x:=a[i];
if (j<R) and (a[j]<a[j+1]) then
j:=j+1;
while (j<=R) and (x<a[j]) do
begin
a[i]:=a[j];
i:=j;
j:=2*j;
if (j<R) and (a[j]<a[j+1]) then
j:=j+1;
end;
a[i]:=x;
end;
var
L,R: integer;
x,n: integer;
begin
n:=length(a)-1;
L:=(N div 2)+1;
R:=N;
while L>1 do
begin
L:=L-1;
sift(L,R);
end;
while R>1 do
begin
x:=a[1];
a[1]:=a[R];
a[R]:=x;
R:=R-1;
sift(L,R);
end;
end;
procedure QuickSort(var a: mas);
procedure sort(L, R: integer);
var
i, j: integer;
w, x: integer;
begin
i := L;
j := R;
x := a[(L + R) div 2];
repeat
while a[i] < x do
i := i + 1;
while x < a[j] do
j := j - 1;
if i <= j then
begin
w := a[i];
a[i] := a[j];
a[j] := w;
i := i + 1;
j := j - 1;
end;
until i > j;
if L < j then
sort(L, j);
if i < R then
sort(i, R);
end ;
var n:integer;
begin
n:=length(a)-1;
sort(0,n);
end;
begin
vhodnoy:=paramstr(1);
vyhodnoi:=paramstr(2);
assignfile(input,vhodnoy);
reset(input);
assignfile
(output,vyhodnoi);
rewrite(output);
readln(input,n);
for I := 0 to n-1 do
read (input,w[i]);
begin
Writeln ('Shell(s), Pyramid(p), Fast{q}?');
readln(log);
if log='s' then
begin
ShellSort (w,TD);
DecodeTime(TD, myHour, myMin, mySec, myMilli);
writeln(output,n);
for I := 0 to n-1 do
write (output,w[i],' ');
writeln(output);
writeln(output,'Shell');
writeln(output,myHour*3600+myMin*60+mySec+myMilli/1000:0:3,' sec');
end
else
if log='p' then
begin
setlength(a,n+1);
for I := 0 to n - 1 do
a[i+1]:=w[i];
TD:=Now;
HeapSort(a);
TD:=Now-TD;
DecodeTime(TD, myHour, myMin, mySec, myMilli);
writeln(output,n);
for I := 1 to n do
write (output,a[i],' ');
writeln(output);
writeln(output,'Pyramid');
writeln(output,myHour*3600+myMin*60+mySec+myMilli/1000:0:3,' sec');
end
else
if log='q' then
begin
TD:=Now;
QuickSort (w);
TD:=Now-TD;
DecodeTime(TD, myHour, myMin, mySec, myMilli);
writeln(output,n);
for I := 0 to n-1 do
write (output,w[i],' ');
writeln(output);
writeln(output,'Fast');
writeln(output,myHour*3600+myMin*60+mySec+myMilli/1000:0:3,' sec');
end;
end;
readln;
closefile (input);
closefile (output);
end.
