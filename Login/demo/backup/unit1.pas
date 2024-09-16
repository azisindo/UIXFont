unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  SysUtils, Forms, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    btnLogin: TButton;
    lblInformation: TLabel;
    lbeName: TLabeledEdit;
    lbePassword: TLabeledEdit;
    lblLogin: TLabel;
    lblInfo: TLabel;
    pnlLogin: TPanel;
    procedure btnLoginClick(Sender: TObject);
    procedure lblInfoClick(Sender: TObject);
    procedure lblLoginClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

const
  UserName = 'hello';
  Password = 'pascal';

{$R *.lfm}

{ TForm1 }

procedure TForm1.lblLoginClick(Sender: TObject);
var
  OriginalPosX: Integer;
  OriginalPosY: Integer;
  i:            Integer;
begin
  // Hide the information
  if lblInformation.Visible then
  begin
    OriginalPosX := lblInformation.Left;
    for i := lblInformation.Left to Form1.Width do
    begin
      lblInformation.Left := i;
      Application.ProcessMessages;
      Sleep(2);
    end;
    lblInformation.Visible := False;
    lblInformation.Left    := OriginalPosX;
  end;
  // Show the login box
  OriginalPosY     := pnlLogin.Top;
  pnlLogin.Top     := Form1.Height;
  pnlLogin.Visible := True;
  for i := pnlLogin.Top downto OriginalPosY do
  begin
    pnlLogin.Top := i;
    Application.ProcessMessages;
    Sleep(2);
  end;
end;

procedure TForm1.lblInfoClick(Sender: TObject);
var
  OriginalPosY, i: Integer;
begin
  // Hide the login box
  if pnlLogin.Visible then
  begin
    OriginalPosY := pnlLogin.Top;
    for i := pnlLogin.Top to Form1.Height do
    begin
      pnlLogin.Top := i;
      Application.ProcessMessages;
      Sleep(2);
    end;
    pnlLogin.Visible := False;
    pnlLogin.Top     := OriginalPosY;
  end;
  // Show the information
  OriginalPosY           := lblInformation.Top;
  lblInformation.Top     := -10;
  lblInformation.Visible := True;
  for i := lblInformation.Top to OriginalPosY do
  begin
    lblInformation.Top := i;
    Application.ProcessMessages;
    Sleep(2);
  end;
end;

procedure TForm1.btnLoginClick(Sender: TObject);
var
  OriginalPosX: Integer;
  OriginalPosY: Integer;
  i:            Integer;
begin
  // Wrong answer
  if (lbeName.Text <> UserName) or (lbePassword.Text <> Password) then
  begin
    OriginalPosX := pnlLogin.Left;
    OriginalPosY := pnlLogin.Top;
    for i := 1 to 10 do begin
      pnlLogin.Top  := OriginalPosY + Random(20)-10;
      pnlLogin.Left := OriginalPosX + Random(20)-10;
      Application.ProcessMessages;
      Sleep(30);
    end;
    pnlLogin.Top  := OriginalPosY;
    pnlLogin.Left := OriginalPosX;
    Exit;
  end;
  // Correct answer
  ShowMessage('Welcome');
  Close;
end;

end.
