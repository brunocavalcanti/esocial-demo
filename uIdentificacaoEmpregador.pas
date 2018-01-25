unit uIdentificacaoEmpregador;

interface

uses
  Classes;

type
  TideEmpregador = class
  private
    FtpInsc: string;
    FnrInsc: string;
  public
    property tpInsc: string read FtpInsc write FtpInsc;
    property nrInsc: string read FnrInsc write FnrInsc;
    function gerarTX2_S1000(): WideString;
  end;

implementation

{ TideEmpregador }

function TideEmpregador.gerarTX2_S1000: WideString;
var
  Lista: TStringList;
begin
  Lista := TStringList.Create;
  Lista.Add('tpInsc_8=' + tpInsc);
  Lista.Add('nrInsc_9=' + nrInsc);
  Result := Lista.Text;
end;

end.

