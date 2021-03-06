unit uInformacaoComplementarPJ;

interface

uses
  Classes, System.SysUtils;

type
  TsituacaoPJ = class
  private
    FindSitPJ: string;
  public
    property indSitPJ: string read FindSitPJ write FindSitPJ;
    function gerarTX2_S1000(): WideString;
  end;

implementation

{ TsituacaoPJ }

function TsituacaoPJ.gerarTX2_S1000: WideString;
var
  Lista: TStringList;
begin
  Lista := TStringList.Create;
  Lista.Add('indSitPJ_63=' + indSitPJ);
  Result := Lista.Text;
end;

end.

