object frmeSocial: TfrmeSocial
  Left = 0
  Top = 0
  Caption = 'Demo e-Social'
  ClientHeight = 830
  ClientWidth = 1133
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object spdESocialClientX1: TspdESocialClientX
    Left = 816
    Top = 64
    Width = 26
    Height = 26
    ControlData = {
      54504630185441637469766558436F6D706F6E656E74436F6E74726F6C00044C
      656674020003546F700200055769647468021A06486569676874021A0000}
  end
  object pgPrincipal: TPageControl
    Left = 0
    Top = 0
    Width = 1133
    Height = 830
    ActivePage = tsS1000
    Align = alClient
    TabOrder = 1
    object tsConfig: TTabSheet
      Caption = 'Configura'#231#245'es'
      object pnPrincipal: TPanel
        Left = 0
        Top = 0
        Width = 1125
        Height = 802
        Align = alClient
        TabOrder = 0
        object grpConfig: TGroupBox
          Left = 1
          Top = 1
          Width = 1123
          Height = 216
          Align = alTop
          TabOrder = 0
          object lblVersaoManual: TLabel
            Left = 16
            Top = 112
            Width = 85
            Height = 13
            Caption = 'Vers'#227'o do Manual'
          end
          object lblCertificados: TLabel
            Left = 16
            Top = 159
            Width = 57
            Height = 13
            Caption = 'Certificados'
          end
          object edtCpfEmpregador: TLabeledEdit
            Left = 16
            Top = 31
            Width = 289
            Height = 21
            EditLabel.Width = 109
            EditLabel.Height = 13
            EditLabel.Caption = 'CNPJ/CPF Empregador'
            TabOrder = 0
            Text = '08187168000160'
          end
          object edtCNPJCPFTransmisor: TLabeledEdit
            Left = 16
            Top = 79
            Width = 289
            Height = 21
            EditLabel.Width = 108
            EditLabel.Height = 13
            EditLabel.Caption = 'CNPJ/CPF Transmissor'
            TabOrder = 1
            Text = '08187168000160'
          end
          object cbVersaoManual: TComboBox
            Left = 16
            Top = 127
            Width = 289
            Height = 22
            Style = csOwnerDrawFixed
            ItemIndex = 0
            TabOrder = 2
            Text = 'vm24'
            Items.Strings = (
              'vm24')
          end
          object edtCaminhoSchemas: TLabeledEdit
            Left = 432
            Top = 31
            Width = 289
            Height = 21
            EditLabel.Width = 92
            EditLabel.Height = 13
            EditLabel.Caption = 'Caminho Esquemas'
            TabOrder = 3
            Text = 'C:\Program Files\TecnoSpeed\eSocial\Arquivos\Esquemas\'
          end
          object edtCaminhoTemplates: TLabeledEdit
            Left = 432
            Top = 79
            Width = 289
            Height = 21
            EditLabel.Width = 93
            EditLabel.Height = 13
            EditLabel.Caption = 'Caminho Templates'
            TabOrder = 4
            Text = 'C:\Program Files\TecnoSpeed\eSocial\Arquivos\Templates\'
          end
          object edtCnpjSH: TLabeledEdit
            Left = 432
            Top = 127
            Width = 289
            Height = 21
            EditLabel.Width = 105
            EditLabel.Height = 13
            EditLabel.Caption = 'CNPJ Software House'
            TabOrder = 5
            Text = '00960114000183'
          end
          object cbCertificados: TComboBox
            Left = 16
            Top = 175
            Width = 289
            Height = 22
            Style = csOwnerDrawFixed
            ItemIndex = 0
            TabOrder = 6
            Text = 'vm24'
            Items.Strings = (
              'vm24')
          end
          object edtTokenSH: TLabeledEdit
            Left = 432
            Top = 175
            Width = 289
            Height = 21
            EditLabel.Width = 109
            EditLabel.Height = 13
            EditLabel.Caption = 'Token Software House'
            TabOrder = 7
            Text = 'YL9BPu8YZc2IzmraHQbXOcc6vPE2UB33JLfnaTre'
          end
        end
        object btnSalvarConfig: TBitBtn
          Left = 1
          Top = 751
          Width = 1123
          Height = 50
          Align = alBottom
          Caption = '&Configurar'
          TabOrder = 1
          OnClick = btnSalvarConfigClick
        end
      end
    end
    object tsS1000: TTabSheet
      Caption = 'S-1000'
      ImageIndex = 1
      object btnEnviar: TBitBtn
        Tag = 1
        Left = 575
        Top = 577
        Width = 547
        Height = 50
        Align = alCustom
        Caption = '&Enviar Evento'
        TabOrder = 0
        OnClick = btnEnviarClick
      end
      object GroupBox1: TGroupBox
        Left = 3
        Top = 3
        Width = 310
        Height = 142
        Caption = 'Informa'#231#245'es de Identifica'#231#227'o do Evento'
        TabOrder = 1
        object lblAmb: TLabel
          Left = 13
          Top = 16
          Width = 124
          Height = 13
          Caption = 'Identifica'#231#227'o do ambiente'
        end
        object Label1: TLabel
          Left = 13
          Top = 56
          Width = 151
          Height = 13
          Caption = 'Processo de emiss'#227'o do evento'
        end
        object cbbtpAmb: TComboBox
          Left = 13
          Top = 29
          Width = 228
          Height = 22
          Style = csOwnerDrawFixed
          Enabled = False
          ItemIndex = 2
          TabOrder = 0
          Text = 'Produ'#231#227'o restrita'
          Items.Strings = (
            ''
            ''
            'Produ'#231#227'o restrita')
        end
        object procEmi: TComboBox
          Left = 13
          Top = 69
          Width = 228
          Height = 22
          Style = csOwnerDrawFixed
          ItemIndex = 0
          TabOrder = 1
          Text = '1- Aplicativo do empregador'
          Items.Strings = (
            '1- Aplicativo do empregador'
            '2 - Aplicativo governamental')
        end
        object verProc: TLabeledEdit
          Left = 13
          Top = 112
          Width = 228
          Height = 21
          EditLabel.Width = 202
          EditLabel.Height = 13
          EditLabel.Caption = 'Vers'#227'o do processo de emiss'#227'o do evento'
          TabOrder = 2
          Text = '1.0'
        end
      end
      object GroupBox2: TGroupBox
        Left = 319
        Top = 3
        Width = 250
        Height = 142
        Caption = 'Informa'#231#245'es de identifica'#231#227'o do empregado'
        TabOrder = 2
        object Label2: TLabel
          Left = 13
          Top = 16
          Width = 91
          Height = 13
          Caption = 'Tipo do documento'
        end
        object tpInsc: TComboBox
          Left = 13
          Top = 29
          Width = 228
          Height = 22
          Style = csOwnerDrawFixed
          ItemIndex = 0
          TabOrder = 0
          Text = '1 - CNPJ'
          Items.Strings = (
            '1 - CNPJ'
            '2 - CPF')
        end
        object nrInsc: TLabeledEdit
          Left = 13
          Top = 70
          Width = 228
          Height = 21
          EditLabel.Width = 54
          EditLabel.Height = 13
          EditLabel.Caption = 'Documento'
          TabOrder = 1
          Text = '08187168'
        end
      end
      object GroupBox3: TGroupBox
        Left = 3
        Top = 151
        Width = 310
        Height = 74
        Align = alCustom
        Caption = 'Per'#237'odo de validade das informa'#231#245'es '
        TabOrder = 3
        object lblInicio: TLabel
          Left = 13
          Top = 16
          Width = 25
          Height = 13
          Caption = 'In'#237'cio'
        end
        object iniValid: TDateTimePicker
          Left = 13
          Top = 32
          Width = 228
          Height = 21
          Date = 43123.401705567130000000
          Time = 43123.401705567130000000
          ParseInput = True
          TabOrder = 0
        end
      end
      object GroupBox4: TGroupBox
        Left = 3
        Top = 231
        Width = 310
        Height = 402
        Caption = 'Informa'#231#245'es do empregador'
        TabOrder = 4
        object Label3: TLabel
          Left = 13
          Top = 136
          Width = 122
          Height = 13
          Caption = 'Indicativo de cooperativa'
        end
        object Label4: TLabel
          Left = 13
          Top = 178
          Width = 121
          Height = 13
          Caption = 'Indicativo de construtora'
        end
        object Label5: TLabel
          Left = 13
          Top = 218
          Width = 169
          Height = 13
          Caption = 'Indicativo de desonera'#231#227'o da folha'
        end
        object Label6: TLabel
          Left = 13
          Top = 259
          Width = 167
          Height = 13
          Caption = 'Registro eletr'#244'nico de empregados'
        end
        object Label7: TLabel
          Left = 13
          Top = 300
          Width = 248
          Height = 13
          Caption = 'Indicativo de entidade educativa sem fins lucrativos'
        end
        object Label8: TLabel
          Left = 13
          Top = 342
          Width = 219
          Height = 13
          Caption = 'Indicativo de empresa de trabalho tempor'#225'rio'
        end
        object nmRazao: TLabeledEdit
          Left = 13
          Top = 32
          Width = 284
          Height = 21
          EditLabel.Width = 102
          EditLabel.Height = 13
          EditLabel.Caption = 'Nome do contribuinte'
          TabOrder = 0
          Text = 'TECNOSPEED SA'
        end
        object classTrib: TLabeledEdit
          Left = 13
          Top = 72
          Width = 284
          Height = 21
          EditLabel.Width = 108
          EditLabel.Height = 13
          EditLabel.Caption = 'Classifica'#231#227'o tribut'#225'ria'
          TabOrder = 1
          Text = '99'
        end
        object natJurid: TLabeledEdit
          Left = 13
          Top = 112
          Width = 284
          Height = 21
          EditLabel.Width = 206
          EditLabel.Height = 13
          EditLabel.Caption = 'C'#243'digo da natureza jur'#237'dica do contribuinte'
          TabOrder = 2
          Text = '2054'
        end
        object indCoop: TComboBox
          Left = 13
          Top = 152
          Width = 284
          Height = 22
          Style = csOwnerDrawFixed
          ItemIndex = 0
          TabOrder = 3
          Text = '0 - N'#227'o '#233' cooperativa'
          Items.Strings = (
            '0 - N'#227'o '#233' cooperativa'
            '1 - Cooperativa de Trabalho'
            '2 - Cooperativa de Produ'#231#227'o'
            '3 - Outras Cooperativas')
        end
        object indConstr: TComboBox
          Left = 13
          Top = 194
          Width = 284
          Height = 22
          Style = csOwnerDrawFixed
          ItemIndex = 0
          TabOrder = 4
          Text = '0 - N'#227'o '#233' Construtora'
          Items.Strings = (
            '0 - N'#227'o '#233' Construtora'
            '1 - Empresa Construtora')
        end
        object indDesFolha: TComboBox
          Left = 13
          Top = 234
          Width = 284
          Height = 22
          Style = csOwnerDrawFixed
          ItemIndex = 0
          TabOrder = 5
          Text = '0 - N'#227'o Aplic'#225'vel'
          Items.Strings = (
            '0 - N'#227'o Aplic'#225'vel'
            '1 - Empresa enquadrada nos art. 7'#186' a 9'#186' da Lei 12.546/2011')
        end
        object indOptRegEletron: TComboBox
          Left = 13
          Top = 275
          Width = 284
          Height = 22
          Style = csOwnerDrawFixed
          ItemIndex = 0
          TabOrder = 6
          Text = '0 - N'#227'o optou pelo registro eletr'#244'nico de empregados'
          Items.Strings = (
            '0 - N'#227'o optou pelo registro eletr'#244'nico de empregados'
            '1 - Optou pelo registro eletr'#244'nico de empregados')
        end
        object indEntEd: TComboBox
          Left = 13
          Top = 316
          Width = 284
          Height = 22
          Style = csOwnerDrawFixed
          ItemIndex = 0
          TabOrder = 7
          Text = 'N - N'#227'o'
          Items.Strings = (
            'N - N'#227'o'
            'S - Sim')
        end
        object indEtt: TComboBox
          Left = 13
          Top = 358
          Width = 284
          Height = 22
          Style = csOwnerDrawFixed
          ItemIndex = 0
          TabOrder = 8
          Text = 'N - N'#227'o'
          Items.Strings = (
            'N - N'#227'o'
            'S - Sim')
        end
      end
      object GroupBox5: TGroupBox
        Left = 319
        Top = 231
        Width = 250
        Height = 231
        Caption = 'Informa'#231#245'es de contato'
        TabOrder = 5
        object nmCtt: TLabeledEdit
          Left = 13
          Top = 32
          Width = 196
          Height = 21
          EditLabel.Width = 141
          EditLabel.Height = 13
          EditLabel.Caption = 'Nome do contato na empresa'
          TabOrder = 0
          Text = 'Jo'#227'o da Silva'
        end
        object cpfCtt: TLabeledEdit
          Left = 13
          Top = 72
          Width = 196
          Height = 21
          EditLabel.Width = 129
          EditLabel.Height = 13
          EditLabel.Caption = 'N'#250'mero do CPF do contato'
          TabOrder = 1
          Text = '52406715167'
        end
        object foneFixo: TLabeledEdit
          Left = 13
          Top = 112
          Width = 196
          Height = 21
          EditLabel.Width = 145
          EditLabel.Height = 13
          EditLabel.Caption = 'N'#250'mero do telefone, com DDD'
          TabOrder = 2
          Text = '7867834687'
        end
        object foneCel: TLabeledEdit
          Left = 13
          Top = 152
          Width = 196
          Height = 21
          EditLabel.Width = 126
          EditLabel.Height = 13
          EditLabel.Caption = 'Telefone celular, com DDD'
          TabOrder = 3
          Text = '4430379500'
        end
        object email: TLabeledEdit
          Left = 13
          Top = 192
          Width = 196
          Height = 21
          EditLabel.Width = 24
          EditLabel.Height = 13
          EditLabel.Caption = 'Email'
          TabOrder = 4
          Text = 'bruno.prado@tecnospeed.com.br'
        end
      end
      object GroupBox6: TGroupBox
        Left = 319
        Top = 468
        Width = 250
        Height = 165
        Caption = 'Informa'#231#245'es Complementares - Pessoa Jur'#237'dica'
        TabOrder = 6
        object Label9: TLabel
          Left = 13
          Top = 22
          Width = 169
          Height = 13
          Caption = 'Indicativo de desonera'#231#227'o da folha'
        end
        object indSitPJ: TComboBox
          Left = 13
          Top = 38
          Width = 196
          Height = 22
          Style = csOwnerDrawFixed
          ItemIndex = 0
          TabOrder = 0
          Text = '0 - Situa'#231#227'o Normal'
          Items.Strings = (
            '0 - Situa'#231#227'o Normal'
            '1 - Extin'#231#227'o'
            '2 - Fus'#227'o'
            '3 - Cis'#227'o'
            '4 - Incorpora'#231#227'o')
        end
      end
      object mmResultado: TMemo
        Left = 575
        Top = 3
        Width = 547
        Height = 568
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
      end
      object GroupBox7: TGroupBox
        Left = 3
        Top = 639
        Width = 566
        Height = 105
        Caption = 'Software House'
        TabOrder = 8
        object cnpjSoftHouse: TLabeledEdit
          Left = 13
          Top = 32
          Width = 200
          Height = 21
          EditLabel.Width = 25
          EditLabel.Height = 13
          EditLabel.Caption = 'CNPJ'
          TabOrder = 0
          Text = '13930441000134'
        end
        object nmRazaoSH: TLabeledEdit
          Left = 13
          Top = 71
          Width = 200
          Height = 21
          EditLabel.Width = 59
          EditLabel.Height = 13
          EditLabel.Caption = 'Raz'#227'o social'
          TabOrder = 1
          Text = 'Empresa de Teste'
        end
        object nmContSH: TLabeledEdit
          Left = 257
          Top = 32
          Width = 200
          Height = 21
          EditLabel.Width = 39
          EditLabel.Height = 13
          EditLabel.Caption = 'Contato'
          TabOrder = 2
          Text = 'Nome do Contato'
        end
        object telefoneSH: TLabeledEdit
          Left = 257
          Top = 71
          Width = 200
          Height = 21
          EditLabel.Width = 42
          EditLabel.Height = 13
          EditLabel.Caption = 'Telefone'
          TabOrder = 3
          Text = '4430303030'
        end
      end
      object BitBtn1: TBitBtn
        Tag = 2
        Left = 575
        Top = 635
        Width = 547
        Height = 50
        Align = alCustom
        Caption = '&Excluir Evento'
        TabOrder = 9
        OnClick = BitBtn1Click
      end
      object LabeledEdit1: TLabeledEdit
        Left = 16
        Top = 768
        Width = 553
        Height = 26
        EditLabel.Width = 136
        EditLabel.Height = 13
        EditLabel.Caption = 'ID LOTE  (PARA CONSULTA)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 10
      end
      object BitBtn2: TBitBtn
        Left = 575
        Top = 747
        Width = 547
        Height = 50
        Align = alCustom
        Caption = 'Consultar ID LOTE'
        TabOrder = 11
        OnClick = BitBtn1Click
      end
      object BitBtn3: TBitBtn
        Tag = 3
        Left = 575
        Top = 691
        Width = 547
        Height = 50
        Align = alCustom
        Caption = '&Alterar Evento'
        TabOrder = 12
        OnClick = BitBtn3Click
      end
      object GroupBox8: TGroupBox
        Left = 319
        Top = 152
        Width = 250
        Height = 73
        Caption = 'Grupo do evento'
        TabOrder = 13
        object Label12: TLabel
          Left = 14
          Top = 15
          Width = 94
          Height = 13
          Caption = 'ID grupo do evento'
        end
        object idGrupoEvento: TComboBox
          Left = 13
          Top = 30
          Width = 228
          Height = 22
          Style = csOwnerDrawFixed
          ItemIndex = 1
          TabOrder = 0
          Text = '1'
          Items.Strings = (
            ''
            '1'
            '2'
            '3')
        end
      end
    end
    object tsTx2: TTabSheet
      Caption = 'S-1000 TX2'
      ImageIndex = 2
      object Label10: TLabel
        Left = 128
        Top = 27
        Width = 197
        Height = 23
        Caption = 'COLE O TX2 ABAIXO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 800
        Top = 27
        Width = 97
        Height = 23
        Caption = 'RETORNO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object mmTx2: TMemo
        Left = 0
        Top = 56
        Width = 505
        Height = 673
        Align = alCustom
        TabOrder = 0
      end
      object mmResultadoTx2: TMemo
        Left = 600
        Top = 56
        Width = 522
        Height = 673
        Align = alCustom
        TabOrder = 1
      end
      object btntX2: TButton
        Left = 0
        Top = 735
        Width = 505
        Height = 50
        Caption = 'ENVIAR'
        TabOrder = 2
        OnClick = btntX2Click
      end
    end
  end
end
