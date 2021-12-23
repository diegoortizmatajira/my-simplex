unit Principal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, ComCtrls, Grids;

type
  TfrmPrincipal = class(TForm)
    PageControl1: TPageControl;
    TabMatriz: TTabSheet;
    Tab_Variables_Restricciones: TTabSheet;
    txtNumeroVariables: TEdit;
    Label1: TLabel;
    udVariables: TUpDown;
    Label2: TLabel;
    txtNumeroRestricciones: TEdit;
    udRestricciones: TUpDown;
    gridRestricciones: TStringGrid;
    Label3: TLabel;
    gridFuncionObjetivo: TStringGrid;
    cmdAplicar: TButton;
    Label4: TLabel;
    gridSimplex: TStringGrid;
    cmdGenerar: TButton;
    Button1: TButton;
    TabSheet1: TTabSheet;
    StringGrid1: TStringGrid;
    Label5: TLabel;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure cmdAplicarClick(Sender: TObject);
    procedure cmdGenerarClick(Sender: TObject);
    procedure Tab_Variables_RestriccionesShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure ActualizaVariables;
    procedure GeneraMatriz;
    procedure MuestraMatriz;
    procedure PruebaSolucion;
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses MetodoSimplex;

{$R *.DFM}

procedure TfrmPrincipal.ActualizaVariables;
var
 i: byte;
begin
 ObjetoSimplex.NumeroVariables:= udVariables.Position;
 ObjetoSimplex.NumeroRestricciones := udRestricciones.Position;
 with gridFuncionObjetivo do
 begin
  Cells[0,1]:= 'Z =';
  ColCount := ObjetoSimplex.NumeroVariables + 1;
  for i:= 1 to ObjetoSimplex.NumeroVariables do
   Cells[i,0]:= Format('X %2.2d',[i]);
 end;
 with gridRestricciones do
 begin
  ColCount:= ObjetoSimplex.NumeroVariables + 2;
  RowCount:= ObjetoSimplex.NumeroRestricciones + 1;
  for i:= 1 to ObjetoSimplex.NumeroVariables do
   Cells[i,0]:= Format('X %2.2d',[i]);
  Cells[ObjetoSimplex.NumeroVariables + 1,0]:= '<=';
  for i:= 1 to ObjetoSimplex.NumeroRestricciones do
   Cells[0,i]:= Format('R. %2.2d',[i]);
 end;
end;

procedure TfrmPrincipal.GeneraMatriz;
var
 i,j: Byte;
 TotalVariables: Byte;
begin
 with ObjetoSimplex do
 begin
  TotalVariables:= NumeroVariables + NumeroRestricciones;
  for j:= 0 to NumeroRestricciones do
  begin
   cSolucion[j]:= 0;
   for i:= 1 to TotalVariables do
    mVariables[j,i]:= 0;
  end;
  for i:= 1 to NumeroRestricciones do
   Basicas[i]:= NumeroVariables + i;
  // Usa la función Objetivo para
  // llenar la fila 1 de la Matriz
   with gridFuncionObjetivo do
   begin
    for i:= 1 to NumeroVariables do
    try
     mVariables[0,i]:= -StrToFloat(Cells[i,1]);
    except
     on EConvertError do
     begin
      ShowMessageFmt('La variable X %2.2d tiene un valor no valido',[i]);
      Exit;
     end;
    end;
   end;
  // Usa las Restricciones para llenar las
  // otras filas de la Matriz
  with gridRestricciones do
  begin
   for j:= 1 to NumeroRestricciones do
   begin
    mVariables[j,NumeroVariables+j]:= 1;
    cSolucion[j]:= StrToFloat(Cells[NumeroVariables+1,j]);
    for i:= 1 to NumeroVariables do
    try
     mVariables[j,i]:= StrToFloat(Cells[i,j]);
    except
     begin
      ShowMessageFmt('La variable X %2.2d tiene un valor no valido',[i]);
      Exit;
     end;
    end;
   end;
  end;
 end;
end;

procedure TfrmPrincipal.MuestraMatriz;
var
 i,j: Byte;
 TotalVariables: Byte;
begin
 with ObjetoSimplex do
 begin
  TotalVariables:= NumeroVariables + NumeroRestricciones;
   with gridSimplex do
   begin
    ColCount:= TotalVariables + 2;
    RowCount:= NumeroRestricciones + 2;
    for i:= 1 to TotalVariables do
     Cells[i,0]:= Format('X %2.2d',[i]);
    Cells[TotalVariables+1,0]:= 'Solución';
    Cells[0,1]:= 'Z';
    for i:= 1 to NumeroRestricciones do
     Cells[0,i+1]:= Format('X %2.2d',[Basicas[i]]);
    for j:= 0 to NumeroRestricciones do
    begin
     Cells[TotalVariables + 1,j+1]:= Format('%3.3f',[cSolucion[j]]); 
     for i:= 1 to TotalVariables do
      Cells[i,j+1]:= Format('%3.3f',[mVariables[j,i]]);
    end;
   end;
 end;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
 udVariables.Max := MaxVarSimplex;
 udRestricciones.Max := MaxRestricSimplex;
end;

procedure TfrmPrincipal.cmdAplicarClick(Sender: TObject);
begin
 ActualizaVariables;
end;

procedure TfrmPrincipal.cmdGenerarClick(Sender: TObject);
begin
 GeneraMatriz;
 MuestraMatriz;
end;

procedure TfrmPrincipal.Tab_Variables_RestriccionesShow(Sender: TObject);
begin
 ActualizaVariables;
end;

procedure TfrmPrincipal.Button1Click(Sender: TObject);
begin
 ObjetoSimplex.Itera;
 MuestraMatriz;
end;

procedure TfrmPrincipal.PruebaSolucion;
var
 i: byte;
begin
 with ObjetoSimplex do
 begin
  for i:= 1 to NumeroVariables do
 end;
end;

end.
