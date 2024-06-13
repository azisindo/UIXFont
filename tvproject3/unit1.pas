unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, ComCtrls,
  StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Panel1: TPanel;
    Panel2: TPanel;
    TreeView1: TTreeView;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
var
  pnode, node: TTreeNode;
begin
  with TreeView1.Items do
  begin
    pnode := Add(nil, 'Parent1');
    node := AddChild(pnode, 'P1Child1');
    node.StateIndex := Ord(True);
    node := AddChild(pnode, 'P1Child2');
    node.StateIndex := Ord(False);
    node := AddChild(pnode, 'P1Child3');
    node.StateIndex := Ord(False);

    pnode := Add(nil, 'Parent2');

    pnode := Add(nil, 'Parent3');
    node := AddChild(pnode, 'P3Child1');
    node.StateIndex := Ord(False);
    node := AddChild(pnode, 'P3Child2');
    node.StateIndex := Ord(False);

    pnode := Add(nil, 'Parent4');
    node := AddChild(pnode, 'P4Child1');
    node.StateIndex := Ord(True);
    node := AddChild(pnode, 'P4Child2');
    node.StateIndex := Ord(False);

    pnode := Add(nil, 'Parent5');
    node := AddChild(pnode, 'P5Child1');
    node.StateIndex := Ord(True);
    node := AddChild(pnode, 'P5Child2');
    node.StateIndex := Ord(True);
    node := AddChild(pnode, 'P5Child3');
    node.StateIndex := Ord(False);
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  SelectedNode: TTreeNode;
begin
  SelectedNode := TreeView1.Selected;
  if (SelectedNode = nil) or (SelectedNode.GetPrevSibling = nil) then
    Exit;
  SelectedNode.MoveTo(SelectedNode.GetPrevSibling, naInsert);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  SelectedNode: TTreeNode;
begin
  SelectedNode := TreeView1.Selected;
  if (SelectedNode = nil) or (SelectedNode.GetNextSibling = nil) then
    Exit;
  if SelectedNode.GetNextSibling.GetNextSibling <> nil then
    SelectedNode.MoveTo(SelectedNode.GetNextSibling.GetNextSibling, naInsert)
  else
    SelectedNode.MoveTo(SelectedNode.GetNextSibling, naAdd);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Close;
end;

end.
