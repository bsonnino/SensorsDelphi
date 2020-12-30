unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, System.Types, System.Math, System.Sensors,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TPointArray = array of TPoint;

  TForm1 = class(TForm)
    Image1: TImage;
    PaintBox1: TPaintBox;
    Timer1: TTimer;
    procedure PaintBox1Paint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FAngle: Double;
    FSensor : TCustomOrientationSensor;
    procedure DrawCompass;
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
         TOrientationSensorType.Compass3D then begin
      FSensor := TCustomOrientationSensor(Sensor);
      Timer1.Enabled := true;
      break;
    end;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  TSensorManager.Current.Deactivate;
end;

procedure TForm1.PaintBox1Paint(Sender: TObject);
begin
  DrawCompass;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  if Assigned(FSensor) then begin
    FAngle := FSensor.CompMagHeading / 180 * Pi;
    PaintBox1.Invalidate;
  end;

end;

const
  Offset: Integer = 7;

function Rotate(const angle: Double; const aValues: TPointArray;
  const centerX, centerY: Double): TPointArray;
var
  i: Integer;
  r, p: Double;
begin
  if Length(aValues) > 0 then begin
    SetLength(result, Length(aValues));
    for i := 0 to Length(aValues) - 1 do begin
      r := sqrt(sqr(aValues[i].X - centerX) + sqr(aValues[i].Y - centerY));
      p := angle + arcTan2(aValues[i].Y - centerY, aValues[i].X - centerX);
      result[i].X := Round(centerX + r * cos(p));
      result[i].Y := Round(centerY + r * sin(p));
    end;
  end;
end;

procedure TForm1.DrawCompass;
var
  Points: TPointArray;
  AWidth: Integer;
  AHeight: Integer;
begin
  AWidth := ClientWidth;
  AHeight := ClientHeight;
  SetLength(Points, 3);
  Points[0] := Point(AWidth div 2 + Offset, 50);
  Points[1] := Point(AWidth div 2 - 35 + Offset, AHeight div 2);
  Points[2] := Point(AWidth div 2 + 35 + Offset, AHeight div 2);
  PaintBox1.Canvas.Brush.Color := clRed;
  PaintBox1.Canvas.Polygon(Rotate(FAngle,Points,AWidth div 2 + Offset, AHeight div 2));
  Points[0] := Point(AWidth div 2 + Offset, AHeight - 50);
  Points[1] := Point(AWidth div 2 - 35 + Offset, AHeight div 2);
  Points[2] := Point(AWidth div 2 + 35 + Offset, AHeight div 2);
  PaintBox1.Canvas.Brush.Color := clNavy;
  PaintBox1.Canvas.Polygon(Rotate(FAngle,Points,AWidth div 2 + Offset, AHeight div 2));
end;

end.
