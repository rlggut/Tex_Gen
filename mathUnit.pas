unit mathUnit;

interface

type polynomial= record
     st:integer;//степень многочлена
     kof:array of real;//коэффициенты при x^i
     function into(x:real):real;
     class function operator+(a,b: polynomial): polynomial;
     var i,stn:integer;
        rez:polynomial;
     begin
        if(a.st>b.st)then stn:=a.st
        else stn:=b.st;
        setlength(rez.kof,stn+1);
        for i:=0 to stn do
          rez.kof[i]:=0;
        for i:=0 to stn do
        begin
          if(i<=a.st)then
            rez.kof[i]:=rez.kof[i]+a.kof[i];
          if(i<=b.st)then
            rez.kof[i]:=rez.kof[i]+b.kof[i];
        end;
        rez.st:=stn;
        result:=rez;
     end;
     class function operator-(a,b: polynomial): polynomial;
     var i,stn:integer;
      rez:polynomial;
     begin
        if(a.st>b.st)then stn:=a.st
        else stn:=b.st;
        setlength(rez.kof,stn+1);
        for i:=0 to stn do
          rez.kof[i]:=0;
        for i:=0 to stn do
        begin
          if(i<=a.st)then
            rez.kof[i]:=rez.kof[i]+a.kof[i];
          if(i<=b.st)then
            rez.kof[i]:=rez.kof[i]-b.kof[i];
        end;
        while(rez.kof[stn]=0)do
        begin
          setlength(rez.kof,stn);
          stn:=stn-1;
        end;
        rez.st:=stn;
        result:=rez;
     end;
     class function operator*(a,b: polynomial): polynomial;
     var i,j,stn:integer;
      rez:polynomial;
     begin
        stn:=a.st+b.st;
        setlength(rez.kof,stn+1);
        for i:=0 to stn do
          rez.kof[i]:=0;
        for i:=0 to a.st do
          for j:=0 to b.st do
          begin
            rez.kof[i+j]:=rez.kof[i+j]+a.kof[i]*b.kof[j];
          end;
        while(rez.kof[stn]=0)do
        begin
          setlength(rez.kof,stn);
          stn:=stn-1;
        end;
        rez.st:=stn;
        result:=rez;
     end;
     class function operator*(a:integer; b: polynomial): polynomial;
     var i:integer;
     begin
        for i:=0 to b.st do
          b.kof[i]:=a*b.kof[i];
        result:=b;
     end;
     class function operator in(a: polynomial; n:integer): polynomial;
     var i:integer;
      rez:polynomial;
     begin
        rez.st:=0;
        setlength(rez.kof,1);
        rez.kof[0]:=1;
        for i:=1 to n do
          rez:=rez*a;
        result:=rez;
     end;
     procedure nw(x:integer);
     function pltostr:string;//в строковую переменную
     procedure derivative;//производная
     procedure integral;//интеграл
end;
type polynomialwithroot= record
     st:integer;//степень многочлена
     root:array of integer;//корни многочлена
     kof:array of integer;//коэффициенты при x^i
     class function operator+(a,b: polynomialwithroot): polynomial;
     var i,stn:integer;
        rez:polynomial;
     begin
        if(a.st>b.st)then stn:=a.st
        else stn:=b.st;
        setlength(rez.kof,stn+1);
        for i:=0 to stn do
          rez.kof[i]:=0;
        for i:=0 to stn do
        begin
          if(i<=a.st)then
            rez.kof[i]:=rez.kof[i]+a.kof[i];
          if(i<=b.st)then
            rez.kof[i]:=rez.kof[i]+b.kof[i];
        end;
        rez.st:=stn;
        result:=rez;
     end;
     class function operator+(a: polynomialwithroot; b:polynomial): polynomial;
     var i,stn:integer;
        rez:polynomial;
     begin
        if(a.st>b.st)then stn:=a.st
        else stn:=b.st;
        setlength(rez.kof,stn+1);
        for i:=0 to stn do
          rez.kof[i]:=0;
        for i:=0 to stn do
        begin
          if(i<=a.st)then
            rez.kof[i]:=rez.kof[i]+a.kof[i];
          if(i<=b.st)then
            rez.kof[i]:=rez.kof[i]+b.kof[i];
        end;
        rez.st:=stn;
        result:=rez;
     end;
     class function operator+(b:polynomial; a: polynomialwithroot): polynomial;
//     var i:integer;
//        rez:polynomial;
     begin
        result:=a+b;
     end;     
     class function operator-(a,b: polynomialwithroot): polynomial;
     var i,stn:integer;
      rez:polynomial;
     begin
        if(a.st>b.st)then stn:=a.st
        else stn:=b.st;
        setlength(rez.kof,stn+1);
        for i:=0 to stn do
          rez.kof[i]:=0;
        for i:=0 to stn do
        begin
          if(i<=a.st)then
            rez.kof[i]:=rez.kof[i]+a.kof[i];
          if(i<=b.st)then
            rez.kof[i]:=rez.kof[i]-b.kof[i];
        end;
        while(rez.kof[stn]=0)do
        begin
          setlength(rez.kof,stn);
          stn:=stn-1;
        end;
        rez.st:=stn;
        result:=rez;
     end;
     class function operator-(a:polynomialwithroot; b:polynomial): polynomial;
     var i,stn:integer;
      rez:polynomial;
     begin
        if(a.st>b.st)then stn:=a.st
        else stn:=b.st;
        setlength(rez.kof,stn+1);
        for i:=0 to stn do
          rez.kof[i]:=0;
        for i:=0 to stn do
        begin
          if(i<=a.st)then
            rez.kof[i]:=rez.kof[i]+a.kof[i];
          if(i<=b.st)then
            rez.kof[i]:=rez.kof[i]-b.kof[i];
        end;
        while(rez.kof[stn]=0)do
        begin
          setlength(rez.kof,stn);
          stn:=stn-1;
        end;
        rez.st:=stn;
        result:=rez;
     end;
     class function operator-(b:polynomial; a:polynomialwithroot): polynomial;
     var i,stn:integer;
      rez:polynomial;
     begin
        if(a.st>b.st)then stn:=a.st
        else stn:=b.st;
        setlength(rez.kof,stn+1);
        for i:=0 to stn do
          rez.kof[i]:=0;
        for i:=0 to stn do
        begin
          if(i<=a.st)then
            rez.kof[i]:=rez.kof[i]+a.kof[i];
          if(i<=b.st)then
            rez.kof[i]:=rez.kof[i]-b.kof[i];
        end;
        while(rez.kof[stn]=0)do
        begin
          setlength(rez.kof,stn);
          stn:=stn-1;
        end;
        rez.st:=stn;
        result:=rez;
     end;
     class function operator*(a,b: polynomialwithroot): polynomialwithroot;
     var i,j,stn:integer;
      rez:polynomialwithroot;
     begin
        stn:=a.st+b.st;
        setlength(rez.kof,stn+1);
        for i:=0 to stn do
          rez.kof[i]:=0;
        for i:=0 to a.st do
          for j:=0 to b.st do
          begin
            rez.kof[i+j]:=rez.kof[i+j]+a.kof[i]*b.kof[j];
          end;
        while(rez.kof[stn]=0)do
        begin
          setlength(rez.kof,stn);
          stn:=stn-1;
        end;
        rez.st:=stn;
        setlength(rez.root,rez.st);
        for i:=0 to a.st-1 do
          rez.root[i]:=a.root[i];
        for i:=0 to b.st-1 do
          rez.root[a.st+i]:=b.root[i];
        result:=rez;
     end;
     class function operator*(a:polynomialwithroot; b:polynomial): polynomial;
     var i,j,stn:integer;
      rez:polynomial;
     begin
        stn:=a.st+b.st;
        setlength(rez.kof,stn+1);
        for i:=0 to stn do
          rez.kof[i]:=0;
        for i:=0 to a.st do
          for j:=0 to b.st do
          begin
            rez.kof[i+j]:=rez.kof[i+j]+a.kof[i]*b.kof[j];
          end;
        while(rez.kof[stn]=0)do
        begin
          setlength(rez.kof,stn);
          stn:=stn-1;
        end;
        rez.st:=stn;
        result:=rez;
     end;
     class function operator*(b:polynomial; a:polynomialwithroot): polynomial;
//     var i,j,stn:integer;
//      rez:polynomial;
     begin
      result:=a*b;
     end;
     class function operator in(a: polynomialwithroot; n:integer): polynomialwithroot;
     var i:integer;
      rez:polynomialwithroot;
     begin
        rez:=a;
        for i:=2 to n do
          rez:=rez*a;
        result:=rez;
     end;
     procedure nw;
     procedure roots(x:integer);
     function pltostr:string;
end;
type sinx= record
      x:polynomial;
      s:string;
      procedure nw;
      procedure derivative;//производная
end;
type cosx= record
      x:polynomial;
      s:string;
      procedure nw;
      procedure derivative;//производная
end;
type tgx= record
      x:polynomial;
      s:string;
      procedure nw;
      procedure derivative;//производная
end;
type ctgx= record
      x:polynomial;
      s:string;
      procedure nw;
      procedure derivative;//производная
end;
type sqrnpolynomial=record
    s:string;
    x:polynomial;
    n:integer;
    procedure nw(y,st:integer);
    procedure derivative;
end;
type lnx=record
    s:string;
    x:polynomial;
    procedure nw;
    procedure derivative;
end;
type ex=record
    s:string;
    f,x:polynomial;
    procedure nw;
    procedure derivative;
end;

implementation


procedure ex.nw;
begin
  x.nw(random(1,3));
  f.nw(random(1,3));
  s:=f.pltostr+'*e^{'+x.pltostr+'}';
end;
procedure ex.derivative;
begin
  s:='*e^{'+x.pltostr+'}';
  x.derivative;
  s:=(x*f).pltostr+s;
end;
procedure lnx.nw;
begin
  x.nw(random(1,3));
  s:='ln('+x.pltostr+')';
end;
procedure lnx.derivative;
begin
  s:='('+x.pltostr+')';
  x.derivative;
  s:='\frac{'+x.pltostr+'}{'+s+'}';
end;
procedure sqrnpolynomial.nw(y,st:integer);
begin
  n:=st;
  x.nw(y);
  x.kof[x.st]:=abs(x.kof[x.st]);
  s:='('+x.pltostr+')^{\frac{1}{'+inttostr(n)+'}}';
end;
procedure sqrnpolynomial.derivative;
begin
  s:='('+inttostr(n)+'*('+x.pltostr+')^{\cfrac{'+inttostr(n-1)+'}{'+inttostr(n)+'}}';
  x.derivative;
  s:='\frac{'+x.pltostr+'}{'+s+'}';
end;
function polynomialwithroot.pltostr:string;
var
  i:integer;
  s,s1:string;
begin
  s:='';
  for i:=st downto 1 do
  begin
    if(kof[i]<>0)then
    begin
      if(kof[i]>0)and(i<>st)then s:=s+'+';
      if(kof[i]=1)then s1:=''
      else
        if(kof[i]=-1)then s1:='-'
        else str(kof[i],s1);
      s:=s+s1+'x';
      if(i>1)then s:=s+'^{'+inttostr(i)+'}';
    end;
  end;
  if(kof[0]<>0)then
  begin
    if(kof[0]>0)and(st<>0)then s:=s+'+';
    str(kof[0],s1);
    s:=s+s1;
  end;
  result:=s;
end;


procedure polynomialwithroot.roots(x:integer);
var i:integer;
begin
  st:=x;
  setlength(root,st);
  for i:=0 to st-1 do
  begin
    root[i]:=random(-5,5);
  end;
  nw;
end;
procedure polynomialwithroot.nw;
var
  i,j,sum:integer;
  tk:array of integer;
  dop:integer;
begin
  setlength(kof,st+1);
  setlength(tk,st+1);
  for i:=0 to st-1 do
    kof[i]:=0;
  for i:=0 to st-1 do
  begin
    for j:=0 to st do
      tk[j]:=0;
    while(tk[st]=0)do
    begin
      sum:=0;
      for j:=0 to st-1 do
        sum:=sum+tk[j];
      if(sum=(i+1))then
      begin
        dop:=1;
        for j:=0 to st-1 do
          if(tk[j]=1)then
            dop:=dop*root[j];
        for j:=0 to i do
          dop:=-dop;
        kof[st-i-1]:=kof[st-i-1]+dop;
      end;
      tk[0]:=tk[0]+1;
      for j:=0 to st-1 do
      begin
        tk[j+1]:=tk[j+1]+(tk[j] div 2);
        tk[j]:=tk[j] mod 2;
      end;
    end;
  end;
  kof[st]:=1;
end;
procedure polynomial.nw(x:integer);
var
  i:integer;
begin
  st:=x;
  setlength(kof,st+1);
  for i:=0 to st do
    kof[i]:=random(-10,10);
  while(kof[st]=0)do
    kof[st]:=random(-10,10);
end;
procedure polynomial.integral;
var
  i:integer;
begin
  setlength(kof,st+2);
  for i:=st downto 1 do
    kof[i+1]:=kof[i]/i;
  kof[0]:=0;
  st:=st+1;
  setlength(kof,st+1);
end;
procedure polynomial.derivative;
var
  i:integer;
begin
  for i:=1 to st do
    kof[i-1]:=kof[i]*i;
  st:=st-1;
  setlength(kof,st+1);
end;
procedure write(z:polynomial);
var
  i:integer;
begin
  for i:=z.st downto 1 do
  begin
    if(z.kof[i]<>0)then
    begin
      if(z.kof[i]>0)and(i<>z.st)then write('+');
      write(z.kof[i],'x^',i);
    end;
  end;
  if(z.kof[0]<>0)then
  begin
    if(z.kof[0]>0)and(z.st<>0)then write('+');
    write(z.kof[0]);
  end;
end;
procedure write(t:text; z:polynomial);
var
  i:integer;
begin
  for i:=z.st downto 1 do
  begin
    if(z.kof[i]<>0)then
    begin
      if(z.kof[i]>0)and(i<>z.st)then write(t,'+');
      write(t,z.kof[i],'*x^',i);
    end;
  end;
  if(z.kof[0]<>0)then
  begin
    if(z.kof[0]>0)and(z.st<>0)then write(t,'+');
    write(t,z.kof[0]);
  end;
end;
function polynomial.pltostr:string;
var
  i:integer;
  s,s1:string;
begin
  s:='';
  for i:=st downto 1 do
  begin
    if(kof[i]<>0)then
    begin
      if(kof[i]>0)and(i<>st)then s:=s+'+';
      if(kof[i]=1)then s1:=''
      else
        if(kof[i]=-1)then s1:='-'
        else begin  str(kof[i],s1); s1:=s1+'*'; end;
      s:=s+s1+'x';
      if(i>1)then s:=s+'^{'+inttostr(i)+'}';
    end;
  end;
  if(kof[0]<>0)then
  begin
    if(kof[0]>0)and(st<>0)then s:=s+'+';
    str(kof[0],s1);
    s:=s+s1;
  end;
  result:=s;
end;


procedure sinx.nw;
begin
  s:='sin('+x.pltostr+')';
end;
procedure sinx.derivative;
var
  y:polynomial;
begin
  y:=x;
  s:='cos('+y.pltostr+')*';
  y.derivative;
  s:=s+'('+y.pltostr+')';
end;
procedure write(z:sinx);
begin
  write(z.s);
end;
procedure write(t:text; z:sinx);
begin
  write(t,z.s);
end;


procedure cosx.nw;
begin
  s:='cos('+x.pltostr+')';
end;
procedure cosx.derivative;
var
  y:polynomial;
begin
  y:=x;
  s:='-sin('+y.pltostr+')*';
  y.derivative;
  s:=s+'('+y.pltostr+')';
end;
procedure write(z:cosx);
begin
  write(z.s);
end;
procedure write(t:text; z:cosx);
begin
  write(t,z.s);
end;


procedure tgx.nw;
begin
  s:='tg('+x.pltostr+')';
end;
procedure tgx.derivative;
var
  y:polynomial;
begin
  y:=x;
  y.derivative;
  s:='\frac{'+y.pltostr+'}{cos^2('+x.pltostr+')}';
end;
procedure write(z:tgx);
begin
  write(z.s);
end;
procedure write(t:text; z:tgx);
begin
  write(t,z.s);
end;


procedure ctgx.nw;
begin
  s:='ctg('+x.pltostr+')';
end;
procedure ctgx.derivative;
var
  y:polynomial;
begin
  y:=x;
  y.derivative;
  s:='\frac{('+(-1*y).pltostr+')}{sin^2('+x.pltostr+')}';
end;
procedure write(z:ctgx);
begin
  write(z.s);
end;
procedure write(t:text; z:ctgx);
begin
  write(t,z.s);
end;
function polynomial.into(x:real):real;
var i:integer;
rez:real;
begin
  rez:=0;
  for i:=0 to st do
    rez:=rez+kof[i]*power(x,i);
  result:=rez;
end;

end.