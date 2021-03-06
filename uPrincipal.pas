unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.OleCtrls,
  ESocialClientX_TLB, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Math, uS1000;

type
  TfrmeSocial = class(TForm)
    spdESocialClientX1: TspdESocialClientX;
    pgPrincipal: TPageControl;
    tsConfig: TTabSheet;
    pnPrincipal: TPanel;
    edtCpfEmpregador: TLabeledEdit;
    grpConfig: TGroupBox;
    edtCNPJCPFTransmisor: TLabeledEdit;
    cbVersaoManual: TComboBox;
    lblVersaoManual: TLabel;
    edtCaminhoSchemas: TLabeledEdit;
    edtCaminhoTemplates: TLabeledEdit;
    edtCnpjSH: TLabeledEdit;
    cbCertificados: TComboBox;
    lblCertificados: TLabel;
    edtTokenSH: TLabeledEdit;
    tsS1000: TTabSheet;
    btnEnviar: TBitBtn;
    btnSalvarConfig: TBitBtn;
    GroupBox1: TGroupBox;
    cbbtpAmb: TComboBox;
    lblAmb: TLabel;
    procEmi: TComboBox;
    Label1: TLabel;
    verProc: TLabeledEdit;
    GroupBox2: TGroupBox;
    tpInsc: TComboBox;
    Label2: TLabel;
    nrInsc: TLabeledEdit;
    GroupBox3: TGroupBox;
    iniValid: TDateTimePicker;
    lblInicio: TLabel;
    GroupBox4: TGroupBox;
    nmRazao: TLabeledEdit;
    classTrib: TLabeledEdit;
    natJurid: TLabeledEdit;
    indCoop: TComboBox;
    Label3: TLabel;
    indConstr: TComboBox;
    Label4: TLabel;
    indDesFolha: TComboBox;
    Label5: TLabel;
    indOptRegEletron: TComboBox;
    Label6: TLabel;
    indEntEd: TComboBox;
    Label7: TLabel;
    Label8: TLabel;
    indEtt: TComboBox;
    GroupBox5: TGroupBox;
    nmCtt: TLabeledEdit;
    cpfCtt: TLabeledEdit;
    foneFixo: TLabeledEdit;
    foneCel: TLabeledEdit;
    email: TLabeledEdit;
    GroupBox6: TGroupBox;
    indSitPJ: TComboBox;
    Label9: TLabel;
    mmResultado: TMemo;
    GroupBox7: TGroupBox;
    cnpjSoftHouse: TLabeledEdit;
    nmRazaoSH: TLabeledEdit;
    nmContSH: TLabeledEdit;
    telefoneSH: TLabeledEdit;
    BitBtn1: TBitBtn;
    LabeledEdit1: TLabeledEdit;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    tsTx2: TTabSheet;
    mmTx2: TMemo;
    Label10: TLabel;
    mmResultadoTx2: TMemo;
    Label11: TLabel;
    btntX2: TButton;
    GroupBox8: TGroupBox;
    idGrupoEvento: TComboBox;
    Label12: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnSalvarConfigClick(Sender: TObject);
    function ifThen(ABoolean: Boolean; AValorTrue: string; AValorFalse: string): string;
    procedure evento(const AAcao: Integer = 1; const AConsulta: Boolean = false; const mmResultado: TMemo = nil; const ATx2: WideString = '');
    procedure btnEnviarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure btntX2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmeSocial: TfrmeSocial;
  eSocial_S1000: TS1000;

implementation

{$R *.dfm}

procedure TfrmeSocial.BitBtn1Click(Sender: TObject);
begin
  evento(BitBtn1.Tag, true, mmResultado);
end;

procedure TfrmeSocial.BitBtn3Click(Sender: TObject);
begin
  evento(BitBtn3.Tag,False, mmResultado);
end;

procedure TfrmeSocial.btnEnviarClick(Sender: TObject);
begin
  evento(btnEnviar.Tag, False, mmResultado);
end;

procedure TfrmeSocial.btnSalvarConfigClick(Sender: TObject);
begin
  try
    eSocial_S1000.Configuracao.CpfCnpjEmpregador := edtCpfEmpregador.Text;
    eSocial_S1000.Configuracao.CpfCnpjTransmissor := edtCNPJCPFTransmisor.Text;
    eSocial_S1000.Configuracao.DiretorioTemplates := edtCaminhoTemplates.Text;
    eSocial_S1000.Configuracao.DiretorioEsquemas := edtCaminhoSchemas.Text;
    eSocial_S1000.Configuracao.CpnjSH := edtCnpjSH.Text;
    eSocial_S1000.Configuracao.TokenSH := edtTokenSH.Text;
    eSocial_S1000.Configuracao.Certificado := cbCertificados.Text;
    eSocial_S1000.configurarComponente();
//    ShowMessage('Componente configurado!');
  except
    on E: Exception do
      ShowMessage(E.Message);
  end;
end;

procedure TfrmeSocial.btntX2Click(Sender: TObject);
begin
  evento(eSocial_S1000.TX2, false, mmResultadoTx2, mmTx2.Lines.Text);
end;

procedure TfrmeSocial.evento(const AAcao: Integer = 1; const AConsulta: Boolean = false; const mmResultado: TMemo = nil; const ATx2: WideString = '');
var
  RetEnvio: IspdRetEnviarLoteEventos;
  RetConsulta: IspdRetConsultarLote;
  RetConsultaItem: IspdRetConsultarLoteItem;
  RetConsultaItemOcorrencia: IspdRetConsultarLoteOcorrencia;
  Contador, Contador2, Contador3: Integer;
  IdLote: WideString;
begin
  try
    btnSalvarConfigClick(self);
    mmResultado.Text := '';
    mmResultado.Lines.Clear;
    mmResultado.Lines.Add('.');
    mmResultado.Lines.Add('..');
    mmResultado.Lines.Add('...');
    mmResultado.Lines.Clear;
    mmResultado.Lines.EndUpdate;


    //Informa��es de Identifica��o do Evento.
    if not (AAcao = eSocial_S1000.TX2) then
    begin
      eSocial_S1000.IdentificacaoEvento.tpAmb := cbbtpAmb.ItemIndex.ToString;
      eSocial_S1000.IdentificacaoEvento.procEmi := (procEmi.ItemIndex + 1).ToString;
      eSocial_S1000.IdentificacaoEvento.verProc := verProc.Text;

    //Informa��es de identifica��o do empregador.

      eSocial_S1000.IdentificacaoEmpregador.tpInsc := (tpInsc.ItemIndex + 1).ToString;
      eSocial_S1000.IdentificacaoEmpregador.nrInsc := nrInsc.Text;

    //Per�odo de validade das informa��es

      eSocial_S1000.IdentificacaoPeriodo.iniValid := iniValid.ToString;

    //Informa��es do empregador.

      eSocial_S1000.InformacaoEmpregador.nmRazao := nmRazao.Text;
      eSocial_S1000.InformacaoEmpregador.classTrib := classTrib.Text;
      eSocial_S1000.InformacaoEmpregador.natJurid := natJurid.Text;
      eSocial_S1000.InformacaoEmpregador.indCoop := indCoop.ItemIndex.ToString;
      eSocial_S1000.InformacaoEmpregador.indConstr := indConstr.ItemIndex.ToString;
      eSocial_S1000.InformacaoEmpregador.indDesFolha := indDesFolha.ItemIndex.ToString;
      eSocial_S1000.InformacaoEmpregador.indOptRegEletron := indOptRegEletron.ItemIndex.ToString;
      eSocial_S1000.InformacaoEmpregador.indEntEd := Self.ifThen(indDesFolha.ItemIndex = 0, 'N', 'S');
      eSocial_S1000.InformacaoEmpregador.indEtt := Self.ifThen(indEtt.ItemIndex = 0, 'N', 'S');


    //Informa��es de contato.

      eSocial_S1000.InformacaoContato.nmCtt := nmCtt.Text;
      eSocial_S1000.InformacaoContato.cpfCtt := cpfCtt.Text;
      eSocial_S1000.InformacaoContato.foneFixo := foneFixo.Text;
      eSocial_S1000.InformacaoContato.foneCel := foneCel.Text;
      eSocial_S1000.InformacaoContato.email := email.Text;

    //Informa��es da PJ

      eSocial_S1000.InformacaoComplementarPJ.indSitPJ := indSitPJ.ItemIndex.ToString;

    //Software House
      eSocial_S1000.InformacaoSH.cnpjSoftHouse := cnpjSoftHouse.Text;
      eSocial_S1000.InformacaoSH.nmCont := nmContSH.Text;
      eSocial_S1000.InformacaoSH.telefone := telefoneSH.Text;
      eSocial_S1000.InformacaoSH.nmRazao := nmRazaoSH.Text;

    end;
    //ENVIAR

    mmResultado.Text := '';
    mmResultado.Lines.Clear;
    mmResultado.Lines.EndUpdate;
    Application.ProcessMessages;
    mmResultado.Lines.Add('ENVIANDO INFORMA��ES - ' + DateTimeToStr(Now));
    mmResultado.Lines.Add('');
    RetEnvio := eSocial_S1000.enviarEvento(AAcao, ATx2, idGrupoEvento.ItemIndex);
    mmResultado.Lines.Add(' ' + RetEnvio.Mensagem);
    mmResultado.Lines.Add('');
    if not (AConsulta) then
    begin
      mmResultado.Lines.Add('AGUARDANDO 20 SEGUNDOS PARA REALIZAR A CONSULTA');
      mmResultado.Lines.Add('');
      Sleep(20000);
      IdLote := RetEnvio.IdLote;
    end
    else
      IdLote := LabeledEdit1.Text;
    mmResultado.Lines.Add('ID LOTE: ' + IdLote);
    mmResultado.Lines.Add('');
    mmResultado.Lines.Add('CONSULTANDO');
    RetConsulta := eSocial_S1000.consultarEventos(IdLote);
    mmResultado.Lines.Add('');
    mmResultado.Lines.Add('#### RETORNO ####');
    mmResultado.Lines.Add(' N� PROTOCOLO: ' + RetConsulta.NumeroProtocolo);
    mmResultado.Lines.Add(' MENSAGEM: ' + RetConsulta.Mensagem);
    mmResultado.Lines.Add(' STATUS: ' + RetConsulta.Status);
    for Contador := 0 to Pred(RetConsulta.Count) do
    begin
      mmResultado.Lines.Add('');
      RetConsultaItem := RetConsulta.Eventos[Contador];
      mmResultado.Lines.Add('   EVENTO: ' + Contador.ToString);
      mmResultado.Lines.Add('   ID EVENTO:  ' + RetConsultaItem.IdEvento);
      mmResultado.Lines.Add('   N� RECIBO: ' + RetConsultaItem.NumeroRecibo);
      mmResultado.Lines.Add('   C�DIGO STATUS: ' + RetConsultaItem.cStat);
      mmResultado.Lines.Add('   MENSAGEM: ' + RetConsultaItem.Mensagem);
      mmResultado.Lines.Add('   STATUS DO EVENTO: ' + RetConsultaItem.Status);
      for Contador2 := 0 to Pred(RetConsultaItem.Count) do
      begin
        RetConsultaItemOcorrencia := RetConsultaItem.Ocorrencias[Contador2];
        mmResultado.Lines.Add('            OCORRENCIA: ' + Contador2.ToString);
        mmResultado.Lines.Add('            C�DIGO: ' + RetConsultaItemOcorrencia.Codigo);
        mmResultado.Lines.Add('            DESCRI��O: ' + RetConsultaItemOcorrencia.Descricao);
        mmResultado.Lines.Add('            TIPO: ' + RetConsultaItemOcorrencia.Tipo);
      end;

    end;
    mmResultado.Lines.EndUpdate;
  except
    on E: Exception do

      ShowMessage(E.Message);
  end;
end;

procedure TfrmeSocial.FormCreate(Sender: TObject);
begin
  eSocial_S1000 := TS1000.Create;
  cbCertificados.Items.Clear;
  cbCertificados.Items.Text := eSocial_S1000.listarCertificados();
  cbCertificados.ItemIndex := 0;

end;

function TfrmeSocial.ifThen(ABoolean: Boolean; AValorTrue, AValorFalse: string): string;
begin
  if (ABoolean) then
    Result := AValorTrue
  else
    Result := AValorFalse;
end;

end.

