unit unitRMKDBComboBox;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs, DBCtrls;

type

  { TRMKDBComboBox }

  TRMKDBComboBox = class(TDBComboBox)
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
  RegisterComponents('Data Controls',[TRMKDBComboBox]);
end;

{ TRMKDBComboBox }

procedure TRMKDBComboBox.SetMudarCor(const Value: TColor);
begin
  FMudarColor := Value;
end;

procedure TRMKDBComboBox.DoEnter;
begin
  inherited ;
  CorInicial := Color;
  Color := FMudarColor;
end;

procedure TRMKDBComboBox.DoExit;
begin
  inherited ;
  Color := CorInicial;
end;

constructor TRMKDBComboBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FMudarColor    := $00D6F4FE;
end;

end.
