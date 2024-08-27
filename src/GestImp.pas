unit GestImp;

interface

uses
  System.SysUtils,system.IOUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Memo.Types, FMX.ScrollBox,
  FMX.Memo, FMX.Printer, FMX.ListBox;

type
  TFImport = class(TForm)
    Layout1: TLayout;
    btQuit: TButton;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    Memo1: TMemo;
    Label2: TLabel;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    PrintDialog1: TPrintDialog;
    cbTypFic: TComboBox;
    LbFichier: TListBox;
    btOpen: TButton;
    procedure btQuitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btOpenClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FImport: TFImport;

implementation

{$R *.fmx}

procedure TFImport.btOpenClick(Sender: TObject);
var F:textfile;
    lig : string;
begin
  if OpenDialog1.Execute then
     AssignFile(F,opendialog1.filename);
     reset(F);
     while not Eof(F) do
           begin
             readln(F,lig);
             Memo1.Lines.add(lig);
           end;
     CloseFile(F);
end;

procedure TFImport.btQuitClick(Sender: TObject);
begin
     close;
end;

procedure TFImport.FormCreate(Sender: TObject);
begin
  OpenDialog1.InitialDir:=TPath.GetDocumentsPath;
  SaveDialog1.InitialDir:=TPath.GetDocumentsPath;

end;
end.
