object dbCtx: TdbCtx
  OldCreateOrder = False
  Height = 544
  Width = 1282
  object vQry: TFDQuery
    Connection = FDConPG
    Left = 624
  end
  object TUsuario: TFDQuery
    CachedUpdates = True
    OnReconcileError = TUsuarioReconcileError
    Connection = FDConPG
    SQL.Strings = (
      'select '
      ' U.*,'
      ' case '
      '  when tipo=0 then '#39'PADRAO'#39
      '  when tipo=1 then '#39'SUPERVISOR'#39
      '  when tipo=2 then '#39'COMPRAS'#39'  '
      '  when tipo=3 then '#39'DIRETORIA'#39
      '  when tipo=4 then '#39'ALMOXERIFADO'#39
      ' end tipoSTR,'
      ' case '
      '  when idsegmento=0 then '#39'AGROPECUARIA'#39
      '  when idsegmento=1 then '#39'AGRICULTURA'#39
      ' end SegmentoSTR'
      'from usuario U'
      'where Status>=0'
      ''
      ''
      ''
      '')
    Left = 200
    Top = 384
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
    object TUsuariotipostr: TWideMemoField
      AutoGenerateValue = arDefault
      FieldName = 'tipostr'
      Origin = 'tipostr'
      ReadOnly = True
      BlobType = ftWideMemo
    end
    object TUsuarioidsegmento: TIntegerField
      FieldName = 'idsegmento'
      Origin = 'idsegmento'
    end
    object TUsuariosegmentostr: TWideMemoField
      AutoGenerateValue = arDefault
      FieldName = 'segmentostr'
      Origin = 'segmentostr'
      ReadOnly = True
      BlobType = ftWideMemo
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
    object TUsuariosyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
    object TUsuariotokenapp: TWideStringField
      FieldName = 'tokenapp'
      Origin = 'tokenapp'
      Size = 100
    end
    object TUsuariotokenappcompras: TWideStringField
      FieldName = 'tokenappcompras'
      Origin = 'tokenappcompras'
      Size = 500
    end
    object TUsuarioarmazem: TIntegerField
      FieldName = 'armazem'
      Origin = 'armazem'
    end
    object TUsuarioaplicacaosolido: TIntegerField
      FieldName = 'aplicacaosolido'
      Origin = 'aplicacaosolido'
    end
    object TUsuariopulverizacao: TIntegerField
      FieldName = 'pulverizacao'
      Origin = 'pulverizacao'
    end
    object TUsuarioplantio: TIntegerField
      FieldName = 'plantio'
      Origin = 'plantio'
    end
    object TUsuariocolheita: TIntegerField
      FieldName = 'colheita'
      Origin = 'colheita'
    end
    object TUsuariomonitoramentopragas: TIntegerField
      FieldName = 'monitoramentopragas'
      Origin = 'monitoramentopragas'
    end
    object TUsuariopluviometria: TIntegerField
      FieldName = 'pluviometria'
      Origin = 'pluviometria'
    end
    object TUsuariomanutencaomaquinas: TIntegerField
      FieldName = 'manutencaomaquinas'
      Origin = 'manutencaomaquinas'
    end
    object TUsuarioabastecimentoexterno: TIntegerField
      FieldName = 'abastecimentoexterno'
      Origin = 'abastecimentoexterno'
    end
  end
  object TProdutos: TFDQuery
    CachedUpdates = True
    OnReconcileError = TProdutosReconcileError
    Connection = FDConPG
    SQL.Strings = (
      'select '
      ' pr.*,'
      ' ax.Nome Categoria,'
      ' aug.Nome Grupo,'
      ' aus.Nome SubGrupo,'
      ' aum.Nome Marca,'
      ' case pr.idSegmento'
      '  when 0 then '#39'AGROPECU'#193'RIA'#39
      '  when 1 then '#39'AGRICULTURA'#39
      '  when 2 then '#39'AMBOS'#39
      ' end Segmento '
      'from produtos pr '
      'join auxcategoriaitem ax on ax.Id=pr.idCategoria'
      'left join auxgrupoprodutos aug on aug.id=pr.idGrupo '
      'left join auxsubgrupoprodutos aus on aus.id=pr.idSubGrupo '
      'left join auxMarcas aum on aum.id=pr.idMarca'
      'where 1=1'
      'ORDER BY PR.ID DESC')
    Left = 28
    Top = 290
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
    object TProdutoscategoria: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'categoria'
      Origin = 'categoria'
      Size = 50
    end
    object TProdutosgrupo: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'grupo'
      Origin = 'grupo'
      Size = 50
    end
    object TProdutossubgrupo: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'subgrupo'
      Origin = 'subgrupo'
      Size = 50
    end
    object TProdutosmarca: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'marca'
      Origin = 'marca'
      Size = 50
    end
    object TProdutossegmento: TWideMemoField
      AutoGenerateValue = arDefault
      FieldName = 'segmento'
      Origin = 'segmento'
      ReadOnly = True
      BlobType = ftWideMemo
    end
    object TProdutossyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TProdutosdefensivos: TIntegerField
      FieldName = 'defensivos'
      Origin = 'defensivos'
    end
  end
  object TFornecedores: TFDQuery
    CachedUpdates = True
    OnReconcileError = TFornecedoresReconcileError
    Connection = FDConPG
    SQL.Strings = (
      'select * from fornecedor'
      'where status=1')
    Left = 202
    Top = 435
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
  object TAuxMarca: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select * from auxmarcas'
      'where status=1')
    Left = 33
    Top = 341
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
  end
  object TAuxTipoMaqVeic: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select * from auxtipomaquinaveiculos'
      'where status=1')
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
  end
  object TMaquinas: TFDQuery
    CachedUpdates = True
    OnReconcileError = TMaquinasReconcileError
    Connection = FDConPG
    SQL.Strings = (
      'select a.*,'
      ' case '
      '  when combustivel =0 then '#39'Diesel'#39
      '  when combustivel =1 then '#39'Gasolina'#39
      '  when combustivel =2 then '#39'Alcool'#39
      '  when combustivel =3 then '#39'Flex'#39
      '  when combustivel =4 then '#39'N'#227'o se Aplica'#39' '
      ' end CombustivelStr,'
      'b.nome Tipo,c.nome Marca,'
      'False as check  '
      'from maquinaveiculo a '
      'join auxtipomaquinaveiculos b on b.id=a.idtipo'
      'join auxmarcas c on c.id=a.idmarca'
      'where a.status >-1')
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
    object TMaquinastipo: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'tipo'
      Origin = 'tipo'
      Size = 50
    end
    object TMaquinasmarca: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'marca'
      Origin = 'marca'
      Size = 50
    end
    object TMaquinascombustivelstr: TWideMemoField
      AutoGenerateValue = arDefault
      FieldName = 'combustivelstr'
      Origin = 'combustivelstr'
      ReadOnly = True
      BlobType = ftWideMemo
    end
    object TMaquinasprefixo: TWideStringField
      FieldName = 'prefixo'
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
    object TMaquinasultimarevisao: TDateField
      FieldName = 'ultimarevisao'
      Origin = 'ultimarevisao'
    end
    object TMaquinashorimetroultimarev: TBCDField
      FieldName = 'horimetroultimarev'
      Origin = 'horimetroultimarev'
      Precision = 15
      Size = 3
    end
    object TMaquinascheck: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = 'check'
      Origin = '"check"'
      ReadOnly = True
    end
    object TMaquinasdepreciacao: TBCDField
      FieldName = 'depreciacao'
      Origin = 'depreciacao'
      Precision = 15
      Size = 3
    end
    object TMaquinasvidautil: TBCDField
      FieldName = 'vidautil'
      Origin = 'vidautil'
      Precision = 15
      Size = 3
    end
    object TMaquinashorimetroproximarevisao: TBCDField
      FieldName = 'horimetroproximarevisao'
      Origin = 'horimetroproximarevisao'
      Precision = 15
      Size = 3
    end
  end
  object TAuxCulturas: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select * from auxculturas'
      'where status=1')
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
  end
  object TAuxCultivares: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select a.*,b.nome Tipo from auxCultivares a '
      'join auxtipocultivar b on b.id=a.idtipocultivar'
      'where a.status=1')
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
    object TAuxCultivarestipo: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'tipo'
      Origin = 'tipo'
      Size = 50
    end
  end
  object TAreas: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select a.*,b.nome Responsavel from areas a '
      'left join usuario b on a.idresponsavel=b.id'
      'where a.status=1')
    Left = 104
    Top = 400
    object TAreasid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TAreasstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TAreasdatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TAreasidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TAreasdataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TAreasidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TAreasnome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TAreasareahe: TBCDField
      FieldName = 'areahe'
      Origin = 'areahe'
      Precision = 15
      Size = 2
    end
    object TAreasidresponsavel: TIntegerField
      FieldName = 'idresponsavel'
      Origin = 'idresponsavel'
    end
    object TAreasresponsavel: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'responsavel'
      Origin = 'responsavel'
      Size = 100
    end
    object TAreassyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TAreaslatitude: TWideStringField
      FieldName = 'latitude'
      Origin = 'latitude'
    end
    object TAreaslongitude: TWideStringField
      FieldName = 'longitude'
      Origin = 'longitude'
    end
    object TAreassyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
  end
  object TSetores: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select s.*,a.nome AreaNome from setor s'
      'join areas a on s.idarea=a.id'
      'where s.status=1')
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
    object TSetoresareanome: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'areanome'
      Origin = 'areanome'
      Size = 50
    end
    object TSetoressyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TSetoreslatitude: TWideStringField
      FieldName = 'latitude'
      Origin = 'latitude'
    end
    object TSetoreslongitude: TWideStringField
      FieldName = 'longitude'
      Origin = 'longitude'
    end
    object TSetoressyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
  end
  object TTalhoes: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select s.*,a.nome Setor,false as check   from talhoes s'
      'join setor a on s.idsetor=a.id'
      'where s.status=1')
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
    object TTalhoessetor: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'setor'
      Origin = 'setor'
      Size = 50
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
    object TTalhoesCheck: TBooleanField
      FieldName = 'Check'
    end
    object TTalhoesqrcodesaida: TWideStringField
      FieldName = 'qrcodesaida'
      Origin = 'qrcodesaida'
      Size = 30
    end
  end
  object TSafra: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select a.*, '
      ' case '
      '  when status=0 then '#39'Finalizada'#39
      '  when status=1 then '#39'Ativa'#39
      ' end statusNome'
      'from safra a'
      'where status>-1')
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
    object TSafrastatusnome: TWideMemoField
      AutoGenerateValue = arDefault
      FieldName = 'statusnome'
      Origin = 'statusnome'
      ReadOnly = True
      BlobType = ftWideMemo
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
  object TAuxOperacao: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select * from operacoes'
      'where status=1')
    Left = 568
    Top = 56
    object TAuxOperacaoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TAuxOperacaostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TAuxOperacaodatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TAuxOperacaoidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TAuxOperacaodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TAuxOperacaoidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TAuxOperacaonome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
  end
  object TAuxTipoOcorrencia: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select * from auxtipoocorrencia'
      'where status=1')
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
  end
  object TOperacaoSafraTalhao: TFDQuery
    CachedUpdates = True
    OnUpdateError = TOperacaoSafraTalhaoUpdateError
    OnReconcileError = TOperacaoSafraTalhaoReconcileError
    Connection = FDConPG
    SQL.Strings = (
      'select os.*,o.nome Operacao from operacaosafratalhao os '
      'join operacoes o on o.id=os.idoperacao')
    Left = 320
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
    object TOperacaoSafraTalhaooperacao: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'operacao'
      Origin = 'operacao'
      Size = 50
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
    object TOperacaoSafraTalhaoarearealizada: TBCDField
      FieldName = 'arearealizada'
      Origin = 'arearealizada'
      Precision = 15
      Size = 2
    end
    object TOperacaoSafraTalhaoareaprevista: TBCDField
      FieldName = 'areaprevista'
      Origin = 'areaprevista'
      Precision = 15
      Size = 2
    end
    object TOperacaoSafraTalhaotipoterraaereo: TWideStringField
      DisplayWidth = 100
      FieldName = 'tipoterraaereo'
      Origin = 'tipoterraaereo'
      Size = 100
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
    OnReconcileError = TOcorrenciaOperacaoReconcileError
    Connection = FDConPG
    SQL.Strings = (
      
        'select a.*,b.nome TipoOcorrencia from DetOperacaoSafraTalhaoOcor' +
        'rencia a '
      'join auxtipoocorrencia b on a.idtipoocorrencia=b.id'
      'where a.status=1')
    Left = 317
    Top = 186
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
    object TOcorrenciaOperacaotipoocorrencia: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'tipoocorrencia'
      Origin = 'tipoocorrencia'
      Size = 50
    end
    object TOcorrenciaOperacaodata: TDateField
      FieldName = 'data'
      Origin = 'data'
    end
    object TOcorrenciaOperacaosyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
  end
  object TMaquinasOperacao: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      
        'select a.*,b.modelo||'#39'-'#39'||b.prefixo maquina from detoperacaosafr' +
        'atalhaomaquinasoperadores a'
      'join maquinaveiculo b on a.idmaquina=b.id'
      'where a.status=1')
    Left = 320
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
    object TMaquinasOperacaomaquina: TWideMemoField
      AutoGenerateValue = arDefault
      FieldName = 'maquina'
      Origin = 'maquina'
      ReadOnly = True
      BlobType = ftWideMemo
    end
    object TMaquinasOperacaodata: TDateField
      FieldName = 'data'
      Origin = 'data'
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
    object TMaquinasOperacaohorainicio: TBCDField
      FieldName = 'horainicio'
      Origin = 'horainicio'
      Precision = 15
      Size = 3
    end
    object TMaquinasOperacaosyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
  end
  object TProdutosOperacao: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      
        'select a.*,b.nome Produto from public.DetOperacaoSafraTalhaoProd' +
        'utos a'
      'join produtos b on b.id=a.idproduto'
      'where a.status=1')
    Left = 320
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
    object TProdutosOperacaoobservacao: TWideStringField
      FieldName = 'observacao'
      Origin = 'observacao'
      Size = 100
    end
    object TProdutosOperacaoproduto: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'produto'
      Origin = 'produto'
      Size = 50
    end
    object TProdutosOperacaodata: TDateField
      FieldName = 'data'
      Origin = 'data'
    end
    object TProdutosOperacaosyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TProdutosOperacaoqtdeutilidado: TBCDField
      FieldName = 'qtdeutilidado'
      Origin = 'qtdeutilidado'
      Precision = 15
      Size = 3
    end
  end
  object QryOperacaoSafraTalhao: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      
        'select os.*,o.nome Operacao,u.nome responsavel,ac.nome cultura,r' +
        'c.nome receituario,'
      'acb.nome Cobertura,var.nome variedade,'
      'ats.nome TipoOpeSolido'
      'from operacaosafratalhao os '
      'join operacoes o on o.id=os.idoperacao'
      'left join usuario u on u.id=os.idresponsavel'
      'left join auxculturas ac on ac.id=os.idcultura'
      'left join receiturario rc on rc.id=os.idreceituario'
      'left join auxcobertura acb on acb.id=os.idcobertura'
      'left join auxcultivares var on var.id=os.idVariedade'
      
        'left join auxtipooperacaosolido ats on ats.id=os.idtipoaplicacao' +
        'solido'
      'where os.status>-1')
    Left = 570
    Top = 112
    object QryOperacaoSafraTalhaoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QryOperacaoSafraTalhaostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object QryOperacaoSafraTalhaodatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object QryOperacaoSafraTalhaoidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object QryOperacaoSafraTalhaodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object QryOperacaoSafraTalhaoidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object QryOperacaoSafraTalhaoidsafra: TIntegerField
      FieldName = 'idsafra'
      Origin = 'idsafra'
    end
    object QryOperacaoSafraTalhaoidoperacao: TIntegerField
      FieldName = 'idoperacao'
      Origin = 'idoperacao'
    end
    object QryOperacaoSafraTalhaodatainicio: TDateField
      FieldName = 'datainicio'
      Origin = 'datainicio'
    end
    object QryOperacaoSafraTalhaodatafim: TDateField
      FieldName = 'datafim'
      Origin = 'datafim'
    end
    object QryOperacaoSafraTalhaoobservacao: TWideStringField
      FieldName = 'observacao'
      Origin = 'observacao'
      Size = 100
    end
    object QryOperacaoSafraTalhaoidtalhao: TIntegerField
      FieldName = 'idtalhao'
      Origin = 'idtalhao'
    end
    object QryOperacaoSafraTalhaoidresponsavel: TIntegerField
      FieldName = 'idresponsavel'
      Origin = 'idresponsavel'
    end
    object QryOperacaoSafraTalhaooperacao: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'operacao'
      Origin = 'operacao'
      ReadOnly = True
      Size = 50
    end
    object QryOperacaoSafraTalhaoresponsavel: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'responsavel'
      Origin = 'responsavel'
      ReadOnly = True
      Size = 100
    end
    object QryOperacaoSafraTalhaoarearealizada: TBCDField
      FieldName = 'arearealizada'
      Origin = 'arearealizada'
      Precision = 15
      Size = 2
    end
    object QryOperacaoSafraTalhaoareaprevista: TBCDField
      FieldName = 'areaprevista'
      Origin = 'areaprevista'
      Precision = 15
      Size = 2
    end
    object QryOperacaoSafraTalhaotipoterraaereo: TWideStringField
      FieldName = 'tipoterraaereo'
      Origin = 'tipoterraaereo'
      Size = 100
    end
    object QryOperacaoSafraTalhaoidtipoaplicacaosolido: TIntegerField
      FieldName = 'idtipoaplicacaosolido'
      Origin = 'idtipoaplicacaosolido'
    end
    object QryOperacaoSafraTalhaoidcultura: TIntegerField
      FieldName = 'idcultura'
      Origin = 'idcultura'
    end
    object QryOperacaoSafraTalhaoidvariedade: TIntegerField
      FieldName = 'idvariedade'
      Origin = 'idvariedade'
    end
    object QryOperacaoSafraTalhaofinalidade: TWideStringField
      FieldName = 'finalidade'
      Origin = 'finalidade'
      Size = 30
    end
    object QryOperacaoSafraTalhaoidreceituario: TIntegerField
      FieldName = 'idreceituario'
      Origin = 'idreceituario'
    end
    object QryOperacaoSafraTalhaocultura: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'cultura'
      Origin = 'cultura'
      ReadOnly = True
      Size = 50
    end
    object QryOperacaoSafraTalhaoreceituario: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'receituario'
      Origin = 'receituario'
      ReadOnly = True
      Size = 50
    end
    object QryOperacaoSafraTalhaosyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object QryOperacaoSafraTalhaosyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
    object QryOperacaoSafraTalhaoqualidadecobertura: TWideStringField
      FieldName = 'qualidadecobertura'
      Origin = 'qualidadecobertura'
    end
    object QryOperacaoSafraTalhaoidcobertura: TIntegerField
      FieldName = 'idcobertura'
    end
    object QryOperacaoSafraTalhaocobertura: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'cobertura'
      Origin = 'cobertura'
      Size = 50
    end
    object QryOperacaoSafraTalhaovariedade: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'variedade'
      Origin = 'variedade'
      Size = 50
    end
    object QryOperacaoSafraTalhaotipoopesolido: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'tipoopesolido'
      Origin = 'tipoopesolido'
      Size = 50
    end
  end
  object QryMaquinaOperacao: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select a.*,b.modelo||'#39'-'#39'||b.prefixo maquina,'
      '(horafim-horainicio)-horaparada horaTotal'
      'from detoperacaosafratalhaomaquinasoperadores a'
      'join maquinaveiculo b on a.idmaquina=b.id'
      'where a.status=1 ')
    Left = 568
    Top = 168
    object QryMaquinaOperacaoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QryMaquinaOperacaostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object QryMaquinaOperacaodatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object QryMaquinaOperacaoidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object QryMaquinaOperacaodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object QryMaquinaOperacaoidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object QryMaquinaOperacaoidoperacaotalhao: TIntegerField
      FieldName = 'idoperacaotalhao'
      Origin = 'idoperacaotalhao'
    end
    object QryMaquinaOperacaoidmaquina: TIntegerField
      FieldName = 'idmaquina'
      Origin = 'idmaquina'
    end
    object QryMaquinaOperacaooperador: TWideStringField
      FieldName = 'operador'
      Origin = 'operador'
      Size = 100
    end
    object QryMaquinaOperacaoobservacao: TWideStringField
      FieldName = 'observacao'
      Origin = 'observacao'
      Size = 100
    end
    object QryMaquinaOperacaodata: TDateField
      FieldName = 'data'
      Origin = 'data'
    end
    object QryMaquinaOperacaohorafim: TBCDField
      FieldName = 'horafim'
      Origin = 'horafim'
      Precision = 15
      Size = 3
    end
    object QryMaquinaOperacaohoraparada: TBCDField
      FieldName = 'horaparada'
      Origin = 'horaparada'
      Precision = 15
      Size = 3
    end
    object QryMaquinaOperacaohorastrabalhada: TBCDField
      FieldName = 'horastrabalhada'
      Origin = 'horastrabalhada'
      Precision = 15
      Size = 3
    end
    object QryMaquinaOperacaomaquina: TWideMemoField
      AutoGenerateValue = arDefault
      FieldName = 'maquina'
      Origin = 'maquina'
      ReadOnly = True
      BlobType = ftWideMemo
    end
    object QryMaquinaOperacaohoratotal: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'horatotal'
      Origin = 'horatotal'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object QryMaquinaOperacaohorainicio: TBCDField
      FieldName = 'horainicio'
      Origin = 'horainicio'
      Precision = 15
      Size = 3
    end
    object QryMaquinaOperacaosyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
  end
  object qryProdutosOperacao: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      
        'select a.*,b.nome Produto from public.DetOperacaoSafraTalhaoProd' +
        'utos a'
      'join produtos b on b.id=a.idproduto'
      'where a.status=1')
    Left = 568
    Top = 216
    object qryProdutosOperacaoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryProdutosOperacaostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object qryProdutosOperacaodatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object qryProdutosOperacaoidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object qryProdutosOperacaodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object qryProdutosOperacaoidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object qryProdutosOperacaoidoperacaotalhao: TIntegerField
      FieldName = 'idoperacaotalhao'
      Origin = 'idoperacaotalhao'
    end
    object qryProdutosOperacaoidproduto: TIntegerField
      FieldName = 'idproduto'
      Origin = 'idproduto'
    end
    object qryProdutosOperacaoobservacao: TWideStringField
      FieldName = 'observacao'
      Origin = 'observacao'
      Size = 100
    end
    object qryProdutosOperacaoproduto: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'produto'
      Origin = 'produto'
      Size = 50
    end
    object qryProdutosOperacaodata: TDateField
      FieldName = 'data'
      Origin = 'data'
    end
    object qryProdutosOperacaoqtdeutilidado: TBCDField
      FieldName = 'qtdeutilidado'
      Origin = 'qtdeutilidado'
      Precision = 15
      Size = 3
    end
    object qryProdutosOperacaosyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
  end
  object qryOcorrenciaOperacao: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      
        'select a.*,b.nome TipoOcorrencia from DetOperacaoSafraTalhaoOcor' +
        'rencia a '
      'join auxtipoocorrencia b on a.idtipoocorrencia=b.id'
      'where a.status=1')
    Left = 564
    Top = 264
    object qryOcorrenciaOperacaoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryOcorrenciaOperacaostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object qryOcorrenciaOperacaodatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object qryOcorrenciaOperacaoidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object qryOcorrenciaOperacaodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object qryOcorrenciaOperacaoidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object qryOcorrenciaOperacaoidoperacaotalhao: TIntegerField
      FieldName = 'idoperacaotalhao'
      Origin = 'idoperacaotalhao'
    end
    object qryOcorrenciaOperacaodataocorrencia: TDateField
      FieldName = 'dataocorrencia'
      Origin = 'dataocorrencia'
    end
    object qryOcorrenciaOperacaoidtipoocorrencia: TIntegerField
      FieldName = 'idtipoocorrencia'
      Origin = 'idtipoocorrencia'
    end
    object qryOcorrenciaOperacaohora: TTimeField
      FieldName = 'hora'
      Origin = 'hora'
    end
    object qryOcorrenciaOperacaodescricao: TWideStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 100
    end
    object qryOcorrenciaOperacaotipoocorrencia: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'tipoocorrencia'
      Origin = 'tipoocorrencia'
      Size = 50
    end
    object qryOcorrenciaOperacaodata: TDateField
      FieldName = 'data'
      Origin = 'data'
    end
  end
  object TAuxTipoOperacaoSolido: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select * from auxTipoOperacaoSolido')
    Left = 568
    Top = 312
    object TAuxTipoOperacaoSolidoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TAuxTipoOperacaoSolidostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TAuxTipoOperacaoSolidodatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TAuxTipoOperacaoSolidoidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TAuxTipoOperacaoSolidodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TAuxTipoOperacaoSolidoidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TAuxTipoOperacaoSolidonome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
  end
  object TReceituario: TFDQuery
    CachedUpdates = True
    OnReconcileError = TReceituarioReconcileError
    Connection = FDConPG
    SQL.Strings = (
      'select b.*,u.nome Responsavel, '
      'cast('
      ' case'
      ' when b.status=1 then '#39'Aberto'#39
      ' when b.status=2 then '#39'Finalizado'#39
      'end as varchar(20)) statusStr,'
      'g.nome Cultura '
      'from receiturario b'
      'join usuario u on u.id=b.idResponsavel'
      'left join auxculturas g on g.id=b.idCultura'
      'order by b.datareg desc')
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
    object TReceituarioresponsavel: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'responsavel'
      Origin = 'responsavel'
      Size = 100
    end
    object TReceituariosyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TReceituariosyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
    object TReceituariostatusstr: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'statusstr'
      Origin = 'statusstr'
      ReadOnly = True
    end
    object TReceituariodatarecomendacao: TDateField
      FieldName = 'datarecomendacao'
      Origin = 'datarecomendacao'
    end
    object TReceituariodataprevaplicacao: TDateField
      FieldName = 'dataprevaplicacao'
      Origin = 'dataprevaplicacao'
    end
    object TReceituarioobservacao: TWideStringField
      FieldName = 'observacao'
      Origin = 'observacao'
      Size = 100
    end
    object TReceituarioidcultura: TIntegerField
      FieldName = 'idcultura'
      Origin = 'idcultura'
    end
    object TReceituariocultura: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'cultura'
      Origin = 'cultura'
      Size = 50
    end
  end
  object TDetReceituario: TFDQuery
    CachedUpdates = True
    OnReconcileError = TDetReceituarioReconcileError
    Connection = FDConPG
    SQL.Strings = (
      'select '
      ' d.*,'
      ' p.nome Produto'
      'from DetReceiturario d'
      'join produtos p on d.idproduto=p.id'
      'where d.status=1')
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
    object TDetReceituarioproduto: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'produto'
      Origin = 'produto'
      Size = 50
    end
    object TDetReceituariofinalidade: TWideStringField
      FieldName = 'finalidade'
      Origin = 'finalidade'
      Size = 100
    end
  end
  object TAuxGrupo: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select * from auxgrupoprodutos'
      'where status=1')
    Left = 28
    Top = 118
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
  end
  object TAuxSubGrupo: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select * from auxsubgrupoprodutos'
      'where status=1')
    Left = 28
    Top = 173
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
  end
  object TAuxCategorias: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select * from auxcategoriaitem'
      'WHERE Status=1'
      '')
    Left = 28
    Top = 228
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
  end
  object TPedidoCompra: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select a.*,u.nome Solicitante ,'
      'case '
      ' when a.idCategoria=0 then '#39'Produtos Estoque'#39
      ' when a.idCategoria=1 then '#39'Manuten'#231#227'o Maquinas e Veiculos'#39
      ' when a.idCategoria=2 then '#39'Servi'#231'os Gerais'#39
      'end Categoria, '
      'case '
      ' when a.status=0 then '#39'CANCELADO'#39' '
      ' when a.status=1 then '#39'AGUARDANDO APROVA'#199#195'O SUPERVISOR'#39
      ' when a.status=2 then '#39'AGUARDANDO APROVA'#199#195'O DIRETORIA'#39
      ' when a.status=3 then '#39'APROVADO PARA COTA'#199#195'O'#39
      ' when a.status=4 then '#39'COMPRA EFETUADA'#39
      ' when a.status=5 then '#39'PEDIDO RECEBIDO'#39
      ' when a.status=6 then '#39'PEDIDO FINALIZADO PARCIAL'#39
      ' when a.status=7 then '#39'PEDIDO FINALIZADO'#39
      'end STATUS_PEDIDO,'
      'am.nome||'#39'-'#39'|| m.modelo MaquinaVeiculo,'
      'asr.Nome TipoServico,'
      'sr.Descricao DescricaoServico,'
      
        '(select max(idstatus) from pedidostatus where status=1 and idped' +
        'ido=a.id)maxidstatus,'
      'c.nome centrocusto,'
      'p2.id idpropriedade '
      'from pedidocompra a '
      'join usuario u on u.Id=a.idsolicitante'
      'left join maquinaveiculo m on m.id=a.idmaquina'
      'left join auxmarcas am on m.idmarca=am.id'
      'left join servico sr on a.idServico=sr.id'
      'left join AuxTipoServico asr on asr.id=sr.idTipo'
      'left join centrocusto c on c.id=a.idcentrocusto '
      'left join propriedade p2 on a.idpropriedade=p2.id'
      'where a.status>-1')
    Left = 456
    Top = 3
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
    object TPedidoComprasolicitante: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'solicitante'
      Origin = 'solicitante'
      Size = 100
    end
    object TPedidoComprastatus_pedido: TWideMemoField
      AutoGenerateValue = arDefault
      FieldName = 'status_pedido'
      Origin = 'status_pedido'
      ReadOnly = True
      BlobType = ftWideMemo
    end
    object TPedidoCompracancelado: TIntegerField
      FieldName = 'cancelado'
      Origin = 'cancelado'
    end
    object TPedidoCompraidmaquina: TIntegerField
      FieldName = 'idmaquina'
      Origin = 'idmaquina'
    end
    object TPedidoCompramaquinaveiculo: TWideMemoField
      AutoGenerateValue = arDefault
      FieldName = 'maquinaveiculo'
      Origin = 'maquinaveiculo'
      ReadOnly = True
      BlobType = ftWideMemo
    end
    object TPedidoCompracategoria: TWideMemoField
      AutoGenerateValue = arDefault
      FieldName = 'categoria'
      Origin = 'categoria'
      ReadOnly = True
      BlobType = ftWideMemo
    end
    object TPedidoCompraidservico: TIntegerField
      FieldName = 'idservico'
      Origin = 'idservico'
    end
    object TPedidoCompratiposervico: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'tiposervico'
      Origin = 'tiposervico'
      Size = 50
    end
    object TPedidoCompradescricaoservico: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'descricaoservico'
      Origin = 'descricaoservico'
      Size = 100
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
    object TPedidoCompramaxidstatus: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'maxidstatus'
      Origin = 'maxidstatus'
      ReadOnly = True
    end
    object TPedidoCompraobservacao: TWideStringField
      FieldName = 'observacao'
      Origin = 'observacao'
      Size = 100
    end
    object TPedidoCompraidcentrocusto: TIntegerField
      FieldName = 'idcentrocusto'
      Origin = 'idcentrocusto'
    end
    object TPedidoCompraidpropriedade: TIntegerField
      FieldName = 'idpropriedade'
      Origin = 'idpropriedade'
    end
    object TPedidoCompracentrocusto: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'centrocusto'
      Origin = 'centrocusto'
      Size = 50
    end
  end
  object TItensPedido: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      
        'select  ROW_NUMBER () OVER (ORDER BY i.id)Item ,i.*,p.Nome,p.cod' +
        'igofabricante,am.nome marca '
      'from pedidocompraitems i '
      'join produtos p on i.iditem=p.Id'
      'left join auxmarcas am on am.id=i.idmarca'
      'where i.idpedido=25')
    Left = 456
    Top = 67
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
    object TItensPedidoNome: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'Nome'
      Origin = '"Nome"'
      Size = 50
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
    object TItensPedidotipo: TIntegerField
      FieldName = 'tipo'
      Origin = 'tipo'
    end
    object TItensPedidocodigofabricante: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'codigofabricante'
      Origin = 'codigofabricante'
      Size = 30
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
    object TItensPedidoitem: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'item'
      Origin = 'item'
      ReadOnly = True
    end
    object TItensPedidoidmarca: TIntegerField
      FieldName = 'idmarca'
      Origin = 'idmarca'
    end
    object TItensPedidooriginal: TIntegerField
      FieldName = 'original'
      Origin = 'original'
    end
    object TItensPedidomarca: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'marca'
      Origin = 'marca'
      Size = 50
    end
  end
  object TStatusPedido: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select  a.*,'
      ' case '
      '  when idstatus=0 then '#39'Cancelado'#39' '
      '  when idstatus=1 then '#39'Aguardando Aprovacao Supervisor'#39' '
      '  when idstatus=2 then '#39'Aguardando Aprovacao Diretoria'#39
      '  when idstatus=3 then '#39'Enviado para Compra'#39
      '  when idstatus=4 then '#39'Em Cotacao'#39
      '  when idstatus=5 then '#39'Em Transporte'#39
      '  when idstatus=6 then '#39'Recebido'#39
      '  when idstatus=7 then '#39'Finalizado'#39
      '  when idstatus=8 then '#39'Finalizado Parcialmente'#39
      ' end NomeStatus'
      'from pedidostatus a '
      'where status>-1')
    Left = 456
    Top = 123
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
    object TStatusPedidonomestatus: TWideMemoField
      AutoGenerateValue = arDefault
      FieldName = 'nomestatus'
      Origin = 'nomestatus'
      ReadOnly = True
      BlobType = ftWideMemo
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
  object TPedidoCompraRep: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select a.*,u.nome Solicitante ,'
      'case '
      ' when a.idCategoria=0 then '#39'Produtos Estoque'#39
      ' when a.idCategoria=1 then '#39'Manuten'#231#227'o Maquinas e Veiculos'#39
      ' when a.idCategoria=2 then '#39'Servi'#231'os Gerais'#39
      'end Categoria, '
      'case '
      ' when a.status=0 then '#39'CANCELADO'#39' '
      ' when a.status=1 then '#39'AGUARDANDO APROVA'#199#195'O SUPERVISOR'#39
      ' when a.status=2 then '#39'AGUARDANDO APROVA'#199#195'O DIRETORIA'#39
      ' when a.status=3 then '#39'APROVADO PARA COTA'#199#195'O'#39
      ' when a.status=4 then '#39'COMPRA EFETUADA'#39
      ' when a.status=5 then '#39'PEDIDO RECEBIDO'#39
      ' when a.status=6 then '#39'PEDIDO FINALIZADO PARCIAL'#39
      ' when a.status=7 then '#39'PEDIDO FINALIZADO'#39
      'end STATUS_PEDIDO,'
      'am.nome||'#39'-'#39'|| m.modelo MaquinaVeiculo,'
      'asr.Nome TipoServico,'
      'sr.Descricao DescricaoServico,'
      
        '(select max(idstatus) from pedidostatus where status=1 and idped' +
        'ido=a.id)maxidstatus '
      'from pedidocompra a '
      'join usuario u on u.Id=a.idsolicitante'
      'left join maquinaveiculo m on m.id=a.idmaquina'
      'left join auxmarcas am on m.idmarca=am.id'
      'left join servico sr on a.idServico=sr.id'
      'left join AuxTipoServico asr on asr.id=sr.idTipo'
      'where a.status>-1')
    Left = 720
    Top = 131
    object TPedidoCompraRepid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TPedidoCompraRepstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TPedidoCompraRepdatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TPedidoCompraRepidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TPedidoCompraRepdataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TPedidoCompraRepidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TPedidoCompraRepidsegmento: TIntegerField
      FieldName = 'idsegmento'
      Origin = 'idsegmento'
    end
    object TPedidoCompraRepidcategoria: TIntegerField
      FieldName = 'idcategoria'
      Origin = 'idcategoria'
    end
    object TPedidoCompraRepidentificador: TWideStringField
      FieldName = 'identificador'
      Origin = 'identificador'
    end
    object TPedidoCompraRepidsupervisoraprovacao: TIntegerField
      FieldName = 'idsupervisoraprovacao'
      Origin = 'idsupervisoraprovacao'
    end
    object TPedidoCompraRepdataaprovacaosupervisor: TDateField
      FieldName = 'dataaprovacaosupervisor'
      Origin = 'dataaprovacaosupervisor'
    end
    object TPedidoCompraRepiddiretoriaaprovacao: TIntegerField
      FieldName = 'iddiretoriaaprovacao'
      Origin = 'iddiretoriaaprovacao'
    end
    object TPedidoCompraRepdataaprovacaodiretoria: TDateField
      FieldName = 'dataaprovacaodiretoria'
      Origin = 'dataaprovacaodiretoria'
    end
    object TPedidoCompraRepdatapedido: TDateField
      FieldName = 'datapedido'
      Origin = 'datapedido'
    end
    object TPedidoCompraRepidsolicitante: TIntegerField
      FieldName = 'idsolicitante'
      Origin = 'idsolicitante'
    end
    object TPedidoCompraRepcancelado: TIntegerField
      FieldName = 'cancelado'
      Origin = 'cancelado'
    end
    object TPedidoCompraRepidmaquina: TIntegerField
      FieldName = 'idmaquina'
      Origin = 'idmaquina'
    end
    object TPedidoCompraRepidservico: TIntegerField
      FieldName = 'idservico'
      Origin = 'idservico'
    end
    object TPedidoCompraRepflagurgente: TIntegerField
      FieldName = 'flagurgente'
      Origin = 'flagurgente'
    end
    object TPedidoCompraRepsolicitante: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'solicitante'
      Origin = 'solicitante'
      Size = 100
    end
    object TPedidoCompraRepcategoria: TWideMemoField
      AutoGenerateValue = arDefault
      FieldName = 'categoria'
      Origin = 'categoria'
      ReadOnly = True
      BlobType = ftWideMemo
    end
    object TPedidoCompraRepstatus_pedido: TWideMemoField
      AutoGenerateValue = arDefault
      FieldName = 'status_pedido'
      Origin = 'status_pedido'
      ReadOnly = True
      BlobType = ftWideMemo
    end
    object TPedidoCompraRepmaquinaveiculo: TWideMemoField
      AutoGenerateValue = arDefault
      FieldName = 'maquinaveiculo'
      Origin = 'maquinaveiculo'
      ReadOnly = True
      BlobType = ftWideMemo
    end
    object TPedidoCompraReptiposervico: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'tiposervico'
      Origin = 'tiposervico'
      Size = 50
    end
    object TPedidoCompraRepdescricaoservico: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'descricaoservico'
      Origin = 'descricaoservico'
      Size = 100
    end
    object TPedidoCompraRepsyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TPedidoCompraRepsyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
    object TPedidoCompraRepmaxidstatus: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'maxidstatus'
      Origin = 'maxidstatus'
      ReadOnly = True
    end
  end
  object TAuxTipoServico: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select * from auxTipoServico'
      'where status=1')
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
  end
  object TServico: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select '
      ' a.*,'
      ' b.nome Tipo,'
      ' case '
      '  when a.idsegmento=0 then '#39'Agropecuaria'#39' '
      '  when a.idsegmento=1 then '#39'Agricultura'#39
      '  when a.idsegmento=2 then '#39'Ambos'#39
      ' end segmento '
      'from servico a '
      'join auxtiposervico b on a.idTipo=b.id'
      'where a.status=1')
    Left = 112
    Top = 232
    object TServicoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TServicostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TServicodatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TServicoidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TServicodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TServicoidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TServicoidtipo: TIntegerField
      FieldName = 'idtipo'
      Origin = 'idtipo'
    end
    object TServicodescricao: TWideStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 100
    end
    object TServicoidsegmento: TIntegerField
      FieldName = 'idsegmento'
      Origin = 'idsegmento'
    end
    object TServicoresponsavel: TWideStringField
      FieldName = 'responsavel'
      Origin = 'responsavel'
      Size = 100
    end
    object TServicotipo: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'tipo'
      Origin = 'tipo'
      Size = 50
    end
    object TServicosegmento: TWideMemoField
      AutoGenerateValue = arDefault
      FieldName = 'segmento'
      Origin = 'segmento'
      ReadOnly = True
      BlobType = ftWideMemo
    end
    object TServicodataprevista: TDateField
      FieldName = 'dataprevista'
      Origin = 'dataprevista'
    end
    object TServicosyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
  end
  object TOrcamento: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      
        'select y.*,((valortotal+itemfrete+itemipi+itemicmst+Itemdifal)-I' +
        'temdesconto)ValorLiquido from '
      '(select'
      'b.*,'
      'case'
      ' when b.status=1 then '#39'Solicita'#231#227'o'#39
      ' when b.status=2 then '#39'Solicita'#231#227'o'#39
      ' when b.status=3 then '#39'Ordem de Compra'#39
      'end statusStr,'
      'c.identificador,'
      'c.datapedido,'
      'f.nome Fornecedor,'
      'f.email,'
      'f.cpf_cnpj,'
      'f.telefone_fixo,'
      'f.inscricaoestadual,'
      'f.cidade,'
      'f.contatopessoa,'
      'fp.codigo||'#39'-'#39'||fp.descricao formapg,'
      
        'coalesce((select sum(valortotal) from orcamentositens where stat' +
        'us=1 and idorcamento=b.id),0) valorTotal,'
      
        'coalesce(b.frete,(select sum(frete) from orcamentositens where s' +
        'tatus=1 and idorcamento=b.id),0) Itemfrete,'
      
        'coalesce(b.desconto,(select sum(desconto) from orcamentositens w' +
        'here status=1 and idorcamento=b.id),0)Itemdesconto,'
      
        'coalesce((select sum(icmst) from orcamentositens where status=1 ' +
        'and idorcamento=b.id),0)Itemicmst,'
      
        'coalesce((select sum(ipi) from orcamentositens where status=1 an' +
        'd idorcamento=b.id),0)Itemipi,'
      
        'coalesce((select sum(diferencialalicota) from orcamentositens wh' +
        'ere status=1 and idorcamento=b.id),0)Itemdifal'
      'from orcamentos b'
      'join pedidocompra c on c.id=b.idpedido'
      'join fornecedor f on f.id=b.idfornecedor'
      
        'left join forma_pagamento_fornecedor fp on fp.id=b.idformapagame' +
        'nto'
      'where b.status>-1)y')
    Left = 456
    Top = 184
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
    object TOrcamentodesconto: TBCDField
      FieldName = 'desconto'
      Origin = 'desconto'
      Precision = 15
      Size = 3
    end
    object TOrcamentoipi: TBCDField
      FieldName = 'ipi'
      Origin = 'ipi'
      Precision = 15
      Size = 3
    end
    object TOrcamentoicmst: TBCDField
      FieldName = 'icmst'
      Origin = 'icmst'
      Precision = 15
      Size = 3
    end
    object TOrcamentofrete: TBCDField
      FieldName = 'frete'
      Origin = 'frete'
      Precision = 15
      Size = 3
    end
    object TOrcamentodiferencialalicota: TBCDField
      FieldName = 'diferencialalicota'
      Origin = 'diferencialalicota'
      Precision = 15
      Size = 3
    end
    object TOrcamentoidformapagamento: TIntegerField
      FieldName = 'idformapagamento'
      Origin = 'idformapagamento'
    end
    object TOrcamentostatusstr: TWideMemoField
      AutoGenerateValue = arDefault
      FieldName = 'statusstr'
      Origin = 'statusstr'
      ReadOnly = True
      BlobType = ftWideMemo
    end
    object TOrcamentoidentificador: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'identificador'
      Origin = 'identificador'
    end
    object TOrcamentodatapedido: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'datapedido'
      Origin = 'datapedido'
    end
    object TOrcamentofornecedor: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'fornecedor'
      Origin = 'fornecedor'
      Size = 100
    end
    object TOrcamentoemail: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'email'
      Origin = 'email'
      Size = 100
    end
    object TOrcamentocpf_cnpj: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'cpf_cnpj'
      Origin = 'cpf_cnpj'
      Size = 30
    end
    object TOrcamentotelefone_fixo: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'telefone_fixo'
      Origin = 'telefone_fixo'
    end
    object TOrcamentoinscricaoestadual: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'inscricaoestadual'
      Origin = 'inscricaoestadual'
    end
    object TOrcamentocidade: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'cidade'
      Origin = 'cidade'
      Size = 100
    end
    object TOrcamentocontatopessoa: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'contatopessoa'
      Origin = 'contatopessoa'
      Size = 100
    end
    object TOrcamentoformapg: TWideMemoField
      AutoGenerateValue = arDefault
      FieldName = 'formapg'
      Origin = 'formapg'
      ReadOnly = True
      BlobType = ftWideMemo
    end
    object TOrcamentovalortotal: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'valortotal'
      Origin = 'valortotal'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object TOrcamentoitemfrete: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'itemfrete'
      Origin = 'itemfrete'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object TOrcamentoitemdesconto: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'itemdesconto'
      Origin = 'itemdesconto'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object TOrcamentoitemicmst: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'itemicmst'
      Origin = 'itemicmst'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object TOrcamentoitemipi: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'itemipi'
      Origin = 'itemipi'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object TOrcamentoitemdifal: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'itemdifal'
      Origin = 'itemdifal'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object TOrcamentovalorliquido: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'valorliquido'
      Origin = 'valorliquido'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
  end
  object TItensOrcamento: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select'
      'ROW_NUMBER () OVER (ORDER BY a.id)Item ,'
      'a.*,'
      ' c.identificador identificadorPedido,'
      ' c.datapedido DataPedido,'
      ' c.status StatusPedido,'
      ' d.nome NomeFornecedor,'
      ' d.telefone_fixo TelefoneFornecedor,'
      ' d.email EmailFornecedor,'
      ' d.cpf_cnpj CpfCnpjFornecedor,'
      ' e.Nome NomeProduto,'
      ' e.codigofabricante CodFabProduto,'
      ' e.unidademedida,'
      '(a.valortotal-coalesce(a.desconto,0)) ValorDesconto,'
      ' case'
      '   when original=1 then '#39'ORIGINAL'#39
      '   when original=0 then '#39'PARALELO'#39
      ' end originalStr,'
      ' fpf.codigo||'#39'-'#39'||fpf.descricao FormaPG,'
      ' fpf.id idFormaPg,'
      ' d.nome Fornecedor,'
      ' b.frete freteGeral,'
      ' b.desconto descontoGeral,'
      ' am.nome marcanome'
      'from public.orcamentosItens a'
      'join orcamentos b on   b.id=a.idorcamento'
      
        'left join forma_pagamento_fornecedor fpf on fpf.id=b.idformapaga' +
        'mento '
      'join pedidocompra c on c.id=b.idpedido'
      'join fornecedor d on   d.id=b.idfornecedor'
      'join produtos e on      e.Id=a.idproduto'
      'left join auxmarcas am on am.id=a.idmarca'
      'where b.status>-1 and a.status>-1'
      'and idorcamento=318'
      ''
      '')
    Left = 456
    Top = 240
    object TItensOrcamentoitem: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'item'
      Origin = 'item'
      ReadOnly = True
    end
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
    object TItensOrcamentodesconto: TBCDField
      FieldName = 'desconto'
      Origin = 'desconto'
      Precision = 15
      Size = 3
    end
    object TItensOrcamentoipi: TBCDField
      FieldName = 'ipi'
      Origin = 'ipi'
      Precision = 15
      Size = 3
    end
    object TItensOrcamentoicmst: TBCDField
      FieldName = 'icmst'
      Origin = 'icmst'
      Precision = 15
      Size = 3
    end
    object TItensOrcamentofrete: TBCDField
      FieldName = 'frete'
      Origin = 'frete'
      Precision = 15
      Size = 3
    end
    object TItensOrcamentodiferencialalicota: TBCDField
      FieldName = 'diferencialalicota'
      Origin = 'diferencialalicota'
      Precision = 15
      Size = 3
    end
    object TItensOrcamentomarca: TWideStringField
      FieldName = 'marca'
      Origin = 'marca'
      Size = 100
    end
    object TItensOrcamentoidmarca: TIntegerField
      FieldName = 'idmarca'
      Origin = 'idmarca'
    end
    object TItensOrcamentooriginal: TIntegerField
      FieldName = 'original'
      Origin = 'original'
    end
    object TItensOrcamentounidademedida: TWideMemoField
      FieldName = 'unidademedida'
      Origin = 'unidademedida'
      BlobType = ftWideMemo
    end
    object TItensOrcamentoimg: TBlobField
      FieldName = 'img'
      Origin = 'img'
    end
    object TItensOrcamentoidentificadorpedido: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'identificadorpedido'
      Origin = 'identificadorpedido'
    end
    object TItensOrcamentodatapedido: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'datapedido'
      Origin = 'datapedido'
    end
    object TItensOrcamentostatuspedido: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'statuspedido'
      Origin = 'statuspedido'
    end
    object TItensOrcamentonomefornecedor: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'nomefornecedor'
      Origin = 'nomefornecedor'
      Size = 100
    end
    object TItensOrcamentotelefonefornecedor: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'telefonefornecedor'
      Origin = 'telefonefornecedor'
    end
    object TItensOrcamentoemailfornecedor: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'emailfornecedor'
      Origin = 'emailfornecedor'
      Size = 100
    end
    object TItensOrcamentocpfcnpjfornecedor: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'cpfcnpjfornecedor'
      Origin = 'cpfcnpjfornecedor'
      Size = 30
    end
    object TItensOrcamentonomeproduto: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'nomeproduto'
      Origin = 'nomeproduto'
      Size = 50
    end
    object TItensOrcamentocodfabproduto: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'codfabproduto'
      Origin = 'codfabproduto'
      Size = 30
    end
    object TItensOrcamentovalordesconto: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'valordesconto'
      Origin = 'valordesconto'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object TItensOrcamentooriginalstr: TWideMemoField
      AutoGenerateValue = arDefault
      FieldName = 'originalstr'
      Origin = 'originalstr'
      ReadOnly = True
      BlobType = ftWideMemo
    end
    object TItensOrcamentoformapg: TWideMemoField
      AutoGenerateValue = arDefault
      FieldName = 'formapg'
      Origin = 'formapg'
      ReadOnly = True
      BlobType = ftWideMemo
    end
    object TItensOrcamentoidformapg: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'idformapg'
      Origin = 'idformapg'
    end
    object TItensOrcamentofornecedor: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'fornecedor'
      Origin = 'fornecedor'
      Size = 100
    end
    object TItensOrcamentofretegeral: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'fretegeral'
      Origin = 'fretegeral'
      Precision = 15
      Size = 3
    end
    object TItensOrcamentodescontogeral: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'descontogeral'
      Origin = 'descontogeral'
      Precision = 15
      Size = 3
    end
    object TItensOrcamentomarcanome: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'marcanome'
      Origin = 'marcanome'
      Size = 50
    end
  end
  object TOrcamentoFornecedores: TFDQuery
    Connection = FDConPG
    SQL.Strings = (
      'select b.*,a.Id IdOrcamento from orcamentos a '
      'join fornecedor b on a.idfornecedor=b.id '
      'where idpedido=10'
      'and a.status>-1')
    Left = 720
    Top = 72
    object TOrcamentoFornecedoresid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TOrcamentoFornecedoresstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TOrcamentoFornecedoresdatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TOrcamentoFornecedoresidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TOrcamentoFornecedoresdataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TOrcamentoFornecedoresidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TOrcamentoFornecedoresnome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 100
    end
    object TOrcamentoFornecedorescidade: TWideStringField
      FieldName = 'cidade'
      Origin = 'cidade'
      Size = 100
    end
    object TOrcamentoFornecedoresuf: TWideStringField
      FieldName = 'uf'
      Origin = 'uf'
      FixedChar = True
      Size = 2
    end
    object TOrcamentoFornecedorescpf_cnpj: TWideStringField
      FieldName = 'cpf_cnpj'
      Origin = 'cpf_cnpj'
      Size = 30
    end
    object TOrcamentoFornecedorestelefone_fixo: TWideStringField
      FieldName = 'telefone_fixo'
      Origin = 'telefone_fixo'
    end
    object TOrcamentoFornecedorescelular: TWideStringField
      FieldName = 'celular'
      Origin = 'celular'
    end
    object TOrcamentoFornecedoresemail: TWideStringField
      FieldName = 'email'
      Origin = 'email'
      Size = 100
    end
    object TOrcamentoFornecedorescontatopessoa: TWideStringField
      FieldName = 'contatopessoa'
      Origin = 'contatopessoa'
      Size = 100
    end
    object TOrcamentoFornecedoresidorcamento: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'idorcamento'
      Origin = 'idorcamento'
    end
  end
  object TAuxCobertura: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select * from auxCobertura'
      'where status=1')
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
    Left = 1056
    Top = 224
  end
  object TLocalEstoque: TFDQuery
    CachedUpdates = True
    OnReconcileError = TLocalEstoqueReconcileError
    Connection = FDConPG
    SQL.Strings = (
      'select a.*,'
      '  case a.idSegmento'
      '   when 0 then '#39'AGROPECU'#193'RIA'#39
      '   when 1 then '#39'AGRICULTURA'#39
      '   when 2 then '#39'AMBOS'#39
      '  end Segmento  '
      'from LocalEstoque a'
      'where status=1')
    Left = 848
    Top = 80
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
    object TLocalEstoquesegmento: TWideMemoField
      AutoGenerateValue = arDefault
      FieldName = 'segmento'
      Origin = 'segmento'
      ReadOnly = True
      BlobType = ftWideMemo
    end
    object TLocalEstoquesyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TLocalEstoquesyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
    object TLocalEstoquecombustivel: TIntegerField
      FieldName = 'combustivel'
      Origin = 'combustivel'
    end
  end
  object TCentroCusto: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select '
      ' a.*,'
      '  case a.idSegmento'
      '   when 0 then '#39'AGROPECU'#193'RIA'#39
      '   when 1 then '#39'AGRICULTURA'#39
      '   when 2 then '#39'AMBOS'#39
      '  end Segmento  '
      'from CentroCusto a'
      'where status=1')
    Left = 856
    Top = 144
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
    object TCentroCustosegmento: TWideMemoField
      AutoGenerateValue = arDefault
      FieldName = 'segmento'
      Origin = 'segmento'
      ReadOnly = True
      BlobType = ftWideMemo
    end
  end
  object TOperadorMaquina: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select * from OperadorMaquinas'
      'where status=1')
    Left = 456
    Top = 304
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
    Connection = FDConPG
    SQL.Strings = (
      'select * from auxTipoCultivar'
      'where status=1')
    Left = 456
    Top = 360
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
  object ScriptSetSequnce: TFDScript
    SQLScripts = <
      item
        SQL.Strings = (
          'SELECT setval_max('#39'public'#39');')
      end>
    Connection = FDConPG
    ScriptOptions.FileEncoding = ecUTF8
    Params = <>
    Macros = <>
    FetchOptions.AssignedValues = [evItems, evAutoClose, evAutoFetchAll]
    FetchOptions.AutoClose = False
    FetchOptions.Items = [fiBlobs, fiDetails]
    ResourceOptions.AssignedValues = [rvMacroCreate, rvMacroExpand, rvDirectExecute, rvPersistent]
    ResourceOptions.MacroCreate = False
    ResourceOptions.DirectExecute = True
    Left = 1144
    Top = 206
  end
  object TDetReceiturioTalhao: TFDQuery
    CachedUpdates = True
    OnReconcileError = TDetReceituarioReconcileError
    Connection = FDConPG
    SQL.Strings = (
      'select '
      ' d.*,'
      ' p.nome Talhao,'
      ' p.AreaHE'
      'from detreceiturarioTalhao d'
      'join Talhoes p on d.idTalhao=p.id'
      'where d.status=1')
    Left = 200
    Top = 336
    object TDetReceiturioTalhaoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TDetReceiturioTalhaostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TDetReceiturioTalhaodatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TDetReceiturioTalhaoidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TDetReceiturioTalhaodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TDetReceiturioTalhaoidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TDetReceiturioTalhaoidtalhao: TIntegerField
      FieldName = 'idtalhao'
      Origin = 'idtalhao'
    end
    object TDetReceiturioTalhaoareahe: TBCDField
      FieldName = 'areahe'
      Origin = 'areahe'
      Precision = 15
      Size = 2
    end
    object TDetReceiturioTalhaosyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TDetReceiturioTalhaosyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
    object TDetReceiturioTalhaoidreceiturario: TIntegerField
      FieldName = 'idreceiturario'
      Origin = 'idreceiturario'
    end
    object TDetReceiturioTalhaotalhao: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'talhao'
      Origin = 'talhao'
      Size = 50
    end
    object TDetReceiturioTalhaoareahe_1: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'areahe_1'
      Origin = 'areahe'
      Precision = 15
      Size = 2
    end
  end
  object TVazaoOperacao: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select * from DetVazaoOperacao'
      'where status=1')
    Left = 312
    Top = 248
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
    Connection = FDConPG
    SQL.Strings = (
      'SELECT a.*,b.nome setor FROM pluviometro a '
      'join setor b on a.idSetor=b.id'
      'where a.status=1')
    Left = 312
    Top = 296
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
    object TPluviometrossetor: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'setor'
      Origin = 'setor'
      Size = 50
    end
  end
  object TPluviometroTalhoes: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select a.*,b.nome Talhao from pluviometrotalhoes a '
      'join talhoes b on a.idtalhao=b.id'
      'where a.status=1 and a.idtalhao=1')
    Left = 312
    Top = 344
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
    object TPluviometroTalhoestalhao: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'talhao'
      Origin = 'talhao'
      Size = 50
    end
  end
  object TPluviometria: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      
        'select a.*,b.nome Pluviometro,d.nome Talhao,e.nome Setor from pl' +
        'uviometria a'
      'join pluviometro b on a.idPluviometro=b.id'
      'join pluviometrotalhoes c on c.idpluviometro=b.id'
      'join talhoes d on d.id=c.idtalhao'
      'join setor e on e.id=d.idSetor'
      'WHERE a.status=1')
    Left = 312
    Top = 400
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
    object TPluviometriapluviometro: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'pluviometro'
      Origin = 'pluviometro'
      Size = 50
    end
    object TPluviometriatalhao: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'talhao'
      Origin = 'talhao'
      Size = 50
    end
    object TPluviometriasetor: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'setor'
      Origin = 'setor'
      Size = 50
    end
  end
  object TAbastecimentoOutros: TFDQuery
    CachedUpdates = True
    OnReconcileError = TAbastecimentoOutrosReconcileError
    Connection = FDConPG
    SQL.Strings = (
      'select a.*,b.nome produto from abastecimentoOutros a '
      'join produtos b on a.idProduto=b.id  ')
    Left = 312
    Top = 496
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
    object TAbastecimentoOutrosproduto: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'produto'
      Origin = 'produto'
      ReadOnly = True
      Size = 50
    end
  end
  object TAbastecimento: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select  '
      '     a.*,  '
      '     case  '
      '      when a.combustivel=0 then '#39'Diesel'#39'  '
      '      when a.combustivel=1 then '#39'Gasolina'#39'  '
      '      when a.combustivel=2 then '#39'Alcool'#39'  '
      '     end CombustivelNome,  '
      '     b.nome LocalEstoqueNome,  '
      '     c.prefixo MaquinaPrefixo,  '
      '     d.nome Operador,'
      '     h.nome Atividade  '
      '     from abastecimento a  '
      '     join localestoque b on a.idlocalestoque=b.id  '
      '     join maquinaveiculo c on c.id=a.idmaquina  '
      '     join operadormaquinas d on d.id=a.idoperador'
      '     join auxatividadeabastecimento h on h.id=a.idAtividade  '
      '     where a.status=1  ')
    Left = 312
    Top = 448
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
    object TAbastecimentocombustivelnome: TWideMemoField
      AutoGenerateValue = arDefault
      FieldName = 'combustivelnome'
      Origin = 'combustivelnome'
      ReadOnly = True
      BlobType = ftWideMemo
    end
    object TAbastecimentolocalestoquenome: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'localestoquenome'
      Origin = 'localestoquenome'
      Size = 50
    end
    object TAbastecimentomaquinaprefixo: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'maquinaprefixo'
      Origin = 'maquinaprefixo'
    end
    object TAbastecimentooperador: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'operador'
      Origin = 'operador'
      Size = 50
    end
    object TAbastecimentohorimetro: TBCDField
      FieldName = 'horimetro'
      Origin = 'horimetro'
      Precision = 15
      Size = 3
    end
    object TAbastecimentoidatividade: TIntegerField
      FieldName = 'idatividade'
      Origin = 'idatividade'
    end
    object TAbastecimentoatividade: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'atividade'
      Origin = 'atividade'
      Size = 50
    end
    object TAbastecimentoobs: TWideStringField
      FieldName = 'obs'
      Origin = 'obs'
      Size = 100
    end
  end
  object PgDriverLink: TFDPhysPgDriverLink
    VendorLib = 'E:\Projetos2021\Fortaleza\Deploy\libpq.dll'
    Left = 1144
    Top = 312
  end
  object TAuxPragas: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select a.*,b.nome Tipo from public.auxPragas a '
      'left join auxpragastipo b on a.idTipo=b.id'
      'where a.status=1')
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
    object TAuxPragasidtipo: TIntegerField
      FieldName = 'idtipo'
      Origin = 'idtipo'
    end
    object TAuxPragastipo: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'tipo'
      Origin = 'tipo'
      Size = 50
    end
  end
  object TMonitoramento: TFDQuery
    Connection = FDConPG
    SQL.Strings = (
      
        'select a.*,b.NOME Talhao,c.Nome Responsavel from monitoramentopr' +
        'agas a'
      'join talhoes b on a.idTalhao=b.id'
      'join setor s on s.id=b.idSetor'
      'join usuario c on c.id=a.idusuario'
      'where a.status=1')
    Left = 456
    Top = 416
    object TMonitoramentoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TMonitoramentostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TMonitoramentodatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TMonitoramentoidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TMonitoramentodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TMonitoramentoidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TMonitoramentodatamonitoramento: TDateField
      FieldName = 'datamonitoramento'
      Origin = 'datamonitoramento'
    end
    object TMonitoramentoidtalhao: TIntegerField
      FieldName = 'idtalhao'
      Origin = 'idtalhao'
    end
    object TMonitoramentohorainicio: TSQLTimeStampField
      FieldName = 'horainicio'
      Origin = 'horainicio'
    end
    object TMonitoramentotipoabertura: TIntegerField
      FieldName = 'tipoabertura'
      Origin = 'tipoabertura'
    end
    object TMonitoramentohorafim: TSQLTimeStampField
      FieldName = 'horafim'
      Origin = 'horafim'
    end
    object TMonitoramentosyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TMonitoramentosyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
    object TMonitoramentotagabertura: TWideStringField
      FieldName = 'tagabertura'
      Origin = 'tagabertura'
      Size = 50
    end
    object TMonitoramentotagfechamento: TWideStringField
      FieldName = 'tagfechamento'
      Origin = 'tagfechamento'
      Size = 50
    end
    object TMonitoramentotalhao: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'talhao'
      Origin = 'talhao'
      Size = 50
    end
    object TMonitoramentoresponsavel: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'responsavel'
      Origin = 'responsavel'
      Size = 100
    end
  end
  object TMonitoramentoValores: TFDQuery
    Connection = FDConPG
    SQL.Strings = (
      'select '
      ' a.id,'
      ' b.ponto,'
      ' b.latitude,'
      ' b.longitude,'
      ' c.nome Praga,'
      ' a.contagem,'
      'cast(case'
      '  when caracteristica=0 then '#39'Postura'#39
      '  when caracteristica=1 then '#39'Pequena'#39
      '  when caracteristica=2 then '#39'M'#233'dia'#39
      '  when caracteristica=3 then '#39'Grande'#39
      '  when caracteristica=4 then '#39'Ninfas'#39
      '  when caracteristica=5 then '#39'Rajado'#39
      '  when caracteristica=6 then '#39'Adultos'#39
      '  when caracteristica=7 then '#39'Branco'#39
      ' end as varchar(30)) CaracteristicaStr'
      'from monitoramentopragaspontosvalores a '
      'join auxpragas c on c.id=a.idpraga'
      'join monitoramentopragaspontos b on b.id=a.idponto'
      'order by b.ponto')
    Left = 448
    Top = 472
    object TMonitoramentoValoresponto: TWideStringField
      FieldName = 'ponto'
      Origin = 'ponto'
    end
    object TMonitoramentoValoreslatitude: TWideStringField
      FieldName = 'latitude'
      Origin = 'latitude'
      Size = 50
    end
    object TMonitoramentoValoreslongitude: TWideStringField
      FieldName = 'longitude'
      Origin = 'longitude'
      Size = 50
    end
    object TMonitoramentoValorespraga: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'praga'
      Origin = 'praga'
      Size = 50
    end
    object TMonitoramentoValorescontagem: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'contagem'
      Origin = 'contagem'
    end
    object TMonitoramentoValoresid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TMonitoramentoValorescaracteristicastr: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'caracteristicastr'
      Origin = 'caracteristicastr'
      ReadOnly = True
      Size = 30
    end
  end
  object TAuxPragaTipo: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select * from auxpragastipo'
      'where status=1')
    Left = 584
    Top = 384
    object TAuxPragaTipoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TAuxPragaTipostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TAuxPragaTipodatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TAuxPragaTipoidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TAuxPragaTipodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TAuxPragaTipoidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TAuxPragaTiponome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TAuxPragaTiposyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TAuxPragaTiposyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
  end
  object FDConPG: TFDConnection
    Params.Strings = (
      'Database=Aws03112021'
      'Server=127.0.0.1'
      'User_Name=postgres'
      'Password=Dev#110485'
      'Pooled='
      'DriverID=PG')
    Connected = True
    LoginPrompt = False
    Left = 1144
    Top = 264
  end
  object TMovLocalEstoque: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      
        'select a.*,o.nome LocalOrigem,d.nome LocalDestino,c.nome Produto' +
        ' from tranferenciaLocalestoque A '
      'join localestoque o on o.id=a.idlocalestoqueorigem'
      'join localestoque d on d.id=a.idlocalestoquedetino'
      'join produtos c on a.idproduto=c.id'
      'where a.status=1')
    Left = 736
    Top = 208
    object TMovLocalEstoqueid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TMovLocalEstoquestatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TMovLocalEstoquedatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TMovLocalEstoqueidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TMovLocalEstoquedataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TMovLocalEstoqueidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TMovLocalEstoqueidlocalestoqueorigem: TIntegerField
      FieldName = 'idlocalestoqueorigem'
      Origin = 'idlocalestoqueorigem'
    end
    object TMovLocalEstoqueidlocalestoquedetino: TIntegerField
      FieldName = 'idlocalestoquedetino'
      Origin = 'idlocalestoquedetino'
    end
    object TMovLocalEstoqueidproduto: TIntegerField
      FieldName = 'idproduto'
      Origin = 'idproduto'
    end
    object TMovLocalEstoqueqtde: TBCDField
      FieldName = 'qtde'
      Origin = 'qtde'
      Precision = 15
      Size = 3
    end
    object TMovLocalEstoquedatamov: TDateField
      FieldName = 'datamov'
      Origin = 'datamov'
    end
    object TMovLocalEstoquehora: TTimeField
      FieldName = 'hora'
      Origin = 'hora'
    end
    object TMovLocalEstoquesyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TMovLocalEstoquesyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
    object TMovLocalEstoquelocalorigem: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'localorigem'
      Origin = 'localorigem'
      Size = 50
    end
    object TMovLocalEstoquelocaldestino: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'localdestino'
      Origin = 'localdestino'
      Size = 50
    end
    object TMovLocalEstoqueproduto: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'produto'
      Origin = 'produto'
      Size = 50
    end
  end
  object Tauxatividadeabastecimento: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'SELECT * FROM public.auxatividadeabastecimento'
      'WHERE STATUS=1')
    Left = 848
    Top = 264
    object Tauxatividadeabastecimentoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object Tauxatividadeabastecimentostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object Tauxatividadeabastecimentodatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object Tauxatividadeabastecimentoidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object Tauxatividadeabastecimentodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object Tauxatividadeabastecimentoidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object Tauxatividadeabastecimentonome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object Tauxatividadeabastecimentosyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object Tauxatividadeabastecimentosyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
  end
  object TMPComparativo: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select * from tmpComparativo'
      'order by item')
    Left = 744
    Top = 296
    object TMPComparativoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TMPComparativoitem: TIntegerField
      FieldName = 'item'
      Origin = 'item'
    end
    object TMPComparativoqtd: TIntegerField
      FieldName = 'qtd'
      Origin = 'qtd'
    end
    object TMPComparativounidademedida: TWideStringField
      FieldName = 'unidademedida'
      Origin = 'unidademedida'
    end
    object TMPComparativocodfabricante: TWideStringField
      FieldName = 'codfabricante'
      Origin = 'codfabricante'
    end
    object TMPComparativodescricao: TWideStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 100
    end
    object TMPComparativofornecedor: TWideStringField
      FieldName = 'fornecedor'
      Origin = 'fornecedor'
      Size = 200
    end
    object TMPComparativovalorunitario: TBCDField
      FieldName = 'valorunitario'
      Origin = 'valorunitario'
      Precision = 15
      Size = 2
    end
    object TMPComparativovalortotal: TBCDField
      FieldName = 'valortotal'
      Origin = 'valortotal'
      Precision = 15
      Size = 2
    end
    object TMPComparativoidproduto: TIntegerField
      FieldName = 'idproduto'
      Origin = 'idproduto'
    end
    object TMPComparativoidorcamento: TIntegerField
      FieldName = 'idorcamento'
      Origin = 'idorcamento'
    end
    object TMPComparativoidfornecedor: TIntegerField
      FieldName = 'idfornecedor'
      Origin = 'idfornecedor'
    end
  end
  object Compradores: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'SELECT * FROM comprador')
    Left = 968
    Top = 360
    object Compradoresid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object Compradoresstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object Compradoresdatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object Compradoresidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object Compradoresdataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object Compradoresidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object Compradoresnome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 100
    end
    object Compradorescidade: TWideStringField
      FieldName = 'cidade'
      Origin = 'cidade'
      Size = 100
    end
    object Compradoresuf: TWideStringField
      FieldName = 'uf'
      Origin = 'uf'
      FixedChar = True
      Size = 2
    end
    object Compradorescpf_cnpj: TWideStringField
      FieldName = 'cpf_cnpj'
      Origin = 'cpf_cnpj'
      Size = 30
    end
    object Compradorestelefone_fixo: TWideStringField
      FieldName = 'telefone_fixo'
      Origin = 'telefone_fixo'
    end
    object Compradorescelular: TWideStringField
      FieldName = 'celular'
      Origin = 'celular'
    end
    object Compradoresemail: TWideStringField
      FieldName = 'email'
      Origin = 'email'
      Size = 100
    end
    object Compradorescontatopessoa: TWideStringField
      FieldName = 'contatopessoa'
      Origin = 'contatopessoa'
      Size = 100
    end
    object Compradoressenha: TWideStringField
      FieldName = 'senha'
      Origin = 'senha'
    end
    object Compradoressyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object Compradoresrazaosocial: TWideStringField
      FieldName = 'razaosocial'
      Origin = 'razaosocial'
      Size = 100
    end
    object Compradoresinscricaoestadual: TWideStringField
      FieldName = 'inscricaoestadual'
      Origin = 'inscricaoestadual'
    end
    object Compradoressyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
  end
  object Contratos: TFDQuery
    CachedUpdates = True
    OnReconcileError = ContratosReconcileError
    Connection = FDConPG
    SQL.Strings = (
      'select '
      ' x.*,'
      ' x.valortotalSaca-ValorTotalEmbarque valorSaldo'
      'from'
      '(select '
      ' a.*,'
      ' b.nome Comprador,'
      ' c.nome Cultura,'
      ' d.nome safra,'
      ' a.totalcompravolume-a.totalembarquevolume Saldo,'
      ' case '
      '  when a.status = 1 then '#39'ABERTO'#39
      '  when a.status = 2 then '#39'FINALIZADO'#39
      '  when a.status = 3 then '#39'EMBARCANDO'#39
      ' end StatusStr, '
      ' case '
      
        '  when a.totalcompravolume-a.totalembarquevolume  > 0 then (a.to' +
        'talcompravolume-a.totalembarquevolume)/60'
      '  else'
      '   0'
      ' end SaldoSC,'
      
        ' (select sum(valornf) from embarque where status=1 and idcontrat' +
        'o=a.id) ValorTotalEmbarque'
      'from contratos a '
      'join comprador b on a.idcomprador=b.id'
      'join auxculturas c on c.id=a.idcultura'
      'join safra d on d.id=a.idSafra'
      'where a.status>-1)x')
    Left = 968
    Top = 416
    object Contratosid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object Contratosstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object Contratosdatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object Contratosidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object Contratosdataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object Contratosidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object Contratosidcomprador: TIntegerField
      FieldName = 'idcomprador'
      Origin = 'idcomprador'
    end
    object Contratosnumerocontrato: TWideStringField
      FieldName = 'numerocontrato'
      Origin = 'numerocontrato'
    end
    object Contratostotalcompravolume: TBCDField
      FieldName = 'totalcompravolume'
      Origin = 'totalcompravolume'
      Precision = 15
      Size = 3
    end
    object Contratostotalcomprasacos: TBCDField
      FieldName = 'totalcomprasacos'
      Origin = 'totalcomprasacos'
      Precision = 15
      Size = 3
    end
    object Contratostotalembarquevolume: TBCDField
      FieldName = 'totalembarquevolume'
      Origin = 'totalembarquevolume'
      Precision = 15
      Size = 3
    end
    object Contratostotalembarquesacos: TBCDField
      FieldName = 'totalembarquesacos'
      Origin = 'totalembarquesacos'
      Precision = 15
      Size = 3
    end
    object Contratossyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object Contratossyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
    object Contratosidcultura: TIntegerField
      FieldName = 'idcultura'
      Origin = 'idcultura'
    end
    object Contratosidsafra: TIntegerField
      FieldName = 'idsafra'
      Origin = 'idsafra'
    end
    object Contratoscomprador: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'comprador'
      Origin = 'comprador'
      Size = 100
    end
    object Contratoscultura: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'cultura'
      Origin = 'cultura'
      Size = 50
    end
    object Contratossafra: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'safra'
      Origin = 'safra'
      Size = 50
    end
    object Contratossaldo: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'saldo'
      Origin = 'saldo'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object Contratosstatusstr: TWideMemoField
      AutoGenerateValue = arDefault
      FieldName = 'statusstr'
      Origin = 'statusstr'
      ReadOnly = True
      BlobType = ftWideMemo
    end
    object Contratossaldosc: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'saldosc'
      Origin = 'saldosc'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object Contratosvendedor: TWideStringField
      FieldName = 'vendedor'
      Origin = 'vendedor'
      Size = 100
    end
    object Contratosvalortotalsaca: TBCDField
      FieldName = 'valortotalsaca'
      Origin = 'valortotalsaca'
      Precision = 15
      Size = 3
    end
    object Contratosvalorkg: TBCDField
      FieldName = 'valorkg'
      Origin = 'valorkg'
      Precision = 15
      Size = 3
    end
    object Contratosvalortotalembarque: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'valortotalembarque'
      Origin = 'valortotalembarque'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object Contratosvalorsaldo: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'valorsaldo'
      Origin = 'valorsaldo'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
  end
  object Embarque: TFDQuery
    CachedUpdates = True
    OnReconcileError = EmbarqueReconcileError
    Connection = FDConPG
    SQL.Strings = (
      'select * from embarque'
      'where idcontrato=1')
    Left = 968
    Top = 472
    object Embarqueid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object Embarquestatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object Embarquedatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object Embarqueidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object Embarquedataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object Embarqueidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object Embarqueidcontrato: TIntegerField
      FieldName = 'idcontrato'
      Origin = 'idcontrato'
    end
    object Embarquenumeronf: TIntegerField
      FieldName = 'numeronf'
      Origin = 'numeronf'
    end
    object Embarqueplaca: TWideStringField
      FieldName = 'placa'
      Origin = 'placa'
      Size = 15
    end
    object Embarquedataembarque: TDateField
      FieldName = 'dataembarque'
      Origin = 'dataembarque'
    end
    object Embarquetara: TBCDField
      FieldName = 'tara'
      Origin = 'tara'
      Precision = 15
      Size = 3
    end
    object Embarquebruto: TBCDField
      FieldName = 'bruto'
      Origin = 'bruto'
      Precision = 15
      Size = 3
    end
    object Embarqueliquido: TBCDField
      FieldName = 'liquido'
      Origin = 'liquido'
      Precision = 15
      Size = 3
    end
    object Embarquesyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object Embarquesyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
    object Embarquehorabarque: TTimeField
      FieldName = 'horabarque'
      Origin = 'horabarque'
    end
    object Embarqueimp: TBCDField
      FieldName = 'imp'
      Origin = 'imp'
      Precision = 15
      Size = 3
    end
    object Embarquequeb: TBCDField
      FieldName = 'queb'
      Origin = 'queb'
      Precision = 15
      Size = 3
    end
    object Embarqueverd: TBCDField
      FieldName = 'verd'
      Origin = 'verd'
      Precision = 15
      Size = 3
    end
    object Embarqueavar: TBCDField
      FieldName = 'avar'
      Origin = 'avar'
      Precision = 15
      Size = 3
    end
    object Embarqueumid: TBCDField
      FieldName = 'umid'
      Origin = 'umid'
      Precision = 15
      Size = 3
    end
    object Embarquevalornf: TBCDField
      FieldName = 'valornf'
      Origin = 'valornf'
      Precision = 15
      Size = 3
    end
  end
  object TEstoqueSaida: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select '
      ' a.*,'
      ' c.nome localEstoque,'
      ' d.nome CentroCusto,'
      ' e.nome Produto,'
      ' e.codigofabricante ProdutoCodFabricante,'
      ' case'
      '   when tipo_baixa=0 then '#39'Baixa Estoque'#39
      '   when tipo_baixa=1 then '#39'Acerto Estoque'#39' '
      ' end TipoStr'
      'from estoquesaida a '
      'join localestoque c on c.id=a.idlocalestoque'
      'join centrocusto d on d.id=a.idcentrocusto'
      'join produtos e on e.id=a.idproduto'
      'where a.status=1')
    Left = 952
    Top = 200
    object TEstoqueSaidaid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TEstoqueSaidastatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TEstoqueSaidadatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TEstoqueSaidaidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TEstoqueSaidadataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TEstoqueSaidaidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TEstoqueSaidaidproduto: TIntegerField
      FieldName = 'idproduto'
      Origin = 'idproduto'
    end
    object TEstoqueSaidadatasaidaestoque: TDateField
      FieldName = 'datasaidaestoque'
      Origin = 'datasaidaestoque'
    end
    object TEstoqueSaidaqtditens: TFMTBCDField
      FieldName = 'qtditens'
      Origin = 'qtditens'
      Precision = 18
      Size = 2
    end
    object TEstoqueSaidaunidademedida: TWideStringField
      FieldName = 'unidademedida'
      Origin = 'unidademedida'
    end
    object TEstoqueSaidaidlocalestoque: TIntegerField
      FieldName = 'idlocalestoque'
      Origin = 'idlocalestoque'
    end
    object TEstoqueSaidaidcentrocusto: TIntegerField
      FieldName = 'idcentrocusto'
      Origin = 'idcentrocusto'
    end
    object TEstoqueSaidasyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TEstoqueSaidasyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
    object TEstoqueSaidalocalestoque: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'localestoque'
      Origin = 'localestoque'
      Size = 50
    end
    object TEstoqueSaidacentrocusto: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'centrocusto'
      Origin = 'centrocusto'
      Size = 50
    end
    object TEstoqueSaidaproduto: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'produto'
      Origin = 'produto'
      Size = 50
    end
    object TEstoqueSaidaprodutocodfabricante: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'produtocodfabricante'
      Origin = 'produtocodfabricante'
      Size = 30
    end
    object TEstoqueSaidatipo_baixa: TIntegerField
      FieldName = 'tipo_baixa'
      Origin = 'tipo_baixa'
    end
    object TEstoqueSaidaidresponsavel: TIntegerField
      FieldName = 'idresponsavel'
      Origin = 'idresponsavel'
    end
    object TEstoqueSaidatipostr: TWideMemoField
      AutoGenerateValue = arDefault
      FieldName = 'tipostr'
      Origin = 'tipostr'
      ReadOnly = True
      BlobType = ftWideMemo
    end
    object TEstoqueSaidavalorsaida: TBCDField
      FieldName = 'valorsaida'
      Origin = 'valorsaida'
      Precision = 15
      Size = 3
    end
  end
  object TnotaFiscalIntem: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select '
      ' ROW_NUMBER () OVER (ORDER BY a.id)Item,'
      ' a.*,'
      ' b.id ProdutoId,'
      ' b.unidademedida ProdutoUnidade,'
      ' b.nome ProdutoNome,'
      ' b.codigofabricante ProdutoFabricante '
      'from notafiscalitems a'
      'join produtos b on a.idproduto=b.id'
      '')
    Left = 1048
    Top = 88
    object TnotaFiscalIntemid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TnotaFiscalIntemstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TnotaFiscalIntemdatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TnotaFiscalIntemidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TnotaFiscalIntemdataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TnotaFiscalIntemidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TnotaFiscalIntemidnota: TIntegerField
      FieldName = 'idnota'
      Origin = 'idnota'
    end
    object TnotaFiscalIntemidproduto: TIntegerField
      FieldName = 'idproduto'
      Origin = 'idproduto'
    end
    object TnotaFiscalIntemvalortotalnf: TFMTBCDField
      FieldName = 'valortotalnf'
      Origin = 'valortotalnf'
      Precision = 18
      Size = 2
    end
    object TnotaFiscalIntemqtditens: TFMTBCDField
      FieldName = 'qtditens'
      Origin = 'qtditens'
      Precision = 18
      Size = 2
    end
    object TnotaFiscalIntemunidademedida: TWideStringField
      FieldName = 'unidademedida'
      Origin = 'unidademedida'
    end
    object TnotaFiscalIntempesoembalagem: TFMTBCDField
      FieldName = 'pesoembalagem'
      Origin = 'pesoembalagem'
      Precision = 18
      Size = 2
    end
    object TnotaFiscalIntemidlocalestoque: TIntegerField
      FieldName = 'idlocalestoque'
      Origin = 'idlocalestoque'
    end
    object TnotaFiscalIntemsyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TnotaFiscalIntemsyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
    object TnotaFiscalIntemprodutoid: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'produtoid'
      Origin = 'produtoid'
    end
    object TnotaFiscalIntemprodutounidade: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'produtounidade'
      Origin = 'produtounidade'
      Size = 10
    end
    object TnotaFiscalIntemprodutonome: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'produtonome'
      Origin = 'produtonome'
      Size = 50
    end
    object TnotaFiscalIntemprodutofabricante: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'produtofabricante'
      Origin = 'produtofabricante'
      Size = 30
    end
    object TnotaFiscalIntemitem: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'item'
      Origin = 'item'
      ReadOnly = True
    end
  end
  object TEstoqueEntrada: TFDQuery
    CachedUpdates = True
    OnReconcileError = TEstoqueEntradaReconcileError
    Connection = FDConPG
    SQL.Strings = (
      'select '
      ' a.*,'
      ' b.nome Fornecedor, '
      ' d.nome CentroCusto'
      'from estoqueentrada a '
      'join fornecedor b on a.idFornecedor=b.id'
      'join centrocusto d on d.id=a.idcentrocusto'
      'where a.status=1')
    Left = 856
    Top = 200
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
    object TEstoqueEntradatipo: TIntegerField
      FieldName = 'tipo'
      Origin = 'tipo'
    end
    object TEstoqueEntradafornecedor: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'fornecedor'
      Origin = 'fornecedor'
      Size = 100
    end
    object TEstoqueEntradacentrocusto: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'centrocusto'
      Origin = 'centrocusto'
      Size = 50
    end
  end
  object TConfig: TFDQuery
    Connection = FDConPG
    SQL.Strings = (
      'select * from systemconfig')
    Left = 816
    Top = 8
    object TConfigtipodb: TIntegerField
      FieldName = 'tipodb'
      Origin = 'tipodb'
    end
    object TConfigsyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
    object TConfigagricultura: TIntegerField
      FieldName = 'agricultura'
      Origin = 'agricultura'
    end
    object TConfigpecuaria: TIntegerField
      FieldName = 'pecuaria'
      Origin = 'pecuaria'
    end
  end
  object TValorLiquidoOrc: TFDQuery
    Connection = FDConPG
    SQL.Strings = (
      'select '
      ' sum(o.valortotal) ValorBruto,'
      
        ' sum(o.valortotal)+sum(coalesce(o2.frete,o.frete,0))ValorBrutoMa' +
        'isFrete,'
      ' sum(o.valortotal)+sum(coalesce(o2.frete,o.frete,0))+'
      ' sum(coalesce(o.icmst,0))+coalesce(sum(o.ipi),0)+'
      ' sum(coalesce(o.diferencialalicota,0))-'
      ' sum(coalesce(o.desconto,o2.desconto,0)) valorLiquido'
      'from orcamentositens o'
      'join orcamentos o2 on o.idorcamento=o2.id'
      'where idorcamento =322')
    Left = 392
    Top = 224
    object TValorLiquidoOrcvalorbruto: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'valorbruto'
      Origin = 'valorbruto'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object TValorLiquidoOrcvalorbrutomaisfrete: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'valorbrutomaisfrete'
      Origin = 'valorbrutomaisfrete'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object TValorLiquidoOrcvalorliquido: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'valorliquido'
      Origin = 'valorliquido'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
  end
end
