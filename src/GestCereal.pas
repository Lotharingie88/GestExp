unit GestCereal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TFCereal = class(TForm)
    Layout1: TLayout;
    btQuit: TButton;
    procedure btQuitClick(Sender: TObject);
  private
    { D�clarations priv�es }
  public
    { D�clarations publiques }
  end;

var
  FCereal: TFCereal;

implementation

{$R *.fmx}

procedure TFCereal.btQuitClick(Sender: TObject);
begin
     Close;
end;

end.
