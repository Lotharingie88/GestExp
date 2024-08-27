program gestexp;

uses
  System.StartUpCopy,
  FMX.Forms,
  uDatUtil in 'uDatUtil.pas' {FTest},
  Admin in 'Admin.pas' {Fadminist},
  gexploit in 'gexploit.pas' {Fgxploit},
  GestUser in 'GestUser.pas' {Fgestuser},
  GestTroup in 'GestTroup.pas' {Ftroupeau},
  GestAnim in 'GestAnim.pas' {Fanimal},
  Gpara in 'Gpara.pas' {Fpara},
  GestVent in 'GestVent.pas' {FVente},
  GestProd in 'GestProd.pas' {FProd},
  GestPatho in 'GestPatho.pas' {Fpatho},
  GestCultur in 'GestCultur.pas' {FGencult},
  GestFourrag in 'GestFourrag.pas' {FFourag},
  GestCereal in 'GestCereal.pas' {FCereal},
  GestPhyto in 'GestPhyto.pas' {FPhyto},
  GestIdent in 'GestIdent.pas' {FIdent},
  GestParcel in 'GestParcel.pas' {FParcel},
  GestPharma in 'GestPharma.pas' {FPharma},
  GestImp in 'GestImp.pas' {FImport},
  GestExpor in 'GestExpor.pas' {FExport},
  GestLogs in 'GestLogs.pas' {FLogs},
  GestStat in 'GestStat.pas' {FStat},
  GestSync in 'GestSync.pas' {FSync},
  uDB in 'uDB.pas' {DataModule3: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFgxploit, Fgxploit);
  Application.CreateForm(TFadminist, Fadminist);
  Application.CreateForm(TFgestuser, Fgestuser);
  Application.CreateForm(TFtroupeau, Ftroupeau);
  Application.CreateForm(TFanimal, Fanimal);
  Application.CreateForm(TFpara, Fpara);
  Application.CreateForm(TFVente, FVente);
  Application.CreateForm(TFProd, FProd);
  Application.CreateForm(TFpatho, Fpatho);
  Application.CreateForm(TFGencult, FGencult);
  Application.CreateForm(TFFourag, FFourag);
  Application.CreateForm(TFCereal, FCereal);
  Application.CreateForm(TFPhyto, FPhyto);
  Application.CreateForm(TFIdent, FIdent);
  Application.CreateForm(TFParcel, FParcel);
  Application.CreateForm(TFPharma, FPharma);
  Application.CreateForm(TFImport, FImport);
  Application.CreateForm(TFExport, FExport);
  Application.CreateForm(TFLogs, FLogs);
  Application.CreateForm(TFStat, FStat);
  Application.CreateForm(TFSync, FSync);
  Application.CreateForm(TDataModule3, DataModule3);
  Application.CreateForm(TDataModule3, DataModule3);
  Application.Run;
end.
