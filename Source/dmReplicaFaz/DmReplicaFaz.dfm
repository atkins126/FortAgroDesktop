object DataModule2: TDataModule2
  OldCreateOrder = False
  Height = 541
  Width = 672
  object TUsuario: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select * from usuario')
    Left = 16
    Top = 8
    object TUsuarioid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TUsuariostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TUsuariodatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TUsuarioidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TUsuariodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TUsuarioidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TUsuarionome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 100
    end
    object TUsuariousuario: TWideStringField
      FieldName = 'usuario'
      Origin = 'usuario'
      Size = 25
    end
    object TUsuariosenha: TWideStringField
      FieldName = 'senha'
      Origin = 'senha'
      Size = 50
    end
    object TUsuariotipo: TIntegerField
      FieldName = 'tipo'
      Origin = 'tipo'
    end
    object TUsuarioidsupervisor: TIntegerField
      FieldName = 'idsupervisor'
      Origin = 'idsupervisor'
    end
    object TUsuarioidsegmento: TIntegerField
      FieldName = 'idsegmento'
      Origin = 'idsegmento'
    end
    object TUsuariosyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TUsuarioagronomo: TIntegerField
      FieldName = 'agronomo'
      Origin = 'agronomo'
    end
    object TUsuarioabastecimento: TIntegerField
      FieldName = 'abastecimento'
      Origin = 'abastecimento'
    end
    object TUsuarioimgass: TBlobField
      FieldName = 'imgass'
      Origin = 'imgass'
    end
  end
  object lHTTP1: TIdHTTP
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
    Left = 600
    Top = 8
  end
  object TProdutos: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select '
      '*'
      'from produtos')
    Left = 28
    Top = 250
    object TProdutosid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TProdutosstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TProdutosdatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TProdutosidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TProdutosdataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TProdutosidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TProdutosnome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TProdutostipo: TWideStringField
      FieldName = 'tipo'
      Origin = 'tipo'
    end
    object TProdutosunidademedida: TWideStringField
      FieldName = 'unidademedida'
      Origin = 'unidademedida'
      Size = 10
    end
    object TProdutosestoqueminimo: TBCDField
      FieldName = 'estoqueminimo'
      Origin = 'estoqueminimo'
      Precision = 15
      Size = 2
    end
    object TProdutosobservacao: TWideStringField
      FieldName = 'observacao'
      Origin = 'observacao'
      Size = 100
    end
    object TProdutoscodigobarras: TWideStringField
      FieldName = 'codigobarras'
      Origin = 'codigobarras'
    end
    object TProdutosidcategoria: TIntegerField
      FieldName = 'idcategoria'
      Origin = 'idcategoria'
    end
    object TProdutosidsegmento: TIntegerField
      FieldName = 'idsegmento'
      Origin = 'idsegmento'
    end
    object TProdutosnumeroserie: TIntegerField
      FieldName = 'numeroserie'
      Origin = 'numeroserie'
    end
    object TProdutosreferencia: TWideStringField
      FieldName = 'referencia'
      Origin = 'referencia'
      Size = 30
    end
    object TProdutosimg: TBlobField
      FieldName = 'img'
      Origin = 'img'
    end
    object TProdutospesoembalagem: TBCDField
      FieldName = 'pesoembalagem'
      Origin = 'pesoembalagem'
      Precision = 15
      Size = 2
    end
    object TProdutosidgrupo: TIntegerField
      FieldName = 'idgrupo'
      Origin = 'idgrupo'
    end
    object TProdutosidsubgrupo: TIntegerField
      FieldName = 'idsubgrupo'
      Origin = 'idsubgrupo'
    end
    object TProdutosidmarca: TIntegerField
      FieldName = 'idmarca'
      Origin = 'idmarca'
    end
    object TProdutoscodigofabricante: TWideStringField
      FieldName = 'codigofabricante'
      Origin = 'codigofabricante'
      Size = 30
    end
    object TProdutossyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TProdutosdefensivos: TIntegerField
      FieldName = 'defensivos'
      Origin = 'defensivos'
    end
    object TProdutossyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
  end
  object TAuxMarca: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select * from auxmarcas')
    Left = 33
    Top = 301
    object TAuxMarcaid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TAuxMarcastatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TAuxMarcadatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TAuxMarcaidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TAuxMarcadataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TAuxMarcaidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TAuxMarcanome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TAuxMarcaidsegmento: TIntegerField
      FieldName = 'idsegmento'
      Origin = 'idsegmento'
    end
    object TAuxMarcasyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TAuxMarcasyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
  end
  object TAuxGrupo: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select * from auxgrupoprodutos')
    Left = 28
    Top = 78
    object TAuxGrupoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TAuxGrupostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TAuxGrupodatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TAuxGrupoidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TAuxGrupodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TAuxGrupoidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TAuxGruponome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TAuxGrupoidsegmento: TIntegerField
      FieldName = 'idsegmento'
      Origin = 'idsegmento'
    end
    object TAuxGruposyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TAuxGruposyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
  end
  object TAuxSubGrupo: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select * from auxsubgrupoprodutos')
    Left = 28
    Top = 133
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
    object TAuxSubGruposyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TAuxSubGruposyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
  end
  object TAuxCategorias: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select * from auxcategoriaitem')
    Left = 28
    Top = 188
    object TAuxCategoriasid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TAuxCategoriasstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TAuxCategoriasdatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TAuxCategoriasidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TAuxCategoriasdataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TAuxCategoriasidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TAuxCategoriasnome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TAuxCategoriasidsegmento: TIntegerField
      FieldName = 'idsegmento'
      Origin = 'idsegmento'
    end
    object TAuxCategoriassyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TAuxCategoriassyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
  end
  object TFornecedores: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select * from fornecedor')
    Left = 290
    Top = 283
    object TFornecedoresid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TFornecedoresstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TFornecedoresdatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TFornecedoresidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TFornecedoresdataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TFornecedoresidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TFornecedoresnome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 100
    end
    object TFornecedorescidade: TWideStringField
      FieldName = 'cidade'
      Origin = 'cidade'
      Size = 100
    end
    object TFornecedoresuf: TWideStringField
      FieldName = 'uf'
      Origin = 'uf'
      FixedChar = True
      Size = 2
    end
    object TFornecedorescpf_cnpj: TWideStringField
      FieldName = 'cpf_cnpj'
      Origin = 'cpf_cnpj'
      Size = 30
    end
    object TFornecedorestelefone_fixo: TWideStringField
      FieldName = 'telefone_fixo'
      Origin = 'telefone_fixo'
    end
    object TFornecedorescelular: TWideStringField
      FieldName = 'celular'
      Origin = 'celular'
    end
    object TFornecedoresemail: TWideStringField
      FieldName = 'email'
      Origin = 'email'
      Size = 100
    end
    object TFornecedorescontatopessoa: TWideStringField
      FieldName = 'contatopessoa'
      Origin = 'contatopessoa'
      Size = 100
    end
    object TFornecedoressenha: TWideStringField
      FieldName = 'senha'
      Origin = 'senha'
    end
    object TFornecedoresrazaosocial: TWideStringField
      FieldName = 'razaosocial'
      Origin = 'razaosocial'
      Size = 100
    end
    object TFornecedoresinscricaoestadual: TWideStringField
      FieldName = 'inscricaoestadual'
      Origin = 'inscricaoestadual'
    end
    object TFornecedoressyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TFornecedoressyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
  end
  object TAuxTipoMaqVeic: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select * from auxtipomaquinaveiculos')
    Left = 114
    Top = 64
    object TAuxTipoMaqVeicid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TAuxTipoMaqVeicstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TAuxTipoMaqVeicdatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TAuxTipoMaqVeicidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TAuxTipoMaqVeicdataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TAuxTipoMaqVeicidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TAuxTipoMaqVeicnome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TAuxTipoMaqVeicidsegmento: TIntegerField
      FieldName = 'idsegmento'
      Origin = 'idsegmento'
    end
    object TAuxTipoMaqVeicsyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TAuxTipoMaqVeicsyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
  end
  object TMaquinas: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select * from maquinaveiculo ')
    Left = 192
    Top = 121
    object TMaquinasid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TMaquinasstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TMaquinasdatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TMaquinasidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TMaquinasdataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TMaquinasidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TMaquinasidtipo: TIntegerField
      FieldName = 'idtipo'
      Origin = 'idtipo'
    end
    object TMaquinasidmarca: TIntegerField
      FieldName = 'idmarca'
      Origin = 'idmarca'
    end
    object TMaquinasmodelo: TWideStringField
      FieldName = 'modelo'
      Origin = 'modelo'
      Size = 50
    end
    object TMaquinasplaca: TWideStringField
      FieldName = 'placa'
      Origin = 'placa'
    end
    object TMaquinasano: TIntegerField
      FieldName = 'ano'
      Origin = 'ano'
    end
    object TMaquinaschassi: TWideStringField
      FieldName = 'chassi'
      Origin = 'chassi'
      Size = 30
    end
    object TMaquinascombustivel: TIntegerField
      FieldName = 'combustivel'
      Origin = 'combustivel'
    end
    object TMaquinasvalor: TBCDField
      FieldName = 'valor'
      Origin = 'valor'
      Precision = 15
      Size = 2
    end
    object TMaquinasnumeroserie: TWideStringField
      FieldName = 'numeroserie'
      Origin = 'numeroserie'
      Size = 30
    end
    object TMaquinasimg: TBlobField
      FieldName = 'img'
      Origin = 'img'
    end
    object TMaquinasprefixo: TWideStringField
      FieldName = 'prefixo'
      Origin = 'prefixo'
    end
    object TMaquinasidcategoria: TIntegerField
      FieldName = 'idcategoria'
      Origin = 'idcategoria'
    end
    object TMaquinasidsegmento: TIntegerField
      FieldName = 'idsegmento'
      Origin = 'idsegmento'
    end
    object TMaquinasanomodelo: TIntegerField
      FieldName = 'anomodelo'
      Origin = 'anomodelo'
    end
    object TMaquinassyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TMaquinassyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
  end
  object TAuxCulturas: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select * from auxculturas')
    Left = 114
    Top = 16
    object TAuxCulturasid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TAuxCulturasstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TAuxCulturasdatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TAuxCulturasidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TAuxCulturasdataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TAuxCulturasidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TAuxCulturasnome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TAuxCulturassyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TAuxCulturassyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
  end
  object TAuxCultivares: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select * from auxCultivares')
    Left = 112
    Top = 344
    object TAuxCultivaresid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TAuxCultivaresstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TAuxCultivaresdatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TAuxCultivaresidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TAuxCultivaresdataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TAuxCultivaresidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TAuxCultivaresnome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TAuxCultivaressyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TAuxCultivaresidtipocultivar: TIntegerField
      FieldName = 'idtipocultivar'
      Origin = 'idtipocultivar'
    end
    object TAuxCultivaresciclo: TIntegerField
      FieldName = 'ciclo'
      Origin = 'ciclo'
    end
    object TAuxCultivaressyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
  end
  object TAreas: TFDQuery
    CachedUpdates = True
    OnReconcileError = TAreasReconcileError
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select * from areas ')
    Left = 112
    Top = 395
    object TAreasid: TIntegerField
      FieldName = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TAreasstatus: TIntegerField
      FieldName = 'status'
    end
    object TAreasdatareg: TSQLTimeStampField
      FieldName = 'datareg'
    end
    object TAreasidusuario: TIntegerField
      FieldName = 'idusuario'
    end
    object TAreasdataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
    end
    object TAreasidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
    end
    object TAreasnome: TWideStringField
      FieldName = 'nome'
      Size = 50
    end
    object TAreasareahe: TBCDField
      FieldName = 'areahe'
      Precision = 15
      Size = 2
    end
    object TAreasidresponsavel: TIntegerField
      FieldName = 'idresponsavel'
    end
    object TAreassyncaws: TIntegerField
      FieldName = 'syncaws'
    end
    object TAreassyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
    object TAreaslatitude: TWideStringField
      FieldName = 'latitude'
      Origin = 'latitude'
    end
    object TAreaslongitude: TWideStringField
      FieldName = 'longitude'
      Origin = 'longitude'
    end
  end
  object TSetores: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select s.* from setor s')
    Left = 192
    Top = 16
    object TSetoresid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TSetoresstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TSetoresdatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TSetoresidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TSetoresdataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TSetoresidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TSetoresnome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TSetoresareahe: TBCDField
      FieldName = 'areahe'
      Origin = 'areahe'
      Precision = 15
      Size = 2
    end
    object TSetoresidarea: TIntegerField
      FieldName = 'idarea'
      Origin = 'idarea'
    end
    object TSetoressyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TSetoressyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
    object TSetoreslatitude: TWideStringField
      FieldName = 'latitude'
      Origin = 'latitude'
    end
    object TSetoreslongitude: TWideStringField
      FieldName = 'longitude'
      Origin = 'longitude'
    end
  end
  object TTalhoes: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select * from talhoes ')
    Left = 192
    Top = 72
    object TTalhoesid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TTalhoesstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TTalhoesdatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TTalhoesidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TTalhoesdataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TTalhoesidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TTalhoesnome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TTalhoesareahe: TBCDField
      FieldName = 'areahe'
      Origin = 'areahe'
      Precision = 15
      Size = 2
    end
    object TTalhoesidsetor: TIntegerField
      FieldName = 'idsetor'
      Origin = 'idsetor'
    end
    object TTalhoesqrcode: TWideStringField
      FieldName = 'qrcode'
      Origin = 'qrcode'
    end
    object TTalhoestipo: TIntegerField
      FieldName = 'tipo'
      Origin = 'tipo'
    end
    object TTalhoesobservacao: TWideStringField
      FieldName = 'observacao'
      Origin = 'observacao'
      Size = 100
    end
    object TTalhoessyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TTalhoessyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
    object TTalhoeslatitude: TWideStringField
      FieldName = 'latitude'
      Origin = 'latitude'
    end
    object TTalhoeslongitude: TWideStringField
      FieldName = 'longitude'
      Origin = 'longitude'
    end
  end
  object TSafra: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select *'
      'from safra a')
    Left = 192
    Top = 176
    object TSafraid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TSafrastatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TSafradatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TSafraidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TSafradataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TSafraidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TSafranome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TSafradatainicio: TDateField
      FieldName = 'datainicio'
      Origin = 'datainicio'
    end
    object TSafradatafim: TDateField
      FieldName = 'datafim'
      Origin = 'datafim'
    end
    object TSafraobservacao: TWideStringField
      FieldName = 'observacao'
      Origin = 'observacao'
      Size = 100
    end
    object TSafrasyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TSafrasyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
  end
  object TAuxTipoOcorrencia: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select * from auxtipoocorrencia')
    Left = 112
    Top = 120
    object TAuxTipoOcorrenciaid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TAuxTipoOcorrenciastatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TAuxTipoOcorrenciadatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TAuxTipoOcorrenciaidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TAuxTipoOcorrenciadataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TAuxTipoOcorrenciaidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TAuxTipoOcorrencianome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TAuxTipoOcorrenciasyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TAuxTipoOcorrenciasyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
  end
  object TOperacaoSafraTalhao: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select os.* from operacaosafratalhao os ')
    Left = 288
    Top = 16
    object TOperacaoSafraTalhaoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TOperacaoSafraTalhaostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TOperacaoSafraTalhaodatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TOperacaoSafraTalhaoidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TOperacaoSafraTalhaodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TOperacaoSafraTalhaoidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TOperacaoSafraTalhaoidsafra: TIntegerField
      FieldName = 'idsafra'
      Origin = 'idsafra'
    end
    object TOperacaoSafraTalhaoidoperacao: TIntegerField
      FieldName = 'idoperacao'
      Origin = 'idoperacao'
    end
    object TOperacaoSafraTalhaodatainicio: TDateField
      FieldName = 'datainicio'
      Origin = 'datainicio'
    end
    object TOperacaoSafraTalhaodatafim: TDateField
      FieldName = 'datafim'
      Origin = 'datafim'
    end
    object TOperacaoSafraTalhaoobservacao: TWideStringField
      FieldName = 'observacao'
      Origin = 'observacao'
      Size = 100
    end
    object TOperacaoSafraTalhaoidtalhao: TIntegerField
      FieldName = 'idtalhao'
      Origin = 'idtalhao'
    end
    object TOperacaoSafraTalhaoidresponsavel: TIntegerField
      FieldName = 'idresponsavel'
      Origin = 'idresponsavel'
    end
    object TOperacaoSafraTalhaoareaprevista: TBCDField
      FieldName = 'areaprevista'
      Origin = 'areaprevista'
      Precision = 15
      Size = 2
    end
    object TOperacaoSafraTalhaoarearealizada: TBCDField
      FieldName = 'arearealizada'
      Origin = 'arearealizada'
      Precision = 15
      Size = 2
    end
    object TOperacaoSafraTalhaotipoterraaereo: TWideStringField
      FieldName = 'tipoterraaereo'
      Origin = 'tipoterraaereo'
      Size = 10
    end
    object TOperacaoSafraTalhaoidtipoaplicacaosolido: TIntegerField
      FieldName = 'idtipoaplicacaosolido'
      Origin = 'idtipoaplicacaosolido'
    end
    object TOperacaoSafraTalhaoidcultura: TIntegerField
      FieldName = 'idcultura'
      Origin = 'idcultura'
    end
    object TOperacaoSafraTalhaoidvariedade: TIntegerField
      FieldName = 'idvariedade'
      Origin = 'idvariedade'
    end
    object TOperacaoSafraTalhaofinalidade: TWideStringField
      FieldName = 'finalidade'
      Origin = 'finalidade'
      Size = 30
    end
    object TOperacaoSafraTalhaoidreceituario: TIntegerField
      FieldName = 'idreceituario'
      Origin = 'idreceituario'
    end
    object TOperacaoSafraTalhaosyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TOperacaoSafraTalhaosyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
    object TOperacaoSafraTalhaoqualidadecobertura: TWideStringField
      FieldName = 'qualidadecobertura'
      Origin = 'qualidadecobertura'
    end
    object TOperacaoSafraTalhaoidcobertura: TIntegerField
      FieldName = 'idcobertura'
    end
  end
  object TOcorrenciaOperacao: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select a.* from DetOperacaoSafraTalhaoOcorrencia a')
    Left = 285
    Top = 178
    object TOcorrenciaOperacaoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TOcorrenciaOperacaostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TOcorrenciaOperacaodatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TOcorrenciaOperacaoidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TOcorrenciaOperacaodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TOcorrenciaOperacaoidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TOcorrenciaOperacaoidoperacaotalhao: TIntegerField
      FieldName = 'idoperacaotalhao'
      Origin = 'idoperacaotalhao'
    end
    object TOcorrenciaOperacaodataocorrencia: TDateField
      FieldName = 'dataocorrencia'
      Origin = 'dataocorrencia'
    end
    object TOcorrenciaOperacaoidtipoocorrencia: TIntegerField
      FieldName = 'idtipoocorrencia'
      Origin = 'idtipoocorrencia'
    end
    object TOcorrenciaOperacaohora: TTimeField
      FieldName = 'hora'
      Origin = 'hora'
    end
    object TOcorrenciaOperacaodescricao: TWideStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 100
    end
    object TOcorrenciaOperacaodata: TDateField
      FieldName = 'data'
      Origin = 'data'
    end
    object TOcorrenciaOperacaosyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TOcorrenciaOperacaosyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
  end
  object TMaquinasOperacao: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select a.* from detoperacaosafratalhaomaquinasoperadores a')
    Left = 288
    Top = 72
    object TMaquinasOperacaoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TMaquinasOperacaostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TMaquinasOperacaodatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TMaquinasOperacaoidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TMaquinasOperacaodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TMaquinasOperacaoidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TMaquinasOperacaoidoperacaotalhao: TIntegerField
      FieldName = 'idoperacaotalhao'
      Origin = 'idoperacaotalhao'
    end
    object TMaquinasOperacaoidmaquina: TIntegerField
      FieldName = 'idmaquina'
      Origin = 'idmaquina'
    end
    object TMaquinasOperacaooperador: TWideStringField
      FieldName = 'operador'
      Origin = 'operador'
      Size = 100
    end
    object TMaquinasOperacaoobservacao: TWideStringField
      FieldName = 'observacao'
      Origin = 'observacao'
      Size = 100
    end
    object TMaquinasOperacaodata: TDateField
      FieldName = 'data'
      Origin = 'data'
    end
    object TMaquinasOperacaohorainicio: TBCDField
      FieldName = 'horainicio'
      Origin = 'horainicio'
      Precision = 15
      Size = 3
    end
    object TMaquinasOperacaohorafim: TBCDField
      FieldName = 'horafim'
      Origin = 'horafim'
      Precision = 15
      Size = 3
    end
    object TMaquinasOperacaohoraparada: TBCDField
      FieldName = 'horaparada'
      Origin = 'horaparada'
      Precision = 15
      Size = 3
    end
    object TMaquinasOperacaohorastrabalhada: TBCDField
      FieldName = 'horastrabalhada'
      Origin = 'horastrabalhada'
      Precision = 15
      Size = 3
    end
    object TMaquinasOperacaosyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TMaquinasOperacaoidoperador: TIntegerField
      FieldName = 'idoperador'
      Origin = 'idoperador'
    end
    object TMaquinasOperacaosyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
  end
  object TProdutosOperacao: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select a.* from public.DetOperacaoSafraTalhaoProdutos a ')
    Left = 288
    Top = 128
    object TProdutosOperacaoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TProdutosOperacaostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TProdutosOperacaodatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TProdutosOperacaoidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TProdutosOperacaodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TProdutosOperacaoidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TProdutosOperacaoidoperacaotalhao: TIntegerField
      FieldName = 'idoperacaotalhao'
      Origin = 'idoperacaotalhao'
    end
    object TProdutosOperacaoidproduto: TIntegerField
      FieldName = 'idproduto'
      Origin = 'idproduto'
    end
    object TProdutosOperacaoqtdeutilidado: TBCDField
      FieldName = 'qtdeutilidado'
      Origin = 'qtdeutilidado'
      Precision = 15
      Size = 3
    end
    object TProdutosOperacaoobservacao: TWideStringField
      FieldName = 'observacao'
      Origin = 'observacao'
      Size = 100
    end
    object TProdutosOperacaodata: TDateField
      FieldName = 'data'
      Origin = 'data'
    end
    object TProdutosOperacaosyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TProdutosOperacaosyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
  end
  object TReceituario: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select* from receiturario ')
    Left = 192
    Top = 232
    object TReceituarioid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TReceituariostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TReceituariodatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TReceituarioidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TReceituariodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TReceituarioidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TReceituarionome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TReceituarioidresponsavel: TIntegerField
      FieldName = 'idresponsavel'
      Origin = 'idresponsavel'
    end
    object TReceituariosyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TReceituariosyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
  end
  object TDetReceituario: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select '
      ' *'
      'from DetReceiturario ')
    Left = 200
    Top = 288
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
    object TDetReceituariosyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
    object TDetReceituariofinalidade: TWideStringField
      FieldName = 'finalidade'
      Origin = 'finalidade'
      Size = 100
    end
  end
  object TPedidoCompra: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select '
      '*'
      'from pedidocompra ')
    Left = 400
    Top = 19
    object TPedidoCompraid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TPedidoComprastatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TPedidoCompradatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TPedidoCompraidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TPedidoCompradataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TPedidoCompraidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TPedidoCompraidsegmento: TIntegerField
      FieldName = 'idsegmento'
      Origin = 'idsegmento'
    end
    object TPedidoCompraidcategoria: TIntegerField
      FieldName = 'idcategoria'
      Origin = 'idcategoria'
    end
    object TPedidoCompraidentificador: TWideStringField
      FieldName = 'identificador'
      Origin = 'identificador'
    end
    object TPedidoCompraidsupervisoraprovacao: TIntegerField
      FieldName = 'idsupervisoraprovacao'
      Origin = 'idsupervisoraprovacao'
    end
    object TPedidoCompradataaprovacaosupervisor: TDateField
      FieldName = 'dataaprovacaosupervisor'
      Origin = 'dataaprovacaosupervisor'
    end
    object TPedidoCompraiddiretoriaaprovacao: TIntegerField
      FieldName = 'iddiretoriaaprovacao'
      Origin = 'iddiretoriaaprovacao'
    end
    object TPedidoCompradataaprovacaodiretoria: TDateField
      FieldName = 'dataaprovacaodiretoria'
      Origin = 'dataaprovacaodiretoria'
    end
    object TPedidoCompradatapedido: TDateField
      FieldName = 'datapedido'
      Origin = 'datapedido'
    end
    object TPedidoCompraidsolicitante: TIntegerField
      FieldName = 'idsolicitante'
      Origin = 'idsolicitante'
    end
    object TPedidoCompracancelado: TIntegerField
      FieldName = 'cancelado'
      Origin = 'cancelado'
    end
    object TPedidoCompraidmaquina: TIntegerField
      FieldName = 'idmaquina'
      Origin = 'idmaquina'
    end
    object TPedidoCompraidservico: TIntegerField
      FieldName = 'idservico'
      Origin = 'idservico'
    end
    object TPedidoCompraflagurgente: TIntegerField
      FieldName = 'flagurgente'
      Origin = 'flagurgente'
    end
    object TPedidoComprasyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TPedidoComprasyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
  end
  object TItensPedido: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select i.* from pedidocompraitems i  ')
    Left = 400
    Top = 83
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
    object TItensPedidosyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
  end
  object TStatusPedido: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select  a.*'
      'from pedidostatus a')
    Left = 400
    Top = 139
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
    object TStatusPedidosyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
  end
  object TAuxTipoServico: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select * from auxTipoServico')
    Left = 112
    Top = 176
    object TAuxTipoServicoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TAuxTipoServicostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TAuxTipoServicodatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TAuxTipoServicoidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TAuxTipoServicodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TAuxTipoServicoidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TAuxTipoServiconome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TAuxTipoServicoidsegmento: TIntegerField
      FieldName = 'idsegmento'
      Origin = 'idsegmento'
    end
    object TAuxTipoServicosyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TAuxTipoServicosyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
  end
  object TServico: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select '
      ' *'
      'from servico a ')
    Left = 112
    Top = 232
    object TServicoid: TIntegerField
      FieldName = 'id'
    end
    object TServicostatus: TIntegerField
      FieldName = 'status'
    end
    object TServicodatareg: TSQLTimeStampField
      FieldName = 'datareg'
    end
    object TServicoidusuario: TIntegerField
      FieldName = 'idusuario'
    end
    object TServicodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
    end
    object TServicoidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
    end
    object TServicoidtipo: TIntegerField
      FieldName = 'idtipo'
    end
    object TServicodescricao: TWideStringField
      FieldName = 'descricao'
      Size = 100
    end
    object TServicoidsegmento: TIntegerField
      FieldName = 'idsegmento'
    end
    object TServicoresponsavel: TWideStringField
      FieldName = 'responsavel'
      Size = 100
    end
    object TServicodataprevista: TDateField
      FieldName = 'dataprevista'
    end
    object TServicosyncaws: TIntegerField
      FieldName = 'syncaws'
    end
    object TServicosyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
  end
  object TOrcamento: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select'
      'b.*'
      'from orcamentos b')
    Left = 400
    Top = 200
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
    object TOrcamentosyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
  end
  object TItensOrcamento: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select'
      ' a.*'
      'from public.orcamentosItens a')
    Left = 400
    Top = 256
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
    object TItensOrcamentosyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
  end
  object TAuxCobertura: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select * from auxCobertura')
    Left = 112
    Top = 288
    object TAuxCoberturaid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TAuxCoberturastatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TAuxCoberturadatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TAuxCoberturaidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TAuxCoberturadataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TAuxCoberturaidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TAuxCoberturanome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TAuxCoberturasyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TAuxCoberturasyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
  end
  object TOperadorMaquina: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select * from OperadorMaquinas')
    Left = 312
    Top = 352
    object TOperadorMaquinaid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TOperadorMaquinastatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TOperadorMaquinadatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TOperadorMaquinaidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TOperadorMaquinadataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TOperadorMaquinaidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TOperadorMaquinanome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TOperadorMaquinasyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TOperadorMaquinarg: TWideStringField
      FieldName = 'rg'
      Origin = 'rg'
      Size = 10
    end
    object TOperadorMaquinacpf: TWideStringField
      FieldName = 'cpf'
      Origin = 'cpf'
    end
    object TOperadorMaquinacnh: TWideStringField
      FieldName = 'cnh'
      Origin = 'cnh'
    end
    object TOperadorMaquinacelular: TWideStringField
      FieldName = 'celular'
      Origin = 'celular'
    end
    object TOperadorMaquinasyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
  end
  object TAuxTipoCultivare: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select * from auxTipoCultivar')
    Left = 312
    Top = 411
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
    object TAuxTipoCultivaresyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
  end
  object TLocalEstoque: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select * '
      'from LocalEstoque ')
    Left = 504
    Top = 32
    object TLocalEstoqueid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TLocalEstoquestatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TLocalEstoquedatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TLocalEstoqueidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TLocalEstoquedataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TLocalEstoqueidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TLocalEstoquenome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TLocalEstoqueidsegmento: TIntegerField
      FieldName = 'idsegmento'
      Origin = 'idsegmento'
    end
    object TLocalEstoquesyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TLocalEstoquesyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
  end
  object TCentroCusto: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select '
      ' *'
      'from CentroCusto')
    Left = 504
    Top = 96
    object TCentroCustoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TCentroCustostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TCentroCustodatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TCentroCustoidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TCentroCustodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TCentroCustoidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TCentroCustonome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TCentroCustoidsegmento: TIntegerField
      FieldName = 'idsegmento'
      Origin = 'idsegmento'
    end
    object TCentroCustosyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TCentroCustosyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
  end
  object TEstoqueEntrada: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select '
      '*'
      'from estoqueentrada ')
    Left = 504
    Top = 152
    object TEstoqueEntradaid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TEstoqueEntradastatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TEstoqueEntradadatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TEstoqueEntradaidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TEstoqueEntradadataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TEstoqueEntradaidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TEstoqueEntradaidproduto: TIntegerField
      FieldName = 'idproduto'
      Origin = 'idproduto'
    end
    object TEstoqueEntradaidfornecedor: TIntegerField
      FieldName = 'idfornecedor'
      Origin = 'idfornecedor'
    end
    object TEstoqueEntradaidpedido: TIntegerField
      FieldName = 'idpedido'
      Origin = 'idpedido'
    end
    object TEstoqueEntradanumeronf: TIntegerField
      FieldName = 'numeronf'
      Origin = 'numeronf'
    end
    object TEstoqueEntradadataemissao: TDateField
      FieldName = 'dataemissao'
      Origin = 'dataemissao'
    end
    object TEstoqueEntradadataentradaestoque: TDateField
      FieldName = 'dataentradaestoque'
      Origin = 'dataentradaestoque'
    end
    object TEstoqueEntradavalortotalnf: TFMTBCDField
      FieldName = 'valortotalnf'
      Origin = 'valortotalnf'
      Precision = 18
      Size = 2
    end
    object TEstoqueEntradaqtditens: TFMTBCDField
      FieldName = 'qtditens'
      Origin = 'qtditens'
      Precision = 18
      Size = 2
    end
    object TEstoqueEntradaunidademedida: TWideStringField
      FieldName = 'unidademedida'
      Origin = 'unidademedida'
    end
    object TEstoqueEntradapesoembalagem: TFMTBCDField
      FieldName = 'pesoembalagem'
      Origin = 'pesoembalagem'
      Precision = 18
      Size = 2
    end
    object TEstoqueEntradaidlocalestoque: TIntegerField
      FieldName = 'idlocalestoque'
      Origin = 'idlocalestoque'
    end
    object TEstoqueEntradaidcentrocusto: TIntegerField
      FieldName = 'idcentrocusto'
      Origin = 'idcentrocusto'
    end
    object TEstoqueEntradasyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TEstoqueEntradasyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
  end
  object TDetReceituarioTalhao: TFDQuery
    CachedUpdates = True
    OnReconcileError = TDetReceituarioTalhaoReconcileError
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select '
      ' *'
      'from DetReceiturarioTalhao ')
    Left = 208
    Top = 344
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
  object TVazaoOperacao: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select * from DetVazaoOperacao'
      '')
    Left = 288
    Top = 232
    object TVazaoOperacaoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TVazaoOperacaostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TVazaoOperacaodatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TVazaoOperacaoidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TVazaoOperacaodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TVazaoOperacaoidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TVazaoOperacaoidoperacaotalhao: TIntegerField
      FieldName = 'idoperacaotalhao'
      Origin = 'idoperacaotalhao'
    end
    object TVazaoOperacaocincoltha: TIntegerField
      FieldName = 'cincoltha'
      Origin = 'cincoltha'
    end
    object TVazaoOperacaodezltha: TIntegerField
      FieldName = 'dezltha'
      Origin = 'dezltha'
    end
    object TVazaoOperacaoquinzeltha: TIntegerField
      FieldName = 'quinzeltha'
      Origin = 'quinzeltha'
    end
    object TVazaoOperacaovinteltha: TIntegerField
      FieldName = 'vinteltha'
      Origin = 'vinteltha'
    end
    object TVazaoOperacaotrintaltha: TIntegerField
      FieldName = 'trintaltha'
      Origin = 'trintaltha'
    end
    object TVazaoOperacaoquarentaltha: TIntegerField
      FieldName = 'quarentaltha'
      Origin = 'quarentaltha'
    end
    object TVazaoOperacaocinquentaltha: TIntegerField
      FieldName = 'cinquentaltha'
      Origin = 'cinquentaltha'
    end
    object TVazaoOperacaosetentaecincoltha: TIntegerField
      FieldName = 'setentaecincoltha'
      Origin = 'setentaecincoltha'
    end
    object TVazaoOperacaocemltha: TIntegerField
      FieldName = 'cemltha'
      Origin = 'cemltha'
    end
    object TVazaoOperacaosyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TVazaoOperacaosyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
  end
  object TPluviometros: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'SELECT * FROM pluviometro  ')
    Left = 520
    Top = 216
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
      'select * from pluviometrotalhoes ')
    Left = 520
    Top = 264
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
      'select * from pluviometria ')
    Left = 520
    Top = 320
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
      '')
    Left = 520
    Top = 368
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
      'select * from abastecimentoOutros ')
    Left = 520
    Top = 421
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
  object TAuxPragas: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select * from public.auxPragas')
    Left = 112
    Top = 456
    object TAuxPragasid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TAuxPragasstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TAuxPragasdatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TAuxPragasidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TAuxPragasdataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TAuxPragasidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TAuxPragasnome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TAuxPragassyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TAuxPragassyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
  end
end
