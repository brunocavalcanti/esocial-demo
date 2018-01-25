unit uIdentificacaoEmpregadorIsento;

interface

uses
  Classes, System.SysUtils;

type
  TdadosIsencao = class
  private
    FideMinLei: string;
    FdtProtRenov: string;
    FpagDou: string;
    FdtEmisCertif: string;
    FnrCertif: string;
    FnrProtRenov: string;
    FdtVencCertif: string;
    FdtDou: string;
  public
    property ideMinLei: string read FideMinLei write FideMinLei;
    property nrCertif: string read FnrCertif write FnrCertif;
    property dtEmisCertif: string read FdtEmisCertif write FdtEmisCertif;
    property dtVencCertif: string read FdtVencCertif write FdtVencCertif;
    property nrProtRenov: string read FnrProtRenov write FnrProtRenov;
    property dtProtRenov: string read FdtProtRenov write FdtProtRenov;
    property dtDou: string read FdtDou write FdtDou;
    property pagDou: string read FpagDou write FpagDou;
    function gerarTX2_S1000(): string;
  end;

implementation

{ TdadosIsencao }

function TdadosIsencao.gerarTX2_S1000: string;
var
  Lista: TStringList;
begin

  Lista := TStringList.Create;
  Lista.Add('ideMinLei_27=' + ideMinLei);
  Lista.Add('nrCertif_28=' + nrCertif);
  Lista.Add('dtEmisCertif_29=' + dtEmisCertif);
  Lista.Add('dtVencCertif_30=' + dtVencCertif);

  if (Trim(nrProtRenov) <> EmptyStr) then
    Lista.Add('nrProtRenov_31=' + nrProtRenov);

  if (Trim(dtProtRenov) <> EmptyStr) then
    Lista.Add('dtProtRenov_32=' + dtProtRenov);

  if (Trim(dtDou) <> EmptyStr) then
    Lista.Add('dtDou_33=' + dtDou);

  if (Trim(pagDou) <> EmptyStr) then
    Lista.Add('pagDou_34=' + pagDou);

  Result := Lista.Text;
end;

end.

