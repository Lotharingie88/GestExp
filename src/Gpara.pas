unit Gpara;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FMX.Controls.Presentation, FMX.Edit, FMX.StdCtrls,
  FMX.ListBox, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.FMXUI.Wait,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView;

type
  TFpara = class(TForm)
    Layout1: TLayout;
    qPara: TFDQuery;
    edEnt: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Button1: TButton;
    BtEnregist: TButton;
    Button3: TButton;
    Button4: TButton;
    btQuit: TButton;
    rbnElev: TRadioButton;
    rbmElev: TRadioButton;
    rbpElev: TRadioButton;
    rbmCult: TRadioButton;
    rbpCult: TRadioButton;
    edSup: TEdit;
    EdNom: TEdit;
    EdPren: TEdit;
    Edit4: TEdit;
    EdAdres: TEdit;
    EdCP: TEdit;
    EdVil: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    FDQueryEsp: TFDQuery;
    FDQueryCult: TFDQuery;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkFillControlToField1: TLinkFillControlToField;
    BindSourceDB2: TBindSourceDB;
    LinkFillControlToField2: TLinkFillControlToField;
    BindingsList2: TBindingsList;
    ListView1: TListView;
    ListView2: TListView;
    lbElev: TListBox;
    LinkFillControlToField3: TLinkFillControlToField;
    lbCult: TListBox;
    LinkFillControlToField4: TLinkFillControlToField;
    procedure FormCreate(Sender: TObject);
    procedure btQuitClick(Sender: TObject);
    procedure BtEnregistClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Fpara: TFpara;

implementation

{$R *.fmx}

procedure TFpara.btQuitClick(Sender: TObject);
begin
     close;
end;

procedure TFpara.BtEnregistClick(Sender: TObject);
var
 res :integer;
 resv:integer;
 elev:integer;
 cult:integer;
begin
  if (edCP.text<>'') and (edVil.text <>'') then
    begin
       qPara.Close;
       qPara.SQL.Clear;
       qPara.SQL.Text := 'select idvil from ville where ville =:vil and codpost=:codp';
       qpara.ParamByName('vil').AsString:=edvil.Text;
       qpara.ParamByName('codp').AsInteger:= strtoint(edCP.Text);
       qPara.Open;
       res:=qPara.FieldByName('idvil').AsInteger;
       if res<>0  then
        begin

        end
        else
        begin
          qPara.Close;
          qPara.SQL.Clear;
          qPara.SQL.Text := 'insert into ville(ville,codpost) values(:vil,:cp)';
          qpara.ParamByName('vil').AsString:=edVil.Text;
          qpara.ParamByName('cp').AsString:=edCP.Text;

          qPara.ExecSQL;
        end;

    end;


   if edNom.Text<>'' then
    begin
       qPara.Close;
       qPara.SQL.Clear;
       qPara.SQL.Text := 'select idvil from ville where ville =:vil and codpost=:codp';
       qpara.ParamByName('vil').AsString:=edvil.Text;
       qpara.ParamByName('codp').AsInteger:= strtoint(edCP.Text);
       qPara.Open;
       resv:=qPara.FieldByName('idvil').AsInteger;
       qPara.Close;

       qPara.SQL.Clear;
       qPara.SQL.Text := 'select count(*) as resul from utilisateur where nom =:nom and prenom=:pren';
       qpara.ParamByName('nom').AsString:=edNom.Text;
       qpara.ParamByName('pren').AsString:=edPren.Text;
       qPara.Open;
       res:=qPara.FieldByName('resul').AsInteger;
       if res=0 then
       begin
        qpara.Close;
          qPara.SQL.Clear;
          qPara.SQL.Text := 'insert into utilisateur(nom,prenom,extadress,idvil) values(:nom,:pren,:adr,:idvil)';
          qpara.ParamByName('nom').AsString:=edNom.Text;
          qpara.ParamByName('pren').AsString:=edPren.Text;
          qpara.ParamByName('adr').AsString:=edAdres.Text;
          qpara.ParamByName('idvil').AsInteger:=resv;
          qPara.ExecSQL;
       end;
    end;
    if edEnt.Text<>'' then
      begin
       qPara.Close;
       qPara.SQL.Clear;
       qPara.SQL.Text := 'select count(*) as resul from identexploit where idexploit =:expl';
       qpara.ParamByName('expl').AsInteger:= strtoint( edEnt.Text);
       qPara.Open;
       res:=qPara.FieldByName('resul').AsInteger;


       if res=1 then
        begin
           qPara.Close;
          qPara.SQL.Clear;
          qPara.SQL.Text := 'select iduser from utilisateur where nom =:nom and prenom=:pren';
          qpara.ParamByName('nom').AsString:=edNom.Text;
          qpara.ParamByName('pren').AsString:= edPren.Text;
          qPara.Open;
          res:=qPara.FieldByName('iduser').AsInteger;
          qPara.Close;
          qPara.SQL.Clear;
          qPara.SQL.Text := 'update identexploit set exuser=:idus where idexploit=:expl';
          qpara.ParamByName('idus').AsInteger:=res;
          qpara.ParamByName('expl').AsInteger:= strtoint(edEnt.Text);
          qpara.ExecSQL;
          if rbnElev.IsChecked then elev:=0
            else if rbmElev.IsChecked then elev:=1
              else if rbpElev.IsChecked then elev:=2;
           if rbmCult.IsChecked then cult:=1
            else if rbpCult.IsChecked then cult:=2;
           qPara.Close;
          qPara.SQL.Clear;
          qPara.SQL.Text := 'update identexploit set elevage=:eleva ,culture=:cultu where idexploit=:expl';
          qpara.ParamByName('eleva').AsInteger:=elev;
          qpara.ParamByName('cultu').AsInteger:=cult;
          qpara.ParamByName('expl').AsInteger:= strtoint(edEnt.Text);
          qpara.ExecSQL;
          lbCult.Selected.Text ;
          qpara.Close;
        end;
      end;

end;

procedure TFpara.FormCreate(Sender: TObject);
var
  res:integer;
  resv:integer;
  cult:integer;
  elev:integer;
begin


   //    fdqRLiv.SQL.Clear;
     //  fdqRLiv.SQL.Text:='SELECT prix,datach,nomauteur,prenauteur from livres,achat,auteur where titre =:tit and achat.idliv=livres.idtitre and livres.idauteur =auteur.idauteur ' ;
       //fdqRLiv.ParamByName('tit').AsString := cbTitre.Selected.Text;
       //fdqRLiv.SQL.Text:='INSERT into achat(idliv,prix,datach) VALUES (:cod,:pr,:dach)';
       //fdqRLiv.ParamByName('cod').AsInteger := cod;
       //fdqRLiv.ParamByName('pr').AsFloat := strtofloat(edPrix.Text);
       //fdqRLiv.ParamByName('dach').AsDate := StrToDate(edDatach.Text);
       //fdqRLiv.ExecSQL;

       //fdqLivA.SQL.Text:='UPDATE livres SET idauteur = :aut,idediteur=:nedi,ideditionpoche=:nedip,codepoche=:cpoch,idthem=:them,isbn=:isb,datparut=:dpar,idnation=:nat,resume=:res,avis=:av,note=:nota, datmaj = :maj  WHERE titre = :tit' ;
              //fdqLivA.ParamByName('aut').AsInteger := coda;
              //fdqLivA.ParamByName('nedi').AsInteger  := coded;
              //fdqLivA.ParamByName('nedip').AsInteger := codedp;
              //fdqLivA.ParamByName('cpoch').AsString := edTitre.Text;
             // fdqLivA.ParamByName('them').AsInteger := codt;
              //fdqLivA.ParamByName('isb').AsString := edTitre.Text;
              //fdqLivA.ParamByName('dpar').AsDate := StrToDate(edParut.Text) ;
              //fdqLivA.ParamByName('nat').AsInteger  := codn;
              //fdqLivA.ParamByName('res').AsString := mDigest.Text ;
              //fdqLivA.ParamByName('av').AsString := edTitre.Text;
              //if (edNot.text.IsEmpty=True) then
                    //fdqLivA.ParamByName('nota').AsInteger := -0
                    //else
                    //fdqLivA.ParamByName('nota').AsInteger := strtoint(edNot.Text) ;
              //fdqLivA.ParamByName('maj').AsDate := StrToDate(Datmaj);
              //fdqLivA.ParamByName('tit').AsString := cbTitre.Selected.Text;
      //fdqLivA.ExecSQL;
   qPara.Close;
       qPara.SQL.Clear;
       qPara.SQL.Text := 'select idexploit,exuser,superficie,elevage,culture from identexploit';
       qPara.Open;
      edEnt.Text:=qPara.FieldByName('idexploit').AsString;
     edSup.Text:=qPara.FieldByName('superficie').AsString;
      res:= qPara.FieldByName('exuser').Asinteger;
      cult:=  qPara.FieldByName('culture').Asinteger;
      elev:=  qPara.FieldByName('elevage').Asinteger;
      if cult=1 then rbmCult.ischecked:=True
        else if cult=2 then  rbpCult.ischecked:=True;
       if elev=0 then rbnElev.ischecked:=True
        else if elev=1 then  rbmElev.ischecked:=True
        else if elev=2 then  rbpElev.ischecked:=True;



     qPara.Close;
       qPara.SQL.Clear;
       qPara.SQL.Text := 'select nom,prenom,extadress,idvil from utilisateur where iduser =:ius ';

      qpara.ParamByName('ius').AsInteger:= res;

       qPara.Open;
       edNom.Text:=qPara.FieldByName('nom').AsString;
      edPren.Text:=qPara.FieldByName('prenom').AsString;
      edAdres.Text:=qPara.FieldByName('extadress').AsString;
      resv:= qPara.FieldByName('idvil').Asinteger;
      
      qPara.Close;
       qPara.SQL.Clear;
       qPara.SQL.Text := 'select ville,codpost from ville where idvil=:ivil ';
        qpara.ParamByName('ivil').AsInteger:= resv;
     
       qPara.Open;
        edCP.Text:=qPara.FieldByName('codpost').AsString;
      edVil.Text:=qPara.FieldByName('ville').AsString;


   qPara.Close;
       qPara.SQL.Clear;
       qPara.SQL.Text := 'select espnom from espece';
       qPara.Open;
      //edEnt.Text:=qPara.FieldByName('idexploit').AsString;
   qPara.Close;
       qPara.SQL.Clear;
       qPara.SQL.Text := 'select ncult from culture';
       qPara.Open;
      //edEnt.Text:=qPara.FieldByName('idexploit').AsString;



 {$IF Defined(ANDROID) or Defined(IOS)  }
   btQuit.Visible:=False;
{$ENDIF}

end;

end.
