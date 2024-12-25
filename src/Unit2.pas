unit Unit2;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Phys.MySQLDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.FMXUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet,FireDAC.Comp.Script, FireDAC.Comp.Client, FireDAC.Phys.SQLite,
  FireDAC.Phys.MySQL, FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util;

type
  TDataModule2 = class(TDataModule)
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    FDTable1: TFDTable;
    FDTable2: TFDTable;
    FDScript1: TFDScript;

    procedure DataModuleCreate(Sender: TObject);
    //procedure FDConnection1BeforeConnect(Sender: TObject);
    procedure FDConnection1AfterConnect(Sender: TObject);
    //procedure FDPhysSQLiteDriverLink1DriverCreated(Sender: TObject);


  private
    { Déclarations privées }
    function dbname: string;
  public
    { Déclarations publiques }
  end;

var
  DataModule2: TDataModule2;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}
 uses System.IOUtils;

 procedure TDataModule2.DataModuleCreate(Sender: TObject);
  begin
     FDConnection1.Connected:=True;
  end;
 function TDataModule2.dbname: string;
 var
  chemin: string;
  begin
  {$IFDEF DEBUG}
    chemin := TPath.Combine(TPath.GetDocumentsPath, 'gestexp.db');
  {$ELSE}
    chemin := TPath.Combine(TPath.GetHomePath, 'gestexp.db');
  {$ENDIF}
    if not TDirectory.Exists(chemin) then
      TDirectory.CreateDirectory(chemin);
    result := TPath.Combine(chemin, 'mabase');
  end;
 procedure TDataModule2.FDConnection1AfterConnect(Sender: TObject);
var
  version: integer;
  fichier: string;
  i: integer;
  majEffectuee: boolean;
begin
  fichier := dbname + '.dbv';
  if tfile.Exists(fichier) then
    version := tfile.ReadAllText(fichier).ToInteger
  else
    version := -1;
  majEffectuee := false;
  for i := version + 1 to FDScript1.SQLScripts.Count - 1 do
  begin
    if not majEffectuee then
      majEffectuee := true;
    FDScript1.ExecuteScript(FDScript1.SQLScripts[i].SQL);
    inc(version);
  end;
  if majEffectuee then
    tfile.writeAllText(fichier, version.ToString,tencoding.UTF8 );
  //for i := 0 to ComponentCount - 1 do
    //if (Components[i] is TFDTable) then
     // (Components[i] as TFDTable).Open;
end;

//procedure TDataModule2.FDConnection1BeforeConnect(Sender: TObject);
//begin
 // FDConnection1.Params.Clear;
  //FDConnection1.Params.AddPair('DriverID', 'SQLite');
 //FDConnection1.Params.AddPair('Database', dbname + '.db');
//end;



end.


