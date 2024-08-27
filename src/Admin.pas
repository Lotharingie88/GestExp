unit Admin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl,
  FMX.Layouts, FMX.StdCtrls, FMX.Controls.Presentation;

type
  TFadminist = class(TForm)
    Layout1: TLayout;
    TabControl1: TTabControl;
    TabAdmin: TTabItem;
    TabChept: TTabItem;
    TabCult: TTabItem;
    TabExploit: TTabItem;
    PAdmin: TPanel;
    btParam: TButton;
    BtUser: TButton;
    btImport: TButton;
    btExport: TButton;
    btLog: TButton;
    btStat: TButton;
    PCheptel: TPanel;
    PCultur: TPanel;
    PExploit: TPanel;
    btGlob: TButton;
    btIndiv: TButton;
    btEtat: TButton;
    btFourrag: TButton;
    btCereal: TButton;
    btPhyto: TButton;
    btIdent: TButton;
    btPharma: TButton;
    btQuit: TButton;
    btPrec: TButton;
    btPrec2: TButton;
    btQuit2: TButton;
    btPrec3: TButton;
    btQuit3: TButton;
    btPrec4: TButton;
    btQuit4: TButton;
    btSynch: TButton;
    btParcel: TButton;
    btVente: TButton;
    btProd: TButton;
    btPatho: TButton;
    procedure TabAdminClick(Sender: TObject);
    procedure TabCheptClick(Sender: TObject);
    procedure TabCultClick(Sender: TObject);
    procedure TabExploitClick(Sender: TObject);
    procedure btParamClick(Sender: TObject);
    procedure BtUserClick(Sender: TObject);
    procedure btQuitClick(Sender: TObject);
    procedure btQuit2Click(Sender: TObject);
    procedure btQuit3Click(Sender: TObject);
    procedure btQuit4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btIndivClick(Sender: TObject);
    procedure btGlobClick(Sender: TObject);
    procedure btVenteClick(Sender: TObject);
    procedure btProdClick(Sender: TObject);
    procedure btPathoClick(Sender: TObject);
    procedure btPhytoClick(Sender: TObject);
    procedure btFourragClick(Sender: TObject);
    procedure btCerealClick(Sender: TObject);
    procedure btEtatClick(Sender: TObject);
    procedure btIdentClick(Sender: TObject);
    procedure btParcelClick(Sender: TObject);
    procedure btPharmaClick(Sender: TObject);
    procedure btImportClick(Sender: TObject);
    procedure btExportClick(Sender: TObject);
    procedure btLogClick(Sender: TObject);
    procedure btStatClick(Sender: TObject);
    procedure btSynchClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Fadminist: TFadminist;

implementation

{$R *.fmx}
{$R *.XLgXhdpiTb.fmx ANDROID}
 uses Gpara,GestUser,GestAnim,GestTroup,GestVent,GestProd,GestPatho,GestCultur,GestFourrag,GestCereal,GestPhyto,GestIdent,GestParcel,GestPharma,GestImp,GestExpor,GestLogs,GestStat,GestSync;

procedure TFadminist.btCerealClick(Sender: TObject);
var
   frm:TFCereal;
begin
   frm:=TFCereal.Create(Self);
   {$IF Defined(IOS) or Defined(ANDROID)}

        frm.Show;
   {$ELSE}

       frm.ShowModal;
   {$ENDIF}

end;

procedure TFadminist.btEtatClick(Sender: TObject);
var
   frm:TFGenCult;
begin
   frm:=TFGenCult.Create(Self);
   {$IF Defined(IOS) or Defined(ANDROID)}

        frm.Show;
   {$ELSE}

       frm.ShowModal;
   {$ENDIF}

end;

procedure TFadminist.btExportClick(Sender: TObject);
var
   frm:TFExport;
begin
   frm:=TFExport.Create(Self);
   {$IF Defined(IOS) or Defined(ANDROID)}

        frm.Show;
   {$ELSE}

       frm.ShowModal;
   {$ENDIF}

end;

procedure TFadminist.btFourragClick(Sender: TObject);
      var
   frm:TFFourag;
begin
   frm:=TFFourag.Create(Self);
   {$IF Defined(IOS) or Defined(ANDROID)}

        frm.Show;
   {$ELSE}

       frm.ShowModal;
   {$ENDIF}
end;

procedure TFadminist.btGlobClick(Sender: TObject);
var
   frm: TFtroupeau;
begin
   frm:=TFtroupeau.Create(Self);
   {$IF Defined(IOS) or Defined(ANDROID)}

        frm.Show;
   {$ELSE}

       frm.ShowModal;
   {$ENDIF}
end;

procedure TFadminist.btIdentClick(Sender: TObject);
var
   frm:TFIdent;
begin
   frm:=TFIdent.Create(Self);
   {$IF Defined(IOS) or Defined(ANDROID)}

        frm.Show;
   {$ELSE}

       frm.ShowModal;
   {$ENDIF}

end;

procedure TFadminist.btImportClick(Sender: TObject);
var
   frm:TFImport;
begin
   frm:=TFImport.Create(Self);
   {$IF Defined(IOS) or Defined(ANDROID)}

        frm.Show;
   {$ELSE}

       frm.ShowModal;
   {$ENDIF}

end;

procedure TFadminist.btIndivClick(Sender: TObject);
var
   frm: TFanimal;
begin
   frm:=TFanimal.Create(Self);
   {$IF Defined(IOS) or Defined(ANDROID)}

        frm.Show;
   {$ELSE}

       frm.ShowModal;
   {$ENDIF}
end;

procedure TFadminist.btLogClick(Sender: TObject);
var
   frm:TFLogs;
begin
   frm:=TFLogs.Create(Self);
   {$IF Defined(IOS) or Defined(ANDROID)}

        frm.Show;
   {$ELSE}

       frm.ShowModal;
   {$ENDIF}

end;

procedure TFadminist.btParamClick(Sender: TObject);
var
    frm: TFpara;
begin
   frm:=TFpara.Create(Self);
   {$IF Defined(IOS) or Defined(ANDROID)}

        frm.Show;
   {$ELSE}

       frm.ShowModal;
   {$ENDIF}
end;

procedure TFadminist.btParcelClick(Sender: TObject);
var
   frm:TFParcel;
begin
   frm:=TFParcel.Create(Self);
   {$IF Defined(IOS) or Defined(ANDROID)}

        frm.Show;
   {$ELSE}

       frm.ShowModal;
   {$ENDIF}

end;

procedure TFadminist.btPathoClick(Sender: TObject);
var
   frm:TFpatho;
begin
   frm:=TFpatho.Create(Self);
   {$IF Defined(IOS) or Defined(ANDROID)}

        frm.Show;
   {$ELSE}

       frm.ShowModal;
   {$ENDIF}
end;

procedure TFadminist.btPharmaClick(Sender: TObject);
var
   frm:TFPharma;
begin
   frm:=TFPharma.Create(Self);
   {$IF Defined(IOS) or Defined(ANDROID)}

        frm.Show;
   {$ELSE}

       frm.ShowModal;
   {$ENDIF}

end;

procedure TFadminist.btPhytoClick(Sender: TObject);
var
   frm:TFPhyto;
begin
   frm:=TFPhyto.Create(Self);
   {$IF Defined(IOS) or Defined(ANDROID)}

        frm.Show;
   {$ELSE}

       frm.ShowModal;
   {$ENDIF}

end;

procedure TFadminist.btProdClick(Sender: TObject);
var
   frm:TFprod;
begin
   frm:=TFprod.Create(Self);
   {$IF Defined(IOS) or Defined(ANDROID)}

        frm.Show;
   {$ELSE}

       frm.ShowModal;
   {$ENDIF}
end;


procedure TFadminist.BtUserClick(Sender: TObject);
var
   frm:TFgestuser;
begin
   frm:=TFgestuser.Create(Self);
   {$IF Defined(IOS) or Defined(ANDROID)}

        frm.Show;
   {$ELSE}

       frm.ShowModal;
   {$ENDIF}
end;

procedure TFadminist.btVenteClick(Sender: TObject);
var
   frm:TFvente;
begin
   frm:=TFvente.Create(Self);
   {$IF Defined(IOS) or Defined(ANDROID)}

        frm.Show;
   {$ELSE}

       frm.ShowModal;
   {$ENDIF}
end;

procedure TFadminist.FormCreate(Sender: TObject);
begin
   {$IF Defined(ANDROID) or Defined(IOS)  }
   btQuit.Visible:=False;
   btQuit2.Visible:=False;
   btQuit3.Visible:=False;
   btQuit4.Visible:=False;
   {$ENDIF}
end;

procedure TFadminist.btQuit2Click(Sender: TObject);
begin
     close;
end;

procedure TFadminist.btQuit3Click(Sender: TObject);
begin
     close;
end;

procedure TFadminist.btQuit4Click(Sender: TObject);
begin
    close;
end;

procedure TFadminist.btQuitClick(Sender: TObject);
begin
     close;
end;

procedure TFadminist.btStatClick(Sender: TObject);
var
   frm:TFStat;
begin
   frm:=TFStat.Create(Self);
   {$IF Defined(IOS) or Defined(ANDROID)}

        frm.Show;
   {$ELSE}

       frm.ShowModal;
   {$ENDIF}
end;

procedure TFadminist.btSynchClick(Sender: TObject);
    var
   frm:TFSync;
begin
   frm:=TFSync.Create(Self);
   {$IF Defined(IOS) or Defined(ANDROID)}

        frm.Show;
   {$ELSE}

       frm.ShowModal;
   {$ENDIF}
end;

procedure TFadminist.TabAdminClick(Sender: TObject);
begin
   PAdmin.Visible:=True;
   PCheptel.Visible:=False;
   PCultur.Visible:=False;
   PExploit.Visible:=False;
end;

procedure TFadminist.TabCheptClick(Sender: TObject);
begin
   PAdmin.Visible:=False;
   PCheptel.Visible:=True;
   PCultur.Visible:=False;
   PExploit.Visible:=False;
end;

procedure TFadminist.TabCultClick(Sender: TObject);
begin
   PAdmin.Visible:=False;
   PCheptel.Visible:=False;
   PCultur.Visible:=True;
   PExploit.Visible:=False;
end;

procedure TFadminist.TabExploitClick(Sender: TObject);
begin
   PAdmin.Visible:=False;
   PCheptel.Visible:=False;
   PCultur.Visible:=False;
   PExploit.Visible:=True;
end;

end.
