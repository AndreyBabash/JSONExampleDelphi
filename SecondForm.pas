unit SecondForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Memo.Types,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo, Json;

type
  TForm2 = class(TForm)
    Memo1: TMemo;
    Label1: TLabel;
    Memo2: TMemo;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    responsejson:string;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

procedure TForm2.Button1Click(Sender: TObject);
var JSON:TJSONObject; JSONArr:TJSONArray; i:integer;
begin
  Self.responsejson:=Form2.Memo1.Text;
  // ?????? ?????????? ????? ? ??????? ?? ???? ??????????
  JSON := TJSONObject.ParseJSONValue(responsejson) as TJSONObject;
  JSONArr:=TJSONArray(JSON.Get('Positions').JsonValue);

  for i:=0 to JSONArr.Count - 1 do
  begin
    Self.Memo2.Lines.Add('====================================================');
    Self.Memo2.Lines.Add('Lat: '+(TJSONPair(TJSONObject(JSONArr.Get(i)).Get('Lat')).JsonValue.Value));
    Self.Memo2.Lines.Add('Lng: '+(TJSONPair(TJSONObject(JSONArr.Get(i)).Get('Lng')).JsonValue.Value));
    Self.Memo2.Lines.Add('Time '+(TJSONPair(TJSONObject(JSONArr.Get(i)).Get('Time')).JsonValue.Value));
    Self.Memo2.Lines.Add('Speed: '+(TJSONPair(TJSONObject(JSONArr.Get(i)).Get('Speed')).JsonValue.Value));
    Self.Memo2.Lines.Add('====================================================');
  end;

end;

end.
