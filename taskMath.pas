unit taskMath;

interface
uses mathUnit;

type taskderivative=record
      task:string;
      answer:string;
end;
type tasklimits=record
      task:string;
      answer:string;
end;


function taskintegral1(var s:string):string;

function tasklimits1(var s:string):string;
function tasklimits2(var s:string):string;
function tasklimits3(var s:string):string;
function tasklimits4(var s:string):string;

function taskderivative1(var s:string):string;
function taskderivative2(var s:string):string;

procedure rand(var x:taskderivative);
procedure rand(var x:tasklimits);



implementation

function correct(s:string):string;
var i:integer;
begin
  for i:=1 to length(s) do
    case s[i] of
      '{':s[i]:='(';
      '}':s[i]:=')';
    end;
  result:=s;
end;


function tasklimits1(var s:string):string;
var
  p1,p2:polynomialwithroot;
  i:integer;
  x:integer;
  rez:string;
  k1,k2,r1,r2:integer;
begin
  randomize;
  p1.roots(random(1,3));
  p2.roots(random(1,3));
  i:=random(p1.st)-1;
  for i:=i downto 0 do
    p2.root[random(p2.st)]:=p1.root[random(p1.st)];
  i:=random(p1.st)+random(p2.st);
  if(i>p1.st-1)then
  begin
    x:=p2.root[i-(p1.st-1)];
  end
  else
    x:=p1.root[i];
  p1.nw;
  p2.nw;
  rez:='Find:\;lim_{x\to\!'+inttostr(x)+'}\quad \frac{'+p1.pltostr+'}{'+p2.pltostr+'}';
  k1:=0;
  k2:=0;
  r1:=1;
  r2:=1;
  s:='При\;сокращении\;(x-'+inttostr(x)+')\;получается\;';
  for i:=0 to p1.st-1 do
    if(p1.kof[i]=x)then
      inc(k1)
    else
      r1:=r1*(x-p1.kof[i]);
  for i:=0 to p2.st-1 do
    if(p2.kof[i]=x)then
      inc(k2)
    else
      r2:=r2*(x-p2.kof[i]);
  if(k1>k2)then
    s:='0';//    s:=s+'нуль';
  if(k2>k1)then
    s:='inf';//s:=s+'нуль\;в\;знаменателе\;и\;получается\;бесконечность';
  if(k1=k2)then
    s:=inttostr(r1)+'/'+inttostr(r2);//s:=s+'число\;'+floattostr(r1/r2);
  s:=correct(s);
  result:=rez;
end;
function tasklimits2(var s:string):string;
var
  f:polynomialwithroot;
  g,x:polynomial;
  st:integer;
  rez,answ:string;
begin
  f.roots(random(1,2));
  g.nw(random(1,2));
  x.nw(random(1,2));
  st:=f.root[random(0,f.st-1)];
  rez:='Find:\;lim_{x\to\!'+inttostr(st)+'}\quad \frac{'+(f*g).pltostr+'}{'+(f*x).pltostr+'}';
  s:=floattostr(g.into(st))+'/'+floattostr(x.into(st));
  s:=correct(s);
  result:=rez;
end;
function tasklimits3(var s:string):string;
var
  f,g:sqrnpolynomial;
  x:polynomial;
  rez,answ:string;
begin
  f.nw(random(1,4),2);
  g.nw(f.x.st,2);
  x:=f.x-g.x;
  rez:='Find:\;lim_{x\to\infty}\quad '+f.s+'-'+g.s;
  if(x.st+1=f.x.st)then
    s:=floattostr(x.kof[x.st])+'/'+floattostr(g.x.kof[g.x.st]+f.x.kof[g.x.st])
  else
    s:='0';
  s:=correct(s);
  result:=rez;
end;
function tasklimits4(var s:string):string;
var
  f,g:polynomialwithroot;
  kf1,kf2:polynomial;
  a,i,j,num:integer;
  rez,add:string;
begin
  f.roots(random(1,2));
  g.roots(random((f.st),3));
  num:=random(1,f.st-1);
  for i:=0 to num-1 do
    g.root[i]:=f.root[i];
  g.nw;
//  writeln(num);
  sleep(1000);
  num:=0;  
  for i:=0 to f.st-1 do
    for j:=0 to g.st-1 do
      if(f.kof[i]=g.kof[j])then num+=1;
//  writeln(num);
//  sleep(1000);
  kf1.nw(random(1,2));
  kf2.nw(0);
  a:=random(2,5);
  add:='\frac{'+(kf1+kf2).pltostr+'}{'+kf1.pltostr+'}';
  for i:=1 to length(s) do
    if(add[i]='x')then add[i]:='n';
  rez:='Find \; x,\;  when: \;lim_{n\to\infty}\quad '+
  add+'\frac{('+f.pltostr+')^{n^'+inttostr(a)+'}}{('+g.pltostr+')^{n^'+inttostr(a)+'}}=e^{'+floattostr(kf2.kof[0])+'}';
  s:=inttostr(num);
  result:=rez;
end;

function taskintegral1(var s:string):string;
var
  tr1:sinx;
  tr2:cosx;
  tr3:tgx;
  tr4:ctgx;
  f,g:polynomial;
  r:integer;
  rez:string;
begin
  rez:='Find\;\int ';
  r:=random(1,5);
  case r of
    1:begin
        tr1.x.nw(random(1,3));
        tr1.nw;
        s:=tr1.s;
        tr1.derivative;
        rez:=rez+tr1.s+'\;dx';
      end;
    2:begin
        tr2.x.nw(random(1,3));
        tr2.nw;
        s:=tr2.s;
        tr2.derivative;
        rez:=rez+tr2.s+'\;dx';
      end;
    3:begin
        tr3.x.nw(random(1,3));
        tr3.nw;
        s:=tr3.s;
        tr3.derivative;
        rez:=rez+tr3.s+'\;dx';
      end;
    4:begin
        tr4.x.nw(random(1,3));
        tr4.nw;
        s:=tr4.s;
        tr4.derivative;
        rez:=rez+tr4.s+'\;dx';
      end;
    5:begin
        r:=random(1,2);
        f.nw(random(1,3));
        rez:=rez+'('+f.pltostr+')';
        while(r<>0)do
        begin
          g.nw(random(1,3));
          f:=f*g;
          rez:=rez+'('+g.pltostr+')';
          r:=r-1;
        end;
        f.integral;
        s:=correct(f.pltostr);
        rez:=rez+'\;dx';
      end;
   end;
   s:=correct(s);
   result:=rez;
end;

function taskderivative1(var s:string):string;
var
  sinx1,sinx2:sinx;
  cosx1,cosx2:cosx;
  tgx1,tgx2:tgx;
  ctgx1,ctgx2:ctgx;
  f,g:polynomial;
  r:integer;
  rez:string;
  bg,answ:string;
begin
  randomize;
  sinx1.x.nw(random(1,3));
  sinx1.nw;
  sinx2:=sinx1;
  sinx2.derivative;

  tgx1.x.nw(random(1,3));
  tgx1.nw;
  tgx2:=tgx1;
  tgx2.derivative;
  
  cosx1.x.nw(random(1,3));
  cosx1.nw;
  cosx2:=cosx1;
  cosx2.derivative;
  
  ctgx1.x.nw(random(1,3));
  ctgx1.nw;
  ctgx2:=ctgx1;
  ctgx2.derivative;
  
  r:=random(1,4);
  case r of
    1:begin
        rez:=rez+sinx1.s;
        answ:=sinx2.s;
      end;
    2:begin
        rez:=rez+cosx1.s;
        answ:=cosx2.s;
      end;
    3:begin
        rez:=rez+tgx1.s;
        answ:='('+tgx2.x.pltostr+')/(cos('+tgx1.x.pltostr+')^2)';
      end;
    4:begin
        rez:=rez+ctgx1.s;
        answ:='('+(-1*ctgx2.x).pltostr+'))/(sin('+ctgx1.x.pltostr+')^2)';
      end;
  end;
  bg:=rez;
  rez:='Find\; \frac{d}{dx}\;('+rez;
  rez:=rez+')';
  r:=random(1,2);
  f.nw(random(1,3));
  while(r>0)do
  begin
    g.nw(random(1,3));
    rez:=rez+'(';
    rez:=rez+g.pltostr;
    rez:=rez+')';
    f:=f*g;
    r:=r-1;
  end;
  rez:=rez+')';
  answ:='('+answ+')*('+g.pltostr+')+(';
  g.derivative;
  answ:=answ+bg+')*('+g.pltostr+')';
  s:=answ;
  s:=correct(s);
  result:=rez;
end;
function taskderivative2(var s:string):string;
var
  sinx1,sinx2:sinx;
  cosx1,cosx2:cosx;
  tgx1,tgx2:tgx;
  ctgx1,ctgx2:ctgx;
  f,g,st:polynomial;
  r:integer;
  rez:string;
  answ,bg:string;
begin
  randomize;
  sinx1.x.nw(random(1,3));
  sinx1.nw;
  sinx2:=sinx1;
  sinx2.derivative;

  tgx1.x.nw(random(1,3));
  tgx1.nw;
  tgx2:=tgx1;
  tgx2.derivative;
  
  cosx1.x.nw(random(1,3));
  cosx1.nw;
  cosx2:=cosx1;
  cosx2.derivative;
  
  ctgx1.x.nw(random(1,3));
  ctgx1.nw;
  ctgx2:=ctgx1;
  ctgx2.derivative;
  
  r:=random(1,4);
  case r of
    1:begin
        rez:=rez+sinx1.s;
        answ:=sinx2.s;
      end;
    2:begin
        rez:=rez+cosx1.s;
        answ:=cosx2.s;
      end;
    3:begin
        rez:=rez+tgx1.s;
        answ:='('+tgx2.x.pltostr+')/(cos('+tgx1.x.pltostr+')^2)';
      end;
    4:begin
        rez:=rez+ctgx1.s;
        answ:='('+(-1*ctgx2.x).pltostr+'))/(sin('+ctgx1.x.pltostr+')^2)';
      end;
  end;
  bg:=rez;
  rez:='Find\; \frac{d}{dx}\;('+rez;
  rez:=rez+')^{';
  f.nw(random(1,3));
  rez:=rez+f.pltostr+'}';
  st:=f;
  st.derivative;
  answ:='(('+bg+')^{'+f.pltostr+'})*(('+st.pltostr+')*ln('+bg+')+('+f.pltostr+')*('+answ+')/('+bg+')';
  s:=answ;
  s:=correct(s);
  result:=rez;
end;
procedure rand(var x:taskderivative);
var
  r:integer;
begin
  randomize;
  r:=random(1,2);
  case r of
    1:x.task:=taskderivative1(x.answer);
    2:x.task:=taskderivative2(x.answer);
  end;
end;
procedure rand(var x:tasklimits);
var
  r:integer;
begin
  randomize;
  r:=random(1,4);
  case r of
    1:x.task:=tasklimits1(x.answer);
    2:x.task:=tasklimits2(x.answer);
    3:x.task:=tasklimits3(x.answer);
    4:x.task:=tasklimits4(x.answer);
  end;
end;

end. 

