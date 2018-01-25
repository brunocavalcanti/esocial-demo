unit uInformacaoFederativo;

interface

uses
  Classes, System.SysUtils;

type
  TinfoEnte = class
  private
    Fuf: string;
    FnmEnte: string;
    FvrSubteto: string;
    FcodMunic: string;
    Fsubteto: string;
    FindRPPS: string;
  public
    property nmEnte: string read FnmEnte write FnmEnte;
    property uf: string read Fuf write Fuf;
    property codMunic: string read FcodMunic write FcodMunic;
    property indRPPS: string read FindRPPS write FindRPPS;
    property subteto: string read Fsubteto write Fsubteto;
    property vrSubteto: string read FvrSubteto write FvrSubteto;
    function gerarTX2_S1000(): WideString;
  end;

implementation

{ TinfoEnte }

function TinfoEnte.gerarTX2_S1000: WideString;
var
  Lista: TStringList;
begin
  Lista := TStringList.Create;
  Lista.Add('nmEnte_47=' + nmEnte);
  Lista.Add('uf_48=' + uf);
  if (Trim(codMunic) <> EmptyStr) then
    Lista.Add('codMunic_49=' + codMunic);

  Lista.Add('indRPPS_50=' + indRPPS);
  Lista.Add('subteto_51=' + subteto);
  Lista.Add('vrSubteto_52=' + vrSubteto);
  Result := Lista.Text;
end;

end.

