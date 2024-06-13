unit UnitRMKComboBox;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TRMKComboBox }

  TRMKComboBox = class(TComboBox)
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
  RegisterComponents('Standard',[TRMKComboBox]);
end;

{ TRMKComboBox }

procedure TRMKComboBox.SetMudarCor(const Value: TColor);
begin
  FMudarColor := Value;
end;

procedure TRMKComboBox.DoEnter;
begin
  inherited ;
  CorInicial := Color;
  Color := FMudarColor;
end;

procedure TRMKComboBox.DoExit;
begin
  inherited ;
  Color := CorInicial;
end;

constructor TRMKComboBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FMudarColor    := $00D6F4FE;
end;

end.
