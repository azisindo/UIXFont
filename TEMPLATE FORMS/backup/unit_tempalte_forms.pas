unit unit_tempalte_forms;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  unitRMKPanelStandard, unitRMKPanelWarna, UnitRMKEdit;

type

  { TForm1 }

  TForm1 = class(TForm)
    Label1: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    RMKEdit1: TRMKEdit;
    RMKEdit2: TRMKEdit;
    RMKPanelStandard1: TRMKPanelStandard;
    RMKPanelStandard2: TRMKPanelStandard;
    RMKPanelWarna1: TRMKPanelWarna;
    RMKPanelWarna2: TRMKPanelWarna;
    RMKPanelWarna3: TRMKPanelWarna;
    RMKPanelWarna4: TRMKPanelWarna;
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

end.

