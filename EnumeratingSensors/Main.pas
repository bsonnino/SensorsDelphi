unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  System.Sensors, Vcl.StdCtrls, Generics.Collections, Typinfo;

type
  TForm1 = class(TForm)
    cbSensors: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lbl1: TLabel;
    lbl5: TLabel;
    lbl4: TLabel;
    lbl3: TLabel;
    lbl8: TLabel;
    lbl7: TLabel;
    lbl2: TLabel;
    lbl6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure cbSensorsChange(Sender: TObject);
  private
    procedure RefreshSensorData;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.cbSensorsChange(Sender: TObject);
begin
  RefreshSensorData;
end;

procedure TForm1.RefreshSensorData;
var
  Sensor: TCustomSensor;
begin
  if cbSensors.ItemIndex >= 0 then begin
    Sensor := TCustomSensor(cbSensors.Items.Objects[cbSensors.ItemIndex]);
    Label1.Caption := Sensor.Description;
    Label2.Caption := GetEnumName(TypeInfo(TSensorCategory), Integer(Sensor.Category));
    Label3.Caption := Sensor.Manufacturer;
    Label4.Caption := Sensor.Model;
    Label5.Caption := Sensor.SerialNo;
    Label6.Caption := GetEnumName(TypeInfo(TSensorState), Integer(Sensor.State));
    Label7.Caption := DateTimeToStr(Sensor.TimeStamp);
    Label8.Caption := Sensor.UniqueId;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  SensorManager: TSensorManager;
  i: Integer;
begin
  SensorManager := TSensorManager.Current;
  SensorManager.Activate;
  try
    for i := 0 to SensorManager.Count - 1 do
      cbSensors.Items.AddObject(SensorManager.Sensors[i].Name,
        SensorManager.Sensors[i]);
    if SensorManager.Count > 0 then begin
      cbSensors.ItemIndex := 0;
      RefreshSensorData;
    end;
  finally
    SensorManager.Deactivate;
  end;
end;

end.
