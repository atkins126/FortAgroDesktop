object dmCompras: TdmCompras
  OldCreateOrder = False
  Height = 445
  Width = 757
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
  object TOrcamento: TFDQuery
    CachedUpdates = True
    Connection = dbCtx.FDConPG
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
      'f.senha,'
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
        'ere status=1 and idorcamento=b.id),0)Itemdifal,'
      'b.responsavelcompra,'
      'b.dataprevitaentrega,'
      'p.nome Produto,'
      'p.codigofabricante CodFabricante,'
      'o.valorunidade,'
      'o.valortotal ValorTotalProduto,'
      'o.ipi ipiProduto,'
      'o.icmst icmstProduto,'
      'o.diferencialalicota diferencialalicotaProduto,'
      'u.nome solicitante,'
      'ud.nome ResponsavelOrdemCompra,'
      
        '(select p2.quantidade from pedidocompraitems p2 where p2.status>' +
        '-1 and p2.idpedido=c.id and p2.iditem=p.id limit 1 ) QtdSolicita' +
        'da,'
      'o.qtde QtdeCompra,'
      'coalesce(b.datacompra,b.datareg) datacompra,'
      
        'coalesce(b.datacompra,cast(b.datareg as date))-c.datapedido dias' +
        'Compra'
      'from orcamentos b'
      'join pedidocompra c on c.id=b.idpedido'
      'join usuario u on u.id=c.idsolicitante '
      'join usuario ud on ud.id=b.idusuario'
      'join fornecedor f on f.id=b.idfornecedor'
      
        'left join forma_pagamento_fornecedor fp on fp.id=b.idformapagame' +
        'nto'
      'join orcamentositens o on b.id=o.idorcamento '
      'join produtos p on o.idproduto=p.id'
      'where b.status>-1)y')
    Left = 136
    Top = 16
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
    object TOrcamentodataprevitaentrega: TDateField
      FieldName = 'dataprevitaentrega'
      Origin = 'dataprevitaentrega'
    end
    object TOrcamentodatacompra: TDateField
      FieldName = 'datacompra'
      Origin = 'datacompra'
    end
    object TOrcamentoresponsavelcompra: TWideStringField
      FieldName = 'responsavelcompra'
      Origin = 'responsavelcompra'
      Size = 100
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
    object TOrcamentosenha: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'senha'
      Origin = 'senha'
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
    object TOrcamentoresponsavelcompra_1: TWideStringField
      FieldName = 'responsavelcompra_1'
      Origin = 'responsavelcompra'
      Size = 100
    end
    object TOrcamentodataprevitaentrega_1: TDateField
      FieldName = 'dataprevitaentrega_1'
      Origin = 'dataprevitaentrega'
    end
    object TOrcamentoproduto: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'produto'
      Origin = 'produto'
      Size = 50
    end
    object TOrcamentocodfabricante: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'codfabricante'
      Origin = 'codfabricante'
      Size = 30
    end
    object TOrcamentovalorunidade: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'valorunidade'
      Origin = 'valorunidade'
      Precision = 15
      Size = 2
    end
    object TOrcamentovalortotalproduto: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'valortotalproduto'
      Origin = 'valortotalproduto'
      Precision = 15
      Size = 2
    end
    object TOrcamentoipiproduto: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'ipiproduto'
      Origin = 'ipiproduto'
      Precision = 15
      Size = 3
    end
    object TOrcamentoicmstproduto: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'icmstproduto'
      Origin = 'icmstproduto'
      Precision = 15
      Size = 3
    end
    object TOrcamentodiferencialalicotaproduto: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'diferencialalicotaproduto'
      Origin = 'diferencialalicotaproduto'
      Precision = 15
      Size = 3
    end
    object TOrcamentosolicitante: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'solicitante'
      Origin = 'solicitante'
      Size = 100
    end
    object TOrcamentoresponsavelordemcompra: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'responsavelordemcompra'
      Origin = 'responsavelordemcompra'
      Size = 100
    end
    object TOrcamentoqtdsolicitada: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'qtdsolicitada'
      Origin = 'qtdsolicitada'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object TOrcamentoqtdecompra: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'qtdecompra'
      Origin = 'qtdecompra'
      Precision = 15
      Size = 2
    end
    object TOrcamentodatacompra_1: TSQLTimeStampField
      AutoGenerateValue = arDefault
      FieldName = 'datacompra_1'
      Origin = 'datacompra'
      ReadOnly = True
    end
    object TOrcamentodiascompra: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'diascompra'
      Origin = 'diascompra'
      ReadOnly = True
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
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select y.*,'
      
        '   y.valorTotal+coalesce(nullif(y.frete,0),y.freteItem) valorBru' +
        'toMaisFrete,'
      '   y.valortotal+'
      '   coalesce(nullif(y.frete,0),y.freteItem)+'
      '   coalesce(y.ipi,0)+'
      '   coalesce(y.icmst,0)+'
      '   coalesce(y.diferencialalicota,0)-'
      '   coalesce(nullif(y.desconto,0),y.descontoitem)valorLiquido'
      '   from'
      '   (select'
      '   ROW_NUMBER () OVER (ORDER BY a.id)Item ,'
      '    a.id,a.status,a.datareg,a.idusuario,'
      '    a.dataalteracao,a.idusuarioalteracao,'
      '    a.idorcamento,a.idproduto,a.valorunidade,'
      '    a.observacao,a.qtde,a.syncaws,'
      '    a.syncfaz,'
      '    coalesce(nullif(b.desconto/'
      
        '    (select count(*) from orcamentositens o where o.idorcamento=' +
        'b.id and status>-1),0),nullif(a.desconto,0))desconto,   '
      '    coalesce(nullif(b.desconto,0),'
      '    (select sum(coalesce(nullif(descontorateio,0),desconto))'
      
        '     from orcamentositens where status>-1 and idorcamento=b.id),' +
        '0)DescontoGeral,'
      '   coalesce(nullif(b.frete,0),'
      '    (select sum(coalesce(nullif(freterateio,0),frete))'
      
        '     from orcamentositens where status>-1 and idorcamento=b.id),' +
        '0)FreteGeral,'
      '    coalesce(a.ipi,0)ipi,'
      '    coalesce(a.icmst,0)icmst,'
      '    coalesce(nullif(b.frete/('
      
        '    select count(*) from orcamentositens o where o.idorcamento=b' +
        '.id and status>-1),0),nullif(a.frete,0))frete,'
      '    coalesce(a.diferencialalicota,0)diferencialalicota,'
      '    a.marca,'
      '    a.idmarca,'
      '    a.original,'
      '    a.unidademedida,'
      '    a.img,'
      '    c.identificador identificadorPedido,'
      '    c.datapedido DataPedido,'
      '    c.status StatusPedido,'
      '    d.nome NomeFornecedor,'
      '    d.telefone_fixo TelefoneFornecedor,'
      '    d.email EmailFornecedor,'
      '    d.cpf_cnpj CpfCnpjFornecedor,'
      '    e.Nome NomeProduto,'
      '    e.codigofabricante CodFabProduto,'
      '    e.unidademedida,'
      '    a.valortotal,'
      '    case'
      '      when original=1 then '#39'ORIGINAL'#39
      '      when original=0 then '#39'PARALELO'#39
      '    end originalStr,'
      '    fpf.codigo||'#39'-'#39'||fpf.descricao FormaPG,'
      '    fpf.id idFormaPg,'
      '    d.nome Fornecedor,'
      '    am.nome marcanome,'
      '    coalesce(a.desconto,0) descontoItem,'
      '    coalesce(a.frete,0) freteItem,'
      '    a.recebido ,'
      '    a.obsrecebimento,'
      '    qtdrecebida,'
      '    a.responsavelrecebimento,'
      '    datarecebimento'
      '   from public.orcamentosItens a'
      '   join orcamentos b on   b.id=a.idorcamento'
      
        '   left join forma_pagamento_fornecedor fpf on fpf.id=b.idformap' +
        'agamento'
      '   join pedidocompra c on c.id=b.idpedido'
      '   join fornecedor d on   d.id=b.idfornecedor'
      '   join produtos e on      e.Id=a.idproduto'
      '   left join auxmarcas am on am.id=a.idmarca'
      '   where b.status>-1 and a.status>-1'
      '   and idorcamento=384'
      '   order by Item'
      '   )y')
    Left = 216
    Top = 16
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
    object TItensOrcamentoobservacao: TWideStringField
      FieldName = 'observacao'
      Origin = 'observacao'
      Size = 100
    end
    object TItensOrcamentosyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TItensOrcamentosyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
    object TItensOrcamentodesconto: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'desconto'
      Origin = 'desconto'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object TItensOrcamentodescontogeral: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'descontogeral'
      Origin = 'descontogeral'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object TItensOrcamentofretegeral: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'fretegeral'
      Origin = 'fretegeral'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object TItensOrcamentoipi: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'ipi'
      Origin = 'ipi'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object TItensOrcamentoicmst: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'icmst'
      Origin = 'icmst'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object TItensOrcamentofrete: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'frete'
      Origin = 'frete'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object TItensOrcamentodiferencialalicota: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'diferencialalicota'
      Origin = 'diferencialalicota'
      ReadOnly = True
      Precision = 64
      Size = 0
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
    object TItensOrcamentovalortotal: TBCDField
      FieldName = 'valortotal'
      Origin = 'valortotal'
      Precision = 15
      Size = 2
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
    object TItensOrcamentomarcanome: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'marcanome'
      Origin = 'marcanome'
      Size = 50
    end
    object TItensOrcamentodescontoitem: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'descontoitem'
      Origin = 'descontoitem'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object TItensOrcamentofreteitem: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'freteitem'
      Origin = 'freteitem'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object TItensOrcamentorecebido: TIntegerField
      FieldName = 'recebido'
      Origin = 'recebido'
    end
    object TItensOrcamentoobsrecebimento: TWideStringField
      FieldName = 'obsrecebimento'
      Origin = 'obsrecebimento'
      Size = 8190
    end
    object TItensOrcamentoqtdrecebida: TFMTBCDField
      FieldName = 'qtdrecebida'
      Origin = 'qtdrecebida'
      Precision = 64
      Size = 0
    end
    object TItensOrcamentoresponsavelrecebimento: TIntegerField
      FieldName = 'responsavelrecebimento'
      Origin = 'responsavelrecebimento'
    end
    object TItensOrcamentodatarecebimento: TDateField
      FieldName = 'datarecebimento'
      Origin = 'datarecebimento'
    end
    object TItensOrcamentovalorbrutomaisfrete: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'valorbrutomaisfrete'
      Origin = 'valorbrutomaisfrete'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object TItensOrcamentovalorliquido: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'valorliquido'
      Origin = 'valorliquido'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object TItensOrcamentoqtde: TBCDField
      FieldName = 'qtde'
      Origin = 'qtde'
      Precision = 15
      Size = 2
    end
  end
  object ppDBOrcamento: TppDBPipeline
    DataSource = dsOrcamento
    UserName = 'DBOrcamento'
    Left = 72
    Top = 152
  end
  object ppRepOrcamento: TppReport
    AutoStop = False
    DataPipeline = ppDBItensOrcamento
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 (8.2 x 11.7 in; 210 x 297 mm)'
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
    Left = 72
    Top = 96
    Version = '19.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBItensOrcamento'
    object ppHeaderBand2: TppHeaderBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 70644
      mmPrintPosition = 0
      object ppShape3: TppShape
        DesignLayer = ppDesignLayer2
        UserName = 'Shape3'
        Brush.Color = clTeal
        Pen.Style = psClear
        mmHeight = 4763
        mmLeft = 1058
        mmTop = 65616
        mmWidth = 283898
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel18: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label18'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Observa'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 251885
        mmTop = 65617
        mmWidth = 31747
        BandType = 0
        LayerName = Foreground1
      end
      object ppShape6: TppShape
        DesignLayer = ppDesignLayer2
        UserName = 'Shape6'
        Brush.Style = bsClear
        mmHeight = 6076
        mmLeft = 29898
        mmTop = 59531
        mmWidth = 215636
        BandType = 0
        LayerName = Foreground1
      end
      object ppLblOrdemPedido: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'LblOrdemPedido'
        Border.mmPadding = 0
        Caption = 'Solicita'#231#227'o de Compra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 18
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 7673
        mmLeft = 1323
        mmTop = 16404
        mmWidth = 68527
        BandType = 0
        LayerName = Foreground1
      end
      object ppShape4: TppShape
        DesignLayer = ppDesignLayer2
        UserName = 'Shape4'
        mmHeight = 38365
        mmLeft = 263
        mmTop = 27248
        mmWidth = 283898
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel13: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label13'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Pedido.........:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4763
        mmLeft = 2381
        mmTop = 28310
        mmWidth = 26461
        BandType = 0
        LayerName = Foreground1
      end
      object ppDBText5: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText5'
        Border.mmPadding = 0
        DataField = 'identificador'
        DataPipeline = ppDBOrcamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBOrcamento'
        mmHeight = 4763
        mmLeft = 29898
        mmTop = 28310
        mmWidth = 22225
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel15: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label15'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Data Pedido:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4763
        mmLeft = 56356
        mmTop = 28310
        mmWidth = 25930
        BandType = 0
        LayerName = Foreground1
      end
      object ppDBText11: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText11'
        Border.mmPadding = 0
        DataField = 'datapedido'
        DataPipeline = ppDBOrcamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBOrcamento'
        mmHeight = 4763
        mmLeft = 83079
        mmTop = 28310
        mmWidth = 23283
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel16: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label16'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Fornecedor:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4763
        mmLeft = 2381
        mmTop = 34660
        mmWidth = 26458
        BandType = 0
        LayerName = Foreground1
      end
      object ppDBText12: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText12'
        Border.mmPadding = 0
        DataField = 'fornecedor'
        DataPipeline = ppDBOrcamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBOrcamento'
        mmHeight = 4763
        mmLeft = 29898
        mmTop = 34660
        mmWidth = 165100
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel17: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label101'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Telefone......:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4763
        mmLeft = 2381
        mmTop = 47096
        mmWidth = 26458
        BandType = 0
        LayerName = Foreground1
      end
      object ppDBMemo2: TppDBMemo
        DesignLayer = ppDesignLayer2
        UserName = 'DBMemo2'
        Border.mmPadding = 0
        CharWrap = False
        DataField = 'telefone_fixo'
        DataPipeline = ppDBOrcamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        RemoveEmptyLines = False
        Transparent = True
        DataPipelineName = 'ppDBOrcamento'
        mmHeight = 4763
        mmLeft = 29898
        mmTop = 47361
        mmWidth = 83344
        BandType = 0
        LayerName = Foreground1
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        mmLeading = 0
      end
      object ppLabel19: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label19'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'E-mail....:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4763
        mmLeft = 155575
        mmTop = 53976
        mmWidth = 19579
        BandType = 0
        LayerName = Foreground1
      end
      object ppDBMemo5: TppDBMemo
        DesignLayer = ppDesignLayer2
        UserName = 'DBMemo5'
        Border.mmPadding = 0
        CharWrap = False
        DataField = 'email'
        DataPipeline = ppDBOrcamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        RemoveEmptyLines = False
        Transparent = True
        DataPipelineName = 'ppDBOrcamento'
        mmHeight = 4763
        mmLeft = 174625
        mmTop = 53976
        mmWidth = 107156
        BandType = 0
        LayerName = Foreground1
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        mmLeading = 0
      end
      object ppLabel20: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'lblDescricao1'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Forma de Pagamento:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4763
        mmLeft = 2381
        mmTop = 59796
        mmWidth = 47361
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine4: TppLine
        DesignLayer = ppDesignLayer2
        UserName = 'Line4'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        mmHeight = 1319
        mmLeft = 1058
        mmTop = 24871
        mmWidth = 283105
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel21: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label21'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Descri'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 59793
        mmTop = 65881
        mmWidth = 34860
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel22: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label22'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Qtde.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 9787
        mmTop = 65881
        mmWidth = 8991
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel24: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label24'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Cod. Fabricante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 36245
        mmTop = 65881
        mmWidth = 23003
        BandType = 0
        LayerName = Foreground1
      end
      object ppDBText14: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText14'
        Border.mmPadding = 0
        DataField = 'formapg'
        DataPipeline = ppDBOrcamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDBOrcamento'
        mmHeight = 4763
        mmLeft = 49742
        mmTop = 59796
        mmWidth = 56621
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel26: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label26'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Valor Bruto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 152133
        mmTop = 65876
        mmWidth = 19315
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel25: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label25'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Valor Uni.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 137051
        mmTop = 65872
        mmWidth = 14808
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel31: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label31'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Contato.......:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4763
        mmLeft = 2381
        mmTop = 53713
        mmWidth = 26458
        BandType = 0
        LayerName = Foreground1
      end
      object ppDBMemo6: TppDBMemo
        DesignLayer = ppDesignLayer2
        UserName = 'DBMemo6'
        Border.mmPadding = 0
        CharWrap = False
        DataField = 'contatopessoa'
        DataPipeline = ppDBOrcamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        RemoveEmptyLines = False
        Transparent = True
        DataPipelineName = 'ppDBOrcamento'
        mmHeight = 4763
        mmLeft = 29898
        mmTop = 53976
        mmWidth = 124884
        BandType = 0
        LayerName = Foreground1
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        mmLeading = 0
      end
      object ppLabel35: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label35'
        Border.mmPadding = 0
        Caption = 'N'#176':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 6350
        mmLeft = 224632
        mmTop = 18256
        mmWidth = 7673
        BandType = 0
        LayerName = Foreground1
      end
      object ppDBText21: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText21'
        Border.mmPadding = 0
        DataField = 'id'
        DataPipeline = ppDBOrcamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'ppDBOrcamento'
        mmHeight = 5821
        mmLeft = 233098
        mmTop = 18256
        mmWidth = 19844
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel36: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label36'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'CNPJ...........:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4763
        mmLeft = 2382
        mmTop = 40748
        mmWidth = 26458
        BandType = 0
        LayerName = Foreground1
      end
      object ppDBText22: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText22'
        Border.mmPadding = 0
        DataField = 'cpf_cnpj'
        DataPipeline = ppDBOrcamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBOrcamento'
        mmHeight = 4763
        mmLeft = 29899
        mmTop = 40748
        mmWidth = 48948
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel37: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label37'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'IE.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4763
        mmLeft = 81227
        mmTop = 40746
        mmWidth = 8996
        BandType = 0
        LayerName = Foreground1
      end
      object ppDBText23: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText23'
        Border.mmPadding = 0
        DataField = 'inscricaoestadual'
        DataPipeline = ppDBOrcamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBOrcamento'
        mmHeight = 4763
        mmLeft = 90752
        mmTop = 40746
        mmWidth = 48948
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel11: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label11'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Item'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 1323
        mmTop = 65617
        mmWidth = 7666
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel29: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label29'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Uni. Med.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 18786
        mmTop = 65881
        mmWidth = 16919
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel87: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label87'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Desconto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 234686
        mmTop = 65617
        mmWidth = 16404
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel89: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label89'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Marca'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 94980
        mmTop = 65617
        mmWidth = 24328
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel205: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label205'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 119591
        mmTop = 65881
        mmWidth = 16908
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel206: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label206'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'IPI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 171715
        mmTop = 65616
        mmWidth = 15240
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel207: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label207'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'DIFAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 187591
        mmTop = 65616
        mmWidth = 15240
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel208: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label208'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'ICMS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 203461
        mmTop = 65617
        mmWidth = 15240
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel209: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label209'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Frete'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 219071
        mmTop = 65616
        mmWidth = 15240
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel211: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label211'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Frete Total :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4763
        mmLeft = 107421
        mmTop = 59796
        mmWidth = 25135
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel212: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label212'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Desconto Total :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4763
        mmLeft = 157427
        mmTop = 59531
        mmWidth = 33867
        BandType = 0
        LayerName = Foreground1
      end
      object ppDBText171: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText171'
        Border.mmPadding = 0
        DataField = 'descontogeral'
        DataPipeline = ppDBItensOrcamento
        DisplayFormat = '$####,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'ppDBItensOrcamento'
        mmHeight = 4763
        mmLeft = 191294
        mmTop = 59796
        mmWidth = 28840
        BandType = 0
        LayerName = Foreground1
      end
      object ppDBText59: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText1'
        Border.mmPadding = 0
        DataField = 'fretegeral'
        DataPipeline = ppDBItensOrcamento
        DisplayFormat = '$####,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'ppDBItensOrcamento'
        mmHeight = 4763
        mmLeft = 132821
        mmTop = 59796
        mmWidth = 21960
        BandType = 0
        LayerName = Foreground1
      end
      object ppImage8: TppImage
        DesignLayer = ppDesignLayer2
        UserName = 'Image8'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = False
        Stretch = True
        Border.mmPadding = 0
        Picture.Data = {
          0A544A504547496D61676529BC0000FFD8FFE000104A46494600010100000100
          010000FFDB004300030202020202030202020303030304060404040404080606
          050609080A0A090809090A0C0F0C0A0B0E0B09090D110D0E0F101011100A0C12
          131210130F101010FFDB00430103030304030408040408100B090B1010101010
          1010101010101010101010101010101010101010101010101010101010101010
          10101010101010101010101010FFC00011080500050003012200021101031101
          FFC4001E0001000203010101010100000000000000000109020708060405030A
          FFC4005510010001010502060B0F010702050402030001020304050611073108
          12213851B4161732555676779293B1D10913141934415761717273819194A122
          151835424382C152E12333A2B2C24453748324456267F1FFC4001C0101000105
          010100000000000000000000000103050607080402FFC4004011010001010404
          0B05060700030101000000010203040511062131A1071213164151537181B1D1
          333536619114223242C1E1151723525462B27282F02492FFDA000C0301000211
          0311003F00E45CF99C76917EDA9664C2309CD998EDEDEDB1EBE585DEEF617FB7
          9AABAA6F15C534534C55BFE6D21FBFDAB78607CD92F6ABA7FF008F7E7C996397
          858DD3C7C8EBF2BF8A7963513B1425DAB3860F817B55F417E3B5670C1F02F6AB
          E82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423D
          AB3860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED57D0
          5F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F02F6
          ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD42
          3DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED57
          D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F02
          F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD
          423DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED
          57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F
          02F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80
          CD423DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05
          ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C
          1F02F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB
          80CD423DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E
          05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B567
          0C1F02F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2
          FB80CD423DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE18
          3E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5
          670C1F02F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0B
          F2FB80CD423DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE
          183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3
          B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA
          0BF2FB80CD423DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6A
          CE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417
          E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAA
          FA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F
          6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F4
          17E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BD
          AAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE03350
          8F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55
          F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0
          BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE033
          508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B
          55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C307
          C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE0
          33508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F81
          7B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C3
          07C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F02F6ABE82FCBE
          E033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F
          817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59
          C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F02F6ABE82FC
          BEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB386
          0F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED
          59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F02F6ABE82
          FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3
          860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED57D05F8
          ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F02F6ABE
          82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423DA
          B3860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED57D05
          F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F02F6A
          BE82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423
          DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED57D
          05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F02F
          6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD4
          23DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED5
          7D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F0
          2F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80C
          D423DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05E
          D57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55FDBDF9F8192B3
          76D230EDA8601836319A332DDEF3618F5D2EF79BB5E6FF006F4D5455178A69AE
          8AE99AB9277C4C4BFD064EE5086D039385FE331FFF00B02D3AF846B7CD95F9D9
          5D3C7C8EBD2BF7A3B98504657E76574F1F23AF4AFDE8EE602590020000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000005086D079E0633E506D3AFC2FBD421B41E7
          818CF941B4EBF02697CB95F9D95D3C7C8EBD2BF7A3B98504657E76574F1F23AF
          4AFDE8EE60259002000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000005086D079
          E0633E506D3AFC2FBD421B41E7818CF941B4EBF02697CB95F9D95D3C7C8EBD2B
          F7A3B98504657E76574F1F23AF4AFDE8EE602590020000000046B00918F1A13C
          68E9048C78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0
          190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C
          78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D0
          71A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0
          190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C
          78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D0
          71A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0
          190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C
          78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D0
          71A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0
          190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C
          78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D0
          71A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D1D271
          A3EB064238D12900000000001421B41E7818CF941B4EBF0BEF5086D079E0633E
          506D3AFC09A5F2E57E76574F1F23AF4AFDE8EE6141195F9D95D3C7C8EBD2BF7A
          3B98096400800001133A0226A88DEF23B45DA9E46D96E0D56399D31FB0C3AC27
          58B3A2A9D6D6DAA8FF002D14472D53CB1F572F2B3DA7E7FC1B66392714CEB8E5
          73F06C3AC66B8B389D2AB6B49E4A2CE9FAEAAA623F954C6D476A59AB6B39B2F5
          9B334DFEBB5B5B6AA62C6C2267DEAED67ACF16CE8A7E688FD677CF2CA9DA5A45
          9C315D26D25A302B38A288E35A55B23AA3AE5D7999FDD1EC1EC2F55D8E50C837
          8BDD844E94DBDF6F1167C68FB94C4E9FACBF03E323CC3A693B3AC3FF00735B8C
          75D7E743CDCBD6D6169A658C5A559C5AE5DD11E8ECFF008C8F307D1D61FF00B9
          B43E323CC1F47587FEE6D1C63ACF49ACF4A396AFADF1CEEC63B6DD1E8ECEF8C8
          F307D1D61FFB9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18EDB7
          47A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FFB9B4718EB3D26B3D272D5F5
          9CEEC63B6DD1E8ECEF8C8F307D1D61FF00B9B43E323CC1F47587FEE6D1C63ACF
          49ACF49CB57D673BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FF
          00B9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FFB9B43E3
          23CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE323CC1F475
          87FEE6D0F8C8F307D1D61FFB9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF
          8C8F307D1D61FF00B9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D673BB1
          8EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FF00B9B4718EB3D26B3D
          272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FFB9B43E323CC1F47587FEE6D1C
          63ACF49ACF49CB57D673BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1
          D61FFB9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FF00B9
          B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE323CC
          1F47587FEE6D0F8C8F307D1D61FF00B9B4718EB3D26B3D272D5F59CEEC63B6DD
          1E8ECEF8C8F307D1D61FFB9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D6
          73BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FFB9B4718EB3D26
          B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FF00B9B43E323CC1F47587FE
          E6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F
          307D1D61FF00B9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D6
          1FFB9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE
          323CC1F47587FEE6D0F8C8F307D1D61FFB9B4718EB3D26B3D272D5F59CEEC63B
          6DD1E8ECEF8C8F307D1D61FF00B9B43E323CC1F47587FEE6D1C63ACF49ACF49C
          B57D673BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FF00B9B471
          8EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FFB9B43E323CC1F47
          587FEE6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE323CC1F47587FEE6D0
          F8C8F307D1D61FFB9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D
          1D61FF00B9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18EDB747A
          3B3BE323CC1F47587FEE6D0F8C8F307D1D61FF00B9B4718EB3D26B3D272D5F59
          CEEC63B6DD1E8ECEF8C8F307D1D61FFB9B43E323CC1F47587FEE6D1C63ACF49A
          CF49CB57D673BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FFB9B
          4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FF00B9B43E323C
          C1F47587FEE6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE323CC1F47587F
          EE6D0F8C8F307D1D61FF00B9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8
          C8F307D1D61FFB9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18ED
          B747A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FFB9B4718EB3D26B3D272D5
          F59CEEC63B6DD1E8ECEF8C8F307D1D61FF00B9B43E323CC1F47587FEE6D1C63A
          CF49ACF49CB57D673BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1D61
          FF00B9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FFB9B43
          E323CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE323CC1F4
          7587FEE6D0F8C8F307D1D61FFB9B4718EB3D26B3D272D5F59CEEC63B6DD1E8EC
          EF8C8F307D1D61FF00B9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D673B
          B18EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FF00B9B4718EB3D26B
          3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FFB9B43E323CC1F47587FEE6D
          1C63ACF49ACF49CB57D673BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F307
          D1D61FFB9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FF00
          B9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE323
          CC1F47587FEE6D0F8C8F307D1D61FF00B9B4718EB3D26B3D272D5F59CEEC63B6
          DD1E8ECEF8C8F307D1D61FFB9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57
          D673BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FFB9B4718EB3D
          26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FF00B9B43E323CC1F47587
          FEE6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE323CC1F47587FEE6D0F8C
          8F307D1D61FF00B9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1
          D61FFB9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18EDB747A3B3
          BE323CC1F47587FEE6D0F8C8F307D1D61FFB9B4718EB3D26B3D272D5F59CEEC6
          3B6DD1E8ECEF8C8F307D1D61FF00B9B43E323CC1F47587FEE6D1C63ACF49ACF4
          9CB57D673BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FF00B9B4
          718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FFB9B43E323CC1F
          47587FEE6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE323CC1F47587FEE6
          D0F8C8F307D1D61FFB9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F30
          7D1D61FF00B9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18EDB74
          7A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FF00B9B4718EB3D26B3D272D5F
          59CEEC63B6DD1E8ECEF8C8F307D1D61FFB9B43E323CC1F47587FEE6D1C63ACF4
          9ACF49CB57D673BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FFB
          9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FF00B9B43E32
          3CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE323CC1F4758
          7FEE6D0F8C8F307D1D61FF00B9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECE
          F8C8F307D1D61FFB9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18
          EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FFB9B4718EB3D26B3D272
          D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FF00B9B43E323CC1F47587FEE6D1C6
          3ACF49ACF49CB57D673BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1D
          61FF00B9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FFB9B
          43E323CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE323CC1
          F47587FEE6D0F8C8F307D1D61FFB9B4718EB3D26B3D272D5F59CEEC63B6DD1E8
          ECEF8C8F307D1D61FF00B9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D67
          3BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FF00B9B4718EB3D2
          6B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FFB9B43E323CC1F47587FEE
          6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F3
          07D1D61FFB9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FF
          00B9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE3
          23CC3F473877EE6B7EF658F747F0ABC5EA8B0CDD90ADEEB6154C71ADEE3788B4
          9A63EE5511AFEB0E1227422DAB87DD1A658C51544CDAE7E11E8B94D9C6D5F21E
          D53068C6B2563F617FB2A748B6B38FE9B5B0AA7FCB5D13CB4FCFF54E9C932F61
          4DA53311CBBD4D1B33DA766BD9566CBA66CCAB7FAEC2DEEF5445AD96B3EF778B
          3D796CED23E7A67FEF1CAB66D94ED1707DAAE46C2B3AE0B3C5B1C42C75B4B29A
          B59B1B58E4AECE7EB89D7ED8D27E77AACAD3948F9B66E8CE92D38DD1367691C5
          B4A76C744C75C7A3D980A8CB00000005086D079E0633E506D3AFC2FBD421B41E
          7818CF941B4EBF02697CB95F9D95D3C7C8EBD2BF7A3B98504657E76574F1F23A
          F4AFDE8EE60259002000044A5156E0719FBA3B9A2F572CAF95F2A585A554D962
          17BB5BD5BD3AF255EF74C451FF00BEA703BB5FDD26FF0011C9BF8578F5C38A27
          7BC56FF8DA234D2D2AAF18B4899D997920051626000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000098DEEF0F7
          383345EAF18366ACA56D695556375B7B2BED853AF25335C4D35FEBA51FA383E3
          7C3B47DCDBFF001FCE1FFE2D87FEE56B09CAB657A19695518C594474E71BA5DE
          709446E4BDADF00000002843683CF0319F28369D7E17DEA10DA0F3C0C67CA0DA
          75F8134BE5CAFCECAE9E3E475E95FBD1DCC28232BF3B2BA78F91D7A57EF47730
          12C801000022ADC9455B8844B84BDD26FF0011C9BF8579F5D2E289DEED7F749B
          FC4726FE15E7D74B8A277BC56FF8DA1F4CBDF16DE1E50801458A800000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0001F3C7DAED2F736FFC7F387FF8961FFB9C5BF3C7DAED2F736FFC7F387FF896
          1FFB956C7DA4328D0EF7CD8F8F94BBCE372511B92F737DC0000000A10DA0F3C0
          C67CA0DA75F85F7A843683CF0319F28369D7E04D2F972BF3B2BA78F91D7A57EF
          47730A08CAFCECAE9E3E475E95FBD1DCC04B200400008AB725156E2112E12F74
          9BFC4726FE15E7D74B8A277BB5FDD26FF11C9BF8579F5D2E289DEF15BFE3687D
          32F7C5B787942005162A00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000007CF1F6BB4BDCDBFF1FCE1FF00E258
          7FEE717446AED1F737274C7B37CF4DD6C3FF007AAD8FB48651A1F19633639FCF
          CA5DE71B9288DC97B9BEC0000005086D079E0633E506D3AFC2FBD421B41E7818
          CF941B4EBF02697CB95F9D95D3C7C8EBD2BF7A3B98504657E76574F1F23AF4AF
          DE8EE602590020000455B928AB710897097BA4DFE23937F0AF3EBA5C513BDDAF
          EE937F88E4DFC2BCFAE97144EF78ADFF001B43E997BE2DBC3CA10028B1500000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000000000013A0
          204C47CDAC278A2729623F6304CA19A3325A53658065FC4310AAB9D23E0D76AE
          D23F588D21B6729F033DBD66AE25A5595230AB1AB978F885B53673A74C531ACB
          EA9A66A9CA21EEBB6197CBDCE56165555DD12D1E7167E6876C651F738AF969EF
          7699CF3FD1671BEAB2B85DF59FB38D5B75E53E03BB08CB3C4B5BD60778C66DA3
          499AAFF6F355333D3C58D34548B0AE76B24BA68362979CA6BA6288F9CFE90AC4
          B961D886236B16387DC6DEF35CCE9C5B2B39AE7F486C8CA9C1976DF9CB895613
          90711B3B2AF4E2DB5EA9F78B39FF00755A2D4B2F6CFB24E55A29B3CBB95F0BC3
          E28E4A66C2EB453579DA6BFCBF766CFE68988FB1569BBC74CB26BAF075634E53
          79B599EE8CBCF357BE51F73B7681894D9DB66DCD985E11673A71ACAC29AADED6
          3F4D299FD5D51B02E0CD96B60937FBC60F8DDFB12BD62767459DE2D2DE9A68A3
          4A6758E2D31AE9CBF5B71534F15944EB2A94D9D34CE710CAB0ED19C370BAE2D6
          C28FBD1D3339CB20151900000000A10DA0F3C0C67CA0DA75F85F7A843683CF03
          19F28369D7E04D2F972BF3B2BA78F91D7A57EF47730A08CAFCECAE9E3E475E95
          FBD1DCC04B200400008AB725156E2112E12F749BFC4726FE15E7D74B8A277BB5
          FDD26FF11C9BF8579F5D2E289DEF15BFE3687D32F7C5B787942005162A000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000026204E48194D331F3
          4A6C6C6DAF16B4D85859D569695CF169A29899AAA9E8888E5936A6299AA72860
          365E54E0DBB73CE7345581ECD719F79B4E58B7BDD8FC12CE63A62AB69A6263EC
          D5B9F2A7B9D9B4DC4B896D9B33560D82D955CB551614D77BB5A63A263FA29D7E
          CAA5F716754EC85E2EBA3F895F3D958D5E31979E4E4ED3EBD0D223E758E652F7
          3CF64384FBDDB666C5B1AC7AD29D38D4576D177B299FAA2CE22AFD6A96E6CA9B
          00D8F6498A6ACB990707BADB51BADE6ED4D76BE7D5AD5FCAA45DEA9DB2C96E9C
          1FDFED75DBD54D11F59DDAB7AAAB2C6C9369B9CEAA232C646C66FF004DA7736B
          45D2BA6CA7FF00D954453FCB71E53E017B6EC7FDEED719B3C3302B1ABBAF84DB
          FBE5AD3FEDA358FF00D4B2EB1BAD85DE8F7BB1B3A28A7A29A62223F467C588E4
          8558BBD31B592DD383EB8596536F5D55CFD21C71947DCE5CA775E25AE72CED7F
          C42B8D38D6573B2A6C2CE7F39D6AFE5BA729F04CD846509A2D2E191AE97AB6A3
          969B6BF4CDBD713D3AD4DBE2AC514C6C864B74D1EC32E5AECAC633EB98CE77BE
          1C3B02C2307B28B1C2F0DBA5D2888D229B0B1A688D3F287DBC548FA5E29A69A6
          32A63244469CA99D7A407D44640002637A131BC190000000002843683CF0319F
          28369D7E17DEA10DA0F3C0C67CA0DA75F8134BE5CAFCECAE9E3E475E95FBD1DC
          C28232BF3B2BA78F91D7A57EF4773012C801000022ADC9455B8844B84BDD26FF
          0011C9BF8579F5D2E289DEED7F749BFC4726FE15E7D74B8A277BC56FF8DA1F4C
          BDF16DE1E50801458A8000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000009D04
          A065146B3114C4CCCEED3E77A7CB7B30DA0E6FB58B1CB793717BFD53BBDE6EB5
          CC7EBA6898899D8AB6777B5B69E2D9D3333F28CDE593C9D30E89CA7C04F6E798
          E68AF12B85C703B1AF978F7DBC44D511F5D14EB547E8DCF947DCE3C0EC3896B9
          D73DDEAF53FE7B1B858459D3F95756B3FF00A5529B2AEAE85FEE9A278B5EF5D3
          65311F3D5E6E0FD23A5FA38565DC771DBC5174C1706BF5FEDAD3B9A2EF77AAD2
          67F2885A5652E07DB03CA5C4AEC72559E256F469A5B6236B55BCCFDB4F2513E6
          B6BE1196B00C02C22EB81E0F72C3EC63759DD6EF45953FA5310FBA6ED3F9A593
          5D783AB7AB5DE6D623BB5FA2AD729F03DDBFE6D9B3AEC723DB61B615E9ADAE25
          694DDB8BF5CD154F1FF4A5B9F297B9C38EDB554DA675DA1DD2EB11A4D56186DD
          6AB699FABDF2B9A623CD9779F1698E8348568B0A236EB64B74D05C2EEFAED226
          B9F9CE5BA1CF194B8086C0F2E4515E2785625982DA8D278D88DF2A8A75FB965C
          4A663EA9D5B932BECD721649B3F7ACA594707C2234D266E972B3B2AAAFB6AA63
          5AA7EB97A4D51AEAA914C46C864976C2EE5738CAC2CA9A7BA208A298D7494716
          1225EEC88D6234004800000000000000098DE84C6F064000000000A10DA0F3C0
          C67CA0DA75F85F7A843683CF0319F28369D7E04D2F972BF3B2BA78F91D7A57EF
          47730A08CAFCECAE9E3E475E95FBD1DCC04B200400008AB725156E2112E12F74
          9BFC4726FE15E7D74B8A277BB5FDD26FF11C9BF8579F5D2E289DEF15BFE3687D
          32F7C5B787942005162A00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000988D7538BAEE9FE
          099C93113281F6E15826338E5E22E982E137CC42DE74D2CEEB6155AD5FA53132
          DAB94F824EDEB374516975C8B78B85857A696D88DA53614C7DB4CEB5C79AFA8A
          6AAB643D977C3AF77B9CAC6CE6AEE8969D4C6EDD2EC8CA7EE72666BC7BDDB673
          CF374B9C4F2D76170B09B5AA3ECAEAD23FF4B75650E01DB0FC0389698B5D711C
          72DA9D3FAAF97898A27EDA29D225522C2B964973D08C56F3AEBA2288F9CFE90A
          D1BBDDAF17BB5A6C2EB61696B6957253459D335553F943DF654E0FBB64CE734C
          E07B3FC5ABB3ABFD5B6B19B1A223A666BD3916A9973649B38CA3674D965CC9B8
          4DC229DD36575A627F5D357ABA2C6CECE22298D2237446E8558BBC74CB25BAF0
          73671AEF56D9FCA98F5573653F73DB6AB8BF12D7336358560B673A4D5445536F
          5E9F969112DD1947DCF2D98E1BC4AF34E60C5F18B4A796AA2898B0A35E8E4E59
          875971683488DCA9165452C92E9A1D84DD729E4F8D3FEDAFF66B8CA7C1C762F9
          329A2704C8185C5A51FEADBD97BF5733D3335EB0D8576B8DD2E3654D85D2C2CE
          C6CE88D29A2CE88A698FB221FDB5943EE22236322B1BAD8DDE38B6344531F28C
          8E2D3D26911B812AE9D651AEA000000000000000000000000000002637A131BC
          190000000002843683CF0319F28369D7E17DEA10DA0F3C0C67CA0DA75F8134BE
          5CAFCECAE9E3E475E95FBD1DCC28232BF3B2BA78F91D7A57EF4773012C801000
          022ADC9455B8844B84BDD26FF11C9BF8579F5D2E289DEED7F749BFC4726FE15E
          7D74B8A277BC56FF008DA1F4CBDF16DE1E50801458A800000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000278B
          AFF9A19D958DA5B57C4B1B2AAD2A9F9A989991F514CD5B1FCC7BACA7B0DDADE7
          79A2ACB3B3FC6AF7655EEB6F83554597E75D5A531FAB73E53F73E76C98D4D16B
          98EFF83601653DD536B6F36F6D1F65367134CF9D0FB8B3AAAD90BA5D702C46FB
          EC2C6A9F0CA3EB2E5F2235E4D7E6F9D60F94BDCE9D9DE1D345AE6FCDB8CE3369
          4F2D567768A2E9653F54F77569F6550DD994B831EC2B25C515E0DB36C22BB6B3
          D262DEFB65F0BB489E98AADB8D313F668A9177AA76EA64D74D00C46DB5DB554D
          11DF9CEE555659C819DF3A5AC58E52CA58C63154CE9ADCAE5696D4C7DB5531A4
          7E72DC994B80C6DFB32F12D6FD815C700B0AE35E3E277CA62AD3EE5971EA89FA
          A6216776171BADD6CA9B0BB5851656744694D1453C5A623A2221FDB894EFD156
          2EF4C6D64B74E0F2E567AEF16935776A8FD65C4D94BDCDEC36CA68B7CEDB44BD
          5E27926AB0C32EB4D9447D5C7B49AB5F361BA729F033D806578A2BEC2E8C56DE
          8E59B4C4EDAABC6B3D3C4AA7891F952DDFC5A53AC69C92AB14534EC864B74D1B
          C2EE5ECAC633EB9D73BF37E561194B2D6016145D704C0EE371B1B3E4A68BBD85
          36711FA43F522CE888E484EB28D65F4BD5345344654C64998A67E794694C6E01
          F59275946A0240000000000000000000000000000000000000004C6F42637832
          0000000005086D079E0633E506D3AFC2FBD421B41E7818CF941B4EBF02697CB9
          5F9D95D3C7C8EBD2BF7A3B98504657E76574F1F23AF4AFDE8EE6025900200004
          55B928AB710897097BA4DFE23937F0AF3EBA5C513BDDAFEE937F88E4DFC2BCFA
          E97144EF78ADFF001B43E997BE2DBC3CA10028B1500000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000120813A7D52FDCC0B23E7
          0CD16B4D965ECB189E2335F73377BB575533FEE88D3F94C673B156CEC6D2D672
          A22667E4FC21BEF297027DBC6688A2D6DF2ED8E0F635693355FEDE28AA23EEC6
          B32DCF94FDCE0A3FA2D73AE7EAA7E79B2C3EEFA47D93555FF0FBA6CABABA17DB
          A68AE2B7BD7458CC475CEAF370FC53131BE75FB1F4E1F84E278A5AC58E1B875E
          6F75CCE91163655573FC42D03287029D82E579A2D2DB2C578B5AD3A4F1EFF6F5
          5A46BD3A4690DBD81647CA1966CA9B2CBD96F0DC3E9A6348F83DDA8A27F588D6
          5522ED3D32C9AE9C1E5E6BCA6F36B14F74673FA2AC329F057DBA671E25786E42
          BEDDEC6D375B5F74BBD131D3135374655F739F3A5F628B6CDF9C30EC36CE749A
          ACEEB4556F694FEBA53FCAC062CA888D2213C58D3455A6C28A76B25BA681E196
          1AED73AE7E73946E731E50E00BB16C0E68B6C76715C76DA9EEA2DEDFDEACA7FD
          B4444FFEA6EACADB19D95E4CA68EC6721E0D72AE8D38B6B4DD69AED63FDF56B5
          7F2F651C58E4838D0A914D31B21925D708B8DCBD859531E1AFEBB58C58D9D31A
          45311A328A220D651ACBE971CA213114C266A862094EB28D6400000000000000
          0000000000000000000000000000000000000004C6F426378320000000005086
          D079E0633E506D3AFC2FBD421B41E7818CF941B4EBF02697CB95F9D95D3C7C8E
          BD2BF7A3B98504657E76574F1F23AF4AFDE8EE602590020000455B928AB71089
          7097BA4DFE23937F0AF3EBA5C513BDDAFEE937F88E4DFC2BCFAE97144EF78ADF
          F1B43E997BE2DBC3CA10028B1500000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000131CBF389CB340FED75B9DE6FB6F45D6E777B5B7B7B49D28
          B2B2A26BAEA9FAA23965B3729F05FDBCE72E257856CDB16B1B1B4E58B6BFD9C5
          CE888E9FFC69A6663EC894C44CF43D56171BCDEA78B6144D53F28996AC4BAEB2
          9FB9CFB41BFF0012DB38671C2309B3AB96AB3BA515DEED23EA999E25313F66AD
          CB94BDCFCD8D60D3457986F38BE60B48EEA2DEF3EF36733F5536514CE9F6CCAA
          C58573AD915D742F16BCEBAA88A63FDA72570C53C6988A235D791ECF2BEC5F6A
          F9CEAA632DE40C6AF7457A716D26EB559D9CFF00BEBD29FE56AF947625B28C93
          14CE5AC83835CAD688D22DA9BAD336B3F6D731333F9CBDAD9DDAC2CA9E259595
          3453D14C690FB8BBF5CB26BA70731B6F56DE14C7EB3E8AD8CA7C0076D18EC516
          D8EDE309C0AC6AD358B5B59B6B5A7FDB4727FEA6E8CA5EE73E46B8F12DB37E6F
          C4F14AE34E3595DE9A6C2CA7A7A6AFE5D85145311A44278B1D0AD1634474325B
          A68661375D7367C69FF69CFF0066A6CA3C16F619937DEED30CC8370B5B7B39FE
          9B7BDC4DBDA47FBAAD5B3AE38461586D97BCE1D87DDEED671FE5B1B2A688FE21
          F54E9D06B11BA1F71111B191585CEEF768E2D8D114C7CA2211EF74C6ED53C5A7
          A0999425E94FF4C7CC6B1F342003590000000000000000000000000000000000
          000000000000000000000000000000004C6F426378320000000005086D079E06
          33E506D3AFC2FBD421B41E7818CF941B4EBF02697CB95F9D95D3C7C8EBD2BF7A
          3B98504657E76574F1F23AF4AFDE8EE602590020000455B928AB710897097BA4
          DFE23937F0AF3EBA5C513BDDAFEE937F88E4DFC2BCFAE97144EF78ADFF001B43
          E997BE2DBC3CA10028B150000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000001
          951455695453453355533A45311CB23EA2999D8C47AECB3B26DA4670B48B3CB7
          92318BF4D53A6B6775AF8BFACC68DC794B8066DB7315545A62F65866056354EF
          BD5E38F569F768D661F54D1555B2172BAE0D7FBECFF42CAA9F0D5F5D8E6F2239
          7E777CE54F738F2ADD789699CB3C5FAFD56FAECAE5654D8D3F645756B3FC373E
          51E099B06CA3C4AEE990EE97DB6A397DFB10AAABC4CFDB4D53C5FE1562EF54ED
          64B74D02C4EDB5DACD3447CE739DCAB5C1329E66CC778A6EB8065FC4710B6AB9
          29B3BB5DABB4AA7F2886DCCA5C0C76FB9AF896B393BFB26C2BFF005713B7A6C3
          8BF6D13AD7FF00A568B85E0B8460D778B9E11855D2E5614EEB3BBD8D3674C7E5
          4C443EC8A298F99522EF4C6D964D74E0F2E967AEF36B35776A8FD65C2994FDCD
          CBF57345AE77DA358D94477761865D66D267ECB5B4E2E9E6373653E039B01CB5
          34577DCBD7BC7ADA8D34B4C4EF75551AFD7459F1289FCE99743691D071637AAD
          3674D3D0C92EBA2F855D3F058C4CFCF5F9BF072D644C9593EEF175CAB94F08C2
          2CE234E2DCAE76763AFDBC588D7F37EE459D14EEA594CC41C687DE4BED167459
          C71688888F92268A677C114534EE82651ACF48FB65AC41C68620266651AC8000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000098DE84C6F064000000000A10DA0F3C0C67CA0DA75F85F7A843683C
          F0319F28369D7E04D2F972BF3B2BA78F91D7A57EF47730A08CAFCECAE9E3E475
          E95FBD1DCC04B200400008AB725156E2112E12F749BFC4726FE15E7D74B8A277
          BB5FDD26FF0011C9BF8579F5D2E289DEF15BFE3687D32F7C5B787942005162A0
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000098899DD1ABF4706CBB8FE62BC7C1700C0AF
          F895B6B11EF774BBD76D57E94C49AFA1528B2AAD272A23397E68DD795381F6DF
          335459DA59E4B9C32C2D3962DB12B6A6C6223EEC6B547E70DCD94FDCE2C62DE2
          8B5CE99F2C2EF4CF756387D84D5547D95D7C9FC2A53655D5D0BDDD346715BE65
          C9D8CE5F3D5E6E2F7F7BA5CAF57EB58BBDCAED6B78B69DD67636735D53F9446A
          B30CA9C0576179722CED310C26F78DDBD1BEBBF5BCCD357DB453A53FC37365AD
          9AE42CA5634D865DCA1855C28A74D3DE6EB4C4C69F5E9AAAC5DE7A65935D383D
          BDDA65378B48A7BB5CAAB32A7070DB5672AACE706C8189C5957FEB5E2CFDE688
          FB78DA4FF0DCF94FDCF0DA4629C4B4CD598F0BC1E8DF55165355BD7FAC690B12
          8A288E48A6234FA93C58E8548B0A636B25BA680E1B61AEDA66B9F9CE51BBD5CA
          994FDCF7D93E0FC4B5CCB8B62B8DDAD3A4CD335C58D1AFD94EF86E7CA5B01D8F
          E4C8A6301C838459574FFA9696116B5EBD3AD7AF2B62691D0691D0A914534EC8
          64975C130FB9E5C8D8D31E1AFEB2FE76375BB5DE8A6CAC2C28B3A298D29A68A6
          22223EA886714511BA984CCE88E37D4FA5D222223284F163A0D223E644CEA812
          CA66211C6FA9002667546B3D2000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000002637A131BC1900
          00000002843683CF0319F28369D7E17DEA10DA0F3C0C67CA0DA75F8134BE5CAF
          CECAE9E3E475E95FBD1DCC28232BF3B2BA78F91D7A57EF4773012C801000022A
          DC9455B8844B84BDD26FF11C9BF8579F5D2E289DEED7F749BFC4726FE15E7D74
          B8A277BC56FF008DA1F4CBDF16DE1E50801458A8000000000000000000000000
          0000000000000000000000000000000000000000000000000000000098D60FEB
          6177B7BC55145859556954EEA69A6665EF72AEC036C99D7895E5FD9F62F6F655
          F736F6961363653FEFAF4A7F94C5333B1E9B1B9DBDE672B1A26AEE8996BD1D53
          947DCF5DAC631EF76D9A71CC1703B19EEA8F7CAAF36D4FE5447167CF6E9CA5EE
          766CB70BE25AE6BCCB8DE396B1DD5167345D6C6AFB6988AABFD2B558B0AE5905
          D343717BD653C9F163FDA72DDB772BBA2359D377E6F4B95B66BB40CED5C5194F
          256358B4553A7BE5D2E5695D9C7DB5C47163F395A9652E0E5B12C933675E5FD9
          B60945B59F736F79BBFC26DA263E78B4B6E35513F64B6559585958D14D9D9595
          14514C444534C69110A9176EB964D74E0EAADB7AB6F0A63F59564652E023B78C
          C5C4B4C5AE185E5EB1AB4999BFDF22BB488FAA8B28AF97EA9986E8CABEE6FE5D
          BBF12DB3AED02FD7DAB9266C70EBB5377A3EC9AABE3CCC7D910ED2D23A0D23A1
          522C688E864D75D0AC26EDAEAA26B9FF0069FD2328694CA7C10360394A6CED2E
          D912ED7FB6A34FFC5C4AAAAF5333D3A57334C4FD910DB58565FC1305BBD376C2
          709B9DCECACF929A6C2C69A223EC8887E8E91D09548888D50C8AEF71BB5D232B
          0B38A7BA2211A47441A474133A238DF525EB4E91AEBA258CCEA806533A238DF5
          2004CCEA80000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000131BD098DE0C800000
          0001421B41E7818CF941B4EBF0BEF5086D079E0633E506D3AFC09A5F2E57E765
          74F1F23AF4AFDE8EE6141195F9D95D3C7C8EBD2BF7A3B9809640080001156E4A
          2ADC4225C25EE937F88E4DFC2BCFAE97144EF76BFBA4DFE23937F0AF3EBA5C51
          3BDE2B7FC6D0FA65EF8B6F0F28400A2C54000000000000000000000000000000
          00000000000000000000000000000000004E93D008004C4660F4597B6779EB36
          574D196F29629884D7DCCD8DD6B9A67FDDA69FCB70E55E03DB75CC93676B7DC1
          6EB8258D5CB5557EB78E3C7FB29D7D6FA8A2AAB642E376C26FB7CF616554F839
          F12EEACA5EE7161F6714DAE74CF96B6D31CB55961F778A699FAB8D572B73E54E
          06BB05CAB345A4651FED3B6A3498B4C42D6AB59D7A74E48558B0AA76B23BA681
          E2978D7699511F39D7B957B86E038CE356B4D8E1384DEAF95D73A4536163557C
          BF94368E54E097B77CDD34D775C8D7AB8D8D7CBEFB7FAA2C29D3A638DBD69981
          E53CB7976CA9B1C0B01C3EE14531A6977BB5167EA8E57EBC534F43EE2ED4ED99
          64F74E0F2EF465379B59ABE51197AB80F28FB9CB99EF7145B672CF171B8D13CB
          559DCAC2AB6AE3EA99AB8B1FA4B74E53E019B0FC0228B5C62EF8963D6D4E9AFC
          2EF13459CFFB68D263F574A691D0690AB4D9514EC864B75D14C26E9AE9B2899E
          B9D7E6F1F95B653B39C99144659C938361F551DCDAD95D28F7CFCEB98E34FEAF
          5F1451A69C58FD13A41AC74AA2FB656367631C5B3A6223E519114D31BA20D20D
          63A51C6FA8554A58F1900CA674471BEA40099A90000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000002637A131BC190000000002843683CF0319F2836
          9D7E17DEA10DA0F3C0C67CA0DA75F8134BE5CAFCECAE9E3E475E95FBD1DCC282
          32BF3B2BA78F91D7A57EF4773012C801000022ADC9455B8844B84BDD26FF0011
          C9BF8579F5D2E289DEED7F749BFC4726FE15E7D74B8A277BC56FF8DA1F4CBDF1
          6DE1E50801458A80000000000000000000000000000000000000000000000000
          001BF702407D387DC2FD89DE69B9E1B72B6BDDBDA72516563653695D5F64472C
          8FAA289AE72A63397CC36DE54E0A7B7ECE1345A5C366F885CEC2BFF5B128A6E7
          111D3C5B598AE63ECA65B9F29FB9C99D6FBC4B4CE79E70BC3689D26AB2B858D7
          79AF4E8E355C4889FCA5F74D9D75742F375D1CC52F9ECAC6ACBAE6328DF938FB
          49E84D145569545145135D554E94C472CCCF468B29CA5C00F62380F12D31CFED
          7CC16D4F2CFC2EF536746BF76CA29E4FAA756E4CA9B1ED9964A88A32BE48C1F0
          F988D3DF2CAE744573F6D5A6B3F9AAD377AA76B25BA707B7DB4D778B4A69FACC
          EE556E57D84ED8339CD119776798CDE28AF75ADA5DE6C6CE7ECAED38B13FAB72
          E54F73EF6BD8D712D33162984E0963569331355578B5A7EDA69D23FF0052C82C
          ACACECA9E259D114C47CD11A433548B0A636B26BA68061F65AEDEAAAB9FA47FF
          0078B91329FB9D9B39C3F896B9B733E2B8BD71A71ACECF4B0B39FB38BFD5FCB7
          4654E0CFB13C9BC4B4C1B20E1D36D469A5BDE2CFDFAD3CEAB56D34AAD34534EC
          864B75C070EB9FB1B1A63C339DEF96E386DC30EB2F79B95CEC2EF446EA6CACE2
          88FD21F4E91D10946B0FA5DA22223283484A358E944D5D02592358E9471A500C
          B58E9471900278D2800000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000131BD098DE0C8000000001421B41E7818CF941B4EBF0BEF508
          6D079E0633E506D3AFC09A5F2E57E76574F1F23AF4AFDE8EE6141195F9D95D3C
          7C8EBD2BF7A3B9809640080001156E4A2ADC4225C25EE937F88E4DFC2BCFAE97
          144EF76BFBA4DFE23937F0AF3EBA5C513BDE2B7FC6D0FA65EF8B6F0F28400A2C
          5400000000000000000000000000000000000004E93D008037890656767696B5
          C59D959D55D756EA698D665ED32AEC636A99CE69A72E644C5EF94D53DDD376AA
          9A63EB999D39131133B15EC6ED6D789CACA99AA7E519BC48E9ACA9C0076D18E7
          12D71CB4C2F02B1AB967DFEDFDF6BD3EED1AE93F6B73E51F73A323DCB895E70C
          E38A6255472D56774B3A6EF4FD9C69E34CC7E50A94D8D75742FF0075D0FC5EF5
          B2CB8B1FED947EEAFF007EDE5FC959BF34DE3E0996F2CE25895B4EEA2EB74AED
          6AFE2169B94F82C6C2B27716AC3767F70BCDAD3FEADFA26F354CF4E95CCD3FA4
          36861F8661F85D85376C36E36175B0A3B9B2B1B38A288FB22391522EF3D32C9A
          E9C1D5ACEBBD5B447CA233F3CBC958394B8136DFF34F12BB7CB36182D857CB16
          B89DE69B298FB6CE9E3571E6B73652F737E2668B5CEFB4599FFAEC30BBA7AAD2
          D27FF83B8E27EA4E91D0AB16144326BA683E1577D75D335CFCE7F48C9A1329F0
          26E0FD95FDEEBB5CA96B8DDB59E931698A5E6AB589FB6CE9E2D9CFE74B70E5FC
          A195B2ADDA2E79632E61B845847FA771BAD1614FE944443F692A91114EC64776
          C3AE9738CAC2CE9A7BA218C69BB44A44BDA84A358E944D5D00C908E34A35D419
          6B1D289ABA100278D28000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000131BD098DE0C8000000001421B41E7818CF9
          41B4EBF0BEF5086D079E0633E506D3AFC09A5F2E57E76574F1F23AF4AFDE8EE6
          141195F9D95D3C7C8EBD2BF7A3B9809640080001156E4A2ADC4225C25EE937F8
          8E4DFC2BCFAE97144EF76BFBA4DFE23937F0AF3EBA5C513BDE2B7FC6D0FA65EF
          8B6F0F28400A2C540000000000000000000000000489C902749E83E7D032CD03
          F5B02CA79A3345B45865BCBB896275CCE9A5D2EB5DAE93F5F162746DFCA5C0C3
          6FD9AF89695654B3C26C2BE5F7CC4ADE9B3E4E9E2D3C6ABF29887D451555B21E
          EBB6197CBE6AB0B2AAAEE8968BD24D1DB7953DCE0BD55345AE75CFFC489E5AAC
          70EBBF2C7D5C7AF589FD1BA729F022D83E5B8A2D2F7976DF19B6A74E3577FB7A
          ABA6AFB68EE7F8548B0AE5925D341715BC6BB488A23E73FA466AC3B8E1D88627
          6F176C3AE378BDDACEEB3B0B2AAD2AFD22265B2F297063DB8672E25785641C42
          CAC6BD34B6BDD316147E7C6E5FE169D816CFB25657B2A2EF97F2BE1B70A28EE6
          2C2ED4D331F9E9ABD05144531A44722AC5DE3A65935D383CB2A75DE6DA67E511
          96F957C654F73AF3F621C5B6CDD9A70DC2E998FEAB2BBD355B5A47D93C90DD19
          4FDCFCD8F609145AE60BE62B8E5AD3F35A5A4595133F5D34EF8FCDD462A45953
          1D0C9AE9A2584DD32E2D971A7AE75FECD7D96361DB27C9F4D3465EC8584DDA69
          DD5CDDE2D2BFB75AB597BAB0B0B3B0A69B3B2A229A29E4A6988D2221FDC54CA3
          A17EB2BBD9584716CA9888F944000AC08D611357403246BA23594032D6113574
          2004F1A51AEA0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000693D0988E9042622754C4689000000000
          01421B41E7818CF941B4EBF0BEF5086D079E0633E506D3AFC09A5F2E57E76574
          F1F23AF4AFDE8EE6141195F9D95D3C7C8EBD2BF7A3B9809640080001156E4A2A
          DC4225C25EE937F88E4DFC2BCFAE97144EF76BFBA4DFE23937F0AF3EBA5C513B
          DE2B7FC6D0FA65EF8B6F0F28400A2C54000000000000131133BA0D275D349040
          9E2CF43FA5DEEB79BDD716775BBDA5B5733A453453354EBF9276BEA9A66A9CA2
          1FCA39771B9B2F297071DB6E759B3AB02D9CE2F559DA69C5B6BCD97C1ECA7FDF
          69C5A67F56E8CA9EE75ED3F14E25B66ACC9836096557754594D57AB6A7F28D28
          FF00D4FB8B3AA7A177BA68FE257DD7636354C75E5947D65C986E58D651F73D36
          4B83C59DAE67C631BC7ADA9EEE89B4A6EB6357FB688E3C79EDD394B83FEC6B24
          712BCB7B38C12EF6D47736F69768B7B68FFF0065A71ABFE5522EF574B26BA707
          D7FB5D76F553447D6776ADEAA8CA7B27DA6678AA8EC4F21E398A59D7BAD6C2E5
          69363F9DA4C7123F396E9CA7C01F6EB8F712D71BB3C272ED8D5DD45EEF516B6B
          11F553631547EB542CAA8B0A28888A288888DD10FED1C9110A9177A7A592DD38
          3EB8596BBC575573E111FAF9B8D32A7B9C394EE71676D9D33D62989571A4D565
          71B1A2ED6733D1AD5C7AA63EC986E9CA7C13360B93E2CED2E1B3DB8DEEDE8D27
          DFB10D6F55EBD3FF008933113F668DC62A4514D31944326BAE8F61973CB92B1A
          7BE6339DF9BF3B0FC0F0AC2ACA9B0C370CBBDD6CE88D29A2C6CA28888FB221F7
          453A472331F6BBD345344654C64003E811AC74A26AE806431E34CA2759F9C196
          B1D289ABA100278D3289E5F9C000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000349004C427488063A
          4F42621923588DF2679091135531CB32F8B11C670CC2ECA6DAFD7DB2B1A63FEA
          AB967F252B6B7B3BBD13696B545311D3339426226763EDD63A4E353BB56BCC67
          6AD75B29AACB06B9D56F57CD696BFD34FE9BE7F87F7D9EE61C5F1FBF5F6D312B
          CC574D1447128A69D29A797E662963A6F84DEB11A30CBAD7C7AEACF5C47DD8CB
          E7E8AB3615C53C69D8F7A212CC1440000005086D079E0633E506D3AFC2FBD421
          B41E7818CF941B4EBF02697CB95F9D95D3C7C8EBD2BF7A3B98504657E76574F1
          F23AF4AFDE8EE602590020000455B928AB710897097BA4DFE23937F0AF3EBA5C
          513BDDAFEE937F88E4DFC2BCFAE97144EF78ADFF001B43E997BE2DBC3CA10028
          B1604E92064813C59E87A7CB9B30DA1E6EB4A6CB2E64CC5EFF0035F73559DDAA
          8A67FDD3111FCA6226762AD9585ADB4E5674CCF7466F2E98899745E53E027B72
          CC7C4B5C4AE371C0EC6ADF37BB789AE9FF00653ED6E8CA9EE7160961345B672C
          F17ABDD51A71EC6E56316744FF00BAAE57DC59573D0BFDD344B16BDE534D94C4
          75CEA706693BF47E8E1396B30E3D6D45860B825FAFD5D73A5316161557AFE90B
          4ACA5C10761194A28AEC325595FEDACF969B5BFDA4DB55AFE7C9FC36A61396B0
          2C0AC7E0F82E0B72B859FF00D376B0A6CE3FF4C42AC5DE7A6592DD383BB799CE
          F36B11DD19F9AAEB29F03DDBE66C9A2BB1C9B6B8758D7A4FBE621694D8691D3A
          55CB2DD394FDCE0C6EDB896F9CF3EDDAED13A4D56370B09B4AA3EAE355C58FD3
          5777D3469F3328548B0A23A1935D34170BBBEBB489AE7E73FA464E74CA5C04F6
          19977896989E177FC72DA9D2666FB7998A667EAA68E2F27D5ACB71E5AD99E41C
          9D674D196727E1186CD31A71EEF74A29AFF3AB4D67F397A915622236324BB615
          72B9FB0B2A69F0FD5FCACECA28DD0FE91C90912F764002411AC1C6048C38D3F6
          1AC832D63A49AA18E801C69926667E7003400000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000D26
          53A4820D27A19690906311D29DC4CC46F471E98DF2663246B0F8B11C630DC32C
          A6D6FD7DB2B1888D74AAAE59FC9E2B18DAADD6CB5B2C22EB55B55FFDCB4E4A7F
          458716D25C3304A78D7CB5889EADB3F48D6FBA2CEAAF64360556D674471ABAE2
          988DF33C8F358CE7DC030A9AA8F84C5E2D23FC965FD5FACEE6ACC5B34E398CD5
          3F0CBF57C49FF4E89E2D31FA3F2746AAC6B85AAEBCECF0AB2CBFDAAFD23D5EBA
          2E996BAA5EC717DA66357ED6CF0FA69B9D94FCF1FD55FF00D9E4EF179BC5F2D2
          6DAF56F696B5CFF9ABAA665FCC6ABC4F1DC4718AF8D7DB69ABE59EAFA46A7AA9
          B3A68FC303616C8FE537EFB94FADAF5B0B647F29BF7DCA7D6BF707BF115DFBE7
          CA5F178F652D9B09446E4BAA616A0000001421B41E7818CF941B4EBF0BEF5086
          D079E0633E506D3AFC09A5F2E57E76574F1F23AF4AFDE8EE6141195F9D95D3C7
          C8EBD2BF7A3B980964008000115251546B1A0384BDD268D311C9BF8579F5C38A
          3966792169DC22B83247080C5303BC5EF3557845D708A2D29B4A2CEEB16B696B
          C698DD3354453BBA25F8594B804EC372FD545AE2D71C4B1FB6A3978D7FBDCC53
          33F72CE29A67EC98979ED2CA6BAF386ACC7744F10C5B14B4B7B3888A272D733F
          28E85685958DADBDA536361655DA5A573A534514CD55553F5446F6C1CA9C1F36
          CD9CEAA3FB0F6778C57675EEB5BC58FC1E8D3A75B4E2EB1F62D572C6CA767793
          6CE9B2CB192B07C36298D35BBDD28A667EB9988D665E9E2EF453C945114C46ED
          08BBC46D956BA7075446BBCDB4CFCA98FD655D594BDCF3DAB631C4B5CCD8DE11
          82D94F2CD345555E2D23EA988E2C44FE72DCF94FDCEFD99617345AE68C6F16C6
          6B8E5AA88B48B0B39FB38BFD5FCBACA8A78B1A3254A6CA9A7A1935D743F08BB6
          BE4B8D3FED39B5AE53E0EDB1CC99145781E40C2A8B6A375B5AD8C5ADA4FDB555
          AEAF7F77C3AE973B28B1BA5D2C6C688FF2D9D114C47E50FAC548D5B19058DD6C
          2EF19595114C7CA22185144531A33015C00011331071A012309AA750196B0719
          8E91BC0359000D20000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000D35004E929D2011A491
          1D2C9133A01A68963C7A5F26218C6198658FBF6217DB2B0A3A6BAB4D7EC8F9D4
          AD6DECEC289B4B5AA2223A675426226753ECD618D56B4511335551111BE65AFF
          0018DAADD2CA2AB2C1AE955BD5BA2D2D7FA69FCA37CFF0F118B66AC771AAA7E1
          B7EAFDEE7FD3A3FA69FD237FE6D7B8CF09984E1B9D9DDA66DABFF5D9F5F4CDE8
          A2ED5D5B75369E339F700C266AA3E15179B58FF4EC7FABF59DCF0F8C6D3719BF
          4556570A29B9D9CFCF1CB5FEAF1B3333296A7C67846C6715CE8B3AB92A27A29D
          BE33B5EBA2ED451B75BFA5E2F579BDD736B7AB7AED6B9DF55754CCBF92460969
          695DAD535DA4CCCCF4CEB95688CB6003E120003616C8FE537EFB94FADAF5B0B6
          47F29BF7DCA7D6CD383DF88AEFDF3E52A378F652D9B1B9288DC9754C2D400000
          02843683CF0319F28369D7E17DEA10DA0F3C0C67CA0DA75F8134BE5CAFCECAE9
          E3E475E95FBD1DCC28232BF3B2BA78F91D7A57EF4773012C8010000000000000
          08998838D009184D53F341ACF4832998838D0C748009AA7535900348DE000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000001A6A9D24109D253A42418C474A74D099D11C
          78F9CCC648D621F1DFF17C370DB29B5BF5EECEC698FF00AAA78AC636AB74B2E3
          5960F75AADEADD16969FD34FE9BE562C5F4930CC129E35F2D6299EADB33E1B5F
          7459D55CEA87BFAAD68A235AAAD23A65E7319CF997F0999A26F7EFF6B1FE9D94
          71A7F39DD0D598B66BC7B19998BDDFAA8B3FFEDD9FF4D3FF0077E3CFD4D538CF
          0B75D59D9E176597FB55E91FACBD745D3A6A97B3C6369D8D5F78D6586D145CAC
          A7938D1FD55FEB3C90F2379BCDE6F96936D7BB7B4B6B49DF55A55354FF002FE6
          3566298F6238CD5C6BEDACD5F2CF57D2353D5459D3447DD8005A1F6000000000
          0003616C8FE537EFB94FADAF5B0B647F29BF7DCA7D6CD383DF88AEFDF3E52A37
          8F652D9B1B9288DC9754C2D40000002843683CF0319F28369D7E17DEA10DA0F3
          C0C67CA0DA75F8134BE5CAFCECAE9E3E475E95FBD1DCC28232BF3B2BA78F91D7
          A57EF4773012C801000000031E37D49AB7318DC099AA7E646B20069A80000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000001CBD0009E2CA62011A4C914F4B244CE806
          91096335C44E9A3E4BFE31876196536D7FBDD9D85311FE6AB97F28DF2A56B6F6
          76344D7695444474CEA4E532FB3586355AD14471AB98888DF32F038C6D52E563
          C6B3C1EED55BCFCD695FF4D3F946F9787C5F3663D8CCCFC2AFD5459CFF00A747
          F4D2D7B8CF09984E1933677799B6AFAA9D9FFF005B3E99BD145DABAF6EA6D3C6
          B3E60184EB47C2A2DED63FC965CBFCBC3631B4EC62FBC6B2C3A8A6E9673F3C72
          D7FABC6E93BE6794D1AA319E11B18C573A2CAAE4A8EAA76FD76BD545DA8A3E6F
          ED78BDDEAF96936B7ABC5A5AD73CBAD756AFE291815A5A576B54D75CE733D32A
          F96400F948000000000000000000D85B23F94DFBEE53EB6BD6C2D91FCA6FDF72
          9F5B34E0F7E22BBF7CF94A8DE3D94B66C6E4A23725D530B50000000A10DA0F3C
          0C67CA0DA75F85F7A843683CF0319F28369D7E04D2F972BF3B2BA78F91D7A57E
          F47730A08CAFCECAE9E3E475E95FBD1DCC04B200400000031AB7223726ADC88D
          C000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000072FCD09E2C8208899F9B46511A2
          418C52C9133A46A8E3C7422662368C91ABE4BF62F8761B6536D7EBDD958D11F3
          D75443C5635B56B8D96B67835D6ABC55F35A5A6B4D1FA6F959316D23C3305A78
          D7CB68A67AB6CFD235BEE8B3AABD90F7D55A534C4CCF268F3D8DE7BCBF844556
          75DEE2DEDE9FF4AC7FAA75FAE7747E6D558BE6DC7F1A9AA9BDDFEBA6CA7FD2B3
          FE9A3F8DFF009BF1E22623486A9C6785BAAA89B3C2ACBFF6AFF4A7D5EBA2E91F
          9E5ECB17DA6E337DE359E1D6745CECE7938D1FD55CC7DBBBF8792BCDEAF57CB5
          9B6BDDE2D2DAD27FCD5D5332FE496ACC531EC4718AF8D7DB59ABE5D1E11B1EAA
          2CE9A3F0C23ED482CDB1F600900000000000000000000000006C2D91FCA6FDF7
          29F5B5EB616C8FE537EFB94FAD9A707BF115DFBE7CA546F1ECA5B36372511B92
          EA985A80000005086D079E0633E506D3AFC2FBD421B41E7818CF941B4EBF0269
          7CB95F9D95D3C7C8EBD2BF7A3B98504657E76574F1F23AF4AFDE8EE602590020
          0000018D5B911B9356E446E00000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000D2677400278BD
          2988D018C44CFCDA278B2C913C8091871FEA7CB7EC5EE186D9CDADFAF565634C
          46BFD5569FC28DADBD958D135DA5514C474CEA84C44CEC7D9AB1AAD69A235AA6
          2223E799783C636A971B2E35961376AADEA8E4F7CAFF00A69FFBBC3E2D9BB1DC
          66662F57DAA8B39FF4ECFF00A69FE1AFF19E12F08C333A2C266D6BEAA767D7D3
          357A2ED5D7B7536A6339EF2FE11136769798B6B58DD6765FD53FF6785C6769B8
          B5F38D658659D374B39FF34FF557EC78CE5DFAEF47CED518C70918CE29334D95
          5C951D54EDFAEDF27AE8BB514EBDAFED7ABE5EEFD6B36D7CBC5A5B573FE6AEA9
          997F2FAE4180DA5A576B571ED2739EB9DAAF96400F9480000000000000000000
          00000000000000D85B23F94DFBEE53EB6BD6C2D91FCA6FDF729F5B34E0F7E22B
          BF7CF94A8DE3D94B66C6E4A23725D530B50000000A10DA0F3C0C67CA0DA75F85
          F7A843683CF0319F28369D7E04D2F972BF3B2BA78F91D7A57EF47730A08CAFCE
          CAE9E3E475E95FBD1DCC04B200400000031AB7223726ADC88DC0000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000006933B9314CFCE08222AF9F46511A2418F17EB6430E3CF4233C8668D7
          487C97EC56E386D8CDBDFEF56561671FE6B4AA23FF00FAF178CED5AE36315596
          1174AEF35C7245A5A7F4D1F6C46F9FE164C5B48F0CC168E35F2DA299EACF39FA
          46B7DD367557B21EF26D6298D6AD223EB7E06319EF00C238D4577A8B7B58FF00
          4EC7FAA75FAE7735562D9BB1FC6A669BDDFAAA6CA7FD2B3FE9A7F8DFF9BF1B4E
          5D665AA719E16EA9CECF0AB2FF00DAAFD298FD67C1EBA2E9FDF2F698C6D3F17B
          DCCD9E19654DD2CE7FCDDD57FABC95EAF97ABEDA4DADEEF1696D5CCEB335D5AB
          F825AB314C7F12C62AE35F2DA6AF9679447746C7AA9B3A68FC3000B3BEC00000
          00000000000000000000000000000000000006C2D91FCA6FDF729F5B5EB616C8
          FE537EFB94FAD9A707BF115DFBE7CA546F1ECA5B36372511B92EA985A8000000
          5086D079E0633E506D3AFC2FBD421B41E7818CF941B4EBF02697CB95F9D95D3C
          7C8EBD2BF7A3B98504657E76574F1F23AF4AFDE8EE6025900200000018D5B911
          B9356E446E000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000239594469F3831D2AF9B44F17A59000C26BD274
          87CD7EC56E386D136B7DBD5958D311ACCD5568A56B6F67634CD7695444474CCE
          498899D8FAE58556914C6B331111D2F098CED5AE161C6B1C2AED55E6A8E4F7CA
          BFA68F6CBC362D9C31EC66669BCDF6AA2CA7FD2B2FE9A7F8E596BFC6B84AC1F0
          CCE8BBD5CAD71D14ECF1AB67D3357A2ED5D5B7536AE339EB00C1E268B5BD45B5
          B47FA565FD557B23F3785C676A38BDF38D6785D95173B39FF3CFF557FCF247F2
          F17A6BBCD1A9F19E12719C573A2C6AE468EAA76F8D5B7E993D745DA8A7E6FED7
          ABDDEEFD6D378BEDE6D6DED2ADF55A55354FF2FE3A24605696B5DAD535DA4CCC
          CF5ABC465AA001F0900000000000000000000000000000000000000000000000
          01B0B647F29BF7DCA7D6D7AD85B23F94DFBEE53EB669C1EFC4577EF9F2951BC7
          B296CD8DC9446E4BAA616A0000001421B41E7818CF941B4EBF0BEF5086D079E0
          633E506D3AFC09A5F2E57E76574F1F23AF4AFDE8EE6141195F9D95D3C7C8EBD2
          BF7A3B9809640080000006356E446E4D5B911B80000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000002235022356511A11
          1A1320944F23E6BE62374C3ECA6F17DBCD9D8D9C7CF5D510F178C6D56E1778AA
          CB09BBD579AB771EBFE9A3DB2B262DA458660B471AFB6D14CF574CF746D7DD36
          7557B21EEAAB48A759998888F9DF818CE7AC0B0789A2D2F54DB5AC6EB3B2FEA9
          FD77355E2D9BF1EC66662F37DAA8B39FF4ECFF00A69FFBBF1A796759DED538CF
          0B53AECF0BB2FF00DAAFD223F597AA8BA7F7BDA631B4FC56FBC6B3C36C69BA51
          3FE69E5ABFECF237BBEDEEFD6936D7CBCDA5B573F3D754CBF88D578A6906258C
          D5C6BEDACD5F2CF57D363D74D9D347E184689059F3CDF6000000000000000000
          0000000000000000000000000000000000000003616C8FE537EFB94FADAF5B0B
          647F29BF7DCA7D6CD383DF88AEFDF3E52A378F652D9B1B9288DC9754C2D40000
          002843683CF0319F28369D7E17DEA10DA0F3C0C67CA0DA75F8134BE5CAFCECAE
          9E3E475E95FBD1DCC28232BF3B2BA78F91D7A57EF4773012C8010000000C6ADC
          88DC9AB722370000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000CA218C72CE8CA67EB44CE431AABE2FCEF0F9AF68F77
          C32BB4B8613145BDE6358AAD27B8A27FE65FCF68D9B6D30FB2FEC7C3ED34BC5A
          D3ADAD713CB453D1F6CB56EF99999D665A734F34FAD30FB5AB0DC3272AE35555
          757CA3E7D6F658584551C6A9F5E238AE218B5B4DE310BDDA5B57F371AAE48FB2
          373E43F34B45DBDBDA5E2B9B5B5AA6AAA76CCCE732F7E5111940029000000000
          00000000000000000000000000000000000000000000000000000003616C8FE5
          37EFB94FADAF5B0B647F29BF7DCA7D6CD383DF88AEFDF3E52A378F652D9B1B92
          88DC9754C2D40000002843683CF0319F28369D7E17DEA10DA0F3C0C67CA0DA75
          F8134BE5CAFCECAE9E3E475E95FBD1DCC28232BF3B2BA78F91D7A57EF4773012
          C8010000000C6ADC88DC9AB72237000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000002698E5D5FC6F978A2ED76B5BC573
          1116744D53F943FB53BB579CCFD7B9B9E5ABE554CE93694C59FEB3A2DF8ADEFE
          C172B5BCFF0065333F487D5119D510D3B8ADFED313C46DEFD6B3ACDB573547D5
          1F347E8F991F5A5C6F6F6D5DE2D2AB5B49CEAAA6667C57888CA3280052480000
          00000000000000000000000000000000000000000000000000000000000000D8
          5B23F94DFBEE53EB6BD6C2D91FCA6FDF729F5B34E0F7E22BBF7CF94A8DE3D94B
          66C6E4A23725D530B50000000A10DA0F3C0C67CA0DA75F85F7A843683CF0319F
          28369D7E04D2F972BF3B2BA78F91D7A57EF47730A08CAFCECAE9E3E475E95FBD
          1DCC04B200400000031AB7223726ADC88DC00000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000CA9EE61E2F6A7693465FA
          688DD5DB53AFE5CAF674BC4ED5A26702B1D3FF00BD1AFE8C5F4D6669C02F531F
          D92AB63ED21A9C07252EC0000000000000000000000000000000000000000000
          000000000000000000000000003616C8FE537EFB94FADAF5B0B647F29BF7DCA7
          D6CD383DF88AEFDF3E52A378F652D9B1B9288DC9754C2D40000002843683CF03
          19F28369D7E17DEA10DA0F3C0C67CA0DA75F8134BE5CAFCECAE9E3E475E95FBD
          1DCC28232BF3B2BA78F91D7A57EF4773012C8010000000C6ADC88DC9AB722370
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000026978FDA8D9CD7972AAE23FF2ED689FD6747AFA67965E733F587C232C
          5F7935E25315FE92C7F4A6CB97C1AF3671D3455BA152CBF1C34A241C84BB8000
          0000000000000000000000000000000000000000000000000000000000000000
          00D85B23F94DFBEE53EB6BD6C2D91FCA6FDF729F5B34E0F7E22BBF7CF94A8DE3
          D94B66C6E4A23725D530B50000000A10DA0F3C0C67CA0DA75F85F7A843683CF0
          319F28369D7E04D2F972BF3B2BA78F91D7A57EF47730A08CAFCECAE9E3E475E9
          5FBD1DCC04B200400000031AB7223726ADC88DC0000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000004775F6BF3F305DBE1
          3835F6EFA6BC7B1AA3F87E84724EAC2F34C5A585A59E9DD5331FC3CD7CB18B7B
          BD7653D3131F584D3394E6E748DC97F6BED94D8DF2DEC6634E25AD54FE92FE2E
          2FB6A392B4AA89E89985E62738CC014D20000000000000000000000000000000
          000000000000000000000000000000000003616C8FE537EFB94FADAF5B0B647F
          29BF7DCA7D6CD383DF88AEFDF3E52A378F652D9B1B9288DC9754C2D400000028
          43683CF0319F28369D7E17DEA10DA0F3C0C67CA0DA75F8134BE5CAFCECAE9E3E
          475E95FBD1DCC28232BF3B2BA78F91D7A57EF4773012C8010000000C6ADC88DC
          9AB7223700000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000009AE39275F9D8CEE65FE544C66344E70BB7C17325FACA234
          89B59AA9FB2795F8EF5FB51BAFBCE618B788D22DEC6263F2E478F87206945D7E
          C58CDE6C7AAB9DF39AEF6539D109016254000000000000000000000000000000
          0000000000000000000000000000000000001B0B647F29BF7DCA7D6D7AD85B23
          F94DFBEE53EB669C1EFC4577EF9F2951BC7B296CD8DC9446E4BAA616A0000001
          421B41E7818CF941B4EBF0BEF5086D079E0633E506D3AFC09A5F2E57E76574F1
          F23AF4AFDE8EE6141195F9D95D3C7C8EBD2BF7A3B9809640080000006356E446
          E4D5B911B8000000000000000000000000000000000000000000000000000000
          00000000000000000000000000D600037A78B208000000000000000000000000
          0000000000000000000000000009E58654EE62CA9DDA74035BED72EBF21BE69C
          913559EBFCB5BC36F6D46EDF08CBD3694D3FD5616B4D5F97CED430E63E136EBF
          67C7EBAE3F3C455BB2FD173BB4E766901AF9E800000000000000000000000000
          00000000000000000000000000000000000000001B0B647F29BF7DCA7D6D7AD8
          5B23F94DFBEE53EB669C1EFC4577EF9F2951BC7B296CD8DC9446E4BAA616A000
          0001421B41E7818CF941B4EBF0BEF5086D079E0633E506D3AFC09A5F2E57E765
          74F1F23AF4AFDE8EE6141195F9D95D3C7C8EBD2BF7A3B9809640080000006356
          E446E4D5B911B800000000000000000000000000000000000000000000000000
          0000000000000000000000004C46A08D6065C58E848238B1F3C1A69B8D60D601
          220D63A412C6A8E5D53AC74A4180000000000000000000000000000000000000
          000000000002699E598414F740FC7CDD74F8665DBFD8446B3EF53547E5CBFF00
          0D130E89BED945BDDAD6C663FF00328AA9FD61CF97AB29B0BCDAD94C69345755
          3A7E6D0FC2FDD38B6F76BD65B6269FA4E7FABDD749D530FE4034D3DA00000000
          00000000000000000000000000000000000000000000000000000000003616C8
          FE537EFB94FADAF5B0B647F29BF7DCA7D6CD383DF88AEFDF3E52A378F652D9B1
          B9288DC9754C2D40000002843683CF0319F28369D7E17DEA10DA0F3C0C67CA0D
          A75F8134BE5CAFCECAE9E3E475E95FBD1DCC28232BF3B2BA78F91D7A57EF4773
          012C8010000000C6ADC88DC9AB72237000000000000000000000000000000000
          000000000000000000000000000000000002623538BF582197163E74A008888D
          C946B1D2C6D2D6CECE8AABAEBA69A6239666748844CC446726D65AC1354446BA
          C35FE6BDB2E51CB3C7B0A6F7F0FBD531A7BCDDE78DA4FD756E8699CD5B6CCDB9
          866BB0B95AFF00665D6AFF00258CFF005CC7D757B18B62DA6186613134D55F1E
          BFEDA75CFD764322C3345F11C4F2AA9A38B4F5D5AA3D65BF3346D1B2AE54A6AF
          ED5C4ECE2D62358B1B39E3DA4FE51FF2D4798B84662F79AEBB2CB58558DD6CF7
          536D79FEBAE7EBE2C6911FCB4FDA5ADADB5736B6F695DA5A553ACD554EB333F5
          CB16B3C574FB12BECCD3769E4A9F96B9F19F4C9B0F0DD08B85D222ABCFF52AF9
          EA8FA7ABD4623B50CFF89D5355BE68BED9F1BE6B0AFDE634FF00668F9EE3B41C
          EF87DBD378BBE6AC4E6699D74B4BCD7694CFDB4D53312FC018A558ADFAAAF949
          B6AB3EBE34FAB24A70BB8D147271634E5FF8C3AE36679C2739E58B0C52DA29A6
          F344CD8DE29A7771E3E78FB7925EBE37348F06CBD55561F8C5D27969B3B6B3AE
          23ED8AB5F5437753DCC3A1746EFD5E2385D8DE2D273AA635F7C6A68CC76E745C
          311B5BBD9FE189D5DD3AD8CF7413DD0BE2D20000000000000000000000000000
          0000000000000000011C950015EE9FADA2736DD7E0798AFF006311A47BECD54C
          7D52DF13B9A7769F75F78CC9EFDA6916F654D5FA727FC35670B175E5707A2DFA
          68AE37C4C7A3D574AB2AF27914A212E755C40000000000000000000000000000
          000000000000000000000000000000000000006C2D91FCA6FDF729F5B5EB616C
          8FE537EFB94FAD9A707BF115DFBE7CA546F1ECA5B36372511B92EA985A800000
          05086D079E0633E506D3AFC2FBD421B41E7818CF941B4EBF02697CB95F9D95D3
          C7C8EBD2BF7A3B98504657E76574F1F23AF4AFDE8EE6025900200000018D5B91
          1B9356E446E00000000000000000000000000000000000000000000000000000
          0000001311D208349E865C584831E2FD6988D1289988DE0944CC4238F4FF00D5
          0FCBC773260997AED37BC5F13B0BAD111C9C7AF49ABEC8DF2A76B6B458D335DA
          4C44474CBEA8A2AB4AB8B44673D50FD5E3474BE5BFE2172C3AC2ABD5F6F56561
          65446B55769544447EAD2F9B38445853C7BAE54C3E6D2AE588BCDBF253F6C53F
          3FE6D4598337662CCF6F36D8CE2B6D6FACF251C6D288FB298E460D8B69FE1F71
          CECEEDFD4AFE5F87EBD3E0CC30CD0ABF5F72AEF1FD3A7E7B7E9EADED9AB6FB97
          7098B4BB607635625788D638D13C5B389FB7E769BCD1B4ECDD9AEAAA8BEE255D
          8DDEAFF42C2668A7F3D3965E53725AC715D2CC4F16CE9AEBE2D1D54EA8FDDB13
          0CD17C3B0CCAAA28E355D756BDDB20E59D6677C80C6B6B22D8000023506F6E0D
          144FBC6396BF371EC69FE2A6F36A1E0E971AEEF95AF77DAA8D22F57BD23937C5
          31FF0076DD8DCE8AD0FB29B2C16C22AEACFEB332D0DA516B16D8BDBCC744E5F4
          888633DD00C996000000000000000000000000000000000000000000000009E4
          8113B819C72C35AED72EBA5771BDC53F35544CFF003FF2D951B9E336A376F7FC
          BDEFDA72D85B5356BF54EB1EC621A7775FB668FDE68E988E37D27356B09CAD21
          A8F780E515D40000000000000000000000000000000000000000000000000000
          000000000000006C2D91FCA6FDF729F5B5EB616C8FE537EFB94FAD9A707BF115
          DFBE7CA546F1ECA5B36372511B92EA985A80000005086D079E0633E506D3AFC2
          FBD421B41E7818CF941B4EBF02697CB95F9D95D3C7C8EBD2BF7A3B98504657E7
          6574F1F23AF4AFDE8EE6025900200000018D5B911B9356E446E0000000000000
          00000000000000000000000000000000000000004C4278B00C7494C427724111
          1A251AE84D511BE4128E3474B0AED6CE98E3556914C46F999D1E1736ED832865
          7AABB1AAFB17DBD53AC7BC5DA62B989E899DD1FABC97CBFDDAE1472979AE298F
          9BD176BA5BDF2BE4EEF44D53F27BC9AE888D66A8799CD5B42CAF94A899C5B14B
          18B588D62C289E35ACFF00B63963ED9E4683CD7B70CDB98B8F77C3EB8C2AEB56
          B1C5B09FFC4AA3EBAF7C7E5A35E5ADA5ADB5A556B6D5D5695D53ACD554EB333D
          3ACB5D62FC2358D9E7678751C69FEE9D51F4DACEF0BD02B7B5CABBFD7C58FED8
          D73F5D90DB99B3842E318845774CB1718C3EC6793E116BA576B31D311BA9FE5A
          B311C5712C5EF35DF314BF5BDEADEB9D66BB5AE6A9FAB7BE44B5A6258E5FF16A
          B8D7AB4998EAD91F486C1B860B72C329E2DDACE227AF6CFD64016A5D00000000
          010CECACABB7B5A2C6CE266BB4AA29A62237CCCB07B8D8DE5DEC873CDCFDF2CF
          8D77B86B7BB5E8FE9EE63CEE2BDB875CEAC42F56776A36D5311EAF1E217BA6E3
          75B4BCD5F96267D37BA4725E036796F2CE1D84514C45561634C5A69F3D73CB54
          FEB32FDE9963453A69A3299E574ED858D377B2A6CA8D94C4447839DAD6D2AB6B
          4AAD6B9CE6A9CE7C5002B3E00000000000000000000000000000000000000000
          00000001953B9F899CAE9F0BCB97FB2D35D2CA6BF3797FE1FB54BF8DF2C62F17
          5B6BBD5BAD28AA89FCE1E2C46EF17BBA5AD84FE6A663EB0FAA67298973B8CEF1
          673656F6965546934D53131F64B0718DA53345534CF46A5E76C6600F90000000
          0000000000000000000000000000000000000000000000000000000006C2D91F
          CA6FDF729F5B5EB616C8FE537EFB94FAD9A707BF115DFBE7CA546F1ECA5B3637
          2511B92EA985A80000005086D079E0633E506D3AFC2FBD421B41E7818CF941B4
          EBF02697CB95F9D95D3C7C8EBD2BF7A3B98504657E76574F1F23AF4AFDE8EE60
          25900200000018D5B911B9356E446E0000000000000000000000000000000000
          000000000013A482065C582234044474A7488480089988E59471A34D41333A1C
          6A7A5F9B8CE61C1701BBCDEB17C46C6ED6711FE7AA2267EC8F9DA8F35F086BAD
          871EEB95EE3F08AF745E2DB9298FAE23E75A313C76E184D39DEAD2227AB6CCF8
          2E570C22FB89D5C5BB59CCFCFA3EADCB7CBFDCEE56355BDEEF36763674C6B355
          754444359E6BDBDE5AC1F8F76C1A99C4EF34F244D1C96713F5D5F3FE4D0D98B3
          8E63CD16B36B8CE276B6D4CCF259C4F1688FB298E47E2C4359E2DC235BDB6746
          1D47163FBA75CFD3646F6C1C2F406CACF2AEFF005F1A7AA367D76CEE7AECD3B5
          3CE19AEAAECEF5885576BB57FF00D3DDE668A74E899DF2F23091AF2F77EBC5FE
          D395BCD73555F3967975B95DEE5472777A2298F9003CAF48000000000000000E
          86E0EF977E0597EF3982D6CF4B5C42D78967AC7FA54726BF9D5C6FD21CFD73BA
          5B5FAF96172BB51C6B5BC5A53654474D554E91EB76765AC1EC301C0EE3835DA2
          38973B1A6CB5E9988E59FCE7596C4E0EB0EE5EFD5DF26355119477CFED9B01D3
          EC4391BA5174A675D739CF747EEFD48E4863BD33C91A23737635280000000000
          00000000000000000000000000000000000000002699E59845713A14EF9653B9
          1319C64342E6BBAC5D331E216311A445BD55447D533AFF00CBF261EB769D75F7
          8CCF36DA725E2C68AFF4FE9FF879371EE925D7EC58BDE6C3AABABCF3F295DECA
          AE3511200B2AA000000000000000000000000000000000000000000000000000
          0000000000000D85B23F94DFBEE53EB6BD6C2D91FCA6FDF729F5B34E0F7E22BB
          F7CF94A8DE3D94B66C6E4A23725D530B50000000A10DA0F3C0C67CA0DA75F85F
          7A843683CF0319F28369D7E04D2F972BF3B2BA78F91D7A57EF47730A08CAFCEC
          AE9E3E475E95FBD1DCC04B200400000031AB7223726ADC88DC00000000000000
          0000000000000000000000009D253A4031D354C474A74D1208D2122012319AE2
          274944DA511BE519C19B29AA237A26BA63E7788CDDB5DC9995B8F636B8845F2F
          74727C1EEBA57544F4553BA9FCDA5F356DD336E3FC7BBE17551855D6AD634B19
          99B598FAEBF9BF2D18C62DA5D866139D35D7C6AFFB69D73E3D10C830CD18C471
          4CAAB3A38B47F755AA3C3A65BF333E7ECAD956CAAAB16C5ACA8B488D62C299E3
          5A4FFB63FE5A73357086C56F935DDB2BDCA9B9D9CF27BFDB44555CFD91BA1A86
          DADEDEF16955B5E2D6BB4B4AA759AABAA66667ED61F3B58E2FA7B885FF003A2E
          DFD2A7E5F8BEBE8D87866845C6E795779FEA55F3FC3F4F57D98A62F8A63579AA
          F78A5FADEF36B56FAAD2B997C70918457695DAD5355739CCF4CB32B3B3A2CA98
          A2CE3288E88007C3EC000000000000000000001B0F61997671BCED657DB5B3E3
          5861744DE2AE4E4E3EEA23F5999FF6BA8E88D29DCD57B00CBB385E539C5ED6CF
          4B6C52D26D235DFEF74F253FF33F9B6AC7243A0F42B0EFE1F84D1C68FBD5FDE9
          F1D9BB268CD2DBFF00DBF14B49A67EED1F763C36EF633AEA1AEBCA32D6340000
          0000000000000000000000000000000000000000000000098DE9963AE8CF7835
          96D76EBC5B6B85F2237D35D9CFE53131EB96BC6DADA95D7DFF002F5378D396C2
          F14D5AFD53AC7AE61A95CC3C25DD7ECDA41695C6CAE29AB765FA2E7769CECC01
          803D000000000000000000000000000000000000000000000000000000000000
          00003616C8FE537EFB94FADAF5B0B647F29BF7DCA7D6CD383DF88AEFDF3E52A3
          78F652D9B1B9288DC9754C2D40000002843683CF0319F28369D7E17DEA10DA0F
          3C0C67CA0DA75F8134BE5CAFCECAE9E3E475E95FBD1DCC28232BF3B2BA78F91D
          7A57EF4773012C8010000000C6ADC88DC9AB7223700000000000000000000000
          00000009D241069AB2D20D2201111D29D21200000899D11C7A5F9F8BE60C1B03
          BBD57AC5AFF6376B3A235D6D2A88FD3A5F169694595335573943EA9A6AAE78B4
          C672FD0E343F95E6FB75BAD9556D79B7A2CACE88D6AAAB988888FB5A6B35F087
          B8DDAAAEED956E537AAE3922DEDBFA6CFF0028DF2D3F9933B667CD76B35E338A
          DB5AD9CCEB16313C5B3A7ECA63FE58462FA7987DC33B3BBFF52AF96A8FAFA32E
          C3342F10BF655DB7F4E9F9EDFA7AB7CE6DDBD656C166BBBE0DC6C56F34EB11EF
          73A5944FD75FCFF96AD359AB6AF9CF35CD56379C466E974ABFFA7BAEB45331FF
          00F94EFABF39D3EA78EE54B58E2DA5F89E2D9D3557C4A27A29D5F5E996C4C2F4
          530EC332AA29E3D7D756BFA46C8469CA9062EC92350000000000000000000000
          000000FAB08C3ADB18C52EB855DE27DF2F76D4D8D3C9BB59D35FCB7BE56CFD80
          65D8C4F36D78C5B59EB6586D971A9998E4F7CAB923F8D573C1AE156257FB2BAC
          7E69D7DDB6772DD8BDFA30EB95A5E67F2C6AEFE8DEE89C1B0DB1C270DBAE1B77
          B3E2D95DACA9B2A23A222221F74EED134F730C6AD7574D59D11674C514EC8D4E
          79AAA9AE66A9DB200FB400000000000000000000000000000000000000000000
          0000000227E6FB59C6E612CE3703F0B3A5D66F796311B2D359A6C66D23EDA7FA
          BFE1A3235D1D137DB1A6F375B6BBD7DCDA51344FD931A39E6D689B3B4AACAA8D
          268AA6263A25A1785FBA716F576BD47E6A669FA4E7FABDF739D534B101A71EC0
          000000000000000000000000000000000000000000000000000000000000001B
          0B647F29BF7DCA7D6D7AD85B23F94DFBEE53EB669C1EFC4577EF9F2951BC7B29
          6CD8DC9446E4BAA616A0000001421B41E7818CF941B4EBF0BEF5086D079E0633
          E506D3AFC09A5F2E57E76574F1F23AF4AFDE8EE6141195F9D95D3C7C8EBD2BF7
          A3B9809640080000006356E446E4D5B911B8000000000000000000000013A4CA
          62018EF4C53D29D21208D212000319AA239419226746136B4D31ACEE878CCD9B
          5BC9D95E2BB2B7C422F57AA7FD0BBCC5756BF5CEE8796F77DBBDC6CF95BC5714
          D3D732AF76BADB5F2BE4EC299AA7AA2337B59AE21E7F3267BCB195ECAAAB16C5
          2CACAB88E4B289E3573F9434266ADBB66AC6F8F61844C61776AB923DEE75B498
          FAEAF9BF26B7BCDE2F37CB6AADEF36F5DADA553ACD55D53333FAB5DE2DC22D85
          8E76787D1C79FEE9D51E11B659CE19A0778B6CABBF55C48EA8D73E90DC19AB84
          2E21789AEEB95EE7176A27922DEDA35AF4E988F99AA716C6F17C76F137BC5F10
          B7BD5A553AEB695CCC47D91F33E1D12D6B89E3D8862D56779B4998EAD91F46C2
          C3B04B8E174C45DECE227AF6CFD51A241665D801200000000000000000000000
          0000000226748974F6C372E4E0D936C6F5694696D8855378AB5E89E4A7F873A6
          5BC1ED71EC7AE3845953354DEADA9A27EEEBCBFC6AECBC3AE745C6E76174B1A2
          29A2C68A68A623A22346CEE0DF0EE52DED2FD546AA7EEC77CEDDDE6D75A7F7FE
          258D9DCA9FCD3C69EE8D9BFC9F56E8DCC5954C5B89AB00000000000000000000
          00000000000000000000000000000000000654EE629A677C022A8D625A1734DD
          7E0799311BBE9A445E2BAA23EAABFAA3D6DF9313A4C34DED36E9F07CD15DA69C
          978B1A2D3F3EE7FF008C354F0B575E5709B3B78FC95C7D26263CF27AEE939579
          3CA084B9DD700048000000000000000000000000000000000000000000000000
          0000000000003616C8FE537EFB94FADAF5B0B647F29BF7DCA7D6CD383DF88AEF
          DF3E52A378F652D9B1B9288DC9754C2D40000002843683CF0319F28369D7E17D
          EA10DA0F3C0C67CA0DA75F8134BE5CAFCECAE9E3E475E95FBD1DCC28232BF3B2
          BA78F91D7A57EF4773012C8010000000C6ADC88DC9AB72237000000000000000
          988D4103288E9348E8044529D23A12000000C78F100C98CD70F8714C7B09C16E
          F55EB15BF58DD6CA98D66BB5AE2986A6CD9C21F0BBA4D776CA971AEFB6B1FEBD
          B6B45947D711BEAFE3ED5AB12C6AE38553C6BD5A447CB6CFD170B86157CC4EAE
          2DD6CE6AF9F47D763715BDF2C2ED6555B5BDA536767444D555554E914C74CCCB
          5B66DDBBE53C0E2BBBE115558B5EA377BD4E96513F5D7F3FE5AB42666CF39A73
          75ACD78D62D6B6967AEB16147F45953FED8E49FCF59FADF83A6BBDACF16E11ED
          AD33B3C3A8E2C7F755B7C236478E6D8186680D14E55E215E7FEB1B3C676CF864
          F699AB6B59C735457636B7E9B9DD6AFF00E9EED334D331F5CEF978CAA66A99AA
          A99999DF320D777CBFDE710B4E52F35CD53F3967B74B8DDAE3472777A2298F97
          EBD600F23D6000000000000000000000000000000000000022776E32CCD8DB7C
          1E72F7C371FBD63D6B671345C6CFDEECE67FEBABFECE8DA6348D1E0B63996FFB
          0324DCBDF28E2DBDF35BCDAEBBFF00AB747E8F79BA9746689E1D186615656731
          F7A638D3DF3FB3426925FF00F88E25696B1B2278B1DD0808E481922C40000000
          00000000000000000000000000000000000000000000000146F9134EF9064D63
          B5DBAC5378C3EF911CB34D76733FA4C7AE5B39E236A775F7ECBD45BC53ACD85B
          D356BD113AC7FCB0ED3DBAFDAB47EF11D311C6FF00F998956BBCE5690D4C0394
          D750000000000000000000000000000000000000000000000000000000000000
          001B0B647F29BF7DCA7D6D7AD85B23F94DFBEE53EB669C1EFC4577EF9F2951BC
          7B296CD8DC9446E4BAA616A0000001421B41E7818CF941B4EBF0BEF5086D079E
          0633E506D3AFC09A5F2E57E76574F1F23AF4AFDE8EE6141195F9D95D3C7C8EBD
          2BF7A3B9809640080000006356E446E4D5B911B800000001311AA62340629E2C
          A748E8482348E84800000226746155AC5313555C911CA6CD63FA30E3C3C7669D
          AC650CAD4D5677BC429B7BCC44E961779E3D5AFD7A72434C66BDBBE66C666BBB
          E0B4C6197799E4AA99E35ACC7DBF37E4C6B16D2BC330989A6D2BE3571F969D73
          E90BF619A3788629313654654FF74EA8FDFC1BEF31678CB5962C66BC6313B1B1
          AB4E4B38AB5AE7EC88E569DCD7C21AF9789AEED952E5163472C45E2DE35AA7EB
          8A7DAD3B7BBD5EAFF6D55E2F978B4B6B5AE75AABAEA9AA67F57F26B1C5F4FEFF
          007ECECEEBFD3A7EB57D7A3C1B130CD07B95D32AEF5FD4ABE91F4E97DF8C63D8
          CE3F799BDE3388DBDEED2677DA57AC47D91BA3F27C1F3EA9182DADADA5BD535D
          A4CCCCF4CEB96656565458531459C44447446A007C2A00000000000000000000
          00000000000000000000000FDAC99825798B3461F84D113316D6D4F1F4F9A88E
          59FE1F89F9373F074CBD16F7FBF664B6B3D69BBD316163331FE6AB7CC7E5EB5E
          B47B0F9C4F12B2BBF4679CF746B59B1FBFFF000DC3AD6DFA72CA3BE75437DDDA
          EF6777B0A2C6CA229A2CE98A6988F9A223487F5AA79620A77237BA569A6298CA
          1A03BC0120000000000000000000000000000000000000000000000000000000
          46F113F37DA0FE8FC0CEF74F86659C42CF4D78B6536911F5D3CBFF000FDE8DCF
          9EFF00634DE2E76F615F2D3694554CFE70F0E27778BDDCED6C27F353547D625F
          54CE5544B9DE129B4A26CAD2AB2ABBAA26699FB610E32AA99A26699E85E63600
          3E40000000000000000000000000000000000000000000000000000000000001
          B0B647F29BF7DCA7D6D7AD85B23F94DFBEE53EB669C1EFC4577EF9F2951BC7B2
          96CD8DC9446E4BAA616A0000001421B41E7818CF941B4EBF0BEF5086D079E063
          3E506D3AFC09A5F2E57E76574F1F23AF4AFDE8EE6141195F9D95D3C7C8EBD2BF
          7A3B9809640080000006356E446E4D5B9111A803288D120C78BF5B2000000000
          63555C57C588E358760F75AAFB8ADF6C2EB614EFAED6D2288FE5F35D74D11355
          53944269A66A9E2D319CBED9AB49D1FCADEF76376B2AADEDED68B3A288D6AAAB
          AB4888FB5A8336F087C1EE9C7BB656B9577EB58E4F845AC4D1651F5C477557F0
          D3B9973E66ACD969338C62B6B5596BAC58D9CF12CE9FB2986138B69E61D87E74
          584F295FCB678CFA32DC3343310BF655DB47274FCF6F847AB7E66CDBAE53C062
          BBBE1D55589DEA9E4E2D8CE9444FD757B1A6334ED7B38E67E358CDF7E0575AB5
          8F79BBEB4EB1F5CEF9789D3EB94B58E2DA6189E2B9D135F128EAA756FDAD8986
          689E1D86E55F178F5F5D5FA46C2AAAAAEA9AABAA6A999D6666794062D333339C
          B26D9AA00100000000000000000000000000000000000000000000000001A4CC
          C447CF3A3AD365797A32EE4AC3EE9551C5B6B5A3E116DAC72F1ABE5E5FCB4873
          6ECF3009CCB9C70DC2AAA38D6555AC5A5B7D5674F2CFAB4FCE1D8363674D3671
          4D3111111A4690DAFC1B61DED6FF00547FAC79CB5970817FD76571A7FF0029F2
          867BA9447226A9E588436CB5A000000000000000000000000000000000000000
          000000000000000000089480CA3731AA98989E5651B898E4944C67190D0599AE
          B373CC37FB09A74D2DEAAA23EA9E5FF97E646E7A9DA55D7E0F99ED2D229D22DE
          CE9AFED9DDFF0010F2EE3CD22BAFD8B16BC5DFFB6BABCF35E2CE78D444802CCF
          B0000000000000000000000000000000000000000000000000000000000001B0
          B647F29BF7DCA7D6D7AD85B23F94DFBEE53EB669C1EFC4577EF9F2951BC7B296
          CD8DC9446E4BAA616A0000001421B41E7818CF941B4EBF0BEF5086D079E0633E
          506D3AFC09A5F2E57E76574F1F23AF4AFDE8EE6141195F9D95D3C7C8EBD2BF7A
          3B9809640080000000000000112091FCE6D38BBF4D3A5E4734ED4F29E54A6AA6
          FD88D9DB5E22392C2C678F5CFE9BBF379AF57CBBDCACE6D6F15C534C74CCE4AD
          77BB5B5EABE4EC299AAAEA88CDEBFDF2227497E2660CE997F2BD84DE319C4AC2
          C223751356B5D5F6531CB2D0B9B76F598F199B4B0C0AC69C36EF56B115F756B3
          1F6EE86B3BD5F2F7885BD57ABF5E6D6DEDAB9E5AED2B9AAA9FCE5AF315E116ED
          619D9E1F4F1EAEB9D54FACB39C3340EF36F9577EAB894F546B9F48DEDCD9B784
          55E2DE6BBAE52C3A2CA9D748BCDE6359FCA8F6CFE4D4B8CE61C6F315E66F98DE
          276F7CB5F9A6D2BE4A7EC8DD1F943F392D698A6906218BD5FF00EAB4998EA8D5
          1F4E9F16C2C3702B8E151FFE7A233EB9D73F5F447D49059A75ED5DB288D80024
          00000000000000000000000000000000000000000000000000046BA6F494D355
          754534C6B3331111F59119CE50899888CE5BC7838E5D988C4733DB51CB3A5D2C
          2663ECAABFFE3FCB7AD3BB95E6B67997BB18CA18661155114DA5958C556DD336
          9572D5FCCCBD2CC690E94D1CC3BF85E1B65779DB9673DF3AE5CFB8E5FE712C42
          D6F1D133947746A844EF017C5A80000000000000000000000000000000000000
          00000000000000000000001953B8AB74B1A37CB306AFDAD5D78B78B8DF298EEA
          9AACEA9FD261AFDB5F6A974F7DC0ECEF31FE85B44CFD93C8D50E5EE126EBF66D
          21B5AA365714D5BB2FD173BB4E767000C0DE8000000000000000000000000000
          0000000000000000000000000000000001B0B647F29BF7DCA7D6D7AD85B23F94
          DFBEE53EB669C1EFC4577EF9F2951BC7B296CD8DC9446E4BAA616A0000001421
          B41E7818CF941B4EBF0BEF5086D079E0633E506D3AFC09A5F2E57E76574F1F23
          AF4AFDE8EE6141195F9D95D3C7C8EBD2BF7A3B980964008000000018D5571419
          31AAAD1F16218C5C309BB557CC4AFB6376B0A37D76B5C531FCB55E6DE10B83DC
          38F74CB574AAFF006D1C9EFD5FF4D947D71F3CFF000B5E238CDC70BA38D7AB48
          A7E5D33E0F7DC30BBE6275716EB67357CFA3EBB1B72DAF765614556B6D69459D
          14C6B355531111F9B5EE6ADB9654CBF15D85CED7FB4AF54EB1C4B19FE989FAEA
          682CC9B41CD59AABABFB5313B48B299E4B1B39E2D11F946F79CD356B5C5B847A
          EBCECF0EA328FEEAB6F847AB60617A034D395788579FFAC7EB3E8F759AB6C79B
          F337BE58D17AF805D6BFF46EF3A4E9F5D5BE5E1EAAAAAEA9AEBAA6AAAA9D6666
          759996296B9BEE237AC4ABE52F55CD53F3F4E867B73B85DAE1472776A2298F97
          FF006B4689078DEC000000000000000000000000000000000000000000000000
          0000000000001EBB65197BB23CF387DDABA38D6176ABE156FD1C5A39623F3AB8
          B0F2133A72B7F7073CBB376C2AFD98EDACFF00AEF969161653A72F128DFF00AD
          5EA645A29877F13C5ACACA7F0C4F1A7BA35F9B1FD27BFF00F0FC32D2B8DB31C5
          8EF9D5BA35B74514F242667E629E48E544EF7473438000000000000000000000
          00000000000000000000000000000000000000000269DF2C9846F660F3F9E2E9
          F0ACB37FA34D669A38F1F6C72B473A1B13B1A6F171BC58D51AC5765547F0E7BB
          5B39B2AEBB29DF45534CFE4D07C2EDD7897BBBDEA3F35331F49FDDEFB9CEA984
          088DC969E7B00000000000000000000000000000000000000000000000000000
          000000006C2D91FCA6FDF729F5B5EB616C8FE537EFB94FAD9A707BF115DFBE7C
          A546F1ECA5B36372511B92EA985A80000005086D079E0633E506D3AFC2FBD421
          B41E7818CF941B4EBF02697CB95F9D95D3C7C8EBD2BF7A3B98504657E76574F1
          F23AF4AFDE8EE60259002000044A58D5B81F8F98B36E0395AEDF0AC7314B0BAD
          33AF169AE7FAABFAA9A63967F269ECD7C232DAD62BBAE53C362889D69F84DE63
          59FB69A2393F5D7EC470958FFF009382CF4D169EB86926A2D30D2EC42E77DAEE
          17598A29A72D7D339C67E0D9BA2DA2D71BE5D28BEDE73AA673D5D1194E5E2FD2
          C6B31E3998AF337AC6714BC5EAD26758E3D7C94FD94EE8FCA1F9A91AC2D6DAD2
          DEB9B4B4AA6667A65B1ECAC6CEC298A2CA98888E880053540000000000000000
          000000000000000000000000000000000000000000000000006565636B79B7B3
          BB5851C7B4B5AA28A298F9EA99D223F9764E4DC0ECF2EE5AC3F07B3A7E4D614D
          354E9BEAD35AA67EB99D5CDDB18CBDFDBD9E2EB5DAD9F1AC2E1ADE6BE4E4D639
          29FE675FC9D5944690DC3C1B61DC4B0B4BF551AEA9E2C7746DDED55A7F7FE52D
          ECEE74CEAA6339EF9FD8AA748D1055CB2367B5E0000000000000000000000000
          000000000000000000000000000000000000001AE92CDFCE7E6FB59C6E0635C4
          4C4B41E64BB45CB1DBF5DB4D38B6F54FEBCBFF002DFD31C92D31B47BAFC1F33D
          AD71BADA8A6BFCDA9F85ABA72B85D95E23F257BA625EBBA5595730F2C9073D2E
          0000000000000000000000000000000000000000000000000000000000000361
          6C8FE537EFB94FADAF5B0B647F29BF7DCA7D6CD383DF88AEFDF3E52A378F652D
          9B1B9288DC9754C2D40000002843683CF0319F28369D7E17DEA10DA0F3C0C67C
          A0DA75F8134BE5CAFCECAE9E3E475E95FBD1DCC28232BF3B2BA78F91D7A57EF4
          773012C801000031AB7326356E112D0DC25BE5182FDCB4F5C348E8DDBC25FE51
          82FE1DA7AE1A4DCF5A6DEFBB6F0FF986F2D0FF0073D978F9C8031464E0000000
          0000000000000000000000000000000000000000000000000000000000022652
          FEF70B95B6237DB0B85DE35B4BC5A53674C7D733A3EA8A2AB4AE28A76CEA7CD7
          5D3674CD756C8D6E81E0F797BE01972DF1CB4A34B4C42D34A6663FD3A7923F9D
          65B7A9E4A5F9796F07B2C1704B9617654F168BB58D367A7D711CAFD49E48D1D3
          582DC230CB8D95DA3F2C467DFB677B9E715BE4E217CB4BCCFE699CBBBA372397
          E701745BC0000000000000000000000000000000000000000000000000000000
          000000009651B98B2A77013CAD5FB5BBB4517CB95EE2392AA2AA27EBE5D5B45E
          136AD75F7DC12CAF3A72D8DB47F31A30CD3FBB7DAF47EF14F4D31157D26255AE
          F395A43550884B95575000000000000000000000000000000000000000000000
          0000000000000001B0B647F29BF7DCA7D6D7AD85B23F94DFBEE53EB669C1EFC4
          577EF9F2951BC7B296CD8DC9446E4BAA616A0000001421B41E7818CF941B4EBF
          0BEF5086D079E0633E506D3AFC09A5F2E57E76574F1F23AF4AFDE8EE6141195F
          9D95D3C7C8EBD2BF7A3B98096400800018D5B9931AB7089685E12FF28C17F0ED
          3D70D26DD9C25FE5182FE1DA7AE1A4DCF5A6DEFBB6F0FF00986F2D0FF73D978F
          9C8031464E000000000000000000000000000000000000000000000000000000
          000000000000362EC2F2F7F6CE72A2FF006967C6B1C3689B69D63FCD3C94B5CC
          BA5760B97A9C2B284E276B6734DB62569EF9ACFF00D11C94FF00CB2CD0BC37F8
          8E2D67C68CE9A3EF4F86CDEC5F4BF10FB0E195C533F7ABFBB1E3B77368D9EE27
          96534F25288D7E77423478000000000000000000000000000000000000000000
          0000000000000000000000009A3E7414EF9066F399EEE9F0ACB37DA698D668A7
          DF23F297A37C78AD845E70FBCDDE635F7CB2AA9D3ED85BF16BB45F2E36D613F9
          A9AA373EA99CAA8973CC4CEEE8649B5A3DEED2AB398E5A6669FD18B8D2BA6689
          9A67A178480F9480000000000000000000000000000000000000000000000000
          00000000D85B23F94DFBEE53EB6BD6C2D91FCA6FDF729F5B34E0F7E22BBF7CF9
          4A8DE3D94B66C6E4A23725D530B50000000A10DA0F3C0C67CA0DA75F85F7A843
          683CF0319F28369D7E04D2F972BF3B2BA78F91D7A57EF47730A08CAFCECAE9E3
          E475E95FBD1DCC04B20040000C6ADCC98D5B844B42F097F9460BF8769EB86936
          ECE12FF28C17F0ED3D70D26E7AD36F7DDB787FCC379687FB9ECBC7CE4018A327
          0000000000000000000000000000000000000000000000000000000000000000
          007D982E1B6D8CE2F73C2AEF4CD5697AB6A6CE223EB9767611865861786DDB0F
          B1A2228BB5953674E9F5468E76D8065EFED2CD7698C5A59F1ACB0DB3D626777B
          E55C91FF0032E95A63486E9E0E70EE42E55DF2B8D75CE51DD1FBB5169E621CBD
          F69BA533AA88D7DF3FB644E91C9084CEF4363B04000000000000000000000000
          000000000000000000000000000000000000000000131BD046F066C2D2989866
          8AB4D3951319C6439FF305D66E78DDF6ED31A4516F5C47EAF81E9768975F8366
          8BC4FCD6B4D3691F5EB1CAF34E39C7AEBF62C52F161FDB5D5E6BC59CF1A98005
          A5F6000000000000000000000000000000000000000000000000000000000361
          6C8FE537EFB94FADAF5B0B647F29BF7DCA7D6CD383DF88AEFDF3E52A378F652D
          9B1B9288DC9754C2D40000002843683CF0319F28369D7E17DEA10DA0F3C0C67C
          A0DA75F8134BE5CAFCECAE9E3E475E95FBD1DCC28232BF3B2BA78F91D7A57EF4
          773012C801000031AB7326356E112D0BC25FE5182FE1DA7AE1A4DBB384BFCA30
          5FC3B4F5C349B9EB4DBDF76DE1FF0030DE5A1FEE7B2F1F3900628C9C00000000
          0000000000000000000000000000000000000000000000000000000425FA5967
          06B5CC1982E18358C72DEADE8B39FAA9D6359FCA3555B1B1AEF1694D951B6A98
          88F153B6B5A6C2CEAB5AF644673DD1B5D1DB0ECBBFD8992AC2F36D65A5BE2354
          DE6A99DFC5DD4C7E9CBF9B63EEA791FC2E174B1B95D2CAE96144536763674D9D
          111F35311A43FB55D0E9DC36E74DC2E96776A7653110E75BF5EAABF5E6BBC55B
          6A999400F73CA000000000000000000000000000000000000000000000000000
          000000000000000227E64A2419C1546B046E277226721AB76B574E25FEE77C88
          D22BB39A3F389D7FE5E09B4F6AB759B4C1EEF7B88D7DE2DB4FCA63FECD570E5D
          E11EEBF66D20B5988FC71157D63D735CEED39D9C24060AF40000000000000000
          000000000000000000000000000000000000000000D85B23F94DFBEE53EB6BD6
          C2D91FCA6FDF729F5B34E0F7E22BBF7CF94A8DE3D94B66C6E4A23725D530B500
          00000A10DA0F3C0C67CA0DA75F85F7A843683CF0319F28369D7E04D2F972BF3B
          2BA78F91D7A57EF47730A08CAFCECAE9E3E475E95FBD1DCC04B20040000C6ADC
          C98D5B844B42F097F9460BF8769EB86936ECE12FF28C17F0ED3D70D26E7AD36F
          7DDB787FCC379687FB9ECBC7CE4018A327000000000000000000000000000000
          000000000000000000000000000000000436E7078CBBF0DC7AF7986DACB5B3B8
          59C59594CC7FA95FCF1F65313E7351CE9F3BAB763997632E646B8D95AD9F16DE
          FB1F0CB6D77EB5E9311F95314B34D03C37EDD8AC5AD51F76CE38DE3D1BD87E9B
          5FFEC786CD9533F7AD272F0E9FFEF9BDD51A69C8899D66597CCC5BF1A5C00000
          0000000000000000000000000000000000000000000000000000000000000000
          001953B92C699DF0C81E6F3EDD3E1595EFB1A72D9C45A47E531AFF001AB496B1
          3F33A0F18BBC5EB0BBD5D669D7DF6C6BA3F58973F574CD35D54EED2661A0385D
          BA459DFAEF79FEEA663E93FBAE1739CE26100350BD6000000000000000000000
          0000000000000000000000000000000000003616C8FE537EFB94FADAF5B0B647
          F29BF7DCA7D6CD383DF88AEFDF3E52A378F652D9B1B9288DC9754C2D40000002
          843683CF0319F28369D7E17DEA10DA0F3C0C67CA0DA75F8134BE5CAFCECAE9E3
          E475E95FBD1DCC28232BF3B2BA78F91D7A57EF4773012C801000031AB7326356
          E112D0BC25FE5182FE1DA7AE1A4DBB384BFCA305FC3B4F5C349B9EB4DBDF76DE
          1FF30DE5A1FEE7B2F1F3900628C9C00000000000000000000000000000000000
          00000000000000000000000000403F73256015667CD586E0B14CCD16F6D4FBEF
          D5671FD557F113FC3B22C2CACECACE9B3A2988A698888888D348683E0E7977DF
          AF988E67B6A234B1A62EB613F5CE935CFF00ED8FCE5BFE88D296F2E0F70EFB26
          1B378AE3EF5A4E7E11AA3F569AD38BFC5EB11E4299FBB671978CEDFD0AB97910
          6BACC8CF98600000000000000000000000000000000000000000000000000000
          0000000000000000000146F966C69DEC81FCED238D4E9A6F680C76EB372C66F9
          75D3FF002EDABA63ECD791D05546B0D2BB42BAFC1B355EA62348B68A6D23F388
          D7F9D5A9785CBA72986D8DE72FC15E5F58FD9EBB9CE554C3CD00E7C5C0000000
          0000000000000000000000000000000000000000000000000006C2D91FCA6FDF
          729F5B5EB616C8FE537EFB94FAD9A707BF115DFBE7CA546F1ECA5B36372511B9
          2EA985A80000005086D079E0633E506D3AFC2FBD421B41E7818CF941B4EBF026
          97CB95F9D95D3C7C8EBD2BF7A3B98504657E76574F1F23AF4AFDE8EE60259002
          00006356E64C6ADC225A1784BFCA305FC3B4F5C349B767097F9460BF8769EB86
          9373D69B7BEEDBC3FE61BCB43FDCF65E3E7200C5193800000000000000000000
          00000000000000000000000000000000000000008E599888E59925E9B66D97E7
          32E72C3B0FAA8E359516B16F6DF728E5E5FCF48FCDE9B9DDABBE5E28B0A36D53
          11F579EF779A6E7615DE2BD94C4CFD1D27B2FCB9196B25E1F70AA98A6DABB3F7
          EB6FBF5F2CFAF4FC9EBB752C6C68A68B38A698D2223488E865572F23A7AE976A
          2E76145859ECA62223C1CEB78B6AAF36B55B57B6A999FAA007A5440000000000
          000000000000000000000000000000000000000000000000000000000000008D
          ECD86BA68CC11546B0D59B5ABAF1312B9DF22392D6CA68F3675FFE4DA73B9E07
          6AF74F7CC22EB7B8E5F7AB7E24FD51544FB2184F08776FB568F5E232FC3955F4
          98FD15AEF395A435700E585D4000000000000000000000000000000000000000
          0000000000000000006C2D91FCA6FDF729F5B5EB616C8FE537EFB94FAD9A707B
          F115DFBE7CA546F1ECA5B36372511B92EA985A80000005086D079E0633E506D3
          AFC2FBD421B41E7818CF941B4EBF02697CB95F9D95D3C7C8EBD2BF7A3B985046
          57E76574F1F23AF4AFDE8EE6025900200006356E64C6ADC225A1784BFCA305FC
          3B4F5C349B767097F9460BF8769EB869373D69B7BEEDBC3FE61BCB43FDCF65E3
          E7200C5193800000000000000000000000000000000000000000000000000000
          00000021BD783965DE2D8E2199EDA8D26D27E0F61331F3472D531F6CE91F9346
          59D9D56B694D959D3335D754534C47CF33B9D859032FD396F2A61F8644695D9D
          8C5569F5D73CB32CFB83CC3BED788CDEAA8D5671BE76306D3BBFFD9EE3176A67
          5DA4EE8DBBF27A3A792372279594CF2316F188CB534FC0025200000000000000
          000000000000000000000000000000000000000000000000000000000089671B
          98B28DC09799DA0DDBE11956FBA46B5594536B1FEDAA267F8D5E99F0E31758BF
          6197BB9CFF00AF635D9FEB130B6631758BE61F6F779FCD4551B9F7673C5AA25C
          FBBB784CF4C8E36AA329C9780040000000000000000000000000000000000000
          0000000000000000003616C8FE537EFB94FADAF5B0B647F29BF7DCA7D6CD383D
          F88AEFDF3E52A378F652D9B1B9288DC9754C2D40000002843683CF0319F28369
          D7E17DEA10DA0F3C0C67CA0DA75F8134BE5CAFCECAE9E3E475E95FBD1DCC2823
          2BF3B2BA78F91D7A57EF4773012C801000031AB7326356E112D0BC25FE5182FE
          1DA7AE1A4DBB384BFCA305FC3B4F5C349B9EB4DBDF76DE1FF30DE5A1FEE7B2F1
          F3900628C9C00000000000000000000000000000000000000000000000000000
          00000403D96C9B2F76459D6E5635D1C6B1BACFC26D758E4D29DDFCBAD2CE34A6
          223768D35C1D72E7C1F08BE661B5A3FAEF75FBD59CE9FE4A77FF002DCD4F2437
          DE8261BF60C2A9B4AA3EF5A4F1BC3A1A4B4C710FB6E2755113F768FBB1FAEF2A
          DE8066AC50000000000000000000000000000000000000000000000000000000
          000000000000000000000654EE629A3E7FB41930B48D634D19B1AB722622A8CA
          4D8E7DC6EEBF03C62FB7488D22CADEBA623EAE34E9FC3E27A4DA15D7E0B9AEF7
          311A45B4516B11F6D3113FCC4BCE38DF1CBACDCB12BC5DFF00B6BAA37AF344F1
          A989005ADF400000000000000000000000000000000000000000000000000000
          03616C8FE537EFB94FADAF5B0B647F29BF7DCA7D6CD383DF88AEFDF3E52A378F
          652D9B1B9288DC9754C2D40000002843683CF0319F28369D7E17DEA10DA0F3C0
          C67CA0DA75F8134BE5CAFCECAE9E3E475E95FBD1DCC28232BF3B2BA78F91D7A5
          7EF4773012C801000031AB7326356E112D0BC25FE5182FE1DA7AE1A4DBB384BF
          CA305FC3B4F5C349B9EB4DBDF76DE1FF0030DE5A1FEE7B2F1F3900628C9C0000
          000000000000000000000000000000000000000000000000000006777B0B5BDD
          E2CAED634CD55DAD7145311D333A307BBD8B65DFEDECED77B4B4A35B0B844DE6
          D26639358EE63F5D1EEC32E556237BB3BAD1F9A623D773C588DF29B85D2D2F15
          7E589FDB7BA4B27E076597B2EDC308B3A74F8358D34D5F5D5A6B3FCBF66A99D3
          91167BB42675974ED8595361674D951B222223C1CEF696955AD736956D99CC01
          55F0000000000000000000000000000000000000000000000000000000000000
          000000000000000269F9D098DE0C8113AE9C80D57B59BAF1314B9DEE2392D6CA
          AA27EDA675FF00E4F08DA3B5BBAF1F08BADEE98E5B2B7E2CFD9544FF00CC4357
          396B845BAFD9B486DA72FC5955F58F5895D2EF39D9C003075700000000000000
          00000000000000000000000000000000000000001B0B647F29BF7DCA7D6D7AD8
          5B23F94DFBEE53EB669C1EFC4577EF9F2951BC7B296CD8DC9446E4BAA616A000
          0001421B41E7818CF941B4EBF0BEF5086D079E0633E506D3AFC09A5F2E57E765
          74F1F23AF4AFDE8EE6141195F9D95D3C7C8EBD2BF7A3B98096400800018D5B99
          31AB7089685E12FF0028C17F0ED3D70D26DD9C25FE5182FE1DA7AE1A4DCF5A6D
          EFBB6F0FF986F2D0FF0073D978F9C8031464E000000000000000000000000000
          000000000000000000000000000000899746F07ACB9370CB56D8E5B51A5AE236
          9A51C9FE9D3C91FACEBFA39EAE172B5C4AFD77C3EC299AAD6F1694D9D111D333
          A3B3B2E613638160D73C26C22228BAD8D367C9F3CC472CFE73ACB63F0718772F
          7CAEF95C6AA2328EF9F48601A7D7FE4AEB45CE99D75CE73DD1FBBF462348426A
          D74E44374B530000000000000000000000000000000000000000000000000000
          0000000000000000000000000006BA4C089DF00FE8003CC6D0EEBF0ACAD7C888
          E5B3E2DA47FB6627DAD2DA6910E80C6EED17CC2AF7749FF56C6BA7F5873FCEB1
          33130E7EE176E9C9DFEC2F31F9A9CBE93FBAE1749CE998006A37AC0000000000
          000000000000000000000000000000000000000000006C2D91FCA6FDF729F5B5
          EB616C8FE537EFB94FAD9A707BF115DFBE7CA546F1ECA5B36372511B92EA985A
          80000005086D079E0633E506D3AFC2FBD421B41E7818CF941B4EBF02697CB95F
          9D95D3C7C8EBD2BF7A3B98504657E76574F1F23AF4AFDE8EE602590020000635
          6E64C6ADC225A1784BFCA305FC3B4F5C349B767097F9460BF8769EB869373D69
          B7BEEDBC3FE61BCB43FDCF65E3E7200C51938000000000000000000000000000
          0000000000000000000000000000899D01B2360F972719CE54E236D471AC30BB
          39B7E58D63DF279288F5CFE4E9FA2346B0D81E5C9C232746296B67316F8ADA4D
          BF2C72C59C7F4D11FC4CFE6D9F1AC472C3A1342F0DFE1D84D9F1A3EF57F7A7C7
          66EC9A2B4AEFFF00C4314B4AA27EED1F763C36EFCC99E54032C6380000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00001200CB7A511B920FE76B4C554CC4C724C68E7EC6AED374C5EF976DDEF76D
          5C47D9AF23A0EADCD27B40BAFC17345EF4A748B5E2DA47E71A7FC351F0BB75E3
          E1F63798FCB565F58F587AEE9395530F3A039F97000000000000000000000000
          00000000000000000000000000000001B0B647F29BF7DCA7D6D7AD85B23F94DF
          BEE53EB669C1EFC4577EF9F2951BC7B296CD8DC9446E4BAA616A0000001421B4
          1E7818CF941B4EBF0BEF5086D079E0633E506D3AFC09A5F2E57E76574F1F23AF
          4AFDE8EE6141195F9D95D3C7C8EBD2BF7A3B98096400800018D5B9931AB70896
          85E12FF28C17F0ED3D70D26DD9C25FE5182FE1DA7AE1A4DCF5A6DEFBB6F0FF00
          986F2D0FF73D978F9C8031464E00000000000000000000000000000000000000
          00000000000000003ECC170AB7C7318B960F778FFC4BE5BD1634CE9AE9ACC44C
          FE51CAF8A5B5383E65CFED3CD16F8E5AD9CCD961765A51AFFF0072BE48FD2227
          F55D305B84E277FB2BAF4553AFBA36EE5B718BF461B71B4BCF4C46AEF9D51BDD
          13855C2ED865C2EF87DCECE28B0BAD95363671D14D31111EA7D552288D21333A
          BA6A8A628A6298D90E7A999AA739400FA4000000000000000000000000000000
          000000000000000000000000000000000000000000000000000268DCC98D1F3C
          32044C6B0D51B57BAFBDE2B75BD453A7BF594D33F94FFDDB5E75D391E036B375
          E3E1B75BDC472D95AF167EC9860FC22DD7ED5A3F6D96DA72ABE92AD779CAD21A
          BC072D2EA0000000000000000000000000000000000000000000000000000003
          616C8FE537EFB94FADAF5B0B647F29BF7DCA7D6CD383DF88AEFDF3E52A378F65
          2D9B1B9288DC9754C2D40000002843683CF0319F28369D7E17DEA10DA0F3C0C6
          7CA0DA75F8134BE5CAFCECAE9E3E475E95FBD1DCC28232BF3B2BA78F91D7A57E
          F4773012C801000031AB7326356E112D0BC25FE5182FE1DA7AE1A4DBB384BFCA
          305FC3B4F5C349B9EB4DBDF76DE1FF0030DE5A1FEE7B2F1F3900628C9C000000
          000000000000000000000000000000000000000000000001133A43A9762196E3
          03C9175B7B4A38B6F88EB7BB4D77E957731E6C439BF2B609699873161F83D113
          3F09B7A69AF4F9A8DF54FE912ECCB8DDECEEB76B3BB595314D1654C514C47CD1
          11A368706D874576D6B7EAA3553F763BE75CB5BF0817FE2D9D95CA9E9FBD3DDB
          21FDA7929426A437035780000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000269DFF006B261AE930CC0797
          DA25D7E1595EF5A472D9716D35E8D25EA1F9B8FDDBE1983DF2ED31AFBE59551F
          C2D78DDDA2F9875BD84FE6A2A8DCFBB39E2D512D0333101544C4CC4C4EB1BC71
          BD51C59C97800400000000000000000000000000000000000000000000000000
          003616C8FE537EFB94FADAF5B0B647F29BF7DCA7D6CD383DF88AEFDF3E52A378
          F652D9B1B9288DC9754C2D40000002843683CF0319F28369D7E17DEA10DA0F3C
          0C67CA0DA75F8134BE5CAFCECAE9E3E475E95FBD1DCC28232BF3B2BA78F91D7A
          57EF4773012C801000031AB7326356E112D0BC25FE5182FE1DA7AE1A4DBB384B
          FCA305FC3B4F5C349B9EB4DBDF76DE1FF30DE5A1FEE7B2F1F3900628C9C00000
          000000000000000000000000000000000000000000000044A5126D1B8383B65D
          F866337DCC36D67AD174B3F79B2998E4E3D5CB3FC69FABA1A88D1E2764396E72
          F649B8D9574C536D79A7E116BAC72EB572E9F943DBF730E8DD14C3BF86615656
          531AE6339EF9682D23BFFF0011C4AD6DA27544E51DD08F9F50191AC800000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000089DF0FE8FE73D2FE803F95AD1C6B3AA99DD31312FEA8AA3587CD
          54C55194913939EB17B0F82E297ABB4C7FE5DB551FCBE57EFE7EBAFC17345EE2
          234F7D98B4FD61F80E37C6AEDF63C46DEC3FB6BAA37AF344E74C4802D8FA0000
          000000000000000000000000000000000000000000000001B0B647F29BF7DCA7
          D6D7AD85B23F94DFBEE53EB669C1EFC4577EF9F2951BC7B296CD8DC9446E4BAA
          616A0000001421B41E7818CF941B4EBF0BEF5086D079E0633E506D3AFC09A5F2
          E57E76574F1F23AF4AFDE8EE6141195F9D95D3C7C8EBD2BF7A3B980964008000
          18D5B9931AB7089685E12FF28C17F0ED3D70D26DD9C25FE5182FE1DA7AE1A4DC
          F5A6DEFBB6F0FF00986F2D0FF73D978F9C8031464E0000000000000000000000
          000000000000000000000000000003F7722E075E63CD787617144D54576D155A
          7DC8E597E13757074CBBC7BCDFB325B596B14445DAC6663E79E5AA617CD1BC3F
          F89E276561D19E73DD1AD65D21BFFF000EC3AD6DA275E59477CB7CDDACE8B1B2
          A2CACE98A69A298A6223E68867514469108F9F5749D3111194340F7802400000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000001946E629A675806489DC94553A40353ED56E9EF58BDDEF711
          C96D65A4FDB12F10D9BB59BAF1EE174BDE9CB676B34CCFD530D64E57E10AEBF6
          5D20B7CB655955F585D6EF571ACE001852B00000000000000000000000000000
          00000000000000000000000D85B23F94DFBEE53EB6BD6C2D91FCA6FDF729F5B3
          4E0F7E22BBF7CF94A8DE3D94B66C6E4A23725D530B50000000A10DA0F3C0C67C
          A0DA75F85F7A843683CF0319F28369D7E04D2F972BF3B2BA78F91D7A57EF4773
          0A08CAFCECAE9E3E475E95FBD1DCC04B20040000C6ADCC98D5B844B42F097F94
          60BF8769EB86936ECE12FF0028C17F0ED3D70D26E7AD36F7DDB787FCC379687F
          B9ECBC7CE4018A32700000000000000000000000000000000000000000000000
          00002226A98A698D66674888F9DD75B30CBD196F26E1F709A34B5AACE2DAD793
          7D5572B9B366B97E732673C3AE1559F1AC68B4F7EB6E4FF253CB2EBDB1A78B44
          531111111F336CF06D876AB5BFD5FF008C79CB5870817FCEBB2B953D1F7A7CA1
          9CCE90C5354A1B5DAD8000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000004D1B909A7E70648480F2BB
          46BAC5E32C5E2AD359B29A6D3F49FF00BB4CB7EE61BB45F306BE5DE7FCF63569
          F6E9AB40CC4C4CD33BE274973E70B975E4F11B1BC47E6A72FA4FEEB8DD273A66
          2520352BD4000000000000000000000000000000000000000000000000000361
          6C8FE537EFB94FADAF5B0B647F29BF7DCA7D6CD383DF88AEFDF3E52A378F652D
          9B1B9288DC9754C2D40000002843683CF0319F28369D7E17DEA10DA0F3C0C67C
          A0DA75F8134BE5CAFCECAE9E3E475E95FBD1DCC28232BF3B2BA78F91D7A57EF4
          773012C801000031AB7326356E112D0BC25FE5182FE1DA7AE1A4DBB384BFCA30
          5FC3B4F5C349B9EB4DBDF76DE1FF0030DE5A1FEE7B2F1F3900628C9C00000000
          0000000000000000000000000000000000000000409B3A2BB5B4A6CA88D6AAEA
          8A63F54C44CCE508998A75CEC6F6E0E397A2CEEF7FCCB6D67FD56B3176B1AA7A
          2396A9F537851B9E7B21E5FA32DE55C3B088A229AECEC62AB5FAED2796AFE65E
          867923474A68EE1F18661B6577E988CE7BE75CB9F71BBF7F12BFDADE3A267577
          46A8400BDAD40000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000002637A113BE01FD0007F2B6A22AB39
          A27962A898973EE2961375C4AF57798D3DEED6A8D3F3742D51AC347E7ABB7C17
          345F69D3FF0032A8B4FD6356A1E176E9C7B8585E23F2D531F58FD9ECBA4FDE98
          7E080D00F78000000000000000000000000000000000000000000000000000D8
          5B23F94DFBEE53EB6BD6C2D91FCA6FDF729F5B34E0F7E22BBF7CF94A8DE3D94B
          66C6E4A23725D530B50000000A10DA0F3C0C67CA0DA75F85F7A843683CF0319F
          28369D7E04D2F972BF3B2BA78F91D7A57EF47730A08CAFCECAE9E3E475E95FBD
          1DCC04B20040000C6ADCC98D5B844B42F097F9460BF8769EB86936ECE12FF28C
          17F0ED3D70D26E7AD36F7DDB787FCC379687FB9ECBC7CE4018A3270000000000
          0000000000000000000000000000000000000044BD9EC8B2F4E62CF171B1AECF
          8D61749F855AF27269469A47E73A43C6BA0B83A65DF8360B7DCC36B67A5A5F6D
          3DE6CA66397DEE8DFF00AD5AF9AC9744B0DFE278AD9D9CC7DDA678D3E1AF7CB1
          ED29BFFF000FC32D2A89FBD57DD8F1FD9B8ACA98888E56533CA534F1637A37BA
          2E1A1E3E60024000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000044EF8480CC446E4822ADDCAD49B5
          5BAC59635637988D22DAC635FB6274F536D57133B9AF76B7759AAE573BDC53DC
          5A5544CFDB1FF660BC23DD7ED5A3D6D96DA72ABE93FBABDDA72B486B301CB8BA
          0000000000000000000000000000000000000000000000000000D85B23F94DFB
          EE53EB6BD6C2D91FCA6FDF729F5B34E0F7E22BBF7CF94A8DE3D94B66C6E4A237
          25D530B50000000A10DA0F3C0C67CA0DA75F85F7A843683CF0319F28369D7E04
          D2F972BF3B2BA78F91D7A57EF47730A08CAFCECAE9E3E475E95FBD1DCC04B200
          40000C6ADCC98D5B844B42F097F9460BF8769EB86936ECE12FF28C17F0ED3D70
          D26E7AD36F7DDB787FCC379687FB9ECBC7CE4018A32700000000000000000000
          000000000000000000000000001120FEB77BBDADEAF16576B0A38F6B6D5C59D1
          4FFD554CE910ECCCA782D8E5DCBF87E0B611C974B0A6CEA9D3BAAB4FEA9FCE75
          9FCDCDDB11CBDFDB99EAED79B5B39AAEF865337AAFA38F1C94479D3AFE4EA6A2
          2222346E2E0DF0EE4EEF697EAB6D53947746DDFE4D51A7F7FE56F16772A67553
          19CF7CFEDE6CAADCC77154CEA36735F000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000000000032A6
          7584B1A373201E53691748B7CAF6F69A6BEF355369FCE9FF002F56FCACC976F8
          66057EBBE9AF1AC2AD23EB88D63D4B463D768BE6196F613F9A8ABC9F7673C5AE
          25A13EC09898E41C733194E4BC00000000000000000000000000000000000000
          00000000000000D85B23F94DFBEE53EB6BD6C2D91FCA6FDF729F5B34E0F7E22B
          BF7CF94A8DE3D94B66C6E4A23725D530B50000000A10DA0F3C0C67CA0DA75F85
          F7A843683CF0319F28369D7E04D2F972BF3B2BA78F91D7A57EF47730A08CAFCE
          CAE9E3E475E95FBD1DCC04B20040000C6ADCC98D5B844B42F097F9460BF8769E
          B86936ECE12FF28C17F0ED3D70D26E7AD36F7DDB787FCC379687FB9ECBC7CE40
          18A327000000000000000000000000000000000000000000000113B92FA70DB8
          5BE2B885DB0CBB53336B7AB5A6CA8FB6674D5F545155A551453B67543E6BAE9B
          3A66BAB643A1783D65CFECFCAD6B8CDB51C5B5C4ED78D4CE9CBEF747253FCF1A
          7F36D988D21F9B97F0CB1C1B09B9E1777A78B6775B1A6CA98FB2347E954E9BC1
          EE34E1B71B2BAD3F9637F4EF73B6257C9C42F76979ABF34E7E1D1B98EBAF286E
          1737880000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000134F27232631BD900FE56D4535D9D5
          4551C9544C4BFAB1AF73E6AA62B8CA473C623779BA5FEF1769DF676B553FA4CC
          3F83F773C5D7E099A2FD67A7775FBE47FBA35FF97E138D316BB4DCEFF6D613F9
          6AAA37AF344E74C4802DEFA00000000000000000000000000000000000000000
          00000001B0B647F29BF7DCA7D6D7AD85B23F94DFBEE53EB669C1EFC4577EF9F2
          951BC7B296CD8DC9446E4BAA616A0000001421B41E7818CF941B4EBF0BEF5086
          D079E0633E506D3AFC09A5F2E57E76574F1F23AF4AFDE8EE6141195F9D95D3C7
          C8EBD2BF7A3B98096400800018D5B9922ADDB81A1384B7CA305FB969EB86936F
          CE121855B5B6198662D674CCD176B5AACAB9E88AA2263D52D05F6B9FB4E6CEAA
          31BB59AA36C44C7D21BBB432D29AF08B38A7A3389FAA40620CA8000000000000
          0000000000000000000000000000000006CAD82E5E9C5B38FF0069DAD9F1AC70
          DB39B4D66393DF2AE48FE356B49E474E6C1F2E461193ACEFF6D67A5B6255CDBC
          CCEFE26EA7F865DA1586FF0010C5A89AA3EED1F7A7C366F62DA617FF00B0E195
          C533F7ABFBB1E3B77364D9E9099DE988A69DD087413480000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000001F3C337F39DF0FE802262261289DC0D47B54BACD8E3B6378D34
          8B7B08999FAE99989FE3478C6CADADDD666E970BE69FF9769559CCFDE8D7FF00
          8CB5AB957840BA4DD3486F1196AAA62AFAC47EABADDEAE359C0030C560000000
          000000000000000000000000000000000000000001B07647F29BFF00DCA7D6D7
          CD97B24B95745DAFB7FAA3FA6BAA2CE9FAF4E59FF8671C1CD9D569A456134C6C
          E34CF7652A3789CACE5B12372511B92EA55A80000005086D079E0633E506D3AF
          C2FBD421B41E7818CF941B4EBF02697CB95F9D95D3C7C8EBD2BF7A3B98504657
          E76574F1F23AF4AFDE8EE602590020000469AA407E2E6AC02E799B04BDE0D7CA
          7FF0EF347178D1BE8ABE6AA3EC9724E6BCAD8AE51C5AD70BC4EC2AA668999B3B
          4D3FA6D69D792A89767CD3156F7E3664CAB81E68B94DC31BC3ECEF1673ACD335
          47F5513D313BE2588E94E8B59E9059C5744F16D69D93D71D52C9747348ED303B
          49A6A8E359D5B63ABE70E3089D52DF58A706EC3AD6D66BC231EB6BBD133C9676
          D6715E9F9C3F3FFBB5DFBE6CCB63E865AAAD341F1BB3AB8B1659FCE263D5B2A8
          D33C1EBA6266D263BE27D1A546EAFEED77FF00092C7D0C9FDDAEFF00E1258FA1
          97C732B1BEC77C7ABEF9E18376BBA7D1A546EAFEED77FF00092C7D0C9FDDAEFF
          00E1258FA1939958DF63BE3D4E7860DDAEE9F46951BABFBB5DFF00C24B1F4327
          F76BBFF84963E864E65637D8EF8F539E18376BBA7D1A546EAFEED77FF092C7D0
          C9FDDAEFFE1258FA1939958DF63BE3D4E7860DDAEE9F46951BABFBB5DFFC24B1
          F4327F76BBFF0084963E864E65637D8EF8F539E18376BBA7D1A546EAFEED77FF
          00092C7D0C9FDDAEFF00E1258FA1939958DF63BE3D4E7860DDAEE9F46951BABF
          BB5DFF00C24B1F4327F76BBFF84963E864E65637D8EF8F539E18376BBA7D1A54
          6EAFEED77FF092C7D0C9FDDAEFFE1258FA1939958DF63BE3D4E7860DDAEE9F46
          951BABFBB5DFFC24B1F4327F76BBFF0084963E864E65637D8EF8F539E18376BB
          A7D1A546EAFEED77FF00092C7D0C9FDDAEFF00E1258FA1939958DF63BE3D4E78
          60DDAEE9F46951BABFBB5DFF00C24B1F4327F76BBFF84963E864E65637D8EF8F
          539E18376BBA7D1A546EAFEED77FF092C7D0C9FDDAEFFE1258FA1939958DF63B
          E3D4E7860DDAEE9F46951BABFBB5DFFC24B1F4327F76BBFF0084963E864E6563
          7D8EF8F539E18376BBA7D1A546EAFEED77FF00092C7D0C9FDDAEFF00E1258FA1
          939958DF63BE3D4E7860DDAEE9F46951BABFBB5DFF00C24B1F4327F76BBF7CF9
          92C7D0C9CCAC73B1DF1EA73C306ED774FA352601855AE378D5CF09B0A666ABD5
          B5367C9D133CBFC3B370BB9D961F72B0B8D8D314D161674D9D311D111A358E40
          D894E4FCC3678E5F315B3BE7BD515459D34D131C5AA7E7E56D8A69888E486CCD
          08C02DF06B0B4AEF54E56954ECF947AB5E698637638B5E28A6ED567674C776B9
          DA998D51A4B219D31063A49A4B2018E92692C8063A49A4B2018E92692C8063A4
          9A4B2018E92692C8063A49A4B2018E92692C8063A49A4B2018E92692C8063A49
          A4B2018E92692C8063A49A4B2018E92692C8063A49A4B2018E92692C8063A49A
          4B2018E92692C8063A49A4B2018E92692C8063A49A4B2018E92692C8063A49A4
          B2018E92692C8063A49A4B2018E92692C8063A49A4B2018E92692C8063A49A4B
          2018E92692C8063A49A4B2018E92692C8061C5966002277240792DA5DD62F195
          ADED229D66C2D28B588FCF4F54CB4E37FE3986C62D85DE70FE3451F08B39A22A
          9F9A6774FEBA3C0C6C92F1F3E2F673FF00EB9695E11344B12C6712A2F570B3E3
          47162275C46B89F9BDB76B6A68A72A9AF86C2ED4778EFB59FA393B51DE3BED67
          E8E580FF002F348BFC7DF1EAF472F67D6D7A36176A3BC77DACFD1C9DA8EF1DF6
          B3F4727F2F348BFC7DF1EA72F67D6D7A36176A3BC77DACFD1C9DA8EF1DF6B3F4
          727F2F348BFC7DF1EA72F67D6D7A36176A3BC77DACFD1C9DA8EF1DF6B3F4727F
          2F348BFC7DF1EA72F67D6D7A36176A3BC77DACFD1C9DA8EF1DF6B3F4727F2F34
          8BFC7DF1EA72F67D6D7A36176A3BC77DACFD1C9DA8EF1DF6B3F4727F2F348BFC
          7DF1EA72F67D6D7A36176A3BC77DACFD1C9DA8EF1DF6B3F4727F2F348BFC7DF1
          EA72F67D6D7A36176A3BC77DACFD1C9DA8EF1DF6B3F4727F2F348BFC7DF1EA72
          F67D6D7A36176A3BC77DACFD1C9DA8EF1DF6B3F4727F2F348BFC7DF1EA72F67D
          6D7A36176A3BC77DACFD1C9DA8EF1DF6B3F4727F2F348BFC7DF1EA72F67D6D7A
          36176A3BC77DACFD1C9DA8EF1DF6B3F4727F2F348BFC7DF1EA72F67D6D7A3617
          6A3BC77DACFD1C9DA8EF1DF6B3F4727F2F348BFC7DF1EA72F67D6D7A36176A3B
          C77DACFD1C9DA8EF1DF6B3F4727F2F348BFC7DF1EA72F67D6D7A36176A3BC77D
          ACFD1C9DA8EF1DF6B3F4727F2F348BFC7DF1EA72F67D6D7A36176A3BC77DACFD
          1C9DA8EF1DF6B3F4727F2F348BFC7DF1EA72F67D6D7A36176A3BC77DACFD1C9D
          A8EF1DF6B3F4727F2F348BFC7DF1EA72F67D6D7A36146C92DE7FFEDECFD1CBEA
          B9EC9AEB675C557FC4AD2D29FF00A68A78BFCAA597073A4569545336397CE6A8
          F544DE2CE3A5E0306C1AFD8DDF68B95CECE666A9FEAABE6A69E9996F1C130AB0
          C1B0EB1C3EEF1FD3674E933FF54FCF261182E1D835DFE0D70BAD1654EF9988E5
          ABED9F9DFA3111F34373685685D968CD9CDB5A55C6B6AB54CF4447547EB2F15B
          5BCDAEAE8480CF9400000005086D079E0633E506D3AFC2FBD421B41E7818CF94
          1B4EBF02697CB95F9D95D3C7C8EBD2BF7A3B98504657E76574F1F23AF4AFDE8E
          E60259002000000044C44EF84808E2C741C58E84808E2D3D07169E84808E2D3D
          07169E84808E2D3D07169E84808E2D3D07169E84808E2D3D07169E84808E2D3D
          07169E84808E2D3D07169E84808E2D3D07169E84808E2D3D07169E84808E2D3D
          07169E84808E2D3D07169E84808E2D3D07169E84808E2D3D07169E84808E2D3D
          07169E84808E2D3D07163A120238B1D0900C8000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000113113BCD2120238B4F41C5A7A120238B4F41C5A7A120238B4F
          41C5A7A120238B4F41C5A7A120238B4F41C5A7A120238B4F41C5A7A120238B4F
          41C5A7A120238B4F41C5A7A120238B4F41C5A7A120238B4F41C5A7A120238B4F
          41C5A7A120238B4F41C5A7A120238B4F41C5A7A120238B4F41C5A7A120238B4F
          41C5A7A120238B4F41C5A7A12023488262277C2404689000000000001421B41E
          7818CF941B4EBF0BEF5086D079E0633E506D3AFC09A5F2E57E76574F1F23AF4A
          FDE8EE6141195F9D95D3C7C8EBD2BF7A3B980964008000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000001421B41E7818CF941B4EBF0BEF5086D079E0633E506D3A
          FC09A5F2E57E76574F1F23AF4AFDE8EE6141195F9D95D3C7C8EBD2BF7A3B9809
          6400800000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000001421B41E7818CF941B4E
          BF0BEF5086D079E0633E506D3AFC09A5F2E58E76374F1F23AF4AFDE898E2C72B
          FCFC67DC89B4EBAED433262B8564BCCD656D678EDF2DAEF6F6386DE22AA662F1
          5CD35D35453BF74C4C3F569CE9C2DE234FEDCDA9F9F7EF606D5F9EB1D26B1D2A
          0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B
          35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD78
          5BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FD
          FCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36
          A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9
          F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFB
          D8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D
          9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC
          2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7E
          FE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B
          53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FC
          FBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFD
          EC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B03
          25F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E
          5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1
          D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749A
          C74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2
          A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837
          B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD7
          85BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16F
          DFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F3
          6A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F
          9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DF
          BD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61
          D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766B
          C2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7
          EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9
          B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4F
          CFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EF
          DEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0
          325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97
          E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B
          1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749
          AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D
          2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A83
          7B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD
          785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16
          FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F
          36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9
          F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7D
          FBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF6
          1D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766
          BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B
          7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF
          9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4
          FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3E
          FDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B
          0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C9
          7E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96
          B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC74
          9AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1
          D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A8
          37B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DEC
          D785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E1
          6FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7
          F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA
          9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7
          DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF
          61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD876
          6BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0
          B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFB
          F9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D
          4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3
          EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7
          B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C
          97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F9
          6B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC7
          49AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B
          1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A
          837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DE
          CD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E
          16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF
          7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCD
          A9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D2A11DA0F3C0C67CA0DA75F87
          F3ECD385BF7F36A7E7DFBD8FC9C9191B6A37EDA765FC6318C9B99EDEDEDB1DBA
          5BDE6F36F86DE26AAEA9BC5135575D534FDB33322763FFD9}
        mmHeight = 23815
        mmLeft = 255059
        mmTop = 529
        mmWidth = 28310
        BandType = 0
        LayerName = Foreground1
      end
    end
    object ppDetailBand2: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 10583
      mmPrintPosition = 0
      object ppDBText13: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText13'
        Border.mmPadding = 0
        DataField = 'nomeproduto'
        DataPipeline = ppDBItensOrcamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        VerticalAlignment = avCenter
        DataPipelineName = 'ppDBItensOrcamento'
        mmHeight = 8738
        mmLeft = 59528
        mmTop = 265
        mmWidth = 34860
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText17: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText17'
        Border.mmPadding = 0
        DataField = 'observacao'
        DataPipeline = ppDBItensOrcamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        VerticalAlignment = avCenter
        DataPipelineName = 'ppDBItensOrcamento'
        mmHeight = 8738
        mmLeft = 251884
        mmTop = 265
        mmWidth = 31485
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText18: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText18'
        Border.mmPadding = 0
        DataField = 'valorunidade'
        DataPipeline = ppDBItensOrcamento
        DisplayFormat = '$####,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'ppDBItensOrcamento'
        mmHeight = 8738
        mmLeft = 136787
        mmTop = 265
        mmWidth = 14810
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText19: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText19'
        Border.mmPadding = 0
        DataField = 'valortotal'
        DataPipeline = ppDBItensOrcamento
        DisplayFormat = '$####,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'ppDBItensOrcamento'
        mmHeight = 8738
        mmLeft = 151868
        mmTop = 265
        mmWidth = 19315
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine5: TppLine
        DesignLayer = ppDesignLayer2
        UserName = 'Line5'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        mmHeight = 1054
        mmLeft = 1058
        mmTop = 9519
        mmWidth = 283105
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText20: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText20'
        Border.mmPadding = 0
        DataField = 'item'
        DataPipeline = ppDBItensOrcamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'ppDBItensOrcamento'
        mmHeight = 8738
        mmLeft = 1323
        mmTop = 265
        mmWidth = 7666
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText60: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText60'
        Border.mmPadding = 0
        DataField = 'marcanome'
        DataPipeline = ppDBItensOrcamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'ppDBItensOrcamento'
        mmHeight = 8738
        mmLeft = 94981
        mmTop = 265
        mmWidth = 24328
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText16: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText16'
        Border.mmPadding = 0
        DataField = 'codfabproduto'
        DataPipeline = ppDBItensOrcamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'ppDBItensOrcamento'
        mmHeight = 8738
        mmLeft = 36245
        mmTop = 265
        mmWidth = 23015
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText24: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText24'
        Border.mmPadding = 0
        DataField = 'unidademedida'
        DataPipeline = ppDBItensOrcamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'ppDBItensOrcamento'
        mmHeight = 8738
        mmLeft = 18786
        mmTop = 265
        mmWidth = 16919
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText166: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText601'
        Border.mmPadding = 0
        DataField = 'originalstr'
        DataPipeline = ppDBItensOrcamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'ppDBItensOrcamento'
        mmHeight = 8738
        mmLeft = 119592
        mmTop = 265
        mmWidth = 16933
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText167: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText167'
        Border.mmPadding = 0
        DataField = 'ipi'
        DataPipeline = ppDBItensOrcamento
        DisplayFormat = '$####,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'ppDBItensOrcamento'
        mmHeight = 8738
        mmLeft = 171715
        mmTop = 265
        mmWidth = 15240
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText168: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText168'
        Border.mmPadding = 0
        DataField = 'diferencialalicota'
        DataPipeline = ppDBItensOrcamento
        DisplayFormat = '$####,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'ppDBItensOrcamento'
        mmHeight = 8738
        mmLeft = 187590
        mmTop = 265
        mmWidth = 15240
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText169: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText169'
        Border.mmPadding = 0
        DataField = 'icmst'
        DataPipeline = ppDBItensOrcamento
        DisplayFormat = '$####,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'ppDBItensOrcamento'
        mmHeight = 8738
        mmLeft = 203465
        mmTop = 265
        mmWidth = 15240
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText170: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText170'
        Border.mmPadding = 0
        DataField = 'freteitem'
        DataPipeline = ppDBItensOrcamento
        DisplayFormat = '$####,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'ppDBItensOrcamento'
        mmHeight = 8738
        mmLeft = 219074
        mmTop = 265
        mmWidth = 15240
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText58: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText58'
        Border.mmPadding = 0
        DataField = 'descontoitem'
        DataPipeline = ppDBItensOrcamento
        DisplayFormat = '$####,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'ppDBItensOrcamento'
        mmHeight = 8738
        mmLeft = 234686
        mmTop = 265
        mmWidth = 16404
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText15: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText2'
        Border.mmPadding = 0
        DataField = 'qtde'
        DataPipeline = ppDBItensOrcamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'ppDBItensOrcamento'
        mmHeight = 8738
        mmLeft = 9522
        mmTop = 265
        mmWidth = 8991
        BandType = 4
        LayerName = Foreground1
      end
    end
    object ppFooterBand2: TppFooterBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppSystemVariable3: TppSystemVariable
        DesignLayer = ppDesignLayer2
        UserName = 'SystemVariable3'
        Border.mmPadding = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 244484
        mmTop = 794
        mmWidth = 17729
        BandType = 8
        LayerName = Foreground1
      end
      object ppSystemVariable4: TppSystemVariable
        DesignLayer = ppDesignLayer2
        UserName = 'SystemVariable4'
        Border.mmPadding = 0
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 266974
        mmTop = 794
        mmWidth = 16405
        BandType = 8
        LayerName = Foreground1
      end
      object ppLine6: TppLine
        DesignLayer = ppDesignLayer2
        UserName = 'Line6'
        Border.mmPadding = 0
        Pen.Width = 2
        Weight = 1.500000000000000000
        mmHeight = 529
        mmLeft = 265
        mmTop = 265
        mmWidth = 282710
        BandType = 8
        LayerName = Foreground1
      end
    end
    object ppSummaryBand2: TppSummaryBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppShape5: TppShape
        DesignLayer = ppDesignLayer2
        UserName = 'Shape5'
        Brush.Color = clTeal
        Pen.Style = psClear
        mmHeight = 4763
        mmLeft = 2381
        mmTop = 265
        mmWidth = 283634
        BandType = 7
        LayerName = Foreground1
      end
      object ppDBCalc3: TppDBCalc
        DesignLayer = ppDesignLayer2
        UserName = 'DBCalc3'
        Border.mmPadding = 0
        DataField = 'valortotal'
        DataPipeline = ppDBItensOrcamento
        DisplayFormat = '$####,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'ppDBItensOrcamento'
        mmHeight = 4498
        mmLeft = 99219
        mmTop = 264
        mmWidth = 29104
        BandType = 7
        LayerName = Foreground1
      end
      object ppLabel23: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label23'
        Border.mmPadding = 0
        Caption = 'Valor Bruto:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 81227
        mmTop = 529
        mmWidth = 17727
        BandType = 7
        LayerName = Foreground1
      end
      object ppLabel27: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label27'
        Border.mmPadding = 0
        Caption = 'Total Unidades: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 38100
        mmTop = 794
        mmWidth = 23813
        BandType = 7
        LayerName = Foreground1
      end
      object ppLabel28: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label28'
        Border.mmPadding = 0
        Caption = 'Total Items: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 2910
        mmTop = 794
        mmWidth = 18257
        BandType = 7
        LayerName = Foreground1
      end
      object ppDBCalc5: TppDBCalc
        DesignLayer = ppDesignLayer2
        UserName = 'DBCalc5'
        Border.mmPadding = 0
        DataField = 'id'
        DataPipeline = ppDBItensOrcamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        VerticalAlignment = avCenter
        DBCalcType = dcCount
        DataPipelineName = 'ppDBItensOrcamento'
        mmHeight = 4498
        mmLeft = 20902
        mmTop = 528
        mmWidth = 12171
        BandType = 7
        LayerName = Foreground1
      end
      object ppLabel88: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label1'
        Border.mmPadding = 0
        Caption = 'Valor Bruto + Frete:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 128853
        mmTop = 529
        mmWidth = 32015
        BandType = 7
        LayerName = Foreground1
      end
      object ppDBCalc43: TppDBCalc
        DesignLayer = ppDesignLayer2
        UserName = 'DBCalc43'
        Border.mmPadding = 0
        DataField = 'valorbrutomaisfrete'
        DataPipeline = ppDBItensOrcamento
        DisplayFormat = '$####,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'ppDBItensOrcamento'
        mmHeight = 4498
        mmLeft = 160867
        mmTop = 265
        mmWidth = 38365
        BandType = 7
        LayerName = Foreground1
      end
      object ppLabel210: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label210'
        Border.mmPadding = 0
        Caption = 'Valor Liquido:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 199761
        mmTop = 529
        mmWidth = 20373
        BandType = 7
        LayerName = Foreground1
      end
      object ppDBCalc44: TppDBCalc
        DesignLayer = ppDesignLayer2
        UserName = 'DBCalc44'
        Border.mmPadding = 0
        DataField = 'valorliquido'
        DataPipeline = ppDBItensOrcamento
        DisplayFormat = '$####,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'ppDBItensOrcamento'
        mmHeight = 4498
        mmLeft = 220395
        mmTop = 264
        mmWidth = 29104
        BandType = 7
        LayerName = Foreground1
      end
      object ppDBCalc2: TppDBCalc
        DesignLayer = ppDesignLayer2
        UserName = 'DBCalc1'
        Border.mmPadding = 0
        DataField = 'qtde'
        DataPipeline = ppDBItensOrcamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'ppDBItensOrcamento'
        mmHeight = 4498
        mmLeft = 61912
        mmTop = 265
        mmWidth = 12171
        BandType = 7
        LayerName = Foreground1
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
  object ppDBItensOrcamento: TppDBPipeline
    DataSource = dsOrcamentoItens
    UserName = 'DBItensOrcamento'
    Left = 64
    Top = 208
  end
  object ppRepOrdemCompra: TppReport
    AutoStop = False
    DataPipeline = ppDBItensOrcamento
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 (8.2 x 11.7 in; 210 x 297 mm)'
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
    Left = 64
    Top = 272
    Version = '19.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBItensOrcamento'
    object ppHeaderBand9: TppHeaderBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 130440
      mmPrintPosition = 0
      object ppShape31: TppShape
        DesignLayer = ppDesignLayer9
        UserName = 'Shape3'
        Brush.Color = clTeal
        Pen.Style = psClear
        mmHeight = 4763
        mmLeft = 1058
        mmTop = 125418
        mmWidth = 283898
        BandType = 0
        LayerName = BandLayer14
      end
      object ppLabel129: TppLabel
        DesignLayer = ppDesignLayer9
        UserName = 'Label18'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Observa'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 251885
        mmTop = 125419
        mmWidth = 31747
        BandType = 0
        LayerName = BandLayer14
      end
      object ppShape32: TppShape
        DesignLayer = ppDesignLayer9
        UserName = 'Shape6'
        Brush.Style = bsClear
        mmHeight = 6076
        mmLeft = 29898
        mmTop = 111395
        mmWidth = 215636
        BandType = 0
        LayerName = BandLayer14
      end
      object ppLabel130: TppLabel
        DesignLayer = ppDesignLayer9
        UserName = 'LblOrdemPedido'
        Border.mmPadding = 0
        Caption = 'Ordem de Compra N'#176' :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 18
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 7673
        mmLeft = 529
        mmTop = 16933
        mmWidth = 67734
        BandType = 0
        LayerName = BandLayer14
      end
      object ppShape33: TppShape
        DesignLayer = ppDesignLayer9
        UserName = 'Shape4'
        mmHeight = 44979
        mmLeft = 263
        mmTop = 79112
        mmWidth = 283898
        BandType = 0
        LayerName = BandLayer14
      end
      object ppLabel131: TppLabel
        DesignLayer = ppDesignLayer9
        UserName = 'Label13'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Pedido.........:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4763
        mmLeft = 2381
        mmTop = 80174
        mmWidth = 26461
        BandType = 0
        LayerName = BandLayer14
      end
      object ppDBText110: TppDBText
        DesignLayer = ppDesignLayer9
        UserName = 'DBText5'
        Border.mmPadding = 0
        DataField = 'identificador'
        DataPipeline = ppDBOrcamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBOrcamento'
        mmHeight = 4763
        mmLeft = 29898
        mmTop = 80174
        mmWidth = 22225
        BandType = 0
        LayerName = BandLayer14
      end
      object ppLabel138: TppLabel
        DesignLayer = ppDesignLayer9
        UserName = 'Label15'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Data Pedido:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4763
        mmLeft = 56356
        mmTop = 80174
        mmWidth = 25930
        BandType = 0
        LayerName = BandLayer14
      end
      object ppDBText111: TppDBText
        DesignLayer = ppDesignLayer9
        UserName = 'DBText11'
        Border.mmPadding = 0
        DataField = 'datapedido'
        DataPipeline = ppDBOrcamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBOrcamento'
        mmHeight = 4763
        mmLeft = 83079
        mmTop = 80174
        mmWidth = 23283
        BandType = 0
        LayerName = BandLayer14
      end
      object ppLabel139: TppLabel
        DesignLayer = ppDesignLayer9
        UserName = 'Label16'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Fornecedor:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4763
        mmLeft = 2381
        mmTop = 86524
        mmWidth = 26458
        BandType = 0
        LayerName = BandLayer14
      end
      object ppDBText112: TppDBText
        DesignLayer = ppDesignLayer9
        UserName = 'DBText12'
        Border.mmPadding = 0
        DataField = 'fornecedor'
        DataPipeline = ppDBOrcamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBOrcamento'
        mmHeight = 4763
        mmLeft = 29898
        mmTop = 86524
        mmWidth = 165100
        BandType = 0
        LayerName = BandLayer14
      end
      object ppLabel140: TppLabel
        DesignLayer = ppDesignLayer9
        UserName = 'Label101'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Telefone......:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4763
        mmLeft = 2381
        mmTop = 98960
        mmWidth = 26458
        BandType = 0
        LayerName = BandLayer14
      end
      object ppDBMemo9: TppDBMemo
        DesignLayer = ppDesignLayer9
        UserName = 'DBMemo2'
        Border.mmPadding = 0
        CharWrap = False
        DataField = 'telefone_fixo'
        DataPipeline = ppDBOrcamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        RemoveEmptyLines = False
        Transparent = True
        DataPipelineName = 'ppDBOrcamento'
        mmHeight = 4763
        mmLeft = 29898
        mmTop = 99225
        mmWidth = 83344
        BandType = 0
        LayerName = BandLayer14
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        mmLeading = 0
      end
      object ppLabel141: TppLabel
        DesignLayer = ppDesignLayer9
        UserName = 'Label19'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'E-mail....:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4763
        mmLeft = 155575
        mmTop = 105840
        mmWidth = 19579
        BandType = 0
        LayerName = BandLayer14
      end
      object ppDBMemo10: TppDBMemo
        DesignLayer = ppDesignLayer9
        UserName = 'DBMemo5'
        Border.mmPadding = 0
        CharWrap = False
        DataField = 'email'
        DataPipeline = ppDBOrcamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        RemoveEmptyLines = False
        Transparent = True
        DataPipelineName = 'ppDBOrcamento'
        mmHeight = 4763
        mmLeft = 174625
        mmTop = 105840
        mmWidth = 107156
        BandType = 0
        LayerName = BandLayer14
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        mmLeading = 0
      end
      object ppLabel142: TppLabel
        DesignLayer = ppDesignLayer9
        UserName = 'lblDescricao1'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Forma de Pagamento:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4763
        mmLeft = 2381
        mmTop = 111660
        mmWidth = 47361
        BandType = 0
        LayerName = BandLayer14
      end
      object ppLine25: TppLine
        DesignLayer = ppDesignLayer9
        UserName = 'Line4'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        mmHeight = 1319
        mmLeft = 528
        mmTop = 24871
        mmWidth = 283635
        BandType = 0
        LayerName = BandLayer14
      end
      object ppLabel143: TppLabel
        DesignLayer = ppDesignLayer9
        UserName = 'Label21'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Descri'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 59793
        mmTop = 125677
        mmWidth = 34860
        BandType = 0
        LayerName = BandLayer14
      end
      object ppLabel144: TppLabel
        DesignLayer = ppDesignLayer9
        UserName = 'Label22'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Qtde.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 9787
        mmTop = 125677
        mmWidth = 8991
        BandType = 0
        LayerName = BandLayer14
      end
      object ppLabel145: TppLabel
        DesignLayer = ppDesignLayer9
        UserName = 'Label24'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Cod. Fabricante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 36245
        mmTop = 125677
        mmWidth = 23003
        BandType = 0
        LayerName = BandLayer14
      end
      object ppDBText113: TppDBText
        DesignLayer = ppDesignLayer9
        UserName = 'DBText14'
        Border.mmPadding = 0
        DataField = 'formapg'
        DataPipeline = ppDBOrcamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDBOrcamento'
        mmHeight = 4763
        mmLeft = 49742
        mmTop = 111660
        mmWidth = 56621
        BandType = 0
        LayerName = BandLayer14
      end
      object ppLabel146: TppLabel
        DesignLayer = ppDesignLayer9
        UserName = 'Label26'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Valor Bruto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 152133
        mmTop = 125677
        mmWidth = 19315
        BandType = 0
        LayerName = BandLayer14
      end
      object ppLabel147: TppLabel
        DesignLayer = ppDesignLayer9
        UserName = 'Label25'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Valor Uni.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 137051
        mmTop = 125674
        mmWidth = 14808
        BandType = 0
        LayerName = BandLayer14
      end
      object ppLabel148: TppLabel
        DesignLayer = ppDesignLayer9
        UserName = 'Label31'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Contato.......:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4763
        mmLeft = 2381
        mmTop = 105577
        mmWidth = 26458
        BandType = 0
        LayerName = BandLayer14
      end
      object ppDBMemo11: TppDBMemo
        DesignLayer = ppDesignLayer9
        UserName = 'DBMemo6'
        Border.mmPadding = 0
        CharWrap = False
        DataField = 'contatopessoa'
        DataPipeline = ppDBOrcamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        RemoveEmptyLines = False
        Transparent = True
        DataPipelineName = 'ppDBOrcamento'
        mmHeight = 4763
        mmLeft = 29898
        mmTop = 105840
        mmWidth = 124884
        BandType = 0
        LayerName = BandLayer14
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        mmLeading = 0
      end
      object ppLabel179: TppLabel
        DesignLayer = ppDesignLayer9
        UserName = 'Label36'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'CNPJ...........:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4763
        mmLeft = 2382
        mmTop = 92612
        mmWidth = 26458
        BandType = 0
        LayerName = BandLayer14
      end
      object ppDBText115: TppDBText
        DesignLayer = ppDesignLayer9
        UserName = 'DBText22'
        Border.mmPadding = 0
        DataField = 'cpf_cnpj'
        DataPipeline = ppDBOrcamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBOrcamento'
        mmHeight = 4763
        mmLeft = 29899
        mmTop = 92612
        mmWidth = 48948
        BandType = 0
        LayerName = BandLayer14
      end
      object ppLabel180: TppLabel
        DesignLayer = ppDesignLayer9
        UserName = 'Label37'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'IE.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4763
        mmLeft = 81227
        mmTop = 92610
        mmWidth = 8996
        BandType = 0
        LayerName = BandLayer14
      end
      object ppDBText116: TppDBText
        DesignLayer = ppDesignLayer9
        UserName = 'DBText23'
        Border.mmPadding = 0
        DataField = 'inscricaoestadual'
        DataPipeline = ppDBOrcamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBOrcamento'
        mmHeight = 4763
        mmLeft = 90752
        mmTop = 92610
        mmWidth = 48948
        BandType = 0
        LayerName = BandLayer14
      end
      object ppLabel197: TppLabel
        DesignLayer = ppDesignLayer9
        UserName = 'Label11'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Item'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 1323
        mmTop = 125419
        mmWidth = 7666
        BandType = 0
        LayerName = BandLayer14
      end
      object ppLabel198: TppLabel
        DesignLayer = ppDesignLayer9
        UserName = 'Label29'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Uni. Med.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 18786
        mmTop = 125677
        mmWidth = 16919
        BandType = 0
        LayerName = BandLayer14
      end
      object ppLabel199: TppLabel
        DesignLayer = ppDesignLayer9
        UserName = 'Label87'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Desconto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 234686
        mmTop = 125419
        mmWidth = 16404
        BandType = 0
        LayerName = BandLayer14
      end
      object ppLabel200: TppLabel
        DesignLayer = ppDesignLayer9
        UserName = 'Label89'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Marca'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 94980
        mmTop = 125419
        mmWidth = 24328
        BandType = 0
        LayerName = BandLayer14
      end
      object ppLabel201: TppLabel
        DesignLayer = ppDesignLayer9
        UserName = 'Label205'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 119591
        mmTop = 125677
        mmWidth = 16908
        BandType = 0
        LayerName = BandLayer14
      end
      object ppLabel202: TppLabel
        DesignLayer = ppDesignLayer9
        UserName = 'Label206'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'IPI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 171715
        mmTop = 125418
        mmWidth = 15240
        BandType = 0
        LayerName = BandLayer14
      end
      object ppLabel203: TppLabel
        DesignLayer = ppDesignLayer9
        UserName = 'Label207'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'DIFAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 187591
        mmTop = 125418
        mmWidth = 15240
        BandType = 0
        LayerName = BandLayer14
      end
      object ppLabel204: TppLabel
        DesignLayer = ppDesignLayer9
        UserName = 'Label208'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'ICMS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 203461
        mmTop = 125419
        mmWidth = 15240
        BandType = 0
        LayerName = BandLayer14
      end
      object ppLabel213: TppLabel
        DesignLayer = ppDesignLayer9
        UserName = 'Label209'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Frete'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 219071
        mmTop = 125418
        mmWidth = 15240
        BandType = 0
        LayerName = BandLayer14
      end
      object ppLabel214: TppLabel
        DesignLayer = ppDesignLayer9
        UserName = 'Label211'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Frete Total :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4763
        mmLeft = 107421
        mmTop = 111660
        mmWidth = 25135
        BandType = 0
        LayerName = BandLayer14
      end
      object ppLabel215: TppLabel
        DesignLayer = ppDesignLayer9
        UserName = 'Label212'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Desconto Total :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4763
        mmLeft = 155575
        mmTop = 111390
        mmWidth = 33867
        BandType = 0
        LayerName = BandLayer14
      end
      object ppDBText143: TppDBText
        DesignLayer = ppDesignLayer9
        UserName = 'DBText171'
        Border.mmPadding = 0
        DataField = 'descontogeral'
        DataPipeline = ppDBItensOrcamento
        DisplayFormat = '$####,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'ppDBItensOrcamento'
        mmHeight = 4763
        mmLeft = 189971
        mmTop = 111390
        mmWidth = 28840
        BandType = 0
        LayerName = BandLayer14
      end
      object ppDBText147: TppDBText
        DesignLayer = ppDesignLayer9
        UserName = 'DBText1'
        Border.mmPadding = 0
        DataField = 'fretegeral'
        DataPipeline = ppDBItensOrcamento
        DisplayFormat = '$####,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'ppDBItensOrcamento'
        mmHeight = 4763
        mmLeft = 132821
        mmTop = 111660
        mmWidth = 21960
        BandType = 0
        LayerName = BandLayer14
      end
      object ppShape70: TppShape
        DesignLayer = ppDesignLayer9
        UserName = 'Shape70'
        mmHeight = 44983
        mmLeft = 265
        mmTop = 30159
        mmWidth = 283898
        BandType = 0
        LayerName = BandLayer14
      end
      object ppLabel221: TppLabel
        DesignLayer = ppDesignLayer9
        UserName = 'Label221'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Raz'#227'o Social.....:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4763
        mmLeft = 2381
        mmTop = 31750
        mmWidth = 33338
        BandType = 0
        LayerName = BandLayer14
      end
      object ppLabel222: TppLabel
        DesignLayer = ppDesignLayer9
        UserName = 'Label222'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Nome Fantasia.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4763
        mmLeft = 2381
        mmTop = 37038
        mmWidth = 33338
        BandType = 0
        LayerName = BandLayer14
      end
      object ppLabel223: TppLabel
        DesignLayer = ppDesignLayer9
        UserName = 'Label223'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Cidade :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4763
        mmLeft = 2381
        mmTop = 42332
        mmWidth = 20373
        BandType = 0
        LayerName = BandLayer14
      end
      object ppLabel224: TppLabel
        DesignLayer = ppDesignLayer9
        UserName = 'Label224'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'CPF/CNPJ :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4763
        mmLeft = 2381
        mmTop = 47360
        mmWidth = 24342
        BandType = 0
        LayerName = BandLayer14
      end
      object ppLabel225: TppLabel
        DesignLayer = ppDesignLayer9
        UserName = 'Label225'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Inscri'#231#227'o Estadual :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4763
        mmLeft = 110067
        mmTop = 47361
        mmWidth = 41804
        BandType = 0
        LayerName = BandLayer14
      end
      object ppLabel226: TppLabel
        DesignLayer = ppDesignLayer9
        UserName = 'Label226'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Endere'#231'o Cobran'#231'a :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4763
        mmLeft = 2381
        mmTop = 52650
        mmWidth = 43386
        BandType = 0
        LayerName = BandLayer14
      end
      object ppLabel227: TppLabel
        DesignLayer = ppDesignLayer9
        UserName = 'Label227'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Endere'#231'o Faturamento :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4763
        mmLeft = 2381
        mmTop = 60589
        mmWidth = 49742
        BandType = 0
        LayerName = BandLayer14
      end
      object ppLabel228: TppLabel
        DesignLayer = ppDesignLayer9
        UserName = 'Label228'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Dados p/ Faturamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 3968
        mmLeft = 528
        mmTop = 26196
        mmWidth = 33338
        BandType = 0
        LayerName = BandLayer14
      end
      object ppLabel229: TppLabel
        DesignLayer = ppDesignLayer9
        UserName = 'Label229'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Dados da Ordem de Compra :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 3969
        mmLeft = 530
        mmTop = 75143
        mmWidth = 49213
        BandType = 0
        LayerName = BandLayer14
      end
      object ppLabel230: TppLabel
        DesignLayer = ppDesignLayer9
        UserName = 'Label230'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Email(s) p/ Envio de NF e Boletos:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4763
        mmLeft = 2381
        mmTop = 69325
        mmWidth = 68787
        BandType = 0
        LayerName = BandLayer14
      end
      object ppDBText178: TppDBText
        DesignLayer = ppDesignLayer9
        UserName = 'DBText178'
        Border.mmPadding = 0
        DataField = 'nome'
        DataPipeline = dmReport.ppDBPropriedade
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPropriedade'
        mmHeight = 4763
        mmLeft = 36248
        mmTop = 31753
        mmWidth = 240507
        BandType = 0
        LayerName = BandLayer14
      end
      object ppDBText179: TppDBText
        DesignLayer = ppDesignLayer9
        UserName = 'DBText179'
        Border.mmPadding = 0
        DataField = 'cidade'
        DataPipeline = dmReport.ppDBPropriedade
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPropriedade'
        mmHeight = 4763
        mmLeft = 23019
        mmTop = 42333
        mmWidth = 68792
        BandType = 0
        LayerName = BandLayer14
      end
      object ppDBText180: TppDBText
        DesignLayer = ppDesignLayer9
        UserName = 'DBText180'
        Border.mmPadding = 0
        DataField = 'razaosocial'
        DataPipeline = dmReport.ppDBPropriedade
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPropriedade'
        mmHeight = 4763
        mmLeft = 36249
        mmTop = 37042
        mmWidth = 240507
        BandType = 0
        LayerName = BandLayer14
      end
      object ppDBText181: TppDBText
        DesignLayer = ppDesignLayer9
        UserName = 'DBText181'
        Border.mmPadding = 0
        DataField = 'uf'
        DataPipeline = dmReport.ppDBPropriedade
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPropriedade'
        mmHeight = 4763
        mmLeft = 102659
        mmTop = 42333
        mmWidth = 68792
        BandType = 0
        LayerName = BandLayer14
      end
      object ppLabel231: TppLabel
        DesignLayer = ppDesignLayer9
        UserName = 'Label231'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'UF :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4763
        mmLeft = 92869
        mmTop = 42333
        mmWidth = 8731
        BandType = 0
        LayerName = BandLayer14
      end
      object ppDBText182: TppDBText
        DesignLayer = ppDesignLayer9
        UserName = 'DBText182'
        Border.mmPadding = 0
        DataField = 'cpf_cnpj'
        DataPipeline = dmReport.ppDBPropriedade
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPropriedade'
        mmHeight = 4763
        mmLeft = 26988
        mmTop = 47361
        mmWidth = 68792
        BandType = 0
        LayerName = BandLayer14
      end
      object ppDBText183: TppDBText
        DesignLayer = ppDesignLayer9
        UserName = 'DBText183'
        Border.mmPadding = 0
        DataField = 'inscricaoestadual'
        DataPipeline = dmReport.ppDBPropriedade
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPropriedade'
        mmHeight = 4763
        mmLeft = 152136
        mmTop = 47361
        mmWidth = 68792
        BandType = 0
        LayerName = BandLayer14
      end
      object ppDBText184: TppDBText
        DesignLayer = ppDesignLayer9
        UserName = 'DBText184'
        Border.mmPadding = 0
        DataField = 'enderecocobranca'
        DataPipeline = dmReport.ppDBPropriedade
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDBPropriedade'
        mmHeight = 6618
        mmLeft = 46830
        mmTop = 53447
        mmWidth = 236273
        BandType = 0
        LayerName = BandLayer14
      end
      object ppDBText185: TppDBText
        DesignLayer = ppDesignLayer9
        UserName = 'DBText185'
        Border.mmPadding = 0
        DataField = 'enderecofaturamento'
        DataPipeline = dmReport.ppDBPropriedade
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDBPropriedade'
        mmHeight = 8208
        mmLeft = 52654
        mmTop = 61120
        mmWidth = 230455
        BandType = 0
        LayerName = BandLayer14
      end
      object ppDBText186: TppDBText
        DesignLayer = ppDesignLayer9
        UserName = 'DBText186'
        Border.mmPadding = 0
        DataField = 'emailenvionota1'
        DataPipeline = dmReport.ppDBPropriedade
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        VerticalAlignment = avCenter
        DataPipelineName = 'ppDBPropriedade'
        mmHeight = 3968
        mmLeft = 71437
        mmTop = 70120
        mmWidth = 211667
        BandType = 0
        LayerName = BandLayer14
      end
      object ppDBText114: TppDBText
        DesignLayer = ppDesignLayer9
        UserName = 'DBText114'
        Border.mmPadding = 0
        DataField = 'id'
        DataPipeline = ppDBOrcamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 18
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'ppDBOrcamento'
        mmHeight = 7673
        mmLeft = 68793
        mmTop = 16933
        mmWidth = 28324
        BandType = 0
        LayerName = BandLayer14
      end
      object ppImage13: TppImage
        DesignLayer = ppDesignLayer9
        UserName = 'Image13'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = False
        Stretch = True
        Border.mmPadding = 0
        Picture.Data = {
          0A544A504547496D61676529BC0000FFD8FFE000104A46494600010100000100
          010000FFDB004300030202020202030202020303030304060404040404080606
          050609080A0A090809090A0C0F0C0A0B0E0B09090D110D0E0F101011100A0C12
          131210130F101010FFDB00430103030304030408040408100B090B1010101010
          1010101010101010101010101010101010101010101010101010101010101010
          10101010101010101010101010FFC00011080500050003012200021101031101
          FFC4001E0001000203010101010100000000000000000109020708060405030A
          FFC4005510010001010502060B0F010702050402030001020304050611073108
          12213851B4161732555676779293B1D10913141934415761717273819194A122
          151835424382C152E12333A2B2C24453748324456267F1FFC4001C0101000105
          010100000000000000000000000103050607080402FFC4004011010001010404
          0B05060700030101000000010203040511062131A1071213164151537181B1D1
          333536619114223242C1E1151723525462B27282F02492FFDA000C0301000211
          0311003F00E45CF99C76917EDA9664C2309CD998EDEDEDB1EBE585DEEF617FB7
          9AABAA6F15C534534C55BFE6D21FBFDAB78607CD92F6ABA7FF008F7E7C996397
          858DD3C7C8EBF2BF8A7963513B1425DAB3860F817B55F417E3B5670C1F02F6AB
          E82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423D
          AB3860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED57D0
          5F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F02F6
          ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD42
          3DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED57
          D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F02
          F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD
          423DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED
          57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F
          02F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80
          CD423DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05
          ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C
          1F02F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB
          80CD423DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E
          05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B567
          0C1F02F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2
          FB80CD423DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE18
          3E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5
          670C1F02F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0B
          F2FB80CD423DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE
          183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3
          B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA
          0BF2FB80CD423DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6A
          CE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417
          E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAA
          FA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F
          6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F4
          17E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BD
          AAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE03350
          8F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55
          F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0
          BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE033
          508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B
          55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C307
          C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE0
          33508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F81
          7B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C3
          07C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F02F6ABE82FCBE
          E033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F
          817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59
          C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F02F6ABE82FC
          BEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB386
          0F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED
          59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F02F6ABE82
          FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3
          860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED57D05F8
          ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F02F6ABE
          82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423DA
          B3860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED57D05
          F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F02F6A
          BE82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423
          DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED57D
          05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F02F
          6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD4
          23DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED5
          7D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F0
          2F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80C
          D423DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05E
          D57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55FDBDF9F8192B3
          76D230EDA8601836319A332DDEF3618F5D2EF79BB5E6FF006F4D5455178A69AE
          8AE99AB9277C4C4BFD064EE5086D039385FE331FFF00B02D3AF846B7CD95F9D9
          5D3C7C8EBD2BF7A3B98504657E76574F1F23AF4AFDE8EE602590020000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000005086D079E0633E506D3AFC2FBD421B41E7
          818CF941B4EBF02697CB95F9D95D3C7C8EBD2BF7A3B98504657E76574F1F23AF
          4AFDE8EE60259002000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000005086D079
          E0633E506D3AFC2FBD421B41E7818CF941B4EBF02697CB95F9D95D3C7C8EBD2B
          F7A3B98504657E76574F1F23AF4AFDE8EE602590020000000046B00918F1A13C
          68E9048C78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0
          190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C
          78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D0
          71A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0
          190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C
          78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D0
          71A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0
          190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C
          78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D0
          71A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0
          190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C
          78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D0
          71A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D1D271
          A3EB064238D12900000000001421B41E7818CF941B4EBF0BEF5086D079E0633E
          506D3AFC09A5F2E57E76574F1F23AF4AFDE8EE6141195F9D95D3C7C8EBD2BF7A
          3B98096400800001133A0226A88DEF23B45DA9E46D96E0D56399D31FB0C3AC27
          58B3A2A9D6D6DAA8FF002D14472D53CB1F572F2B3DA7E7FC1B66392714CEB8E5
          73F06C3AC66B8B389D2AB6B49E4A2CE9FAEAAA623F954C6D476A59AB6B39B2F5
          9B334DFEBB5B5B6AA62C6C2267DEAED67ACF16CE8A7E688FD677CF2CA9DA5A45
          9C315D26D25A302B38A288E35A55B23AA3AE5D7999FDD1EC1EC2F55D8E50C837
          8BDD844E94DBDF6F1167C68FB94C4E9FACBF03E323CC3A693B3AC3FF00735B8C
          75D7E743CDCBD6D6169A658C5A559C5AE5DD11E8ECFF008C8F307D1D61FF00B9
          B43E323CC1F47587FEE6D1C63ACF49ACF4A396AFADF1CEEC63B6DD1E8ECEF8C8
          F307D1D61FFB9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18EDB7
          47A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FFB9B4718EB3D26B3D272D5F5
          9CEEC63B6DD1E8ECEF8C8F307D1D61FF00B9B43E323CC1F47587FEE6D1C63ACF
          49ACF49CB57D673BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FF
          00B9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FFB9B43E3
          23CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE323CC1F475
          87FEE6D0F8C8F307D1D61FFB9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF
          8C8F307D1D61FF00B9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D673BB1
          8EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FF00B9B4718EB3D26B3D
          272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FFB9B43E323CC1F47587FEE6D1C
          63ACF49ACF49CB57D673BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1
          D61FFB9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FF00B9
          B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE323CC
          1F47587FEE6D0F8C8F307D1D61FF00B9B4718EB3D26B3D272D5F59CEEC63B6DD
          1E8ECEF8C8F307D1D61FFB9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D6
          73BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FFB9B4718EB3D26
          B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FF00B9B43E323CC1F47587FE
          E6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F
          307D1D61FF00B9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D6
          1FFB9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE
          323CC1F47587FEE6D0F8C8F307D1D61FFB9B4718EB3D26B3D272D5F59CEEC63B
          6DD1E8ECEF8C8F307D1D61FF00B9B43E323CC1F47587FEE6D1C63ACF49ACF49C
          B57D673BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FF00B9B471
          8EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FFB9B43E323CC1F47
          587FEE6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE323CC1F47587FEE6D0
          F8C8F307D1D61FFB9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D
          1D61FF00B9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18EDB747A
          3B3BE323CC1F47587FEE6D0F8C8F307D1D61FF00B9B4718EB3D26B3D272D5F59
          CEEC63B6DD1E8ECEF8C8F307D1D61FFB9B43E323CC1F47587FEE6D1C63ACF49A
          CF49CB57D673BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FFB9B
          4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FF00B9B43E323C
          C1F47587FEE6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE323CC1F47587F
          EE6D0F8C8F307D1D61FF00B9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8
          C8F307D1D61FFB9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18ED
          B747A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FFB9B4718EB3D26B3D272D5
          F59CEEC63B6DD1E8ECEF8C8F307D1D61FF00B9B43E323CC1F47587FEE6D1C63A
          CF49ACF49CB57D673BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1D61
          FF00B9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FFB9B43
          E323CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE323CC1F4
          7587FEE6D0F8C8F307D1D61FFB9B4718EB3D26B3D272D5F59CEEC63B6DD1E8EC
          EF8C8F307D1D61FF00B9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D673B
          B18EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FF00B9B4718EB3D26B
          3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FFB9B43E323CC1F47587FEE6D
          1C63ACF49ACF49CB57D673BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F307
          D1D61FFB9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FF00
          B9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE323
          CC1F47587FEE6D0F8C8F307D1D61FF00B9B4718EB3D26B3D272D5F59CEEC63B6
          DD1E8ECEF8C8F307D1D61FFB9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57
          D673BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FFB9B4718EB3D
          26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FF00B9B43E323CC1F47587
          FEE6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE323CC1F47587FEE6D0F8C
          8F307D1D61FF00B9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1
          D61FFB9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18EDB747A3B3
          BE323CC1F47587FEE6D0F8C8F307D1D61FFB9B4718EB3D26B3D272D5F59CEEC6
          3B6DD1E8ECEF8C8F307D1D61FF00B9B43E323CC1F47587FEE6D1C63ACF49ACF4
          9CB57D673BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FF00B9B4
          718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FFB9B43E323CC1F
          47587FEE6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE323CC1F47587FEE6
          D0F8C8F307D1D61FFB9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F30
          7D1D61FF00B9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18EDB74
          7A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FF00B9B4718EB3D26B3D272D5F
          59CEEC63B6DD1E8ECEF8C8F307D1D61FFB9B43E323CC1F47587FEE6D1C63ACF4
          9ACF49CB57D673BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FFB
          9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FF00B9B43E32
          3CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE323CC1F4758
          7FEE6D0F8C8F307D1D61FF00B9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECE
          F8C8F307D1D61FFB9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18
          EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FFB9B4718EB3D26B3D272
          D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FF00B9B43E323CC1F47587FEE6D1C6
          3ACF49ACF49CB57D673BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1D
          61FF00B9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FFB9B
          43E323CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE323CC1
          F47587FEE6D0F8C8F307D1D61FFB9B4718EB3D26B3D272D5F59CEEC63B6DD1E8
          ECEF8C8F307D1D61FF00B9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D67
          3BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FF00B9B4718EB3D2
          6B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FFB9B43E323CC1F47587FEE
          6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F3
          07D1D61FFB9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FF
          00B9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE3
          23CC3F473877EE6B7EF658F747F0ABC5EA8B0CDD90ADEEB6154C71ADEE3788B4
          9A63EE5511AFEB0E1227422DAB87DD1A658C51544CDAE7E11E8B94D9C6D5F21E
          D53068C6B2563F617FB2A748B6B38FE9B5B0AA7FCB5D13CB4FCFF54E9C932F61
          4DA53311CBBD4D1B33DA766BD9566CBA66CCAB7FAEC2DEEF5445AD96B3EF778B
          3D796CED23E7A67FEF1CAB66D94ED1707DAAE46C2B3AE0B3C5B1C42C75B4B29A
          B59B1B58E4AECE7EB89D7ED8D27E77AACAD3948F9B66E8CE92D38DD1367691C5
          B4A76C744C75C7A3D980A8CB00000005086D079E0633E506D3AFC2FBD421B41E
          7818CF941B4EBF02697CB95F9D95D3C7C8EBD2BF7A3B98504657E76574F1F23A
          F4AFDE8EE60259002000044A5156E0719FBA3B9A2F572CAF95F2A585A554D962
          17BB5BD5BD3AF255EF74C451FF00BEA703BB5FDD26FF0011C9BF8578F5C38A27
          7BC56FF8DA234D2D2AAF18B4899D997920051626000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000098DEEF0F7
          383345EAF18366ACA56D695556375B7B2BED853AF25335C4D35FEBA51FA383E3
          7C3B47DCDBFF001FCE1FFE2D87FEE56B09CAB657A19695518C594474E71BA5DE
          709446E4BDADF00000002843683CF0319F28369D7E17DEA10DA0F3C0C67CA0DA
          75F8134BE5CAFCECAE9E3E475E95FBD1DCC28232BF3B2BA78F91D7A57EF47730
          12C801000022ADC9455B8844B84BDD26FF0011C9BF8579F5D2E289DEED7F749B
          FC4726FE15E7D74B8A277BC56FF8DA1F4CBDF16DE1E50801458A800000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0001F3C7DAED2F736FFC7F387FF8961FFB9C5BF3C7DAED2F736FFC7F387FF896
          1FFB956C7DA4328D0EF7CD8F8F94BBCE372511B92F737DC0000000A10DA0F3C0
          C67CA0DA75F85F7A843683CF0319F28369D7E04D2F972BF3B2BA78F91D7A57EF
          47730A08CAFCECAE9E3E475E95FBD1DCC04B200400008AB725156E2112E12F74
          9BFC4726FE15E7D74B8A277BB5FDD26FF11C9BF8579F5D2E289DEF15BFE3687D
          32F7C5B787942005162A00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000007CF1F6BB4BDCDBFF1FCE1FF00E258
          7FEE717446AED1F737274C7B37CF4DD6C3FF007AAD8FB48651A1F19633639FCF
          CA5DE71B9288DC97B9BEC0000005086D079E0633E506D3AFC2FBD421B41E7818
          CF941B4EBF02697CB95F9D95D3C7C8EBD2BF7A3B98504657E76574F1F23AF4AF
          DE8EE602590020000455B928AB710897097BA4DFE23937F0AF3EBA5C513BDDAF
          EE937F88E4DFC2BCFAE97144EF78ADFF001B43E997BE2DBC3CA10028B1500000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000000000013A0
          204C47CDAC278A2729623F6304CA19A3325A53658065FC4310AAB9D23E0D76AE
          D23F588D21B6729F033DBD66AE25A5595230AB1AB978F885B53673A74C531ACB
          EA9A66A9CA21EEBB6197CBDCE56165555DD12D1E7167E6876C651F738AF969EF
          7699CF3FD1671BEAB2B85DF59FB38D5B75E53E03BB08CB3C4B5BD60778C66DA3
          499AAFF6F355333D3C58D34548B0AE76B24BA68362979CA6BA6288F9CFE90AC4
          B961D886236B16387DC6DEF35CCE9C5B2B39AE7F486C8CA9C1976DF9CB895613
          90711B3B2AF4E2DB5EA9F78B39FF00755A2D4B2F6CFB24E55A29B3CBB95F0BC3
          E28E4A66C2EB453579DA6BFCBF766CFE68988FB1569BBC74CB26BAF075634E53
          79B599EE8CBCF357BE51F73B7681894D9DB66DCD985E11673A71ACAC29AADED6
          3F4D299FD5D51B02E0CD96B60937FBC60F8DDFB12BD62767459DE2D2DE9A68A3
          4A6758E2D31AE9CBF5B71534F15944EB2A94D9D34CE710CAB0ED19C370BAE2D6
          C28FBD1D3339CB20151900000000A10DA0F3C0C67CA0DA75F85F7A843683CF03
          19F28369D7E04D2F972BF3B2BA78F91D7A57EF47730A08CAFCECAE9E3E475E95
          FBD1DCC04B200400008AB725156E2112E12F749BFC4726FE15E7D74B8A277BB5
          FDD26FF11C9BF8579F5D2E289DEF15BFE3687D32F7C5B787942005162A000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000026204E48194D331F3
          4A6C6C6DAF16B4D85859D569695CF169A29899AAA9E8888E5936A6299AA72860
          365E54E0DBB73CE7345581ECD719F79B4E58B7BDD8FC12CE63A62AB69A6263EC
          D5B9F2A7B9D9B4DC4B896D9B33560D82D955CB551614D77BB5A63A263FA29D7E
          CAA5F716754EC85E2EBA3F895F3D958D5E31979E4E4ED3EBD0D223E758E652F7
          3CF64384FBDDB666C5B1AC7AD29D38D4576D177B299FAA2CE22AFD6A96E6CA9B
          00D8F6498A6ACB990707BADB51BADE6ED4D76BE7D5AD5FCAA45DEA9DB2C96E9C
          1FDFED75DBD54D11F59DDAB7AAAB2C6C9369B9CEAA232C646C66FF004DA7736B
          45D2BA6CA7FF00D954453FCB71E53E017B6EC7FDEED719B3C3302B1ABBAF84DB
          FBE5AD3FEDA358FF00D4B2EB1BAD85DE8F7BB1B3A28A7A29A62223F467C588E4
          8558BBD31B592DD383EB8596536F5D55CFD21C71947DCE5CA775E25AE72CED7F
          C42B8D38D6573B2A6C2CE7F39D6AFE5BA729F04CD846509A2D2E191AE97AB6A3
          969B6BF4CDBD713D3AD4DBE2AC514C6C864B74D1EC32E5AECAC633EB98CE77BE
          1C3B02C2307B28B1C2F0DBA5D2888D229B0B1A688D3F287DBC548FA5E29A69A6
          32A63244469CA99D7A407D44640002637A131BC190000000002843683CF0319F
          28369D7E17DEA10DA0F3C0C67CA0DA75F8134BE5CAFCECAE9E3E475E95FBD1DC
          C28232BF3B2BA78F91D7A57EF4773012C801000022ADC9455B8844B84BDD26FF
          0011C9BF8579F5D2E289DEED7F749BFC4726FE15E7D74B8A277BC56FF8DA1F4C
          BDF16DE1E50801458A8000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000009D04
          A065146B3114C4CCCEED3E77A7CB7B30DA0E6FB58B1CB793717BFD53BBDE6EB5
          CC7EBA6898899D8AB6777B5B69E2D9D3333F28CDE593C9D30E89CA7C04F6E798
          E68AF12B85C703B1AF978F7DBC44D511F5D14EB547E8DCF947DCE3C0EC3896B9
          D73DDEAF53FE7B1B858459D3F95756B3FF00A5529B2AEAE85FEE9A278B5EF5D3
          65311F3D5E6E0FD23A5FA38565DC771DBC5174C1706BF5FEDAD3B9A2EF77AAD2
          67F2885A5652E07DB03CA5C4AEC72559E256F469A5B6236B55BCCFDB4F2513E6
          B6BE1196B00C02C22EB81E0F72C3EC63759DD6EF45953FA5310FBA6ED3F9A593
          5D783AB7AB5DE6D623BB5FA2AD729F03DDBFE6D9B3AEC723DB61B615E9ADAE25
          694DDB8BF5CD154F1FF4A5B9F297B9C38EDB554DA675DA1DD2EB11A4D56186DD
          6AB699FABDF2B9A623CD9779F1698E8348568B0A236EB64B74D05C2EEFAED226
          B9F9CE5BA1CF194B8086C0F2E4515E2785625982DA8D278D88DF2A8A75FB965C
          4A663EA9D5B932BECD721649B3F7ACA594707C2234D266E972B3B2AAAFB6AA63
          5AA7EB97A4D51AEAA914C46C864976C2EE5738CAC2CA9A7BA208A298D7494716
          1225EEC88D6234004800000000000000098DE84C6F064000000000A10DA0F3C0
          C67CA0DA75F85F7A843683CF0319F28369D7E04D2F972BF3B2BA78F91D7A57EF
          47730A08CAFCECAE9E3E475E95FBD1DCC04B200400008AB725156E2112E12F74
          9BFC4726FE15E7D74B8A277BB5FDD26FF11C9BF8579F5D2E289DEF15BFE3687D
          32F7C5B787942005162A00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000988D7538BAEE9FE
          099C93113281F6E15826338E5E22E982E137CC42DE74D2CEEB6155AD5FA53132
          DAB94F824EDEB374516975C8B78B85857A696D88DA53614C7DB4CEB5C79AFA8A
          6AAB643D977C3AF77B9CAC6CE6AEE8969D4C6EDD2EC8CA7EE72666BC7BDDB673
          CF374B9C4F2D76170B09B5AA3ECAEAD23FF4B75650E01DB0FC0389698B5D711C
          72DA9D3FAAF97898A27EDA29D225522C2B964973D08C56F3AEBA2288F9CFE90A
          D1BBDDAF17BB5A6C2EB61696B6957253459D335553F943DF654E0FBB64CE734C
          E07B3FC5ABB3ABFD5B6B19B1A223A666BD3916A9973649B38CA3674D965CC9B8
          4DC229DD36575A627F5D357ABA2C6CECE22298D2237446E8558BBC74CB25BAF0
          73671AEF56D9FCA98F5573653F73DB6AB8BF12D7336358560B673A4D5445536F
          5E9F969112DD1947DCF2D98E1BC4AF34E60C5F18B4A796AA2898B0A35E8E4E59
          875971683488DCA9165452C92E9A1D84DD729E4F8D3FEDAFF66B8CA7C1C762F9
          329A2704C8185C5A51FEADBD97BF5733D3335EB0D8576B8DD2E3654D85D2C2CE
          C6CE88D29A2CE88A698FB221FDB5943EE22236322B1BAD8DDE38B6344531F28C
          8E2D3D26911B812AE9D651AEA000000000000000000000000000002637A131BC
          190000000002843683CF0319F28369D7E17DEA10DA0F3C0C67CA0DA75F8134BE
          5CAFCECAE9E3E475E95FBD1DCC28232BF3B2BA78F91D7A57EF4773012C801000
          022ADC9455B8844B84BDD26FF11C9BF8579F5D2E289DEED7F749BFC4726FE15E
          7D74B8A277BC56FF008DA1F4CBDF16DE1E50801458A800000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000278B
          AFF9A19D958DA5B57C4B1B2AAD2A9F9A989991F514CD5B1FCC7BACA7B0DDADE7
          79A2ACB3B3FC6AF7655EEB6F83554597E75D5A531FAB73E53F73E76C98D4D16B
          98EFF83601653DD536B6F36F6D1F65367134CF9D0FB8B3AAAD90BA5D702C46FB
          EC2C6A9F0CA3EB2E5F2235E4D7E6F9D60F94BDCE9D9DE1D345AE6FCDB8CE3369
          4F2D567768A2E9653F54F77569F6550DD994B831EC2B25C515E0DB36C22BB6B3
          D262DEFB65F0BB489E98AADB8D313F668A9177AA76EA64D74D00C46DB5DB554D
          11DF9CEE555659C819DF3A5AC58E52CA58C63154CE9ADCAE5696D4C7DB5531A4
          7E72DC994B80C6DFB32F12D6FD815C700B0AE35E3E277CA62AD3EE5971EA89FA
          A6216776171BADD6CA9B0BB5851656744694D1453C5A623A2221FDB894EFD156
          2EF4C6D64B74E0F2E567AEF16935776A8FD65C4D94BDCDEC36CA68B7CEDB44BD
          5E27926AB0C32EB4D9447D5C7B49AB5F361BA729F033D806578A2BEC2E8C56DE
          8E59B4C4EDAABC6B3D3C4AA7891F952DDFC5A53AC69C92AB14534EC864B74D1B
          C2EE5ECAC633EB9D73BF37E561194B2D6016145D704C0EE371B1B3E4A68BBD85
          36711FA43F522CE888E484EB28D65F4BD5345344654C64998A67E794694C6E01
          F59275946A0240000000000000000000000000000000000000004C6F42637832
          0000000005086D079E0633E506D3AFC2FBD421B41E7818CF941B4EBF02697CB9
          5F9D95D3C7C8EBD2BF7A3B98504657E76574F1F23AF4AFDE8EE6025900200004
          55B928AB710897097BA4DFE23937F0AF3EBA5C513BDDAFEE937F88E4DFC2BCFA
          E97144EF78ADFF001B43E997BE2DBC3CA10028B1500000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000120813A7D52FDCC0B23E7
          0CD16B4D965ECB189E2335F73377BB575533FEE88D3F94C673B156CEC6D2D672
          A22667E4FC21BEF297027DBC6688A2D6DF2ED8E0F635693355FEDE28AA23EEC6
          B32DCF94FDCE0A3FA2D73AE7EAA7E79B2C3EEFA47D93555FF0FBA6CABABA17DB
          A68AE2B7BD7458CC475CEAF370FC53131BE75FB1F4E1F84E278A5AC58E1B875E
          6F75CCE91163655573FC42D03287029D82E579A2D2DB2C578B5AD3A4F1EFF6F5
          5A46BD3A4690DBD81647CA1966CA9B2CBD96F0DC3E9A6348F83DDA8A27F588D6
          5522ED3D32C9AE9C1E5E6BCA6F36B14F74673FA2AC329F057DBA671E25786E42
          BEDDEC6D375B5F74BBD131D3135374655F739F3A5F628B6CDF9C30EC36CE749A
          ACEEB4556F694FEBA53FCAC062CA888D2213C58D3455A6C28A76B25BA681E196
          1AED73AE7E73946E731E50E00BB16C0E68B6C76715C76DA9EEA2DEDFDEACA7FD
          B4444FFEA6EACADB19D95E4CA68EC6721E0D72AE8D38B6B4DD69AED63FDF56B5
          7F2F651C58E4838D0A914D31B21925D708B8DCBD859531E1AFEBB58C58D9D31A
          45311A328A220D651ACBE971CA213114C266A862094EB28D6400000000000000
          0000000000000000000000000000000000000004C6F426378320000000005086
          D079E0633E506D3AFC2FBD421B41E7818CF941B4EBF02697CB95F9D95D3C7C8E
          BD2BF7A3B98504657E76574F1F23AF4AFDE8EE602590020000455B928AB71089
          7097BA4DFE23937F0AF3EBA5C513BDDAFEE937F88E4DFC2BCFAE97144EF78ADF
          F1B43E997BE2DBC3CA10028B1500000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000131CBF389CB340FED75B9DE6FB6F45D6E777B5B7B7B49D28
          B2B2A26BAEA9FAA23965B3729F05FDBCE72E257856CDB16B1B1B4E58B6BFD9C5
          CE888E9FFC69A6663EC894C44CF43D56171BCDEA78B6144D53F28996AC4BAEB2
          9FB9CFB41BFF0012DB38671C2309B3AB96AB3BA515DEED23EA999E25313F66AD
          CB94BDCFCD8D60D3457986F38BE60B48EEA2DEF3EF36733F5536514CE9F6CCAA
          C58573AD915D742F16BCEBAA88A63FDA72570C53C6988A235D791ECF2BEC5F6A
          F9CEAA632DE40C6AF7457A716D26EB559D9CFF00BEBD29FE56AF947625B28C93
          14CE5AC83835CAD688D22DA9BAD336B3F6D731333F9CBDAD9DDAC2CA9E259595
          3453D14C690FB8BBF5CB26BA70731B6F56DE14C7EB3E8AD8CA7C0076D18EC516
          D8EDE309C0AC6AD358B5B59B6B5A7FDB4727FEA6E8CA5EE73E46B8F12DB37E6F
          C4F14AE34E3595DE9A6C2CA7A7A6AFE5D85145311A44278B1D0AD1634474325B
          A68661375D7367C69FF69CFF0066A6CA3C16F619937DEED30CC8370B5B7B39FE
          9B7BDC4DBDA47FBAAD5B3AE38461586D97BCE1D87DDEED671FE5B1B2A688FE21
          F54E9D06B11BA1F71111B191585CEEF768E2D8D114C7CA2211EF74C6ED53C5A7
          A0999425E94FF4C7CC6B1F342003590000000000000000000000000000000000
          000000000000000000000000000000004C6F426378320000000005086D079E06
          33E506D3AFC2FBD421B41E7818CF941B4EBF02697CB95F9D95D3C7C8EBD2BF7A
          3B98504657E76574F1F23AF4AFDE8EE602590020000455B928AB710897097BA4
          DFE23937F0AF3EBA5C513BDDAFEE937F88E4DFC2BCFAE97144EF78ADFF001B43
          E997BE2DBC3CA10028B150000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000001
          951455695453453355533A45311CB23EA2999D8C47AECB3B26DA4670B48B3CB7
          92318BF4D53A6B6775AF8BFACC68DC794B8066DB7315545A62F65866056354EF
          BD5E38F569F768D661F54D1555B2172BAE0D7FBECFF42CAA9F0D5F5D8E6F2239
          7E777CE54F738F2ADD789699CB3C5FAFD56FAECAE5654D8D3F645756B3FC373E
          51E099B06CA3C4AEE990EE97DB6A397DFB10AAABC4CFDB4D53C5FE1562EF54ED
          64B74D02C4EDB5DACD3447CE739DCAB5C1329E66CC778A6EB8065FC4710B6AB9
          29B3BB5DABB4AA7F2886DCCA5C0C76FB9AF896B393BFB26C2BFF005713B7A6C3
          8BF6D13AD7FF00A568B85E0B8460D778B9E11855D2E5614EEB3BBD8D3674C7E5
          4C443EC8A298F99522EF4C6D964D74E0F2E967AEF36B35776A8FD65C2994FDCD
          CBF57345AE77DA358D94477761865D66D267ECB5B4E2E9E6373653E039B01CB5
          34577DCBD7BC7ADA8D34B4C4EF75551AFD7459F1289FCE99743691D071637AAD
          3674D3D0C92EBA2F855D3F058C4CFCF5F9BF072D644C9593EEF175CAB94F08C2
          2CE234E2DCAE76763AFDBC588D7F37EE459D14EEA594CC41C687DE4BED167459
          C71688888F92268A677C114534EE82651ACF48FB65AC41C68620266651AC8000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000098DE84C6F064000000000A10DA0F3C0C67CA0DA75F85F7A843683C
          F0319F28369D7E04D2F972BF3B2BA78F91D7A57EF47730A08CAFCECAE9E3E475
          E95FBD1DCC04B200400008AB725156E2112E12F749BFC4726FE15E7D74B8A277
          BB5FDD26FF0011C9BF8579F5D2E289DEF15BFE3687D32F7C5B787942005162A0
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000098899DD1ABF4706CBB8FE62BC7C1700C0AF
          F895B6B11EF774BBD76D57E94C49AFA1528B2AAD272A23397E68DD795381F6DF
          335459DA59E4B9C32C2D3962DB12B6A6C6223EEC6B547E70DCD94FDCE2C62DE2
          8B5CE99F2C2EF4CF756387D84D5547D95D7C9FC2A53655D5D0BDDD346715BE65
          C9D8CE5F3D5E6E2F7F7BA5CAF57EB58BBDCAED6B78B69DD67636735D53F9446A
          B30CA9C0576179722CED310C26F78DDBD1BEBBF5BCCD357DB453A53FC37365AD
          9AE42CA5634D865DCA1855C28A74D3DE6EB4C4C69F5E9AAAC5DE7A65935D383D
          BDDA65378B48A7BB5CAAB32A7070DB5672AACE706C8189C5957FEB5E2CFDE688
          FB78DA4FF0DCF94FDCF0DA4629C4B4CD598F0BC1E8DF55165355BD7FAC690B12
          8A288E48A6234FA93C58E8548B0A636B25BA680E1B61AEDA66B9F9CE51BBD5CA
          994FDCF7D93E0FC4B5CCB8B62B8DDAD3A4CD335C58D1AFD94EF86E7CA5B01D8F
          E4C8A6301C838459574FFA9696116B5EBD3AD7AF2B62691D0691D0A914534EC8
          64975C130FB9E5C8D8D31E1AFEB2FE76375BB5DE8A6CAC2C28B3A298D29A68A6
          22223EA886714511BA984CCE88E37D4FA5D222223284F163A0D223E644CEA812
          CA66211C6FA9002667546B3D2000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000002637A131BC1900
          00000002843683CF0319F28369D7E17DEA10DA0F3C0C67CA0DA75F8134BE5CAF
          CECAE9E3E475E95FBD1DCC28232BF3B2BA78F91D7A57EF4773012C801000022A
          DC9455B8844B84BDD26FF11C9BF8579F5D2E289DEED7F749BFC4726FE15E7D74
          B8A277BC56FF008DA1F4CBDF16DE1E50801458A8000000000000000000000000
          0000000000000000000000000000000000000000000000000000000098D60FEB
          6177B7BC55145859556954EEA69A6665EF72AEC036C99D7895E5FD9F62F6F655
          F736F6961363653FEFAF4A7F94C5333B1E9B1B9DBDE672B1A26AEE8996BD1D53
          947DCF5DAC631EF76D9A71CC1703B19EEA8F7CAAF36D4FE5447167CF6E9CA5EE
          766CB70BE25AE6BCCB8DE396B1DD5167345D6C6AFB6988AABFD2B558B0AE5905
          D343717BD653C9F163FDA72DDB772BBA2359D377E6F4B95B66BB40CED5C5194F
          256358B4553A7BE5D2E5695D9C7DB5C47163F395A9652E0E5B12C933675E5FD9
          B60945B59F736F79BBFC26DA263E78B4B6E35513F64B6559585958D14D9D9595
          14514C444534C69110A9176EB964D74E0EAADB7AB6F0A63F59564652E023B78C
          C5C4B4C5AE185E5EB1AB4999BFDF22BB488FAA8B28AF97EA9986E8CABEE6FE5D
          BBF12DB3AED02FD7DAB9266C70EBB5377A3EC9AABE3CCC7D910ED2D23A0D23A1
          522C688E864D75D0AC26EDAEAA26B9FF0069FD2328694CA7C10360394A6CED2E
          D912ED7FB6A34FFC5C4AAAAF5333D3A57334C4FD910DB58565FC1305BBD376C2
          709B9DCECACF929A6C2C69A223EC8887E8E91D09548888D50C8AEF71BB5D232B
          0B38A7BA2211A47441A474133A238DF525EB4E91AEBA258CCEA806533A238DF5
          2004CCEA80000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000131BD098DE0C800000
          0001421B41E7818CF941B4EBF0BEF5086D079E0633E506D3AFC09A5F2E57E765
          74F1F23AF4AFDE8EE6141195F9D95D3C7C8EBD2BF7A3B9809640080001156E4A
          2ADC4225C25EE937F88E4DFC2BCFAE97144EF76BFBA4DFE23937F0AF3EBA5C51
          3BDE2B7FC6D0FA65EF8B6F0F28400A2C54000000000000000000000000000000
          00000000000000000000000000000000004E93D008004C4660F4597B6779EB36
          574D196F29629884D7DCCD8DD6B9A67FDDA69FCB70E55E03DB75CC93676B7DC1
          6EB8258D5CB5557EB78E3C7FB29D7D6FA8A2AAB642E376C26FB7CF616554F839
          F12EEACA5EE7161F6714DAE74CF96B6D31CB55961F778A699FAB8D572B73E54E
          06BB05CAB345A4651FED3B6A3498B4C42D6AB59D7A74E48558B0AA76B23BA681
          E2978D7699511F39D7B957B86E038CE356B4D8E1384DEAF95D73A4536163557C
          BF94368E54E097B77CDD34D775C8D7AB8D8D7CBEFB7FAA2C29D3A638DBD69981
          E53CB7976CA9B1C0B01C3EE14531A6977BB5167EA8E57EBC534F43EE2ED4ED99
          64F74E0F2EF465379B59ABE51197AB80F28FB9CB99EF7145B672CF171B8D13CB
          559DCAC2AB6AE3EA99AB8B1FA4B74E53E019B0FC0228B5C62EF8963D6D4E9AFC
          2EF13459CFFB68D263F574A691D0690AB4D9514EC864B75D14C26E9AE9B2899E
          B9D7E6F1F95B653B39C99144659C938361F551DCDAD95D28F7CFCEB98E34FEAF
          5F1451A69C58FD13A41AC74AA2FB656367631C5B3A6223E519114D31BA20D20D
          63A51C6FA8554A58F1900CA674471BEA40099A90000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000002637A131BC190000000002843683CF0319F2836
          9D7E17DEA10DA0F3C0C67CA0DA75F8134BE5CAFCECAE9E3E475E95FBD1DCC282
          32BF3B2BA78F91D7A57EF4773012C801000022ADC9455B8844B84BDD26FF0011
          C9BF8579F5D2E289DEED7F749BFC4726FE15E7D74B8A277BC56FF8DA1F4CBDF1
          6DE1E50801458A80000000000000000000000000000000000000000000000000
          001BF702407D387DC2FD89DE69B9E1B72B6BDDBDA72516563653695D5F64472C
          8FAA289AE72A63397CC36DE54E0A7B7ECE1345A5C366F885CEC2BFF5B128A6E7
          111D3C5B598AE63ECA65B9F29FB9C99D6FBC4B4CE79E70BC3689D26AB2B858D7
          79AF4E8E355C4889FCA5F74D9D75742F375D1CC52F9ECAC6ACBAE6328DF938FB
          49E84D145569545145135D554E94C472CCCF468B29CA5C00F62380F12D31CFED
          7CC16D4F2CFC2EF536746BF76CA29E4FAA756E4CA9B1ED9964A88A32BE48C1F0
          F988D3DF2CAE744573F6D5A6B3F9AAD377AA76B25BA707B7DB4D778B4A69FACC
          EE556E57D84ED8339CD119776798CDE28AF75ADA5DE6C6CE7ECAED38B13FAB72
          E54F73EF6BD8D712D33162984E0963569331355578B5A7EDA69D23FF0052C82C
          ACACECA9E259D114C47CD11A433548B0A636B26BA68061F65AEDEAAAB9FA47FF
          0078B91329FB9D9B39C3F896B9B733E2B8BD71A71ACECF4B0B39FB38BFD5FCB7
          4654E0CFB13C9BC4B4C1B20E1D36D469A5BDE2CFDFAD3CEAB56D34AAD34534EC
          864B75C070EB9FB1B1A63C339DEF96E386DC30EB2F79B95CEC2EF446EA6CACE2
          88FD21F4E91D10946B0FA5DA22223283484A358E944D5D02592358E9471A500C
          B58E9471900278D2800000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000131BD098DE0C8000000001421B41E7818CF941B4EBF0BEF508
          6D079E0633E506D3AFC09A5F2E57E76574F1F23AF4AFDE8EE6141195F9D95D3C
          7C8EBD2BF7A3B9809640080001156E4A2ADC4225C25EE937F88E4DFC2BCFAE97
          144EF76BFBA4DFE23937F0AF3EBA5C513BDE2B7FC6D0FA65EF8B6F0F28400A2C
          5400000000000000000000000000000000000004E93D008037890656767696B5
          C59D959D55D756EA698D665ED32AEC636A99CE69A72E644C5EF94D53DDD376AA
          9A63EB999D39131133B15EC6ED6D789CACA99AA7E519BC48E9ACA9C0076D18E7
          12D71CB4C2F02B1AB967DFEDFDF6BD3EED1AE93F6B73E51F73A323DCB895E70C
          E38A6255472D56774B3A6EF4FD9C69E34CC7E50A94D8D75742FF0075D0FC5EF5
          B2CB8B1FED947EEAFF007EDE5FC959BF34DE3E0996F2CE25895B4EEA2EB74AED
          6AFE2169B94F82C6C2B27716AC3767F70BCDAD3FEADFA26F354CF4E95CCD3FA4
          36861F8661F85D85376C36E36175B0A3B9B2B1B38A288FB22391522EF3D32C9A
          E9C1D5ACEBBD5B447CA233F3CBC958394B8136DFF34F12BB7CB36182D857CB16
          B89DE69B298FB6CE9E3571E6B73652F737E2668B5CEFB4599FFAEC30BBA7AAD2
          D27FF83B8E27EA4E91D0AB16144326BA683E1577D75D335CFCE7F48C9A1329F0
          26E0FD95FDEEBB5CA96B8DDB59E931698A5E6AB589FB6CE9E2D9CFE74B70E5FC
          A195B2ADDA2E79632E61B845847FA771BAD1614FE944443F692A91114EC64776
          C3AE9738CAC2CE9A7BA218C69BB44A44BDA84A358E944D5D00C908E34A35D419
          6B1D289ABA100278D28000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000131BD098DE0C8000000001421B41E7818CF9
          41B4EBF0BEF5086D079E0633E506D3AFC09A5F2E57E76574F1F23AF4AFDE8EE6
          141195F9D95D3C7C8EBD2BF7A3B9809640080001156E4A2ADC4225C25EE937F8
          8E4DFC2BCFAE97144EF76BFBA4DFE23937F0AF3EBA5C513BDE2B7FC6D0FA65EF
          8B6F0F28400A2C540000000000000000000000000489C902749E83E7D032CD03
          F5B02CA79A3345B45865BCBB896275CCE9A5D2EB5DAE93F5F162746DFCA5C0C3
          6FD9AF89695654B3C26C2BE5F7CC4ADE9B3E4E9E2D3C6ABF29887D451555B21E
          EBB6197CBE6AB0B2AAAEE8968BD24D1DB7953DCE0BD55345AE75CFFC489E5AAC
          70EBBF2C7D5C7AF589FD1BA729F022D83E5B8A2D2F7976DF19B6A74E3577FB7A
          ABA6AFB68EE7F8548B0AE5925D341715BC6BB488A23E73FA466AC3B8E1D88627
          6F176C3AE378BDDACEEB3B0B2AAD2AFD22265B2F297063DB8672E25785641C42
          CAC6BD34B6BDD316147E7C6E5FE169D816CFB25657B2A2EF97F2BE1B70A28EE6
          2C2ED4D331F9E9ABD05144531A44722AC5DE3A65935D383CB2A75DE6DA67E511
          96F957C654F73AF3F621C5B6CDD9A70DC2E998FEAB2BBD355B5A47D93C90DD19
          4FDCFCD8F609145AE60BE62B8E5AD3F35A5A4595133F5D34EF8FCDD462A45953
          1D0C9AE9A2584DD32E2D971A7AE75FECD7D96361DB27C9F4D3465EC8584DDA69
          DD5CDDE2D2BFB75AB597BAB0B0B3B0A69B3B2A229A29E4A6988D2221FDC54CA3
          A17EB2BBD9584716CA9888F944000AC08D611357403246BA23594032D6113574
          2004F1A51AEA0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000693D0988E9042622754C4689000000000
          01421B41E7818CF941B4EBF0BEF5086D079E0633E506D3AFC09A5F2E57E76574
          F1F23AF4AFDE8EE6141195F9D95D3C7C8EBD2BF7A3B9809640080001156E4A2A
          DC4225C25EE937F88E4DFC2BCFAE97144EF76BFBA4DFE23937F0AF3EBA5C513B
          DE2B7FC6D0FA65EF8B6F0F28400A2C54000000000000131133BA0D275D349040
          9E2CF43FA5DEEB79BDD716775BBDA5B5733A453453354EBF9276BEA9A66A9CA2
          1FCA39771B9B2F297071DB6E759B3AB02D9CE2F559DA69C5B6BCD97C1ECA7FDF
          69C5A67F56E8CA9EE75ED3F14E25B66ACC9836096557754594D57AB6A7F28D28
          FF00D4FB8B3AA7A177BA68FE257DD7636354C75E5947D65C986E58D651F73D36
          4B83C59DAE67C631BC7ADA9EEE89B4A6EB6357FB688E3C79EDD394B83FEC6B24
          712BCB7B38C12EF6D47736F69768B7B68FFF0065A71ABFE5522EF574B26BA707
          D7FB5D76F553447D6776ADEAA8CA7B27DA6678AA8EC4F21E398A59D7BAD6C2E5
          69363F9DA4C7123F396E9CA7C01F6EB8F712D71BB3C272ED8D5DD45EEF516B6B
          11F553631547EB542CAA8B0A28888A288888DD10FED1C9110A9177A7A592DD38
          3EB8596BBC575573E111FAF9B8D32A7B9C394EE71676D9D33D62989571A4D565
          71B1A2ED6733D1AD5C7AA63EC986E9CA7C13360B93E2CED2E1B3DB8DEEDE8D27
          DFB10D6F55EBD3FF008933113F668DC62A4514D31944326BAE8F61973CB92B1A
          7BE6339DF9BF3B0FC0F0AC2ACA9B0C370CBBDD6CE88D29A2C6CA28888FB221F7
          453A472331F6BBD345344654C64003E811AC74A26AE806431E34CA2759F9C196
          B1D289ABA100278D3289E5F9C000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000349004C427488063A
          4F42621923588DF2679091135531CB32F8B11C670CC2ECA6DAFD7DB2B1A63FEA
          AB967F252B6B7B3BBD13696B545311D3339426226763EDD63A4E353BB56BCC67
          6AD75B29AACB06B9D56F57CD696BFD34FE9BE7F87F7D9EE61C5F1FBF5F6D312B
          CC574D1447128A69D29A797E662963A6F84DEB11A30CBAD7C7AEACF5C47DD8CB
          E7E8AB3615C53C69D8F7A212CC1440000005086D079E0633E506D3AFC2FBD421
          B41E7818CF941B4EBF02697CB95F9D95D3C7C8EBD2BF7A3B98504657E76574F1
          F23AF4AFDE8EE602590020000455B928AB710897097BA4DFE23937F0AF3EBA5C
          513BDDAFEE937F88E4DFC2BCFAE97144EF78ADFF001B43E997BE2DBC3CA10028
          B1604E92064813C59E87A7CB9B30DA1E6EB4A6CB2E64CC5EFF0035F73559DDAA
          8A67FDD3111FCA6226762AD9585ADB4E5674CCF7466F2E98899745E53E027B72
          CC7C4B5C4AE371C0EC6ADF37BB789AE9FF00653ED6E8CA9EE7160961345B672C
          F17ABDD51A71EC6E56316744FF00BAAE57DC59573D0BFDD344B16BDE534D94C4
          75CEA706693BF47E8E1396B30E3D6D45860B825FAFD5D73A5316161557AFE90B
          4ACA5C10761194A28AEC325595FEDACF969B5BFDA4DB55AFE7C9FC36A61396B0
          2C0AC7E0F82E0B72B859FF00D376B0A6CE3FF4C42AC5DE7A6592DD383BB799CE
          F36B11DD19F9AAEB29F03DDBE66C9A2BB1C9B6B8758D7A4FBE621694D8691D3A
          55CB2DD394FDCE0C6EDB896F9CF3EDDAED13A4D56370B09B4AA3EAE355C58FD3
          5777D3469F3328548B0A23A1935D34170BBBEBB489AE7E73FA464E74CA5C04F6
          19977896989E177FC72DA9D2666FB7998A667EAA68E2F27D5ACB71E5AD99E41C
          9D674D196727E1186CD31A71EEF74A29AFF3AB4D67F397A915622236324BB615
          72B9FB0B2A69F0FD5FCACECA28DD0FE91C90912F764002411AC1C6048C38D3F6
          1AC832D63A49AA18E801C69926667E7003400000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000D26
          53A4820D27A19690906311D29DC4CC46F471E98DF2663246B0F8B11C630DC32C
          A6D6FD7DB2B1888D74AAAE59FC9E2B18DAADD6CB5B2C22EB55B55FFDCB4E4A7F
          458716D25C3304A78D7CB5889EADB3F48D6FBA2CEAAF64360556D674471ABAE2
          988DF33C8F358CE7DC030A9AA8F84C5E2D23FC965FD5FACEE6ACC5B34E398CD5
          3F0CBF57C49FF4E89E2D31FA3F2746AAC6B85AAEBCECF0AB2CBFDAAFD23D5EBA
          2E996BAA5EC717DA66357ED6CF0FA69B9D94FCF1FD55FF00D9E4EF179BC5F2D2
          6DAF56F696B5CFF9ABAA665FCC6ABC4F1DC4718AF8D7DB69ABE59EAFA46A7AA9
          B3A68FC303616C8FE537EFB94FADAF5B0B647F29BF7DCA7D6BF707BF115DFBE7
          CA5F178F652D9B09446E4BAA616A0000001421B41E7818CF941B4EBF0BEF5086
          D079E0633E506D3AFC09A5F2E57E76574F1F23AF4AFDE8EE6141195F9D95D3C7
          C8EBD2BF7A3B980964008000115251546B1A0384BDD268D311C9BF8579F5C38A
          3966792169DC22B83247080C5303BC5EF3557845D708A2D29B4A2CEEB16B696B
          C698DD3354453BBA25F8594B804EC372FD545AE2D71C4B1FB6A3978D7FBDCC53
          33F72CE29A67EC98979ED2CA6BAF386ACC7744F10C5B14B4B7B3888A272D733F
          28E85685958DADBDA536361655DA5A573A534514CD55553F5446F6C1CA9C1F36
          CD9CEAA3FB0F6778C57675EEB5BC58FC1E8D3A75B4E2EB1F62D572C6CA767793
          6CE9B2CB192B07C36298D35BBDD28A667EB9988D665E9E2EF453C945114C46ED
          08BBC46D956BA7075446BBCDB4CFCA98FD655D594BDCF3DAB631C4B5CCD8DE11
          82D94F2CD345555E2D23EA988E2C44FE72DCF94FDCEFD99617345AE68C6F16C6
          6B8E5AA88B48B0B39FB38BFD5FCBACA8A78B1A3254A6CA9A7A1935D743F08BB6
          BE4B8D3FED39B5AE53E0EDB1CC99145781E40C2A8B6A375B5AD8C5ADA4FDB555
          AEAF7F77C3AE973B28B1BA5D2C6C688FF2D9D114C47E50FAC548D5B19058DD6C
          2EF19595114C7CA22185144531A33015C00011331071A012309AA750196B0719
          8E91BC0359000D20000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000D35004E929D2011A491
          1D2C9133A01A68963C7A5F26218C6198658FBF6217DB2B0A3A6BAB4D7EC8F9D4
          AD6DECEC289B4B5AA2223A675426226753ECD618D56B4511335551111BE65AFF
          0018DAADD2CA2AB2C1AE955BD5BA2D2D7FA69FCA37CFF0F118B66AC771AAA7E1
          B7EAFDEE7FD3A3FA69FD237FE6D7B8CF09984E1B9D9DDA66DABFF5D9F5F4CDE8
          A2ED5D5B75369E339F700C266AA3E15179B58FF4EC7FABF59DCF0F8C6D3719BF
          4556570A29B9D9CFCF1CB5FEAF1B3333296A7C67846C6715CE8B3AB92A27A29D
          BE33B5EBA2ED451B75BFA5E2F579BDD736B7AB7AED6B9DF55754CCBF92460969
          695DAD535DA4CCCCF4CEB95688CB6003E120003616C8FE537EFB94FADAF5B0B6
          47F29BF7DCA7D6CD383DF88AEFDF3E52A378F652D9B1B9288DC9754C2D400000
          02843683CF0319F28369D7E17DEA10DA0F3C0C67CA0DA75F8134BE5CAFCECAE9
          E3E475E95FBD1DCC28232BF3B2BA78F91D7A57EF4773012C8010000000000000
          08998838D009184D53F341ACF4832998838D0C748009AA7535900348DE000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000001A6A9D24109D253A42418C474A74D099D11C
          78F9CCC648D621F1DFF17C370DB29B5BF5EECEC698FF00AAA78AC636AB74B2E3
          5960F75AADEADD16969FD34FE9BE562C5F4930CC129E35F2D6299EADB33E1B5F
          7459D55CEA87BFAAD68A235AAAD23A65E7319CF997F0999A26F7EFF6B1FE9D94
          71A7F39DD0D598B66BC7B19998BDDFAA8B3FFEDD9FF4D3FF0077E3CFD4D538CF
          0B75D59D9E176597FB55E91FACBD745D3A6A97B3C6369D8D5F78D6586D145CAC
          A7938D1FD55FEB3C90F2379BCDE6F96936D7BB7B4B6B49DF55A55354FF002FE6
          3566298F6238CD5C6BEDACD5F2CF57D2353D5459D3447DD8005A1F6000000000
          0003616C8FE537EFB94FADAF5B0B647F29BF7DCA7D6CD383DF88AEFDF3E52A37
          8F652D9B1B9288DC9754C2D40000002843683CF0319F28369D7E17DEA10DA0F3
          C0C67CA0DA75F8134BE5CAFCECAE9E3E475E95FBD1DCC28232BF3B2BA78F91D7
          A57EF4773012C801000000031E37D49AB7318DC099AA7E646B20069A80000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000001CBD0009E2CA62011A4C914F4B244CE806
          91096335C44E9A3E4BFE31876196536D7FBDD9D85311FE6AB97F28DF2A56B6F6
          76344D7695444474CEA4E532FB3586355AD14471AB98888DF32F038C6D52E563
          C6B3C1EED55BCFCD695FF4D3F946F9787C5F3663D8CCCFC2AFD5459CFF00A747
          F4D2D7B8CF09984E1933677799B6AFAA9D9FFF005B3E99BD145DABAF6EA6D3C6
          B3E60184EB47C2A2DED63FC965CBFCBC3631B4EC62FBC6B2C3A8A6E9673F3C72
          D7FABC6E93BE6794D1AA319E11B18C573A2CAAE4A8EAA76FD76BD545DA8A3E6F
          ED78BDDEAF96936B7ABC5A5AD73CBAD756AFE291815A5A576B54D75CE733D32A
          F96400F948000000000000000000D85B23F94DFBEE53EB6BD6C2D91FCA6FDF72
          9F5B34E0F7E22BBF7CF94A8DE3D94B66C6E4A23725D530B50000000A10DA0F3C
          0C67CA0DA75F85F7A843683CF0319F28369D7E04D2F972BF3B2BA78F91D7A57E
          F47730A08CAFCECAE9E3E475E95FBD1DCC04B200400000031AB7223726ADC88D
          C000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000072FCD09E2C8208899F9B46511A2
          418C52C9133A46A8E3C7422662368C91ABE4BF62F8761B6536D7EBDD958D11F3
          D75443C5635B56B8D96B67835D6ABC55F35A5A6B4D1FA6F959316D23C3305A78
          D7CB68A67AB6CFD235BEE8B3AABD90F7D55A534C4CCF268F3D8DE7BCBF844556
          75DEE2DEDE9FF4AC7FAA75FAE7747E6D558BE6DC7F1A9AA9BDDFEBA6CA7FD2B3
          FE9A3F8DFF009BF1E22623486A9C6785BAAA89B3C2ACBFF6AFF4A7D5EBA2E91F
          9E5ECB17DA6E337DE359E1D6745CECE7938D1FD55CC7DBBBF8792BCDEAF57CB5
          9B6BDDE2D2DAD27FCD5D5332FE496ACC531EC4718AF8D7DB59ABE5D1E11B1EAA
          2CE9A3F0C23ED482CDB1F600900000000000000000000000006C2D91FCA6FDF7
          29F5B5EB616C8FE537EFB94FAD9A707BF115DFBE7CA546F1ECA5B36372511B92
          EA985A80000005086D079E0633E506D3AFC2FBD421B41E7818CF941B4EBF0269
          7CB95F9D95D3C7C8EBD2BF7A3B98504657E76574F1F23AF4AFDE8EE602590020
          0000018D5B911B9356E446E00000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000D2677400278BD
          2988D018C44CFCDA278B2C913C8091871FEA7CB7EC5EE186D9CDADFAF565634C
          46BFD5569FC28DADBD958D135DA5514C474CEA84C44CEC7D9AB1AAD69A235AA6
          2223E799783C636A971B2E35961376AADEA8E4F7CAFF00A69FFBBC3E2D9BB1DC
          66662F57DAA8B39FF4ECFF00A69FE1AFF19E12F08C333A2C266D6BEAA767D7D3
          357A2ED5D7B7536A6339EF2FE11136769798B6B58DD6765FD53FF6785C6769B8
          B5F38D658659D374B39FF34FF557EC78CE5DFAEF47CED518C70918CE29334D95
          5C951D54EDFAEDF27AE8BB514EBDAFED7ABE5EEFD6B36D7CBC5A5B573FE6AEA9
          997F2FAE4180DA5A576B571ED2739EB9DAAF96400F9480000000000000000000
          00000000000000D85B23F94DFBEE53EB6BD6C2D91FCA6FDF729F5B34E0F7E22B
          BF7CF94A8DE3D94B66C6E4A23725D530B50000000A10DA0F3C0C67CA0DA75F85
          F7A843683CF0319F28369D7E04D2F972BF3B2BA78F91D7A57EF47730A08CAFCE
          CAE9E3E475E95FBD1DCC04B200400000031AB7223726ADC88DC0000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000006933B9314CFCE08222AF9F46511A2418F17EB6430E3CF4233C8668D7
          487C97EC56E386D8CDBDFEF56561671FE6B4AA23FF00FAF178CED5AE36315596
          1174AEF35C7245A5A7F4D1F6C46F9FE164C5B48F0CC168E35F2DA299EACF39FA
          46B7DD367557B21EF26D6298D6AD223EB7E06319EF00C238D4577A8B7B58FF00
          4EC7FAA75FAE7735562D9BB1FC6A669BDDFAAA6CA7FD2B3FE9A7F8DFF9BF1B4E
          5D665AA719E16EA9CECF0AB2FF00DAAFD298FD67C1EBA2E9FDF2F698C6D3F17B
          DCCD9E19654DD2CE7FCDDD57FABC95EAF97ABEDA4DADEEF1696D5CCEB335D5AB
          F825AB314C7F12C62AE35F2DA6AF9679447746C7AA9B3A68FC3000B3BEC00000
          00000000000000000000000000000000000006C2D91FCA6FDF729F5B5EB616C8
          FE537EFB94FAD9A707BF115DFBE7CA546F1ECA5B36372511B92EA985A8000000
          5086D079E0633E506D3AFC2FBD421B41E7818CF941B4EBF02697CB95F9D95D3C
          7C8EBD2BF7A3B98504657E76574F1F23AF4AFDE8EE6025900200000018D5B911
          B9356E446E000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000239594469F3831D2AF9B44F17A59000C26BD274
          87CD7EC56E386D136B7DBD5958D311ACCD5568A56B6F67634CD7695444474CCE
          498899D8FAE58556914C6B331111D2F098CED5AE161C6B1C2AED55E6A8E4F7CA
          BFA68F6CBC362D9C31EC66669BCDF6AA2CA7FD2B2FE9A7F8E596BFC6B84AC1F0
          CCE8BBD5CAD71D14ECF1AB67D3357A2ED5D5B7536AE339EB00C1E268B5BD45B5
          B47FA565FD557B23F3785C676A38BDF38D6785D95173B39FF3CFF557FCF247F2
          F17A6BBCD1A9F19E12719C573A2C6AE468EAA76F8D5B7E993D745DA8A7E6FED7
          ABDDEEFD6D378BEDE6D6DED2ADF55A55354FF2FE3A24605696B5DAD535DA4CCC
          CF5ABC465AA001F0900000000000000000000000000000000000000000000000
          01B0B647F29BF7DCA7D6D7AD85B23F94DFBEE53EB669C1EFC4577EF9F2951BC7
          B296CD8DC9446E4BAA616A0000001421B41E7818CF941B4EBF0BEF5086D079E0
          633E506D3AFC09A5F2E57E76574F1F23AF4AFDE8EE6141195F9D95D3C7C8EBD2
          BF7A3B9809640080000006356E446E4D5B911B80000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000002235022356511A11
          1A1320944F23E6BE62374C3ECA6F17DBCD9D8D9C7CF5D510F178C6D56E1778AA
          CB09BBD579AB771EBFE9A3DB2B262DA458660B471AFB6D14CF574CF746D7DD36
          7557B21EEAAB48A759998888F9DF818CE7AC0B0789A2D2F54DB5AC6EB3B2FEA9
          FD77355E2D9BF1EC66662F37DAA8B39FF4ECFF00A69FFBBF1A796759DED538CF
          0B53AECF0BB2FF00DAAFD223F597AA8BA7F7BDA631B4FC56FBC6B3C36C69BA51
          3FE69E5ABFECF237BBEDEEFD6936D7CBCDA5B573F3D754CBF88D578A6906258C
          D5C6BEDACD5F2CF57D363D74D9D347E184689059F3CDF6000000000000000000
          0000000000000000000000000000000000000003616C8FE537EFB94FADAF5B0B
          647F29BF7DCA7D6CD383DF88AEFDF3E52A378F652D9B1B9288DC9754C2D40000
          002843683CF0319F28369D7E17DEA10DA0F3C0C67CA0DA75F8134BE5CAFCECAE
          9E3E475E95FBD1DCC28232BF3B2BA78F91D7A57EF4773012C8010000000C6ADC
          88DC9AB722370000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000CA218C72CE8CA67EB44CE431AABE2FCEF0F9AF68F77
          C32BB4B8613145BDE6358AAD27B8A27FE65FCF68D9B6D30FB2FEC7C3ED34BC5A
          D3ADAD713CB453D1F6CB56EF99999D665A734F34FAD30FB5AB0DC3272AE35555
          757CA3E7D6F658584551C6A9F5E238AE218B5B4DE310BDDA5B57F371AAE48FB2
          373E43F34B45DBDBDA5E2B9B5B5AA6AAA76CCCE732F7E5111940029000000000
          00000000000000000000000000000000000000000000000000000003616C8FE5
          37EFB94FADAF5B0B647F29BF7DCA7D6CD383DF88AEFDF3E52A378F652D9B1B92
          88DC9754C2D40000002843683CF0319F28369D7E17DEA10DA0F3C0C67CA0DA75
          F8134BE5CAFCECAE9E3E475E95FBD1DCC28232BF3B2BA78F91D7A57EF4773012
          C8010000000C6ADC88DC9AB72237000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000002698E5D5FC6F978A2ED76B5BC573
          1116744D53F943FB53BB579CCFD7B9B9E5ABE554CE93694C59FEB3A2DF8ADEFE
          C172B5BCFF0065333F487D5119D510D3B8ADFED313C46DEFD6B3ACDB573547D5
          1F347E8F991F5A5C6F6F6D5DE2D2AB5B49CEAAA6667C57888CA3280052480000
          00000000000000000000000000000000000000000000000000000000000000D8
          5B23F94DFBEE53EB6BD6C2D91FCA6FDF729F5B34E0F7E22BBF7CF94A8DE3D94B
          66C6E4A23725D530B50000000A10DA0F3C0C67CA0DA75F85F7A843683CF0319F
          28369D7E04D2F972BF3B2BA78F91D7A57EF47730A08CAFCECAE9E3E475E95FBD
          1DCC04B200400000031AB7223726ADC88DC00000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000CA9EE61E2F6A7693465FA
          688DD5DB53AFE5CAF674BC4ED5A26702B1D3FF00BD1AFE8C5F4D6669C02F531F
          D92AB63ED21A9C07252EC0000000000000000000000000000000000000000000
          000000000000000000000000003616C8FE537EFB94FADAF5B0B647F29BF7DCA7
          D6CD383DF88AEFDF3E52A378F652D9B1B9288DC9754C2D40000002843683CF03
          19F28369D7E17DEA10DA0F3C0C67CA0DA75F8134BE5CAFCECAE9E3E475E95FBD
          1DCC28232BF3B2BA78F91D7A57EF4773012C8010000000C6ADC88DC9AB722370
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000026978FDA8D9CD7972AAE23FF2ED689FD6747AFA67965E733F587C232C
          5F7935E25315FE92C7F4A6CB97C1AF3671D3455BA152CBF1C34A241C84BB8000
          0000000000000000000000000000000000000000000000000000000000000000
          00D85B23F94DFBEE53EB6BD6C2D91FCA6FDF729F5B34E0F7E22BBF7CF94A8DE3
          D94B66C6E4A23725D530B50000000A10DA0F3C0C67CA0DA75F85F7A843683CF0
          319F28369D7E04D2F972BF3B2BA78F91D7A57EF47730A08CAFCECAE9E3E475E9
          5FBD1DCC04B200400000031AB7223726ADC88DC0000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000004775F6BF3F305DBE1
          3835F6EFA6BC7B1AA3F87E84724EAC2F34C5A585A59E9DD5331FC3CD7CB18B7B
          BD7653D3131F584D3394E6E748DC97F6BED94D8DF2DEC6634E25AD54FE92FE2E
          2FB6A392B4AA89E89985E62738CC014D20000000000000000000000000000000
          000000000000000000000000000000000003616C8FE537EFB94FADAF5B0B647F
          29BF7DCA7D6CD383DF88AEFDF3E52A378F652D9B1B9288DC9754C2D400000028
          43683CF0319F28369D7E17DEA10DA0F3C0C67CA0DA75F8134BE5CAFCECAE9E3E
          475E95FBD1DCC28232BF3B2BA78F91D7A57EF4773012C8010000000C6ADC88DC
          9AB7223700000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000009AE39275F9D8CEE65FE544C66344E70BB7C17325FACA234
          89B59AA9FB2795F8EF5FB51BAFBCE618B788D22DEC6263F2E478F87206945D7E
          C58CDE6C7AAB9DF39AEF6539D109016254000000000000000000000000000000
          0000000000000000000000000000000000001B0B647F29BF7DCA7D6D7AD85B23
          F94DFBEE53EB669C1EFC4577EF9F2951BC7B296CD8DC9446E4BAA616A0000001
          421B41E7818CF941B4EBF0BEF5086D079E0633E506D3AFC09A5F2E57E76574F1
          F23AF4AFDE8EE6141195F9D95D3C7C8EBD2BF7A3B9809640080000006356E446
          E4D5B911B8000000000000000000000000000000000000000000000000000000
          00000000000000000000000000D600037A78B208000000000000000000000000
          0000000000000000000000000009E58654EE62CA9DDA74035BED72EBF21BE69C
          913559EBFCB5BC36F6D46EDF08CBD3694D3FD5616B4D5F97CED430E63E136EBF
          67C7EBAE3F3C455BB2FD173BB4E766901AF9E800000000000000000000000000
          00000000000000000000000000000000000000001B0B647F29BF7DCA7D6D7AD8
          5B23F94DFBEE53EB669C1EFC4577EF9F2951BC7B296CD8DC9446E4BAA616A000
          0001421B41E7818CF941B4EBF0BEF5086D079E0633E506D3AFC09A5F2E57E765
          74F1F23AF4AFDE8EE6141195F9D95D3C7C8EBD2BF7A3B9809640080000006356
          E446E4D5B911B800000000000000000000000000000000000000000000000000
          0000000000000000000000004C46A08D6065C58E848238B1F3C1A69B8D60D601
          220D63A412C6A8E5D53AC74A4180000000000000000000000000000000000000
          000000000002699E598414F740FC7CDD74F8665DBFD8446B3EF53547E5CBFF00
          0D130E89BED945BDDAD6C663FF00328AA9FD61CF97AB29B0BCDAD94C69345755
          3A7E6D0FC2FDD38B6F76BD65B6269FA4E7FABDD749D530FE4034D3DA00000000
          00000000000000000000000000000000000000000000000000000000003616C8
          FE537EFB94FADAF5B0B647F29BF7DCA7D6CD383DF88AEFDF3E52A378F652D9B1
          B9288DC9754C2D40000002843683CF0319F28369D7E17DEA10DA0F3C0C67CA0D
          A75F8134BE5CAFCECAE9E3E475E95FBD1DCC28232BF3B2BA78F91D7A57EF4773
          012C8010000000C6ADC88DC9AB72237000000000000000000000000000000000
          000000000000000000000000000000000002623538BF582197163E74A008888D
          C946B1D2C6D2D6CECE8AABAEBA69A6239666748844CC446726D65AC1354446BA
          C35FE6BDB2E51CB3C7B0A6F7F0FBD531A7BCDDE78DA4FD756E8699CD5B6CCDB9
          866BB0B95AFF00665D6AFF00258CFF005CC7D757B18B62DA6186613134D55F1E
          BFEDA75CFD764322C3345F11C4F2AA9A38B4F5D5AA3D65BF3346D1B2AE54A6AF
          ED5C4ECE2D62358B1B39E3DA4FE51FF2D4798B84662F79AEBB2CB58558DD6CF7
          536D79FEBAE7EBE2C6911FCB4FDA5ADADB5736B6F695DA5A553ACD554EB333F5
          CB16B3C574FB12BECCD3769E4A9F96B9F19F4C9B0F0DD08B85D222ABCFF52AF9
          EA8FA7ABD4623B50CFF89D5355BE68BED9F1BE6B0AFDE634FF00668F9EE3B41C
          EF87DBD378BBE6AC4E6699D74B4BCD7694CFDB4D53312FC018A558ADFAAAF949
          B6AB3EBE34FAB24A70BB8D147271634E5FF8C3AE36679C2739E58B0C52DA29A6
          F344CD8DE29A7771E3E78FB7925EBE37348F06CBD55561F8C5D27969B3B6B3AE
          23ED8AB5F5437753DCC3A1746EFD5E2385D8DE2D273AA635F7C6A68CC76E745C
          311B5BBD9FE189D5DD3AD8CF7413DD0BE2D20000000000000000000000000000
          0000000000000000011C950015EE9FADA2736DD7E0798AFF006311A47BECD54C
          7D52DF13B9A7769F75F78CC9EFDA6916F654D5FA727FC35670B175E5707A2DFA
          68AE37C4C7A3D574AB2AF27914A212E755C40000000000000000000000000000
          000000000000000000000000000000000000006C2D91FCA6FDF729F5B5EB616C
          8FE537EFB94FAD9A707BF115DFBE7CA546F1ECA5B36372511B92EA985A800000
          05086D079E0633E506D3AFC2FBD421B41E7818CF941B4EBF02697CB95F9D95D3
          C7C8EBD2BF7A3B98504657E76574F1F23AF4AFDE8EE6025900200000018D5B91
          1B9356E446E00000000000000000000000000000000000000000000000000000
          0000001311D208349E865C584831E2FD6988D1289988DE0944CC4238F4FF00D5
          0FCBC773260997AED37BC5F13B0BAD111C9C7AF49ABEC8DF2A76B6B458D335DA
          4C44474CBEA8A2AB4AB8B44673D50FD5E3474BE5BFE2172C3AC2ABD5F6F56561
          65446B55769544447EAD2F9B38445853C7BAE54C3E6D2AE588BCDBF253F6C53F
          3FE6D4598337662CCF6F36D8CE2B6D6FACF251C6D288FB298E460D8B69FE1F71
          CECEEDFD4AFE5F87EBD3E0CC30CD0ABF5F72AEF1FD3A7E7B7E9EADED9AB6FB97
          7098B4BB607635625788D638D13C5B389FB7E769BCD1B4ECDD9AEAAA8BEE255D
          8DDEAFF42C2668A7F3D3965E53725AC715D2CC4F16CE9AEBE2D1D54EA8FDDB13
          0CD17C3B0CCAAA28E355D756BDDB20E59D6677C80C6B6B22D8000023506F6E0D
          144FBC6396BF371EC69FE2A6F36A1E0E971AEEF95AF77DAA8D22F57BD23937C5
          31FF0076DD8DCE8AD0FB29B2C16C22AEACFEB332D0DA516B16D8BDBCC744E5F4
          888633DD00C996000000000000000000000000000000000000000000000009E4
          8113B819C72C35AED72EBA5771BDC53F35544CFF003FF2D951B9E336A376F7FC
          BDEFDA72D85B5356BF54EB1EC621A7775FB668FDE68E988E37D27356B09CAD21
          A8F780E515D40000000000000000000000000000000000000000000000000000
          000000000000006C2D91FCA6FDF729F5B5EB616C8FE537EFB94FAD9A707BF115
          DFBE7CA546F1ECA5B36372511B92EA985A80000005086D079E0633E506D3AFC2
          FBD421B41E7818CF941B4EBF02697CB95F9D95D3C7C8EBD2BF7A3B98504657E7
          6574F1F23AF4AFDE8EE6025900200000018D5B911B9356E446E0000000000000
          00000000000000000000000000000000000000004C4278B00C7494C427724111
          1A251AE84D511BE4128E3474B0AED6CE98E3556914C46F999D1E1736ED832865
          7AABB1AAFB17DBD53AC7BC5DA62B989E899DD1FABC97CBFDDAE1472979AE298F
          9BD176BA5BDF2BE4EEF44D53F27BC9AE888D66A8799CD5B42CAF94A899C5B14B
          18B588D62C289E35ACFF00B63963ED9E4683CD7B70CDB98B8F77C3EB8C2AEB56
          B1C5B09FFC4AA3EBAF7C7E5A35E5ADA5ADB5A556B6D5D5695D53ACD554EB333D
          3ACB5D62FC2358D9E7678751C69FEE9D51F4DACEF0BD02B7B5CABBFD7C58FED8
          D73F5D90DB99B3842E318845774CB1718C3EC6793E116BA576B31D311BA9FE5A
          B311C5712C5EF35DF314BF5BDEADEB9D66BB5AE6A9FAB7BE44B5A6258E5FF16A
          B8D7AB4998EAD91F486C1B860B72C329E2DDACE227AF6CFD64016A5D00000000
          010CECACABB7B5A2C6CE266BB4AA29A62237CCCB07B8D8DE5DEC873CDCFDF2CF
          8D77B86B7BB5E8FE9EE63CEE2BDB875CEAC42F56776A36D5311EAF1E217BA6E3
          75B4BCD5F96267D37BA4725E036796F2CE1D84514C45561634C5A69F3D73CB54
          FEB32FDE9963453A69A3299E574ED858D377B2A6CA8D94C4447839DAD6D2AB6B
          4AAD6B9CE6A9CE7C5002B3E00000000000000000000000000000000000000000
          00000001953B9F899CAE9F0BCB97FB2D35D2CA6BF3797FE1FB54BF8DF2C62F17
          5B6BBD5BAD28AA89FCE1E2C46EF17BBA5AD84FE6A663EB0FAA67298973B8CEF1
          673656F6965546934D53131F64B0718DA53345534CF46A5E76C6600F90000000
          0000000000000000000000000000000000000000000000000000000006C2D91F
          CA6FDF729F5B5EB616C8FE537EFB94FAD9A707BF115DFBE7CA546F1ECA5B3637
          2511B92EA985A80000005086D079E0633E506D3AFC2FBD421B41E7818CF941B4
          EBF02697CB95F9D95D3C7C8EBD2BF7A3B98504657E76574F1F23AF4AFDE8EE60
          25900200000018D5B911B9356E446E0000000000000000000000000000000000
          000000000013A482065C582234044474A7488480089988E59471A34D41333A1C
          6A7A5F9B8CE61C1701BBCDEB17C46C6ED6711FE7AA2267EC8F9DA8F35F086BAD
          871EEB95EE3F08AF745E2DB9298FAE23E75A313C76E184D39DEAD2227AB6CCF8
          2E570C22FB89D5C5BB59CCFCFA3EADCB7CBFDCEE56355BDEEF36763674C6B355
          754444359E6BDBDE5AC1F8F76C1A99C4EF34F244D1C96713F5D5F3FE4D0D98B3
          8E63CD16B36B8CE276B6D4CCF259C4F1688FB298E47E2C4359E2DC235BDB6746
          1D47163FBA75CFD3646F6C1C2F406CACF2AEFF005F1A7AA367D76CEE7AECD3B5
          3CE19AEAAECEF5885576BB57FF00D3DDE668A74E899DF2F23091AF2F77EBC5FE
          D395BCD73555F3967975B95DEE5472777A2298F9003CAF48000000000000000E
          86E0EF977E0597EF3982D6CF4B5C42D78967AC7FA54726BF9D5C6FD21CFD73BA
          5B5FAF96172BB51C6B5BC5A53654474D554E91EB76765AC1EC301C0EE3835DA2
          38973B1A6CB5E9988E59FCE7596C4E0EB0EE5EFD5DF26355119477CFED9B01D3
          EC4391BA5174A675D739CF747EEFD48E4863BD33C91A23737635280000000000
          00000000000000000000000000000000000000002699E59845713A14EF9653B9
          1319C64342E6BBAC5D331E216311A445BD55447D533AFF00CBF261EB769D75F7
          8CCF36DA725E2C68AFF4FE9FF879371EE925D7EC58BDE6C3AABABCF3F295DECA
          AE3511200B2AA000000000000000000000000000000000000000000000000000
          0000000000000D85B23F94DFBEE53EB6BD6C2D91FCA6FDF729F5B34E0F7E22BB
          F7CF94A8DE3D94B66C6E4A23725D530B50000000A10DA0F3C0C67CA0DA75F85F
          7A843683CF0319F28369D7E04D2F972BF3B2BA78F91D7A57EF47730A08CAFCEC
          AE9E3E475E95FBD1DCC04B200400000031AB7223726ADC88DC00000000000000
          0000000000000000000000009D253A4031D354C474A74D1208D2122012319AE2
          274944DA511BE519C19B29AA237A26BA63E7788CDDB5DC9995B8F636B8845F2F
          74727C1EEBA57544F4553BA9FCDA5F356DD336E3FC7BBE17551855D6AD634B19
          99B598FAEBF9BF2D18C62DA5D866139D35D7C6AFFB69D73E3D10C830CD18C471
          4CAAB3A38B47F755AA3C3A65BF333E7ECAD956CAAAB16C5ACA8B488D62C299E3
          5A4FFB63FE5A73357086C56F935DDB2BDCA9B9D9CF27BFDB44555CFD91BA1A86
          DADEDEF16955B5E2D6BB4B4AA759AABAA66667ED61F3B58E2FA7B885FF003A2E
          DFD2A7E5F8BEBE8D87866845C6E795779FEA55F3FC3F4F57D98A62F8A63579AA
          F78A5FADEF36B56FAAD2B997C70918457695DAD5355739CCF4CB32B3B3A2CA98
          A2CE3288E88007C3EC000000000000000000001B0F61997671BCED657DB5B3E3
          5861744DE2AE4E4E3EEA23F5999FF6BA8E88D29DCD57B00CBB385E539C5ED6CF
          4B6C52D26D235DFEF74F253FF33F9B6AC7243A0F42B0EFE1F84D1C68FBD5FDE9
          F1D9BB268CD2DBFF00DBF14B49A67EED1F763C36EF633AEA1AEBCA32D6340000
          0000000000000000000000000000000000000000000000098DE9963AE8CF7835
          96D76EBC5B6B85F2237D35D9CFE53131EB96BC6DADA95D7DFF002F5378D396C2
          F14D5AFD53AC7AE61A95CC3C25DD7ECDA41695C6CAE29AB765FA2E7769CECC01
          803D000000000000000000000000000000000000000000000000000000000000
          00003616C8FE537EFB94FADAF5B0B647F29BF7DCA7D6CD383DF88AEFDF3E52A3
          78F652D9B1B9288DC9754C2D40000002843683CF0319F28369D7E17DEA10DA0F
          3C0C67CA0DA75F8134BE5CAFCECAE9E3E475E95FBD1DCC28232BF3B2BA78F91D
          7A57EF4773012C8010000000C6ADC88DC9AB7223700000000000000000000000
          00000009D241069AB2D20D2201111D29D21200000899D11C7A5F9F8BE60C1B03
          BBD57AC5AFF6376B3A235D6D2A88FD3A5F169694595335573943EA9A6AAE78B4
          C672FD0E343F95E6FB75BAD9556D79B7A2CACE88D6AAAB988888FB5A6B35F087
          B8DDAAAEED956E537AAE3922DEDBFA6CFF0028DF2D3F9933B667CD76B35E338A
          DB5AD9CCEB16313C5B3A7ECA63FE58462FA7987DC33B3BBFF52AF96A8FAFA32E
          C3342F10BF655DB7F4E9F9EDFA7AB7CE6DDBD656C166BBBE0DC6C56F34EB11EF
          73A5944FD75FCFF96AD359AB6AF9CF35CD56379C466E974ABFFA7BAEB45331FF
          00F94EFABF39D3EA78EE54B58E2DA5F89E2D9D3557C4A27A29D5F5E996C4C2F4
          530EC332AA29E3D7D756BFA46C8469CA9062EC92350000000000000000000000
          000000FAB08C3ADB18C52EB855DE27DF2F76D4D8D3C9BB59D35FCB7BE56CFD80
          65D8C4F36D78C5B59EB6586D971A9998E4F7CAB923F8D573C1AE156257FB2BAC
          7E69D7DDB6772DD8BDFA30EB95A5E67F2C6AEFE8DEE89C1B0DB1C270DBAE1B77
          B3E2D95DACA9B2A23A222221F74EED134F730C6AD7574D59D11674C514EC8D4E
          79AAA9AE66A9DB200FB400000000000000000000000000000000000000000000
          0000000227E6FB59C6E612CE3703F0B3A5D66F796311B2D359A6C66D23EDA7FA
          BFE1A3235D1D137DB1A6F375B6BBD7DCDA51344FD931A39E6D689B3B4AACAA8D
          268AA6263A25A1785FBA716F576BD47E6A669FA4E7FABDF739D534B101A71EC0
          000000000000000000000000000000000000000000000000000000000000001B
          0B647F29BF7DCA7D6D7AD85B23F94DFBEE53EB669C1EFC4577EF9F2951BC7B29
          6CD8DC9446E4BAA616A0000001421B41E7818CF941B4EBF0BEF5086D079E0633
          E506D3AFC09A5F2E57E76574F1F23AF4AFDE8EE6141195F9D95D3C7C8EBD2BF7
          A3B9809640080000006356E446E4D5B911B8000000000000000000000013A4CA
          62018EF4C53D29D21208D212000319AA239419226746136B4D31ACEE878CCD9B
          5BC9D95E2BB2B7C422F57AA7FD0BBCC5756BF5CEE8796F77DBBDC6CF95BC5714
          D3D732AF76BADB5F2BE4EC299AA7AA2337B59AE21E7F3267BCB195ECAAAB16C5
          2CACAB88E4B289E3573F9434266ADBB66AC6F8F61844C61776AB923DEE75B498
          FAEAF9BF26B7BCDE2F37CB6AADEF36F5DADA553ACD55D53333FAB5DE2DC22D85
          8E76787D1C79FEE9D51E11B659CE19A0778B6CABBF55C48EA8D73E90DC19AB84
          2E21789AEEB95EE7176A27922DEDA35AF4E988F99AA716C6F17C76F137BC5F10
          B7BD5A553AEB695CCC47D91F33E1D12D6B89E3D8862D56779B4998EAD91F46C2
          C3B04B8E174C45DECE227AF6CFD51A241665D801200000000000000000000000
          0000000226748974F6C372E4E0D936C6F5694696D8855378AB5E89E4A7F873A6
          5BC1ED71EC7AE3845953354DEADA9A27EEEBCBFC6AECBC3AE745C6E76174B1A2
          29A2C68A68A623A22346CEE0DF0EE52DED2FD546AA7EEC77CEDDDE6D75A7F7FE
          258D9DCA9FCD3C69EE8D9BFC9F56E8DCC5954C5B89AB00000000000000000000
          00000000000000000000000000000000000654EE629A677C022A8D625A1734DD
          7E0799311BBE9A445E2BAA23EAABFAA3D6DF9313A4C34DED36E9F07CD15DA69C
          978B1A2D3F3EE7FF008C354F0B575E5709B3B78FC95C7D26263CF27AEE939579
          3CA084B9DD700048000000000000000000000000000000000000000000000000
          0000000000003616C8FE537EFB94FADAF5B0B647F29BF7DCA7D6CD383DF88AEF
          DF3E52A378F652D9B1B9288DC9754C2D40000002843683CF0319F28369D7E17D
          EA10DA0F3C0C67CA0DA75F8134BE5CAFCECAE9E3E475E95FBD1DCC28232BF3B2
          BA78F91D7A57EF4773012C8010000000C6ADC88DC9AB72237000000000000000
          988D4103288E9348E8044529D23A12000000C78F100C98CD70F8714C7B09C16E
          F55EB15BF58DD6CA98D66BB5AE2986A6CD9C21F0BBA4D776CA971AEFB6B1FEBD
          B6B45947D711BEAFE3ED5AB12C6AE38553C6BD5A447CB6CFD170B86157CC4EAE
          2DD6CE6AF9F47D763715BDF2C2ED6555B5BDA536767444D555554E914C74CCCB
          5B66DDBBE53C0E2BBBE115558B5EA377BD4E96513F5D7F3FE5AB42666CF39A73
          75ACD78D62D6B6967AEB16147F45953FED8E49FCF59FADF83A6BBDACF16E11ED
          AD33B3C3A8E2C7F755B7C236478E6D8186680D14E55E215E7FEB1B3C676CF864
          F699AB6B59C735457636B7E9B9DD6AFF00E9EED334D331F5CEF978CAA66A99AA
          A99999DF320D777CBFDE710B4E52F35CD53F3967B74B8DDAE3472777A2298F97
          EBD600F23D6000000000000000000000000000000000000022776E32CCD8DB7C
          1E72F7C371FBD63D6B671345C6CFDEECE67FEBABFECE8DA6348D1E0B63996FFB
          0324DCBDF28E2DBDF35BCDAEBBFF00AB747E8F79BA9746689E1D186615656731
          F7A638D3DF3FB3426925FF00F88E25696B1B2278B1DD0808E481922C40000000
          00000000000000000000000000000000000000000000000146F9134EF9064D63
          B5DBAC5378C3EF911CB34D76733FA4C7AE5B39E236A775F7ECBD45BC53ACD85B
          D356BD113AC7FCB0ED3DBAFDAB47EF11D311C6FF00F998956BBCE5690D4C0394
          D750000000000000000000000000000000000000000000000000000000000000
          001B0B647F29BF7DCA7D6D7AD85B23F94DFBEE53EB669C1EFC4577EF9F2951BC
          7B296CD8DC9446E4BAA616A0000001421B41E7818CF941B4EBF0BEF5086D079E
          0633E506D3AFC09A5F2E57E76574F1F23AF4AFDE8EE6141195F9D95D3C7C8EBD
          2BF7A3B9809640080000006356E446E4D5B911B800000001311AA62340629E2C
          A748E8482348E84800000226746155AC5313555C911CA6CD63FA30E3C3C7669D
          AC650CAD4D5677BC429B7BCC44E961779E3D5AFD7A72434C66BDBBE66C666BBB
          E0B4C6197799E4AA99E35ACC7DBF37E4C6B16D2BC330989A6D2BE3571F969D73
          E90BF619A3788629313654654FF74EA8FDFC1BEF31678CB5962C66BC6313B1B1
          AB4E4B38AB5AE7EC88E569DCD7C21AF9789AEED952E5163472C45E2DE35AA7EB
          8A7DAD3B7BBD5EAFF6D55E2F978B4B6B5AE75AABAEA9AA67F57F26B1C5F4FEFF
          007ECECEEBFD3A7EB57D7A3C1B130CD07B95D32AEF5FD4ABE91F4E97DF8C63D8
          CE3F799BDE3388DBDEED2677DA57AC47D91BA3F27C1F3EA9182DADADA5BD535D
          A4CCCCF4CEB96656565458531459C44447446A007C2A00000000000000000000
          00000000000000000000000FDAC99825798B3461F84D113316D6D4F1F4F9A88E
          59FE1F89F9373F074CBD16F7FBF664B6B3D69BBD316163331FE6AB7CC7E5EB5E
          B47B0F9C4F12B2BBF4679CF746B59B1FBFFF000DC3AD6DFA72CA3BE75437DDDA
          EF6777B0A2C6CA229A2CE98A6988F9A223487F5AA79620A77237BA569A6298CA
          1A03BC0120000000000000000000000000000000000000000000000000000000
          46F113F37DA0FE8FC0CEF74F86659C42CF4D78B6536911F5D3CBFF000FDE8DCF
          9EFF00634DE2E76F615F2D3694554CFE70F0E27778BDDCED6C27F353547D625F
          54CE5544B9DE129B4A26CAD2AB2ABBAA26699FB610E32AA99A26699E85E63600
          3E40000000000000000000000000000000000000000000000000000000000001
          B0B647F29BF7DCA7D6D7AD85B23F94DFBEE53EB669C1EFC4577EF9F2951BC7B2
          96CD8DC9446E4BAA616A0000001421B41E7818CF941B4EBF0BEF5086D079E063
          3E506D3AFC09A5F2E57E76574F1F23AF4AFDE8EE6141195F9D95D3C7C8EBD2BF
          7A3B9809640080000006356E446E4D5B9111A803288D120C78BF5B2000000000
          63555C57C588E358760F75AAFB8ADF6C2EB614EFAED6D2288FE5F35D74D11355
          53944269A66A9E2D319CBED9AB49D1FCADEF76376B2AADEDED68B3A288D6AAAB
          AB4888FB5A8336F087C1EE9C7BB656B9577EB58E4F845AC4D1651F5C477557F0
          D3B9973E66ACD969338C62B6B5596BAC58D9CF12CE9FB2986138B69E61D87E74
          584F295FCB678CFA32DC3343310BF655DB47274FCF6F847AB7E66CDBAE53C062
          BBBE1D55589DEA9E4E2D8CE9444FD757B1A6334ED7B38E67E358CDF7E0575AB5
          8F79BBEB4EB1F5CEF9789D3EB94B58E2DA6189E2B9D135F128EAA756FDAD8986
          689E1D86E55F178F5F5D5FA46C2AAAAAEA9AABAA6A999D6666794062D333339C
          B26D9AA00100000000000000000000000000000000000000000000000001A4CC
          C447CF3A3AD365797A32EE4AC3EE9551C5B6B5A3E116DAC72F1ABE5E5FCB4873
          6ECF3009CCB9C70DC2AAA38D6555AC5A5B7D5674F2CFAB4FCE1D8363674D3671
          4D3111111A4690DAFC1B61DED6FF00547FAC79CB5970817FD76571A7FF0029F2
          867BA9447226A9E588436CB5A000000000000000000000000000000000000000
          000000000000000000089480CA3731AA98989E5651B898E4944C67190D0599AE
          B373CC37FB09A74D2DEAAA23EA9E5FF97E646E7A9DA55D7E0F99ED2D229D22DE
          CE9AFED9DDFF0010F2EE3CD22BAFD8B16BC5DFFB6BABCF35E2CE78D444802CCF
          B0000000000000000000000000000000000000000000000000000000000001B0
          B647F29BF7DCA7D6D7AD85B23F94DFBEE53EB669C1EFC4577EF9F2951BC7B296
          CD8DC9446E4BAA616A0000001421B41E7818CF941B4EBF0BEF5086D079E0633E
          506D3AFC09A5F2E57E76574F1F23AF4AFDE8EE6141195F9D95D3C7C8EBD2BF7A
          3B9809640080000000000000112091FCE6D38BBF4D3A5E4734ED4F29E54A6AA6
          FD88D9DB5E22392C2C678F5CFE9BBF379AF57CBBDCACE6D6F15C534C74CCE4AD
          77BB5B5EABE4EC299AAAEA88CDEBFDF2227497E2660CE997F2BD84DE319C4AC2
          C223751356B5D5F6531CB2D0B9B76F598F199B4B0C0AC69C36EF56B115F756B3
          1F6EE86B3BD5F2F7885BD57ABF5E6D6DEDAB9E5AED2B9AAA9FCE5AF315E116ED
          619D9E1F4F1EAEB9D54FACB39C3340EF36F9577EAB894F546B9F48DEDCD9B784
          55E2DE6BBAE52C3A2CA9D748BCDE6359FCA8F6CFE4D4B8CE61C6F315E66F98DE
          276F7CB5F9A6D2BE4A7EC8DD1F943F392D698A6906218BD5FF00EAB4998EA8D5
          1F4E9F16C2C3702B8E151FFE7A233EB9D73F5F447D49059A75ED5DB288D80024
          00000000000000000000000000000000000000000000000000046BA6F494D355
          754534C6B3331111F59119CE50899888CE5BC7838E5D988C4733DB51CB3A5D2C
          2663ECAABFFE3FCB7AD3BB95E6B67997BB18CA18661155114DA5958C556DD336
          9572D5FCCCBD2CC690E94D1CC3BF85E1B65779DB9673DF3AE5CFB8E5FE712C42
          D6F1D133947746A844EF017C5A80000000000000000000000000000000000000
          00000000000000000000001953B8AB74B1A37CB306AFDAD5D78B78B8DF298EEA
          9AACEA9FD261AFDB5F6A974F7DC0ECEF31FE85B44CFD93C8D50E5EE126EBF66D
          21B5AA365714D5BB2FD173BB4E767000C0DE8000000000000000000000000000
          0000000000000000000000000000000001B0B647F29BF7DCA7D6D7AD85B23F94
          DFBEE53EB669C1EFC4577EF9F2951BC7B296CD8DC9446E4BAA616A0000001421
          B41E7818CF941B4EBF0BEF5086D079E0633E506D3AFC09A5F2E57E76574F1F23
          AF4AFDE8EE6141195F9D95D3C7C8EBD2BF7A3B980964008000000018D5571419
          31AAAD1F16218C5C309BB557CC4AFB6376B0A37D76B5C531FCB55E6DE10B83DC
          38F74CB574AAFF006D1C9EFD5FF4D947D71F3CFF000B5E238CDC70BA38D7AB48
          A7E5D33E0F7DC30BBE6275716EB67357CFA3EBB1B72DAF765614556B6D69459D
          14C6B355531111F9B5EE6ADB9654CBF15D85CED7FB4AF54EB1C4B19FE989FAEA
          682CC9B41CD59AABABFB5313B48B299E4B1B39E2D11F946F79CD356B5C5B847A
          EBCECF0EA328FEEAB6F847AB60617A034D395788579FFAC7EB3E8F759AB6C79B
          F337BE58D17AF805D6BFF46EF3A4E9F5D5BE5E1EAAAAAEA9AEBAA6AAAA9D6666
          759996296B9BEE237AC4ABE52F55CD53F3F4E867B73B85DAE1472776A2298F97
          FF006B4689078DEC000000000000000000000000000000000000000000000000
          0000000000001EBB65197BB23CF387DDABA38D6176ABE156FD1C5A39623F3AB8
          B0F2133A72B7F7073CBB376C2AFD98EDACFF00AEF969161653A72F128DFF00AD
          5EA645A29877F13C5ACACA7F0C4F1A7BA35F9B1FD27BFF00F0FC32D2B8DB31C5
          8EF9D5BA35B74514F242667E629E48E544EF7473438000000000000000000000
          00000000000000000000000000000000000000000269DF2C9846F660F3F9E2E9
          F0ACB37FA34D669A38F1F6C72B473A1B13B1A6F171BC58D51AC5765547F0E7BB
          5B39B2AEBB29DF45534CFE4D07C2EDD7897BBBDEA3F35331F49FDDEFB9CEA984
          088DC969E7B00000000000000000000000000000000000000000000000000000
          000000006C2D91FCA6FDF729F5B5EB616C8FE537EFB94FAD9A707BF115DFBE7C
          A546F1ECA5B36372511B92EA985A80000005086D079E0633E506D3AFC2FBD421
          B41E7818CF941B4EBF02697CB95F9D95D3C7C8EBD2BF7A3B98504657E76574F1
          F23AF4AFDE8EE60259002000044A58D5B81F8F98B36E0395AEDF0AC7314B0BAD
          33AF169AE7FAABFAA9A63967F269ECD7C232DAD62BBAE53C362889D69F84DE63
          59FB69A2393F5D7EC470958FFF009382CF4D169EB86926A2D30D2EC42E77DAEE
          17598A29A72D7D339C67E0D9BA2DA2D71BE5D28BEDE73AA673D5D1194E5E2FD2
          C6B31E3998AF337AC6714BC5EAD26758E3D7C94FD94EE8FCA1F9A91AC2D6DAD2
          DEB9B4B4AA6667A65B1ECAC6CEC298A2CA98888E880053540000000000000000
          000000000000000000000000000000000000000000000000006565636B79B7B3
          BB5851C7B4B5AA28A298F9EA99D223F9764E4DC0ECF2EE5AC3F07B3A7E4D614D
          354E9BEAD35AA67EB99D5CDDB18CBDFDBD9E2EB5DAD9F1AC2E1ADE6BE4E4D639
          29FE675FC9D5944690DC3C1B61DC4B0B4BF551AEA9E2C7746DDED55A7F7FE52D
          ECEE74CEAA6339EF9FD8AA748D1055CB2367B5E0000000000000000000000000
          000000000000000000000000000000000000001AE92CDFCE7E6FB59C6E0635C4
          4C4B41E64BB45CB1DBF5DB4D38B6F54FEBCBFF002DFD31C92D31B47BAFC1F33D
          AD71BADA8A6BFCDA9F85ABA72B85D95E23F257BA625EBBA5595730F2C9073D2E
          0000000000000000000000000000000000000000000000000000000000000361
          6C8FE537EFB94FADAF5B0B647F29BF7DCA7D6CD383DF88AEFDF3E52A378F652D
          9B1B9288DC9754C2D40000002843683CF0319F28369D7E17DEA10DA0F3C0C67C
          A0DA75F8134BE5CAFCECAE9E3E475E95FBD1DCC28232BF3B2BA78F91D7A57EF4
          773012C801000031AB7326356E112D0DC25BE5182FDCB4F5C348E8DDBC25FE51
          82FE1DA7AE1A4DCF5A6DEFBB6F0FF986F2D0FF0073D978F9C8031464E0000000
          0000000000000000000000000000000000000000000000000000000000022652
          FEF70B95B6237DB0B85DE35B4BC5A53674C7D733A3EA8A2AB4AE28A76CEA7CD7
          5D3674CD756C8D6E81E0F797BE01972DF1CB4A34B4C42D34A6663FD3A7923F9D
          65B7A9E4A5F9796F07B2C1704B9617654F168BB58D367A7D711CAFD49E48D1D3
          582DC230CB8D95DA3F2C467DFB677B9E715BE4E217CB4BCCFE699CBBBA372397
          E701745BC0000000000000000000000000000000000000000000000000000000
          000000009651B98B2A77013CAD5FB5BBB4517CB95EE2392AA2AA27EBE5D5B45E
          136AD75F7DC12CAF3A72D8DB47F31A30CD3FBB7DAF47EF14F4D31157D26255AE
          F395A43550884B95575000000000000000000000000000000000000000000000
          0000000000000001B0B647F29BF7DCA7D6D7AD85B23F94DFBEE53EB669C1EFC4
          577EF9F2951BC7B296CD8DC9446E4BAA616A0000001421B41E7818CF941B4EBF
          0BEF5086D079E0633E506D3AFC09A5F2E57E76574F1F23AF4AFDE8EE6141195F
          9D95D3C7C8EBD2BF7A3B98096400800018D5B9931AB7089685E12FF28C17F0ED
          3D70D26DD9C25FE5182FE1DA7AE1A4DCF5A6DEFBB6F0FF00986F2D0FF73D978F
          9C8031464E000000000000000000000000000000000000000000000000000000
          000000000000362EC2F2F7F6CE72A2FF006967C6B1C3689B69D63FCD3C94B5CC
          BA5760B97A9C2B284E276B6734DB62569EF9ACFF00D11C94FF00CB2CD0BC37F8
          8E2D67C68CE9A3EF4F86CDEC5F4BF10FB0E195C533F7ABFBB1E3B77368D9EE27
          96534F25288D7E77423478000000000000000000000000000000000000000000
          0000000000000000000000009A3E7414EF9066F399EEE9F0ACB37DA698D668A7
          DF23F297A37C78AD845E70FBCDDE635F7CB2AA9D3ED85BF16BB45F2E36D613F9
          A9AA373EA99CAA8973CC4CEEE8649B5A3DEED2AB398E5A6669FD18B8D2BA6689
          9A67A178480F9480000000000000000000000000000000000000000000000000
          00000000D85B23F94DFBEE53EB6BD6C2D91FCA6FDF729F5B34E0F7E22BBF7CF9
          4A8DE3D94B66C6E4A23725D530B50000000A10DA0F3C0C67CA0DA75F85F7A843
          683CF0319F28369D7E04D2F972BF3B2BA78F91D7A57EF47730A08CAFCECAE9E3
          E475E95FBD1DCC04B20040000C6ADCC98D5B844B42F097F9460BF8769EB86936
          ECE12FF28C17F0ED3D70D26E7AD36F7DDB787FCC379687FB9ECBC7CE4018A327
          0000000000000000000000000000000000000000000000000000000000000000
          007D982E1B6D8CE2F73C2AEF4CD5697AB6A6CE223EB9767611865861786DDB0F
          B1A2228BB5953674E9F5468E76D8065EFED2CD7698C5A59F1ACB0DB3D626777B
          E55C91FF0032E95A63486E9E0E70EE42E55DF2B8D75CE51DD1FBB5169E621CBD
          F69BA533AA88D7DF3FB644E91C9084CEF4363B04000000000000000000000000
          000000000000000000000000000000000000000000131BD046F066C2D2989866
          8AB4D3951319C6439FF305D66E78DDF6ED31A4516F5C47EAF81E9768975F8366
          8BC4FCD6B4D3691F5EB1CAF34E39C7AEBF62C52F161FDB5D5E6BC59CF1A98005
          A5F6000000000000000000000000000000000000000000000000000000000361
          6C8FE537EFB94FADAF5B0B647F29BF7DCA7D6CD383DF88AEFDF3E52A378F652D
          9B1B9288DC9754C2D40000002843683CF0319F28369D7E17DEA10DA0F3C0C67C
          A0DA75F8134BE5CAFCECAE9E3E475E95FBD1DCC28232BF3B2BA78F91D7A57EF4
          773012C801000031AB7326356E112D0BC25FE5182FE1DA7AE1A4DBB384BFCA30
          5FC3B4F5C349B9EB4DBDF76DE1FF0030DE5A1FEE7B2F1F3900628C9C00000000
          0000000000000000000000000000000000000000000000000000000425FA5967
          06B5CC1982E18358C72DEADE8B39FAA9D6359FCA3555B1B1AEF1694D951B6A98
          88F153B6B5A6C2CEAB5AF644673DD1B5D1DB0ECBBFD8992AC2F36D65A5BE2354
          DE6A99DFC5DD4C7E9CBF9B63EEA791FC2E174B1B95D2CAE96144536763674D9D
          111F35311A43FB55D0E9DC36E74DC2E96776A7653110E75BF5EAABF5E6BBC55B
          6A999400F73CA000000000000000000000000000000000000000000000000000
          000000000000000227E64A2419C1546B046E277226721AB76B574E25FEE77C88
          D22BB39A3F389D7FE5E09B4F6AB759B4C1EEF7B88D7DE2DB4FCA63FECD570E5D
          E11EEBF66D20B5988FC71157D63D735CEED39D9C24060AF40000000000000000
          000000000000000000000000000000000000000000D85B23F94DFBEE53EB6BD6
          C2D91FCA6FDF729F5B34E0F7E22BBF7CF94A8DE3D94B66C6E4A23725D530B500
          00000A10DA0F3C0C67CA0DA75F85F7A843683CF0319F28369D7E04D2F972BF3B
          2BA78F91D7A57EF47730A08CAFCECAE9E3E475E95FBD1DCC04B20040000C6ADC
          C98D5B844B42F097F9460BF8769EB86936ECE12FF28C17F0ED3D70D26E7AD36F
          7DDB787FCC379687FB9ECBC7CE4018A327000000000000000000000000000000
          000000000000000000000000000000000436E7078CBBF0DC7AF7986DACB5B3B8
          59C59594CC7FA95FCF1F65313E7351CE9F3BAB763997632E646B8D95AD9F16DE
          FB1F0CB6D77EB5E9311F95314B34D03C37EDD8AC5AD51F76CE38DE3D1BD87E9B
          5FFEC786CD9533F7AD272F0E9FFEF9BDD51A69C8899D66597CCC5BF1A5C00000
          0000000000000000000000000000000000000000000000000000000000000000
          001953B92C699DF0C81E6F3EDD3E1595EFB1A72D9C45A47E531AFF001AB496B1
          3F33A0F18BBC5EB0BBD5D669D7DF6C6BA3F58973F574CD35D54EED2661A0385D
          BA459DFAEF79FEEA663E93FBAE1739CE26100350BD6000000000000000000000
          0000000000000000000000000000000000003616C8FE537EFB94FADAF5B0B647
          F29BF7DCA7D6CD383DF88AEFDF3E52A378F652D9B1B9288DC9754C2D40000002
          843683CF0319F28369D7E17DEA10DA0F3C0C67CA0DA75F8134BE5CAFCECAE9E3
          E475E95FBD1DCC28232BF3B2BA78F91D7A57EF4773012C801000031AB7326356
          E112D0BC25FE5182FE1DA7AE1A4DBB384BFCA305FC3B4F5C349B9EB4DBDF76DE
          1FF30DE5A1FEE7B2F1F3900628C9C00000000000000000000000000000000000
          00000000000000000000000000403F73256015667CD586E0B14CCD16F6D4FBEF
          D5671FD557F113FC3B22C2CACECACE9B3A2988A698888888D348683E0E7977DF
          AF988E67B6A234B1A62EB613F5CE935CFF00ED8FCE5BFE88D296F2E0F70EFB26
          1B378AE3EF5A4E7E11AA3F569AD38BFC5EB11E4299FBB671978CEDFD0AB97910
          6BACC8CF98600000000000000000000000000000000000000000000000000000
          0000000000000000000146F966C69DEC81FCED238D4E9A6F680C76EB372C66F9
          75D3FF002EDABA63ECD791D05546B0D2BB42BAFC1B355EA62348B68A6D23F388
          D7F9D5A9785CBA72986D8DE72FC15E5F58FD9EBB9CE554C3CD00E7C5C0000000
          0000000000000000000000000000000000000000000000000006C2D91FCA6FDF
          729F5B5EB616C8FE537EFB94FAD9A707BF115DFBE7CA546F1ECA5B36372511B9
          2EA985A80000005086D079E0633E506D3AFC2FBD421B41E7818CF941B4EBF026
          97CB95F9D95D3C7C8EBD2BF7A3B98504657E76574F1F23AF4AFDE8EE60259002
          00006356E64C6ADC225A1784BFCA305FC3B4F5C349B767097F9460BF8769EB86
          9373D69B7BEEDBC3FE61BCB43FDCF65E3E7200C5193800000000000000000000
          00000000000000000000000000000000000000008E599888E59925E9B66D97E7
          32E72C3B0FAA8E359516B16F6DF728E5E5FCF48FCDE9B9DDABBE5E28B0A36D53
          11F579EF779A6E7615DE2BD94C4CFD1D27B2FCB9196B25E1F70AA98A6DABB3F7
          EB6FBF5F2CFAF4FC9EBB752C6C68A68B38A698D2223488E865572F23A7AE976A
          2E76145859ECA62223C1CEB78B6AAF36B55B57B6A999FAA007A5440000000000
          000000000000000000000000000000000000000000000000000000000000008D
          ECD86BA68CC11546B0D59B5ABAF1312B9DF22392D6CA68F3675FFE4DA73B9E07
          6AF74F7CC22EB7B8E5F7AB7E24FD51544FB2184F08776FB568F5E232FC3955F4
          98FD15AEF395A435700E585D4000000000000000000000000000000000000000
          0000000000000000006C2D91FCA6FDF729F5B5EB616C8FE537EFB94FAD9A707B
          F115DFBE7CA546F1ECA5B36372511B92EA985A80000005086D079E0633E506D3
          AFC2FBD421B41E7818CF941B4EBF02697CB95F9D95D3C7C8EBD2BF7A3B985046
          57E76574F1F23AF4AFDE8EE6025900200006356E64C6ADC225A1784BFCA305FC
          3B4F5C349B767097F9460BF8769EB869373D69B7BEEDBC3FE61BCB43FDCF65E3
          E7200C5193800000000000000000000000000000000000000000000000000000
          00000021BD783965DE2D8E2199EDA8D26D27E0F61331F3472D531F6CE91F9346
          59D9D56B694D959D3335D754534C47CF33B9D859032FD396F2A61F8644695D9D
          8C5569F5D73CB32CFB83CC3BED788CDEAA8D5671BE76306D3BBFFD9EE3176A67
          5DA4EE8DBBF27A3A792372279594CF2316F188CB534FC0025200000000000000
          000000000000000000000000000000000000000000000000000000000089671B
          98B28DC09799DA0DDBE11956FBA46B5594536B1FEDAA267F8D5E99F0E31758BF
          6197BB9CFF00AF635D9FEB130B6631758BE61F6F779FCD4551B9F7673C5AA25C
          FBBB784CF4C8E36AA329C9780040000000000000000000000000000000000000
          0000000000000000003616C8FE537EFB94FADAF5B0B647F29BF7DCA7D6CD383D
          F88AEFDF3E52A378F652D9B1B9288DC9754C2D40000002843683CF0319F28369
          D7E17DEA10DA0F3C0C67CA0DA75F8134BE5CAFCECAE9E3E475E95FBD1DCC2823
          2BF3B2BA78F91D7A57EF4773012C801000031AB7326356E112D0BC25FE5182FE
          1DA7AE1A4DBB384BFCA305FC3B4F5C349B9EB4DBDF76DE1FF30DE5A1FEE7B2F1
          F3900628C9C00000000000000000000000000000000000000000000000000000
          00000403D96C9B2F76459D6E5635D1C6B1BACFC26D758E4D29DDFCBAD2CE34A6
          223768D35C1D72E7C1F08BE661B5A3FAEF75FBD59CE9FE4A77FF002DCD4F2437
          DE8261BF60C2A9B4AA3EF5A4F1BC3A1A4B4C710FB6E2755113F768FBB1FAEF2A
          DE8066AC50000000000000000000000000000000000000000000000000000000
          000000000000000000000654EE629A3E7FB41930B48D634D19B1AB722622A8CA
          4D8E7DC6EEBF03C62FB7488D22CADEBA623EAE34E9FC3E27A4DA15D7E0B9AEF7
          311A45B4516B11F6D3113FCC4BCE38DF1CBACDCB12BC5DFF00B6BAA37AF344F1
          A989005ADF400000000000000000000000000000000000000000000000000000
          03616C8FE537EFB94FADAF5B0B647F29BF7DCA7D6CD383DF88AEFDF3E52A378F
          652D9B1B9288DC9754C2D40000002843683CF0319F28369D7E17DEA10DA0F3C0
          C67CA0DA75F8134BE5CAFCECAE9E3E475E95FBD1DCC28232BF3B2BA78F91D7A5
          7EF4773012C801000031AB7326356E112D0BC25FE5182FE1DA7AE1A4DBB384BF
          CA305FC3B4F5C349B9EB4DBDF76DE1FF0030DE5A1FEE7B2F1F3900628C9C0000
          000000000000000000000000000000000000000000000000000006777B0B5BDD
          E2CAED634CD55DAD7145311D333A307BBD8B65DFEDECED77B4B4A35B0B844DE6
          D26639358EE63F5D1EEC32E556237BB3BAD1F9A623D773C588DF29B85D2D2F15
          7E589FDB7BA4B27E076597B2EDC308B3A74F8358D34D5F5D5A6B3FCBF66A99D3
          91167BB42675974ED8595361674D951B222223C1CEF696955AD736956D99CC01
          55F0000000000000000000000000000000000000000000000000000000000000
          000000000000000269F9D098DE0C8113AE9C80D57B59BAF1314B9DEE2392D6CA
          AA27EDA675FF00E4F08DA3B5BBAF1F08BADEE98E5B2B7E2CFD9544FF00CC4357
          396B845BAFD9B486DA72FC5955F58F5895D2EF39D9C003075700000000000000
          00000000000000000000000000000000000000001B0B647F29BF7DCA7D6D7AD8
          5B23F94DFBEE53EB669C1EFC4577EF9F2951BC7B296CD8DC9446E4BAA616A000
          0001421B41E7818CF941B4EBF0BEF5086D079E0633E506D3AFC09A5F2E57E765
          74F1F23AF4AFDE8EE6141195F9D95D3C7C8EBD2BF7A3B98096400800018D5B99
          31AB7089685E12FF0028C17F0ED3D70D26DD9C25FE5182FE1DA7AE1A4DCF5A6D
          EFBB6F0FF986F2D0FF0073D978F9C8031464E000000000000000000000000000
          000000000000000000000000000000899746F07ACB9370CB56D8E5B51A5AE236
          9A51C9FE9D3C91FACEBFA39EAE172B5C4AFD77C3EC299AAD6F1694D9D111D333
          A3B3B2E613638160D73C26C22228BAD8D367C9F3CC472CFE73ACB63F0718772F
          7CAEF95C6AA2328EF9F48601A7D7FE4AEB45CE99D75CE73DD1FBBF462348426A
          D74E44374B530000000000000000000000000000000000000000000000000000
          0000000000000000000000000006BA4C089DF00FE8003CC6D0EEBF0ACAD7C888
          E5B3E2DA47FB6627DAD2DA6910E80C6EED17CC2AF7749FF56C6BA7F5873FCEB1
          33130E7EE176E9C9DFEC2F31F9A9CBE93FBAE1749CE998006A37AC0000000000
          000000000000000000000000000000000000000000006C2D91FCA6FDF729F5B5
          EB616C8FE537EFB94FAD9A707BF115DFBE7CA546F1ECA5B36372511B92EA985A
          80000005086D079E0633E506D3AFC2FBD421B41E7818CF941B4EBF02697CB95F
          9D95D3C7C8EBD2BF7A3B98504657E76574F1F23AF4AFDE8EE602590020000635
          6E64C6ADC225A1784BFCA305FC3B4F5C349B767097F9460BF8769EB869373D69
          B7BEEDBC3FE61BCB43FDCF65E3E7200C51938000000000000000000000000000
          0000000000000000000000000000899D01B2360F972719CE54E236D471AC30BB
          39B7E58D63DF279288F5CFE4E9FA2346B0D81E5C9C232746296B67316F8ADA4D
          BF2C72C59C7F4D11FC4CFE6D9F1AC472C3A1342F0DFE1D84D9F1A3EF57F7A7C7
          66EC9A2B4AEFFF00C4314B4AA27EED1F763C36EFCC99E54032C6380000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00001200CB7A511B920FE76B4C554CC4C724C68E7EC6AED374C5EF976DDEF76D
          5C47D9AF23A0EADCD27B40BAFC17345EF4A748B5E2DA47E71A7FC351F0BB75E3
          E1F63798FCB565F58F587AEE9395530F3A039F97000000000000000000000000
          00000000000000000000000000000001B0B647F29BF7DCA7D6D7AD85B23F94DF
          BEE53EB669C1EFC4577EF9F2951BC7B296CD8DC9446E4BAA616A0000001421B4
          1E7818CF941B4EBF0BEF5086D079E0633E506D3AFC09A5F2E57E76574F1F23AF
          4AFDE8EE6141195F9D95D3C7C8EBD2BF7A3B98096400800018D5B9931AB70896
          85E12FF28C17F0ED3D70D26DD9C25FE5182FE1DA7AE1A4DCF5A6DEFBB6F0FF00
          986F2D0FF73D978F9C8031464E00000000000000000000000000000000000000
          00000000000000003ECC170AB7C7318B960F778FFC4BE5BD1634CE9AE9ACC44C
          FE51CAF8A5B5383E65CFED3CD16F8E5AD9CCD961765A51AFFF0072BE48FD2227
          F55D305B84E277FB2BAF4553AFBA36EE5B718BF461B71B4BCF4C46AEF9D51BDD
          13855C2ED865C2EF87DCECE28B0BAD95363671D14D31111EA7D552288D21333A
          BA6A8A628A6298D90E7A999AA739400FA4000000000000000000000000000000
          000000000000000000000000000000000000000000000000000268DCC98D1F3C
          32044C6B0D51B57BAFBDE2B75BD453A7BF594D33F94FFDDB5E75D391E036B375
          E3E1B75BDC472D95AF167EC9860FC22DD7ED5A3F6D96DA72ABE92AD779CAD21A
          BC072D2EA0000000000000000000000000000000000000000000000000000003
          616C8FE537EFB94FADAF5B0B647F29BF7DCA7D6CD383DF88AEFDF3E52A378F65
          2D9B1B9288DC9754C2D40000002843683CF0319F28369D7E17DEA10DA0F3C0C6
          7CA0DA75F8134BE5CAFCECAE9E3E475E95FBD1DCC28232BF3B2BA78F91D7A57E
          F4773012C801000031AB7326356E112D0BC25FE5182FE1DA7AE1A4DBB384BFCA
          305FC3B4F5C349B9EB4DBDF76DE1FF0030DE5A1FEE7B2F1F3900628C9C000000
          000000000000000000000000000000000000000000000001133A43A9762196E3
          03C9175B7B4A38B6F88EB7BB4D77E957731E6C439BF2B609699873161F83D113
          3F09B7A69AF4F9A8DF54FE912ECCB8DDECEEB76B3BB595314D1654C514C47CD1
          11A368706D874576D6B7EAA3553F763BE75CB5BF0817FE2D9D95CA9E9FBD3DDB
          21FDA7929426A437035780000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000269DFF006B261AE930CC0797
          DA25D7E1595EF5A472D9716D35E8D25EA1F9B8FDDBE1983DF2ED31AFBE59551F
          C2D78DDDA2F9875BD84FE6A2A8DCFBB39E2D512D0333101544C4CC4C4EB1BC71
          BD51C59C97800400000000000000000000000000000000000000000000000000
          003616C8FE537EFB94FADAF5B0B647F29BF7DCA7D6CD383DF88AEFDF3E52A378
          F652D9B1B9288DC9754C2D40000002843683CF0319F28369D7E17DEA10DA0F3C
          0C67CA0DA75F8134BE5CAFCECAE9E3E475E95FBD1DCC28232BF3B2BA78F91D7A
          57EF4773012C801000031AB7326356E112D0BC25FE5182FE1DA7AE1A4DBB384B
          FCA305FC3B4F5C349B9EB4DBDF76DE1FF30DE5A1FEE7B2F1F3900628C9C00000
          000000000000000000000000000000000000000000000044A5126D1B8383B65D
          F866337DCC36D67AD174B3F79B2998E4E3D5CB3FC69FABA1A88D1E2764396E72
          F649B8D9574C536D79A7E116BAC72EB572E9F943DBF730E8DD14C3BF86615656
          531AE6339EF9682D23BFFF0011C4AD6DA27544E51DD08F9F50191AC800000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000089DF0FE8FE73D2FE803F95AD1C6B3AA99DD31312FEA8AA3587CD
          54C55194913939EB17B0F82E297ABB4C7FE5DB551FCBE57EFE7EBAFC17345EE2
          234F7D98B4FD61F80E37C6AEDF63C46DEC3FB6BAA37AF344E74C4802D8FA0000
          000000000000000000000000000000000000000000000001B0B647F29BF7DCA7
          D6D7AD85B23F94DFBEE53EB669C1EFC4577EF9F2951BC7B296CD8DC9446E4BAA
          616A0000001421B41E7818CF941B4EBF0BEF5086D079E0633E506D3AFC09A5F2
          E57E76574F1F23AF4AFDE8EE6141195F9D95D3C7C8EBD2BF7A3B980964008000
          18D5B9931AB7089685E12FF28C17F0ED3D70D26DD9C25FE5182FE1DA7AE1A4DC
          F5A6DEFBB6F0FF00986F2D0FF73D978F9C8031464E0000000000000000000000
          000000000000000000000000000003F7722E075E63CD787617144D54576D155A
          7DC8E597E13757074CBBC7BCDFB325B596B14445DAC6663E79E5AA617CD1BC3F
          F89E276561D19E73DD1AD65D21BFFF000EC3AD6DA275E59477CB7CDDACE8B1B2
          A2CACE98A69A298A6223E68867514469108F9F5749D3111194340F7802400000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000001946E629A675806489DC94553A40353ED56E9EF58BDDEF711
          C96D65A4FDB12F10D9BB59BAF1EE174BDE9CB676B34CCFD530D64E57E10AEBF6
          5D20B7CB655955F585D6EF571ACE001852B00000000000000000000000000000
          00000000000000000000000D85B23F94DFBEE53EB6BD6C2D91FCA6FDF729F5B3
          4E0F7E22BBF7CF94A8DE3D94B66C6E4A23725D530B50000000A10DA0F3C0C67C
          A0DA75F85F7A843683CF0319F28369D7E04D2F972BF3B2BA78F91D7A57EF4773
          0A08CAFCECAE9E3E475E95FBD1DCC04B20040000C6ADCC98D5B844B42F097F94
          60BF8769EB86936ECE12FF0028C17F0ED3D70D26E7AD36F7DDB787FCC379687F
          B9ECBC7CE4018A32700000000000000000000000000000000000000000000000
          00002226A98A698D66674888F9DD75B30CBD196F26E1F709A34B5AACE2DAD793
          7D5572B9B366B97E732673C3AE1559F1AC68B4F7EB6E4FF253CB2EBDB1A78B44
          531111111F336CF06D876AB5BFD5FF008C79CB5870817FCEBB2B953D1F7A7CA1
          9CCE90C5354A1B5DAD8000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000004D1B909A7E70648480F2BB
          46BAC5E32C5E2AD359B29A6D3F49FF00BB4CB7EE61BB45F306BE5DE7FCF63569
          F6E9AB40CC4C4CD33BE274973E70B975E4F11B1BC47E6A72FA4FEEB8DD273A66
          2520352BD4000000000000000000000000000000000000000000000000000361
          6C8FE537EFB94FADAF5B0B647F29BF7DCA7D6CD383DF88AEFDF3E52A378F652D
          9B1B9288DC9754C2D40000002843683CF0319F28369D7E17DEA10DA0F3C0C67C
          A0DA75F8134BE5CAFCECAE9E3E475E95FBD1DCC28232BF3B2BA78F91D7A57EF4
          773012C801000031AB7326356E112D0BC25FE5182FE1DA7AE1A4DBB384BFCA30
          5FC3B4F5C349B9EB4DBDF76DE1FF0030DE5A1FEE7B2F1F3900628C9C00000000
          0000000000000000000000000000000000000000409B3A2BB5B4A6CA88D6AAEA
          8A63F54C44CCE508998A75CEC6F6E0E397A2CEEF7FCCB6D67FD56B3176B1AA7A
          2396A9F537851B9E7B21E5FA32DE55C3B088A229AECEC62AB5FAED2796AFE65E
          867923474A68EE1F18661B6577E988CE7BE75CB9F71BBF7F12BFDADE3A267577
          46A8400BDAD40000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000002637A113BE01FD0007F2B6A22AB39
          A27962A898973EE2961375C4AF57798D3DEED6A8D3F3742D51AC347E7ABB7C17
          345F69D3FF0032A8B4FD6356A1E176E9C7B8585E23F2D531F58FD9ECBA4FDE98
          7E080D00F78000000000000000000000000000000000000000000000000000D8
          5B23F94DFBEE53EB6BD6C2D91FCA6FDF729F5B34E0F7E22BBF7CF94A8DE3D94B
          66C6E4A23725D530B50000000A10DA0F3C0C67CA0DA75F85F7A843683CF0319F
          28369D7E04D2F972BF3B2BA78F91D7A57EF47730A08CAFCECAE9E3E475E95FBD
          1DCC04B20040000C6ADCC98D5B844B42F097F9460BF8769EB86936ECE12FF28C
          17F0ED3D70D26E7AD36F7DDB787FCC379687FB9ECBC7CE4018A3270000000000
          0000000000000000000000000000000000000044BD9EC8B2F4E62CF171B1AECF
          8D61749F855AF27269469A47E73A43C6BA0B83A65DF8360B7DCC36B67A5A5F6D
          3DE6CA66397DEE8DFF00AD5AF9AC9744B0DFE278AD9D9CC7DDA678D3E1AF7CB1
          ED29BFFF000FC32D2A89FBD57DD8F1FD9B8ACA98888E56533CA534F1637A37BA
          2E1A1E3E60024000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000044EF8480CC446E4822ADDCAD49B5
          5BAC59635637988D22DAC635FB6274F536D57133B9AF76B7759AAE573BDC53DC
          5A5544CFDB1FF660BC23DD7ED5A3D6D96DA72ABE93FBABDDA72B486B301CB8BA
          0000000000000000000000000000000000000000000000000000D85B23F94DFB
          EE53EB6BD6C2D91FCA6FDF729F5B34E0F7E22BBF7CF94A8DE3D94B66C6E4A237
          25D530B50000000A10DA0F3C0C67CA0DA75F85F7A843683CF0319F28369D7E04
          D2F972BF3B2BA78F91D7A57EF47730A08CAFCECAE9E3E475E95FBD1DCC04B200
          40000C6ADCC98D5B844B42F097F9460BF8769EB86936ECE12FF28C17F0ED3D70
          D26E7AD36F7DDB787FCC379687FB9ECBC7CE4018A32700000000000000000000
          000000000000000000000000001120FEB77BBDADEAF16576B0A38F6B6D5C59D1
          4FFD554CE910ECCCA782D8E5DCBF87E0B611C974B0A6CEA9D3BAAB4FEA9FCE75
          9FCDCDDB11CBDFDB99EAED79B5B39AAEF865337AAFA38F1C94479D3AFE4EA6A2
          2222346E2E0DF0EE4EEF697EAB6D53947746DDFE4D51A7F7FE56F16772A67553
          19CF7CFEDE6CAADCC77154CEA36735F000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000000000032A6
          7584B1A373201E53691748B7CAF6F69A6BEF355369FCE9FF002F56FCACC976F8
          66057EBBE9AF1AC2AD23EB88D63D4B463D768BE6196F613F9A8ABC9F7673C5AE
          25A13EC09898E41C733194E4BC00000000000000000000000000000000000000
          00000000000000D85B23F94DFBEE53EB6BD6C2D91FCA6FDF729F5B34E0F7E22B
          BF7CF94A8DE3D94B66C6E4A23725D530B50000000A10DA0F3C0C67CA0DA75F85
          F7A843683CF0319F28369D7E04D2F972BF3B2BA78F91D7A57EF47730A08CAFCE
          CAE9E3E475E95FBD1DCC04B20040000C6ADCC98D5B844B42F097F9460BF8769E
          B86936ECE12FF28C17F0ED3D70D26E7AD36F7DDB787FCC379687FB9ECBC7CE40
          18A327000000000000000000000000000000000000000000000113B92FA70DB8
          5BE2B885DB0CBB53336B7AB5A6CA8FB6674D5F545155A551453B67543E6BAE9B
          3A66BAB643A1783D65CFECFCAD6B8CDB51C5B5C4ED78D4CE9CBEF747253FCF1A
          7F36D988D21F9B97F0CB1C1B09B9E1777A78B6775B1A6CA98FB2347E954E9BC1
          EE34E1B71B2BAD3F9637F4EF73B6257C9C42F76979ABF34E7E1D1B98EBAF286E
          1737880000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000134F27232631BD900FE56D4535D9D5
          4551C9544C4BFAB1AF73E6AA62B8CA473C623779BA5FEF1769DF676B553FA4CC
          3F83F773C5D7E099A2FD67A7775FBE47FBA35FF97E138D316BB4DCEFF6D613F9
          6AAA37AF344E74C4802DEFA00000000000000000000000000000000000000000
          00000001B0B647F29BF7DCA7D6D7AD85B23F94DFBEE53EB669C1EFC4577EF9F2
          951BC7B296CD8DC9446E4BAA616A0000001421B41E7818CF941B4EBF0BEF5086
          D079E0633E506D3AFC09A5F2E57E76574F1F23AF4AFDE8EE6141195F9D95D3C7
          C8EBD2BF7A3B98096400800018D5B9922ADDB81A1384B7CA305FB969EB86936F
          CE121855B5B6198662D674CCD176B5AACAB9E88AA2263D52D05F6B9FB4E6CEAA
          31BB59AA36C44C7D21BBB432D29AF08B38A7A3389FAA40620CA8000000000000
          0000000000000000000000000000000006CAD82E5E9C5B38FF0069DAD9F1AC70
          DB39B4D66393DF2AE48FE356B49E474E6C1F2E461193ACEFF6D67A5B6255CDBC
          CCEFE26EA7F865DA1586FF0010C5A89AA3EED1F7A7C366F62DA617FF00B0E195
          C533F7ABFBB1E3B77364D9E9099DE988A69DD087413480000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000001F3C337F39DF0FE802262261289DC0D47B54BACD8E3B6378D34
          8B7B08999FAE99989FE3478C6CADADDD666E970BE69FF9769559CCFDE8D7FF00
          8CB5AB957840BA4DD3486F1196AAA62AFAC47EABADDEAE359C0030C560000000
          000000000000000000000000000000000000000001B07647F29BFF00DCA7D6D7
          CD97B24B95745DAFB7FAA3FA6BAA2CE9FAF4E59FF8671C1CD9D569A456134C6C
          E34CF7652A3789CACE5B12372511B92EA55A80000005086D079E0633E506D3AF
          C2FBD421B41E7818CF941B4EBF02697CB95F9D95D3C7C8EBD2BF7A3B98504657
          E76574F1F23AF4AFDE8EE602590020000469AA407E2E6AC02E799B04BDE0D7CA
          7FF0EF347178D1BE8ABE6AA3EC9724E6BCAD8AE51C5AD70BC4EC2AA668999B3B
          4D3FA6D69D792A89767CD3156F7E3664CAB81E68B94DC31BC3ECEF1673ACD335
          47F5513D313BE2588E94E8B59E9059C5744F16D69D93D71D52C9747348ED303B
          49A6A8E359D5B63ABE70E3089D52DF58A706EC3AD6D66BC231EB6BBD133C9676
          D6715E9F9C3F3FFBB5DFBE6CCB63E865AAAD341F1BB3AB8B1659FCE263D5B2A8
          D33C1EBA6266D263BE27D1A546EAFEED77FF00092C7D0C9FDDAEFF00E1258FA1
          97C732B1BEC77C7ABEF9E18376BBA7D1A546EAFEED77FF00092C7D0C9FDDAEFF
          00E1258FA1939958DF63BE3D4E7860DDAEE9F46951BABFBB5DFF00C24B1F4327
          F76BBFF84963E864E65637D8EF8F539E18376BBA7D1A546EAFEED77FF092C7D0
          C9FDDAEFFE1258FA1939958DF63BE3D4E7860DDAEE9F46951BABFBB5DFFC24B1
          F4327F76BBFF0084963E864E65637D8EF8F539E18376BBA7D1A546EAFEED77FF
          00092C7D0C9FDDAEFF00E1258FA1939958DF63BE3D4E7860DDAEE9F46951BABF
          BB5DFF00C24B1F4327F76BBFF84963E864E65637D8EF8F539E18376BBA7D1A54
          6EAFEED77FF092C7D0C9FDDAEFFE1258FA1939958DF63BE3D4E7860DDAEE9F46
          951BABFBB5DFFC24B1F4327F76BBFF0084963E864E65637D8EF8F539E18376BB
          A7D1A546EAFEED77FF00092C7D0C9FDDAEFF00E1258FA1939958DF63BE3D4E78
          60DDAEE9F46951BABFBB5DFF00C24B1F4327F76BBFF84963E864E65637D8EF8F
          539E18376BBA7D1A546EAFEED77FF092C7D0C9FDDAEFFE1258FA1939958DF63B
          E3D4E7860DDAEE9F46951BABFBB5DFFC24B1F4327F76BBFF0084963E864E6563
          7D8EF8F539E18376BBA7D1A546EAFEED77FF00092C7D0C9FDDAEFF00E1258FA1
          939958DF63BE3D4E7860DDAEE9F46951BABFBB5DFF00C24B1F4327F76BBF7CF9
          92C7D0C9CCAC73B1DF1EA73C306ED774FA352601855AE378D5CF09B0A666ABD5
          B5367C9D133CBFC3B370BB9D961F72B0B8D8D314D161674D9D311D111A358E40
          D894E4FCC3678E5F315B3BE7BD515459D34D131C5AA7E7E56D8A69888E486CCD
          08C02DF06B0B4AEF54E56954ECF947AB5E698637638B5E28A6ED567674C776B9
          DA998D51A4B219D31063A49A4B2018E92692C8063A49A4B2018E92692C8063A4
          9A4B2018E92692C8063A49A4B2018E92692C8063A49A4B2018E92692C8063A49
          A4B2018E92692C8063A49A4B2018E92692C8063A49A4B2018E92692C8063A49A
          4B2018E92692C8063A49A4B2018E92692C8063A49A4B2018E92692C8063A49A4
          B2018E92692C8063A49A4B2018E92692C8063A49A4B2018E92692C8063A49A4B
          2018E92692C8063A49A4B2018E92692C8061C5966002277240792DA5DD62F195
          ADED229D66C2D28B588FCF4F54CB4E37FE3986C62D85DE70FE3451F08B39A22A
          9F9A6774FEBA3C0C6C92F1F3E2F673FF00EB9695E11344B12C6712A2F570B3E3
          47162275C46B89F9BDB76B6A68A72A9AF86C2ED4778EFB59FA393B51DE3BED67
          E8E580FF002F348BFC7DF1EAF472F67D6D7A36176A3BC77DACFD1C9DA8EF1DF6
          B3F4727F2F348BFC7DF1EA72F67D6D7A36176A3BC77DACFD1C9DA8EF1DF6B3F4
          727F2F348BFC7DF1EA72F67D6D7A36176A3BC77DACFD1C9DA8EF1DF6B3F4727F
          2F348BFC7DF1EA72F67D6D7A36176A3BC77DACFD1C9DA8EF1DF6B3F4727F2F34
          8BFC7DF1EA72F67D6D7A36176A3BC77DACFD1C9DA8EF1DF6B3F4727F2F348BFC
          7DF1EA72F67D6D7A36176A3BC77DACFD1C9DA8EF1DF6B3F4727F2F348BFC7DF1
          EA72F67D6D7A36176A3BC77DACFD1C9DA8EF1DF6B3F4727F2F348BFC7DF1EA72
          F67D6D7A36176A3BC77DACFD1C9DA8EF1DF6B3F4727F2F348BFC7DF1EA72F67D
          6D7A36176A3BC77DACFD1C9DA8EF1DF6B3F4727F2F348BFC7DF1EA72F67D6D7A
          36176A3BC77DACFD1C9DA8EF1DF6B3F4727F2F348BFC7DF1EA72F67D6D7A3617
          6A3BC77DACFD1C9DA8EF1DF6B3F4727F2F348BFC7DF1EA72F67D6D7A36176A3B
          C77DACFD1C9DA8EF1DF6B3F4727F2F348BFC7DF1EA72F67D6D7A36176A3BC77D
          ACFD1C9DA8EF1DF6B3F4727F2F348BFC7DF1EA72F67D6D7A36176A3BC77DACFD
          1C9DA8EF1DF6B3F4727F2F348BFC7DF1EA72F67D6D7A36176A3BC77DACFD1C9D
          A8EF1DF6B3F4727F2F348BFC7DF1EA72F67D6D7A36146C92DE7FFEDECFD1CBEA
          B9EC9AEB675C557FC4AD2D29FF00A68A78BFCAA597073A4569545336397CE6A8
          F544DE2CE3A5E0306C1AFD8DDF68B95CECE666A9FEAABE6A69E9996F1C130AB0
          C1B0EB1C3EEF1FD3674E933FF54FCF261182E1D835DFE0D70BAD1654EF9988E5
          ABED9F9DFA3111F34373685685D968CD9CDB5A55C6B6AB54CF4447547EB2F15B
          5BCDAEAE8480CF9400000005086D079E0633E506D3AFC2FBD421B41E7818CF94
          1B4EBF02697CB95F9D95D3C7C8EBD2BF7A3B98504657E76574F1F23AF4AFDE8E
          E60259002000000044C44EF84808E2C741C58E84808E2D3D07169E84808E2D3D
          07169E84808E2D3D07169E84808E2D3D07169E84808E2D3D07169E84808E2D3D
          07169E84808E2D3D07169E84808E2D3D07169E84808E2D3D07169E84808E2D3D
          07169E84808E2D3D07169E84808E2D3D07169E84808E2D3D07169E84808E2D3D
          07169E84808E2D3D07163A120238B1D0900C8000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000113113BCD2120238B4F41C5A7A120238B4F41C5A7A120238B4F
          41C5A7A120238B4F41C5A7A120238B4F41C5A7A120238B4F41C5A7A120238B4F
          41C5A7A120238B4F41C5A7A120238B4F41C5A7A120238B4F41C5A7A120238B4F
          41C5A7A120238B4F41C5A7A120238B4F41C5A7A120238B4F41C5A7A120238B4F
          41C5A7A120238B4F41C5A7A12023488262277C2404689000000000001421B41E
          7818CF941B4EBF0BEF5086D079E0633E506D3AFC09A5F2E57E76574F1F23AF4A
          FDE8EE6141195F9D95D3C7C8EBD2BF7A3B980964008000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000001421B41E7818CF941B4EBF0BEF5086D079E0633E506D3A
          FC09A5F2E57E76574F1F23AF4AFDE8EE6141195F9D95D3C7C8EBD2BF7A3B9809
          6400800000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000001421B41E7818CF941B4E
          BF0BEF5086D079E0633E506D3AFC09A5F2E58E76374F1F23AF4AFDE898E2C72B
          FCFC67DC89B4EBAED433262B8564BCCD656D678EDF2DAEF6F6386DE22AA662F1
          5CD35D35453BF74C4C3F569CE9C2DE234FEDCDA9F9F7EF606D5F9EB1D26B1D2A
          0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B
          35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD78
          5BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FD
          FCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36
          A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9
          F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFB
          D8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D
          9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC
          2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7E
          FE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B
          53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FC
          FBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFD
          EC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B03
          25F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E
          5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1
          D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749A
          C74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2
          A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837
          B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD7
          85BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16F
          DFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F3
          6A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F
          9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DF
          BD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61
          D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766B
          C2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7
          EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9
          B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4F
          CFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EF
          DEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0
          325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97
          E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B
          1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749
          AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D
          2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A83
          7B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD
          785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16
          FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F
          36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9
          F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7D
          FBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF6
          1D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766
          BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B
          7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF
          9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4
          FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3E
          FDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B
          0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C9
          7E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96
          B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC74
          9AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1
          D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A8
          37B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DEC
          D785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E1
          6FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7
          F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA
          9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7
          DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF
          61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD876
          6BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0
          B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFB
          F9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D
          4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3
          EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7
          B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C
          97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F9
          6B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC7
          49AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B
          1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A
          837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DE
          CD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E
          16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF
          7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCD
          A9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D2A11DA0F3C0C67CA0DA75F87
          F3ECD385BF7F36A7E7DFBD8FC9C9191B6A37EDA765FC6318C9B99EDEDEDB1DBA
          5BDE6F36F86DE26AAEA9BC5135575D534FDB33322763FFD9}
        mmHeight = 23815
        mmLeft = 255059
        mmTop = 794
        mmWidth = 28310
        BandType = 0
        LayerName = BandLayer14
      end
      object ppLabel265: TppLabel
        DesignLayer = ppDesignLayer9
        UserName = 'Label265'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Responsavel Compra :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4763
        mmLeft = 2381
        mmTop = 118004
        mmWidth = 47361
        BandType = 0
        LayerName = BandLayer14
      end
      object ppDBText206: TppDBText
        DesignLayer = ppDesignLayer9
        UserName = 'DBText206'
        Border.mmPadding = 0
        DataField = 'responsavelcompra'
        DataPipeline = ppDBOrcamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'ppDBOrcamento'
        mmHeight = 4763
        mmLeft = 49742
        mmTop = 118004
        mmWidth = 105040
        BandType = 0
        LayerName = BandLayer14
      end
      object ppLabel266: TppLabel
        DesignLayer = ppDesignLayer9
        UserName = 'Label266'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Data Compra:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4763
        mmLeft = 155575
        mmTop = 118004
        mmWidth = 33867
        BandType = 0
        LayerName = BandLayer14
      end
      object ppLabel267: TppLabel
        DesignLayer = ppDesignLayer9
        UserName = 'Label267'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Prev. Entrega:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4763
        mmLeft = 220398
        mmTop = 118004
        mmWidth = 30427
        BandType = 0
        LayerName = BandLayer14
      end
      object ppDBText207: TppDBText
        DesignLayer = ppDesignLayer9
        UserName = 'DBText207'
        Border.mmPadding = 0
        DataField = 'datacompra'
        DataPipeline = ppDBOrcamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBOrcamento'
        mmHeight = 4763
        mmLeft = 189971
        mmTop = 118004
        mmWidth = 28840
        BandType = 0
        LayerName = BandLayer14
      end
      object ppDBText208: TppDBText
        DesignLayer = ppDesignLayer9
        UserName = 'DBText208'
        Border.mmPadding = 0
        DataField = 'dataprevitaentrega'
        DataPipeline = ppDBOrcamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBOrcamento'
        mmHeight = 4763
        mmLeft = 251884
        mmTop = 118004
        mmWidth = 28840
        BandType = 0
        LayerName = BandLayer14
      end
    end
    object ppDetailBand9: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 9260
      mmPrintPosition = 0
      object ppDBText151: TppDBText
        DesignLayer = ppDesignLayer9
        UserName = 'DBText13'
        Border.mmPadding = 0
        DataField = 'nomeproduto'
        DataPipeline = ppDBItensOrcamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        VerticalAlignment = avCenter
        DataPipelineName = 'ppDBItensOrcamento'
        mmHeight = 8473
        mmLeft = 59528
        mmTop = 265
        mmWidth = 34860
        BandType = 4
        LayerName = BandLayer14
      end
      object ppDBText158: TppDBText
        DesignLayer = ppDesignLayer9
        UserName = 'DBText15'
        Border.mmPadding = 0
        DataField = 'qtde'
        DataPipeline = ppDBItensOrcamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'ppDBItensOrcamento'
        mmHeight = 8473
        mmLeft = 9522
        mmTop = 265
        mmWidth = 8991
        BandType = 4
        LayerName = BandLayer14
      end
      object ppDBText159: TppDBText
        DesignLayer = ppDesignLayer9
        UserName = 'DBText17'
        Border.mmPadding = 0
        DataField = 'observacao'
        DataPipeline = ppDBItensOrcamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        VerticalAlignment = avCenter
        DataPipelineName = 'ppDBItensOrcamento'
        mmHeight = 8473
        mmLeft = 251884
        mmTop = 265
        mmWidth = 31485
        BandType = 4
        LayerName = BandLayer14
      end
      object ppDBText160: TppDBText
        DesignLayer = ppDesignLayer9
        UserName = 'DBText18'
        Border.mmPadding = 0
        DataField = 'valorunidade'
        DataPipeline = ppDBItensOrcamento
        DisplayFormat = '$####,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'ppDBItensOrcamento'
        mmHeight = 8473
        mmLeft = 136787
        mmTop = 265
        mmWidth = 14810
        BandType = 4
        LayerName = BandLayer14
      end
      object ppDBText161: TppDBText
        DesignLayer = ppDesignLayer9
        UserName = 'DBText19'
        Border.mmPadding = 0
        DataField = 'valortotal'
        DataPipeline = ppDBItensOrcamento
        DisplayFormat = '$####,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'ppDBItensOrcamento'
        mmHeight = 8473
        mmLeft = 151868
        mmTop = 265
        mmWidth = 19315
        BandType = 4
        LayerName = BandLayer14
      end
      object ppLine26: TppLine
        DesignLayer = ppDesignLayer9
        UserName = 'Line5'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        mmHeight = 1054
        mmLeft = 1058
        mmTop = 8997
        mmWidth = 283105
        BandType = 4
        LayerName = BandLayer14
      end
      object ppDBText162: TppDBText
        DesignLayer = ppDesignLayer9
        UserName = 'DBText20'
        Border.mmPadding = 0
        DataField = 'item'
        DataPipeline = ppDBItensOrcamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'ppDBItensOrcamento'
        mmHeight = 8473
        mmLeft = 1323
        mmTop = 265
        mmWidth = 7666
        BandType = 4
        LayerName = BandLayer14
      end
      object ppDBText163: TppDBText
        DesignLayer = ppDesignLayer9
        UserName = 'DBText58'
        Border.mmPadding = 0
        DataField = 'descontoitem'
        DataPipeline = ppDBItensOrcamento
        DisplayFormat = '$####,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'ppDBItensOrcamento'
        mmHeight = 8473
        mmLeft = 234686
        mmTop = 265
        mmWidth = 16404
        BandType = 4
        LayerName = BandLayer14
      end
      object ppDBText164: TppDBText
        DesignLayer = ppDesignLayer9
        UserName = 'DBText60'
        Border.mmPadding = 0
        DataField = 'marcanome'
        DataPipeline = ppDBItensOrcamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        VerticalAlignment = avCenter
        DataPipelineName = 'ppDBItensOrcamento'
        mmHeight = 8473
        mmLeft = 94981
        mmTop = 265
        mmWidth = 24328
        BandType = 4
        LayerName = BandLayer14
      end
      object ppDBText165: TppDBText
        DesignLayer = ppDesignLayer9
        UserName = 'DBText16'
        Border.mmPadding = 0
        DataField = 'codfabproduto'
        DataPipeline = ppDBItensOrcamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        VerticalAlignment = avCenter
        DataPipelineName = 'ppDBItensOrcamento'
        mmHeight = 8473
        mmLeft = 36245
        mmTop = 265
        mmWidth = 23015
        BandType = 4
        LayerName = BandLayer14
      end
      object ppDBText172: TppDBText
        DesignLayer = ppDesignLayer9
        UserName = 'DBText24'
        Border.mmPadding = 0
        DataField = 'unidademedida'
        DataPipeline = ppDBItensOrcamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        VerticalAlignment = avCenter
        DataPipelineName = 'ppDBItensOrcamento'
        mmHeight = 8473
        mmLeft = 18786
        mmTop = 265
        mmWidth = 16919
        BandType = 4
        LayerName = BandLayer14
      end
      object ppDBText173: TppDBText
        DesignLayer = ppDesignLayer9
        UserName = 'DBText601'
        Border.mmPadding = 0
        DataField = 'originalstr'
        DataPipeline = ppDBItensOrcamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'ppDBItensOrcamento'
        mmHeight = 8473
        mmLeft = 119592
        mmTop = 265
        mmWidth = 16933
        BandType = 4
        LayerName = BandLayer14
      end
      object ppDBText174: TppDBText
        DesignLayer = ppDesignLayer9
        UserName = 'DBText167'
        Border.mmPadding = 0
        DataField = 'ipi'
        DataPipeline = ppDBItensOrcamento
        DisplayFormat = '$####,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'ppDBItensOrcamento'
        mmHeight = 8473
        mmLeft = 171715
        mmTop = 265
        mmWidth = 15240
        BandType = 4
        LayerName = BandLayer14
      end
      object ppDBText175: TppDBText
        DesignLayer = ppDesignLayer9
        UserName = 'DBText168'
        Border.mmPadding = 0
        DataField = 'diferencialalicota'
        DataPipeline = ppDBItensOrcamento
        DisplayFormat = '$####,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'ppDBItensOrcamento'
        mmHeight = 8473
        mmLeft = 187590
        mmTop = 265
        mmWidth = 15240
        BandType = 4
        LayerName = BandLayer14
      end
      object ppDBText176: TppDBText
        DesignLayer = ppDesignLayer9
        UserName = 'DBText169'
        Border.mmPadding = 0
        DataField = 'icmst'
        DataPipeline = ppDBItensOrcamento
        DisplayFormat = '$####,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'ppDBItensOrcamento'
        mmHeight = 8473
        mmLeft = 203465
        mmTop = 265
        mmWidth = 15240
        BandType = 4
        LayerName = BandLayer14
      end
      object ppDBText177: TppDBText
        DesignLayer = ppDesignLayer9
        UserName = 'DBText170'
        Border.mmPadding = 0
        DataField = 'freteitem'
        DataPipeline = ppDBItensOrcamento
        DisplayFormat = '$####,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'ppDBItensOrcamento'
        mmHeight = 8473
        mmLeft = 219074
        mmTop = 265
        mmWidth = 15240
        BandType = 4
        LayerName = BandLayer14
      end
    end
    object ppFooterBand9: TppFooterBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppSystemVariable17: TppSystemVariable
        DesignLayer = ppDesignLayer9
        UserName = 'SystemVariable3'
        Border.mmPadding = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 244484
        mmTop = 794
        mmWidth = 17729
        BandType = 8
        LayerName = BandLayer14
      end
      object ppSystemVariable18: TppSystemVariable
        DesignLayer = ppDesignLayer9
        UserName = 'SystemVariable4'
        Border.mmPadding = 0
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 266974
        mmTop = 794
        mmWidth = 16405
        BandType = 8
        LayerName = BandLayer14
      end
      object ppLine27: TppLine
        DesignLayer = ppDesignLayer9
        UserName = 'Line6'
        Border.mmPadding = 0
        Pen.Width = 2
        Weight = 1.500000000000000000
        mmHeight = 529
        mmLeft = 265
        mmTop = 265
        mmWidth = 282710
        BandType = 8
        LayerName = BandLayer14
      end
    end
    object ppSummaryBand9: TppSummaryBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppShape69: TppShape
        DesignLayer = ppDesignLayer9
        UserName = 'Shape5'
        Brush.Color = clTeal
        Pen.Style = psClear
        mmHeight = 4763
        mmLeft = 529
        mmTop = 264
        mmWidth = 283634
        BandType = 7
        LayerName = BandLayer14
      end
      object ppDBCalc6: TppDBCalc
        DesignLayer = ppDesignLayer9
        UserName = 'DBCalc2'
        Border.mmPadding = 0
        DataField = 'qtde'
        DataPipeline = ppDBItensOrcamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'ppDBItensOrcamento'
        mmHeight = 4498
        mmLeft = 61912
        mmTop = 265
        mmWidth = 12171
        BandType = 7
        LayerName = BandLayer14
      end
      object ppDBCalc41: TppDBCalc
        DesignLayer = ppDesignLayer9
        UserName = 'DBCalc3'
        Border.mmPadding = 0
        DataField = 'valortotal'
        DataPipeline = ppDBItensOrcamento
        DisplayFormat = '$####,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'ppDBItensOrcamento'
        mmHeight = 4498
        mmLeft = 99219
        mmTop = 264
        mmWidth = 29104
        BandType = 7
        LayerName = BandLayer14
      end
      object ppLabel216: TppLabel
        DesignLayer = ppDesignLayer9
        UserName = 'Label23'
        Border.mmPadding = 0
        Caption = 'Valor Bruto:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 81227
        mmTop = 529
        mmWidth = 17727
        BandType = 7
        LayerName = BandLayer14
      end
      object ppLabel217: TppLabel
        DesignLayer = ppDesignLayer9
        UserName = 'Label27'
        Border.mmPadding = 0
        Caption = 'Total Unidades: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 38100
        mmTop = 794
        mmWidth = 23813
        BandType = 7
        LayerName = BandLayer14
      end
      object ppLabel218: TppLabel
        DesignLayer = ppDesignLayer9
        UserName = 'Label28'
        Border.mmPadding = 0
        Caption = 'Total Items: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 2910
        mmTop = 794
        mmWidth = 18257
        BandType = 7
        LayerName = BandLayer14
      end
      object ppDBCalc42: TppDBCalc
        DesignLayer = ppDesignLayer9
        UserName = 'DBCalc5'
        Border.mmPadding = 0
        DataField = 'id'
        DataPipeline = ppDBItensOrcamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        VerticalAlignment = avCenter
        DBCalcType = dcCount
        DataPipelineName = 'ppDBItensOrcamento'
        mmHeight = 4498
        mmLeft = 20902
        mmTop = 528
        mmWidth = 12171
        BandType = 7
        LayerName = BandLayer14
      end
      object ppLabel219: TppLabel
        DesignLayer = ppDesignLayer9
        UserName = 'Label1'
        Border.mmPadding = 0
        Caption = 'Valor Bruto + Frete:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 128853
        mmTop = 529
        mmWidth = 32015
        BandType = 7
        LayerName = BandLayer14
      end
      object ppDBCalc45: TppDBCalc
        DesignLayer = ppDesignLayer9
        UserName = 'DBCalc43'
        Border.mmPadding = 0
        DataField = 'valorbrutomaisfrete'
        DataPipeline = ppDBItensOrcamento
        DisplayFormat = '$####,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'ppDBItensOrcamento'
        mmHeight = 4498
        mmLeft = 160867
        mmTop = 265
        mmWidth = 29104
        BandType = 7
        LayerName = BandLayer14
      end
      object ppLabel220: TppLabel
        DesignLayer = ppDesignLayer9
        UserName = 'Label210'
        Border.mmPadding = 0
        Caption = 'Valor Liquido:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 199761
        mmTop = 529
        mmWidth = 20373
        BandType = 7
        LayerName = BandLayer14
      end
      object ppDBCalc46: TppDBCalc
        DesignLayer = ppDesignLayer9
        UserName = 'DBCalc44'
        Border.mmPadding = 0
        DataField = 'valorliquido'
        DataPipeline = ppDBItensOrcamento
        DisplayFormat = '$####,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'ppDBItensOrcamento'
        mmHeight = 4498
        mmLeft = 220395
        mmTop = 264
        mmWidth = 29104
        BandType = 7
        LayerName = BandLayer14
      end
    end
    object ppDesignLayers9: TppDesignLayers
      object ppDesignLayer9: TppDesignLayer
        UserName = 'BandLayer14'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList9: TppParameterList
    end
  end
  object dsOrcamento: TDataSource
    DataSet = TOrcamento
    Left = 216
    Top = 96
  end
  object dsOrcamentoItens: TDataSource
    DataSet = TItensOrcamento
    Left = 224
    Top = 152
  end
  object ppDBPedidoProduto: TppDBPipeline
    DataSource = dsOrcamento
    UserName = 'DBOrcamento1'
    Left = 368
    Top = 112
  end
  object ppRepPedidoProduto: TppReport
    AutoStop = False
    DataPipeline = ppDBPedidoProduto
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4 (8.2 x 11.7 in; 210 x 297 mm)'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
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
    Left = 368
    Top = 168
    Version = '19.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPedidoProduto'
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 30692
      mmPrintPosition = 0
      object ppLabel2: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'LblOrdemPedido'
        Border.mmPadding = 0
        Caption = 'Pedidos por Produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 18
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 7673
        mmLeft = 1323
        mmTop = 17994
        mmWidth = 67469
        BandType = 0
        LayerName = BandLayer3
      end
      object ppShape1: TppShape
        DesignLayer = ppDesignLayer1
        UserName = 'Shape1'
        Brush.Color = clTeal
        Pen.Style = psClear
        mmHeight = 4763
        mmLeft = 1323
        mmTop = 25927
        mmWidth = 195792
        BandType = 0
        LayerName = BandLayer3
      end
      object ppLabel9: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label9'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        VerticalAlignment = avCenter
        mmHeight = 4763
        mmLeft = 26193
        mmTop = 25665
        mmWidth = 61664
        BandType = 0
        LayerName = BandLayer3
      end
      object ppLabel30: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label30'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Valor Uni.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        VerticalAlignment = avCenter
        mmHeight = 4763
        mmLeft = 163519
        mmTop = 25665
        mmWidth = 16142
        BandType = 0
        LayerName = BandLayer3
      end
      object ppLabel10: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label301'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Qtde.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        VerticalAlignment = avCenter
        mmHeight = 4763
        mmLeft = 151613
        mmTop = 25665
        mmWidth = 11101
        BandType = 0
        LayerName = BandLayer3
      end
      object ppLabel12: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label302'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Valor Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        VerticalAlignment = avCenter
        mmHeight = 4763
        mmLeft = 179923
        mmTop = 25665
        mmWidth = 16142
        BandType = 0
        LayerName = BandLayer3
      end
      object ppLabel14: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label14'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Data Compra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        VerticalAlignment = avCenter
        mmHeight = 4763
        mmLeft = 2381
        mmTop = 25927
        mmWidth = 22754
        BandType = 0
        LayerName = BandLayer3
      end
      object ppLabel1: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label1'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'Fornecedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        VerticalAlignment = avCenter
        mmHeight = 4763
        mmLeft = 88642
        mmTop = 25928
        mmWidth = 62194
        BandType = 0
        LayerName = BandLayer3
      end
      object ppImage2: TppImage
        DesignLayer = ppDesignLayer1
        UserName = 'Image2'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = False
        Stretch = True
        Border.mmPadding = 0
        Picture.Data = {
          0A544A504547496D61676529BC0000FFD8FFE000104A46494600010100000100
          010000FFDB004300030202020202030202020303030304060404040404080606
          050609080A0A090809090A0C0F0C0A0B0E0B09090D110D0E0F101011100A0C12
          131210130F101010FFDB00430103030304030408040408100B090B1010101010
          1010101010101010101010101010101010101010101010101010101010101010
          10101010101010101010101010FFC00011080500050003012200021101031101
          FFC4001E0001000203010101010100000000000000000109020708060405030A
          FFC4005510010001010502060B0F010702050402030001020304050611073108
          12213851B4161732555676779293B1D10913141934415761717273819194A122
          151835424382C152E12333A2B2C24453748324456267F1FFC4001C0101000105
          010100000000000000000000000103050607080402FFC4004011010001010404
          0B05060700030101000000010203040511062131A1071213164151537181B1D1
          333536619114223242C1E1151723525462B27282F02492FFDA000C0301000211
          0311003F00E45CF99C76917EDA9664C2309CD998EDEDEDB1EBE585DEEF617FB7
          9AABAA6F15C534534C55BFE6D21FBFDAB78607CD92F6ABA7FF008F7E7C996397
          858DD3C7C8EBF2BF8A7963513B1425DAB3860F817B55F417E3B5670C1F02F6AB
          E82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423D
          AB3860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED57D0
          5F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F02F6
          ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD42
          3DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED57
          D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F02
          F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD
          423DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED
          57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F
          02F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80
          CD423DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05
          ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C
          1F02F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB
          80CD423DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E
          05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B567
          0C1F02F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2
          FB80CD423DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE18
          3E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5
          670C1F02F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0B
          F2FB80CD423DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE
          183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3
          B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA
          0BF2FB80CD423DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6A
          CE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417
          E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAA
          FA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F
          6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F4
          17E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BD
          AAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE03350
          8F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55
          F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0
          BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE033
          508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B
          55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C307
          C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE0
          33508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F81
          7B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C3
          07C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F02F6ABE82FCBE
          E033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F
          817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59
          C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F02F6ABE82FC
          BEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB386
          0F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED
          59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F02F6ABE82
          FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3
          860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED57D05F8
          ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F02F6ABE
          82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423DA
          B3860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED57D05
          F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F02F6A
          BE82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423
          DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED57D
          05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F02F
          6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD4
          23DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED5
          7D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F0
          2F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80C
          D423DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05E
          D57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55FDBDF9F8192B3
          76D230EDA8601836319A332DDEF3618F5D2EF79BB5E6FF006F4D5455178A69AE
          8AE99AB9277C4C4BFD064EE5086D039385FE331FFF00B02D3AF846B7CD95F9D9
          5D3C7C8EBD2BF7A3B98504657E76574F1F23AF4AFDE8EE602590020000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000005086D079E0633E506D3AFC2FBD421B41E7
          818CF941B4EBF02697CB95F9D95D3C7C8EBD2BF7A3B98504657E76574F1F23AF
          4AFDE8EE60259002000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000005086D079
          E0633E506D3AFC2FBD421B41E7818CF941B4EBF02697CB95F9D95D3C7C8EBD2B
          F7A3B98504657E76574F1F23AF4AFDE8EE602590020000000046B00918F1A13C
          68E9048C78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0
          190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C
          78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D0
          71A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0
          190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C
          78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D0
          71A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0
          190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C
          78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D0
          71A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0
          190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C
          78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D0
          71A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D1D271
          A3EB064238D12900000000001421B41E7818CF941B4EBF0BEF5086D079E0633E
          506D3AFC09A5F2E57E76574F1F23AF4AFDE8EE6141195F9D95D3C7C8EBD2BF7A
          3B98096400800001133A0226A88DEF23B45DA9E46D96E0D56399D31FB0C3AC27
          58B3A2A9D6D6DAA8FF002D14472D53CB1F572F2B3DA7E7FC1B66392714CEB8E5
          73F06C3AC66B8B389D2AB6B49E4A2CE9FAEAAA623F954C6D476A59AB6B39B2F5
          9B334DFEBB5B5B6AA62C6C2267DEAED67ACF16CE8A7E688FD677CF2CA9DA5A45
          9C315D26D25A302B38A288E35A55B23AA3AE5D7999FDD1EC1EC2F55D8E50C837
          8BDD844E94DBDF6F1167C68FB94C4E9FACBF03E323CC3A693B3AC3FF00735B8C
          75D7E743CDCBD6D6169A658C5A559C5AE5DD11E8ECFF008C8F307D1D61FF00B9
          B43E323CC1F47587FEE6D1C63ACF49ACF4A396AFADF1CEEC63B6DD1E8ECEF8C8
          F307D1D61FFB9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18EDB7
          47A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FFB9B4718EB3D26B3D272D5F5
          9CEEC63B6DD1E8ECEF8C8F307D1D61FF00B9B43E323CC1F47587FEE6D1C63ACF
          49ACF49CB57D673BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FF
          00B9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FFB9B43E3
          23CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE323CC1F475
          87FEE6D0F8C8F307D1D61FFB9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF
          8C8F307D1D61FF00B9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D673BB1
          8EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FF00B9B4718EB3D26B3D
          272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FFB9B43E323CC1F47587FEE6D1C
          63ACF49ACF49CB57D673BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1
          D61FFB9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FF00B9
          B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE323CC
          1F47587FEE6D0F8C8F307D1D61FF00B9B4718EB3D26B3D272D5F59CEEC63B6DD
          1E8ECEF8C8F307D1D61FFB9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D6
          73BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FFB9B4718EB3D26
          B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FF00B9B43E323CC1F47587FE
          E6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F
          307D1D61FF00B9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D6
          1FFB9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE
          323CC1F47587FEE6D0F8C8F307D1D61FFB9B4718EB3D26B3D272D5F59CEEC63B
          6DD1E8ECEF8C8F307D1D61FF00B9B43E323CC1F47587FEE6D1C63ACF49ACF49C
          B57D673BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FF00B9B471
          8EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FFB9B43E323CC1F47
          587FEE6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE323CC1F47587FEE6D0
          F8C8F307D1D61FFB9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D
          1D61FF00B9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18EDB747A
          3B3BE323CC1F47587FEE6D0F8C8F307D1D61FF00B9B4718EB3D26B3D272D5F59
          CEEC63B6DD1E8ECEF8C8F307D1D61FFB9B43E323CC1F47587FEE6D1C63ACF49A
          CF49CB57D673BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FFB9B
          4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FF00B9B43E323C
          C1F47587FEE6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE323CC1F47587F
          EE6D0F8C8F307D1D61FF00B9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8
          C8F307D1D61FFB9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18ED
          B747A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FFB9B4718EB3D26B3D272D5
          F59CEEC63B6DD1E8ECEF8C8F307D1D61FF00B9B43E323CC1F47587FEE6D1C63A
          CF49ACF49CB57D673BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1D61
          FF00B9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FFB9B43
          E323CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE323CC1F4
          7587FEE6D0F8C8F307D1D61FFB9B4718EB3D26B3D272D5F59CEEC63B6DD1E8EC
          EF8C8F307D1D61FF00B9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D673B
          B18EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FF00B9B4718EB3D26B
          3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FFB9B43E323CC1F47587FEE6D
          1C63ACF49ACF49CB57D673BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F307
          D1D61FFB9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FF00
          B9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE323
          CC1F47587FEE6D0F8C8F307D1D61FF00B9B4718EB3D26B3D272D5F59CEEC63B6
          DD1E8ECEF8C8F307D1D61FFB9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57
          D673BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FFB9B4718EB3D
          26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FF00B9B43E323CC1F47587
          FEE6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE323CC1F47587FEE6D0F8C
          8F307D1D61FF00B9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1
          D61FFB9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18EDB747A3B3
          BE323CC1F47587FEE6D0F8C8F307D1D61FFB9B4718EB3D26B3D272D5F59CEEC6
          3B6DD1E8ECEF8C8F307D1D61FF00B9B43E323CC1F47587FEE6D1C63ACF49ACF4
          9CB57D673BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FF00B9B4
          718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FFB9B43E323CC1F
          47587FEE6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE323CC1F47587FEE6
          D0F8C8F307D1D61FFB9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F30
          7D1D61FF00B9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18EDB74
          7A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FF00B9B4718EB3D26B3D272D5F
          59CEEC63B6DD1E8ECEF8C8F307D1D61FFB9B43E323CC1F47587FEE6D1C63ACF4
          9ACF49CB57D673BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FFB
          9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FF00B9B43E32
          3CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE323CC1F4758
          7FEE6D0F8C8F307D1D61FF00B9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECE
          F8C8F307D1D61FFB9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18
          EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FFB9B4718EB3D26B3D272
          D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FF00B9B43E323CC1F47587FEE6D1C6
          3ACF49ACF49CB57D673BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1D
          61FF00B9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FFB9B
          43E323CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE323CC1
          F47587FEE6D0F8C8F307D1D61FFB9B4718EB3D26B3D272D5F59CEEC63B6DD1E8
          ECEF8C8F307D1D61FF00B9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D67
          3BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FF00B9B4718EB3D2
          6B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FFB9B43E323CC1F47587FEE
          6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F3
          07D1D61FFB9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FF
          00B9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE3
          23CC3F473877EE6B7EF658F747F0ABC5EA8B0CDD90ADEEB6154C71ADEE3788B4
          9A63EE5511AFEB0E1227422DAB87DD1A658C51544CDAE7E11E8B94D9C6D5F21E
          D53068C6B2563F617FB2A748B6B38FE9B5B0AA7FCB5D13CB4FCFF54E9C932F61
          4DA53311CBBD4D1B33DA766BD9566CBA66CCAB7FAEC2DEEF5445AD96B3EF778B
          3D796CED23E7A67FEF1CAB66D94ED1707DAAE46C2B3AE0B3C5B1C42C75B4B29A
          B59B1B58E4AECE7EB89D7ED8D27E77AACAD3948F9B66E8CE92D38DD1367691C5
          B4A76C744C75C7A3D980A8CB00000005086D079E0633E506D3AFC2FBD421B41E
          7818CF941B4EBF02697CB95F9D95D3C7C8EBD2BF7A3B98504657E76574F1F23A
          F4AFDE8EE60259002000044A5156E0719FBA3B9A2F572CAF95F2A585A554D962
          17BB5BD5BD3AF255EF74C451FF00BEA703BB5FDD26FF0011C9BF8578F5C38A27
          7BC56FF8DA234D2D2AAF18B4899D997920051626000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000098DEEF0F7
          383345EAF18366ACA56D695556375B7B2BED853AF25335C4D35FEBA51FA383E3
          7C3B47DCDBFF001FCE1FFE2D87FEE56B09CAB657A19695518C594474E71BA5DE
          709446E4BDADF00000002843683CF0319F28369D7E17DEA10DA0F3C0C67CA0DA
          75F8134BE5CAFCECAE9E3E475E95FBD1DCC28232BF3B2BA78F91D7A57EF47730
          12C801000022ADC9455B8844B84BDD26FF0011C9BF8579F5D2E289DEED7F749B
          FC4726FE15E7D74B8A277BC56FF8DA1F4CBDF16DE1E50801458A800000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0001F3C7DAED2F736FFC7F387FF8961FFB9C5BF3C7DAED2F736FFC7F387FF896
          1FFB956C7DA4328D0EF7CD8F8F94BBCE372511B92F737DC0000000A10DA0F3C0
          C67CA0DA75F85F7A843683CF0319F28369D7E04D2F972BF3B2BA78F91D7A57EF
          47730A08CAFCECAE9E3E475E95FBD1DCC04B200400008AB725156E2112E12F74
          9BFC4726FE15E7D74B8A277BB5FDD26FF11C9BF8579F5D2E289DEF15BFE3687D
          32F7C5B787942005162A00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000007CF1F6BB4BDCDBFF1FCE1FF00E258
          7FEE717446AED1F737274C7B37CF4DD6C3FF007AAD8FB48651A1F19633639FCF
          CA5DE71B9288DC97B9BEC0000005086D079E0633E506D3AFC2FBD421B41E7818
          CF941B4EBF02697CB95F9D95D3C7C8EBD2BF7A3B98504657E76574F1F23AF4AF
          DE8EE602590020000455B928AB710897097BA4DFE23937F0AF3EBA5C513BDDAF
          EE937F88E4DFC2BCFAE97144EF78ADFF001B43E997BE2DBC3CA10028B1500000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000000000013A0
          204C47CDAC278A2729623F6304CA19A3325A53658065FC4310AAB9D23E0D76AE
          D23F588D21B6729F033DBD66AE25A5595230AB1AB978F885B53673A74C531ACB
          EA9A66A9CA21EEBB6197CBDCE56165555DD12D1E7167E6876C651F738AF969EF
          7699CF3FD1671BEAB2B85DF59FB38D5B75E53E03BB08CB3C4B5BD60778C66DA3
          499AAFF6F355333D3C58D34548B0AE76B24BA68362979CA6BA6288F9CFE90AC4
          B961D886236B16387DC6DEF35CCE9C5B2B39AE7F486C8CA9C1976DF9CB895613
          90711B3B2AF4E2DB5EA9F78B39FF00755A2D4B2F6CFB24E55A29B3CBB95F0BC3
          E28E4A66C2EB453579DA6BFCBF766CFE68988FB1569BBC74CB26BAF075634E53
          79B599EE8CBCF357BE51F73B7681894D9DB66DCD985E11673A71ACAC29AADED6
          3F4D299FD5D51B02E0CD96B60937FBC60F8DDFB12BD62767459DE2D2DE9A68A3
          4A6758E2D31AE9CBF5B71534F15944EB2A94D9D34CE710CAB0ED19C370BAE2D6
          C28FBD1D3339CB20151900000000A10DA0F3C0C67CA0DA75F85F7A843683CF03
          19F28369D7E04D2F972BF3B2BA78F91D7A57EF47730A08CAFCECAE9E3E475E95
          FBD1DCC04B200400008AB725156E2112E12F749BFC4726FE15E7D74B8A277BB5
          FDD26FF11C9BF8579F5D2E289DEF15BFE3687D32F7C5B787942005162A000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000026204E48194D331F3
          4A6C6C6DAF16B4D85859D569695CF169A29899AAA9E8888E5936A6299AA72860
          365E54E0DBB73CE7345581ECD719F79B4E58B7BDD8FC12CE63A62AB69A6263EC
          D5B9F2A7B9D9B4DC4B896D9B33560D82D955CB551614D77BB5A63A263FA29D7E
          CAA5F716754EC85E2EBA3F895F3D958D5E31979E4E4ED3EBD0D223E758E652F7
          3CF64384FBDDB666C5B1AC7AD29D38D4576D177B299FAA2CE22AFD6A96E6CA9B
          00D8F6498A6ACB990707BADB51BADE6ED4D76BE7D5AD5FCAA45DEA9DB2C96E9C
          1FDFED75DBD54D11F59DDAB7AAAB2C6C9369B9CEAA232C646C66FF004DA7736B
          45D2BA6CA7FF00D954453FCB71E53E017B6EC7FDEED719B3C3302B1ABBAF84DB
          FBE5AD3FEDA358FF00D4B2EB1BAD85DE8F7BB1B3A28A7A29A62223F467C588E4
          8558BBD31B592DD383EB8596536F5D55CFD21C71947DCE5CA775E25AE72CED7F
          C42B8D38D6573B2A6C2CE7F39D6AFE5BA729F04CD846509A2D2E191AE97AB6A3
          969B6BF4CDBD713D3AD4DBE2AC514C6C864B74D1EC32E5AECAC633EB98CE77BE
          1C3B02C2307B28B1C2F0DBA5D2888D229B0B1A688D3F287DBC548FA5E29A69A6
          32A63244469CA99D7A407D44640002637A131BC190000000002843683CF0319F
          28369D7E17DEA10DA0F3C0C67CA0DA75F8134BE5CAFCECAE9E3E475E95FBD1DC
          C28232BF3B2BA78F91D7A57EF4773012C801000022ADC9455B8844B84BDD26FF
          0011C9BF8579F5D2E289DEED7F749BFC4726FE15E7D74B8A277BC56FF8DA1F4C
          BDF16DE1E50801458A8000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000009D04
          A065146B3114C4CCCEED3E77A7CB7B30DA0E6FB58B1CB793717BFD53BBDE6EB5
          CC7EBA6898899D8AB6777B5B69E2D9D3333F28CDE593C9D30E89CA7C04F6E798
          E68AF12B85C703B1AF978F7DBC44D511F5D14EB547E8DCF947DCE3C0EC3896B9
          D73DDEAF53FE7B1B858459D3F95756B3FF00A5529B2AEAE85FEE9A278B5EF5D3
          65311F3D5E6E0FD23A5FA38565DC771DBC5174C1706BF5FEDAD3B9A2EF77AAD2
          67F2885A5652E07DB03CA5C4AEC72559E256F469A5B6236B55BCCFDB4F2513E6
          B6BE1196B00C02C22EB81E0F72C3EC63759DD6EF45953FA5310FBA6ED3F9A593
          5D783AB7AB5DE6D623BB5FA2AD729F03DDBFE6D9B3AEC723DB61B615E9ADAE25
          694DDB8BF5CD154F1FF4A5B9F297B9C38EDB554DA675DA1DD2EB11A4D56186DD
          6AB699FABDF2B9A623CD9779F1698E8348568B0A236EB64B74D05C2EEFAED226
          B9F9CE5BA1CF194B8086C0F2E4515E2785625982DA8D278D88DF2A8A75FB965C
          4A663EA9D5B932BECD721649B3F7ACA594707C2234D266E972B3B2AAAFB6AA63
          5AA7EB97A4D51AEAA914C46C864976C2EE5738CAC2CA9A7BA208A298D7494716
          1225EEC88D6234004800000000000000098DE84C6F064000000000A10DA0F3C0
          C67CA0DA75F85F7A843683CF0319F28369D7E04D2F972BF3B2BA78F91D7A57EF
          47730A08CAFCECAE9E3E475E95FBD1DCC04B200400008AB725156E2112E12F74
          9BFC4726FE15E7D74B8A277BB5FDD26FF11C9BF8579F5D2E289DEF15BFE3687D
          32F7C5B787942005162A00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000988D7538BAEE9FE
          099C93113281F6E15826338E5E22E982E137CC42DE74D2CEEB6155AD5FA53132
          DAB94F824EDEB374516975C8B78B85857A696D88DA53614C7DB4CEB5C79AFA8A
          6AAB643D977C3AF77B9CAC6CE6AEE8969D4C6EDD2EC8CA7EE72666BC7BDDB673
          CF374B9C4F2D76170B09B5AA3ECAEAD23FF4B75650E01DB0FC0389698B5D711C
          72DA9D3FAAF97898A27EDA29D225522C2B964973D08C56F3AEBA2288F9CFE90A
          D1BBDDAF17BB5A6C2EB61696B6957253459D335553F943DF654E0FBB64CE734C
          E07B3FC5ABB3ABFD5B6B19B1A223A666BD3916A9973649B38CA3674D965CC9B8
          4DC229DD36575A627F5D357ABA2C6CECE22298D2237446E8558BBC74CB25BAF0
          73671AEF56D9FCA98F5573653F73DB6AB8BF12D7336358560B673A4D5445536F
          5E9F969112DD1947DCF2D98E1BC4AF34E60C5F18B4A796AA2898B0A35E8E4E59
          875971683488DCA9165452C92E9A1D84DD729E4F8D3FEDAFF66B8CA7C1C762F9
          329A2704C8185C5A51FEADBD97BF5733D3335EB0D8576B8DD2E3654D85D2C2CE
          C6CE88D29A2CE88A698FB221FDB5943EE22236322B1BAD8DDE38B6344531F28C
          8E2D3D26911B812AE9D651AEA000000000000000000000000000002637A131BC
          190000000002843683CF0319F28369D7E17DEA10DA0F3C0C67CA0DA75F8134BE
          5CAFCECAE9E3E475E95FBD1DCC28232BF3B2BA78F91D7A57EF4773012C801000
          022ADC9455B8844B84BDD26FF11C9BF8579F5D2E289DEED7F749BFC4726FE15E
          7D74B8A277BC56FF008DA1F4CBDF16DE1E50801458A800000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000278B
          AFF9A19D958DA5B57C4B1B2AAD2A9F9A989991F514CD5B1FCC7BACA7B0DDADE7
          79A2ACB3B3FC6AF7655EEB6F83554597E75D5A531FAB73E53F73E76C98D4D16B
          98EFF83601653DD536B6F36F6D1F65367134CF9D0FB8B3AAAD90BA5D702C46FB
          EC2C6A9F0CA3EB2E5F2235E4D7E6F9D60F94BDCE9D9DE1D345AE6FCDB8CE3369
          4F2D567768A2E9653F54F77569F6550DD994B831EC2B25C515E0DB36C22BB6B3
          D262DEFB65F0BB489E98AADB8D313F668A9177AA76EA64D74D00C46DB5DB554D
          11DF9CEE555659C819DF3A5AC58E52CA58C63154CE9ADCAE5696D4C7DB5531A4
          7E72DC994B80C6DFB32F12D6FD815C700B0AE35E3E277CA62AD3EE5971EA89FA
          A6216776171BADD6CA9B0BB5851656744694D1453C5A623A2221FDB894EFD156
          2EF4C6D64B74E0F2E567AEF16935776A8FD65C4D94BDCDEC36CA68B7CEDB44BD
          5E27926AB0C32EB4D9447D5C7B49AB5F361BA729F033D806578A2BEC2E8C56DE
          8E59B4C4EDAABC6B3D3C4AA7891F952DDFC5A53AC69C92AB14534EC864B74D1B
          C2EE5ECAC633EB9D73BF37E561194B2D6016145D704C0EE371B1B3E4A68BBD85
          36711FA43F522CE888E484EB28D65F4BD5345344654C64998A67E794694C6E01
          F59275946A0240000000000000000000000000000000000000004C6F42637832
          0000000005086D079E0633E506D3AFC2FBD421B41E7818CF941B4EBF02697CB9
          5F9D95D3C7C8EBD2BF7A3B98504657E76574F1F23AF4AFDE8EE6025900200004
          55B928AB710897097BA4DFE23937F0AF3EBA5C513BDDAFEE937F88E4DFC2BCFA
          E97144EF78ADFF001B43E997BE2DBC3CA10028B1500000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000120813A7D52FDCC0B23E7
          0CD16B4D965ECB189E2335F73377BB575533FEE88D3F94C673B156CEC6D2D672
          A22667E4FC21BEF297027DBC6688A2D6DF2ED8E0F635693355FEDE28AA23EEC6
          B32DCF94FDCE0A3FA2D73AE7EAA7E79B2C3EEFA47D93555FF0FBA6CABABA17DB
          A68AE2B7BD7458CC475CEAF370FC53131BE75FB1F4E1F84E278A5AC58E1B875E
          6F75CCE91163655573FC42D03287029D82E579A2D2DB2C578B5AD3A4F1EFF6F5
          5A46BD3A4690DBD81647CA1966CA9B2CBD96F0DC3E9A6348F83DDA8A27F588D6
          5522ED3D32C9AE9C1E5E6BCA6F36B14F74673FA2AC329F057DBA671E25786E42
          BEDDEC6D375B5F74BBD131D3135374655F739F3A5F628B6CDF9C30EC36CE749A
          ACEEB4556F694FEBA53FCAC062CA888D2213C58D3455A6C28A76B25BA681E196
          1AED73AE7E73946E731E50E00BB16C0E68B6C76715C76DA9EEA2DEDFDEACA7FD
          B4444FFEA6EACADB19D95E4CA68EC6721E0D72AE8D38B6B4DD69AED63FDF56B5
          7F2F651C58E4838D0A914D31B21925D708B8DCBD859531E1AFEBB58C58D9D31A
          45311A328A220D651ACBE971CA213114C266A862094EB28D6400000000000000
          0000000000000000000000000000000000000004C6F426378320000000005086
          D079E0633E506D3AFC2FBD421B41E7818CF941B4EBF02697CB95F9D95D3C7C8E
          BD2BF7A3B98504657E76574F1F23AF4AFDE8EE602590020000455B928AB71089
          7097BA4DFE23937F0AF3EBA5C513BDDAFEE937F88E4DFC2BCFAE97144EF78ADF
          F1B43E997BE2DBC3CA10028B1500000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000131CBF389CB340FED75B9DE6FB6F45D6E777B5B7B7B49D28
          B2B2A26BAEA9FAA23965B3729F05FDBCE72E257856CDB16B1B1B4E58B6BFD9C5
          CE888E9FFC69A6663EC894C44CF43D56171BCDEA78B6144D53F28996AC4BAEB2
          9FB9CFB41BFF0012DB38671C2309B3AB96AB3BA515DEED23EA999E25313F66AD
          CB94BDCFCD8D60D3457986F38BE60B48EEA2DEF3EF36733F5536514CE9F6CCAA
          C58573AD915D742F16BCEBAA88A63FDA72570C53C6988A235D791ECF2BEC5F6A
          F9CEAA632DE40C6AF7457A716D26EB559D9CFF00BEBD29FE56AF947625B28C93
          14CE5AC83835CAD688D22DA9BAD336B3F6D731333F9CBDAD9DDAC2CA9E259595
          3453D14C690FB8BBF5CB26BA70731B6F56DE14C7EB3E8AD8CA7C0076D18EC516
          D8EDE309C0AC6AD358B5B59B6B5A7FDB4727FEA6E8CA5EE73E46B8F12DB37E6F
          C4F14AE34E3595DE9A6C2CA7A7A6AFE5D85145311A44278B1D0AD1634474325B
          A68661375D7367C69FF69CFF0066A6CA3C16F619937DEED30CC8370B5B7B39FE
          9B7BDC4DBDA47FBAAD5B3AE38461586D97BCE1D87DDEED671FE5B1B2A688FE21
          F54E9D06B11BA1F71111B191585CEEF768E2D8D114C7CA2211EF74C6ED53C5A7
          A0999425E94FF4C7CC6B1F342003590000000000000000000000000000000000
          000000000000000000000000000000004C6F426378320000000005086D079E06
          33E506D3AFC2FBD421B41E7818CF941B4EBF02697CB95F9D95D3C7C8EBD2BF7A
          3B98504657E76574F1F23AF4AFDE8EE602590020000455B928AB710897097BA4
          DFE23937F0AF3EBA5C513BDDAFEE937F88E4DFC2BCFAE97144EF78ADFF001B43
          E997BE2DBC3CA10028B150000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000001
          951455695453453355533A45311CB23EA2999D8C47AECB3B26DA4670B48B3CB7
          92318BF4D53A6B6775AF8BFACC68DC794B8066DB7315545A62F65866056354EF
          BD5E38F569F768D661F54D1555B2172BAE0D7FBECFF42CAA9F0D5F5D8E6F2239
          7E777CE54F738F2ADD789699CB3C5FAFD56FAECAE5654D8D3F645756B3FC373E
          51E099B06CA3C4AEE990EE97DB6A397DFB10AAABC4CFDB4D53C5FE1562EF54ED
          64B74D02C4EDB5DACD3447CE739DCAB5C1329E66CC778A6EB8065FC4710B6AB9
          29B3BB5DABB4AA7F2886DCCA5C0C76FB9AF896B393BFB26C2BFF005713B7A6C3
          8BF6D13AD7FF00A568B85E0B8460D778B9E11855D2E5614EEB3BBD8D3674C7E5
          4C443EC8A298F99522EF4C6D964D74E0F2E967AEF36B35776A8FD65C2994FDCD
          CBF57345AE77DA358D94477761865D66D267ECB5B4E2E9E6373653E039B01CB5
          34577DCBD7BC7ADA8D34B4C4EF75551AFD7459F1289FCE99743691D071637AAD
          3674D3D0C92EBA2F855D3F058C4CFCF5F9BF072D644C9593EEF175CAB94F08C2
          2CE234E2DCAE76763AFDBC588D7F37EE459D14EEA594CC41C687DE4BED167459
          C71688888F92268A677C114534EE82651ACF48FB65AC41C68620266651AC8000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000098DE84C6F064000000000A10DA0F3C0C67CA0DA75F85F7A843683C
          F0319F28369D7E04D2F972BF3B2BA78F91D7A57EF47730A08CAFCECAE9E3E475
          E95FBD1DCC04B200400008AB725156E2112E12F749BFC4726FE15E7D74B8A277
          BB5FDD26FF0011C9BF8579F5D2E289DEF15BFE3687D32F7C5B787942005162A0
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000098899DD1ABF4706CBB8FE62BC7C1700C0AF
          F895B6B11EF774BBD76D57E94C49AFA1528B2AAD272A23397E68DD795381F6DF
          335459DA59E4B9C32C2D3962DB12B6A6C6223EEC6B547E70DCD94FDCE2C62DE2
          8B5CE99F2C2EF4CF756387D84D5547D95D7C9FC2A53655D5D0BDDD346715BE65
          C9D8CE5F3D5E6E2F7F7BA5CAF57EB58BBDCAED6B78B69DD67636735D53F9446A
          B30CA9C0576179722CED310C26F78DDBD1BEBBF5BCCD357DB453A53FC37365AD
          9AE42CA5634D865DCA1855C28A74D3DE6EB4C4C69F5E9AAAC5DE7A65935D383D
          BDDA65378B48A7BB5CAAB32A7070DB5672AACE706C8189C5957FEB5E2CFDE688
          FB78DA4FF0DCF94FDCF0DA4629C4B4CD598F0BC1E8DF55165355BD7FAC690B12
          8A288E48A6234FA93C58E8548B0A636B25BA680E1B61AEDA66B9F9CE51BBD5CA
          994FDCF7D93E0FC4B5CCB8B62B8DDAD3A4CD335C58D1AFD94EF86E7CA5B01D8F
          E4C8A6301C838459574FFA9696116B5EBD3AD7AF2B62691D0691D0A914534EC8
          64975C130FB9E5C8D8D31E1AFEB2FE76375BB5DE8A6CAC2C28B3A298D29A68A6
          22223EA886714511BA984CCE88E37D4FA5D222223284F163A0D223E644CEA812
          CA66211C6FA9002667546B3D2000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000002637A131BC1900
          00000002843683CF0319F28369D7E17DEA10DA0F3C0C67CA0DA75F8134BE5CAF
          CECAE9E3E475E95FBD1DCC28232BF3B2BA78F91D7A57EF4773012C801000022A
          DC9455B8844B84BDD26FF11C9BF8579F5D2E289DEED7F749BFC4726FE15E7D74
          B8A277BC56FF008DA1F4CBDF16DE1E50801458A8000000000000000000000000
          0000000000000000000000000000000000000000000000000000000098D60FEB
          6177B7BC55145859556954EEA69A6665EF72AEC036C99D7895E5FD9F62F6F655
          F736F6961363653FEFAF4A7F94C5333B1E9B1B9DBDE672B1A26AEE8996BD1D53
          947DCF5DAC631EF76D9A71CC1703B19EEA8F7CAAF36D4FE5447167CF6E9CA5EE
          766CB70BE25AE6BCCB8DE396B1DD5167345D6C6AFB6988AABFD2B558B0AE5905
          D343717BD653C9F163FDA72DDB772BBA2359D377E6F4B95B66BB40CED5C5194F
          256358B4553A7BE5D2E5695D9C7DB5C47163F395A9652E0E5B12C933675E5FD9
          B60945B59F736F79BBFC26DA263E78B4B6E35513F64B6559585958D14D9D9595
          14514C444534C69110A9176EB964D74E0EAADB7AB6F0A63F59564652E023B78C
          C5C4B4C5AE185E5EB1AB4999BFDF22BB488FAA8B28AF97EA9986E8CABEE6FE5D
          BBF12DB3AED02FD7DAB9266C70EBB5377A3EC9AABE3CCC7D910ED2D23A0D23A1
          522C688E864D75D0AC26EDAEAA26B9FF0069FD2328694CA7C10360394A6CED2E
          D912ED7FB6A34FFC5C4AAAAF5333D3A57334C4FD910DB58565FC1305BBD376C2
          709B9DCECACF929A6C2C69A223EC8887E8E91D09548888D50C8AEF71BB5D232B
          0B38A7BA2211A47441A474133A238DF525EB4E91AEBA258CCEA806533A238DF5
          2004CCEA80000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000131BD098DE0C800000
          0001421B41E7818CF941B4EBF0BEF5086D079E0633E506D3AFC09A5F2E57E765
          74F1F23AF4AFDE8EE6141195F9D95D3C7C8EBD2BF7A3B9809640080001156E4A
          2ADC4225C25EE937F88E4DFC2BCFAE97144EF76BFBA4DFE23937F0AF3EBA5C51
          3BDE2B7FC6D0FA65EF8B6F0F28400A2C54000000000000000000000000000000
          00000000000000000000000000000000004E93D008004C4660F4597B6779EB36
          574D196F29629884D7DCCD8DD6B9A67FDDA69FCB70E55E03DB75CC93676B7DC1
          6EB8258D5CB5557EB78E3C7FB29D7D6FA8A2AAB642E376C26FB7CF616554F839
          F12EEACA5EE7161F6714DAE74CF96B6D31CB55961F778A699FAB8D572B73E54E
          06BB05CAB345A4651FED3B6A3498B4C42D6AB59D7A74E48558B0AA76B23BA681
          E2978D7699511F39D7B957B86E038CE356B4D8E1384DEAF95D73A4536163557C
          BF94368E54E097B77CDD34D775C8D7AB8D8D7CBEFB7FAA2C29D3A638DBD69981
          E53CB7976CA9B1C0B01C3EE14531A6977BB5167EA8E57EBC534F43EE2ED4ED99
          64F74E0F2EF465379B59ABE51197AB80F28FB9CB99EF7145B672CF171B8D13CB
          559DCAC2AB6AE3EA99AB8B1FA4B74E53E019B0FC0228B5C62EF8963D6D4E9AFC
          2EF13459CFFB68D263F574A691D0690AB4D9514EC864B75D14C26E9AE9B2899E
          B9D7E6F1F95B653B39C99144659C938361F551DCDAD95D28F7CFCEB98E34FEAF
          5F1451A69C58FD13A41AC74AA2FB656367631C5B3A6223E519114D31BA20D20D
          63A51C6FA8554A58F1900CA674471BEA40099A90000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000002637A131BC190000000002843683CF0319F2836
          9D7E17DEA10DA0F3C0C67CA0DA75F8134BE5CAFCECAE9E3E475E95FBD1DCC282
          32BF3B2BA78F91D7A57EF4773012C801000022ADC9455B8844B84BDD26FF0011
          C9BF8579F5D2E289DEED7F749BFC4726FE15E7D74B8A277BC56FF8DA1F4CBDF1
          6DE1E50801458A80000000000000000000000000000000000000000000000000
          001BF702407D387DC2FD89DE69B9E1B72B6BDDBDA72516563653695D5F64472C
          8FAA289AE72A63397CC36DE54E0A7B7ECE1345A5C366F885CEC2BFF5B128A6E7
          111D3C5B598AE63ECA65B9F29FB9C99D6FBC4B4CE79E70BC3689D26AB2B858D7
          79AF4E8E355C4889FCA5F74D9D75742F375D1CC52F9ECAC6ACBAE6328DF938FB
          49E84D145569545145135D554E94C472CCCF468B29CA5C00F62380F12D31CFED
          7CC16D4F2CFC2EF536746BF76CA29E4FAA756E4CA9B1ED9964A88A32BE48C1F0
          F988D3DF2CAE744573F6D5A6B3F9AAD377AA76B25BA707B7DB4D778B4A69FACC
          EE556E57D84ED8339CD119776798CDE28AF75ADA5DE6C6CE7ECAED38B13FAB72
          E54F73EF6BD8D712D33162984E0963569331355578B5A7EDA69D23FF0052C82C
          ACACECA9E259D114C47CD11A433548B0A636B26BA68061F65AEDEAAAB9FA47FF
          0078B91329FB9D9B39C3F896B9B733E2B8BD71A71ACECF4B0B39FB38BFD5FCB7
          4654E0CFB13C9BC4B4C1B20E1D36D469A5BDE2CFDFAD3CEAB56D34AAD34534EC
          864B75C070EB9FB1B1A63C339DEF96E386DC30EB2F79B95CEC2EF446EA6CACE2
          88FD21F4E91D10946B0FA5DA22223283484A358E944D5D02592358E9471A500C
          B58E9471900278D2800000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000131BD098DE0C8000000001421B41E7818CF941B4EBF0BEF508
          6D079E0633E506D3AFC09A5F2E57E76574F1F23AF4AFDE8EE6141195F9D95D3C
          7C8EBD2BF7A3B9809640080001156E4A2ADC4225C25EE937F88E4DFC2BCFAE97
          144EF76BFBA4DFE23937F0AF3EBA5C513BDE2B7FC6D0FA65EF8B6F0F28400A2C
          5400000000000000000000000000000000000004E93D008037890656767696B5
          C59D959D55D756EA698D665ED32AEC636A99CE69A72E644C5EF94D53DDD376AA
          9A63EB999D39131133B15EC6ED6D789CACA99AA7E519BC48E9ACA9C0076D18E7
          12D71CB4C2F02B1AB967DFEDFDF6BD3EED1AE93F6B73E51F73A323DCB895E70C
          E38A6255472D56774B3A6EF4FD9C69E34CC7E50A94D8D75742FF0075D0FC5EF5
          B2CB8B1FED947EEAFF007EDE5FC959BF34DE3E0996F2CE25895B4EEA2EB74AED
          6AFE2169B94F82C6C2B27716AC3767F70BCDAD3FEADFA26F354CF4E95CCD3FA4
          36861F8661F85D85376C36E36175B0A3B9B2B1B38A288FB22391522EF3D32C9A
          E9C1D5ACEBBD5B447CA233F3CBC958394B8136DFF34F12BB7CB36182D857CB16
          B89DE69B298FB6CE9E3571E6B73652F737E2668B5CEFB4599FFAEC30BBA7AAD2
          D27FF83B8E27EA4E91D0AB16144326BA683E1577D75D335CFCE7F48C9A1329F0
          26E0FD95FDEEBB5CA96B8DDB59E931698A5E6AB589FB6CE9E2D9CFE74B70E5FC
          A195B2ADDA2E79632E61B845847FA771BAD1614FE944443F692A91114EC64776
          C3AE9738CAC2CE9A7BA218C69BB44A44BDA84A358E944D5D00C908E34A35D419
          6B1D289ABA100278D28000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000131BD098DE0C8000000001421B41E7818CF9
          41B4EBF0BEF5086D079E0633E506D3AFC09A5F2E57E76574F1F23AF4AFDE8EE6
          141195F9D95D3C7C8EBD2BF7A3B9809640080001156E4A2ADC4225C25EE937F8
          8E4DFC2BCFAE97144EF76BFBA4DFE23937F0AF3EBA5C513BDE2B7FC6D0FA65EF
          8B6F0F28400A2C540000000000000000000000000489C902749E83E7D032CD03
          F5B02CA79A3345B45865BCBB896275CCE9A5D2EB5DAE93F5F162746DFCA5C0C3
          6FD9AF89695654B3C26C2BE5F7CC4ADE9B3E4E9E2D3C6ABF29887D451555B21E
          EBB6197CBE6AB0B2AAAEE8968BD24D1DB7953DCE0BD55345AE75CFFC489E5AAC
          70EBBF2C7D5C7AF589FD1BA729F022D83E5B8A2D2F7976DF19B6A74E3577FB7A
          ABA6AFB68EE7F8548B0AE5925D341715BC6BB488A23E73FA466AC3B8E1D88627
          6F176C3AE378BDDACEEB3B0B2AAD2AFD22265B2F297063DB8672E25785641C42
          CAC6BD34B6BDD316147E7C6E5FE169D816CFB25657B2A2EF97F2BE1B70A28EE6
          2C2ED4D331F9E9ABD05144531A44722AC5DE3A65935D383CB2A75DE6DA67E511
          96F957C654F73AF3F621C5B6CDD9A70DC2E998FEAB2BBD355B5A47D93C90DD19
          4FDCFCD8F609145AE60BE62B8E5AD3F35A5A4595133F5D34EF8FCDD462A45953
          1D0C9AE9A2584DD32E2D971A7AE75FECD7D96361DB27C9F4D3465EC8584DDA69
          DD5CDDE2D2BFB75AB597BAB0B0B3B0A69B3B2A229A29E4A6988D2221FDC54CA3
          A17EB2BBD9584716CA9888F944000AC08D611357403246BA23594032D6113574
          2004F1A51AEA0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000693D0988E9042622754C4689000000000
          01421B41E7818CF941B4EBF0BEF5086D079E0633E506D3AFC09A5F2E57E76574
          F1F23AF4AFDE8EE6141195F9D95D3C7C8EBD2BF7A3B9809640080001156E4A2A
          DC4225C25EE937F88E4DFC2BCFAE97144EF76BFBA4DFE23937F0AF3EBA5C513B
          DE2B7FC6D0FA65EF8B6F0F28400A2C54000000000000131133BA0D275D349040
          9E2CF43FA5DEEB79BDD716775BBDA5B5733A453453354EBF9276BEA9A66A9CA2
          1FCA39771B9B2F297071DB6E759B3AB02D9CE2F559DA69C5B6BCD97C1ECA7FDF
          69C5A67F56E8CA9EE75ED3F14E25B66ACC9836096557754594D57AB6A7F28D28
          FF00D4FB8B3AA7A177BA68FE257DD7636354C75E5947D65C986E58D651F73D36
          4B83C59DAE67C631BC7ADA9EEE89B4A6EB6357FB688E3C79EDD394B83FEC6B24
          712BCB7B38C12EF6D47736F69768B7B68FFF0065A71ABFE5522EF574B26BA707
          D7FB5D76F553447D6776ADEAA8CA7B27DA6678AA8EC4F21E398A59D7BAD6C2E5
          69363F9DA4C7123F396E9CA7C01F6EB8F712D71BB3C272ED8D5DD45EEF516B6B
          11F553631547EB542CAA8B0A28888A288888DD10FED1C9110A9177A7A592DD38
          3EB8596BBC575573E111FAF9B8D32A7B9C394EE71676D9D33D62989571A4D565
          71B1A2ED6733D1AD5C7AA63EC986E9CA7C13360B93E2CED2E1B3DB8DEEDE8D27
          DFB10D6F55EBD3FF008933113F668DC62A4514D31944326BAE8F61973CB92B1A
          7BE6339DF9BF3B0FC0F0AC2ACA9B0C370CBBDD6CE88D29A2C6CA28888FB221F7
          453A472331F6BBD345344654C64003E811AC74A26AE806431E34CA2759F9C196
          B1D289ABA100278D3289E5F9C000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000349004C427488063A
          4F42621923588DF2679091135531CB32F8B11C670CC2ECA6DAFD7DB2B1A63FEA
          AB967F252B6B7B3BBD13696B545311D3339426226763EDD63A4E353BB56BCC67
          6AD75B29AACB06B9D56F57CD696BFD34FE9BE7F87F7D9EE61C5F1FBF5F6D312B
          CC574D1447128A69D29A797E662963A6F84DEB11A30CBAD7C7AEACF5C47DD8CB
          E7E8AB3615C53C69D8F7A212CC1440000005086D079E0633E506D3AFC2FBD421
          B41E7818CF941B4EBF02697CB95F9D95D3C7C8EBD2BF7A3B98504657E76574F1
          F23AF4AFDE8EE602590020000455B928AB710897097BA4DFE23937F0AF3EBA5C
          513BDDAFEE937F88E4DFC2BCFAE97144EF78ADFF001B43E997BE2DBC3CA10028
          B1604E92064813C59E87A7CB9B30DA1E6EB4A6CB2E64CC5EFF0035F73559DDAA
          8A67FDD3111FCA6226762AD9585ADB4E5674CCF7466F2E98899745E53E027B72
          CC7C4B5C4AE371C0EC6ADF37BB789AE9FF00653ED6E8CA9EE7160961345B672C
          F17ABDD51A71EC6E56316744FF00BAAE57DC59573D0BFDD344B16BDE534D94C4
          75CEA706693BF47E8E1396B30E3D6D45860B825FAFD5D73A5316161557AFE90B
          4ACA5C10761194A28AEC325595FEDACF969B5BFDA4DB55AFE7C9FC36A61396B0
          2C0AC7E0F82E0B72B859FF00D376B0A6CE3FF4C42AC5DE7A6592DD383BB799CE
          F36B11DD19F9AAEB29F03DDBE66C9A2BB1C9B6B8758D7A4FBE621694D8691D3A
          55CB2DD394FDCE0C6EDB896F9CF3EDDAED13A4D56370B09B4AA3EAE355C58FD3
          5777D3469F3328548B0A23A1935D34170BBBEBB489AE7E73FA464E74CA5C04F6
          19977896989E177FC72DA9D2666FB7998A667EAA68E2F27D5ACB71E5AD99E41C
          9D674D196727E1186CD31A71EEF74A29AFF3AB4D67F397A915622236324BB615
          72B9FB0B2A69F0FD5FCACECA28DD0FE91C90912F764002411AC1C6048C38D3F6
          1AC832D63A49AA18E801C69926667E7003400000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000D26
          53A4820D27A19690906311D29DC4CC46F471E98DF2663246B0F8B11C630DC32C
          A6D6FD7DB2B1888D74AAAE59FC9E2B18DAADD6CB5B2C22EB55B55FFDCB4E4A7F
          458716D25C3304A78D7CB5889EADB3F48D6FBA2CEAAF64360556D674471ABAE2
          988DF33C8F358CE7DC030A9AA8F84C5E2D23FC965FD5FACEE6ACC5B34E398CD5
          3F0CBF57C49FF4E89E2D31FA3F2746AAC6B85AAEBCECF0AB2CBFDAAFD23D5EBA
          2E996BAA5EC717DA66357ED6CF0FA69B9D94FCF1FD55FF00D9E4EF179BC5F2D2
          6DAF56F696B5CFF9ABAA665FCC6ABC4F1DC4718AF8D7DB69ABE59EAFA46A7AA9
          B3A68FC303616C8FE537EFB94FADAF5B0B647F29BF7DCA7D6BF707BF115DFBE7
          CA5F178F652D9B09446E4BAA616A0000001421B41E7818CF941B4EBF0BEF5086
          D079E0633E506D3AFC09A5F2E57E76574F1F23AF4AFDE8EE6141195F9D95D3C7
          C8EBD2BF7A3B980964008000115251546B1A0384BDD268D311C9BF8579F5C38A
          3966792169DC22B83247080C5303BC5EF3557845D708A2D29B4A2CEEB16B696B
          C698DD3354453BBA25F8594B804EC372FD545AE2D71C4B1FB6A3978D7FBDCC53
          33F72CE29A67EC98979ED2CA6BAF386ACC7744F10C5B14B4B7B3888A272D733F
          28E85685958DADBDA536361655DA5A573A534514CD55553F5446F6C1CA9C1F36
          CD9CEAA3FB0F6778C57675EEB5BC58FC1E8D3A75B4E2EB1F62D572C6CA767793
          6CE9B2CB192B07C36298D35BBDD28A667EB9988D665E9E2EF453C945114C46ED
          08BBC46D956BA7075446BBCDB4CFCA98FD655D594BDCF3DAB631C4B5CCD8DE11
          82D94F2CD345555E2D23EA988E2C44FE72DCF94FDCEFD99617345AE68C6F16C6
          6B8E5AA88B48B0B39FB38BFD5FCBACA8A78B1A3254A6CA9A7A1935D743F08BB6
          BE4B8D3FED39B5AE53E0EDB1CC99145781E40C2A8B6A375B5AD8C5ADA4FDB555
          AEAF7F77C3AE973B28B1BA5D2C6C688FF2D9D114C47E50FAC548D5B19058DD6C
          2EF19595114C7CA22185144531A33015C00011331071A012309AA750196B0719
          8E91BC0359000D20000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000D35004E929D2011A491
          1D2C9133A01A68963C7A5F26218C6198658FBF6217DB2B0A3A6BAB4D7EC8F9D4
          AD6DECEC289B4B5AA2223A675426226753ECD618D56B4511335551111BE65AFF
          0018DAADD2CA2AB2C1AE955BD5BA2D2D7FA69FCA37CFF0F118B66AC771AAA7E1
          B7EAFDEE7FD3A3FA69FD237FE6D7B8CF09984E1B9D9DDA66DABFF5D9F5F4CDE8
          A2ED5D5B75369E339F700C266AA3E15179B58FF4EC7FABF59DCF0F8C6D3719BF
          4556570A29B9D9CFCF1CB5FEAF1B3333296A7C67846C6715CE8B3AB92A27A29D
          BE33B5EBA2ED451B75BFA5E2F579BDD736B7AB7AED6B9DF55754CCBF92460969
          695DAD535DA4CCCCF4CEB95688CB6003E120003616C8FE537EFB94FADAF5B0B6
          47F29BF7DCA7D6CD383DF88AEFDF3E52A378F652D9B1B9288DC9754C2D400000
          02843683CF0319F28369D7E17DEA10DA0F3C0C67CA0DA75F8134BE5CAFCECAE9
          E3E475E95FBD1DCC28232BF3B2BA78F91D7A57EF4773012C8010000000000000
          08998838D009184D53F341ACF4832998838D0C748009AA7535900348DE000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000001A6A9D24109D253A42418C474A74D099D11C
          78F9CCC648D621F1DFF17C370DB29B5BF5EECEC698FF00AAA78AC636AB74B2E3
          5960F75AADEADD16969FD34FE9BE562C5F4930CC129E35F2D6299EADB33E1B5F
          7459D55CEA87BFAAD68A235AAAD23A65E7319CF997F0999A26F7EFF6B1FE9D94
          71A7F39DD0D598B66BC7B19998BDDFAA8B3FFEDD9FF4D3FF0077E3CFD4D538CF
          0B75D59D9E176597FB55E91FACBD745D3A6A97B3C6369D8D5F78D6586D145CAC
          A7938D1FD55FEB3C90F2379BCDE6F96936D7BB7B4B6B49DF55A55354FF002FE6
          3566298F6238CD5C6BEDACD5F2CF57D2353D5459D3447DD8005A1F6000000000
          0003616C8FE537EFB94FADAF5B0B647F29BF7DCA7D6CD383DF88AEFDF3E52A37
          8F652D9B1B9288DC9754C2D40000002843683CF0319F28369D7E17DEA10DA0F3
          C0C67CA0DA75F8134BE5CAFCECAE9E3E475E95FBD1DCC28232BF3B2BA78F91D7
          A57EF4773012C801000000031E37D49AB7318DC099AA7E646B20069A80000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000001CBD0009E2CA62011A4C914F4B244CE806
          91096335C44E9A3E4BFE31876196536D7FBDD9D85311FE6AB97F28DF2A56B6F6
          76344D7695444474CEA4E532FB3586355AD14471AB98888DF32F038C6D52E563
          C6B3C1EED55BCFCD695FF4D3F946F9787C5F3663D8CCCFC2AFD5459CFF00A747
          F4D2D7B8CF09984E1933677799B6AFAA9D9FFF005B3E99BD145DABAF6EA6D3C6
          B3E60184EB47C2A2DED63FC965CBFCBC3631B4EC62FBC6B2C3A8A6E9673F3C72
          D7FABC6E93BE6794D1AA319E11B18C573A2CAAE4A8EAA76FD76BD545DA8A3E6F
          ED78BDDEAF96936B7ABC5A5AD73CBAD756AFE291815A5A576B54D75CE733D32A
          F96400F948000000000000000000D85B23F94DFBEE53EB6BD6C2D91FCA6FDF72
          9F5B34E0F7E22BBF7CF94A8DE3D94B66C6E4A23725D530B50000000A10DA0F3C
          0C67CA0DA75F85F7A843683CF0319F28369D7E04D2F972BF3B2BA78F91D7A57E
          F47730A08CAFCECAE9E3E475E95FBD1DCC04B200400000031AB7223726ADC88D
          C000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000072FCD09E2C8208899F9B46511A2
          418C52C9133A46A8E3C7422662368C91ABE4BF62F8761B6536D7EBDD958D11F3
          D75443C5635B56B8D96B67835D6ABC55F35A5A6B4D1FA6F959316D23C3305A78
          D7CB68A67AB6CFD235BEE8B3AABD90F7D55A534C4CCF268F3D8DE7BCBF844556
          75DEE2DEDE9FF4AC7FAA75FAE7747E6D558BE6DC7F1A9AA9BDDFEBA6CA7FD2B3
          FE9A3F8DFF009BF1E22623486A9C6785BAAA89B3C2ACBFF6AFF4A7D5EBA2E91F
          9E5ECB17DA6E337DE359E1D6745CECE7938D1FD55CC7DBBBF8792BCDEAF57CB5
          9B6BDDE2D2DAD27FCD5D5332FE496ACC531EC4718AF8D7DB59ABE5D1E11B1EAA
          2CE9A3F0C23ED482CDB1F600900000000000000000000000006C2D91FCA6FDF7
          29F5B5EB616C8FE537EFB94FAD9A707BF115DFBE7CA546F1ECA5B36372511B92
          EA985A80000005086D079E0633E506D3AFC2FBD421B41E7818CF941B4EBF0269
          7CB95F9D95D3C7C8EBD2BF7A3B98504657E76574F1F23AF4AFDE8EE602590020
          0000018D5B911B9356E446E00000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000D2677400278BD
          2988D018C44CFCDA278B2C913C8091871FEA7CB7EC5EE186D9CDADFAF565634C
          46BFD5569FC28DADBD958D135DA5514C474CEA84C44CEC7D9AB1AAD69A235AA6
          2223E799783C636A971B2E35961376AADEA8E4F7CAFF00A69FFBBC3E2D9BB1DC
          66662F57DAA8B39FF4ECFF00A69FE1AFF19E12F08C333A2C266D6BEAA767D7D3
          357A2ED5D7B7536A6339EF2FE11136769798B6B58DD6765FD53FF6785C6769B8
          B5F38D658659D374B39FF34FF557EC78CE5DFAEF47CED518C70918CE29334D95
          5C951D54EDFAEDF27AE8BB514EBDAFED7ABE5EEFD6B36D7CBC5A5B573FE6AEA9
          997F2FAE4180DA5A576B571ED2739EB9DAAF96400F9480000000000000000000
          00000000000000D85B23F94DFBEE53EB6BD6C2D91FCA6FDF729F5B34E0F7E22B
          BF7CF94A8DE3D94B66C6E4A23725D530B50000000A10DA0F3C0C67CA0DA75F85
          F7A843683CF0319F28369D7E04D2F972BF3B2BA78F91D7A57EF47730A08CAFCE
          CAE9E3E475E95FBD1DCC04B200400000031AB7223726ADC88DC0000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000006933B9314CFCE08222AF9F46511A2418F17EB6430E3CF4233C8668D7
          487C97EC56E386D8CDBDFEF56561671FE6B4AA23FF00FAF178CED5AE36315596
          1174AEF35C7245A5A7F4D1F6C46F9FE164C5B48F0CC168E35F2DA299EACF39FA
          46B7DD367557B21EF26D6298D6AD223EB7E06319EF00C238D4577A8B7B58FF00
          4EC7FAA75FAE7735562D9BB1FC6A669BDDFAAA6CA7FD2B3FE9A7F8DFF9BF1B4E
          5D665AA719E16EA9CECF0AB2FF00DAAFD298FD67C1EBA2E9FDF2F698C6D3F17B
          DCCD9E19654DD2CE7FCDDD57FABC95EAF97ABEDA4DADEEF1696D5CCEB335D5AB
          F825AB314C7F12C62AE35F2DA6AF9679447746C7AA9B3A68FC3000B3BEC00000
          00000000000000000000000000000000000006C2D91FCA6FDF729F5B5EB616C8
          FE537EFB94FAD9A707BF115DFBE7CA546F1ECA5B36372511B92EA985A8000000
          5086D079E0633E506D3AFC2FBD421B41E7818CF941B4EBF02697CB95F9D95D3C
          7C8EBD2BF7A3B98504657E76574F1F23AF4AFDE8EE6025900200000018D5B911
          B9356E446E000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000239594469F3831D2AF9B44F17A59000C26BD274
          87CD7EC56E386D136B7DBD5958D311ACCD5568A56B6F67634CD7695444474CCE
          498899D8FAE58556914C6B331111D2F098CED5AE161C6B1C2AED55E6A8E4F7CA
          BFA68F6CBC362D9C31EC66669BCDF6AA2CA7FD2B2FE9A7F8E596BFC6B84AC1F0
          CCE8BBD5CAD71D14ECF1AB67D3357A2ED5D5B7536AE339EB00C1E268B5BD45B5
          B47FA565FD557B23F3785C676A38BDF38D6785D95173B39FF3CFF557FCF247F2
          F17A6BBCD1A9F19E12719C573A2C6AE468EAA76F8D5B7E993D745DA8A7E6FED7
          ABDDEEFD6D378BEDE6D6DED2ADF55A55354FF2FE3A24605696B5DAD535DA4CCC
          CF5ABC465AA001F0900000000000000000000000000000000000000000000000
          01B0B647F29BF7DCA7D6D7AD85B23F94DFBEE53EB669C1EFC4577EF9F2951BC7
          B296CD8DC9446E4BAA616A0000001421B41E7818CF941B4EBF0BEF5086D079E0
          633E506D3AFC09A5F2E57E76574F1F23AF4AFDE8EE6141195F9D95D3C7C8EBD2
          BF7A3B9809640080000006356E446E4D5B911B80000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000002235022356511A11
          1A1320944F23E6BE62374C3ECA6F17DBCD9D8D9C7CF5D510F178C6D56E1778AA
          CB09BBD579AB771EBFE9A3DB2B262DA458660B471AFB6D14CF574CF746D7DD36
          7557B21EEAAB48A759998888F9DF818CE7AC0B0789A2D2F54DB5AC6EB3B2FEA9
          FD77355E2D9BF1EC66662F37DAA8B39FF4ECFF00A69FFBBF1A796759DED538CF
          0B53AECF0BB2FF00DAAFD223F597AA8BA7F7BDA631B4FC56FBC6B3C36C69BA51
          3FE69E5ABFECF237BBEDEEFD6936D7CBCDA5B573F3D754CBF88D578A6906258C
          D5C6BEDACD5F2CF57D363D74D9D347E184689059F3CDF6000000000000000000
          0000000000000000000000000000000000000003616C8FE537EFB94FADAF5B0B
          647F29BF7DCA7D6CD383DF88AEFDF3E52A378F652D9B1B9288DC9754C2D40000
          002843683CF0319F28369D7E17DEA10DA0F3C0C67CA0DA75F8134BE5CAFCECAE
          9E3E475E95FBD1DCC28232BF3B2BA78F91D7A57EF4773012C8010000000C6ADC
          88DC9AB722370000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000CA218C72CE8CA67EB44CE431AABE2FCEF0F9AF68F77
          C32BB4B8613145BDE6358AAD27B8A27FE65FCF68D9B6D30FB2FEC7C3ED34BC5A
          D3ADAD713CB453D1F6CB56EF99999D665A734F34FAD30FB5AB0DC3272AE35555
          757CA3E7D6F658584551C6A9F5E238AE218B5B4DE310BDDA5B57F371AAE48FB2
          373E43F34B45DBDBDA5E2B9B5B5AA6AAA76CCCE732F7E5111940029000000000
          00000000000000000000000000000000000000000000000000000003616C8FE5
          37EFB94FADAF5B0B647F29BF7DCA7D6CD383DF88AEFDF3E52A378F652D9B1B92
          88DC9754C2D40000002843683CF0319F28369D7E17DEA10DA0F3C0C67CA0DA75
          F8134BE5CAFCECAE9E3E475E95FBD1DCC28232BF3B2BA78F91D7A57EF4773012
          C8010000000C6ADC88DC9AB72237000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000002698E5D5FC6F978A2ED76B5BC573
          1116744D53F943FB53BB579CCFD7B9B9E5ABE554CE93694C59FEB3A2DF8ADEFE
          C172B5BCFF0065333F487D5119D510D3B8ADFED313C46DEFD6B3ACDB573547D5
          1F347E8F991F5A5C6F6F6D5DE2D2AB5B49CEAAA6667C57888CA3280052480000
          00000000000000000000000000000000000000000000000000000000000000D8
          5B23F94DFBEE53EB6BD6C2D91FCA6FDF729F5B34E0F7E22BBF7CF94A8DE3D94B
          66C6E4A23725D530B50000000A10DA0F3C0C67CA0DA75F85F7A843683CF0319F
          28369D7E04D2F972BF3B2BA78F91D7A57EF47730A08CAFCECAE9E3E475E95FBD
          1DCC04B200400000031AB7223726ADC88DC00000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000CA9EE61E2F6A7693465FA
          688DD5DB53AFE5CAF674BC4ED5A26702B1D3FF00BD1AFE8C5F4D6669C02F531F
          D92AB63ED21A9C07252EC0000000000000000000000000000000000000000000
          000000000000000000000000003616C8FE537EFB94FADAF5B0B647F29BF7DCA7
          D6CD383DF88AEFDF3E52A378F652D9B1B9288DC9754C2D40000002843683CF03
          19F28369D7E17DEA10DA0F3C0C67CA0DA75F8134BE5CAFCECAE9E3E475E95FBD
          1DCC28232BF3B2BA78F91D7A57EF4773012C8010000000C6ADC88DC9AB722370
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000026978FDA8D9CD7972AAE23FF2ED689FD6747AFA67965E733F587C232C
          5F7935E25315FE92C7F4A6CB97C1AF3671D3455BA152CBF1C34A241C84BB8000
          0000000000000000000000000000000000000000000000000000000000000000
          00D85B23F94DFBEE53EB6BD6C2D91FCA6FDF729F5B34E0F7E22BBF7CF94A8DE3
          D94B66C6E4A23725D530B50000000A10DA0F3C0C67CA0DA75F85F7A843683CF0
          319F28369D7E04D2F972BF3B2BA78F91D7A57EF47730A08CAFCECAE9E3E475E9
          5FBD1DCC04B200400000031AB7223726ADC88DC0000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000004775F6BF3F305DBE1
          3835F6EFA6BC7B1AA3F87E84724EAC2F34C5A585A59E9DD5331FC3CD7CB18B7B
          BD7653D3131F584D3394E6E748DC97F6BED94D8DF2DEC6634E25AD54FE92FE2E
          2FB6A392B4AA89E89985E62738CC014D20000000000000000000000000000000
          000000000000000000000000000000000003616C8FE537EFB94FADAF5B0B647F
          29BF7DCA7D6CD383DF88AEFDF3E52A378F652D9B1B9288DC9754C2D400000028
          43683CF0319F28369D7E17DEA10DA0F3C0C67CA0DA75F8134BE5CAFCECAE9E3E
          475E95FBD1DCC28232BF3B2BA78F91D7A57EF4773012C8010000000C6ADC88DC
          9AB7223700000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000009AE39275F9D8CEE65FE544C66344E70BB7C17325FACA234
          89B59AA9FB2795F8EF5FB51BAFBCE618B788D22DEC6263F2E478F87206945D7E
          C58CDE6C7AAB9DF39AEF6539D109016254000000000000000000000000000000
          0000000000000000000000000000000000001B0B647F29BF7DCA7D6D7AD85B23
          F94DFBEE53EB669C1EFC4577EF9F2951BC7B296CD8DC9446E4BAA616A0000001
          421B41E7818CF941B4EBF0BEF5086D079E0633E506D3AFC09A5F2E57E76574F1
          F23AF4AFDE8EE6141195F9D95D3C7C8EBD2BF7A3B9809640080000006356E446
          E4D5B911B8000000000000000000000000000000000000000000000000000000
          00000000000000000000000000D600037A78B208000000000000000000000000
          0000000000000000000000000009E58654EE62CA9DDA74035BED72EBF21BE69C
          913559EBFCB5BC36F6D46EDF08CBD3694D3FD5616B4D5F97CED430E63E136EBF
          67C7EBAE3F3C455BB2FD173BB4E766901AF9E800000000000000000000000000
          00000000000000000000000000000000000000001B0B647F29BF7DCA7D6D7AD8
          5B23F94DFBEE53EB669C1EFC4577EF9F2951BC7B296CD8DC9446E4BAA616A000
          0001421B41E7818CF941B4EBF0BEF5086D079E0633E506D3AFC09A5F2E57E765
          74F1F23AF4AFDE8EE6141195F9D95D3C7C8EBD2BF7A3B9809640080000006356
          E446E4D5B911B800000000000000000000000000000000000000000000000000
          0000000000000000000000004C46A08D6065C58E848238B1F3C1A69B8D60D601
          220D63A412C6A8E5D53AC74A4180000000000000000000000000000000000000
          000000000002699E598414F740FC7CDD74F8665DBFD8446B3EF53547E5CBFF00
          0D130E89BED945BDDAD6C663FF00328AA9FD61CF97AB29B0BCDAD94C69345755
          3A7E6D0FC2FDD38B6F76BD65B6269FA4E7FABDD749D530FE4034D3DA00000000
          00000000000000000000000000000000000000000000000000000000003616C8
          FE537EFB94FADAF5B0B647F29BF7DCA7D6CD383DF88AEFDF3E52A378F652D9B1
          B9288DC9754C2D40000002843683CF0319F28369D7E17DEA10DA0F3C0C67CA0D
          A75F8134BE5CAFCECAE9E3E475E95FBD1DCC28232BF3B2BA78F91D7A57EF4773
          012C8010000000C6ADC88DC9AB72237000000000000000000000000000000000
          000000000000000000000000000000000002623538BF582197163E74A008888D
          C946B1D2C6D2D6CECE8AABAEBA69A6239666748844CC446726D65AC1354446BA
          C35FE6BDB2E51CB3C7B0A6F7F0FBD531A7BCDDE78DA4FD756E8699CD5B6CCDB9
          866BB0B95AFF00665D6AFF00258CFF005CC7D757B18B62DA6186613134D55F1E
          BFEDA75CFD764322C3345F11C4F2AA9A38B4F5D5AA3D65BF3346D1B2AE54A6AF
          ED5C4ECE2D62358B1B39E3DA4FE51FF2D4798B84662F79AEBB2CB58558DD6CF7
          536D79FEBAE7EBE2C6911FCB4FDA5ADADB5736B6F695DA5A553ACD554EB333F5
          CB16B3C574FB12BECCD3769E4A9F96B9F19F4C9B0F0DD08B85D222ABCFF52AF9
          EA8FA7ABD4623B50CFF89D5355BE68BED9F1BE6B0AFDE634FF00668F9EE3B41C
          EF87DBD378BBE6AC4E6699D74B4BCD7694CFDB4D53312FC018A558ADFAAAF949
          B6AB3EBE34FAB24A70BB8D147271634E5FF8C3AE36679C2739E58B0C52DA29A6
          F344CD8DE29A7771E3E78FB7925EBE37348F06CBD55561F8C5D27969B3B6B3AE
          23ED8AB5F5437753DCC3A1746EFD5E2385D8DE2D273AA635F7C6A68CC76E745C
          311B5BBD9FE189D5DD3AD8CF7413DD0BE2D20000000000000000000000000000
          0000000000000000011C950015EE9FADA2736DD7E0798AFF006311A47BECD54C
          7D52DF13B9A7769F75F78CC9EFDA6916F654D5FA727FC35670B175E5707A2DFA
          68AE37C4C7A3D574AB2AF27914A212E755C40000000000000000000000000000
          000000000000000000000000000000000000006C2D91FCA6FDF729F5B5EB616C
          8FE537EFB94FAD9A707BF115DFBE7CA546F1ECA5B36372511B92EA985A800000
          05086D079E0633E506D3AFC2FBD421B41E7818CF941B4EBF02697CB95F9D95D3
          C7C8EBD2BF7A3B98504657E76574F1F23AF4AFDE8EE6025900200000018D5B91
          1B9356E446E00000000000000000000000000000000000000000000000000000
          0000001311D208349E865C584831E2FD6988D1289988DE0944CC4238F4FF00D5
          0FCBC773260997AED37BC5F13B0BAD111C9C7AF49ABEC8DF2A76B6B458D335DA
          4C44474CBEA8A2AB4AB8B44673D50FD5E3474BE5BFE2172C3AC2ABD5F6F56561
          65446B55769544447EAD2F9B38445853C7BAE54C3E6D2AE588BCDBF253F6C53F
          3FE6D4598337662CCF6F36D8CE2B6D6FACF251C6D288FB298E460D8B69FE1F71
          CECEEDFD4AFE5F87EBD3E0CC30CD0ABF5F72AEF1FD3A7E7B7E9EADED9AB6FB97
          7098B4BB607635625788D638D13C5B389FB7E769BCD1B4ECDD9AEAAA8BEE255D
          8DDEAFF42C2668A7F3D3965E53725AC715D2CC4F16CE9AEBE2D1D54EA8FDDB13
          0CD17C3B0CCAAA28E355D756BDDB20E59D6677C80C6B6B22D8000023506F6E0D
          144FBC6396BF371EC69FE2A6F36A1E0E971AEEF95AF77DAA8D22F57BD23937C5
          31FF0076DD8DCE8AD0FB29B2C16C22AEACFEB332D0DA516B16D8BDBCC744E5F4
          888633DD00C996000000000000000000000000000000000000000000000009E4
          8113B819C72C35AED72EBA5771BDC53F35544CFF003FF2D951B9E336A376F7FC
          BDEFDA72D85B5356BF54EB1EC621A7775FB668FDE68E988E37D27356B09CAD21
          A8F780E515D40000000000000000000000000000000000000000000000000000
          000000000000006C2D91FCA6FDF729F5B5EB616C8FE537EFB94FAD9A707BF115
          DFBE7CA546F1ECA5B36372511B92EA985A80000005086D079E0633E506D3AFC2
          FBD421B41E7818CF941B4EBF02697CB95F9D95D3C7C8EBD2BF7A3B98504657E7
          6574F1F23AF4AFDE8EE6025900200000018D5B911B9356E446E0000000000000
          00000000000000000000000000000000000000004C4278B00C7494C427724111
          1A251AE84D511BE4128E3474B0AED6CE98E3556914C46F999D1E1736ED832865
          7AABB1AAFB17DBD53AC7BC5DA62B989E899DD1FABC97CBFDDAE1472979AE298F
          9BD176BA5BDF2BE4EEF44D53F27BC9AE888D66A8799CD5B42CAF94A899C5B14B
          18B588D62C289E35ACFF00B63963ED9E4683CD7B70CDB98B8F77C3EB8C2AEB56
          B1C5B09FFC4AA3EBAF7C7E5A35E5ADA5ADB5A556B6D5D5695D53ACD554EB333D
          3ACB5D62FC2358D9E7678751C69FEE9D51F4DACEF0BD02B7B5CABBFD7C58FED8
          D73F5D90DB99B3842E318845774CB1718C3EC6793E116BA576B31D311BA9FE5A
          B311C5712C5EF35DF314BF5BDEADEB9D66BB5AE6A9FAB7BE44B5A6258E5FF16A
          B8D7AB4998EAD91F486C1B860B72C329E2DDACE227AF6CFD64016A5D00000000
          010CECACABB7B5A2C6CE266BB4AA29A62237CCCB07B8D8DE5DEC873CDCFDF2CF
          8D77B86B7BB5E8FE9EE63CEE2BDB875CEAC42F56776A36D5311EAF1E217BA6E3
          75B4BCD5F96267D37BA4725E036796F2CE1D84514C45561634C5A69F3D73CB54
          FEB32FDE9963453A69A3299E574ED858D377B2A6CA8D94C4447839DAD6D2AB6B
          4AAD6B9CE6A9CE7C5002B3E00000000000000000000000000000000000000000
          00000001953B9F899CAE9F0BCB97FB2D35D2CA6BF3797FE1FB54BF8DF2C62F17
          5B6BBD5BAD28AA89FCE1E2C46EF17BBA5AD84FE6A663EB0FAA67298973B8CEF1
          673656F6965546934D53131F64B0718DA53345534CF46A5E76C6600F90000000
          0000000000000000000000000000000000000000000000000000000006C2D91F
          CA6FDF729F5B5EB616C8FE537EFB94FAD9A707BF115DFBE7CA546F1ECA5B3637
          2511B92EA985A80000005086D079E0633E506D3AFC2FBD421B41E7818CF941B4
          EBF02697CB95F9D95D3C7C8EBD2BF7A3B98504657E76574F1F23AF4AFDE8EE60
          25900200000018D5B911B9356E446E0000000000000000000000000000000000
          000000000013A482065C582234044474A7488480089988E59471A34D41333A1C
          6A7A5F9B8CE61C1701BBCDEB17C46C6ED6711FE7AA2267EC8F9DA8F35F086BAD
          871EEB95EE3F08AF745E2DB9298FAE23E75A313C76E184D39DEAD2227AB6CCF8
          2E570C22FB89D5C5BB59CCFCFA3EADCB7CBFDCEE56355BDEEF36763674C6B355
          754444359E6BDBDE5AC1F8F76C1A99C4EF34F244D1C96713F5D5F3FE4D0D98B3
          8E63CD16B36B8CE276B6D4CCF259C4F1688FB298E47E2C4359E2DC235BDB6746
          1D47163FBA75CFD3646F6C1C2F406CACF2AEFF005F1A7AA367D76CEE7AECD3B5
          3CE19AEAAECEF5885576BB57FF00D3DDE668A74E899DF2F23091AF2F77EBC5FE
          D395BCD73555F3967975B95DEE5472777A2298F9003CAF48000000000000000E
          86E0EF977E0597EF3982D6CF4B5C42D78967AC7FA54726BF9D5C6FD21CFD73BA
          5B5FAF96172BB51C6B5BC5A53654474D554E91EB76765AC1EC301C0EE3835DA2
          38973B1A6CB5E9988E59FCE7596C4E0EB0EE5EFD5DF26355119477CFED9B01D3
          EC4391BA5174A675D739CF747EEFD48E4863BD33C91A23737635280000000000
          00000000000000000000000000000000000000002699E59845713A14EF9653B9
          1319C64342E6BBAC5D331E216311A445BD55447D533AFF00CBF261EB769D75F7
          8CCF36DA725E2C68AFF4FE9FF879371EE925D7EC58BDE6C3AABABCF3F295DECA
          AE3511200B2AA000000000000000000000000000000000000000000000000000
          0000000000000D85B23F94DFBEE53EB6BD6C2D91FCA6FDF729F5B34E0F7E22BB
          F7CF94A8DE3D94B66C6E4A23725D530B50000000A10DA0F3C0C67CA0DA75F85F
          7A843683CF0319F28369D7E04D2F972BF3B2BA78F91D7A57EF47730A08CAFCEC
          AE9E3E475E95FBD1DCC04B200400000031AB7223726ADC88DC00000000000000
          0000000000000000000000009D253A4031D354C474A74D1208D2122012319AE2
          274944DA511BE519C19B29AA237A26BA63E7788CDDB5DC9995B8F636B8845F2F
          74727C1EEBA57544F4553BA9FCDA5F356DD336E3FC7BBE17551855D6AD634B19
          99B598FAEBF9BF2D18C62DA5D866139D35D7C6AFFB69D73E3D10C830CD18C471
          4CAAB3A38B47F755AA3C3A65BF333E7ECAD956CAAAB16C5ACA8B488D62C299E3
          5A4FFB63FE5A73357086C56F935DDB2BDCA9B9D9CF27BFDB44555CFD91BA1A86
          DADEDEF16955B5E2D6BB4B4AA759AABAA66667ED61F3B58E2FA7B885FF003A2E
          DFD2A7E5F8BEBE8D87866845C6E795779FEA55F3FC3F4F57D98A62F8A63579AA
          F78A5FADEF36B56FAAD2B997C70918457695DAD5355739CCF4CB32B3B3A2CA98
          A2CE3288E88007C3EC000000000000000000001B0F61997671BCED657DB5B3E3
          5861744DE2AE4E4E3EEA23F5999FF6BA8E88D29DCD57B00CBB385E539C5ED6CF
          4B6C52D26D235DFEF74F253FF33F9B6AC7243A0F42B0EFE1F84D1C68FBD5FDE9
          F1D9BB268CD2DBFF00DBF14B49A67EED1F763C36EF633AEA1AEBCA32D6340000
          0000000000000000000000000000000000000000000000098DE9963AE8CF7835
          96D76EBC5B6B85F2237D35D9CFE53131EB96BC6DADA95D7DFF002F5378D396C2
          F14D5AFD53AC7AE61A95CC3C25DD7ECDA41695C6CAE29AB765FA2E7769CECC01
          803D000000000000000000000000000000000000000000000000000000000000
          00003616C8FE537EFB94FADAF5B0B647F29BF7DCA7D6CD383DF88AEFDF3E52A3
          78F652D9B1B9288DC9754C2D40000002843683CF0319F28369D7E17DEA10DA0F
          3C0C67CA0DA75F8134BE5CAFCECAE9E3E475E95FBD1DCC28232BF3B2BA78F91D
          7A57EF4773012C8010000000C6ADC88DC9AB7223700000000000000000000000
          00000009D241069AB2D20D2201111D29D21200000899D11C7A5F9F8BE60C1B03
          BBD57AC5AFF6376B3A235D6D2A88FD3A5F169694595335573943EA9A6AAE78B4
          C672FD0E343F95E6FB75BAD9556D79B7A2CACE88D6AAAB988888FB5A6B35F087
          B8DDAAAEED956E537AAE3922DEDBFA6CFF0028DF2D3F9933B667CD76B35E338A
          DB5AD9CCEB16313C5B3A7ECA63FE58462FA7987DC33B3BBFF52AF96A8FAFA32E
          C3342F10BF655DB7F4E9F9EDFA7AB7CE6DDBD656C166BBBE0DC6C56F34EB11EF
          73A5944FD75FCFF96AD359AB6AF9CF35CD56379C466E974ABFFA7BAEB45331FF
          00F94EFABF39D3EA78EE54B58E2DA5F89E2D9D3557C4A27A29D5F5E996C4C2F4
          530EC332AA29E3D7D756BFA46C8469CA9062EC92350000000000000000000000
          000000FAB08C3ADB18C52EB855DE27DF2F76D4D8D3C9BB59D35FCB7BE56CFD80
          65D8C4F36D78C5B59EB6586D971A9998E4F7CAB923F8D573C1AE156257FB2BAC
          7E69D7DDB6772DD8BDFA30EB95A5E67F2C6AEFE8DEE89C1B0DB1C270DBAE1B77
          B3E2D95DACA9B2A23A222221F74EED134F730C6AD7574D59D11674C514EC8D4E
          79AAA9AE66A9DB200FB400000000000000000000000000000000000000000000
          0000000227E6FB59C6E612CE3703F0B3A5D66F796311B2D359A6C66D23EDA7FA
          BFE1A3235D1D137DB1A6F375B6BBD7DCDA51344FD931A39E6D689B3B4AACAA8D
          268AA6263A25A1785FBA716F576BD47E6A669FA4E7FABDF739D534B101A71EC0
          000000000000000000000000000000000000000000000000000000000000001B
          0B647F29BF7DCA7D6D7AD85B23F94DFBEE53EB669C1EFC4577EF9F2951BC7B29
          6CD8DC9446E4BAA616A0000001421B41E7818CF941B4EBF0BEF5086D079E0633
          E506D3AFC09A5F2E57E76574F1F23AF4AFDE8EE6141195F9D95D3C7C8EBD2BF7
          A3B9809640080000006356E446E4D5B911B8000000000000000000000013A4CA
          62018EF4C53D29D21208D212000319AA239419226746136B4D31ACEE878CCD9B
          5BC9D95E2BB2B7C422F57AA7FD0BBCC5756BF5CEE8796F77DBBDC6CF95BC5714
          D3D732AF76BADB5F2BE4EC299AA7AA2337B59AE21E7F3267BCB195ECAAAB16C5
          2CACAB88E4B289E3573F9434266ADBB66AC6F8F61844C61776AB923DEE75B498
          FAEAF9BF26B7BCDE2F37CB6AADEF36F5DADA553ACD55D53333FAB5DE2DC22D85
          8E76787D1C79FEE9D51E11B659CE19A0778B6CABBF55C48EA8D73E90DC19AB84
          2E21789AEEB95EE7176A27922DEDA35AF4E988F99AA716C6F17C76F137BC5F10
          B7BD5A553AEB695CCC47D91F33E1D12D6B89E3D8862D56779B4998EAD91F46C2
          C3B04B8E174C45DECE227AF6CFD51A241665D801200000000000000000000000
          0000000226748974F6C372E4E0D936C6F5694696D8855378AB5E89E4A7F873A6
          5BC1ED71EC7AE3845953354DEADA9A27EEEBCBFC6AECBC3AE745C6E76174B1A2
          29A2C68A68A623A22346CEE0DF0EE52DED2FD546AA7EEC77CEDDDE6D75A7F7FE
          258D9DCA9FCD3C69EE8D9BFC9F56E8DCC5954C5B89AB00000000000000000000
          00000000000000000000000000000000000654EE629A677C022A8D625A1734DD
          7E0799311BBE9A445E2BAA23EAABFAA3D6DF9313A4C34DED36E9F07CD15DA69C
          978B1A2D3F3EE7FF008C354F0B575E5709B3B78FC95C7D26263CF27AEE939579
          3CA084B9DD700048000000000000000000000000000000000000000000000000
          0000000000003616C8FE537EFB94FADAF5B0B647F29BF7DCA7D6CD383DF88AEF
          DF3E52A378F652D9B1B9288DC9754C2D40000002843683CF0319F28369D7E17D
          EA10DA0F3C0C67CA0DA75F8134BE5CAFCECAE9E3E475E95FBD1DCC28232BF3B2
          BA78F91D7A57EF4773012C8010000000C6ADC88DC9AB72237000000000000000
          988D4103288E9348E8044529D23A12000000C78F100C98CD70F8714C7B09C16E
          F55EB15BF58DD6CA98D66BB5AE2986A6CD9C21F0BBA4D776CA971AEFB6B1FEBD
          B6B45947D711BEAFE3ED5AB12C6AE38553C6BD5A447CB6CFD170B86157CC4EAE
          2DD6CE6AF9F47D763715BDF2C2ED6555B5BDA536767444D555554E914C74CCCB
          5B66DDBBE53C0E2BBBE115558B5EA377BD4E96513F5D7F3FE5AB42666CF39A73
          75ACD78D62D6B6967AEB16147F45953FED8E49FCF59FADF83A6BBDACF16E11ED
          AD33B3C3A8E2C7F755B7C236478E6D8186680D14E55E215E7FEB1B3C676CF864
          F699AB6B59C735457636B7E9B9DD6AFF00E9EED334D331F5CEF978CAA66A99AA
          A99999DF320D777CBFDE710B4E52F35CD53F3967B74B8DDAE3472777A2298F97
          EBD600F23D6000000000000000000000000000000000000022776E32CCD8DB7C
          1E72F7C371FBD63D6B671345C6CFDEECE67FEBABFECE8DA6348D1E0B63996FFB
          0324DCBDF28E2DBDF35BCDAEBBFF00AB747E8F79BA9746689E1D186615656731
          F7A638D3DF3FB3426925FF00F88E25696B1B2278B1DD0808E481922C40000000
          00000000000000000000000000000000000000000000000146F9134EF9064D63
          B5DBAC5378C3EF911CB34D76733FA4C7AE5B39E236A775F7ECBD45BC53ACD85B
          D356BD113AC7FCB0ED3DBAFDAB47EF11D311C6FF00F998956BBCE5690D4C0394
          D750000000000000000000000000000000000000000000000000000000000000
          001B0B647F29BF7DCA7D6D7AD85B23F94DFBEE53EB669C1EFC4577EF9F2951BC
          7B296CD8DC9446E4BAA616A0000001421B41E7818CF941B4EBF0BEF5086D079E
          0633E506D3AFC09A5F2E57E76574F1F23AF4AFDE8EE6141195F9D95D3C7C8EBD
          2BF7A3B9809640080000006356E446E4D5B911B800000001311AA62340629E2C
          A748E8482348E84800000226746155AC5313555C911CA6CD63FA30E3C3C7669D
          AC650CAD4D5677BC429B7BCC44E961779E3D5AFD7A72434C66BDBBE66C666BBB
          E0B4C6197799E4AA99E35ACC7DBF37E4C6B16D2BC330989A6D2BE3571F969D73
          E90BF619A3788629313654654FF74EA8FDFC1BEF31678CB5962C66BC6313B1B1
          AB4E4B38AB5AE7EC88E569DCD7C21AF9789AEED952E5163472C45E2DE35AA7EB
          8A7DAD3B7BBD5EAFF6D55E2F978B4B6B5AE75AABAEA9AA67F57F26B1C5F4FEFF
          007ECECEEBFD3A7EB57D7A3C1B130CD07B95D32AEF5FD4ABE91F4E97DF8C63D8
          CE3F799BDE3388DBDEED2677DA57AC47D91BA3F27C1F3EA9182DADADA5BD535D
          A4CCCCF4CEB96656565458531459C44447446A007C2A00000000000000000000
          00000000000000000000000FDAC99825798B3461F84D113316D6D4F1F4F9A88E
          59FE1F89F9373F074CBD16F7FBF664B6B3D69BBD316163331FE6AB7CC7E5EB5E
          B47B0F9C4F12B2BBF4679CF746B59B1FBFFF000DC3AD6DFA72CA3BE75437DDDA
          EF6777B0A2C6CA229A2CE98A6988F9A223487F5AA79620A77237BA569A6298CA
          1A03BC0120000000000000000000000000000000000000000000000000000000
          46F113F37DA0FE8FC0CEF74F86659C42CF4D78B6536911F5D3CBFF000FDE8DCF
          9EFF00634DE2E76F615F2D3694554CFE70F0E27778BDDCED6C27F353547D625F
          54CE5544B9DE129B4A26CAD2AB2ABBAA26699FB610E32AA99A26699E85E63600
          3E40000000000000000000000000000000000000000000000000000000000001
          B0B647F29BF7DCA7D6D7AD85B23F94DFBEE53EB669C1EFC4577EF9F2951BC7B2
          96CD8DC9446E4BAA616A0000001421B41E7818CF941B4EBF0BEF5086D079E063
          3E506D3AFC09A5F2E57E76574F1F23AF4AFDE8EE6141195F9D95D3C7C8EBD2BF
          7A3B9809640080000006356E446E4D5B9111A803288D120C78BF5B2000000000
          63555C57C588E358760F75AAFB8ADF6C2EB614EFAED6D2288FE5F35D74D11355
          53944269A66A9E2D319CBED9AB49D1FCADEF76376B2AADEDED68B3A288D6AAAB
          AB4888FB5A8336F087C1EE9C7BB656B9577EB58E4F845AC4D1651F5C477557F0
          D3B9973E66ACD969338C62B6B5596BAC58D9CF12CE9FB2986138B69E61D87E74
          584F295FCB678CFA32DC3343310BF655DB47274FCF6F847AB7E66CDBAE53C062
          BBBE1D55589DEA9E4E2D8CE9444FD757B1A6334ED7B38E67E358CDF7E0575AB5
          8F79BBEB4EB1F5CEF9789D3EB94B58E2DA6189E2B9D135F128EAA756FDAD8986
          689E1D86E55F178F5F5D5FA46C2AAAAAEA9AABAA6A999D6666794062D333339C
          B26D9AA00100000000000000000000000000000000000000000000000001A4CC
          C447CF3A3AD365797A32EE4AC3EE9551C5B6B5A3E116DAC72F1ABE5E5FCB4873
          6ECF3009CCB9C70DC2AAA38D6555AC5A5B7D5674F2CFAB4FCE1D8363674D3671
          4D3111111A4690DAFC1B61DED6FF00547FAC79CB5970817FD76571A7FF0029F2
          867BA9447226A9E588436CB5A000000000000000000000000000000000000000
          000000000000000000089480CA3731AA98989E5651B898E4944C67190D0599AE
          B373CC37FB09A74D2DEAAA23EA9E5FF97E646E7A9DA55D7E0F99ED2D229D22DE
          CE9AFED9DDFF0010F2EE3CD22BAFD8B16BC5DFFB6BABCF35E2CE78D444802CCF
          B0000000000000000000000000000000000000000000000000000000000001B0
          B647F29BF7DCA7D6D7AD85B23F94DFBEE53EB669C1EFC4577EF9F2951BC7B296
          CD8DC9446E4BAA616A0000001421B41E7818CF941B4EBF0BEF5086D079E0633E
          506D3AFC09A5F2E57E76574F1F23AF4AFDE8EE6141195F9D95D3C7C8EBD2BF7A
          3B9809640080000000000000112091FCE6D38BBF4D3A5E4734ED4F29E54A6AA6
          FD88D9DB5E22392C2C678F5CFE9BBF379AF57CBBDCACE6D6F15C534C74CCE4AD
          77BB5B5EABE4EC299AAAEA88CDEBFDF2227497E2660CE997F2BD84DE319C4AC2
          C223751356B5D5F6531CB2D0B9B76F598F199B4B0C0AC69C36EF56B115F756B3
          1F6EE86B3BD5F2F7885BD57ABF5E6D6DEDAB9E5AED2B9AAA9FCE5AF315E116ED
          619D9E1F4F1EAEB9D54FACB39C3340EF36F9577EAB894F546B9F48DEDCD9B784
          55E2DE6BBAE52C3A2CA9D748BCDE6359FCA8F6CFE4D4B8CE61C6F315E66F98DE
          276F7CB5F9A6D2BE4A7EC8DD1F943F392D698A6906218BD5FF00EAB4998EA8D5
          1F4E9F16C2C3702B8E151FFE7A233EB9D73F5F447D49059A75ED5DB288D80024
          00000000000000000000000000000000000000000000000000046BA6F494D355
          754534C6B3331111F59119CE50899888CE5BC7838E5D988C4733DB51CB3A5D2C
          2663ECAABFFE3FCB7AD3BB95E6B67997BB18CA18661155114DA5958C556DD336
          9572D5FCCCBD2CC690E94D1CC3BF85E1B65779DB9673DF3AE5CFB8E5FE712C42
          D6F1D133947746A844EF017C5A80000000000000000000000000000000000000
          00000000000000000000001953B8AB74B1A37CB306AFDAD5D78B78B8DF298EEA
          9AACEA9FD261AFDB5F6A974F7DC0ECEF31FE85B44CFD93C8D50E5EE126EBF66D
          21B5AA365714D5BB2FD173BB4E767000C0DE8000000000000000000000000000
          0000000000000000000000000000000001B0B647F29BF7DCA7D6D7AD85B23F94
          DFBEE53EB669C1EFC4577EF9F2951BC7B296CD8DC9446E4BAA616A0000001421
          B41E7818CF941B4EBF0BEF5086D079E0633E506D3AFC09A5F2E57E76574F1F23
          AF4AFDE8EE6141195F9D95D3C7C8EBD2BF7A3B980964008000000018D5571419
          31AAAD1F16218C5C309BB557CC4AFB6376B0A37D76B5C531FCB55E6DE10B83DC
          38F74CB574AAFF006D1C9EFD5FF4D947D71F3CFF000B5E238CDC70BA38D7AB48
          A7E5D33E0F7DC30BBE6275716EB67357CFA3EBB1B72DAF765614556B6D69459D
          14C6B355531111F9B5EE6ADB9654CBF15D85CED7FB4AF54EB1C4B19FE989FAEA
          682CC9B41CD59AABABFB5313B48B299E4B1B39E2D11F946F79CD356B5C5B847A
          EBCECF0EA328FEEAB6F847AB60617A034D395788579FFAC7EB3E8F759AB6C79B
          F337BE58D17AF805D6BFF46EF3A4E9F5D5BE5E1EAAAAAEA9AEBAA6AAAA9D6666
          759996296B9BEE237AC4ABE52F55CD53F3F4E867B73B85DAE1472776A2298F97
          FF006B4689078DEC000000000000000000000000000000000000000000000000
          0000000000001EBB65197BB23CF387DDABA38D6176ABE156FD1C5A39623F3AB8
          B0F2133A72B7F7073CBB376C2AFD98EDACFF00AEF969161653A72F128DFF00AD
          5EA645A29877F13C5ACACA7F0C4F1A7BA35F9B1FD27BFF00F0FC32D2B8DB31C5
          8EF9D5BA35B74514F242667E629E48E544EF7473438000000000000000000000
          00000000000000000000000000000000000000000269DF2C9846F660F3F9E2E9
          F0ACB37FA34D669A38F1F6C72B473A1B13B1A6F171BC58D51AC5765547F0E7BB
          5B39B2AEBB29DF45534CFE4D07C2EDD7897BBBDEA3F35331F49FDDEFB9CEA984
          088DC969E7B00000000000000000000000000000000000000000000000000000
          000000006C2D91FCA6FDF729F5B5EB616C8FE537EFB94FAD9A707BF115DFBE7C
          A546F1ECA5B36372511B92EA985A80000005086D079E0633E506D3AFC2FBD421
          B41E7818CF941B4EBF02697CB95F9D95D3C7C8EBD2BF7A3B98504657E76574F1
          F23AF4AFDE8EE60259002000044A58D5B81F8F98B36E0395AEDF0AC7314B0BAD
          33AF169AE7FAABFAA9A63967F269ECD7C232DAD62BBAE53C362889D69F84DE63
          59FB69A2393F5D7EC470958FFF009382CF4D169EB86926A2D30D2EC42E77DAEE
          17598A29A72D7D339C67E0D9BA2DA2D71BE5D28BEDE73AA673D5D1194E5E2FD2
          C6B31E3998AF337AC6714BC5EAD26758E3D7C94FD94EE8FCA1F9A91AC2D6DAD2
          DEB9B4B4AA6667A65B1ECAC6CEC298A2CA98888E880053540000000000000000
          000000000000000000000000000000000000000000000000006565636B79B7B3
          BB5851C7B4B5AA28A298F9EA99D223F9764E4DC0ECF2EE5AC3F07B3A7E4D614D
          354E9BEAD35AA67EB99D5CDDB18CBDFDBD9E2EB5DAD9F1AC2E1ADE6BE4E4D639
          29FE675FC9D5944690DC3C1B61DC4B0B4BF551AEA9E2C7746DDED55A7F7FE52D
          ECEE74CEAA6339EF9FD8AA748D1055CB2367B5E0000000000000000000000000
          000000000000000000000000000000000000001AE92CDFCE7E6FB59C6E0635C4
          4C4B41E64BB45CB1DBF5DB4D38B6F54FEBCBFF002DFD31C92D31B47BAFC1F33D
          AD71BADA8A6BFCDA9F85ABA72B85D95E23F257BA625EBBA5595730F2C9073D2E
          0000000000000000000000000000000000000000000000000000000000000361
          6C8FE537EFB94FADAF5B0B647F29BF7DCA7D6CD383DF88AEFDF3E52A378F652D
          9B1B9288DC9754C2D40000002843683CF0319F28369D7E17DEA10DA0F3C0C67C
          A0DA75F8134BE5CAFCECAE9E3E475E95FBD1DCC28232BF3B2BA78F91D7A57EF4
          773012C801000031AB7326356E112D0DC25BE5182FDCB4F5C348E8DDBC25FE51
          82FE1DA7AE1A4DCF5A6DEFBB6F0FF986F2D0FF0073D978F9C8031464E0000000
          0000000000000000000000000000000000000000000000000000000000022652
          FEF70B95B6237DB0B85DE35B4BC5A53674C7D733A3EA8A2AB4AE28A76CEA7CD7
          5D3674CD756C8D6E81E0F797BE01972DF1CB4A34B4C42D34A6663FD3A7923F9D
          65B7A9E4A5F9796F07B2C1704B9617654F168BB58D367A7D711CAFD49E48D1D3
          582DC230CB8D95DA3F2C467DFB677B9E715BE4E217CB4BCCFE699CBBBA372397
          E701745BC0000000000000000000000000000000000000000000000000000000
          000000009651B98B2A77013CAD5FB5BBB4517CB95EE2392AA2AA27EBE5D5B45E
          136AD75F7DC12CAF3A72D8DB47F31A30CD3FBB7DAF47EF14F4D31157D26255AE
          F395A43550884B95575000000000000000000000000000000000000000000000
          0000000000000001B0B647F29BF7DCA7D6D7AD85B23F94DFBEE53EB669C1EFC4
          577EF9F2951BC7B296CD8DC9446E4BAA616A0000001421B41E7818CF941B4EBF
          0BEF5086D079E0633E506D3AFC09A5F2E57E76574F1F23AF4AFDE8EE6141195F
          9D95D3C7C8EBD2BF7A3B98096400800018D5B9931AB7089685E12FF28C17F0ED
          3D70D26DD9C25FE5182FE1DA7AE1A4DCF5A6DEFBB6F0FF00986F2D0FF73D978F
          9C8031464E000000000000000000000000000000000000000000000000000000
          000000000000362EC2F2F7F6CE72A2FF006967C6B1C3689B69D63FCD3C94B5CC
          BA5760B97A9C2B284E276B6734DB62569EF9ACFF00D11C94FF00CB2CD0BC37F8
          8E2D67C68CE9A3EF4F86CDEC5F4BF10FB0E195C533F7ABFBB1E3B77368D9EE27
          96534F25288D7E77423478000000000000000000000000000000000000000000
          0000000000000000000000009A3E7414EF9066F399EEE9F0ACB37DA698D668A7
          DF23F297A37C78AD845E70FBCDDE635F7CB2AA9D3ED85BF16BB45F2E36D613F9
          A9AA373EA99CAA8973CC4CEEE8649B5A3DEED2AB398E5A6669FD18B8D2BA6689
          9A67A178480F9480000000000000000000000000000000000000000000000000
          00000000D85B23F94DFBEE53EB6BD6C2D91FCA6FDF729F5B34E0F7E22BBF7CF9
          4A8DE3D94B66C6E4A23725D530B50000000A10DA0F3C0C67CA0DA75F85F7A843
          683CF0319F28369D7E04D2F972BF3B2BA78F91D7A57EF47730A08CAFCECAE9E3
          E475E95FBD1DCC04B20040000C6ADCC98D5B844B42F097F9460BF8769EB86936
          ECE12FF28C17F0ED3D70D26E7AD36F7DDB787FCC379687FB9ECBC7CE4018A327
          0000000000000000000000000000000000000000000000000000000000000000
          007D982E1B6D8CE2F73C2AEF4CD5697AB6A6CE223EB9767611865861786DDB0F
          B1A2228BB5953674E9F5468E76D8065EFED2CD7698C5A59F1ACB0DB3D626777B
          E55C91FF0032E95A63486E9E0E70EE42E55DF2B8D75CE51DD1FBB5169E621CBD
          F69BA533AA88D7DF3FB644E91C9084CEF4363B04000000000000000000000000
          000000000000000000000000000000000000000000131BD046F066C2D2989866
          8AB4D3951319C6439FF305D66E78DDF6ED31A4516F5C47EAF81E9768975F8366
          8BC4FCD6B4D3691F5EB1CAF34E39C7AEBF62C52F161FDB5D5E6BC59CF1A98005
          A5F6000000000000000000000000000000000000000000000000000000000361
          6C8FE537EFB94FADAF5B0B647F29BF7DCA7D6CD383DF88AEFDF3E52A378F652D
          9B1B9288DC9754C2D40000002843683CF0319F28369D7E17DEA10DA0F3C0C67C
          A0DA75F8134BE5CAFCECAE9E3E475E95FBD1DCC28232BF3B2BA78F91D7A57EF4
          773012C801000031AB7326356E112D0BC25FE5182FE1DA7AE1A4DBB384BFCA30
          5FC3B4F5C349B9EB4DBDF76DE1FF0030DE5A1FEE7B2F1F3900628C9C00000000
          0000000000000000000000000000000000000000000000000000000425FA5967
          06B5CC1982E18358C72DEADE8B39FAA9D6359FCA3555B1B1AEF1694D951B6A98
          88F153B6B5A6C2CEAB5AF644673DD1B5D1DB0ECBBFD8992AC2F36D65A5BE2354
          DE6A99DFC5DD4C7E9CBF9B63EEA791FC2E174B1B95D2CAE96144536763674D9D
          111F35311A43FB55D0E9DC36E74DC2E96776A7653110E75BF5EAABF5E6BBC55B
          6A999400F73CA000000000000000000000000000000000000000000000000000
          000000000000000227E64A2419C1546B046E277226721AB76B574E25FEE77C88
          D22BB39A3F389D7FE5E09B4F6AB759B4C1EEF7B88D7DE2DB4FCA63FECD570E5D
          E11EEBF66D20B5988FC71157D63D735CEED39D9C24060AF40000000000000000
          000000000000000000000000000000000000000000D85B23F94DFBEE53EB6BD6
          C2D91FCA6FDF729F5B34E0F7E22BBF7CF94A8DE3D94B66C6E4A23725D530B500
          00000A10DA0F3C0C67CA0DA75F85F7A843683CF0319F28369D7E04D2F972BF3B
          2BA78F91D7A57EF47730A08CAFCECAE9E3E475E95FBD1DCC04B20040000C6ADC
          C98D5B844B42F097F9460BF8769EB86936ECE12FF28C17F0ED3D70D26E7AD36F
          7DDB787FCC379687FB9ECBC7CE4018A327000000000000000000000000000000
          000000000000000000000000000000000436E7078CBBF0DC7AF7986DACB5B3B8
          59C59594CC7FA95FCF1F65313E7351CE9F3BAB763997632E646B8D95AD9F16DE
          FB1F0CB6D77EB5E9311F95314B34D03C37EDD8AC5AD51F76CE38DE3D1BD87E9B
          5FFEC786CD9533F7AD272F0E9FFEF9BDD51A69C8899D66597CCC5BF1A5C00000
          0000000000000000000000000000000000000000000000000000000000000000
          001953B92C699DF0C81E6F3EDD3E1595EFB1A72D9C45A47E531AFF001AB496B1
          3F33A0F18BBC5EB0BBD5D669D7DF6C6BA3F58973F574CD35D54EED2661A0385D
          BA459DFAEF79FEEA663E93FBAE1739CE26100350BD6000000000000000000000
          0000000000000000000000000000000000003616C8FE537EFB94FADAF5B0B647
          F29BF7DCA7D6CD383DF88AEFDF3E52A378F652D9B1B9288DC9754C2D40000002
          843683CF0319F28369D7E17DEA10DA0F3C0C67CA0DA75F8134BE5CAFCECAE9E3
          E475E95FBD1DCC28232BF3B2BA78F91D7A57EF4773012C801000031AB7326356
          E112D0BC25FE5182FE1DA7AE1A4DBB384BFCA305FC3B4F5C349B9EB4DBDF76DE
          1FF30DE5A1FEE7B2F1F3900628C9C00000000000000000000000000000000000
          00000000000000000000000000403F73256015667CD586E0B14CCD16F6D4FBEF
          D5671FD557F113FC3B22C2CACECACE9B3A2988A698888888D348683E0E7977DF
          AF988E67B6A234B1A62EB613F5CE935CFF00ED8FCE5BFE88D296F2E0F70EFB26
          1B378AE3EF5A4E7E11AA3F569AD38BFC5EB11E4299FBB671978CEDFD0AB97910
          6BACC8CF98600000000000000000000000000000000000000000000000000000
          0000000000000000000146F966C69DEC81FCED238D4E9A6F680C76EB372C66F9
          75D3FF002EDABA63ECD791D05546B0D2BB42BAFC1B355EA62348B68A6D23F388
          D7F9D5A9785CBA72986D8DE72FC15E5F58FD9EBB9CE554C3CD00E7C5C0000000
          0000000000000000000000000000000000000000000000000006C2D91FCA6FDF
          729F5B5EB616C8FE537EFB94FAD9A707BF115DFBE7CA546F1ECA5B36372511B9
          2EA985A80000005086D079E0633E506D3AFC2FBD421B41E7818CF941B4EBF026
          97CB95F9D95D3C7C8EBD2BF7A3B98504657E76574F1F23AF4AFDE8EE60259002
          00006356E64C6ADC225A1784BFCA305FC3B4F5C349B767097F9460BF8769EB86
          9373D69B7BEEDBC3FE61BCB43FDCF65E3E7200C5193800000000000000000000
          00000000000000000000000000000000000000008E599888E59925E9B66D97E7
          32E72C3B0FAA8E359516B16F6DF728E5E5FCF48FCDE9B9DDABBE5E28B0A36D53
          11F579EF779A6E7615DE2BD94C4CFD1D27B2FCB9196B25E1F70AA98A6DABB3F7
          EB6FBF5F2CFAF4FC9EBB752C6C68A68B38A698D2223488E865572F23A7AE976A
          2E76145859ECA62223C1CEB78B6AAF36B55B57B6A999FAA007A5440000000000
          000000000000000000000000000000000000000000000000000000000000008D
          ECD86BA68CC11546B0D59B5ABAF1312B9DF22392D6CA68F3675FFE4DA73B9E07
          6AF74F7CC22EB7B8E5F7AB7E24FD51544FB2184F08776FB568F5E232FC3955F4
          98FD15AEF395A435700E585D4000000000000000000000000000000000000000
          0000000000000000006C2D91FCA6FDF729F5B5EB616C8FE537EFB94FAD9A707B
          F115DFBE7CA546F1ECA5B36372511B92EA985A80000005086D079E0633E506D3
          AFC2FBD421B41E7818CF941B4EBF02697CB95F9D95D3C7C8EBD2BF7A3B985046
          57E76574F1F23AF4AFDE8EE6025900200006356E64C6ADC225A1784BFCA305FC
          3B4F5C349B767097F9460BF8769EB869373D69B7BEEDBC3FE61BCB43FDCF65E3
          E7200C5193800000000000000000000000000000000000000000000000000000
          00000021BD783965DE2D8E2199EDA8D26D27E0F61331F3472D531F6CE91F9346
          59D9D56B694D959D3335D754534C47CF33B9D859032FD396F2A61F8644695D9D
          8C5569F5D73CB32CFB83CC3BED788CDEAA8D5671BE76306D3BBFFD9EE3176A67
          5DA4EE8DBBF27A3A792372279594CF2316F188CB534FC0025200000000000000
          000000000000000000000000000000000000000000000000000000000089671B
          98B28DC09799DA0DDBE11956FBA46B5594536B1FEDAA267F8D5E99F0E31758BF
          6197BB9CFF00AF635D9FEB130B6631758BE61F6F779FCD4551B9F7673C5AA25C
          FBBB784CF4C8E36AA329C9780040000000000000000000000000000000000000
          0000000000000000003616C8FE537EFB94FADAF5B0B647F29BF7DCA7D6CD383D
          F88AEFDF3E52A378F652D9B1B9288DC9754C2D40000002843683CF0319F28369
          D7E17DEA10DA0F3C0C67CA0DA75F8134BE5CAFCECAE9E3E475E95FBD1DCC2823
          2BF3B2BA78F91D7A57EF4773012C801000031AB7326356E112D0BC25FE5182FE
          1DA7AE1A4DBB384BFCA305FC3B4F5C349B9EB4DBDF76DE1FF30DE5A1FEE7B2F1
          F3900628C9C00000000000000000000000000000000000000000000000000000
          00000403D96C9B2F76459D6E5635D1C6B1BACFC26D758E4D29DDFCBAD2CE34A6
          223768D35C1D72E7C1F08BE661B5A3FAEF75FBD59CE9FE4A77FF002DCD4F2437
          DE8261BF60C2A9B4AA3EF5A4F1BC3A1A4B4C710FB6E2755113F768FBB1FAEF2A
          DE8066AC50000000000000000000000000000000000000000000000000000000
          000000000000000000000654EE629A3E7FB41930B48D634D19B1AB722622A8CA
          4D8E7DC6EEBF03C62FB7488D22CADEBA623EAE34E9FC3E27A4DA15D7E0B9AEF7
          311A45B4516B11F6D3113FCC4BCE38DF1CBACDCB12BC5DFF00B6BAA37AF344F1
          A989005ADF400000000000000000000000000000000000000000000000000000
          03616C8FE537EFB94FADAF5B0B647F29BF7DCA7D6CD383DF88AEFDF3E52A378F
          652D9B1B9288DC9754C2D40000002843683CF0319F28369D7E17DEA10DA0F3C0
          C67CA0DA75F8134BE5CAFCECAE9E3E475E95FBD1DCC28232BF3B2BA78F91D7A5
          7EF4773012C801000031AB7326356E112D0BC25FE5182FE1DA7AE1A4DBB384BF
          CA305FC3B4F5C349B9EB4DBDF76DE1FF0030DE5A1FEE7B2F1F3900628C9C0000
          000000000000000000000000000000000000000000000000000006777B0B5BDD
          E2CAED634CD55DAD7145311D333A307BBD8B65DFEDECED77B4B4A35B0B844DE6
          D26639358EE63F5D1EEC32E556237BB3BAD1F9A623D773C588DF29B85D2D2F15
          7E589FDB7BA4B27E076597B2EDC308B3A74F8358D34D5F5D5A6B3FCBF66A99D3
          91167BB42675974ED8595361674D951B222223C1CEF696955AD736956D99CC01
          55F0000000000000000000000000000000000000000000000000000000000000
          000000000000000269F9D098DE0C8113AE9C80D57B59BAF1314B9DEE2392D6CA
          AA27EDA675FF00E4F08DA3B5BBAF1F08BADEE98E5B2B7E2CFD9544FF00CC4357
          396B845BAFD9B486DA72FC5955F58F5895D2EF39D9C003075700000000000000
          00000000000000000000000000000000000000001B0B647F29BF7DCA7D6D7AD8
          5B23F94DFBEE53EB669C1EFC4577EF9F2951BC7B296CD8DC9446E4BAA616A000
          0001421B41E7818CF941B4EBF0BEF5086D079E0633E506D3AFC09A5F2E57E765
          74F1F23AF4AFDE8EE6141195F9D95D3C7C8EBD2BF7A3B98096400800018D5B99
          31AB7089685E12FF0028C17F0ED3D70D26DD9C25FE5182FE1DA7AE1A4DCF5A6D
          EFBB6F0FF986F2D0FF0073D978F9C8031464E000000000000000000000000000
          000000000000000000000000000000899746F07ACB9370CB56D8E5B51A5AE236
          9A51C9FE9D3C91FACEBFA39EAE172B5C4AFD77C3EC299AAD6F1694D9D111D333
          A3B3B2E613638160D73C26C22228BAD8D367C9F3CC472CFE73ACB63F0718772F
          7CAEF95C6AA2328EF9F48601A7D7FE4AEB45CE99D75CE73DD1FBBF462348426A
          D74E44374B530000000000000000000000000000000000000000000000000000
          0000000000000000000000000006BA4C089DF00FE8003CC6D0EEBF0ACAD7C888
          E5B3E2DA47FB6627DAD2DA6910E80C6EED17CC2AF7749FF56C6BA7F5873FCEB1
          33130E7EE176E9C9DFEC2F31F9A9CBE93FBAE1749CE998006A37AC0000000000
          000000000000000000000000000000000000000000006C2D91FCA6FDF729F5B5
          EB616C8FE537EFB94FAD9A707BF115DFBE7CA546F1ECA5B36372511B92EA985A
          80000005086D079E0633E506D3AFC2FBD421B41E7818CF941B4EBF02697CB95F
          9D95D3C7C8EBD2BF7A3B98504657E76574F1F23AF4AFDE8EE602590020000635
          6E64C6ADC225A1784BFCA305FC3B4F5C349B767097F9460BF8769EB869373D69
          B7BEEDBC3FE61BCB43FDCF65E3E7200C51938000000000000000000000000000
          0000000000000000000000000000899D01B2360F972719CE54E236D471AC30BB
          39B7E58D63DF279288F5CFE4E9FA2346B0D81E5C9C232746296B67316F8ADA4D
          BF2C72C59C7F4D11FC4CFE6D9F1AC472C3A1342F0DFE1D84D9F1A3EF57F7A7C7
          66EC9A2B4AEFFF00C4314B4AA27EED1F763C36EFCC99E54032C6380000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00001200CB7A511B920FE76B4C554CC4C724C68E7EC6AED374C5EF976DDEF76D
          5C47D9AF23A0EADCD27B40BAFC17345EF4A748B5E2DA47E71A7FC351F0BB75E3
          E1F63798FCB565F58F587AEE9395530F3A039F97000000000000000000000000
          00000000000000000000000000000001B0B647F29BF7DCA7D6D7AD85B23F94DF
          BEE53EB669C1EFC4577EF9F2951BC7B296CD8DC9446E4BAA616A0000001421B4
          1E7818CF941B4EBF0BEF5086D079E0633E506D3AFC09A5F2E57E76574F1F23AF
          4AFDE8EE6141195F9D95D3C7C8EBD2BF7A3B98096400800018D5B9931AB70896
          85E12FF28C17F0ED3D70D26DD9C25FE5182FE1DA7AE1A4DCF5A6DEFBB6F0FF00
          986F2D0FF73D978F9C8031464E00000000000000000000000000000000000000
          00000000000000003ECC170AB7C7318B960F778FFC4BE5BD1634CE9AE9ACC44C
          FE51CAF8A5B5383E65CFED3CD16F8E5AD9CCD961765A51AFFF0072BE48FD2227
          F55D305B84E277FB2BAF4553AFBA36EE5B718BF461B71B4BCF4C46AEF9D51BDD
          13855C2ED865C2EF87DCECE28B0BAD95363671D14D31111EA7D552288D21333A
          BA6A8A628A6298D90E7A999AA739400FA4000000000000000000000000000000
          000000000000000000000000000000000000000000000000000268DCC98D1F3C
          32044C6B0D51B57BAFBDE2B75BD453A7BF594D33F94FFDDB5E75D391E036B375
          E3E1B75BDC472D95AF167EC9860FC22DD7ED5A3F6D96DA72ABE92AD779CAD21A
          BC072D2EA0000000000000000000000000000000000000000000000000000003
          616C8FE537EFB94FADAF5B0B647F29BF7DCA7D6CD383DF88AEFDF3E52A378F65
          2D9B1B9288DC9754C2D40000002843683CF0319F28369D7E17DEA10DA0F3C0C6
          7CA0DA75F8134BE5CAFCECAE9E3E475E95FBD1DCC28232BF3B2BA78F91D7A57E
          F4773012C801000031AB7326356E112D0BC25FE5182FE1DA7AE1A4DBB384BFCA
          305FC3B4F5C349B9EB4DBDF76DE1FF0030DE5A1FEE7B2F1F3900628C9C000000
          000000000000000000000000000000000000000000000001133A43A9762196E3
          03C9175B7B4A38B6F88EB7BB4D77E957731E6C439BF2B609699873161F83D113
          3F09B7A69AF4F9A8DF54FE912ECCB8DDECEEB76B3BB595314D1654C514C47CD1
          11A368706D874576D6B7EAA3553F763BE75CB5BF0817FE2D9D95CA9E9FBD3DDB
          21FDA7929426A437035780000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000269DFF006B261AE930CC0797
          DA25D7E1595EF5A472D9716D35E8D25EA1F9B8FDDBE1983DF2ED31AFBE59551F
          C2D78DDDA2F9875BD84FE6A2A8DCFBB39E2D512D0333101544C4CC4C4EB1BC71
          BD51C59C97800400000000000000000000000000000000000000000000000000
          003616C8FE537EFB94FADAF5B0B647F29BF7DCA7D6CD383DF88AEFDF3E52A378
          F652D9B1B9288DC9754C2D40000002843683CF0319F28369D7E17DEA10DA0F3C
          0C67CA0DA75F8134BE5CAFCECAE9E3E475E95FBD1DCC28232BF3B2BA78F91D7A
          57EF4773012C801000031AB7326356E112D0BC25FE5182FE1DA7AE1A4DBB384B
          FCA305FC3B4F5C349B9EB4DBDF76DE1FF30DE5A1FEE7B2F1F3900628C9C00000
          000000000000000000000000000000000000000000000044A5126D1B8383B65D
          F866337DCC36D67AD174B3F79B2998E4E3D5CB3FC69FABA1A88D1E2764396E72
          F649B8D9574C536D79A7E116BAC72EB572E9F943DBF730E8DD14C3BF86615656
          531AE6339EF9682D23BFFF0011C4AD6DA27544E51DD08F9F50191AC800000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000089DF0FE8FE73D2FE803F95AD1C6B3AA99DD31312FEA8AA3587CD
          54C55194913939EB17B0F82E297ABB4C7FE5DB551FCBE57EFE7EBAFC17345EE2
          234F7D98B4FD61F80E37C6AEDF63C46DEC3FB6BAA37AF344E74C4802D8FA0000
          000000000000000000000000000000000000000000000001B0B647F29BF7DCA7
          D6D7AD85B23F94DFBEE53EB669C1EFC4577EF9F2951BC7B296CD8DC9446E4BAA
          616A0000001421B41E7818CF941B4EBF0BEF5086D079E0633E506D3AFC09A5F2
          E57E76574F1F23AF4AFDE8EE6141195F9D95D3C7C8EBD2BF7A3B980964008000
          18D5B9931AB7089685E12FF28C17F0ED3D70D26DD9C25FE5182FE1DA7AE1A4DC
          F5A6DEFBB6F0FF00986F2D0FF73D978F9C8031464E0000000000000000000000
          000000000000000000000000000003F7722E075E63CD787617144D54576D155A
          7DC8E597E13757074CBBC7BCDFB325B596B14445DAC6663E79E5AA617CD1BC3F
          F89E276561D19E73DD1AD65D21BFFF000EC3AD6DA275E59477CB7CDDACE8B1B2
          A2CACE98A69A298A6223E68867514469108F9F5749D3111194340F7802400000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000001946E629A675806489DC94553A40353ED56E9EF58BDDEF711
          C96D65A4FDB12F10D9BB59BAF1EE174BDE9CB676B34CCFD530D64E57E10AEBF6
          5D20B7CB655955F585D6EF571ACE001852B00000000000000000000000000000
          00000000000000000000000D85B23F94DFBEE53EB6BD6C2D91FCA6FDF729F5B3
          4E0F7E22BBF7CF94A8DE3D94B66C6E4A23725D530B50000000A10DA0F3C0C67C
          A0DA75F85F7A843683CF0319F28369D7E04D2F972BF3B2BA78F91D7A57EF4773
          0A08CAFCECAE9E3E475E95FBD1DCC04B20040000C6ADCC98D5B844B42F097F94
          60BF8769EB86936ECE12FF0028C17F0ED3D70D26E7AD36F7DDB787FCC379687F
          B9ECBC7CE4018A32700000000000000000000000000000000000000000000000
          00002226A98A698D66674888F9DD75B30CBD196F26E1F709A34B5AACE2DAD793
          7D5572B9B366B97E732673C3AE1559F1AC68B4F7EB6E4FF253CB2EBDB1A78B44
          531111111F336CF06D876AB5BFD5FF008C79CB5870817FCEBB2B953D1F7A7CA1
          9CCE90C5354A1B5DAD8000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000004D1B909A7E70648480F2BB
          46BAC5E32C5E2AD359B29A6D3F49FF00BB4CB7EE61BB45F306BE5DE7FCF63569
          F6E9AB40CC4C4CD33BE274973E70B975E4F11B1BC47E6A72FA4FEEB8DD273A66
          2520352BD4000000000000000000000000000000000000000000000000000361
          6C8FE537EFB94FADAF5B0B647F29BF7DCA7D6CD383DF88AEFDF3E52A378F652D
          9B1B9288DC9754C2D40000002843683CF0319F28369D7E17DEA10DA0F3C0C67C
          A0DA75F8134BE5CAFCECAE9E3E475E95FBD1DCC28232BF3B2BA78F91D7A57EF4
          773012C801000031AB7326356E112D0BC25FE5182FE1DA7AE1A4DBB384BFCA30
          5FC3B4F5C349B9EB4DBDF76DE1FF0030DE5A1FEE7B2F1F3900628C9C00000000
          0000000000000000000000000000000000000000409B3A2BB5B4A6CA88D6AAEA
          8A63F54C44CCE508998A75CEC6F6E0E397A2CEEF7FCCB6D67FD56B3176B1AA7A
          2396A9F537851B9E7B21E5FA32DE55C3B088A229AECEC62AB5FAED2796AFE65E
          867923474A68EE1F18661B6577E988CE7BE75CB9F71BBF7F12BFDADE3A267577
          46A8400BDAD40000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000002637A113BE01FD0007F2B6A22AB39
          A27962A898973EE2961375C4AF57798D3DEED6A8D3F3742D51AC347E7ABB7C17
          345F69D3FF0032A8B4FD6356A1E176E9C7B8585E23F2D531F58FD9ECBA4FDE98
          7E080D00F78000000000000000000000000000000000000000000000000000D8
          5B23F94DFBEE53EB6BD6C2D91FCA6FDF729F5B34E0F7E22BBF7CF94A8DE3D94B
          66C6E4A23725D530B50000000A10DA0F3C0C67CA0DA75F85F7A843683CF0319F
          28369D7E04D2F972BF3B2BA78F91D7A57EF47730A08CAFCECAE9E3E475E95FBD
          1DCC04B20040000C6ADCC98D5B844B42F097F9460BF8769EB86936ECE12FF28C
          17F0ED3D70D26E7AD36F7DDB787FCC379687FB9ECBC7CE4018A3270000000000
          0000000000000000000000000000000000000044BD9EC8B2F4E62CF171B1AECF
          8D61749F855AF27269469A47E73A43C6BA0B83A65DF8360B7DCC36B67A5A5F6D
          3DE6CA66397DEE8DFF00AD5AF9AC9744B0DFE278AD9D9CC7DDA678D3E1AF7CB1
          ED29BFFF000FC32D2A89FBD57DD8F1FD9B8ACA98888E56533CA534F1637A37BA
          2E1A1E3E60024000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000044EF8480CC446E4822ADDCAD49B5
          5BAC59635637988D22DAC635FB6274F536D57133B9AF76B7759AAE573BDC53DC
          5A5544CFDB1FF660BC23DD7ED5A3D6D96DA72ABE93FBABDDA72B486B301CB8BA
          0000000000000000000000000000000000000000000000000000D85B23F94DFB
          EE53EB6BD6C2D91FCA6FDF729F5B34E0F7E22BBF7CF94A8DE3D94B66C6E4A237
          25D530B50000000A10DA0F3C0C67CA0DA75F85F7A843683CF0319F28369D7E04
          D2F972BF3B2BA78F91D7A57EF47730A08CAFCECAE9E3E475E95FBD1DCC04B200
          40000C6ADCC98D5B844B42F097F9460BF8769EB86936ECE12FF28C17F0ED3D70
          D26E7AD36F7DDB787FCC379687FB9ECBC7CE4018A32700000000000000000000
          000000000000000000000000001120FEB77BBDADEAF16576B0A38F6B6D5C59D1
          4FFD554CE910ECCCA782D8E5DCBF87E0B611C974B0A6CEA9D3BAAB4FEA9FCE75
          9FCDCDDB11CBDFDB99EAED79B5B39AAEF865337AAFA38F1C94479D3AFE4EA6A2
          2222346E2E0DF0EE4EEF697EAB6D53947746DDFE4D51A7F7FE56F16772A67553
          19CF7CFEDE6CAADCC77154CEA36735F000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000000000032A6
          7584B1A373201E53691748B7CAF6F69A6BEF355369FCE9FF002F56FCACC976F8
          66057EBBE9AF1AC2AD23EB88D63D4B463D768BE6196F613F9A8ABC9F7673C5AE
          25A13EC09898E41C733194E4BC00000000000000000000000000000000000000
          00000000000000D85B23F94DFBEE53EB6BD6C2D91FCA6FDF729F5B34E0F7E22B
          BF7CF94A8DE3D94B66C6E4A23725D530B50000000A10DA0F3C0C67CA0DA75F85
          F7A843683CF0319F28369D7E04D2F972BF3B2BA78F91D7A57EF47730A08CAFCE
          CAE9E3E475E95FBD1DCC04B20040000C6ADCC98D5B844B42F097F9460BF8769E
          B86936ECE12FF28C17F0ED3D70D26E7AD36F7DDB787FCC379687FB9ECBC7CE40
          18A327000000000000000000000000000000000000000000000113B92FA70DB8
          5BE2B885DB0CBB53336B7AB5A6CA8FB6674D5F545155A551453B67543E6BAE9B
          3A66BAB643A1783D65CFECFCAD6B8CDB51C5B5C4ED78D4CE9CBEF747253FCF1A
          7F36D988D21F9B97F0CB1C1B09B9E1777A78B6775B1A6CA98FB2347E954E9BC1
          EE34E1B71B2BAD3F9637F4EF73B6257C9C42F76979ABF34E7E1D1B98EBAF286E
          1737880000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000134F27232631BD900FE56D4535D9D5
          4551C9544C4BFAB1AF73E6AA62B8CA473C623779BA5FEF1769DF676B553FA4CC
          3F83F773C5D7E099A2FD67A7775FBE47FBA35FF97E138D316BB4DCEFF6D613F9
          6AAA37AF344E74C4802DEFA00000000000000000000000000000000000000000
          00000001B0B647F29BF7DCA7D6D7AD85B23F94DFBEE53EB669C1EFC4577EF9F2
          951BC7B296CD8DC9446E4BAA616A0000001421B41E7818CF941B4EBF0BEF5086
          D079E0633E506D3AFC09A5F2E57E76574F1F23AF4AFDE8EE6141195F9D95D3C7
          C8EBD2BF7A3B98096400800018D5B9922ADDB81A1384B7CA305FB969EB86936F
          CE121855B5B6198662D674CCD176B5AACAB9E88AA2263D52D05F6B9FB4E6CEAA
          31BB59AA36C44C7D21BBB432D29AF08B38A7A3389FAA40620CA8000000000000
          0000000000000000000000000000000006CAD82E5E9C5B38FF0069DAD9F1AC70
          DB39B4D66393DF2AE48FE356B49E474E6C1F2E461193ACEFF6D67A5B6255CDBC
          CCEFE26EA7F865DA1586FF0010C5A89AA3EED1F7A7C366F62DA617FF00B0E195
          C533F7ABFBB1E3B77364D9E9099DE988A69DD087413480000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000001F3C337F39DF0FE802262261289DC0D47B54BACD8E3B6378D34
          8B7B08999FAE99989FE3478C6CADADDD666E970BE69FF9769559CCFDE8D7FF00
          8CB5AB957840BA4DD3486F1196AAA62AFAC47EABADDEAE359C0030C560000000
          000000000000000000000000000000000000000001B07647F29BFF00DCA7D6D7
          CD97B24B95745DAFB7FAA3FA6BAA2CE9FAF4E59FF8671C1CD9D569A456134C6C
          E34CF7652A3789CACE5B12372511B92EA55A80000005086D079E0633E506D3AF
          C2FBD421B41E7818CF941B4EBF02697CB95F9D95D3C7C8EBD2BF7A3B98504657
          E76574F1F23AF4AFDE8EE602590020000469AA407E2E6AC02E799B04BDE0D7CA
          7FF0EF347178D1BE8ABE6AA3EC9724E6BCAD8AE51C5AD70BC4EC2AA668999B3B
          4D3FA6D69D792A89767CD3156F7E3664CAB81E68B94DC31BC3ECEF1673ACD335
          47F5513D313BE2588E94E8B59E9059C5744F16D69D93D71D52C9747348ED303B
          49A6A8E359D5B63ABE70E3089D52DF58A706EC3AD6D66BC231EB6BBD133C9676
          D6715E9F9C3F3FFBB5DFBE6CCB63E865AAAD341F1BB3AB8B1659FCE263D5B2A8
          D33C1EBA6266D263BE27D1A546EAFEED77FF00092C7D0C9FDDAEFF00E1258FA1
          97C732B1BEC77C7ABEF9E18376BBA7D1A546EAFEED77FF00092C7D0C9FDDAEFF
          00E1258FA1939958DF63BE3D4E7860DDAEE9F46951BABFBB5DFF00C24B1F4327
          F76BBFF84963E864E65637D8EF8F539E18376BBA7D1A546EAFEED77FF092C7D0
          C9FDDAEFFE1258FA1939958DF63BE3D4E7860DDAEE9F46951BABFBB5DFFC24B1
          F4327F76BBFF0084963E864E65637D8EF8F539E18376BBA7D1A546EAFEED77FF
          00092C7D0C9FDDAEFF00E1258FA1939958DF63BE3D4E7860DDAEE9F46951BABF
          BB5DFF00C24B1F4327F76BBFF84963E864E65637D8EF8F539E18376BBA7D1A54
          6EAFEED77FF092C7D0C9FDDAEFFE1258FA1939958DF63BE3D4E7860DDAEE9F46
          951BABFBB5DFFC24B1F4327F76BBFF0084963E864E65637D8EF8F539E18376BB
          A7D1A546EAFEED77FF00092C7D0C9FDDAEFF00E1258FA1939958DF63BE3D4E78
          60DDAEE9F46951BABFBB5DFF00C24B1F4327F76BBFF84963E864E65637D8EF8F
          539E18376BBA7D1A546EAFEED77FF092C7D0C9FDDAEFFE1258FA1939958DF63B
          E3D4E7860DDAEE9F46951BABFBB5DFFC24B1F4327F76BBFF0084963E864E6563
          7D8EF8F539E18376BBA7D1A546EAFEED77FF00092C7D0C9FDDAEFF00E1258FA1
          939958DF63BE3D4E7860DDAEE9F46951BABFBB5DFF00C24B1F4327F76BBF7CF9
          92C7D0C9CCAC73B1DF1EA73C306ED774FA352601855AE378D5CF09B0A666ABD5
          B5367C9D133CBFC3B370BB9D961F72B0B8D8D314D161674D9D311D111A358E40
          D894E4FCC3678E5F315B3BE7BD515459D34D131C5AA7E7E56D8A69888E486CCD
          08C02DF06B0B4AEF54E56954ECF947AB5E698637638B5E28A6ED567674C776B9
          DA998D51A4B219D31063A49A4B2018E92692C8063A49A4B2018E92692C8063A4
          9A4B2018E92692C8063A49A4B2018E92692C8063A49A4B2018E92692C8063A49
          A4B2018E92692C8063A49A4B2018E92692C8063A49A4B2018E92692C8063A49A
          4B2018E92692C8063A49A4B2018E92692C8063A49A4B2018E92692C8063A49A4
          B2018E92692C8063A49A4B2018E92692C8063A49A4B2018E92692C8063A49A4B
          2018E92692C8063A49A4B2018E92692C8061C5966002277240792DA5DD62F195
          ADED229D66C2D28B588FCF4F54CB4E37FE3986C62D85DE70FE3451F08B39A22A
          9F9A6774FEBA3C0C6C92F1F3E2F673FF00EB9695E11344B12C6712A2F570B3E3
          47162275C46B89F9BDB76B6A68A72A9AF86C2ED4778EFB59FA393B51DE3BED67
          E8E580FF002F348BFC7DF1EAF472F67D6D7A36176A3BC77DACFD1C9DA8EF1DF6
          B3F4727F2F348BFC7DF1EA72F67D6D7A36176A3BC77DACFD1C9DA8EF1DF6B3F4
          727F2F348BFC7DF1EA72F67D6D7A36176A3BC77DACFD1C9DA8EF1DF6B3F4727F
          2F348BFC7DF1EA72F67D6D7A36176A3BC77DACFD1C9DA8EF1DF6B3F4727F2F34
          8BFC7DF1EA72F67D6D7A36176A3BC77DACFD1C9DA8EF1DF6B3F4727F2F348BFC
          7DF1EA72F67D6D7A36176A3BC77DACFD1C9DA8EF1DF6B3F4727F2F348BFC7DF1
          EA72F67D6D7A36176A3BC77DACFD1C9DA8EF1DF6B3F4727F2F348BFC7DF1EA72
          F67D6D7A36176A3BC77DACFD1C9DA8EF1DF6B3F4727F2F348BFC7DF1EA72F67D
          6D7A36176A3BC77DACFD1C9DA8EF1DF6B3F4727F2F348BFC7DF1EA72F67D6D7A
          36176A3BC77DACFD1C9DA8EF1DF6B3F4727F2F348BFC7DF1EA72F67D6D7A3617
          6A3BC77DACFD1C9DA8EF1DF6B3F4727F2F348BFC7DF1EA72F67D6D7A36176A3B
          C77DACFD1C9DA8EF1DF6B3F4727F2F348BFC7DF1EA72F67D6D7A36176A3BC77D
          ACFD1C9DA8EF1DF6B3F4727F2F348BFC7DF1EA72F67D6D7A36176A3BC77DACFD
          1C9DA8EF1DF6B3F4727F2F348BFC7DF1EA72F67D6D7A36176A3BC77DACFD1C9D
          A8EF1DF6B3F4727F2F348BFC7DF1EA72F67D6D7A36146C92DE7FFEDECFD1CBEA
          B9EC9AEB675C557FC4AD2D29FF00A68A78BFCAA597073A4569545336397CE6A8
          F544DE2CE3A5E0306C1AFD8DDF68B95CECE666A9FEAABE6A69E9996F1C130AB0
          C1B0EB1C3EEF1FD3674E933FF54FCF261182E1D835DFE0D70BAD1654EF9988E5
          ABED9F9DFA3111F34373685685D968CD9CDB5A55C6B6AB54CF4447547EB2F15B
          5BCDAEAE8480CF9400000005086D079E0633E506D3AFC2FBD421B41E7818CF94
          1B4EBF02697CB95F9D95D3C7C8EBD2BF7A3B98504657E76574F1F23AF4AFDE8E
          E60259002000000044C44EF84808E2C741C58E84808E2D3D07169E84808E2D3D
          07169E84808E2D3D07169E84808E2D3D07169E84808E2D3D07169E84808E2D3D
          07169E84808E2D3D07169E84808E2D3D07169E84808E2D3D07169E84808E2D3D
          07169E84808E2D3D07169E84808E2D3D07169E84808E2D3D07169E84808E2D3D
          07169E84808E2D3D07163A120238B1D0900C8000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000113113BCD2120238B4F41C5A7A120238B4F41C5A7A120238B4F
          41C5A7A120238B4F41C5A7A120238B4F41C5A7A120238B4F41C5A7A120238B4F
          41C5A7A120238B4F41C5A7A120238B4F41C5A7A120238B4F41C5A7A120238B4F
          41C5A7A120238B4F41C5A7A120238B4F41C5A7A120238B4F41C5A7A120238B4F
          41C5A7A120238B4F41C5A7A12023488262277C2404689000000000001421B41E
          7818CF941B4EBF0BEF5086D079E0633E506D3AFC09A5F2E57E76574F1F23AF4A
          FDE8EE6141195F9D95D3C7C8EBD2BF7A3B980964008000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000001421B41E7818CF941B4EBF0BEF5086D079E0633E506D3A
          FC09A5F2E57E76574F1F23AF4AFDE8EE6141195F9D95D3C7C8EBD2BF7A3B9809
          6400800000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000001421B41E7818CF941B4E
          BF0BEF5086D079E0633E506D3AFC09A5F2E58E76374F1F23AF4AFDE898E2C72B
          FCFC67DC89B4EBAED433262B8564BCCD656D678EDF2DAEF6F6386DE22AA662F1
          5CD35D35453BF74C4C3F569CE9C2DE234FEDCDA9F9F7EF606D5F9EB1D26B1D2A
          0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B
          35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD78
          5BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FD
          FCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36
          A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9
          F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFB
          D8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D
          9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC
          2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7E
          FE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B
          53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FC
          FBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFD
          EC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B03
          25F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E
          5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1
          D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749A
          C74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2
          A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837
          B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD7
          85BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16F
          DFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F3
          6A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F
          9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DF
          BD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61
          D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766B
          C2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7
          EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9
          B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4F
          CFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EF
          DEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0
          325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97
          E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B
          1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749
          AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D
          2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A83
          7B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD
          785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16
          FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F
          36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9
          F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7D
          FBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF6
          1D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766
          BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B
          7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF
          9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4
          FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3E
          FDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B
          0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C9
          7E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96
          B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC74
          9AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1
          D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A8
          37B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DEC
          D785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E1
          6FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7
          F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA
          9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7
          DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF
          61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD876
          6BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0
          B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFB
          F9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D
          4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3
          EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7
          B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C
          97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F9
          6B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC7
          49AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B
          1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A
          837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DE
          CD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E
          16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF
          7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCD
          A9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D2A11DA0F3C0C67CA0DA75F87
          F3ECD385BF7F36A7E7DFBD8FC9C9191B6A37EDA765FC6318C9B99EDEDEDB1DBA
          5BDE6F36F86DE26AAEA9BC5135575D534FDB33322763FFD9}
        mmHeight = 23813
        mmLeft = 168540
        mmTop = 1058
        mmWidth = 28310
        BandType = 0
        LayerName = BandLayer3
      end
    end
    object ppDetailBand1: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 8467
      mmPrintPosition = 0
      object ppDBText25: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText13'
        Border.mmPadding = 0
        DataField = 'produto'
        DataPipeline = ppDBPedidoProduto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        VerticalAlignment = avCenter
        DataPipelineName = 'ppDBPedidoProduto'
        mmHeight = 6350
        mmLeft = 26197
        mmTop = 265
        mmWidth = 61664
        BandType = 4
        LayerName = BandLayer3
      end
      object ppDBText27: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText18'
        Border.mmPadding = 0
        DataField = 'valorunidade'
        DataPipeline = ppDBPedidoProduto
        DisplayFormat = '$####,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'ppDBPedidoProduto'
        mmHeight = 6346
        mmLeft = 163256
        mmTop = 265
        mmWidth = 16142
        BandType = 4
        LayerName = BandLayer3
      end
      object ppLine2: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line5'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 1321
        mmTop = 7412
        mmWidth = 195792
        BandType = 4
        LayerName = BandLayer3
      end
      object ppDBText8: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText8'
        Border.mmPadding = 0
        DataField = 'qtdecompra'
        DataPipeline = ppDBPedidoProduto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'ppDBPedidoProduto'
        mmHeight = 6350
        mmLeft = 151613
        mmTop = 265
        mmWidth = 11101
        BandType = 4
        LayerName = BandLayer3
      end
      object ppDBText9: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText9'
        Border.mmPadding = 0
        DataField = 'valortotalproduto'
        DataPipeline = ppDBPedidoProduto
        DisplayFormat = '$####,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'ppDBPedidoProduto'
        mmHeight = 6350
        mmLeft = 179923
        mmTop = 265
        mmWidth = 16140
        BandType = 4
        LayerName = BandLayer3
      end
      object ppDBText26: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText26'
        Border.mmPadding = 0
        DataField = 'datacompra_1'
        DataPipeline = ppDBPedidoProduto
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        VerticalAlignment = avCenter
        DataPipelineName = 'ppDBPedidoProduto'
        mmHeight = 6350
        mmLeft = 1323
        mmTop = 265
        mmWidth = 23813
        BandType = 4
        LayerName = BandLayer3
      end
      object ppDBText1: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText1'
        Border.mmPadding = 0
        DataField = 'produto'
        DataPipeline = ppDBPedidoProduto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        VerticalAlignment = avCenter
        DataPipelineName = 'ppDBPedidoProduto'
        mmHeight = 6350
        mmLeft = 88639
        mmTop = 265
        mmWidth = 62194
        BandType = 4
        LayerName = BandLayer3
      end
    end
    object ppFooterBand1: TppFooterBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppSystemVariable1: TppSystemVariable
        DesignLayer = ppDesignLayer1
        UserName = 'SystemVariable3'
        Border.mmPadding = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 157961
        mmTop = 794
        mmWidth = 17729
        BandType = 8
        LayerName = BandLayer3
      end
      object ppSystemVariable2: TppSystemVariable
        DesignLayer = ppDesignLayer1
        UserName = 'SystemVariable4'
        Border.mmPadding = 0
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 180451
        mmTop = 794
        mmWidth = 16405
        BandType = 8
        LayerName = BandLayer3
      end
      object ppLine3: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line6'
        Border.mmPadding = 0
        Pen.Width = 2
        Weight = 1.500000000000000000
        mmHeight = 265
        mmLeft = 265
        mmTop = 265
        mmWidth = 196850
        BandType = 8
        LayerName = BandLayer3
      end
    end
    object ppSummaryBand1: TppSummaryBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppLabel3: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label2'
        Border.mmPadding = 0
        Caption = 'Quantidade Total :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3968
        mmLeft = 1588
        mmTop = 265
        mmWidth = 28575
        BandType = 7
        LayerName = BandLayer3
      end
      object ppDBCalc1: TppDBCalc
        DesignLayer = ppDesignLayer1
        UserName = 'DBCalc1'
        Border.mmPadding = 0
        DataField = 'qtdecompra'
        DataPipeline = ppDBPedidoProduto
        DisplayFormat = '$####,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPedidoProduto'
        mmHeight = 4498
        mmLeft = 30692
        mmTop = 265
        mmWidth = 17198
        BandType = 7
        LayerName = BandLayer3
      end
      object ppLabel4: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label4'
        Border.mmPadding = 0
        Caption = 'Valor Medio :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3968
        mmLeft = 50270
        mmTop = 265
        mmWidth = 19581
        BandType = 7
        LayerName = BandLayer3
      end
      object ppDBCalc4: TppDBCalc
        DesignLayer = ppDesignLayer1
        UserName = 'DBCalc4'
        Border.mmPadding = 0
        DataField = 'valorunidade'
        DataPipeline = ppDBPedidoProduto
        DisplayFormat = '$####,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DBCalcType = dcAverage
        DataPipelineName = 'ppDBPedidoProduto'
        mmHeight = 4233
        mmLeft = 70640
        mmTop = 265
        mmWidth = 17198
        BandType = 7
        LayerName = BandLayer3
      end
      object ppLabel5: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label5'
        Border.mmPadding = 0
        Caption = 'Valor Total:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3968
        mmLeft = 91281
        mmTop = 265
        mmWidth = 17200
        BandType = 7
        LayerName = BandLayer3
      end
      object ppDBCalc7: TppDBCalc
        DesignLayer = ppDesignLayer1
        UserName = 'DBCalc7'
        Border.mmPadding = 0
        DataField = 'valortotalproduto'
        DataPipeline = ppDBPedidoProduto
        DisplayFormat = '$####,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DBCalcType = dcAverage
        DataPipelineName = 'ppDBPedidoProduto'
        mmHeight = 4233
        mmLeft = 107950
        mmTop = 265
        mmWidth = 17198
        BandType = 7
        LayerName = BandLayer3
      end
    end
    object ppDesignLayers1: TppDesignLayers
      object ppDesignLayer1: TppDesignLayer
        UserName = 'BandLayer3'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object ppRepFornecedor: TppReport
    AutoStop = False
    DataPipeline = ppDBPedidoProduto
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4 (8.2 x 11.7 in; 210 x 297 mm)'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
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
    Left = 368
    Top = 224
    Version = '19.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPedidoProduto'
    object ppHeaderBand3: TppHeaderBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 26194
      mmPrintPosition = 0
      object ppLabel7: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'LblOrdemPedido'
        Border.mmPadding = 0
        Caption = 'Pedidos por Fornecedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 18
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 7673
        mmLeft = 1323
        mmTop = 16404
        mmWidth = 73819
        BandType = 0
        LayerName = BandLayer4
      end
      object ppLine1: TppLine
        DesignLayer = ppDesignLayer3
        UserName = 'Line4'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        mmHeight = 1319
        mmLeft = 1058
        mmTop = 24871
        mmWidth = 195125
        BandType = 0
        LayerName = BandLayer4
      end
      object ppImage1: TppImage
        DesignLayer = ppDesignLayer3
        UserName = 'Image8'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = False
        Stretch = True
        Border.mmPadding = 0
        Picture.Data = {
          0A544A504547496D61676529BC0000FFD8FFE000104A46494600010100000100
          010000FFDB004300030202020202030202020303030304060404040404080606
          050609080A0A090809090A0C0F0C0A0B0E0B09090D110D0E0F101011100A0C12
          131210130F101010FFDB00430103030304030408040408100B090B1010101010
          1010101010101010101010101010101010101010101010101010101010101010
          10101010101010101010101010FFC00011080500050003012200021101031101
          FFC4001E0001000203010101010100000000000000000109020708060405030A
          FFC4005510010001010502060B0F010702050402030001020304050611073108
          12213851B4161732555676779293B1D10913141934415761717273819194A122
          151835424382C152E12333A2B2C24453748324456267F1FFC4001C0101000105
          010100000000000000000000000103050607080402FFC4004011010001010404
          0B05060700030101000000010203040511062131A1071213164151537181B1D1
          333536619114223242C1E1151723525462B27282F02492FFDA000C0301000211
          0311003F00E45CF99C76917EDA9664C2309CD998EDEDEDB1EBE585DEEF617FB7
          9AABAA6F15C534534C55BFE6D21FBFDAB78607CD92F6ABA7FF008F7E7C996397
          858DD3C7C8EBF2BF8A7963513B1425DAB3860F817B55F417E3B5670C1F02F6AB
          E82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423D
          AB3860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED57D0
          5F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F02F6
          ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD42
          3DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED57
          D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F02
          F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD
          423DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED
          57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F
          02F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80
          CD423DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05
          ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C
          1F02F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB
          80CD423DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E
          05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B567
          0C1F02F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2
          FB80CD423DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE18
          3E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5
          670C1F02F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0B
          F2FB80CD423DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE
          183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3
          B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA
          0BF2FB80CD423DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6A
          CE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417
          E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAA
          FA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F
          6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F4
          17E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BD
          AAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE03350
          8F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55
          F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0
          BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE033
          508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B
          55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C307
          C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE0
          33508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F81
          7B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C3
          07C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F02F6ABE82FCBE
          E033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F
          817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59
          C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F02F6ABE82FC
          BEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB386
          0F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED
          59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F02F6ABE82
          FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3
          860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED57D05F8
          ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F02F6ABE
          82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423DA
          B3860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED57D05
          F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F02F6A
          BE82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423
          DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED57D
          05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F02F
          6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD4
          23DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED5
          7D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F0
          2F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80C
          D423DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05E
          D57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55FDBDF9F8192B3
          76D230EDA8601836319A332DDEF3618F5D2EF79BB5E6FF006F4D5455178A69AE
          8AE99AB9277C4C4BFD064EE5086D039385FE331FFF00B02D3AF846B7CD95F9D9
          5D3C7C8EBD2BF7A3B98504657E76574F1F23AF4AFDE8EE602590020000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000005086D079E0633E506D3AFC2FBD421B41E7
          818CF941B4EBF02697CB95F9D95D3C7C8EBD2BF7A3B98504657E76574F1F23AF
          4AFDE8EE60259002000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000005086D079
          E0633E506D3AFC2FBD421B41E7818CF941B4EBF02697CB95F9D95D3C7C8EBD2B
          F7A3B98504657E76574F1F23AF4AFDE8EE602590020000000046B00918F1A13C
          68E9048C78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0
          190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C
          78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D0
          71A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0
          190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C
          78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D0
          71A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0
          190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C
          78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D0
          71A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0
          190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C
          78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D0
          71A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D1D271
          A3EB064238D12900000000001421B41E7818CF941B4EBF0BEF5086D079E0633E
          506D3AFC09A5F2E57E76574F1F23AF4AFDE8EE6141195F9D95D3C7C8EBD2BF7A
          3B98096400800001133A0226A88DEF23B45DA9E46D96E0D56399D31FB0C3AC27
          58B3A2A9D6D6DAA8FF002D14472D53CB1F572F2B3DA7E7FC1B66392714CEB8E5
          73F06C3AC66B8B389D2AB6B49E4A2CE9FAEAAA623F954C6D476A59AB6B39B2F5
          9B334DFEBB5B5B6AA62C6C2267DEAED67ACF16CE8A7E688FD677CF2CA9DA5A45
          9C315D26D25A302B38A288E35A55B23AA3AE5D7999FDD1EC1EC2F55D8E50C837
          8BDD844E94DBDF6F1167C68FB94C4E9FACBF03E323CC3A693B3AC3FF00735B8C
          75D7E743CDCBD6D6169A658C5A559C5AE5DD11E8ECFF008C8F307D1D61FF00B9
          B43E323CC1F47587FEE6D1C63ACF49ACF4A396AFADF1CEEC63B6DD1E8ECEF8C8
          F307D1D61FFB9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18EDB7
          47A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FFB9B4718EB3D26B3D272D5F5
          9CEEC63B6DD1E8ECEF8C8F307D1D61FF00B9B43E323CC1F47587FEE6D1C63ACF
          49ACF49CB57D673BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FF
          00B9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FFB9B43E3
          23CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE323CC1F475
          87FEE6D0F8C8F307D1D61FFB9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF
          8C8F307D1D61FF00B9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D673BB1
          8EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FF00B9B4718EB3D26B3D
          272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FFB9B43E323CC1F47587FEE6D1C
          63ACF49ACF49CB57D673BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1
          D61FFB9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FF00B9
          B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE323CC
          1F47587FEE6D0F8C8F307D1D61FF00B9B4718EB3D26B3D272D5F59CEEC63B6DD
          1E8ECEF8C8F307D1D61FFB9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D6
          73BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FFB9B4718EB3D26
          B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FF00B9B43E323CC1F47587FE
          E6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F
          307D1D61FF00B9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D6
          1FFB9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE
          323CC1F47587FEE6D0F8C8F307D1D61FFB9B4718EB3D26B3D272D5F59CEEC63B
          6DD1E8ECEF8C8F307D1D61FF00B9B43E323CC1F47587FEE6D1C63ACF49ACF49C
          B57D673BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FF00B9B471
          8EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FFB9B43E323CC1F47
          587FEE6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE323CC1F47587FEE6D0
          F8C8F307D1D61FFB9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D
          1D61FF00B9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18EDB747A
          3B3BE323CC1F47587FEE6D0F8C8F307D1D61FF00B9B4718EB3D26B3D272D5F59
          CEEC63B6DD1E8ECEF8C8F307D1D61FFB9B43E323CC1F47587FEE6D1C63ACF49A
          CF49CB57D673BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FFB9B
          4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FF00B9B43E323C
          C1F47587FEE6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE323CC1F47587F
          EE6D0F8C8F307D1D61FF00B9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8
          C8F307D1D61FFB9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18ED
          B747A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FFB9B4718EB3D26B3D272D5
          F59CEEC63B6DD1E8ECEF8C8F307D1D61FF00B9B43E323CC1F47587FEE6D1C63A
          CF49ACF49CB57D673BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1D61
          FF00B9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FFB9B43
          E323CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE323CC1F4
          7587FEE6D0F8C8F307D1D61FFB9B4718EB3D26B3D272D5F59CEEC63B6DD1E8EC
          EF8C8F307D1D61FF00B9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D673B
          B18EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FF00B9B4718EB3D26B
          3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FFB9B43E323CC1F47587FEE6D
          1C63ACF49ACF49CB57D673BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F307
          D1D61FFB9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FF00
          B9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE323
          CC1F47587FEE6D0F8C8F307D1D61FF00B9B4718EB3D26B3D272D5F59CEEC63B6
          DD1E8ECEF8C8F307D1D61FFB9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57
          D673BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FFB9B4718EB3D
          26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FF00B9B43E323CC1F47587
          FEE6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE323CC1F47587FEE6D0F8C
          8F307D1D61FF00B9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1
          D61FFB9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18EDB747A3B3
          BE323CC1F47587FEE6D0F8C8F307D1D61FFB9B4718EB3D26B3D272D5F59CEEC6
          3B6DD1E8ECEF8C8F307D1D61FF00B9B43E323CC1F47587FEE6D1C63ACF49ACF4
          9CB57D673BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FF00B9B4
          718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FFB9B43E323CC1F
          47587FEE6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE323CC1F47587FEE6
          D0F8C8F307D1D61FFB9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F30
          7D1D61FF00B9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18EDB74
          7A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FF00B9B4718EB3D26B3D272D5F
          59CEEC63B6DD1E8ECEF8C8F307D1D61FFB9B43E323CC1F47587FEE6D1C63ACF4
          9ACF49CB57D673BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FFB
          9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FF00B9B43E32
          3CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE323CC1F4758
          7FEE6D0F8C8F307D1D61FF00B9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECE
          F8C8F307D1D61FFB9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18
          EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FFB9B4718EB3D26B3D272
          D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FF00B9B43E323CC1F47587FEE6D1C6
          3ACF49ACF49CB57D673BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1D
          61FF00B9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FFB9B
          43E323CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE323CC1
          F47587FEE6D0F8C8F307D1D61FFB9B4718EB3D26B3D272D5F59CEEC63B6DD1E8
          ECEF8C8F307D1D61FF00B9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D67
          3BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FF00B9B4718EB3D2
          6B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FFB9B43E323CC1F47587FEE
          6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F3
          07D1D61FFB9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FF
          00B9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE3
          23CC3F473877EE6B7EF658F747F0ABC5EA8B0CDD90ADEEB6154C71ADEE3788B4
          9A63EE5511AFEB0E1227422DAB87DD1A658C51544CDAE7E11E8B94D9C6D5F21E
          D53068C6B2563F617FB2A748B6B38FE9B5B0AA7FCB5D13CB4FCFF54E9C932F61
          4DA53311CBBD4D1B33DA766BD9566CBA66CCAB7FAEC2DEEF5445AD96B3EF778B
          3D796CED23E7A67FEF1CAB66D94ED1707DAAE46C2B3AE0B3C5B1C42C75B4B29A
          B59B1B58E4AECE7EB89D7ED8D27E77AACAD3948F9B66E8CE92D38DD1367691C5
          B4A76C744C75C7A3D980A8CB00000005086D079E0633E506D3AFC2FBD421B41E
          7818CF941B4EBF02697CB95F9D95D3C7C8EBD2BF7A3B98504657E76574F1F23A
          F4AFDE8EE60259002000044A5156E0719FBA3B9A2F572CAF95F2A585A554D962
          17BB5BD5BD3AF255EF74C451FF00BEA703BB5FDD26FF0011C9BF8578F5C38A27
          7BC56FF8DA234D2D2AAF18B4899D997920051626000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000098DEEF0F7
          383345EAF18366ACA56D695556375B7B2BED853AF25335C4D35FEBA51FA383E3
          7C3B47DCDBFF001FCE1FFE2D87FEE56B09CAB657A19695518C594474E71BA5DE
          709446E4BDADF00000002843683CF0319F28369D7E17DEA10DA0F3C0C67CA0DA
          75F8134BE5CAFCECAE9E3E475E95FBD1DCC28232BF3B2BA78F91D7A57EF47730
          12C801000022ADC9455B8844B84BDD26FF0011C9BF8579F5D2E289DEED7F749B
          FC4726FE15E7D74B8A277BC56FF8DA1F4CBDF16DE1E50801458A800000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0001F3C7DAED2F736FFC7F387FF8961FFB9C5BF3C7DAED2F736FFC7F387FF896
          1FFB956C7DA4328D0EF7CD8F8F94BBCE372511B92F737DC0000000A10DA0F3C0
          C67CA0DA75F85F7A843683CF0319F28369D7E04D2F972BF3B2BA78F91D7A57EF
          47730A08CAFCECAE9E3E475E95FBD1DCC04B200400008AB725156E2112E12F74
          9BFC4726FE15E7D74B8A277BB5FDD26FF11C9BF8579F5D2E289DEF15BFE3687D
          32F7C5B787942005162A00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000007CF1F6BB4BDCDBFF1FCE1FF00E258
          7FEE717446AED1F737274C7B37CF4DD6C3FF007AAD8FB48651A1F19633639FCF
          CA5DE71B9288DC97B9BEC0000005086D079E0633E506D3AFC2FBD421B41E7818
          CF941B4EBF02697CB95F9D95D3C7C8EBD2BF7A3B98504657E76574F1F23AF4AF
          DE8EE602590020000455B928AB710897097BA4DFE23937F0AF3EBA5C513BDDAF
          EE937F88E4DFC2BCFAE97144EF78ADFF001B43E997BE2DBC3CA10028B1500000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000000000013A0
          204C47CDAC278A2729623F6304CA19A3325A53658065FC4310AAB9D23E0D76AE
          D23F588D21B6729F033DBD66AE25A5595230AB1AB978F885B53673A74C531ACB
          EA9A66A9CA21EEBB6197CBDCE56165555DD12D1E7167E6876C651F738AF969EF
          7699CF3FD1671BEAB2B85DF59FB38D5B75E53E03BB08CB3C4B5BD60778C66DA3
          499AAFF6F355333D3C58D34548B0AE76B24BA68362979CA6BA6288F9CFE90AC4
          B961D886236B16387DC6DEF35CCE9C5B2B39AE7F486C8CA9C1976DF9CB895613
          90711B3B2AF4E2DB5EA9F78B39FF00755A2D4B2F6CFB24E55A29B3CBB95F0BC3
          E28E4A66C2EB453579DA6BFCBF766CFE68988FB1569BBC74CB26BAF075634E53
          79B599EE8CBCF357BE51F73B7681894D9DB66DCD985E11673A71ACAC29AADED6
          3F4D299FD5D51B02E0CD96B60937FBC60F8DDFB12BD62767459DE2D2DE9A68A3
          4A6758E2D31AE9CBF5B71534F15944EB2A94D9D34CE710CAB0ED19C370BAE2D6
          C28FBD1D3339CB20151900000000A10DA0F3C0C67CA0DA75F85F7A843683CF03
          19F28369D7E04D2F972BF3B2BA78F91D7A57EF47730A08CAFCECAE9E3E475E95
          FBD1DCC04B200400008AB725156E2112E12F749BFC4726FE15E7D74B8A277BB5
          FDD26FF11C9BF8579F5D2E289DEF15BFE3687D32F7C5B787942005162A000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000026204E48194D331F3
          4A6C6C6DAF16B4D85859D569695CF169A29899AAA9E8888E5936A6299AA72860
          365E54E0DBB73CE7345581ECD719F79B4E58B7BDD8FC12CE63A62AB69A6263EC
          D5B9F2A7B9D9B4DC4B896D9B33560D82D955CB551614D77BB5A63A263FA29D7E
          CAA5F716754EC85E2EBA3F895F3D958D5E31979E4E4ED3EBD0D223E758E652F7
          3CF64384FBDDB666C5B1AC7AD29D38D4576D177B299FAA2CE22AFD6A96E6CA9B
          00D8F6498A6ACB990707BADB51BADE6ED4D76BE7D5AD5FCAA45DEA9DB2C96E9C
          1FDFED75DBD54D11F59DDAB7AAAB2C6C9369B9CEAA232C646C66FF004DA7736B
          45D2BA6CA7FF00D954453FCB71E53E017B6EC7FDEED719B3C3302B1ABBAF84DB
          FBE5AD3FEDA358FF00D4B2EB1BAD85DE8F7BB1B3A28A7A29A62223F467C588E4
          8558BBD31B592DD383EB8596536F5D55CFD21C71947DCE5CA775E25AE72CED7F
          C42B8D38D6573B2A6C2CE7F39D6AFE5BA729F04CD846509A2D2E191AE97AB6A3
          969B6BF4CDBD713D3AD4DBE2AC514C6C864B74D1EC32E5AECAC633EB98CE77BE
          1C3B02C2307B28B1C2F0DBA5D2888D229B0B1A688D3F287DBC548FA5E29A69A6
          32A63244469CA99D7A407D44640002637A131BC190000000002843683CF0319F
          28369D7E17DEA10DA0F3C0C67CA0DA75F8134BE5CAFCECAE9E3E475E95FBD1DC
          C28232BF3B2BA78F91D7A57EF4773012C801000022ADC9455B8844B84BDD26FF
          0011C9BF8579F5D2E289DEED7F749BFC4726FE15E7D74B8A277BC56FF8DA1F4C
          BDF16DE1E50801458A8000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000009D04
          A065146B3114C4CCCEED3E77A7CB7B30DA0E6FB58B1CB793717BFD53BBDE6EB5
          CC7EBA6898899D8AB6777B5B69E2D9D3333F28CDE593C9D30E89CA7C04F6E798
          E68AF12B85C703B1AF978F7DBC44D511F5D14EB547E8DCF947DCE3C0EC3896B9
          D73DDEAF53FE7B1B858459D3F95756B3FF00A5529B2AEAE85FEE9A278B5EF5D3
          65311F3D5E6E0FD23A5FA38565DC771DBC5174C1706BF5FEDAD3B9A2EF77AAD2
          67F2885A5652E07DB03CA5C4AEC72559E256F469A5B6236B55BCCFDB4F2513E6
          B6BE1196B00C02C22EB81E0F72C3EC63759DD6EF45953FA5310FBA6ED3F9A593
          5D783AB7AB5DE6D623BB5FA2AD729F03DDBFE6D9B3AEC723DB61B615E9ADAE25
          694DDB8BF5CD154F1FF4A5B9F297B9C38EDB554DA675DA1DD2EB11A4D56186DD
          6AB699FABDF2B9A623CD9779F1698E8348568B0A236EB64B74D05C2EEFAED226
          B9F9CE5BA1CF194B8086C0F2E4515E2785625982DA8D278D88DF2A8A75FB965C
          4A663EA9D5B932BECD721649B3F7ACA594707C2234D266E972B3B2AAAFB6AA63
          5AA7EB97A4D51AEAA914C46C864976C2EE5738CAC2CA9A7BA208A298D7494716
          1225EEC88D6234004800000000000000098DE84C6F064000000000A10DA0F3C0
          C67CA0DA75F85F7A843683CF0319F28369D7E04D2F972BF3B2BA78F91D7A57EF
          47730A08CAFCECAE9E3E475E95FBD1DCC04B200400008AB725156E2112E12F74
          9BFC4726FE15E7D74B8A277BB5FDD26FF11C9BF8579F5D2E289DEF15BFE3687D
          32F7C5B787942005162A00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000988D7538BAEE9FE
          099C93113281F6E15826338E5E22E982E137CC42DE74D2CEEB6155AD5FA53132
          DAB94F824EDEB374516975C8B78B85857A696D88DA53614C7DB4CEB5C79AFA8A
          6AAB643D977C3AF77B9CAC6CE6AEE8969D4C6EDD2EC8CA7EE72666BC7BDDB673
          CF374B9C4F2D76170B09B5AA3ECAEAD23FF4B75650E01DB0FC0389698B5D711C
          72DA9D3FAAF97898A27EDA29D225522C2B964973D08C56F3AEBA2288F9CFE90A
          D1BBDDAF17BB5A6C2EB61696B6957253459D335553F943DF654E0FBB64CE734C
          E07B3FC5ABB3ABFD5B6B19B1A223A666BD3916A9973649B38CA3674D965CC9B8
          4DC229DD36575A627F5D357ABA2C6CECE22298D2237446E8558BBC74CB25BAF0
          73671AEF56D9FCA98F5573653F73DB6AB8BF12D7336358560B673A4D5445536F
          5E9F969112DD1947DCF2D98E1BC4AF34E60C5F18B4A796AA2898B0A35E8E4E59
          875971683488DCA9165452C92E9A1D84DD729E4F8D3FEDAFF66B8CA7C1C762F9
          329A2704C8185C5A51FEADBD97BF5733D3335EB0D8576B8DD2E3654D85D2C2CE
          C6CE88D29A2CE88A698FB221FDB5943EE22236322B1BAD8DDE38B6344531F28C
          8E2D3D26911B812AE9D651AEA000000000000000000000000000002637A131BC
          190000000002843683CF0319F28369D7E17DEA10DA0F3C0C67CA0DA75F8134BE
          5CAFCECAE9E3E475E95FBD1DCC28232BF3B2BA78F91D7A57EF4773012C801000
          022ADC9455B8844B84BDD26FF11C9BF8579F5D2E289DEED7F749BFC4726FE15E
          7D74B8A277BC56FF008DA1F4CBDF16DE1E50801458A800000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000278B
          AFF9A19D958DA5B57C4B1B2AAD2A9F9A989991F514CD5B1FCC7BACA7B0DDADE7
          79A2ACB3B3FC6AF7655EEB6F83554597E75D5A531FAB73E53F73E76C98D4D16B
          98EFF83601653DD536B6F36F6D1F65367134CF9D0FB8B3AAAD90BA5D702C46FB
          EC2C6A9F0CA3EB2E5F2235E4D7E6F9D60F94BDCE9D9DE1D345AE6FCDB8CE3369
          4F2D567768A2E9653F54F77569F6550DD994B831EC2B25C515E0DB36C22BB6B3
          D262DEFB65F0BB489E98AADB8D313F668A9177AA76EA64D74D00C46DB5DB554D
          11DF9CEE555659C819DF3A5AC58E52CA58C63154CE9ADCAE5696D4C7DB5531A4
          7E72DC994B80C6DFB32F12D6FD815C700B0AE35E3E277CA62AD3EE5971EA89FA
          A6216776171BADD6CA9B0BB5851656744694D1453C5A623A2221FDB894EFD156
          2EF4C6D64B74E0F2E567AEF16935776A8FD65C4D94BDCDEC36CA68B7CEDB44BD
          5E27926AB0C32EB4D9447D5C7B49AB5F361BA729F033D806578A2BEC2E8C56DE
          8E59B4C4EDAABC6B3D3C4AA7891F952DDFC5A53AC69C92AB14534EC864B74D1B
          C2EE5ECAC633EB9D73BF37E561194B2D6016145D704C0EE371B1B3E4A68BBD85
          36711FA43F522CE888E484EB28D65F4BD5345344654C64998A67E794694C6E01
          F59275946A0240000000000000000000000000000000000000004C6F42637832
          0000000005086D079E0633E506D3AFC2FBD421B41E7818CF941B4EBF02697CB9
          5F9D95D3C7C8EBD2BF7A3B98504657E76574F1F23AF4AFDE8EE6025900200004
          55B928AB710897097BA4DFE23937F0AF3EBA5C513BDDAFEE937F88E4DFC2BCFA
          E97144EF78ADFF001B43E997BE2DBC3CA10028B1500000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000120813A7D52FDCC0B23E7
          0CD16B4D965ECB189E2335F73377BB575533FEE88D3F94C673B156CEC6D2D672
          A22667E4FC21BEF297027DBC6688A2D6DF2ED8E0F635693355FEDE28AA23EEC6
          B32DCF94FDCE0A3FA2D73AE7EAA7E79B2C3EEFA47D93555FF0FBA6CABABA17DB
          A68AE2B7BD7458CC475CEAF370FC53131BE75FB1F4E1F84E278A5AC58E1B875E
          6F75CCE91163655573FC42D03287029D82E579A2D2DB2C578B5AD3A4F1EFF6F5
          5A46BD3A4690DBD81647CA1966CA9B2CBD96F0DC3E9A6348F83DDA8A27F588D6
          5522ED3D32C9AE9C1E5E6BCA6F36B14F74673FA2AC329F057DBA671E25786E42
          BEDDEC6D375B5F74BBD131D3135374655F739F3A5F628B6CDF9C30EC36CE749A
          ACEEB4556F694FEBA53FCAC062CA888D2213C58D3455A6C28A76B25BA681E196
          1AED73AE7E73946E731E50E00BB16C0E68B6C76715C76DA9EEA2DEDFDEACA7FD
          B4444FFEA6EACADB19D95E4CA68EC6721E0D72AE8D38B6B4DD69AED63FDF56B5
          7F2F651C58E4838D0A914D31B21925D708B8DCBD859531E1AFEBB58C58D9D31A
          45311A328A220D651ACBE971CA213114C266A862094EB28D6400000000000000
          0000000000000000000000000000000000000004C6F426378320000000005086
          D079E0633E506D3AFC2FBD421B41E7818CF941B4EBF02697CB95F9D95D3C7C8E
          BD2BF7A3B98504657E76574F1F23AF4AFDE8EE602590020000455B928AB71089
          7097BA4DFE23937F0AF3EBA5C513BDDAFEE937F88E4DFC2BCFAE97144EF78ADF
          F1B43E997BE2DBC3CA10028B1500000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000131CBF389CB340FED75B9DE6FB6F45D6E777B5B7B7B49D28
          B2B2A26BAEA9FAA23965B3729F05FDBCE72E257856CDB16B1B1B4E58B6BFD9C5
          CE888E9FFC69A6663EC894C44CF43D56171BCDEA78B6144D53F28996AC4BAEB2
          9FB9CFB41BFF0012DB38671C2309B3AB96AB3BA515DEED23EA999E25313F66AD
          CB94BDCFCD8D60D3457986F38BE60B48EEA2DEF3EF36733F5536514CE9F6CCAA
          C58573AD915D742F16BCEBAA88A63FDA72570C53C6988A235D791ECF2BEC5F6A
          F9CEAA632DE40C6AF7457A716D26EB559D9CFF00BEBD29FE56AF947625B28C93
          14CE5AC83835CAD688D22DA9BAD336B3F6D731333F9CBDAD9DDAC2CA9E259595
          3453D14C690FB8BBF5CB26BA70731B6F56DE14C7EB3E8AD8CA7C0076D18EC516
          D8EDE309C0AC6AD358B5B59B6B5A7FDB4727FEA6E8CA5EE73E46B8F12DB37E6F
          C4F14AE34E3595DE9A6C2CA7A7A6AFE5D85145311A44278B1D0AD1634474325B
          A68661375D7367C69FF69CFF0066A6CA3C16F619937DEED30CC8370B5B7B39FE
          9B7BDC4DBDA47FBAAD5B3AE38461586D97BCE1D87DDEED671FE5B1B2A688FE21
          F54E9D06B11BA1F71111B191585CEEF768E2D8D114C7CA2211EF74C6ED53C5A7
          A0999425E94FF4C7CC6B1F342003590000000000000000000000000000000000
          000000000000000000000000000000004C6F426378320000000005086D079E06
          33E506D3AFC2FBD421B41E7818CF941B4EBF02697CB95F9D95D3C7C8EBD2BF7A
          3B98504657E76574F1F23AF4AFDE8EE602590020000455B928AB710897097BA4
          DFE23937F0AF3EBA5C513BDDAFEE937F88E4DFC2BCFAE97144EF78ADFF001B43
          E997BE2DBC3CA10028B150000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000001
          951455695453453355533A45311CB23EA2999D8C47AECB3B26DA4670B48B3CB7
          92318BF4D53A6B6775AF8BFACC68DC794B8066DB7315545A62F65866056354EF
          BD5E38F569F768D661F54D1555B2172BAE0D7FBECFF42CAA9F0D5F5D8E6F2239
          7E777CE54F738F2ADD789699CB3C5FAFD56FAECAE5654D8D3F645756B3FC373E
          51E099B06CA3C4AEE990EE97DB6A397DFB10AAABC4CFDB4D53C5FE1562EF54ED
          64B74D02C4EDB5DACD3447CE739DCAB5C1329E66CC778A6EB8065FC4710B6AB9
          29B3BB5DABB4AA7F2886DCCA5C0C76FB9AF896B393BFB26C2BFF005713B7A6C3
          8BF6D13AD7FF00A568B85E0B8460D778B9E11855D2E5614EEB3BBD8D3674C7E5
          4C443EC8A298F99522EF4C6D964D74E0F2E967AEF36B35776A8FD65C2994FDCD
          CBF57345AE77DA358D94477761865D66D267ECB5B4E2E9E6373653E039B01CB5
          34577DCBD7BC7ADA8D34B4C4EF75551AFD7459F1289FCE99743691D071637AAD
          3674D3D0C92EBA2F855D3F058C4CFCF5F9BF072D644C9593EEF175CAB94F08C2
          2CE234E2DCAE76763AFDBC588D7F37EE459D14EEA594CC41C687DE4BED167459
          C71688888F92268A677C114534EE82651ACF48FB65AC41C68620266651AC8000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000098DE84C6F064000000000A10DA0F3C0C67CA0DA75F85F7A843683C
          F0319F28369D7E04D2F972BF3B2BA78F91D7A57EF47730A08CAFCECAE9E3E475
          E95FBD1DCC04B200400008AB725156E2112E12F749BFC4726FE15E7D74B8A277
          BB5FDD26FF0011C9BF8579F5D2E289DEF15BFE3687D32F7C5B787942005162A0
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000098899DD1ABF4706CBB8FE62BC7C1700C0AF
          F895B6B11EF774BBD76D57E94C49AFA1528B2AAD272A23397E68DD795381F6DF
          335459DA59E4B9C32C2D3962DB12B6A6C6223EEC6B547E70DCD94FDCE2C62DE2
          8B5CE99F2C2EF4CF756387D84D5547D95D7C9FC2A53655D5D0BDDD346715BE65
          C9D8CE5F3D5E6E2F7F7BA5CAF57EB58BBDCAED6B78B69DD67636735D53F9446A
          B30CA9C0576179722CED310C26F78DDBD1BEBBF5BCCD357DB453A53FC37365AD
          9AE42CA5634D865DCA1855C28A74D3DE6EB4C4C69F5E9AAAC5DE7A65935D383D
          BDDA65378B48A7BB5CAAB32A7070DB5672AACE706C8189C5957FEB5E2CFDE688
          FB78DA4FF0DCF94FDCF0DA4629C4B4CD598F0BC1E8DF55165355BD7FAC690B12
          8A288E48A6234FA93C58E8548B0A636B25BA680E1B61AEDA66B9F9CE51BBD5CA
          994FDCF7D93E0FC4B5CCB8B62B8DDAD3A4CD335C58D1AFD94EF86E7CA5B01D8F
          E4C8A6301C838459574FFA9696116B5EBD3AD7AF2B62691D0691D0A914534EC8
          64975C130FB9E5C8D8D31E1AFEB2FE76375BB5DE8A6CAC2C28B3A298D29A68A6
          22223EA886714511BA984CCE88E37D4FA5D222223284F163A0D223E644CEA812
          CA66211C6FA9002667546B3D2000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000002637A131BC1900
          00000002843683CF0319F28369D7E17DEA10DA0F3C0C67CA0DA75F8134BE5CAF
          CECAE9E3E475E95FBD1DCC28232BF3B2BA78F91D7A57EF4773012C801000022A
          DC9455B8844B84BDD26FF11C9BF8579F5D2E289DEED7F749BFC4726FE15E7D74
          B8A277BC56FF008DA1F4CBDF16DE1E50801458A8000000000000000000000000
          0000000000000000000000000000000000000000000000000000000098D60FEB
          6177B7BC55145859556954EEA69A6665EF72AEC036C99D7895E5FD9F62F6F655
          F736F6961363653FEFAF4A7F94C5333B1E9B1B9DBDE672B1A26AEE8996BD1D53
          947DCF5DAC631EF76D9A71CC1703B19EEA8F7CAAF36D4FE5447167CF6E9CA5EE
          766CB70BE25AE6BCCB8DE396B1DD5167345D6C6AFB6988AABFD2B558B0AE5905
          D343717BD653C9F163FDA72DDB772BBA2359D377E6F4B95B66BB40CED5C5194F
          256358B4553A7BE5D2E5695D9C7DB5C47163F395A9652E0E5B12C933675E5FD9
          B60945B59F736F79BBFC26DA263E78B4B6E35513F64B6559585958D14D9D9595
          14514C444534C69110A9176EB964D74E0EAADB7AB6F0A63F59564652E023B78C
          C5C4B4C5AE185E5EB1AB4999BFDF22BB488FAA8B28AF97EA9986E8CABEE6FE5D
          BBF12DB3AED02FD7DAB9266C70EBB5377A3EC9AABE3CCC7D910ED2D23A0D23A1
          522C688E864D75D0AC26EDAEAA26B9FF0069FD2328694CA7C10360394A6CED2E
          D912ED7FB6A34FFC5C4AAAAF5333D3A57334C4FD910DB58565FC1305BBD376C2
          709B9DCECACF929A6C2C69A223EC8887E8E91D09548888D50C8AEF71BB5D232B
          0B38A7BA2211A47441A474133A238DF525EB4E91AEBA258CCEA806533A238DF5
          2004CCEA80000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000131BD098DE0C800000
          0001421B41E7818CF941B4EBF0BEF5086D079E0633E506D3AFC09A5F2E57E765
          74F1F23AF4AFDE8EE6141195F9D95D3C7C8EBD2BF7A3B9809640080001156E4A
          2ADC4225C25EE937F88E4DFC2BCFAE97144EF76BFBA4DFE23937F0AF3EBA5C51
          3BDE2B7FC6D0FA65EF8B6F0F28400A2C54000000000000000000000000000000
          00000000000000000000000000000000004E93D008004C4660F4597B6779EB36
          574D196F29629884D7DCCD8DD6B9A67FDDA69FCB70E55E03DB75CC93676B7DC1
          6EB8258D5CB5557EB78E3C7FB29D7D6FA8A2AAB642E376C26FB7CF616554F839
          F12EEACA5EE7161F6714DAE74CF96B6D31CB55961F778A699FAB8D572B73E54E
          06BB05CAB345A4651FED3B6A3498B4C42D6AB59D7A74E48558B0AA76B23BA681
          E2978D7699511F39D7B957B86E038CE356B4D8E1384DEAF95D73A4536163557C
          BF94368E54E097B77CDD34D775C8D7AB8D8D7CBEFB7FAA2C29D3A638DBD69981
          E53CB7976CA9B1C0B01C3EE14531A6977BB5167EA8E57EBC534F43EE2ED4ED99
          64F74E0F2EF465379B59ABE51197AB80F28FB9CB99EF7145B672CF171B8D13CB
          559DCAC2AB6AE3EA99AB8B1FA4B74E53E019B0FC0228B5C62EF8963D6D4E9AFC
          2EF13459CFFB68D263F574A691D0690AB4D9514EC864B75D14C26E9AE9B2899E
          B9D7E6F1F95B653B39C99144659C938361F551DCDAD95D28F7CFCEB98E34FEAF
          5F1451A69C58FD13A41AC74AA2FB656367631C5B3A6223E519114D31BA20D20D
          63A51C6FA8554A58F1900CA674471BEA40099A90000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000002637A131BC190000000002843683CF0319F2836
          9D7E17DEA10DA0F3C0C67CA0DA75F8134BE5CAFCECAE9E3E475E95FBD1DCC282
          32BF3B2BA78F91D7A57EF4773012C801000022ADC9455B8844B84BDD26FF0011
          C9BF8579F5D2E289DEED7F749BFC4726FE15E7D74B8A277BC56FF8DA1F4CBDF1
          6DE1E50801458A80000000000000000000000000000000000000000000000000
          001BF702407D387DC2FD89DE69B9E1B72B6BDDBDA72516563653695D5F64472C
          8FAA289AE72A63397CC36DE54E0A7B7ECE1345A5C366F885CEC2BFF5B128A6E7
          111D3C5B598AE63ECA65B9F29FB9C99D6FBC4B4CE79E70BC3689D26AB2B858D7
          79AF4E8E355C4889FCA5F74D9D75742F375D1CC52F9ECAC6ACBAE6328DF938FB
          49E84D145569545145135D554E94C472CCCF468B29CA5C00F62380F12D31CFED
          7CC16D4F2CFC2EF536746BF76CA29E4FAA756E4CA9B1ED9964A88A32BE48C1F0
          F988D3DF2CAE744573F6D5A6B3F9AAD377AA76B25BA707B7DB4D778B4A69FACC
          EE556E57D84ED8339CD119776798CDE28AF75ADA5DE6C6CE7ECAED38B13FAB72
          E54F73EF6BD8D712D33162984E0963569331355578B5A7EDA69D23FF0052C82C
          ACACECA9E259D114C47CD11A433548B0A636B26BA68061F65AEDEAAAB9FA47FF
          0078B91329FB9D9B39C3F896B9B733E2B8BD71A71ACECF4B0B39FB38BFD5FCB7
          4654E0CFB13C9BC4B4C1B20E1D36D469A5BDE2CFDFAD3CEAB56D34AAD34534EC
          864B75C070EB9FB1B1A63C339DEF96E386DC30EB2F79B95CEC2EF446EA6CACE2
          88FD21F4E91D10946B0FA5DA22223283484A358E944D5D02592358E9471A500C
          B58E9471900278D2800000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000131BD098DE0C8000000001421B41E7818CF941B4EBF0BEF508
          6D079E0633E506D3AFC09A5F2E57E76574F1F23AF4AFDE8EE6141195F9D95D3C
          7C8EBD2BF7A3B9809640080001156E4A2ADC4225C25EE937F88E4DFC2BCFAE97
          144EF76BFBA4DFE23937F0AF3EBA5C513BDE2B7FC6D0FA65EF8B6F0F28400A2C
          5400000000000000000000000000000000000004E93D008037890656767696B5
          C59D959D55D756EA698D665ED32AEC636A99CE69A72E644C5EF94D53DDD376AA
          9A63EB999D39131133B15EC6ED6D789CACA99AA7E519BC48E9ACA9C0076D18E7
          12D71CB4C2F02B1AB967DFEDFDF6BD3EED1AE93F6B73E51F73A323DCB895E70C
          E38A6255472D56774B3A6EF4FD9C69E34CC7E50A94D8D75742FF0075D0FC5EF5
          B2CB8B1FED947EEAFF007EDE5FC959BF34DE3E0996F2CE25895B4EEA2EB74AED
          6AFE2169B94F82C6C2B27716AC3767F70BCDAD3FEADFA26F354CF4E95CCD3FA4
          36861F8661F85D85376C36E36175B0A3B9B2B1B38A288FB22391522EF3D32C9A
          E9C1D5ACEBBD5B447CA233F3CBC958394B8136DFF34F12BB7CB36182D857CB16
          B89DE69B298FB6CE9E3571E6B73652F737E2668B5CEFB4599FFAEC30BBA7AAD2
          D27FF83B8E27EA4E91D0AB16144326BA683E1577D75D335CFCE7F48C9A1329F0
          26E0FD95FDEEBB5CA96B8DDB59E931698A5E6AB589FB6CE9E2D9CFE74B70E5FC
          A195B2ADDA2E79632E61B845847FA771BAD1614FE944443F692A91114EC64776
          C3AE9738CAC2CE9A7BA218C69BB44A44BDA84A358E944D5D00C908E34A35D419
          6B1D289ABA100278D28000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000131BD098DE0C8000000001421B41E7818CF9
          41B4EBF0BEF5086D079E0633E506D3AFC09A5F2E57E76574F1F23AF4AFDE8EE6
          141195F9D95D3C7C8EBD2BF7A3B9809640080001156E4A2ADC4225C25EE937F8
          8E4DFC2BCFAE97144EF76BFBA4DFE23937F0AF3EBA5C513BDE2B7FC6D0FA65EF
          8B6F0F28400A2C540000000000000000000000000489C902749E83E7D032CD03
          F5B02CA79A3345B45865BCBB896275CCE9A5D2EB5DAE93F5F162746DFCA5C0C3
          6FD9AF89695654B3C26C2BE5F7CC4ADE9B3E4E9E2D3C6ABF29887D451555B21E
          EBB6197CBE6AB0B2AAAEE8968BD24D1DB7953DCE0BD55345AE75CFFC489E5AAC
          70EBBF2C7D5C7AF589FD1BA729F022D83E5B8A2D2F7976DF19B6A74E3577FB7A
          ABA6AFB68EE7F8548B0AE5925D341715BC6BB488A23E73FA466AC3B8E1D88627
          6F176C3AE378BDDACEEB3B0B2AAD2AFD22265B2F297063DB8672E25785641C42
          CAC6BD34B6BDD316147E7C6E5FE169D816CFB25657B2A2EF97F2BE1B70A28EE6
          2C2ED4D331F9E9ABD05144531A44722AC5DE3A65935D383CB2A75DE6DA67E511
          96F957C654F73AF3F621C5B6CDD9A70DC2E998FEAB2BBD355B5A47D93C90DD19
          4FDCFCD8F609145AE60BE62B8E5AD3F35A5A4595133F5D34EF8FCDD462A45953
          1D0C9AE9A2584DD32E2D971A7AE75FECD7D96361DB27C9F4D3465EC8584DDA69
          DD5CDDE2D2BFB75AB597BAB0B0B3B0A69B3B2A229A29E4A6988D2221FDC54CA3
          A17EB2BBD9584716CA9888F944000AC08D611357403246BA23594032D6113574
          2004F1A51AEA0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000693D0988E9042622754C4689000000000
          01421B41E7818CF941B4EBF0BEF5086D079E0633E506D3AFC09A5F2E57E76574
          F1F23AF4AFDE8EE6141195F9D95D3C7C8EBD2BF7A3B9809640080001156E4A2A
          DC4225C25EE937F88E4DFC2BCFAE97144EF76BFBA4DFE23937F0AF3EBA5C513B
          DE2B7FC6D0FA65EF8B6F0F28400A2C54000000000000131133BA0D275D349040
          9E2CF43FA5DEEB79BDD716775BBDA5B5733A453453354EBF9276BEA9A66A9CA2
          1FCA39771B9B2F297071DB6E759B3AB02D9CE2F559DA69C5B6BCD97C1ECA7FDF
          69C5A67F56E8CA9EE75ED3F14E25B66ACC9836096557754594D57AB6A7F28D28
          FF00D4FB8B3AA7A177BA68FE257DD7636354C75E5947D65C986E58D651F73D36
          4B83C59DAE67C631BC7ADA9EEE89B4A6EB6357FB688E3C79EDD394B83FEC6B24
          712BCB7B38C12EF6D47736F69768B7B68FFF0065A71ABFE5522EF574B26BA707
          D7FB5D76F553447D6776ADEAA8CA7B27DA6678AA8EC4F21E398A59D7BAD6C2E5
          69363F9DA4C7123F396E9CA7C01F6EB8F712D71BB3C272ED8D5DD45EEF516B6B
          11F553631547EB542CAA8B0A28888A288888DD10FED1C9110A9177A7A592DD38
          3EB8596BBC575573E111FAF9B8D32A7B9C394EE71676D9D33D62989571A4D565
          71B1A2ED6733D1AD5C7AA63EC986E9CA7C13360B93E2CED2E1B3DB8DEEDE8D27
          DFB10D6F55EBD3FF008933113F668DC62A4514D31944326BAE8F61973CB92B1A
          7BE6339DF9BF3B0FC0F0AC2ACA9B0C370CBBDD6CE88D29A2C6CA28888FB221F7
          453A472331F6BBD345344654C64003E811AC74A26AE806431E34CA2759F9C196
          B1D289ABA100278D3289E5F9C000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000349004C427488063A
          4F42621923588DF2679091135531CB32F8B11C670CC2ECA6DAFD7DB2B1A63FEA
          AB967F252B6B7B3BBD13696B545311D3339426226763EDD63A4E353BB56BCC67
          6AD75B29AACB06B9D56F57CD696BFD34FE9BE7F87F7D9EE61C5F1FBF5F6D312B
          CC574D1447128A69D29A797E662963A6F84DEB11A30CBAD7C7AEACF5C47DD8CB
          E7E8AB3615C53C69D8F7A212CC1440000005086D079E0633E506D3AFC2FBD421
          B41E7818CF941B4EBF02697CB95F9D95D3C7C8EBD2BF7A3B98504657E76574F1
          F23AF4AFDE8EE602590020000455B928AB710897097BA4DFE23937F0AF3EBA5C
          513BDDAFEE937F88E4DFC2BCFAE97144EF78ADFF001B43E997BE2DBC3CA10028
          B1604E92064813C59E87A7CB9B30DA1E6EB4A6CB2E64CC5EFF0035F73559DDAA
          8A67FDD3111FCA6226762AD9585ADB4E5674CCF7466F2E98899745E53E027B72
          CC7C4B5C4AE371C0EC6ADF37BB789AE9FF00653ED6E8CA9EE7160961345B672C
          F17ABDD51A71EC6E56316744FF00BAAE57DC59573D0BFDD344B16BDE534D94C4
          75CEA706693BF47E8E1396B30E3D6D45860B825FAFD5D73A5316161557AFE90B
          4ACA5C10761194A28AEC325595FEDACF969B5BFDA4DB55AFE7C9FC36A61396B0
          2C0AC7E0F82E0B72B859FF00D376B0A6CE3FF4C42AC5DE7A6592DD383BB799CE
          F36B11DD19F9AAEB29F03DDBE66C9A2BB1C9B6B8758D7A4FBE621694D8691D3A
          55CB2DD394FDCE0C6EDB896F9CF3EDDAED13A4D56370B09B4AA3EAE355C58FD3
          5777D3469F3328548B0A23A1935D34170BBBEBB489AE7E73FA464E74CA5C04F6
          19977896989E177FC72DA9D2666FB7998A667EAA68E2F27D5ACB71E5AD99E41C
          9D674D196727E1186CD31A71EEF74A29AFF3AB4D67F397A915622236324BB615
          72B9FB0B2A69F0FD5FCACECA28DD0FE91C90912F764002411AC1C6048C38D3F6
          1AC832D63A49AA18E801C69926667E7003400000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000D26
          53A4820D27A19690906311D29DC4CC46F471E98DF2663246B0F8B11C630DC32C
          A6D6FD7DB2B1888D74AAAE59FC9E2B18DAADD6CB5B2C22EB55B55FFDCB4E4A7F
          458716D25C3304A78D7CB5889EADB3F48D6FBA2CEAAF64360556D674471ABAE2
          988DF33C8F358CE7DC030A9AA8F84C5E2D23FC965FD5FACEE6ACC5B34E398CD5
          3F0CBF57C49FF4E89E2D31FA3F2746AAC6B85AAEBCECF0AB2CBFDAAFD23D5EBA
          2E996BAA5EC717DA66357ED6CF0FA69B9D94FCF1FD55FF00D9E4EF179BC5F2D2
          6DAF56F696B5CFF9ABAA665FCC6ABC4F1DC4718AF8D7DB69ABE59EAFA46A7AA9
          B3A68FC303616C8FE537EFB94FADAF5B0B647F29BF7DCA7D6BF707BF115DFBE7
          CA5F178F652D9B09446E4BAA616A0000001421B41E7818CF941B4EBF0BEF5086
          D079E0633E506D3AFC09A5F2E57E76574F1F23AF4AFDE8EE6141195F9D95D3C7
          C8EBD2BF7A3B980964008000115251546B1A0384BDD268D311C9BF8579F5C38A
          3966792169DC22B83247080C5303BC5EF3557845D708A2D29B4A2CEEB16B696B
          C698DD3354453BBA25F8594B804EC372FD545AE2D71C4B1FB6A3978D7FBDCC53
          33F72CE29A67EC98979ED2CA6BAF386ACC7744F10C5B14B4B7B3888A272D733F
          28E85685958DADBDA536361655DA5A573A534514CD55553F5446F6C1CA9C1F36
          CD9CEAA3FB0F6778C57675EEB5BC58FC1E8D3A75B4E2EB1F62D572C6CA767793
          6CE9B2CB192B07C36298D35BBDD28A667EB9988D665E9E2EF453C945114C46ED
          08BBC46D956BA7075446BBCDB4CFCA98FD655D594BDCF3DAB631C4B5CCD8DE11
          82D94F2CD345555E2D23EA988E2C44FE72DCF94FDCEFD99617345AE68C6F16C6
          6B8E5AA88B48B0B39FB38BFD5FCBACA8A78B1A3254A6CA9A7A1935D743F08BB6
          BE4B8D3FED39B5AE53E0EDB1CC99145781E40C2A8B6A375B5AD8C5ADA4FDB555
          AEAF7F77C3AE973B28B1BA5D2C6C688FF2D9D114C47E50FAC548D5B19058DD6C
          2EF19595114C7CA22185144531A33015C00011331071A012309AA750196B0719
          8E91BC0359000D20000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000D35004E929D2011A491
          1D2C9133A01A68963C7A5F26218C6198658FBF6217DB2B0A3A6BAB4D7EC8F9D4
          AD6DECEC289B4B5AA2223A675426226753ECD618D56B4511335551111BE65AFF
          0018DAADD2CA2AB2C1AE955BD5BA2D2D7FA69FCA37CFF0F118B66AC771AAA7E1
          B7EAFDEE7FD3A3FA69FD237FE6D7B8CF09984E1B9D9DDA66DABFF5D9F5F4CDE8
          A2ED5D5B75369E339F700C266AA3E15179B58FF4EC7FABF59DCF0F8C6D3719BF
          4556570A29B9D9CFCF1CB5FEAF1B3333296A7C67846C6715CE8B3AB92A27A29D
          BE33B5EBA2ED451B75BFA5E2F579BDD736B7AB7AED6B9DF55754CCBF92460969
          695DAD535DA4CCCCF4CEB95688CB6003E120003616C8FE537EFB94FADAF5B0B6
          47F29BF7DCA7D6CD383DF88AEFDF3E52A378F652D9B1B9288DC9754C2D400000
          02843683CF0319F28369D7E17DEA10DA0F3C0C67CA0DA75F8134BE5CAFCECAE9
          E3E475E95FBD1DCC28232BF3B2BA78F91D7A57EF4773012C8010000000000000
          08998838D009184D53F341ACF4832998838D0C748009AA7535900348DE000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000001A6A9D24109D253A42418C474A74D099D11C
          78F9CCC648D621F1DFF17C370DB29B5BF5EECEC698FF00AAA78AC636AB74B2E3
          5960F75AADEADD16969FD34FE9BE562C5F4930CC129E35F2D6299EADB33E1B5F
          7459D55CEA87BFAAD68A235AAAD23A65E7319CF997F0999A26F7EFF6B1FE9D94
          71A7F39DD0D598B66BC7B19998BDDFAA8B3FFEDD9FF4D3FF0077E3CFD4D538CF
          0B75D59D9E176597FB55E91FACBD745D3A6A97B3C6369D8D5F78D6586D145CAC
          A7938D1FD55FEB3C90F2379BCDE6F96936D7BB7B4B6B49DF55A55354FF002FE6
          3566298F6238CD5C6BEDACD5F2CF57D2353D5459D3447DD8005A1F6000000000
          0003616C8FE537EFB94FADAF5B0B647F29BF7DCA7D6CD383DF88AEFDF3E52A37
          8F652D9B1B9288DC9754C2D40000002843683CF0319F28369D7E17DEA10DA0F3
          C0C67CA0DA75F8134BE5CAFCECAE9E3E475E95FBD1DCC28232BF3B2BA78F91D7
          A57EF4773012C801000000031E37D49AB7318DC099AA7E646B20069A80000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000001CBD0009E2CA62011A4C914F4B244CE806
          91096335C44E9A3E4BFE31876196536D7FBDD9D85311FE6AB97F28DF2A56B6F6
          76344D7695444474CEA4E532FB3586355AD14471AB98888DF32F038C6D52E563
          C6B3C1EED55BCFCD695FF4D3F946F9787C5F3663D8CCCFC2AFD5459CFF00A747
          F4D2D7B8CF09984E1933677799B6AFAA9D9FFF005B3E99BD145DABAF6EA6D3C6
          B3E60184EB47C2A2DED63FC965CBFCBC3631B4EC62FBC6B2C3A8A6E9673F3C72
          D7FABC6E93BE6794D1AA319E11B18C573A2CAAE4A8EAA76FD76BD545DA8A3E6F
          ED78BDDEAF96936B7ABC5A5AD73CBAD756AFE291815A5A576B54D75CE733D32A
          F96400F948000000000000000000D85B23F94DFBEE53EB6BD6C2D91FCA6FDF72
          9F5B34E0F7E22BBF7CF94A8DE3D94B66C6E4A23725D530B50000000A10DA0F3C
          0C67CA0DA75F85F7A843683CF0319F28369D7E04D2F972BF3B2BA78F91D7A57E
          F47730A08CAFCECAE9E3E475E95FBD1DCC04B200400000031AB7223726ADC88D
          C000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000072FCD09E2C8208899F9B46511A2
          418C52C9133A46A8E3C7422662368C91ABE4BF62F8761B6536D7EBDD958D11F3
          D75443C5635B56B8D96B67835D6ABC55F35A5A6B4D1FA6F959316D23C3305A78
          D7CB68A67AB6CFD235BEE8B3AABD90F7D55A534C4CCF268F3D8DE7BCBF844556
          75DEE2DEDE9FF4AC7FAA75FAE7747E6D558BE6DC7F1A9AA9BDDFEBA6CA7FD2B3
          FE9A3F8DFF009BF1E22623486A9C6785BAAA89B3C2ACBFF6AFF4A7D5EBA2E91F
          9E5ECB17DA6E337DE359E1D6745CECE7938D1FD55CC7DBBBF8792BCDEAF57CB5
          9B6BDDE2D2DAD27FCD5D5332FE496ACC531EC4718AF8D7DB59ABE5D1E11B1EAA
          2CE9A3F0C23ED482CDB1F600900000000000000000000000006C2D91FCA6FDF7
          29F5B5EB616C8FE537EFB94FAD9A707BF115DFBE7CA546F1ECA5B36372511B92
          EA985A80000005086D079E0633E506D3AFC2FBD421B41E7818CF941B4EBF0269
          7CB95F9D95D3C7C8EBD2BF7A3B98504657E76574F1F23AF4AFDE8EE602590020
          0000018D5B911B9356E446E00000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000D2677400278BD
          2988D018C44CFCDA278B2C913C8091871FEA7CB7EC5EE186D9CDADFAF565634C
          46BFD5569FC28DADBD958D135DA5514C474CEA84C44CEC7D9AB1AAD69A235AA6
          2223E799783C636A971B2E35961376AADEA8E4F7CAFF00A69FFBBC3E2D9BB1DC
          66662F57DAA8B39FF4ECFF00A69FE1AFF19E12F08C333A2C266D6BEAA767D7D3
          357A2ED5D7B7536A6339EF2FE11136769798B6B58DD6765FD53FF6785C6769B8
          B5F38D658659D374B39FF34FF557EC78CE5DFAEF47CED518C70918CE29334D95
          5C951D54EDFAEDF27AE8BB514EBDAFED7ABE5EEFD6B36D7CBC5A5B573FE6AEA9
          997F2FAE4180DA5A576B571ED2739EB9DAAF96400F9480000000000000000000
          00000000000000D85B23F94DFBEE53EB6BD6C2D91FCA6FDF729F5B34E0F7E22B
          BF7CF94A8DE3D94B66C6E4A23725D530B50000000A10DA0F3C0C67CA0DA75F85
          F7A843683CF0319F28369D7E04D2F972BF3B2BA78F91D7A57EF47730A08CAFCE
          CAE9E3E475E95FBD1DCC04B200400000031AB7223726ADC88DC0000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000006933B9314CFCE08222AF9F46511A2418F17EB6430E3CF4233C8668D7
          487C97EC56E386D8CDBDFEF56561671FE6B4AA23FF00FAF178CED5AE36315596
          1174AEF35C7245A5A7F4D1F6C46F9FE164C5B48F0CC168E35F2DA299EACF39FA
          46B7DD367557B21EF26D6298D6AD223EB7E06319EF00C238D4577A8B7B58FF00
          4EC7FAA75FAE7735562D9BB1FC6A669BDDFAAA6CA7FD2B3FE9A7F8DFF9BF1B4E
          5D665AA719E16EA9CECF0AB2FF00DAAFD298FD67C1EBA2E9FDF2F698C6D3F17B
          DCCD9E19654DD2CE7FCDDD57FABC95EAF97ABEDA4DADEEF1696D5CCEB335D5AB
          F825AB314C7F12C62AE35F2DA6AF9679447746C7AA9B3A68FC3000B3BEC00000
          00000000000000000000000000000000000006C2D91FCA6FDF729F5B5EB616C8
          FE537EFB94FAD9A707BF115DFBE7CA546F1ECA5B36372511B92EA985A8000000
          5086D079E0633E506D3AFC2FBD421B41E7818CF941B4EBF02697CB95F9D95D3C
          7C8EBD2BF7A3B98504657E76574F1F23AF4AFDE8EE6025900200000018D5B911
          B9356E446E000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000239594469F3831D2AF9B44F17A59000C26BD274
          87CD7EC56E386D136B7DBD5958D311ACCD5568A56B6F67634CD7695444474CCE
          498899D8FAE58556914C6B331111D2F098CED5AE161C6B1C2AED55E6A8E4F7CA
          BFA68F6CBC362D9C31EC66669BCDF6AA2CA7FD2B2FE9A7F8E596BFC6B84AC1F0
          CCE8BBD5CAD71D14ECF1AB67D3357A2ED5D5B7536AE339EB00C1E268B5BD45B5
          B47FA565FD557B23F3785C676A38BDF38D6785D95173B39FF3CFF557FCF247F2
          F17A6BBCD1A9F19E12719C573A2C6AE468EAA76F8D5B7E993D745DA8A7E6FED7
          ABDDEEFD6D378BEDE6D6DED2ADF55A55354FF2FE3A24605696B5DAD535DA4CCC
          CF5ABC465AA001F0900000000000000000000000000000000000000000000000
          01B0B647F29BF7DCA7D6D7AD85B23F94DFBEE53EB669C1EFC4577EF9F2951BC7
          B296CD8DC9446E4BAA616A0000001421B41E7818CF941B4EBF0BEF5086D079E0
          633E506D3AFC09A5F2E57E76574F1F23AF4AFDE8EE6141195F9D95D3C7C8EBD2
          BF7A3B9809640080000006356E446E4D5B911B80000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000002235022356511A11
          1A1320944F23E6BE62374C3ECA6F17DBCD9D8D9C7CF5D510F178C6D56E1778AA
          CB09BBD579AB771EBFE9A3DB2B262DA458660B471AFB6D14CF574CF746D7DD36
          7557B21EEAAB48A759998888F9DF818CE7AC0B0789A2D2F54DB5AC6EB3B2FEA9
          FD77355E2D9BF1EC66662F37DAA8B39FF4ECFF00A69FFBBF1A796759DED538CF
          0B53AECF0BB2FF00DAAFD223F597AA8BA7F7BDA631B4FC56FBC6B3C36C69BA51
          3FE69E5ABFECF237BBEDEEFD6936D7CBCDA5B573F3D754CBF88D578A6906258C
          D5C6BEDACD5F2CF57D363D74D9D347E184689059F3CDF6000000000000000000
          0000000000000000000000000000000000000003616C8FE537EFB94FADAF5B0B
          647F29BF7DCA7D6CD383DF88AEFDF3E52A378F652D9B1B9288DC9754C2D40000
          002843683CF0319F28369D7E17DEA10DA0F3C0C67CA0DA75F8134BE5CAFCECAE
          9E3E475E95FBD1DCC28232BF3B2BA78F91D7A57EF4773012C8010000000C6ADC
          88DC9AB722370000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000CA218C72CE8CA67EB44CE431AABE2FCEF0F9AF68F77
          C32BB4B8613145BDE6358AAD27B8A27FE65FCF68D9B6D30FB2FEC7C3ED34BC5A
          D3ADAD713CB453D1F6CB56EF99999D665A734F34FAD30FB5AB0DC3272AE35555
          757CA3E7D6F658584551C6A9F5E238AE218B5B4DE310BDDA5B57F371AAE48FB2
          373E43F34B45DBDBDA5E2B9B5B5AA6AAA76CCCE732F7E5111940029000000000
          00000000000000000000000000000000000000000000000000000003616C8FE5
          37EFB94FADAF5B0B647F29BF7DCA7D6CD383DF88AEFDF3E52A378F652D9B1B92
          88DC9754C2D40000002843683CF0319F28369D7E17DEA10DA0F3C0C67CA0DA75
          F8134BE5CAFCECAE9E3E475E95FBD1DCC28232BF3B2BA78F91D7A57EF4773012
          C8010000000C6ADC88DC9AB72237000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000002698E5D5FC6F978A2ED76B5BC573
          1116744D53F943FB53BB579CCFD7B9B9E5ABE554CE93694C59FEB3A2DF8ADEFE
          C172B5BCFF0065333F487D5119D510D3B8ADFED313C46DEFD6B3ACDB573547D5
          1F347E8F991F5A5C6F6F6D5DE2D2AB5B49CEAAA6667C57888CA3280052480000
          00000000000000000000000000000000000000000000000000000000000000D8
          5B23F94DFBEE53EB6BD6C2D91FCA6FDF729F5B34E0F7E22BBF7CF94A8DE3D94B
          66C6E4A23725D530B50000000A10DA0F3C0C67CA0DA75F85F7A843683CF0319F
          28369D7E04D2F972BF3B2BA78F91D7A57EF47730A08CAFCECAE9E3E475E95FBD
          1DCC04B200400000031AB7223726ADC88DC00000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000CA9EE61E2F6A7693465FA
          688DD5DB53AFE5CAF674BC4ED5A26702B1D3FF00BD1AFE8C5F4D6669C02F531F
          D92AB63ED21A9C07252EC0000000000000000000000000000000000000000000
          000000000000000000000000003616C8FE537EFB94FADAF5B0B647F29BF7DCA7
          D6CD383DF88AEFDF3E52A378F652D9B1B9288DC9754C2D40000002843683CF03
          19F28369D7E17DEA10DA0F3C0C67CA0DA75F8134BE5CAFCECAE9E3E475E95FBD
          1DCC28232BF3B2BA78F91D7A57EF4773012C8010000000C6ADC88DC9AB722370
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000026978FDA8D9CD7972AAE23FF2ED689FD6747AFA67965E733F587C232C
          5F7935E25315FE92C7F4A6CB97C1AF3671D3455BA152CBF1C34A241C84BB8000
          0000000000000000000000000000000000000000000000000000000000000000
          00D85B23F94DFBEE53EB6BD6C2D91FCA6FDF729F5B34E0F7E22BBF7CF94A8DE3
          D94B66C6E4A23725D530B50000000A10DA0F3C0C67CA0DA75F85F7A843683CF0
          319F28369D7E04D2F972BF3B2BA78F91D7A57EF47730A08CAFCECAE9E3E475E9
          5FBD1DCC04B200400000031AB7223726ADC88DC0000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000004775F6BF3F305DBE1
          3835F6EFA6BC7B1AA3F87E84724EAC2F34C5A585A59E9DD5331FC3CD7CB18B7B
          BD7653D3131F584D3394E6E748DC97F6BED94D8DF2DEC6634E25AD54FE92FE2E
          2FB6A392B4AA89E89985E62738CC014D20000000000000000000000000000000
          000000000000000000000000000000000003616C8FE537EFB94FADAF5B0B647F
          29BF7DCA7D6CD383DF88AEFDF3E52A378F652D9B1B9288DC9754C2D400000028
          43683CF0319F28369D7E17DEA10DA0F3C0C67CA0DA75F8134BE5CAFCECAE9E3E
          475E95FBD1DCC28232BF3B2BA78F91D7A57EF4773012C8010000000C6ADC88DC
          9AB7223700000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000009AE39275F9D8CEE65FE544C66344E70BB7C17325FACA234
          89B59AA9FB2795F8EF5FB51BAFBCE618B788D22DEC6263F2E478F87206945D7E
          C58CDE6C7AAB9DF39AEF6539D109016254000000000000000000000000000000
          0000000000000000000000000000000000001B0B647F29BF7DCA7D6D7AD85B23
          F94DFBEE53EB669C1EFC4577EF9F2951BC7B296CD8DC9446E4BAA616A0000001
          421B41E7818CF941B4EBF0BEF5086D079E0633E506D3AFC09A5F2E57E76574F1
          F23AF4AFDE8EE6141195F9D95D3C7C8EBD2BF7A3B9809640080000006356E446
          E4D5B911B8000000000000000000000000000000000000000000000000000000
          00000000000000000000000000D600037A78B208000000000000000000000000
          0000000000000000000000000009E58654EE62CA9DDA74035BED72EBF21BE69C
          913559EBFCB5BC36F6D46EDF08CBD3694D3FD5616B4D5F97CED430E63E136EBF
          67C7EBAE3F3C455BB2FD173BB4E766901AF9E800000000000000000000000000
          00000000000000000000000000000000000000001B0B647F29BF7DCA7D6D7AD8
          5B23F94DFBEE53EB669C1EFC4577EF9F2951BC7B296CD8DC9446E4BAA616A000
          0001421B41E7818CF941B4EBF0BEF5086D079E0633E506D3AFC09A5F2E57E765
          74F1F23AF4AFDE8EE6141195F9D95D3C7C8EBD2BF7A3B9809640080000006356
          E446E4D5B911B800000000000000000000000000000000000000000000000000
          0000000000000000000000004C46A08D6065C58E848238B1F3C1A69B8D60D601
          220D63A412C6A8E5D53AC74A4180000000000000000000000000000000000000
          000000000002699E598414F740FC7CDD74F8665DBFD8446B3EF53547E5CBFF00
          0D130E89BED945BDDAD6C663FF00328AA9FD61CF97AB29B0BCDAD94C69345755
          3A7E6D0FC2FDD38B6F76BD65B6269FA4E7FABDD749D530FE4034D3DA00000000
          00000000000000000000000000000000000000000000000000000000003616C8
          FE537EFB94FADAF5B0B647F29BF7DCA7D6CD383DF88AEFDF3E52A378F652D9B1
          B9288DC9754C2D40000002843683CF0319F28369D7E17DEA10DA0F3C0C67CA0D
          A75F8134BE5CAFCECAE9E3E475E95FBD1DCC28232BF3B2BA78F91D7A57EF4773
          012C8010000000C6ADC88DC9AB72237000000000000000000000000000000000
          000000000000000000000000000000000002623538BF582197163E74A008888D
          C946B1D2C6D2D6CECE8AABAEBA69A6239666748844CC446726D65AC1354446BA
          C35FE6BDB2E51CB3C7B0A6F7F0FBD531A7BCDDE78DA4FD756E8699CD5B6CCDB9
          866BB0B95AFF00665D6AFF00258CFF005CC7D757B18B62DA6186613134D55F1E
          BFEDA75CFD764322C3345F11C4F2AA9A38B4F5D5AA3D65BF3346D1B2AE54A6AF
          ED5C4ECE2D62358B1B39E3DA4FE51FF2D4798B84662F79AEBB2CB58558DD6CF7
          536D79FEBAE7EBE2C6911FCB4FDA5ADADB5736B6F695DA5A553ACD554EB333F5
          CB16B3C574FB12BECCD3769E4A9F96B9F19F4C9B0F0DD08B85D222ABCFF52AF9
          EA8FA7ABD4623B50CFF89D5355BE68BED9F1BE6B0AFDE634FF00668F9EE3B41C
          EF87DBD378BBE6AC4E6699D74B4BCD7694CFDB4D53312FC018A558ADFAAAF949
          B6AB3EBE34FAB24A70BB8D147271634E5FF8C3AE36679C2739E58B0C52DA29A6
          F344CD8DE29A7771E3E78FB7925EBE37348F06CBD55561F8C5D27969B3B6B3AE
          23ED8AB5F5437753DCC3A1746EFD5E2385D8DE2D273AA635F7C6A68CC76E745C
          311B5BBD9FE189D5DD3AD8CF7413DD0BE2D20000000000000000000000000000
          0000000000000000011C950015EE9FADA2736DD7E0798AFF006311A47BECD54C
          7D52DF13B9A7769F75F78CC9EFDA6916F654D5FA727FC35670B175E5707A2DFA
          68AE37C4C7A3D574AB2AF27914A212E755C40000000000000000000000000000
          000000000000000000000000000000000000006C2D91FCA6FDF729F5B5EB616C
          8FE537EFB94FAD9A707BF115DFBE7CA546F1ECA5B36372511B92EA985A800000
          05086D079E0633E506D3AFC2FBD421B41E7818CF941B4EBF02697CB95F9D95D3
          C7C8EBD2BF7A3B98504657E76574F1F23AF4AFDE8EE6025900200000018D5B91
          1B9356E446E00000000000000000000000000000000000000000000000000000
          0000001311D208349E865C584831E2FD6988D1289988DE0944CC4238F4FF00D5
          0FCBC773260997AED37BC5F13B0BAD111C9C7AF49ABEC8DF2A76B6B458D335DA
          4C44474CBEA8A2AB4AB8B44673D50FD5E3474BE5BFE2172C3AC2ABD5F6F56561
          65446B55769544447EAD2F9B38445853C7BAE54C3E6D2AE588BCDBF253F6C53F
          3FE6D4598337662CCF6F36D8CE2B6D6FACF251C6D288FB298E460D8B69FE1F71
          CECEEDFD4AFE5F87EBD3E0CC30CD0ABF5F72AEF1FD3A7E7B7E9EADED9AB6FB97
          7098B4BB607635625788D638D13C5B389FB7E769BCD1B4ECDD9AEAAA8BEE255D
          8DDEAFF42C2668A7F3D3965E53725AC715D2CC4F16CE9AEBE2D1D54EA8FDDB13
          0CD17C3B0CCAAA28E355D756BDDB20E59D6677C80C6B6B22D8000023506F6E0D
          144FBC6396BF371EC69FE2A6F36A1E0E971AEEF95AF77DAA8D22F57BD23937C5
          31FF0076DD8DCE8AD0FB29B2C16C22AEACFEB332D0DA516B16D8BDBCC744E5F4
          888633DD00C996000000000000000000000000000000000000000000000009E4
          8113B819C72C35AED72EBA5771BDC53F35544CFF003FF2D951B9E336A376F7FC
          BDEFDA72D85B5356BF54EB1EC621A7775FB668FDE68E988E37D27356B09CAD21
          A8F780E515D40000000000000000000000000000000000000000000000000000
          000000000000006C2D91FCA6FDF729F5B5EB616C8FE537EFB94FAD9A707BF115
          DFBE7CA546F1ECA5B36372511B92EA985A80000005086D079E0633E506D3AFC2
          FBD421B41E7818CF941B4EBF02697CB95F9D95D3C7C8EBD2BF7A3B98504657E7
          6574F1F23AF4AFDE8EE6025900200000018D5B911B9356E446E0000000000000
          00000000000000000000000000000000000000004C4278B00C7494C427724111
          1A251AE84D511BE4128E3474B0AED6CE98E3556914C46F999D1E1736ED832865
          7AABB1AAFB17DBD53AC7BC5DA62B989E899DD1FABC97CBFDDAE1472979AE298F
          9BD176BA5BDF2BE4EEF44D53F27BC9AE888D66A8799CD5B42CAF94A899C5B14B
          18B588D62C289E35ACFF00B63963ED9E4683CD7B70CDB98B8F77C3EB8C2AEB56
          B1C5B09FFC4AA3EBAF7C7E5A35E5ADA5ADB5A556B6D5D5695D53ACD554EB333D
          3ACB5D62FC2358D9E7678751C69FEE9D51F4DACEF0BD02B7B5CABBFD7C58FED8
          D73F5D90DB99B3842E318845774CB1718C3EC6793E116BA576B31D311BA9FE5A
          B311C5712C5EF35DF314BF5BDEADEB9D66BB5AE6A9FAB7BE44B5A6258E5FF16A
          B8D7AB4998EAD91F486C1B860B72C329E2DDACE227AF6CFD64016A5D00000000
          010CECACABB7B5A2C6CE266BB4AA29A62237CCCB07B8D8DE5DEC873CDCFDF2CF
          8D77B86B7BB5E8FE9EE63CEE2BDB875CEAC42F56776A36D5311EAF1E217BA6E3
          75B4BCD5F96267D37BA4725E036796F2CE1D84514C45561634C5A69F3D73CB54
          FEB32FDE9963453A69A3299E574ED858D377B2A6CA8D94C4447839DAD6D2AB6B
          4AAD6B9CE6A9CE7C5002B3E00000000000000000000000000000000000000000
          00000001953B9F899CAE9F0BCB97FB2D35D2CA6BF3797FE1FB54BF8DF2C62F17
          5B6BBD5BAD28AA89FCE1E2C46EF17BBA5AD84FE6A663EB0FAA67298973B8CEF1
          673656F6965546934D53131F64B0718DA53345534CF46A5E76C6600F90000000
          0000000000000000000000000000000000000000000000000000000006C2D91F
          CA6FDF729F5B5EB616C8FE537EFB94FAD9A707BF115DFBE7CA546F1ECA5B3637
          2511B92EA985A80000005086D079E0633E506D3AFC2FBD421B41E7818CF941B4
          EBF02697CB95F9D95D3C7C8EBD2BF7A3B98504657E76574F1F23AF4AFDE8EE60
          25900200000018D5B911B9356E446E0000000000000000000000000000000000
          000000000013A482065C582234044474A7488480089988E59471A34D41333A1C
          6A7A5F9B8CE61C1701BBCDEB17C46C6ED6711FE7AA2267EC8F9DA8F35F086BAD
          871EEB95EE3F08AF745E2DB9298FAE23E75A313C76E184D39DEAD2227AB6CCF8
          2E570C22FB89D5C5BB59CCFCFA3EADCB7CBFDCEE56355BDEEF36763674C6B355
          754444359E6BDBDE5AC1F8F76C1A99C4EF34F244D1C96713F5D5F3FE4D0D98B3
          8E63CD16B36B8CE276B6D4CCF259C4F1688FB298E47E2C4359E2DC235BDB6746
          1D47163FBA75CFD3646F6C1C2F406CACF2AEFF005F1A7AA367D76CEE7AECD3B5
          3CE19AEAAECEF5885576BB57FF00D3DDE668A74E899DF2F23091AF2F77EBC5FE
          D395BCD73555F3967975B95DEE5472777A2298F9003CAF48000000000000000E
          86E0EF977E0597EF3982D6CF4B5C42D78967AC7FA54726BF9D5C6FD21CFD73BA
          5B5FAF96172BB51C6B5BC5A53654474D554E91EB76765AC1EC301C0EE3835DA2
          38973B1A6CB5E9988E59FCE7596C4E0EB0EE5EFD5DF26355119477CFED9B01D3
          EC4391BA5174A675D739CF747EEFD48E4863BD33C91A23737635280000000000
          00000000000000000000000000000000000000002699E59845713A14EF9653B9
          1319C64342E6BBAC5D331E216311A445BD55447D533AFF00CBF261EB769D75F7
          8CCF36DA725E2C68AFF4FE9FF879371EE925D7EC58BDE6C3AABABCF3F295DECA
          AE3511200B2AA000000000000000000000000000000000000000000000000000
          0000000000000D85B23F94DFBEE53EB6BD6C2D91FCA6FDF729F5B34E0F7E22BB
          F7CF94A8DE3D94B66C6E4A23725D530B50000000A10DA0F3C0C67CA0DA75F85F
          7A843683CF0319F28369D7E04D2F972BF3B2BA78F91D7A57EF47730A08CAFCEC
          AE9E3E475E95FBD1DCC04B200400000031AB7223726ADC88DC00000000000000
          0000000000000000000000009D253A4031D354C474A74D1208D2122012319AE2
          274944DA511BE519C19B29AA237A26BA63E7788CDDB5DC9995B8F636B8845F2F
          74727C1EEBA57544F4553BA9FCDA5F356DD336E3FC7BBE17551855D6AD634B19
          99B598FAEBF9BF2D18C62DA5D866139D35D7C6AFFB69D73E3D10C830CD18C471
          4CAAB3A38B47F755AA3C3A65BF333E7ECAD956CAAAB16C5ACA8B488D62C299E3
          5A4FFB63FE5A73357086C56F935DDB2BDCA9B9D9CF27BFDB44555CFD91BA1A86
          DADEDEF16955B5E2D6BB4B4AA759AABAA66667ED61F3B58E2FA7B885FF003A2E
          DFD2A7E5F8BEBE8D87866845C6E795779FEA55F3FC3F4F57D98A62F8A63579AA
          F78A5FADEF36B56FAAD2B997C70918457695DAD5355739CCF4CB32B3B3A2CA98
          A2CE3288E88007C3EC000000000000000000001B0F61997671BCED657DB5B3E3
          5861744DE2AE4E4E3EEA23F5999FF6BA8E88D29DCD57B00CBB385E539C5ED6CF
          4B6C52D26D235DFEF74F253FF33F9B6AC7243A0F42B0EFE1F84D1C68FBD5FDE9
          F1D9BB268CD2DBFF00DBF14B49A67EED1F763C36EF633AEA1AEBCA32D6340000
          0000000000000000000000000000000000000000000000098DE9963AE8CF7835
          96D76EBC5B6B85F2237D35D9CFE53131EB96BC6DADA95D7DFF002F5378D396C2
          F14D5AFD53AC7AE61A95CC3C25DD7ECDA41695C6CAE29AB765FA2E7769CECC01
          803D000000000000000000000000000000000000000000000000000000000000
          00003616C8FE537EFB94FADAF5B0B647F29BF7DCA7D6CD383DF88AEFDF3E52A3
          78F652D9B1B9288DC9754C2D40000002843683CF0319F28369D7E17DEA10DA0F
          3C0C67CA0DA75F8134BE5CAFCECAE9E3E475E95FBD1DCC28232BF3B2BA78F91D
          7A57EF4773012C8010000000C6ADC88DC9AB7223700000000000000000000000
          00000009D241069AB2D20D2201111D29D21200000899D11C7A5F9F8BE60C1B03
          BBD57AC5AFF6376B3A235D6D2A88FD3A5F169694595335573943EA9A6AAE78B4
          C672FD0E343F95E6FB75BAD9556D79B7A2CACE88D6AAAB988888FB5A6B35F087
          B8DDAAAEED956E537AAE3922DEDBFA6CFF0028DF2D3F9933B667CD76B35E338A
          DB5AD9CCEB16313C5B3A7ECA63FE58462FA7987DC33B3BBFF52AF96A8FAFA32E
          C3342F10BF655DB7F4E9F9EDFA7AB7CE6DDBD656C166BBBE0DC6C56F34EB11EF
          73A5944FD75FCFF96AD359AB6AF9CF35CD56379C466E974ABFFA7BAEB45331FF
          00F94EFABF39D3EA78EE54B58E2DA5F89E2D9D3557C4A27A29D5F5E996C4C2F4
          530EC332AA29E3D7D756BFA46C8469CA9062EC92350000000000000000000000
          000000FAB08C3ADB18C52EB855DE27DF2F76D4D8D3C9BB59D35FCB7BE56CFD80
          65D8C4F36D78C5B59EB6586D971A9998E4F7CAB923F8D573C1AE156257FB2BAC
          7E69D7DDB6772DD8BDFA30EB95A5E67F2C6AEFE8DEE89C1B0DB1C270DBAE1B77
          B3E2D95DACA9B2A23A222221F74EED134F730C6AD7574D59D11674C514EC8D4E
          79AAA9AE66A9DB200FB400000000000000000000000000000000000000000000
          0000000227E6FB59C6E612CE3703F0B3A5D66F796311B2D359A6C66D23EDA7FA
          BFE1A3235D1D137DB1A6F375B6BBD7DCDA51344FD931A39E6D689B3B4AACAA8D
          268AA6263A25A1785FBA716F576BD47E6A669FA4E7FABDF739D534B101A71EC0
          000000000000000000000000000000000000000000000000000000000000001B
          0B647F29BF7DCA7D6D7AD85B23F94DFBEE53EB669C1EFC4577EF9F2951BC7B29
          6CD8DC9446E4BAA616A0000001421B41E7818CF941B4EBF0BEF5086D079E0633
          E506D3AFC09A5F2E57E76574F1F23AF4AFDE8EE6141195F9D95D3C7C8EBD2BF7
          A3B9809640080000006356E446E4D5B911B8000000000000000000000013A4CA
          62018EF4C53D29D21208D212000319AA239419226746136B4D31ACEE878CCD9B
          5BC9D95E2BB2B7C422F57AA7FD0BBCC5756BF5CEE8796F77DBBDC6CF95BC5714
          D3D732AF76BADB5F2BE4EC299AA7AA2337B59AE21E7F3267BCB195ECAAAB16C5
          2CACAB88E4B289E3573F9434266ADBB66AC6F8F61844C61776AB923DEE75B498
          FAEAF9BF26B7BCDE2F37CB6AADEF36F5DADA553ACD55D53333FAB5DE2DC22D85
          8E76787D1C79FEE9D51E11B659CE19A0778B6CABBF55C48EA8D73E90DC19AB84
          2E21789AEEB95EE7176A27922DEDA35AF4E988F99AA716C6F17C76F137BC5F10
          B7BD5A553AEB695CCC47D91F33E1D12D6B89E3D8862D56779B4998EAD91F46C2
          C3B04B8E174C45DECE227AF6CFD51A241665D801200000000000000000000000
          0000000226748974F6C372E4E0D936C6F5694696D8855378AB5E89E4A7F873A6
          5BC1ED71EC7AE3845953354DEADA9A27EEEBCBFC6AECBC3AE745C6E76174B1A2
          29A2C68A68A623A22346CEE0DF0EE52DED2FD546AA7EEC77CEDDDE6D75A7F7FE
          258D9DCA9FCD3C69EE8D9BFC9F56E8DCC5954C5B89AB00000000000000000000
          00000000000000000000000000000000000654EE629A677C022A8D625A1734DD
          7E0799311BBE9A445E2BAA23EAABFAA3D6DF9313A4C34DED36E9F07CD15DA69C
          978B1A2D3F3EE7FF008C354F0B575E5709B3B78FC95C7D26263CF27AEE939579
          3CA084B9DD700048000000000000000000000000000000000000000000000000
          0000000000003616C8FE537EFB94FADAF5B0B647F29BF7DCA7D6CD383DF88AEF
          DF3E52A378F652D9B1B9288DC9754C2D40000002843683CF0319F28369D7E17D
          EA10DA0F3C0C67CA0DA75F8134BE5CAFCECAE9E3E475E95FBD1DCC28232BF3B2
          BA78F91D7A57EF4773012C8010000000C6ADC88DC9AB72237000000000000000
          988D4103288E9348E8044529D23A12000000C78F100C98CD70F8714C7B09C16E
          F55EB15BF58DD6CA98D66BB5AE2986A6CD9C21F0BBA4D776CA971AEFB6B1FEBD
          B6B45947D711BEAFE3ED5AB12C6AE38553C6BD5A447CB6CFD170B86157CC4EAE
          2DD6CE6AF9F47D763715BDF2C2ED6555B5BDA536767444D555554E914C74CCCB
          5B66DDBBE53C0E2BBBE115558B5EA377BD4E96513F5D7F3FE5AB42666CF39A73
          75ACD78D62D6B6967AEB16147F45953FED8E49FCF59FADF83A6BBDACF16E11ED
          AD33B3C3A8E2C7F755B7C236478E6D8186680D14E55E215E7FEB1B3C676CF864
          F699AB6B59C735457636B7E9B9DD6AFF00E9EED334D331F5CEF978CAA66A99AA
          A99999DF320D777CBFDE710B4E52F35CD53F3967B74B8DDAE3472777A2298F97
          EBD600F23D6000000000000000000000000000000000000022776E32CCD8DB7C
          1E72F7C371FBD63D6B671345C6CFDEECE67FEBABFECE8DA6348D1E0B63996FFB
          0324DCBDF28E2DBDF35BCDAEBBFF00AB747E8F79BA9746689E1D186615656731
          F7A638D3DF3FB3426925FF00F88E25696B1B2278B1DD0808E481922C40000000
          00000000000000000000000000000000000000000000000146F9134EF9064D63
          B5DBAC5378C3EF911CB34D76733FA4C7AE5B39E236A775F7ECBD45BC53ACD85B
          D356BD113AC7FCB0ED3DBAFDAB47EF11D311C6FF00F998956BBCE5690D4C0394
          D750000000000000000000000000000000000000000000000000000000000000
          001B0B647F29BF7DCA7D6D7AD85B23F94DFBEE53EB669C1EFC4577EF9F2951BC
          7B296CD8DC9446E4BAA616A0000001421B41E7818CF941B4EBF0BEF5086D079E
          0633E506D3AFC09A5F2E57E76574F1F23AF4AFDE8EE6141195F9D95D3C7C8EBD
          2BF7A3B9809640080000006356E446E4D5B911B800000001311AA62340629E2C
          A748E8482348E84800000226746155AC5313555C911CA6CD63FA30E3C3C7669D
          AC650CAD4D5677BC429B7BCC44E961779E3D5AFD7A72434C66BDBBE66C666BBB
          E0B4C6197799E4AA99E35ACC7DBF37E4C6B16D2BC330989A6D2BE3571F969D73
          E90BF619A3788629313654654FF74EA8FDFC1BEF31678CB5962C66BC6313B1B1
          AB4E4B38AB5AE7EC88E569DCD7C21AF9789AEED952E5163472C45E2DE35AA7EB
          8A7DAD3B7BBD5EAFF6D55E2F978B4B6B5AE75AABAEA9AA67F57F26B1C5F4FEFF
          007ECECEEBFD3A7EB57D7A3C1B130CD07B95D32AEF5FD4ABE91F4E97DF8C63D8
          CE3F799BDE3388DBDEED2677DA57AC47D91BA3F27C1F3EA9182DADADA5BD535D
          A4CCCCF4CEB96656565458531459C44447446A007C2A00000000000000000000
          00000000000000000000000FDAC99825798B3461F84D113316D6D4F1F4F9A88E
          59FE1F89F9373F074CBD16F7FBF664B6B3D69BBD316163331FE6AB7CC7E5EB5E
          B47B0F9C4F12B2BBF4679CF746B59B1FBFFF000DC3AD6DFA72CA3BE75437DDDA
          EF6777B0A2C6CA229A2CE98A6988F9A223487F5AA79620A77237BA569A6298CA
          1A03BC0120000000000000000000000000000000000000000000000000000000
          46F113F37DA0FE8FC0CEF74F86659C42CF4D78B6536911F5D3CBFF000FDE8DCF
          9EFF00634DE2E76F615F2D3694554CFE70F0E27778BDDCED6C27F353547D625F
          54CE5544B9DE129B4A26CAD2AB2ABBAA26699FB610E32AA99A26699E85E63600
          3E40000000000000000000000000000000000000000000000000000000000001
          B0B647F29BF7DCA7D6D7AD85B23F94DFBEE53EB669C1EFC4577EF9F2951BC7B2
          96CD8DC9446E4BAA616A0000001421B41E7818CF941B4EBF0BEF5086D079E063
          3E506D3AFC09A5F2E57E76574F1F23AF4AFDE8EE6141195F9D95D3C7C8EBD2BF
          7A3B9809640080000006356E446E4D5B9111A803288D120C78BF5B2000000000
          63555C57C588E358760F75AAFB8ADF6C2EB614EFAED6D2288FE5F35D74D11355
          53944269A66A9E2D319CBED9AB49D1FCADEF76376B2AADEDED68B3A288D6AAAB
          AB4888FB5A8336F087C1EE9C7BB656B9577EB58E4F845AC4D1651F5C477557F0
          D3B9973E66ACD969338C62B6B5596BAC58D9CF12CE9FB2986138B69E61D87E74
          584F295FCB678CFA32DC3343310BF655DB47274FCF6F847AB7E66CDBAE53C062
          BBBE1D55589DEA9E4E2D8CE9444FD757B1A6334ED7B38E67E358CDF7E0575AB5
          8F79BBEB4EB1F5CEF9789D3EB94B58E2DA6189E2B9D135F128EAA756FDAD8986
          689E1D86E55F178F5F5D5FA46C2AAAAAEA9AABAA6A999D6666794062D333339C
          B26D9AA00100000000000000000000000000000000000000000000000001A4CC
          C447CF3A3AD365797A32EE4AC3EE9551C5B6B5A3E116DAC72F1ABE5E5FCB4873
          6ECF3009CCB9C70DC2AAA38D6555AC5A5B7D5674F2CFAB4FCE1D8363674D3671
          4D3111111A4690DAFC1B61DED6FF00547FAC79CB5970817FD76571A7FF0029F2
          867BA9447226A9E588436CB5A000000000000000000000000000000000000000
          000000000000000000089480CA3731AA98989E5651B898E4944C67190D0599AE
          B373CC37FB09A74D2DEAAA23EA9E5FF97E646E7A9DA55D7E0F99ED2D229D22DE
          CE9AFED9DDFF0010F2EE3CD22BAFD8B16BC5DFFB6BABCF35E2CE78D444802CCF
          B0000000000000000000000000000000000000000000000000000000000001B0
          B647F29BF7DCA7D6D7AD85B23F94DFBEE53EB669C1EFC4577EF9F2951BC7B296
          CD8DC9446E4BAA616A0000001421B41E7818CF941B4EBF0BEF5086D079E0633E
          506D3AFC09A5F2E57E76574F1F23AF4AFDE8EE6141195F9D95D3C7C8EBD2BF7A
          3B9809640080000000000000112091FCE6D38BBF4D3A5E4734ED4F29E54A6AA6
          FD88D9DB5E22392C2C678F5CFE9BBF379AF57CBBDCACE6D6F15C534C74CCE4AD
          77BB5B5EABE4EC299AAAEA88CDEBFDF2227497E2660CE997F2BD84DE319C4AC2
          C223751356B5D5F6531CB2D0B9B76F598F199B4B0C0AC69C36EF56B115F756B3
          1F6EE86B3BD5F2F7885BD57ABF5E6D6DEDAB9E5AED2B9AAA9FCE5AF315E116ED
          619D9E1F4F1EAEB9D54FACB39C3340EF36F9577EAB894F546B9F48DEDCD9B784
          55E2DE6BBAE52C3A2CA9D748BCDE6359FCA8F6CFE4D4B8CE61C6F315E66F98DE
          276F7CB5F9A6D2BE4A7EC8DD1F943F392D698A6906218BD5FF00EAB4998EA8D5
          1F4E9F16C2C3702B8E151FFE7A233EB9D73F5F447D49059A75ED5DB288D80024
          00000000000000000000000000000000000000000000000000046BA6F494D355
          754534C6B3331111F59119CE50899888CE5BC7838E5D988C4733DB51CB3A5D2C
          2663ECAABFFE3FCB7AD3BB95E6B67997BB18CA18661155114DA5958C556DD336
          9572D5FCCCBD2CC690E94D1CC3BF85E1B65779DB9673DF3AE5CFB8E5FE712C42
          D6F1D133947746A844EF017C5A80000000000000000000000000000000000000
          00000000000000000000001953B8AB74B1A37CB306AFDAD5D78B78B8DF298EEA
          9AACEA9FD261AFDB5F6A974F7DC0ECEF31FE85B44CFD93C8D50E5EE126EBF66D
          21B5AA365714D5BB2FD173BB4E767000C0DE8000000000000000000000000000
          0000000000000000000000000000000001B0B647F29BF7DCA7D6D7AD85B23F94
          DFBEE53EB669C1EFC4577EF9F2951BC7B296CD8DC9446E4BAA616A0000001421
          B41E7818CF941B4EBF0BEF5086D079E0633E506D3AFC09A5F2E57E76574F1F23
          AF4AFDE8EE6141195F9D95D3C7C8EBD2BF7A3B980964008000000018D5571419
          31AAAD1F16218C5C309BB557CC4AFB6376B0A37D76B5C531FCB55E6DE10B83DC
          38F74CB574AAFF006D1C9EFD5FF4D947D71F3CFF000B5E238CDC70BA38D7AB48
          A7E5D33E0F7DC30BBE6275716EB67357CFA3EBB1B72DAF765614556B6D69459D
          14C6B355531111F9B5EE6ADB9654CBF15D85CED7FB4AF54EB1C4B19FE989FAEA
          682CC9B41CD59AABABFB5313B48B299E4B1B39E2D11F946F79CD356B5C5B847A
          EBCECF0EA328FEEAB6F847AB60617A034D395788579FFAC7EB3E8F759AB6C79B
          F337BE58D17AF805D6BFF46EF3A4E9F5D5BE5E1EAAAAAEA9AEBAA6AAAA9D6666
          759996296B9BEE237AC4ABE52F55CD53F3F4E867B73B85DAE1472776A2298F97
          FF006B4689078DEC000000000000000000000000000000000000000000000000
          0000000000001EBB65197BB23CF387DDABA38D6176ABE156FD1C5A39623F3AB8
          B0F2133A72B7F7073CBB376C2AFD98EDACFF00AEF969161653A72F128DFF00AD
          5EA645A29877F13C5ACACA7F0C4F1A7BA35F9B1FD27BFF00F0FC32D2B8DB31C5
          8EF9D5BA35B74514F242667E629E48E544EF7473438000000000000000000000
          00000000000000000000000000000000000000000269DF2C9846F660F3F9E2E9
          F0ACB37FA34D669A38F1F6C72B473A1B13B1A6F171BC58D51AC5765547F0E7BB
          5B39B2AEBB29DF45534CFE4D07C2EDD7897BBBDEA3F35331F49FDDEFB9CEA984
          088DC969E7B00000000000000000000000000000000000000000000000000000
          000000006C2D91FCA6FDF729F5B5EB616C8FE537EFB94FAD9A707BF115DFBE7C
          A546F1ECA5B36372511B92EA985A80000005086D079E0633E506D3AFC2FBD421
          B41E7818CF941B4EBF02697CB95F9D95D3C7C8EBD2BF7A3B98504657E76574F1
          F23AF4AFDE8EE60259002000044A58D5B81F8F98B36E0395AEDF0AC7314B0BAD
          33AF169AE7FAABFAA9A63967F269ECD7C232DAD62BBAE53C362889D69F84DE63
          59FB69A2393F5D7EC470958FFF009382CF4D169EB86926A2D30D2EC42E77DAEE
          17598A29A72D7D339C67E0D9BA2DA2D71BE5D28BEDE73AA673D5D1194E5E2FD2
          C6B31E3998AF337AC6714BC5EAD26758E3D7C94FD94EE8FCA1F9A91AC2D6DAD2
          DEB9B4B4AA6667A65B1ECAC6CEC298A2CA98888E880053540000000000000000
          000000000000000000000000000000000000000000000000006565636B79B7B3
          BB5851C7B4B5AA28A298F9EA99D223F9764E4DC0ECF2EE5AC3F07B3A7E4D614D
          354E9BEAD35AA67EB99D5CDDB18CBDFDBD9E2EB5DAD9F1AC2E1ADE6BE4E4D639
          29FE675FC9D5944690DC3C1B61DC4B0B4BF551AEA9E2C7746DDED55A7F7FE52D
          ECEE74CEAA6339EF9FD8AA748D1055CB2367B5E0000000000000000000000000
          000000000000000000000000000000000000001AE92CDFCE7E6FB59C6E0635C4
          4C4B41E64BB45CB1DBF5DB4D38B6F54FEBCBFF002DFD31C92D31B47BAFC1F33D
          AD71BADA8A6BFCDA9F85ABA72B85D95E23F257BA625EBBA5595730F2C9073D2E
          0000000000000000000000000000000000000000000000000000000000000361
          6C8FE537EFB94FADAF5B0B647F29BF7DCA7D6CD383DF88AEFDF3E52A378F652D
          9B1B9288DC9754C2D40000002843683CF0319F28369D7E17DEA10DA0F3C0C67C
          A0DA75F8134BE5CAFCECAE9E3E475E95FBD1DCC28232BF3B2BA78F91D7A57EF4
          773012C801000031AB7326356E112D0DC25BE5182FDCB4F5C348E8DDBC25FE51
          82FE1DA7AE1A4DCF5A6DEFBB6F0FF986F2D0FF0073D978F9C8031464E0000000
          0000000000000000000000000000000000000000000000000000000000022652
          FEF70B95B6237DB0B85DE35B4BC5A53674C7D733A3EA8A2AB4AE28A76CEA7CD7
          5D3674CD756C8D6E81E0F797BE01972DF1CB4A34B4C42D34A6663FD3A7923F9D
          65B7A9E4A5F9796F07B2C1704B9617654F168BB58D367A7D711CAFD49E48D1D3
          582DC230CB8D95DA3F2C467DFB677B9E715BE4E217CB4BCCFE699CBBBA372397
          E701745BC0000000000000000000000000000000000000000000000000000000
          000000009651B98B2A77013CAD5FB5BBB4517CB95EE2392AA2AA27EBE5D5B45E
          136AD75F7DC12CAF3A72D8DB47F31A30CD3FBB7DAF47EF14F4D31157D26255AE
          F395A43550884B95575000000000000000000000000000000000000000000000
          0000000000000001B0B647F29BF7DCA7D6D7AD85B23F94DFBEE53EB669C1EFC4
          577EF9F2951BC7B296CD8DC9446E4BAA616A0000001421B41E7818CF941B4EBF
          0BEF5086D079E0633E506D3AFC09A5F2E57E76574F1F23AF4AFDE8EE6141195F
          9D95D3C7C8EBD2BF7A3B98096400800018D5B9931AB7089685E12FF28C17F0ED
          3D70D26DD9C25FE5182FE1DA7AE1A4DCF5A6DEFBB6F0FF00986F2D0FF73D978F
          9C8031464E000000000000000000000000000000000000000000000000000000
          000000000000362EC2F2F7F6CE72A2FF006967C6B1C3689B69D63FCD3C94B5CC
          BA5760B97A9C2B284E276B6734DB62569EF9ACFF00D11C94FF00CB2CD0BC37F8
          8E2D67C68CE9A3EF4F86CDEC5F4BF10FB0E195C533F7ABFBB1E3B77368D9EE27
          96534F25288D7E77423478000000000000000000000000000000000000000000
          0000000000000000000000009A3E7414EF9066F399EEE9F0ACB37DA698D668A7
          DF23F297A37C78AD845E70FBCDDE635F7CB2AA9D3ED85BF16BB45F2E36D613F9
          A9AA373EA99CAA8973CC4CEEE8649B5A3DEED2AB398E5A6669FD18B8D2BA6689
          9A67A178480F9480000000000000000000000000000000000000000000000000
          00000000D85B23F94DFBEE53EB6BD6C2D91FCA6FDF729F5B34E0F7E22BBF7CF9
          4A8DE3D94B66C6E4A23725D530B50000000A10DA0F3C0C67CA0DA75F85F7A843
          683CF0319F28369D7E04D2F972BF3B2BA78F91D7A57EF47730A08CAFCECAE9E3
          E475E95FBD1DCC04B20040000C6ADCC98D5B844B42F097F9460BF8769EB86936
          ECE12FF28C17F0ED3D70D26E7AD36F7DDB787FCC379687FB9ECBC7CE4018A327
          0000000000000000000000000000000000000000000000000000000000000000
          007D982E1B6D8CE2F73C2AEF4CD5697AB6A6CE223EB9767611865861786DDB0F
          B1A2228BB5953674E9F5468E76D8065EFED2CD7698C5A59F1ACB0DB3D626777B
          E55C91FF0032E95A63486E9E0E70EE42E55DF2B8D75CE51DD1FBB5169E621CBD
          F69BA533AA88D7DF3FB644E91C9084CEF4363B04000000000000000000000000
          000000000000000000000000000000000000000000131BD046F066C2D2989866
          8AB4D3951319C6439FF305D66E78DDF6ED31A4516F5C47EAF81E9768975F8366
          8BC4FCD6B4D3691F5EB1CAF34E39C7AEBF62C52F161FDB5D5E6BC59CF1A98005
          A5F6000000000000000000000000000000000000000000000000000000000361
          6C8FE537EFB94FADAF5B0B647F29BF7DCA7D6CD383DF88AEFDF3E52A378F652D
          9B1B9288DC9754C2D40000002843683CF0319F28369D7E17DEA10DA0F3C0C67C
          A0DA75F8134BE5CAFCECAE9E3E475E95FBD1DCC28232BF3B2BA78F91D7A57EF4
          773012C801000031AB7326356E112D0BC25FE5182FE1DA7AE1A4DBB384BFCA30
          5FC3B4F5C349B9EB4DBDF76DE1FF0030DE5A1FEE7B2F1F3900628C9C00000000
          0000000000000000000000000000000000000000000000000000000425FA5967
          06B5CC1982E18358C72DEADE8B39FAA9D6359FCA3555B1B1AEF1694D951B6A98
          88F153B6B5A6C2CEAB5AF644673DD1B5D1DB0ECBBFD8992AC2F36D65A5BE2354
          DE6A99DFC5DD4C7E9CBF9B63EEA791FC2E174B1B95D2CAE96144536763674D9D
          111F35311A43FB55D0E9DC36E74DC2E96776A7653110E75BF5EAABF5E6BBC55B
          6A999400F73CA000000000000000000000000000000000000000000000000000
          000000000000000227E64A2419C1546B046E277226721AB76B574E25FEE77C88
          D22BB39A3F389D7FE5E09B4F6AB759B4C1EEF7B88D7DE2DB4FCA63FECD570E5D
          E11EEBF66D20B5988FC71157D63D735CEED39D9C24060AF40000000000000000
          000000000000000000000000000000000000000000D85B23F94DFBEE53EB6BD6
          C2D91FCA6FDF729F5B34E0F7E22BBF7CF94A8DE3D94B66C6E4A23725D530B500
          00000A10DA0F3C0C67CA0DA75F85F7A843683CF0319F28369D7E04D2F972BF3B
          2BA78F91D7A57EF47730A08CAFCECAE9E3E475E95FBD1DCC04B20040000C6ADC
          C98D5B844B42F097F9460BF8769EB86936ECE12FF28C17F0ED3D70D26E7AD36F
          7DDB787FCC379687FB9ECBC7CE4018A327000000000000000000000000000000
          000000000000000000000000000000000436E7078CBBF0DC7AF7986DACB5B3B8
          59C59594CC7FA95FCF1F65313E7351CE9F3BAB763997632E646B8D95AD9F16DE
          FB1F0CB6D77EB5E9311F95314B34D03C37EDD8AC5AD51F76CE38DE3D1BD87E9B
          5FFEC786CD9533F7AD272F0E9FFEF9BDD51A69C8899D66597CCC5BF1A5C00000
          0000000000000000000000000000000000000000000000000000000000000000
          001953B92C699DF0C81E6F3EDD3E1595EFB1A72D9C45A47E531AFF001AB496B1
          3F33A0F18BBC5EB0BBD5D669D7DF6C6BA3F58973F574CD35D54EED2661A0385D
          BA459DFAEF79FEEA663E93FBAE1739CE26100350BD6000000000000000000000
          0000000000000000000000000000000000003616C8FE537EFB94FADAF5B0B647
          F29BF7DCA7D6CD383DF88AEFDF3E52A378F652D9B1B9288DC9754C2D40000002
          843683CF0319F28369D7E17DEA10DA0F3C0C67CA0DA75F8134BE5CAFCECAE9E3
          E475E95FBD1DCC28232BF3B2BA78F91D7A57EF4773012C801000031AB7326356
          E112D0BC25FE5182FE1DA7AE1A4DBB384BFCA305FC3B4F5C349B9EB4DBDF76DE
          1FF30DE5A1FEE7B2F1F3900628C9C00000000000000000000000000000000000
          00000000000000000000000000403F73256015667CD586E0B14CCD16F6D4FBEF
          D5671FD557F113FC3B22C2CACECACE9B3A2988A698888888D348683E0E7977DF
          AF988E67B6A234B1A62EB613F5CE935CFF00ED8FCE5BFE88D296F2E0F70EFB26
          1B378AE3EF5A4E7E11AA3F569AD38BFC5EB11E4299FBB671978CEDFD0AB97910
          6BACC8CF98600000000000000000000000000000000000000000000000000000
          0000000000000000000146F966C69DEC81FCED238D4E9A6F680C76EB372C66F9
          75D3FF002EDABA63ECD791D05546B0D2BB42BAFC1B355EA62348B68A6D23F388
          D7F9D5A9785CBA72986D8DE72FC15E5F58FD9EBB9CE554C3CD00E7C5C0000000
          0000000000000000000000000000000000000000000000000006C2D91FCA6FDF
          729F5B5EB616C8FE537EFB94FAD9A707BF115DFBE7CA546F1ECA5B36372511B9
          2EA985A80000005086D079E0633E506D3AFC2FBD421B41E7818CF941B4EBF026
          97CB95F9D95D3C7C8EBD2BF7A3B98504657E76574F1F23AF4AFDE8EE60259002
          00006356E64C6ADC225A1784BFCA305FC3B4F5C349B767097F9460BF8769EB86
          9373D69B7BEEDBC3FE61BCB43FDCF65E3E7200C5193800000000000000000000
          00000000000000000000000000000000000000008E599888E59925E9B66D97E7
          32E72C3B0FAA8E359516B16F6DF728E5E5FCF48FCDE9B9DDABBE5E28B0A36D53
          11F579EF779A6E7615DE2BD94C4CFD1D27B2FCB9196B25E1F70AA98A6DABB3F7
          EB6FBF5F2CFAF4FC9EBB752C6C68A68B38A698D2223488E865572F23A7AE976A
          2E76145859ECA62223C1CEB78B6AAF36B55B57B6A999FAA007A5440000000000
          000000000000000000000000000000000000000000000000000000000000008D
          ECD86BA68CC11546B0D59B5ABAF1312B9DF22392D6CA68F3675FFE4DA73B9E07
          6AF74F7CC22EB7B8E5F7AB7E24FD51544FB2184F08776FB568F5E232FC3955F4
          98FD15AEF395A435700E585D4000000000000000000000000000000000000000
          0000000000000000006C2D91FCA6FDF729F5B5EB616C8FE537EFB94FAD9A707B
          F115DFBE7CA546F1ECA5B36372511B92EA985A80000005086D079E0633E506D3
          AFC2FBD421B41E7818CF941B4EBF02697CB95F9D95D3C7C8EBD2BF7A3B985046
          57E76574F1F23AF4AFDE8EE6025900200006356E64C6ADC225A1784BFCA305FC
          3B4F5C349B767097F9460BF8769EB869373D69B7BEEDBC3FE61BCB43FDCF65E3
          E7200C5193800000000000000000000000000000000000000000000000000000
          00000021BD783965DE2D8E2199EDA8D26D27E0F61331F3472D531F6CE91F9346
          59D9D56B694D959D3335D754534C47CF33B9D859032FD396F2A61F8644695D9D
          8C5569F5D73CB32CFB83CC3BED788CDEAA8D5671BE76306D3BBFFD9EE3176A67
          5DA4EE8DBBF27A3A792372279594CF2316F188CB534FC0025200000000000000
          000000000000000000000000000000000000000000000000000000000089671B
          98B28DC09799DA0DDBE11956FBA46B5594536B1FEDAA267F8D5E99F0E31758BF
          6197BB9CFF00AF635D9FEB130B6631758BE61F6F779FCD4551B9F7673C5AA25C
          FBBB784CF4C8E36AA329C9780040000000000000000000000000000000000000
          0000000000000000003616C8FE537EFB94FADAF5B0B647F29BF7DCA7D6CD383D
          F88AEFDF3E52A378F652D9B1B9288DC9754C2D40000002843683CF0319F28369
          D7E17DEA10DA0F3C0C67CA0DA75F8134BE5CAFCECAE9E3E475E95FBD1DCC2823
          2BF3B2BA78F91D7A57EF4773012C801000031AB7326356E112D0BC25FE5182FE
          1DA7AE1A4DBB384BFCA305FC3B4F5C349B9EB4DBDF76DE1FF30DE5A1FEE7B2F1
          F3900628C9C00000000000000000000000000000000000000000000000000000
          00000403D96C9B2F76459D6E5635D1C6B1BACFC26D758E4D29DDFCBAD2CE34A6
          223768D35C1D72E7C1F08BE661B5A3FAEF75FBD59CE9FE4A77FF002DCD4F2437
          DE8261BF60C2A9B4AA3EF5A4F1BC3A1A4B4C710FB6E2755113F768FBB1FAEF2A
          DE8066AC50000000000000000000000000000000000000000000000000000000
          000000000000000000000654EE629A3E7FB41930B48D634D19B1AB722622A8CA
          4D8E7DC6EEBF03C62FB7488D22CADEBA623EAE34E9FC3E27A4DA15D7E0B9AEF7
          311A45B4516B11F6D3113FCC4BCE38DF1CBACDCB12BC5DFF00B6BAA37AF344F1
          A989005ADF400000000000000000000000000000000000000000000000000000
          03616C8FE537EFB94FADAF5B0B647F29BF7DCA7D6CD383DF88AEFDF3E52A378F
          652D9B1B9288DC9754C2D40000002843683CF0319F28369D7E17DEA10DA0F3C0
          C67CA0DA75F8134BE5CAFCECAE9E3E475E95FBD1DCC28232BF3B2BA78F91D7A5
          7EF4773012C801000031AB7326356E112D0BC25FE5182FE1DA7AE1A4DBB384BF
          CA305FC3B4F5C349B9EB4DBDF76DE1FF0030DE5A1FEE7B2F1F3900628C9C0000
          000000000000000000000000000000000000000000000000000006777B0B5BDD
          E2CAED634CD55DAD7145311D333A307BBD8B65DFEDECED77B4B4A35B0B844DE6
          D26639358EE63F5D1EEC32E556237BB3BAD1F9A623D773C588DF29B85D2D2F15
          7E589FDB7BA4B27E076597B2EDC308B3A74F8358D34D5F5D5A6B3FCBF66A99D3
          91167BB42675974ED8595361674D951B222223C1CEF696955AD736956D99CC01
          55F0000000000000000000000000000000000000000000000000000000000000
          000000000000000269F9D098DE0C8113AE9C80D57B59BAF1314B9DEE2392D6CA
          AA27EDA675FF00E4F08DA3B5BBAF1F08BADEE98E5B2B7E2CFD9544FF00CC4357
          396B845BAFD9B486DA72FC5955F58F5895D2EF39D9C003075700000000000000
          00000000000000000000000000000000000000001B0B647F29BF7DCA7D6D7AD8
          5B23F94DFBEE53EB669C1EFC4577EF9F2951BC7B296CD8DC9446E4BAA616A000
          0001421B41E7818CF941B4EBF0BEF5086D079E0633E506D3AFC09A5F2E57E765
          74F1F23AF4AFDE8EE6141195F9D95D3C7C8EBD2BF7A3B98096400800018D5B99
          31AB7089685E12FF0028C17F0ED3D70D26DD9C25FE5182FE1DA7AE1A4DCF5A6D
          EFBB6F0FF986F2D0FF0073D978F9C8031464E000000000000000000000000000
          000000000000000000000000000000899746F07ACB9370CB56D8E5B51A5AE236
          9A51C9FE9D3C91FACEBFA39EAE172B5C4AFD77C3EC299AAD6F1694D9D111D333
          A3B3B2E613638160D73C26C22228BAD8D367C9F3CC472CFE73ACB63F0718772F
          7CAEF95C6AA2328EF9F48601A7D7FE4AEB45CE99D75CE73DD1FBBF462348426A
          D74E44374B530000000000000000000000000000000000000000000000000000
          0000000000000000000000000006BA4C089DF00FE8003CC6D0EEBF0ACAD7C888
          E5B3E2DA47FB6627DAD2DA6910E80C6EED17CC2AF7749FF56C6BA7F5873FCEB1
          33130E7EE176E9C9DFEC2F31F9A9CBE93FBAE1749CE998006A37AC0000000000
          000000000000000000000000000000000000000000006C2D91FCA6FDF729F5B5
          EB616C8FE537EFB94FAD9A707BF115DFBE7CA546F1ECA5B36372511B92EA985A
          80000005086D079E0633E506D3AFC2FBD421B41E7818CF941B4EBF02697CB95F
          9D95D3C7C8EBD2BF7A3B98504657E76574F1F23AF4AFDE8EE602590020000635
          6E64C6ADC225A1784BFCA305FC3B4F5C349B767097F9460BF8769EB869373D69
          B7BEEDBC3FE61BCB43FDCF65E3E7200C51938000000000000000000000000000
          0000000000000000000000000000899D01B2360F972719CE54E236D471AC30BB
          39B7E58D63DF279288F5CFE4E9FA2346B0D81E5C9C232746296B67316F8ADA4D
          BF2C72C59C7F4D11FC4CFE6D9F1AC472C3A1342F0DFE1D84D9F1A3EF57F7A7C7
          66EC9A2B4AEFFF00C4314B4AA27EED1F763C36EFCC99E54032C6380000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00001200CB7A511B920FE76B4C554CC4C724C68E7EC6AED374C5EF976DDEF76D
          5C47D9AF23A0EADCD27B40BAFC17345EF4A748B5E2DA47E71A7FC351F0BB75E3
          E1F63798FCB565F58F587AEE9395530F3A039F97000000000000000000000000
          00000000000000000000000000000001B0B647F29BF7DCA7D6D7AD85B23F94DF
          BEE53EB669C1EFC4577EF9F2951BC7B296CD8DC9446E4BAA616A0000001421B4
          1E7818CF941B4EBF0BEF5086D079E0633E506D3AFC09A5F2E57E76574F1F23AF
          4AFDE8EE6141195F9D95D3C7C8EBD2BF7A3B98096400800018D5B9931AB70896
          85E12FF28C17F0ED3D70D26DD9C25FE5182FE1DA7AE1A4DCF5A6DEFBB6F0FF00
          986F2D0FF73D978F9C8031464E00000000000000000000000000000000000000
          00000000000000003ECC170AB7C7318B960F778FFC4BE5BD1634CE9AE9ACC44C
          FE51CAF8A5B5383E65CFED3CD16F8E5AD9CCD961765A51AFFF0072BE48FD2227
          F55D305B84E277FB2BAF4553AFBA36EE5B718BF461B71B4BCF4C46AEF9D51BDD
          13855C2ED865C2EF87DCECE28B0BAD95363671D14D31111EA7D552288D21333A
          BA6A8A628A6298D90E7A999AA739400FA4000000000000000000000000000000
          000000000000000000000000000000000000000000000000000268DCC98D1F3C
          32044C6B0D51B57BAFBDE2B75BD453A7BF594D33F94FFDDB5E75D391E036B375
          E3E1B75BDC472D95AF167EC9860FC22DD7ED5A3F6D96DA72ABE92AD779CAD21A
          BC072D2EA0000000000000000000000000000000000000000000000000000003
          616C8FE537EFB94FADAF5B0B647F29BF7DCA7D6CD383DF88AEFDF3E52A378F65
          2D9B1B9288DC9754C2D40000002843683CF0319F28369D7E17DEA10DA0F3C0C6
          7CA0DA75F8134BE5CAFCECAE9E3E475E95FBD1DCC28232BF3B2BA78F91D7A57E
          F4773012C801000031AB7326356E112D0BC25FE5182FE1DA7AE1A4DBB384BFCA
          305FC3B4F5C349B9EB4DBDF76DE1FF0030DE5A1FEE7B2F1F3900628C9C000000
          000000000000000000000000000000000000000000000001133A43A9762196E3
          03C9175B7B4A38B6F88EB7BB4D77E957731E6C439BF2B609699873161F83D113
          3F09B7A69AF4F9A8DF54FE912ECCB8DDECEEB76B3BB595314D1654C514C47CD1
          11A368706D874576D6B7EAA3553F763BE75CB5BF0817FE2D9D95CA9E9FBD3DDB
          21FDA7929426A437035780000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000269DFF006B261AE930CC0797
          DA25D7E1595EF5A472D9716D35E8D25EA1F9B8FDDBE1983DF2ED31AFBE59551F
          C2D78DDDA2F9875BD84FE6A2A8DCFBB39E2D512D0333101544C4CC4C4EB1BC71
          BD51C59C97800400000000000000000000000000000000000000000000000000
          003616C8FE537EFB94FADAF5B0B647F29BF7DCA7D6CD383DF88AEFDF3E52A378
          F652D9B1B9288DC9754C2D40000002843683CF0319F28369D7E17DEA10DA0F3C
          0C67CA0DA75F8134BE5CAFCECAE9E3E475E95FBD1DCC28232BF3B2BA78F91D7A
          57EF4773012C801000031AB7326356E112D0BC25FE5182FE1DA7AE1A4DBB384B
          FCA305FC3B4F5C349B9EB4DBDF76DE1FF30DE5A1FEE7B2F1F3900628C9C00000
          000000000000000000000000000000000000000000000044A5126D1B8383B65D
          F866337DCC36D67AD174B3F79B2998E4E3D5CB3FC69FABA1A88D1E2764396E72
          F649B8D9574C536D79A7E116BAC72EB572E9F943DBF730E8DD14C3BF86615656
          531AE6339EF9682D23BFFF0011C4AD6DA27544E51DD08F9F50191AC800000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000089DF0FE8FE73D2FE803F95AD1C6B3AA99DD31312FEA8AA3587CD
          54C55194913939EB17B0F82E297ABB4C7FE5DB551FCBE57EFE7EBAFC17345EE2
          234F7D98B4FD61F80E37C6AEDF63C46DEC3FB6BAA37AF344E74C4802D8FA0000
          000000000000000000000000000000000000000000000001B0B647F29BF7DCA7
          D6D7AD85B23F94DFBEE53EB669C1EFC4577EF9F2951BC7B296CD8DC9446E4BAA
          616A0000001421B41E7818CF941B4EBF0BEF5086D079E0633E506D3AFC09A5F2
          E57E76574F1F23AF4AFDE8EE6141195F9D95D3C7C8EBD2BF7A3B980964008000
          18D5B9931AB7089685E12FF28C17F0ED3D70D26DD9C25FE5182FE1DA7AE1A4DC
          F5A6DEFBB6F0FF00986F2D0FF73D978F9C8031464E0000000000000000000000
          000000000000000000000000000003F7722E075E63CD787617144D54576D155A
          7DC8E597E13757074CBBC7BCDFB325B596B14445DAC6663E79E5AA617CD1BC3F
          F89E276561D19E73DD1AD65D21BFFF000EC3AD6DA275E59477CB7CDDACE8B1B2
          A2CACE98A69A298A6223E68867514469108F9F5749D3111194340F7802400000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000001946E629A675806489DC94553A40353ED56E9EF58BDDEF711
          C96D65A4FDB12F10D9BB59BAF1EE174BDE9CB676B34CCFD530D64E57E10AEBF6
          5D20B7CB655955F585D6EF571ACE001852B00000000000000000000000000000
          00000000000000000000000D85B23F94DFBEE53EB6BD6C2D91FCA6FDF729F5B3
          4E0F7E22BBF7CF94A8DE3D94B66C6E4A23725D530B50000000A10DA0F3C0C67C
          A0DA75F85F7A843683CF0319F28369D7E04D2F972BF3B2BA78F91D7A57EF4773
          0A08CAFCECAE9E3E475E95FBD1DCC04B20040000C6ADCC98D5B844B42F097F94
          60BF8769EB86936ECE12FF0028C17F0ED3D70D26E7AD36F7DDB787FCC379687F
          B9ECBC7CE4018A32700000000000000000000000000000000000000000000000
          00002226A98A698D66674888F9DD75B30CBD196F26E1F709A34B5AACE2DAD793
          7D5572B9B366B97E732673C3AE1559F1AC68B4F7EB6E4FF253CB2EBDB1A78B44
          531111111F336CF06D876AB5BFD5FF008C79CB5870817FCEBB2B953D1F7A7CA1
          9CCE90C5354A1B5DAD8000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000004D1B909A7E70648480F2BB
          46BAC5E32C5E2AD359B29A6D3F49FF00BB4CB7EE61BB45F306BE5DE7FCF63569
          F6E9AB40CC4C4CD33BE274973E70B975E4F11B1BC47E6A72FA4FEEB8DD273A66
          2520352BD4000000000000000000000000000000000000000000000000000361
          6C8FE537EFB94FADAF5B0B647F29BF7DCA7D6CD383DF88AEFDF3E52A378F652D
          9B1B9288DC9754C2D40000002843683CF0319F28369D7E17DEA10DA0F3C0C67C
          A0DA75F8134BE5CAFCECAE9E3E475E95FBD1DCC28232BF3B2BA78F91D7A57EF4
          773012C801000031AB7326356E112D0BC25FE5182FE1DA7AE1A4DBB384BFCA30
          5FC3B4F5C349B9EB4DBDF76DE1FF0030DE5A1FEE7B2F1F3900628C9C00000000
          0000000000000000000000000000000000000000409B3A2BB5B4A6CA88D6AAEA
          8A63F54C44CCE508998A75CEC6F6E0E397A2CEEF7FCCB6D67FD56B3176B1AA7A
          2396A9F537851B9E7B21E5FA32DE55C3B088A229AECEC62AB5FAED2796AFE65E
          867923474A68EE1F18661B6577E988CE7BE75CB9F71BBF7F12BFDADE3A267577
          46A8400BDAD40000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000002637A113BE01FD0007F2B6A22AB39
          A27962A898973EE2961375C4AF57798D3DEED6A8D3F3742D51AC347E7ABB7C17
          345F69D3FF0032A8B4FD6356A1E176E9C7B8585E23F2D531F58FD9ECBA4FDE98
          7E080D00F78000000000000000000000000000000000000000000000000000D8
          5B23F94DFBEE53EB6BD6C2D91FCA6FDF729F5B34E0F7E22BBF7CF94A8DE3D94B
          66C6E4A23725D530B50000000A10DA0F3C0C67CA0DA75F85F7A843683CF0319F
          28369D7E04D2F972BF3B2BA78F91D7A57EF47730A08CAFCECAE9E3E475E95FBD
          1DCC04B20040000C6ADCC98D5B844B42F097F9460BF8769EB86936ECE12FF28C
          17F0ED3D70D26E7AD36F7DDB787FCC379687FB9ECBC7CE4018A3270000000000
          0000000000000000000000000000000000000044BD9EC8B2F4E62CF171B1AECF
          8D61749F855AF27269469A47E73A43C6BA0B83A65DF8360B7DCC36B67A5A5F6D
          3DE6CA66397DEE8DFF00AD5AF9AC9744B0DFE278AD9D9CC7DDA678D3E1AF7CB1
          ED29BFFF000FC32D2A89FBD57DD8F1FD9B8ACA98888E56533CA534F1637A37BA
          2E1A1E3E60024000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000044EF8480CC446E4822ADDCAD49B5
          5BAC59635637988D22DAC635FB6274F536D57133B9AF76B7759AAE573BDC53DC
          5A5544CFDB1FF660BC23DD7ED5A3D6D96DA72ABE93FBABDDA72B486B301CB8BA
          0000000000000000000000000000000000000000000000000000D85B23F94DFB
          EE53EB6BD6C2D91FCA6FDF729F5B34E0F7E22BBF7CF94A8DE3D94B66C6E4A237
          25D530B50000000A10DA0F3C0C67CA0DA75F85F7A843683CF0319F28369D7E04
          D2F972BF3B2BA78F91D7A57EF47730A08CAFCECAE9E3E475E95FBD1DCC04B200
          40000C6ADCC98D5B844B42F097F9460BF8769EB86936ECE12FF28C17F0ED3D70
          D26E7AD36F7DDB787FCC379687FB9ECBC7CE4018A32700000000000000000000
          000000000000000000000000001120FEB77BBDADEAF16576B0A38F6B6D5C59D1
          4FFD554CE910ECCCA782D8E5DCBF87E0B611C974B0A6CEA9D3BAAB4FEA9FCE75
          9FCDCDDB11CBDFDB99EAED79B5B39AAEF865337AAFA38F1C94479D3AFE4EA6A2
          2222346E2E0DF0EE4EEF697EAB6D53947746DDFE4D51A7F7FE56F16772A67553
          19CF7CFEDE6CAADCC77154CEA36735F000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000000000032A6
          7584B1A373201E53691748B7CAF6F69A6BEF355369FCE9FF002F56FCACC976F8
          66057EBBE9AF1AC2AD23EB88D63D4B463D768BE6196F613F9A8ABC9F7673C5AE
          25A13EC09898E41C733194E4BC00000000000000000000000000000000000000
          00000000000000D85B23F94DFBEE53EB6BD6C2D91FCA6FDF729F5B34E0F7E22B
          BF7CF94A8DE3D94B66C6E4A23725D530B50000000A10DA0F3C0C67CA0DA75F85
          F7A843683CF0319F28369D7E04D2F972BF3B2BA78F91D7A57EF47730A08CAFCE
          CAE9E3E475E95FBD1DCC04B20040000C6ADCC98D5B844B42F097F9460BF8769E
          B86936ECE12FF28C17F0ED3D70D26E7AD36F7DDB787FCC379687FB9ECBC7CE40
          18A327000000000000000000000000000000000000000000000113B92FA70DB8
          5BE2B885DB0CBB53336B7AB5A6CA8FB6674D5F545155A551453B67543E6BAE9B
          3A66BAB643A1783D65CFECFCAD6B8CDB51C5B5C4ED78D4CE9CBEF747253FCF1A
          7F36D988D21F9B97F0CB1C1B09B9E1777A78B6775B1A6CA98FB2347E954E9BC1
          EE34E1B71B2BAD3F9637F4EF73B6257C9C42F76979ABF34E7E1D1B98EBAF286E
          1737880000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000134F27232631BD900FE56D4535D9D5
          4551C9544C4BFAB1AF73E6AA62B8CA473C623779BA5FEF1769DF676B553FA4CC
          3F83F773C5D7E099A2FD67A7775FBE47FBA35FF97E138D316BB4DCEFF6D613F9
          6AAA37AF344E74C4802DEFA00000000000000000000000000000000000000000
          00000001B0B647F29BF7DCA7D6D7AD85B23F94DFBEE53EB669C1EFC4577EF9F2
          951BC7B296CD8DC9446E4BAA616A0000001421B41E7818CF941B4EBF0BEF5086
          D079E0633E506D3AFC09A5F2E57E76574F1F23AF4AFDE8EE6141195F9D95D3C7
          C8EBD2BF7A3B98096400800018D5B9922ADDB81A1384B7CA305FB969EB86936F
          CE121855B5B6198662D674CCD176B5AACAB9E88AA2263D52D05F6B9FB4E6CEAA
          31BB59AA36C44C7D21BBB432D29AF08B38A7A3389FAA40620CA8000000000000
          0000000000000000000000000000000006CAD82E5E9C5B38FF0069DAD9F1AC70
          DB39B4D66393DF2AE48FE356B49E474E6C1F2E461193ACEFF6D67A5B6255CDBC
          CCEFE26EA7F865DA1586FF0010C5A89AA3EED1F7A7C366F62DA617FF00B0E195
          C533F7ABFBB1E3B77364D9E9099DE988A69DD087413480000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000001F3C337F39DF0FE802262261289DC0D47B54BACD8E3B6378D34
          8B7B08999FAE99989FE3478C6CADADDD666E970BE69FF9769559CCFDE8D7FF00
          8CB5AB957840BA4DD3486F1196AAA62AFAC47EABADDEAE359C0030C560000000
          000000000000000000000000000000000000000001B07647F29BFF00DCA7D6D7
          CD97B24B95745DAFB7FAA3FA6BAA2CE9FAF4E59FF8671C1CD9D569A456134C6C
          E34CF7652A3789CACE5B12372511B92EA55A80000005086D079E0633E506D3AF
          C2FBD421B41E7818CF941B4EBF02697CB95F9D95D3C7C8EBD2BF7A3B98504657
          E76574F1F23AF4AFDE8EE602590020000469AA407E2E6AC02E799B04BDE0D7CA
          7FF0EF347178D1BE8ABE6AA3EC9724E6BCAD8AE51C5AD70BC4EC2AA668999B3B
          4D3FA6D69D792A89767CD3156F7E3664CAB81E68B94DC31BC3ECEF1673ACD335
          47F5513D313BE2588E94E8B59E9059C5744F16D69D93D71D52C9747348ED303B
          49A6A8E359D5B63ABE70E3089D52DF58A706EC3AD6D66BC231EB6BBD133C9676
          D6715E9F9C3F3FFBB5DFBE6CCB63E865AAAD341F1BB3AB8B1659FCE263D5B2A8
          D33C1EBA6266D263BE27D1A546EAFEED77FF00092C7D0C9FDDAEFF00E1258FA1
          97C732B1BEC77C7ABEF9E18376BBA7D1A546EAFEED77FF00092C7D0C9FDDAEFF
          00E1258FA1939958DF63BE3D4E7860DDAEE9F46951BABFBB5DFF00C24B1F4327
          F76BBFF84963E864E65637D8EF8F539E18376BBA7D1A546EAFEED77FF092C7D0
          C9FDDAEFFE1258FA1939958DF63BE3D4E7860DDAEE9F46951BABFBB5DFFC24B1
          F4327F76BBFF0084963E864E65637D8EF8F539E18376BBA7D1A546EAFEED77FF
          00092C7D0C9FDDAEFF00E1258FA1939958DF63BE3D4E7860DDAEE9F46951BABF
          BB5DFF00C24B1F4327F76BBFF84963E864E65637D8EF8F539E18376BBA7D1A54
          6EAFEED77FF092C7D0C9FDDAEFFE1258FA1939958DF63BE3D4E7860DDAEE9F46
          951BABFBB5DFFC24B1F4327F76BBFF0084963E864E65637D8EF8F539E18376BB
          A7D1A546EAFEED77FF00092C7D0C9FDDAEFF00E1258FA1939958DF63BE3D4E78
          60DDAEE9F46951BABFBB5DFF00C24B1F4327F76BBFF84963E864E65637D8EF8F
          539E18376BBA7D1A546EAFEED77FF092C7D0C9FDDAEFFE1258FA1939958DF63B
          E3D4E7860DDAEE9F46951BABFBB5DFFC24B1F4327F76BBFF0084963E864E6563
          7D8EF8F539E18376BBA7D1A546EAFEED77FF00092C7D0C9FDDAEFF00E1258FA1
          939958DF63BE3D4E7860DDAEE9F46951BABFBB5DFF00C24B1F4327F76BBF7CF9
          92C7D0C9CCAC73B1DF1EA73C306ED774FA352601855AE378D5CF09B0A666ABD5
          B5367C9D133CBFC3B370BB9D961F72B0B8D8D314D161674D9D311D111A358E40
          D894E4FCC3678E5F315B3BE7BD515459D34D131C5AA7E7E56D8A69888E486CCD
          08C02DF06B0B4AEF54E56954ECF947AB5E698637638B5E28A6ED567674C776B9
          DA998D51A4B219D31063A49A4B2018E92692C8063A49A4B2018E92692C8063A4
          9A4B2018E92692C8063A49A4B2018E92692C8063A49A4B2018E92692C8063A49
          A4B2018E92692C8063A49A4B2018E92692C8063A49A4B2018E92692C8063A49A
          4B2018E92692C8063A49A4B2018E92692C8063A49A4B2018E92692C8063A49A4
          B2018E92692C8063A49A4B2018E92692C8063A49A4B2018E92692C8063A49A4B
          2018E92692C8063A49A4B2018E92692C8061C5966002277240792DA5DD62F195
          ADED229D66C2D28B588FCF4F54CB4E37FE3986C62D85DE70FE3451F08B39A22A
          9F9A6774FEBA3C0C6C92F1F3E2F673FF00EB9695E11344B12C6712A2F570B3E3
          47162275C46B89F9BDB76B6A68A72A9AF86C2ED4778EFB59FA393B51DE3BED67
          E8E580FF002F348BFC7DF1EAF472F67D6D7A36176A3BC77DACFD1C9DA8EF1DF6
          B3F4727F2F348BFC7DF1EA72F67D6D7A36176A3BC77DACFD1C9DA8EF1DF6B3F4
          727F2F348BFC7DF1EA72F67D6D7A36176A3BC77DACFD1C9DA8EF1DF6B3F4727F
          2F348BFC7DF1EA72F67D6D7A36176A3BC77DACFD1C9DA8EF1DF6B3F4727F2F34
          8BFC7DF1EA72F67D6D7A36176A3BC77DACFD1C9DA8EF1DF6B3F4727F2F348BFC
          7DF1EA72F67D6D7A36176A3BC77DACFD1C9DA8EF1DF6B3F4727F2F348BFC7DF1
          EA72F67D6D7A36176A3BC77DACFD1C9DA8EF1DF6B3F4727F2F348BFC7DF1EA72
          F67D6D7A36176A3BC77DACFD1C9DA8EF1DF6B3F4727F2F348BFC7DF1EA72F67D
          6D7A36176A3BC77DACFD1C9DA8EF1DF6B3F4727F2F348BFC7DF1EA72F67D6D7A
          36176A3BC77DACFD1C9DA8EF1DF6B3F4727F2F348BFC7DF1EA72F67D6D7A3617
          6A3BC77DACFD1C9DA8EF1DF6B3F4727F2F348BFC7DF1EA72F67D6D7A36176A3B
          C77DACFD1C9DA8EF1DF6B3F4727F2F348BFC7DF1EA72F67D6D7A36176A3BC77D
          ACFD1C9DA8EF1DF6B3F4727F2F348BFC7DF1EA72F67D6D7A36176A3BC77DACFD
          1C9DA8EF1DF6B3F4727F2F348BFC7DF1EA72F67D6D7A36176A3BC77DACFD1C9D
          A8EF1DF6B3F4727F2F348BFC7DF1EA72F67D6D7A36146C92DE7FFEDECFD1CBEA
          B9EC9AEB675C557FC4AD2D29FF00A68A78BFCAA597073A4569545336397CE6A8
          F544DE2CE3A5E0306C1AFD8DDF68B95CECE666A9FEAABE6A69E9996F1C130AB0
          C1B0EB1C3EEF1FD3674E933FF54FCF261182E1D835DFE0D70BAD1654EF9988E5
          ABED9F9DFA3111F34373685685D968CD9CDB5A55C6B6AB54CF4447547EB2F15B
          5BCDAEAE8480CF9400000005086D079E0633E506D3AFC2FBD421B41E7818CF94
          1B4EBF02697CB95F9D95D3C7C8EBD2BF7A3B98504657E76574F1F23AF4AFDE8E
          E60259002000000044C44EF84808E2C741C58E84808E2D3D07169E84808E2D3D
          07169E84808E2D3D07169E84808E2D3D07169E84808E2D3D07169E84808E2D3D
          07169E84808E2D3D07169E84808E2D3D07169E84808E2D3D07169E84808E2D3D
          07169E84808E2D3D07169E84808E2D3D07169E84808E2D3D07169E84808E2D3D
          07169E84808E2D3D07163A120238B1D0900C8000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000113113BCD2120238B4F41C5A7A120238B4F41C5A7A120238B4F
          41C5A7A120238B4F41C5A7A120238B4F41C5A7A120238B4F41C5A7A120238B4F
          41C5A7A120238B4F41C5A7A120238B4F41C5A7A120238B4F41C5A7A120238B4F
          41C5A7A120238B4F41C5A7A120238B4F41C5A7A120238B4F41C5A7A120238B4F
          41C5A7A120238B4F41C5A7A12023488262277C2404689000000000001421B41E
          7818CF941B4EBF0BEF5086D079E0633E506D3AFC09A5F2E57E76574F1F23AF4A
          FDE8EE6141195F9D95D3C7C8EBD2BF7A3B980964008000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000001421B41E7818CF941B4EBF0BEF5086D079E0633E506D3A
          FC09A5F2E57E76574F1F23AF4AFDE8EE6141195F9D95D3C7C8EBD2BF7A3B9809
          6400800000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000001421B41E7818CF941B4E
          BF0BEF5086D079E0633E506D3AFC09A5F2E58E76374F1F23AF4AFDE898E2C72B
          FCFC67DC89B4EBAED433262B8564BCCD656D678EDF2DAEF6F6386DE22AA662F1
          5CD35D35453BF74C4C3F569CE9C2DE234FEDCDA9F9F7EF606D5F9EB1D26B1D2A
          0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B
          35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD78
          5BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FD
          FCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36
          A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9
          F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFB
          D8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D
          9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC
          2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7E
          FE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B
          53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FC
          FBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFD
          EC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B03
          25F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E
          5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1
          D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749A
          C74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2
          A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837
          B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD7
          85BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16F
          DFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F3
          6A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F
          9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DF
          BD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61
          D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766B
          C2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7
          EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9
          B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4F
          CFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EF
          DEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0
          325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97
          E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B
          1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749
          AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D
          2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A83
          7B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD
          785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16
          FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F
          36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9
          F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7D
          FBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF6
          1D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766
          BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B
          7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF
          9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4
          FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3E
          FDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B
          0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C9
          7E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96
          B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC74
          9AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1
          D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A8
          37B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DEC
          D785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E1
          6FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7
          F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA
          9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7
          DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF
          61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD876
          6BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0
          B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFB
          F9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D
          4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3
          EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7
          B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C
          97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F9
          6B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC7
          49AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B
          1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A
          837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DE
          CD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E
          16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF
          7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCD
          A9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D2A11DA0F3C0C67CA0DA75F87
          F3ECD385BF7F36A7E7DFBD8FC9C9191B6A37EDA765FC6318C9B99EDEDEDB1DBA
          5BDE6F36F86DE26AAEA9BC5135575D534FDB33322763FFD9}
        mmHeight = 23813
        mmLeft = 167750
        mmTop = 265
        mmWidth = 28310
        BandType = 0
        LayerName = BandLayer4
      end
    end
    object ppDetailBand3: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
      object ppDBText6: TppDBText
        DesignLayer = ppDesignLayer3
        UserName = 'DBText6'
        Border.mmPadding = 0
        DataField = 'produto'
        DataPipeline = ppDBPedidoProduto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPedidoProduto'
        mmHeight = 4233
        mmLeft = 58214
        mmTop = 529
        mmWidth = 70656
        BandType = 4
        LayerName = BandLayer4
      end
      object ppDBText7: TppDBText
        DesignLayer = ppDesignLayer3
        UserName = 'DBText7'
        Border.mmPadding = 0
        DataField = 'qtdecompra'
        DataPipeline = ppDBPedidoProduto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPedidoProduto'
        mmHeight = 4233
        mmLeft = 129652
        mmTop = 529
        mmWidth = 15875
        BandType = 4
        LayerName = BandLayer4
      end
      object ppDBText10: TppDBText
        DesignLayer = ppDesignLayer3
        UserName = 'DBText10'
        Border.mmPadding = 0
        DataField = 'valorunidade'
        DataPipeline = ppDBPedidoProduto
        DisplayFormat = '$####,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPedidoProduto'
        mmHeight = 4233
        mmLeft = 146321
        mmTop = 529
        mmWidth = 20638
        BandType = 4
        LayerName = BandLayer4
      end
      object ppDBText28: TppDBText
        DesignLayer = ppDesignLayer3
        UserName = 'DBText101'
        Border.mmPadding = 0
        DataField = 'valortotalproduto'
        DataPipeline = ppDBPedidoProduto
        DisplayFormat = '$####,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPedidoProduto'
        mmHeight = 4233
        mmLeft = 168017
        mmTop = 529
        mmWidth = 25938
        BandType = 4
        LayerName = BandLayer4
      end
      object ppLine7: TppLine
        DesignLayer = ppDesignLayer3
        UserName = 'Line1'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        mmHeight = 1054
        mmLeft = 1058
        mmTop = 5292
        mmWidth = 194998
        BandType = 4
        LayerName = BandLayer4
      end
      object ppDBText2: TppDBText
        DesignLayer = ppDesignLayer3
        UserName = 'DBText1'
        Border.mmPadding = 0
        DataField = 'identificador'
        DataPipeline = ppDBPedidoProduto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPedidoProduto'
        mmHeight = 4233
        mmLeft = 1058
        mmTop = 529
        mmWidth = 23548
        BandType = 4
        LayerName = BandLayer4
      end
      object ppDBText3: TppDBText
        DesignLayer = ppDesignLayer3
        UserName = 'DBText3'
        Border.mmPadding = 0
        DataField = 'datacompra_1'
        DataPipeline = ppDBPedidoProduto
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPedidoProduto'
        mmHeight = 4233
        mmLeft = 24606
        mmTop = 529
        mmWidth = 31221
        BandType = 4
        LayerName = BandLayer4
      end
    end
    object ppFooterBand3: TppFooterBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppSystemVariable5: TppSystemVariable
        DesignLayer = ppDesignLayer3
        UserName = 'SystemVariable3'
        Border.mmPadding = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 151342
        mmTop = 794
        mmWidth = 17727
        BandType = 8
        LayerName = BandLayer4
      end
      object ppSystemVariable6: TppSystemVariable
        DesignLayer = ppDesignLayer3
        UserName = 'SystemVariable4'
        Border.mmPadding = 0
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 173832
        mmTop = 794
        mmWidth = 16404
        BandType = 8
        LayerName = BandLayer4
      end
      object ppLine8: TppLine
        DesignLayer = ppDesignLayer3
        UserName = 'Line6'
        Border.mmPadding = 0
        Pen.Width = 2
        Weight = 1.500000000000000000
        mmHeight = 265
        mmLeft = 265
        mmTop = 265
        mmWidth = 194734
        BandType = 8
        LayerName = BandLayer4
      end
    end
    object ppSummaryBand3: TppSummaryBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
    end
    object ppGroup1: TppGroup
      BreakName = 'fornecedor'
      DataPipeline = ppDBPedidoProduto
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      KeepTogether = True
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDBPedidoProduto'
      NewFile = False
      object ppGroupHeaderBand1: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        Border.mmPadding = 0
        mmBottomOffset = 0
        mmHeight = 11642
        mmPrintPosition = 0
        object ppShape2: TppShape
          DesignLayer = ppDesignLayer3
          UserName = 'Shape2'
          Brush.Color = clTeal
          Pen.Style = psClear
          mmHeight = 4763
          mmLeft = 265
          mmTop = 6877
          mmWidth = 195794
          BandType = 3
          GroupNo = 0
          LayerName = BandLayer4
        end
        object ppShape8: TppShape
          DesignLayer = ppDesignLayer3
          UserName = 'Shape8'
          mmHeight = 6336
          mmLeft = 265
          mmTop = 264
          mmWidth = 195794
          BandType = 3
          GroupNo = 0
          LayerName = BandLayer4
        end
        object ppLabel33: TppLabel
          DesignLayer = ppDesignLayer3
          UserName = 'Label33'
          AutoSize = False
          Border.mmPadding = 0
          Caption = 'Fornecedor:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
          FormFieldSettings.FormFieldType = fftNone
          Transparent = True
          VerticalAlignment = avCenter
          mmHeight = 4763
          mmLeft = 1321
          mmTop = 1054
          mmWidth = 26458
          BandType = 3
          GroupNo = 0
          LayerName = BandLayer4
        end
        object ppDBText4: TppDBText
          DesignLayer = ppDesignLayer3
          UserName = 'DBText4'
          Border.mmPadding = 0
          DataField = 'fornecedor'
          DataPipeline = ppDBOrcamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          VerticalAlignment = avCenter
          DataPipelineName = 'ppDBOrcamento'
          mmHeight = 4763
          mmLeft = 28838
          mmTop = 1054
          mmWidth = 165100
          BandType = 3
          GroupNo = 0
          LayerName = BandLayer4
        end
        object ppLabel6: TppLabel
          DesignLayer = ppDesignLayer3
          UserName = 'Label6'
          AutoSize = False
          Border.mmPadding = 0
          Caption = 'Produto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
          FormFieldSettings.FormFieldType = fftNone
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 57156
          mmTop = 7142
          mmWidth = 72775
          BandType = 3
          GroupNo = 0
          LayerName = BandLayer4
        end
        object ppLabel34: TppLabel
          DesignLayer = ppDesignLayer3
          UserName = 'Label34'
          AutoSize = False
          Border.mmPadding = 0
          Caption = 'Qtde.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
          FormFieldSettings.FormFieldType = fftNone
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 129651
          mmTop = 7142
          mmWidth = 16935
          BandType = 3
          GroupNo = 0
          LayerName = BandLayer4
        end
        object ppLabel38: TppLabel
          DesignLayer = ppDesignLayer3
          UserName = 'Label38'
          AutoSize = False
          Border.mmPadding = 0
          Caption = 'Valor Uni.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
          FormFieldSettings.FormFieldType = fftNone
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 146321
          mmTop = 7143
          mmWidth = 21698
          BandType = 3
          GroupNo = 0
          LayerName = BandLayer4
        end
        object ppLabel39: TppLabel
          DesignLayer = ppDesignLayer3
          UserName = 'Label39'
          AutoSize = False
          Border.mmPadding = 0
          Caption = 'Valor Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
          FormFieldSettings.FormFieldType = fftNone
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 168015
          mmTop = 7142
          mmWidth = 26998
          BandType = 3
          GroupNo = 0
          LayerName = BandLayer4
        end
        object ppLabel8: TppLabel
          DesignLayer = ppDesignLayer3
          UserName = 'Label8'
          AutoSize = False
          Border.mmPadding = 0
          Caption = 'Pedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
          FormFieldSettings.FormFieldType = fftNone
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 1055
          mmTop = 7144
          mmWidth = 23548
          BandType = 3
          GroupNo = 0
          LayerName = BandLayer4
        end
        object ppLabel32: TppLabel
          DesignLayer = ppDesignLayer3
          UserName = 'Label32'
          AutoSize = False
          Border.mmPadding = 0
          Caption = 'Data Compra'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
          FormFieldSettings.FormFieldType = fftNone
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 24606
          mmTop = 7144
          mmWidth = 31233
          BandType = 3
          GroupNo = 0
          LayerName = BandLayer4
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        Background.Brush.Style = bsClear
        Border.mmPadding = 0
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object ppShape7: TppShape
          DesignLayer = ppDesignLayer3
          UserName = 'Shape7'
          mmHeight = 4498
          mmLeft = 168011
          mmTop = 0
          mmWidth = 25929
          BandType = 5
          GroupNo = 0
          LayerName = BandLayer4
        end
        object ppDBCalc8: TppDBCalc
          DesignLayer = ppDesignLayer3
          UserName = 'DBCalc8'
          Border.mmPadding = 0
          DataField = 'valortotalproduto'
          DataPipeline = ppDBPedidoProduto
          DisplayFormat = '$####,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppDBPedidoProduto'
          mmHeight = 4498
          mmLeft = 168011
          mmTop = 0
          mmWidth = 25929
          BandType = 5
          GroupNo = 0
          LayerName = BandLayer4
        end
        object ppShape9: TppShape
          DesignLayer = ppDesignLayer3
          UserName = 'Shape9'
          mmHeight = 4498
          mmLeft = 129654
          mmTop = 0
          mmWidth = 15859
          BandType = 5
          GroupNo = 0
          LayerName = BandLayer4
        end
        object ppDBCalc9: TppDBCalc
          DesignLayer = ppDesignLayer3
          UserName = 'DBCalc9'
          Border.mmPadding = 0
          DataField = 'qtdecompra'
          DataPipeline = ppDBPedidoProduto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppDBPedidoProduto'
          mmHeight = 4498
          mmLeft = 129654
          mmTop = 0
          mmWidth = 15859
          BandType = 5
          GroupNo = 0
          LayerName = BandLayer4
        end
      end
    end
    object ppDesignLayers3: TppDesignLayers
      object ppDesignLayer3: TppDesignLayer
        UserName = 'BandLayer4'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList3: TppParameterList
    end
  end
  object qryResumoGeral: TFDQuery
    Connection = dbCtx.FDConPG
    SQL.Strings = (
      'select '
      ' min(datacompra) PrimeiraCompra,'
      ' max(datacompra) UltimaCompra,'
      ' count(*) TotalPedidos,'
      ' avg(TotalItens) TotalItens,'
      ' avg(valortotal) ValorTotal,'
      ' avg(Dias)DiasMedio'
      'from'
      '(select '
      ' coalesce(o.datacompra,cast(o.datareg as date)) dataCompra,'
      ' p.id,'
      
        ' coalesce(o.datacompra,cast(o.datareg as date))-p.datapedido Dia' +
        's,'
      ' (select '
      '  count(*)'
      ' from pedidocompra p '
      ' join orcamentos o  on o.idpedido =p.id and o.status =3'
      ' join orcamentositens o2 on o2.idorcamento=o.id'
      ' where p.status >-1)TotalItens,'
      ' (select '
      '  sum(o2.valortotal)'
      ' from pedidocompra p '
      ' join orcamentos o  on o.idpedido =p.id and o.status =3'
      ' join orcamentositens o2 on o2.idorcamento=o.id'
      ' where p.status >-1)ValorTotal'
      'from pedidocompra p '
      'join orcamentos o  on o.idpedido =p.id and o.status =3'
      'where p.status >-1)y  ')
    Left = 440
    Top = 56
    object qryResumoGeralprimeiracompra: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'primeiracompra'
      Origin = 'primeiracompra'
      ReadOnly = True
    end
    object qryResumoGeralultimacompra: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'ultimacompra'
      Origin = 'ultimacompra'
      ReadOnly = True
    end
    object qryResumoGeraltotalpedidos: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'totalpedidos'
      Origin = 'totalpedidos'
      ReadOnly = True
    end
    object qryResumoGeraltotalitens: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'totalitens'
      Origin = 'totalitens'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object qryResumoGeralvalortotal: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'valortotal'
      Origin = 'valortotal'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object qryResumoGeraldiasmedio: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'diasmedio'
      Origin = 'diasmedio'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
  end
  object dsResumo: TDataSource
    DataSet = qryResumoGeral
    Left = 512
    Top = 136
  end
  object ppDBPResumo: TppDBPipeline
    DataSource = dsResumo
    UserName = 'DBPResumo'
    Left = 512
    Top = 184
  end
  object ppRepResumo: TppReport
    AutoStop = False
    DataPipeline = ppDBPResumo
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4 (8.2 x 11.7 in; 210 x 297 mm)'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
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
    Left = 512
    Top = 240
    Version = '19.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPResumo'
    object ppHeaderBand4: TppHeaderBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 25929
      mmPrintPosition = 0
      object ppLabel40: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'LblOrdemPedido'
        Border.mmPadding = 0
        Caption = 'Resumo Geral de Pedidos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 18
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 7673
        mmLeft = 265
        mmTop = 15877
        mmWidth = 83608
        BandType = 0
        LayerName = BandLayer5
      end
      object ppImage3: TppImage
        DesignLayer = ppDesignLayer4
        UserName = 'Image3'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = False
        Stretch = True
        Border.mmPadding = 0
        Picture.Data = {
          0A544A504547496D61676529BC0000FFD8FFE000104A46494600010100000100
          010000FFDB004300030202020202030202020303030304060404040404080606
          050609080A0A090809090A0C0F0C0A0B0E0B09090D110D0E0F101011100A0C12
          131210130F101010FFDB00430103030304030408040408100B090B1010101010
          1010101010101010101010101010101010101010101010101010101010101010
          10101010101010101010101010FFC00011080500050003012200021101031101
          FFC4001E0001000203010101010100000000000000000109020708060405030A
          FFC4005510010001010502060B0F010702050402030001020304050611073108
          12213851B4161732555676779293B1D10913141934415761717273819194A122
          151835424382C152E12333A2B2C24453748324456267F1FFC4001C0101000105
          010100000000000000000000000103050607080402FFC4004011010001010404
          0B05060700030101000000010203040511062131A1071213164151537181B1D1
          333536619114223242C1E1151723525462B27282F02492FFDA000C0301000211
          0311003F00E45CF99C76917EDA9664C2309CD998EDEDEDB1EBE585DEEF617FB7
          9AABAA6F15C534534C55BFE6D21FBFDAB78607CD92F6ABA7FF008F7E7C996397
          858DD3C7C8EBF2BF8A7963513B1425DAB3860F817B55F417E3B5670C1F02F6AB
          E82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423D
          AB3860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED57D0
          5F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F02F6
          ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD42
          3DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED57
          D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F02
          F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD
          423DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED
          57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F
          02F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80
          CD423DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05
          ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C
          1F02F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB
          80CD423DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E
          05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B567
          0C1F02F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2
          FB80CD423DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE18
          3E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5
          670C1F02F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0B
          F2FB80CD423DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE
          183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3
          B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA
          0BF2FB80CD423DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6A
          CE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417
          E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAA
          FA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F
          6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F4
          17E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BD
          AAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE03350
          8F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55
          F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0
          BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE033
          508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B
          55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C307
          C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE0
          33508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F81
          7B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C3
          07C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F02F6ABE82FCBE
          E033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F
          817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59
          C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F02F6ABE82FC
          BEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB386
          0F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED
          59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F02F6ABE82
          FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3
          860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED57D05F8
          ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F02F6ABE
          82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423DA
          B3860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED57D05
          F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F02F6A
          BE82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD423
          DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED57D
          05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F02F
          6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80CD4
          23DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05ED5
          7D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55F417E3B5670C1F0
          2F6ABE82FCBEE033508F6ACE183E05ED57D05F8ED59C307C0BDAAFA0BF2FB80C
          D423DAB3860F817B55F417E3B5670C1F02F6ABE82FCBEE033508F6ACE183E05E
          D57D05F8ED59C307C0BDAAFA0BF2FB80CD423DAB3860F817B55FDBDF9F8192B3
          76D230EDA8601836319A332DDEF3618F5D2EF79BB5E6FF006F4D5455178A69AE
          8AE99AB9277C4C4BFD064EE5086D039385FE331FFF00B02D3AF846B7CD95F9D9
          5D3C7C8EBD2BF7A3B98504657E76574F1F23AF4AFDE8EE602590020000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000005086D079E0633E506D3AFC2FBD421B41E7
          818CF941B4EBF02697CB95F9D95D3C7C8EBD2BF7A3B98504657E76574F1F23AF
          4AFDE8EE60259002000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000005086D079
          E0633E506D3AFC2FBD421B41E7818CF941B4EBF02697CB95F9D95D3C7C8EBD2B
          F7A3B98504657E76574F1F23AF4AFDE8EE602590020000000046B00918F1A13C
          68E9048C78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0
          190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C
          78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D0
          71A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0
          190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C
          78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D0
          71A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0
          190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C
          78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D0
          71A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0
          190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C
          78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D0
          71A0190C78D071A0190C78D071A0190C78D071A0190C78D071A0190C78D1D271
          A3EB064238D12900000000001421B41E7818CF941B4EBF0BEF5086D079E0633E
          506D3AFC09A5F2E57E76574F1F23AF4AFDE8EE6141195F9D95D3C7C8EBD2BF7A
          3B98096400800001133A0226A88DEF23B45DA9E46D96E0D56399D31FB0C3AC27
          58B3A2A9D6D6DAA8FF002D14472D53CB1F572F2B3DA7E7FC1B66392714CEB8E5
          73F06C3AC66B8B389D2AB6B49E4A2CE9FAEAAA623F954C6D476A59AB6B39B2F5
          9B334DFEBB5B5B6AA62C6C2267DEAED67ACF16CE8A7E688FD677CF2CA9DA5A45
          9C315D26D25A302B38A288E35A55B23AA3AE5D7999FDD1EC1EC2F55D8E50C837
          8BDD844E94DBDF6F1167C68FB94C4E9FACBF03E323CC3A693B3AC3FF00735B8C
          75D7E743CDCBD6D6169A658C5A559C5AE5DD11E8ECFF008C8F307D1D61FF00B9
          B43E323CC1F47587FEE6D1C63ACF49ACF4A396AFADF1CEEC63B6DD1E8ECEF8C8
          F307D1D61FFB9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18EDB7
          47A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FFB9B4718EB3D26B3D272D5F5
          9CEEC63B6DD1E8ECEF8C8F307D1D61FF00B9B43E323CC1F47587FEE6D1C63ACF
          49ACF49CB57D673BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FF
          00B9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FFB9B43E3
          23CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE323CC1F475
          87FEE6D0F8C8F307D1D61FFB9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF
          8C8F307D1D61FF00B9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D673BB1
          8EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FF00B9B4718EB3D26B3D
          272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FFB9B43E323CC1F47587FEE6D1C
          63ACF49ACF49CB57D673BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1
          D61FFB9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FF00B9
          B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE323CC
          1F47587FEE6D0F8C8F307D1D61FF00B9B4718EB3D26B3D272D5F59CEEC63B6DD
          1E8ECEF8C8F307D1D61FFB9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D6
          73BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FFB9B4718EB3D26
          B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FF00B9B43E323CC1F47587FE
          E6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F
          307D1D61FF00B9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D6
          1FFB9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE
          323CC1F47587FEE6D0F8C8F307D1D61FFB9B4718EB3D26B3D272D5F59CEEC63B
          6DD1E8ECEF8C8F307D1D61FF00B9B43E323CC1F47587FEE6D1C63ACF49ACF49C
          B57D673BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FF00B9B471
          8EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FFB9B43E323CC1F47
          587FEE6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE323CC1F47587FEE6D0
          F8C8F307D1D61FFB9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D
          1D61FF00B9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18EDB747A
          3B3BE323CC1F47587FEE6D0F8C8F307D1D61FF00B9B4718EB3D26B3D272D5F59
          CEEC63B6DD1E8ECEF8C8F307D1D61FFB9B43E323CC1F47587FEE6D1C63ACF49A
          CF49CB57D673BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FFB9B
          4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FF00B9B43E323C
          C1F47587FEE6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE323CC1F47587F
          EE6D0F8C8F307D1D61FF00B9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8
          C8F307D1D61FFB9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18ED
          B747A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FFB9B4718EB3D26B3D272D5
          F59CEEC63B6DD1E8ECEF8C8F307D1D61FF00B9B43E323CC1F47587FEE6D1C63A
          CF49ACF49CB57D673BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1D61
          FF00B9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FFB9B43
          E323CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE323CC1F4
          7587FEE6D0F8C8F307D1D61FFB9B4718EB3D26B3D272D5F59CEEC63B6DD1E8EC
          EF8C8F307D1D61FF00B9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D673B
          B18EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FF00B9B4718EB3D26B
          3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FFB9B43E323CC1F47587FEE6D
          1C63ACF49ACF49CB57D673BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F307
          D1D61FFB9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FF00
          B9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE323
          CC1F47587FEE6D0F8C8F307D1D61FF00B9B4718EB3D26B3D272D5F59CEEC63B6
          DD1E8ECEF8C8F307D1D61FFB9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57
          D673BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FFB9B4718EB3D
          26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FF00B9B43E323CC1F47587
          FEE6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE323CC1F47587FEE6D0F8C
          8F307D1D61FF00B9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1
          D61FFB9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18EDB747A3B3
          BE323CC1F47587FEE6D0F8C8F307D1D61FFB9B4718EB3D26B3D272D5F59CEEC6
          3B6DD1E8ECEF8C8F307D1D61FF00B9B43E323CC1F47587FEE6D1C63ACF49ACF4
          9CB57D673BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FF00B9B4
          718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FFB9B43E323CC1F
          47587FEE6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE323CC1F47587FEE6
          D0F8C8F307D1D61FFB9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F30
          7D1D61FF00B9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18EDB74
          7A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FF00B9B4718EB3D26B3D272D5F
          59CEEC63B6DD1E8ECEF8C8F307D1D61FFB9B43E323CC1F47587FEE6D1C63ACF4
          9ACF49CB57D673BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FFB
          9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FF00B9B43E32
          3CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE323CC1F4758
          7FEE6D0F8C8F307D1D61FF00B9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECE
          F8C8F307D1D61FFB9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18
          EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FFB9B4718EB3D26B3D272
          D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FF00B9B43E323CC1F47587FEE6D1C6
          3ACF49ACF49CB57D673BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1D
          61FF00B9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FFB9B
          43E323CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE323CC1
          F47587FEE6D0F8C8F307D1D61FFB9B4718EB3D26B3D272D5F59CEEC63B6DD1E8
          ECEF8C8F307D1D61FF00B9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D67
          3BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F307D1D61FF00B9B4718EB3D2
          6B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FFB9B43E323CC1F47587FEE
          6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE323CC1F47587FEE6D0F8C8F3
          07D1D61FFB9B4718EB3D26B3D272D5F59CEEC63B6DD1E8ECEF8C8F307D1D61FF
          00B9B43E323CC1F47587FEE6D1C63ACF49ACF49CB57D673BB18EDB747A3B3BE3
          23CC3F473877EE6B7EF658F747F0ABC5EA8B0CDD90ADEEB6154C71ADEE3788B4
          9A63EE5511AFEB0E1227422DAB87DD1A658C51544CDAE7E11E8B94D9C6D5F21E
          D53068C6B2563F617FB2A748B6B38FE9B5B0AA7FCB5D13CB4FCFF54E9C932F61
          4DA53311CBBD4D1B33DA766BD9566CBA66CCAB7FAEC2DEEF5445AD96B3EF778B
          3D796CED23E7A67FEF1CAB66D94ED1707DAAE46C2B3AE0B3C5B1C42C75B4B29A
          B59B1B58E4AECE7EB89D7ED8D27E77AACAD3948F9B66E8CE92D38DD1367691C5
          B4A76C744C75C7A3D980A8CB00000005086D079E0633E506D3AFC2FBD421B41E
          7818CF941B4EBF02697CB95F9D95D3C7C8EBD2BF7A3B98504657E76574F1F23A
          F4AFDE8EE60259002000044A5156E0719FBA3B9A2F572CAF95F2A585A554D962
          17BB5BD5BD3AF255EF74C451FF00BEA703BB5FDD26FF0011C9BF8578F5C38A27
          7BC56FF8DA234D2D2AAF18B4899D997920051626000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000098DEEF0F7
          383345EAF18366ACA56D695556375B7B2BED853AF25335C4D35FEBA51FA383E3
          7C3B47DCDBFF001FCE1FFE2D87FEE56B09CAB657A19695518C594474E71BA5DE
          709446E4BDADF00000002843683CF0319F28369D7E17DEA10DA0F3C0C67CA0DA
          75F8134BE5CAFCECAE9E3E475E95FBD1DCC28232BF3B2BA78F91D7A57EF47730
          12C801000022ADC9455B8844B84BDD26FF0011C9BF8579F5D2E289DEED7F749B
          FC4726FE15E7D74B8A277BC56FF8DA1F4CBDF16DE1E50801458A800000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0001F3C7DAED2F736FFC7F387FF8961FFB9C5BF3C7DAED2F736FFC7F387FF896
          1FFB956C7DA4328D0EF7CD8F8F94BBCE372511B92F737DC0000000A10DA0F3C0
          C67CA0DA75F85F7A843683CF0319F28369D7E04D2F972BF3B2BA78F91D7A57EF
          47730A08CAFCECAE9E3E475E95FBD1DCC04B200400008AB725156E2112E12F74
          9BFC4726FE15E7D74B8A277BB5FDD26FF11C9BF8579F5D2E289DEF15BFE3687D
          32F7C5B787942005162A00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000007CF1F6BB4BDCDBFF1FCE1FF00E258
          7FEE717446AED1F737274C7B37CF4DD6C3FF007AAD8FB48651A1F19633639FCF
          CA5DE71B9288DC97B9BEC0000005086D079E0633E506D3AFC2FBD421B41E7818
          CF941B4EBF02697CB95F9D95D3C7C8EBD2BF7A3B98504657E76574F1F23AF4AF
          DE8EE602590020000455B928AB710897097BA4DFE23937F0AF3EBA5C513BDDAF
          EE937F88E4DFC2BCFAE97144EF78ADFF001B43E997BE2DBC3CA10028B1500000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000000000013A0
          204C47CDAC278A2729623F6304CA19A3325A53658065FC4310AAB9D23E0D76AE
          D23F588D21B6729F033DBD66AE25A5595230AB1AB978F885B53673A74C531ACB
          EA9A66A9CA21EEBB6197CBDCE56165555DD12D1E7167E6876C651F738AF969EF
          7699CF3FD1671BEAB2B85DF59FB38D5B75E53E03BB08CB3C4B5BD60778C66DA3
          499AAFF6F355333D3C58D34548B0AE76B24BA68362979CA6BA6288F9CFE90AC4
          B961D886236B16387DC6DEF35CCE9C5B2B39AE7F486C8CA9C1976DF9CB895613
          90711B3B2AF4E2DB5EA9F78B39FF00755A2D4B2F6CFB24E55A29B3CBB95F0BC3
          E28E4A66C2EB453579DA6BFCBF766CFE68988FB1569BBC74CB26BAF075634E53
          79B599EE8CBCF357BE51F73B7681894D9DB66DCD985E11673A71ACAC29AADED6
          3F4D299FD5D51B02E0CD96B60937FBC60F8DDFB12BD62767459DE2D2DE9A68A3
          4A6758E2D31AE9CBF5B71534F15944EB2A94D9D34CE710CAB0ED19C370BAE2D6
          C28FBD1D3339CB20151900000000A10DA0F3C0C67CA0DA75F85F7A843683CF03
          19F28369D7E04D2F972BF3B2BA78F91D7A57EF47730A08CAFCECAE9E3E475E95
          FBD1DCC04B200400008AB725156E2112E12F749BFC4726FE15E7D74B8A277BB5
          FDD26FF11C9BF8579F5D2E289DEF15BFE3687D32F7C5B787942005162A000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000026204E48194D331F3
          4A6C6C6DAF16B4D85859D569695CF169A29899AAA9E8888E5936A6299AA72860
          365E54E0DBB73CE7345581ECD719F79B4E58B7BDD8FC12CE63A62AB69A6263EC
          D5B9F2A7B9D9B4DC4B896D9B33560D82D955CB551614D77BB5A63A263FA29D7E
          CAA5F716754EC85E2EBA3F895F3D958D5E31979E4E4ED3EBD0D223E758E652F7
          3CF64384FBDDB666C5B1AC7AD29D38D4576D177B299FAA2CE22AFD6A96E6CA9B
          00D8F6498A6ACB990707BADB51BADE6ED4D76BE7D5AD5FCAA45DEA9DB2C96E9C
          1FDFED75DBD54D11F59DDAB7AAAB2C6C9369B9CEAA232C646C66FF004DA7736B
          45D2BA6CA7FF00D954453FCB71E53E017B6EC7FDEED719B3C3302B1ABBAF84DB
          FBE5AD3FEDA358FF00D4B2EB1BAD85DE8F7BB1B3A28A7A29A62223F467C588E4
          8558BBD31B592DD383EB8596536F5D55CFD21C71947DCE5CA775E25AE72CED7F
          C42B8D38D6573B2A6C2CE7F39D6AFE5BA729F04CD846509A2D2E191AE97AB6A3
          969B6BF4CDBD713D3AD4DBE2AC514C6C864B74D1EC32E5AECAC633EB98CE77BE
          1C3B02C2307B28B1C2F0DBA5D2888D229B0B1A688D3F287DBC548FA5E29A69A6
          32A63244469CA99D7A407D44640002637A131BC190000000002843683CF0319F
          28369D7E17DEA10DA0F3C0C67CA0DA75F8134BE5CAFCECAE9E3E475E95FBD1DC
          C28232BF3B2BA78F91D7A57EF4773012C801000022ADC9455B8844B84BDD26FF
          0011C9BF8579F5D2E289DEED7F749BFC4726FE15E7D74B8A277BC56FF8DA1F4C
          BDF16DE1E50801458A8000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000009D04
          A065146B3114C4CCCEED3E77A7CB7B30DA0E6FB58B1CB793717BFD53BBDE6EB5
          CC7EBA6898899D8AB6777B5B69E2D9D3333F28CDE593C9D30E89CA7C04F6E798
          E68AF12B85C703B1AF978F7DBC44D511F5D14EB547E8DCF947DCE3C0EC3896B9
          D73DDEAF53FE7B1B858459D3F95756B3FF00A5529B2AEAE85FEE9A278B5EF5D3
          65311F3D5E6E0FD23A5FA38565DC771DBC5174C1706BF5FEDAD3B9A2EF77AAD2
          67F2885A5652E07DB03CA5C4AEC72559E256F469A5B6236B55BCCFDB4F2513E6
          B6BE1196B00C02C22EB81E0F72C3EC63759DD6EF45953FA5310FBA6ED3F9A593
          5D783AB7AB5DE6D623BB5FA2AD729F03DDBFE6D9B3AEC723DB61B615E9ADAE25
          694DDB8BF5CD154F1FF4A5B9F297B9C38EDB554DA675DA1DD2EB11A4D56186DD
          6AB699FABDF2B9A623CD9779F1698E8348568B0A236EB64B74D05C2EEFAED226
          B9F9CE5BA1CF194B8086C0F2E4515E2785625982DA8D278D88DF2A8A75FB965C
          4A663EA9D5B932BECD721649B3F7ACA594707C2234D266E972B3B2AAAFB6AA63
          5AA7EB97A4D51AEAA914C46C864976C2EE5738CAC2CA9A7BA208A298D7494716
          1225EEC88D6234004800000000000000098DE84C6F064000000000A10DA0F3C0
          C67CA0DA75F85F7A843683CF0319F28369D7E04D2F972BF3B2BA78F91D7A57EF
          47730A08CAFCECAE9E3E475E95FBD1DCC04B200400008AB725156E2112E12F74
          9BFC4726FE15E7D74B8A277BB5FDD26FF11C9BF8579F5D2E289DEF15BFE3687D
          32F7C5B787942005162A00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000988D7538BAEE9FE
          099C93113281F6E15826338E5E22E982E137CC42DE74D2CEEB6155AD5FA53132
          DAB94F824EDEB374516975C8B78B85857A696D88DA53614C7DB4CEB5C79AFA8A
          6AAB643D977C3AF77B9CAC6CE6AEE8969D4C6EDD2EC8CA7EE72666BC7BDDB673
          CF374B9C4F2D76170B09B5AA3ECAEAD23FF4B75650E01DB0FC0389698B5D711C
          72DA9D3FAAF97898A27EDA29D225522C2B964973D08C56F3AEBA2288F9CFE90A
          D1BBDDAF17BB5A6C2EB61696B6957253459D335553F943DF654E0FBB64CE734C
          E07B3FC5ABB3ABFD5B6B19B1A223A666BD3916A9973649B38CA3674D965CC9B8
          4DC229DD36575A627F5D357ABA2C6CECE22298D2237446E8558BBC74CB25BAF0
          73671AEF56D9FCA98F5573653F73DB6AB8BF12D7336358560B673A4D5445536F
          5E9F969112DD1947DCF2D98E1BC4AF34E60C5F18B4A796AA2898B0A35E8E4E59
          875971683488DCA9165452C92E9A1D84DD729E4F8D3FEDAFF66B8CA7C1C762F9
          329A2704C8185C5A51FEADBD97BF5733D3335EB0D8576B8DD2E3654D85D2C2CE
          C6CE88D29A2CE88A698FB221FDB5943EE22236322B1BAD8DDE38B6344531F28C
          8E2D3D26911B812AE9D651AEA000000000000000000000000000002637A131BC
          190000000002843683CF0319F28369D7E17DEA10DA0F3C0C67CA0DA75F8134BE
          5CAFCECAE9E3E475E95FBD1DCC28232BF3B2BA78F91D7A57EF4773012C801000
          022ADC9455B8844B84BDD26FF11C9BF8579F5D2E289DEED7F749BFC4726FE15E
          7D74B8A277BC56FF008DA1F4CBDF16DE1E50801458A800000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000278B
          AFF9A19D958DA5B57C4B1B2AAD2A9F9A989991F514CD5B1FCC7BACA7B0DDADE7
          79A2ACB3B3FC6AF7655EEB6F83554597E75D5A531FAB73E53F73E76C98D4D16B
          98EFF83601653DD536B6F36F6D1F65367134CF9D0FB8B3AAAD90BA5D702C46FB
          EC2C6A9F0CA3EB2E5F2235E4D7E6F9D60F94BDCE9D9DE1D345AE6FCDB8CE3369
          4F2D567768A2E9653F54F77569F6550DD994B831EC2B25C515E0DB36C22BB6B3
          D262DEFB65F0BB489E98AADB8D313F668A9177AA76EA64D74D00C46DB5DB554D
          11DF9CEE555659C819DF3A5AC58E52CA58C63154CE9ADCAE5696D4C7DB5531A4
          7E72DC994B80C6DFB32F12D6FD815C700B0AE35E3E277CA62AD3EE5971EA89FA
          A6216776171BADD6CA9B0BB5851656744694D1453C5A623A2221FDB894EFD156
          2EF4C6D64B74E0F2E567AEF16935776A8FD65C4D94BDCDEC36CA68B7CEDB44BD
          5E27926AB0C32EB4D9447D5C7B49AB5F361BA729F033D806578A2BEC2E8C56DE
          8E59B4C4EDAABC6B3D3C4AA7891F952DDFC5A53AC69C92AB14534EC864B74D1B
          C2EE5ECAC633EB9D73BF37E561194B2D6016145D704C0EE371B1B3E4A68BBD85
          36711FA43F522CE888E484EB28D65F4BD5345344654C64998A67E794694C6E01
          F59275946A0240000000000000000000000000000000000000004C6F42637832
          0000000005086D079E0633E506D3AFC2FBD421B41E7818CF941B4EBF02697CB9
          5F9D95D3C7C8EBD2BF7A3B98504657E76574F1F23AF4AFDE8EE6025900200004
          55B928AB710897097BA4DFE23937F0AF3EBA5C513BDDAFEE937F88E4DFC2BCFA
          E97144EF78ADFF001B43E997BE2DBC3CA10028B1500000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000120813A7D52FDCC0B23E7
          0CD16B4D965ECB189E2335F73377BB575533FEE88D3F94C673B156CEC6D2D672
          A22667E4FC21BEF297027DBC6688A2D6DF2ED8E0F635693355FEDE28AA23EEC6
          B32DCF94FDCE0A3FA2D73AE7EAA7E79B2C3EEFA47D93555FF0FBA6CABABA17DB
          A68AE2B7BD7458CC475CEAF370FC53131BE75FB1F4E1F84E278A5AC58E1B875E
          6F75CCE91163655573FC42D03287029D82E579A2D2DB2C578B5AD3A4F1EFF6F5
          5A46BD3A4690DBD81647CA1966CA9B2CBD96F0DC3E9A6348F83DDA8A27F588D6
          5522ED3D32C9AE9C1E5E6BCA6F36B14F74673FA2AC329F057DBA671E25786E42
          BEDDEC6D375B5F74BBD131D3135374655F739F3A5F628B6CDF9C30EC36CE749A
          ACEEB4556F694FEBA53FCAC062CA888D2213C58D3455A6C28A76B25BA681E196
          1AED73AE7E73946E731E50E00BB16C0E68B6C76715C76DA9EEA2DEDFDEACA7FD
          B4444FFEA6EACADB19D95E4CA68EC6721E0D72AE8D38B6B4DD69AED63FDF56B5
          7F2F651C58E4838D0A914D31B21925D708B8DCBD859531E1AFEBB58C58D9D31A
          45311A328A220D651ACBE971CA213114C266A862094EB28D6400000000000000
          0000000000000000000000000000000000000004C6F426378320000000005086
          D079E0633E506D3AFC2FBD421B41E7818CF941B4EBF02697CB95F9D95D3C7C8E
          BD2BF7A3B98504657E76574F1F23AF4AFDE8EE602590020000455B928AB71089
          7097BA4DFE23937F0AF3EBA5C513BDDAFEE937F88E4DFC2BCFAE97144EF78ADF
          F1B43E997BE2DBC3CA10028B1500000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000131CBF389CB340FED75B9DE6FB6F45D6E777B5B7B7B49D28
          B2B2A26BAEA9FAA23965B3729F05FDBCE72E257856CDB16B1B1B4E58B6BFD9C5
          CE888E9FFC69A6663EC894C44CF43D56171BCDEA78B6144D53F28996AC4BAEB2
          9FB9CFB41BFF0012DB38671C2309B3AB96AB3BA515DEED23EA999E25313F66AD
          CB94BDCFCD8D60D3457986F38BE60B48EEA2DEF3EF36733F5536514CE9F6CCAA
          C58573AD915D742F16BCEBAA88A63FDA72570C53C6988A235D791ECF2BEC5F6A
          F9CEAA632DE40C6AF7457A716D26EB559D9CFF00BEBD29FE56AF947625B28C93
          14CE5AC83835CAD688D22DA9BAD336B3F6D731333F9CBDAD9DDAC2CA9E259595
          3453D14C690FB8BBF5CB26BA70731B6F56DE14C7EB3E8AD8CA7C0076D18EC516
          D8EDE309C0AC6AD358B5B59B6B5A7FDB4727FEA6E8CA5EE73E46B8F12DB37E6F
          C4F14AE34E3595DE9A6C2CA7A7A6AFE5D85145311A44278B1D0AD1634474325B
          A68661375D7367C69FF69CFF0066A6CA3C16F619937DEED30CC8370B5B7B39FE
          9B7BDC4DBDA47FBAAD5B3AE38461586D97BCE1D87DDEED671FE5B1B2A688FE21
          F54E9D06B11BA1F71111B191585CEEF768E2D8D114C7CA2211EF74C6ED53C5A7
          A0999425E94FF4C7CC6B1F342003590000000000000000000000000000000000
          000000000000000000000000000000004C6F426378320000000005086D079E06
          33E506D3AFC2FBD421B41E7818CF941B4EBF02697CB95F9D95D3C7C8EBD2BF7A
          3B98504657E76574F1F23AF4AFDE8EE602590020000455B928AB710897097BA4
          DFE23937F0AF3EBA5C513BDDAFEE937F88E4DFC2BCFAE97144EF78ADFF001B43
          E997BE2DBC3CA10028B150000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000001
          951455695453453355533A45311CB23EA2999D8C47AECB3B26DA4670B48B3CB7
          92318BF4D53A6B6775AF8BFACC68DC794B8066DB7315545A62F65866056354EF
          BD5E38F569F768D661F54D1555B2172BAE0D7FBECFF42CAA9F0D5F5D8E6F2239
          7E777CE54F738F2ADD789699CB3C5FAFD56FAECAE5654D8D3F645756B3FC373E
          51E099B06CA3C4AEE990EE97DB6A397DFB10AAABC4CFDB4D53C5FE1562EF54ED
          64B74D02C4EDB5DACD3447CE739DCAB5C1329E66CC778A6EB8065FC4710B6AB9
          29B3BB5DABB4AA7F2886DCCA5C0C76FB9AF896B393BFB26C2BFF005713B7A6C3
          8BF6D13AD7FF00A568B85E0B8460D778B9E11855D2E5614EEB3BBD8D3674C7E5
          4C443EC8A298F99522EF4C6D964D74E0F2E967AEF36B35776A8FD65C2994FDCD
          CBF57345AE77DA358D94477761865D66D267ECB5B4E2E9E6373653E039B01CB5
          34577DCBD7BC7ADA8D34B4C4EF75551AFD7459F1289FCE99743691D071637AAD
          3674D3D0C92EBA2F855D3F058C4CFCF5F9BF072D644C9593EEF175CAB94F08C2
          2CE234E2DCAE76763AFDBC588D7F37EE459D14EEA594CC41C687DE4BED167459
          C71688888F92268A677C114534EE82651ACF48FB65AC41C68620266651AC8000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000098DE84C6F064000000000A10DA0F3C0C67CA0DA75F85F7A843683C
          F0319F28369D7E04D2F972BF3B2BA78F91D7A57EF47730A08CAFCECAE9E3E475
          E95FBD1DCC04B200400008AB725156E2112E12F749BFC4726FE15E7D74B8A277
          BB5FDD26FF0011C9BF8579F5D2E289DEF15BFE3687D32F7C5B787942005162A0
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000098899DD1ABF4706CBB8FE62BC7C1700C0AF
          F895B6B11EF774BBD76D57E94C49AFA1528B2AAD272A23397E68DD795381F6DF
          335459DA59E4B9C32C2D3962DB12B6A6C6223EEC6B547E70DCD94FDCE2C62DE2
          8B5CE99F2C2EF4CF756387D84D5547D95D7C9FC2A53655D5D0BDDD346715BE65
          C9D8CE5F3D5E6E2F7F7BA5CAF57EB58BBDCAED6B78B69DD67636735D53F9446A
          B30CA9C0576179722CED310C26F78DDBD1BEBBF5BCCD357DB453A53FC37365AD
          9AE42CA5634D865DCA1855C28A74D3DE6EB4C4C69F5E9AAAC5DE7A65935D383D
          BDDA65378B48A7BB5CAAB32A7070DB5672AACE706C8189C5957FEB5E2CFDE688
          FB78DA4FF0DCF94FDCF0DA4629C4B4CD598F0BC1E8DF55165355BD7FAC690B12
          8A288E48A6234FA93C58E8548B0A636B25BA680E1B61AEDA66B9F9CE51BBD5CA
          994FDCF7D93E0FC4B5CCB8B62B8DDAD3A4CD335C58D1AFD94EF86E7CA5B01D8F
          E4C8A6301C838459574FFA9696116B5EBD3AD7AF2B62691D0691D0A914534EC8
          64975C130FB9E5C8D8D31E1AFEB2FE76375BB5DE8A6CAC2C28B3A298D29A68A6
          22223EA886714511BA984CCE88E37D4FA5D222223284F163A0D223E644CEA812
          CA66211C6FA9002667546B3D2000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000002637A131BC1900
          00000002843683CF0319F28369D7E17DEA10DA0F3C0C67CA0DA75F8134BE5CAF
          CECAE9E3E475E95FBD1DCC28232BF3B2BA78F91D7A57EF4773012C801000022A
          DC9455B8844B84BDD26FF11C9BF8579F5D2E289DEED7F749BFC4726FE15E7D74
          B8A277BC56FF008DA1F4CBDF16DE1E50801458A8000000000000000000000000
          0000000000000000000000000000000000000000000000000000000098D60FEB
          6177B7BC55145859556954EEA69A6665EF72AEC036C99D7895E5FD9F62F6F655
          F736F6961363653FEFAF4A7F94C5333B1E9B1B9DBDE672B1A26AEE8996BD1D53
          947DCF5DAC631EF76D9A71CC1703B19EEA8F7CAAF36D4FE5447167CF6E9CA5EE
          766CB70BE25AE6BCCB8DE396B1DD5167345D6C6AFB6988AABFD2B558B0AE5905
          D343717BD653C9F163FDA72DDB772BBA2359D377E6F4B95B66BB40CED5C5194F
          256358B4553A7BE5D2E5695D9C7DB5C47163F395A9652E0E5B12C933675E5FD9
          B60945B59F736F79BBFC26DA263E78B4B6E35513F64B6559585958D14D9D9595
          14514C444534C69110A9176EB964D74E0EAADB7AB6F0A63F59564652E023B78C
          C5C4B4C5AE185E5EB1AB4999BFDF22BB488FAA8B28AF97EA9986E8CABEE6FE5D
          BBF12DB3AED02FD7DAB9266C70EBB5377A3EC9AABE3CCC7D910ED2D23A0D23A1
          522C688E864D75D0AC26EDAEAA26B9FF0069FD2328694CA7C10360394A6CED2E
          D912ED7FB6A34FFC5C4AAAAF5333D3A57334C4FD910DB58565FC1305BBD376C2
          709B9DCECACF929A6C2C69A223EC8887E8E91D09548888D50C8AEF71BB5D232B
          0B38A7BA2211A47441A474133A238DF525EB4E91AEBA258CCEA806533A238DF5
          2004CCEA80000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000131BD098DE0C800000
          0001421B41E7818CF941B4EBF0BEF5086D079E0633E506D3AFC09A5F2E57E765
          74F1F23AF4AFDE8EE6141195F9D95D3C7C8EBD2BF7A3B9809640080001156E4A
          2ADC4225C25EE937F88E4DFC2BCFAE97144EF76BFBA4DFE23937F0AF3EBA5C51
          3BDE2B7FC6D0FA65EF8B6F0F28400A2C54000000000000000000000000000000
          00000000000000000000000000000000004E93D008004C4660F4597B6779EB36
          574D196F29629884D7DCCD8DD6B9A67FDDA69FCB70E55E03DB75CC93676B7DC1
          6EB8258D5CB5557EB78E3C7FB29D7D6FA8A2AAB642E376C26FB7CF616554F839
          F12EEACA5EE7161F6714DAE74CF96B6D31CB55961F778A699FAB8D572B73E54E
          06BB05CAB345A4651FED3B6A3498B4C42D6AB59D7A74E48558B0AA76B23BA681
          E2978D7699511F39D7B957B86E038CE356B4D8E1384DEAF95D73A4536163557C
          BF94368E54E097B77CDD34D775C8D7AB8D8D7CBEFB7FAA2C29D3A638DBD69981
          E53CB7976CA9B1C0B01C3EE14531A6977BB5167EA8E57EBC534F43EE2ED4ED99
          64F74E0F2EF465379B59ABE51197AB80F28FB9CB99EF7145B672CF171B8D13CB
          559DCAC2AB6AE3EA99AB8B1FA4B74E53E019B0FC0228B5C62EF8963D6D4E9AFC
          2EF13459CFFB68D263F574A691D0690AB4D9514EC864B75D14C26E9AE9B2899E
          B9D7E6F1F95B653B39C99144659C938361F551DCDAD95D28F7CFCEB98E34FEAF
          5F1451A69C58FD13A41AC74AA2FB656367631C5B3A6223E519114D31BA20D20D
          63A51C6FA8554A58F1900CA674471BEA40099A90000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000002637A131BC190000000002843683CF0319F2836
          9D7E17DEA10DA0F3C0C67CA0DA75F8134BE5CAFCECAE9E3E475E95FBD1DCC282
          32BF3B2BA78F91D7A57EF4773012C801000022ADC9455B8844B84BDD26FF0011
          C9BF8579F5D2E289DEED7F749BFC4726FE15E7D74B8A277BC56FF8DA1F4CBDF1
          6DE1E50801458A80000000000000000000000000000000000000000000000000
          001BF702407D387DC2FD89DE69B9E1B72B6BDDBDA72516563653695D5F64472C
          8FAA289AE72A63397CC36DE54E0A7B7ECE1345A5C366F885CEC2BFF5B128A6E7
          111D3C5B598AE63ECA65B9F29FB9C99D6FBC4B4CE79E70BC3689D26AB2B858D7
          79AF4E8E355C4889FCA5F74D9D75742F375D1CC52F9ECAC6ACBAE6328DF938FB
          49E84D145569545145135D554E94C472CCCF468B29CA5C00F62380F12D31CFED
          7CC16D4F2CFC2EF536746BF76CA29E4FAA756E4CA9B1ED9964A88A32BE48C1F0
          F988D3DF2CAE744573F6D5A6B3F9AAD377AA76B25BA707B7DB4D778B4A69FACC
          EE556E57D84ED8339CD119776798CDE28AF75ADA5DE6C6CE7ECAED38B13FAB72
          E54F73EF6BD8D712D33162984E0963569331355578B5A7EDA69D23FF0052C82C
          ACACECA9E259D114C47CD11A433548B0A636B26BA68061F65AEDEAAAB9FA47FF
          0078B91329FB9D9B39C3F896B9B733E2B8BD71A71ACECF4B0B39FB38BFD5FCB7
          4654E0CFB13C9BC4B4C1B20E1D36D469A5BDE2CFDFAD3CEAB56D34AAD34534EC
          864B75C070EB9FB1B1A63C339DEF96E386DC30EB2F79B95CEC2EF446EA6CACE2
          88FD21F4E91D10946B0FA5DA22223283484A358E944D5D02592358E9471A500C
          B58E9471900278D2800000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000131BD098DE0C8000000001421B41E7818CF941B4EBF0BEF508
          6D079E0633E506D3AFC09A5F2E57E76574F1F23AF4AFDE8EE6141195F9D95D3C
          7C8EBD2BF7A3B9809640080001156E4A2ADC4225C25EE937F88E4DFC2BCFAE97
          144EF76BFBA4DFE23937F0AF3EBA5C513BDE2B7FC6D0FA65EF8B6F0F28400A2C
          5400000000000000000000000000000000000004E93D008037890656767696B5
          C59D959D55D756EA698D665ED32AEC636A99CE69A72E644C5EF94D53DDD376AA
          9A63EB999D39131133B15EC6ED6D789CACA99AA7E519BC48E9ACA9C0076D18E7
          12D71CB4C2F02B1AB967DFEDFDF6BD3EED1AE93F6B73E51F73A323DCB895E70C
          E38A6255472D56774B3A6EF4FD9C69E34CC7E50A94D8D75742FF0075D0FC5EF5
          B2CB8B1FED947EEAFF007EDE5FC959BF34DE3E0996F2CE25895B4EEA2EB74AED
          6AFE2169B94F82C6C2B27716AC3767F70BCDAD3FEADFA26F354CF4E95CCD3FA4
          36861F8661F85D85376C36E36175B0A3B9B2B1B38A288FB22391522EF3D32C9A
          E9C1D5ACEBBD5B447CA233F3CBC958394B8136DFF34F12BB7CB36182D857CB16
          B89DE69B298FB6CE9E3571E6B73652F737E2668B5CEFB4599FFAEC30BBA7AAD2
          D27FF83B8E27EA4E91D0AB16144326BA683E1577D75D335CFCE7F48C9A1329F0
          26E0FD95FDEEBB5CA96B8DDB59E931698A5E6AB589FB6CE9E2D9CFE74B70E5FC
          A195B2ADDA2E79632E61B845847FA771BAD1614FE944443F692A91114EC64776
          C3AE9738CAC2CE9A7BA218C69BB44A44BDA84A358E944D5D00C908E34A35D419
          6B1D289ABA100278D28000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000131BD098DE0C8000000001421B41E7818CF9
          41B4EBF0BEF5086D079E0633E506D3AFC09A5F2E57E76574F1F23AF4AFDE8EE6
          141195F9D95D3C7C8EBD2BF7A3B9809640080001156E4A2ADC4225C25EE937F8
          8E4DFC2BCFAE97144EF76BFBA4DFE23937F0AF3EBA5C513BDE2B7FC6D0FA65EF
          8B6F0F28400A2C540000000000000000000000000489C902749E83E7D032CD03
          F5B02CA79A3345B45865BCBB896275CCE9A5D2EB5DAE93F5F162746DFCA5C0C3
          6FD9AF89695654B3C26C2BE5F7CC4ADE9B3E4E9E2D3C6ABF29887D451555B21E
          EBB6197CBE6AB0B2AAAEE8968BD24D1DB7953DCE0BD55345AE75CFFC489E5AAC
          70EBBF2C7D5C7AF589FD1BA729F022D83E5B8A2D2F7976DF19B6A74E3577FB7A
          ABA6AFB68EE7F8548B0AE5925D341715BC6BB488A23E73FA466AC3B8E1D88627
          6F176C3AE378BDDACEEB3B0B2AAD2AFD22265B2F297063DB8672E25785641C42
          CAC6BD34B6BDD316147E7C6E5FE169D816CFB25657B2A2EF97F2BE1B70A28EE6
          2C2ED4D331F9E9ABD05144531A44722AC5DE3A65935D383CB2A75DE6DA67E511
          96F957C654F73AF3F621C5B6CDD9A70DC2E998FEAB2BBD355B5A47D93C90DD19
          4FDCFCD8F609145AE60BE62B8E5AD3F35A5A4595133F5D34EF8FCDD462A45953
          1D0C9AE9A2584DD32E2D971A7AE75FECD7D96361DB27C9F4D3465EC8584DDA69
          DD5CDDE2D2BFB75AB597BAB0B0B3B0A69B3B2A229A29E4A6988D2221FDC54CA3
          A17EB2BBD9584716CA9888F944000AC08D611357403246BA23594032D6113574
          2004F1A51AEA0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000693D0988E9042622754C4689000000000
          01421B41E7818CF941B4EBF0BEF5086D079E0633E506D3AFC09A5F2E57E76574
          F1F23AF4AFDE8EE6141195F9D95D3C7C8EBD2BF7A3B9809640080001156E4A2A
          DC4225C25EE937F88E4DFC2BCFAE97144EF76BFBA4DFE23937F0AF3EBA5C513B
          DE2B7FC6D0FA65EF8B6F0F28400A2C54000000000000131133BA0D275D349040
          9E2CF43FA5DEEB79BDD716775BBDA5B5733A453453354EBF9276BEA9A66A9CA2
          1FCA39771B9B2F297071DB6E759B3AB02D9CE2F559DA69C5B6BCD97C1ECA7FDF
          69C5A67F56E8CA9EE75ED3F14E25B66ACC9836096557754594D57AB6A7F28D28
          FF00D4FB8B3AA7A177BA68FE257DD7636354C75E5947D65C986E58D651F73D36
          4B83C59DAE67C631BC7ADA9EEE89B4A6EB6357FB688E3C79EDD394B83FEC6B24
          712BCB7B38C12EF6D47736F69768B7B68FFF0065A71ABFE5522EF574B26BA707
          D7FB5D76F553447D6776ADEAA8CA7B27DA6678AA8EC4F21E398A59D7BAD6C2E5
          69363F9DA4C7123F396E9CA7C01F6EB8F712D71BB3C272ED8D5DD45EEF516B6B
          11F553631547EB542CAA8B0A28888A288888DD10FED1C9110A9177A7A592DD38
          3EB8596BBC575573E111FAF9B8D32A7B9C394EE71676D9D33D62989571A4D565
          71B1A2ED6733D1AD5C7AA63EC986E9CA7C13360B93E2CED2E1B3DB8DEEDE8D27
          DFB10D6F55EBD3FF008933113F668DC62A4514D31944326BAE8F61973CB92B1A
          7BE6339DF9BF3B0FC0F0AC2ACA9B0C370CBBDD6CE88D29A2C6CA28888FB221F7
          453A472331F6BBD345344654C64003E811AC74A26AE806431E34CA2759F9C196
          B1D289ABA100278D3289E5F9C000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000349004C427488063A
          4F42621923588DF2679091135531CB32F8B11C670CC2ECA6DAFD7DB2B1A63FEA
          AB967F252B6B7B3BBD13696B545311D3339426226763EDD63A4E353BB56BCC67
          6AD75B29AACB06B9D56F57CD696BFD34FE9BE7F87F7D9EE61C5F1FBF5F6D312B
          CC574D1447128A69D29A797E662963A6F84DEB11A30CBAD7C7AEACF5C47DD8CB
          E7E8AB3615C53C69D8F7A212CC1440000005086D079E0633E506D3AFC2FBD421
          B41E7818CF941B4EBF02697CB95F9D95D3C7C8EBD2BF7A3B98504657E76574F1
          F23AF4AFDE8EE602590020000455B928AB710897097BA4DFE23937F0AF3EBA5C
          513BDDAFEE937F88E4DFC2BCFAE97144EF78ADFF001B43E997BE2DBC3CA10028
          B1604E92064813C59E87A7CB9B30DA1E6EB4A6CB2E64CC5EFF0035F73559DDAA
          8A67FDD3111FCA6226762AD9585ADB4E5674CCF7466F2E98899745E53E027B72
          CC7C4B5C4AE371C0EC6ADF37BB789AE9FF00653ED6E8CA9EE7160961345B672C
          F17ABDD51A71EC6E56316744FF00BAAE57DC59573D0BFDD344B16BDE534D94C4
          75CEA706693BF47E8E1396B30E3D6D45860B825FAFD5D73A5316161557AFE90B
          4ACA5C10761194A28AEC325595FEDACF969B5BFDA4DB55AFE7C9FC36A61396B0
          2C0AC7E0F82E0B72B859FF00D376B0A6CE3FF4C42AC5DE7A6592DD383BB799CE
          F36B11DD19F9AAEB29F03DDBE66C9A2BB1C9B6B8758D7A4FBE621694D8691D3A
          55CB2DD394FDCE0C6EDB896F9CF3EDDAED13A4D56370B09B4AA3EAE355C58FD3
          5777D3469F3328548B0A23A1935D34170BBBEBB489AE7E73FA464E74CA5C04F6
          19977896989E177FC72DA9D2666FB7998A667EAA68E2F27D5ACB71E5AD99E41C
          9D674D196727E1186CD31A71EEF74A29AFF3AB4D67F397A915622236324BB615
          72B9FB0B2A69F0FD5FCACECA28DD0FE91C90912F764002411AC1C6048C38D3F6
          1AC832D63A49AA18E801C69926667E7003400000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000D26
          53A4820D27A19690906311D29DC4CC46F471E98DF2663246B0F8B11C630DC32C
          A6D6FD7DB2B1888D74AAAE59FC9E2B18DAADD6CB5B2C22EB55B55FFDCB4E4A7F
          458716D25C3304A78D7CB5889EADB3F48D6FBA2CEAAF64360556D674471ABAE2
          988DF33C8F358CE7DC030A9AA8F84C5E2D23FC965FD5FACEE6ACC5B34E398CD5
          3F0CBF57C49FF4E89E2D31FA3F2746AAC6B85AAEBCECF0AB2CBFDAAFD23D5EBA
          2E996BAA5EC717DA66357ED6CF0FA69B9D94FCF1FD55FF00D9E4EF179BC5F2D2
          6DAF56F696B5CFF9ABAA665FCC6ABC4F1DC4718AF8D7DB69ABE59EAFA46A7AA9
          B3A68FC303616C8FE537EFB94FADAF5B0B647F29BF7DCA7D6BF707BF115DFBE7
          CA5F178F652D9B09446E4BAA616A0000001421B41E7818CF941B4EBF0BEF5086
          D079E0633E506D3AFC09A5F2E57E76574F1F23AF4AFDE8EE6141195F9D95D3C7
          C8EBD2BF7A3B980964008000115251546B1A0384BDD268D311C9BF8579F5C38A
          3966792169DC22B83247080C5303BC5EF3557845D708A2D29B4A2CEEB16B696B
          C698DD3354453BBA25F8594B804EC372FD545AE2D71C4B1FB6A3978D7FBDCC53
          33F72CE29A67EC98979ED2CA6BAF386ACC7744F10C5B14B4B7B3888A272D733F
          28E85685958DADBDA536361655DA5A573A534514CD55553F5446F6C1CA9C1F36
          CD9CEAA3FB0F6778C57675EEB5BC58FC1E8D3A75B4E2EB1F62D572C6CA767793
          6CE9B2CB192B07C36298D35BBDD28A667EB9988D665E9E2EF453C945114C46ED
          08BBC46D956BA7075446BBCDB4CFCA98FD655D594BDCF3DAB631C4B5CCD8DE11
          82D94F2CD345555E2D23EA988E2C44FE72DCF94FDCEFD99617345AE68C6F16C6
          6B8E5AA88B48B0B39FB38BFD5FCBACA8A78B1A3254A6CA9A7A1935D743F08BB6
          BE4B8D3FED39B5AE53E0EDB1CC99145781E40C2A8B6A375B5AD8C5ADA4FDB555
          AEAF7F77C3AE973B28B1BA5D2C6C688FF2D9D114C47E50FAC548D5B19058DD6C
          2EF19595114C7CA22185144531A33015C00011331071A012309AA750196B0719
          8E91BC0359000D20000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000D35004E929D2011A491
          1D2C9133A01A68963C7A5F26218C6198658FBF6217DB2B0A3A6BAB4D7EC8F9D4
          AD6DECEC289B4B5AA2223A675426226753ECD618D56B4511335551111BE65AFF
          0018DAADD2CA2AB2C1AE955BD5BA2D2D7FA69FCA37CFF0F118B66AC771AAA7E1
          B7EAFDEE7FD3A3FA69FD237FE6D7B8CF09984E1B9D9DDA66DABFF5D9F5F4CDE8
          A2ED5D5B75369E339F700C266AA3E15179B58FF4EC7FABF59DCF0F8C6D3719BF
          4556570A29B9D9CFCF1CB5FEAF1B3333296A7C67846C6715CE8B3AB92A27A29D
          BE33B5EBA2ED451B75BFA5E2F579BDD736B7AB7AED6B9DF55754CCBF92460969
          695DAD535DA4CCCCF4CEB95688CB6003E120003616C8FE537EFB94FADAF5B0B6
          47F29BF7DCA7D6CD383DF88AEFDF3E52A378F652D9B1B9288DC9754C2D400000
          02843683CF0319F28369D7E17DEA10DA0F3C0C67CA0DA75F8134BE5CAFCECAE9
          E3E475E95FBD1DCC28232BF3B2BA78F91D7A57EF4773012C8010000000000000
          08998838D009184D53F341ACF4832998838D0C748009AA7535900348DE000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000001A6A9D24109D253A42418C474A74D099D11C
          78F9CCC648D621F1DFF17C370DB29B5BF5EECEC698FF00AAA78AC636AB74B2E3
          5960F75AADEADD16969FD34FE9BE562C5F4930CC129E35F2D6299EADB33E1B5F
          7459D55CEA87BFAAD68A235AAAD23A65E7319CF997F0999A26F7EFF6B1FE9D94
          71A7F39DD0D598B66BC7B19998BDDFAA8B3FFEDD9FF4D3FF0077E3CFD4D538CF
          0B75D59D9E176597FB55E91FACBD745D3A6A97B3C6369D8D5F78D6586D145CAC
          A7938D1FD55FEB3C90F2379BCDE6F96936D7BB7B4B6B49DF55A55354FF002FE6
          3566298F6238CD5C6BEDACD5F2CF57D2353D5459D3447DD8005A1F6000000000
          0003616C8FE537EFB94FADAF5B0B647F29BF7DCA7D6CD383DF88AEFDF3E52A37
          8F652D9B1B9288DC9754C2D40000002843683CF0319F28369D7E17DEA10DA0F3
          C0C67CA0DA75F8134BE5CAFCECAE9E3E475E95FBD1DCC28232BF3B2BA78F91D7
          A57EF4773012C801000000031E37D49AB7318DC099AA7E646B20069A80000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000001CBD0009E2CA62011A4C914F4B244CE806
          91096335C44E9A3E4BFE31876196536D7FBDD9D85311FE6AB97F28DF2A56B6F6
          76344D7695444474CEA4E532FB3586355AD14471AB98888DF32F038C6D52E563
          C6B3C1EED55BCFCD695FF4D3F946F9787C5F3663D8CCCFC2AFD5459CFF00A747
          F4D2D7B8CF09984E1933677799B6AFAA9D9FFF005B3E99BD145DABAF6EA6D3C6
          B3E60184EB47C2A2DED63FC965CBFCBC3631B4EC62FBC6B2C3A8A6E9673F3C72
          D7FABC6E93BE6794D1AA319E11B18C573A2CAAE4A8EAA76FD76BD545DA8A3E6F
          ED78BDDEAF96936B7ABC5A5AD73CBAD756AFE291815A5A576B54D75CE733D32A
          F96400F948000000000000000000D85B23F94DFBEE53EB6BD6C2D91FCA6FDF72
          9F5B34E0F7E22BBF7CF94A8DE3D94B66C6E4A23725D530B50000000A10DA0F3C
          0C67CA0DA75F85F7A843683CF0319F28369D7E04D2F972BF3B2BA78F91D7A57E
          F47730A08CAFCECAE9E3E475E95FBD1DCC04B200400000031AB7223726ADC88D
          C000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000072FCD09E2C8208899F9B46511A2
          418C52C9133A46A8E3C7422662368C91ABE4BF62F8761B6536D7EBDD958D11F3
          D75443C5635B56B8D96B67835D6ABC55F35A5A6B4D1FA6F959316D23C3305A78
          D7CB68A67AB6CFD235BEE8B3AABD90F7D55A534C4CCF268F3D8DE7BCBF844556
          75DEE2DEDE9FF4AC7FAA75FAE7747E6D558BE6DC7F1A9AA9BDDFEBA6CA7FD2B3
          FE9A3F8DFF009BF1E22623486A9C6785BAAA89B3C2ACBFF6AFF4A7D5EBA2E91F
          9E5ECB17DA6E337DE359E1D6745CECE7938D1FD55CC7DBBBF8792BCDEAF57CB5
          9B6BDDE2D2DAD27FCD5D5332FE496ACC531EC4718AF8D7DB59ABE5D1E11B1EAA
          2CE9A3F0C23ED482CDB1F600900000000000000000000000006C2D91FCA6FDF7
          29F5B5EB616C8FE537EFB94FAD9A707BF115DFBE7CA546F1ECA5B36372511B92
          EA985A80000005086D079E0633E506D3AFC2FBD421B41E7818CF941B4EBF0269
          7CB95F9D95D3C7C8EBD2BF7A3B98504657E76574F1F23AF4AFDE8EE602590020
          0000018D5B911B9356E446E00000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000D2677400278BD
          2988D018C44CFCDA278B2C913C8091871FEA7CB7EC5EE186D9CDADFAF565634C
          46BFD5569FC28DADBD958D135DA5514C474CEA84C44CEC7D9AB1AAD69A235AA6
          2223E799783C636A971B2E35961376AADEA8E4F7CAFF00A69FFBBC3E2D9BB1DC
          66662F57DAA8B39FF4ECFF00A69FE1AFF19E12F08C333A2C266D6BEAA767D7D3
          357A2ED5D7B7536A6339EF2FE11136769798B6B58DD6765FD53FF6785C6769B8
          B5F38D658659D374B39FF34FF557EC78CE5DFAEF47CED518C70918CE29334D95
          5C951D54EDFAEDF27AE8BB514EBDAFED7ABE5EEFD6B36D7CBC5A5B573FE6AEA9
          997F2FAE4180DA5A576B571ED2739EB9DAAF96400F9480000000000000000000
          00000000000000D85B23F94DFBEE53EB6BD6C2D91FCA6FDF729F5B34E0F7E22B
          BF7CF94A8DE3D94B66C6E4A23725D530B50000000A10DA0F3C0C67CA0DA75F85
          F7A843683CF0319F28369D7E04D2F972BF3B2BA78F91D7A57EF47730A08CAFCE
          CAE9E3E475E95FBD1DCC04B200400000031AB7223726ADC88DC0000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000006933B9314CFCE08222AF9F46511A2418F17EB6430E3CF4233C8668D7
          487C97EC56E386D8CDBDFEF56561671FE6B4AA23FF00FAF178CED5AE36315596
          1174AEF35C7245A5A7F4D1F6C46F9FE164C5B48F0CC168E35F2DA299EACF39FA
          46B7DD367557B21EF26D6298D6AD223EB7E06319EF00C238D4577A8B7B58FF00
          4EC7FAA75FAE7735562D9BB1FC6A669BDDFAAA6CA7FD2B3FE9A7F8DFF9BF1B4E
          5D665AA719E16EA9CECF0AB2FF00DAAFD298FD67C1EBA2E9FDF2F698C6D3F17B
          DCCD9E19654DD2CE7FCDDD57FABC95EAF97ABEDA4DADEEF1696D5CCEB335D5AB
          F825AB314C7F12C62AE35F2DA6AF9679447746C7AA9B3A68FC3000B3BEC00000
          00000000000000000000000000000000000006C2D91FCA6FDF729F5B5EB616C8
          FE537EFB94FAD9A707BF115DFBE7CA546F1ECA5B36372511B92EA985A8000000
          5086D079E0633E506D3AFC2FBD421B41E7818CF941B4EBF02697CB95F9D95D3C
          7C8EBD2BF7A3B98504657E76574F1F23AF4AFDE8EE6025900200000018D5B911
          B9356E446E000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000239594469F3831D2AF9B44F17A59000C26BD274
          87CD7EC56E386D136B7DBD5958D311ACCD5568A56B6F67634CD7695444474CCE
          498899D8FAE58556914C6B331111D2F098CED5AE161C6B1C2AED55E6A8E4F7CA
          BFA68F6CBC362D9C31EC66669BCDF6AA2CA7FD2B2FE9A7F8E596BFC6B84AC1F0
          CCE8BBD5CAD71D14ECF1AB67D3357A2ED5D5B7536AE339EB00C1E268B5BD45B5
          B47FA565FD557B23F3785C676A38BDF38D6785D95173B39FF3CFF557FCF247F2
          F17A6BBCD1A9F19E12719C573A2C6AE468EAA76F8D5B7E993D745DA8A7E6FED7
          ABDDEEFD6D378BEDE6D6DED2ADF55A55354FF2FE3A24605696B5DAD535DA4CCC
          CF5ABC465AA001F0900000000000000000000000000000000000000000000000
          01B0B647F29BF7DCA7D6D7AD85B23F94DFBEE53EB669C1EFC4577EF9F2951BC7
          B296CD8DC9446E4BAA616A0000001421B41E7818CF941B4EBF0BEF5086D079E0
          633E506D3AFC09A5F2E57E76574F1F23AF4AFDE8EE6141195F9D95D3C7C8EBD2
          BF7A3B9809640080000006356E446E4D5B911B80000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000002235022356511A11
          1A1320944F23E6BE62374C3ECA6F17DBCD9D8D9C7CF5D510F178C6D56E1778AA
          CB09BBD579AB771EBFE9A3DB2B262DA458660B471AFB6D14CF574CF746D7DD36
          7557B21EEAAB48A759998888F9DF818CE7AC0B0789A2D2F54DB5AC6EB3B2FEA9
          FD77355E2D9BF1EC66662F37DAA8B39FF4ECFF00A69FFBBF1A796759DED538CF
          0B53AECF0BB2FF00DAAFD223F597AA8BA7F7BDA631B4FC56FBC6B3C36C69BA51
          3FE69E5ABFECF237BBEDEEFD6936D7CBCDA5B573F3D754CBF88D578A6906258C
          D5C6BEDACD5F2CF57D363D74D9D347E184689059F3CDF6000000000000000000
          0000000000000000000000000000000000000003616C8FE537EFB94FADAF5B0B
          647F29BF7DCA7D6CD383DF88AEFDF3E52A378F652D9B1B9288DC9754C2D40000
          002843683CF0319F28369D7E17DEA10DA0F3C0C67CA0DA75F8134BE5CAFCECAE
          9E3E475E95FBD1DCC28232BF3B2BA78F91D7A57EF4773012C8010000000C6ADC
          88DC9AB722370000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000CA218C72CE8CA67EB44CE431AABE2FCEF0F9AF68F77
          C32BB4B8613145BDE6358AAD27B8A27FE65FCF68D9B6D30FB2FEC7C3ED34BC5A
          D3ADAD713CB453D1F6CB56EF99999D665A734F34FAD30FB5AB0DC3272AE35555
          757CA3E7D6F658584551C6A9F5E238AE218B5B4DE310BDDA5B57F371AAE48FB2
          373E43F34B45DBDBDA5E2B9B5B5AA6AAA76CCCE732F7E5111940029000000000
          00000000000000000000000000000000000000000000000000000003616C8FE5
          37EFB94FADAF5B0B647F29BF7DCA7D6CD383DF88AEFDF3E52A378F652D9B1B92
          88DC9754C2D40000002843683CF0319F28369D7E17DEA10DA0F3C0C67CA0DA75
          F8134BE5CAFCECAE9E3E475E95FBD1DCC28232BF3B2BA78F91D7A57EF4773012
          C8010000000C6ADC88DC9AB72237000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000002698E5D5FC6F978A2ED76B5BC573
          1116744D53F943FB53BB579CCFD7B9B9E5ABE554CE93694C59FEB3A2DF8ADEFE
          C172B5BCFF0065333F487D5119D510D3B8ADFED313C46DEFD6B3ACDB573547D5
          1F347E8F991F5A5C6F6F6D5DE2D2AB5B49CEAAA6667C57888CA3280052480000
          00000000000000000000000000000000000000000000000000000000000000D8
          5B23F94DFBEE53EB6BD6C2D91FCA6FDF729F5B34E0F7E22BBF7CF94A8DE3D94B
          66C6E4A23725D530B50000000A10DA0F3C0C67CA0DA75F85F7A843683CF0319F
          28369D7E04D2F972BF3B2BA78F91D7A57EF47730A08CAFCECAE9E3E475E95FBD
          1DCC04B200400000031AB7223726ADC88DC00000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000CA9EE61E2F6A7693465FA
          688DD5DB53AFE5CAF674BC4ED5A26702B1D3FF00BD1AFE8C5F4D6669C02F531F
          D92AB63ED21A9C07252EC0000000000000000000000000000000000000000000
          000000000000000000000000003616C8FE537EFB94FADAF5B0B647F29BF7DCA7
          D6CD383DF88AEFDF3E52A378F652D9B1B9288DC9754C2D40000002843683CF03
          19F28369D7E17DEA10DA0F3C0C67CA0DA75F8134BE5CAFCECAE9E3E475E95FBD
          1DCC28232BF3B2BA78F91D7A57EF4773012C8010000000C6ADC88DC9AB722370
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000026978FDA8D9CD7972AAE23FF2ED689FD6747AFA67965E733F587C232C
          5F7935E25315FE92C7F4A6CB97C1AF3671D3455BA152CBF1C34A241C84BB8000
          0000000000000000000000000000000000000000000000000000000000000000
          00D85B23F94DFBEE53EB6BD6C2D91FCA6FDF729F5B34E0F7E22BBF7CF94A8DE3
          D94B66C6E4A23725D530B50000000A10DA0F3C0C67CA0DA75F85F7A843683CF0
          319F28369D7E04D2F972BF3B2BA78F91D7A57EF47730A08CAFCECAE9E3E475E9
          5FBD1DCC04B200400000031AB7223726ADC88DC0000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000004775F6BF3F305DBE1
          3835F6EFA6BC7B1AA3F87E84724EAC2F34C5A585A59E9DD5331FC3CD7CB18B7B
          BD7653D3131F584D3394E6E748DC97F6BED94D8DF2DEC6634E25AD54FE92FE2E
          2FB6A392B4AA89E89985E62738CC014D20000000000000000000000000000000
          000000000000000000000000000000000003616C8FE537EFB94FADAF5B0B647F
          29BF7DCA7D6CD383DF88AEFDF3E52A378F652D9B1B9288DC9754C2D400000028
          43683CF0319F28369D7E17DEA10DA0F3C0C67CA0DA75F8134BE5CAFCECAE9E3E
          475E95FBD1DCC28232BF3B2BA78F91D7A57EF4773012C8010000000C6ADC88DC
          9AB7223700000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000009AE39275F9D8CEE65FE544C66344E70BB7C17325FACA234
          89B59AA9FB2795F8EF5FB51BAFBCE618B788D22DEC6263F2E478F87206945D7E
          C58CDE6C7AAB9DF39AEF6539D109016254000000000000000000000000000000
          0000000000000000000000000000000000001B0B647F29BF7DCA7D6D7AD85B23
          F94DFBEE53EB669C1EFC4577EF9F2951BC7B296CD8DC9446E4BAA616A0000001
          421B41E7818CF941B4EBF0BEF5086D079E0633E506D3AFC09A5F2E57E76574F1
          F23AF4AFDE8EE6141195F9D95D3C7C8EBD2BF7A3B9809640080000006356E446
          E4D5B911B8000000000000000000000000000000000000000000000000000000
          00000000000000000000000000D600037A78B208000000000000000000000000
          0000000000000000000000000009E58654EE62CA9DDA74035BED72EBF21BE69C
          913559EBFCB5BC36F6D46EDF08CBD3694D3FD5616B4D5F97CED430E63E136EBF
          67C7EBAE3F3C455BB2FD173BB4E766901AF9E800000000000000000000000000
          00000000000000000000000000000000000000001B0B647F29BF7DCA7D6D7AD8
          5B23F94DFBEE53EB669C1EFC4577EF9F2951BC7B296CD8DC9446E4BAA616A000
          0001421B41E7818CF941B4EBF0BEF5086D079E0633E506D3AFC09A5F2E57E765
          74F1F23AF4AFDE8EE6141195F9D95D3C7C8EBD2BF7A3B9809640080000006356
          E446E4D5B911B800000000000000000000000000000000000000000000000000
          0000000000000000000000004C46A08D6065C58E848238B1F3C1A69B8D60D601
          220D63A412C6A8E5D53AC74A4180000000000000000000000000000000000000
          000000000002699E598414F740FC7CDD74F8665DBFD8446B3EF53547E5CBFF00
          0D130E89BED945BDDAD6C663FF00328AA9FD61CF97AB29B0BCDAD94C69345755
          3A7E6D0FC2FDD38B6F76BD65B6269FA4E7FABDD749D530FE4034D3DA00000000
          00000000000000000000000000000000000000000000000000000000003616C8
          FE537EFB94FADAF5B0B647F29BF7DCA7D6CD383DF88AEFDF3E52A378F652D9B1
          B9288DC9754C2D40000002843683CF0319F28369D7E17DEA10DA0F3C0C67CA0D
          A75F8134BE5CAFCECAE9E3E475E95FBD1DCC28232BF3B2BA78F91D7A57EF4773
          012C8010000000C6ADC88DC9AB72237000000000000000000000000000000000
          000000000000000000000000000000000002623538BF582197163E74A008888D
          C946B1D2C6D2D6CECE8AABAEBA69A6239666748844CC446726D65AC1354446BA
          C35FE6BDB2E51CB3C7B0A6F7F0FBD531A7BCDDE78DA4FD756E8699CD5B6CCDB9
          866BB0B95AFF00665D6AFF00258CFF005CC7D757B18B62DA6186613134D55F1E
          BFEDA75CFD764322C3345F11C4F2AA9A38B4F5D5AA3D65BF3346D1B2AE54A6AF
          ED5C4ECE2D62358B1B39E3DA4FE51FF2D4798B84662F79AEBB2CB58558DD6CF7
          536D79FEBAE7EBE2C6911FCB4FDA5ADADB5736B6F695DA5A553ACD554EB333F5
          CB16B3C574FB12BECCD3769E4A9F96B9F19F4C9B0F0DD08B85D222ABCFF52AF9
          EA8FA7ABD4623B50CFF89D5355BE68BED9F1BE6B0AFDE634FF00668F9EE3B41C
          EF87DBD378BBE6AC4E6699D74B4BCD7694CFDB4D53312FC018A558ADFAAAF949
          B6AB3EBE34FAB24A70BB8D147271634E5FF8C3AE36679C2739E58B0C52DA29A6
          F344CD8DE29A7771E3E78FB7925EBE37348F06CBD55561F8C5D27969B3B6B3AE
          23ED8AB5F5437753DCC3A1746EFD5E2385D8DE2D273AA635F7C6A68CC76E745C
          311B5BBD9FE189D5DD3AD8CF7413DD0BE2D20000000000000000000000000000
          0000000000000000011C950015EE9FADA2736DD7E0798AFF006311A47BECD54C
          7D52DF13B9A7769F75F78CC9EFDA6916F654D5FA727FC35670B175E5707A2DFA
          68AE37C4C7A3D574AB2AF27914A212E755C40000000000000000000000000000
          000000000000000000000000000000000000006C2D91FCA6FDF729F5B5EB616C
          8FE537EFB94FAD9A707BF115DFBE7CA546F1ECA5B36372511B92EA985A800000
          05086D079E0633E506D3AFC2FBD421B41E7818CF941B4EBF02697CB95F9D95D3
          C7C8EBD2BF7A3B98504657E76574F1F23AF4AFDE8EE6025900200000018D5B91
          1B9356E446E00000000000000000000000000000000000000000000000000000
          0000001311D208349E865C584831E2FD6988D1289988DE0944CC4238F4FF00D5
          0FCBC773260997AED37BC5F13B0BAD111C9C7AF49ABEC8DF2A76B6B458D335DA
          4C44474CBEA8A2AB4AB8B44673D50FD5E3474BE5BFE2172C3AC2ABD5F6F56561
          65446B55769544447EAD2F9B38445853C7BAE54C3E6D2AE588BCDBF253F6C53F
          3FE6D4598337662CCF6F36D8CE2B6D6FACF251C6D288FB298E460D8B69FE1F71
          CECEEDFD4AFE5F87EBD3E0CC30CD0ABF5F72AEF1FD3A7E7B7E9EADED9AB6FB97
          7098B4BB607635625788D638D13C5B389FB7E769BCD1B4ECDD9AEAAA8BEE255D
          8DDEAFF42C2668A7F3D3965E53725AC715D2CC4F16CE9AEBE2D1D54EA8FDDB13
          0CD17C3B0CCAAA28E355D756BDDB20E59D6677C80C6B6B22D8000023506F6E0D
          144FBC6396BF371EC69FE2A6F36A1E0E971AEEF95AF77DAA8D22F57BD23937C5
          31FF0076DD8DCE8AD0FB29B2C16C22AEACFEB332D0DA516B16D8BDBCC744E5F4
          888633DD00C996000000000000000000000000000000000000000000000009E4
          8113B819C72C35AED72EBA5771BDC53F35544CFF003FF2D951B9E336A376F7FC
          BDEFDA72D85B5356BF54EB1EC621A7775FB668FDE68E988E37D27356B09CAD21
          A8F780E515D40000000000000000000000000000000000000000000000000000
          000000000000006C2D91FCA6FDF729F5B5EB616C8FE537EFB94FAD9A707BF115
          DFBE7CA546F1ECA5B36372511B92EA985A80000005086D079E0633E506D3AFC2
          FBD421B41E7818CF941B4EBF02697CB95F9D95D3C7C8EBD2BF7A3B98504657E7
          6574F1F23AF4AFDE8EE6025900200000018D5B911B9356E446E0000000000000
          00000000000000000000000000000000000000004C4278B00C7494C427724111
          1A251AE84D511BE4128E3474B0AED6CE98E3556914C46F999D1E1736ED832865
          7AABB1AAFB17DBD53AC7BC5DA62B989E899DD1FABC97CBFDDAE1472979AE298F
          9BD176BA5BDF2BE4EEF44D53F27BC9AE888D66A8799CD5B42CAF94A899C5B14B
          18B588D62C289E35ACFF00B63963ED9E4683CD7B70CDB98B8F77C3EB8C2AEB56
          B1C5B09FFC4AA3EBAF7C7E5A35E5ADA5ADB5A556B6D5D5695D53ACD554EB333D
          3ACB5D62FC2358D9E7678751C69FEE9D51F4DACEF0BD02B7B5CABBFD7C58FED8
          D73F5D90DB99B3842E318845774CB1718C3EC6793E116BA576B31D311BA9FE5A
          B311C5712C5EF35DF314BF5BDEADEB9D66BB5AE6A9FAB7BE44B5A6258E5FF16A
          B8D7AB4998EAD91F486C1B860B72C329E2DDACE227AF6CFD64016A5D00000000
          010CECACABB7B5A2C6CE266BB4AA29A62237CCCB07B8D8DE5DEC873CDCFDF2CF
          8D77B86B7BB5E8FE9EE63CEE2BDB875CEAC42F56776A36D5311EAF1E217BA6E3
          75B4BCD5F96267D37BA4725E036796F2CE1D84514C45561634C5A69F3D73CB54
          FEB32FDE9963453A69A3299E574ED858D377B2A6CA8D94C4447839DAD6D2AB6B
          4AAD6B9CE6A9CE7C5002B3E00000000000000000000000000000000000000000
          00000001953B9F899CAE9F0BCB97FB2D35D2CA6BF3797FE1FB54BF8DF2C62F17
          5B6BBD5BAD28AA89FCE1E2C46EF17BBA5AD84FE6A663EB0FAA67298973B8CEF1
          673656F6965546934D53131F64B0718DA53345534CF46A5E76C6600F90000000
          0000000000000000000000000000000000000000000000000000000006C2D91F
          CA6FDF729F5B5EB616C8FE537EFB94FAD9A707BF115DFBE7CA546F1ECA5B3637
          2511B92EA985A80000005086D079E0633E506D3AFC2FBD421B41E7818CF941B4
          EBF02697CB95F9D95D3C7C8EBD2BF7A3B98504657E76574F1F23AF4AFDE8EE60
          25900200000018D5B911B9356E446E0000000000000000000000000000000000
          000000000013A482065C582234044474A7488480089988E59471A34D41333A1C
          6A7A5F9B8CE61C1701BBCDEB17C46C6ED6711FE7AA2267EC8F9DA8F35F086BAD
          871EEB95EE3F08AF745E2DB9298FAE23E75A313C76E184D39DEAD2227AB6CCF8
          2E570C22FB89D5C5BB59CCFCFA3EADCB7CBFDCEE56355BDEEF36763674C6B355
          754444359E6BDBDE5AC1F8F76C1A99C4EF34F244D1C96713F5D5F3FE4D0D98B3
          8E63CD16B36B8CE276B6D4CCF259C4F1688FB298E47E2C4359E2DC235BDB6746
          1D47163FBA75CFD3646F6C1C2F406CACF2AEFF005F1A7AA367D76CEE7AECD3B5
          3CE19AEAAECEF5885576BB57FF00D3DDE668A74E899DF2F23091AF2F77EBC5FE
          D395BCD73555F3967975B95DEE5472777A2298F9003CAF48000000000000000E
          86E0EF977E0597EF3982D6CF4B5C42D78967AC7FA54726BF9D5C6FD21CFD73BA
          5B5FAF96172BB51C6B5BC5A53654474D554E91EB76765AC1EC301C0EE3835DA2
          38973B1A6CB5E9988E59FCE7596C4E0EB0EE5EFD5DF26355119477CFED9B01D3
          EC4391BA5174A675D739CF747EEFD48E4863BD33C91A23737635280000000000
          00000000000000000000000000000000000000002699E59845713A14EF9653B9
          1319C64342E6BBAC5D331E216311A445BD55447D533AFF00CBF261EB769D75F7
          8CCF36DA725E2C68AFF4FE9FF879371EE925D7EC58BDE6C3AABABCF3F295DECA
          AE3511200B2AA000000000000000000000000000000000000000000000000000
          0000000000000D85B23F94DFBEE53EB6BD6C2D91FCA6FDF729F5B34E0F7E22BB
          F7CF94A8DE3D94B66C6E4A23725D530B50000000A10DA0F3C0C67CA0DA75F85F
          7A843683CF0319F28369D7E04D2F972BF3B2BA78F91D7A57EF47730A08CAFCEC
          AE9E3E475E95FBD1DCC04B200400000031AB7223726ADC88DC00000000000000
          0000000000000000000000009D253A4031D354C474A74D1208D2122012319AE2
          274944DA511BE519C19B29AA237A26BA63E7788CDDB5DC9995B8F636B8845F2F
          74727C1EEBA57544F4553BA9FCDA5F356DD336E3FC7BBE17551855D6AD634B19
          99B598FAEBF9BF2D18C62DA5D866139D35D7C6AFFB69D73E3D10C830CD18C471
          4CAAB3A38B47F755AA3C3A65BF333E7ECAD956CAAAB16C5ACA8B488D62C299E3
          5A4FFB63FE5A73357086C56F935DDB2BDCA9B9D9CF27BFDB44555CFD91BA1A86
          DADEDEF16955B5E2D6BB4B4AA759AABAA66667ED61F3B58E2FA7B885FF003A2E
          DFD2A7E5F8BEBE8D87866845C6E795779FEA55F3FC3F4F57D98A62F8A63579AA
          F78A5FADEF36B56FAAD2B997C70918457695DAD5355739CCF4CB32B3B3A2CA98
          A2CE3288E88007C3EC000000000000000000001B0F61997671BCED657DB5B3E3
          5861744DE2AE4E4E3EEA23F5999FF6BA8E88D29DCD57B00CBB385E539C5ED6CF
          4B6C52D26D235DFEF74F253FF33F9B6AC7243A0F42B0EFE1F84D1C68FBD5FDE9
          F1D9BB268CD2DBFF00DBF14B49A67EED1F763C36EF633AEA1AEBCA32D6340000
          0000000000000000000000000000000000000000000000098DE9963AE8CF7835
          96D76EBC5B6B85F2237D35D9CFE53131EB96BC6DADA95D7DFF002F5378D396C2
          F14D5AFD53AC7AE61A95CC3C25DD7ECDA41695C6CAE29AB765FA2E7769CECC01
          803D000000000000000000000000000000000000000000000000000000000000
          00003616C8FE537EFB94FADAF5B0B647F29BF7DCA7D6CD383DF88AEFDF3E52A3
          78F652D9B1B9288DC9754C2D40000002843683CF0319F28369D7E17DEA10DA0F
          3C0C67CA0DA75F8134BE5CAFCECAE9E3E475E95FBD1DCC28232BF3B2BA78F91D
          7A57EF4773012C8010000000C6ADC88DC9AB7223700000000000000000000000
          00000009D241069AB2D20D2201111D29D21200000899D11C7A5F9F8BE60C1B03
          BBD57AC5AFF6376B3A235D6D2A88FD3A5F169694595335573943EA9A6AAE78B4
          C672FD0E343F95E6FB75BAD9556D79B7A2CACE88D6AAAB988888FB5A6B35F087
          B8DDAAAEED956E537AAE3922DEDBFA6CFF0028DF2D3F9933B667CD76B35E338A
          DB5AD9CCEB16313C5B3A7ECA63FE58462FA7987DC33B3BBFF52AF96A8FAFA32E
          C3342F10BF655DB7F4E9F9EDFA7AB7CE6DDBD656C166BBBE0DC6C56F34EB11EF
          73A5944FD75FCFF96AD359AB6AF9CF35CD56379C466E974ABFFA7BAEB45331FF
          00F94EFABF39D3EA78EE54B58E2DA5F89E2D9D3557C4A27A29D5F5E996C4C2F4
          530EC332AA29E3D7D756BFA46C8469CA9062EC92350000000000000000000000
          000000FAB08C3ADB18C52EB855DE27DF2F76D4D8D3C9BB59D35FCB7BE56CFD80
          65D8C4F36D78C5B59EB6586D971A9998E4F7CAB923F8D573C1AE156257FB2BAC
          7E69D7DDB6772DD8BDFA30EB95A5E67F2C6AEFE8DEE89C1B0DB1C270DBAE1B77
          B3E2D95DACA9B2A23A222221F74EED134F730C6AD7574D59D11674C514EC8D4E
          79AAA9AE66A9DB200FB400000000000000000000000000000000000000000000
          0000000227E6FB59C6E612CE3703F0B3A5D66F796311B2D359A6C66D23EDA7FA
          BFE1A3235D1D137DB1A6F375B6BBD7DCDA51344FD931A39E6D689B3B4AACAA8D
          268AA6263A25A1785FBA716F576BD47E6A669FA4E7FABDF739D534B101A71EC0
          000000000000000000000000000000000000000000000000000000000000001B
          0B647F29BF7DCA7D6D7AD85B23F94DFBEE53EB669C1EFC4577EF9F2951BC7B29
          6CD8DC9446E4BAA616A0000001421B41E7818CF941B4EBF0BEF5086D079E0633
          E506D3AFC09A5F2E57E76574F1F23AF4AFDE8EE6141195F9D95D3C7C8EBD2BF7
          A3B9809640080000006356E446E4D5B911B8000000000000000000000013A4CA
          62018EF4C53D29D21208D212000319AA239419226746136B4D31ACEE878CCD9B
          5BC9D95E2BB2B7C422F57AA7FD0BBCC5756BF5CEE8796F77DBBDC6CF95BC5714
          D3D732AF76BADB5F2BE4EC299AA7AA2337B59AE21E7F3267BCB195ECAAAB16C5
          2CACAB88E4B289E3573F9434266ADBB66AC6F8F61844C61776AB923DEE75B498
          FAEAF9BF26B7BCDE2F37CB6AADEF36F5DADA553ACD55D53333FAB5DE2DC22D85
          8E76787D1C79FEE9D51E11B659CE19A0778B6CABBF55C48EA8D73E90DC19AB84
          2E21789AEEB95EE7176A27922DEDA35AF4E988F99AA716C6F17C76F137BC5F10
          B7BD5A553AEB695CCC47D91F33E1D12D6B89E3D8862D56779B4998EAD91F46C2
          C3B04B8E174C45DECE227AF6CFD51A241665D801200000000000000000000000
          0000000226748974F6C372E4E0D936C6F5694696D8855378AB5E89E4A7F873A6
          5BC1ED71EC7AE3845953354DEADA9A27EEEBCBFC6AECBC3AE745C6E76174B1A2
          29A2C68A68A623A22346CEE0DF0EE52DED2FD546AA7EEC77CEDDDE6D75A7F7FE
          258D9DCA9FCD3C69EE8D9BFC9F56E8DCC5954C5B89AB00000000000000000000
          00000000000000000000000000000000000654EE629A677C022A8D625A1734DD
          7E0799311BBE9A445E2BAA23EAABFAA3D6DF9313A4C34DED36E9F07CD15DA69C
          978B1A2D3F3EE7FF008C354F0B575E5709B3B78FC95C7D26263CF27AEE939579
          3CA084B9DD700048000000000000000000000000000000000000000000000000
          0000000000003616C8FE537EFB94FADAF5B0B647F29BF7DCA7D6CD383DF88AEF
          DF3E52A378F652D9B1B9288DC9754C2D40000002843683CF0319F28369D7E17D
          EA10DA0F3C0C67CA0DA75F8134BE5CAFCECAE9E3E475E95FBD1DCC28232BF3B2
          BA78F91D7A57EF4773012C8010000000C6ADC88DC9AB72237000000000000000
          988D4103288E9348E8044529D23A12000000C78F100C98CD70F8714C7B09C16E
          F55EB15BF58DD6CA98D66BB5AE2986A6CD9C21F0BBA4D776CA971AEFB6B1FEBD
          B6B45947D711BEAFE3ED5AB12C6AE38553C6BD5A447CB6CFD170B86157CC4EAE
          2DD6CE6AF9F47D763715BDF2C2ED6555B5BDA536767444D555554E914C74CCCB
          5B66DDBBE53C0E2BBBE115558B5EA377BD4E96513F5D7F3FE5AB42666CF39A73
          75ACD78D62D6B6967AEB16147F45953FED8E49FCF59FADF83A6BBDACF16E11ED
          AD33B3C3A8E2C7F755B7C236478E6D8186680D14E55E215E7FEB1B3C676CF864
          F699AB6B59C735457636B7E9B9DD6AFF00E9EED334D331F5CEF978CAA66A99AA
          A99999DF320D777CBFDE710B4E52F35CD53F3967B74B8DDAE3472777A2298F97
          EBD600F23D6000000000000000000000000000000000000022776E32CCD8DB7C
          1E72F7C371FBD63D6B671345C6CFDEECE67FEBABFECE8DA6348D1E0B63996FFB
          0324DCBDF28E2DBDF35BCDAEBBFF00AB747E8F79BA9746689E1D186615656731
          F7A638D3DF3FB3426925FF00F88E25696B1B2278B1DD0808E481922C40000000
          00000000000000000000000000000000000000000000000146F9134EF9064D63
          B5DBAC5378C3EF911CB34D76733FA4C7AE5B39E236A775F7ECBD45BC53ACD85B
          D356BD113AC7FCB0ED3DBAFDAB47EF11D311C6FF00F998956BBCE5690D4C0394
          D750000000000000000000000000000000000000000000000000000000000000
          001B0B647F29BF7DCA7D6D7AD85B23F94DFBEE53EB669C1EFC4577EF9F2951BC
          7B296CD8DC9446E4BAA616A0000001421B41E7818CF941B4EBF0BEF5086D079E
          0633E506D3AFC09A5F2E57E76574F1F23AF4AFDE8EE6141195F9D95D3C7C8EBD
          2BF7A3B9809640080000006356E446E4D5B911B800000001311AA62340629E2C
          A748E8482348E84800000226746155AC5313555C911CA6CD63FA30E3C3C7669D
          AC650CAD4D5677BC429B7BCC44E961779E3D5AFD7A72434C66BDBBE66C666BBB
          E0B4C6197799E4AA99E35ACC7DBF37E4C6B16D2BC330989A6D2BE3571F969D73
          E90BF619A3788629313654654FF74EA8FDFC1BEF31678CB5962C66BC6313B1B1
          AB4E4B38AB5AE7EC88E569DCD7C21AF9789AEED952E5163472C45E2DE35AA7EB
          8A7DAD3B7BBD5EAFF6D55E2F978B4B6B5AE75AABAEA9AA67F57F26B1C5F4FEFF
          007ECECEEBFD3A7EB57D7A3C1B130CD07B95D32AEF5FD4ABE91F4E97DF8C63D8
          CE3F799BDE3388DBDEED2677DA57AC47D91BA3F27C1F3EA9182DADADA5BD535D
          A4CCCCF4CEB96656565458531459C44447446A007C2A00000000000000000000
          00000000000000000000000FDAC99825798B3461F84D113316D6D4F1F4F9A88E
          59FE1F89F9373F074CBD16F7FBF664B6B3D69BBD316163331FE6AB7CC7E5EB5E
          B47B0F9C4F12B2BBF4679CF746B59B1FBFFF000DC3AD6DFA72CA3BE75437DDDA
          EF6777B0A2C6CA229A2CE98A6988F9A223487F5AA79620A77237BA569A6298CA
          1A03BC0120000000000000000000000000000000000000000000000000000000
          46F113F37DA0FE8FC0CEF74F86659C42CF4D78B6536911F5D3CBFF000FDE8DCF
          9EFF00634DE2E76F615F2D3694554CFE70F0E27778BDDCED6C27F353547D625F
          54CE5544B9DE129B4A26CAD2AB2ABBAA26699FB610E32AA99A26699E85E63600
          3E40000000000000000000000000000000000000000000000000000000000001
          B0B647F29BF7DCA7D6D7AD85B23F94DFBEE53EB669C1EFC4577EF9F2951BC7B2
          96CD8DC9446E4BAA616A0000001421B41E7818CF941B4EBF0BEF5086D079E063
          3E506D3AFC09A5F2E57E76574F1F23AF4AFDE8EE6141195F9D95D3C7C8EBD2BF
          7A3B9809640080000006356E446E4D5B9111A803288D120C78BF5B2000000000
          63555C57C588E358760F75AAFB8ADF6C2EB614EFAED6D2288FE5F35D74D11355
          53944269A66A9E2D319CBED9AB49D1FCADEF76376B2AADEDED68B3A288D6AAAB
          AB4888FB5A8336F087C1EE9C7BB656B9577EB58E4F845AC4D1651F5C477557F0
          D3B9973E66ACD969338C62B6B5596BAC58D9CF12CE9FB2986138B69E61D87E74
          584F295FCB678CFA32DC3343310BF655DB47274FCF6F847AB7E66CDBAE53C062
          BBBE1D55589DEA9E4E2D8CE9444FD757B1A6334ED7B38E67E358CDF7E0575AB5
          8F79BBEB4EB1F5CEF9789D3EB94B58E2DA6189E2B9D135F128EAA756FDAD8986
          689E1D86E55F178F5F5D5FA46C2AAAAAEA9AABAA6A999D6666794062D333339C
          B26D9AA00100000000000000000000000000000000000000000000000001A4CC
          C447CF3A3AD365797A32EE4AC3EE9551C5B6B5A3E116DAC72F1ABE5E5FCB4873
          6ECF3009CCB9C70DC2AAA38D6555AC5A5B7D5674F2CFAB4FCE1D8363674D3671
          4D3111111A4690DAFC1B61DED6FF00547FAC79CB5970817FD76571A7FF0029F2
          867BA9447226A9E588436CB5A000000000000000000000000000000000000000
          000000000000000000089480CA3731AA98989E5651B898E4944C67190D0599AE
          B373CC37FB09A74D2DEAAA23EA9E5FF97E646E7A9DA55D7E0F99ED2D229D22DE
          CE9AFED9DDFF0010F2EE3CD22BAFD8B16BC5DFFB6BABCF35E2CE78D444802CCF
          B0000000000000000000000000000000000000000000000000000000000001B0
          B647F29BF7DCA7D6D7AD85B23F94DFBEE53EB669C1EFC4577EF9F2951BC7B296
          CD8DC9446E4BAA616A0000001421B41E7818CF941B4EBF0BEF5086D079E0633E
          506D3AFC09A5F2E57E76574F1F23AF4AFDE8EE6141195F9D95D3C7C8EBD2BF7A
          3B9809640080000000000000112091FCE6D38BBF4D3A5E4734ED4F29E54A6AA6
          FD88D9DB5E22392C2C678F5CFE9BBF379AF57CBBDCACE6D6F15C534C74CCE4AD
          77BB5B5EABE4EC299AAAEA88CDEBFDF2227497E2660CE997F2BD84DE319C4AC2
          C223751356B5D5F6531CB2D0B9B76F598F199B4B0C0AC69C36EF56B115F756B3
          1F6EE86B3BD5F2F7885BD57ABF5E6D6DEDAB9E5AED2B9AAA9FCE5AF315E116ED
          619D9E1F4F1EAEB9D54FACB39C3340EF36F9577EAB894F546B9F48DEDCD9B784
          55E2DE6BBAE52C3A2CA9D748BCDE6359FCA8F6CFE4D4B8CE61C6F315E66F98DE
          276F7CB5F9A6D2BE4A7EC8DD1F943F392D698A6906218BD5FF00EAB4998EA8D5
          1F4E9F16C2C3702B8E151FFE7A233EB9D73F5F447D49059A75ED5DB288D80024
          00000000000000000000000000000000000000000000000000046BA6F494D355
          754534C6B3331111F59119CE50899888CE5BC7838E5D988C4733DB51CB3A5D2C
          2663ECAABFFE3FCB7AD3BB95E6B67997BB18CA18661155114DA5958C556DD336
          9572D5FCCCBD2CC690E94D1CC3BF85E1B65779DB9673DF3AE5CFB8E5FE712C42
          D6F1D133947746A844EF017C5A80000000000000000000000000000000000000
          00000000000000000000001953B8AB74B1A37CB306AFDAD5D78B78B8DF298EEA
          9AACEA9FD261AFDB5F6A974F7DC0ECEF31FE85B44CFD93C8D50E5EE126EBF66D
          21B5AA365714D5BB2FD173BB4E767000C0DE8000000000000000000000000000
          0000000000000000000000000000000001B0B647F29BF7DCA7D6D7AD85B23F94
          DFBEE53EB669C1EFC4577EF9F2951BC7B296CD8DC9446E4BAA616A0000001421
          B41E7818CF941B4EBF0BEF5086D079E0633E506D3AFC09A5F2E57E76574F1F23
          AF4AFDE8EE6141195F9D95D3C7C8EBD2BF7A3B980964008000000018D5571419
          31AAAD1F16218C5C309BB557CC4AFB6376B0A37D76B5C531FCB55E6DE10B83DC
          38F74CB574AAFF006D1C9EFD5FF4D947D71F3CFF000B5E238CDC70BA38D7AB48
          A7E5D33E0F7DC30BBE6275716EB67357CFA3EBB1B72DAF765614556B6D69459D
          14C6B355531111F9B5EE6ADB9654CBF15D85CED7FB4AF54EB1C4B19FE989FAEA
          682CC9B41CD59AABABFB5313B48B299E4B1B39E2D11F946F79CD356B5C5B847A
          EBCECF0EA328FEEAB6F847AB60617A034D395788579FFAC7EB3E8F759AB6C79B
          F337BE58D17AF805D6BFF46EF3A4E9F5D5BE5E1EAAAAAEA9AEBAA6AAAA9D6666
          759996296B9BEE237AC4ABE52F55CD53F3F4E867B73B85DAE1472776A2298F97
          FF006B4689078DEC000000000000000000000000000000000000000000000000
          0000000000001EBB65197BB23CF387DDABA38D6176ABE156FD1C5A39623F3AB8
          B0F2133A72B7F7073CBB376C2AFD98EDACFF00AEF969161653A72F128DFF00AD
          5EA645A29877F13C5ACACA7F0C4F1A7BA35F9B1FD27BFF00F0FC32D2B8DB31C5
          8EF9D5BA35B74514F242667E629E48E544EF7473438000000000000000000000
          00000000000000000000000000000000000000000269DF2C9846F660F3F9E2E9
          F0ACB37FA34D669A38F1F6C72B473A1B13B1A6F171BC58D51AC5765547F0E7BB
          5B39B2AEBB29DF45534CFE4D07C2EDD7897BBBDEA3F35331F49FDDEFB9CEA984
          088DC969E7B00000000000000000000000000000000000000000000000000000
          000000006C2D91FCA6FDF729F5B5EB616C8FE537EFB94FAD9A707BF115DFBE7C
          A546F1ECA5B36372511B92EA985A80000005086D079E0633E506D3AFC2FBD421
          B41E7818CF941B4EBF02697CB95F9D95D3C7C8EBD2BF7A3B98504657E76574F1
          F23AF4AFDE8EE60259002000044A58D5B81F8F98B36E0395AEDF0AC7314B0BAD
          33AF169AE7FAABFAA9A63967F269ECD7C232DAD62BBAE53C362889D69F84DE63
          59FB69A2393F5D7EC470958FFF009382CF4D169EB86926A2D30D2EC42E77DAEE
          17598A29A72D7D339C67E0D9BA2DA2D71BE5D28BEDE73AA673D5D1194E5E2FD2
          C6B31E3998AF337AC6714BC5EAD26758E3D7C94FD94EE8FCA1F9A91AC2D6DAD2
          DEB9B4B4AA6667A65B1ECAC6CEC298A2CA98888E880053540000000000000000
          000000000000000000000000000000000000000000000000006565636B79B7B3
          BB5851C7B4B5AA28A298F9EA99D223F9764E4DC0ECF2EE5AC3F07B3A7E4D614D
          354E9BEAD35AA67EB99D5CDDB18CBDFDBD9E2EB5DAD9F1AC2E1ADE6BE4E4D639
          29FE675FC9D5944690DC3C1B61DC4B0B4BF551AEA9E2C7746DDED55A7F7FE52D
          ECEE74CEAA6339EF9FD8AA748D1055CB2367B5E0000000000000000000000000
          000000000000000000000000000000000000001AE92CDFCE7E6FB59C6E0635C4
          4C4B41E64BB45CB1DBF5DB4D38B6F54FEBCBFF002DFD31C92D31B47BAFC1F33D
          AD71BADA8A6BFCDA9F85ABA72B85D95E23F257BA625EBBA5595730F2C9073D2E
          0000000000000000000000000000000000000000000000000000000000000361
          6C8FE537EFB94FADAF5B0B647F29BF7DCA7D6CD383DF88AEFDF3E52A378F652D
          9B1B9288DC9754C2D40000002843683CF0319F28369D7E17DEA10DA0F3C0C67C
          A0DA75F8134BE5CAFCECAE9E3E475E95FBD1DCC28232BF3B2BA78F91D7A57EF4
          773012C801000031AB7326356E112D0DC25BE5182FDCB4F5C348E8DDBC25FE51
          82FE1DA7AE1A4DCF5A6DEFBB6F0FF986F2D0FF0073D978F9C8031464E0000000
          0000000000000000000000000000000000000000000000000000000000022652
          FEF70B95B6237DB0B85DE35B4BC5A53674C7D733A3EA8A2AB4AE28A76CEA7CD7
          5D3674CD756C8D6E81E0F797BE01972DF1CB4A34B4C42D34A6663FD3A7923F9D
          65B7A9E4A5F9796F07B2C1704B9617654F168BB58D367A7D711CAFD49E48D1D3
          582DC230CB8D95DA3F2C467DFB677B9E715BE4E217CB4BCCFE699CBBBA372397
          E701745BC0000000000000000000000000000000000000000000000000000000
          000000009651B98B2A77013CAD5FB5BBB4517CB95EE2392AA2AA27EBE5D5B45E
          136AD75F7DC12CAF3A72D8DB47F31A30CD3FBB7DAF47EF14F4D31157D26255AE
          F395A43550884B95575000000000000000000000000000000000000000000000
          0000000000000001B0B647F29BF7DCA7D6D7AD85B23F94DFBEE53EB669C1EFC4
          577EF9F2951BC7B296CD8DC9446E4BAA616A0000001421B41E7818CF941B4EBF
          0BEF5086D079E0633E506D3AFC09A5F2E57E76574F1F23AF4AFDE8EE6141195F
          9D95D3C7C8EBD2BF7A3B98096400800018D5B9931AB7089685E12FF28C17F0ED
          3D70D26DD9C25FE5182FE1DA7AE1A4DCF5A6DEFBB6F0FF00986F2D0FF73D978F
          9C8031464E000000000000000000000000000000000000000000000000000000
          000000000000362EC2F2F7F6CE72A2FF006967C6B1C3689B69D63FCD3C94B5CC
          BA5760B97A9C2B284E276B6734DB62569EF9ACFF00D11C94FF00CB2CD0BC37F8
          8E2D67C68CE9A3EF4F86CDEC5F4BF10FB0E195C533F7ABFBB1E3B77368D9EE27
          96534F25288D7E77423478000000000000000000000000000000000000000000
          0000000000000000000000009A3E7414EF9066F399EEE9F0ACB37DA698D668A7
          DF23F297A37C78AD845E70FBCDDE635F7CB2AA9D3ED85BF16BB45F2E36D613F9
          A9AA373EA99CAA8973CC4CEEE8649B5A3DEED2AB398E5A6669FD18B8D2BA6689
          9A67A178480F9480000000000000000000000000000000000000000000000000
          00000000D85B23F94DFBEE53EB6BD6C2D91FCA6FDF729F5B34E0F7E22BBF7CF9
          4A8DE3D94B66C6E4A23725D530B50000000A10DA0F3C0C67CA0DA75F85F7A843
          683CF0319F28369D7E04D2F972BF3B2BA78F91D7A57EF47730A08CAFCECAE9E3
          E475E95FBD1DCC04B20040000C6ADCC98D5B844B42F097F9460BF8769EB86936
          ECE12FF28C17F0ED3D70D26E7AD36F7DDB787FCC379687FB9ECBC7CE4018A327
          0000000000000000000000000000000000000000000000000000000000000000
          007D982E1B6D8CE2F73C2AEF4CD5697AB6A6CE223EB9767611865861786DDB0F
          B1A2228BB5953674E9F5468E76D8065EFED2CD7698C5A59F1ACB0DB3D626777B
          E55C91FF0032E95A63486E9E0E70EE42E55DF2B8D75CE51DD1FBB5169E621CBD
          F69BA533AA88D7DF3FB644E91C9084CEF4363B04000000000000000000000000
          000000000000000000000000000000000000000000131BD046F066C2D2989866
          8AB4D3951319C6439FF305D66E78DDF6ED31A4516F5C47EAF81E9768975F8366
          8BC4FCD6B4D3691F5EB1CAF34E39C7AEBF62C52F161FDB5D5E6BC59CF1A98005
          A5F6000000000000000000000000000000000000000000000000000000000361
          6C8FE537EFB94FADAF5B0B647F29BF7DCA7D6CD383DF88AEFDF3E52A378F652D
          9B1B9288DC9754C2D40000002843683CF0319F28369D7E17DEA10DA0F3C0C67C
          A0DA75F8134BE5CAFCECAE9E3E475E95FBD1DCC28232BF3B2BA78F91D7A57EF4
          773012C801000031AB7326356E112D0BC25FE5182FE1DA7AE1A4DBB384BFCA30
          5FC3B4F5C349B9EB4DBDF76DE1FF0030DE5A1FEE7B2F1F3900628C9C00000000
          0000000000000000000000000000000000000000000000000000000425FA5967
          06B5CC1982E18358C72DEADE8B39FAA9D6359FCA3555B1B1AEF1694D951B6A98
          88F153B6B5A6C2CEAB5AF644673DD1B5D1DB0ECBBFD8992AC2F36D65A5BE2354
          DE6A99DFC5DD4C7E9CBF9B63EEA791FC2E174B1B95D2CAE96144536763674D9D
          111F35311A43FB55D0E9DC36E74DC2E96776A7653110E75BF5EAABF5E6BBC55B
          6A999400F73CA000000000000000000000000000000000000000000000000000
          000000000000000227E64A2419C1546B046E277226721AB76B574E25FEE77C88
          D22BB39A3F389D7FE5E09B4F6AB759B4C1EEF7B88D7DE2DB4FCA63FECD570E5D
          E11EEBF66D20B5988FC71157D63D735CEED39D9C24060AF40000000000000000
          000000000000000000000000000000000000000000D85B23F94DFBEE53EB6BD6
          C2D91FCA6FDF729F5B34E0F7E22BBF7CF94A8DE3D94B66C6E4A23725D530B500
          00000A10DA0F3C0C67CA0DA75F85F7A843683CF0319F28369D7E04D2F972BF3B
          2BA78F91D7A57EF47730A08CAFCECAE9E3E475E95FBD1DCC04B20040000C6ADC
          C98D5B844B42F097F9460BF8769EB86936ECE12FF28C17F0ED3D70D26E7AD36F
          7DDB787FCC379687FB9ECBC7CE4018A327000000000000000000000000000000
          000000000000000000000000000000000436E7078CBBF0DC7AF7986DACB5B3B8
          59C59594CC7FA95FCF1F65313E7351CE9F3BAB763997632E646B8D95AD9F16DE
          FB1F0CB6D77EB5E9311F95314B34D03C37EDD8AC5AD51F76CE38DE3D1BD87E9B
          5FFEC786CD9533F7AD272F0E9FFEF9BDD51A69C8899D66597CCC5BF1A5C00000
          0000000000000000000000000000000000000000000000000000000000000000
          001953B92C699DF0C81E6F3EDD3E1595EFB1A72D9C45A47E531AFF001AB496B1
          3F33A0F18BBC5EB0BBD5D669D7DF6C6BA3F58973F574CD35D54EED2661A0385D
          BA459DFAEF79FEEA663E93FBAE1739CE26100350BD6000000000000000000000
          0000000000000000000000000000000000003616C8FE537EFB94FADAF5B0B647
          F29BF7DCA7D6CD383DF88AEFDF3E52A378F652D9B1B9288DC9754C2D40000002
          843683CF0319F28369D7E17DEA10DA0F3C0C67CA0DA75F8134BE5CAFCECAE9E3
          E475E95FBD1DCC28232BF3B2BA78F91D7A57EF4773012C801000031AB7326356
          E112D0BC25FE5182FE1DA7AE1A4DBB384BFCA305FC3B4F5C349B9EB4DBDF76DE
          1FF30DE5A1FEE7B2F1F3900628C9C00000000000000000000000000000000000
          00000000000000000000000000403F73256015667CD586E0B14CCD16F6D4FBEF
          D5671FD557F113FC3B22C2CACECACE9B3A2988A698888888D348683E0E7977DF
          AF988E67B6A234B1A62EB613F5CE935CFF00ED8FCE5BFE88D296F2E0F70EFB26
          1B378AE3EF5A4E7E11AA3F569AD38BFC5EB11E4299FBB671978CEDFD0AB97910
          6BACC8CF98600000000000000000000000000000000000000000000000000000
          0000000000000000000146F966C69DEC81FCED238D4E9A6F680C76EB372C66F9
          75D3FF002EDABA63ECD791D05546B0D2BB42BAFC1B355EA62348B68A6D23F388
          D7F9D5A9785CBA72986D8DE72FC15E5F58FD9EBB9CE554C3CD00E7C5C0000000
          0000000000000000000000000000000000000000000000000006C2D91FCA6FDF
          729F5B5EB616C8FE537EFB94FAD9A707BF115DFBE7CA546F1ECA5B36372511B9
          2EA985A80000005086D079E0633E506D3AFC2FBD421B41E7818CF941B4EBF026
          97CB95F9D95D3C7C8EBD2BF7A3B98504657E76574F1F23AF4AFDE8EE60259002
          00006356E64C6ADC225A1784BFCA305FC3B4F5C349B767097F9460BF8769EB86
          9373D69B7BEEDBC3FE61BCB43FDCF65E3E7200C5193800000000000000000000
          00000000000000000000000000000000000000008E599888E59925E9B66D97E7
          32E72C3B0FAA8E359516B16F6DF728E5E5FCF48FCDE9B9DDABBE5E28B0A36D53
          11F579EF779A6E7615DE2BD94C4CFD1D27B2FCB9196B25E1F70AA98A6DABB3F7
          EB6FBF5F2CFAF4FC9EBB752C6C68A68B38A698D2223488E865572F23A7AE976A
          2E76145859ECA62223C1CEB78B6AAF36B55B57B6A999FAA007A5440000000000
          000000000000000000000000000000000000000000000000000000000000008D
          ECD86BA68CC11546B0D59B5ABAF1312B9DF22392D6CA68F3675FFE4DA73B9E07
          6AF74F7CC22EB7B8E5F7AB7E24FD51544FB2184F08776FB568F5E232FC3955F4
          98FD15AEF395A435700E585D4000000000000000000000000000000000000000
          0000000000000000006C2D91FCA6FDF729F5B5EB616C8FE537EFB94FAD9A707B
          F115DFBE7CA546F1ECA5B36372511B92EA985A80000005086D079E0633E506D3
          AFC2FBD421B41E7818CF941B4EBF02697CB95F9D95D3C7C8EBD2BF7A3B985046
          57E76574F1F23AF4AFDE8EE6025900200006356E64C6ADC225A1784BFCA305FC
          3B4F5C349B767097F9460BF8769EB869373D69B7BEEDBC3FE61BCB43FDCF65E3
          E7200C5193800000000000000000000000000000000000000000000000000000
          00000021BD783965DE2D8E2199EDA8D26D27E0F61331F3472D531F6CE91F9346
          59D9D56B694D959D3335D754534C47CF33B9D859032FD396F2A61F8644695D9D
          8C5569F5D73CB32CFB83CC3BED788CDEAA8D5671BE76306D3BBFFD9EE3176A67
          5DA4EE8DBBF27A3A792372279594CF2316F188CB534FC0025200000000000000
          000000000000000000000000000000000000000000000000000000000089671B
          98B28DC09799DA0DDBE11956FBA46B5594536B1FEDAA267F8D5E99F0E31758BF
          6197BB9CFF00AF635D9FEB130B6631758BE61F6F779FCD4551B9F7673C5AA25C
          FBBB784CF4C8E36AA329C9780040000000000000000000000000000000000000
          0000000000000000003616C8FE537EFB94FADAF5B0B647F29BF7DCA7D6CD383D
          F88AEFDF3E52A378F652D9B1B9288DC9754C2D40000002843683CF0319F28369
          D7E17DEA10DA0F3C0C67CA0DA75F8134BE5CAFCECAE9E3E475E95FBD1DCC2823
          2BF3B2BA78F91D7A57EF4773012C801000031AB7326356E112D0BC25FE5182FE
          1DA7AE1A4DBB384BFCA305FC3B4F5C349B9EB4DBDF76DE1FF30DE5A1FEE7B2F1
          F3900628C9C00000000000000000000000000000000000000000000000000000
          00000403D96C9B2F76459D6E5635D1C6B1BACFC26D758E4D29DDFCBAD2CE34A6
          223768D35C1D72E7C1F08BE661B5A3FAEF75FBD59CE9FE4A77FF002DCD4F2437
          DE8261BF60C2A9B4AA3EF5A4F1BC3A1A4B4C710FB6E2755113F768FBB1FAEF2A
          DE8066AC50000000000000000000000000000000000000000000000000000000
          000000000000000000000654EE629A3E7FB41930B48D634D19B1AB722622A8CA
          4D8E7DC6EEBF03C62FB7488D22CADEBA623EAE34E9FC3E27A4DA15D7E0B9AEF7
          311A45B4516B11F6D3113FCC4BCE38DF1CBACDCB12BC5DFF00B6BAA37AF344F1
          A989005ADF400000000000000000000000000000000000000000000000000000
          03616C8FE537EFB94FADAF5B0B647F29BF7DCA7D6CD383DF88AEFDF3E52A378F
          652D9B1B9288DC9754C2D40000002843683CF0319F28369D7E17DEA10DA0F3C0
          C67CA0DA75F8134BE5CAFCECAE9E3E475E95FBD1DCC28232BF3B2BA78F91D7A5
          7EF4773012C801000031AB7326356E112D0BC25FE5182FE1DA7AE1A4DBB384BF
          CA305FC3B4F5C349B9EB4DBDF76DE1FF0030DE5A1FEE7B2F1F3900628C9C0000
          000000000000000000000000000000000000000000000000000006777B0B5BDD
          E2CAED634CD55DAD7145311D333A307BBD8B65DFEDECED77B4B4A35B0B844DE6
          D26639358EE63F5D1EEC32E556237BB3BAD1F9A623D773C588DF29B85D2D2F15
          7E589FDB7BA4B27E076597B2EDC308B3A74F8358D34D5F5D5A6B3FCBF66A99D3
          91167BB42675974ED8595361674D951B222223C1CEF696955AD736956D99CC01
          55F0000000000000000000000000000000000000000000000000000000000000
          000000000000000269F9D098DE0C8113AE9C80D57B59BAF1314B9DEE2392D6CA
          AA27EDA675FF00E4F08DA3B5BBAF1F08BADEE98E5B2B7E2CFD9544FF00CC4357
          396B845BAFD9B486DA72FC5955F58F5895D2EF39D9C003075700000000000000
          00000000000000000000000000000000000000001B0B647F29BF7DCA7D6D7AD8
          5B23F94DFBEE53EB669C1EFC4577EF9F2951BC7B296CD8DC9446E4BAA616A000
          0001421B41E7818CF941B4EBF0BEF5086D079E0633E506D3AFC09A5F2E57E765
          74F1F23AF4AFDE8EE6141195F9D95D3C7C8EBD2BF7A3B98096400800018D5B99
          31AB7089685E12FF0028C17F0ED3D70D26DD9C25FE5182FE1DA7AE1A4DCF5A6D
          EFBB6F0FF986F2D0FF0073D978F9C8031464E000000000000000000000000000
          000000000000000000000000000000899746F07ACB9370CB56D8E5B51A5AE236
          9A51C9FE9D3C91FACEBFA39EAE172B5C4AFD77C3EC299AAD6F1694D9D111D333
          A3B3B2E613638160D73C26C22228BAD8D367C9F3CC472CFE73ACB63F0718772F
          7CAEF95C6AA2328EF9F48601A7D7FE4AEB45CE99D75CE73DD1FBBF462348426A
          D74E44374B530000000000000000000000000000000000000000000000000000
          0000000000000000000000000006BA4C089DF00FE8003CC6D0EEBF0ACAD7C888
          E5B3E2DA47FB6627DAD2DA6910E80C6EED17CC2AF7749FF56C6BA7F5873FCEB1
          33130E7EE176E9C9DFEC2F31F9A9CBE93FBAE1749CE998006A37AC0000000000
          000000000000000000000000000000000000000000006C2D91FCA6FDF729F5B5
          EB616C8FE537EFB94FAD9A707BF115DFBE7CA546F1ECA5B36372511B92EA985A
          80000005086D079E0633E506D3AFC2FBD421B41E7818CF941B4EBF02697CB95F
          9D95D3C7C8EBD2BF7A3B98504657E76574F1F23AF4AFDE8EE602590020000635
          6E64C6ADC225A1784BFCA305FC3B4F5C349B767097F9460BF8769EB869373D69
          B7BEEDBC3FE61BCB43FDCF65E3E7200C51938000000000000000000000000000
          0000000000000000000000000000899D01B2360F972719CE54E236D471AC30BB
          39B7E58D63DF279288F5CFE4E9FA2346B0D81E5C9C232746296B67316F8ADA4D
          BF2C72C59C7F4D11FC4CFE6D9F1AC472C3A1342F0DFE1D84D9F1A3EF57F7A7C7
          66EC9A2B4AEFFF00C4314B4AA27EED1F763C36EFCC99E54032C6380000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00001200CB7A511B920FE76B4C554CC4C724C68E7EC6AED374C5EF976DDEF76D
          5C47D9AF23A0EADCD27B40BAFC17345EF4A748B5E2DA47E71A7FC351F0BB75E3
          E1F63798FCB565F58F587AEE9395530F3A039F97000000000000000000000000
          00000000000000000000000000000001B0B647F29BF7DCA7D6D7AD85B23F94DF
          BEE53EB669C1EFC4577EF9F2951BC7B296CD8DC9446E4BAA616A0000001421B4
          1E7818CF941B4EBF0BEF5086D079E0633E506D3AFC09A5F2E57E76574F1F23AF
          4AFDE8EE6141195F9D95D3C7C8EBD2BF7A3B98096400800018D5B9931AB70896
          85E12FF28C17F0ED3D70D26DD9C25FE5182FE1DA7AE1A4DCF5A6DEFBB6F0FF00
          986F2D0FF73D978F9C8031464E00000000000000000000000000000000000000
          00000000000000003ECC170AB7C7318B960F778FFC4BE5BD1634CE9AE9ACC44C
          FE51CAF8A5B5383E65CFED3CD16F8E5AD9CCD961765A51AFFF0072BE48FD2227
          F55D305B84E277FB2BAF4553AFBA36EE5B718BF461B71B4BCF4C46AEF9D51BDD
          13855C2ED865C2EF87DCECE28B0BAD95363671D14D31111EA7D552288D21333A
          BA6A8A628A6298D90E7A999AA739400FA4000000000000000000000000000000
          000000000000000000000000000000000000000000000000000268DCC98D1F3C
          32044C6B0D51B57BAFBDE2B75BD453A7BF594D33F94FFDDB5E75D391E036B375
          E3E1B75BDC472D95AF167EC9860FC22DD7ED5A3F6D96DA72ABE92AD779CAD21A
          BC072D2EA0000000000000000000000000000000000000000000000000000003
          616C8FE537EFB94FADAF5B0B647F29BF7DCA7D6CD383DF88AEFDF3E52A378F65
          2D9B1B9288DC9754C2D40000002843683CF0319F28369D7E17DEA10DA0F3C0C6
          7CA0DA75F8134BE5CAFCECAE9E3E475E95FBD1DCC28232BF3B2BA78F91D7A57E
          F4773012C801000031AB7326356E112D0BC25FE5182FE1DA7AE1A4DBB384BFCA
          305FC3B4F5C349B9EB4DBDF76DE1FF0030DE5A1FEE7B2F1F3900628C9C000000
          000000000000000000000000000000000000000000000001133A43A9762196E3
          03C9175B7B4A38B6F88EB7BB4D77E957731E6C439BF2B609699873161F83D113
          3F09B7A69AF4F9A8DF54FE912ECCB8DDECEEB76B3BB595314D1654C514C47CD1
          11A368706D874576D6B7EAA3553F763BE75CB5BF0817FE2D9D95CA9E9FBD3DDB
          21FDA7929426A437035780000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000269DFF006B261AE930CC0797
          DA25D7E1595EF5A472D9716D35E8D25EA1F9B8FDDBE1983DF2ED31AFBE59551F
          C2D78DDDA2F9875BD84FE6A2A8DCFBB39E2D512D0333101544C4CC4C4EB1BC71
          BD51C59C97800400000000000000000000000000000000000000000000000000
          003616C8FE537EFB94FADAF5B0B647F29BF7DCA7D6CD383DF88AEFDF3E52A378
          F652D9B1B9288DC9754C2D40000002843683CF0319F28369D7E17DEA10DA0F3C
          0C67CA0DA75F8134BE5CAFCECAE9E3E475E95FBD1DCC28232BF3B2BA78F91D7A
          57EF4773012C801000031AB7326356E112D0BC25FE5182FE1DA7AE1A4DBB384B
          FCA305FC3B4F5C349B9EB4DBDF76DE1FF30DE5A1FEE7B2F1F3900628C9C00000
          000000000000000000000000000000000000000000000044A5126D1B8383B65D
          F866337DCC36D67AD174B3F79B2998E4E3D5CB3FC69FABA1A88D1E2764396E72
          F649B8D9574C536D79A7E116BAC72EB572E9F943DBF730E8DD14C3BF86615656
          531AE6339EF9682D23BFFF0011C4AD6DA27544E51DD08F9F50191AC800000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000089DF0FE8FE73D2FE803F95AD1C6B3AA99DD31312FEA8AA3587CD
          54C55194913939EB17B0F82E297ABB4C7FE5DB551FCBE57EFE7EBAFC17345EE2
          234F7D98B4FD61F80E37C6AEDF63C46DEC3FB6BAA37AF344E74C4802D8FA0000
          000000000000000000000000000000000000000000000001B0B647F29BF7DCA7
          D6D7AD85B23F94DFBEE53EB669C1EFC4577EF9F2951BC7B296CD8DC9446E4BAA
          616A0000001421B41E7818CF941B4EBF0BEF5086D079E0633E506D3AFC09A5F2
          E57E76574F1F23AF4AFDE8EE6141195F9D95D3C7C8EBD2BF7A3B980964008000
          18D5B9931AB7089685E12FF28C17F0ED3D70D26DD9C25FE5182FE1DA7AE1A4DC
          F5A6DEFBB6F0FF00986F2D0FF73D978F9C8031464E0000000000000000000000
          000000000000000000000000000003F7722E075E63CD787617144D54576D155A
          7DC8E597E13757074CBBC7BCDFB325B596B14445DAC6663E79E5AA617CD1BC3F
          F89E276561D19E73DD1AD65D21BFFF000EC3AD6DA275E59477CB7CDDACE8B1B2
          A2CACE98A69A298A6223E68867514469108F9F5749D3111194340F7802400000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000001946E629A675806489DC94553A40353ED56E9EF58BDDEF711
          C96D65A4FDB12F10D9BB59BAF1EE174BDE9CB676B34CCFD530D64E57E10AEBF6
          5D20B7CB655955F585D6EF571ACE001852B00000000000000000000000000000
          00000000000000000000000D85B23F94DFBEE53EB6BD6C2D91FCA6FDF729F5B3
          4E0F7E22BBF7CF94A8DE3D94B66C6E4A23725D530B50000000A10DA0F3C0C67C
          A0DA75F85F7A843683CF0319F28369D7E04D2F972BF3B2BA78F91D7A57EF4773
          0A08CAFCECAE9E3E475E95FBD1DCC04B20040000C6ADCC98D5B844B42F097F94
          60BF8769EB86936ECE12FF0028C17F0ED3D70D26E7AD36F7DDB787FCC379687F
          B9ECBC7CE4018A32700000000000000000000000000000000000000000000000
          00002226A98A698D66674888F9DD75B30CBD196F26E1F709A34B5AACE2DAD793
          7D5572B9B366B97E732673C3AE1559F1AC68B4F7EB6E4FF253CB2EBDB1A78B44
          531111111F336CF06D876AB5BFD5FF008C79CB5870817FCEBB2B953D1F7A7CA1
          9CCE90C5354A1B5DAD8000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000004D1B909A7E70648480F2BB
          46BAC5E32C5E2AD359B29A6D3F49FF00BB4CB7EE61BB45F306BE5DE7FCF63569
          F6E9AB40CC4C4CD33BE274973E70B975E4F11B1BC47E6A72FA4FEEB8DD273A66
          2520352BD4000000000000000000000000000000000000000000000000000361
          6C8FE537EFB94FADAF5B0B647F29BF7DCA7D6CD383DF88AEFDF3E52A378F652D
          9B1B9288DC9754C2D40000002843683CF0319F28369D7E17DEA10DA0F3C0C67C
          A0DA75F8134BE5CAFCECAE9E3E475E95FBD1DCC28232BF3B2BA78F91D7A57EF4
          773012C801000031AB7326356E112D0BC25FE5182FE1DA7AE1A4DBB384BFCA30
          5FC3B4F5C349B9EB4DBDF76DE1FF0030DE5A1FEE7B2F1F3900628C9C00000000
          0000000000000000000000000000000000000000409B3A2BB5B4A6CA88D6AAEA
          8A63F54C44CCE508998A75CEC6F6E0E397A2CEEF7FCCB6D67FD56B3176B1AA7A
          2396A9F537851B9E7B21E5FA32DE55C3B088A229AECEC62AB5FAED2796AFE65E
          867923474A68EE1F18661B6577E988CE7BE75CB9F71BBF7F12BFDADE3A267577
          46A8400BDAD40000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000002637A113BE01FD0007F2B6A22AB39
          A27962A898973EE2961375C4AF57798D3DEED6A8D3F3742D51AC347E7ABB7C17
          345F69D3FF0032A8B4FD6356A1E176E9C7B8585E23F2D531F58FD9ECBA4FDE98
          7E080D00F78000000000000000000000000000000000000000000000000000D8
          5B23F94DFBEE53EB6BD6C2D91FCA6FDF729F5B34E0F7E22BBF7CF94A8DE3D94B
          66C6E4A23725D530B50000000A10DA0F3C0C67CA0DA75F85F7A843683CF0319F
          28369D7E04D2F972BF3B2BA78F91D7A57EF47730A08CAFCECAE9E3E475E95FBD
          1DCC04B20040000C6ADCC98D5B844B42F097F9460BF8769EB86936ECE12FF28C
          17F0ED3D70D26E7AD36F7DDB787FCC379687FB9ECBC7CE4018A3270000000000
          0000000000000000000000000000000000000044BD9EC8B2F4E62CF171B1AECF
          8D61749F855AF27269469A47E73A43C6BA0B83A65DF8360B7DCC36B67A5A5F6D
          3DE6CA66397DEE8DFF00AD5AF9AC9744B0DFE278AD9D9CC7DDA678D3E1AF7CB1
          ED29BFFF000FC32D2A89FBD57DD8F1FD9B8ACA98888E56533CA534F1637A37BA
          2E1A1E3E60024000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000044EF8480CC446E4822ADDCAD49B5
          5BAC59635637988D22DAC635FB6274F536D57133B9AF76B7759AAE573BDC53DC
          5A5544CFDB1FF660BC23DD7ED5A3D6D96DA72ABE93FBABDDA72B486B301CB8BA
          0000000000000000000000000000000000000000000000000000D85B23F94DFB
          EE53EB6BD6C2D91FCA6FDF729F5B34E0F7E22BBF7CF94A8DE3D94B66C6E4A237
          25D530B50000000A10DA0F3C0C67CA0DA75F85F7A843683CF0319F28369D7E04
          D2F972BF3B2BA78F91D7A57EF47730A08CAFCECAE9E3E475E95FBD1DCC04B200
          40000C6ADCC98D5B844B42F097F9460BF8769EB86936ECE12FF28C17F0ED3D70
          D26E7AD36F7DDB787FCC379687FB9ECBC7CE4018A32700000000000000000000
          000000000000000000000000001120FEB77BBDADEAF16576B0A38F6B6D5C59D1
          4FFD554CE910ECCCA782D8E5DCBF87E0B611C974B0A6CEA9D3BAAB4FEA9FCE75
          9FCDCDDB11CBDFDB99EAED79B5B39AAEF865337AAFA38F1C94479D3AFE4EA6A2
          2222346E2E0DF0EE4EEF697EAB6D53947746DDFE4D51A7F7FE56F16772A67553
          19CF7CFEDE6CAADCC77154CEA36735F000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000000000032A6
          7584B1A373201E53691748B7CAF6F69A6BEF355369FCE9FF002F56FCACC976F8
          66057EBBE9AF1AC2AD23EB88D63D4B463D768BE6196F613F9A8ABC9F7673C5AE
          25A13EC09898E41C733194E4BC00000000000000000000000000000000000000
          00000000000000D85B23F94DFBEE53EB6BD6C2D91FCA6FDF729F5B34E0F7E22B
          BF7CF94A8DE3D94B66C6E4A23725D530B50000000A10DA0F3C0C67CA0DA75F85
          F7A843683CF0319F28369D7E04D2F972BF3B2BA78F91D7A57EF47730A08CAFCE
          CAE9E3E475E95FBD1DCC04B20040000C6ADCC98D5B844B42F097F9460BF8769E
          B86936ECE12FF28C17F0ED3D70D26E7AD36F7DDB787FCC379687FB9ECBC7CE40
          18A327000000000000000000000000000000000000000000000113B92FA70DB8
          5BE2B885DB0CBB53336B7AB5A6CA8FB6674D5F545155A551453B67543E6BAE9B
          3A66BAB643A1783D65CFECFCAD6B8CDB51C5B5C4ED78D4CE9CBEF747253FCF1A
          7F36D988D21F9B97F0CB1C1B09B9E1777A78B6775B1A6CA98FB2347E954E9BC1
          EE34E1B71B2BAD3F9637F4EF73B6257C9C42F76979ABF34E7E1D1B98EBAF286E
          1737880000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000134F27232631BD900FE56D4535D9D5
          4551C9544C4BFAB1AF73E6AA62B8CA473C623779BA5FEF1769DF676B553FA4CC
          3F83F773C5D7E099A2FD67A7775FBE47FBA35FF97E138D316BB4DCEFF6D613F9
          6AAA37AF344E74C4802DEFA00000000000000000000000000000000000000000
          00000001B0B647F29BF7DCA7D6D7AD85B23F94DFBEE53EB669C1EFC4577EF9F2
          951BC7B296CD8DC9446E4BAA616A0000001421B41E7818CF941B4EBF0BEF5086
          D079E0633E506D3AFC09A5F2E57E76574F1F23AF4AFDE8EE6141195F9D95D3C7
          C8EBD2BF7A3B98096400800018D5B9922ADDB81A1384B7CA305FB969EB86936F
          CE121855B5B6198662D674CCD176B5AACAB9E88AA2263D52D05F6B9FB4E6CEAA
          31BB59AA36C44C7D21BBB432D29AF08B38A7A3389FAA40620CA8000000000000
          0000000000000000000000000000000006CAD82E5E9C5B38FF0069DAD9F1AC70
          DB39B4D66393DF2AE48FE356B49E474E6C1F2E461193ACEFF6D67A5B6255CDBC
          CCEFE26EA7F865DA1586FF0010C5A89AA3EED1F7A7C366F62DA617FF00B0E195
          C533F7ABFBB1E3B77364D9E9099DE988A69DD087413480000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000001F3C337F39DF0FE802262261289DC0D47B54BACD8E3B6378D34
          8B7B08999FAE99989FE3478C6CADADDD666E970BE69FF9769559CCFDE8D7FF00
          8CB5AB957840BA4DD3486F1196AAA62AFAC47EABADDEAE359C0030C560000000
          000000000000000000000000000000000000000001B07647F29BFF00DCA7D6D7
          CD97B24B95745DAFB7FAA3FA6BAA2CE9FAF4E59FF8671C1CD9D569A456134C6C
          E34CF7652A3789CACE5B12372511B92EA55A80000005086D079E0633E506D3AF
          C2FBD421B41E7818CF941B4EBF02697CB95F9D95D3C7C8EBD2BF7A3B98504657
          E76574F1F23AF4AFDE8EE602590020000469AA407E2E6AC02E799B04BDE0D7CA
          7FF0EF347178D1BE8ABE6AA3EC9724E6BCAD8AE51C5AD70BC4EC2AA668999B3B
          4D3FA6D69D792A89767CD3156F7E3664CAB81E68B94DC31BC3ECEF1673ACD335
          47F5513D313BE2588E94E8B59E9059C5744F16D69D93D71D52C9747348ED303B
          49A6A8E359D5B63ABE70E3089D52DF58A706EC3AD6D66BC231EB6BBD133C9676
          D6715E9F9C3F3FFBB5DFBE6CCB63E865AAAD341F1BB3AB8B1659FCE263D5B2A8
          D33C1EBA6266D263BE27D1A546EAFEED77FF00092C7D0C9FDDAEFF00E1258FA1
          97C732B1BEC77C7ABEF9E18376BBA7D1A546EAFEED77FF00092C7D0C9FDDAEFF
          00E1258FA1939958DF63BE3D4E7860DDAEE9F46951BABFBB5DFF00C24B1F4327
          F76BBFF84963E864E65637D8EF8F539E18376BBA7D1A546EAFEED77FF092C7D0
          C9FDDAEFFE1258FA1939958DF63BE3D4E7860DDAEE9F46951BABFBB5DFFC24B1
          F4327F76BBFF0084963E864E65637D8EF8F539E18376BBA7D1A546EAFEED77FF
          00092C7D0C9FDDAEFF00E1258FA1939958DF63BE3D4E7860DDAEE9F46951BABF
          BB5DFF00C24B1F4327F76BBFF84963E864E65637D8EF8F539E18376BBA7D1A54
          6EAFEED77FF092C7D0C9FDDAEFFE1258FA1939958DF63BE3D4E7860DDAEE9F46
          951BABFBB5DFFC24B1F4327F76BBFF0084963E864E65637D8EF8F539E18376BB
          A7D1A546EAFEED77FF00092C7D0C9FDDAEFF00E1258FA1939958DF63BE3D4E78
          60DDAEE9F46951BABFBB5DFF00C24B1F4327F76BBFF84963E864E65637D8EF8F
          539E18376BBA7D1A546EAFEED77FF092C7D0C9FDDAEFFE1258FA1939958DF63B
          E3D4E7860DDAEE9F46951BABFBB5DFFC24B1F4327F76BBFF0084963E864E6563
          7D8EF8F539E18376BBA7D1A546EAFEED77FF00092C7D0C9FDDAEFF00E1258FA1
          939958DF63BE3D4E7860DDAEE9F46951BABFBB5DFF00C24B1F4327F76BBF7CF9
          92C7D0C9CCAC73B1DF1EA73C306ED774FA352601855AE378D5CF09B0A666ABD5
          B5367C9D133CBFC3B370BB9D961F72B0B8D8D314D161674D9D311D111A358E40
          D894E4FCC3678E5F315B3BE7BD515459D34D131C5AA7E7E56D8A69888E486CCD
          08C02DF06B0B4AEF54E56954ECF947AB5E698637638B5E28A6ED567674C776B9
          DA998D51A4B219D31063A49A4B2018E92692C8063A49A4B2018E92692C8063A4
          9A4B2018E92692C8063A49A4B2018E92692C8063A49A4B2018E92692C8063A49
          A4B2018E92692C8063A49A4B2018E92692C8063A49A4B2018E92692C8063A49A
          4B2018E92692C8063A49A4B2018E92692C8063A49A4B2018E92692C8063A49A4
          B2018E92692C8063A49A4B2018E92692C8063A49A4B2018E92692C8063A49A4B
          2018E92692C8063A49A4B2018E92692C8061C5966002277240792DA5DD62F195
          ADED229D66C2D28B588FCF4F54CB4E37FE3986C62D85DE70FE3451F08B39A22A
          9F9A6774FEBA3C0C6C92F1F3E2F673FF00EB9695E11344B12C6712A2F570B3E3
          47162275C46B89F9BDB76B6A68A72A9AF86C2ED4778EFB59FA393B51DE3BED67
          E8E580FF002F348BFC7DF1EAF472F67D6D7A36176A3BC77DACFD1C9DA8EF1DF6
          B3F4727F2F348BFC7DF1EA72F67D6D7A36176A3BC77DACFD1C9DA8EF1DF6B3F4
          727F2F348BFC7DF1EA72F67D6D7A36176A3BC77DACFD1C9DA8EF1DF6B3F4727F
          2F348BFC7DF1EA72F67D6D7A36176A3BC77DACFD1C9DA8EF1DF6B3F4727F2F34
          8BFC7DF1EA72F67D6D7A36176A3BC77DACFD1C9DA8EF1DF6B3F4727F2F348BFC
          7DF1EA72F67D6D7A36176A3BC77DACFD1C9DA8EF1DF6B3F4727F2F348BFC7DF1
          EA72F67D6D7A36176A3BC77DACFD1C9DA8EF1DF6B3F4727F2F348BFC7DF1EA72
          F67D6D7A36176A3BC77DACFD1C9DA8EF1DF6B3F4727F2F348BFC7DF1EA72F67D
          6D7A36176A3BC77DACFD1C9DA8EF1DF6B3F4727F2F348BFC7DF1EA72F67D6D7A
          36176A3BC77DACFD1C9DA8EF1DF6B3F4727F2F348BFC7DF1EA72F67D6D7A3617
          6A3BC77DACFD1C9DA8EF1DF6B3F4727F2F348BFC7DF1EA72F67D6D7A36176A3B
          C77DACFD1C9DA8EF1DF6B3F4727F2F348BFC7DF1EA72F67D6D7A36176A3BC77D
          ACFD1C9DA8EF1DF6B3F4727F2F348BFC7DF1EA72F67D6D7A36176A3BC77DACFD
          1C9DA8EF1DF6B3F4727F2F348BFC7DF1EA72F67D6D7A36176A3BC77DACFD1C9D
          A8EF1DF6B3F4727F2F348BFC7DF1EA72F67D6D7A36146C92DE7FFEDECFD1CBEA
          B9EC9AEB675C557FC4AD2D29FF00A68A78BFCAA597073A4569545336397CE6A8
          F544DE2CE3A5E0306C1AFD8DDF68B95CECE666A9FEAABE6A69E9996F1C130AB0
          C1B0EB1C3EEF1FD3674E933FF54FCF261182E1D835DFE0D70BAD1654EF9988E5
          ABED9F9DFA3111F34373685685D968CD9CDB5A55C6B6AB54CF4447547EB2F15B
          5BCDAEAE8480CF9400000005086D079E0633E506D3AFC2FBD421B41E7818CF94
          1B4EBF02697CB95F9D95D3C7C8EBD2BF7A3B98504657E76574F1F23AF4AFDE8E
          E60259002000000044C44EF84808E2C741C58E84808E2D3D07169E84808E2D3D
          07169E84808E2D3D07169E84808E2D3D07169E84808E2D3D07169E84808E2D3D
          07169E84808E2D3D07169E84808E2D3D07169E84808E2D3D07169E84808E2D3D
          07169E84808E2D3D07169E84808E2D3D07169E84808E2D3D07169E84808E2D3D
          07169E84808E2D3D07163A120238B1D0900C8000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000113113BCD2120238B4F41C5A7A120238B4F41C5A7A120238B4F
          41C5A7A120238B4F41C5A7A120238B4F41C5A7A120238B4F41C5A7A120238B4F
          41C5A7A120238B4F41C5A7A120238B4F41C5A7A120238B4F41C5A7A120238B4F
          41C5A7A120238B4F41C5A7A120238B4F41C5A7A120238B4F41C5A7A120238B4F
          41C5A7A120238B4F41C5A7A12023488262277C2404689000000000001421B41E
          7818CF941B4EBF0BEF5086D079E0633E506D3AFC09A5F2E57E76574F1F23AF4A
          FDE8EE6141195F9D95D3C7C8EBD2BF7A3B980964008000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000001421B41E7818CF941B4EBF0BEF5086D079E0633E506D3A
          FC09A5F2E57E76574F1F23AF4AFDE8EE6141195F9D95D3C7C8EBD2BF7A3B9809
          6400800000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000001421B41E7818CF941B4E
          BF0BEF5086D079E0633E506D3AFC09A5F2E58E76374F1F23AF4AFDE898E2C72B
          FCFC67DC89B4EBAED433262B8564BCCD656D678EDF2DAEF6F6386DE22AA662F1
          5CD35D35453BF74C4C3F569CE9C2DE234FEDCDA9F9F7EF606D5F9EB1D26B1D2A
          0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B
          35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD78
          5BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FD
          FCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36
          A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9
          F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFB
          D8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D
          9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC
          2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7E
          FE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B
          53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FC
          FBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFD
          EC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B03
          25F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E
          5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1
          D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749A
          C74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2
          A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837
          B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD7
          85BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16F
          DFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F3
          6A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F
          9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DF
          BD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61
          D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766B
          C2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7
          EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9
          B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4F
          CFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EF
          DEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0
          325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97
          E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B
          1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749
          AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D
          2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A83
          7B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD
          785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16
          FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F
          36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9
          F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7D
          FBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF6
          1D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766
          BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B
          7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF
          9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4
          FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3E
          FDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B
          0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C9
          7E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96
          B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC74
          9AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1
          D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A8
          37B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DEC
          D785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E1
          6FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7
          F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA
          9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7
          DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF
          61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD876
          6BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0
          B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFB
          F9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D
          4FCFBF7B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3
          EFDEC0C97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7
          B0325F96B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C
          97E5AC749AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F9
          6B1D26B1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC7
          49AC74A837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B
          1D2A0DECD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A
          837B35E16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DE
          CD785BF7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E
          16FDFCDA9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D26B1D2A0DECD785BF
          7F36A7E7DFBD8766BC2DFBF9B53F3EFDEC0C97E5AC749AC74A837B35E16FDFCD
          A9F9F7EF61D9AF0B7EFE6D4FCFBF7B0325F96B1D2A11DA0F3C0C67CA0DA75F87
          F3ECD385BF7F36A7E7DFBD8FC9C9191B6A37EDA765FC6318C9B99EDEDEDB1DBA
          5BDE6F36F86DE26AAEA9BC5135575D534FDB33322763FFD9}
        mmHeight = 23813
        mmLeft = 167746
        mmTop = 264
        mmWidth = 28310
        BandType = 0
        LayerName = BandLayer5
      end
      object ppLine9: TppLine
        DesignLayer = ppDesignLayer4
        UserName = 'Line9'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        mmHeight = 1054
        mmLeft = 265
        mmTop = 24871
        mmWidth = 195792
        BandType = 0
        LayerName = BandLayer5
      end
    end
    object ppDetailBand4: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 28840
      mmPrintPosition = 0
      object ppShape10: TppShape
        DesignLayer = ppDesignLayer4
        UserName = 'Shape10'
        Brush.Color = clTeal
        Pen.Style = psClear
        Shape = stRoundRect
        mmHeight = 13229
        mmLeft = 11907
        mmTop = 529
        mmWidth = 55798
        BandType = 4
        LayerName = BandLayer5
      end
      object ppLabel41: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Label41'
        Border.mmPadding = 0
        Caption = 'Primeira Compra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 23549
        mmTop = 1852
        mmWidth = 31221
        BandType = 4
        LayerName = BandLayer5
      end
      object ppDBText29: TppDBText
        DesignLayer = ppDesignLayer4
        UserName = 'DBText29'
        Border.mmPadding = 0
        DataField = 'primeiracompra'
        DataPipeline = ppDBPResumo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPResumo'
        mmHeight = 4763
        mmLeft = 12967
        mmTop = 7408
        mmWidth = 53681
        BandType = 4
        LayerName = BandLayer5
      end
      object ppShape11: TppShape
        DesignLayer = ppDesignLayer4
        UserName = 'Shape101'
        Brush.Color = clTeal
        Pen.Style = psClear
        Shape = stRoundRect
        mmHeight = 13229
        mmLeft = 69057
        mmTop = 529
        mmWidth = 55827
        BandType = 4
        LayerName = BandLayer5
      end
      object ppLabel42: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Label42'
        Border.mmPadding = 0
        Caption = #218'ltima Compra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 83080
        mmTop = 1852
        mmWidth = 27252
        BandType = 4
        LayerName = BandLayer5
      end
      object ppDBText30: TppDBText
        DesignLayer = ppDesignLayer4
        UserName = 'DBText30'
        Border.mmPadding = 0
        DataField = 'ultimacompra'
        DataPipeline = ppDBPResumo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPResumo'
        mmHeight = 4763
        mmLeft = 70115
        mmTop = 7408
        mmWidth = 53711
        BandType = 4
        LayerName = BandLayer5
      end
      object ppShape12: TppShape
        DesignLayer = ppDesignLayer4
        UserName = 'Shape102'
        Brush.Color = clTeal
        Pen.Style = psClear
        Shape = stRoundRect
        mmHeight = 13229
        mmLeft = 126472
        mmTop = 529
        mmWidth = 55827
        BandType = 4
        LayerName = BandLayer5
      end
      object ppLabel43: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Label43'
        Border.mmPadding = 0
        Caption = 'Total de Pedidos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 138378
        mmTop = 1852
        mmWidth = 31750
        BandType = 4
        LayerName = BandLayer5
      end
      object ppDBText31: TppDBText
        DesignLayer = ppDesignLayer4
        UserName = 'DBText31'
        Border.mmPadding = 0
        DataField = 'totalpedidos'
        DataPipeline = ppDBPResumo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPResumo'
        mmHeight = 4763
        mmLeft = 127530
        mmTop = 7408
        mmWidth = 53711
        BandType = 4
        LayerName = BandLayer5
      end
      object ppShape13: TppShape
        DesignLayer = ppDesignLayer4
        UserName = 'Shape13'
        Brush.Color = clTeal
        Pen.Style = psClear
        Shape = stRoundRect
        mmHeight = 13229
        mmLeft = 12172
        mmTop = 15610
        mmWidth = 55827
        BandType = 4
        LayerName = BandLayer5
      end
      object ppLabel44: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Label44'
        Border.mmPadding = 0
        Caption = 'Total de Itens'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 27517
        mmTop = 16933
        mmWidth = 25665
        BandType = 4
        LayerName = BandLayer5
      end
      object ppDBText32: TppDBText
        DesignLayer = ppDesignLayer4
        UserName = 'DBText32'
        Border.mmPadding = 0
        DataField = 'totalitens'
        DataPipeline = ppDBPResumo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPResumo'
        mmHeight = 4763
        mmLeft = 13230
        mmTop = 22490
        mmWidth = 53711
        BandType = 4
        LayerName = BandLayer5
      end
      object ppShape14: TppShape
        DesignLayer = ppDesignLayer4
        UserName = 'Shape14'
        Brush.Color = clTeal
        Pen.Style = psClear
        Shape = stRoundRect
        mmHeight = 13229
        mmLeft = 69055
        mmTop = 15349
        mmWidth = 55827
        BandType = 4
        LayerName = BandLayer5
      end
      object ppLabel45: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Label45'
        Border.mmPadding = 0
        Caption = 'Valor Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4762
        mmLeft = 87049
        mmTop = 16669
        mmWidth = 20108
        BandType = 4
        LayerName = BandLayer5
      end
      object ppDBText33: TppDBText
        DesignLayer = ppDesignLayer4
        UserName = 'DBText33'
        Border.mmPadding = 0
        DataField = 'valortotal'
        DataPipeline = ppDBPResumo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPResumo'
        mmHeight = 4763
        mmLeft = 70113
        mmTop = 22228
        mmWidth = 53711
        BandType = 4
        LayerName = BandLayer5
      end
      object ppShape15: TppShape
        DesignLayer = ppDesignLayer4
        UserName = 'Shape15'
        Brush.Color = clTeal
        Pen.Style = psClear
        Shape = stRoundRect
        mmHeight = 13229
        mmLeft = 126740
        mmTop = 15343
        mmWidth = 55827
        BandType = 4
        LayerName = BandLayer5
      end
      object ppLabel46: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Label46'
        Border.mmPadding = 0
        Caption = 'Dias M'#233'dio(Pedido x Compra)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 129911
        mmTop = 16669
        mmWidth = 50007
        BandType = 4
        LayerName = BandLayer5
      end
      object ppDBText34: TppDBText
        DesignLayer = ppDesignLayer4
        UserName = 'DBText34'
        Border.mmPadding = 0
        DataField = 'diasmedio'
        DataPipeline = ppDBPResumo
        DisplayFormat = '0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPResumo'
        mmHeight = 4763
        mmLeft = 127798
        mmTop = 22222
        mmWidth = 53711
        BandType = 4
        LayerName = BandLayer5
      end
    end
    object ppFooterBand4: TppFooterBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppSystemVariable7: TppSystemVariable
        DesignLayer = ppDesignLayer4
        UserName = 'SystemVariable3'
        Border.mmPadding = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 157961
        mmTop = 794
        mmWidth = 17729
        BandType = 8
        LayerName = BandLayer5
      end
      object ppSystemVariable8: TppSystemVariable
        DesignLayer = ppDesignLayer4
        UserName = 'SystemVariable4'
        Border.mmPadding = 0
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 180451
        mmTop = 794
        mmWidth = 16405
        BandType = 8
        LayerName = BandLayer5
      end
      object ppLine10: TppLine
        DesignLayer = ppDesignLayer4
        UserName = 'Line6'
        Border.mmPadding = 0
        Pen.Width = 2
        Weight = 1.500000000000000000
        mmHeight = 265
        mmLeft = 265
        mmTop = 265
        mmWidth = 196850
        BandType = 8
        LayerName = BandLayer5
      end
    end
    object ppSummaryBand4: TppSummaryBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDesignLayers4: TppDesignLayers
      object ppDesignLayer4: TppDesignLayer
        UserName = 'BandLayer5'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList4: TppParameterList
    end
  end
end
