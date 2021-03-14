object Database: TDatabase
  OldCreateOrder = False
  Height = 376
  Width = 599
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=C:\EV' +
      'ESig\data;Mode=Share Deny None;Persist Security Info=False;Jet O' +
      'LEDB:System database="";Jet OLEDB:Registry Path="";Jet OLEDB:Dat' +
      'abase Password="";Jet OLEDB:Engine Type=5;Jet OLEDB:Database Loc' +
      'king Mode=1;Jet OLEDB:Global Partial Bulk Ops=2;Jet OLEDB:Global' +
      ' Bulk Transactions=1;Jet OLEDB:New Database Password="";Jet OLED' +
      'B:Create System Database=False;Jet OLEDB:Encrypt Database=False;' +
      'Jet OLEDB:Don'#39't Copy Locale on Compact=False;Jet OLEDB:Compact W' +
      'ithout Replica Repair=False;Jet OLEDB:SFP=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 64
    Top = 40
  end
  object tbAnomaly: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'Anomaly'
    Left = 64
    Top = 112
    object tbAnomalyID: TWideStringField
      FieldName = 'ID'
      Size = 7
    end
    object tbAnomalySystem: TWideStringField
      FieldName = 'System'
      Size = 30
    end
    object tbAnomalyType: TWideStringField
      FieldName = 'Type'
      Size = 15
    end
    object tbAnomalyDescription: TWideStringField
      FieldName = 'Description'
      Size = 100
    end
    object tbAnomalyDates: TDateTimeField
      FieldName = 'Dates'
    end
  end
  object qAnomaly: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'value'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM anomaly'
      'WHERE '
      'id = :value'
      'ORDER BY dates DESC;')
    Left = 64
    Top = 184
    object qAnomalyID: TWideStringField
      FieldName = 'ID'
      Size = 7
    end
    object qAnomalySystem: TWideStringField
      FieldName = 'System'
      Size = 30
    end
    object qAnomalyType: TWideStringField
      FieldName = 'Type'
      Size = 15
    end
    object qAnomalyDescription: TWideStringField
      FieldName = 'Description'
      Size = 100
    end
    object qAnomalyDates: TDateTimeField
      FieldName = 'Dates'
    end
  end
  object qSystem: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'value'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM anomaly'
      'WHERE '
      'system = :value'
      'ORDER BY dates DESC;')
    Left = 64
    Top = 256
    object qSystemID: TWideStringField
      FieldName = 'ID'
      Size = 7
    end
    object qSystemSystem: TWideStringField
      FieldName = 'System'
      Size = 30
    end
    object qSystemType: TWideStringField
      FieldName = 'Type'
      Size = 15
    end
    object qSystemDescription: TWideStringField
      FieldName = 'Description'
      Size = 100
    end
    object qSystemDates: TDateTimeField
      FieldName = 'Dates'
    end
  end
  object qAnomToday: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'valueOne'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'valueTwo'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM anomaly'
      'WHERE '
      'id = :valueOne'
      'AND'
      'system =:valueTwo;')
    Left = 184
    Top = 40
  end
  object qAnomHistory: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'valueOne'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM anomaly'
      'WHERE '
      'id = :valueOne'
      'ORDER BY dates DESC;')
    Left = 184
    Top = 104
  end
end
