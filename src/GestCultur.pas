unit GestCultur;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TFGencult = class(TForm)
    Layout1: TLayout;
    btQuit: TButton;
    procedure btQuitClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FGencult: TFGencult;

implementation

{$R *.fmx}

procedure TFGencult.btQuitClick(Sender: TObject);
begin
    close;
end;

end.
