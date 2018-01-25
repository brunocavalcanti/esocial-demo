unit uInformacaoContato;

interface

uses
  System.Classes, System.SysUtils;

type
  Tcontato = class

  private
    Femail: string;
    FnmCtt: string;
    FcpfCtt: string;
    FfoneCel: string;
    FfoneFixo: string;
  public
    property nmCtt: string read FnmCtt write FnmCtt;
    property cpfCtt: string read FcpfCtt write FcpfCtt;
    property foneFixo: string read FfoneFixo write FfoneFixo;
    property foneCel: string read FfoneCel write FfoneCel;
    property email: string read Femail write Femail;
    function gerarTX2_S1000(): string;
  end;

implementation

{ Tcontato }

function Tcontato.gerarTX2_S1000: string;
var
  Lista: TStringList;
begin

  Lista := TStringList.Create;
  Lista.Add('nmCtt_36=' + nmCtt);
  Lista.Add('cpfCtt_37=' + cpfCtt);

  if (Trim(foneFixo) <> EmptyStr) then
    Lista.Add('foneFixo_38=' + foneFixo);

  if (Trim(foneCel) <> EmptyStr) then
    Lista.Add('foneCel_39=' + foneCel);

  if (Trim(email) <> EmptyStr) then
    Lista.Add('email_40=' + email);

  Result := Lista.Text;
end;

end.

