unit UserTex;

interface

type tex=record
  namefl:string;
  procedure newtex(s:string);
  procedure add(s:string);
  procedure closetex;
  procedure createpdf;
  procedure openpdf;
end;

implementation

procedure tex.newtex(s:string);
var
  t:text;
begin
  namefl:=s;
  assign(t,s+'.tex');
  rewrite(t);
  writeln(t,'\documentclass[12pt]{article}');
  writeln(t,'\usepackage{amsmath}');
  writeln(t,'%\usepackage[rus]{babel}');
  writeln(t,'%\usepackage[cp1251]{inputenc}');
  writeln(t,'\begin{document}');
  close(t);
end;
procedure tex.add(s:string);
var
  t:text;
begin
  assign(t,namefl+'.tex');
  append(t);
  writeln(t,'\[');
  writeln(t,s);
  writeln(t,'\]');
  close(t);  
end;
procedure tex.closetex;
var
  t:text;
begin
  assign(t,namefl+'.tex');
  append(t);
  writeln(t,'\end{document}');
  close(t);
end;
procedure tex.createpdf;
var
  p:System.Diagnostics.Process;
begin
  p:=new System.Diagnostics.Process();
  p.StartInfo.FileName:='pdflatex';
  p.StartInfo.Arguments:=namefl+'.tex';
  p.Start();
end;
procedure tex.openpdf;
var
  p:System.Diagnostics.Process;
begin
  p:=new System.Diagnostics.Process();
  p.StartInfo.FileName:=namefl+'.pdf';
  p.Start();
end;

end.