object DataModule2: TDataModule2
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 324
  Width = 462
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    Left = 40
    Top = 8
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 168
    Top = 16
  end
  object FDConnection1: TFDConnection
    ConnectionName = 'gestexp'
    Params.Strings = (
      'Database=C:\user\delphi\projets\gestexp\data\gestexp.db'
      'DriverID=SQLite')
    Connected = True
    AfterConnect = FDConnection1AfterConnect
    Left = 168
    Top = 64
  end
  object FDQuery1: TFDQuery
    ConnectionName = 'gestexp'
    Left = 168
    Top = 120
  end
  object FDTable1: TFDTable
    Connection = FDConnection1
    Left = 288
    Top = 64
  end
  object FDTable2: TFDTable
    Connection = FDConnection1
    Left = 320
    Top = 136
  end
  object FDScript1: TFDScript
    SQLScripts = <>
    Connection = FDConnection1
    Params = <>
    Macros = <>
    Left = 168
    Top = 184
  end
end
