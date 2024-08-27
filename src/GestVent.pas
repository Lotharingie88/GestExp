unit GestVent;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.DateTimeCtrls, FMX.Edit, FMX.ListBox, FMX.Controls.Presentation,
  FMX.StdCtrls, System.Rtti, FMX.Grid.Style, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FMX.ScrollBox, FMX.Grid;

type
  TFVente = class(TForm)
    Layout1: TLayout;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Label4: TLabel;
    DateEdit1: TDateEdit;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    DateEdit2: TDateEdit;
    DateEdit3: TDateEdit;
    sgRecap: TStringGrid;
    qRecap: TFDQuery;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    btQuit: TButton;
    Label7: TLabel;
    ComboBox2: TComboBox;
    qVente: TFDQuery;
    procedure btQuitClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FVente: TFVente;

implementation

{$R *.fmx}

procedure TFVente.btQuitClick(Sender: TObject);
begin
     close;
end;

end.
