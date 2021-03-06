unit uIdentificacaoPeriodo;

interface

uses
  Classes, SysUtils;

type
  TidePeriodo = class
  private
    FiniValid: string;
    FfimValid: string;
  public
    property iniValid: string read FiniValid write FiniValid;
    property fimValid: string read FfimValid write FfimValid;
    function gerarTX2_S1000(): WideString;
  end;

implementation

{ TidePeriodo }

function TidePeriodo.gerarTX2_S1000: WideString;
var
  Lista: TStringList;
begin
  Lista := TStringList.Create;
  Lista.Add('iniValid_13=' + FormatDateTime('YYYY-MM', StrToDateDef(iniValid, Now)));
  if (Trim(fimValid) <> EmptyStr) then
    Lista.Add('fimValid_14=' + FormatDateTime('YYYY-MM', StrToDateDef(fimValid, Now)));
  Result := Lista.Text;
end;

end.

