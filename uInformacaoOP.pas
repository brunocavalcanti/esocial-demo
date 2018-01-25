unit uInformacaoOP;

interface
 uses Classes, System.SysUtils;
 type
  TinfoOP = class

    private
    FnrSiafi: String;

    public
    property nrSiafi: String read FnrSiafi write FnrSiafi;
     function gerarTX2_S1000(): string;
  end;

implementation

{ TinfoOP }

function TinfoOP.gerarTX2_S1000: string;
var
  Lista: TStringList;
begin
  Lista := TStringList.Create;
  Lista.Add('nrSiafi_42=' + nrSiafi);
  Result := Lista.Text;
end;

end.
