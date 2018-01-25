unit uEvento;

interface

type
  TEvento = class(TObject)
    public
     function gerarTX2(const AAcao: Integer = 1): WideString;

  end;

implementation

{ TEvento }

function TEvento.gerarTX2(const AAcao: Integer): WideString;
begin

end;

end.
