object DataModule3: TDataModule3
  Height = 533
  Width = 323
  object FDQuery1: TFDQuery
    Connection = FDGesEXP
    Left = 16
    Top = 96
  end
  object FDQuerRace: TFDQuery
    Connection = FDGesEXP
    SQL.Strings = (
      'select cirace, racnom from race order by racnom')
    Left = 88
    Top = 104
  end
  object FDQuery3: TFDQuery
    Connection = FDGesEXP
    Left = 40
    Top = 168
  end
  object FDQuery4: TFDQuery
    Connection = FDGesEXP
    Left = 104
    Top = 176
  end
  object FDGesEXP: TFDConnection
    ConnectionName = 'GesEXP'
    Params.Strings = (
      
        'Database=\\SYNAPSATNAS\Volume_2\sauvsyn7\user\delphi\projets\ges' +
        'texp\data\gestexp.db'
      'User_Name=root'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 200
    Top = 16
  end
end
