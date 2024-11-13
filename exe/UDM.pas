unit UDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Phys.FBDef;

type
  TDM = class(TDataModule)
    conexao: TFDConnection;
    Q_cadastro: TFDQuery;
    ds_cadastro: TDataSource;
    Q_cadastroID_CONTATO: TIntegerField;
    Q_cadastroNOME: TStringField;
    Q_cadastroTELEFONE: TStringField;
    Q_cadastroCELULAR: TStringField;
    Q_cadastroEMAIL: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UContato;

{$R *.dfm}

end.
