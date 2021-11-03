object dmCompras: TdmCompras
  OldCreateOrder = False
  Height = 226
  Width = 440
  object AuxFormaPG: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select * from forma_pagamento_fornecedor')
    Left = 48
    Top = 16
    object AuxFormaPGid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object AuxFormaPGstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object AuxFormaPGdatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object AuxFormaPGidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object AuxFormaPGdataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object AuxFormaPGidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object AuxFormaPGidfornecedor: TIntegerField
      FieldName = 'idfornecedor'
      Origin = 'idfornecedor'
    end
    object AuxFormaPGcodigo: TWideStringField
      FieldName = 'codigo'
      Origin = 'codigo'
      Size = 50
    end
    object AuxFormaPGdescricao: TWideStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 50
    end
    object AuxFormaPGsyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
    object AuxFormaPGsyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
  end
end
