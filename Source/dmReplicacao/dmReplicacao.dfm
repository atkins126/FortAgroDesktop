object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 639
  Width = 880
  object TSyncAuxCategorias: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select * from auxcategoriaitem'
      'where syncaws=0 '
      'order by id'
      '')
    Left = 36
    Top = 4
    object TSyncAuxCategoriasid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TSyncAuxCategoriasstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TSyncAuxCategoriasdatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TSyncAuxCategoriasidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TSyncAuxCategoriasdataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TSyncAuxCategoriasidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TSyncAuxCategoriasnome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TSyncAuxCategoriasidsegmento: TIntegerField
      FieldName = 'idsegmento'
      Origin = 'idsegmento'
    end
  end
  object qryAuxL: TFDQuery
    Connection = dbCtx.FDConPG
    Left = 680
    Top = 205
  end
  object TSyncGrupo: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select * from auxgrupoprodutos'
      'where syncaws=0 '
      'order by id')
    Left = 36
    Top = 60
    object TSyncGrupoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TSyncGrupostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TSyncGrupodatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TSyncGrupoidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TSyncGrupodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TSyncGrupoidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TSyncGruponome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TSyncGrupoidsegmento: TIntegerField
      FieldName = 'idsegmento'
      Origin = 'idsegmento'
    end
    object TSyncGruposyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
  end
  object TAuxSubGrupo: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select * from auxsubgrupoprodutos'
      'where syncaws=0 '
      'order by id'
      '')
    Left = 36
    Top = 115
    object TAuxSubGrupoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TAuxSubGrupostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TAuxSubGrupodatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TAuxSubGrupoidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TAuxSubGrupodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TAuxSubGrupoidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TAuxSubGruponome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TAuxSubGrupoidsegmento: TIntegerField
      FieldName = 'idsegmento'
      Origin = 'idsegmento'
    end
  end
  object IdHTTP1: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 760
    Top = 384
  end
  object FDStanStorageJSONLink1: TFDStanStorageJSONLink
    Left = 792
    Top = 264
  end
  object NotificationCenter1: TNotificationCenter
    Left = 816
    Top = 336
  end
  object TAuxMarcas: TFDQuery
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select * from auxmarcas'
      'where syncaws=0 '
      'order by id'
      '')
    Left = 40
    Top = 176
    object TAuxMarcasid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TAuxMarcasstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TAuxMarcasdatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TAuxMarcasidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TAuxMarcasdataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TAuxMarcasidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TAuxMarcasnome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TAuxMarcasidsegmento: TIntegerField
      FieldName = 'idsegmento'
      Origin = 'idsegmento'
    end
    object TAuxMarcassyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
  end
  object TSyncProdutos: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select '
      ' *'
      'from produtos pr '
      'where syncaws=0')
    Left = 44
    Top = 226
    object TSyncProdutosid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TSyncProdutosstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TSyncProdutosdatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TSyncProdutosidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TSyncProdutosdataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TSyncProdutosidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TSyncProdutosnome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TSyncProdutostipo: TWideStringField
      FieldName = 'tipo'
      Origin = 'tipo'
    end
    object TSyncProdutosunidademedida: TWideStringField
      FieldName = 'unidademedida'
      Origin = 'unidademedida'
      Size = 10
    end
    object TSyncProdutosestoqueminimo: TBCDField
      FieldName = 'estoqueminimo'
      Origin = 'estoqueminimo'
      Precision = 15
      Size = 2
    end
    object TSyncProdutosobservacao: TWideStringField
      FieldName = 'observacao'
      Origin = 'observacao'
      Size = 100
    end
    object TSyncProdutoscodigobarras: TWideStringField
      FieldName = 'codigobarras'
      Origin = 'codigobarras'
    end
    object TSyncProdutosidcategoria: TIntegerField
      FieldName = 'idcategoria'
      Origin = 'idcategoria'
    end
    object TSyncProdutosidsegmento: TIntegerField
      FieldName = 'idsegmento'
      Origin = 'idsegmento'
    end
    object TSyncProdutosnumeroserie: TIntegerField
      FieldName = 'numeroserie'
      Origin = 'numeroserie'
    end
    object TSyncProdutosreferencia: TWideStringField
      FieldName = 'referencia'
      Origin = 'referencia'
      Size = 30
    end
    object TSyncProdutosimg: TBlobField
      FieldName = 'img'
      Origin = 'img'
    end
    object TSyncProdutospesoembalagem: TBCDField
      FieldName = 'pesoembalagem'
      Origin = 'pesoembalagem'
      Precision = 15
      Size = 2
    end
    object TSyncProdutosidgrupo: TIntegerField
      FieldName = 'idgrupo'
      Origin = 'idgrupo'
    end
    object TSyncProdutosidsubgrupo: TIntegerField
      FieldName = 'idsubgrupo'
      Origin = 'idsubgrupo'
    end
    object TSyncProdutosidmarca: TIntegerField
      FieldName = 'idmarca'
      Origin = 'idmarca'
    end
    object TSyncProdutoscodigofabricante: TWideStringField
      FieldName = 'codigofabricante'
      Origin = 'codigofabricante'
      Size = 30
    end
    object TSyncProdutossyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TSyncProdutosdefensivos: TIntegerField
      FieldName = 'defensivos'
      Origin = 'defensivos'
    end
  end
  object TSyncAuxCulturas: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select * from AuxCulturas'
      'where syncaws=0 ')
    Left = 40
    Top = 288
    object TSyncAuxCulturasid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TSyncAuxCulturasstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TSyncAuxCulturasdatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TSyncAuxCulturasidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TSyncAuxCulturasdataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TSyncAuxCulturasidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TSyncAuxCulturasnome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TSyncAuxCulturassyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
  end
  object TSyncAuxTipoMaqVeic: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select * from auxtipomaquinaveiculos'
      'where syncaws=0 '
      'order by id')
    Left = 154
    Top = 8
    object TSyncAuxTipoMaqVeicid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TSyncAuxTipoMaqVeicstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TSyncAuxTipoMaqVeicdatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TSyncAuxTipoMaqVeicidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TSyncAuxTipoMaqVeicdataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TSyncAuxTipoMaqVeicidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TSyncAuxTipoMaqVeicnome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TSyncAuxTipoMaqVeicidsegmento: TIntegerField
      FieldName = 'idsegmento'
      Origin = 'idsegmento'
    end
  end
  object TSyncAuxTipoOcorrencia: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select * from auxtipoocorrencia'
      'where syncaws=0 '
      'order by id')
    Left = 160
    Top = 64
    object TSyncAuxTipoOcorrenciaid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TSyncAuxTipoOcorrenciastatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TSyncAuxTipoOcorrenciadatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TSyncAuxTipoOcorrenciaidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TSyncAuxTipoOcorrenciadataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TSyncAuxTipoOcorrenciaidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TSyncAuxTipoOcorrencianome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TSyncAuxTipoOcorrenciasyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
  end
  object TSyncServico: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select '
      ' *'
      'from servico a '
      'where syncaws=0 '
      'order by id')
    Left = 144
    Top = 184
    object TSyncServicoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TSyncServicostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TSyncServicodatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TSyncServicoidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TSyncServicodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TSyncServicoidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TSyncServicoidtipo: TIntegerField
      FieldName = 'idtipo'
      Origin = 'idtipo'
    end
    object TSyncServicodescricao: TWideStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 100
    end
    object TSyncServicoidsegmento: TIntegerField
      FieldName = 'idsegmento'
      Origin = 'idsegmento'
    end
    object TSyncServicoresponsavel: TWideStringField
      FieldName = 'responsavel'
      Origin = 'responsavel'
      Size = 100
    end
    object TSyncServicodataprevista: TDateField
      FieldName = 'dataprevista'
      Origin = 'dataprevista'
    end
    object TSyncServicosyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
  end
  object TSyncAuxTipoServico: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select * from auxTipoServico'
      'where syncaws=0 '
      'order by id')
    Left = 152
    Top = 120
    object TSyncAuxTipoServicoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TSyncAuxTipoServicostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TSyncAuxTipoServicodatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TSyncAuxTipoServicoidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TSyncAuxTipoServicodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TSyncAuxTipoServicoidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TSyncAuxTipoServiconome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TSyncAuxTipoServicoidsegmento: TIntegerField
      FieldName = 'idsegmento'
      Origin = 'idsegmento'
    end
    object TSyncAuxTipoServicosyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
  end
  object TAuxSyncCobertura: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select * from auxCobertura'
      'where syncaws=0 '
      'order by id')
    Left = 144
    Top = 240
    object TAuxSyncCoberturaid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TAuxSyncCoberturastatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TAuxSyncCoberturadatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TAuxSyncCoberturaidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TAuxSyncCoberturadataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TAuxSyncCoberturaidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TAuxSyncCoberturanome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TAuxSyncCoberturasyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
  end
  object TAuxSyncCultivares: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select * from auxCultivares'
      'where syncaws=0 '
      'order by id')
    Left = 144
    Top = 288
    object TAuxSyncCultivaresid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TAuxSyncCultivaresstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TAuxSyncCultivaresdatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TAuxSyncCultivaresidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TAuxSyncCultivaresdataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TAuxSyncCultivaresidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TAuxSyncCultivaresnome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TAuxSyncCultivaressyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
  end
  object TSyncAreas: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select * from areas '
      'where syncaws=0 '
      'order by id')
    Left = 144
    Top = 344
    object TSyncAreasid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TSyncAreasstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TSyncAreasdatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TSyncAreasidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TSyncAreasdataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TSyncAreasidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TSyncAreasnome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TSyncAreasareahe: TBCDField
      FieldName = 'areahe'
      Origin = 'areahe'
      Precision = 15
      Size = 2
    end
    object TSyncAreasidresponsavel: TIntegerField
      FieldName = 'idresponsavel'
      Origin = 'idresponsavel'
    end
    object TSyncAreassyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TSyncAreaslatitude: TWideStringField
      FieldName = 'latitude'
      Origin = 'latitude'
    end
    object TSyncAreaslongitude: TWideStringField
      FieldName = 'longitude'
      Origin = 'longitude'
    end
    object TSyncAreassyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
  end
  object TSyncSetores: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select * from setor '
      'where syncaws=0 '
      'order by id'
      '')
    Left = 144
    Top = 400
    object TSyncSetoresid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TSyncSetoresstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TSyncSetoresdatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TSyncSetoresidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TSyncSetoresdataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TSyncSetoresidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TSyncSetoresnome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TSyncSetoresareahe: TBCDField
      FieldName = 'areahe'
      Origin = 'areahe'
      Precision = 15
      Size = 2
    end
    object TSyncSetoresidarea: TIntegerField
      FieldName = 'idarea'
      Origin = 'idarea'
    end
    object TSyncSetoreslatitude: TWideStringField
      FieldName = 'latitude'
      Origin = 'latitude'
    end
    object TSyncSetoreslongitude: TWideStringField
      FieldName = 'longitude'
      Origin = 'longitude'
    end
    object TSyncSetoressyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TSyncSetoressyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
  end
  object TSyncTalhoes: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select * from talhoes s'
      'where syncaws=0 '
      'order by id')
    Left = 248
    Top = 8
    object TSyncTalhoesid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TSyncTalhoesstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TSyncTalhoesdatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TSyncTalhoesidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TSyncTalhoesdataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TSyncTalhoesidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TSyncTalhoesnome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TSyncTalhoesareahe: TBCDField
      FieldName = 'areahe'
      Origin = 'areahe'
      Precision = 15
      Size = 2
    end
    object TSyncTalhoesidsetor: TIntegerField
      FieldName = 'idsetor'
      Origin = 'idsetor'
    end
    object TSyncTalhoesqrcode: TWideStringField
      FieldName = 'qrcode'
      Origin = 'qrcode'
    end
    object TSyncTalhoestipo: TIntegerField
      FieldName = 'tipo'
      Origin = 'tipo'
    end
    object TSyncTalhoesobservacao: TWideStringField
      FieldName = 'observacao'
      Origin = 'observacao'
      Size = 100
    end
    object TSyncTalhoessyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TSyncTalhoeslatitude: TWideStringField
      FieldName = 'latitude'
      Origin = 'latitude'
    end
    object TSyncTalhoeslongitude: TWideStringField
      FieldName = 'longitude'
      Origin = 'longitude'
    end
    object TSyncTalhoessyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
  end
  object TSyncMaquinas: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select * from maquinaveiculo a '
      'where syncaws=0 '
      'order by id')
    Left = 248
    Top = 65
    object TSyncMaquinasid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TSyncMaquinasstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TSyncMaquinasdatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TSyncMaquinasidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TSyncMaquinasdataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TSyncMaquinasidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TSyncMaquinasidtipo: TIntegerField
      FieldName = 'idtipo'
      Origin = 'idtipo'
    end
    object TSyncMaquinasidmarca: TIntegerField
      FieldName = 'idmarca'
      Origin = 'idmarca'
    end
    object TSyncMaquinasmodelo: TWideStringField
      FieldName = 'modelo'
      Origin = 'modelo'
      Size = 50
    end
    object TSyncMaquinasplaca: TWideStringField
      FieldName = 'placa'
      Origin = 'placa'
    end
    object TSyncMaquinasano: TIntegerField
      FieldName = 'ano'
      Origin = 'ano'
    end
    object TSyncMaquinaschassi: TWideStringField
      FieldName = 'chassi'
      Origin = 'chassi'
      Size = 30
    end
    object TSyncMaquinascombustivel: TIntegerField
      FieldName = 'combustivel'
      Origin = 'combustivel'
    end
    object TSyncMaquinasvalor: TBCDField
      FieldName = 'valor'
      Origin = 'valor'
      Precision = 15
      Size = 2
    end
    object TSyncMaquinasnumeroserie: TWideStringField
      FieldName = 'numeroserie'
      Origin = 'numeroserie'
      Size = 30
    end
    object TSyncMaquinasimg: TBlobField
      FieldName = 'img'
      Origin = 'img'
    end
    object TSyncMaquinasprefixo: TWideStringField
      FieldName = 'prefixo'
      Origin = 'prefixo'
    end
    object TSyncMaquinasidcategoria: TIntegerField
      FieldName = 'idcategoria'
      Origin = 'idcategoria'
    end
    object TSyncMaquinasidsegmento: TIntegerField
      FieldName = 'idsegmento'
      Origin = 'idsegmento'
    end
    object TSyncMaquinasanomodelo: TIntegerField
      FieldName = 'anomodelo'
      Origin = 'anomodelo'
    end
    object TSyncMaquinassyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
  end
  object TSyncSafra: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select a.* from safra a'
      'where syncaws=0 '
      'order by id')
    Left = 248
    Top = 120
    object TSyncSafraid: TIntegerField
      FieldName = 'id'
    end
    object TSyncSafrastatus: TIntegerField
      FieldName = 'status'
    end
    object TSyncSafradatareg: TSQLTimeStampField
      FieldName = 'datareg'
    end
    object TSyncSafraidusuario: TIntegerField
      FieldName = 'idusuario'
    end
    object TSyncSafradataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
    end
    object TSyncSafraidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
    end
    object TSyncSafranome: TWideStringField
      FieldName = 'nome'
      Size = 50
    end
    object TSyncSafradatainicio: TDateField
      FieldName = 'datainicio'
    end
    object TSyncSafradatafim: TDateField
      FieldName = 'datafim'
    end
    object TSyncSafraobservacao: TWideStringField
      FieldName = 'observacao'
      Size = 100
    end
    object TSyncSafrasyncaws: TIntegerField
      FieldName = 'syncaws'
    end
  end
  object TDetReceituario: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select d.* from DetReceiturario d '
      'where syncaws=0 '
      'order by id')
    Left = 248
    Top = 232
    object TDetReceituarioid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TDetReceituariostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TDetReceituariodatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TDetReceituarioidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TDetReceituariodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TDetReceituarioidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TDetReceituarioidreceiturario: TIntegerField
      FieldName = 'idreceiturario'
      Origin = 'idreceiturario'
    end
    object TDetReceituarioqtdporhe: TBCDField
      FieldName = 'qtdporhe'
      Origin = 'qtdporhe'
      Precision = 15
      Size = 2
    end
    object TDetReceituarioidproduto: TIntegerField
      FieldName = 'idproduto'
      Origin = 'idproduto'
    end
    object TDetReceituariosyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TDetReceituariofinalidade: TWideStringField
      FieldName = 'finalidade'
      Origin = 'finalidade'
      Size = 100
    end
    object TDetReceituariosyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
  end
  object TSyncReceituario: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select b.* from receiturario b'
      'where syncaws=0 '
      'order by id'
      ''
      '')
    Left = 248
    Top = 176
    object TSyncReceituarioid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TSyncReceituariostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TSyncReceituariodatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TSyncReceituarioidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TSyncReceituariodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TSyncReceituarioidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TSyncReceituarionome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TSyncReceituarioidresponsavel: TIntegerField
      FieldName = 'idresponsavel'
      Origin = 'idresponsavel'
    end
    object TSyncReceituariosyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
  end
  object TSyncOperacaoSafraTalhao: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select os.* from operacaosafratalhao os '
      'where syncaws=0 '
      'order by id')
    Left = 368
    Top = 8
    object TSyncOperacaoSafraTalhaoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TSyncOperacaoSafraTalhaostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TSyncOperacaoSafraTalhaodatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TSyncOperacaoSafraTalhaoidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TSyncOperacaoSafraTalhaodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TSyncOperacaoSafraTalhaoidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TSyncOperacaoSafraTalhaoidsafra: TIntegerField
      FieldName = 'idsafra'
      Origin = 'idsafra'
    end
    object TSyncOperacaoSafraTalhaoidoperacao: TIntegerField
      FieldName = 'idoperacao'
      Origin = 'idoperacao'
    end
    object TSyncOperacaoSafraTalhaodatainicio: TDateField
      FieldName = 'datainicio'
      Origin = 'datainicio'
    end
    object TSyncOperacaoSafraTalhaodatafim: TDateField
      FieldName = 'datafim'
      Origin = 'datafim'
    end
    object TSyncOperacaoSafraTalhaoobservacao: TWideStringField
      FieldName = 'observacao'
      Origin = 'observacao'
      Size = 100
    end
    object TSyncOperacaoSafraTalhaoidtalhao: TIntegerField
      FieldName = 'idtalhao'
      Origin = 'idtalhao'
    end
    object TSyncOperacaoSafraTalhaoidresponsavel: TIntegerField
      FieldName = 'idresponsavel'
      Origin = 'idresponsavel'
    end
    object TSyncOperacaoSafraTalhaoareaprevista: TBCDField
      FieldName = 'areaprevista'
      Origin = 'areaprevista'
      Precision = 15
      Size = 2
    end
    object TSyncOperacaoSafraTalhaoarearealizada: TBCDField
      FieldName = 'arearealizada'
      Origin = 'arearealizada'
      Precision = 15
      Size = 2
    end
    object TSyncOperacaoSafraTalhaotipoterraaereo: TWideStringField
      FieldName = 'tipoterraaereo'
      Origin = 'tipoterraaereo'
      Size = 10
    end
    object TSyncOperacaoSafraTalhaoidtipoaplicacaosolido: TIntegerField
      FieldName = 'idtipoaplicacaosolido'
      Origin = 'idtipoaplicacaosolido'
    end
    object TSyncOperacaoSafraTalhaoidcultura: TIntegerField
      FieldName = 'idcultura'
      Origin = 'idcultura'
    end
    object TSyncOperacaoSafraTalhaoidvariedade: TIntegerField
      FieldName = 'idvariedade'
      Origin = 'idvariedade'
    end
    object TSyncOperacaoSafraTalhaofinalidade: TWideStringField
      FieldName = 'finalidade'
      Origin = 'finalidade'
      Size = 30
    end
    object TSyncOperacaoSafraTalhaoidreceituario: TIntegerField
      FieldName = 'idreceituario'
      Origin = 'idreceituario'
    end
    object TSyncOperacaoSafraTalhaosyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TSyncOperacaoSafraTalhaoidcobertura: TIntegerField
      FieldName = 'idcobertura'
    end
    object TSyncOperacaoSafraTalhaosyncfaz: TIntegerField
      FieldName = 'syncfaz'
    end
    object TSyncOperacaoSafraTalhaoqualidadecobertura: TWideStringField
      FieldName = 'qualidadecobertura'
    end
  end
  object TSyncMaquinasOperacao: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select * from detoperacaosafratalhaomaquinasoperadores a'
      'where syncaws=0 '
      'order by id')
    Left = 368
    Top = 64
    object TSyncMaquinasOperacaoid: TIntegerField
      FieldName = 'id'
    end
    object TSyncMaquinasOperacaostatus: TIntegerField
      FieldName = 'status'
    end
    object TSyncMaquinasOperacaodatareg: TSQLTimeStampField
      FieldName = 'datareg'
    end
    object TSyncMaquinasOperacaoidusuario: TIntegerField
      FieldName = 'idusuario'
    end
    object TSyncMaquinasOperacaodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
    end
    object TSyncMaquinasOperacaoidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
    end
    object TSyncMaquinasOperacaoidoperacaotalhao: TIntegerField
      FieldName = 'idoperacaotalhao'
    end
    object TSyncMaquinasOperacaoidmaquina: TIntegerField
      FieldName = 'idmaquina'
    end
    object TSyncMaquinasOperacaooperador: TWideStringField
      FieldName = 'operador'
      Size = 100
    end
    object TSyncMaquinasOperacaoobservacao: TWideStringField
      FieldName = 'observacao'
      Size = 100
    end
    object TSyncMaquinasOperacaodata: TDateField
      FieldName = 'data'
    end
    object TSyncMaquinasOperacaohorainicio: TBCDField
      FieldName = 'horainicio'
      Precision = 15
      Size = 3
    end
    object TSyncMaquinasOperacaohorafim: TBCDField
      FieldName = 'horafim'
      Precision = 15
      Size = 3
    end
    object TSyncMaquinasOperacaohoraparada: TBCDField
      FieldName = 'horaparada'
      Precision = 15
      Size = 3
    end
    object TSyncMaquinasOperacaohorastrabalhada: TBCDField
      FieldName = 'horastrabalhada'
      Precision = 15
      Size = 3
    end
    object TSyncMaquinasOperacaosyncaws: TIntegerField
      FieldName = 'syncaws'
    end
    object TSyncMaquinasOperacaoidoperador: TIntegerField
      FieldName = 'idoperador'
      Origin = 'idoperador'
    end
  end
  object TSyncProdutosOperacao: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select * from public.DetOperacaoSafraTalhaoProdutos '
      'where syncaws=0 '
      'order by id'
      '')
    Left = 368
    Top = 120
    object TSyncProdutosOperacaoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TSyncProdutosOperacaostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TSyncProdutosOperacaodatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TSyncProdutosOperacaoidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TSyncProdutosOperacaodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TSyncProdutosOperacaoidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TSyncProdutosOperacaoidoperacaotalhao: TIntegerField
      FieldName = 'idoperacaotalhao'
      Origin = 'idoperacaotalhao'
    end
    object TSyncProdutosOperacaoidproduto: TIntegerField
      FieldName = 'idproduto'
      Origin = 'idproduto'
    end
    object TSyncProdutosOperacaoobservacao: TWideStringField
      FieldName = 'observacao'
      Origin = 'observacao'
      Size = 100
    end
    object TSyncProdutosOperacaodata: TDateField
      FieldName = 'data'
      Origin = 'data'
    end
    object TSyncProdutosOperacaosyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TSyncProdutosOperacaoqtdeutilidado: TBCDField
      FieldName = 'qtdeutilidado'
      Precision = 15
      Size = 3
    end
  end
  object TSyncOcorrenciaOperacao: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select * from DetOperacaoSafraTalhaoOcorrencia '
      'where syncaws=0 '
      'order by id')
    Left = 373
    Top = 178
    object TSyncOcorrenciaOperacaoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TSyncOcorrenciaOperacaostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TSyncOcorrenciaOperacaodatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TSyncOcorrenciaOperacaoidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TSyncOcorrenciaOperacaodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TSyncOcorrenciaOperacaoidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TSyncOcorrenciaOperacaoidoperacaotalhao: TIntegerField
      FieldName = 'idoperacaotalhao'
      Origin = 'idoperacaotalhao'
    end
    object TSyncOcorrenciaOperacaodataocorrencia: TDateField
      FieldName = 'dataocorrencia'
      Origin = 'dataocorrencia'
    end
    object TSyncOcorrenciaOperacaoidtipoocorrencia: TIntegerField
      FieldName = 'idtipoocorrencia'
      Origin = 'idtipoocorrencia'
    end
    object TSyncOcorrenciaOperacaohora: TTimeField
      FieldName = 'hora'
      Origin = 'hora'
    end
    object TSyncOcorrenciaOperacaodescricao: TWideStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 100
    end
    object TSyncOcorrenciaOperacaodata: TDateField
      FieldName = 'data'
      Origin = 'data'
    end
    object TSyncOcorrenciaOperacaosyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
  end
  object TSyncUsuario: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select '
      ' *'
      'from usuario U'
      'where syncaws=0 '
      'order by id'
      ''
      ''
      ''
      ''
      '')
    Left = 368
    Top = 232
    object TSyncUsuarioid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TSyncUsuariostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TSyncUsuariodatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TSyncUsuarioidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TSyncUsuariodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TSyncUsuarioidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TSyncUsuarionome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 100
    end
    object TSyncUsuariousuario: TWideStringField
      FieldName = 'usuario'
      Origin = 'usuario'
      Size = 25
    end
    object TSyncUsuariosenha: TWideStringField
      FieldName = 'senha'
      Origin = 'senha'
      Size = 50
    end
    object TSyncUsuariotipo: TIntegerField
      FieldName = 'tipo'
      Origin = 'tipo'
    end
    object TSyncUsuarioidsupervisor: TIntegerField
      FieldName = 'idsupervisor'
      Origin = 'idsupervisor'
    end
    object TSyncUsuarioidsegmento: TIntegerField
      FieldName = 'idsegmento'
      Origin = 'idsegmento'
    end
    object TSyncUsuariosyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TSyncUsuarioimgass: TBlobField
      FieldName = 'imgass'
      Origin = 'imgass'
    end
  end
  object TSyncFornecedores: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select * from fornecedor'
      'where syncaws=0 '
      'order by id'
      '')
    Left = 370
    Top = 291
    object TSyncFornecedoresid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TSyncFornecedoresstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TSyncFornecedoresdatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TSyncFornecedoresidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TSyncFornecedoresdataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TSyncFornecedoresidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TSyncFornecedoresnome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 100
    end
    object TSyncFornecedorescidade: TWideStringField
      FieldName = 'cidade'
      Origin = 'cidade'
      Size = 100
    end
    object TSyncFornecedoresuf: TWideStringField
      FieldName = 'uf'
      Origin = 'uf'
      FixedChar = True
      Size = 2
    end
    object TSyncFornecedorescpf_cnpj: TWideStringField
      FieldName = 'cpf_cnpj'
      Origin = 'cpf_cnpj'
      Size = 30
    end
    object TSyncFornecedorestelefone_fixo: TWideStringField
      FieldName = 'telefone_fixo'
      Origin = 'telefone_fixo'
    end
    object TSyncFornecedorescelular: TWideStringField
      FieldName = 'celular'
      Origin = 'celular'
    end
    object TSyncFornecedoresemail: TWideStringField
      FieldName = 'email'
      Origin = 'email'
      Size = 100
    end
    object TSyncFornecedorescontatopessoa: TWideStringField
      FieldName = 'contatopessoa'
      Origin = 'contatopessoa'
      Size = 100
    end
    object TSyncFornecedoressenha: TWideStringField
      FieldName = 'senha'
      Origin = 'senha'
    end
    object TSyncFornecedoresrazaosocial: TWideStringField
      FieldName = 'razaosocial'
      Origin = 'razaosocial'
      Size = 100
    end
    object TSyncFornecedoresinscricaoestadual: TWideStringField
      FieldName = 'inscricaoestadual'
      Origin = 'inscricaoestadual'
    end
    object TSyncFornecedoressyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
  end
  object TSyncPedidoCompra: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select *'
      'from pedidocompra a '
      'where syncaws=0 '
      'order by id')
    Left = 504
    Top = 11
    object TSyncPedidoCompraid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TSyncPedidoComprastatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TSyncPedidoCompradatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TSyncPedidoCompraidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TSyncPedidoCompradataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TSyncPedidoCompraidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TSyncPedidoCompraidsegmento: TIntegerField
      FieldName = 'idsegmento'
      Origin = 'idsegmento'
    end
    object TSyncPedidoCompraidcategoria: TIntegerField
      FieldName = 'idcategoria'
      Origin = 'idcategoria'
    end
    object TSyncPedidoCompraidentificador: TWideStringField
      FieldName = 'identificador'
      Origin = 'identificador'
    end
    object TSyncPedidoCompraidsupervisoraprovacao: TIntegerField
      FieldName = 'idsupervisoraprovacao'
      Origin = 'idsupervisoraprovacao'
    end
    object TSyncPedidoCompradataaprovacaosupervisor: TDateField
      FieldName = 'dataaprovacaosupervisor'
      Origin = 'dataaprovacaosupervisor'
    end
    object TSyncPedidoCompraiddiretoriaaprovacao: TIntegerField
      FieldName = 'iddiretoriaaprovacao'
      Origin = 'iddiretoriaaprovacao'
    end
    object TSyncPedidoCompradataaprovacaodiretoria: TDateField
      FieldName = 'dataaprovacaodiretoria'
      Origin = 'dataaprovacaodiretoria'
    end
    object TSyncPedidoCompradatapedido: TDateField
      FieldName = 'datapedido'
      Origin = 'datapedido'
    end
    object TSyncPedidoCompraidsolicitante: TIntegerField
      FieldName = 'idsolicitante'
      Origin = 'idsolicitante'
    end
    object TSyncPedidoCompracancelado: TIntegerField
      FieldName = 'cancelado'
      Origin = 'cancelado'
    end
    object TSyncPedidoCompraidmaquina: TIntegerField
      FieldName = 'idmaquina'
      Origin = 'idmaquina'
    end
    object TSyncPedidoCompraidservico: TIntegerField
      FieldName = 'idservico'
      Origin = 'idservico'
    end
    object TSyncPedidoCompraflagurgente: TIntegerField
      FieldName = 'flagurgente'
      Origin = 'flagurgente'
    end
    object TSyncPedidoComprasyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
  end
  object TItensPedido: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select * from pedidocompraitems i '
      'where syncaws=0 '
      'order by id')
    Left = 504
    Top = 75
    object TItensPedidoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TItensPedidoidpedido: TIntegerField
      FieldName = 'idpedido'
      Origin = 'idpedido'
    end
    object TItensPedidoiditem: TIntegerField
      FieldName = 'iditem'
      Origin = 'iditem'
    end
    object TItensPedidotipo: TIntegerField
      FieldName = 'tipo'
      Origin = 'tipo'
    end
    object TItensPedidoobservacao: TWideStringField
      FieldName = 'observacao'
      Origin = 'observacao'
      Size = 100
    end
    object TItensPedidostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TItensPedidodatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TItensPedidoidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TItensPedidodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TItensPedidoidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TItensPedidoquantidade: TIntegerField
      FieldName = 'quantidade'
      Origin = 'quantidade'
    end
    object TItensPedidounidademedida: TWideStringField
      FieldName = 'unidademedida'
      Origin = 'unidademedida'
    end
    object TItensPedidovalorunidade: TBCDField
      FieldName = 'valorunidade'
      Origin = 'valorunidade'
      Precision = 15
      Size = 2
    end
    object TItensPedidovalortotal: TBCDField
      FieldName = 'valortotal'
      Origin = 'valortotal'
      Precision = 15
      Size = 2
    end
    object TItensPedidoidorcamento: TIntegerField
      FieldName = 'idorcamento'
      Origin = 'idorcamento'
    end
    object TItensPedidoqtdrealizada: TIntegerField
      FieldName = 'qtdrealizada'
      Origin = 'qtdrealizada'
    end
    object TItensPedidorecebido: TBooleanField
      FieldName = 'recebido'
      Origin = 'recebido'
    end
    object TItensPedidoobservacaorecebimento: TWideStringField
      FieldName = 'observacaorecebimento'
      Origin = 'observacaorecebimento'
      Size = 100
    end
    object TItensPedidodatarecebimento: TDateField
      FieldName = 'datarecebimento'
      Origin = 'datarecebimento'
    end
    object TItensPedidoidusuariorecebimento: TIntegerField
      FieldName = 'idusuariorecebimento'
      Origin = 'idusuariorecebimento'
    end
    object TItensPedidosyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
  end
  object TStatusPedido: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select  *'
      'from pedidostatus '
      'where syncaws=0 '
      'order by id')
    Left = 504
    Top = 131
    object TStatusPedidoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TStatusPedidostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TStatusPedidodatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TStatusPedidoidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TStatusPedidodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TStatusPedidoidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TStatusPedidoidpedido: TIntegerField
      FieldName = 'idpedido'
      Origin = 'idpedido'
    end
    object TStatusPedidoidstatus: TIntegerField
      FieldName = 'idstatus'
      Origin = 'idstatus'
    end
    object TStatusPedidoobservacao: TWideStringField
      FieldName = 'observacao'
      Origin = 'observacao'
      Size = 100
    end
    object TStatusPedidodatastatus: TDateField
      FieldName = 'datastatus'
      Origin = 'datastatus'
    end
    object TStatusPedidosyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
  end
  object TOrcamento: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select'
      '*'
      'from orcamentos b'
      'where syncaws=0 '
      'order by id')
    Left = 504
    Top = 192
    object TOrcamentoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TOrcamentostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TOrcamentodatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TOrcamentoidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TOrcamentodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TOrcamentoidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TOrcamentoidfornecedor: TIntegerField
      FieldName = 'idfornecedor'
      Origin = 'idfornecedor'
    end
    object TOrcamentoidpedido: TIntegerField
      FieldName = 'idpedido'
      Origin = 'idpedido'
    end
    object TOrcamentoobservacao: TWideStringField
      FieldName = 'observacao'
      Origin = 'observacao'
      Size = 100
    end
    object TOrcamentosyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
  end
  object TItensOrcamento: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select'
      '*'
      'from public.orcamentosItens a'
      'where syncaws=0 '
      'order by id')
    Left = 504
    Top = 248
    object TItensOrcamentoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TItensOrcamentostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TItensOrcamentodatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TItensOrcamentoidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TItensOrcamentodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TItensOrcamentoidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TItensOrcamentoidorcamento: TIntegerField
      FieldName = 'idorcamento'
      Origin = 'idorcamento'
    end
    object TItensOrcamentoidproduto: TIntegerField
      FieldName = 'idproduto'
      Origin = 'idproduto'
    end
    object TItensOrcamentovalorunidade: TBCDField
      FieldName = 'valorunidade'
      Origin = 'valorunidade'
      Precision = 15
      Size = 2
    end
    object TItensOrcamentovalortotal: TBCDField
      FieldName = 'valortotal'
      Origin = 'valortotal'
      Precision = 15
      Size = 2
    end
    object TItensOrcamentoobservacao: TWideStringField
      FieldName = 'observacao'
      Origin = 'observacao'
      Size = 100
    end
    object TItensOrcamentoqtde: TIntegerField
      FieldName = 'qtde'
      Origin = 'qtde'
    end
    object TItensOrcamentosyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
  end
  object TSyncLocalEstoque: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select *'
      'from LocalEstoque a'
      'where syncaws =0')
    Left = 648
    Top = 24
    object TSyncLocalEstoqueid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TSyncLocalEstoquestatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TSyncLocalEstoquedatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TSyncLocalEstoqueidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TSyncLocalEstoquedataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TSyncLocalEstoqueidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TSyncLocalEstoquenome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TSyncLocalEstoqueidsegmento: TIntegerField
      FieldName = 'idsegmento'
      Origin = 'idsegmento'
    end
    object TSyncLocalEstoquesyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
  end
  object TSyncCentroCusto: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select * from CentroCusto'
      'where syncaws=0 '
      'order by id')
    Left = 648
    Top = 80
    object TSyncCentroCustoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TSyncCentroCustostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TSyncCentroCustodatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TSyncCentroCustoidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TSyncCentroCustodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TSyncCentroCustoidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TSyncCentroCustonome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TSyncCentroCustoidsegmento: TIntegerField
      FieldName = 'idsegmento'
      Origin = 'idsegmento'
    end
    object TSyncCentroCustosyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
  end
  object TSyncEstoqueEntrada: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select '
      ' a.*'
      'from estoqueentrada a '
      'where syncaws=0 '
      'order by id')
    Left = 648
    Top = 136
    object TSyncEstoqueEntradaid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TSyncEstoqueEntradastatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TSyncEstoqueEntradadatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TSyncEstoqueEntradaidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TSyncEstoqueEntradadataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TSyncEstoqueEntradaidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TSyncEstoqueEntradaidproduto: TIntegerField
      FieldName = 'idproduto'
      Origin = 'idproduto'
    end
    object TSyncEstoqueEntradaidfornecedor: TIntegerField
      FieldName = 'idfornecedor'
      Origin = 'idfornecedor'
    end
    object TSyncEstoqueEntradaidpedido: TIntegerField
      FieldName = 'idpedido'
      Origin = 'idpedido'
    end
    object TSyncEstoqueEntradanumeronf: TIntegerField
      FieldName = 'numeronf'
      Origin = 'numeronf'
    end
    object TSyncEstoqueEntradadataemissao: TDateField
      FieldName = 'dataemissao'
      Origin = 'dataemissao'
    end
    object TSyncEstoqueEntradadataentradaestoque: TDateField
      FieldName = 'dataentradaestoque'
      Origin = 'dataentradaestoque'
    end
    object TSyncEstoqueEntradavalortotalnf: TFMTBCDField
      FieldName = 'valortotalnf'
      Origin = 'valortotalnf'
      Precision = 18
      Size = 2
    end
    object TSyncEstoqueEntradaqtditens: TFMTBCDField
      FieldName = 'qtditens'
      Origin = 'qtditens'
      Precision = 18
      Size = 2
    end
    object TSyncEstoqueEntradaunidademedida: TWideStringField
      FieldName = 'unidademedida'
      Origin = 'unidademedida'
    end
    object TSyncEstoqueEntradapesoembalagem: TFMTBCDField
      FieldName = 'pesoembalagem'
      Origin = 'pesoembalagem'
      Precision = 18
      Size = 2
    end
    object TSyncEstoqueEntradaidlocalestoque: TIntegerField
      FieldName = 'idlocalestoque'
      Origin = 'idlocalestoque'
    end
    object TSyncEstoqueEntradaidcentrocusto: TIntegerField
      FieldName = 'idcentrocusto'
      Origin = 'idcentrocusto'
    end
    object TSyncEstoqueEntradasyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
  end
  object TSyncOperadorMaquina: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select * from OperadorMaquinas'
      'where syncaws=0 '
      'order by id')
    Left = 248
    Top = 344
    object TSyncOperadorMaquinaid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TSyncOperadorMaquinastatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TSyncOperadorMaquinadatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TSyncOperadorMaquinaidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TSyncOperadorMaquinadataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TSyncOperadorMaquinaidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TSyncOperadorMaquinanome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TSyncOperadorMaquinasyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TSyncOperadorMaquinarg: TWideStringField
      FieldName = 'rg'
      Origin = 'rg'
      Size = 10
    end
    object TSyncOperadorMaquinacpf: TWideStringField
      FieldName = 'cpf'
      Origin = 'cpf'
    end
    object TSyncOperadorMaquinacnh: TWideStringField
      FieldName = 'cnh'
      Origin = 'cnh'
    end
    object TSyncOperadorMaquinacelular: TWideStringField
      FieldName = 'celular'
      Origin = 'celular'
    end
  end
  object TAuxTipoCultivare: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select * from auxTipoCultivar'
      'where syncaws=0 '
      '')
    Left = 40
    Top = 344
    object TAuxTipoCultivareid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TAuxTipoCultivarestatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TAuxTipoCultivaredatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TAuxTipoCultivareidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TAuxTipoCultivaredataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TAuxTipoCultivareidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TAuxTipoCultivarenome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TAuxTipoCultivaresyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 816
    Top = 200
  end
  object TDetReceituarioTalhao: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select d.* from detreceiturarioTalhao d '
      'where syncaws=0 '
      'order by id')
    Left = 256
    Top = 288
    object TDetReceituarioTalhaoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TDetReceituarioTalhaostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TDetReceituarioTalhaodatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TDetReceituarioTalhaoidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TDetReceituarioTalhaodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TDetReceituarioTalhaoidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TDetReceituarioTalhaoidtalhao: TIntegerField
      FieldName = 'idtalhao'
      Origin = 'idtalhao'
    end
    object TDetReceituarioTalhaoareahe: TBCDField
      FieldName = 'areahe'
      Origin = 'areahe'
      Precision = 15
      Size = 2
    end
    object TDetReceituarioTalhaosyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TDetReceituarioTalhaosyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
    object TDetReceituarioTalhaoidreceiturario: TIntegerField
      FieldName = 'idreceiturario'
      Origin = 'idreceiturario'
    end
  end
  object TSyncVazaoOperacao: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select * from DetVazaoOperacao'
      'where syncaws=0 '
      'order by id')
    Left = 248
    Top = 392
    object TSyncVazaoOperacaoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TSyncVazaoOperacaostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TSyncVazaoOperacaodatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TSyncVazaoOperacaoidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TSyncVazaoOperacaodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TSyncVazaoOperacaoidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TSyncVazaoOperacaoidoperacaotalhao: TIntegerField
      FieldName = 'idoperacaotalhao'
      Origin = 'idoperacaotalhao'
    end
    object TSyncVazaoOperacaocincoltha: TIntegerField
      FieldName = 'cincoltha'
      Origin = 'cincoltha'
    end
    object TSyncVazaoOperacaodezltha: TIntegerField
      FieldName = 'dezltha'
      Origin = 'dezltha'
    end
    object TSyncVazaoOperacaoquinzeltha: TIntegerField
      FieldName = 'quinzeltha'
      Origin = 'quinzeltha'
    end
    object TSyncVazaoOperacaovinteltha: TIntegerField
      FieldName = 'vinteltha'
      Origin = 'vinteltha'
    end
    object TSyncVazaoOperacaotrintaltha: TIntegerField
      FieldName = 'trintaltha'
      Origin = 'trintaltha'
    end
    object TSyncVazaoOperacaoquarentaltha: TIntegerField
      FieldName = 'quarentaltha'
      Origin = 'quarentaltha'
    end
    object TSyncVazaoOperacaocinquentaltha: TIntegerField
      FieldName = 'cinquentaltha'
      Origin = 'cinquentaltha'
    end
    object TSyncVazaoOperacaosetentaecincoltha: TIntegerField
      FieldName = 'setentaecincoltha'
      Origin = 'setentaecincoltha'
    end
    object TSyncVazaoOperacaocemltha: TIntegerField
      FieldName = 'cemltha'
      Origin = 'cemltha'
    end
    object TSyncVazaoOperacaosyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TSyncVazaoOperacaosyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
  end
  object TPluviometros: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'SELECT * FROM pluviometro  '
      'where syncaws=0 '
      'order by id')
    Left = 368
    Top = 344
    object TPluviometrosid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TPluviometrosstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TPluviometrosdatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TPluviometrosidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TPluviometrosdataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TPluviometrosidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TPluviometrosnome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TPluviometroslatitude: TWideStringField
      FieldName = 'latitude'
      Origin = 'latitude'
    end
    object TPluviometroslongitude: TWideStringField
      FieldName = 'longitude'
      Origin = 'longitude'
    end
    object TPluviometrosidsetor: TIntegerField
      FieldName = 'idsetor'
      Origin = 'idsetor'
    end
    object TPluviometrossyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TPluviometrossyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
  end
  object TPluviometroTalhoes: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select * from pluviometrotalhoes '
      'where syncaws=0 '
      'order by id')
    Left = 368
    Top = 392
    object TPluviometroTalhoesid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TPluviometroTalhoesstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TPluviometroTalhoesdatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TPluviometroTalhoesidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TPluviometroTalhoesdataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TPluviometroTalhoesidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TPluviometroTalhoesidpluviometro: TIntegerField
      FieldName = 'idpluviometro'
      Origin = 'idpluviometro'
    end
    object TPluviometroTalhoesidtalhao: TIntegerField
      FieldName = 'idtalhao'
      Origin = 'idtalhao'
    end
    object TPluviometroTalhoessyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TPluviometroTalhoessyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
  end
  object TPluviometria: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select * from pluviometria '
      'where syncaws=0 '
      'order by id')
    Left = 368
    Top = 448
    object TPluviometriaid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TPluviometriastatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TPluviometriadatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TPluviometriaidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TPluviometriadataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TPluviometriaidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TPluviometriaidpluviometro: TIntegerField
      FieldName = 'idpluviometro'
      Origin = 'idpluviometro'
    end
    object TPluviometriaidtalhao: TIntegerField
      FieldName = 'idtalhao'
      Origin = 'idtalhao'
    end
    object TPluviometriavolumemm: TBCDField
      FieldName = 'volumemm'
      Origin = 'volumemm'
      Precision = 15
      Size = 3
    end
    object TPluviometriadatacoleta: TDateField
      FieldName = 'datacoleta'
      Origin = 'datacoleta'
    end
    object TPluviometriahora: TTimeField
      FieldName = 'hora'
      Origin = 'hora'
    end
    object TPluviometriasyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TPluviometriasyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
  end
  object TAbastecimento: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select '
      '  *'
      'from abastecimento '
      'where syncaws=0 '
      'order by id'
      '')
    Left = 368
    Top = 496
    object TAbastecimentoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TAbastecimentostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TAbastecimentodatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TAbastecimentoidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TAbastecimentodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TAbastecimentoidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TAbastecimentoidlocalestoque: TIntegerField
      FieldName = 'idlocalestoque'
      Origin = 'idlocalestoque'
    end
    object TAbastecimentoidmaquina: TIntegerField
      FieldName = 'idmaquina'
      Origin = 'idmaquina'
    end
    object TAbastecimentoidoperador: TIntegerField
      FieldName = 'idoperador'
      Origin = 'idoperador'
    end
    object TAbastecimentovolumelt: TBCDField
      FieldName = 'volumelt'
      Origin = 'volumelt'
      Precision = 15
      Size = 3
    end
    object TAbastecimentocombustivel: TIntegerField
      FieldName = 'combustivel'
      Origin = 'combustivel'
    end
    object TAbastecimentodataabastecimento: TDateField
      FieldName = 'dataabastecimento'
      Origin = 'dataabastecimento'
    end
    object TAbastecimentohora: TTimeField
      FieldName = 'hora'
      Origin = 'hora'
    end
    object TAbastecimentosyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TAbastecimentosyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
  end
  object TAbastecimentoOutros: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select * from abastecimentoOutros a '
      'where syncaws=0 '
      'order by id')
    Left = 368
    Top = 544
    object TAbastecimentoOutrosid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TAbastecimentoOutrosstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TAbastecimentoOutrosdatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TAbastecimentoOutrosidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TAbastecimentoOutrosdataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TAbastecimentoOutrosidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TAbastecimentoOutrosidabastecimento: TIntegerField
      FieldName = 'idabastecimento'
      Origin = 'idabastecimento'
    end
    object TAbastecimentoOutrosidproduto: TIntegerField
      FieldName = 'idproduto'
      Origin = 'idproduto'
    end
    object TAbastecimentoOutrosquantidade: TBCDField
      FieldName = 'quantidade'
      Origin = 'quantidade'
      Precision = 15
      Size = 3
    end
    object TAbastecimentoOutrossyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TAbastecimentoOutrossyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
  end
  object TSyncAuxPragas: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select * from public.auxPragas'
      'where syncaws=0 '
      'order by id'
      '')
    Left = 144
    Top = 456
    object TSyncAuxPragasid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TSyncAuxPragasstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TSyncAuxPragasdatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TSyncAuxPragasidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TSyncAuxPragasdataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TSyncAuxPragasidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TSyncAuxPragasnome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TSyncAuxPragassyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TSyncAuxPragassyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
  end
end
