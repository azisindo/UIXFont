unit unitRMKPanelWarna;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs, ExtCtrls, Messages;

type

  { TRMKPanelWarna }

  TRMKPanelWarna = class(TPanel)
  private
    FCorInicial: TColor;
    FCorMouseSob: TColor;
    FOnMouseEnter: TNotifyEvent;
    FOnMouseLeave: TNotifyEvent;
    //FOnMouseActivate: TNotifyEvent;
    procedure SetCorInicial(const Value: TColor);
    procedure SetMouseSob(const Value: TColor);

  protected
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    //procedure CMMouseActivate(var Message: TMessage); message CM_MOUSEACTIVATE;

  public
    constructor Create(AOwner: TComponent); override;

  published
    property CorInicial: TColor read FCorInicial write SetCorInicial;
    property CorMouseSob:  TColor read FCorMouseSob write SetMouseSob;
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;

  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Standard',[TRMKPanelWarna]);
end;

{ TRMKPanelWarna }

procedure TRMKPanelWarna.SetCorInicial(const Value: TColor);
begin
  FCorInicial := Value;
  Color := Value;

end;

procedure TRMKPanelWarna.SetMouseSob(const Value: TColor);
begin
  FCorMouseSob := Value;
end;

procedure TRMKPanelWarna.CMMouseEnter(var Message: TMessage);
begin
  if Assigned( FOnMouseEnter ) then
     FOnMouseEnter(Self);

  Color      := FCorMouseSob;
  Font.Style := [fsbold];
  Cursor     := crHandPoint;

end;

procedure TRMKPanelWarna.CMMouseLeave(var Message: TMessage);
begin
  if Assigned(FOnMouseLeave) then
     FOnMouseLeave(Self);

  Color      := FCorInicial;
  Font.Style := [];
  Cursor     := crArrow;

end;

constructor TRMKPanelWarna.Create(AOwner: TComponent);
begin
  //inherited Create(AOwner);
  inherited;
end;

end.
