unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Sensors, System.JSON,
  System.Sensors.Components, IPPeerClient, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    lbl1: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
  private

    procedure GetWeather(Latitude, Longitude: Double);
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
  LocationSensor: TCustomLocationSensor;
begin
  SensorManager := TSensorManager.Current;
  SensorManager.Activate;
  try
    Sensors := SensorManager.GetSensorsByCategory(TSensorCategory.Location);
    for Sensor in Sensors do
      if TCustomLocationSensor(Sensor).SensorType = TLocationSensorType.GPS then
      begin
        LocationSensor := TCustomLocationSensor(Sensor);
        GetWeather(LocationSensor.Latitude, LocationSensor.Longitude);
        break;
      end;
  finally
    SensorManager.Deactivate
  end;
end;

procedure TForm1.GetWeather(Latitude, Longitude: Double);
var
  jValue: TJSONObject;
  Main: TJSONObject;
  name: string;
  weatherArray: TJSONArray;
  weather: TJSONObject;
  wind: TJSONObject;
  i: Integer;
begin
  FormatSettings.DecimalSeparator := '.';
  RESTRequest1.Params[0].Value := Latitude.ToString();
  RESTRequest1.Params[1].Value := Longitude.ToString();
  RESTRequest1.Execute;
  jValue := RESTResponse1.JSONValue as TJSONObject;
  Label1.Caption := jValue.GetValue('name').ToString;
  Label2.Caption := Latitude.ToString();
  Label3.Caption := Longitude.ToString();
  jValue.TryGetValue('main', Main);
  Label4.Caption := Main.GetValue('temp').ToString;
  Label5.Caption := Main.GetValue('temp_max').ToString;
  Label6.Caption := Main.GetValue('temp_min').ToString;
  Label7.Caption := Main.GetValue('humidity').ToString;
  Label8.Caption := Main.GetValue('pressure').ToString;
  jValue.TryGetValue('weather', weatherArray);
  weather := weatherArray.Get(0) as TJSONObject;
  Label9.Caption := weather.GetValue('description').ToString;
  jValue.TryGetValue('wind', wind);
  Label10.Caption := wind.GetValue('speed').ToString;

end;

end.
