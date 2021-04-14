object DM: TDM
  OldCreateOrder = False
  OnCreate = ServerMethodDataModuleCreate
  Encoding = esUtf8
  Height = 417
  Width = 521
  object Conn: TFDConnection
    Params.Strings = (
      
        'Database=C:\OUTROS\DELPHI MOBILE\INSS RAPIDO\trunk\Servidor\Win3' +
        '2\Debug\DB\INSS.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=FB')
    LoginPrompt = False
    Left = 104
    Top = 88
  end
  object DriverDLL: TFDPhysMySQLDriverLink
    VendorLib = 
      'C:\OUTROS\DELPHI MOBILE\INSS RAPIDO\trunk\Win32\Debug\libmySQL.d' +
      'll'
    Left = 96
    Top = 16
  end
  object DWEvents: TDWServerEvents
    IgnoreInvalidParams = False
    Events = <
      item
        Routes = [crAll]
        NeedAuthorization = True
        DWParams = <
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'email'
            Encoded = False
          end
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'senha'
            Encoded = False
          end>
        JsonMode = jmPureJSON
        Name = 'ValidaLogin'
        EventName = 'ValidaLogin'
        OnlyPreDefinedParams = False
        OnReplyEvent = DWEventsEventsValidaLoginReplyEvent
      end>
    Left = 120
    Top = 184
  end
end
