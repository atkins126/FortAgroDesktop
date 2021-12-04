object dmRevisao: TdmRevisao
  OldCreateOrder = False
  Height = 409
  Width = 893
  object TAuxRevisaoItem: TFDQuery
    CachedUpdates = True
    OnReconcileError = TAuxRevisaoItemReconcileError
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select a.*,false as check  from AuxRevisaoItens a'
      'where status>-1')
    Left = 32
    Top = 24
    object TAuxRevisaoItemid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TAuxRevisaoItemstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TAuxRevisaoItemdatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TAuxRevisaoItemidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TAuxRevisaoItemdataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TAuxRevisaoItemidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TAuxRevisaoItemnome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 100
    end
    object TAuxRevisaoItemsyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TAuxRevisaoItemsyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
    object TAuxRevisaoItemgrupo: TWideStringField
      FieldName = 'grupo'
      Origin = 'grupo'
      Size = 100
    end
    object TAuxRevisaoItemcheck: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = 'check'
      Origin = '"check"'
    end
  end
  object TRevisao: TFDQuery
    CachedUpdates = True
    OnReconcileError = TRevisaoReconcileError
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select * from planorevisao'
      'where status>-1'
      'order by id desc')
    Left = 32
    Top = 72
    object TRevisaoid: TIntegerField
      FieldName = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TRevisaostatus: TIntegerField
      FieldName = 'status'
    end
    object TRevisaodatareg: TSQLTimeStampField
      FieldName = 'datareg'
    end
    object TRevisaoidusuario: TIntegerField
      FieldName = 'idusuario'
    end
    object TRevisaodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
    end
    object TRevisaoidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
    end
    object TRevisaonome: TWideStringField
      FieldName = 'nome'
      Size = 100
    end
    object TRevisaointervalohoras: TBCDField
      FieldName = 'intervalohoras'
      Precision = 15
      Size = 3
    end
    object TRevisaosyncaws: TIntegerField
      FieldName = 'syncaws'
    end
    object TRevisaosyncfaz: TIntegerField
      FieldName = 'syncfaz'
    end
  end
  object TRevisaoItens: TFDQuery
    CachedUpdates = True
    IndexFieldNames = 'idrevisao'
    MasterSource = dsRevisao
    MasterFields = 'id'
    DetailFields = 'idrevisao'
    OnReconcileError = TRevisaoItensReconcileError
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select '
      'cast(case '
      ' when a.tipo =0 then '#39'MANUTEN'#199#195'O'#39
      ' when a.tipo =1 then '#39'LUBRIFICA'#199#195'O'#39
      ' when a.tipo =2 then '#39'VERIFICA'#199#195'O'#39
      'end as varchar(13)) tipoStr,'
      'a.*,Item,p.codigofabricante,p.nome produto  '
      'from planorevisaoitens a '
      'left join produtos p on p.id=a.idproduto'
      'where a.status>-1 and a.idrevisao=:id'
      'order by a.tipo,a.item')
    Left = 32
    Top = 128
    ParamData = <
      item
        Name = 'ID'
        ParamType = ptInput
        Value = Null
      end>
    object TRevisaoItenstipostr: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'tipostr'
      Origin = 'tipostr'
      ReadOnly = True
      Size = 13
    end
    object TRevisaoItensid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TRevisaoItensstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TRevisaoItensdatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TRevisaoItensidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TRevisaoItensdataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TRevisaoItensidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TRevisaoItensidrevisao: TIntegerField
      FieldName = 'idrevisao'
      Origin = 'idrevisao'
    end
    object TRevisaoItenssyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TRevisaoItenssyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
    object TRevisaoItensidproduto: TIntegerField
      FieldName = 'idproduto'
      Origin = 'idproduto'
    end
    object TRevisaoItensqtde: TBCDField
      FieldName = 'qtde'
      Origin = 'qtde'
      Precision = 10
      Size = 3
    end
    object TRevisaoItenstipo: TIntegerField
      FieldName = 'tipo'
      Origin = 'tipo'
    end
    object TRevisaoItensobservacao: TWideStringField
      FieldName = 'observacao'
      Origin = 'observacao'
      Size = 100
    end
    object TRevisaoItensitem: TWideStringField
      FieldName = 'item'
      Origin = 'item'
      Size = 100
    end
    object TRevisaoItensiditem: TIntegerField
      FieldName = 'iditem'
      Origin = 'iditem'
    end
    object TRevisaoItensitem_1: TWideStringField
      FieldName = 'item_1'
      Origin = 'item'
      Size = 100
    end
    object TRevisaoItenscodigofabricante: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'codigofabricante'
      Origin = 'codigofabricante'
      Size = 30
    end
    object TRevisaoItensproduto: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'produto'
      Origin = 'produto'
      Size = 50
    end
  end
  object TRevisaoMaquinas: TFDQuery
    CachedUpdates = True
    IndexFieldNames = 'idrevisao'
    MasterSource = dsRevisao
    MasterFields = 'id'
    DetailFields = 'idrevisao'
    OnReconcileError = TRevisaoMaquinasReconcileError
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select '
      ' a.*,'
      ' b.modelo,'
      ' b.prefixo,'
      ' b.placa,'
      ' b.combustivel,'
      ' b.ultimarevisao,'
      ' b.horimetroultimarev'
      'from planorevisaomaquinas a '
      'join maquinaveiculo b on a.idmaquina=b.id'
      'where a.status=1'
      'and a.idRevisao=:id')
    Left = 120
    Top = 128
    ParamData = <
      item
        Name = 'ID'
        ParamType = ptInput
      end>
    object TRevisaoMaquinasid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TRevisaoMaquinasstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TRevisaoMaquinasdatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TRevisaoMaquinasidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TRevisaoMaquinasdataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TRevisaoMaquinasidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TRevisaoMaquinasidrevisao: TIntegerField
      FieldName = 'idrevisao'
      Origin = 'idrevisao'
    end
    object TRevisaoMaquinasidmaquina: TIntegerField
      FieldName = 'idmaquina'
      Origin = 'idmaquina'
    end
    object TRevisaoMaquinassyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TRevisaoMaquinassyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
    object TRevisaoMaquinasmodelo: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'modelo'
      Origin = 'modelo'
      Size = 50
    end
    object TRevisaoMaquinasprefixo: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'prefixo'
      Origin = 'prefixo'
    end
    object TRevisaoMaquinasplaca: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'placa'
      Origin = 'placa'
    end
    object TRevisaoMaquinascombustivel: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'combustivel'
      Origin = 'combustivel'
    end
    object TRevisaoMaquinasultimarevisao: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'ultimarevisao'
      Origin = 'ultimarevisao'
    end
    object TRevisaoMaquinashorimetroultimarev: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'horimetroultimarev'
      Origin = 'horimetroultimarev'
      Precision = 15
      Size = 3
    end
  end
  object dsRevisao: TDataSource
    DataSet = TRevisao
    Left = 112
    Top = 80
  end
  object TRevisaoMaquinaApl: TFDQuery
    CachedUpdates = True
    OnReconcileError = TRevisaoMaquinaAplReconcileError
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select '
      ' c.*,'
      ' r.nome PlanoRevisao,'
      ' m.prefixo,'
      ' u.nome responsavel,'
      ' case '
      '  when C.TIPO=0 then '#39'PREVENTIVA'#39
      '  when C.TIPO=1 then '#39'CORRETIVA'#39
      ' end TipoRevisao '
      'from revisaomaquina c '
      'join planorevisao r on r.id=c.idplanorevisao'
      'join maquinaveiculo m on m.id=c.idmaquina'
      'join usuario u on u.id=c.idresponsavel'
      'where c.status>-1')
    Left = 384
    Top = 72
    object TRevisaoMaquinaAplid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TRevisaoMaquinaAplstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TRevisaoMaquinaApldatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TRevisaoMaquinaAplidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TRevisaoMaquinaApldataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TRevisaoMaquinaAplidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TRevisaoMaquinaAplidplanorevisao: TIntegerField
      FieldName = 'idplanorevisao'
      Origin = 'idplanorevisao'
    end
    object TRevisaoMaquinaAplidmaquina: TIntegerField
      FieldName = 'idmaquina'
      Origin = 'idmaquina'
    end
    object TRevisaoMaquinaAplobservacao: TWideStringField
      FieldName = 'observacao'
      Origin = 'observacao'
      Size = 100
    end
    object TRevisaoMaquinaApldatainicio: TDateField
      FieldName = 'datainicio'
      Origin = 'datainicio'
    end
    object TRevisaoMaquinaApldatafim: TDateField
      FieldName = 'datafim'
      Origin = 'datafim'
    end
    object TRevisaoMaquinaAplsyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TRevisaoMaquinaAplsyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
    object TRevisaoMaquinaAplplanorevisao: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'planorevisao'
      Origin = 'planorevisao'
      Size = 100
    end
    object TRevisaoMaquinaAplprefixo: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'prefixo'
      Origin = 'prefixo'
    end
    object TRevisaoMaquinaAplidresponsavel: TIntegerField
      FieldName = 'idresponsavel'
      Origin = 'idresponsavel'
    end
    object TRevisaoMaquinaAplresponsavel: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'responsavel'
      Origin = 'responsavel'
      Size = 100
    end
    object TRevisaoMaquinaAplhorimetro: TBCDField
      FieldName = 'horimetro'
      Origin = 'horimetro'
      Precision = 15
      Size = 2
    end
    object TRevisaoMaquinaApltiporevisao: TWideMemoField
      AutoGenerateValue = arDefault
      FieldName = 'tiporevisao'
      Origin = 'tiporevisao'
      ReadOnly = True
      BlobType = ftWideMemo
    end
    object TRevisaoMaquinaApltipo: TIntegerField
      FieldName = 'tipo'
      Origin = 'tipo'
    end
    object TRevisaoMaquinaAplhorimetroproxima: TBCDField
      FieldName = 'horimetroproxima'
      Origin = 'horimetroproxima'
      Precision = 15
      Size = 3
    end
  end
  object TRevisaoMaquinaItens: TFDQuery
    CachedUpdates = True
    OnReconcileError = TRevisaoMaquinaItensReconcileError
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select '
      ' a.*,b.nome produto,b.codigofabricante,'
      'Cast(case '
      ' when a.tipo =0 then '#39'MANUTEN'#199#195'O'#39
      ' when a.tipo =1 then '#39'LUBRIFICA'#199#195'O'#39
      ' when a.tipo =2 then '#39'VERIFICA'#199#195'O'#39
      'end as varchar(13)) tipoStr,'
      'a2.nome itemNome'
      'from revisaomaquinaitens a '
      'join produtos b on a.idproduto=b.id'
      'left join auxrevisaoitens a2 on a2.id=a.iditem '
      'where a.status>-1')
    Left = 384
    Top = 136
    object TRevisaoMaquinaItensid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TRevisaoMaquinaItensstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TRevisaoMaquinaItensdatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TRevisaoMaquinaItensidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TRevisaoMaquinaItensdataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TRevisaoMaquinaItensidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TRevisaoMaquinaItensidrevisao: TIntegerField
      FieldName = 'idrevisao'
      Origin = 'idrevisao'
    end
    object TRevisaoMaquinaItensiditem: TIntegerField
      FieldName = 'iditem'
      Origin = 'iditem'
    end
    object TRevisaoMaquinaItenssyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TRevisaoMaquinaItenssyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
    object TRevisaoMaquinaItensidproduto: TIntegerField
      FieldName = 'idproduto'
      Origin = 'idproduto'
    end
    object TRevisaoMaquinaItenscodigofabricante: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'codigofabricante'
      Origin = 'codigofabricante'
      Size = 30
    end
    object TRevisaoMaquinaItensqtde: TBCDField
      FieldName = 'qtde'
      Precision = 10
      Size = 3
    end
    object TRevisaoMaquinaItensitem: TWideStringField
      FieldName = 'item'
      Origin = 'item'
      Size = 100
    end
    object TRevisaoMaquinaItenstipo: TIntegerField
      FieldName = 'tipo'
      Origin = 'tipo'
    end
    object TRevisaoMaquinaItensobservacao: TWideStringField
      FieldName = 'observacao'
      Origin = 'observacao'
      Size = 100
    end
    object TRevisaoMaquinaItenstipostr: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'tipostr'
      Origin = 'tipostr'
      ReadOnly = True
      Size = 13
    end
    object TRevisaoMaquinaItensitemnome: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'itemnome'
      Origin = 'itemnome'
      Size = 100
    end
    object TRevisaoMaquinaItensproduto: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'produto'
      Origin = 'produto'
      Size = 50
    end
  end
  object qryListaItensPlanoRev: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select a.*,item ItemNome,p.codigofabricante,p.nome produto,'
      ' cast(case '
      ' when a.tipo =0 then '#39'MANUTEN'#199#195'O'#39
      ' when a.tipo =1 then '#39'LUBRIFICA'#199#195'O'#39
      ' when a.tipo =2 then '#39'VERIFICA'#199#195'O'#39
      'end as varchar(13)) tipoStr,'
      'a.observacao  '
      'from tmprevisaoitens a '
      'left join produtos p on p.id=a.idproduto'
      'where a.status>-1 and a.idrevisao=1')
    Left = 384
    Top = 208
    object qryListaItensPlanoRevid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryListaItensPlanoRevstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object qryListaItensPlanoRevidrevisao: TIntegerField
      FieldName = 'idrevisao'
      Origin = 'idrevisao'
    end
    object qryListaItensPlanoRevidproduto: TIntegerField
      FieldName = 'idproduto'
      Origin = 'idproduto'
    end
    object qryListaItensPlanoRevconfirmado: TIntegerField
      FieldName = 'confirmado'
      Origin = 'confirmado'
    end
    object qryListaItensPlanoRevitem: TWideStringField
      FieldName = 'item'
      Origin = 'item'
      Size = 100
    end
    object qryListaItensPlanoRevtipo: TIntegerField
      FieldName = 'tipo'
      Origin = 'tipo'
    end
    object qryListaItensPlanoRevitemnome: TWideStringField
      FieldName = 'itemnome'
      Origin = 'itemnome'
      Size = 100
    end
    object qryListaItensPlanoRevcodigofabricante: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'codigofabricante'
      Origin = 'codigofabricante'
      Size = 30
    end
    object qryListaItensPlanoRevproduto: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'produto'
      Origin = 'produto'
      Size = 50
    end
    object qryListaItensPlanoRevtipostr: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'tipostr'
      Origin = 'tipostr'
      ReadOnly = True
      Size = 13
    end
    object qryListaItensPlanoRevobservacao: TWideStringField
      FieldName = 'observacao'
      Origin = 'observacao'
      Size = 100
    end
    object qryListaItensPlanoReviditem: TIntegerField
      FieldName = 'iditem'
      Origin = 'iditem'
    end
    object qryListaItensPlanoRevqtde: TBCDField
      FieldName = 'qtde'
      Origin = 'qtde'
      Precision = 10
      Size = 3
    end
  end
  object qryAux: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    Left = 488
    Top = 48
  end
  object TRevisaoItensInsert: TFDQuery
    CachedUpdates = True
    OnReconcileError = TRevisaoMaquinaItensReconcileError
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select * from revisaomaquinaitens a '
      'where a.status=-100')
    Left = 488
    Top = 104
    object TRevisaoItensInsertid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TRevisaoItensInsertstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TRevisaoItensInsertdatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TRevisaoItensInsertidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TRevisaoItensInsertdataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TRevisaoItensInsertidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TRevisaoItensInsertidrevisao: TIntegerField
      FieldName = 'idrevisao'
      Origin = 'idrevisao'
    end
    object TRevisaoItensInsertsyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TRevisaoItensInsertsyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
    object TRevisaoItensInsertidproduto: TIntegerField
      FieldName = 'idproduto'
      Origin = 'idproduto'
    end
    object TRevisaoItensInsertitem: TWideStringField
      FieldName = 'item'
      Origin = 'item'
      Size = 100
    end
    object TRevisaoItensInserttipo: TIntegerField
      FieldName = 'tipo'
      Origin = 'tipo'
    end
    object TRevisaoItensInsertobservacao: TWideStringField
      FieldName = 'observacao'
      Origin = 'observacao'
      Size = 100
    end
    object TRevisaoItensInsertiditem: TIntegerField
      FieldName = 'iditem'
      Origin = 'iditem'
    end
    object TRevisaoItensInsertqtde: TBCDField
      FieldName = 'qtde'
      Origin = 'qtde'
      Precision = 10
      Size = 3
    end
  end
  object dsRelRev: TDataSource
    DataSet = qryRelManutencao
    Left = 760
    Top = 80
  end
  object ppDBRelRev: TppDBPipeline
    DataSource = dsRelRev
    UserName = 'DBRelRev'
    Left = 760
    Top = 128
  end
  object ppReportRev: TppReport
    AutoStop = False
    DataPipeline = ppDBRelRev
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    ThumbnailSettings.PageHighlight.Width = 3
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.AllowExtract = True
    PDFSettings.EncryptSettings.AllowAssemble = True
    PDFSettings.EncryptSettings.AllowQualityPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.EncryptSettings.KeyLength = kl40Bit
    PDFSettings.EncryptSettings.EncryptionType = etRC4
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    PDFSettings.PDFAFormat = pafNone
    PreviewFormSettings.PageBorder.mmPadding = 0
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    XLSSettings.WorksheetName = 'Report'
    Left = 760
    Top = 192
    Version = '19.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBRelRev'
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 51858
      mmPrintPosition = 0
      object ppShape1: TppShape
        DesignLayer = ppDesignLayer1
        UserName = 'Shape1'
        mmHeight = 24871
        mmLeft = 527
        mmTop = 26986
        mmWidth = 284163
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel109: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label32'
        Border.mmPadding = 0
        Caption = 'Revis'#227'o Preventiva'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 6350
        mmLeft = 1852
        mmTop = 20108
        mmWidth = 52123
        BandType = 0
        LayerName = Foreground
      end
      object ppImage9: TppImage
        DesignLayer = ppDesignLayer1
        UserName = 'Image4'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = False
        Border.mmPadding = 0
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000600000
          00600806000000E29877380000000467414D410000B18F0BFC61050000000662
          4B474400FF00FF00FFA0BDA793000000097048597300000EC300000EC301C76F
          A8640000000774494D4507E40A02092C31C6867305000044D74944415478DAE5
          BD07BC1445F63D7EABBA7BF2BC79399273CE282A2A82A228A8604082987358D7
          ACAB28E2EEEA06B3AB6B5CB32059415182A8086220E7CCCB695E987993BABBEA
          7F6ADEA0E882A28BEB7E7FFFF253BE61A6E33DF79E7B6E757537A3FFF5967531
          9DF0E893F4C993B574E2AD0E727B0C0ADB440D719B12826301469C49F23B39F9
          754976DCA2FA86103EBBE9F3D81AB2AF1AF55B9FC18F36F65B1FC081EDA86777
          929DED2647DC24DBE5A6180EAFD19614B2085D52222A886ED94032743295EE0A
          B14FAAB19264D4C6CDE998DE1E620C483C564C2CC3209FC6286070F26A445EE0
          E4B21354AB2528CBF6D0E7E7E5FDD6A7FA6DFBCD0138E6F53DF4554E2BEADD58
          490DC4296832AA6D12744E0BC3D81E9519614B14446D2AB2A42CB2842CD0359E
          1FB7A51B9D0B993A099C858393746A3C610B590DDB57689C95BB3556E2E2549A
          EB60B59F2E8F47BC3D75CA71304AD719154A93C29A4EA15015ADBEB0C7FFBF00
          18F0462925DC0E720A41D5A093F204D145B952FBB89115C2DBBB27040D4C08D9
          174EDF09015008BF4F83AD35FACEE0C0834C49D24E9D0487F71BF8A80314C69A
          CF4AC2F12300A30A7D97C1D93A27675F7A345A5BE4E67B3E2B372345693AE53A
          88D66B2E3A3A1EA6E5E717FCBF0D40FFB7F6D1D7CE96D4D9AAA26AD0CA9D2D35
          FE6C99DD3A64D36078F4F084A44196A0D630AC32668C33AA8411F7688CA1D35E
          F4727C5FEDD258D8B6ED88698B3830B10CCE0D4486DB92CC670A9989B32A0070
          AD10316D015E1B8052045CD2D431C0F92B01C65AA48CC55E9D2F6EE5629BBE0E
          D9D1C8843D3464410BCAAD277A6742D1FF5B00F47FBB98BEDEDE82DA77AAA2BD
          71A26E1EF2579B744CC496E7C4049DA20C85C544CAC85FC1FA5F188C56C348BB
          021AD56CEA1B6BE25F78A58F4B65C06420A8F47B75970C7DFAEEC6E3F06F0749
          198D59A2DEAFF34617938DBDD2B45863C494EBA3C2DF68532B53B25EE8831036
          470929BB601D3014AB03452DCE30D8ADFBA2B477682E9169376FBFB86784F6B4
          6DFB7F1B80016F15D336EEA13C66D18E18A3CE2E99596BD1E94D969C046F1F2C
          A58411680F8CBD04C6FEC0CBE8CBCE0EB3E4D398D372239FD65B8C5EEA21F83F
          8A99AFDE64E9A0A46CAC9701CF0FB874CD0FEF2E0A26E4EFC047E9381113B414
          55B483CF419D5339786907F2F026EC6443A6CEB68DCEE2C169E5717F8DCD7A22
          74860390D3710CDE02177F0851555FE8921F446C8501B71497016F5A3E26F7FF
          1E0003DFDA4C0D3C939C30E29E04A3D62EE6AF4CC83361F8ABE2828E838F5930
          FA0A9CF47478F58763FD895D2F35BA4413BCEFA474E9D816A52218A23BBCB50F
          8CDE03B6002D51060CEC50FC0E0F06D31062898C84649D6473403437F9DD59B1
          5407C821444E89CED93700FA6328A44FC7E469BB3EACB6FCF5964C4F73300421
          81BAD80012628B47D7B6B92CB3BA81E9322835EA136BA4F72FFC75A2E18803D0
          775A29AD5E5748453DAA68889FB4C58D342464CB9B63E078FC6CC3001F4135BE
          94CEC592625B6F7000A43E1E72EE89531718FD2418FD24F0B7A208C536F062DA
          0625B94D677217BE2B777116D4A41D69889A618FDB99D768B3A92A51E34CDCF8
          EBC13A6930A657510C7209B6FEFD530452121B2E736A490798936EB045DBEBED
          CA021FA73C17CFB36CE98F083ACBC3E55C5BB030D35885A23E80482BCE3AF2D1
          70C40018B91074D36890132EB81944D0C2295BD599F43B18F532786C9AA2190F
          A7A70A0CF151A9AD37D54719B5F5D905E0E7E171C1CE81D17A62338D30F84A9D
          68994BA3D5012E8BB736B8C22EAF9974F10812C64545262F673E674DCCD6A309
          5B87C1BC004724889928D0DC909F19315BE4D8C45A639B5D90EB7B0098CEB6A0
          0250964B1E70CC5A32812729EA1DBFCEA6EFABB5B6918D9AA235F734D87C886D
          0B8F57A70D3AC93D16F1D84EC4DC602D46F3CF6DF9BF0540DFD7765285112017
          B3E9827C9BBF58AA8D40E1747F5CC801F0B6ED30FC6339BA7CABCAD6EA1AEA20
          737278FB064B5E00B9799E20A96AA54F910CE7A6696CE5EEA0ABD21788536882
          45DD661A3990A32D61C0D6305E212828035EED01B73BF059EE57A5888AAF76CC
          30DE2E380B16E29C9A20A5C2584154321AD091B9AB13941FB625E4AD3C1EDC35
          04B4D6DD96CCBB1F0C052E80D80520DEC830F82BBB43F6CE4BBA78F98EBA785A
          554C4CC2B12D638CD72225956468CDA1B97464F6FF0600BDA795D0DA501A1578
          6394A9CBB4B2B8FC1D3CF11678BD0707FE869FCBBF54588ECD0E6E53A1431421
          B15E0CC34FC4C9270C26A7A34A9D59D679E396B42D3DA9A3573AEB12AC235241
          3FFCDE1116F682314238CC32987B9F10B2C289649930ADB083B3B8CF60021143
          7E46E6CA8816879A491A27033CE7245514086A4218A88A7AE7B90176CAFB8D45
          15612B5E65B13E28AACF4ED8741A28AF9D48250E05040ABA2D08A967729DFCB5
          7D5159F746278DDD53224F428197E777B0E59AA4728746A6B29C1166B4686CD6
          6F0740AFE9A5D4C72B686EBD5319BF4D7542FE396ACB0B60947D4874535BE9D6
          EBA09B18D485A734C6CE43457B234ED5053BBDECE7E2ED52E12821C89A363EBB
          0D34FCF1F8AD173A6A61B9198EB6C6C7C5EE8DE7AD691AF7E140636B84650613
          225B10CB8D58228065325C3A57D1C01342C413960CB90D5E8F13AA4933780DC2
          AAF69AD6BED0A5ABEB456B9F469D029A271C17C7029B3DA8D432D299B5617D23
          B5095A722468F24238450F91B207F66D830297040CFEC7D2B139CB685D888EDF
          17CFAA49D0A5D8D42C14D3E55C63910074808E55E68E2CFCEF03D06B66256518
          923EA9E394EF907DEB4DF9042867300EEE531498B757C51C2B099454E4163D1B
          2CBA07613F085C3A3DA0D333A53163D7C945826FABA71EA0845361F43C187403
          80F9F4AACCC8EE95669AB12E2CDA4785EC8F02AD5F4A09B505156561592F3E1B
          499F65CD27A0B828591B30B2F1EFA8C621C2884AA0F3B7C0A35783A2BE06289B
          37EF8DD78EEAE1F6418DA555C7EC5EA0C96370BC1F629D4A38CFD900E24A9C43
          C7FD891BBF55221A1ECF77F17F6C6F920D2740A155587C0CF24EF8AA76FA826F
          1A2C6122846AA3448BCFFE65E34BBF0880EEB3AAC88F4CB9B20A99CDC74FA84B
          887F805FBB43DDBC99A189BB22A4EFEBEB97C69A108DC749DD05F39440553CF8
          77D78E65179D73BCBC7A598DBEB4569E1736655F68CAC55E697D7A675B3D76DF
          3ED60D51725A4CC8534C417D414539CAB2004725E70AF432787C99CE5810B540
          1D3C39AA7E54F214D493AEA42A6A825C21590B7C2E00508A1F38D66BC2EF5BA0
          7A967934F67EAE93ADCA37447C6358F643449D86DF3544C6BB52C8100AC46B54
          44C0AE0175AE00D2F6E86C4EA6C1EF6EB4E5B68E5EE68523B4C732C777F3D13F
          D736084B0D16568DFF2F01D06B4619A581043FAB9694EF61C3EA4CF94F55C9BA
          357A1227757F83D0EAE1E5995509BA07617D3E78FE5F599A7C744F8C6ACF69E9
          34AAE2D4D9B2457AD416DB9DD2ACD73487B6332287A22A1E8F1A61980D03E2B0
          A230D86624C62FF0F70B27639B4009A5016E371CEFB7A34FBF0AA1382C53917C
          B3EB0B9C4689A0B2719C9DB53AEEA811BA3F2E595E027904D13310C7310880F6
          5680C0D83144C597904B6F6739D89CEB3323157FAD720E948C8DC656EA419D33
          714E9D2012EE83330CDC5F5600A06F10453747845CD6CDAF79A2966883A3E8AE
          4B5A06A7A88A4946DEF22ADA7063B75F0F80DE334AA81B32DEDBE53AE5BBE804
          54A12FC1F86DC0B70FB772883F96595A041CD9AED6A447949647357BCF5981D8
          ACCF626ED12EDD703525C40817B1E52E1446D5E096BD711A11B6E4D5719B4E94
          6A3093D14624D70588A4F7033A5BBFFD7C778DF15A9494F270AB6165B260739B
          7C0E0725622635A166B56C8B5C4E83BC0E9DA208050B8937C20CB0337602420A
          C35106B6D57CE531D12162C993907CCF041847637F6EEC6B1328E6953C277FB5
          952351BB31A29D0EFA3919A02F72E258CAE3F256A8A78BA198544E5794B4D76F
          B05B6BBF689A71D1E800FFACDA1E02309B38B162D05E59960F323C1CA10F461F
          7E4E386C00FACE2AA6D56559E4CB08531A97FD83A67C15B4D3C5AFB1873BB8EC
          0776C4B5985FA35E75163DA34624FD9ABCB1CAD4BFEAE08CD3B91D03B43E1867
          0968F6A16932F2C43E7114C2F616C8FA51E00FDD60EC5397265F0D68B470EF86
          9CB28C6E3594012B0490432A0305945DB18722AB04ED78BAFD619FD8A0377640
          B0FAC961C7A99EB9A8169C5286DAA387DF4EAB49B041A8BA27AAFD43ADA53B39
          5B0DC33ED6C7A74DDF15353363925FA60A6E9F26DFA84AB0918DA6BC0F5A215B
          851BF2544DBA43BBADF4949C57B21756CB02273B1B24186AED63CBABC98815C4
          A314DDE3A1A537058E1C00C73FB79BB6A6F909F50EB9B96C571997AF23591DE3
          D1E8B1364EF187E2841681E4EC0FA33E8783AC8221AFAF977CE73146842AC941
          ADE0BEAB20D9B274995965D2B54D16DDA0A8460D4780939F0645CDDF616AF52D
          0C9BB2459CA25C230D0B6DBAFCC894FF597FDB4E6D0A9D546486688B3B93AA4C
          4E47A5D9C6FAB0360811780D92FDD958CCC0B1CCCA34B4A9E332E29BDFACD3CF
          85E71F83687C1935459BBA847C1480B55519DF40351E30D82DD5E372FFC55E29
          A79E01E3443857DBAD4DF4AF816E93601B5A77418B23074087E9956482E360C7
          F492A8780E7C7D1E0EECF522275D5F63B106A88CDEE0CD97900F8B3335715D93
          D44AEB1279D4D907F38374D7075145F9A91F78F541C8D411A09A5200F624BCFC
          E5602251D59547E88AD0625039B6F05F18A075C904BD9B760C7DC90AA9C8EF72
          ED0CDB8A0AEF80E18EC6F1EE0CE8FCFE29ED8C371FDA9BE88FA47E112274861A
          24AD8ACB670042D7140835A89EAF0BC6D8F481D9DC1BB64407E48C9605567481
          6918C2C049AE18F3D3D7177EF26C7BBD530EE685C7A4333EBB52DE17B2C46424
          A465D986BC3026B56224C70EC805AFC272F519BABC222A59692D28B39D6E2A3D
          4D933B3076CB16710E8CFF1024677B70E60250D594AAB5677D79EDB3ABF8B6A3
          4E66BFD96539ECD951B943CE5FB75B7479617DAB2A47C6EFE13C57421941E5B1
          C75A3BD99FC2C2CE894B7E1324ED8788DABA9AB87C1E79A49B0201E7529C6EF0
          4BB0FC62502ED4170DF0217739C82E45740B378BD3B2316D7E390083A655D08A
          7E71953629DB416741EBBF0A1F0DA2E21C6B115B95ED60396551F1320E2C3D4B
          A74992F35DAD5C44D0FD046F204823636DD8BE1A1CFA00B8D609CA7A1CCBFD75
          48A0297862E5A7E3BA76ED3ACEE17088DFCAFE073604AA686C8AB9FEB95B98D3
          4587EE38DEF65E9DBF5EE864B730263554F7B741922E865A0A55C5C4CB888476
          2A27207FACCB7270E82FDA94E5D4F21B13F6F80CB29E09D9140D21EF544CFAF1
          8B3B3F0A408777AA08CA0148CBB615719A05F5D00D45D6D57596F6F27159D2B1
          A141FC1D897818387F6282B16F5ABB791E8AAD26EC3C8C2AD6B13DC26E0395DF
          8B036D8052BAAB97D37C75BB69587B46A7D1FB0B3F7CF0A4934EFA83DBED26D3
          34712A927EABA6AE613A0C07D5D6D6D2FCB973A6DE1A387F5EDC349F529484BC
          F06E9E43BBD6E0B61516EC4E78F67B319B5CB5508048CC39CA80A0E679F90E7E
          C9AE2F83C16EC766B6407D33C4B0AD991E9D47335C067D72E6A1C78D0E09801A
          66B0B941AD3D9AFE59D07C141C793D0EE685EE1E79FD174116CFF4D215118B26
          A3C0BA3ECEF4B9394E6A63DBE25A3F174FF6CA32CA3E28B7EE8007DCAF0A2850
          CE0DC1C6BCB9AD03E514D39CB4F76C1F2D5CB870CAB061C3262FD9F115CDD9F8
          D94FF9C2AFD824B975275D71EC5954E4CAA459B3664E5D913970F222BB45A760
          423CA58A429CF7FC42977E8564B601E3DF0EAF7FA5C194FDEB4CF1A82519D299
          524C6CEA839DB5294F170B3712B21228BBD3746D0F6858D886462B4ECF387C00
          EE07BFFDE5AD203161A9691D23C0F1D339126CB6416725886FD7A1781A12721A
          BCE195C697F3A676BCAECADF64D21FC08B4BCBC6E52DCC7AB3EAC68684F80B1C
          AB0A45D955354DFAFB9DFD7142B4D0796B9FA4071E782009C0D0A14327DFB3E8
          057AFCEB7928AAF4FFA2CD53D126D590A9008D18F4C2A89BE9F4360369060028
          2A2C9C3C297434E436B5A94A886701C2A95E8D4F2F72B2AB2C265B837E2EF771
          7AA23C4137C0C96E501C0AD55C9B6EB0093A670B8BDC3CB73E212FCCD6E4B338
          E7A608227CEBB883ABA28302A0AADDB0D0948249DF1715EFA0501A0AEAB9AA5E
          F017BAFBC8BFA749BCAEC6630A0C397EE75B91FA82F1BE1B9894B1B226E7F3D9
          9EF8B90D26BD007D1FC73A570613CEB93D3D4D50519CB68C2BA2DB6FBF9DA64E
          9D4A1F7CF0413202EE59FC223DF6CD7BBF3200525D464B1ABB99B70DCA76F9A8
          953F877AE6B4A69E79EDE8CCEE83C96D6B347BF6ECA985006054C310CAE451F2
          3089C252FE0B7474BC4FE74F1EE5E3B7EE33C5513078B549BCA1346ACF88D8EA
          2A1FD415A74FF29DECBCB2845DD5C96BB4C53A7D34CB7C17A2C5F24B9B3E1BDB
          EAA70118B254D2A9B493EEDA9346594E7929907C1ED9FEC3964E36765B936CCC
          72B1AB9117EE04AD5C6032BED2ABD330CB96437328F1409039BA43254C87742B
          848AB8A1BE26EFC52EB92564E3A4B78F6FDEF90F01B817003C7A2401483AB768
          F672189C314E3ECD41F99E746A979E4FBD61EC5EF9EDA86B6E6B2A4ACBA10CAF
          1F92D22006AEACAEAEFE168091B5A388851B292D23AAE611F5A98A8BB790033B
          40FFDF140CD3D3E9698C4C94FB693A1B5EA37E93C00B7BC579DFDD10150FF5CC
          36B2A29638D620FB9308B186022B4E2BC7B5FE690006CE2AA76A9BAB90CA2D8D
          C87713827A42F59C67139BEFD7A95D4D42CC3388663584F5C9ED72647ECC1277
          E9249E74E95A2D6A843763B63CCDC3D99FFB7AEDC9C5716669407EE784EFAE20
          1D510064EA7FC9E1D066A36B4CA34C87870A7D59D43DBB25F5C86D4B7D0ADA53
          DBCC222A086491D77063575A6AFDE6D4AF46F338E754535D43B366CF4A025057
          57474FB84FA6CE7E83DEA8B0099E3D0A89F715182C9E69B0F39B047DDAD5CB68
          588EC69FD96B3D8C9C70ABDA9683D1EE4C071BA571B6D1A3B3DED1841850D22D
          F7C551ABD65234AF88169D99F3E3004C5BB189C66EC982F7D3E5CAFB9D1ACDEA
          E2E513BF79CE88062626FE0C4E3B2D5BA751C5358992A23CF74D528AAAB252F6
          667ABEBCB7D1140FE00016E41B0235020F820FA965F92E5A71F3B1FF2100F2BB
          C395F25BEF56CDCD75CA76A751DB402E75CB6E4DBDF2DA5237F476998594E50D
          90C7E16C1EB756AB50F3B8F5C10A0FA5846A6A00C0ACEF0098346912F59D598D
          1F25AD3C4663054BCCBB61E8079184971438D858A8A01A754508CEDAB63226DE
          456EE8AE4A49AFC61E9DD256BFE5E54AE934A5ECAD71AA8D4ABEE3F6410EBAA6
          28EDD0000C9C53010DCF558191BEAB49CC03F70F04DAE75A8CE67B34D93D18A7
          79D8F9DF6244CFE439791F1456176671714FB5CD7AD7C6E55C9C9D99A1D39898
          64AB2CAE515E2444BB2F6FF7BD1DFE6C0094A153DEADAE59051C2ECA73A75327
          18B83BF8BB6F4147EA98D3925A028034B7971C9A714070C8C31657870240B56E
          33AA289E9C4844197B22E24D50F069A09A3B1BB63A1F3EA67784560475CAF2D1
          F5A8931E032B691027A559061B899A614D9A830D457EE47B2372517CD21C6CED
          AA4303D065662D95462D82843A13067DC740C5DBC645E76C5E2942E9FDF9C309
          2463142667F4C8E635AB6AE4644DCA8F5B78D98A75F5E2F5A82DCF8514BBB371
          77DAC37D3BD7522C66D1E68BFE7D2CE747019007D0099A0183A73BBCD4065CDD
          39AB25F5C96F4FDDF3DA50C7EC1694ED4D27BFD30DEAD05206FFA575844C01C0
          0F09C0A079B5B4312C0954AB54E1F128C466E1EB088ACA9126B1F501645983B1
          BC7D11FBDD882D072AA3FA34FA5BE3C4C6DB2E5B5EA8ADAC8A8E8323AD800BED
          8492A245A3BEA3A16F013865612505A30C9596A6CF2DB35E6AB2E48550315758
          8CBF802AB81D426C81039E1F61FCF17C071D05EF3F7BB0237EEFB2B8F32CC8D4
          B734465FE71B74369251958FD9B46DDCC12BC01F02F087A40C45F0804A3C4896
          D92E3FB54FCFA3AE396D6070244B7879DB2CD089C74F2E144BC896CD6693F2FB
          36FC996544F3FA2CF99F25C26A72290583916F93F08100A876ECAC62B27517DD
          DDC5C92EFE32FA970653DC0AAA79E6343FDDB0232EEDD52146D91E763D6CF138
          DC87838A77E438E8B4D2E2C8CE1E1DFCC71A4C56AF1EBD63FB90B91DE8E303A6
          B77C7BD883E795D2BE98F239EA5C1E158B717851249E93CBE3726F9AC16E44D8
          5D03C447948CFF7C4FD1B4C1F742D67DDACAA7AD5A576FCD4671320CEAE0E2A0
          295FA7DFE751C13DDBA8FC96CE8704E0C03AE09F2BE7D0927DEBA97F5127EA01
          EF5606CF4FCBA27437D489A6A7683F75CD91FD024B1FB43138A4890ABC929A62
          DF50A8693965A49D4689584F0030EBA000A8D6737635A1BE519CDFA93426DF87
          B2F5671974068AB12F73DC9CC0102D204B3F5403764A11C1816F20AE3DDD318D
          1735C6ED716E3BF1B48BB3A8088769D5C59DBF0FC0C75FBF4B43D60DA46C141B
          75283E50FD3DDB3851BFA6DF3CE9DB1EB2DFE552AE6F8CB96F6C9F617686D2B9
          B240B7EF2E4EF053A00C66E08056B672D2D9484AF56908D375171CFA82C40F23
          C02291E45F9FCB935422FB95C9916E523627704B842816DF4AE1C867D414FD02
          52722FA949D605D9F79195380600CC38240027CCDF469AEDA7A5F325659CA04D
          41144C869D1E0F3FEFB9E9D8DB132D41C9DAC646FBEA3A93EE50E7004C3E6CEB
          A1312DFDCE5845D4EA2F84AC04A3ECF5D6D5D0579776F93E007DE65451A1873B
          3EA9B2DE441A382BC3C1CEB589E622F11C0735F4162ABF4BA2922DCE74F2AB84
          108DF7F6764FBBF9ABE81B114B5C10D0D9E575367B9126E51E5C621C0280934F
          3E79B21A0BFAB5DA7E9A91D2A284590E837F05C37F42B1C40644405D72190E4A
          53EC9E9F752F0018F4A300A8D66F56052A30A666CA752B8FC985D8859DE36027
          B7F6F10458412F8EC9828A987C0F54AC6E4308663BD8E9388A2F020E360200C4
          21509664E982D68EC9FF0E8091EF15D3E6B853FDA35D7193588A8DC60B5D7CE8
          9EB05D92E1E2F7437A8E68E164A7B95DBA198CD9530D928F2488A55746C522AC
          530BAA1A0EDE2BC9B2E3B46642AB1F35CA7F0B00657CDB0E5114DE1E82B747A2
          2BC8B48A61EC443271B36FA793AA195EDA610370D4F36B88E716D0A82283FF65
          6BE29F61535E8E62ECC6BA1DF1278FEBEF3DD9B4E48E8D61FBA5269B4E52C64D
          33E88E065BFBCBE02C16A88FCBE16EB2DF87B809CB5C412B8E2D6C06E0F80541
          5A5F6F2AFD3A1AC97606786ADAB842EDC2D561726D69B4DF05DADF3458746B07
          BF3630618B33F7DDE2BD37F3E1F02D0D09F93754C27F6FBC45BBF5A8A712B4EA
          DCC2FF8908508E1F896DA0EABA97E0ED6B21AA1A9A4F94352B26F68363844A3C
          6C0054EB39BB8ACA6249597A7A4554CC46C2FD18B5D218AF8367B47052C3C21A
          FBA6FA8478405D5780A25CD0D34BE73087A13724EC93BD241643A6862A0BF268
          D720D67C5CA72CA8A48FD62428BBADE3CF7571792712EAEFA2929E4068754799
          FD1EE4E5EF6292E6653AF8D538DADAEE0136F7E36AFB5DD4092720C446C5052D
          6AE114B4FEDC9FBE02F4DF010052ACF679AA6D7836E5EDA979D287708E9F0B80
          1A2D8842B5698CE56C6FB43E3405B5CC36D8D0422F8F444C794AD896DB4143B3
          41433E80B32FDF49C34236ED28706B67E2D81AEB2DF6F171E98C669C9A9D8A80
          F935A87CB96B4985392B628B21D90E3E02997C19901A0F5D7B7FAE939FDA2353
          2FDE5067FD09DFBD88A28443297DCC8955B476F353403F55AE7884D64F6C4D3F
          D58E0C00C9E9583FFA7B75F015AAA97FAA39B1FF24603F0F00D586BF1FA40F47
          4CA18C37EF7EA231216F80E2B9B6BD4F7BBB3A2EEF032BBC8882EDED884DDD10
          73F10C83CE0718F35A79B58EC848C6BA72BEE9F496162D1895DF0C40AF39EA76
          432ADA11B23FB60469456E3664779DD897EEE37FB3A5ECD3CFCF4756DA2C1BEA
          E7B68E6E79E78626764E7554BCE6D1D90B2B8FF65F79C9DA90FCE2DCC39B98F4
          CB0190C9EBC5CABBA5154339A08351F494777F7F39359DAABE712155D44E81D3
          5BF453D2F5970070DCFB8DB4B636AA2E5D9E571DB3A7B935F6FAB545ECD26935
          6CB293C9051571FA7D8325CE57C70770EE8933ED8F9DBCD4216689D3F399F58C
          CE99B9643472C0CDC59266AEAC5687D8BF2C2296A882AAAB8F8DEC9CAE5B0BCA
          CC39285076D5D5D3F5FD5A6885095B0ED83066C1BCACB74E7B1409E5A64C07BB
          AAC694CFC949793FC9FDBF0480A42095CDD421854556A882AC3D9F915DBE961C
          032E264776A78398B659F93445D75149E52DEA62DCB7C5DB9104E0C49925542C
          93C2A56B49C45EAAEE65E8E4A69342C4C73021428D36EB0C893E551D0DAAE737
          2ECAB5277D1577386396ECEB606C0D67145975760EB1E1736AE92BC40A92C5E8
          8A983DD3C5F9CBE13F8ACBFA3FACE76C0F89C5A8B29F8F09F6E4B1D95A47F059
          14A577F5F26A731EA26170BE8B9F6A49FAAC9396A065E71DDE348CC303402675
          7B52BA5B71B282BBC8DAFD31C9DDCB88D7EE201168458E514F9011687108DF66
          144FC04015379165ED4E46CB9106A0FB9419E4EC7DA29A1D11D8D0602D447DD6
          29CF41839D3ACFB585E86B112FAB88893714A320597FDED14D23DC1E3D511713
          97B9189B0D472F5B3D1A009C322F484BEA1284047B5D306E3F9566F0291149F7
          B7F330202BD40CB51BE181F37A043475A13A5C1EA7D8CE90B50C55A0ABB5471B
          8263D953BA631B85EF3CEE8800B0BFE815893059559BC8DEB98868DF72E2E18A
          E4BC244541A2FBF9E43EE1B6661A3A44E459562322E06EC8D015C803C6110740
          B5C173CBE9F95E063BF673FB2F515B9E19E07274C0A5D9608A8930F0A27D5139
          0FDC9FA68625F21C7268659C17B74FE383E10E65F87E57E8680884533FA8A285
          EBA0805A187F44057CB74F6757E2CC9E4F37E878FCFB4D24E07376AC88AC3AF5
          54FF495E2ED7AC6F1485FBC2621942687B37BF76AA2DA971CD981C3ADC763000
          9205932A88606011A925ABF46BB2B72F448A5F432C56971CA769A611687BCD45
          ECE407C9D56EA8CA0887DC8F006595573F4C8D4DB37E35008E995B45C5908BE0
          FFACB86567D87BEB77063A65E54109DDE637D85B3B9AE41C005304E1529DE764
          27074DB6AED025472031EF05009BBA39504D1DF35E9056CCDE4719430B9F0A5B
          E2BA7C171B1B976C3A78EB9CEA98F82B563C6D6799B96D586767873C43162FAF
          63479745AC0F51827F38B2C0386777C8323FFF1953B37F3814E1F6789BF9BDA1
          84ACBDCB49EEFC0824B795B81D6D56306CFFAD76EAEAB649564E77729EFE08E9
          BEBC1F49ADCDB7CF54D7FD8B6AEBFFF1ED88E9910660C89C126A902EF5D10859
          A22B0EB504C22481FAE87E1789D7F6C4E84DA8C96E8886708626CF108C7DD2C2
          A39D68834A504D7F32C01D27D669660D6DFBA4989CFD0B9F81E2B93CCF49A3C0
          F91FB8349A840DDD99E3A061E0B9F2022FA76DA1E464A4D1A51131D3CDE995D5
          83F8A597AFB7E4C7630E7F326AF360DC545AB8F08329430180112B276BCB0292
          7BC0EFF57B894B2B799B5172A4F2007A691EA5B648F4B9985CC75C9732EA8F25
          7E965442E535F76359FB4797FDA5009C3F6D297D2CBA9183C9E38226CD04D53C
          39A98DEBAFEF57241E0200AF03806743260DD439250A9C743EEC3AB7D0A3F542
          8EA0A0C5D6F55100B49B5143BB565691D12BEB5921C4457E8D4EC1D79F21ACAE
          04203776F16BC36087CA95A37228FBAD2A4A77B08BF686ED7F21393F16AED67E
          DF3F274C5FFF8C5B38BF3F1A7AD2645AFD4FE26B5E4B8EC9A8D951EC108A45E2
          A06D878FF8F087C9D9EA18359EF9930084236BA9B4EA563569EF80A1872307C0
          E8599FD12AB323E94CB66E48D0EFC1EDF32F2E624BE6D6B287B21C6CE6969078
          A43E218F010012D27E22007813147F3C2837B3C6A4B97D5DA895DB03809D2B6A
          C8E89D0100E444BF264F8E08A62EB65F877D5C3320531F8ABF551F8DC846D151
          49194E76597158BCE0D5D85FEBEBCDDBFB66305AFD336EED6FA6A00740410060
          D84993D9974F90B6E19DA4A6FFB196A49F8201E43AEDAFA47B320E634F4A0995
          362B211B4A881D9A867E290067CEFD9C16873B90934B0A3E5D4B34219346B514
          DAA6A8FE60BACE66ED8B8A49C1844AC8325CE8E29724242D4A73F0D6B0B32722
          68736BACC7DA4DAFA05D5F45C8E8E151005C88081816916C2564E975F0C76BFA
          656A4900162701A852005C5ADC64BFE8E1EC6F0D0DD66DBD5152AF9DF0F32868
          7F0E183A6C6833001BA7FFA454B4854D62E0B5E41A702969ECA7AB5B05806587
          A8A4E20E8A25BE000087DEFE2F0540B5F633AA55E0E6379AE277D0341FDFD622
          FAD13F2A5C7F8683BE9EA1D19EAF1BC53B50453B2F0C246E5C1077DBA0F013A1
          207382969CD1C9C389B50500BBBF0A03009F02E0A280264F8D13FFC4A5B1CB4D
          216FEA080AC2E9567E79560E65818202069B08005E03053D1EAE71DED427B396
          D65CD4E1570540A923CB9941FA88BF93A3A0774AFDFC74E1A72EBA94573F0425
          340746D28FD858D081ADC5B42A38841C581397EF41EDBC747D1B367966257B18
          0EFCFC19ADDD3B9EDE1C793F6A8A6F22A67E7B27B0855767ED20111CF526DBD2
          C98743EA3AB39A362F2A26D7B145CF203B5F51E0626745059B0F034F840CFD43
          26284963AC74CFB8FC2405B9391B55151373B083D73FEACF2FB96B8B2596FCCC
          24FC730110365452ABC1E41AFE27D29DFEC3DE9792B7C931A186A79339861D61
          004E41355CA339942BC0A0D44B0A59D23BC755BF29187F886CFBD1F699EECA15
          55F10FD58CC1FA04BB2FDBC528CFCD4E85A33B4A62F4EEF11938A621F36BE8E3
          E92594796AC15321535E97E7E2E3E282DE8681CFAA8D8BC7204347E0B8B7ECF8
          A7462DAE146ACAF9E0F2A8F8082A69F129D9C698D2889D58F9331E68F1730148
          8EEB2B0574DCCDE4EE3D9E0E877CBE5B174A28F40155D63C80046F1D64DCE83F
          0360CC078DB435AA6E86224FC2A6EC3C072BAD17E40D99E27E87B0FF641886B5
          A7C9FEC8CDE5DB48BA7F4F4788A0AE1AC0A568C05ADBD3366E2536E2FD2A7A7F
          0B2AE13C634A43424C4ED3D9B516E3CF641A744C3021A6A3423E1FFB5AE13778
          726E27ECD16D5F93FD31786F4F172F1B0E495BBFF6DCFC5F0F0070BFE9C923E3
          8CC7C891D3F9E75D1106704DB175C803B7E063C3A115D62F0460D4824A7A778F
          4D0559DA0D8D09794B40E793723D7C5B6342DC9945D6DD51C399B5376C2D7248
          F94094D81BEA86F1D64E1A8E1D56A3D65ADD6ED757C406CC0ED2BA50424DB14B
          5E0B4E33F8838D82DDDBD1439DD450844FA3DB5040CC6AEDD5DAE22C4C1416F1
          1D216B294460A0858B9D8873DC15D95C4B15F71DDEDD813F178024FDB43F85DC
          43A71077B87FE625F9C35342BF1480910BAAE9BD328B5AF8B9BA8F6C02E8F9BE
          342737E29618B7CF977B4FDB484DDFAA983D3BA0D165B0E1E27C37D3C3169D85
          7A6125A2B1347BCBD7C406CDADA36D4D0935B17464555CCE518F17084D8C5D3C
          E83D5FC6E6065B5DBD790DC83D92EFA431C811E997B5D15F79789B392766D3C9
          08B9D34CA2659D58883EBBE0F012F14101D830FD103214F4A348EF84BBC8D5ED
          EC5F341FC2B2A0842AEF82125A794825B41F001B00CCFA1900144EAF4A3E1470
          FB92383D36C1D01E2AD16C1FA7D312B6E81292DA635E2ECEAC038D430D8DD039
          DB9AEB617A6D4C0E01ADAEC1EA35BBC6E613BBFFFEFBE9C5AED7AA93EB5D1E13
          4B61F00D5DBC74FAE00257EC955DF119EAD6A886B07665FB2C312021E88CE277
          FD53324F0F3D842AF90E70DA0DB5267BEA81C42C9A7CE5D5870DC003A8031626
          EB0000B0EA31D2D64F3B280049FA09B426C7198F9391D9EE47C77E0EDE249490
          4829A199A888753AF0424EF3BC504A3E5D2E3FFB5E12896301C0CCC306A0E38C
          AAA40445B175ADCE6859598216B771F3EB6C5B94552568B6DF60B7452D31B695
          83866B3A0F328D15C46C39264B632F418E46979D99D3EC545D6725AF07E4ED0E
          DB4B51FD7A8B9C7CC8EE26B93BD3C51E04EF9FA08652638C7B9B2C7957A62EEE
          2D4BF0D390A0A7A35A7EEDDA227EC947D5A6583DF6F08AB1032BE1930000DF36
          8FE4E63907E56705806C3D98DC475F4D5C330E6BFBFFDE18051B662319CF3844
          125608B82837EB1A8A45DAFEE8BCA01FB636EF54AB394283CAA3F6BB4E462F04
          27EEBDABD38CB69798B658BE7BECAA6DE96F1CFD2A58C3393EDB1AFF45D4B0E1
          01D9EA6E4A3F93DF688CECCF47A7C6B306CCA9A422B7E65852654D5377316639
          F81971498BD5B84FD8947FCB74B0D39FEB2BB65DB5863FA8917CCB2616AD8CC9
          6550478D2D9C6C18EAB972775D98365EDD8E7EAADD76DB6DF4E0830F360FC69D
          3C6CB21BC95DC443C4E4BF7B7752ED3B3CA4FD0CE979B0668B26A8C2A6434304
          F00D3D403535F53473E6ACA94545459383C1205D74D145875CA7D7EC1A6A9E82
          288DE2A8EC2F6CB1B7C6D6CB07650AC75D3976E28E0A47E68E46F3435DD23BF5
          167B18FC0F9A97274382FA83529B3D7CE73734EB9E5353D7846715D3A7153A65
          04F8642493297E9D6E4335FCB7020775AC4E4875E7FA3D26F169E9869CA4AE08
          0ECFA1B7DE2A953321BD46009C3100EBBD42B8C0E6730F4F8E2E58B080E06153
          BB76ED7A8FC3E9FCC9E5FF93B970F247B7C1BEB754535398B66EDDF620E7FCDE
          CCCC4C1A3162C48F0200FA7181157A4256EE6CB229586EEA745C86A0DD91E422
          47D5C6ED77BC9C2E968C2DED1CD0B586B81828941AE0BC3203FB5A7E51BBE623
          387AC63EDA1A77AA914E753BD25C1461F34EC860E3C282F3D50DF62CF5F899C6
          46714DBB1CAD07F2C084DB5B883F4CDEC3AE6E34E96924A167167663D75DB7C3
          969B27CFA4D8D61B7E78AC4A7AFC903FC4D2A54B07793C9E63287937C5218C97
          9AB7EF70382C340D9DA9620ADFB368340A996DD8AA1F384F54FD1E8BC50CD334
          356C3FA169DA61DD85A9B68165792010580EEFFFAC43870E949D7DE89BEB5A4E
          AF26A746279647C44C0897476B43F4C7A3D34DBAA4FD2EBA7A7D27CA74F1DF83
          FF2FCA33D8A958AE32C7C31D955179119772BE7AE848462C419F5FD8B21980E3
          6655D23E33E90F2D2B6272B13258BE930F2D8FCBDD88865B63424E84E2199EED
          90F51509FE479DC9E74C3515222E9760D944BE83A99911BBB2A4496BC7FFDBA5
          C993D1EF40D77FE07253CF3FFFFC25C71D771CA9704F4B4BA3ACACACA4212291
          8832066DD9B2851E7BEC31C53F6A3C6AED0D37DCB0272F2F8FEEB9E71EB5ADA9
          E8B3C68F1FFFE5F0E1C3931BADACACA43BEEB8C3818F7F564E8AFE047E7F77FF
          EFB66D537979B9029460E8E4DD9900F0DBBF8AF75BB76E4D65656574CB2DB71C
          D4F027BDBC872AD23C64C9E4C3005B41D0DF005A9E5F65F28F8F36A214F3F828
          E0E0AE6F8289193897D2708FC8D51D77FAA4C159373528BAB12CE3A3B35A56D2
          DCB35A7C3F32BBBC53465D7C4CFBB086BD1CB7696286C1C6D944D35011F74554
          CCF668EC46D492F3023A4D1024DD2563A32FF85E733D1FB1E5E5019DFDAECEE4
          4F4C30EAE98D899D7E78CC2A93BD82BE147D2B353F214C01F012FAAA547478D1
          63A94EA9EFEC54F41C8DFE2EFA64F4A752407AD0E7A23FAAFE2AD00E18661888
          FE217A3ABA9A903F5639C901C7A300B552FBD25311C853DFED3F0EF5D995EA2A
          7998DF7AD3BB15549940546ACC11B7A46BC335E58DF4701E5943041DBD8651B9
          A92515653029E9E5EF1392CD51A3A5F92EAE9E8D94B13DC63F1DE6B56871EA2E
          FAEFA8F18D10197684FC9ABCB0C194AF42E1FC0BF173D9EA886DAC0D8977D414
          C48DED83979E549AD50200DD9CA6C9C990A00301CE3C28814D454E1A09AFA80A
          7041EBC67E6F6CE842F47FA18F479FF6037086A0FF0E5D65EF0AF467D03F46FF
          630A2475A141CD99518F40574FCDDD9532DA4AF441294016FC609BF7A15FAF22
          06BD472A0237907AB82BD195A9E3A947DF88AE92D67BE867A7F6AFA2E6E6D4F1
          285DAD2EF5ED447F04FDB32400F3CA69D199B594F566CEAD90942351645D8122
          6B7B1B4350A6D3A605C53AA507D8DDF8ED9C1C9D46387556E573E9DEC6B87D89
          53D86F6B8CD5E4C2BD968C3E606EA86AFD67945085A5ABEBAF6DA17016A91355
          934E1B6DB91DB5C1A4884D93B1B3519526DF5CE492B760C56D9DDDF4C18A06F9
          16AAE3731005D7D425D8B3976634D1FA8A3AFAF29A7EFB373D11FD55F44FD077
          A40CB819FD7DF499E80DE8D3D187A1F7A6E65B4814005D52607C99FA4E197A51
          CA2B77A50029450F1E607CE5F51FA1D7A03F87FE26FADDA9481983FE1ABAA2CD
          F5A9C85491F4582ABA6AD13F40FF14FD4FE8DFA4961D9B5AEE0CB5DFA1F32A68
          C92A4639DDE86675A70C54D0D582D8AED66EA06A73454B39C551311F4EBF301C
          76DCDB33DF268050183145CB44DC5A0D674D6C19F79D837E0BC0192149251F96
          D3452D89DFB7953FDD64CBABFD3ABB312AD9932D1C32BF224EEF03BD39214153
          B0B36EC80197E519F29EBD313A0E1133CB606C8FBA91CD94B4573D2E7EDBD86F
          AF13EF076073CACBF4D4C9ED46FF6BCA30F353DEB734152527A057A29F990242
          19E276F47FA6C0A94FADFBC3A6BC7D1EFAC329E32B90F7A18F447F3C1549C7A3
          6F4F19F9CA1400F7A4807A24B5DDCBD04F4C01A5D67907FD72AE69AF7FB6BD96
          1EDE6EB9A396141551E968D458C8A7465D4D4675A08680C126844C39D5C7E86C
          84F03AC806CA71B1734193C198CD9678A545DB0E06806A5D908CCBA3EAF1B434
          AC4E510B67AB5B3A68D4F630D5055C740714D085888A33F6D56B7B8B326CF5EC
          84EDC3D3AC796F556BCF23515F0AC01EFA732BBAFB990A298569D1C6E6BB23F7
          53D025E86FA40048A4A84725CB5352E1ADE8E6736AE6EF0129902E4C7D5600A8
          44FE6C6AD932F4F3E9DFE7273E96DAEEBE54647548EDEB34F46B53461D948A1E
          453577A13F91DAB6DAD76CF47FA08F46570A6D4F0AB085E837398E3FFFB9BC1B
          9E3E2E648A7BD5BD7250378B0ADDACB59AFB1315B40BDE9FB6332466C1D83B87
          B9AC6BB67287D038B5C45176750BFB639358C2670769C505DF8D9B7D0F80DEAF
          EDA488D3ABC685BC3B2334232EE8E47483C69B92BD83DCD03A68D27B0ECEA635
          98F6836DBC5A7B7C7FA397B329C1845DD8602513659A9A07D924D8E22689FC79
          61F67E0054129E80FED601BB1B42CDC955D1C293A993FE43CA18D7A0AF4E454F
          A7142D7C985AF6056A4EC03FD4BB85A908B25340ABE4DA22E5E54A31855391A1
          BCFD93D4E7AE2900EE4C1DE7AC94A3A85C34859A93F88DE817A08FF05FFCC795
          BED32E3FBD2121FF0E1BDD13FCAC7EE63167647500DFDB3BC372B74B67E34209
          F19097CBB12856575A488AADFCBC2BECD8FE828CC8FCCF420E59D148B4E5A2EF
          460DFEBD3E79CB24DD842CD4E405A096D780B41ADF386F53A30CA539E52DA09E
          2BA190CE6A147C4BBA2E2EC526DC2535E2E9B434765DD8164F60F915790EBA20
          2E5949F9B8240D9D47CDC9F29AD409EE6F8E14AD5C9D3A0EA544DE4E79B1026A
          4DCA6B95227A00FD8AD47A2529A3AEFAC1912B8E7E11FDA1D43654531EA0E82D
          988A8C29A928A849458FCA848FA4F6A3AE81AB841C486D63740A4CD59F6C357C
          DCE3ED6F79CE1D8BC76255319169D6862B5BB749EF8840CFAD33C5A73A63397B
          9BEC3952C875A7FAEDEB7708DD06FD648195C6A593F5B27A9EAC1B05C027A3BF
          3F83FCDF00E833BD9882C2508FE64A2F8DD34C48A7E3D30D7E21AADD69593AE5
          5625E41C2492B56764B0EBD7C5A5B7C1E2F7C3D7DF7409B9B1D8942FC6851CE7
          D5D8735DBCFA4DBBDFFF57B4E6F95BD3539E589CA285039B92999D53BF57A16F
          A26609A89E4D164D195B35552EAB471BAB6D6D4D6DEB874DCD0E53882BFA693C
          E0FCDAA4D61F8CAEEE1E99970244197C520A38B57CD901EBA9E5BBA5B6B9EF18
          29B794CEA83DAD21614F417E9B0CA5B230DBA9E5EA4C64BB98DCFDF96E3B9A99
          C36F4552BECACF490DDB6E6C1FE0BC3E46DD6C5B70DD161B51E4DA81DC8DF4C9
          D0537E1C80E628906498D5E4E3E2BC464BBE0EDA5955E462A3CBE354E364724C
          44D0E33E8D5D0D4E9B9FA6CBFEB6646A36C503A88CB382A67C0791D733CD6077
          9FE74DFC6DDA93778B86C5AFD1FF405306579EAD1497A22345892A9F28791C39
          D44A6923AE20C7D87BC8E1729FDE688AFBD5B0CC7105FA9255D5E20F3A89E5D0
          F98BE0907D6AE3720692DB3F430D8EBF0E6A659107C5D8AE907DA926C42CF54A
          153712F5DA83DC3B775000BABFB58FC2DCA16E32F3EE8D927A38DF18BFC16FAD
          8FCABF0F48E78ECD11F134E2B72712F2B975422B49E3F6446CA9E53101F6D725
          35E284065B2AD51308E8FC77B51366BED473C679C9EBE19DECAD34E3FCC1BF15
          004A4A2A75A3A8454D485514A694D1AE832D7CEA822A5A8854DD21C0DA8076D3
          F30CDA1417C273719ED1F048A975912944965557FD68EBA27CCFB690FD8A7AEA
          7A8E2E2F609C075BFB182F4FF0B106C92F85E1DC618482B47EC2C1E74E1D729C
          2BFBED4A4A58EA59CA52DDA4A7A6A93765194CDD09B906C8B76BB0D94C48CF15
          BDFDFCA6A06D524CE897A6E9B4704D8876A731710164EC335847205FFCAE725C
          EEEBEA6E73F5D07F7FBC8C564FEA47BF61537584A2BE830E8F9EF45E65B2AA46
          54534B1FD7E797592F276C39A8D0C54F452DB44BE7344CBD6E259D590F6FB9B7
          389835A5DD6D4D96B8D6CDC48404699F9FD9DE49BB6AAD167531BBB36DCB35B0
          706D9A4CD0EA0B0E7EEFDC2101E8FD7609C5B94E97B5606CCA4E392562CB7B51
          1DCF68E7E697EC8CC9B08BE42850D13FF0DD1FEB22FC597939F4DDBBD4D7B245
          741B39B650387E05D6F91B40B051A4DD7E4A9A78796544B3D553AFF32C93BEFE
          197389FE5B6DF06BABE9D389AD899DD54017DF1C70DCDC5E9AC33E35CFB7A162
          F20D7A3CC259A798252FC6B93F13256D84296521EA8173403D8F8442194F9DD8
          B28E2EE8E0E68F6F8E5FAB4BB904EA67530C29BC78DCA1E7CEFEE8486FDB6995
          044F86709779B5264D07B71F9F062AAADB107EE48D737CEC9ACDF20E44C435D0
          FF5746055BD8D9CB323993E98A6F3A259AF6CC8DBA2E457DF01735AAEF37D89F
          DAB8F86355A68C946EC9A1815D4BE9CBB187774FC1AFDD46836BFC9E6A6A08E5
          D2178DEAB103D42F6CC97B20359F2D4F40FE42D0B6F3B16E114B5C05C3BE9C20
          7E0C72DDDF611A3796F9AABD9B9D2118551D97CFF96795F23CACBFCE2DACAD71
          E222439AB4F4BC43BF6FE04701E8FEC236DAE8CE22B730C9CDE84424E469084F
          9EE560E3C3362D6AED149EBD51F628403E1E15E0451A675F16B9592E42B66579
          827DFDB7CC6AF04FE6D8902DFF2A242BF4E8EC955C077BA024C1F674754B528F
          FBCD818B7C3AF1F06755FC1AAD705A951A8AA73D8B22A41DEBA61C070D87047F
          C6CDE514D433AF16B9644F1CE6155C8AD724D73A56C7C49309F5CA13340FA779
          1D3D745187027F437130DAA12961B785145D8DC8AFF681E8568EFEF199E33F79
          ADA3DDEBC5E44439B7F9A542F24FAABC1111F177A8A20DD9061B1793B4C5C364
          768D49CFA91917D90E7E49D896EBB2E116DB829C3A78E3B4A34EA39C800478F4
          5784EC40D4095F050C7EFF69D9C6078B8396DDCB4754815A35545D4EDBAEECF5
          5F33FAF0F74A9BEF3B80D8288E25AFBDE55645ED1BF1CDF26E5EF1D1EE282BF4
          4AAB3CA23BFAC52C31DE415219BF5D555C3C056A49DE10E160F4B55F8394E57C
          53AF74CD57DC645FEE66723A1CB20CCBD0CEF37F7ADAFE615D6C6AF76629C591
          B73C1AB9511BFC1DB4720DB8FFFD7C27BF3464C90A078916418B3D8FF3C942D2
          BDA2D6626B8FF558546EB2E4C4D50D514D3D35B71D40988C3A61024E3C8A5AE1
          E54C077F7A57497C5BDB964EEAEC12546D7118254C5F9EFDEBBF3E8A5EA821A7
          8BD1D56D35E3F10D51B343A6D6AF342AD4F4C2371A23C66DB421412D07F333D5
          1B370C295E149ADEAF262EFEBEDFF850389BE1E197EABAB632D729034D264D70
          1324788C6A0CFCE8B176D157938EFDC9C3382C005AFCA982CCB6A82484502FEC
          CA0D5AF4224270A49A805AE4D26E0C9AA20EFB6C5D6725C751D4E3CAAEAD8CCA
          1545A85AA01A686F54070026E569C25366D1B888CD6E433EE98CB0DFE1D3F973
          190EF6F6F6E24471AB22830AF165B57452916CA44FC61CB917AA0D7AEA3DAACA
          3F3A39101582AEF4C0D20667ED402753F1715E2F1F9BB9AED1EE2D842C2EF0E9
          B1DA84BC18D23203B5D0AB8D523B1B4A503D3F3AF940689DC96D5E2EAFF43A9D
          CB5AB829376E89DEF531BB82DBF6168FC64CB7A6D15787E1FD870D806ADD9FDF
          4CDBDDD9D07002F9407680B15FB6A41CAC0CD8CAC56FAF4A880627C94280F308
          A2AFAF576777806A4A0140314EA6626040A78DF571DA671A94A75B1D9B6CBA31
          26683C823FD3E0A41EEFF536D4D29C13B21C5BDE298F5B907D948D0A275B5AD4
          0435168834D29C713F7DD1FFC036145ABE32AE935B53D35324A19052B3180290
          8D5DDC9CAD979C772B8FDA6F83165FAC8DD39FD573E3DA78659F844D13C0E31B
          03062DAB4CB0DF23F75D0987495EBC3698DC08BFBAD6D2F44FFA04B440C4B43B
          854DD9665D073663D0364BC62099B68C3F7CC7F959D7BBBBBEB68F369B39E435
          1AD4D1F40C0BF93294407FAFCE9FCF77B03BEB2D19744A915167B3C9A6A47361
          5C03C65D97E1E0F7946C0DAFEAD6C34FB94E32A0B1FD177BA2F5779619473709
          794542D099002D0B1E59E1E26C895B571536FBA28B5F2F9EB72B92C88425FC6A
          6CC4D0D47DB9A4E658D647E26431F5A442077975EBDBBBFB2A85060D2FA90916
          63C9F7A568EA0E960C44AFE39B0651898AFEB2605C3C02AABCB2ECD986691DAE
          4B6F8363AEB434E683539C6B0BD916D1FC0ED734BD3621A63659346CFFAD20D8
          CE0A9F2E6FACB5F4AFFED0CDA5BD5B121F65415DEC8DD3EC21012D09F2FBA37E
          DECB7D7EF6848376AF94D249EE08BD120B50A626FA3558F41C926B7F8FC6DF42
          4EB80D49BA34CB416D7646C447515B0D07271FEF5B8C4879045EFD72BA6EB292
          987633ECB30F469E7BA9BBA6F6A1607A3FD414634DC946C2789DD5957794EFC5
          48F6AB9D1A5B85F5D7839976A5195A75AE8B87BBA6E989C7BB338B0DD806119C
          45DD5ABB68E3981C2A2B09B1A1AB12D2A73367D4963DA4947B7A6619A125E589
          67A0CCDA17BAD87900A6A0D194E391CFFED564B32DADBD2CADDEA25360F8C1B0
          E05738A6CF90C346C3EB6F05DF17A58C249C8C66A7E9F28EB0603B6FEDE1D7DE
          D915B9C620F1A993C4A6B86466EF73F2A8FC9575B4E8E2DEBF2E00AA757AA398
          3AA398FF206CA8972BA877C43C05104E40625E94EDD07E5FE494BBD785C45D00
          E0062882E453EAD43BBBD4EF888647D2B8D884133C1919B71F6CBD1E5EBF70EB
          392B8B5BBED1BF202CD9090002450E0D1252B6811F3B91DCD5AB9BEB004AB5CE
          59359822086753FF361135DBF29DF47C555C5E68C16039067B20C6D851E0F619
          A09E47161CE77E78C4F2D83D30704B48E0DB4392D595D710E56549BAB088F8DC
          0A360994E4F732F9419CF13675A6BC3502AFB79BAB65F5BF0637A7A73274E87E
          AED5215FE5236287C1F05F83A68A11E14D0E2C942DC3B460CCE1DF27F11F01A0
          5AD7B7CB69A4DBA467430E9513DA866C520A6134BC757386C16F3F3EE058B8A0
          2636123C3F1904D167FF951348B77AF0FDAC80CE9F7592551191EC441C463F18
          B5D6D0D867390EBEE6CF052274E90E3B272CA81BB6D9CF14AC8720D90174A70A
          860C50825BCDC907783A18691B003FBBC664F782E2DBE739D828AE31775D42DC
          04BBCC0B0A6DE9884CAE01000E57351B74784C531305DD2E8803497D7C945612
          A31EA0CFCB51688D694EB4CD73E8D40B453D9A9C3AC0159BB7C1F4DA592E7694
          B4A51BCB25BC96F8823B79F2D98D1BCFFBE575CC7FF4FCAF36AF15D31E3B93D2
          F5100534995D6DB2BB2151AFD52133FD067FA49D5B7F627738116892742B8C73
          A1D53C9C4CCD0FBC66AB3BA082AC30A9DC4F71BFC9F4FE92B16319F1DCE46B6C
          195BA75E31D2C2C92B2EF435C51F2D97CE8A040B585C4B07EF061C1A4B53AFB0
          05DD97B56FAAFCBAD8979783EFDDA5E3F3F7769F5D4D1BD45DE89377D0E271D9
          74E7162B39F3CE44C84010D0BEB0A47E999ABF3C2606819226C46C7906222E7B
          FF63483526EB1095AFF935F91892EDEE1E01EEAC8A8AA3B8941EF5C2E83A9BBE
          C960C92B87B4F6FCFFAC88FC8F1FC0D6EDD5122AD60DF2AAD7DC31E128B3F924
          F0F96450444B187961262ADF137DF2CBF975720892DC4DA02A95D49C066321FC
          3E077CFD5ABE93ADD818B6C3C2E9A51622946B13EF4E8CF504FD280ED6D45B94
          E0ED95F0CB4A974641F0793D28A2C9A937DF7F1AB724F2A670A5EB14421198D0
          184B43F4F8200FEBE3926FAF461855224487143A5D7B225687902987C1E8EA31
          3B4721AAFC07BC512F06A32E4605FC580FC35CBA87B9EC7427EB08C367466CEA
          E4451E68103CBCBB91D3A88C26DAB9AE8136DDFF9FBD8DFB883CB2BCCBABBBA9
          5E73AB31232A096994ED1347C100F725843C5D5725B9C19E2B70EACF08D3AC2F
          37938AE76C78D91730C01018B98F7AE335A8EB3D48D78FDA78B46D9FD49AD174
          A74EAD581362CB9983C45C28881502845CE4850022C4A7E6CCC9E6C7F849F5EC
          7F78B87448F145071F5B2319C732AC0636D791509DD0FD1D61F0A3B0BFE3714C
          FDACE6F74A7EFBB445183E0A79B91C5CFF42BACE16344A16EA9BE5740763D600
          80E8C7F2D1529396B680F4733A742A68A8A28513BB1C09D31DB967C69F377D3A
          7D6D1D4F3E2668B7A52B85A4E4E8A5514137C268AD1C1ADF0009F98F22277FE7
          A434ABE1913D86D9CB1F75979BDA0018E66C90847AF6403ABC7727787D392860
          A547A72D2D3DBCF2E30DE18851E02297C6C98001829601FFF7D029E9955AB566
          B4C6FA3E247CF5EC1AF5CEE14C54AF45E8ED407B1D414B1DF09D7AC3B6EFC039
          8AC9D7DC12923A93CB9C9CDE48636249A5D41B13B076B7803E0891A0C56DD931
          C0ED99FBA41EBACA17A7F7516EAA81B995BFF09D61BF2A00FB5BD75777D13E3D
          9D02324E65B52813B362BD204D6F8491CE53AF1587ACFC12D5E2BF32749AB77D
          5FB424A7D045D5C100B5C9ACCB0B093600143D14801DA5E847BD3B9EABD70612
          DB09B5B1079F4B547E40F60D452C1982E73A62921E8257AB37A6AA6BCAEA6DA9
          0ED09F9E9CF67F9093D5483668C82DE0AC859096F3F398B5AE941C89B3DAF8B5
          CDB591D6515B1C85EDD560E5AA9D96635D676CB1A0AC9262D97E5ABE198C78FF
          9135D9AFF2D684364F2F279EDE8620EDA854E8D4D5691B5BE2FC78E486AB21E1
          4660B73E18743372C06C9FC6D493A4D67F113423AAC0AA81B4ED1E88A5A1A26E
          1913AC2B00E90E6374920CE941523AA8C50D27D4A44C3E5E9743B2B6548FD2FF
          E199A4FE29814A983359016FDFA4DEAB039A59EED768C3EEA8569FE194847D67
          31299CA0ABD13ECEBE3485D03F6DDBB0A2FBB634597E413E8D9EB58704AADB79
          E7FFBC2AFC3705607FEBF1C2166AF4A6132ACD6485DA424BB82A2CED38142EEA
          95E6235044E6C028F5503B2BA16A3E4071F459AE836FFF6663B831BDAD4B3D93
          8DEAB1DE5467097FD5CC71375AB6CF669A0FDE8FBA8FB99D1A4F878CFD839AF6
          81A869428E88607B0D9CA44AD87BF1773B92FD3607895D799A55B9557A126425
          E89442AF6B6F289E0D8AEA62A9242CA5894A7A9D4EEA0D572CD6D680E8D539B9
          6226CD3FF7D7BD66F15F796F48FB17B651C8974E6E9C7CADD4E968B7656C8C6B
          DD23829D1917F20C18A157F36B81A94EBD6019807C89A4FCB5AA294057A5AD3C
          5AC3C211E951F6CF12722331F0D4931FD4A05AF774BD28624A7753DC8A6A1A8F
          65E932DA4D8BC7A7477DB67AD6338A251A98A18396848E82B13B926D5342F2D3
          3412CB505FE4676A72898922316C93B97FFAF6A6C31C48FB3F03C0FED6FDE55D
          14F678C96D5BA4DED55E05C5D42EDDCA8461FAA9EA1251713CB8BCAB1AA04BBE
          DF9751233CBA1CD56F3128A4180151EED2580D927463CC9228A629EEE25486E2
          6B4D865B33A41076455CA6BB354AC46DD616E22882E8E8826A19CC227DA0B108
          A242BDD725A809515562E956578F54CFEE252827F288202D1DD3E93F3FD1FF55
          00F6B7AE4F7F4D32238F3C12407007D5D99C1A427E6A9F561780CE6E9B90AC37
          8CABDEA6DA5DBD4D5B26E7E730A5D735BE9FDC9B1F092493AF16D4E9DA8083A9
          29A9C5F0E42E6E265611D77AABB11AD41E39699C36A8B1B912693478215E7351
          3EA89BF7D4ADDB7BE0EDA7BE574A7347FE3697477FB377A8ED6F1D9FD9491C59
          51B32C6AD25D1446643420755A8DB9D431A3D413123C23412C1755723EAAD07C
          A6669B4972D9CDAFDC63869A75C0E5AC4C278B039244C266C24A58F1DD9F7C68
          B73DED0C023D5121D4A3BADB7EBB11A0DED1AAA43CFA62C24F3F62F3BFD17E73
          007ED8BAFD631D9DBD68164D1F399112869312108EEA0E730B14816A34F92E1E
          3AF0863EF052AEAE6E80680E09DB06F140CBA73335A7304963F4C5F89F7EA0EC
          6FD5FEE7003858CBFDDD1EAAFAC2A63E175BC40D8D22F5D5640BABF904D41B97
          5D39EA01E8B4EBC623539DFE37DBFF072181FD9BCBDCA5BC0000002574455874
          646174653A63726561746500323032302D31302D30325430393A34343A34392B
          30303A3030C12EEAEE0000002574455874646174653A6D6F6469667900323032
          302D31302D30325430393A34343A34392B30303A3030B0735252000000004945
          4E44AE426082}
        mmHeight = 26723
        mmLeft = 253736
        mmTop = -265
        mmWidth = 30956
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel1: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label1'
        Border.mmPadding = 0
        Caption = 'Maquina........:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4234
        mmLeft = 1588
        mmTop = 29103
        mmWidth = 24077
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel2: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label2'
        Border.mmPadding = 0
        Caption = 'Responsavel..:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4233
        mmLeft = 1587
        mmTop = 34393
        mmWidth = 24342
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel3: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label3'
        Border.mmPadding = 0
        Caption = 'Plano de Manuten'#231#227'o.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4233
        mmLeft = 1852
        mmTop = 39954
        mmWidth = 38894
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel4: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label4'
        Border.mmPadding = 0
        Caption = 'Data Inicio :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4233
        mmLeft = 1848
        mmTop = 45507
        mmWidth = 20108
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel5: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label5'
        Border.mmPadding = 0
        Caption = 'Data Fim :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4233
        mmLeft = 53975
        mmTop = 45507
        mmWidth = 17198
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel6: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label6'
        Border.mmPadding = 0
        Caption = 'Horimetro..:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4233
        mmLeft = 116153
        mmTop = 29104
        mmWidth = 19844
        BandType = 0
        LayerName = Foreground
      end
      object ppDBText1: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText1'
        Border.mmPadding = 0
        DataField = 'responsavel'
        DataPipeline = ppDBRelRev
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBRelRev'
        mmHeight = 4233
        mmLeft = 26458
        mmTop = 34396
        mmWidth = 255588
        BandType = 0
        LayerName = Foreground
      end
      object ppDBText2: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText2'
        Border.mmPadding = 0
        DataField = 'maquina'
        DataPipeline = ppDBRelRev
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBRelRev'
        mmHeight = 4233
        mmLeft = 26458
        mmTop = 29104
        mmWidth = 88900
        BandType = 0
        LayerName = Foreground
      end
      object ppDBText3: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText3'
        Border.mmPadding = 0
        DataField = 'horimetro'
        DataPipeline = ppDBRelRev
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBRelRev'
        mmHeight = 4233
        mmLeft = 136262
        mmTop = 29104
        mmWidth = 70379
        BandType = 0
        LayerName = Foreground
      end
      object ppDBText4: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText4'
        Border.mmPadding = 0
        DataField = 'planorevisao'
        DataPipeline = ppDBRelRev
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBRelRev'
        mmHeight = 4233
        mmLeft = 40746
        mmTop = 39952
        mmWidth = 241300
        BandType = 0
        LayerName = Foreground
      end
      object ppDBText5: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText5'
        Border.mmPadding = 0
        DataField = 'datafim'
        DataPipeline = ppDBRelRev
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBRelRev'
        mmHeight = 4233
        mmLeft = 71703
        mmTop = 45508
        mmWidth = 24606
        BandType = 0
        LayerName = Foreground
      end
      object ppDBText6: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText6'
        Border.mmPadding = 0
        DataField = 'datafim'
        DataPipeline = ppDBRelRev
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBRelRev'
        mmHeight = 4233
        mmLeft = 22226
        mmTop = 45508
        mmWidth = 24606
        BandType = 0
        LayerName = Foreground
      end
    end
    object ppDetailBand1: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
      object ppDBITEM: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBITEM'
        Border.mmPadding = 0
        DataField = 'item'
        DataPipeline = ppDBRelRev
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'ppDBRelRev'
        mmHeight = 4763
        mmLeft = 529
        mmTop = 0
        mmWidth = 165365
        BandType = 4
        LayerName = Foreground
      end
      object ppDBProduto: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBProduto'
        Border.mmPadding = 0
        DataField = 'produto'
        DataPipeline = ppDBRelRev
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'ppDBRelRev'
        mmHeight = 4763
        mmLeft = 166160
        mmTop = 0
        mmWidth = 55320
        BandType = 4
        LayerName = Foreground
      end
      object ppDBCodFab: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBCodFab'
        Border.mmPadding = 0
        DataField = 'codigofabricante'
        DataPipeline = ppDBRelRev
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'ppDBRelRev'
        mmHeight = 4763
        mmLeft = 222253
        mmTop = 0
        mmWidth = 41286
        BandType = 4
        LayerName = Foreground
      end
      object ppDBQtde: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBQtde'
        Border.mmPadding = 0
        DataField = 'qtde'
        DataPipeline = ppDBRelRev
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBRelRev'
        mmHeight = 4763
        mmLeft = 264853
        mmTop = 0
        mmWidth = 17198
        BandType = 4
        LayerName = Foreground
      end
      object ppLine1: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line1'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        mmHeight = 1054
        mmLeft = 529
        mmTop = 5027
        mmWidth = 284163
        BandType = 4
        LayerName = Foreground
      end
      object ppDBObservacao: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBProduto1'
        Border.mmPadding = 0
        DataField = 'observacao'
        DataPipeline = ppDBRelRev
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'ppDBRelRev'
        mmHeight = 4763
        mmLeft = 175165
        mmTop = -7
        mmWidth = 90212
        BandType = 4
        LayerName = Foreground
      end
      object myChec: TmyCheckBox
        DesignLayer = ppDesignLayer1
        UserName = 'Chec'
        FormField = False
        BooleanFalse = 'False'
        BooleanTrue = 'True'
        CheckBoxColor = clBlack
        TextAlignment = taCentered
        mmHeight = 4230
        mmLeft = 266430
        mmTop = 258
        mmWidth = 15625
        BandType = 4
        LayerName = Foreground
      end
    end
    object ppFooterBand1: TppFooterBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 6615
      mmPrintPosition = 0
      object ppSystemVariable1: TppSystemVariable
        DesignLayer = ppDesignLayer1
        UserName = 'SystemVariable1'
        Border.mmPadding = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 238920
        mmTop = 523
        mmWidth = 24606
        BandType = 8
        LayerName = Foreground
      end
      object ppSystemVariable2: TppSystemVariable
        DesignLayer = ppDesignLayer1
        UserName = 'SystemVariable2'
        Border.mmPadding = 0
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 264056
        mmTop = 523
        mmWidth = 18785
        BandType = 8
        LayerName = Foreground
      end
      object ppLabel11: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label11'
        Border.mmPadding = 0
        Caption = 'Fort Agro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 1852
        mmTop = 1324
        mmWidth = 13758
        BandType = 8
        LayerName = Foreground
      end
    end
    object ppSummaryBand1: TppSummaryBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppSubReport1: TppSubReport
        DesignLayer = ppDesignLayer1
        UserName = 'SubReport1'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'ppDBServiRevisao'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 265
        mmWidth = 284300
        BandType = 7
        LayerName = Foreground
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = ppDBServiRevisao
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.Orientation = poLandscape
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.SaveDeviceSettings = False
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 210000
          PrinterSetup.mmPaperWidth = 297000
          PrinterSetup.PaperSize = 9
          Version = '19.04'
          mmColumnWidth = 0
          DataPipelineName = 'ppDBServiRevisao'
          object ppHeaderBand3: TppHeaderBand
            Visible = False
            Background.Brush.Style = bsClear
            Border.mmPadding = 0
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppDetailBand3: TppDetailBand
            Background1.Brush.Style = bsClear
            Background2.Brush.Style = bsClear
            Border.mmPadding = 0
            mmBottomOffset = 0
            mmHeight = 16669
            mmPrintPosition = 0
            object ppDBText7: TppDBText
              DesignLayer = ppDesignLayer3
              UserName = 'DBText1'
              Border.mmPadding = 0
              DataField = 'datarealizado'
              DataPipeline = ppDBServiRevisao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDBServiRevisao'
              mmHeight = 4763
              mmLeft = 1852
              mmTop = 11904
              mmWidth = 21167
              BandType = 4
              LayerName = Foreground2
            end
            object ppDBText8: TppDBText
              DesignLayer = ppDesignLayer3
              UserName = 'DBText2'
              Border.mmPadding = 0
              DataField = 'descricao'
              DataPipeline = ppDBServiRevisao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDBServiRevisao'
              mmHeight = 4763
              mmLeft = 24606
              mmTop = 11904
              mmWidth = 133615
              BandType = 4
              LayerName = Foreground2
            end
            object ppDBText9: TppDBText
              DesignLayer = ppDesignLayer3
              UserName = 'DBText3'
              Border.mmPadding = 0
              DataField = 'responsavel'
              DataPipeline = ppDBServiRevisao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDBServiRevisao'
              mmHeight = 4763
              mmLeft = 159279
              mmTop = 11904
              mmWidth = 98900
              BandType = 4
              LayerName = Foreground2
            end
            object ppDBText10: TppDBText
              DesignLayer = ppDesignLayer3
              UserName = 'DBText4'
              Border.mmPadding = 0
              DataField = 'valortotal'
              DataPipeline = ppDBServiRevisao
              DisplayFormat = '$####,#0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDBServiRevisao'
              mmHeight = 4763
              mmLeft = 258763
              mmTop = 11904
              mmWidth = 24871
              BandType = 4
              LayerName = Foreground2
            end
            object ppLine5: TppLine
              DesignLayer = ppDesignLayer3
              UserName = 'Line5'
              Border.mmPadding = 0
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 529
              mmTop = 16400
              mmWidth = 285221
              BandType = 4
              LayerName = Foreground2
            end
            object ppShape6: TppShape
              DesignLayer = ppDesignLayer3
              UserName = 'Shape403'
              Brush.Color = 14155775
              Pen.Color = 8454143
              Pen.Style = psClear
              mmHeight = 5025
              mmLeft = 529
              mmTop = 6350
              mmWidth = 284163
              BandType = 4
              LayerName = Foreground2
            end
            object ppLabel7: TppLabel
              DesignLayer = ppDesignLayer3
              UserName = 'LblItem1'
              Border.mmPadding = 0
              Caption = 'Descri'#231#227'o Servi'#231'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
              FormFieldSettings.FormFieldType = fftNone
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 4233
              mmLeft = 24606
              mmTop = 6881
              mmWidth = 133615
              BandType = 4
              LayerName = Foreground2
            end
            object ppLabel10: TppLabel
              DesignLayer = ppDesignLayer3
              UserName = 'LBLQtde1'
              Border.mmPadding = 0
              Caption = 'Valor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
              FormFieldSettings.FormFieldType = fftNone
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 4233
              mmLeft = 258763
              mmTop = 6881
              mmWidth = 24871
              BandType = 4
              LayerName = Foreground2
            end
            object ppLabel24: TppLabel
              DesignLayer = ppDesignLayer3
              UserName = 'LblProduto1'
              Border.mmPadding = 0
              Caption = 'Responsavel'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
              FormFieldSettings.FormFieldType = fftNone
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 4233
              mmLeft = 159279
              mmTop = 6881
              mmWidth = 98939
              BandType = 4
              LayerName = Foreground2
            end
            object ppLabel8: TppLabel
              DesignLayer = ppDesignLayer3
              UserName = 'Label8'
              Border.mmPadding = 0
              Caption = 'Data'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
              FormFieldSettings.FormFieldType = fftNone
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 4233
              mmLeft = 1852
              mmTop = 6881
              mmWidth = 21167
              BandType = 4
              LayerName = Foreground2
            end
            object ppShape7: TppShape
              DesignLayer = ppDesignLayer3
              UserName = 'Shape7'
              Brush.Color = 14155775
              Pen.Color = 8454143
              Pen.Style = psClear
              mmHeight = 5555
              mmLeft = 529
              mmTop = 265
              mmWidth = 284163
              BandType = 4
              LayerName = Foreground2
            end
            object ppLabel9: TppLabel
              DesignLayer = ppDesignLayer3
              UserName = 'Label9'
              Border.mmPadding = 0
              Caption = 'Tipo :'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
              FormFieldSettings.FormFieldType = fftNone
              Transparent = True
              mmHeight = 4233
              mmLeft = 1588
              mmTop = 794
              mmWidth = 9525
              BandType = 4
              LayerName = Foreground2
            end
            object ppLabel25: TppLabel
              DesignLayer = ppDesignLayer3
              UserName = 'Label25'
              Border.mmPadding = 0
              Caption = 'Servi'#231'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
              FormFieldSettings.FormFieldType = fftNone
              Transparent = True
              mmHeight = 4233
              mmLeft = 12171
              mmTop = 794
              mmWidth = 11112
              BandType = 4
              LayerName = Foreground2
            end
          end
          object ppFooterBand3: TppFooterBand
            Visible = False
            Background.Brush.Style = bsClear
            Border.mmPadding = 0
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppDesignLayers3: TppDesignLayers
            object ppDesignLayer3: TppDesignLayer
              UserName = 'Foreground2'
              LayerType = ltBanded
              Index = 0
            end
          end
        end
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'tipostr'
      DataPipeline = ppDBRelRev
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      KeepTogether = True
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDBRelRev'
      NewFile = False
      object ppGroupHeaderBand2: TppGroupHeaderBand
        BeforePrint = ppGroupHeaderBand2BeforePrint
        Background.Brush.Style = bsClear
        Border.mmPadding = 0
        mmBottomOffset = 0
        mmHeight = 12700
        mmPrintPosition = 0
        object ppShape40: TppShape
          DesignLayer = ppDesignLayer1
          UserName = 'Shape40'
          Brush.Color = 14155775
          Pen.Color = 8454143
          Pen.Style = psClear
          mmHeight = 6350
          mmLeft = 529
          mmTop = 6350
          mmWidth = 284163
          BandType = 3
          GroupNo = 0
          LayerName = Foreground
        end
        object ppLblItem: TppLabel
          DesignLayer = ppDesignLayer1
          UserName = 'LblItem'
          Border.mmPadding = 0
          Caption = 'Item'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
          FormFieldSettings.FormFieldType = fftNone
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 529
          mmTop = 7144
          mmWidth = 173833
          BandType = 3
          GroupNo = 0
          LayerName = Foreground
        end
        object ppLblObs: TppLabel
          DesignLayer = ppDesignLayer1
          UserName = 'LblObs'
          Border.mmPadding = 0
          Caption = 'Observa'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
          FormFieldSettings.FormFieldType = fftNone
          TextAlignment = taCentered
          Transparent = True
          Visible = False
          mmHeight = 4233
          mmLeft = 175418
          mmTop = 7144
          mmWidth = 89959
          BandType = 3
          GroupNo = 0
          LayerName = Foreground
        end
        object ppLblCodFab: TppLabel
          DesignLayer = ppDesignLayer1
          UserName = 'LblCodFab'
          Border.mmPadding = 0
          Caption = 'Cod. Fabricante'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
          FormFieldSettings.FormFieldType = fftNone
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 222250
          mmTop = 7143
          mmWidth = 41275
          BandType = 3
          GroupNo = 0
          LayerName = Foreground
        end
        object ppLBLQtde: TppLabel
          DesignLayer = ppDesignLayer1
          UserName = 'LBLQtde'
          Border.mmPadding = 0
          Caption = 'Qtde.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
          FormFieldSettings.FormFieldType = fftNone
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 264848
          mmTop = 7147
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
          LayerName = Foreground
        end
        object ppShape5: TppShape
          DesignLayer = ppDesignLayer1
          UserName = 'Shape402'
          Brush.Color = 14155775
          Pen.Color = 8454143
          Pen.Style = psClear
          mmHeight = 5555
          mmLeft = 529
          mmTop = 264
          mmWidth = 284163
          BandType = 3
          GroupNo = 0
          LayerName = Foreground
        end
        object ppLabel18: TppLabel
          DesignLayer = ppDesignLayer1
          UserName = 'Label18'
          Border.mmPadding = 0
          Caption = 'Tipo :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
          FormFieldSettings.FormFieldType = fftNone
          Transparent = True
          mmHeight = 4233
          mmLeft = 1588
          mmTop = 794
          mmWidth = 9525
          BandType = 3
          GroupNo = 0
          LayerName = Foreground
        end
        object ppDBText15: TppDBText
          DesignLayer = ppDesignLayer1
          UserName = 'DBText15'
          Border.mmPadding = 0
          DataField = 'tipostr'
          DataPipeline = ppDBRelRev
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDBRelRev'
          mmHeight = 4763
          mmLeft = 11378
          mmTop = 794
          mmWidth = 270669
          BandType = 3
          GroupNo = 0
          LayerName = Foreground
        end
        object ppLblProduto: TppLabel
          DesignLayer = ppDesignLayer1
          UserName = 'LblProduto'
          Border.mmPadding = 0
          Caption = 'Produto Utilizado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
          FormFieldSettings.FormFieldType = fftNone
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 166159
          mmTop = 7143
          mmWidth = 55298
          BandType = 3
          GroupNo = 0
          LayerName = Foreground
        end
        object ppLblCheck: TppLabel
          DesignLayer = ppDesignLayer1
          UserName = 'Label102'
          Border.mmPadding = 0
          Caption = 'Check'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
          FormFieldSettings.FormFieldType = fftNone
          TextAlignment = taCentered
          Transparent = True
          Visible = False
          mmHeight = 4233
          mmLeft = 266433
          mmTop = 7144
          mmWidth = 15610
          BandType = 3
          GroupNo = 0
          LayerName = Foreground
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        Background.Brush.Style = bsClear
        Border.mmPadding = 0
        PrintHeight = phDynamic
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
      end
    end
    object ppDesignLayers1: TppDesignLayers
      object ppDesignLayer1: TppDesignLayer
        UserName = 'Foreground'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object qryRelManutencao: TFDQuery
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select'
      ' coalesce(rp.nome,'#39'CORRETIVA'#39') PlanoRevisao,'
      ' r.id NumeroRevisao,'
      ' u.nome responsavel,'
      ' r.datainicio,'
      ' r.datafim,'
      ' m.prefixo maquina,'
      ' r.horimetro,'
      ' ri.Item,'
      ' p.nome Produto,'
      ' p.codigofabricante,'
      ' RI.qtde,'
      ' cast(case '
      ' when RI.tipo =0 then '#39'MANUTEN'#199#195'O'#39
      ' when RI.tipo =1 then '#39'LUBRIFICA'#199#195'O'#39
      ' when RI.tipo =2 then '#39'VERIFICA'#199#195'O'#39
      'end as varchar(13)) tipoStr,'
      'RI.OBSERVACAO'
      'from revisaomaquinaitens ri'
      'join revisaomaquina r on r.id=ri.idrevisao'
      'LEFT join planorevisao rp on rp.id=r.idplanorevisao'
      'join maquinaveiculo m on m.id=r.idmaquina'
      'join usuario u on u.id=r.idusuario'
      'left join produtos p on p.id=ri.idproduto')
    Left = 760
    Top = 32
    object qryRelManutencaoplanorevisao: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'planorevisao'
      Origin = 'planorevisao'
      ReadOnly = True
      Size = 8190
    end
    object qryRelManutencaonumerorevisao: TIntegerField
      FieldName = 'numerorevisao'
      Origin = 'numerorevisao'
    end
    object qryRelManutencaoresponsavel: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'responsavel'
      Origin = 'responsavel'
      Size = 100
    end
    object qryRelManutencaodatainicio: TDateField
      FieldName = 'datainicio'
      Origin = 'datainicio'
    end
    object qryRelManutencaodatafim: TDateField
      FieldName = 'datafim'
      Origin = 'datafim'
    end
    object qryRelManutencaomaquina: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'maquina'
      Origin = 'maquina'
    end
    object qryRelManutencaohorimetro: TBCDField
      FieldName = 'horimetro'
      Origin = 'horimetro'
      Precision = 15
      Size = 2
    end
    object qryRelManutencaoitem: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'item'
      Origin = 'item'
      Size = 100
    end
    object qryRelManutencaoproduto: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'produto'
      Origin = 'produto'
      Size = 50
    end
    object qryRelManutencaocodigofabricante: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'codigofabricante'
      Origin = 'codigofabricante'
      Size = 30
    end
    object qryRelManutencaotipostr: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'tipostr'
      Origin = 'tipostr'
      ReadOnly = True
      Size = 13
    end
    object qryRelManutencaoobservacao: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'observacao'
      Origin = 'observacao'
      Size = 100
    end
    object qryRelManutencaoqtde: TBCDField
      FieldName = 'qtde'
      Precision = 10
      Size = 3
    end
  end
  object dsRelPlanoManu: TDataSource
    DataSet = qryRelPlanoManu
    Left = 648
    Top = 88
  end
  object ppDBRelPlanoManu: TppDBPipeline
    DataSource = dsRelPlanoManu
    UserName = 'ppDBRelPlanoManu'
    Left = 648
    Top = 136
  end
  object ppReportRelPlanoManu: TppReport
    AutoStop = False
    DataPipeline = ppDBRelPlanoManu
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    ThumbnailSettings.PageHighlight.Width = 3
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.AllowExtract = True
    PDFSettings.EncryptSettings.AllowAssemble = True
    PDFSettings.EncryptSettings.AllowQualityPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.EncryptSettings.KeyLength = kl40Bit
    PDFSettings.EncryptSettings.EncryptionType = etRC4
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    PDFSettings.PDFAFormat = pafNone
    PreviewFormSettings.PageBorder.mmPadding = 0
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    XLSSettings.WorksheetName = 'Report'
    Left = 648
    Top = 184
    Version = '19.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBRelPlanoManu'
    object ppHeaderBand2: TppHeaderBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 39952
      mmPrintPosition = 0
      object ppShape2: TppShape
        DesignLayer = ppDesignLayer2
        UserName = 'Shape1'
        mmHeight = 12965
        mmLeft = 527
        mmTop = 26986
        mmWidth = 283898
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel12: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label32'
        Border.mmPadding = 0
        Caption = 'Plano de Revis'#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 6350
        mmLeft = 1852
        mmTop = 20108
        mmWidth = 46567
        BandType = 0
        LayerName = Foreground1
      end
      object ppImage1: TppImage
        DesignLayer = ppDesignLayer2
        UserName = 'Image4'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = False
        Border.mmPadding = 0
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000600000
          00600806000000E29877380000000467414D410000B18F0BFC61050000000662
          4B474400FF00FF00FFA0BDA793000000097048597300000EC300000EC301C76F
          A8640000000774494D4507E40A02092C31C6867305000044D74944415478DAE5
          BD07BC1445F63D7EABBA7BF2BC79399273CE282A2A82A228A8604082987358D7
          ACAB28E2EEEA06B3AB6B5CB32059415182A8086220E7CCCB695E987993BABBEA
          7F6ADEA0E882A28BEB7E7FFFF253BE61A6E33DF79E7B6E757537A3FFF5967531
          9DF0E893F4C993B574E2AD0E727B0C0ADB440D719B12826301469C49F23B39F9
          754976DCA2FA86103EBBE9F3D81AB2AF1AF55B9FC18F36F65B1FC081EDA86777
          929DED2647DC24DBE5A6180EAFD19614B2085D52222A886ED94032743295EE0A
          B14FAAB19264D4C6CDE998DE1E620C483C564C2CC3209FC6286070F26A445EE0
          E4B21354AB2528CBF6D0E7E7E5FDD6A7FA6DFBCD0138E6F53DF4554E2BEADD58
          490DC4296832AA6D12744E0BC3D81E9519614B14446D2AB2A42CB2842CD0359E
          1FB7A51B9D0B993A099C858393746A3C610B590DDB57689C95BB3556E2E2549A
          EB60B59F2E8F47BC3D75CA71304AD719154A93C29A4EA15015ADBEB0C7FFBF00
          18F0462925DC0E720A41D5A093F204D145B952FBB89115C2DBBB27040D4C08D9
          174EDF09015008BF4F83AD35FACEE0C0834C49D24E9D0487F71BF8A80314C69A
          CF4AC2F12300A30A7D97C1D93A27675F7A345A5BE4E67B3E2B372345693AE53A
          88D66B2E3A3A1EA6E5E717FCBF0D40FFB7F6D1D7CE96D4D9AAA26AD0CA9D2D35
          FE6C99DD3A64D36078F4F084A44196A0D630AC32668C33AA8411F7688CA1D35E
          F4727C5FEDD258D8B6ED88698B3830B10CCE0D4486DB92CC670A9989B32A0070
          AD10316D015E1B8052045CD2D431C0F92B01C65AA48CC55E9D2F6EE5629BBE0E
          D9D1C8843D3464410BCAAD277A6742D1FF5B00F47FBB98BEDEDE82DA77AAA2BD
          71A26E1EF2579B744CC496E7C4049DA20C85C544CAC85FC1FA5F188C56C348BB
          021AD56CEA1B6BE25F78A58F4B65C06420A8F47B75970C7DFAEEC6E3F06F0749
          198D59A2DEAFF34617938DBDD2B45863C494EBA3C2DF68532B53B25EE8831036
          470929BB601D3014AB03452DCE30D8ADFBA2B477682E9169376FBFB86784F6B4
          6DFB7F1B80016F15D336EEA13C66D18E18A3CE2E99596BD1E94D969C046F1F2C
          A58411680F8CBD04C6FEC0CBE8CBCE0EB3E4D398D372239FD65B8C5EEA21F83F
          8A99AFDE64E9A0A46CAC9701CF0FB874CD0FEF2E0A26E4EFC047E9381113B414
          55B483CF419D5339786907F2F026EC6443A6CEB68DCEE2C169E5717F8DCD7A22
          74860390D3710CDE02177F0851555FE8921F446C8501B71497016F5A3E26F7FF
          1E0003DFDA4C0D3C939C30E29E04A3D62EE6AF4CC83361F8ABE2828E838F5930
          FA0A9CF47478F58763FD895D2F35BA4413BCEFA474E9D816A52218A23BBCB50F
          8CDE03B6002D51060CEC50FC0E0F06D31062898C84649D6473403437F9DD59B1
          5407C821444E89CED93700FA6328A44FC7E469BB3EACB6FCF5964C4F73300421
          81BAD80012628B47D7B6B92CB3BA81E9322835EA136BA4F72FFC75A2E18803D0
          775A29AD5E5748453DAA68889FB4C58D342464CB9B63E078FC6CC3001F4135BE
          94CEC592625B6F7000A43E1E72EE89531718FD2418FD24F0B7A208C536F062DA
          0625B94D677217BE2B777116D4A41D69889A618FDB99D768B3A92A51E34CDCF8
          EBC13A6930A657510C7209B6FEFD530452121B2E736A490798936EB045DBEBED
          CA021FA73C17CFB36CE98F083ACBC3E55C5BB030D35885A23E80482BCE3AF2D1
          70C40018B91074D36890132EB81944D0C2295BD599F43B18F532786C9AA2190F
          A7A70A0CF151A9AD37D54719B5F5D905E0E7E171C1CE81D17A62338D30F84A9D
          68994BA3D5012E8BB736B8C22EAF9974F10812C64545262F673E674DCCD6A309
          5B87C1BC004724889928D0DC909F19315BE4D8C45A639B5D90EB7B0098CEB6A0
          0250964B1E70CC5A32812729EA1DBFCEA6EFABB5B6918D9AA235F734D87C886D
          0B8F57A70D3AC93D16F1D84EC4DC602D46F3CF6DF9BF0540DFD7765285112017
          B3E9827C9BBF58AA8D40E1747F5CC801F0B6ED30FC6339BA7CABCAD6EA1AEA20
          737278FB064B5E00B9799E20A96AA54F910CE7A6696CE5EEA0ABD21788536882
          45DD661A3990A32D61C0D6305E212828035EED01B73BF059EE57A5888AAF76CC
          30DE2E380B16E29C9A20A5C2584154321AD091B9AB13941FB625E4AD3C1EDC35
          04B4D6DD96CCBB1F0C052E80D80520DEC830F82BBB43F6CE4BBA78F98EBA785A
          554C4CC2B12D638CD72225956468CDA1B97464F6FF0600BDA795D0DA501A1578
          6394A9CBB4B2B8FC1D3CF11678BD0707FE869FCBBF54588ECD0E6E53A1431421
          B15E0CC34FC4C9270C26A7A34A9D59D679E396B42D3DA9A3573AEB12AC235241
          3FFCDE1116F682314238CC32987B9F10B2C289649930ADB083B3B8CF60021143
          7E46E6CA8816879A491A27033CE7245514086A4218A88A7AE7B90176CAFB8D45
          15612B5E65B13E28AACF4ED8741A28AF9D48250E05040ABA2D08A967729DFCB5
          7D5159F746278DDD53224F428197E777B0E59AA4728746A6B29C1166B4686CD6
          6F0740AFE9A5D4C72B686EBD5319BF4D7542FE396ACB0B60947D4874535BE9D6
          EBA09B18D485A734C6CE43457B234ED5053BBDECE7E2ED52E12821C89A363EBB
          0D34FCF1F8AD173A6A61B9198EB6C6C7C5EE8DE7AD691AF7E140636B84650613
          225B10CB8D58228065325C3A57D1C01342C413960CB90D5E8F13AA4933780DC2
          AAF69AD6BED0A5ABEB456B9F469D029A271C17C7029B3DA8D432D299B5617D23
          B5095A722468F24238450F91B207F66D830297040CFEC7D2B139CB685D888EDF
          17CFAA49D0A5D8D42C14D3E55C63910074808E55E68E2CFCEF03D06B66256518
          923EA9E394EF907DEB4DF9042867300EEE531498B757C51C2B099454E4163D1B
          2CBA07613F085C3A3DA0D333A53163D7C945826FABA71EA0845361F43C187403
          80F9F4AACCC8EE95669AB12E2CDA4785EC8F02AD5F4A09B505156561592F3E1B
          499F65CD27A0B828591B30B2F1EFA8C621C2884AA0F3B7C0A35783A2BE06289B
          37EF8DD78EEAE1F6418DA555C7EC5EA0C96370BC1F629D4A38CFD900E24A9C43
          C7FD891BBF55221A1ECF77F17F6C6F920D2740A155587C0CF24EF8AA76FA826F
          1A2C6122846AA3448BCFFE65E34BBF0880EEB3AAC88F4CB9B20A99CDC74FA84B
          887F805FBB43DDBC99A189BB22A4EFEBEB97C69A108DC749DD05F39440553CF8
          77D78E65179D73BCBC7A598DBEB4569E1736655F68CAC55E697D7A675B3D76DF
          3ED60D51725A4CC8534C417D414539CAB2004725E70AF432787C99CE5810B540
          1D3C39AA7E54F214D493AEA42A6A825C21590B7C2E00508A1F38D66BC2EF5BA0
          7A967934F67EAE93ADCA37447C6358F643449D86DF3544C6BB52C8100AC46B54
          44C0AE0175AE00D2F6E86C4EA6C1EF6EB4E5B68E5EE68523B4C732C777F3D13F
          D736084B0D16568DFF2F01D06B4619A581043FAB9694EF61C3EA4CF94F55C9BA
          357A1227757F83D0EAE1E5995509BA07617D3E78FE5F599A7C744F8C6ACF69E9
          34AAE2D4D9B2457AD416DB9DD2ACD73487B6332287A22A1E8F1A61980D03E2B0
          A230D86624C62FF0F70B27639B4009A5016E371CEFB7A34FBF0AA1382C53917C
          B3EB0B9C4689A0B2719C9DB53AEEA811BA3F2E595E027904D13310C7310880F6
          5680C0D83144C597904B6F6739D89CEB3323157FAD720E948C8DC656EA419D33
          714E9D2012EE83330CDC5F5600A06F10453747845CD6CDAF79A2966883A3E8AE
          4B5A06A7A88A4946DEF22ADA7063B75F0F80DE334AA81B32DEDBE53AE5BBE804
          54A12FC1F86DC0B70FB772883F96595A041CD9AED6A447949647357BCF5981D8
          ACCF626ED12EDD703525C40817B1E52E1446D5E096BD711A11B6E4D5719B4E94
          6A3093D14624D70588A4F7033A5BBFFD7C778DF15A9494F270AB6165B260739B
          7C0E0725622635A166B56C8B5C4E83BC0E9DA208050B8937C20CB0337602420A
          C35106B6D57CE531D12162C993907CCF041847637F6EEC6B1328E6953C277FB5
          952351BB31A29D0EFA3919A02F72E258CAE3F256A8A78BA198544E5794B4D76F
          B05B6BBF689A71D1E800FFACDA1E02309B38B162D05E59960F323C1CA10F461F
          7E4E386C00FACE2AA6D56559E4CB08531A97FD83A67C15B4D3C5AFB1873BB8EC
          0776C4B5985FA35E75163DA34624FD9ABCB1CAD4BFEAE08CD3B91D03B43E1867
          0968F6A16932F2C43E7114C2F616C8FA51E00FDD60EC5397265F0D68B470EF86
          9CB28C6E3594012B0490432A0305945DB18722AB04ED78BAFD619FD8A0377640
          B0FAC961C7A99EB9A8169C5286DAA387DF4EAB49B041A8BA27AAFD43ADA53B39
          5B0DC33ED6C7A74DDF15353363925FA60A6E9F26DFA84AB0918DA6BC0F5A215B
          851BF2544DBA43BBADF4949C57B21756CB02273B1B24186AED63CBABC98815C4
          A314DDE3A1A537058E1C00C73FB79BB6A6F909F50EB9B96C571997AF23591DE3
          D1E8B1364EF187E2841681E4EC0FA33E8783AC8221AFAF977CE73146842AC941
          ADE0BEAB20D9B274995965D2B54D16DDA0A8460D4780939F0645CDDF616AF52D
          0C9BB2459CA25C230D0B6DBAFCC894FF597FDB4E6D0A9D546486688B3B93AA4C
          4E47A5D9C6FAB0360811780D92FDD958CCC0B1CCCA34B4A9E332E29BDFACD3CF
          85E71F83687C1935459BBA847C1480B55519DF40351E30D82DD5E372FFC55E29
          A79E01E3443857DBAD4DF4AF816E93601B5A77418B23074087E9956482E360C7
          F492A8780E7C7D1E0EECF522275D5F63B106A88CDEE0CD97900F8B3335715D93
          D44AEB1279D4D907F38374D7075145F9A91F78F541C8D411A09A5200F624BCFC
          E5602251D59547E88AD0625039B6F05F18A075C904BD9B760C7DC90AA9C8EF72
          ED0CDB8A0AEF80E18EC6F1EE0CE8FCFE29ED8C371FDA9BE88FA47E112274861A
          24AD8ACB670042D7140835A89EAF0BC6D8F481D9DC1BB64407E48C9605567481
          6918C2C049AE18F3D3D7177EF26C7BBD530EE685C7A4333EBB52DE17B2C46424
          A465D986BC3026B56224C70EC805AFC272F519BABC222A59692D28B39D6E2A3D
          4D933B3076CB16710E8CFF1024677B70E60250D594AAB5677D79EDB3ABF8B6A3
          4E66BFD96539ECD951B943CE5FB75B7479617DAB2A47C6EFE13C57421941E5B1
          C75A3BD99FC2C2CE894B7E1324ED8788DABA9AB87C1E79A49B0201E7529C6EF0
          4BB0FC62502ED4170DF0217739C82E45740B378BD3B2316D7E390083A655D08A
          7E71953629DB416741EBBF0A1F0DA2E21C6B115B95ED60396551F1320E2C3D4B
          A74992F35DAD5C44D0FD046F204823636DD8BE1A1CFA00B8D609CA7A1CCBFD75
          48A0297862E5A7E3BA76ED3ACEE17088DFCAFE073604AA686C8AB9FEB95B98D3
          4587EE38DEF65E9DBF5EE864B730263554F7B741922E865A0A55C5C4CB888476
          2A27207FACCB7270E82FDA94E5D4F21B13F6F80CB29E09D9140D21EF544CFAF1
          8B3B3F0A408777AA08CA0148CBB615719A05F5D00D45D6D57596F6F27159D2B1
          A141FC1D897818387F6282B16F5ABB791E8AAD26EC3C8C2AD6B13DC26E0395DF
          8B036D8052BAAB97D37C75BB69587B46A7D1FB0B3F7CF0A4934EFA83DBED26D3
          34712A927EABA6AE613A0C07D5D6D6D2FCB973A6DE1A387F5EDC349F529484BC
          F06E9E43BBD6E0B61516EC4E78F67B319B5CB5508048CC39CA80A0E679F90E7E
          C9AE2F83C16EC766B6407D33C4B0AD991E9D47335C067D72E6A1C78D0E09801A
          66B0B941AD3D9AFE59D07C141C793D0EE685EE1E79FD174116CFF4D215118B26
          A3C0BA3ECEF4B9394E6A63DBE25A3F174FF6CA32CA3E28B7EE8007DCAF0A2850
          CE0DC1C6BCB9AD03E514D39CB4F76C1F2D5CB870CAB061C3262FD9F115CDD9F8
          D94FF9C2AFD824B975275D71EC5954E4CAA459B3664E5D913970F222BB45A760
          423CA58A429CF7FC42977E8564B601E3DF0EAF7FA5C194FDEB4CF1A82519D299
          524C6CEA839DB5294F170B3712B21228BBD3746D0F6858D886462B4ECF387C00
          EE07BFFDE5AD203161A9691D23C0F1D339126CB6416725886FD7A1781A12721A
          BCE195C697F3A676BCAECADF64D21FC08B4BCBC6E52DCC7AB3EAC68684F80B1C
          AB0A45D955354DFAFB9DFD7142B4D0796B9FA4071E782009C0D0A14327DFB3E8
          057AFCEB7928AAF4FFA2CD53D126D590A9008D18F4C2A89BE9F4360369060028
          2A2C9C3C297434E436B5A94A886701C2A95E8D4F2F72B2AB2C265B837E2EF771
          7AA23C4137C0C96E501C0AD55C9B6EB0093A670B8BDC3CB73E212FCCD6E4B338
          E7A608227CEBB883ABA28302A0AADDB0D0948249DF1715EFA0501A0AEAB9AA5E
          F017BAFBC8BFA749BCAEC6630A0C397EE75B91FA82F1BE1B9894B1B226E7F3D9
          9EF8B90D26BD007D1FC73A570613CEB93D3D4D50519CB68C2BA2DB6FBF9DA64E
          9D4A1F7CF0413202EE59FC223DF6CD7BBF3200525D464B1ABB99B70DCA76F9A8
          953F877AE6B4A69E79EDE8CCEE83C96D6B347BF6ECA985006054C310CAE451F2
          3089C252FE0B7474BC4FE74F1EE5E3B7EE33C5513078B549BCA1346ACF88D8EA
          2A1FD415A74FF29DECBCB2845DD5C96BB4C53A7D34CB7C17A2C5F24B9B3E1BDB
          EAA70118B254D2A9B493EEDA9346594E7929907C1ED9FEC3964E36765B936CCC
          72B1AB9117EE04AD5C6032BED2ABD330CB96437328F1409039BA43254C87742B
          848AB8A1BE26EFC52EB92564E3A4B78F6FDEF90F01B817003C7A2401483AB768
          F672189C314E3ECD41F99E746A979E4FBD61EC5EF9EDA86B6E6B2A4ACBA10CAF
          1F92D22006AEACAEAEFE168091B5A388851B292D23AAE611F5A98A8BB790033B
          40FFDF140CD3D3E9698C4C94FB693A1B5EA37E93C00B7BC579DFDD10150FF5CC
          36B2A29638D620FB9308B186022B4E2BC7B5FE690006CE2AA76A9BAB90CA2D8D
          C87713827A42F59C67139BEFD7A95D4D42CC3388663584F5C9ED72647ECC1277
          E9249E74E95A2D6A843763B63CCDC3D99FFB7AEDC9C5716669407EE784EFAE20
          1D510064EA7FC9E1D066A36B4CA34C87870A7D59D43DBB25F5C86D4B7D0ADA53
          DBCC222A086491D77063575A6AFDE6D4AF46F338E754535D43B366CF4A025057
          57474FB84FA6CE7E83DEA8B0099E3D0A89F715182C9E69B0F39B047DDAD5CB68
          588EC69FD96B3D8C9C70ABDA9683D1EE4C071BA571B6D1A3B3DED1841850D22D
          F7C551ABD65234AF88169D99F3E3004C5BB189C66EC982F7D3E5CAFB9D1ACDEA
          E2E513BF79CE88062626FE0C4E3B2D5BA751C5358992A23CF74D528AAAB252F6
          667ABEBCB7D1140FE00016E41B0235020F820FA965F92E5A71F3B1FF2100F2BB
          C395F25BEF56CDCD75CA76A751DB402E75CB6E4DBDF2DA5237F476998594E50D
          90C7E16C1EB756AB50F3B8F5C10A0FA5846A6A00C0ACEF0098346912F59D598D
          1F25AD3C4663054BCCBB61E8079184971438D858A8A01A754508CEDAB63226DE
          456EE8AE4A49AFC61E9DD256BFE5E54AE934A5ECAD71AA8D4ABEE3F6410EBAA6
          28EDD0000C9C53010DCF558191BEAB49CC03F70F04DAE75A8CE67B34D93D18A7
          79D8F9DF6244CFE439791F1456176671714FB5CD7AD7C6E55C9C9D99A1D39898
          64AB2CAE515E2444BB2F6FF7BD1DFE6C0094A153DEADAE59051C2ECA73A75327
          18B83BF8BB6F4147EA98D3925A028034B7971C9A714070C8C31657870240B56E
          33AA289E9C4844197B22E24D50F069A09A3B1BB63A1F3EA67784560475CAF2D1
          F5A8931E032B691027A559061B899A614D9A830D457EE47B2372517CD21C6CED
          AA4303D065662D95462D82843A13067DC740C5DBC645E76C5E2942E9FDF9C309
          2463142667F4C8E635AB6AE4644DCA8F5B78D98A75F5E2F5A82DCF8514BBB371
          77DAC37D3BD7522C66D1E68BFE7D2CE747019007D0099A0183A73BBCD4065CDD
          39AB25F5C96F4FDDF3DA50C7EC1694ED4D27BFD30DEAD05206FFA575844C01C0
          0F09C0A079B5B4312C0954AB54E1F128C466E1EB088ACA9126B1F501645983B1
          BC7D11FBDD882D072AA3FA34FA5BE3C4C6DB2E5B5EA8ADAC8A8E8323AD800BED
          8492A245A3BEA3A16F013865612505A30C9596A6CF2DB35E6AB2E48550315758
          8CBF802AB81D426C81039E1F61FCF17C071D05EF3F7BB0237EEFB2B8F32CC8D4
          B734465FE71B74369251958FD9B46DDCC12BC01F02F087A40C45F0804A3C4896
          D92E3FB54FCFA3AE396D6070244B7879DB2CD089C74F2E144BC896CD6693F2FB
          36FC996544F3FA2CF99F25C26A72290583916F93F08100A876ECAC62B27517DD
          DDC5C92EFE32FA970653DC0AAA79E6343FDDB0232EEDD52146D91E763D6CF138
          DC87838A77E438E8B4D2E2C8CE1E1DFCC71A4C56AF1EBD63FB90B91DE8E303A6
          B77C7BD883E795D2BE98F239EA5C1E158B717851249E93CBE3726F9AC16E44D8
          5D03C447948CFF7C4FD1B4C1F742D67DDACAA7AD5A576FCD4671320CEAE0E2A0
          295FA7DFE751C13DDBA8FC96CE8704E0C03AE09F2BE7D0927DEBA97F5127EA01
          EF5606CF4FCBA27437D489A6A7683F75CD91FD024B1FB43138A4890ABC929A62
          DF50A8693965A49D4689584F0030EBA000A8D6737635A1BE519CDFA93426DF87
          B2F5671974068AB12F73DC9CC0102D204B3F5403764A11C1816F20AE3DDD318D
          1735C6ED716E3BF1B48BB3A8088769D5C59DBF0FC0C75FBF4B43D60DA46C141B
          75283E50FD3DDB3851BFA6DF3CE9DB1EB2DFE552AE6F8CB96F6C9F617686D2B9
          B240B7EF2E4EF053A00C66E08056B672D2D9484AF56908D375171CFA82C40F23
          C02291E45F9FCB935422FB95C9916E523627704B842816DF4AE1C867D414FD02
          52722FA949D605D9F79195380600CC38240027CCDF469AEDA7A5F325659CA04D
          41144C869D1E0F3FEFB9E9D8DB132D41C9DAC646FBEA3A93EE50E7004C3E6CEB
          A1312DFDCE5845D4EA2F84AC04A3ECF5D6D5D0579776F93E007DE65451A1873B
          3EA9B2DE441A382BC3C1CEB589E622F11C0735F4162ABF4BA2922DCE74F2AB84
          108DF7F6764FBBF9ABE81B114B5C10D0D9E575367B9126E51E5C621C0280934F
          3E79B21A0BFAB5DA7E9A91D2A284590E837F05C37F42B1C40644405D72190E4A
          53EC9E9F752F0018F4A300A8D66F56052A30A666CA752B8FC985D8859DE36027
          B7F6F10458412F8EC9828A987C0F54AC6E4308663BD8E9388A2F020E360200C4
          21509664E982D68EC9FF0E8091EF15D3E6B853FDA35D7193588A8DC60B5D7CE8
          9EB05D92E1E2F7437A8E68E164A7B95DBA198CD9530D928F2488A55746C522AC
          530BAA1A0EDE2BC9B2E3B46642AB1F35CA7F0B00657CDB0E5114DE1E82B747A2
          2BC8B48A61EC443271B36FA793AA195EDA610370D4F36B88E716D0A82283FF65
          6BE29F61535E8E62ECC6BA1DF1278FEBEF3DD9B4E48E8D61FBA5269B4E52C64D
          33E88E065BFBCBE02C16A88FCBE16EB2DF87B809CB5C412B8E2D6C06E0F80541
          5A5F6F2AFD3A1AC97606786ADAB842EDC2D561726D69B4DF05DADF3458746B07
          BF3630618B33F7DDE2BD37F3E1F02D0D09F93754C27F6FBC45BBF5A8A712B4EA
          DCC2FF8908508E1F896DA0EABA97E0ED6B21AA1A9A4F94352B26F68363844A3C
          6C0054EB39BB8ACA6249597A7A4554CC46C2FD18B5D218AF8367B47052C3C21A
          FBA6FA8478405D5780A25CD0D34BE73087A13724EC93BD241643A6862A0BF268
          D720D67C5CA72CA8A48FD62428BBADE3CF7571792712EAEFA2929E4068754799
          FD1EE4E5EF6292E6653AF8D538DADAEE0136F7E36AFB5DD4092720C446C5052D
          6AE114B4FEDC9FBE02F4DF010052ACF679AA6D7836E5EDA979D287708E9F0B80
          1A2D8842B5698CE56C6FB43E3405B5CC36D8D0422F8F444C794AD896DB4143B3
          41433E80B32FDF49C34236ED28706B67E2D81AEB2DF6F171E98C669C9A9D8A80
          F935A87CB96B4985392B628B21D90E3E02997C19901A0F5D7B7FAE939FDA2353
          2FDE5067FD09DFBD88A28443297DCC8955B476F353403F55AE7884D64F6C4D3F
          D58E0C00C9E9583FFA7B75F015AAA97FAA39B1FF24603F0F00D586BF1FA40F47
          4CA18C37EF7EA231216F80E2B9B6BD4F7BBB3A2EEF032BBC8882EDED884DDD10
          73F10C83CE0718F35A79B58EC848C6BA72BEE9F496162D1895DF0C40AF39EA76
          432ADA11B23FB60469456E3664779DD897EEE37FB3A5ECD3CFCF4756DA2C1BEA
          E7B68E6E79E78626764E7554BCE6D1D90B2B8FF65F79C9DA90FCE2DCC39B98F4
          CB0190C9EBC5CABBA5154339A08351F494777F7F39359DAABE712155D44E81D3
          5BF453D2F5970070DCFB8DB4B636AA2E5D9E571DB3A7B935F6FAB545ECD26935
          6CB293C9051571FA7D8325CE57C70770EE8933ED8F9DBCD4216689D3F399F58C
          CE99B9643472C0CDC59266AEAC5687D8BF2C2296A882AAAB8F8DEC9CAE5B0BCA
          CC39285076D5D5D3F5FD5A6885095B0ED83066C1BCACB74E7B1409E5A64C07BB
          AAC694CFC949793FC9FDBF0480A42095CDD421854556A882AC3D9F915DBE961C
          032E264776A78398B659F93445D75149E52DEA62DCB7C5DB9104E0C49925542C
          93C2A56B49C45EAAEE65E8E4A69342C4C73021428D36EB0C893E551D0DAAE737
          2ECAB5277D1577386396ECEB606C0D67145975760EB1E1736AE92BC40A92C5E8
          8A983DD3C5F9CBE13F8ACBFA3FACE76C0F89C5A8B29F8F09F6E4B1D95A47F059
          14A577F5F26A731EA26170BE8B9F6A49FAAC9396A065E71DDE348CC303402675
          7B52BA5B71B282BBC8DAFD31C9DDCB88D7EE201168458E514F9011687108DF66
          144FC04015379165ED4E46CB9106A0FB9419E4EC7DA29A1D11D8D0602D447DD6
          29CF41839D3ACFB585E86B112FAB88893714A320597FDED14D23DC1E3D511713
          97B9189B0D472F5B3D1A009C322F484BEA1284047B5D306E3F9566F0291149F7
          B7F330202BD40CB51BE181F37A043475A13A5C1EA7D8CE90B50C55A0ABB5471B
          8263D953BA631B85EF3CEE8800B0BFE815893059559BC8DEB98868DF72E2E18A
          E4BC244541A2FBF9E43EE1B6661A3A44E459562322E06EC8D015C803C6110740
          B5C173CBE9F95E063BF673FB2F515B9E19E07274C0A5D9608A8930F0A27D5139
          0FDC9FA68625F21C7268659C17B74FE383E10E65F87E57E8680884533FA8A285
          EBA0805A187F44057CB74F6757E2CC9E4F37E878FCFB4D24E07376AC88AC3AF5
          54FF495E2ED7AC6F1485FBC2621942687B37BF76AA2DA971CD981C3ADC763000
          9205932A88606011A925ABF46BB2B72F448A5F432C56971CA769A611687BCD45
          ECE407C9D56EA8CA0887DC8F006595573F4C8D4DB37E35008E995B45C5908BE0
          FFACB86567D87BEB77063A65E54109DDE637D85B3B9AE41C005304E1529DE764
          27074DB6AED025472031EF05009BBA39504D1DF35E9056CCDE4719430B9F0A5B
          E2BA7C171B1B976C3A78EB9CEA98F82B563C6D6799B96D586767873C43162FAF
          63479745AC0F51827F38B2C0386777C8323FFF1953B37F3814E1F6789BF9BDA1
          84ACBDCB49EEFC0824B795B81D6D56306CFFAD76EAEAB649564E77729EFE08E9
          BEBC1F49ADCDB7CF54D7FD8B6AEBFFF1ED88E9910660C89C126A902EF5D10859
          A22B0EB504C22481FAE87E1789D7F6C4E84DA8C96E8886708626CF108C7DD2C2
          A39D68834A504D7F32C01D27D669660D6DFBA4989CFD0B9F81E2B93CCF49A3C0
          F91FB8349A840DDD99E3A061E0B9F2022FA76DA1E464A4D1A51131D3CDE995D5
          83F8A597AFB7E4C7630E7F326AF360DC545AB8F08329430180112B276BCB0292
          7BC0EFF57B894B2B799B5172A4F2007A691EA5B648F4B9985CC75C9732EA8F25
          7E965442E535F76359FB4797FDA5009C3F6D297D2CBA9183C9E38226CD04D53C
          39A98DEBAFEF57241E0200AF03806743260DD439250A9C743EEC3AB7D0A3F542
          8EA0A0C5D6F55100B49B5143BB565691D12BEB5921C4457E8D4EC1D79F21ACAE
          04203776F16BC36087CA95A37228FBAD2A4A77B08BF686ED7F21393F16AED67E
          DF3F274C5FFF8C5B38BF3F1A7AD2645AFD4FE26B5E4B8EC9A8D951EC108A45E2
          A06D878FF8F087C9D9EA18359EF9930084236BA9B4EA563569EF80A1872307C0
          E8599FD12AB323E94CB66E48D0EFC1EDF32F2E624BE6D6B287B21C6CE6969078
          A43E218F010012D27E22007813147F3C2837B3C6A4B97D5DA895DB03809D2B6A
          C8E89D0100E444BF264F8E08A62EB65F877D5C3320531F8ABF551F8DC846D151
          49194E76597158BCE0D5D85FEBEBCDDBFB66305AFD336EED6FA6A00740410060
          D84993D9974F90B6E19DA4A6FFB196A49F8201E43AEDAFA47B320E634F4A0995
          362B211B4A881D9A867E290067CEFD9C16873B90934B0A3E5D4B34219346B514
          DAA6A8FE60BACE66ED8B8A49C1844AC8325CE8E29724242D4A73F0D6B0B32722
          68736BACC7DA4DAFA05D5F45C8E8E151005C88081816916C2564E975F0C76BFA
          656A4900162701A852005C5ADC64BFE8E1EC6F0D0DD66DBD5152AF9DF0F32868
          7F0E183A6C6833001BA7FFA454B4854D62E0B5E41A702969ECA7AB5B05806587
          A8A4E20E8A25BE000087DEFE2F0540B5F633AA55E0E6379AE277D0341FDFD622
          FAD13F2A5C7F8683BE9EA1D19EAF1BC53B50453B2F0C246E5C1077DBA0F013A1
          207382969CD1C9C389B50500BBBF0A03009F02E0A280264F8D13FFC4A5B1CB4D
          216FEA080AC2E9567E79560E65818202069B08005E03053D1EAE71DED427B396
          D65CD4E1570540A923CB9941FA88BF93A3A0774AFDFC74E1A72EBA94573F0425
          340746D28FD858D081ADC5B42A38841C581397EF41EDBC747D1B367966257B18
          0EFCFC19ADDD3B9EDE1C793F6A8A6F22A67E7B27B0855767ED20111CF526DBD2
          C98743EA3AB39A362F2A26D7B145CF203B5F51E0626745059B0F034F840CFD43
          26284963AC74CFB8FC2405B9391B55151373B083D73FEACF2FB96B8B2596FCCC
          24FC730110365452ABC1E41AFE27D29DFEC3DE9792B7C931A186A79339861D61
          004E41355CA339942BC0A0D44B0A59D23BC755BF29187F886CFBD1F699EECA15
          55F10FD58CC1FA04BB2FDBC528CFCD4E85A33B4A62F4EEF11938A621F36BE8E3
          E92594796AC15321535E97E7E2E3E282DE8681CFAA8D8BC7204347E0B8B7ECF8
          A7462DAE146ACAF9E0F2A8F8082A69F129D9C698D2889D58F9331E68F1730148
          8EEB2B0574DCCDE4EE3D9E0E877CBE5B174A28F40155D63C80046F1D64DCE83F
          0360CC078DB435AA6E86224FC2A6EC3C072BAD17E40D99E27E87B0FF641886B5
          A7C9FEC8CDE5DB48BA7F4F4788A0AE1AC0A568C05ADBD3366E2536E2FD2A7A7F
          0B2AE13C634A43424C4ED3D9B516E3CF641A744C3021A6A3423E1FFB5AE13778
          726E27ECD16D5F93FD31786F4F172F1B0E495BBFF6DCFC5F0F0070BFE9C923E3
          8CC7C891D3F9E75D1106704DB175C803B7E063C3A115D62F0460D4824A7A778F
          4D0559DA0D8D09794B40E793723D7C5B6342DC9945D6DD51C399B5376C2D7248
          F94094D81BEA86F1D64E1A8E1D56A3D65ADD6ED757C406CC0ED2BA50424DB14B
          5E0B4E33F8838D82DDDBD1439DD450844FA3DB5040CC6AEDD5DAE22C4C1416F1
          1D216B294460A0858B9D8873DC15D95C4B15F71DDEDD813F178024FDB43F85DC
          43A71077B87FE625F9C35342BF1480910BAAE9BD328B5AF8B9BA8F6C02E8F9BE
          342737E29618B7CF977B4FDB484DDFAA983D3BA0D165B0E1E27C37D3C3169D85
          7A6125A2B1347BCBD7C406CDADA36D4D0935B17464555CCE518F17084D8C5D3C
          E83D5FC6E6065B5DBD790DC83D92EFA431C811E997B5D15F79789B392766D3C9
          08B9D34CA2659D58883EBBE0F012F14101D830FD103214F4A348EF84BBC8D5ED
          EC5F341FC2B2A0842AEF82125A794825B41F001B00CCFA1900144EAF4A3E1470
          FB92383D36C1D01E2AD16C1FA7D312B6E81292DA635E2ECEAC038D430D8DD039
          DB9AEB617A6D4C0E01ADAEC1EA35BBC6E613BBFFFEFBE9C5AED7AA93EB5D1E13
          4B61F00D5DBC74FAE00257EC955DF119EAD6A886B07665FB2C312021E88CE277
          FD53324F0F3D842AF90E70DA0DB5267BEA81C42C9A7CE5D5870DC003A8031626
          EB0000B0EA31D2D64F3B280049FA09B426C7198F9391D9EE47C77E0EDE249490
          4829A199A888753AF0424EF3BC504A3E5D2E3FFB5E12896301C0CCC306A0E38C
          AAA40445B175ADCE6859598216B771F3EB6C5B94552568B6DF60B7452D31B695
          83866B3A0F328D15C46C39264B632F418E46979D99D3EC545D6725AF07E4ED0E
          DB4B51FD7A8B9C7CC8EE26B93BD3C51E04EF9FA08652638C7B9B2C7957A62EEE
          2D4BF0D390A0A7A35A7EEDDA227EC947D5A6583DF6F08AB1032BE1930000DF36
          8FE4E63907E56705806C3D98DC475F4D5C330E6BFBFFDE18051B662319CF3844
          125608B82837EB1A8A45DAFEE8BCA01FB636EF54AB394283CAA3F6BB4E462F04
          27EEBDABD38CB69798B658BE7BECAA6DE96F1CFD2A58C3393EDB1AFF45D4B0E1
          01D9EA6E4A3F93DF688CECCF47A7C6B306CCA9A422B7E65852654D5377316639
          F81971498BD5B84FD8947FCB74B0D39FEB2BB65DB5863FA8917CCB2616AD8CC9
          6550478D2D9C6C18EAB972775D98365EDD8E7EAADD76DB6DF4E0830F360FC69D
          3C6CB21BC95DC443C4E4BF7B7752ED3B3CA4FD0CE979B0668B26A8C2A6434304
          F00D3D403535F53473E6ACA94545459383C1205D74D145875CA7D7EC1A6A9E82
          288DE2A8EC2F6CB1B7C6D6CB07650AC75D3976E28E0A47E68E46F3435DD23BF5
          167B18FC0F9A97274382FA83529B3D7CE73734EB9E5353D7846715D3A7153A65
          04F8642493297E9D6E4335FCB7020775AC4E4875E7FA3D26F169E9869CA4AE08
          0ECFA1B7DE2A953321BD46009C3100EBBD42B8C0E6730F4F8E2E58B080E06153
          BB76ED7A8FC3E9FCC9E5FF93B970F247B7C1BEB754535398B66EDDF620E7FCDE
          CCCC4C1A3162C48F0200FA7181157A4256EE6CB229586EEA745C86A0DD91E422
          47D5C6ED77BC9C2E968C2DED1CD0B586B81828941AE0BC3203FB5A7E51BBE623
          387AC63EDA1A77AA914E753BD25C1461F34EC860E3C282F3D50DF62CF5F899C6
          46714DBB1CAD07F2C084DB5B883F4CDEC3AE6E34E96924A167167663D75DB7C3
          969B27CFA4D8D61B7E78AC4A7AFC903FC4D2A54B07793C9E63287937C5218C97
          9AB7EF70382C340D9DA9620ADFB368340A996DD8AA1F384F54FD1E8BC50CD334
          356C3FA169DA61DD85A9B68165792010580EEFFFAC43870E949D7DE89BEB5A4E
          AF26A746279647C44C0897476B43F4C7A3D34DBAA4FD2EBA7A7D27CA74F1DF83
          FF2FCA33D8A958AE32C7C31D955179119772BE7AE848462C419F5FD8B21980E3
          6655D23E33E90F2D2B6272B13258BE930F2D8FCBDD88865B63424E84E2199EED
          90F51509FE479DC9E74C3515222E9760D944BE83A99911BBB2A4496BC7FFDBA5
          C993D1EF40D77FE07253CF3FFFFC25C71D771CA9704F4B4BA3ACACACA4212291
          8832066DD9B2851E7BEC31C53F6A3C6AED0D37DCB0272F2F8FEEB9E71EB5ADA9
          E8B3C68F1FFFE5F0E1C3931BADACACA43BEEB8C3818F7F564E8AFE047E7F77FF
          EFB66D537979B9029460E8E4DD9900F0DBBF8AF75BB76E4D65656574CB2DB71C
          D4F027BDBC872AD23C64C9E4C3005B41D0DF005A9E5F65F28F8F36A214F3F828
          E0E0AE6F8289193897D2708FC8D51D77FAA4C159373528BAB12CE3A3B35A56D2
          DCB35A7C3F32BBBC53465D7C4CFBB086BD1CB7696286C1C6D944D35011F74554
          CCF668EC46D492F3023A4D1024DD2563A32FF85E733D1FB1E5E5019DFDAECEE4
          4F4C30EAE98D899D7E78CC2A93BD82BE147D2B353F214C01F012FAAA547478D1
          63A94EA9EFEC54F41C8DFE2EFA64F4A752407AD0E7A23FAAFE2AD00E18661888
          FE217A3ABA9A903F5639C901C7A300B552FBD25311C853DFED3F0EF5D995EA2A
          7998DF7AD3BB15549940546ACC11B7A46BC335E58DF4701E5943041DBD8651B9
          A92515653029E9E5EF1392CD51A3A5F92EAE9E8D94B13DC63F1DE6B56871EA2E
          FAEFA8F18D10197684FC9ABCB0C194AF42E1FC0BF173D9EA886DAC0D8977D414
          C48DED83979E549AD50200DD9CA6C9C990A00301CE3C28814D454E1A09AFA80A
          7041EBC67E6F6CE842F47FA18F479FF6037086A0FF0E5D65EF0AF467D03F46FF
          630A2475A141CD99518F40574FCDDD9532DA4AF441294016FC609BF7A15FAF22
          06BD472A0237907AB82BD195A9E3A947DF88AE92D67BE867A7F6AFA2E6E6D4F1
          285DAD2EF5ED447F04FDB32400F3CA69D199B594F566CEAD90942351645D8122
          6B7B1B4350A6D3A605C53AA507D8DDF8ED9C1C9D46387556E573E9DEC6B87D89
          53D86F6B8CD5E4C2BD968C3E606EA86AFD67945085A5ABEBAF6DA17016A91355
          934E1B6DB91DB5C1A4884D93B1B3519526DF5CE492B760C56D9DDDF4C18A06F9
          16AAE3731005D7D425D8B3976634D1FA8A3AFAF29A7EFB373D11FD55F44FD077
          A40CB819FD7DF499E80DE8D3D187A1F7A6E65B4814005D52607C99FA4E197A51
          CA2B77A50029450F1E607CE5F51FA1D7A03F87FE26FADDA9481983FE1ABAA2CD
          F5A9C85491F4582ABA6AD13F40FF14FD4FE8DFA4961D9B5AEE0CB5DFA1F32A68
          C92A4639DDE86675A70C54D0D582D8AED66EA06A73454B39C551311F4EBF301C
          76DCDB33DF268050183145CB44DC5A0D674D6C19F79D837E0BC0192149251F96
          D3452D89DFB7953FDD64CBABFD3ABB312AD9932D1C32BF224EEF03BD39214153
          B0B36EC80197E519F29EBD313A0E1133CB606C8FBA91CD94B4573D2E7EDBD86F
          AF13EF076073CACBF4D4C9ED46FF6BCA30F353DEB734152527A057A29F990242
          19E276F47FA6C0A94FADFBC3A6BC7D1EFAC329E32B90F7A18F447F3C1549C7A3
          6F4F19F9CA1400F7A4807A24B5DDCBD04F4C01A5D67907FD72AE69AF7FB6BD96
          1EDE6EB9A396141551E968D458C8A7465D4D4675A08680C126844C39D5C7E86C
          84F03AC806CA71B1734193C198CD9678A545DB0E06806A5D908CCBA3EAF1B434
          AC4E510B67AB5B3A68D4F630D5055C740714D085888A33F6D56B7B8B326CF5EC
          84EDC3D3AC796F556BCF23515F0AC01EFA732BBAFB990A298569D1C6E6BB23F7
          53D025E86FA40048A4A84725CB5352E1ADE8E6736AE6EF0129902E4C7D5600A8
          44FE6C6AD932F4F3E9DFE7273E96DAEEBE54647548EDEB34F46B53461D948A1E
          453577A13F91DAB6DAD76CF47FA08F46570A6D4F0AB085E837398E3FFFB9BC1B
          9E3E2E648A7BD5BD7250378B0ADDACB59AFB1315B40BDE9FB6332466C1D83B87
          B9AC6BB67287D038B5C45176750BFB639358C2670769C505DF8D9B7D0F80DEAF
          EDA488D3ABC685BC3B2334232EE8E47483C69B92BD83DCD03A68D27B0ECEA635
          98F6836DBC5A7B7C7FA397B329C1845DD8602513659A9A07D924D8E22689FC79
          61F67E0054129E80FED601BB1B42CDC955D1C293A993FE43CA18D7A0AF4E454F
          A7142D7C985AF6056A4EC03FD4BB85A908B25340ABE4DA22E5E54A31855391A1
          BCFD93D4E7AE2900EE4C1DE7AC94A3A85C34859A93F88DE817A08FF05FFCC795
          BED32E3FBD2121FF0E1BDD13FCAC7EE63167647500DFDB3BC372B74B67E34209
          F19097CBB12856575A488AADFCBC2BECD8FE828CC8FCCF420E59D148B4E5A2EF
          460DFEBD3E79CB24DD842CD4E405A096D780B41ADF386F53A30CA539E52DA09E
          2BA190CE6A147C4BBA2E2EC526DC2535E2E9B434765DD8164F60F915790EBA20
          2E5949F9B8240D9D47CDC9F29AD409EE6F8E14AD5C9D3A0EA544DE4E79B1026A
          4DCA6B95227A00FD8AD47A2529A3AEFAC1912B8E7E11FDA1D43654531EA0E82D
          988A8C29A928A849458FCA848FA4F6A3AE81AB841C486D63740A4CD59F6C357C
          DCE3ED6F79CE1D8BC76255319169D6862B5BB749EF8840CFAD33C5A73A63397B
          9BEC3952C875A7FAEDEB7708DD06FD648195C6A593F5B27A9EAC1B05C027A3BF
          3F83FCDF00E833BD9882C2508FE64A2F8DD34C48A7E3D30D7E21AADD69593AE5
          5625E41C2492B56764B0EBD7C5A5B7C1E2F7C3D7DF7409B9B1D8942FC6851CE7
          D5D8735DBCFA4DBBDFFF57B4E6F95BD3539E589CA285039B92999D53BF57A16F
          A26609A89E4D164D195B35552EAB471BAB6D6D4D6DEB874DCD0E53882BFA693C
          E0FCDAA4D61F8CAEEE1E99970244197C520A38B57CD901EBA9E5BBA5B6B9EF18
          29B794CEA83DAD21614F417E9B0CA5B230DBA9E5EA4C64BB98DCFDF96E3B9A99
          C36F4552BECACF490DDB6E6C1FE0BC3E46DD6C5B70DD161B51E4DA81DC8DF4C9
          D0537E1C80E628906498D5E4E3E2BC464BBE0EDA5955E462A3CBE354E364724C
          44D0E33E8D5D0D4E9B9FA6CBFEB6646A36C503A88CB382A67C0791D733CD6077
          9FE74DFC6DDA93778B86C5AFD1FF405306579EAD1497A22345892A9F28791C39
          D44A6923AE20C7D87BC8E1729FDE688AFBD5B0CC7105FA9255D5E20F3A89E5D0
          F98BE0907D6AE3720692DB3F430D8EBF0E6A659107C5D8AE907DA926C42CF54A
          153712F5DA83DC3B775000BABFB58FC2DCA16E32F3EE8D927A38DF18BFC16FAD
          8FCABF0F48E78ECD11F134E2B72712F2B975422B49E3F6446CA9E53101F6D725
          35E284065B2AD51308E8FC77B51366BED473C679C9EBE19DECAD34E3FCC1BF15
          004A4A2A75A3A8454D485514A694D1AE832D7CEA822A5A8854DD21C0DA8076D3
          F30CDA1417C273719ED1F048A975912944965557FD68EBA27CCFB690FD8A7AEA
          7A8E2E2F609C075BFB182F4FF0B106C92F85E1DC618482B47EC2C1E74E1D729C
          2BFBED4A4A58EA59CA52DDA4A7A6A93765194CDD09B906C8B76BB0D94C48CF15
          BDFDFCA6A06D524CE897A6E9B4704D8876A731710164EC335847205FFCAE725C
          EEEBEA6E73F5D07F7FBC8C564FEA47BF61537584A2BE830E8F9EF45E65B2AA46
          54534B1FD7E797592F276C39A8D0C54F452DB44BE7344CBD6E259D590F6FB9B7
          389835A5DD6D4D96B8D6CDC48404699F9FD9DE49BB6AAD167531BBB36DCB35B0
          706D9A4CD0EA0B0E7EEFDC2101E8FD7609C5B94E97B5606CCA4E392562CB7B51
          1DCF68E7E697EC8CC9B08BE42850D13FF0DD1FEB22FC597939F4DDBBD4D7B245
          741B39B650387E05D6F91B40B051A4DD7E4A9A78796544B3D553AFF32C93BEFE
          197389FE5B6DF06BABE9D389AD899DD54017DF1C70DCDC5E9AC33E35CFB7A162
          F20D7A3CC259A798252FC6B93F13256D84296521EA8173403D8F8442194F9DD8
          B28E2EE8E0E68F6F8E5FAB4BB904EA67530C29BC78DCA1E7CEFEE8486FDB6995
          044F86709779B5264D07B71F9F062AAADB107EE48D737CEC9ACDF20E44C435D0
          FF5746055BD8D9CB323993E98A6F3A259AF6CC8DBA2E457DF01735AAEF37D89F
          DAB8F86355A68C946EC9A1815D4BE9CBB187774FC1AFDD46836BFC9E6A6A08E5
          D2178DEAB103D42F6CC97B20359F2D4F40FE42D0B6F3B16E114B5C05C3BE9C20
          7E0C72DDDF611A3796F9AABD9B9D2118551D97CFF96795F23CACBFCE2DACAD71
          E222439AB4F4BC43BF6FE04701E8FEC236DAE8CE22B730C9CDE84424E469084F
          9EE560E3C3362D6AED149EBD51F628403E1E15E0451A675F16B9592E42B66579
          827DFDB7CC6AF04FE6D8902DFF2A242BF4E8EC955C077BA024C1F674754B528F
          FBCD818B7C3AF1F06755FC1AAD705A951A8AA73D8B22A41DEBA61C070D87047F
          C6CDE514D433AF16B9644F1CE6155C8AD724D73A56C7C49309F5CA13340FA779
          1D3D745187027F437130DAA12961B785145D8DC8AFF681E8568EFEF199E33F79
          ADA3DDEBC5E44439B7F9A542F24FAABC1111F177A8A20DD9061B1793B4C5C364
          768D49CFA91917D90E7E49D896EBB2E116DB829C3A78E3B4A34EA39C800478F4
          5784EC40D4095F050C7EFF69D9C6078B8396DDCB4754815A35545D4EDBAEECF5
          5F33FAF0F74A9BEF3B80D8288E25AFBDE55645ED1BF1CDF26E5EF1D1EE282BF4
          4AAB3CA23BFAC52C31DE415219BF5D555C3C056A49DE10E160F4B55F8394E57C
          53AF74CD57DC645FEE66723A1CB20CCBD0CEF37F7ADAFE615D6C6AF76629C591
          B73C1AB9511BFC1DB4720DB8FFFD7C27BF3464C90A078916418B3D8FF3C942D2
          BDA2D6626B8FF558546EB2E4C4D50D514D3D35B71D40988C3A61024E3C8A5AE1
          E54C077F7A57497C5BDB964EEAEC12546D7118254C5F9EFDEBBF3E8A5EA821A7
          8BD1D56D35E3F10D51B343A6D6AF342AD4F4C2371A23C66DB421412D07F333D5
          1B370C295E149ADEAF262EFEBEDFF850389BE1E197EABAB632D729034D264D70
          1324788C6A0CFCE8B176D157938EFDC9C3382C005AFCA982CCB6A82484502FEC
          CA0D5AF4224270A49A805AE4D26E0C9AA20EFB6C5D6725C751D4E3CAAEAD8CCA
          1545A85AA01A686F54070026E569C25366D1B888CD6E433EE98CB0DFE1D3F973
          190EF6F6F6E24471AB22830AF165B57452916CA44FC61CB917AA0D7AEA3DAACA
          3F3A39101582AEF4C0D20667ED402753F1715E2F1F9BB9AED1EE2D842C2EF0E9
          B1DA84BC18D23203B5D0AB8D523B1B4A503D3F3AF940689DC96D5E2EAFF43A9D
          CB5AB829376E89DEF531BB82DBF6168FC64CB7A6D15787E1FD870D806ADD9FDF
          4CDBDDD9D07002F9407680B15FB6A41CAC0CD8CAC56FAF4A880627C94280F308
          A2AFAF576777806A4A0140314EA6626040A78DF571DA671A94A75B1D9B6CBA31
          26683C823FD3E0A41EEFF536D4D29C13B21C5BDE298F5B907D948D0A275B5AD4
          0435168834D29C713F7DD1FFC036145ABE32AE935B53D35324A19052B3180290
          8D5DDC9CAD979C772B8FDA6F83165FAC8DD39FD573E3DA78659F844D13C0E31B
          03062DAB4CB0DF23F75D0987495EBC3698DC08BFBAD6D2F44FFA04B440C4B43B
          854DD9665D073663D0364BC62099B68C3F7CC7F959D7BBBBBEB68F369B39E435
          1AD4D1F40C0BF93294407FAFCE9FCF77B03BEB2D19744A915167B3C9A6A47361
          5C03C65D97E1E0F7946C0DAFEAD6C34FB94E32A0B1FD177BA2F5779619473709
          794542D099002D0B1E59E1E26C895B571536FBA28B5F2F9EB72B92C88425FC6A
          6CC4D0D47DB9A4E658D647E26431F5A442077975EBDBBBFB2A85060D2FA90916
          63C9F7A568EA0E960C44AFE39B0651898AFEB2605C3C02AABCB2ECD986691DAE
          4B6F8363AEB434E683539C6B0BD916D1FC0ED734BD3621A63659346CFFAD20D8
          CE0A9F2E6FACB5F4AFFED0CDA5BD5B121F65415DEC8DD3EC21012D09F2FBA37E
          DECB7D7EF6848376AF94D249EE08BD120B50A626FA3558F41C926B7F8FC6DF42
          4EB80D49BA34CB416D7646C447515B0D07271FEF5B8C4879045EFD72BA6EB292
          987633ECB30F469E7BA9BBA6F6A1607A3FD414634DC946C2789DD5957794EFC5
          48F6AB9D1A5B85F5D7839976A5195A75AE8B87BBA6E989C7BB338B0DD806119C
          45DD5ABB68E3981C2A2B09B1A1AB12D2A73367D4963DA4947B7A6619A125E589
          67A0CCDA17BAD87900A6A0D194E391CFFED564B32DADBD2CADDEA25360F8C1B0
          E05738A6CF90C346C3EB6F05DF17A58C249C8C66A7E9F28EB0603B6FEDE1D7DE
          D915B9C620F1A993C4A6B86466EF73F2A8FC9575B4E8E2DEBF2E00AA757AA398
          3AA398FF206CA8972BA877C43C05104E40625E94EDD07E5FE494BBD785C45D00
          E0062882E453EAD43BBBD4EF888647D2B8D884133C1919B71F6CBD1E5EBF70EB
          392B8B5BBED1BF202CD9090002450E0D1252B6811F3B91DCD5AB9BEB004AB5CE
          59359822086753FF361135DBF29DF47C555C5E68C16039067B20C6D851E0F619
          A09E47161CE77E78C4F2D83D30704B48E0DB4392D595D710E56549BAB088F8DC
          0A360994E4F732F9419CF13675A6BC3502AFB79BAB65F5BF0637A7A73274E87E
          AED5215FE5236287C1F05F83A68A11E14D0E2C942DC3B460CCE1DF27F11F01A0
          5AD7B7CB69A4DBA467430E9513DA866C520A6134BC757386C16F3F3EE058B8A0
          2636123C3F1904D167FF951348B77AF0FDAC80CE9F7592551191EC441C463F18
          B5D6D0D867390EBEE6CF052274E90E3B272CA81BB6D9CF14AC8720D90174A70A
          860C50825BCDC907783A18691B003FBBC664F782E2DBE739D828AE31775D42DC
          04BBCC0B0A6DE9884CAE01000E57351B74784C531305DD2E8803497D7C945612
          A31EA0CFCB51688D694EB4CD73E8D40B453D9A9C3AC0159BB7C1F4DA592E7694
          B4A51BCB25BC96F8823B79F2D98D1BCFFBE575CC7FF4FCAF36AF15D31E3B93D2
          F5100534995D6DB2BB2151AFD52133FD067FA49D5B7F627738116892742B8C73
          A1D53C9C4CCD0FBC66AB3BA082AC30A9DC4F71BFC9F4FE92B16319F1DCE46B6C
          195BA75E31D2C2C92B2EF435C51F2D97CE8A040B585C4B07EF061C1A4B53AFB0
          05DD97B56FAAFCBAD8979783EFDDA5E3F3F7769F5D4D1BD45DE89377D0E271D9
          74E7162B39F3CE44C84010D0BEB0A47E999ABF3C2606819226C46C7906222E7B
          FF63483526EB1095AFF935F91892EDEE1E01EEAC8A8AA3B8941EF5C2E83A9BBE
          C960C92B87B4F6FCFFAC88FC8F1FC0D6EDD5122AD60DF2AAD7DC31E128B3F924
          F0F96450444B187961262ADF137DF2CBF975720892DC4DA02A95D49C066321FC
          3E077CFD5ABE93ADD818B6C3C2E9A51622946B13EF4E8CF504FD280ED6D45B94
          E0ED95F0CB4A974641F0793D28A2C9A937DF7F1AB724F2A670A5EB14421198D0
          184B43F4F8200FEBE3926FAF461855224487143A5D7B225687902987C1E8EA31
          3B4721AAFC07BC512F06A32E4605FC580FC35CBA87B9EC7427EB08C367466CEA
          E4451E68103CBCBB91D3A88C26DAB9AE8136DDFF9FBD8DFB883CB2BCCBABBBA9
          5E73AB31232A096994ED1347C100F725843C5D5725B9C19E2B70EACF08D3AC2F
          37938AE76C78D91730C01018B98F7AE335A8EB3D48D78FDA78B46D9FD49AD174
          A74EAD581362CB9983C45C28881502845CE4850022C4A7E6CCC9E6C7F849F5EC
          7F78B87448F145071F5B2319C732AC0636D791509DD0FD1D61F0A3B0BFE3714C
          FDACE6F74A7EFBB445183E0A79B91C5CFF42BACE16344A16EA9BE5740763D600
          80E8C7F2D1529396B680F4733A742A68A8A28513BB1C09D31DB967C69F377D3A
          7D6D1D4F3E2668B7A52B85A4E4E8A5514137C268AD1C1ADF0009F98F22277FE7
          A434ABE1913D86D9CB1F75979BDA0018E66C90847AF6403ABC7727787D392860
          A547A72D2D3DBCF2E30DE18851E02297C6C98001829601FFF7D029E9955AB566
          B4C6FA3E247CF5EC1AF5CEE14C54AF45E8ED407B1D414B1DF09D7AC3B6EFC039
          8AC9D7DC12923A93CB9C9CDE48636249A5D41B13B076B7803E0891A0C56DD931
          C0ED99FBA41EBACA17A7F7516EAA81B995BFF09D61BF2A00FB5BD75777D13E3D
          9D02324E65B52813B362BD204D6F8491CE53AF1587ACFC12D5E2BF32749AB77D
          5FB424A7D045D5C100B5C9ACCB0B093600143D14801DA5E847BD3B9EABD70612
          DB09B5B1079F4B547E40F60D452C1982E73A62921E8257AB37A6AA6BCAEA6DA9
          0ED09F9E9CF67F9093D5483668C82DE0AC859096F3F398B5AE941C89B3DAF8B5
          CDB591D6515B1C85EDD560E5AA9D96635D676CB1A0AC9262D97E5ABE198C78FF
          9135D9AFF2D684364F2F279EDE8620EDA854E8D4D5691B5BE2FC78E486AB21E1
          4660B73E18743372C06C9FC6D493A4D67F113423AAC0AA81B4ED1E88A5A1A26E
          1913AC2B00E90E6374920CE941523AA8C50D27D4A44C3E5E9743B2B6548FD2FF
          E199A4FE29814A983359016FDFA4DEAB039A59EED768C3EEA8569FE194847D67
          31299CA0ABD13ECEBE3485D03F6DDBB0A2FBB634597E413E8D9EB58704AADB79
          E7FFBC2AFC3705607FEBF1C2166AF4A6132ACD6485DA424BB82A2CED38142EEA
          95E6235044E6C028F5503B2BA16A3E4071F459AE836FFF6663B831BDAD4B3D93
          8DEAB1DE5467097FD5CC71375AB6CF669A0FDE8FBA8FB99D1A4F878CFD839AF6
          81A869428E88607B0D9CA44AD87BF1773B92FD3607895D799A55B9557A126425
          E89442AF6B6F289E0D8AEA62A9242CA5894A7A9D4EEA0D572CD6D680E8D539B9
          6226CD3FF7D7BD66F15F796F48FB17B651C8974E6E9C7CADD4E968B7656C8C6B
          DD23829D1917F20C18A157F36B81A94EBD6019807C89A4FCB5AA294057A5AD3C
          5AC3C211E951F6CF12722331F0D4931FD4A05AF774BD28624A7753DC8A6A1A8F
          65E932DA4D8BC7A7477DB67AD6338A251A98A18396848E82B13B926D5342F2D3
          3412CB505FE4676A72898922316C93B97FFAF6A6C31C48FB3F03C0FED6FDE55D
          14F678C96D5BA4DED55E05C5D42EDDCA8461FAA9EA1251713CB8BCAB1AA04BBE
          DF9751233CBA1CD56F3128A4180151EED2580D927463CC9228A629EEE25486E2
          6B4D865B33A41076455CA6BB354AC46DD616E22882E8E8826A19CC227DA0B108
          A242BDD725A809515562E956578F54CFEE252827F288202D1DD3E93F3FD1FF55
          00F6B7AE4F7F4D32238F3C12407007D5D99C1A427E6A9F561780CE6E9B90AC37
          8CABDEA6DA5DBD4D5B26E7E730A5D735BE9FDC9B1F092493AF16D4E9DA8083A9
          29A9C5F0E42E6E265611D77AABB11AD41E39699C36A8B1B912693478215E7351
          3EA89BF7D4ADDB7BE0EDA7BE574A7347FE3697477FB377A8ED6F1D9FD9491C59
          51B32C6AD25D1446643420755A8DB9D431A3D413123C23412C1755723EAAD07C
          A6669B4972D9CDAFDC63869A75C0E5AC4C278B039244C266C24A58F1DD9F7C68
          B73DED0C023D5121D4A3BADB7EBB11A0DED1AAA43CFA62C24F3F62F3BFD17E73
          007ED8BAFD631D9DBD68164D1F399112869312108EEA0E730B14816A34F92E1E
          3AF0863EF052AEAE6E80680E09DB06F140CBA73335A7304963F4C5F89F7EA0EC
          6FD5FEE7003858CBFDDD1EAAFAC2A63E175BC40D8D22F5D5640BABF904D41B97
          5D39EA01E8B4EBC623539DFE37DBFF072181FD9BCBDCA5BC0000002574455874
          646174653A63726561746500323032302D31302D30325430393A34343A34392B
          30303A3030C12EEAEE0000002574455874646174653A6D6F6469667900323032
          302D31302D30325430393A34343A34392B30303A3030B0735252000000004945
          4E44AE426082}
        mmHeight = 26723
        mmLeft = 253471
        mmTop = -265
        mmWidth = 30956
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel13: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label1'
        Border.mmPadding = 0
        Caption = 'Plano de Mauten'#231#227'o..:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4234
        mmLeft = 1588
        mmTop = 29104
        mmWidth = 37835
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel14: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label2'
        Border.mmPadding = 0
        Caption = 'Intervalo de Horas......:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4233
        mmLeft = 1588
        mmTop = 34396
        mmWidth = 38100
        BandType = 0
        LayerName = Foreground1
      end
      object ppDBText11: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText1'
        Border.mmPadding = 0
        DataField = 'intervalohoras'
        DataPipeline = ppDBRelPlanoManu
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'ppDBRelPlanoManu'
        mmHeight = 4233
        mmLeft = 39953
        mmTop = 34396
        mmWidth = 144727
        BandType = 0
        LayerName = Foreground1
      end
      object ppDBText12: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText2'
        Border.mmPadding = 0
        DataField = 'plano'
        DataPipeline = ppDBRelPlanoManu
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'ppDBRelPlanoManu'
        mmHeight = 4233
        mmLeft = 39688
        mmTop = 29104
        mmWidth = 155046
        BandType = 0
        LayerName = Foreground1
      end
    end
    object ppDetailBand2: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object myCheckBox1: TmyCheckBox
        DesignLayer = ppDesignLayer2
        UserName = 'CheckBox1'
        CheckboxState = cbUnchecked
        Checked = False
        FormField = False
        BooleanFalse = 'False'
        BooleanTrue = 'True'
        CheckBoxColor = clBlack
        TextAlignment = taCentered
        mmHeight = 5555
        mmLeft = 273844
        mmTop = -797
        mmWidth = 8467
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText17: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText7'
        Border.mmPadding = 0
        DataField = 'item'
        DataPipeline = ppDBRelPlanoManu
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBRelPlanoManu'
        mmHeight = 3438
        mmLeft = 529
        mmTop = 0
        mmWidth = 137388
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText18: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText8'
        Border.mmPadding = 0
        DataField = 'produto'
        DataPipeline = ppDBRelPlanoManu
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBRelPlanoManu'
        mmHeight = 3438
        mmLeft = 137847
        mmTop = 0
        mmWidth = 60854
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText19: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText9'
        Border.mmPadding = 0
        DataField = 'codigofabricante'
        DataPipeline = ppDBRelPlanoManu
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBRelPlanoManu'
        mmHeight = 3438
        mmLeft = 199231
        mmTop = 0
        mmWidth = 35975
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText20: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText10'
        Border.mmPadding = 0
        DataField = 'unidademedida'
        DataPipeline = ppDBRelPlanoManu
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBRelPlanoManu'
        mmHeight = 3438
        mmLeft = 235478
        mmTop = 0
        mmWidth = 24083
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine3: TppLine
        DesignLayer = ppDesignLayer2
        UserName = 'Line1'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        mmHeight = 1054
        mmLeft = 529
        mmTop = 4232
        mmWidth = 283898
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText13: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText101'
        Border.mmPadding = 0
        DataField = 'qtde'
        DataPipeline = ppDBRelPlanoManu
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBRelPlanoManu'
        mmHeight = 3438
        mmLeft = 260086
        mmTop = 0
        mmWidth = 12958
        BandType = 4
        LayerName = Foreground1
      end
    end
    object ppFooterBand2: TppFooterBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
      object ppLine4: TppLine
        DesignLayer = ppDesignLayer2
        UserName = 'Line2'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        mmHeight = 529
        mmLeft = 529
        mmTop = 265
        mmWidth = 283898
        BandType = 8
        LayerName = Foreground1
      end
      object ppSystemVariable3: TppSystemVariable
        DesignLayer = ppDesignLayer2
        UserName = 'SystemVariable1'
        Border.mmPadding = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 239455
        mmTop = 1321
        mmWidth = 24606
        BandType = 8
        LayerName = Foreground1
      end
      object ppSystemVariable4: TppSystemVariable
        DesignLayer = ppDesignLayer2
        UserName = 'SystemVariable2'
        Border.mmPadding = 0
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 264590
        mmTop = 1321
        mmWidth = 18786
        BandType = 8
        LayerName = Foreground1
      end
      object ppLabel23: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label11'
        Border.mmPadding = 0
        Caption = 'Fort Agro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 1588
        mmTop = 1852
        mmWidth = 13758
        BandType = 8
        LayerName = Foreground1
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'tipostr'
      DataPipeline = ppDBRelPlanoManu
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      KeepTogether = True
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDBRelPlanoManu'
      NewFile = False
      object ppGroupHeaderBand1: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        Border.mmPadding = 0
        mmBottomOffset = 0
        mmHeight = 13229
        mmPrintPosition = 0
        object ppShape3: TppShape
          DesignLayer = ppDesignLayer2
          UserName = 'Shape401'
          Brush.Color = 14155775
          Pen.Color = 8454143
          Pen.Style = psClear
          mmHeight = 6350
          mmLeft = 530
          mmTop = 6878
          mmWidth = 283898
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppLabel19: TppLabel
          DesignLayer = ppDesignLayer2
          UserName = 'Label19'
          Border.mmPadding = 0
          Caption = 'Item'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
          FormFieldSettings.FormFieldType = fftNone
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = -265
          mmTop = 7672
          mmWidth = 138161
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppLabel20: TppLabel
          DesignLayer = ppDesignLayer2
          UserName = 'Label20'
          Border.mmPadding = 0
          Caption = 'Produto Utilizado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
          FormFieldSettings.FormFieldType = fftNone
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 137849
          mmTop = 7672
          mmWidth = 60854
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppLabel21: TppLabel
          DesignLayer = ppDesignLayer2
          UserName = 'Label21'
          Border.mmPadding = 0
          Caption = 'Cod. Fabricante'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
          FormFieldSettings.FormFieldType = fftNone
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 199232
          mmTop = 7672
          mmWidth = 35969
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppLabel22: TppLabel
          DesignLayer = ppDesignLayer2
          UserName = 'Label101'
          Border.mmPadding = 0
          Caption = 'Qtde.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
          FormFieldSettings.FormFieldType = fftNone
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 260087
          mmTop = 7672
          mmWidth = 12958
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppLabel15: TppLabel
          DesignLayer = ppDesignLayer2
          UserName = 'Label15'
          Border.mmPadding = 0
          Caption = 'Uni. Medida'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
          FormFieldSettings.FormFieldType = fftNone
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 235478
          mmTop = 7673
          mmWidth = 24083
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppShape4: TppShape
          DesignLayer = ppDesignLayer2
          UserName = 'Shape4'
          Brush.Color = 14155775
          Pen.Color = 8454143
          Pen.Style = psClear
          mmHeight = 6350
          mmLeft = 529
          mmTop = 0
          mmWidth = 283898
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppLabel16: TppLabel
          DesignLayer = ppDesignLayer2
          UserName = 'Label16'
          Border.mmPadding = 0
          Caption = 'Tipo :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
          FormFieldSettings.FormFieldType = fftNone
          Transparent = True
          mmHeight = 4233
          mmLeft = 1852
          mmTop = 794
          mmWidth = 9525
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppDBText14: TppDBText
          DesignLayer = ppDesignLayer2
          UserName = 'DBText14'
          Border.mmPadding = 0
          DataField = 'tipostr'
          DataPipeline = ppDBRelPlanoManu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          VerticalAlignment = avCenter
          DataPipelineName = 'ppDBRelPlanoManu'
          mmHeight = 5290
          mmLeft = 11907
          mmTop = 530
          mmWidth = 107156
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppLabel17: TppLabel
          DesignLayer = ppDesignLayer2
          UserName = 'Label17'
          Border.mmPadding = 0
          Caption = 'Chek'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
          FormFieldSettings.FormFieldType = fftNone
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 273844
          mmTop = 7673
          mmWidth = 8467
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        Background.Brush.Style = bsClear
        Border.mmPadding = 0
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppDesignLayers2: TppDesignLayers
      object ppDesignLayer2: TppDesignLayer
        UserName = 'Foreground1'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList2: TppParameterList
    end
  end
  object qryRelPlanoManu: TFDQuery
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select '
      ' a.nome Plano,'
      ' Item,'
      ' b.qtde,'
      ' d.unidademedida,'
      ' d.nome produto,'
      ' d.codigofabricante,'
      ' intervalohoras,'
      'cast(case '
      ' when b.tipo =0 then '#39'MANUTEN'#199#195'O'#39
      ' when b.tipo =1 then '#39'LUBRIFICA'#199#195'O'#39
      ' when b.tipo =2 then '#39'VERIFICA'#199#195'O'#39
      'end as varchar(13)) tipoStr'
      'from planorevisao a '
      'join planorevisaoitens b on a.id=b.idrevisao'
      'join produtos d on d.id=b.idproduto'
      'order by b.tipo')
    Left = 648
    Top = 32
    object qryRelPlanoManuplano: TWideStringField
      FieldName = 'plano'
      Origin = 'plano'
      Size = 100
    end
    object qryRelPlanoManuitem: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'item'
      Origin = 'item'
      Size = 100
    end
    object qryRelPlanoManuqtde: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'qtde'
      Origin = 'qtde'
      Precision = 10
      Size = 3
    end
    object qryRelPlanoManuunidademedida: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'unidademedida'
      Origin = 'unidademedida'
      Size = 10
    end
    object qryRelPlanoManuproduto: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'produto'
      Origin = 'produto'
      Size = 50
    end
    object qryRelPlanoManucodigofabricante: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'codigofabricante'
      Origin = 'codigofabricante'
      Size = 30
    end
    object qryRelPlanoManuintervalohoras: TBCDField
      FieldName = 'intervalohoras'
      Origin = 'intervalohoras'
      Precision = 15
      Size = 3
    end
    object qryRelPlanoManutipostr: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'tipostr'
      Origin = 'tipostr'
      ReadOnly = True
      Size = 13
    end
  end
  object TServicoRevisao: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select a.*, '
      ' case '
      '  when tipoServico=0 then '#39'TERCERIZADO'#39
      '  when tipoServico=1 then '#39'INTERNO'#39
      ' end TipoStr'
      'from servicoManutencao a'
      'where status=1')
    Left = 104
    Top = 224
    object TServicoRevisaoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TServicoRevisaostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TServicoRevisaodatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TServicoRevisaoidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TServicoRevisaodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TServicoRevisaoidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TServicoRevisaotiposervico: TIntegerField
      FieldName = 'tiposervico'
      Origin = 'tiposervico'
    end
    object TServicoRevisaoidrevisao: TIntegerField
      FieldName = 'idrevisao'
      Origin = 'idrevisao'
    end
    object TServicoRevisaodescricao: TWideStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 100
    end
    object TServicoRevisaoresponsavel: TWideStringField
      FieldName = 'responsavel'
      Origin = 'responsavel'
      Size = 100
    end
    object TServicoRevisaovalortotal: TBCDField
      FieldName = 'valortotal'
      Origin = 'valortotal'
      Precision = 15
      Size = 3
    end
    object TServicoRevisaosyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TServicoRevisaosyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
    object TServicoRevisaotipostr: TWideMemoField
      AutoGenerateValue = arDefault
      FieldName = 'tipostr'
      Origin = 'tipostr'
      ReadOnly = True
      BlobType = ftWideMemo
    end
    object TServicoRevisaodatarealizado: TDateField
      FieldName = 'datarealizado'
      Origin = 'datarealizado'
    end
  end
  object ppDBServiRevisao: TppDBPipeline
    DataSource = dsServicoRevisao
    UserName = 'DBServiRevisao'
    Left = 256
    Top = 280
  end
  object dsServicoRevisao: TDataSource
    DataSet = TServicoRevisao
    Left = 104
    Top = 280
  end
end
