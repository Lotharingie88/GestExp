object DataModule3: TDataModule3
  Height = 480
  Width = 640
  object FDGesExpSqlite: TFDConnection
    ConnectionName = 'GesExp'
    Params.Strings = (
      'Database=C:\user\delphi\projets\gestexp\data\gestexp.db'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 168
    Top = 16
  end
  object FDQuery1: TFDQuery
    Left = 128
    Top = 200
  end
  object FDGesExpMysql: TFDConnection
    ConnectionName = 'gestexp'
    Params.Strings = (
      'Database=gestexp'
      'User_Name=root'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 376
    Top = 8
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    Left = 544
    Top = 8
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 56
    Top = 16
  end
end
