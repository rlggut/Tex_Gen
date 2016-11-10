unit texts;

interface

type usetext=record
  name:string;
  t:text;
  procedure close;
end;

implementation

procedure usetext.close;
begin
  closeFile(t);
end;

end. 