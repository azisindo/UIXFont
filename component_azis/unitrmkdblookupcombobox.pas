unit unitRMKDBLookupComboBox;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs, DBCtrls;

type

  { TRMKDBLookupComboBox }

  TRMKDBLookupComboBox = class(TDBLookupComboBox)
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
  RegisterComponents('Data Controls',[TRMKDBLookupComboBox]);
end;

{ TRMKDBLookupComboBox }

procedure TRMKDBLookupComboBox.SetMudarCor(const Value: TColor);
begin
  FMudarColor := Value;
end;

procedure TRMKDBLookupComboBox.DoEnter;
begin
  inherited ;
  CorInicial := Color;
  Color := FMudarColor;
end;

procedure TRMKDBLookupComboBox.DoExit;
begin
  inherited ;
  Color := CorInicial;
end;

constructor TRMKDBLookupComboBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FMudarColor    := $00D6F4FE;
end;

end.
