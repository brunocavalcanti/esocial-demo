unit uS1000;

interface

uses
  uConfiguracoes, uIdentificacaoEmpregador, uIdentificacaoPeriodo,
  uInformacaoEmpregador, uIdentificacaoEmpregadorIsento, uInformacaoContato,
  uInformacaoOP, uInformacaoEFR, uInformacaoFederativo, uInformacaoSH,
  uInformacaoComplementarPJ, uInformacaoComplementarPF, uIdentificacaoEvento,
  Classes, Vcl.OleCtrls, ESocialClientX_TLB, uEvento;

type
  TS1000 = class(TEvento)
  private
    FIdentificacaoEmpregador: TideEmpregador;
    FConfiguracao: TConfig;
    FInformacaoEmpregador: TinfoCadastro;
    FIdentificacaoPeriodo: TidePeriodo;
    FIdentificacaoEmpregadorIsento: TdadosIsencao;
    FInformacaoContato: Tcontato;
    FInformacaoOP: TinfoOP;
    FInformacaoEFR: TinfoEFR;
    FInformacaoFederativo: TinfoEnte;
    FInformacaoSH: TsoftwareHouse;
    FInformacaoComplementarPJ: TsituacaoPJ;
    FInformacaoComplementarPF: TsituacaoPF;
    FideEvento: TideEvento;
    FComponente: TspdESocialClientX;
  public
    constructor Create();
    property Configuracao: TConfig read FConfiguracao write FConfiguracao;
    property IdentificacaoEvento: TideEvento read FideEvento write FideEvento;
    property IdentificacaoEmpregador: TideEmpregador read FIdentificacaoEmpregador write FIdentificacaoEmpregador;
    property IdentificacaoPeriodo: TidePeriodo read FIdentificacaoPeriodo write FIdentificacaoPeriodo;
    property InformacaoEmpregador: TinfoCadastro read FInformacaoEmpregador write FInformacaoEmpregador;
    property IdentificacaoEmpregadorIsento: TdadosIsencao read FIdentificacaoEmpregadorIsento write FIdentificacaoEmpregadorIsento;
    property InformacaoContato: Tcontato read FInformacaoContato write FInformacaoContato;
    property InformacaoOP: TinfoOP read FInformacaoOP write FInformacaoOP;
    property InformacaoEFR: TinfoEFR read FInformacaoEFR write FInformacaoEFR;
    property InformacaoFederativo: TinfoEnte read FInformacaoFederativo write FInformacaoFederativo;
    property InformacaoSH: TsoftwareHouse read FInformacaoSH write FInformacaoSH;
    property InformacaoComplementarPJ: TsituacaoPJ read FInformacaoComplementarPJ write FInformacaoComplementarPJ;
    property InformacaoComplementarPF: TsituacaoPF read FInformacaoComplementarPF write FInformacaoComplementarPF;
    property Componente: TspdESocialClientX read FComponente write FComponente;
    function gerarTX2(const AAcao: Integer = 1): WideString;overload;
    function assinarXML(const AAcao: Integer = 1; const ATx2: WideString = ''): WideString;
    function enviarEvento(const AAcao: Integer = 1; const ATx2: WideString = ''; const idGrupoEvento : SmallInt = 1): IspdRetEnviarLoteEventos;
    function consultarEventos(AEvento: WideString): IspdRetConsultarLote;
    procedure configurarComponente();
    function listarCertificados(): string;
    const
      INCLUIR = 1;
      EXCLUIR = 2;
      ALTERAR = 3;
      TX2 = 4;
  end;

implementation


{ TS1000 }

function TS1000.assinarXML(const AAcao: Integer = 1; const ATx2: WideString = ''): WideString;
var
  Retorno: WideString;
begin
  if (AAcao = TX2) then
    Retorno := Componente.GerarXMLporTx2(ATx2)
  else
    Retorno := Componente.GerarXMLporTx2(self.gerarTX2(AAcao));

  Result := Componente.AssinarEvento(Retorno);
end;

procedure TS1000.configurarComponente;
begin
  Componente.CpfCnpjTransmissor := Configuracao.CpfCnpjTransmissor;
  Componente.CpfCnpjEmpregador := Configuracao.CpfCnpjEmpregador;
  Componente.VersaoManual := Configuracao.VersaoManual;
  Componente.DiretorioTemplates := Configuracao.DiretorioTemplates;
  Componente.DiretorioEsquemas := Configuracao.DiretorioEsquemas;
  Componente.Ambiente := akPreProducaoReais;
  Componente.NomeCertificado := Configuracao.Certificado;
  Componente.ConfigurarSoftwareHouse(Configuracao.CpnjSH, Configuracao.TokenSH);
end;

function TS1000.consultarEventos(AEvento: WideString): IspdRetConsultarLote;
var
  retorno: IspdRetConsultarLote;
begin
  retorno := Componente.ConsultarLoteEventos(AEvento);
  Result := retorno;
end;

constructor TS1000.Create;
begin
  Configuracao := TConfig.Create;
  IdentificacaoEmpregador := TideEmpregador.Create;
  IdentificacaoPeriodo := TidePeriodo.Create;
  InformacaoEmpregador := TinfoCadastro.Create;
  IdentificacaoEmpregadorIsento := TdadosIsencao.Create;
  InformacaoContato := Tcontato.Create;
  InformacaoOP := TinfoOP.Create;
  InformacaoEFR := TinfoEFR.Create;
  InformacaoFederativo := TinfoEnte.Create;
  InformacaoSH := TsoftwareHouse.Create;
  InformacaoComplementarPJ := TsituacaoPJ.Create;
  InformacaoComplementarPF := TsituacaoPF.Create;
  IdentificacaoEvento := TideEvento.Create;
  Componente := TspdESocialClientX.Create(nil);

end;

function TS1000.enviarEvento(const AAcao: Integer = 1; const ATx2: WideString = '';const idGrupoEvento : SmallInt = 1): IspdRetEnviarLoteEventos;
var
  XML: WideString;
  RetEnvio: IspdRetEnviarLoteEventos;
begin
  XML := Self.assinarXML(AAcao, ATx2);
  RetEnvio := Componente.EnviarLoteEventos(XML, idGrupoEvento);
  Result := RetEnvio;
end;

function TS1000.gerarTX2(const AAcao: Integer = 1): WideString;
var
  Lista: TStringList;
begin
  Lista := TStringList.Create;
  case AAcao of
    INCLUIR:
      begin
        Lista.Add('INCLUIRS1000');
        Lista.Add('');
        Lista.Add(IdentificacaoEvento.gerarTX2_S1000());
        Lista.Add(IdentificacaoEmpregador.gerarTX2_S1000());
        Lista.Add(IdentificacaoPeriodo.gerarTX2_S1000());
        Lista.Add(InformacaoEmpregador.gerarTX2_S1000());
        Lista.Add(InformacaoContato.gerarTX2_S1000());
        Lista.Add(InformacaoComplementarPJ.gerarTX2_S1000());
        Lista.Add(InformacaoSH.gerarTX2_S1000());
        Lista.Add('');
        Lista.Add('SALVARS1000');
      end;
    EXCLUIR:
      begin
        Lista.Add('EXCLUIRS1000');
        Lista.Add('');
        Lista.Add(IdentificacaoEvento.gerarTX2_S1000());
        Lista.Add(IdentificacaoEmpregador.gerarTX2_S1000());
        Lista.Add(IdentificacaoPeriodo.gerarTX2_S1000());
        Lista.Add('');
        Lista.Add('SALVARS1000');
      end;
    ALTERAR:
      begin
        Lista.Add('ALTERARS1000');
        Lista.Add('');
        Lista.Add(IdentificacaoEvento.gerarTX2_S1000());
        Lista.Add(IdentificacaoEmpregador.gerarTX2_S1000());
        Lista.Add(IdentificacaoPeriodo.gerarTX2_S1000());
        Lista.Add(InformacaoEmpregador.gerarTX2_S1000());
        Lista.Add(InformacaoContato.gerarTX2_S1000());
        Lista.Add(InformacaoComplementarPJ.gerarTX2_S1000());
        Lista.Add(InformacaoSH.gerarTX2_S1000());
        Lista.Add('');
        Lista.Add('SALVARS1000');
      end;
  end;



//  Result := Lista.GetText;

  Result := Lista.Text;
end;

function TS1000.listarCertificados: string;
begin
  Result := Componente.ListarCertificados(#13#10);
end;

end.

