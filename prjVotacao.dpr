program prjVotacao;

uses
  System.StartUpCopy,
  FMX.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  Classe.Votar in 'Classe.Votar.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
