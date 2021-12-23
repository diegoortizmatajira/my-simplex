unit MetodoSimplex;

interface

uses Classes, Dialogs, SysUtils;

const
 MaxVarSimplex = 10;
 MaxRestricSimplex = 10;
 MaxVariables = MaxVarSimplex + MaxRestricSimplex;
 toMaximizar = 0;
 toMinimizar = 1;


type

 TTipoObjetivo = 0..1;
 TMatriz = Array [0..MaxRestricSimplex, 1..MaxVariables] of Single;
 TColumna = Array [0..MaxRestricSimplex] of Single;
 TBasicas = Array [1..MaxRestricSimplex] of Byte;

 TObjetoSimplex = class
  NumeroVariables: Byte;
  NumeroRestricciones: Byte;
  Objetivo: TTipoObjetivo;
  mVariables: TMatriz;
  cSolucion: TColumna;
  Basicas: TBasicas;
  published
   procedure Itera;
 end;

var
 ObjetoSimplex: TObjetoSimplex;

implementation

procedure TObjetoSimplex.Itera;
var
 TotalVariables, Entra, Sale: Byte;
 i: Byte;
 Condicion: Boolean;
 Razon, RazonMin: Single;

 procedure ArreglaMatriz;
 var
  i,j: Byte;
  Divisor, Multip: Single;
 begin
  Divisor:= mVariables[Sale,Entra];
  cSolucion[Sale]:= cSolucion[Sale] / Divisor;
  for i:= 1 to TotalVariables do
  begin
   mVariables[Sale, i] := mVariables[Sale, i] / Divisor;
  end;
  for j:= 0 to NumeroRestricciones do
  begin
   if j <> Sale then
   begin
    Multip:= mVariables[j, Entra];
    cSolucion[j]:= cSolucion[j] -  cSolucion[Sale] * Multip;
    for i:= 1 to TotalVariables do
     mVariables[j, i] := mVariables[j, i] - mVariables[Sale, i] * Multip;
   end;
  end;
 end;

begin
 TotalVariables:= NumeroVariables + NumeroRestricciones;
 // Selecciona la variable que entra
 Entra:= 0;
 for i:= 1 to NumeroVariables do
 begin
  Condicion:= mVariables[0,i] <> 0;
  if Condicion then
  begin
   if Entra = 0 then
    Entra:= i
   else
    if mVariables[0,i] < mVariables[0,Entra] then
     Entra:= i;
  end;
 end;
 // Selecciona la Variable que sale
 Sale:= 0;
 RazonMin:= 0;
 for i:= 1 to NumeroRestricciones do
 begin
  if mVariables[i,Entra] <> 0 then
   Razon:= cSolucion[i] / mVariables[i,Entra]
  else
   Razon:= 0;
  Condicion:= Razon > 0;
  if Condicion then
  begin
   if Sale = 0 then
   begin
    Sale:= i;
    RazonMin:= Razon;
   end
   else
    if Razon < RazonMin then
    begin
     Sale:= i;
     RazonMin:= Razon;
    end;
  end;
 end;
 if (Sale > 0) and (Entra > 0) then
 begin
  Basicas[Sale]:= Entra;
  ArreglaMatriz;
 end;
end;

initialization
 ObjetoSimplex:= TObjetoSimplex.Create;
end.
