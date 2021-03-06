unit Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Memo.Types,
  FMX.StdCtrls, FMX.ScrollBox, FMX.Memo, FMX.Controls.Presentation, Json;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Memo2: TMemo;
    Label1: TLabel;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    responsejson:string;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses SecondForm;

procedure TForm1.Button1Click(Sender: TObject);
var JSON, JSONMain, JSONClouds:TJSONObject; JSONArr: TJSONArray;   i:integer;
begin
  responsejson:=Memo1.Text;
  // ?????? ?????????? ????? ? ??????? ?? ???? ??????????
  JSON := TJSONObject.ParseJSONValue(responsejson) as TJSONObject;
  JSONArr:=TJSONArray(JSON.Get('weather').JsonValue);
  JSONMain:=TJSONObject(JSON.Get('main').JsonValue);
  JSONClouds:=TJSONObject(JSON.Get('clouds').JsonValue);

  // ?????? ???????
  for i:=0 to JSONArr.Count-1 do
  begin
    Memo2.Lines.Add('Array weather: ===============================================');
    Memo2.Lines.Add('Id: '+(TJSONPair(TJSONObject(JSONArr.Get(0)).Get('id')).JsonValue.Value));
    Memo2.Lines.Add('main: '+(TJSONPair(TJSONObject(JSONArr.Get(0)).Get('main')).JsonValue.Value));
    Memo2.Lines.Add('description: '+(TJSONPair(TJSONObject(JSONArr.Get(0)).Get('description')).JsonValue.Value));
    Memo2.Lines.Add('icon: '+(TJSONPair(TJSONObject(JSONArr.Get(0)).Get('icon')).JsonValue.Value));
    Memo2.Lines.Add('===========================================================');
  end;
  // ?????? ?????????
    Memo2.Lines.Add('main:======================================================');
    Memo2.Lines.Add('temp: '+JSONMain.GetValue('temp').Value);
    Memo2.Lines.Add('pressure: '+JSONMain.GetValue('pressure').Value);
  // ?????? ?????????
    Memo2.Lines.Add('clouds:======================================================');
    Memo2.Lines.Add('all: '+JSONClouds.GetValue('all').Value);

  //  ???????? ????-????????
    Memo2.Lines.Add('name:======================================================');
    Memo2.Lines.Add('name: '+JSON.GetValue('name').Value);
    Memo2.Lines.Add('id:======================================================');
    Memo2.Lines.Add('id: '+JSON.GetValue('id').Value);
    Memo2.Lines.Add('base:======================================================');
    Memo2.Lines.Add('base: '+JSON.GetValue('base').Value);

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Form2.Show;
end;

end.
