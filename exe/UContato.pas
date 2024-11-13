unit UContato;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.Buttons;

type
  TFrm_cadastro = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    bt_fechar: TButton;
    bt_novo: TSpeedButton;
    bt_editar: TSpeedButton;
    bt_deletar: TSpeedButton;
    bt_gravar: TSpeedButton;
    bt_cancelar: TSpeedButton;
    bt_atualizar: TSpeedButton;
    DBNavigator1: TDBNavigator;
    pn_cadastro: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    db_nome: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    procedure bt_novoClick(Sender: TObject);
    procedure bt_editarClick(Sender: TObject);
    procedure bt_deletarClick(Sender: TObject);
    procedure bt_gravarClick(Sender: TObject);
    procedure bt_cancelarClick(Sender: TObject);
    procedure bt_atualizarClick(Sender: TObject);
    procedure bt_fecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_cadastro: TFrm_cadastro;

implementation

{$R *.dfm}

uses UDM;

procedure TFrm_cadastro.bt_atualizarClick(Sender: TObject);
begin
ShowMessage('Atualizado com sucesso');
bt_atualizar.Enabled:= false;
bt_cancelar.Enabled:= false;
pn_cadastro.Enabled:= false;
bt_novo.Enabled:= true ;

dm.Q_cadastro.Refresh;
bt_editar.Enabled:= true;
end;

procedure TFrm_cadastro.bt_cancelarClick(Sender: TObject);
begin
dm.Q_cadastro.Cancel;
  bt_atualizar.Enabled:= false;
         bt_cancelar.Enabled:= false;
            bt_novo.Enabled:= true;
             bt_gravar.Enabled:= false;
             bt_editar.Enabled:= true;
         pn_cadastro.Enabled:= true;
end;

procedure TFrm_cadastro.bt_deletarClick(Sender: TObject);
var
  Result: Integer;
begin
  Result := MessageDlg('Você tem certeza que deseja deletar este item?',
                       mtWarning,
                       [mbYes, mbNo],
                       0);

  if Result = mrYes then
  begin
    // Código para deletar o item
    dm.Q_cadastro.Delete;
    ShowMessage('Item deletado com sucesso!');
    begin


    bt_novo.Enabled:= true;
    bt_editar.Enabled:= true;
    bt_gravar.Enabled:= false;
    end;
  end
  else
  begin
    ShowMessage('Ação cancelada.');
  end;
 if dm.Q_cadastro.RecordCount = 0 then
   bt_deletar.Enabled:= false;
    bt_editar.Enabled:= true;
  bt_novo.Enabled:= true;
         bt_gravar.Enabled:= false;
end;

procedure TFrm_cadastro.bt_editarClick(Sender: TObject);
begin
         dm.Q_cadastro.Edit;
         pn_cadastro.Enabled:= true;
         bt_editar.Enabled:= false;
         bt_atualizar.Enabled:= true;
         bt_cancelar.Enabled:= true;
         bt_novo.Enabled:= false;




end;

procedure TFrm_cadastro.bt_fecharClick(Sender: TObject);
begin
if messagedlg ('deseja sair do sistema',mtConfirmation,[mbok,mbno], 0)=mrok then
begin
  Application.Terminate
end
else
abort;


end;

procedure TFrm_cadastro.bt_gravarClick(Sender: TObject);
begin
dm.Q_cadastro.Post;
showmessage('Gravado com sucesso');
bt_novo.Enabled:=  true;
bt_gravar.Enabled:= false;
pn_cadastro.Enabled:= false;
bt_editar.Enabled:= true;
bt_deletar.Enabled:= true;
bt_cancelar.Enabled:= false;
end;

procedure TFrm_cadastro.bt_novoClick(Sender: TObject);
var
prox: integer;
begin
bt_cancelar.Enabled:= true;
bt_editar.Enabled:= false;
bt_deletar.Enabled:= false;
 pn_cadastro.Enabled:= true;
dm.Q_cadastro.Active:= true;

dm.Q_cadastro.Last;
prox:= dm.Q_cadastroID_CONTATO.AsInteger+1;
dm.Q_cadastro.Append;
dm.Q_cadastroID_CONTATO.AsInteger:= prox;
db_nome.SetFocus;
bt_novo.Enabled:= false;
bt_gravar.Enabled:= true;





end;

end.
