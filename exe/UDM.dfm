object DM: TDM
  OldCreateOrder = False
  Height = 346
  Width = 567
  object conexao: TFDConnection
    Params.Strings = (
      'Database=C:\CURSOS\sistema\exe\banco\CONTATO.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'Protocol=TCPIP'
      'Server=localhost'
      'Port=3050'
      'CharacterSet=WIN1252'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 216
    Top = 112
  end
  object Q_cadastro: TFDQuery
    Active = True
    Connection = conexao
    SQL.Strings = (
      'select * from contato '
      'order by id_contato')
    Left = 288
    Top = 176
    object Q_cadastroID_CONTATO: TIntegerField
      FieldName = 'ID_CONTATO'
      Origin = 'ID_CONTATO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Q_cadastroNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 100
    end
    object Q_cadastroTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      Required = True
      EditMask = '!\(99\)0000-0000;1;_'
      Size = 15
    end
    object Q_cadastroCELULAR: TStringField
      FieldName = 'CELULAR'
      Origin = 'CELULAR'
      Required = True
      EditMask = '!\(99\)0000-0000;1;_'
      Size = 15
    end
    object Q_cadastroEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Required = True
      Size = 100
    end
  end
  object ds_cadastro: TDataSource
    DataSet = Q_cadastro
    Left = 184
    Top = 264
  end
end
