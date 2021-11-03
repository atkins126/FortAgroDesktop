unit dmReplicacao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.FMXUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet,FMX.Dialogs, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, FireDAC.Stan.StorageJSON,System.Notification,
  System.JSON,Data.FireDACJSONReflect, System.JSON.Writers,System.JSON.Types;

type
  TDataModule1 = class(TDataModule)
    TSyncAuxCategorias: TFDQuery;
    TSyncAuxCategoriasid: TIntegerField;
    TSyncAuxCategoriasstatus: TIntegerField;
    TSyncAuxCategoriasdatareg: TSQLTimeStampField;
    TSyncAuxCategoriasidusuario: TIntegerField;
    TSyncAuxCategoriasdataalteracao: TSQLTimeStampField;
    TSyncAuxCategoriasidusuarioalteracao: TIntegerField;
    TSyncAuxCategoriasnome: TWideStringField;
    TSyncAuxCategoriasidsegmento: TIntegerField;
    qryAuxL: TFDQuery;
    TSyncGrupo: TFDQuery;
    TSyncGrupoid: TIntegerField;
    TSyncGrupostatus: TIntegerField;
    TSyncGrupodatareg: TSQLTimeStampField;
    TSyncGrupoidusuario: TIntegerField;
    TSyncGrupodataalteracao: TSQLTimeStampField;
    TSyncGrupoidusuarioalteracao: TIntegerField;
    TSyncGruponome: TWideStringField;
    TSyncGrupoidsegmento: TIntegerField;
    TSyncGruposyncaws: TIntegerField;
    TAuxSubGrupo: TFDQuery;
    TAuxSubGrupoid: TIntegerField;
    TAuxSubGrupostatus: TIntegerField;
    TAuxSubGrupodatareg: TSQLTimeStampField;
    TAuxSubGrupoidusuario: TIntegerField;
    TAuxSubGrupodataalteracao: TSQLTimeStampField;
    TAuxSubGrupoidusuarioalteracao: TIntegerField;
    TAuxSubGruponome: TWideStringField;
    TAuxSubGrupoidsegmento: TIntegerField;
    IdHTTP1: TIdHTTP;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    NotificationCenter1: TNotificationCenter;
    TAuxMarcas: TFDQuery;
    TAuxMarcasid: TIntegerField;
    TAuxMarcasstatus: TIntegerField;
    TAuxMarcasdatareg: TSQLTimeStampField;
    TAuxMarcasidusuario: TIntegerField;
    TAuxMarcasdataalteracao: TSQLTimeStampField;
    TAuxMarcasidusuarioalteracao: TIntegerField;
    TAuxMarcasnome: TWideStringField;
    TAuxMarcasidsegmento: TIntegerField;
    TAuxMarcassyncaws: TIntegerField;
    TSyncProdutos: TFDQuery;
    TSyncProdutosid: TIntegerField;
    TSyncProdutosstatus: TIntegerField;
    TSyncProdutosdatareg: TSQLTimeStampField;
    TSyncProdutosidusuario: TIntegerField;
    TSyncProdutosdataalteracao: TSQLTimeStampField;
    TSyncProdutosidusuarioalteracao: TIntegerField;
    TSyncProdutosnome: TWideStringField;
    TSyncProdutostipo: TWideStringField;
    TSyncProdutosunidademedida: TWideStringField;
    TSyncProdutosestoqueminimo: TBCDField;
    TSyncProdutosobservacao: TWideStringField;
    TSyncProdutoscodigobarras: TWideStringField;
    TSyncProdutosidcategoria: TIntegerField;
    TSyncProdutosidsegmento: TIntegerField;
    TSyncProdutosnumeroserie: TIntegerField;
    TSyncProdutosreferencia: TWideStringField;
    TSyncProdutosimg: TBlobField;
    TSyncProdutospesoembalagem: TBCDField;
    TSyncProdutosidgrupo: TIntegerField;
    TSyncProdutosidsubgrupo: TIntegerField;
    TSyncProdutosidmarca: TIntegerField;
    TSyncProdutoscodigofabricante: TWideStringField;
    TSyncProdutossyncaws: TIntegerField;
    TSyncAuxCulturas: TFDQuery;
    TSyncAuxCulturasid: TIntegerField;
    TSyncAuxCulturasstatus: TIntegerField;
    TSyncAuxCulturasdatareg: TSQLTimeStampField;
    TSyncAuxCulturasidusuario: TIntegerField;
    TSyncAuxCulturasdataalteracao: TSQLTimeStampField;
    TSyncAuxCulturasidusuarioalteracao: TIntegerField;
    TSyncAuxCulturasnome: TWideStringField;
    TSyncAuxCulturassyncaws: TIntegerField;
    TSyncAuxTipoMaqVeic: TFDQuery;
    TSyncAuxTipoMaqVeicid: TIntegerField;
    TSyncAuxTipoMaqVeicstatus: TIntegerField;
    TSyncAuxTipoMaqVeicdatareg: TSQLTimeStampField;
    TSyncAuxTipoMaqVeicidusuario: TIntegerField;
    TSyncAuxTipoMaqVeicdataalteracao: TSQLTimeStampField;
    TSyncAuxTipoMaqVeicidusuarioalteracao: TIntegerField;
    TSyncAuxTipoMaqVeicnome: TWideStringField;
    TSyncAuxTipoMaqVeicidsegmento: TIntegerField;
    TSyncAuxTipoOcorrencia: TFDQuery;
    TSyncAuxTipoOcorrenciaid: TIntegerField;
    TSyncAuxTipoOcorrenciastatus: TIntegerField;
    TSyncAuxTipoOcorrenciadatareg: TSQLTimeStampField;
    TSyncAuxTipoOcorrenciaidusuario: TIntegerField;
    TSyncAuxTipoOcorrenciadataalteracao: TSQLTimeStampField;
    TSyncAuxTipoOcorrenciaidusuarioalteracao: TIntegerField;
    TSyncAuxTipoOcorrencianome: TWideStringField;
    TSyncAuxTipoOcorrenciasyncaws: TIntegerField;
    TSyncServico: TFDQuery;
    TSyncServicoid: TIntegerField;
    TSyncServicostatus: TIntegerField;
    TSyncServicodatareg: TSQLTimeStampField;
    TSyncServicoidusuario: TIntegerField;
    TSyncServicodataalteracao: TSQLTimeStampField;
    TSyncServicoidusuarioalteracao: TIntegerField;
    TSyncServicoidtipo: TIntegerField;
    TSyncServicodescricao: TWideStringField;
    TSyncServicoidsegmento: TIntegerField;
    TSyncServicoresponsavel: TWideStringField;
    TSyncServicodataprevista: TDateField;
    TSyncServicosyncaws: TIntegerField;
    TSyncAuxTipoServico: TFDQuery;
    TSyncAuxTipoServicoid: TIntegerField;
    TSyncAuxTipoServicostatus: TIntegerField;
    TSyncAuxTipoServicodatareg: TSQLTimeStampField;
    TSyncAuxTipoServicoidusuario: TIntegerField;
    TSyncAuxTipoServicodataalteracao: TSQLTimeStampField;
    TSyncAuxTipoServicoidusuarioalteracao: TIntegerField;
    TSyncAuxTipoServiconome: TWideStringField;
    TSyncAuxTipoServicoidsegmento: TIntegerField;
    TSyncAuxTipoServicosyncaws: TIntegerField;
    TAuxSyncCobertura: TFDQuery;
    TAuxSyncCoberturaid: TIntegerField;
    TAuxSyncCoberturastatus: TIntegerField;
    TAuxSyncCoberturadatareg: TSQLTimeStampField;
    TAuxSyncCoberturaidusuario: TIntegerField;
    TAuxSyncCoberturadataalteracao: TSQLTimeStampField;
    TAuxSyncCoberturaidusuarioalteracao: TIntegerField;
    TAuxSyncCoberturanome: TWideStringField;
    TAuxSyncCoberturasyncaws: TIntegerField;
    TAuxSyncCultivares: TFDQuery;
    TAuxSyncCultivaresid: TIntegerField;
    TAuxSyncCultivaresstatus: TIntegerField;
    TAuxSyncCultivaresdatareg: TSQLTimeStampField;
    TAuxSyncCultivaresidusuario: TIntegerField;
    TAuxSyncCultivaresdataalteracao: TSQLTimeStampField;
    TAuxSyncCultivaresidusuarioalteracao: TIntegerField;
    TAuxSyncCultivaresnome: TWideStringField;
    TAuxSyncCultivaressyncaws: TIntegerField;
    TSyncAreas: TFDQuery;
    TSyncAreasid: TIntegerField;
    TSyncAreasstatus: TIntegerField;
    TSyncAreasdatareg: TSQLTimeStampField;
    TSyncAreasidusuario: TIntegerField;
    TSyncAreasdataalteracao: TSQLTimeStampField;
    TSyncAreasidusuarioalteracao: TIntegerField;
    TSyncAreasnome: TWideStringField;
    TSyncAreasareahe: TBCDField;
    TSyncAreasidresponsavel: TIntegerField;
    TSyncAreassyncaws: TIntegerField;
    TSyncSetores: TFDQuery;
    TSyncSetoresid: TIntegerField;
    TSyncSetoresstatus: TIntegerField;
    TSyncSetoresdatareg: TSQLTimeStampField;
    TSyncSetoresidusuario: TIntegerField;
    TSyncSetoresdataalteracao: TSQLTimeStampField;
    TSyncSetoresidusuarioalteracao: TIntegerField;
    TSyncSetoresnome: TWideStringField;
    TSyncSetoresareahe: TBCDField;
    TSyncSetoresidarea: TIntegerField;
    TSyncTalhoes: TFDQuery;
    TSyncTalhoesid: TIntegerField;
    TSyncTalhoesstatus: TIntegerField;
    TSyncTalhoesdatareg: TSQLTimeStampField;
    TSyncTalhoesidusuario: TIntegerField;
    TSyncTalhoesdataalteracao: TSQLTimeStampField;
    TSyncTalhoesidusuarioalteracao: TIntegerField;
    TSyncTalhoesnome: TWideStringField;
    TSyncTalhoesareahe: TBCDField;
    TSyncTalhoesidsetor: TIntegerField;
    TSyncTalhoesqrcode: TWideStringField;
    TSyncTalhoestipo: TIntegerField;
    TSyncTalhoesobservacao: TWideStringField;
    TSyncTalhoessyncaws: TIntegerField;
    TSyncMaquinas: TFDQuery;
    TSyncMaquinasid: TIntegerField;
    TSyncMaquinasstatus: TIntegerField;
    TSyncMaquinasdatareg: TSQLTimeStampField;
    TSyncMaquinasidusuario: TIntegerField;
    TSyncMaquinasdataalteracao: TSQLTimeStampField;
    TSyncMaquinasidusuarioalteracao: TIntegerField;
    TSyncMaquinasidtipo: TIntegerField;
    TSyncMaquinasidmarca: TIntegerField;
    TSyncMaquinasmodelo: TWideStringField;
    TSyncMaquinasplaca: TWideStringField;
    TSyncMaquinasano: TIntegerField;
    TSyncMaquinaschassi: TWideStringField;
    TSyncMaquinascombustivel: TIntegerField;
    TSyncMaquinasvalor: TBCDField;
    TSyncMaquinasnumeroserie: TWideStringField;
    TSyncMaquinasimg: TBlobField;
    TSyncMaquinasprefixo: TWideStringField;
    TSyncMaquinasidcategoria: TIntegerField;
    TSyncMaquinasidsegmento: TIntegerField;
    TSyncMaquinasanomodelo: TIntegerField;
    TSyncMaquinassyncaws: TIntegerField;
    TSyncSafra: TFDQuery;
    TSyncSafraid: TIntegerField;
    TSyncSafrastatus: TIntegerField;
    TSyncSafradatareg: TSQLTimeStampField;
    TSyncSafraidusuario: TIntegerField;
    TSyncSafradataalteracao: TSQLTimeStampField;
    TSyncSafraidusuarioalteracao: TIntegerField;
    TSyncSafranome: TWideStringField;
    TSyncSafradatainicio: TDateField;
    TSyncSafradatafim: TDateField;
    TSyncSafraobservacao: TWideStringField;
    TSyncSafrasyncaws: TIntegerField;
    TDetReceituario: TFDQuery;
    TSyncReceituario: TFDQuery;
    TSyncReceituarioid: TIntegerField;
    TSyncReceituariostatus: TIntegerField;
    TSyncReceituariodatareg: TSQLTimeStampField;
    TSyncReceituarioidusuario: TIntegerField;
    TSyncReceituariodataalteracao: TSQLTimeStampField;
    TSyncReceituarioidusuarioalteracao: TIntegerField;
    TSyncReceituarionome: TWideStringField;
    TSyncReceituarioidresponsavel: TIntegerField;
    TSyncReceituariosyncaws: TIntegerField;
    TDetReceituarioid: TIntegerField;
    TDetReceituariostatus: TIntegerField;
    TDetReceituariodatareg: TSQLTimeStampField;
    TDetReceituarioidusuario: TIntegerField;
    TDetReceituariodataalteracao: TSQLTimeStampField;
    TDetReceituarioidusuarioalteracao: TIntegerField;
    TDetReceituarioidreceiturario: TIntegerField;
    TDetReceituarioqtdporhe: TBCDField;
    TDetReceituarioidproduto: TIntegerField;
    TDetReceituariosyncaws: TIntegerField;
    TSyncOperacaoSafraTalhao: TFDQuery;
    TSyncOperacaoSafraTalhaoid: TIntegerField;
    TSyncOperacaoSafraTalhaostatus: TIntegerField;
    TSyncOperacaoSafraTalhaodatareg: TSQLTimeStampField;
    TSyncOperacaoSafraTalhaoidusuario: TIntegerField;
    TSyncOperacaoSafraTalhaodataalteracao: TSQLTimeStampField;
    TSyncOperacaoSafraTalhaoidusuarioalteracao: TIntegerField;
    TSyncOperacaoSafraTalhaoidsafra: TIntegerField;
    TSyncOperacaoSafraTalhaoidoperacao: TIntegerField;
    TSyncOperacaoSafraTalhaodatainicio: TDateField;
    TSyncOperacaoSafraTalhaodatafim: TDateField;
    TSyncOperacaoSafraTalhaoobservacao: TWideStringField;
    TSyncOperacaoSafraTalhaoidtalhao: TIntegerField;
    TSyncOperacaoSafraTalhaoidresponsavel: TIntegerField;
    TSyncOperacaoSafraTalhaoareaprevista: TBCDField;
    TSyncOperacaoSafraTalhaoarearealizada: TBCDField;
    TSyncOperacaoSafraTalhaotipoterraaereo: TWideStringField;
    TSyncOperacaoSafraTalhaoidtipoaplicacaosolido: TIntegerField;
    TSyncOperacaoSafraTalhaoidcultura: TIntegerField;
    TSyncOperacaoSafraTalhaoidvariedade: TIntegerField;
    TSyncOperacaoSafraTalhaofinalidade: TWideStringField;
    TSyncOperacaoSafraTalhaoidreceituario: TIntegerField;
    TSyncOperacaoSafraTalhaosyncaws: TIntegerField;
    TSyncMaquinasOperacao: TFDQuery;
    TSyncMaquinasOperacaoid: TIntegerField;
    TSyncMaquinasOperacaostatus: TIntegerField;
    TSyncMaquinasOperacaodatareg: TSQLTimeStampField;
    TSyncMaquinasOperacaoidusuario: TIntegerField;
    TSyncMaquinasOperacaodataalteracao: TSQLTimeStampField;
    TSyncMaquinasOperacaoidusuarioalteracao: TIntegerField;
    TSyncMaquinasOperacaoidoperacaotalhao: TIntegerField;
    TSyncMaquinasOperacaoidmaquina: TIntegerField;
    TSyncMaquinasOperacaooperador: TWideStringField;
    TSyncMaquinasOperacaoobservacao: TWideStringField;
    TSyncMaquinasOperacaodata: TDateField;
    TSyncMaquinasOperacaohorainicio: TBCDField;
    TSyncMaquinasOperacaohorafim: TBCDField;
    TSyncMaquinasOperacaohoraparada: TBCDField;
    TSyncMaquinasOperacaohorastrabalhada: TBCDField;
    TSyncMaquinasOperacaosyncaws: TIntegerField;
    TSyncProdutosOperacao: TFDQuery;
    TSyncProdutosOperacaoid: TIntegerField;
    TSyncProdutosOperacaostatus: TIntegerField;
    TSyncProdutosOperacaodatareg: TSQLTimeStampField;
    TSyncProdutosOperacaoidusuario: TIntegerField;
    TSyncProdutosOperacaodataalteracao: TSQLTimeStampField;
    TSyncProdutosOperacaoidusuarioalteracao: TIntegerField;
    TSyncProdutosOperacaoidoperacaotalhao: TIntegerField;
    TSyncProdutosOperacaoidproduto: TIntegerField;
    TSyncProdutosOperacaoobservacao: TWideStringField;
    TSyncProdutosOperacaodata: TDateField;
    TSyncProdutosOperacaosyncaws: TIntegerField;
    TSyncOcorrenciaOperacao: TFDQuery;
    TSyncOcorrenciaOperacaoid: TIntegerField;
    TSyncOcorrenciaOperacaostatus: TIntegerField;
    TSyncOcorrenciaOperacaodatareg: TSQLTimeStampField;
    TSyncOcorrenciaOperacaoidusuario: TIntegerField;
    TSyncOcorrenciaOperacaodataalteracao: TSQLTimeStampField;
    TSyncOcorrenciaOperacaoidusuarioalteracao: TIntegerField;
    TSyncOcorrenciaOperacaoidoperacaotalhao: TIntegerField;
    TSyncOcorrenciaOperacaodataocorrencia: TDateField;
    TSyncOcorrenciaOperacaoidtipoocorrencia: TIntegerField;
    TSyncOcorrenciaOperacaohora: TTimeField;
    TSyncOcorrenciaOperacaodescricao: TWideStringField;
    TSyncOcorrenciaOperacaodata: TDateField;
    TSyncOcorrenciaOperacaosyncaws: TIntegerField;
    TSyncUsuario: TFDQuery;
    TSyncUsuarioid: TIntegerField;
    TSyncUsuariostatus: TIntegerField;
    TSyncUsuariodatareg: TSQLTimeStampField;
    TSyncUsuarioidusuario: TIntegerField;
    TSyncUsuariodataalteracao: TSQLTimeStampField;
    TSyncUsuarioidusuarioalteracao: TIntegerField;
    TSyncUsuarionome: TWideStringField;
    TSyncUsuariousuario: TWideStringField;
    TSyncUsuariosenha: TWideStringField;
    TSyncUsuariotipo: TIntegerField;
    TSyncUsuarioidsupervisor: TIntegerField;
    TSyncUsuarioidsegmento: TIntegerField;
    TSyncUsuariosyncaws: TIntegerField;
    TSyncFornecedores: TFDQuery;
    TSyncFornecedoresid: TIntegerField;
    TSyncFornecedoresstatus: TIntegerField;
    TSyncFornecedoresdatareg: TSQLTimeStampField;
    TSyncFornecedoresidusuario: TIntegerField;
    TSyncFornecedoresdataalteracao: TSQLTimeStampField;
    TSyncFornecedoresidusuarioalteracao: TIntegerField;
    TSyncFornecedoresnome: TWideStringField;
    TSyncFornecedorescidade: TWideStringField;
    TSyncFornecedoresuf: TWideStringField;
    TSyncFornecedorescpf_cnpj: TWideStringField;
    TSyncFornecedorestelefone_fixo: TWideStringField;
    TSyncFornecedorescelular: TWideStringField;
    TSyncFornecedoresemail: TWideStringField;
    TSyncFornecedorescontatopessoa: TWideStringField;
    TSyncFornecedoressenha: TWideStringField;
    TSyncFornecedoresrazaosocial: TWideStringField;
    TSyncFornecedoresinscricaoestadual: TWideStringField;
    TSyncFornecedoressyncaws: TIntegerField;
    TSyncPedidoCompra: TFDQuery;
    TItensPedido: TFDQuery;
    TStatusPedido: TFDQuery;
    TOrcamento: TFDQuery;
    TItensOrcamento: TFDQuery;
    TSyncPedidoCompraid: TIntegerField;
    TSyncPedidoComprastatus: TIntegerField;
    TSyncPedidoCompradatareg: TSQLTimeStampField;
    TSyncPedidoCompraidusuario: TIntegerField;
    TSyncPedidoCompradataalteracao: TSQLTimeStampField;
    TSyncPedidoCompraidusuarioalteracao: TIntegerField;
    TSyncPedidoCompraidsegmento: TIntegerField;
    TSyncPedidoCompraidcategoria: TIntegerField;
    TSyncPedidoCompraidentificador: TWideStringField;
    TSyncPedidoCompraidsupervisoraprovacao: TIntegerField;
    TSyncPedidoCompradataaprovacaosupervisor: TDateField;
    TSyncPedidoCompraiddiretoriaaprovacao: TIntegerField;
    TSyncPedidoCompradataaprovacaodiretoria: TDateField;
    TSyncPedidoCompradatapedido: TDateField;
    TSyncPedidoCompraidsolicitante: TIntegerField;
    TSyncPedidoCompracancelado: TIntegerField;
    TSyncPedidoCompraidmaquina: TIntegerField;
    TSyncPedidoCompraidservico: TIntegerField;
    TSyncPedidoCompraflagurgente: TIntegerField;
    TSyncPedidoComprasyncaws: TIntegerField;
    TItensPedidoid: TIntegerField;
    TItensPedidoidpedido: TIntegerField;
    TItensPedidoiditem: TIntegerField;
    TItensPedidotipo: TIntegerField;
    TItensPedidoobservacao: TWideStringField;
    TItensPedidostatus: TIntegerField;
    TItensPedidodatareg: TSQLTimeStampField;
    TItensPedidoidusuario: TIntegerField;
    TItensPedidodataalteracao: TSQLTimeStampField;
    TItensPedidoidusuarioalteracao: TIntegerField;
    TItensPedidoquantidade: TIntegerField;
    TItensPedidounidademedida: TWideStringField;
    TItensPedidovalorunidade: TBCDField;
    TItensPedidovalortotal: TBCDField;
    TItensPedidoidorcamento: TIntegerField;
    TItensPedidoqtdrealizada: TIntegerField;
    TItensPedidorecebido: TBooleanField;
    TItensPedidoobservacaorecebimento: TWideStringField;
    TItensPedidodatarecebimento: TDateField;
    TItensPedidoidusuariorecebimento: TIntegerField;
    TItensPedidosyncaws: TIntegerField;
    TStatusPedidoid: TIntegerField;
    TStatusPedidostatus: TIntegerField;
    TStatusPedidodatareg: TSQLTimeStampField;
    TStatusPedidoidusuario: TIntegerField;
    TStatusPedidodataalteracao: TSQLTimeStampField;
    TStatusPedidoidusuarioalteracao: TIntegerField;
    TStatusPedidoidpedido: TIntegerField;
    TStatusPedidoidstatus: TIntegerField;
    TStatusPedidoobservacao: TWideStringField;
    TStatusPedidodatastatus: TDateField;
    TStatusPedidosyncaws: TIntegerField;
    TOrcamentoid: TIntegerField;
    TOrcamentostatus: TIntegerField;
    TOrcamentodatareg: TSQLTimeStampField;
    TOrcamentoidusuario: TIntegerField;
    TOrcamentodataalteracao: TSQLTimeStampField;
    TOrcamentoidusuarioalteracao: TIntegerField;
    TOrcamentoidfornecedor: TIntegerField;
    TOrcamentoidpedido: TIntegerField;
    TOrcamentoobservacao: TWideStringField;
    TOrcamentosyncaws: TIntegerField;
    TItensOrcamentoid: TIntegerField;
    TItensOrcamentostatus: TIntegerField;
    TItensOrcamentodatareg: TSQLTimeStampField;
    TItensOrcamentoidusuario: TIntegerField;
    TItensOrcamentodataalteracao: TSQLTimeStampField;
    TItensOrcamentoidusuarioalteracao: TIntegerField;
    TItensOrcamentoidorcamento: TIntegerField;
    TItensOrcamentoidproduto: TIntegerField;
    TItensOrcamentovalorunidade: TBCDField;
    TItensOrcamentovalortotal: TBCDField;
    TItensOrcamentoobservacao: TWideStringField;
    TItensOrcamentoqtde: TIntegerField;
    TItensOrcamentosyncaws: TIntegerField;
    TSyncProdutosOperacaoqtdeutilidado: TBCDField;
    TSyncProdutosdefensivos: TIntegerField;
    TSyncLocalEstoque: TFDQuery;
    TSyncLocalEstoqueid: TIntegerField;
    TSyncLocalEstoquestatus: TIntegerField;
    TSyncLocalEstoquedatareg: TSQLTimeStampField;
    TSyncLocalEstoqueidusuario: TIntegerField;
    TSyncLocalEstoquedataalteracao: TSQLTimeStampField;
    TSyncLocalEstoqueidusuarioalteracao: TIntegerField;
    TSyncLocalEstoquenome: TWideStringField;
    TSyncLocalEstoqueidsegmento: TIntegerField;
    TSyncLocalEstoquesyncaws: TIntegerField;
    TSyncCentroCusto: TFDQuery;
    TSyncCentroCustoid: TIntegerField;
    TSyncCentroCustostatus: TIntegerField;
    TSyncCentroCustodatareg: TSQLTimeStampField;
    TSyncCentroCustoidusuario: TIntegerField;
    TSyncCentroCustodataalteracao: TSQLTimeStampField;
    TSyncCentroCustoidusuarioalteracao: TIntegerField;
    TSyncCentroCustonome: TWideStringField;
    TSyncCentroCustoidsegmento: TIntegerField;
    TSyncCentroCustosyncaws: TIntegerField;
    TSyncEstoqueEntrada: TFDQuery;
    TSyncEstoqueEntradaid: TIntegerField;
    TSyncEstoqueEntradastatus: TIntegerField;
    TSyncEstoqueEntradadatareg: TSQLTimeStampField;
    TSyncEstoqueEntradaidusuario: TIntegerField;
    TSyncEstoqueEntradadataalteracao: TSQLTimeStampField;
    TSyncEstoqueEntradaidusuarioalteracao: TIntegerField;
    TSyncEstoqueEntradaidproduto: TIntegerField;
    TSyncEstoqueEntradaidfornecedor: TIntegerField;
    TSyncEstoqueEntradaidpedido: TIntegerField;
    TSyncEstoqueEntradanumeronf: TIntegerField;
    TSyncEstoqueEntradadataemissao: TDateField;
    TSyncEstoqueEntradadataentradaestoque: TDateField;
    TSyncEstoqueEntradavalortotalnf: TFMTBCDField;
    TSyncEstoqueEntradaqtditens: TFMTBCDField;
    TSyncEstoqueEntradaunidademedida: TWideStringField;
    TSyncEstoqueEntradapesoembalagem: TFMTBCDField;
    TSyncEstoqueEntradaidlocalestoque: TIntegerField;
    TSyncEstoqueEntradaidcentrocusto: TIntegerField;
    TSyncEstoqueEntradasyncaws: TIntegerField;
    TSyncOperadorMaquina: TFDQuery;
    TSyncOperadorMaquinaid: TIntegerField;
    TSyncOperadorMaquinastatus: TIntegerField;
    TSyncOperadorMaquinadatareg: TSQLTimeStampField;
    TSyncOperadorMaquinaidusuario: TIntegerField;
    TSyncOperadorMaquinadataalteracao: TSQLTimeStampField;
    TSyncOperadorMaquinaidusuarioalteracao: TIntegerField;
    TSyncOperadorMaquinanome: TWideStringField;
    TSyncOperadorMaquinasyncaws: TIntegerField;
    TSyncOperadorMaquinarg: TWideStringField;
    TSyncOperadorMaquinacpf: TWideStringField;
    TSyncOperadorMaquinacnh: TWideStringField;
    TSyncOperadorMaquinacelular: TWideStringField;
    TSyncMaquinasOperacaoidoperador: TIntegerField;
    TAuxTipoCultivare: TFDQuery;
    TAuxTipoCultivareid: TIntegerField;
    TAuxTipoCultivarestatus: TIntegerField;
    TAuxTipoCultivaredatareg: TSQLTimeStampField;
    TAuxTipoCultivareidusuario: TIntegerField;
    TAuxTipoCultivaredataalteracao: TSQLTimeStampField;
    TAuxTipoCultivareidusuarioalteracao: TIntegerField;
    TAuxTipoCultivarenome: TWideStringField;
    TAuxTipoCultivaresyncaws: TIntegerField;
    FDMemTable1: TFDMemTable;
    TDetReceituarioTalhao: TFDQuery;
    TDetReceituarioTalhaoid: TIntegerField;
    TDetReceituarioTalhaostatus: TIntegerField;
    TDetReceituarioTalhaodatareg: TSQLTimeStampField;
    TDetReceituarioTalhaoidusuario: TIntegerField;
    TDetReceituarioTalhaodataalteracao: TSQLTimeStampField;
    TDetReceituarioTalhaoidusuarioalteracao: TIntegerField;
    TDetReceituarioTalhaoidtalhao: TIntegerField;
    TDetReceituarioTalhaoareahe: TBCDField;
    TDetReceituarioTalhaosyncaws: TIntegerField;
    TDetReceituarioTalhaosyncfaz: TIntegerField;
    TDetReceituarioTalhaoidreceiturario: TIntegerField;
    TSyncVazaoOperacao: TFDQuery;
    TSyncVazaoOperacaoid: TIntegerField;
    TSyncVazaoOperacaostatus: TIntegerField;
    TSyncVazaoOperacaodatareg: TSQLTimeStampField;
    TSyncVazaoOperacaoidusuario: TIntegerField;
    TSyncVazaoOperacaodataalteracao: TSQLTimeStampField;
    TSyncVazaoOperacaoidusuarioalteracao: TIntegerField;
    TSyncVazaoOperacaoidoperacaotalhao: TIntegerField;
    TSyncVazaoOperacaocincoltha: TIntegerField;
    TSyncVazaoOperacaodezltha: TIntegerField;
    TSyncVazaoOperacaoquinzeltha: TIntegerField;
    TSyncVazaoOperacaovinteltha: TIntegerField;
    TSyncVazaoOperacaotrintaltha: TIntegerField;
    TSyncVazaoOperacaoquarentaltha: TIntegerField;
    TSyncVazaoOperacaocinquentaltha: TIntegerField;
    TSyncVazaoOperacaosetentaecincoltha: TIntegerField;
    TSyncVazaoOperacaocemltha: TIntegerField;
    TSyncVazaoOperacaosyncaws: TIntegerField;
    TSyncVazaoOperacaosyncfaz: TIntegerField;
    TSyncTalhoeslatitude: TWideStringField;
    TSyncTalhoeslongitude: TWideStringField;
    TSyncTalhoessyncfaz: TIntegerField;
    TSyncSetoreslatitude: TWideStringField;
    TSyncSetoreslongitude: TWideStringField;
    TSyncSetoressyncaws: TIntegerField;
    TSyncSetoressyncfaz: TIntegerField;
    TSyncAreaslatitude: TWideStringField;
    TSyncAreaslongitude: TWideStringField;
    TSyncAreassyncfaz: TIntegerField;
    TSyncOperacaoSafraTalhaoidcobertura: TIntegerField;
    TSyncOperacaoSafraTalhaosyncfaz: TIntegerField;
    TSyncOperacaoSafraTalhaoqualidadecobertura: TWideStringField;
    TPluviometros: TFDQuery;
    TPluviometroTalhoes: TFDQuery;
    TPluviometria: TFDQuery;
    TAbastecimento: TFDQuery;
    TAbastecimentoOutros: TFDQuery;
    TAbastecimentoOutrosid: TIntegerField;
    TAbastecimentoOutrosstatus: TIntegerField;
    TAbastecimentoOutrosdatareg: TSQLTimeStampField;
    TAbastecimentoOutrosidusuario: TIntegerField;
    TAbastecimentoOutrosdataalteracao: TSQLTimeStampField;
    TAbastecimentoOutrosidusuarioalteracao: TIntegerField;
    TAbastecimentoOutrosidabastecimento: TIntegerField;
    TAbastecimentoOutrosidproduto: TIntegerField;
    TAbastecimentoOutrosquantidade: TBCDField;
    TAbastecimentoOutrossyncaws: TIntegerField;
    TAbastecimentoOutrossyncfaz: TIntegerField;
    TPluviometroTalhoesid: TIntegerField;
    TPluviometroTalhoesstatus: TIntegerField;
    TPluviometroTalhoesdatareg: TSQLTimeStampField;
    TPluviometroTalhoesidusuario: TIntegerField;
    TPluviometroTalhoesdataalteracao: TSQLTimeStampField;
    TPluviometroTalhoesidusuarioalteracao: TIntegerField;
    TPluviometroTalhoesidpluviometro: TIntegerField;
    TPluviometroTalhoesidtalhao: TIntegerField;
    TPluviometroTalhoessyncaws: TIntegerField;
    TPluviometroTalhoessyncfaz: TIntegerField;
    TPluviometrosid: TIntegerField;
    TPluviometrosstatus: TIntegerField;
    TPluviometrosdatareg: TSQLTimeStampField;
    TPluviometrosidusuario: TIntegerField;
    TPluviometrosdataalteracao: TSQLTimeStampField;
    TPluviometrosidusuarioalteracao: TIntegerField;
    TPluviometrosnome: TWideStringField;
    TPluviometroslatitude: TWideStringField;
    TPluviometroslongitude: TWideStringField;
    TPluviometrosidsetor: TIntegerField;
    TPluviometrossyncaws: TIntegerField;
    TPluviometrossyncfaz: TIntegerField;
    TPluviometriaid: TIntegerField;
    TPluviometriastatus: TIntegerField;
    TPluviometriadatareg: TSQLTimeStampField;
    TPluviometriaidusuario: TIntegerField;
    TPluviometriadataalteracao: TSQLTimeStampField;
    TPluviometriaidusuarioalteracao: TIntegerField;
    TPluviometriaidpluviometro: TIntegerField;
    TPluviometriaidtalhao: TIntegerField;
    TPluviometriavolumemm: TBCDField;
    TPluviometriadatacoleta: TDateField;
    TPluviometriahora: TTimeField;
    TPluviometriasyncaws: TIntegerField;
    TPluviometriasyncfaz: TIntegerField;
    TAbastecimentoid: TIntegerField;
    TAbastecimentostatus: TIntegerField;
    TAbastecimentodatareg: TSQLTimeStampField;
    TAbastecimentoidusuario: TIntegerField;
    TAbastecimentodataalteracao: TSQLTimeStampField;
    TAbastecimentoidusuarioalteracao: TIntegerField;
    TAbastecimentoidlocalestoque: TIntegerField;
    TAbastecimentoidmaquina: TIntegerField;
    TAbastecimentoidoperador: TIntegerField;
    TAbastecimentovolumelt: TBCDField;
    TAbastecimentocombustivel: TIntegerField;
    TAbastecimentodataabastecimento: TDateField;
    TAbastecimentohora: TTimeField;
    TAbastecimentosyncaws: TIntegerField;
    TAbastecimentosyncfaz: TIntegerField;
    TDetReceituariofinalidade: TWideStringField;
    TDetReceituariosyncfaz: TIntegerField;
    TSyncUsuarioimgass: TBlobField;
    TSyncAuxPragas: TFDQuery;
    TSyncAuxPragasid: TIntegerField;
    TSyncAuxPragasstatus: TIntegerField;
    TSyncAuxPragasdatareg: TSQLTimeStampField;
    TSyncAuxPragasidusuario: TIntegerField;
    TSyncAuxPragasdataalteracao: TSQLTimeStampField;
    TSyncAuxPragasidusuarioalteracao: TIntegerField;
    TSyncAuxPragasnome: TWideStringField;
    TSyncAuxPragassyncaws: TIntegerField;
    TSyncAuxPragassyncfaz: TIntegerField;
    procedure TAuxCategoriasAWSReconcileError(DataSet: TFDDataSet;
      E: EFDException; UpdateKind: TFDDatSRowState;
      var Action: TFDDAptReconcileAction);
    procedure TAuxGrupoAWSReconcileError(DataSet: TFDDataSet; E: EFDException;
      UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
  private
    procedure AlteraFlaSynAWS(ATabela,Ids:string);
    procedure AcceptMudaFlagSyncCompras(vSql:string);
    procedure Notificacao(Titulo,Notificacao:string);
  public
    var
     Sincronizando:integer;
     srvDtSanap:string;
    procedure ReplicaUsuarios(id:string);
    procedure ReplicaCategoria(id:string);
    procedure ReplicaSubGrupo(id: string);
    procedure ReplicaGrupo(id:string);
    procedure ReplicaMarca(id: string);
    procedure ReplicaProduto(id: string);
    procedure ReplicaAuxCulturas(id: string);
    procedure ReplicaAuxtipomaquinaveiculos(id:string);
    procedure ReplicaAuxtipoOcorrencia(id:string);
    procedure ReplicaTipoServico(id:string);
    procedure ReplicaServico(id:string);
    procedure ReplicaCobertura(id:string);
    procedure ReplicaAuxTipoCultivar(id: string);
    procedure ReplicaCultivares(id:string);
    procedure ReplicaAreas(id:string);
    procedure ReplicaSetor(id:string);
    procedure ReplicaTalhao(id:string);
    procedure ReplicaMaquinaVeiculos(id:string);
    procedure ReplicaSafra(id:string);
    procedure ReplicaReceiturario(id:string);
    procedure ReplicaDetReceiturario(id:string);
    procedure ReplicaDetReceiturarioTalhao(id:string);

    procedure ReplicaFornecedor(id: string);

    //operaçoes agricultura
    procedure ReplicaOperacaoTalhao(id:string);
    procedure ReplicaOperacaoMaquinaTalhao(id:string);
    procedure ReplicaOperacaoProdutosTalhao(id:string);
    procedure ReplicaOperacaoOcorrenciaTalhao(id:string);
    procedure ReplicaOperadorMaquinas(id: string);
    procedure ReplicaOperacaoVazaoTalhao(id: string);

    //Operacoes Compras
    procedure ReplicaPedidoCompra(id: string);
    procedure ReplicaPedidoItenCompra(id: string);
    procedure ReplicaPedidoStatus(id: string);
    procedure ReplicaOrcamento(id: string);
    procedure ReplicaOrcamentoItens(id: string);

    //Estoque
    procedure ReplicaLocalEstoque(id:string);
    procedure ReplicaCentroCusto(id:string);
    procedure ReplicaEstoqueEntrada(id:string);

    procedure ReplicaPluviometro(id: string);
    procedure ReplicaPluviometroTalhoes(id: string);
    procedure ReplicaPluviometria(id: string);
    procedure ReplicaAbastecimento(id: string);
    procedure ReplicaAbastecimentoOutros(id: string);
    procedure ReplicaAuxPraga(id: string);

    procedure ReplicaAll;



  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses UPrincipal, DataContext, DmReplicaFaz;

{$R *.dfm}



procedure TDataModule1.ReplicaPluviometro(id: string);
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 TPluviometros.Close;
 TPluviometros.Open;
 if not TPluviometros.IsEmpty then
 begin
   JsonToSend := TStringStream.Create(nil);
   TPluviometros.SaveToStream(JsonToSend,sfJSON);
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/SyncPluviometro';
   IdHTTP1.Request.CustomHeaders.Clear;
   IdHTTP1.Request.ContentType := 'application/json';
   IdHTTP1.Request.Charset := 'UTF-8';
   IdHTTP1.Request.Clear;
   IdHTTP1.Request.BasicAuthentication := false;
   Sincronizando :=1;
   vReultHTTP  := IdHTTP1.Put(URL,JsonToSend);
   if copy(vReultHTTP,0,18)='{"result":[{"OK":"'then
   begin
     vReultHTTP := StringReplace(vReultHTTP,'{"result":[{"OK":"','',[rfReplaceAll]);
     vReultHTTP := StringReplace(vReultHTTP,'"}]}','',[rfReplaceAll]);
     AlteraFlaSynAWS('pluviometro',vReultHTTP);
     TThread.Synchronize(nil,procedure
      begin
       Sincronizando :=0;
       Notificacao('Sincronização','Registro Sincronizado com Sucesso!');
      end);
   end;
 end;
end;

procedure TDataModule1.ReplicaPluviometroTalhoes(id: string);
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 TPluviometroTalhoes.Close;
 TPluviometroTalhoes.Open;
 if not TPluviometroTalhoes.IsEmpty then
 begin
   JsonToSend := TStringStream.Create(nil);
   TPluviometroTalhoes.SaveToStream(JsonToSend,sfJSON);
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/SyncPluviometroTalhoes';
   IdHTTP1.Request.CustomHeaders.Clear;
   IdHTTP1.Request.ContentType := 'application/json';
   IdHTTP1.Request.Charset := 'UTF-8';
   IdHTTP1.Request.Clear;
   IdHTTP1.Request.BasicAuthentication := false;
   Sincronizando :=1;
   vReultHTTP  := IdHTTP1.Put(URL,JsonToSend);
   if copy(vReultHTTP,0,18)='{"result":[{"OK":"'then
   begin
     vReultHTTP := StringReplace(vReultHTTP,'{"result":[{"OK":"','',[rfReplaceAll]);
     vReultHTTP := StringReplace(vReultHTTP,'"}]}','',[rfReplaceAll]);
     AlteraFlaSynAWS('pluviometrotalhoes',vReultHTTP);
     TThread.Synchronize(nil,procedure
      begin
       Sincronizando :=0;
       Notificacao('Sincronização','Registro Sincronizado com Sucesso!');
      end);
   end;
 end;
end;

procedure TDataModule1.ReplicaPluviometria(id: string);
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 TPluviometria.Close;
 TPluviometria.Open;
 if not TPluviometria.IsEmpty then
 begin
   JsonToSend := TStringStream.Create(nil);
   TPluviometria.SaveToStream(JsonToSend,sfJSON);
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/SyncPluviometria';
   IdHTTP1.Request.CustomHeaders.Clear;
   IdHTTP1.Request.ContentType := 'application/json';
   IdHTTP1.Request.Charset := 'UTF-8';
   IdHTTP1.Request.Clear;
   IdHTTP1.Request.BasicAuthentication := false;
   Sincronizando :=1;
   vReultHTTP  := IdHTTP1.Put(URL,JsonToSend);
   if copy(vReultHTTP,0,18)='{"result":[{"OK":"'then
   begin
     vReultHTTP := StringReplace(vReultHTTP,'{"result":[{"OK":"','',[rfReplaceAll]);
     vReultHTTP := StringReplace(vReultHTTP,'"}]}','',[rfReplaceAll]);
     AlteraFlaSynAWS('pluviometria',vReultHTTP);
     TThread.Synchronize(nil,procedure
      begin
       Sincronizando :=0;
       Notificacao('Sincronização','Registro Sincronizado com Sucesso!');
      end);
   end;
 end;
end;

procedure TDataModule1.ReplicaAbastecimento(id: string);
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 TAbastecimento.Close;
 TAbastecimento.Open;
 if not TAbastecimento.IsEmpty then
 begin
   JsonToSend := TStringStream.Create(nil);
   TAbastecimento.SaveToStream(JsonToSend,sfJSON);
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/SyncAbastecimento';
   IdHTTP1.Request.CustomHeaders.Clear;
   IdHTTP1.Request.ContentType := 'application/json';
   IdHTTP1.Request.Charset := 'UTF-8';
   IdHTTP1.Request.Clear;
   IdHTTP1.Request.BasicAuthentication := false;
   Sincronizando :=1;
   vReultHTTP  := IdHTTP1.Put(URL,JsonToSend);
   if copy(vReultHTTP,0,18)='{"result":[{"OK":"'then
   begin
     vReultHTTP := StringReplace(vReultHTTP,'{"result":[{"OK":"','',[rfReplaceAll]);
     vReultHTTP := StringReplace(vReultHTTP,'"}]}','',[rfReplaceAll]);
     AlteraFlaSynAWS('abastecimento',vReultHTTP);
     TThread.Synchronize(nil,procedure
      begin
       Sincronizando :=0;
       Notificacao('Sincronização','Registro Sincronizado com Sucesso!');
      end);
   end;
 end;
end;

procedure TDataModule1.ReplicaAbastecimentoOutros(id: string);
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 TAbastecimentoOutros.Close;
 TAbastecimentoOutros.Open;
 if not TAbastecimentoOutros.IsEmpty then
 begin
   JsonToSend := TStringStream.Create(nil);
   TAbastecimentoOutros.SaveToStream(JsonToSend,sfJSON);
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/SyncAbastecimentoOutros';
   IdHTTP1.Request.CustomHeaders.Clear;
   IdHTTP1.Request.ContentType := 'application/json';
   IdHTTP1.Request.Charset := 'UTF-8';
   IdHTTP1.Request.Clear;
   IdHTTP1.Request.BasicAuthentication := false;
   Sincronizando :=1;
   vReultHTTP  := IdHTTP1.Put(URL,JsonToSend);
   if copy(vReultHTTP,0,18)='{"result":[{"OK":"'then
   begin
     vReultHTTP := StringReplace(vReultHTTP,'{"result":[{"OK":"','',[rfReplaceAll]);
     vReultHTTP := StringReplace(vReultHTTP,'"}]}','',[rfReplaceAll]);
     AlteraFlaSynAWS('abastecimentooutros',vReultHTTP);
     TThread.Synchronize(nil,procedure
      begin
       Sincronizando :=0;
       Notificacao('Sincronização','Registro Sincronizado com Sucesso!');
      end);
   end;
 end;
end;

procedure TDataModule1.ReplicaAuxPraga(id: string);
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 TSyncAuxPragas.Close;
 TSyncAuxPragas.Open;
 if not TSyncAuxPragas.IsEmpty then
 begin
   JsonToSend := TStringStream.Create(nil);
   TSyncAuxPragas.SaveToStream(JsonToSend,sfJSON);
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/SyncAuxPragas';
   IdHTTP1.Request.CustomHeaders.Clear;
   IdHTTP1.Request.ContentType := 'application/json';
   IdHTTP1.Request.Charset := 'UTF-8';
   IdHTTP1.Request.Clear;
   IdHTTP1.Request.BasicAuthentication := false;
   Sincronizando :=1;
   vReultHTTP  := IdHTTP1.Put(URL,JsonToSend);
   if copy(vReultHTTP,0,18)='{"result":[{"OK":"'then
   begin
     vReultHTTP := StringReplace(vReultHTTP,'{"result":[{"OK":"','',[rfReplaceAll]);
     vReultHTTP := StringReplace(vReultHTTP,'"}]}','',[rfReplaceAll]);
     AlteraFlaSynAWS('AuxPragas',vReultHTTP);
     TThread.Synchronize(nil,procedure
      begin
       Sincronizando :=0;
       Notificacao('Sincronização','Registro Sincronizado com Sucesso!');
      end);
   end;
 end;
end;


procedure TDataModule1.AcceptMudaFlagSyncCompras(vSql: string);
var
 Txt         : TextFile;
 Quebra      : TStringList;
 LJSon       : TJSONArray;
 Url,URLDec,vReultHTTP,vReultHTTPc: String;
 JsonToSend  : TStringStream;
 i           : integer;
 StrAux      : TStringWriter;
 txtJson     : TJsonTextWriter;
 LJsonObj    : TJSONObject;
 Server      : TIdHTTP;
begin
 JsonToSend := TStringStream.Create(nil);
 if dbCtx.vTipoBDConfig=0 then
  Url := 'http://54.198.102.100:8091/MudaFlagSyncCompras'
 else
  Url := 'http://54.198.102.100:8092/MudaFlagSyncCompras';

 StrAux  := TStringWriter.Create;
 txtJson := TJsonTextWriter.Create(StrAux);
 txtJson.Formatting := TJsonFormatting.Indented;
 TxtJSON.WriteStartObject; //Objeto maior
 TxtJSON.WritePropertyName('MudaFlag');
 TxtJSON.WriteStartArray; //Objeto pedido
   txtJson.WriteStartObject;
   txtJson.WritePropertyName('sql');
   txtJson.WriteValue(vSql);
 TxtJSON.WriteEndArray; //Fecha Array dos Itens
 TxtJSON.WriteEndObject;  //Fecha Cabeçalho do pedido
 LJsonObj := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
 JsonToSend := TStringStream.Create(LJsonObj.ToJSON);
 IdHTTP1.Request.CustomHeaders.Clear;
 IdHTTP1.Request.Accept      := 'application/json';
 IdHTTP1.Request.ContentType := 'application/json';
 vReultHTTP  := IdHTTP1.Post(URL,JsonToSend);
end;

procedure TDataModule1.AlteraFlaSynAWS(ATabela, Ids: string);
var
 vQry:TFDQuery;
begin
 vQry :=TFDQuery.Create(nil);
 vQry.Connection := dbCtx.FDConPG;
 with vQry,vQry.SQL do
 begin
   Clear;
   Add('update '+ATabela+ ' SET syncaws=1');
   Add('where id in('+Ids+')');
   vQry.SQL.Text;
   ExecSQL;
 end;
end;



procedure TDataModule1.Notificacao(Titulo, Notificacao: string);
var
  MyNotification: TNotification;
  iOcorrencia,iEvento:integer;
begin
  MyNotification := NotificationCenter1.CreateNotification;
  try
    MyNotification.Name := 'NotificationOcorrencias';
    MyNotification.Title := Titulo;
    MyNotification.AlertBody := Notificacao;
    NotificationCenter1.PresentNotification(MyNotification);
  finally
    MyNotification.Free;
  end;
end;

procedure TDataModule1.ReplicaCategoria(id:string);
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 TSyncAuxCategorias.Close;
 TSyncAuxCategorias.Open;
 if not TSyncAuxCategorias.IsEmpty then
 begin
   Sincronizando :=1;
   JsonToSend := TStringStream.Create(nil);
   TSyncAuxCategorias.SaveToStream(JsonToSend,sfJSON);
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/SyncCategoria';
   IdHTTP1.Request.CustomHeaders.Clear;
   IdHTTP1.Request.ContentType := 'application/json';
   IdHTTP1.Request.Charset := 'UTF-8';
   IdHTTP1.Request.Clear;
   IdHTTP1.Request.BasicAuthentication := false;
   vReultHTTP  := IdHTTP1.Put(URL,JsonToSend);
   if copy(vReultHTTP,0,18)='{"result":[{"OK":"'then
   begin
     vReultHTTP := StringReplace(vReultHTTP,'{"result":[{"OK":"','',[rfReplaceAll]);
     vReultHTTP := StringReplace(vReultHTTP,'"}]}','',[rfReplaceAll]);
     AlteraFlaSynAWS('auxcategoriaitem',vReultHTTP);
     TThread.Synchronize(nil,procedure
      begin
       Sincronizando :=0;
       Notificacao('Sincronização','Registro Sincronizado com Sucesso!');
      end);
   end;
 end;
end;

procedure TDataModule1.ReplicaCobertura(id: string);
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 TThread.Synchronize(nil,procedure
 begin
  TAuxSyncCobertura.Close;
  TAuxSyncCobertura.Open;
 end);
 if not TAuxSyncCobertura.IsEmpty then
 begin
   JsonToSend := TStringStream.Create(nil);
   TAuxSyncCobertura.SaveToStream(JsonToSend,sfJSON);
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/SyncCobertura';
   IdHTTP1.Request.CustomHeaders.Clear;
   IdHTTP1.Request.ContentType := 'application/json';
   IdHTTP1.Request.Charset := 'UTF-8';
   IdHTTP1.Request.Clear;
   IdHTTP1.Request.BasicAuthentication := false;
   Sincronizando :=1;
   vReultHTTP  := IdHTTP1.Put(URL,JsonToSend);
   if copy(vReultHTTP,0,18)='{"result":[{"OK":"'then
   begin
     vReultHTTP := StringReplace(vReultHTTP,'{"result":[{"OK":"','',[rfReplaceAll]);
     vReultHTTP := StringReplace(vReultHTTP,'"}]}','',[rfReplaceAll]);
     TThread.Synchronize(nil,procedure
     begin
      Sincronizando :=0;
      Notificacao('Sincronização','Registro Sincronizado com Sucesso!');
     end);
     AlteraFlaSynAWS('auxCobertura',vReultHTTP);
   end;
 end;
end;

procedure TDataModule1.ReplicaAuxTipoCultivar(id: string);
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 TThread.Synchronize(nil,procedure
 begin
  TAuxTipoCultivare.Close;
  TAuxTipoCultivare.Open;
 end);
 if not TAuxTipoCultivare.IsEmpty then
 begin
   JsonToSend := TStringStream.Create(nil);
   TAuxTipoCultivare.SaveToStream(JsonToSend,sfJSON);
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/SyncTipoCultivar';
   IdHTTP1.Request.CustomHeaders.Clear;
   IdHTTP1.Request.ContentType := 'application/json';
   IdHTTP1.Request.Charset := 'UTF-8';
   IdHTTP1.Request.Clear;
   IdHTTP1.Request.BasicAuthentication := false;
   Sincronizando :=1;
   vReultHTTP  := IdHTTP1.Put(URL,JsonToSend);
   if copy(vReultHTTP,0,18)='{"result":[{"OK":"'then
   begin
     vReultHTTP := StringReplace(vReultHTTP,'{"result":[{"OK":"','',[rfReplaceAll]);
     vReultHTTP := StringReplace(vReultHTTP,'"}]}','',[rfReplaceAll]);
     TThread.Synchronize(nil,procedure
     begin
      Sincronizando :=0;
      Notificacao('Sincronização','Registro Sincronizado com Sucesso!');
     end);
     AlteraFlaSynAWS('auxTipoCultivar',vReultHTTP);
   end;
 end;
end;

procedure TDataModule1.ReplicaCultivares(id: string);
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 TAuxSyncCultivares.Close;
 TAuxSyncCultivares.Open;
 if not TAuxSyncCultivares.IsEmpty then
 begin
   JsonToSend := TStringStream.Create(nil);
   TAuxSyncCultivares.SaveToStream(JsonToSend,sfJSON);
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/SyncAuxCultivare';
   IdHTTP1.Request.CustomHeaders.Clear;
   IdHTTP1.Request.ContentType := 'application/json';
   IdHTTP1.Request.Charset := 'UTF-8';
   IdHTTP1.Request.Clear;
   IdHTTP1.Request.BasicAuthentication := false;
   Sincronizando :=1;
   vReultHTTP  := IdHTTP1.Put(URL,JsonToSend);
   if copy(vReultHTTP,0,18)='{"result":[{"OK":"'then
   begin
     vReultHTTP := StringReplace(vReultHTTP,'{"result":[{"OK":"','',[rfReplaceAll]);
     vReultHTTP := StringReplace(vReultHTTP,'"}]}','',[rfReplaceAll]);
     AlteraFlaSynAWS('auxCultivares',vReultHTTP);
      TThread.Synchronize(nil,procedure
      begin
       Sincronizando :=0;
       Notificacao('Sincronização','Registro Sincronizado com Sucesso!');
      end);
   end;
 end;
end;

procedure TDataModule1.ReplicaDetReceiturario(id: string);
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 TDetReceituario.Close;
 TDetReceituario.Open;
 if not TDetReceituario.IsEmpty then
 begin
   Sincronizando :=1;
   JsonToSend := TStringStream.Create(nil);
   TDetReceituario.SaveToStream(JsonToSend,sfJSON);
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/SyncDetReceituario';
   IdHTTP1.Request.CustomHeaders.Clear;
   IdHTTP1.Request.ContentType := 'application/json';
   IdHTTP1.Request.Charset := 'UTF-8';
   IdHTTP1.Request.Clear;
   IdHTTP1.Request.BasicAuthentication := false;
   vReultHTTP  := IdHTTP1.Put(URL,JsonToSend);
   if copy(vReultHTTP,0,18)='{"result":[{"OK":"'then
   begin
     vReultHTTP := StringReplace(vReultHTTP,'{"result":[{"OK":"','',[rfReplaceAll]);
     vReultHTTP := StringReplace(vReultHTTP,'"}]}','',[rfReplaceAll]);
     AlteraFlaSynAWS('DetReceiturario',vReultHTTP);
      TThread.Synchronize(nil,procedure
      begin
       Sincronizando :=0;
       Notificacao('Sincronização','Registro Sincronizado com Sucesso!');
      end);
   end;
 end;
end;

procedure TDataModule1.ReplicaDetReceiturarioTalhao(id: string);
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 TDetReceituarioTalhao.Close;
 TDetReceituarioTalhao.Open;
 if not TDetReceituarioTalhao.IsEmpty then
 begin
   Sincronizando :=1;
   JsonToSend := TStringStream.Create(nil);
   TDetReceituarioTalhao.SaveToStream(JsonToSend,sfJSON);
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/SyncDetReceituarioTalhao';
   IdHTTP1.Request.CustomHeaders.Clear;
   IdHTTP1.Request.ContentType := 'application/json';
   IdHTTP1.Request.Charset := 'UTF-8';
   IdHTTP1.Request.Clear;
   IdHTTP1.Request.BasicAuthentication := false;
   vReultHTTP  := IdHTTP1.Put(URL,JsonToSend);
   if copy(vReultHTTP,0,18)='{"result":[{"OK":"'then
   begin
     vReultHTTP := StringReplace(vReultHTTP,'{"result":[{"OK":"','',[rfReplaceAll]);
     vReultHTTP := StringReplace(vReultHTTP,'"}]}','',[rfReplaceAll]);
     AlteraFlaSynAWS('detreceiturarioTalhao',vReultHTTP);
      TThread.Synchronize(nil,procedure
      begin
       Sincronizando :=0;
       Notificacao('Sincronização','Registro Sincronizado com Sucesso!');
      end);
   end;
 end;
end;

procedure TDataModule1.ReplicaEstoqueEntrada(id: string);
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 TSyncEstoqueEntrada.Close;
 TSyncEstoqueEntrada.Open;
 if not TSyncEstoqueEntrada.IsEmpty then
 begin
   Sincronizando :=1;
   JsonToSend := TStringStream.Create(nil);
   TSyncEstoqueEntrada.SaveToStream(JsonToSend,sfJSON);
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/SyncEstoqueEntrada';
   IdHTTP1.Request.CustomHeaders.Clear;
   IdHTTP1.Request.ContentType := 'application/json';
   IdHTTP1.Request.Charset := 'UTF-8';
   IdHTTP1.Request.Clear;
   IdHTTP1.Request.BasicAuthentication := false;
   vReultHTTP  := IdHTTP1.Put(URL,JsonToSend);
   if copy(vReultHTTP,0,18)='{"result":[{"OK":"'then
   begin
     vReultHTTP := StringReplace(vReultHTTP,'{"result":[{"OK":"','',[rfReplaceAll]);
     vReultHTTP := StringReplace(vReultHTTP,'"}]}','',[rfReplaceAll]);
     AlteraFlaSynAWS('estoqueentrada',vReultHTTP);
      TThread.Synchronize(nil,procedure
      begin
       Sincronizando :=0;
       Notificacao('Sincronização','Registro Sincronizado com Sucesso!');
      end);
   end;
 end;
end;

procedure TDataModule1.ReplicaSubGrupo(id: string);
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 TAuxSubGrupo.Close;
 TAuxSubGrupo.Open;
 if not TAuxSubGrupo.IsEmpty then
 begin
   Sincronizando :=1;
   JsonToSend := TStringStream.Create(nil);
   TAuxSubGrupo.SaveToStream(JsonToSend,sfJSON);
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/SyncSubGrupos';
   IdHTTP1.Request.CustomHeaders.Clear;
   IdHTTP1.Request.ContentType := 'application/json';
   IdHTTP1.Request.Charset := 'UTF-8';
   IdHTTP1.Request.Clear;
   IdHTTP1.Request.BasicAuthentication := false;
   vReultHTTP  := IdHTTP1.Put(URL,JsonToSend);
   if copy(vReultHTTP,0,18)='{"result":[{"OK":"'then
   begin
     vReultHTTP := StringReplace(vReultHTTP,'{"result":[{"OK":"','',[rfReplaceAll]);
     vReultHTTP := StringReplace(vReultHTTP,'"}]}','',[rfReplaceAll]);
     AlteraFlaSynAWS('auxsubgrupoprodutos',vReultHTTP);
      TThread.Synchronize(nil,procedure
      begin
       Sincronizando :=0;
       Notificacao('Sincronização','Registro Sincronizado com Sucesso!');
      end);
   end;
 end;
end;

procedure TDataModule1.ReplicaTalhao(id: string);
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 TThread.Synchronize(nil,procedure
 begin
  TSyncTalhoes.Close;
  TSyncTalhoes.Open;
 end);
 if not TSyncTalhoes.IsEmpty then
 begin
   JsonToSend := TStringStream.Create(nil);
   TSyncTalhoes.SaveToStream(JsonToSend,sfJSON);
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/SyncTalhoes';
   IdHTTP1.Request.CustomHeaders.Clear;
   IdHTTP1.Request.ContentType := 'application/json';
   IdHTTP1.Request.Charset := 'UTF-8';
   IdHTTP1.Request.Clear;
   IdHTTP1.Request.BasicAuthentication := false;
   Sincronizando :=1;
   vReultHTTP  := IdHTTP1.Put(URL,JsonToSend);
   if copy(vReultHTTP,0,18)='{"result":[{"OK":"'then
   begin
     vReultHTTP := StringReplace(vReultHTTP,'{"result":[{"OK":"','',[rfReplaceAll]);
     vReultHTTP := StringReplace(vReultHTTP,'"}]}','',[rfReplaceAll]);
     TThread.Synchronize(nil,procedure
     begin
      Sincronizando :=0;
      Notificacao('Sincronização','Registro Sincronizado com Sucesso!');
     end);
     AlteraFlaSynAWS('talhoes',vReultHTTP);
   end;
 end;
end;

procedure TDataModule1.ReplicaTipoServico(id: string);
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 TThread.Synchronize(nil,procedure
 begin
  TSyncAuxTipoServico.Close;
  TSyncAuxTipoServico.Open;
 end);
 if not TSyncAuxTipoServico.IsEmpty then
 begin
   JsonToSend := TStringStream.Create(nil);
   TSyncAuxTipoServico.SaveToStream(JsonToSend,sfJSON);
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/SyncAuxTipoServico';
   IdHTTP1.Request.CustomHeaders.Clear;
   IdHTTP1.Request.ContentType := 'application/json';
   IdHTTP1.Request.Charset := 'UTF-8';
   IdHTTP1.Request.Clear;
   IdHTTP1.Request.BasicAuthentication := false;
   Sincronizando :=1;
   vReultHTTP  := IdHTTP1.Put(URL,JsonToSend);
   if copy(vReultHTTP,0,18)='{"result":[{"OK":"'then
   begin
     vReultHTTP := StringReplace(vReultHTTP,'{"result":[{"OK":"','',[rfReplaceAll]);
     vReultHTTP := StringReplace(vReultHTTP,'"}]}','',[rfReplaceAll]);
     TThread.Synchronize(nil,procedure
     begin
      Sincronizando :=0;
      Notificacao('Sincronização','Registro Sincronizado com Sucesso!');
     end);
     AlteraFlaSynAWS('auxTipoServico',vReultHTTP);
   end;
 end;
end;

procedure TDataModule1.ReplicaFornecedor(id: string);
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 TThread.Synchronize(nil,procedure
 begin
  TSyncFornecedores.Close;
  TSyncFornecedores.Open;
 end);
 if not TSyncFornecedores.IsEmpty then
 begin
   Sincronizando :=1;
   JsonToSend := TStringStream.Create(nil);
   TSyncFornecedores.SaveToStream(JsonToSend,sfJSON);
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/SyncFornecedor';
   IdHTTP1.Request.CustomHeaders.Clear;
   IdHTTP1.Request.ContentType := 'application/json';
   IdHTTP1.Request.Charset := 'UTF-8';
   IdHTTP1.Request.Clear;
   IdHTTP1.Request.BasicAuthentication := false;
   vReultHTTP  := IdHTTP1.Put(URL,JsonToSend);
   if copy(vReultHTTP,0,18)='{"result":[{"OK":"'then
   begin
     vReultHTTP := StringReplace(vReultHTTP,'{"result":[{"OK":"','',[rfReplaceAll]);
     vReultHTTP := StringReplace(vReultHTTP,'"}]}','',[rfReplaceAll]);
     TThread.Synchronize(nil,procedure
     begin
      Sincronizando :=0;
      Notificacao('Sincronização','Registro Sincronizado com Sucesso!');
     end);
     AlteraFlaSynAWS('fornecedor',vReultHTTP);
   end;
 end;
end;

procedure TDataModule1.ReplicaUsuarios(id: string);
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 TThread.Synchronize(nil,procedure
 begin
  TSyncUsuario.Close;
  TSyncUsuario.Open;
 end);
 if not TSyncUsuario.IsEmpty then
 begin
   Sincronizando :=1;
   JsonToSend := TStringStream.Create(nil);
   TSyncUsuario.SaveToStream(JsonToSend,sfJSON);
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/SyncUsuarios';
   IdHTTP1.Request.CustomHeaders.Clear;
   IdHTTP1.Request.ContentType := 'application/json';
   IdHTTP1.Request.Charset := 'UTF-8';
   IdHTTP1.Request.Clear;
   IdHTTP1.Request.BasicAuthentication := false;
   vReultHTTP  := IdHTTP1.Put(URL,JsonToSend);
   if copy(vReultHTTP,0,18)='{"result":[{"OK":"'then
   begin
     vReultHTTP := StringReplace(vReultHTTP,'{"result":[{"OK":"','',[rfReplaceAll]);
     vReultHTTP := StringReplace(vReultHTTP,'"}]}','',[rfReplaceAll]);
     TThread.Synchronize(nil,procedure
     begin
      Sincronizando :=0;
      Notificacao('Sincronização','Registro Sincronizado com Sucesso!');
     end);
     AlteraFlaSynAWS('usuario',vReultHTTP);
   end;
 end;
end;

procedure TDataModule1.ReplicaGrupo(id: string);
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 TThread.Synchronize(nil,procedure
 begin
  TSyncGrupo.Close;
  TSyncGrupo.Open;
 end);
 if not TSyncGrupo.IsEmpty then
 begin
   Sincronizando :=1;
   JsonToSend := TStringStream.Create(nil);
   TSyncGrupo.SaveToStream(JsonToSend,sfJSON);
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/SyncGrupos';
   IdHTTP1.Request.CustomHeaders.Clear;
   IdHTTP1.Request.ContentType := 'application/json';
   IdHTTP1.Request.Charset := 'UTF-8';
   IdHTTP1.Request.Clear;
   IdHTTP1.Request.BasicAuthentication := false;
   vReultHTTP  := IdHTTP1.Put(URL,JsonToSend);
   if copy(vReultHTTP,0,18)='{"result":[{"OK":"'then
   begin
     vReultHTTP := StringReplace(vReultHTTP,'{"result":[{"OK":"','',[rfReplaceAll]);
     vReultHTTP := StringReplace(vReultHTTP,'"}]}','',[rfReplaceAll]);
     TThread.Synchronize(nil,procedure
     begin
      Sincronizando :=0;
      Notificacao('Sincronização','Registro Sincronizado com Sucesso!');
     end);
     AlteraFlaSynAWS('auxgrupoprodutos',vReultHTTP);
   end;
 end;
end;

procedure TDataModule1.ReplicaOperadorMaquinas(id: string);
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 TThread.Synchronize(nil,procedure
 begin
  TSyncOperadorMaquina.Close;
  TSyncOperadorMaquina.Open;
 end);
 if not TSyncOperadorMaquina.IsEmpty then
 begin
   Sincronizando :=1;
   JsonToSend := TStringStream.Create(nil);
   TSyncOperadorMaquina.SaveToStream(JsonToSend,sfJSON);
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/SyncOperadorMaquina';
   IdHTTP1.Request.CustomHeaders.Clear;
   IdHTTP1.Request.ContentType := 'application/json';
   IdHTTP1.Request.Charset := 'UTF-8';
   IdHTTP1.Request.Clear;
   IdHTTP1.Request.BasicAuthentication := false;
   vReultHTTP  := IdHTTP1.Put(URL,JsonToSend);
   if copy(vReultHTTP,0,18)='{"result":[{"OK":"'then
   begin
     vReultHTTP := StringReplace(vReultHTTP,'{"result":[{"OK":"','',[rfReplaceAll]);
     vReultHTTP := StringReplace(vReultHTTP,'"}]}','',[rfReplaceAll]);
     TThread.Synchronize(nil,procedure
     begin
      Sincronizando :=0;
      Notificacao('Sincronização','Registro Sincronizado com Sucesso!');
     end);
     AlteraFlaSynAWS('operadormaquinas',vReultHTTP);
   end;
 end;
end;

procedure TDataModule1.ReplicaMaquinaVeiculos(id: string);
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 TSyncMaquinas.Close;
 TSyncMaquinas.Open;
 if not TSyncMaquinas.IsEmpty then
 begin
   JsonToSend := TStringStream.Create(nil);
   TSyncMaquinas.SaveToStream(JsonToSend,sfJSON);
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/SyncMaquinas';
   IdHTTP1.Request.CustomHeaders.Clear;
   IdHTTP1.Request.ContentType := 'application/json';
   IdHTTP1.Request.Charset := 'UTF-8';
   IdHTTP1.Request.Clear;
   IdHTTP1.Request.BasicAuthentication := false;
   Sincronizando :=1;
   vReultHTTP  := IdHTTP1.Put(URL,JsonToSend);
   if copy(vReultHTTP,0,18)='{"result":[{"OK":"'then
   begin
     vReultHTTP := StringReplace(vReultHTTP,'{"result":[{"OK":"','',[rfReplaceAll]);
     vReultHTTP := StringReplace(vReultHTTP,'"}]}','',[rfReplaceAll]);
     AlteraFlaSynAWS('maquinaveiculo',vReultHTTP);
     TThread.Synchronize(nil,procedure
     begin
      Sincronizando :=0;
      Notificacao('Sincronização','Registro Sincronizado com Sucesso!');
     end);
   end;
 end;
end;

procedure TDataModule1.ReplicaMarca(id: string);
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 TAuxMarcas.Close;
 TAuxMarcas.Open;
 if not TAuxMarcas.IsEmpty then
 begin
   Sincronizando :=1;
   JsonToSend := TStringStream.Create(nil);
   TAuxMarcas.SaveToStream(JsonToSend,sfJSON);
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/SyncMarcas';
   IdHTTP1.Request.CustomHeaders.Clear;
   IdHTTP1.Request.ContentType := 'application/json';
   IdHTTP1.Request.Charset := 'UTF-8';
   IdHTTP1.Request.Clear;
   IdHTTP1.Request.BasicAuthentication := false;
   vReultHTTP  := IdHTTP1.Put(URL,JsonToSend);
   if copy(vReultHTTP,0,18)='{"result":[{"OK":"'then
   begin
     vReultHTTP := StringReplace(vReultHTTP,'{"result":[{"OK":"','',[rfReplaceAll]);
     vReultHTTP := StringReplace(vReultHTTP,'"}]}','',[rfReplaceAll]);
     AlteraFlaSynAWS('auxmarcas',vReultHTTP);
     TThread.Synchronize(nil,procedure
     begin
       Sincronizando :=0;
      Notificacao('Sincronização','Registro Sincronizado com Sucesso!');
     end);
   end;
 end;
end;

procedure TDataModule1.ReplicaPedidoCompra(id: string);
var
 URL,vReultHTTP,vReultHTTPC:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 TSyncPedidoCompra.Close;
 TSyncPedidoCompra.Open;
 if not TSyncPedidoCompra.IsEmpty then
 begin
   JsonToSend := TStringStream.Create(nil);
   TSyncPedidoCompra.SaveToStream(JsonToSend,sfJSON);
   Url := 'http://54.198.102.100:8091/SyncPedidoCompra';

   IdHTTP1.Request.Accept      := 'application/json';
   IdHTTP1.Request.ContentType := 'application/json';
   Sincronizando :=1;
   vReultHTTP  := IdHTTP1.Post(URL,JsonToSend);
   vReultHTTPC  := copy(vReultHTTP,0,4);
   if vReultHTTPC='{"OK' then
   begin
     vReultHTTP      := StringReplace(vReultHTTP,'{"OK":"','',[rfReplaceAll]);
     vReultHTTP := StringReplace(vReultHTTP,'"}','',[rfReplaceAll]);
     AlteraFlaSynAWS('pedidocompra',vReultHTTP);
     TThread.Synchronize(nil,procedure
     begin
      Sincronizando :=0;
//      Notificacao('Sincronização','Registro Sincronizado com Sucesso!');
     end);
   end;
 end;
end;

procedure TDataModule1.ReplicaPedidoItenCompra(id: string);
var
 URL,vReultHTTP,vReultHTTPC:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 TItensPedido.Close;
 TItensPedido.Open;
 if not TItensPedido.IsEmpty then
 begin
   JsonToSend := TStringStream.Create(nil);
   TItensPedido.SaveToStream(JsonToSend,sfJSON);
   Url := 'http://54.198.102.100:8091/SyncPedidoCompraItens';

   IdHTTP1.Request.CustomHeaders.Clear;
   IdHTTP1.Request.Accept      := 'application/json';
   IdHTTP1.Request.ContentType := 'application/json';
   Sincronizando :=1;
   vReultHTTP  := IdHTTP1.Post(URL,JsonToSend);
   vReultHTTPC  := copy(vReultHTTP,0,4);
   if vReultHTTPC='{"OK' then
   begin
     vReultHTTP      := StringReplace(vReultHTTP,'{"Ok":"','',[rfReplaceAll]);
     vReultHTTP := StringReplace(vReultHTTP,'"}','',[rfReplaceAll]);
     AlteraFlaSynAWS('pedidocompraitems',vReultHTTP);
     TThread.Synchronize(nil,procedure
     begin
      Sincronizando :=0;
     end);
   end;
 end;
end;

procedure TDataModule1.ReplicaPedidoStatus(id: string);
var
 URL,vReultHTTP,vReultHTTPC:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 TStatusPedido.Close;
 TStatusPedido.Open;
 if not TStatusPedido.IsEmpty then
 begin
   JsonToSend := TStringStream.Create(nil);
   TStatusPedido.SaveToStream(JsonToSend,sfJSON);
   Url := 'http://54.198.102.100:8091/SyncStatusPedido';

   IdHTTP1.Request.Accept      := 'application/json';
   IdHTTP1.Request.ContentType := 'application/json';

   Sincronizando :=1;
   vReultHTTP  := IdHTTP1.post(URL,JsonToSend);

   vReultHTTPC  := copy(vReultHTTP,0,4);
   if vReultHTTPC='{"OK' then
   begin
     vReultHTTP      := StringReplace(vReultHTTP,'{"OK":"','',[rfReplaceAll]);
     vReultHTTP := StringReplace(vReultHTTP,'"}','',[rfReplaceAll]);
     AlteraFlaSynAWS('pedidostatus',vReultHTTP);
     TThread.Synchronize(nil,procedure
     begin
      Sincronizando :=0;
     end);
   end;
 end;
end;

procedure TDataModule1.ReplicaProduto(id: string);
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 TSyncProdutos.Close;
 TSyncProdutos.Open;
 if not TSyncProdutos.IsEmpty then
 begin
   JsonToSend := TStringStream.Create(nil);
   TSyncProdutos.SaveToStream(JsonToSend,sfJSON);
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/SyncProdutos';
   IdHTTP1.Request.CustomHeaders.Clear;
   IdHTTP1.Request.ContentType := 'application/json';
   IdHTTP1.Request.Charset := 'UTF-8';
   IdHTTP1.Request.Clear;
   IdHTTP1.Request.BasicAuthentication := false;
   Sincronizando :=1;
   vReultHTTP  := IdHTTP1.Put(URL,JsonToSend);
   if copy(vReultHTTP,0,18)='{"result":[{"OK":"'then
   begin
     vReultHTTP := StringReplace(vReultHTTP,'{"result":[{"OK":"','',[rfReplaceAll]);
     vReultHTTP := StringReplace(vReultHTTP,'"}]}','',[rfReplaceAll]);
     AlteraFlaSynAWS('produtos',vReultHTTP);
     TThread.Synchronize(nil,procedure
     begin
      Sincronizando :=0;
      Notificacao('Sincronização','Registro Sincronizado com Sucesso!');
     end);
   end;
 end;
end;

procedure TDataModule1.ReplicaReceiturario(id: string);
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 TSyncReceituario.Close;
 TSyncReceituario.Open;
 if not TSyncReceituario.IsEmpty then
 begin
   Sincronizando :=1;
   JsonToSend := TStringStream.Create(nil);
   TSyncReceituario.SaveToStream(JsonToSend,sfJSON);
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/SyncReceituario';
   IdHTTP1.Request.CustomHeaders.Clear;
   IdHTTP1.Request.ContentType := 'application/json';
   IdHTTP1.Request.Charset := 'UTF-8';
   IdHTTP1.Request.Clear;
   IdHTTP1.Request.BasicAuthentication := false;
   vReultHTTP  := IdHTTP1.Put(URL,JsonToSend);
   if copy(vReultHTTP,0,18)='{"result":[{"OK":"'then
   begin
     vReultHTTP := StringReplace(vReultHTTP,'{"result":[{"OK":"','',[rfReplaceAll]);
     vReultHTTP := StringReplace(vReultHTTP,'"}]}','',[rfReplaceAll]);
     AlteraFlaSynAWS('receiturario',vReultHTTP);
      TThread.Synchronize(nil,procedure
      begin
       Sincronizando :=0;
       Notificacao('Sincronização','Registro Sincronizado com Sucesso!');
      end);
   end;
 end;
end;

procedure TDataModule1.ReplicaAll;
begin
  TThread.CreateAnonymousThread(procedure()
  var
   vProgres:Double;
  begin
    vProgres := 2.94;
    TThread.Synchronize(nil,procedure
    begin
      dbCtx.AtualizaSequencias;
      frmPrincipal.msmoSync.Lines.Clear;
      frmPrincipal.laySync.visible := true;
      frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Inicio sincrionização AWS');
      frmPrincipal.ProgressBarSync.Value :=0;
      frmPrincipal.ProgressBarSync.Min   :=0;
      frmPrincipal.ProgressBarSync.Max   :=100;
    end);
    TThread.Synchronize(nil,procedure
    begin
     frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Usuarios AWS');
    end);
    ReplicaUsuarios('');
    TThread.Synchronize(nil,procedure
    begin
     frmPrincipal.ProgressBarSync.Value :=vProgres;
     frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Categorias AWS');
    end);
    ReplicaCategoria('');
    TThread.Synchronize(nil,procedure
    begin
     frmPrincipal.ProgressBarSync.Value :=vProgres;
     frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Subgrupos AWS');
    end);
    ReplicaSubGrupo('');
    TThread.Synchronize(nil,procedure
    begin
     frmPrincipal.ProgressBarSync.Value :=vProgres;
     frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Grupos AWS');
    end);
    ReplicaGrupo('');
    TThread.Synchronize(nil,procedure
    begin
     frmPrincipal.ProgressBarSync.Value :=vProgres;
     frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Marcas AWS');
    end);
    ReplicaMarca('');
    TThread.Synchronize(nil,procedure
    begin
     frmPrincipal.ProgressBarSync.Value :=vProgres;
     frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Produtos AWS');
    end);
    ReplicaProduto('');
    TThread.Synchronize(nil,procedure
    begin
     frmPrincipal.ProgressBarSync.Value :=vProgres;
     frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Culturas AWS');
    end);
    ReplicaAuxCulturas('');
    TThread.Synchronize(nil,procedure
    begin
     frmPrincipal.ProgressBarSync.Value :=vProgres;
     frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Tipo Maquina AWS');
    end);
    ReplicaAuxtipomaquinaveiculos('');
    TThread.Synchronize(nil,procedure
    begin
     frmPrincipal.ProgressBarSync.Value :=vProgres;
     frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Tipo Ocorrencia AWS');
    end);
    ReplicaAuxtipoOcorrencia('');
    TThread.Synchronize(nil,procedure
    begin
     frmPrincipal.ProgressBarSync.Value :=vProgres;
     frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Tipo Serviço AWS');
    end);
    ReplicaTipoServico('');
    TThread.Synchronize(nil,procedure
    begin
     frmPrincipal.ProgressBarSync.Value :=vProgres;
     frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Serviço AWS');
    end);
    ReplicaServico('');
    TThread.Synchronize(nil,procedure
    begin
     frmPrincipal.ProgressBarSync.Value :=vProgres;
     frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Cobertura AWS');
    end);
    ReplicaCobertura('');
    TThread.Synchronize(nil,procedure
    begin
     frmPrincipal.ProgressBarSync.Value :=vProgres;
     frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Tipo Cultivare AWS');
    end);
    ReplicaAuxTipoCultivar('');
    TThread.Synchronize(nil,procedure
    begin
     frmPrincipal.ProgressBarSync.Value :=vProgres;
     frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Cultivare AWS');
    end);
    ReplicaCultivares('');
    TThread.Synchronize(nil,procedure
    begin
     frmPrincipal.ProgressBarSync.Value :=vProgres;
     frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Areas AWS');
    end);
    ReplicaAreas('');
    TThread.Synchronize(nil,procedure
    begin
     frmPrincipal.ProgressBarSync.Value :=vProgres;
     frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Setor AWS');
    end);
    ReplicaSetor('');
    TThread.Synchronize(nil,procedure
    begin
     frmPrincipal.ProgressBarSync.Value :=vProgres;
     frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Talhoes AWS');
    end);
    ReplicaTalhao('');
    TThread.Synchronize(nil,procedure
    begin
     frmPrincipal.ProgressBarSync.Value :=vProgres;
     frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Maquinas AWS');
    end);
    ReplicaMaquinaVeiculos('');
    TThread.Synchronize(nil,procedure
    begin
     frmPrincipal.ProgressBarSync.Value :=vProgres;
     frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Safra AWS');
    end);
    ReplicaSafra('');

    TThread.Synchronize(nil,procedure
    begin
     frmPrincipal.ProgressBarSync.Value :=frmPrincipal.ProgressBarSync.Value+vProgres;
     frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Receituario AWS');
    end);
    DataModule2.ReplicaReceituario;
    TThread.Synchronize(nil,procedure
    begin
     frmPrincipal.ProgressBarSync.Value :=frmPrincipal.ProgressBarSync.Value+vProgres;
     frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Det Receituario AWS');
    end);
    DataModule2.ReplicaDetReceituario;
    TThread.Synchronize(nil,procedure
    begin
     frmPrincipal.ProgressBarSync.Value :=frmPrincipal.ProgressBarSync.Value+vProgres;
     frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Det Receituario Talhoes AWS');
    end);
    DataModule2.ReplicaDetReceituarioTalhao;

      TThread.Synchronize(nil,procedure
      begin
       frmPrincipal.ProgressBarSync.Value :=vProgres;
       frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Fornecedor AWS');
      end);
      ReplicaFornecedor('');

      TThread.Synchronize(nil,procedure
      begin
       frmPrincipal.ProgressBarSync.Value :=vProgres;
       frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Pedido Compras AWS');
      end);
      ReplicaPedidoCompra('');
      TThread.Synchronize(nil,procedure
      begin
       frmPrincipal.ProgressBarSync.Value :=vProgres;
       frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Item Compras AWS');
      end);
      ReplicaPedidoItenCompra('');
      TThread.Synchronize(nil,procedure
      begin
       frmPrincipal.ProgressBarSync.Value :=vProgres;
       frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Pedido Status AWS');
      end);
      ReplicaPedidoStatus('');
      TThread.Synchronize(nil,procedure
      begin
       frmPrincipal.ProgressBarSync.Value :=vProgres;
       frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Orçamentos AWS');
      end);
      ReplicaOrcamento('');
      TThread.Synchronize(nil,procedure
      begin
       frmPrincipal.ProgressBarSync.Value :=vProgres;
       frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Orçamento Itens AWS');
      end);
      ReplicaOrcamentoItens('');

    TThread.Synchronize(nil,procedure
    begin
     frmPrincipal.ProgressBarSync.Value :=vProgres;
     frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Local Estoque AWS');
    end);
    ReplicaLocalEstoque('');
    TThread.Synchronize(nil,procedure
    begin
     frmPrincipal.ProgressBarSync.Value :=vProgres;
     frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Centro de Custo AWS');
    end);
    ReplicaCentroCusto('');
    TThread.Synchronize(nil,procedure
    begin
     frmPrincipal.ProgressBarSync.Value :=vProgres;
     frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Maquinas AWS');
    end);
    ReplicaOperadorMaquinas('');
    //DataModule2.Replica

    TThread.Synchronize(nil,procedure
    begin
     frmPrincipal.ProgressBarSync.Value :=frmPrincipal.ProgressBarSync.Value+vProgres;
     frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Entrada Estoque AWS');
    end);
    DataModule2.ReplicaPluviometro;

    TThread.Synchronize(nil,procedure
    begin
     frmPrincipal.ProgressBarSync.Value :=frmPrincipal.ProgressBarSync.Value+vProgres;
     frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Entrada Estoque AWS');
    end);
    DataModule2.ReplicaPluviometroTalhoes;

    TThread.Synchronize(nil,procedure
    begin
     frmPrincipal.ProgressBarSync.Value :=frmPrincipal.ProgressBarSync.Value+vProgres;
     frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Entrada Estoque AWS');
    end);
    DataModule2.ReplicaPluviometria;

    TThread.Synchronize(nil,procedure
    begin
     frmPrincipal.ProgressBarSync.Value :=frmPrincipal.ProgressBarSync.Value+vProgres;
     frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Entrada Estoque AWS');
    end);
    DataModule2.ReplicaAbastecimento;

    TThread.Synchronize(nil,procedure
    begin
     frmPrincipal.ProgressBarSync.Value :=frmPrincipal.ProgressBarSync.Value+vProgres;
     frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Entrada Estoque AWS');
    end);
    DataModule2.ReplicaAbastecimentoOutros;

    TThread.Synchronize(nil,procedure
    begin
     frmPrincipal.ProgressBarSync.Value :=frmPrincipal.ProgressBarSync.Value+vProgres;
     frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Entrada Estoque AWS');
    end);
    DataModule2.ReplicaEstoqueEntrada;

    TThread.Synchronize(nil,procedure
    begin
     frmPrincipal.ProgressBarSync.Value :=frmPrincipal.ProgressBarSync.Value+vProgres;
     frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Operação Talhao AWS');
    end);
    DataModule2.ReplicaOperacaoTalhao;
    TThread.Synchronize(nil,procedure
    begin
     frmPrincipal.ProgressBarSync.Value :=frmPrincipal.ProgressBarSync.Value+vProgres;
     frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Operação Maquinas AWS');
    end);
    DataModule2.ReplicaOperacaoMaquinaTalhao;
    TThread.Synchronize(nil,procedure
    begin
     frmPrincipal.ProgressBarSync.Value :=frmPrincipal.ProgressBarSync.Value+vProgres;
     frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Operação Produtos AWS');
    end);
    DataModule2.ReplicaOperacaoProdutosTalhao;
    TThread.Synchronize(nil,procedure
    begin
     frmPrincipal.ProgressBarSync.Value :=frmPrincipal.ProgressBarSync.Value+vProgres;
     frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Operação Ocorrência AWS');
    end);
    DataModule2.ReplicaOperacaoOcorrenciaTalhao;

    TThread.Synchronize(nil,procedure
    begin
     frmPrincipal.ProgressBarSync.Value :=frmPrincipal.ProgressBarSync.Value+vProgres;
     frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Operação Ocorrência AWS');
    end);
    DataModule2.ReplicaOperacaoVazaoTalhao;

    TThread.Synchronize(nil,procedure
    begin
     frmPrincipal.ProgressBarSync.Value :=frmPrincipal.ProgressBarSync.Value+vProgres;
     frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Pluviometros AWS');
    end);
    DataModule2.ReplicaPluviometro;

    TThread.Synchronize(nil,procedure
    begin
     frmPrincipal.ProgressBarSync.Value :=frmPrincipal.ProgressBarSync.Value+vProgres;
     frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Pluviometros Talhoes AWS');
    end);
    DataModule2.ReplicaPluviometroTalhoes;

    TThread.Synchronize(nil,procedure
    begin
     frmPrincipal.ProgressBarSync.Value :=frmPrincipal.ProgressBarSync.Value+vProgres;
     frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Pluviometria AWS');
    end);
    DataModule2.ReplicaPluviometria;

    TThread.Synchronize(nil,procedure
    begin
     frmPrincipal.ProgressBarSync.Value :=frmPrincipal.ProgressBarSync.Value+vProgres;
     frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Abastecimento AWS');
    end);
    DataModule2.ReplicaAbastecimento;

    TThread.Synchronize(nil,procedure
    begin
     frmPrincipal.ProgressBarSync.Value :=frmPrincipal.ProgressBarSync.Value+vProgres;
     frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Abastecimento AWS');
    end);
    DataModule2.ReplicaAbastecimentoOutros;

    //DataModule2.Replica
    TThread.Synchronize(nil,procedure
    begin
     frmPrincipal.ProgressBarSync.Value :=frmPrincipal.ProgressBarSync.Value+vProgres;
     frmPrincipal.laySync.visible       :=false;
     dbCtx.AtualizaSequencias;
    end);
  end).Start;
end;

procedure TDataModule1.ReplicaAreas(id: string);
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 TSyncAreas.Close;
 TSyncAreas.Open;
 if not TSyncAreas.IsEmpty then
 begin
   JsonToSend := TStringStream.Create(nil);
   TSyncAreas.SaveToStream(JsonToSend,sfJSON);
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/SyncAreas';
   IdHTTP1.Request.CustomHeaders.Clear;
   IdHTTP1.Request.ContentType := 'application/json';
   IdHTTP1.Request.Charset := 'UTF-8';
   IdHTTP1.Request.Clear;
   IdHTTP1.Request.BasicAuthentication := false;
   Sincronizando :=1;
   vReultHTTP  := IdHTTP1.Put(URL,JsonToSend);
   if copy(vReultHTTP,0,18)='{"result":[{"OK":"'then
   begin
     Sincronizando :=0;
     vReultHTTP := StringReplace(vReultHTTP,'{"result":[{"OK":"','',[rfReplaceAll]);
     vReultHTTP := StringReplace(vReultHTTP,'"}]}','',[rfReplaceAll]);
     AlteraFlaSynAWS('areas',vReultHTTP);
     TThread.Synchronize(nil,procedure
      begin
       Notificacao('Sincronização','Registro Sincronizado com Sucesso!');
      end);
   end;
 end;

end;

procedure TDataModule1.ReplicaAuxCulturas(id:string);
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 TSyncAuxCulturas.Close;
 TSyncAuxCulturas.Open;
 if not TSyncAuxCulturas.IsEmpty then
 begin
   JsonToSend := TStringStream.Create(nil);
   TSyncAuxCulturas.SaveToStream(JsonToSend,sfJSON);
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/SyncAuxCulturas';
   IdHTTP1.Request.CustomHeaders.Clear;
   IdHTTP1.Request.ContentType := 'application/json';
   IdHTTP1.Request.Charset := 'UTF-8';
   IdHTTP1.Request.Clear;
   IdHTTP1.Request.BasicAuthentication := false;
   Sincronizando :=1;
   vReultHTTP  := IdHTTP1.Put(URL,JsonToSend);
   if copy(vReultHTTP,0,18)='{"result":[{"OK":"'then
   begin
     Sincronizando :=0;
     vReultHTTP := StringReplace(vReultHTTP,'{"result":[{"OK":"','',[rfReplaceAll]);
     vReultHTTP := StringReplace(vReultHTTP,'"}]}','',[rfReplaceAll]);
     AlteraFlaSynAWS('AuxCulturas',vReultHTTP);
     TThread.Synchronize(nil,procedure
      begin
       Notificacao('Sincronização','Registro Sincronizado com Sucesso!');
      end);
   end;
 end;
end;

procedure TDataModule1.ReplicaAuxtipomaquinaveiculos(id:string);
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 TSyncAuxTipoMaqVeic.Close;
 TSyncAuxTipoMaqVeic.Open;
 if not TSyncAuxTipoMaqVeic.IsEmpty then
 begin
   JsonToSend := TStringStream.Create(nil);
   TSyncAuxTipoMaqVeic.SaveToStream(JsonToSend,sfJSON);
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/SyncAuxTipoMaquinaVeiculos';
   IdHTTP1.Request.CustomHeaders.Clear;
   IdHTTP1.Request.ContentType := 'application/json';
   IdHTTP1.Request.Charset := 'UTF-8';
   IdHTTP1.Request.Clear;
   IdHTTP1.Request.BasicAuthentication := false;
   Sincronizando :=1;
   vReultHTTP  := IdHTTP1.Put(URL,JsonToSend);
   if copy(vReultHTTP,0,18)='{"result":[{"OK":"'then
   begin
     Sincronizando :=0;
     vReultHTTP := StringReplace(vReultHTTP,'{"result":[{"OK":"','',[rfReplaceAll]);
     vReultHTTP := StringReplace(vReultHTTP,'"}]}','',[rfReplaceAll]);
     AlteraFlaSynAWS('auxtipomaquinaveiculos',vReultHTTP);
     TThread.Synchronize(nil,procedure
      begin
       Notificacao('Sincronização','Registro Sincronizado com Sucesso!');
      end);
   end;
 end;
end;

procedure TDataModule1.ReplicaAuxtipoOcorrencia(id:string);
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 TSyncAuxTipoOcorrencia.Close;
 TSyncAuxTipoOcorrencia.Open;
 if not TSyncAuxTipoOcorrencia.IsEmpty then
 begin
   JsonToSend := TStringStream.Create(nil);
   TSyncAuxTipoOcorrencia.SaveToStream(JsonToSend,sfJSON);
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/SyncAuxTipoOcorrencia';
   IdHTTP1.Request.CustomHeaders.Clear;
   IdHTTP1.Request.ContentType := 'application/json';
   IdHTTP1.Request.Charset := 'UTF-8';
   IdHTTP1.Request.Clear;
   IdHTTP1.Request.BasicAuthentication := false;
   Sincronizando :=1;
   vReultHTTP  := IdHTTP1.Put(URL,JsonToSend);
   if copy(vReultHTTP,0,18)='{"result":[{"OK":"'then
   begin
     vReultHTTP := StringReplace(vReultHTTP,'{"result":[{"OK":"','',[rfReplaceAll]);
     vReultHTTP := StringReplace(vReultHTTP,'"}]}','',[rfReplaceAll]);
     AlteraFlaSynAWS('auxtipoocorrencia',vReultHTTP);
     TThread.Synchronize(nil,procedure
      begin
       Sincronizando :=0;
       Notificacao('Sincronização','Registro Sincronizado com Sucesso!');
      end);
   end;
 end;
end;

procedure TDataModule1.ReplicaSafra(id: string);
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 TThread.Synchronize(nil,procedure
 begin
  TSyncSafra.Close;
  TSyncSafra.Open;
 end);
 if not TSyncSafra.IsEmpty then
 begin
   Sincronizando :=1;
   JsonToSend := TStringStream.Create(nil);
   TSyncSafra.SaveToStream(JsonToSend,sfJSON);
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/SyncSafra';
   IdHTTP1.Request.CustomHeaders.Clear;
   IdHTTP1.Request.ContentType := 'application/json';
   IdHTTP1.Request.Charset := 'UTF-8';
   IdHTTP1.Request.Clear;
   IdHTTP1.Request.BasicAuthentication := false;
   vReultHTTP  := IdHTTP1.Put(URL,JsonToSend);
   if copy(vReultHTTP,0,18)='{"result":[{"OK":"'then
   begin
     vReultHTTP := StringReplace(vReultHTTP,'{"result":[{"OK":"','',[rfReplaceAll]);
     vReultHTTP := StringReplace(vReultHTTP,'"}]}','',[rfReplaceAll]);
     TThread.Synchronize(nil,procedure
     begin
      Sincronizando :=0;
      Notificacao('Sincronização','Registro Sincronizado com Sucesso!');
     end);
     AlteraFlaSynAWS('safra',vReultHTTP);
   end;
 end;
end;

procedure TDataModule1.ReplicaOperacaoMaquinaTalhao(id: string);
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 TSyncMaquinasOperacao.Close;
 TSyncMaquinasOperacao.Open;
 if not TSyncMaquinasOperacao.IsEmpty then
 begin
   JsonToSend := TStringStream.Create(nil);
   TSyncMaquinasOperacao.SaveToStream(JsonToSend,sfJSON);
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/SyncOperacaoMaquinaTalhao';
   IdHTTP1.Request.CustomHeaders.Clear;
   IdHTTP1.Request.ContentType := 'application/json';
   IdHTTP1.Request.Charset := 'UTF-8';
   IdHTTP1.Request.Clear;
   IdHTTP1.Request.BasicAuthentication := false;
   Sincronizando :=1;
   vReultHTTP  := IdHTTP1.Put(URL,JsonToSend);
   if copy(vReultHTTP,0,18)='{"result":[{"OK":"'then
   begin
     vReultHTTP := StringReplace(vReultHTTP,'{"result":[{"OK":"','',[rfReplaceAll]);
     vReultHTTP := StringReplace(vReultHTTP,'"}]}','',[rfReplaceAll]);
     AlteraFlaSynAWS('detoperacaosafratalhaomaquinasoperadores',vReultHTTP);
     TThread.Synchronize(nil,procedure
      begin
       Sincronizando :=0;
       Notificacao('Sincronização','Registro Sincronizado com Sucesso!');
      end);
   end;
 end;
end;


procedure TDataModule1.ReplicaOperacaoOcorrenciaTalhao(id: string);
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 TSyncOcorrenciaOperacao.Close;
 TSyncOcorrenciaOperacao.Open;
 if not TSyncOcorrenciaOperacao.IsEmpty then
 begin
   JsonToSend := TStringStream.Create(nil);
   TSyncOcorrenciaOperacao.SaveToStream(JsonToSend,sfJSON);
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/SyncOperacaoOcorrenciaTalhao';
   IdHTTP1.Request.CustomHeaders.Clear;
   IdHTTP1.Request.ContentType := 'application/json';
   IdHTTP1.Request.Charset := 'UTF-8';
   IdHTTP1.Request.Clear;
   IdHTTP1.Request.BasicAuthentication := false;
   Sincronizando :=1;
   vReultHTTP  := IdHTTP1.Put(URL,JsonToSend);
   if copy(vReultHTTP,0,18)='{"result":[{"OK":"'then
   begin
     vReultHTTP := StringReplace(vReultHTTP,'{"result":[{"OK":"','',[rfReplaceAll]);
     vReultHTTP := StringReplace(vReultHTTP,'"}]}','',[rfReplaceAll]);
     AlteraFlaSynAWS('DetOperacaoSafraTalhaoOcorrencia',vReultHTTP);
     TThread.Synchronize(nil,procedure
      begin
       Sincronizando :=0;
       Notificacao('Sincronização','Registro Sincronizado com Sucesso!');
      end);
   end;
 end;
end;

procedure TDataModule1.ReplicaOperacaoProdutosTalhao(id: string);
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 TSyncProdutosOperacao.Close;
 TSyncProdutosOperacao.Open;
 if not TSyncProdutosOperacao.IsEmpty then
 begin
   JsonToSend := TStringStream.Create(nil);
   TSyncProdutosOperacao.SaveToStream(JsonToSend,sfJSON);
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/SyncOperacaoProdutosTalhao';
   IdHTTP1.Request.CustomHeaders.Clear;
   IdHTTP1.Request.ContentType := 'application/json';
   IdHTTP1.Request.Charset := 'UTF-8';
   IdHTTP1.Request.Clear;
   IdHTTP1.Request.BasicAuthentication := false;
   Sincronizando :=1;
   vReultHTTP  := IdHTTP1.Put(URL,JsonToSend);
   if copy(vReultHTTP,0,18)='{"result":[{"OK":"'then
   begin
     vReultHTTP := StringReplace(vReultHTTP,'{"result":[{"OK":"','',[rfReplaceAll]);
     vReultHTTP := StringReplace(vReultHTTP,'"}]}','',[rfReplaceAll]);
     AlteraFlaSynAWS('DetOperacaoSafraTalhaoProdutos',vReultHTTP);
     TThread.Synchronize(nil,procedure
      begin
       Sincronizando :=0;
       Notificacao('Sincronização','Registro Sincronizado com Sucesso!');
      end);
   end;
 end;
end;

procedure TDataModule1.ReplicaOperacaoTalhao(id: string);
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 TSyncOperacaoSafraTalhao.Close;
 TSyncOperacaoSafraTalhao.Open;
 if not TSyncOperacaoSafraTalhao.IsEmpty then
 begin
   JsonToSend := TStringStream.Create(nil);
   TSyncOperacaoSafraTalhao.SaveToStream(JsonToSend,sfJSON);
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/SyncOperacaoTalhao';
   IdHTTP1.Request.CustomHeaders.Clear;
   IdHTTP1.Request.ContentType := 'application/json';
   IdHTTP1.Request.Charset := 'UTF-8';
   IdHTTP1.Request.Clear;
   IdHTTP1.Request.BasicAuthentication := false;
   Sincronizando :=1;
   vReultHTTP  := IdHTTP1.Put(URL,JsonToSend);
   if copy(vReultHTTP,0,18)='{"result":[{"OK":"'then
   begin
     vReultHTTP := StringReplace(vReultHTTP,'{"result":[{"OK":"','',[rfReplaceAll]);
     vReultHTTP := StringReplace(vReultHTTP,'"}]}','',[rfReplaceAll]);
     AlteraFlaSynAWS('operacaosafratalhao',vReultHTTP);
     TThread.Synchronize(nil,procedure
      begin
       Sincronizando :=0;
       Notificacao('Sincronização','Registro Sincronizado com Sucesso!');
      end);
   end;
 end;
end;

procedure TDataModule1.ReplicaOperacaoVazaoTalhao(id: string);
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 TSyncVazaoOperacao.Close;
 TSyncVazaoOperacao.Open;
 if not TSyncVazaoOperacao.IsEmpty then
 begin
   JsonToSend := TStringStream.Create(nil);
   TSyncVazaoOperacao.SaveToStream(JsonToSend,sfJSON);
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/SyncOperacaoVazaoTalhao';
   IdHTTP1.Request.CustomHeaders.Clear;
   IdHTTP1.Request.ContentType := 'application/json';
   IdHTTP1.Request.Charset := 'UTF-8';
   IdHTTP1.Request.Clear;
   IdHTTP1.Request.BasicAuthentication := false;
   Sincronizando :=1;
   vReultHTTP  := IdHTTP1.Put(URL,JsonToSend);
   if copy(vReultHTTP,0,18)='{"result":[{"OK":"'then
   begin
     vReultHTTP := StringReplace(vReultHTTP,'{"result":[{"OK":"','',[rfReplaceAll]);
     vReultHTTP := StringReplace(vReultHTTP,'"}]}','',[rfReplaceAll]);
     AlteraFlaSynAWS('DetVazaoOperacao',vReultHTTP);
     TThread.Synchronize(nil,procedure
      begin
       Sincronizando :=0;
       Notificacao('Sincronização','Registro Sincronizado com Sucesso!');
      end);
   end;
 end;
end;
procedure TDataModule1.ReplicaOrcamento(id: string);
var
 URL,vReultHTTP,vReultHTTPC:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 TOrcamento.Close;
 TOrcamento.Open;
 if not TOrcamento.IsEmpty then
 begin
   JsonToSend := TStringStream.Create(nil);
   TOrcamento.SaveToStream(JsonToSend,sfJSON);
   Url := 'http://54.198.102.100:8091/SyncOrcamento';
   IdHTTP1.Request.Accept      := 'application/json';
   IdHTTP1.Request.ContentType := 'application/json';
   Sincronizando :=1;
   vReultHTTP  := IdHTTP1.Post(URL,JsonToSend);
   vReultHTTPC  := copy(vReultHTTP,0,4);
   if vReultHTTPC='{"OK' then
   begin
     vReultHTTP      := StringReplace(vReultHTTP,'{"OK":"','',[rfReplaceAll]);
     vReultHTTP      := StringReplace(vReultHTTP,'"}','',[rfReplaceAll]);
     AlteraFlaSynAWS('orcamentos',vReultHTTP);
     TThread.Synchronize(nil,procedure
      begin
       Sincronizando :=0;
      end);
   end;
 end;
end;

procedure TDataModule1.ReplicaOrcamentoItens(id: string);
var
 URL,vReultHTTP,vReultHTTPC:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 TItensOrcamento.Close;
 TItensOrcamento.Open;
 if not TItensOrcamento.IsEmpty then
 begin
   JsonToSend := TStringStream.Create(nil);
   TItensOrcamento.SaveToStream(JsonToSend,sfJSON);
   Url := 'http://54.198.102.100:8091/SyncOrcamentoItens';
   IdHTTP1.Request.Accept      := 'application/json';
   IdHTTP1.Request.ContentType := 'application/json';
   Sincronizando :=1;
   vReultHTTP  := IdHTTP1.Post(URL,JsonToSend);
   vReultHTTPC  := copy(vReultHTTP,0,4);
   if vReultHTTPC='{"OK' then
   begin
     vReultHTTP      := StringReplace(vReultHTTP,'{"OK":"','',[rfReplaceAll]);
     vReultHTTP := StringReplace(vReultHTTP,'"}','',[rfReplaceAll]);
     AlteraFlaSynAWS('orcamentosItens',vReultHTTP);
     TThread.Synchronize(nil,procedure
     begin
      Sincronizando :=0;
//      Notificacao('Sincronização','Registro Sincronizado com Sucesso!');
     end);
   end;
 end;
end;

procedure TDataModule1.ReplicaServico(id:string);
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 TSyncServico.Close;
 TSyncServico.Open;
 if not TSyncServico.IsEmpty then
 begin
   JsonToSend := TStringStream.Create(nil);
   TSyncServico.SaveToStream(JsonToSend,sfJSON);
   Url := 'http://'+srvDtSanap+'/SyncServico';
   IdHTTP1.Request.Accept      := 'application/json';
   IdHTTP1.Request.ContentType := 'application/json';
   Sincronizando :=1;
   vReultHTTP  := IdHTTP1.Post(URL,JsonToSend);
   if copy(vReultHTTP,0,4)='{"OK'then
   begin
     vReultHTTP := StringReplace(vReultHTTP,'{"OK":"','',[rfReplaceAll]);
     vReultHTTP := StringReplace(vReultHTTP,'"}','',[rfReplaceAll]);
     AlteraFlaSynAWS('servico',vReultHTTP);
     TThread.Synchronize(nil,procedure
      begin
       Sincronizando :=0;
       Notificacao('Sincronização','Registro Sincronizado com Sucesso!');
      end);
   end;
 end;
end;



procedure TDataModule1.ReplicaSetor(id: string);
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 TSyncSetores.Close;
 TSyncSetores.Open;
 if not TSyncSetores.IsEmpty then
 begin
   JsonToSend := TStringStream.Create(nil);
   TSyncSetores.SaveToStream(JsonToSend,sfJSON);
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/SyncSetor';
   IdHTTP1.Request.CustomHeaders.Clear;
   IdHTTP1.Request.ContentType := 'application/json';
   IdHTTP1.Request.Charset := 'UTF-8';
   IdHTTP1.Request.Clear;
   IdHTTP1.Request.BasicAuthentication := false;
   Sincronizando :=1;
   vReultHTTP  := IdHTTP1.Put(URL,JsonToSend);
   if copy(vReultHTTP,0,18)='{"result":[{"OK":"'then
   begin
     vReultHTTP := StringReplace(vReultHTTP,'{"result":[{"OK":"','',[rfReplaceAll]);
     vReultHTTP := StringReplace(vReultHTTP,'"}]}','',[rfReplaceAll]);
     AlteraFlaSynAWS('setor',vReultHTTP);
     TThread.Synchronize(nil,procedure
      begin
       Sincronizando :=0;
       Notificacao('Sincronização','Registro Sincronizado com Sucesso!');
      end);
   end;
 end;
end;

procedure TDataModule1.ReplicaLocalEstoque(id:string);
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 TSyncLocalEstoque.Close;
 TSyncLocalEstoque.Open;
 if not TSyncLocalEstoque.IsEmpty then
 begin
   JsonToSend := TStringStream.Create(nil);
   TSyncLocalEstoque.SaveToStream(JsonToSend,sfJSON);
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/SyncLocalEstoque';
   IdHTTP1.Request.CustomHeaders.Clear;
   IdHTTP1.Request.ContentType := 'application/json';
   IdHTTP1.Request.Charset := 'UTF-8';
   IdHTTP1.Request.Clear;
   IdHTTP1.Request.BasicAuthentication := false;
   Sincronizando :=1;
   vReultHTTP  := IdHTTP1.Put(URL,JsonToSend);
   if copy(vReultHTTP,0,18)='{"result":[{"OK":"'then
   begin
     Sincronizando :=0;
     vReultHTTP := StringReplace(vReultHTTP,'{"result":[{"OK":"','',[rfReplaceAll]);
     vReultHTTP := StringReplace(vReultHTTP,'"}]}','',[rfReplaceAll]);
     AlteraFlaSynAWS('localestoque',vReultHTTP);
     TThread.Synchronize(nil,procedure
      begin
       Notificacao('Sincronização','Registro Sincronizado com Sucesso!');
      end);
   end;
 end;
end;

procedure TDataModule1.ReplicaCentroCusto(id:string);
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 TSyncCentroCusto.Close;
 TSyncCentroCusto.Open;
 if not TSyncCentroCusto.IsEmpty then
 begin
   JsonToSend := TStringStream.Create(nil);
   TSyncCentroCusto.SaveToStream(JsonToSend,sfJSON);
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/SyncCentroCusto';
   IdHTTP1.Request.CustomHeaders.Clear;
   IdHTTP1.Request.ContentType := 'application/json';
   IdHTTP1.Request.Charset := 'UTF-8';
   IdHTTP1.Request.Clear;
   IdHTTP1.Request.BasicAuthentication := false;
   Sincronizando :=1;
   vReultHTTP  := IdHTTP1.Put(URL,JsonToSend);
   if copy(vReultHTTP,0,18)='{"result":[{"OK":"'then
   begin
     Sincronizando :=0;
     vReultHTTP := StringReplace(vReultHTTP,'{"result":[{"OK":"','',[rfReplaceAll]);
     vReultHTTP := StringReplace(vReultHTTP,'"}]}','',[rfReplaceAll]);
     AlteraFlaSynAWS('centroCusto',vReultHTTP);
     TThread.Synchronize(nil,procedure
      begin
       Notificacao('Sincronização','Registro Sincronizado com Sucesso!');
      end);
   end;
 end;
end;

procedure TDataModule1.TAuxCategoriasAWSReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
  showmessage(e.Message);
end;

procedure TDataModule1.TAuxGrupoAWSReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
  showmessage(e.Message);
end;

end.
