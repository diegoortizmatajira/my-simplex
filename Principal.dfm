object frmPrincipal: TfrmPrincipal
  Left = 246
  Top = 244
  Width = 519
  Height = 416
  Caption = 'Simplex'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 511
    Height = 389
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object Tab_Variables_Restricciones: TTabSheet
      Caption = 'Variables y Restricciones'
      ImageIndex = 1
      OnShow = Tab_Variables_RestriccionesShow
      object Label1: TLabel
        Left = 8
        Top = 6
        Width = 55
        Height = 26
        Caption = 'Número de Variables'
        WordWrap = True
      end
      object Label2: TLabel
        Left = 152
        Top = 6
        Width = 64
        Height = 26
        Caption = 'Número de Restricciones'
        WordWrap = True
      end
      object Label3: TLabel
        Left = 8
        Top = 40
        Width = 80
        Height = 13
        Caption = 'Función Objetivo'
      end
      object Label4: TLabel
        Left = 8
        Top = 112
        Width = 64
        Height = 13
        Caption = 'Restricciones'
      end
      object txtNumeroVariables: TEdit
        Left = 72
        Top = 10
        Width = 41
        Height = 21
        TabOrder = 0
        Text = '2'
      end
      object udVariables: TUpDown
        Left = 113
        Top = 10
        Width = 15
        Height = 21
        Associate = txtNumeroVariables
        Min = 1
        Position = 2
        TabOrder = 1
        Wrap = False
      end
      object txtNumeroRestricciones: TEdit
        Left = 224
        Top = 10
        Width = 41
        Height = 21
        TabOrder = 2
        Text = '2'
      end
      object udRestricciones: TUpDown
        Left = 265
        Top = 10
        Width = 15
        Height = 21
        Associate = txtNumeroRestricciones
        Min = 1
        Position = 2
        TabOrder = 3
        Wrap = False
      end
      object gridRestricciones: TStringGrid
        Left = 8
        Top = 128
        Width = 486
        Height = 223
        Anchors = [akLeft, akTop, akRight, akBottom]
        ColCount = 2
        DefaultColWidth = 70
        DefaultRowHeight = 20
        RowCount = 2
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goEditing, goTabs]
        ParentFont = False
        TabOrder = 4
      end
      object gridFuncionObjetivo: TStringGrid
        Left = 8
        Top = 56
        Width = 486
        Height = 46
        Anchors = [akLeft, akTop, akRight]
        ColCount = 2
        DefaultColWidth = 70
        DefaultRowHeight = 20
        RowCount = 2
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goEditing, goTabs]
        ParentFont = False
        TabOrder = 5
      end
      object cmdAplicar: TButton
        Left = 296
        Top = 8
        Width = 89
        Height = 25
        Caption = 'Aplicar'
        TabOrder = 6
        OnClick = cmdAplicarClick
      end
      object cmdGenerar: TButton
        Left = 392
        Top = 8
        Width = 97
        Height = 25
        Caption = 'Generar Matriz'
        TabOrder = 7
        OnClick = cmdGenerarClick
      end
    end
    object TabMatriz: TTabSheet
      Caption = 'Matriz Simplex'
      ImageIndex = 2
      object gridSimplex: TStringGrid
        Left = 8
        Top = 64
        Width = 486
        Height = 289
        Anchors = [akLeft, akTop, akRight, akBottom]
        DefaultRowHeight = 20
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object Button1: TButton
        Left = 16
        Top = 16
        Width = 121
        Height = 25
        Caption = 'Iterar '
        TabOrder = 1
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 152
        Top = 16
        Width = 145
        Height = 25
        Caption = 'Probar Solución'
        TabOrder = 2
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Solución'
      ImageIndex = 2
      object Label5: TLabel
        Left = 8
        Top = 8
        Width = 44
        Height = 13
        Caption = 'Solución:'
      end
      object StringGrid1: TStringGrid
        Left = 8
        Top = 24
        Width = 134
        Height = 153
        ColCount = 2
        DefaultRowHeight = 20
        TabOrder = 0
      end
    end
  end
end
