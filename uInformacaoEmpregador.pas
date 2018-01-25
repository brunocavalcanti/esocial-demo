unit uInformacaoEmpregador;

interface

uses
  Classes, SysUtils;

type
  TinfoCadastro = class
  private
    FnmRazao: string;
    FindEtt: string;
    FindDesFolha: string;
    FindConstr: string;
    FclassTrib: string;
    FnatJurid: string;
    FindCoop: string;
    FnrRegEtt: string;
    FindEntEd: string;
    FindOptRegEletron: string;
  public
    property nmRazao: string read FnmRazao write FnmRazao;
    property classTrib: string read FclassTrib write FclassTrib;
    property natJurid: string read FnatJurid write FnatJurid;
    property indCoop: string read FindCoop write FindCoop;
    property indConstr: string read FindConstr write FindConstr;
    property indDesFolha: string read FindDesFolha write FindDesFolha;
    property indOptRegEletron: string read FindOptRegEletron write FindOptRegEletron;
    property indEntEd: string read FindEntEd write FindEntEd;
    property indEtt: string read FindEtt write FindEtT;
    property nrRegEtt: string read FnrRegEtt write FnrRegEtt;
    function gerarTX2_S1000(): string;
  end;

implementation

{ TinfoCadastro }

function TinfoCadastro.gerarTX2_S1000(): string;
var
  Lista: TStringList;
begin

  Lista := TStringList.Create;
  Lista.Add('nmRazao_15=' + nmRazao);
  Lista.Add('classTrib_16=' + classTrib);

  if (Trim(natJurid) <> EmptyStr) then
    Lista.Add('natJurid_17=' + natJurid);

  if (Trim(indCoop) <> EmptyStr) then
    Lista.Add('indCoop_18=' + indCoop);

  if (Trim(indConstr) <> EmptyStr) then
    Lista.Add('indConstr_19=' + indConstr);

  Lista.Add('indDesFolha_20=' + indDesFolha);
  Lista.Add('indOptRegEletron_21=' + indOptRegEletron);
  Lista.Add('indEntEd_23=' + indEntEd);
  Lista.Add('indEtt_24=' + indEtt);

  if (Trim(nrRegEtt) <> EmptyStr) then
    Lista.Add('nrRegEtt_25=' + nrRegEtt);

  Result := Lista.Text;
end;

end.

