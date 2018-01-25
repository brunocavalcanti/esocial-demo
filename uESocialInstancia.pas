unit uESocialInstancia;

interface

uses
  Vcl.OleCtrls, SysUtils, ESocialClientX_TLB, uConfiguracoes, uEvento, uS1000;

type
  TeSocial = class
  private
    FComponente: TspdESocialClientX;
    FConfiguracao: TConfig;
    FEvento: TEvento;
    property Componente: TspdESocialClientX read FComponente write FComponente;
  public
    property Configuracao: TConfig read FConfiguracao write FConfiguracao;
    property Evento: TEvento read FEvento write FEvento;
    constructor Create;
    procedure configurarComponente();
    function gerarTX2(const AAcao: Integer = 1): WideString;
    function assinarXML(const AAcao: Integer = 1; const ATx2: WideString = ''): WideString;
    function enviarEvento(const AAcao: Integer = 1; const ATx2: WideString = ''; const idGrupoEvento: SmallInt = 1): IspdRetEnviarLoteEventos;
    function consultarEventos(AEvento: WideString): IspdRetConsultarLote;
    function listarCertificados: string;
    procedure alterarEvento(AEvento: TClass);
    const
      INCLUIR = 1;
      EXCLUIR = 2;
      ALTERAR = 3;
      TX2 = 4;
      const
      S1000 = 1000;

  end;

implementation

procedure TeSocial.alterarEvento(AEvento: TClass);
begin
  Evento := nil;
  Evento.Free;
  Evento := TS1000.Create;

end;

function TeSocial.assinarXML(const AAcao: Integer; const ATx2: WideString): WideString;
var
  Retorno: WideString;
begin
  if (AAcao = TX2) then
    Retorno := Componente.GerarXMLporTx2(ATx2)
  else
    Retorno := Componente.GerarXMLporTx2(Evento.gerarTX2(AAcao));

  Result := Componente.AssinarEvento(Retorno);
end;

procedure TeSocial.configurarComponente;
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

function TeSocial.consultarEventos(AEvento: WideString): IspdRetConsultarLote;
begin

end;

constructor TeSocial.Create;
begin
  inherited;
  Componente := TspdESocialClientX.create(nil);
//  Config := TConfiguracoes.Create();
end;

function TeSocial.enviarEvento(const AAcao: Integer; const ATx2: WideString; const idGrupoEvento: SmallInt): IspdRetEnviarLoteEventos;
begin

end;

function TeSocial.gerarTX2(const AAcao: Integer): WideString;
begin

end;

function TeSocial.listarCertificados: string;
begin
  Result := Componente.ListarCertificados(#13#10);
end;

end.

