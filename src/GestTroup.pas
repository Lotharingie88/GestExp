unit GestTroup;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Edit, FMX.Controls.Presentation, FMX.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.Rtti,
  FMX.Grid.Style, FMX.Grid, FMX.ScrollBox, Fmx.Bind.Grid,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Controls,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components, Fmx.Bind.Navigator,
  Data.Bind.Grid, Data.Bind.DBScope;

type
  TFtroupeau = class(TForm)
    Layout1: TLayout;
    Label1: TLabel;
    edEffect: TEdit;
    qTroup: TFDQuery;
    sgFemel: TStringGrid;
    btPrec: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    btQuit: TButton;
    Label2: TLabel;
    Label3: TLabel;
    edFem: TEdit;
    edMal: TEdit;
    dsGexpl: TDataSource;
    qGrid: TFDQuery;
    BindSourceDB1: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    NavigatorBindSourceDB1: TBindNavigator;
    BindingsList1: TBindingsList;
    sgMal: TStringGrid;
    qGrid2: TFDQuery;
    BindSourceDB2: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB2: TLinkGridToDataSource;
    NavigatorBindSourceDB2: TBindNavigator;
    Label4: TLabel;
    Label5: TLabel;
    procedure btQuitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Ftroupeau: TFtroupeau;

implementation

{$R *.fmx}

procedure TFtroupeau.btQuitClick(Sender: TObject);
begin
     close;
end;

procedure TFtroupeau.FormCreate(Sender: TObject);
//var
  // j,i :integer;
begin
     qTroup.Close;
     qTroup.SQL.Clear;
     qTroup.SQL.Text :='select count(identification) as Total from Cheptel where sortie=""';
     qTroup.Open;
     edEffect.Text :=qTroup.FieldByName('Total').AsString;
     qTroup.Close;
     qTroup.SQL.Clear;
     qTroup.SQL.Text :='select count(identification) as Femel from Cheptel where extsex=1 and sortie=""';
     qTroup.Open;
     edFem.Text :=qTroup.FieldByName('Femel').AsString;
     qTroup.Close;
     qTroup.SQL.Clear;
     qTroup.SQL.Text :='select count(identification) as Male from Cheptel where extsex=0 and sortie =""';
     qTroup.Open;
     edMal.Text :=qTroup.FieldByName('Male').AsString;
     qTroup.Close;
     qGrid.close;
     qGrid.SQL.Clear;
     qGrid.SQL.Text :='select identification,nom,naissance,racnom as Race from Cheptel,race where cirace=extrace and extsex=1 and sortie =""';
     qGrid.Open;
     qGrid2.close;
     qGrid2.SQL.Clear;
     qGrid2.SQL.Text :='select identification,nom,naissance,racnom as Race from Cheptel,race where cirace=extrace and extsex=0 and sortie =""';
     qGrid2.Open;

      //j:=0;
     // i:=0;
      //qTroup.First;
      	 //	while not qTroup.Eof do
          	 //	begin
                      //IndPers := Fchoix.ReqChoix.FieldByName('idperson').AsString;
                       //ShowMessage(qTroup.FieldByName('identification').AsString);
                       //sgFemel.RowCount:=1;

                      //sgFemel.row[j]  :=  qTroup.FieldByName('identification').AsString;

                      //rows[j].Add ( Fchoix.ReqChoix.FieldByName('nom').AsString );
                      //sgChoix.rows[j].Add ( Fchoix.ReqChoix.FieldByName('prenom').AsString);
                      //sgChoix.rows[j].Add ( Fchoix.ReqChoix.FieldByName('Naissance').AsString);
                      // gFemel.Row[j]:= qTroup.FieldByName('identification').AsString;
                      //j:=j+1;
                     //qTroup.Next;
       			//end;
     //qTroup.Close;



end;
end.
