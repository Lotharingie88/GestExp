unit param;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,System.Rtti, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.StdCtrls, FMX.Edit, FMX.Controls.Presentation, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FMX.ListBox;

type
  TFparam = class(TForm)
    Layout1: TLayout;
    Label1: TLabel;
    edIdent: TEdit;
    gbElevag: TGroupBox;
    gbCultur: TGroupBox;
    Label3: TLabel;
    Edit3: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    btQuit: TButton;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    Panel1: TPanel;
    gbAdress: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edNom: TEdit;
    edPrenom: TEdit;
    EdDenom: TEdit;
    edAdress: TEdit;
    edCP: TEdit;
    edCommune: TEdit;
    btModif: TButton;
    cbElev: TComboBox;
    cbCult: TComboBox;
    qParamet: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure btQuitClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Fparam: TFparam;

implementation

{$R *.fmx}

procedure TFparam.btQuitClick(Sender: TObject);
begin
     close;
end;

procedure TFparam.FormCreate(Sender: TObject);
begin
   qParamet.Close;
   qParamet.SQL.Clear;
   qParamet.SQL.Text := 'select idexploit from identexploit';
   //qParamet.Open;
//  edIdent.Text:=qParamet.FieldByName('identexploit').AsString;

{$IF Defined(ANDROID) or Defined(IOS)  }
   btQuit.Visible:=False;
{$ENDIF}
end;

end.
