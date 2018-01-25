unit uIdentificacaoEvento;

interface

uses
  Classes;

type
  TideEvento = class
  private
    FprocEmi: string;
    FverProc: string;
    FtpAmb: string;
  public
    property tpAmb: string read FtpAmb write FtpAmb;
    property procEmi: string read FprocEmi write FprocEmi;
    property verProc: string read FverProc write FverProc;
    function gerarTX2_S1000(): WideString;
  end;

implementation


{ TideEvento }

function TideEvento.gerarTX2_S1000: WideString;
var
  Lista: TStringList;
begin
  Lista := TStringList.Create;
  Lista.Add('tpAmb_4=' + tpAmb);
  Lista.Add('procEmi_5=' + procEmi);
  Lista.Add('verProc_6=' + verProc);
  Result := Lista.Text;
end;

end.

