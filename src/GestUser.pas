unit GestUser;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit,
  FMX.ListBox, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Phys, FireDAC.FMXUI.Wait, Data.Bind.Components, Data.Bind.DBScope,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt;

type
  TFgestuser = class(TForm)
    Layout1: TLayout;
    qGestuser: TFDQuery;
    btEnreg: TButton;
    btNouv: TButton;
    btModif: TButton;
    btPrec: TButton;
    btQuit: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edNom: TEdit;
    edPren: TEdit;
    edPhone: TEdit;
    edMail: TEdit;
    edAdress: TEdit;
    edCP: TEdit;
    edVil: TEdit;
    cbProf: TComboBox;
    cbMeti: TComboBox;
    cbNom: TComboBox;
    cbPren: TComboBox;
    FDQuerProfil: TFDQuery;
    FDQuerMeti: TFDQuery;
    FDConnection1: TFDConnection;
    BindSourceDB1: TBindSourceDB;
    BindSourceDB2: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkFillControlToField1: TLinkFillControlToField;
    LinkFillControlToField2: TLinkFillControlToField;
    FDQuerUser: TFDQuery;
    BindSourceDB3: TBindSourceDB;
    LinkFillControlToField3: TLinkFillControlToField;
    LinkFillControlToField4: TLinkFillControlToField;

    procedure FormCreate(Sender: TObject);
    procedure btQuitClick(Sender: TObject);
    procedure btNouvClick(Sender: TObject);
    procedure btEnregClick(Sender: TObject);
    procedure btModifClick(Sender: TObject);
    procedure cbNomClick(Sender: TObject);
    procedure cbNomChange(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Fgestuser: TFgestuser;

implementation

{$R *.fmx}



procedure TFgestuser.btEnregClick(Sender: TObject);
var
  resv:integer;
  resq:integer;
  pro:integer;
  met:integer;
  nb:integer;
begin
     if edvil.text <>'' then
      begin
        qGestuser.Close;
       qGestuser.SQL.Clear;
       qGestuser.SQL.Text := 'select count(*) as nb from ville where ville =:vil and codpost=:codp';
       qGestuser.ParamByName('vil').AsString:=edvil.Text;
       qGestuser.ParamByName('codp').AsInteger:= strtoint(edCP.Text);
       qGestuser.Open;
       resq:=qGestuser.FieldByName('nb').AsInteger;
       qGestuser.Close;
      if resq=1 then
       begin
          qGestuser.Close;
          qGestuser.SQL.Clear;
          qGestuser.SQL.Text := 'select idvil from ville where ville =:vil and codpost=:codp';
          qGestuser.ParamByName('vil').AsString:=edvil.Text;
          qGestuser.ParamByName('codp').AsInteger:= strtoint(edCP.Text);
          qGestuser.Open;
          resv:=qGestuser.FieldByName('idvil').AsInteger;
          qGestuser.Close;
       end;
       if resq=0 then
       begin
        if edvil.text <>'' then
          begin
          qGestuser.Close;
          qGestuser.SQL.Clear;
          qGestuser.SQL.Text := 'insert into ville(ville,codpost) values(:vil,:codp)';
          qGestuser.ParamByName('vil').AsString:=edvil.Text;
          qGestuser.ParamByName('codp').AsInteger:=strtoint(edCP.Text);
          qGestuser.ExecSQL;
           qGestuser.Close;

          qGestuser.SQL.Clear;
          qGestuser.SQL.Text := 'select count(*) as nb from ville where ville =:vil and codpost=:codp';
          qGestuser.ParamByName('vil').AsString:=edvil.Text;
          qGestuser.ParamByName('codp').AsInteger:= strtoint(edCP.Text);
          qGestuser.Open;
          if nb=1 then
          begin
          qGestuser.Close;
          qGestuser.SQL.Text := 'select idvil from ville where ville =:vil and codpost=:codp';
          qGestuser.ParamByName('vil').AsString:=edvil.Text;
          qGestuser.ParamByName('codp').AsInteger:= strtoint(edCP.Text);
          qGestuser.Open;
          resv:=qGestuser.FieldByName('idvil').AsInteger;
          qGestuser.Close;
          end ;
          end
          else resv:=0;


       end;
      end;
         qGestuser.Close;
          qGestuser.SQL.Clear;
          qGestuser.SQL.Text := 'select cmetier from metier where metlib =:meti';
          qGestuser.ParamByName('meti').AsString:=cbMeti.Selected.text;
          qGestuser.Open;
          met:=qGestuser.FieldByName('cmetier').AsInteger;
          qGestuser.Close;
          qGestuser.SQL.Clear;
          qGestuser.SQL.Text := 'select cprofil from profil where profil =:prof';
          qGestuser.ParamByName('prof').AsString:=cbProf.Selected.Text;
          qGestuser.Open;
          pro:=qGestuser.FieldByName('cprofil').AsInteger;

          if btnouv.Visible=true then
           begin
              qGestuser.Close;
              qGestuser.SQL.Clear;
              qGestuser.SQL.Text := 'insert into utilisateur(nom,prenom,extadress,idvil,cactivite,cprofil,telephone,email) values(:nom,:pren,:adr,:idvil,:met,:prof,:phone,:mail)';
              qGestuser.ParamByName('nom').AsString:=edNom.Text;
              qGestuser.ParamByName('pren').AsString:=edPren.Text;
              qGestuser.ParamByName('adr').AsString:=edAdress.Text;
              qGestuser.ParamByName('idvil').AsInteger:=resv;
              qGestuser.ParamByName('met').AsInteger:=met;
              qGestuser.ParamByName('prof').AsInteger:=pro;
              qGestuser.ParamByName('mail').AsString:=edMail.Text;
              qGestuser.ParamByName('phone').AsInteger:=strtoint(edPhone.Text);
              qGestuser.ExecSQL;
           end;
           if btmodif.Visible=true then
           begin
//                qPara.Close;
//              qPara.SQL.Clear;
//              qPara.SQL.Text := 'update identexploit set elevage=:eleva ,culture=:cultu where idexploit=:expl';
//              qpara.ParamByName('eleva').AsInteger:=elev;
//              qpara.ParamByName('cultu').AsInteger:=cult;
//              qpara.ParamByName('expl').AsInteger:= strtoint(edEnt.Text);
//              qpara.ExecSQL;
//              lbCult.Selected.Text ;
//              qpara.Close;
              qGestuser.Close;
              qGestuser.SQL.Clear;
              qGestuser.SQL.Text := 'update utilisateur set extadress=:adr,idvil=:idvil,cactivite=:met,cprofil=:prof,telephone=:phone,email=:mail where nom=:nom and prenom=:pren';
              qGestuser.ParamByName('nom').AsString:=cbNom.selected.Text;
              qGestuser.ParamByName('pren').AsString:=cbPren.selected.Text;
              if edAdress.Text<>'' then
              qGestuser.ParamByName('adr').AsString:=edAdress.Text
               else
                  qGestuser.ParamByName('adr').AsString:='0';
              qGestuser.ParamByName('idvil').AsInteger:=resv;
              qGestuser.ParamByName('met').AsInteger:=met;
              qGestuser.ParamByName('prof').AsInteger:=pro;
              qGestuser.ParamByName('mail').AsString:=edMail.Text;
              qGestuser.ParamByName('phone').AsInteger:=strtoint(edPhone.Text);
              qGestuser.ExecSQL;
           end;
end;

procedure TFgestuser.btModifClick(Sender: TObject);
begin
  btenreg.Visible:=true;
  btNouv.Visible:=false;
  cbNom.Visible:=true;
  cbPren.Visible:=true;
end;

procedure TFgestuser.btNouvClick(Sender: TObject);
begin
  btenreg.Visible:=True;
  btModif.Visible:=false;
  cbNom.Visible:=False;
  cbPren.Visible:=False;
  edNom.Text:='';
  edPren.text:='';
end;

procedure TFgestuser.btQuitClick(Sender: TObject);
begin
  close;
end;

procedure TFgestuser.cbNomChange(Sender: TObject);
var
  res:integer;
  vil:integer;
  act:integer;
  prof:integer;

begin
          qGestuser.Close;
          qGestuser.SQL.Clear;
          qGestuser.SQL.Text := 'select count(*) as nb from utilisateur where nom =:nom and prenom=:pren';
          qGestuser.ParamByName('nom').AsString:=cbNom.selected.Text;
          qGestuser.ParamByName('pren').AsString:= cbPren.selected.Text;
          qGestuser.Open;
          res:=qGestuser.FieldByName('nb').AsInteger;

         if res=1 then
          begin
          qGestuser.Close;
          qGestuser.SQL.Clear;
          qGestuser.SQL.Text := 'select iduser from utilisateur where nom =:nom and prenom=:pren';
          qGestuser.ParamByName('nom').AsString:=cbNom.selected.Text;
          qGestuser.ParamByName('pren').AsString:= cbPren.selected.Text;
          qGestuser.Open;
          res:=qGestuser.FieldByName('iduser').AsInteger;
          //cbPren.selected.Text:=qGestuser.FieldByName('prenom').AsString;
          qGestuser.Close;
          qGestuser.SQL.Clear;
          qGestuser.SQL.Text := 'select extadress,idvil,telephone,email,cactivite,cprofil from utilisateur where iduser =:id';
          qGestuser.ParamByName('id').AsInteger:= res;
          qGestuser.Open;
          edAdress.Text:=qGestuser.FieldByName('extadress').AsString;
          edPhone.Text:=qGestuser.FieldByName('telephone').AsString;
          edMail.Text:=qGestuser.FieldByName('email').AsString;
          vil:=qGestuser.FieldByName('idvil').AsInteger;
          act:=qGestuser.FieldByName('cactivite').AsInteger;
          prof:=qGestuser.FieldByName('cprofil').AsInteger;
          qGestuser.Close;
           qGestuser.SQL.Clear;
          qGestuser.SQL.Text := 'select ville,codpost from ville where idvil =:id';
          qGestuser.ParamByName('id').AsInteger:= vil;
          qGestuser.Open;
          edCP.Text:=qGestuser.FieldByName('codpost').AsString;
          edVil.Text:=qGestuser.FieldByName('ville').AsString;

          qGestuser.Close;
          end;

end;

procedure TFgestuser.cbNomClick(Sender: TObject);
var
  res:integer;
   vil:integer;
  act:integer;
  prof:integer;

begin
          qGestuser.Close;
          qGestuser.SQL.Clear;
          qGestuser.SQL.Text := 'select count(*) as nb from utilisateur where nom =:nom and prenom=:pren';
          qGestuser.ParamByName('nom').AsString:=cbNom.selected.Text;
          qGestuser.ParamByName('pren').AsString:= cbPren.selected.Text;
          qGestuser.Open;
          res:=qGestuser.FieldByName('nb').AsInteger;

         if res=1 then
          begin
          qGestuser.Close;
          qGestuser.SQL.Clear;
          qGestuser.SQL.Text := 'select iduser from utilisateur where nom =:nom and prenom=:pren';
          qGestuser.ParamByName('nom').AsString:=cbNom.selected.Text;
          qGestuser.ParamByName('pren').AsString:= cbPren.selected.Text;
          qGestuser.Open;
          res:=qGestuser.FieldByName('iduser').AsInteger;
          //cbPren.selected.Text:=qGestuser.FieldByName('prenom').AsString;
          qGestuser.Close;
          qGestuser.SQL.Clear;
          qGestuser.SQL.Text := 'select extadress,idvil,telephone,email,cactivite,cprofil from utilisateur where iduser =:id';
          qGestuser.ParamByName('id').AsInteger:= res;
          qGestuser.Open;
          edAdress.Text:=qGestuser.FieldByName('extadress').AsString;
          edPhone.Text:=qGestuser.FieldByName('telephone').AsString;
          edMail.Text:=qGestuser.FieldByName('email').AsString;
          vil:=qGestuser.FieldByName('idvil').AsInteger;
          act:=qGestuser.FieldByName('cactivite').AsInteger;
          prof:=qGestuser.FieldByName('cprofil').AsInteger;
          qGestuser.Close;
          qGestuser.SQL.Clear;
          qGestuser.SQL.Text := 'select ville,codpost from ville where idvil =:id';
          qGestuser.ParamByName('id').AsInteger:= vil;
          qGestuser.Open;
          edCP.Text:=qGestuser.FieldByName('codpost').AsString;
          edVil.Text:=qGestuser.FieldByName('ville').AsString;
          qGestuser.Close;
          qGestuser.SQL.Text := 'select metlib from metier where cmetier =:id';
          qGestuser.ParamByName('id').AsInteger:= prof;
          qGestuser.Open;
          //cbMeti.Tag:=act;
            //DeptNaiss := Integer(CbDeptNmaj.Items.Objects[CbDeptNmaj.ItemIndex])

          qGestuser.Close;
          qGestuser.SQL.Text := 'select profil from profil where cprofil =:id';
          qGestuser.ParamByName('id').AsInteger:= act;
          qGestuser.Open;
          //cbProf.tag:=prof;
            //DeptNaiss := Integer(CbDeptNmaj.Items.Objects[CbDeptNmaj.ItemIndex])
          qGestuser.Close;

          end;
end;


procedure TFgestuser.FormCreate(Sender: TObject);
begin
    btEnreg.Visible:=false;
     qGestuser.Close;
     qGestuser.SQL.Clear;
     qGestuser.SQL.Text :='select nom from utilisateur';
     qGestuser.Open;
     edNom.Text:=qGestuser.FieldByName('nom').AsString;
   {$IF Defined(ANDROID) or Defined(IOS)  }
        btQuit.Visible:=False;
   {$ENDIF}
end;

end.
