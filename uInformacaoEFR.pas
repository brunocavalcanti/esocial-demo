unit uInformacaoEFR;

interface

uses
  Classes, System.SysUtils;

type
  TinfoEFR = class
  private
    FcnpjEFR: string;
    FideEFR: string;
  public
    property ideEFR: string read FideEFR write FideEFR;
    property cnpjEFR: string read FcnpjEFR write FcnpjEFR;
    function gerarTX2_S1000(): WideString;
  end;

implementation

{ TinfoEFR }

function TinfoEFR.gerarTX2_S1000: WideString;
var
  Lista: TStringList;
begin
  Lista := TStringList.Create;
  Lista.Add('ideEFR_44=' + ideEFR);
  if (Trim(cnpjEFR) <> EmptyStr) then
    Lista.Add('cnpjEFR_45=' + cnpjEFR);
  Result := Lista.Text;
end;

end.

