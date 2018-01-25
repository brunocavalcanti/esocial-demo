unit uInformacaoComplementarPF;

interface

uses
  Classes, System.SysUtils;

type
  TsituacaoPF = class
  private
    FindSitPF: string;
  public
    property indSitPF: string read FindSitPF write FindSitPF;
    function gerarTX2_S1000(): WideString;
  end;

implementation

{ TsituacaoPJ }

function TsituacaoPF.gerarTX2_S1000: WideString;
var
  Lista: TStringList;
begin
  Lista := TStringList.Create;
  Lista.Add('indSitPF_65=' + indSitPF);
  Result := Lista.Text;
end;

end.

