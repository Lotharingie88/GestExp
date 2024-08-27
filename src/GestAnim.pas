unit GestAnim;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,FMX.DialogService, FMX.Layouts,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Edit, FMX.ListBox,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,system.Rtti, FMX.DateTimeCtrls;

type
  TFanimal = class(TForm)
    Layout1: TLayout;
    eIdent: TEdit;
    Button1: TButton;
    btSave: TButton;
    btModif: TButton;
    btReset: TButton;
    btQuit: TButton;
    eNom: TEdit;
    GroupBox1: TGroupBox;
    rbMal: TRadioButton;
    rbFem: TRadioButton;
    GroupBox2: TGroupBox;
    cbRpere: TComboBox;
    cbRmere: TComboBox;
    cbRindiv: TComboBox;
    eRacP: TEdit;
    eRacM: TEdit;
    eRacI: TEdit;
    eIdentP: TEdit;
    eIdentM: TEdit;
    GroupBox3: TGroupBox;
    rbEmbo: TRadioButton;
    rbEmbn: TRadioButton;
    cbNaiss: TComboBox;
    GroupBox4: TGroupBox;
    rbAvoro: TRadioButton;
    rbAvorn: TRadioButton;
    GroupBox5: TGroupBox;
    rbJumo: TRadioButton;
    rbJumn: TRadioButton;
    ePoi: TEdit;
    GroupBox6: TGroupBox;
    rbPeso: TRadioButton;
    rbPesn: TRadioButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    GroupBox7: TGroupBox;
    GroupBox8: TGroupBox;
    cbSortie: TComboBox;
    cbEntree: TComboBox;
    GroupBox9: TGroupBox;
    eExplOr: TEdit;
    cbIndiv: TComboBox;
    qAnim: TFDQuery;
    deDent: TDateEdit;
    deDnaiss: TDateEdit;
    GroupBox10: TGroupBox;
    rbIao: TRadioButton;
    rbIan: TRadioButton;
    Label12: TLabel;
    deDsor: TDateEdit;
    lbMaj: TLabel;
    procedure btQuitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btModifClick(Sender: TObject);
    procedure btSaveClick(Sender: TObject);
    procedure btResetClick(Sender: TObject);
    procedure cbIndivChange(Sender: TObject);
    procedure cbIndivClick(Sender: TObject);
    procedure cbIndivExit(Sender: TObject);
  private
    { Déclarations privées }
    procedure Caract;
  public
    { Déclarations publiques }
  end;

var
  Fanimal: TFanimal;

implementation

{$R *.fmx}
uses
    uDatUtil;

var
   datmaj : string;
   sex,insem,embr,avort,jum,pes,ment,msort,rper,rmer,rind,cnaiss :integer;
   j,indiv :string;
procedure TFanimal.Caract;
// var
//   sex,insem,embr,avort,jum,pes,ment,msort,rper,rmer,rind,cnaiss :integer;
begin
   if rbMal.IsChecked=True then
        sex:=0
       else
     if rbFem.IsChecked=True  then
        sex:=1
        else
       ShowMessage('Selectionner un sexe');
       ShowMessage(sex.ToString);
       if rbAvoro.IsChecked=True then
       avort:=0
        else
        if rbAvorn.IsChecked=True then
        avort:=1
        else
       ShowMessage('Selectionner un statut avortement ');
       ShowMessage(avort.ToString);
       if rbEmbo.IsChecked=True then
        embr:=0
        else
       if rbEmbn.IsChecked=True then
        embr:=1
        else
      ShowMessage('Selectionner un statut embryon');
       if rbIao.IsChecked=True then
        insem:=0
        else
        if rbIan.IsChecked=True then
        insem:=1
        else
       ShowMessage('Selectionner un statut insemination');
       if rbJumo.IsChecked=True then
        jum:=0
        else
        if rbJumn.IsChecked=True then
        jum:=1
        else
       ShowMessage('Selectionner un statut jumeau');
       if rbPeso.IsChecked=True then
        pes:=0
        else
        if rbPesn.IsChecked=True then
        pes:=1
       else
       TDialogService.ShowMessage('Selectionner un statut pesé');
     if cbRpere.Selected.Text.IsEmpty then
        ShowMessage('Selectionner une race Père')
        else
        begin
         qAnim.Close;
         qAnim.SQL.Clear;
         qAnim.SQL.Text :='select cirace,codrace from race where racnom =:champSqlite ';
         qAnim.ParamByName('champSqlite').AsString :=  cbRpere.Selected.Text;
         qAnim.Open;
         rper:=qAnim.FieldByName('cirace').AsInteger;
         eRacP.Text:=qAnim.FieldByName('codrace').AsString;
         qAnim.Close;
        end;
     if cbRmere.Selected.Text.IsEmpty then
        ShowMessage('Selectionner une race Mère')
        else
        begin
         qAnim.Close;
         qAnim.SQL.Clear;
         qAnim.SQL.Text :='select cirace,codrace from race where racnom =:champSqlite ';
         qAnim.ParamByName('champSqlite').AsString :=  cbRmere.Selected.Text;
         qAnim.Open;
         rmer:=qAnim.FieldByName('cirace').AsInteger;
         eRacM.Text:=qAnim.FieldByName('codrace').AsString;
         qAnim.Close;
        end;
     if cbRindiv.Selected.Text.IsEmpty then
        TDialogService.ShowMessage('Selectionner une race Individu')
        else
        begin
         qAnim.Close;
         qAnim.SQL.Clear;
         qAnim.SQL.Text :='select cirace,codrace from race where racnom =:champSqlite ';
         qAnim.ParamByName('champSqlite').AsString :=  cbRindiv.Selected.Text;
         qAnim.Open;
         rind:=qAnim.FieldByName('cirace').AsInteger;
         eRacI.Text:=qAnim.FieldByName('codrace').AsString;
         qAnim.Close;
        end;
     if cbEntree.Selected.Text.IsEmpty then
        ment:=0
        else
        begin
         qAnim.Close;
         qAnim.SQL.Clear;
         qAnim.SQL.Text :='select cientree from entree where Cause =:champSqlite ';
         qAnim.ParamByName('champSqlite').AsString :=  cbEntree.Selected.Text;
         qAnim.Open;
         ment:=qAnim.FieldByName('cientree').AsInteger;
        end;
        if cbSortie.Selected.Text.IsEmpty then
        msort:=0
        else
        begin
         qAnim.Close;
         qAnim.SQL.Clear;
         qAnim.SQL.Text :='select cisort from sortie where caussort =:champSqlite ';
         qAnim.ParamByName('champSqlite').AsString :=  cbSortie.Selected.Text;
         qAnim.Open;
         msort:=qAnim.FieldByName('cisort').AsInteger;
        end;
        if cbNaiss.Selected.Text.IsEmpty then
        tdialogService.ShowMessage('Selectionner une condition de naissance')
        else
        begin
         qAnim.Close;
         qAnim.SQL.Clear;
         qAnim.SQL.Text :='select cicondnaiss from condnaiss where typcondnaiss =:champSqlite ';
         qAnim.ParamByName('champSqlite').AsString :=  cbNaiss.Selected.Text;
         qAnim.Open;
         cnaiss:=qAnim.FieldByName('cicondnaiss').AsInteger;
        end;
end;

procedure TFanimal.btQuitClick(Sender: TObject);
begin
     close;
end;

procedure TFanimal.btSaveClick(Sender: TObject);
//var
//   sex,insem,embr,avort,jum,pes,ment,msort,rper,rmer,rind,cnaiss :integer;
//   j :string;
begin
     datmaj := DateToStr(Date);
//    if rbMal.IsChecked=True then
//        sex:=0
//       else
//     if rbFem.IsChecked=True  then
//        sex:=1
//        else
//       ShowMessage('Selectionner un sexe');
//       //ShowMessage('Sex :'+ sex.ToString);
//       if rbAvoro.IsChecked=True then
//       avort:=0
//        else
//        if rbAvorn.IsChecked=True then
//        avort:=1
//        else
//       ShowMessage('Selectionner un statut avortement ');
//       if rbEmbo.IsChecked=True then
//        embr:=0
//        else
//       if rbEmbn.IsChecked=True then
//        embr:=1
//        else
//      ShowMessage('Selectionner un statut embryon');
//       if rbIao.IsChecked=True then
//        insem:=0
//        else
//        if rbIan.IsChecked=True then
//        insem:=1
//        else
//       ShowMessage('Selectionner un statut insemination');
//       if rbJumo.IsChecked=True then
//        jum:=0
//        else
//        if rbJumn.IsChecked=True then
//        jum:=1
//        else
//       ShowMessage('Selectionner un statut jumeau');
//       if rbPeso.IsChecked=True then
//        pes:=0
//        else
//        if rbPesn.IsChecked=True then
//        pes:=1
//       else
//       ShowMessage('Selectionner un statut pesé');
//     if cbRpere.Selected.Text.IsEmpty then
//        ShowMessage('Selectionner une race Père')
//        else
//        begin
//         qAnim.Close;
//         qAnim.SQL.Clear;
//         qAnim.SQL.Text :='select cirace,codrace from race where racnom =:champSqlite ';
//         qAnim.ParamByName('champSqlite').AsString :=  cbRpere.Selected.Text;
//         qAnim.Open;
//         rper:=qAnim.FieldByName('cirace').AsInteger;
//         eRacP.Text:=qAnim.FieldByName('codrace').AsString;
//         qAnim.Close;
//        end;
//     if cbRmere.Selected.Text.IsEmpty then
//        ShowMessage('Selectionner une race Mère')
//        else
//        begin
//         qAnim.Close;
//         qAnim.SQL.Clear;
//         qAnim.SQL.Text :='select cirace,codrace from race where racnom =:champSqlite ';
//         qAnim.ParamByName('champSqlite').AsString :=  cbRmere.Selected.Text;
//         qAnim.Open;
//         rmer:=qAnim.FieldByName('cirace').AsInteger;
//         eRacM.Text:=qAnim.FieldByName('codrace').AsString;
//         qAnim.Close;
//        end;
//     if cbRindiv.Selected.Text.IsEmpty then
//        ShowMessage('Selectionner une race Individu')
//        else
//        begin
//         qAnim.Close;
//         qAnim.SQL.Clear;
//         qAnim.SQL.Text :='select cirace,codrace from race where racnom =:champSqlite ';
//         qAnim.ParamByName('champSqlite').AsString :=  cbRindiv.Selected.Text;
//         qAnim.Open;
//         rind:=qAnim.FieldByName('cirace').AsInteger;
//         eRacI.Text:=qAnim.FieldByName('codrace').AsString;
//         qAnim.Close;
//        end;
//       if cbEntree.Selected.Text.IsEmpty then
//        ment:=0
//        else
//        begin
//         qAnim.Close;
//         qAnim.SQL.Clear;
//         qAnim.SQL.Text :='select cientree from entree where Cause =:champSqlite ';
//         qAnim.ParamByName('champSqlite').AsString :=  cbEntree.Selected.Text;
//         qAnim.Open;
//         ment:=qAnim.FieldByName('cientree').AsInteger;
//        end;
//        if cbSortie.Selected.Text.IsEmpty then
//        msort:=0
//        else
//        begin
//         qAnim.Close;
//         qAnim.SQL.Clear;
//         qAnim.SQL.Text :='select cisort from sortie where caussort =:champSqlite ';
//         qAnim.ParamByName('champSqlite').AsString :=  cbSortie.Selected.Text;
//         qAnim.Open;
//         msort:=qAnim.FieldByName('cisort').AsInteger;
//        end;
//        if cbNaiss.Selected.Text.IsEmpty then
//        ShowMessage('Selectionner une condition de naissance')
//        else
//        begin
//         qAnim.Close;
//         qAnim.SQL.Clear;
//         qAnim.SQL.Text :='select cicondnaiss from condnaiss where typcondnaiss =:champSqlite ';
//         qAnim.ParamByName('champSqlite').AsString :=  cbNaiss.Selected.Text;
//         qAnim.Open;
//         cnaiss:=qAnim.FieldByName('cicondnaiss').AsInteger;
//        end;
     qAnim.Close;
     qAnim.SQL.Clear;
     if cbIndiv.Visible = False then
     begin
     Caract ;
     if deDnaiss.Text.IsEmpty or eIdent.Text.IsEmpty or ePoi.Text.IsEmpty then
         ShowMessage('Des champs obligatoires sont vides')
          else
          begin
           qanim.SQL.Text:='INSERT into cheptel(identification,nom,extsex,extrace,naissance,entree,motentr,sortie,motsortie,mere,pere,embryogenese,insemination,extcondnaiss,avortement,jumeau,poinaiss,pese,exploitorigin,rper,rmer,datmaj)'+
           ' VALUES (:chSq1,:chSq2,:chSq3,:chSq4,:chSq5,:chSq6,:chSq7,:chSq8,:chSq9,:chSq10,:chSq11,:chSq12,:chSq13,:chSq14,:chSq15,:chSq16,:chSq17,:chSq18,:chSq19,:chSq20,:chSq21,:Datmaj)';
           qanim.ParamByName('chSq1').AsString := eIdent.Text;
           qanim.ParamByName('chSq2').AsString := eNom.Text;
           //FDQuerySelAut.ParamByName('champSqlite3').AsDate := StrToDate(edNaiss.Text);
           qanim.ParamByName('chSq3').AsInteger :=sex;
           qanim.ParamByName('chSq4').AsInteger := rind;
           //FDQuerySelAut.ParamByName('champSqlite5').AsDate := StrToDate(edDec.Text);
           if deDnaiss.IsEmpty then
           qanim.ParamByName('chSq5').AsString :=''
           else
           qanim.ParamByName('chSq5').AsDate := deDnaiss.date;
           if deDent.IsEmpty then
           qanim.ParamByName('chSq6').AsString :=''
           else
           qanim.ParamByName('chSq6').AsDate := deDent.Date ;
           qanim.ParamByName('chSq7').AsInteger := ment;
           if deDsor.IsEmpty then
           qanim.ParamByName('chSq8').AsString :=''
           else
           qanim.ParamByName('chSq8').AsDate := deDsor.Date ;
           qanim.ParamByName('chSq9').AsInteger := msort;
           qanim.ParamByName('chSq10').AsString := eIdentM.Text;
           qanim.ParamByName('chSq11').AsString := eIdentP.Text;
           qanim.ParamByName('chSq12').AsInteger := embr;
           qanim.ParamByName('chSq13').AsInteger := insem;
           qanim.ParamByName('chSq14').AsInteger := cnaiss;
           qanim.ParamByName('chSq15').AsInteger := avort;
           qanim.ParamByName('chSq16').AsInteger := jum;
           qanim.ParamByName('chSq17').AsString := ePoi.Text;
           qanim.ParamByName('chSq18').AsInteger := pes;
           qanim.ParamByName('chSq19').AsString := eExplOr.Text;
           qanim.ParamByName('chSq20').AsInteger := rper;
           qanim.ParamByName('chSq21').AsInteger := rmer;
           qanim.ParamByName('Datmaj').AsDate := StrToDate(Datmaj);
           qanim.ExecSQL;
           TDialogService.ShowMessage('Données enregistrées')
          end;
     end;
     if (cbIndiv.Visible = True and not(cbIndiv.Selected.Text.IsEmpty)) then
       begin
//            if rbMal.IsChecked=True then
//            sex:=0
//            else
//            if rbFem.IsChecked=True  then
//            sex:=1
//             else
//             ShowMessage('Selectionner un sexe');
//             if rbAvoro.IsChecked=True then
//             avort:=0
//             else
//             if rbAvorn.IsChecked=True then
//             avort:=1
//             else
//             ShowMessage('Selectionner un statut avortement ');
//             if rbEmbo.IsChecked=True then
//             embr:=0
//             else
//             if rbEmbn.IsChecked=True then
//             embr:=1
//             else
//             ShowMessage('Selectionner un statut embryon');
//             if rbIao.IsChecked=True then
//             insem:=0
//             else
//             if rbIan.IsChecked=True then
//             insem:=1
//             else
//             ShowMessage('Selectionner un statut insemination');
//             if rbJumo.IsChecked=True then
//             jum:=0
//             else
//             if rbJumn.IsChecked=True then
//             jum:=1
//             else
//             ShowMessage('Selectionner un statut jumeau');
//             if rbPeso.IsChecked=True then
//             pes:=0
//             else
//             if rbPesn.IsChecked=True then
//             pes:=1
//             else
//             ShowMessage('Selectionner un statut pesé');
//             if cbRpere.Selected.Text.IsEmpty then
//             ShowMessage('Selectionner une race Père')
//             else
//            begin
//             qAnim.Close;
//             qAnim.SQL.Clear;
//             qAnim.SQL.Text :='select cirace,codrace from race where racnom =:champSqlite ';
//             qAnim.ParamByName('champSqlite').AsString :=  cbRpere.Selected.Text;
//             qAnim.Open;
//             rper:=qAnim.FieldByName('cirace').AsInteger;
//             eRacP.Text:=qAnim.FieldByName('codrace').AsString;
//             qAnim.Close;
//            end;
//         if cbRmere.Selected.Text.IsEmpty then
//            ShowMessage('Selectionner une race Mère')
//            else
//            begin
//             qAnim.Close;
//             qAnim.SQL.Clear;
//             qAnim.SQL.Text :='select cirace,codrace from race where racnom =:champSqlite ';
//             qAnim.ParamByName('champSqlite').AsString :=  cbRmere.Selected.Text;
//             qAnim.Open;
//             rmer:=qAnim.FieldByName('cirace').AsInteger;
//             eRacM.Text:=qAnim.FieldByName('codrace').AsString;
//             qAnim.Close;
//            end;
//           if cbRindiv.Selected.Text.IsEmpty then
//              ShowMessage('Selectionner une race Individu')
//              else
//              begin
//               qAnim.Close;
//               qAnim.SQL.Clear;
//               qAnim.SQL.Text :='select cirace,codrace from race where racnom =:champSqlite ';
//               qAnim.ParamByName('champSqlite').AsString :=  cbRindiv.Selected.Text;
//               qAnim.Open;
//               rind:=qAnim.FieldByName('cirace').AsInteger;
//               eRacI.Text:=qAnim.FieldByName('codrace').AsString;
//               qAnim.Close;
//              end;
//         if cbEntree.Selected.Text.IsEmpty then
//          ment:=0
//          else
//          begin
//           qAnim.Close;
//           qAnim.SQL.Clear;
//           qAnim.SQL.Text :='select cientree from entree where Cause =:champSqlite ';
//           qAnim.ParamByName('champSqlite').AsString :=  cbEntree.Selected.Text;
//           qAnim.Open;
//           ment:=qAnim.FieldByName('cientree').AsInteger;
//          end;
//          if cbSortie.Selected.Text.IsEmpty then
//          msort:=0
//          else
//          begin
//           qAnim.Close;
//           qAnim.SQL.Clear;
//           qAnim.SQL.Text :='select cisort from sortie where caussort =:champSqlite ';
//           qAnim.ParamByName('champSqlite').AsString :=  cbSortie.Selected.Text;
//           qAnim.Open;
//           msort:=qAnim.FieldByName('cisort').AsInteger;
//          end;
//          if cbNaiss.Selected.Text.IsEmpty then
//          ShowMessage('Selectionner une condition de naissance')
//          else
//          begin
//           qAnim.Close;
//           qAnim.SQL.Clear;
//           qAnim.SQL.Text :='select cicondnaiss from condnaiss where typcondnaiss =:champSqlite ';
//           qAnim.ParamByName('champSqlite').AsString :=  cbNaiss.Selected.Text;
//           qAnim.Open;
//           cnaiss:=qAnim.FieldByName('cicondnaiss').AsInteger;
//          end;
            Caract;
          qAnim.Close;
          qanim.sql.Clear;
            j:=cbRindiv.Selected.Text;
           qanim.SQL.Text:='UPDATE cheptel SET nom = :chSq2, extsex = :chSq3, extrace = :chSq4, naissance = :chSq5, entree = :chSq6, motentr = :chSq7, sortie = :chSq8, motsortie = :chSq9, mere = :chSq10, pere = :chSq11, embryogenese = :chSq12'
            +', insemination = :chSq13, extcondnaiss = :chSq14, avortement = :chSq15, jumeau = :chSq16, poinaiss = :chSq17, pese = :chSq18, exploitorigin = :chSq19, rper = :chSq20, rmer = :chSq21,Datmaj =:Datmaj  WHERE identification = :j' ;
            qanim.ParamByName('chSq2').AsString := eNom.Text;
           qanim.ParamByName('chSq3').AsInteger :=sex;
           qanim.ParamByName('chSq4').AsInteger := rind;
           if deDnaiss.IsEmpty then
           qanim.ParamByName('chSq5').AsString :=''
           else
           qanim.ParamByName('chSq5').AsDate := deDnaiss.date;
           if deDent.IsEmpty then
           qanim.ParamByName('chSq6').AsString :=''
           else
           qanim.ParamByName('chSq6').AsDate := deDent.Date ;
           qanim.ParamByName('chSq7').AsInteger := ment;
           if deDsor.IsEmpty then
           qanim.ParamByName('chSq8').AsString :=''
           else
           qanim.ParamByName('chSq8').AsDate := deDsor.Date ;
           qanim.ParamByName('chSq9').AsInteger := msort;
           qanim.ParamByName('chSq10').AsString := eIdentM.Text;
           qanim.ParamByName('chSq11').AsString := eIdentP.Text;
           qanim.ParamByName('chSq12').AsInteger := embr;
           qanim.ParamByName('chSq13').AsInteger := insem;
           qanim.ParamByName('chSq14').AsInteger := cnaiss;
           qanim.ParamByName('chSq15').AsInteger := avort;
           qanim.ParamByName('chSq16').AsInteger := jum;
           qanim.ParamByName('chSq17').AsString := ePoi.Text;
           qanim.ParamByName('chSq18').AsInteger := pes;
           qanim.ParamByName('chSq19').AsString := eExplOr.Text;
           qanim.ParamByName('chSq20').AsInteger := rper;
           qanim.ParamByName('chSq21').AsInteger := rmer;
           qanim.ParamByName('Datmaj').AsDate := StrToDate(Datmaj);
           qanim.ParamByName('j').AsString :=j;
           qanim.Execute();
           tdialogService.ShowMessage('Données modifiées');
       end;

end;

procedure TFanimal.cbIndivChange(Sender: TObject);
var
   indiv :string;
begin
//   indiv:= cbIndiv.Selected.Text;
//   qAnim.Close;
//   qAnim.SQL.Clear;
//   qAnim.SQL.Text :='select nom,extsex,extrace,naissance,entree,motentr,sortie,motsortie,mere,pere,embryogenese,insemination,extcondnaiss,avortement,jumeau,poinaiss,pese,exploitorigin,datmaj from cheptel where identification = :chSq';
//   qAnim.ParamByName('chSq').AsString :=  indiv;
//   qAnim.Open;
//   eNom.text:=qAnim.FieldByName('nom').AsString;
//
//
//   eIdent.Text:=indiv;


end;

procedure TFanimal.cbIndivClick(Sender: TObject);
var
   indiv :string;
begin
//     indiv:= cbIndiv.Selected.Text;
//   qAnim.Close;
//   qAnim.SQL.Clear;
//   qAnim.SQL.Text :='select nom,extsex,extrace,naissance,entree,motentr,sortie,motsortie,mere,pere,embryogenese,insemination,extcondnaiss,avortement,jumeau,poinaiss,pese,exploitorigin,datmaj from cheptel where identification = :chSq';
//   qAnim.ParamByName('chSq').AsString :=  indiv;
//   qAnim.Open;
//   eNom.text:=qAnim.FieldByName('nom').AsString;
//
//
//   eIdent.Text:=indiv;
end;

procedure TFanimal.cbIndivExit(Sender: TObject);
var
   indiv,maj :string;
   rac,msort,mentr,cnaiss,mrac,prac:integer;
begin
     indiv:= cbIndiv.Selected.Text;
     eIdent.Text:=indiv;
     ShowMessage(indiv);
   qAnim.Close;
   qAnim.SQL.Clear;
   qAnim.SQL.Text :='select nom,extsex,extrace,naissance,entree,motentr,sortie,motsortie,mere,rmer,pere,rper,embryogenese,insemination,extcondnaiss,avortement,jumeau,poinaiss,pese,exploitorigin,datmaj from cheptel where identification = :chSq';
   qAnim.ParamByName('chSq').AsString :=  indiv;
   qAnim.Open;
   eNom.text:=qAnim.FieldByName('nom').AsString;
   deDnaiss.Text:=  qanim.FieldByName('naissance').AsString ;
   rac:= qAnim.FieldByName('extrace').AsInteger;
   mrac:= qAnim.FieldByName('rmer').AsInteger;
   prac :=qAnim.FieldByName('rper').AsInteger ;
   cnaiss:=qAnim.FieldByName('extcondnaiss').AsInteger;
   mentr:=qAnim.FieldByName('motentr').AsInteger ;
   msort:=qAnim.FieldByName('motsortie').AsInteger ;
   ePoi.Text:= IntToStr(qAnim.FieldByName('poinaiss').AsInteger);
   eIdentP.text:= qanim.FieldByName('pere').AsString;
   eIdentM.text:= qanim.FieldByName('mere').AsString;
   if qAnim.FieldByName('extsex').AsInteger=0 then rbMal.IsChecked:=True
   else rbFem.IsChecked:=True;
    if qAnim.FieldByName('embryogenese').AsInteger=0 then rbEmbo.IsChecked:=True
   else rbEmbn.IsChecked:=True;
    if qAnim.FieldByName('insemination').AsInteger=0 then rbIao.IsChecked:=True
   else rbIan.IsChecked:=True;
    if qAnim.FieldByName('avortement').AsInteger=0 then rbAvoro.IsChecked:=True
   else rbAvorn.IsChecked:=True;
    if qAnim.FieldByName('jumeau').AsInteger=0 then rbJumo.IsChecked:=True
   else rbJumn.IsChecked:=True;
    if qAnim.FieldByName('pese').AsInteger=0 then rbPeso.IsChecked:=True
   else rbPesn.IsChecked:=True;
   if qAnim.FieldByName('entree').AsString='' then deDent.Text:=''
   else deDent.text:= qAnim.FieldByName('entree').AsString ;
   if qAnim.FieldByName('sortie').AsString='' then deDsor.Text:=''
   else deDsor.text:=  qAnim.FieldByName('sortie').AsString ;
   maj:= qAnim.FieldByName('datmaj').AsString;
   lbMaj.text:= 'Mis à jour le:' +  maj;
   qanim.Close;
   qanim.SQL.Clear;
   qAnim.SQL.Text:='select racnom,codrace from race where cirace=:chSq ';
   qAnim.ParamByName('chSq').AsInteger :=  rac;
   qanim.open;
   cbRindiv.Selected.Text :=qAnim.FieldByName('racnom').AsString;
   eRacI.text:=qAnim.FieldByName('codrace').AsString;

   qAnim.Close;
   qanim.SQL.Clear;
   qAnim.SQL.Text:='select racnom,codrace from race where cirace=:chSq ';
   qAnim.ParamByName('chSq').AsInteger :=  mrac;
   qanim.open;
   eRacM.text:=qAnim.FieldByName('codrace').AsString;
   cbRmere.Selected.Text :=qAnim.FieldByName('racnom').AsString;
   qAnim.Close;
   qanim.SQL.Clear;
   qAnim.SQL.Text:='select racnom,codrace from race where cirace=:chSq ';
   qAnim.ParamByName('chSq').AsInteger :=  prac;
   qanim.open;
   eRacP.text:=qAnim.FieldByName('codrace').AsString;
   cbRpere.Selected.Text :=qAnim.FieldByName('racnom').AsString;
   qAnim.Close;
   qanim.SQL.Clear;
   qAnim.SQL.Text:='select typcondnaiss from condnaiss where cicondnaiss=:chSq ';
   qAnim.ParamByName('chSq').AsInteger :=  cnaiss;
   qanim.open;
   cbNaiss.Selected.Text :=qAnim.FieldByName('typcondnaiss').AsString;
   qAnim.Close;
   qanim.SQL.Clear;
   qAnim.SQL.Text:='select Cause from entree where cientree=:chSq ';
   qAnim.ParamByName('chSq').AsInteger :=  mentr;
   qanim.open;
   cbRindiv.Selected.Text :=qAnim.FieldByName('Cause').AsString;
   qAnim.Close;
   qanim.SQL.Clear;
   qAnim.SQL.Text:='select caussort from sortie where cisort=:chSq ';
   qAnim.ParamByName('chSq').AsInteger :=  msort;
   qanim.open;
   cbRindiv.Selected.Text :=qAnim.FieldByName('caussort').AsString;
   qAnim.Close;
   eIdent.Text:=indiv;
end;

procedure TFanimal.btModifClick(Sender: TObject);
begin
         qAnim.Close;
         qAnim.SQL.Clear;
         qAnim.SQL.Text :='select identification from cheptel';
         //qAnim.ParamByName('champSqlite').AsString :=  cbSortie.Selected.Text;
         cbIndiv.Items.Clear();
         cbIndiv.Items.Add('');
         cbIndiv.ItemIndex:=0;
         //qAnim.First;
         qAnim.Open;
         while not qAnim.Eof do
           begin
               cbIndiv.Items.Add(qAnim.FieldByName('identification').AsString);
               qAnim.Next;
           end;
         qAnim.close;

     cbIndiv.Visible:=True;
end;

procedure TFanimal.btResetClick(Sender: TObject);
          var
          i: integer;
begin
     for i := 0 to Componentcount-1 do
          	begin
            		if (Components[i] is TEdit ) then
                     begin
                       TEdit(Components[i]).Text:='';
                     end;
//                if (Components[i] is TMemo ) then
//                     begin
//                       TMemo(Components[i]).Text:='';
//                     end;
//                 if (Components[i] is TDateEdit ) then
//                     begin
//                       TDateEdit(Components[i]).Text:='';
//                     end;
               end;
end;

procedure TFanimal.FormCreate(Sender: TObject);
begin
     qAnim.Close;
     qAnim.SQL.Clear;
     qAnim.SQL.Text :='select cause,codcaus from entree';
     qAnim.Open;
     cbEntree.Items.Clear();
     cbEntree.Items.Add('');
     cbEntree.ItemIndex:=0;
     while not qAnim.Eof do
           begin
               cbEntree.Items.Add(qAnim.FieldByName('cause').AsString);
               qAnim.Next;
           end;
     qAnim.Close;
     qAnim.SQL.Clear;
     qAnim.SQL.Text :='select typcondnaiss,codcondnaiss from condnaiss';
     qAnim.Open;
      cbNaiss.Items.Clear();
     cbNaiss.Items.Add('');
     cbNaiss.ItemIndex:=0;
      while not qAnim.Eof do
           begin
               cbNaiss.Items.Add(qAnim.FieldByName('typcondnaiss').AsString);
               qAnim.Next;
           end;
     //edNom.Text:=qAnim.FieldByName('nom').AsString;
     qAnim.Close;
     qAnim.SQL.Clear;
     qAnim.SQL.Text :='select caussort,codsort from sortie';
     qAnim.Open;
      cbSortie.Items.Clear();
     cbSortie.Items.Add('');
     cbSortie.ItemIndex:=0;
     while not qAnim.Eof do
           begin
               cbSortie.Items.Add(qAnim.FieldByName('caussort').AsString);
               qAnim.Next;
           end;
     //edNom.Text:=qAnim.FieldByName('nom').AsString;
     qAnim.Close;
     qAnim.SQL.Clear;
     qAnim.SQL.Text :='select racnom,codrace from race';
     qAnim.Open;
      cbRpere.Items.Clear();
     cbRpere.Items.Add('');
     cbRpere.ItemIndex:=0;
      cbRmere.Items.Clear();
     cbRmere.Items.Add('');
     cbRmere.ItemIndex:=0;
      cbRindiv.Items.Clear();
     cbRindiv.Items.Add('');
     cbRindiv.ItemIndex:=0;
     while not qAnim.Eof do
           begin
               cbRpere.Items.Add(qAnim.FieldByName('racnom').AsString);
               cbRmere.Items.Add(qAnim.FieldByName('racnom').AsString);
               cbRindiv.Items.Add(qAnim.FieldByName('racnom').AsString);
               qAnim.Next;
           end;
     //edNom.Text:=qAnim.FieldByName('nom').AsString;
     qAnim.Close;
   {$IF Defined(ANDROID) or Defined(IOS)  }
        btQuit.Visible:=False;
   {$ENDIF}
end;

end.
