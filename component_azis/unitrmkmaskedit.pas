unit unitRMKMaskEdit;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs, MaskEdit;

type
  TTipoMascara = ( tmData, tmCPF, tmCNPJ, tmCEP, tmTelefone, tmCelular, tmHora, tmValor, tmNone );
  TCasasDecimais = ( Uma, Duas, Tres, Quatro, Cinco );

  { TRMKMaskEdit }

  TRMKMaskEdit = class(TMaskEdit)
  private
    CorInicial: TColor;
    FMudarColor: TColor;
    FTipoMascara: TTipoMascara;
    FCasasDecimais: TCasasDecimais;
    procedure SetMudarCor(const Value: TColor);
    procedure SetTipoMascara(const Value: TTipoMascara);
    procedure SetCasasDecimais(const Value: TCasasDecimais);

  protected
    procedure DoEnter; override;
    procedure DoExit; override;

  public
    constructor Create(AOwner: TComponent); override;

  published
    property TipoMascara: TTipoMascara read FTipoMascara write SetTipoMascara;
    property MudarColor: TColor read FMudarColor write SetMudarCor;
    property CasasDecimais: TCasasDecimais read FCasasDecimais write SetCasasDecimais;

  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Additional',[TRMKMaskEdit]);
end;

{ TRMKMaskEdit }
function FormataValor( Valor:String ):Double;
Var
  i: Integer;
  NovoValor : String;

begin
  //função para formatar os valores dos campos monetários.
  NovoValor:='';

  if Valor = '' then
    Valor := '0,00';

  for i:=1 to Length( Valor ) do
  begin
    if Valor[i] <> '.' then NovoValor:= NovoValor + Valor[i];
  end;

  Result := StrToFLoat ( NovoValor );
end;


procedure TRMKMaskEdit.SetMudarCor(const Value: TColor);
begin
  FMudarColor := Value;
end;

procedure TRMKMaskEdit.SetTipoMascara(const Value: TTipoMascara);
begin
  FTipoMascara := Value;

  case value of
    tmData:
      EditMask:= '99/99/9999;1;_';

    tmCPF:
      EditMask:= '999.999.999-99;0;_';

    tmCNPJ:
      EditMask:= '99.999.999/9999-99;0;_';

    tmCEP:
      EditMask:= '99.999-999;0;_';

    tmTelefone:
      EditMask:= '(99) 9999-9999;0;_';

    tmCelular:
      EditMask:= '(99) 9 9999-9999;0;_';

    tmHora:
      EditMask:= '99:99;1;_';

    tmValor:
      EditMask:= '';

    tmNone:
      EditMask:= '';

  end;

end;

procedure TRMKMaskEdit.SetCasasDecimais(const Value: TCasasDecimais);
begin
  FCasasDecimais:= Value;
end;

procedure TRMKMaskEdit.DoEnter;
begin
  inherited ;
  CorInicial := Color;
  Color := FMudarColor;

end;

procedure TRMKMaskEdit.DoExit;
begin
  inherited ;
  Color := CorInicial;

   if ( FTipoMascara = tmValor ) and ( Self.Text  <> '' ) then
   begin
     case CasasDecimais of
       Uma   : Self.Text := FormatFloat  ('#,###,###,##0.0', FormataValor ( Self.Text ) );
       Duas  : Self.Text := FormatFloat  ('#,###,###,##0.00', FormataValor ( Self.Text ) );
       Tres  : Self.Text := FormatFloat  ('#,###,###,##0.000', FormataValor ( Self.Text ) );
       Quatro: Self.Text := FormatFloat  ('#,###,###,##0.0000', FormataValor ( Self.Text ) );
       Cinco : Self.Text := FormatFloat  ('#,###,###,##0.00000', FormataValor ( Self.Text ) );
     end;

   end;

end;

constructor TRMKMaskEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FMudarColor    := $00D6F4FE;
  FTipoMascara   := tmNone;

  if ( FTipoMascara = tmValor ) and ( Self.Text  <> '' ) then
  begin
    case CasasDecimais of
      Uma   : Self.Text := FormatFloat  ('#,###,###,##0.0', FormataValor ( Self.Text ) );
      Duas  : Self.Text := FormatFloat  ('#,###,###,##0.00', FormataValor ( Self.Text ) );
      Tres  : Self.Text := FormatFloat  ('#,###,###,##0.000', FormataValor ( Self.Text ) );
      Quatro: Self.Text := FormatFloat  ('#,###,###,##0.0000', FormataValor ( Self.Text ) );
      Cinco : Self.Text := FormatFloat  ('#,###,###,##0.00000', FormataValor ( Self.Text ) );
    end;

  end;
end;

end.
