unit uUtil;

interface

uses
  System.Classes, System.Generics.Collections;

function gerarTX2(ALista: TDictionary<string, string>): WideString;

implementation

function gerarTX2(ALista: TDictionary<string, string>): WideString;
var
  Contador: Integer;
  Retorno: string;
begin

  Retorno := '';
  for Contador := 0 to ALista.Count - 1 do
  begin
//    Retorno := Retorno + #10#13 + ALista.Items[Contador] + '='

  end;

end;

end.

