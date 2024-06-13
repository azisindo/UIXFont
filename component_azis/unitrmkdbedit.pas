unit unitRMKDBEdit;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs, DBCtrls;

type

  { TRMKDBEdit }

  TRMKDBEdit = class(TDBEdit)
  private
    CorInicial: TColor;
    FMudarColor: TColor;
    procedure SetMudarCor(const Value: TColor);

  protected
    procedure DoEnter; override;
    procedure DoExit; override;

  public
    constructor Create(AOwner: TComponent); override;

  published
    property MudarColor: TColor read FMudarColor write SetMudarCor;

  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Data Controls',[TRMKDBEdit]);
end;

{ TRMKDBEdit }

procedure TRMKDBEdit.SetMudarCor(const Value: TColor);
begin
  FMudarColor := Value;
end;

procedure TRMKDBEdit.DoEnter;
begin
  inherited;
  CorInicial := Color;
  Color := FMudarColor;
end;

procedure TRMKDBEdit.DoExit;
begin
  inherited ;
  Color := CorInicial;
end;

constructor TRMKDBEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FMudarColor    := $00D6F4FE;
end;

end.
