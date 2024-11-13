program contato;

uses
  Vcl.Forms,
  UContato in 'UContato.pas' {Frm_cadastro},
  UDM in 'UDM.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrm_cadastro, Frm_cadastro);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
