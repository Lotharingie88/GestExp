unit GestPhyto;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TFPhyto = class(TForm)
    Layout1: TLayout;
    btQuit: TButton;
    procedure btQuitClick(Sender: TObject);
  private
    { D�clarations priv�es }
  public
    { D�clarations publiques }
  end;

var
  FPhyto: TFPhyto;

implementation

{$R *.fmx}

procedure TFPhyto.btQuitClick(Sender: TObject);
begin
     close;
end;

end.
