unit uConfiguracoes;

interface
uses Classes;

type
  TConfig = class
  private
    FCpfCnpjEmpregador: string;
    FCpfCnpjTransmissor: string;
    FVersaoManual: ShortInt;
    FDiretorioTemplates: string;
    FAmbiente: ShortInt;
    FDiretorioEsquemas: string;
    FTokenSH: string;
    FCpnjSH: string;
    FCertificado: String;
  public
    destructor Destroy; override;
    constructor Create;
    property CpfCnpjEmpregador: string read FCpfCnpjEmpregador write FCpfCnpjEmpregador;
    property CpfCnpjTransmissor: string read FCpfCnpjTransmissor write FCpfCnpjTransmissor;
    property VersaoManual: ShortInt read FVersaoManual write FVersaoManual;
    property DiretorioTemplates: string read FDiretorioTemplates write FDiretorioTemplates;
    property DiretorioEsquemas: string read FDiretorioEsquemas write FDiretorioEsquemas;
    property CpnjSH: string read FCpnjSH write FCpnjSH;
    property TokenSH: string read FTokenSH write FTokenSH;
    property Ambiente: ShortInt read FAmbiente write FAmbiente;
    property Certificado: String read FCertificado write FCertificado;

  end;

implementation

{ Configuracoes }

constructor TConfig.Create;
begin
  inherited;
  Ambiente := 2;
  VersaoManual := 2;
end;

destructor TConfig.Destroy;
begin
  inherited;
end;
end.

