unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, System.Sensors,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.Themes;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
  private
    FSensor: TCustomLightSensor;
    procedure OnDataChanged(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var
  SensorManager: TSensorManager;
  Sensors: TSensorArray;
  Sensor: TCustomSensor;
begin
  SensorManager := TSensorManager.Current;
  SensorManager.Activate;
  Sensors := SensorManager.GetSensorsByCategory(TSensorCategory.Light);
  if Length(Sensors) > 0 then begin
    FSensor := TCustomLightSensor(Sensors[0]);
    FSensor.OnDataChanged := OnDataChanged;
  end;
end;

procedure TForm1.FormDeactivate(Sender: TObject);
begin
  TSensorManager.Current.Deactivate;
end;

procedure TForm1.OnDataChanged(Sender: TObject);
begin
  if FSensor.Lux < 30 then begin
    Label1.Caption := 'Noite';
    TStyleManager.TrySetStyle('Windows10 Dark')
  end
  else begin
    Label1.Caption := 'Dia';
    TStyleManager.TrySetStyle('Windows10')
  end;
end;

end.
