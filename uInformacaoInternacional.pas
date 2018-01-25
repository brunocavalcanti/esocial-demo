unit uInformacaoInternacional;

interface

uses
  Classes, System.SysUtils;

type
  TinfoOrgInternacional = class
  private
    FindAcordoIsenMulta: string;
  public
    property indAcordoIsenMulta: string read FindAcordoIsenMulta write FindAcordoIsenMulta;
    function gerarTX2_S1000(): WideString;
  end;

implementation

{ TinfoOrgInternacional }

function TinfoOrgInternacional.gerarTX2_S1000: WideString;
var
  Lista: TStringList;
begin
  Lista := TStringList.Create;
  Lista.Add('indAcordoIsenMulta_54=' + indAcordoIsenMulta);
  Result := Lista.Text;

end;

end.

