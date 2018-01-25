program eSocialDemo;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmeSocial},
  uConfiguracoes in 'uConfiguracoes.pas',
  uUtil in 'uUtil.pas',
  uS1000 in 'uS1000.pas',
  uIdentificacaoEvento in 'uIdentificacaoEvento.pas',
  uIdentificacaoEmpregador in 'uIdentificacaoEmpregador.pas',
  uIdentificacaoPeriodo in 'uIdentificacaoPeriodo.pas',
  uInformacaoEmpregador in 'uInformacaoEmpregador.pas',
  uIdentificacaoEmpregadorIsento in 'uIdentificacaoEmpregadorIsento.pas',
  uInformacaoContato in 'uInformacaoContato.pas',
  uInformacaoOP in 'uInformacaoOP.pas',
  uInformacaoEFR in 'uInformacaoEFR.pas',
  uInformacaoFederativo in 'uInformacaoFederativo.pas',
  uInformacaoInternacional in 'uInformacaoInternacional.pas',
  uInformacaoSH in 'uInformacaoSH.pas',
  uInformacaoComplementarPJ in 'uInformacaoComplementarPJ.pas',
  uInformacaoComplementarPF in 'uInformacaoComplementarPF.pas',
  uS1005 in 'uS1005.pas',
  uEvento in 'uEvento.pas',
  uESocialInstancia in 'uESocialInstancia.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmeSocial, frmeSocial);
  Application.Run;
end.
