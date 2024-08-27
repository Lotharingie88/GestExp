unit GestExpor;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TFExport = class(TForm)
    Layout1: TLayout;
    btQuit: TButton;
    procedure btQuitClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FExport: TFExport;

implementation

{$R *.fmx}

procedure TFExport.btQuitClick(Sender: TObject);
begin
     close;
end;

end.
