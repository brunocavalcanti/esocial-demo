unit uInformacaoSH;

interface

uses
  Classes, SysUtils;

type
  TsoftwareHouse = class
  private
    Ftelefone: string;
    Femail: string;
    FnmRazao: string;
    FnmCont: string;
    FcnpjSoftHouse: string;
  public
    property cnpjSoftHouse: string read FcnpjSoftHouse write FcnpjSoftHouse;
    property nmRazao: string read FnmRazao write FnmRazao;
    property nmCont: string read FnmCont write FnmCont;
    property telefone: string read Ftelefone write Ftelefone;
    property email: string read Femail write Femail;
    function gerarTX2_S1000(): WideString;
  end;

implementation

{ TsoftwareHouse }

function TsoftwareHouse.gerarTX2_S1000: WideString;
var
  Lista: TStringList;
begin
  Lista := TStringList.Create;
  Lista.Add('INCLUIRSOFTWAREHOUSE_55');
  Lista.Add('cnpjSoftHouse_56=' + cnpjSoftHouse);
  Lista.Add('nmRazao_57=' + nmRazao);
  if (Trim(email) <> EmptyStr) then
    Lista.Add('codMunic_49=' + email);

  Lista.Add('nmCont_58=' + nmCont);
  Lista.Add('telefone_59=' + telefone);
  Lista.Add('SALVARSOFTWAREHOUSE_55');
  Result := Lista.Text;
end;

end.

