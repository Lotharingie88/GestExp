unit GestPatho;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.DateTimeCtrls, FMX.ListBox,
  FMX.Edit, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, System.Rtti, FMX.Grid.Style, FMX.ScrollBox, FMX.Grid;

type
  TFpatho = class(TForm)
    Layout1: TLayout;
    Button1: TButton;
    Button2: TButton;
    btSave: TButton;
    btReset: TButton;
    btQuit: TButton;
    Individuel: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    cbIndiv: TComboBox;
    DateEdit1: TDateEdit;
    qPatho: TFDQuery;
    Label7: TLabel;
    Label8: TLabel;
    DateEdit2: TDateEdit;
    DateEdit3: TDateEdit;
    StringGrid1: TStringGrid;
    qGPatho: TFDQuery;
    Label9: TLabel;
    Label10: TLabel;
    Edit5: TEdit;
    ComboBox1: TComboBox;
    procedure btQuitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Fpatho: TFpatho;

implementation

{$R *.fmx}

procedure TFpatho.btQuitClick(Sender: TObject);
begin
     close;
end;

procedure TFpatho.FormCreate(Sender: TObject);
begin
  qPatho.Close;
     qPatho.SQL.Clear;
     qPatho.SQL.Text :='select identification from cheptel';
     qPatho.Open;
     cbIndiv.Items.Clear();
     cbIndiv.Items.Add('');
     cbIndiv.ItemIndex:=0;
     while not qPatho.Eof do
           begin
               cbIndiv.Items.Add(qPatho.FieldByName('identification').AsString);
               qPatho.Next;
           end;
     qPatho.Close;
end;

end.
