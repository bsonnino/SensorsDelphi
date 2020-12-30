unit Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Sensors,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects;

type
  TForm2 = class(TForm)
    PaintBox1: TPaintBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure PaintBox1Paint(Sender: TObject; Canvas: TCanvas);
  private
    FBallPosition: Integer;
    FSensor: TCustomOrientationSensor;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

procedure TForm2.FormCreate(Sender: TObject);
var
  SensorManager: TSensorManager;
  Sensors: TSensorArray;
  Sensor: TCustomSensor;
begin
  SensorManager := TSensorManager.Current;
  SensorManager.Activate;
  Sensors := SensorManager.GetSensorsByCategory(TSensorCategory.Orientation);
  for Sensor in Sensors do
    if TCustomOrientationSensor(Sensor).SensorType = TOrientationSensorType.Inclinometer3D
    then begin
      FSensor := TCustomOrientationSensor(Sensor);
      break;
    end;
  FBallPosition := ClientWidth div 2;
end;

procedure TForm2.FormDestroy(Sender: TObject);
begin
  TSensorManager.Current.Deactivate;
end;

procedure TForm2.PaintBox1Paint(Sender: TObject; Canvas: TCanvas);
begin
  PaintBox1.Canvas.FillEllipse(TRectF.Create(FBallPosition - 50, 0,
    FBallPosition + 50, 100),1,
    TStrokeBrush.Create(TBrushKind.Solid,TAlphaColorRec.Red));
end;

procedure TForm2.Timer1Timer(Sender: TObject);
var
  Speed: Double;
begin
  Label1.Text := FSensor.TiltX.ToString();
  Label2.Text := FSensor.TiltY.ToString();
  Label3.Text := FSensor.TiltZ.ToString();
  Speed := FSensor.TiltY;
  FBallPosition := Round(FBallPosition + Speed);
  if FBallPosition > ClientWidth - 50 then
    FBallPosition := ClientWidth - 50;
  if FBallPosition < 50 then
    FBallPosition := 50;
  PaintBox1.InvalidateRect(TRectF.Create(0, 0, PaintBox1.Width, PaintBox1.Height));
end;

end.
