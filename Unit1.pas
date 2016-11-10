Unit Unit1;

interface

uses System, System.Drawing, System.Windows.Forms,mathUnit,taskMath,UserTex,texts;

type
  Form1 = class(System.Windows.Forms.Form)
    procedure button1_Click_EventHandler(sender: Object; e: EventArgs);
    procedure label1_Click_EventHandler(sender: Object; e: EventArgs);
    procedure Form1_Load_EventHandler(sender: Object; e: EventArgs);
    procedure label4_Click_EventHandler(sender: Object; e: EventArgs);
    procedure label5_Click_EventHandler(sender: Object; e: EventArgs);
    procedure button2_Click_EventHandler(sender: Object; e: EventArgs);
    procedure radioButton1_CheckedChanged_EventHandler(sender: Object; e: EventArgs);
    procedure radioButton2_CheckedChanged_EventHandler(sender: Object; e: EventArgs);
  {$region FormDesigner}
  private
    {$resource Unit1.Form1.resources}
    button1: System.Windows.Forms.Button;
    textBox1: System.Windows.Forms.TextBox;
    label1: System.Windows.Forms.Label;
    label2: System.Windows.Forms.Label;
    label3: System.Windows.Forms.Label;
    numericUpDown1: System.Windows.Forms.NumericUpDown;
    numericUpDown2: System.Windows.Forms.NumericUpDown;
    numericUpDown3: System.Windows.Forms.NumericUpDown;
    folderBrowserDialog1: System.Windows.Forms.FolderBrowserDialog;
    radioButton1: System.Windows.Forms.RadioButton;
    radioButton2: System.Windows.Forms.RadioButton;
    label4: System.Windows.Forms.Label;
    {$include Form1.inc}
  {$endregion FormDesigner}
  public
    constructor;
    begin
      InitializeComponent;
    end;
  end;

implementation

procedure Form1.button1_Click_EventHandler(sender: Object; e: EventArgs);
var
  taskder:taskderivative;
  tasklim:tasklimits;
  i:integer;
  g:tex;
  t:usetext;
  s,s1:string;
  flag:boolean;
  add:string;
begin
  s1:=textbox1.text;
  if(s1<>'')then
  begin
    add:='';
    if(radiobutton2.Checked)then
    begin
      folderBrowserDialog1.ShowDialog;
      add:=folderBrowserDialog1.SelectedPath+'\';
    end;
    g.newtex(add+s1);
    assign(t.t,add+s1+'.txt');
    rewrite(t.t);
    for i:=1 to strtoint(numericUpDown1.text) do
    begin
      sleep(50);
      rand(taskder);
      g.add(taskder.task);
      writeln(t.t,taskder.answer);
    end;
    for i:=1 to strtoint(numericUpDown2.text) do
    begin
      sleep(50);
      g.add(taskintegral1(s));
      writeln(t.t,s);
    end;
    for i:=1 to strtoint(numericUpDown3.text) do
    begin
      sleep(50);
      rand(tasklim);
      g.add(tasklim.task);
      writeln(t.t,tasklim.answer);
    end;
    closeFile(t.t);
    g.closetex;
    g.createpdf;
    sleep(3000);
    g.openpdf;
  end;
end;

procedure Form1.label1_Click_EventHandler(sender: Object; e: EventArgs);
begin
  
end;

procedure Form1.Form1_Load_EventHandler(sender: Object; e: EventArgs);
begin
  
end;

procedure Form1.label4_Click_EventHandler(sender: Object; e: EventArgs);
begin
  
end;

procedure Form1.label5_Click_EventHandler(sender: Object; e: EventArgs);
begin
  
end;

procedure Form1.button2_Click_EventHandler(sender: Object; e: EventArgs);
begin

end;

procedure Form1.radioButton1_CheckedChanged_EventHandler(sender: Object; e: EventArgs);
begin
  
end;

procedure Form1.radioButton2_CheckedChanged_EventHandler(sender: Object; e: EventArgs);
begin
  
end;

end.
