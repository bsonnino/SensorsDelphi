unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, System.Sensors,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    PaintBox1: TPaintBox;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure PaintBox1Paint(Sender: TObject);
  private
  FBallPosition : Integer;
    FSensor: TCustomOrientationSensor;
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
  Sensor : TCustomSensor;
begin
  SensorManager := TSensorManager.Current;
  SensorManager.Activate;
  Sensors := SensorManager.GetSensorsByCategory(TSensorCategory.Orientation);
  for Sensor in Sensors do
    if TCustomOrientationSensor(Sensor).SensorType =
         TOrientationSensorType.Inclinometer3D then begin
      FSensor := TCustomOrientationSensor(Sensor);
      break;
    end;
  FBallPosition := ClientWidth div 2;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  TSensorManager.Current.Deactivate;
end;



procedure TForm1.PaintBox1Paint(Sender: TObject);
begin
  PaintBox1.Canvas.Brush.Color := clRed;
  PaintBox1.Canvas.Ellipse(FBallPosition-50,0,
     FBallPosition+50,100);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  Speed: Double;
begin
  Label1.Caption := FSensor.TiltX.ToString();
  Label2.Caption := FSensor.TiltY.ToString();
  Label3.Caption := FSensor.TiltZ.ToString();
  Speed := FSensor.TiltY;
  FBallPosition := Round(FBallPosition + Speed);
  if FBallPosition > ClientWidth-50 then
    FBallPosition := ClientWidth-50;
  if FBallPosition < 50 then
    FBallPosition := 50;
  PaintBox1.Invalidate;
end;

end.
