unit DataContext;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Phys.PGDef, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.PG, FireDAC.FMXUI.Wait, Data.DB, FireDAC.Comp.Client,
  IdHashMessageDigest, FireDAC.Comp.UI, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,FMX.Dialogs,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,System.JSON,
  System.JSON.Writers,System.JSON.Types,System.IniFiles,
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Script;

type
  TdbCtx = class(TDataModule)
    vQry: TFDQuery;
    TUsuario: TFDQuery;
    TProdutos: TFDQuery;
    TFornecedores: TFDQuery;
    TFornecedoresid: TIntegerField;
    TFornecedoresstatus: TIntegerField;
    TFornecedoresdatareg: TSQLTimeStampField;
    TFornecedoresidusuario: TIntegerField;
    TFornecedoresdataalteracao: TSQLTimeStampField;
    TFornecedoresidusuarioalteracao: TIntegerField;
    TFornecedoresnome: TWideStringField;
    TFornecedorescidade: TWideStringField;
    TFornecedoresuf: TWideStringField;
    TFornecedorescpf_cnpj: TWideStringField;
    TFornecedorestelefone_fixo: TWideStringField;
    TFornecedorescelular: TWideStringField;
    TFornecedoresemail: TWideStringField;
    TFornecedorescontatopessoa: TWideStringField;
    TAuxMarca: TFDQuery;
    TAuxMarcaid: TIntegerField;
    TAuxMarcastatus: TIntegerField;
    TAuxMarcadatareg: TSQLTimeStampField;
    TAuxMarcaidusuario: TIntegerField;
    TAuxMarcadataalteracao: TSQLTimeStampField;
    TAuxMarcaidusuarioalteracao: TIntegerField;
    TAuxMarcanome: TWideStringField;
    TAuxMarcaidsegmento: TIntegerField;
    TAuxTipoMaqVeic: TFDQuery;
    TAuxTipoMaqVeicid: TIntegerField;
    TAuxTipoMaqVeicstatus: TIntegerField;
    TAuxTipoMaqVeicdatareg: TSQLTimeStampField;
    TAuxTipoMaqVeicidusuario: TIntegerField;
    TAuxTipoMaqVeicdataalteracao: TSQLTimeStampField;
    TAuxTipoMaqVeicidusuarioalteracao: TIntegerField;
    TAuxTipoMaqVeicnome: TWideStringField;
    TAuxTipoMaqVeicidsegmento: TIntegerField;
    TMaquinas: TFDQuery;
    TMaquinasid: TIntegerField;
    TMaquinasstatus: TIntegerField;
    TMaquinasdatareg: TSQLTimeStampField;
    TMaquinasidusuario: TIntegerField;
    TMaquinasdataalteracao: TSQLTimeStampField;
    TMaquinasidusuarioalteracao: TIntegerField;
    TMaquinasidtipo: TIntegerField;
    TMaquinasidmarca: TIntegerField;
    TMaquinasmodelo: TWideStringField;
    TMaquinasplaca: TWideStringField;
    TMaquinasano: TIntegerField;
    TMaquinaschassi: TWideStringField;
    TMaquinascombustivel: TIntegerField;
    TMaquinasvalor: TBCDField;
    TMaquinasnumeroserie: TWideStringField;
    TMaquinasimg: TBlobField;
    TMaquinastipo: TWideStringField;
    TMaquinasmarca: TWideStringField;
    TMaquinascombustivelstr: TWideMemoField;
    TUsuarioid: TIntegerField;
    TUsuariostatus: TIntegerField;
    TUsuariodatareg: TSQLTimeStampField;
    TUsuarioidusuario: TIntegerField;
    TUsuariodataalteracao: TSQLTimeStampField;
    TUsuarioidusuarioalteracao: TIntegerField;
    TUsuarionome: TWideStringField;
    TUsuariousuario: TWideStringField;
    TUsuariosenha: TWideStringField;
    TUsuariotipo: TIntegerField;
    TUsuarioidsupervisor: TIntegerField;
    TUsuariotipostr: TWideMemoField;
    TMaquinasprefixo: TWideStringField;
    TAuxCulturas: TFDQuery;
    TAuxCultivares: TFDQuery;
    TAuxCulturasid: TIntegerField;
    TAuxCulturasstatus: TIntegerField;
    TAuxCulturasdatareg: TSQLTimeStampField;
    TAuxCulturasidusuario: TIntegerField;
    TAuxCulturasdataalteracao: TSQLTimeStampField;
    TAuxCulturasidusuarioalteracao: TIntegerField;
    TAuxCulturasnome: TWideStringField;
    TAuxCultivaresid: TIntegerField;
    TAuxCultivaresstatus: TIntegerField;
    TAuxCultivaresdatareg: TSQLTimeStampField;
    TAuxCultivaresidusuario: TIntegerField;
    TAuxCultivaresdataalteracao: TSQLTimeStampField;
    TAuxCultivaresidusuarioalteracao: TIntegerField;
    TAuxCultivaresnome: TWideStringField;
    TAreas: TFDQuery;
    TSetores: TFDQuery;
    TTalhoes: TFDQuery;
    TTalhoesid: TIntegerField;
    TTalhoesstatus: TIntegerField;
    TTalhoesdatareg: TSQLTimeStampField;
    TTalhoesidusuario: TIntegerField;
    TTalhoesdataalteracao: TSQLTimeStampField;
    TTalhoesidusuarioalteracao: TIntegerField;
    TTalhoesnome: TWideStringField;
    TTalhoesareahe: TBCDField;
    TTalhoesidsetor: TIntegerField;
    TTalhoesqrcode: TWideStringField;
    TTalhoestipo: TIntegerField;
    TTalhoesobservacao: TWideStringField;
    TTalhoessetor: TWideStringField;
    TSetoresid: TIntegerField;
    TSetoresstatus: TIntegerField;
    TSetoresdatareg: TSQLTimeStampField;
    TSetoresidusuario: TIntegerField;
    TSetoresdataalteracao: TSQLTimeStampField;
    TSetoresidusuarioalteracao: TIntegerField;
    TSetoresnome: TWideStringField;
    TSetoresareahe: TBCDField;
    TSetoresidarea: TIntegerField;
    TSetoresareanome: TWideStringField;
    TAreasid: TIntegerField;
    TAreasstatus: TIntegerField;
    TAreasdatareg: TSQLTimeStampField;
    TAreasidusuario: TIntegerField;
    TAreasdataalteracao: TSQLTimeStampField;
    TAreasidusuarioalteracao: TIntegerField;
    TAreasnome: TWideStringField;
    TAreasareahe: TBCDField;
    TAreasidresponsavel: TIntegerField;
    TAreasresponsavel: TWideStringField;
    TSafra: TFDQuery;
    TSafraid: TIntegerField;
    TSafrastatus: TIntegerField;
    TSafradatareg: TSQLTimeStampField;
    TSafraidusuario: TIntegerField;
    TSafradataalteracao: TSQLTimeStampField;
    TSafraidusuarioalteracao: TIntegerField;
    TSafranome: TWideStringField;
    TSafradatainicio: TDateField;
    TSafradatafim: TDateField;
    TSafrastatusnome: TWideMemoField;
    TSafraobservacao: TWideStringField;
    TAuxOperacao: TFDQuery;
    TAuxOperacaoid: TIntegerField;
    TAuxOperacaostatus: TIntegerField;
    TAuxOperacaodatareg: TSQLTimeStampField;
    TAuxOperacaoidusuario: TIntegerField;
    TAuxOperacaodataalteracao: TSQLTimeStampField;
    TAuxOperacaoidusuarioalteracao: TIntegerField;
    TAuxOperacaonome: TWideStringField;
    TProdutosid: TIntegerField;
    TProdutosstatus: TIntegerField;
    TProdutosdatareg: TSQLTimeStampField;
    TProdutosidusuario: TIntegerField;
    TProdutosdataalteracao: TSQLTimeStampField;
    TProdutosidusuarioalteracao: TIntegerField;
    TProdutosnome: TWideStringField;
    TProdutostipo: TWideStringField;
    TProdutosunidademedida: TWideStringField;
    TProdutosestoqueminimo: TBCDField;
    TProdutosobservacao: TWideStringField;
    TAuxTipoOcorrencia: TFDQuery;
    TAuxTipoOcorrenciaid: TIntegerField;
    TAuxTipoOcorrenciastatus: TIntegerField;
    TAuxTipoOcorrenciadatareg: TSQLTimeStampField;
    TAuxTipoOcorrenciaidusuario: TIntegerField;
    TAuxTipoOcorrenciadataalteracao: TSQLTimeStampField;
    TAuxTipoOcorrenciaidusuarioalteracao: TIntegerField;
    TAuxTipoOcorrencianome: TWideStringField;
    TOperacaoSafraTalhao: TFDQuery;
    TOperacaoSafraTalhaoid: TIntegerField;
    TOperacaoSafraTalhaostatus: TIntegerField;
    TOperacaoSafraTalhaodatareg: TSQLTimeStampField;
    TOperacaoSafraTalhaoidusuario: TIntegerField;
    TOperacaoSafraTalhaodataalteracao: TSQLTimeStampField;
    TOperacaoSafraTalhaoidusuarioalteracao: TIntegerField;
    TOperacaoSafraTalhaoidsafra: TIntegerField;
    TOperacaoSafraTalhaoidoperacao: TIntegerField;
    TOperacaoSafraTalhaodatainicio: TDateField;
    TOperacaoSafraTalhaodatafim: TDateField;
    TOperacaoSafraTalhaooperacao: TWideStringField;
    TOcorrenciaOperacao: TFDQuery;
    TOcorrenciaOperacaoid: TIntegerField;
    TOcorrenciaOperacaostatus: TIntegerField;
    TOcorrenciaOperacaodatareg: TSQLTimeStampField;
    TOcorrenciaOperacaoidusuario: TIntegerField;
    TOcorrenciaOperacaodataalteracao: TSQLTimeStampField;
    TOcorrenciaOperacaoidusuarioalteracao: TIntegerField;
    TOcorrenciaOperacaoidoperacaotalhao: TIntegerField;
    TOcorrenciaOperacaodataocorrencia: TDateField;
    TOcorrenciaOperacaoidtipoocorrencia: TIntegerField;
    TOcorrenciaOperacaohora: TTimeField;
    TOcorrenciaOperacaodescricao: TWideStringField;
    TOcorrenciaOperacaotipoocorrencia: TWideStringField;
    TMaquinasOperacao: TFDQuery;
    TMaquinasOperacaoid: TIntegerField;
    TMaquinasOperacaostatus: TIntegerField;
    TMaquinasOperacaodatareg: TSQLTimeStampField;
    TMaquinasOperacaoidusuario: TIntegerField;
    TMaquinasOperacaodataalteracao: TSQLTimeStampField;
    TMaquinasOperacaoidusuarioalteracao: TIntegerField;
    TMaquinasOperacaoidoperacaotalhao: TIntegerField;
    TMaquinasOperacaoidmaquina: TIntegerField;
    TMaquinasOperacaooperador: TWideStringField;
    TMaquinasOperacaoobservacao: TWideStringField;
    TMaquinasOperacaomaquina: TWideMemoField;
    TProdutosOperacao: TFDQuery;
    TProdutosOperacaoid: TIntegerField;
    TProdutosOperacaostatus: TIntegerField;
    TProdutosOperacaodatareg: TSQLTimeStampField;
    TProdutosOperacaoidusuario: TIntegerField;
    TProdutosOperacaodataalteracao: TSQLTimeStampField;
    TProdutosOperacaoidusuarioalteracao: TIntegerField;
    TProdutosOperacaoidoperacaotalhao: TIntegerField;
    TProdutosOperacaoidproduto: TIntegerField;
    TProdutosOperacaoobservacao: TWideStringField;
    TProdutosOperacaoproduto: TWideStringField;
    TOperacaoSafraTalhaoobservacao: TWideStringField;
    TOperacaoSafraTalhaoidtalhao: TIntegerField;
    TOperacaoSafraTalhaoidresponsavel: TIntegerField;
    QryOperacaoSafraTalhao: TFDQuery;
    QryOperacaoSafraTalhaoid: TIntegerField;
    QryOperacaoSafraTalhaostatus: TIntegerField;
    QryOperacaoSafraTalhaodatareg: TSQLTimeStampField;
    QryOperacaoSafraTalhaoidusuario: TIntegerField;
    QryOperacaoSafraTalhaodataalteracao: TSQLTimeStampField;
    QryOperacaoSafraTalhaoidusuarioalteracao: TIntegerField;
    QryOperacaoSafraTalhaoidsafra: TIntegerField;
    QryOperacaoSafraTalhaoidoperacao: TIntegerField;
    QryOperacaoSafraTalhaodatainicio: TDateField;
    QryOperacaoSafraTalhaodatafim: TDateField;
    QryOperacaoSafraTalhaoobservacao: TWideStringField;
    QryOperacaoSafraTalhaoidtalhao: TIntegerField;
    QryOperacaoSafraTalhaoidresponsavel: TIntegerField;
    QryOperacaoSafraTalhaooperacao: TWideStringField;
    QryOperacaoSafraTalhaoresponsavel: TWideStringField;
    QryMaquinaOperacao: TFDQuery;
    qryProdutosOperacao: TFDQuery;
    qryProdutosOperacaoid: TIntegerField;
    qryProdutosOperacaostatus: TIntegerField;
    qryProdutosOperacaodatareg: TSQLTimeStampField;
    qryProdutosOperacaoidusuario: TIntegerField;
    qryProdutosOperacaodataalteracao: TSQLTimeStampField;
    qryProdutosOperacaoidusuarioalteracao: TIntegerField;
    qryProdutosOperacaoidoperacaotalhao: TIntegerField;
    qryProdutosOperacaoidproduto: TIntegerField;
    qryProdutosOperacaoobservacao: TWideStringField;
    qryProdutosOperacaoproduto: TWideStringField;
    qryOcorrenciaOperacao: TFDQuery;
    qryOcorrenciaOperacaoid: TIntegerField;
    qryOcorrenciaOperacaostatus: TIntegerField;
    qryOcorrenciaOperacaodatareg: TSQLTimeStampField;
    qryOcorrenciaOperacaoidusuario: TIntegerField;
    qryOcorrenciaOperacaodataalteracao: TSQLTimeStampField;
    qryOcorrenciaOperacaoidusuarioalteracao: TIntegerField;
    qryOcorrenciaOperacaoidoperacaotalhao: TIntegerField;
    qryOcorrenciaOperacaodataocorrencia: TDateField;
    qryOcorrenciaOperacaoidtipoocorrencia: TIntegerField;
    qryOcorrenciaOperacaohora: TTimeField;
    qryOcorrenciaOperacaodescricao: TWideStringField;
    qryOcorrenciaOperacaotipoocorrencia: TWideStringField;
    TOperacaoSafraTalhaoarearealizada: TBCDField;
    TOcorrenciaOperacaodata: TDateField;
    TMaquinasOperacaodata: TDateField;
    TProdutosOperacaodata: TDateField;
    QryOperacaoSafraTalhaoarearealizada: TBCDField;
    qryProdutosOperacaodata: TDateField;
    qryOcorrenciaOperacaodata: TDateField;
    TOperacaoSafraTalhaoareaprevista: TBCDField;
    QryOperacaoSafraTalhaoareaprevista: TBCDField;
    TProdutoscodigobarras: TWideStringField;
    TAuxTipoOperacaoSolido: TFDQuery;
    TAuxTipoOperacaoSolidoid: TIntegerField;
    TAuxTipoOperacaoSolidostatus: TIntegerField;
    TAuxTipoOperacaoSolidodatareg: TSQLTimeStampField;
    TAuxTipoOperacaoSolidoidusuario: TIntegerField;
    TAuxTipoOperacaoSolidodataalteracao: TSQLTimeStampField;
    TAuxTipoOperacaoSolidoidusuarioalteracao: TIntegerField;
    TAuxTipoOperacaoSolidonome: TWideStringField;
    TOperacaoSafraTalhaotipoterraaereo: TWideStringField;
    TOperacaoSafraTalhaoidtipoaplicacaosolido: TIntegerField;
    TOperacaoSafraTalhaoidcultura: TIntegerField;
    TOperacaoSafraTalhaoidvariedade: TIntegerField;
    TOperacaoSafraTalhaofinalidade: TWideStringField;
    TReceituario: TFDQuery;
    TDetReceituario: TFDQuery;
    TReceituarioid: TIntegerField;
    TReceituariostatus: TIntegerField;
    TReceituariodatareg: TSQLTimeStampField;
    TReceituarioidusuario: TIntegerField;
    TReceituariodataalteracao: TSQLTimeStampField;
    TReceituarioidusuarioalteracao: TIntegerField;
    TReceituarionome: TWideStringField;
    TReceituarioidresponsavel: TIntegerField;
    TReceituarioresponsavel: TWideStringField;
    TOperacaoSafraTalhaoidreceituario: TIntegerField;
    QryOperacaoSafraTalhaotipoterraaereo: TWideStringField;
    QryOperacaoSafraTalhaoidtipoaplicacaosolido: TIntegerField;
    QryOperacaoSafraTalhaoidcultura: TIntegerField;
    QryOperacaoSafraTalhaoidvariedade: TIntegerField;
    QryOperacaoSafraTalhaofinalidade: TWideStringField;
    QryOperacaoSafraTalhaoidreceituario: TIntegerField;
    QryOperacaoSafraTalhaocultura: TWideStringField;
    QryOperacaoSafraTalhaoreceituario: TWideStringField;
    TAuxGrupo: TFDQuery;
    TAuxGrupoid: TIntegerField;
    TAuxGrupostatus: TIntegerField;
    TAuxGrupodatareg: TSQLTimeStampField;
    TAuxGrupoidusuario: TIntegerField;
    TAuxGrupodataalteracao: TSQLTimeStampField;
    TAuxGrupoidusuarioalteracao: TIntegerField;
    TAuxGruponome: TWideStringField;
    TAuxGrupoidsegmento: TIntegerField;
    TAuxSubGrupo: TFDQuery;
    TAuxSubGrupoid: TIntegerField;
    TAuxSubGrupostatus: TIntegerField;
    TAuxSubGrupodatareg: TSQLTimeStampField;
    TAuxSubGrupoidusuario: TIntegerField;
    TAuxSubGrupodataalteracao: TSQLTimeStampField;
    TAuxSubGrupoidusuarioalteracao: TIntegerField;
    TAuxSubGruponome: TWideStringField;
    TAuxSubGrupoidsegmento: TIntegerField;
    TProdutosidcategoria: TIntegerField;
    TProdutosidsegmento: TIntegerField;
    TProdutosnumeroserie: TIntegerField;
    TProdutosreferencia: TWideStringField;
    TProdutosimg: TBlobField;
    TProdutospesoembalagem: TBCDField;
    TProdutosidgrupo: TIntegerField;
    TProdutosidsubgrupo: TIntegerField;
    TProdutosidmarca: TIntegerField;
    TProdutoscodigofabricante: TWideStringField;
    TAuxCategorias: TFDQuery;
    TAuxCategoriasid: TIntegerField;
    TAuxCategoriasstatus: TIntegerField;
    TAuxCategoriasdatareg: TSQLTimeStampField;
    TAuxCategoriasidusuario: TIntegerField;
    TAuxCategoriasdataalteracao: TSQLTimeStampField;
    TAuxCategoriasidusuarioalteracao: TIntegerField;
    TAuxCategoriasnome: TWideStringField;
    TAuxCategoriasidsegmento: TIntegerField;
    TProdutoscategoria: TWideStringField;
    TProdutosgrupo: TWideStringField;
    TProdutossubgrupo: TWideStringField;
    TProdutosmarca: TWideStringField;
    TProdutossegmento: TWideMemoField;
    TPedidoCompra: TFDQuery;
    TPedidoCompraid: TIntegerField;
    TPedidoComprastatus: TIntegerField;
    TPedidoCompradatareg: TSQLTimeStampField;
    TPedidoCompraidusuario: TIntegerField;
    TPedidoCompradataalteracao: TSQLTimeStampField;
    TPedidoCompraidusuarioalteracao: TIntegerField;
    TPedidoCompraidsegmento: TIntegerField;
    TPedidoCompraidcategoria: TIntegerField;
    TPedidoCompraidentificador: TWideStringField;
    TPedidoCompraidsupervisoraprovacao: TIntegerField;
    TPedidoCompradataaprovacaosupervisor: TDateField;
    TPedidoCompraiddiretoriaaprovacao: TIntegerField;
    TPedidoCompradataaprovacaodiretoria: TDateField;
    TPedidoCompradatapedido: TDateField;
    TPedidoCompraidsolicitante: TIntegerField;
    TPedidoComprasolicitante: TWideStringField;
    TPedidoComprastatus_pedido: TWideMemoField;
    TPedidoCompracancelado: TIntegerField;
    TPedidoCompraidmaquina: TIntegerField;
    TPedidoCompramaquinaveiculo: TWideMemoField;
    TPedidoCompracategoria: TWideMemoField;
    TPedidoCompraidservico: TIntegerField;
    TPedidoCompratiposervico: TWideStringField;
    TPedidoCompradescricaoservico: TWideStringField;
    TItensPedido: TFDQuery;
    TItensPedidoid: TIntegerField;
    TItensPedidoidpedido: TIntegerField;
    TItensPedidoiditem: TIntegerField;
    TItensPedidoobservacao: TWideStringField;
    TItensPedidostatus: TIntegerField;
    TItensPedidodatareg: TSQLTimeStampField;
    TItensPedidoidusuario: TIntegerField;
    TItensPedidodataalteracao: TSQLTimeStampField;
    TItensPedidoidusuarioalteracao: TIntegerField;
    TItensPedidoNome: TWideStringField;
    TItensPedidoquantidade: TIntegerField;
    TItensPedidounidademedida: TWideStringField;
    TItensPedidovalorunidade: TBCDField;
    TItensPedidovalortotal: TBCDField;
    TItensPedidotipo: TIntegerField;
    TItensPedidocodigofabricante: TWideStringField;
    TItensPedidoidorcamento: TIntegerField;
    TItensPedidoqtdrealizada: TIntegerField;
    TItensPedidorecebido: TBooleanField;
    TItensPedidoobservacaorecebimento: TWideStringField;
    TItensPedidodatarecebimento: TDateField;
    TItensPedidoidusuariorecebimento: TIntegerField;
    TStatusPedido: TFDQuery;
    TStatusPedidoid: TIntegerField;
    TStatusPedidostatus: TIntegerField;
    TStatusPedidodatareg: TSQLTimeStampField;
    TStatusPedidoidusuario: TIntegerField;
    TStatusPedidodataalteracao: TSQLTimeStampField;
    TStatusPedidoidusuarioalteracao: TIntegerField;
    TStatusPedidoidpedido: TIntegerField;
    TStatusPedidoidstatus: TIntegerField;
    TStatusPedidoobservacao: TWideStringField;
    TStatusPedidonomestatus: TWideMemoField;
    TStatusPedidodatastatus: TDateField;
    TPedidoCompraRep: TFDQuery;
    TPedidoCompraRepid: TIntegerField;
    TPedidoCompraRepstatus: TIntegerField;
    TPedidoCompraRepdatareg: TSQLTimeStampField;
    TPedidoCompraRepidusuario: TIntegerField;
    TPedidoCompraRepdataalteracao: TSQLTimeStampField;
    TPedidoCompraRepidusuarioalteracao: TIntegerField;
    TPedidoCompraRepidsegmento: TIntegerField;
    TPedidoCompraRepidcategoria: TIntegerField;
    TPedidoCompraRepidentificador: TWideStringField;
    TPedidoCompraRepidsupervisoraprovacao: TIntegerField;
    TPedidoCompraRepdataaprovacaosupervisor: TDateField;
    TPedidoCompraRepiddiretoriaaprovacao: TIntegerField;
    TPedidoCompraRepdataaprovacaodiretoria: TDateField;
    TPedidoCompraRepdatapedido: TDateField;
    TPedidoCompraRepidsolicitante: TIntegerField;
    TPedidoCompraRepcancelado: TIntegerField;
    TPedidoCompraRepidmaquina: TIntegerField;
    TPedidoCompraRepidservico: TIntegerField;
    TPedidoCompraRepflagurgente: TIntegerField;
    TPedidoCompraRepsolicitante: TWideStringField;
    TPedidoCompraRepcategoria: TWideMemoField;
    TPedidoCompraRepstatus_pedido: TWideMemoField;
    TPedidoCompraRepmaquinaveiculo: TWideMemoField;
    TPedidoCompraReptiposervico: TWideStringField;
    TPedidoCompraRepdescricaoservico: TWideStringField;
    TMaquinasidcategoria: TIntegerField;
    TMaquinasidsegmento: TIntegerField;
    TMaquinasanomodelo: TIntegerField;
    TFornecedoressenha: TWideStringField;
    TAuxTipoServico: TFDQuery;
    TAuxTipoServicoid: TIntegerField;
    TAuxTipoServicostatus: TIntegerField;
    TAuxTipoServicodatareg: TSQLTimeStampField;
    TAuxTipoServicoidusuario: TIntegerField;
    TAuxTipoServicodataalteracao: TSQLTimeStampField;
    TAuxTipoServicoidusuarioalteracao: TIntegerField;
    TAuxTipoServiconome: TWideStringField;
    TAuxTipoServicoidsegmento: TIntegerField;
    TUsuarioidsegmento: TIntegerField;
    TUsuariosegmentostr: TWideMemoField;
    TServico: TFDQuery;
    TServicoid: TIntegerField;
    TServicostatus: TIntegerField;
    TServicodatareg: TSQLTimeStampField;
    TServicoidusuario: TIntegerField;
    TServicodataalteracao: TSQLTimeStampField;
    TServicoidusuarioalteracao: TIntegerField;
    TServicoidtipo: TIntegerField;
    TServicodescricao: TWideStringField;
    TServicoidsegmento: TIntegerField;
    TServicoresponsavel: TWideStringField;
    TServicotipo: TWideStringField;
    TServicosegmento: TWideMemoField;
    TServicodataprevista: TDateField;
    TOrcamento: TFDQuery;
    TOrcamentoid: TIntegerField;
    TOrcamentostatus: TIntegerField;
    TOrcamentodatareg: TSQLTimeStampField;
    TOrcamentoidusuario: TIntegerField;
    TOrcamentodataalteracao: TSQLTimeStampField;
    TOrcamentoidusuarioalteracao: TIntegerField;
    TOrcamentoidfornecedor: TIntegerField;
    TOrcamentoidpedido: TIntegerField;
    TOrcamentoidentificador: TWideStringField;
    TOrcamentodatapedido: TDateField;
    TOrcamentofornecedor: TWideStringField;
    TOrcamentoemail: TWideStringField;
    TOrcamentocpf_cnpj: TWideStringField;
    TOrcamentotelefone_fixo: TWideStringField;
    TOrcamentoobservacao: TWideStringField;
    TOrcamentostatusstr: TWideMemoField;
    TOrcamentovalortotal: TWideMemoField;
    TItensOrcamento: TFDQuery;
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
    TItensOrcamentoidentificadorpedido: TWideStringField;
    TItensOrcamentodatapedido: TDateField;
    TItensOrcamentostatuspedido: TIntegerField;
    TItensOrcamentonomefornecedor: TWideStringField;
    TItensOrcamentotelefonefornecedor: TWideStringField;
    TItensOrcamentoemailfornecedor: TWideStringField;
    TItensOrcamentocpfcnpjfornecedor: TWideStringField;
    TItensOrcamentonomeproduto: TWideStringField;
    TItensOrcamentocodfabproduto: TWideStringField;
    TItensOrcamentoqtde: TIntegerField;
    TItensOrcamentoobservacao: TWideStringField;
    TOrcamentoFornecedores: TFDQuery;
    TOrcamentoFornecedoresid: TIntegerField;
    TOrcamentoFornecedoresstatus: TIntegerField;
    TOrcamentoFornecedoresdatareg: TSQLTimeStampField;
    TOrcamentoFornecedoresidusuario: TIntegerField;
    TOrcamentoFornecedoresdataalteracao: TSQLTimeStampField;
    TOrcamentoFornecedoresidusuarioalteracao: TIntegerField;
    TOrcamentoFornecedoresnome: TWideStringField;
    TOrcamentoFornecedorescidade: TWideStringField;
    TOrcamentoFornecedoresuf: TWideStringField;
    TOrcamentoFornecedorescpf_cnpj: TWideStringField;
    TOrcamentoFornecedorestelefone_fixo: TWideStringField;
    TOrcamentoFornecedorescelular: TWideStringField;
    TOrcamentoFornecedoresemail: TWideStringField;
    TOrcamentoFornecedorescontatopessoa: TWideStringField;
    TOrcamentoFornecedoresidorcamento: TIntegerField;
    TMaquinasOperacaohorafim: TBCDField;
    TMaquinasOperacaohoraparada: TBCDField;
    TMaquinasOperacaohorastrabalhada: TBCDField;
    TMaquinasOperacaohorainicio: TBCDField;
    QryMaquinaOperacaoid: TIntegerField;
    QryMaquinaOperacaostatus: TIntegerField;
    QryMaquinaOperacaodatareg: TSQLTimeStampField;
    QryMaquinaOperacaoidusuario: TIntegerField;
    QryMaquinaOperacaodataalteracao: TSQLTimeStampField;
    QryMaquinaOperacaoidusuarioalteracao: TIntegerField;
    QryMaquinaOperacaoidoperacaotalhao: TIntegerField;
    QryMaquinaOperacaoidmaquina: TIntegerField;
    QryMaquinaOperacaooperador: TWideStringField;
    QryMaquinaOperacaoobservacao: TWideStringField;
    QryMaquinaOperacaodata: TDateField;
    QryMaquinaOperacaohorafim: TBCDField;
    QryMaquinaOperacaohoraparada: TBCDField;
    QryMaquinaOperacaohorastrabalhada: TBCDField;
    QryMaquinaOperacaomaquina: TWideMemoField;
    QryMaquinaOperacaohoratotal: TFMTBCDField;
    QryMaquinaOperacaohorainicio: TBCDField;
    TAuxCobertura: TFDQuery;
    TAuxCoberturaid: TIntegerField;
    TAuxCoberturastatus: TIntegerField;
    TAuxCoberturadatareg: TSQLTimeStampField;
    TAuxCoberturaidusuario: TIntegerField;
    TAuxCoberturadataalteracao: TSQLTimeStampField;
    TAuxCoberturaidusuarioalteracao: TIntegerField;
    TAuxCoberturanome: TWideStringField;
    IdHTTP1: TIdHTTP;
    TAuxCategoriassyncaws: TIntegerField;
    TAuxSubGruposyncaws: TIntegerField;
    TAuxGruposyncaws: TIntegerField;
    TAuxMarcasyncaws: TIntegerField;
    TProdutossyncaws: TIntegerField;
    TAuxCulturassyncaws: TIntegerField;
    TAuxTipoMaqVeicsyncaws: TIntegerField;
    TAuxTipoOcorrenciasyncaws: TIntegerField;
    TServicosyncaws: TIntegerField;
    TAuxTipoServicosyncaws: TIntegerField;
    TAuxCoberturasyncaws: TIntegerField;
    TAuxCultivaressyncaws: TIntegerField;
    TAreassyncaws: TIntegerField;
    TSetoressyncaws: TIntegerField;
    TTalhoessyncaws: TIntegerField;
    TMaquinassyncaws: TIntegerField;
    TSafrasyncaws: TIntegerField;
    TReceituariosyncaws: TIntegerField;
    TOperacaoSafraTalhaosyncaws: TIntegerField;
    QryMaquinaOperacaosyncaws: TIntegerField;
    TMaquinasOperacaosyncaws: TIntegerField;
    TProdutosOperacaosyncaws: TIntegerField;
    TOcorrenciaOperacaosyncaws: TIntegerField;
    TUsuariosyncaws: TIntegerField;
    TFornecedoresrazaosocial: TWideStringField;
    TFornecedoresinscricaoestadual: TWideStringField;
    TFornecedoressyncaws: TIntegerField;
    TPedidoCompraflagurgente: TIntegerField;
    TPedidoComprasyncaws: TIntegerField;
    TItensPedidosyncaws: TIntegerField;
    TStatusPedidosyncaws: TIntegerField;
    TOrcamentosyncaws: TIntegerField;
    TItensOrcamentosyncaws: TIntegerField;
    qryProdutosOperacaoqtdeutilidado: TBCDField;
    qryProdutosOperacaosyncaws: TIntegerField;
    TProdutosdefensivos: TIntegerField;
    TLocalEstoque: TFDQuery;
    TLocalEstoqueid: TIntegerField;
    TLocalEstoquestatus: TIntegerField;
    TLocalEstoquedatareg: TSQLTimeStampField;
    TLocalEstoqueidusuario: TIntegerField;
    TLocalEstoquedataalteracao: TSQLTimeStampField;
    TLocalEstoqueidusuarioalteracao: TIntegerField;
    TLocalEstoquenome: TWideStringField;
    TLocalEstoqueidsegmento: TIntegerField;
    TLocalEstoquesegmento: TWideMemoField;
    TLocalEstoquesyncaws: TIntegerField;
    TCentroCusto: TFDQuery;
    TCentroCustoid: TIntegerField;
    TCentroCustostatus: TIntegerField;
    TCentroCustodatareg: TSQLTimeStampField;
    TCentroCustoidusuario: TIntegerField;
    TCentroCustodataalteracao: TSQLTimeStampField;
    TCentroCustoidusuarioalteracao: TIntegerField;
    TCentroCustonome: TWideStringField;
    TCentroCustoidsegmento: TIntegerField;
    TCentroCustosyncaws: TIntegerField;
    TCentroCustosegmento: TWideMemoField;
    TOperadorMaquina: TFDQuery;
    TOperadorMaquinaid: TIntegerField;
    TOperadorMaquinastatus: TIntegerField;
    TOperadorMaquinadatareg: TSQLTimeStampField;
    TOperadorMaquinaidusuario: TIntegerField;
    TOperadorMaquinadataalteracao: TSQLTimeStampField;
    TOperadorMaquinaidusuarioalteracao: TIntegerField;
    TOperadorMaquinanome: TWideStringField;
    TOperadorMaquinasyncaws: TIntegerField;
    TOperadorMaquinarg: TWideStringField;
    TOperadorMaquinacpf: TWideStringField;
    TOperadorMaquinacnh: TWideStringField;
    TOperadorMaquinacelular: TWideStringField;
    TAuxTipoCultivare: TFDQuery;
    TAuxTipoCultivareid: TIntegerField;
    TAuxTipoCultivarestatus: TIntegerField;
    TAuxTipoCultivaredatareg: TSQLTimeStampField;
    TAuxTipoCultivareidusuario: TIntegerField;
    TAuxTipoCultivaredataalteracao: TSQLTimeStampField;
    TAuxTipoCultivareidusuarioalteracao: TIntegerField;
    TAuxTipoCultivarenome: TWideStringField;
    TAuxTipoCultivaresyncaws: TIntegerField;
    TAuxCultivaresidtipocultivar: TIntegerField;
    TAuxCultivaresciclo: TIntegerField;
    TProdutosOperacaoqtdeutilidado: TBCDField;
    TUsuarioagronomo: TIntegerField;
    TUsuarioabastecimento: TIntegerField;
    TTalhoessyncfaz: TIntegerField;
    TMaquinassyncfaz: TIntegerField;
    TSafrasyncfaz: TIntegerField;
    TReceituariosyncfaz: TIntegerField;
    TOperadorMaquinasyncfaz: TIntegerField;
    TAuxTipoCultivaresyncfaz: TIntegerField;
    TFornecedoressyncfaz: TIntegerField;
    TPedidoCompraRepsyncaws: TIntegerField;
    TPedidoCompraRepsyncfaz: TIntegerField;
    TPedidoComprasyncfaz: TIntegerField;
    TItensPedidosyncfaz: TIntegerField;
    TStatusPedidosyncfaz: TIntegerField;
    TOrcamentosyncfaz: TIntegerField;
    TItensOrcamentosyncfaz: TIntegerField;
    TPedidoCompramaxidstatus: TIntegerField;
    TPedidoCompraRepmaxidstatus: TIntegerField;
    ScriptSetSequnce: TFDScript;
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
    TDetReceituariosyncfaz: TIntegerField;
    TDetReceituarioproduto: TWideStringField;
    TDetReceiturioTalhao: TFDQuery;
    TDetReceiturioTalhaoid: TIntegerField;
    TDetReceiturioTalhaostatus: TIntegerField;
    TDetReceiturioTalhaodatareg: TSQLTimeStampField;
    TDetReceiturioTalhaoidusuario: TIntegerField;
    TDetReceiturioTalhaodataalteracao: TSQLTimeStampField;
    TDetReceiturioTalhaoidusuarioalteracao: TIntegerField;
    TDetReceiturioTalhaoidtalhao: TIntegerField;
    TDetReceiturioTalhaoareahe: TBCDField;
    TDetReceiturioTalhaosyncaws: TIntegerField;
    TDetReceiturioTalhaosyncfaz: TIntegerField;
    TDetReceiturioTalhaoidreceiturario: TIntegerField;
    TDetReceiturioTalhaotalhao: TWideStringField;
    TDetReceiturioTalhaoareahe_1: TBCDField;
    TVazaoOperacao: TFDQuery;
    TVazaoOperacaoid: TIntegerField;
    TVazaoOperacaostatus: TIntegerField;
    TVazaoOperacaodatareg: TSQLTimeStampField;
    TVazaoOperacaoidusuario: TIntegerField;
    TVazaoOperacaodataalteracao: TSQLTimeStampField;
    TVazaoOperacaoidusuarioalteracao: TIntegerField;
    TVazaoOperacaoidoperacaotalhao: TIntegerField;
    TVazaoOperacaocincoltha: TIntegerField;
    TVazaoOperacaodezltha: TIntegerField;
    TVazaoOperacaoquinzeltha: TIntegerField;
    TVazaoOperacaovinteltha: TIntegerField;
    TVazaoOperacaotrintaltha: TIntegerField;
    TVazaoOperacaoquarentaltha: TIntegerField;
    TVazaoOperacaocinquentaltha: TIntegerField;
    TVazaoOperacaosetentaecincoltha: TIntegerField;
    TVazaoOperacaocemltha: TIntegerField;
    TVazaoOperacaosyncaws: TIntegerField;
    TVazaoOperacaosyncfaz: TIntegerField;
    QryOperacaoSafraTalhaosyncaws: TIntegerField;
    QryOperacaoSafraTalhaosyncfaz: TIntegerField;
    QryOperacaoSafraTalhaoqualidadecobertura: TWideStringField;
    TOperacaoSafraTalhaosyncfaz: TIntegerField;
    TOperacaoSafraTalhaoqualidadecobertura: TWideStringField;
    TAreaslatitude: TWideStringField;
    TAreaslongitude: TWideStringField;
    TAreassyncfaz: TIntegerField;
    TSetoreslatitude: TWideStringField;
    TSetoreslongitude: TWideStringField;
    TSetoressyncfaz: TIntegerField;
    TTalhoeslatitude: TWideStringField;
    TTalhoeslongitude: TWideStringField;
    TOperacaoSafraTalhaoidcobertura: TIntegerField;
    QryOperacaoSafraTalhaoidcobertura: TIntegerField;
    TAuxCultivaressyncfaz: TIntegerField;
    TAuxCultivarestipo: TWideStringField;
    TPluviometros: TFDQuery;
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
    TPluviometrossetor: TWideStringField;
    TPluviometroTalhoes: TFDQuery;
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
    TPluviometroTalhoestalhao: TWideStringField;
    TPluviometria: TFDQuery;
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
    TPluviometriapluviometro: TWideStringField;
    TPluviometriatalhao: TWideStringField;
    TPluviometriasetor: TWideStringField;
    TLocalEstoquesyncfaz: TIntegerField;
    TLocalEstoquecombustivel: TIntegerField;
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
    TAbastecimentoOutrosproduto: TWideStringField;
    TAbastecimento: TFDQuery;
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
    TAbastecimentocombustivelnome: TWideMemoField;
    TAbastecimentolocalestoquenome: TWideStringField;
    TAbastecimentomaquinaprefixo: TWideStringField;
    TAbastecimentooperador: TWideStringField;
    TAbastecimentohorimetro: TBCDField;
    TOrcamentodesconto: TBCDField;
    TOrcamentoipi: TBCDField;
    TOrcamentoicmst: TBCDField;
    TOrcamentofrete: TBCDField;
    TOrcamentodiferencialalicota: TBCDField;
    TItensOrcamentodesconto: TBCDField;
    TItensOrcamentoipi: TBCDField;
    TItensOrcamentoicmst: TBCDField;
    TItensOrcamentofrete: TBCDField;
    TItensOrcamentodiferencialalicota: TBCDField;
    TDetReceituariofinalidade: TWideStringField;
    PgDriverLink: TFDPhysPgDriverLink;
    TUsuarioimgass: TBlobField;
    TAuxPragas: TFDQuery;
    TAuxPragasid: TIntegerField;
    TAuxPragasstatus: TIntegerField;
    TAuxPragasdatareg: TSQLTimeStampField;
    TAuxPragasidusuario: TIntegerField;
    TAuxPragasdataalteracao: TSQLTimeStampField;
    TAuxPragasidusuarioalteracao: TIntegerField;
    TAuxPragasnome: TWideStringField;
    TAuxPragassyncaws: TIntegerField;
    TAuxPragassyncfaz: TIntegerField;
    TMonitoramento: TFDQuery;
    TMonitoramentoid: TIntegerField;
    TMonitoramentostatus: TIntegerField;
    TMonitoramentodatareg: TSQLTimeStampField;
    TMonitoramentoidusuario: TIntegerField;
    TMonitoramentodataalteracao: TSQLTimeStampField;
    TMonitoramentoidusuarioalteracao: TIntegerField;
    TMonitoramentodatamonitoramento: TDateField;
    TMonitoramentoidtalhao: TIntegerField;
    TMonitoramentohorainicio: TSQLTimeStampField;
    TMonitoramentotipoabertura: TIntegerField;
    TMonitoramentohorafim: TSQLTimeStampField;
    TMonitoramentosyncaws: TIntegerField;
    TMonitoramentosyncfaz: TIntegerField;
    TMonitoramentotagabertura: TWideStringField;
    TMonitoramentotagfechamento: TWideStringField;
    TMonitoramentotalhao: TWideStringField;
    TMonitoramentoresponsavel: TWideStringField;
    TMonitoramentoValores: TFDQuery;
    TMonitoramentoValoresponto: TWideStringField;
    TMonitoramentoValoreslatitude: TWideStringField;
    TMonitoramentoValoreslongitude: TWideStringField;
    TMonitoramentoValorespraga: TWideStringField;
    TMonitoramentoValorescontagem: TIntegerField;
    TMonitoramentoValoresid: TIntegerField;
    TMonitoramentoValorescaracteristicastr: TWideStringField;
    QryOperacaoSafraTalhaocobertura: TWideStringField;
    QryOperacaoSafraTalhaovariedade: TWideStringField;
    QryOperacaoSafraTalhaotipoopesolido: TWideStringField;
    TReceituariostatusstr: TWideStringField;
    TAuxPragaTipo: TFDQuery;
    TAuxPragaTipoid: TIntegerField;
    TAuxPragaTipostatus: TIntegerField;
    TAuxPragaTipodatareg: TSQLTimeStampField;
    TAuxPragaTipoidusuario: TIntegerField;
    TAuxPragaTipodataalteracao: TSQLTimeStampField;
    TAuxPragaTipoidusuarioalteracao: TIntegerField;
    TAuxPragaTiponome: TWideStringField;
    TAuxPragaTiposyncaws: TIntegerField;
    TAuxPragaTiposyncfaz: TIntegerField;
    TAuxPragasidtipo: TIntegerField;
    TAuxPragastipo: TWideStringField;
    TReceituariodatarecomendacao: TDateField;
    TReceituariodataprevaplicacao: TDateField;
    FDConPG: TFDConnection;
    TTalhoesCheck: TBooleanField;
    TTalhoesqrcodesaida: TWideStringField;
    TMaquinasultimarevisao: TDateField;
    TMaquinashorimetroultimarev: TBCDField;
    TMaquinascheck: TBooleanField;
    TMovLocalEstoque: TFDQuery;
    TMovLocalEstoqueid: TIntegerField;
    TMovLocalEstoquestatus: TIntegerField;
    TMovLocalEstoquedatareg: TSQLTimeStampField;
    TMovLocalEstoqueidusuario: TIntegerField;
    TMovLocalEstoquedataalteracao: TSQLTimeStampField;
    TMovLocalEstoqueidusuarioalteracao: TIntegerField;
    TMovLocalEstoqueidlocalestoqueorigem: TIntegerField;
    TMovLocalEstoqueidlocalestoquedetino: TIntegerField;
    TMovLocalEstoqueidproduto: TIntegerField;
    TMovLocalEstoqueqtde: TBCDField;
    TMovLocalEstoquedatamov: TDateField;
    TMovLocalEstoquehora: TTimeField;
    TMovLocalEstoquesyncaws: TIntegerField;
    TMovLocalEstoquesyncfaz: TIntegerField;
    TMovLocalEstoquelocalorigem: TWideStringField;
    TMovLocalEstoquelocaldestino: TWideStringField;
    TMovLocalEstoqueproduto: TWideStringField;
    TReceituarioobservacao: TWideStringField;
    Tauxatividadeabastecimento: TFDQuery;
    Tauxatividadeabastecimentoid: TIntegerField;
    Tauxatividadeabastecimentostatus: TIntegerField;
    Tauxatividadeabastecimentodatareg: TSQLTimeStampField;
    Tauxatividadeabastecimentoidusuario: TIntegerField;
    Tauxatividadeabastecimentodataalteracao: TSQLTimeStampField;
    Tauxatividadeabastecimentoidusuarioalteracao: TIntegerField;
    Tauxatividadeabastecimentonome: TWideStringField;
    Tauxatividadeabastecimentosyncaws: TIntegerField;
    Tauxatividadeabastecimentosyncfaz: TIntegerField;
    TAbastecimentoidatividade: TIntegerField;
    TAbastecimentoatividade: TWideStringField;
    TOrcamentoinscricaoestadual: TWideStringField;
    TOrcamentocidade: TWideStringField;
    TOrcamentocontatopessoa: TWideStringField;
    TItensPedidoitem: TLargeintField;
    TItensOrcamentoitem: TLargeintField;
    TItensOrcamentounidademedida: TWideStringField;
    TMPComparativo: TFDQuery;
    TMPComparativoid: TIntegerField;
    TMPComparativoitem: TIntegerField;
    TMPComparativoqtd: TIntegerField;
    TMPComparativounidademedida: TWideStringField;
    TMPComparativocodfabricante: TWideStringField;
    TMPComparativodescricao: TWideStringField;
    TMPComparativofornecedor: TWideStringField;
    TMPComparativovalorunitario: TBCDField;
    TMPComparativovalortotal: TBCDField;
    TMPComparativoidproduto: TIntegerField;
    TMPComparativoidorcamento: TIntegerField;
    TMPComparativoidfornecedor: TIntegerField;
    Compradores: TFDQuery;
    Compradoresid: TIntegerField;
    Compradoresstatus: TIntegerField;
    Compradoresdatareg: TSQLTimeStampField;
    Compradoresidusuario: TIntegerField;
    Compradoresdataalteracao: TSQLTimeStampField;
    Compradoresidusuarioalteracao: TIntegerField;
    Compradoresnome: TWideStringField;
    Compradorescidade: TWideStringField;
    Compradoresuf: TWideStringField;
    Compradorescpf_cnpj: TWideStringField;
    Compradorestelefone_fixo: TWideStringField;
    Compradorescelular: TWideStringField;
    Compradoresemail: TWideStringField;
    Compradorescontatopessoa: TWideStringField;
    Compradoressenha: TWideStringField;
    Compradoressyncaws: TIntegerField;
    Compradoresrazaosocial: TWideStringField;
    Compradoresinscricaoestadual: TWideStringField;
    Compradoressyncfaz: TIntegerField;
    Contratos: TFDQuery;
    Contratosid: TIntegerField;
    Contratosstatus: TIntegerField;
    Contratosdatareg: TSQLTimeStampField;
    Contratosidusuario: TIntegerField;
    Contratosdataalteracao: TSQLTimeStampField;
    Contratosidusuarioalteracao: TIntegerField;
    Contratosidcomprador: TIntegerField;
    Contratosnumerocontrato: TWideStringField;
    Contratostotalcompravolume: TBCDField;
    Contratostotalcomprasacos: TBCDField;
    Contratostotalembarquevolume: TBCDField;
    Contratostotalembarquesacos: TBCDField;
    Contratossyncaws: TIntegerField;
    Contratossyncfaz: TIntegerField;
    Contratosidcultura: TIntegerField;
    Contratosidsafra: TIntegerField;
    Contratoscomprador: TWideStringField;
    Contratoscultura: TWideStringField;
    Contratossafra: TWideStringField;
    Embarque: TFDQuery;
    Embarqueid: TIntegerField;
    Embarquestatus: TIntegerField;
    Embarquedatareg: TSQLTimeStampField;
    Embarqueidusuario: TIntegerField;
    Embarquedataalteracao: TSQLTimeStampField;
    Embarqueidusuarioalteracao: TIntegerField;
    Embarqueidcontrato: TIntegerField;
    Embarquenumeronf: TIntegerField;
    Embarqueplaca: TWideStringField;
    Embarquedataembarque: TDateField;
    Embarquetara: TBCDField;
    Embarquebruto: TBCDField;
    Embarqueliquido: TBCDField;
    Embarquesyncaws: TIntegerField;
    Embarquesyncfaz: TIntegerField;
    Embarquehorabarque: TTimeField;
    Embarqueimp: TBCDField;
    Embarquequeb: TBCDField;
    Embarqueverd: TBCDField;
    Embarqueavar: TBCDField;
    Embarqueumid: TBCDField;
    Contratossaldo: TFMTBCDField;
    TAbastecimentoobs: TWideStringField;
    TMaquinasdepreciacao: TBCDField;
    TMaquinasvidautil: TBCDField;
    TReceituarioidcultura: TIntegerField;
    TReceituariocultura: TWideStringField;
    Contratosstatusstr: TWideMemoField;
    Contratossaldosc: TFMTBCDField;
    TItensOrcamentovalordesconto: TFMTBCDField;
    TItensOrcamentomarca: TWideStringField;
    TOrcamentoidformapagamento: TIntegerField;
    TOrcamentoformapg: TWideMemoField;
    Contratosvendedor: TWideStringField;
    Contratosvalortotalsaca: TBCDField;
    Contratosvalorkg: TBCDField;
    Embarquevalornf: TBCDField;
    Contratosvalortotalembarque: TFMTBCDField;
    Contratosvalorsaldo: TFMTBCDField;
    TMaquinashorimetroproximarevisao: TBCDField;
    TEstoqueSaida: TFDQuery;
    TEstoqueSaidaid: TIntegerField;
    TEstoqueSaidastatus: TIntegerField;
    TEstoqueSaidadatareg: TSQLTimeStampField;
    TEstoqueSaidaidusuario: TIntegerField;
    TEstoqueSaidadataalteracao: TSQLTimeStampField;
    TEstoqueSaidaidusuarioalteracao: TIntegerField;
    TEstoqueSaidaidproduto: TIntegerField;
    TEstoqueSaidadatasaidaestoque: TDateField;
    TEstoqueSaidaqtditens: TFMTBCDField;
    TEstoqueSaidaunidademedida: TWideStringField;
    TEstoqueSaidaidlocalestoque: TIntegerField;
    TEstoqueSaidaidcentrocusto: TIntegerField;
    TEstoqueSaidasyncaws: TIntegerField;
    TEstoqueSaidasyncfaz: TIntegerField;
    TEstoqueSaidalocalestoque: TWideStringField;
    TEstoqueSaidacentrocusto: TWideStringField;
    TEstoqueSaidaproduto: TWideStringField;
    TEstoqueSaidaprodutocodfabricante: TWideStringField;
    TEstoqueSaidatipo_baixa: TIntegerField;
    TEstoqueSaidaidresponsavel: TIntegerField;
    TEstoqueSaidatipostr: TWideMemoField;
    TEstoqueSaidavalorsaida: TBCDField;
    TnotaFiscalIntem: TFDQuery;
    TnotaFiscalIntemid: TIntegerField;
    TnotaFiscalIntemstatus: TIntegerField;
    TnotaFiscalIntemdatareg: TSQLTimeStampField;
    TnotaFiscalIntemidusuario: TIntegerField;
    TnotaFiscalIntemdataalteracao: TSQLTimeStampField;
    TnotaFiscalIntemidusuarioalteracao: TIntegerField;
    TnotaFiscalIntemidnota: TIntegerField;
    TnotaFiscalIntemidproduto: TIntegerField;
    TnotaFiscalIntemvalortotalnf: TFMTBCDField;
    TnotaFiscalIntemqtditens: TFMTBCDField;
    TnotaFiscalIntemunidademedida: TWideStringField;
    TnotaFiscalIntempesoembalagem: TFMTBCDField;
    TnotaFiscalIntemidlocalestoque: TIntegerField;
    TnotaFiscalIntemsyncaws: TIntegerField;
    TnotaFiscalIntemsyncfaz: TIntegerField;
    TnotaFiscalIntemprodutoid: TIntegerField;
    TnotaFiscalIntemprodutounidade: TWideStringField;
    TnotaFiscalIntemprodutonome: TWideStringField;
    TnotaFiscalIntemprodutofabricante: TWideStringField;
    TnotaFiscalIntemitem: TLargeintField;
    TEstoqueEntrada: TFDQuery;
    TEstoqueEntradaid: TIntegerField;
    TEstoqueEntradastatus: TIntegerField;
    TEstoqueEntradadatareg: TSQLTimeStampField;
    TEstoqueEntradaidusuario: TIntegerField;
    TEstoqueEntradadataalteracao: TSQLTimeStampField;
    TEstoqueEntradaidusuarioalteracao: TIntegerField;
    TEstoqueEntradaidproduto: TIntegerField;
    TEstoqueEntradaidfornecedor: TIntegerField;
    TEstoqueEntradaidpedido: TIntegerField;
    TEstoqueEntradanumeronf: TIntegerField;
    TEstoqueEntradadataemissao: TDateField;
    TEstoqueEntradadataentradaestoque: TDateField;
    TEstoqueEntradavalortotalnf: TFMTBCDField;
    TEstoqueEntradaqtditens: TFMTBCDField;
    TEstoqueEntradaunidademedida: TWideStringField;
    TEstoqueEntradapesoembalagem: TFMTBCDField;
    TEstoqueEntradaidlocalestoque: TIntegerField;
    TEstoqueEntradaidcentrocusto: TIntegerField;
    TEstoqueEntradasyncaws: TIntegerField;
    TEstoqueEntradasyncfaz: TIntegerField;
    TEstoqueEntradatipo: TIntegerField;
    TEstoqueEntradafornecedor: TWideStringField;
    TEstoqueEntradacentrocusto: TWideStringField;
    TUsuariosyncfaz: TIntegerField;
    TUsuariotokenapp: TWideStringField;
    TUsuariotokenappcompras: TWideStringField;
    TUsuarioarmazem: TIntegerField;
    TUsuarioaplicacaosolido: TIntegerField;
    TUsuariopulverizacao: TIntegerField;
    TUsuarioplantio: TIntegerField;
    TUsuariocolheita: TIntegerField;
    TUsuariomonitoramentopragas: TIntegerField;
    TUsuariopluviometria: TIntegerField;
    TUsuariomanutencaomaquinas: TIntegerField;
    TUsuarioabastecimentoexterno: TIntegerField;
    TConfig: TFDQuery;
    TConfigtipodb: TIntegerField;
    TConfigsyncfaz: TIntegerField;
    TConfigagricultura: TIntegerField;
    TConfigpecuaria: TIntegerField;
    procedure TFornecedoresReconcileError(DataSet: TFDDataSet; E: EFDException;
      UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
    procedure TProdutosReconcileError(DataSet: TFDDataSet; E: EFDException;
      UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
    procedure TAuxCategoriasReconcileError(DataSet: TFDDataSet; E: EFDException;
      UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
    procedure TUsuarioReconcileError(DataSet: TFDDataSet; E: EFDException;
      UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
    procedure TPedidoCompraReconcileError(DataSet: TFDDataSet; E: EFDException;
      UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
    procedure TItensPedidoReconcileError(DataSet: TFDDataSet; E: EFDException;
      UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
    procedure TStatusPedidoReconcileError(DataSet: TFDDataSet; E: EFDException;
      UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
    procedure TOperacaoSafraTalhaoReconcileError(DataSet: TFDDataSet;
      E: EFDException; UpdateKind: TFDDatSRowState;
      var Action: TFDDAptReconcileAction);
    procedure TOcorrenciaOperacaoReconcileError(DataSet: TFDDataSet;
      E: EFDException; UpdateKind: TFDDatSRowState;
      var Action: TFDDAptReconcileAction);
    procedure TOperacaoSafraTalhaoUpdateError(ASender: TDataSet;
      AException: EFDException; ARow: TFDDatSRow; ARequest: TFDUpdateRequest;
      var AAction: TFDErrorAction);
    procedure TDetReceituarioReconcileError(DataSet: TFDDataSet;
      E: EFDException; UpdateKind: TFDDatSRowState;
      var Action: TFDDAptReconcileAction);
    procedure TMaquinasReconcileError(DataSet: TFDDataSet; E: EFDException;
      UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
    procedure TLocalEstoqueReconcileError(DataSet: TFDDataSet; E: EFDException;
      UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
    procedure TEstoqueEntradaReconcileError(DataSet: TFDDataSet;
      E: EFDException; UpdateKind: TFDDatSRowState;
      var Action: TFDDAptReconcileAction);
    procedure TAbastecimentoReconcileError(DataSet: TFDDataSet; E: EFDException;
      UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
    procedure TAbastecimentoOutrosReconcileError(DataSet: TFDDataSet;
      E: EFDException; UpdateKind: TFDDatSRowState;
      var Action: TFDDAptReconcileAction);
    procedure TReceituarioReconcileError(DataSet: TFDDataSet; E: EFDException;
      UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
    procedure ContratosReconcileError(DataSet: TFDDataSet; E: EFDException;
      UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
    procedure EmbarqueReconcileError(DataSet: TFDDataSet; E: EFDException;
      UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
  private
    { Private declarations }
  public
    vIdUsuarioLogado,vIdSegmento,vURLMetabase:string;
    vTipoBDConfig,vTipoDB:integer;
    procedure ConectaPG_AWS;
    function  MD55(const texto:string):string;
    function  ValidaUsuario(Usuario,Senha:string):Boolean;
    function  VerificaCadastroExiste(ACampo,ATabela,Anome:string):Boolean;
    function  VerificaSetorExiste(idArea,NomeSetor:string):Boolean;
    function  VerificaTalhaoExiste(idSetor,NomeTalhao:string):Boolean;
    function  VerificaSafraVigente: Boolean;
    procedure AbreOperacaoTalhaoSafra(vIdTalhao,vIdSafra,vFiltro:string);
    procedure AbreMaquinaOperacao(vIdOperacao: string);
    procedure AbreProdutoOperacao(vIdOperacao: string);
    procedure AbreOcorrenciaOperacao(vIdOperacao: string);
    procedure FinalizaOperacao(vIdOperacao: string);
    procedure AbrirDetReceiturario(vIdReceituario: string);
    function  VerificaPendenciaOperacao(vIdOperacao: string):string;
    procedure AbreOrcamentos(vIdPedido,vFiltro:string);
    procedure AbreOrcamentosLista(vFiltro: string);
    procedure AbreItemPedidos(idPedido:string);
    procedure AprovaItemsOracamentoInd(vIdOrcamento,vIdIten,valorunidade,valortotal,qtde:string);
    function  VerificaItemPedido(vIdPedido,vIdItem:string):Boolean;
    procedure AbrePedidos(vFiltro:string);
    procedure AtualizaStatusExluido(vIdPedido:string);
    procedure AbreStatusPedidos(idPedido: string);
    procedure AbreItemsOrcamentos(vFiltro:string);
    procedure AprovaItemsOracamento(vIdOrcamento:string);
    procedure InsereStatusInicial(idPedido: string);
    function  RetornaMaxPedido:string;
    procedure AbrirFornecedoresOrcamento(vIdPedido:String);
    function  RetornaValorItemOrecamento(idProduto,idOrcamento,IdFornecedor:string):string;
    function  RetornaMaxIdPedido:string;
    procedure AtualizaValorItemOrcamento(vValor,vId:string);
    procedure AbrePedidosRep(vFiltro: string);
    procedure AtualizaStatusPedido(idPedido,status:string);
    procedure CancelaPedido(idPedido:string);
    function  PostEnviaEmailOrcamento(idOrcamento:string):string;
    function  LimpaResut(vResult: string): String;
    function  RetornaMaxId(AnomeTabela:string):string;
    procedure AbreSystemConfig;
    procedure AlteraFlaSynAWS_ZERO(ATabela, Ids: string);
    procedure AbreProdutos(vFiltro:string);
    procedure MovLocalEstoque(vFiltro: string);
    procedure AbreCentroCusto(vFiltro:string);
    procedure AbreLocalEstoque(vFiltro:string);
    function  RetornaIdOperacao(id:string):string;
    procedure DescataOrcamentos(IdPedido:string);
    procedure AbreEntradaEstoque(idSegmento,vFiltro:string);
    function  LerIni(Diretorio,Chave1, Chave2, ValorPadrao: String): String;
    procedure AtualizaSequencias;
    function  VerificaExisteGenerico(AnomeTabela,AnomeCampo,AValorStr:string):Boolean;
    function  VerificaTalhaoPluviometro(idPluvi,idTalhao:string):Boolean;
    function  VerificaTalhaoPluviAdicionado(idTalhao:string):Boolean;
    procedure AbreTalhoesPluvi(idPluvi:string);
    procedure AbrePluviometria(vFiltro:string);
    function  VerificaExistePluviometria(AData,AIdPluvi: string): Boolean;
    procedure AbreAbastecimento(vFiltro:string);
    procedure AbreAbastecimentoOutros(vIdAbastecimento:string);
    procedure AtualizaValorIten(idItem,icmst,desconto,frete,ipi,diferencialalicota:string);
    procedure AbrirMonitoramento(vFiltro:string);
    procedure AbrirMonitoramentoPontos(vFiltro:string);
    procedure AbreOperacaoEdit(idOperacao:string);
    function  RetornaNomeResponsavel(Id:string):string;
    procedure AbreReceituario(vFiltro:string);
    function  RetornaMaxIdReceituario:string;
    function  VerificaContratoExiste(Numero:string):Boolean;
    procedure AbreEmbarque(idContrato:string);
    procedure AtualizaSaldoContrato(idContrato:string);
    procedure AtualizaStatusContrato(idContrato,Status:string);
    procedure DeletaComparativo;

    procedure AtaulizaValorMedioProduto(idNota,idProduto,dataEntrada:string);
    function  RetornaRegistoCustoDia(idProduto,DataEntrada:string):Boolean;
    procedure InsereSaidaAbastecimento(dataSaida,idcentrocusto,idlocalestoque,
     idproduto,qtditens,idresponsavel:string);
    function  RetornaCustoMedioProduto(idProduto:string):Double;
    procedure AbreSaidaEstoque(idSegmento,vFiltro:string);
    procedure AbreItensNf(idNF:string);
    function  RetornaIdMaxNota:string;
    procedure DeletaPedido(idPedido:string);
    procedure AtaulizaValorMedioProdutoGeral;

    procedure AtaulizaSaldoAtualCustoMedio(idProduto:string);

  end;
var
  dbCtx: TdbCtx;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses UPrincipal, UQuadroAtividades, dmReplicacao, DmReplicaFaz, URelOperacao,
  UdmReport;

{$R *.dfm}

{ TDataModule1 }

procedure TdbCtx.AlteraFlaSynAWS_ZERO(ATabela, Ids: string);
var
 vQry:TFDQuery;
begin
 vQry :=TFDQuery.Create(nil);
 vQry.Connection := dbCtx.FDConPG;
 with vQry,vQry.SQL do
 begin
   Clear;
   Add('update '+ATabela+ ' SET syncaws=0');
   Add('where id ='+Ids);
   vQry.SQL.Text;
   ExecSQL;
 end;
end;

function TdbCtx.PostEnviaEmailOrcamento(idOrcamento:string):string;
var
 url,vJsonString,vReultHTTP,vReultHTTPc :string;
 JsonToSend : TStringStream;
 LJsonObj   : TJSONObject;
 StrAux     : TStringWriter;
 txtJson    : TJsonTextWriter;
 I,J:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
begin
   Url :='http://192.168.1.79:8090/datasnap/rest/TServerMethods1/EnviaEmailFornecedor';
   IdHTTP1.Request.CustomHeaders.Clear;
   StrAux  := TStringWriter.Create;
   txtJson := TJsonTextWriter.Create(StrAux);
   txtJson.Formatting := TJsonFormatting.Indented;
   TxtJSON.WriteStartObject; //Objeto maior
    TxtJSON.WritePropertyName('emailFornecedor');
    TxtJSON.WriteStartArray; //Objeto pedido
         txtJson.WriteStartObject;
         txtJson.WritePropertyName('Id');
         txtJson.WriteValue(idOrcamento);
    TxtJSON.WriteEndArray; //Fecha Array dos Itens
   TxtJSON.WriteEndObject;  //Fecha Cabe�alho do pedido
   LJsonObj := TJsonObject.ParseJSONValue(TEncoding.ASCII.GetBytes(StrAux.ToString),0)as TJSONObject;
   JsonToSend := TStringStream.Create(LJsonObj.ToJSON);
   IdHTTP1.Request.ContentType := 'application/json';
   IdHTTP1.Request.Charset := 'UTF-8';
   IdHTTP1.Request.Clear;
   IdHTTP1.Request.BasicAuthentication := false;
   try
     IdHTTP1.Request.CustomHeaders.Clear;
     vJsonString  := IdHTTP1.Put(URL,JsonToSend);
     IdHTTP1.Request.CustomHeaders.Clear;
     vReultHTTPc        := copy(vJsonString,0,18);
      if vReultHTTPc='{"result":[{"Mens"' then
      begin
       Result :=LimpaResut(vJsonString);
      end
     except
     on E: Exception do
      begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
      end;
   end;
end;

function TdbCtx.LimpaResut(vResult: string): String;
begin
  vResult := StringReplace(vResult,'{"result":[{"Mensagem":"','',[rfReplaceAll]);
  vResult := StringReplace(vResult,'{"result":[{"Erro":"','',[rfReplaceAll]);
  vResult := StringReplace(vResult,'{"result":[{"ok":"','',[rfReplaceAll]);
  vResult := StringReplace(vResult,'"}]}','',[rfReplaceAll]);
  Result  := vResult;
end;

procedure TdbCtx.AbreOperacaoEdit(idOperacao: string);
begin
 with QryOperacaoSafraTalhao,QryOperacaoSafraTalhao.SQL do
 begin
   Clear;
   Add('select os.*,o.nome Operacao,u.nome responsavel,ac.nome cultura,');
   Add('rc.nome receituario,acb.nome Cobertura,var.nome variedade,');
   Add('ats.nome TipoOpeSolido');
   Add('from operacaosafratalhao os');
   Add('join operacoes o on o.id=os.idoperacao');
   Add('left join usuario u on u.id=os.idresponsavel');
   Add('left join auxculturas ac on ac.id=os.idcultura');
   Add('left join receiturario rc on rc.id=os.idreceituario');
   Add('left join auxcobertura acb on acb.id=os.idcobertura');
   Add('left join auxcultivares var on var.id=os.idVariedade');
   Add('left join auxtipooperacaosolido ats on ats.id=os.idtipoaplicacaosolido');
   Add('where os.status>-1');
   Add('and os.id='+idOperacao);
   Open;
 end;
end;

procedure TdbCtx.AbreOperacaoTalhaoSafra(vIdTalhao, vIdSafra,vFiltro: string);
begin
 with QryOperacaoSafraTalhao,QryOperacaoSafraTalhao.SQL do
 begin
   Clear;
   Add('select os.*,o.nome Operacao,u.nome responsavel,ac.nome cultura,rc.nome receituario,');
   Add('acb.nome Cobertura,var.nome variedade,');
   Add('ats.nome TipoOpeSolido');
   Add('from operacaosafratalhao os');
   Add('join operacoes o on o.id=os.idoperacao');
   Add('left join usuario u on u.id=os.idresponsavel');
   Add('left join auxculturas ac on ac.id=os.idcultura');
   Add('left join receiturario rc on rc.id=os.idreceituario');
   Add('left join auxcobertura acb on acb.id=os.idcobertura');
   Add('left join auxcultivares var on var.id=os.idVariedade');
   Add('left join auxtipooperacaosolido ats on ats.id=os.idtipoaplicacaosolido');
   Add('where os.status>-1');
   Add('and os.idsafra='+vIdSafra);
   Add('and os.idtalhao='+vIdTalhao);
   Add(vFiltro);
   Open;
 end;
end;

procedure TdbCtx.AbreOrcamentos(vIdPedido,vFiltro: string);
begin
 TOrcamento.ResourceOptions.SilentMode := True;
 with TOrcamento,TOrcamento.SQL do
 begin
   Clear;
   Add('select');
   Add('b.*,');
   Add('case');
   Add(' when b.status=1 then ''Solicita��o''');
   Add(' when b.status=2 then ''Solicita��o''');
   Add(' when b.status=3 then ''Ordem de Compra''');
   Add('end statusStr,');
   Add('c.identificador,');
   Add('c.datapedido,');
   Add('f.nome Fornecedor,');
   Add('f.email,');
   Add('f.cpf_cnpj,');
   Add('f.telefone_fixo,');
   Add('f.inscricaoestadual,');
   Add('f.cidade,');
   Add('f.contatopessoa,');
   Add(QuotedStr('R$')+'|| cast((select sum(valortotal) from orcamentositens where status=1 and idorcamento=b.id)as varchar(10)) valorTotal,');
   Add('fp.codigo||''-''||fp.descricao formapg');
   Add('from orcamentos b');
   Add('join pedidocompra c on c.id=b.idpedido');
   Add('join fornecedor f on f.id=b.idfornecedor');
   Add('left join forma_pagamento_fornecedor fp on fp.id=b.idformapagamento');
   Add('where b.status>-1');
   Add('and c.idSegmento='+vIdSegmento);
   Add('AND B.IdPedido='+vIdPedido);
   Add(vFiltro);
   Open;
 end;
end;

procedure TdbCtx.AbreOrcamentosLista(vFiltro: string);
begin
 TOrcamento.ResourceOptions.SilentMode := True;
 with TOrcamento,TOrcamento.SQL do
 begin
   Clear;
   Add('select');
   Add('b.*,');
   Add('case');
   Add(' when b.status=1 then ''Solicita��o''');
   Add(' when b.status=2 then ''Solicita��o''');
   Add(' when b.status=3 then ''Ordem de Compra''');
   Add('end statusStr,');
   Add('c.identificador,');
   Add('c.datapedido,');
   Add('f.nome Fornecedor,');
   Add('f.email,');
   Add('f.cpf_cnpj,');
   Add('f.telefone_fixo,');
   Add('f.inscricaoestadual,');
   Add('f.cidade,');
   Add('f.contatopessoa,');
   Add(QuotedStr('R$')+'|| cast((select sum(valortotal) from orcamentositens where status=1 and idorcamento=b.id)as varchar(10)) valorTotal,');
   Add('fp.codigo||''-''||fp.descricao formapg');
   Add('from orcamentos b');
   Add('join pedidocompra c on c.id=b.idpedido');
   Add('join fornecedor f on f.id=b.idfornecedor');
   Add('left join forma_pagamento_fornecedor fp on fp.id=b.idformapagamento');
   Add('where b.status>-1');
   Add('and c.idSegmento='+vIdSegmento);
   Add(vFiltro);
   Open;
 end;
end;

procedure TdbCtx.AbreAbastecimento(vFiltro: string);
begin
 with TAbastecimento,TAbastecimento.SQL do
 begin
   Clear;
   Add('select');
   Add('a.*,');
   Add('case');
   Add(' when a.combustivel =178 then ''DIESEL S-10''');
   Add(' when a.combustivel =179 then ''DIESEL S-500''');
   Add(' when a.combustivel =180 then ''GASOLINA''');
   Add(' when a.combustivel =3396 then ''QUEROSENE''');
   Add('end CombustivelNome,');
   Add('b.nome LocalEstoqueNome,');
   Add('c.prefixo MaquinaPrefixo,');
   Add('d.nome Operador,');
   Add('h.nome Atividade');
   Add('from abastecimento a');
   Add('join localestoque b on a.idlocalestoque=b.id');
   Add('join maquinaveiculo c on c.id=a.idmaquina');
   Add('join operadormaquinas d on d.id=a.idoperador');
   Add('join auxatividadeabastecimento h on h.id=a.idAtividade');
   Add('where a.status=1');
   Add(vFiltro);
   try
    Open
   except
   on E: Exception do
    ShowMessage('Erro ao salvar Pluviometro:'+E.Message);
   end;
 end;
end;

procedure TdbCtx.AbreAbastecimentoOutros(vIdAbastecimento: string);
begin
 with TAbastecimentoOutros,TAbastecimentoOutros.SQL do
 begin
   Clear;
   Add('select a.*,b.nome produto from abastecimentoOutros a');
   Add('join produtos b on a.idProduto=b.id');
   Add('where a.status=1 and a.idabastecimento='+vIdAbastecimento);
   Open;
 end;
end;

procedure TdbCtx.AbreCentroCusto(vFiltro: string);
begin
 with TCentroCusto,TCentroCusto.SQL do
 begin
   Clear;
   Add('select');
   Add('a.*,');
   Add(' case a.idSegmento');
   Add('  when 0 then ''AGROPECU�RIA''');
   Add('  when 1 then ''AGRICULTURA''');
   Add('  when 2 then ''AMBOS''');
   Add(' end Segmento');
   Add('from CentroCusto a');
   Add('where status=1');
   Add(Vfiltro);
   Open;
 end;
end;

procedure TdbCtx.AbreEmbarque(idContrato: string);
begin

 with Embarque,Embarque.SQL do
 begin
   Clear;
   Add('select * from embarque');
   Add('where status=1 and idcontrato='+idContrato);
   Add('order by dataembarque,numeronf');
   Open;
 end;
end;

procedure TdbCtx.AbreEntradaEstoque(idSegmento,vFiltro:string);
begin
 with dbCtx.TEstoqueEntrada,dbCtx.TEstoqueEntrada.SQL do
 begin
   Clear;
   Add('select');
   Add('a.*,');
   Add('b.nome Fornecedor,');
   Add(' d.nome CentroCusto');
   Add('from estoqueentrada a');
   Add('join fornecedor b on a.idFornecedor=b.id');
   Add('join centrocusto d on d.id=a.idcentrocusto');
   Add('where a.status=1');
   if vFiltro.Length >0 then
    Add(vFiltro);
   Add('order by a.id desc');
   Open;
 end;
end;

procedure TdbCtx.AbreItemPedidos(idPedido: string);
begin
 with TItensPedido,TItensPedido.SQL do
 begin
   Clear;
   Add('select ROW_NUMBER () OVER (ORDER BY i.id)Item ,i.*,');
   Add('p.Nome,p.codigofabricante  from pedidocompraitems i');
   Add('join produtos p on i.iditem=p.Id');
   Add('where i.status>-1 and idPedido='+idPedido);
   Open;
 end;
end;

procedure TdbCtx.AbreItemsOrcamentos(vFiltro: string);
begin
with TItensOrcamento,TItensOrcamento.SQL do
 begin
   Clear;
   Add('select');
   Add('ROW_NUMBER () OVER (ORDER BY a.id)Item,');
   Add(' a.*,');
   Add(' c.identificador identificadorPedido,');
   Add(' c.datapedido DataPedido,');
   Add(' c.status StatusPedido,');
   Add(' d.nome NomeFornecedor,');
   Add(' d.telefone_fixo TelefoneFornecedor,');
   Add(' d.email EmailFornecedor,');
   Add(' d.cpf_cnpj CpfCnpjFornecedor,');
   Add(' e.Nome NomeProduto,');
   Add(' e.codigofabricante CodFabProduto,');
   Add(' e.unidademedida,');
   Add('(a.valortotal-coalesce(a.desconto,0))ValorDesconto,');
   Add('fp.codigo||''-''||fp.descricao formapg');
   Add('from public.orcamentosItens a');
   Add('join orcamentos b on   b.id=a.idorcamento');
   Add('join pedidocompra c on c.id=b.idpedido');
   Add('join fornecedor d on   d.id=b.idfornecedor');
   Add('join produtos e on      e.Id=a.idproduto');
   Add('left join forma_pagamento_fornecedor fp on fp.id=b.idformapagamento');
   Add('where b.status>-1 and a.status>-1');
   Add('and c.idSegmento='+vIdSegmento);
   Add('and b.id='+vFiltro);
   Add('order by Item');
   Open;
 end;
end;

procedure TdbCtx.AbreItensNf(idNF: string);
begin
 with TnotaFiscalIntem,TnotaFiscalIntem.sql do
 begin
   Clear;
   Add('select');
   Add('ROW_NUMBER () OVER (ORDER BY a.id)Item,');
   Add(' a.*,');
   Add(' b.id ProdutoId,');
   Add(' b.unidademedida ProdutoUnidade,');
   Add(' b.nome ProdutoNome,');
   Add(' b.codigofabricante ProdutoFabricante');
   Add('from notafiscalitems a');
   Add('join produtos b on a.idproduto=b.id');
   Add('WHERE a.STATUS>-1 AND a.idnota='+idNF);
   Open;
 end;
end;

procedure TdbCtx.AbreLocalEstoque(vFiltro: string);
begin
 with TLocalEstoque,TLocalEstoque.SQL do
 begin
   Clear;
   Add('select a.*,');
   Add('case a.idSegmento');
   Add('when 0 then ''AGROPECU�RIA''');
   Add('when 1 then ''AGRICULTURA''');
   Add('when 2 then ''AMBOS''');
   Add('end Segmento');
   Add('from LocalEstoque a');
   Add('where status=1');
   Add('and idsegmento=2 or idsegmento='+vIdSegmento);
   Open;
 end;
end;

procedure TdbCtx.AbreMaquinaOperacao(vIdOperacao: string);
begin
 with QryMaquinaOperacao,QryMaquinaOperacao.SQL do
 begin
   Clear;
   Add('select a.*,b.modelo||''-''||b.prefixo maquina,');
   Add('(horafim-horainicio)-horaparada horaTotal');
   Add('from detoperacaosafratalhaomaquinasoperadores a');
   Add('join maquinaveiculo b on a.idmaquina=b.id');
   Add('where a.status=1 and idoperacaotalhao='+vIdOperacao);
   Open;
 end;
end;

procedure TdbCtx.AbrePedidos(vFiltro: string);
begin
 TPedidoCompra.ResourceOptions.SilentMode := True;
 with TPedidoCompra,TPedidoCompra.SQL do
 begin
   Clear;
   Add('select a.*,u.nome Solicitante ,');
   Add('case');
   Add(' when a.idCategoria=0 then ''Produtos Estoque''');
   Add(' when a.idCategoria=1 then ''Manuten��o Maquinas e Veiculos''');
   Add(' when a.idCategoria=2 then ''Servi�os Gerais''');
   Add('end Categoria,');
   Add('case');
   Add(' when a.status=0 then ''CANCELADO''');
   Add(' when a.status=1 then ''AGUARDANDO APROVA��O SUPERVISOR''');
   Add(' when a.status=2 then ''AGUARDANDO APROVA��O DIRETORIA''');
   Add(' when a.status=3 then ''APROVADO PARA COTA��O''');
   Add(' when a.status=4 then ''COMPRA EFETUADA''');
   Add(' when a.status=5 then ''PEDIDO RECEBIDO''');
   Add(' when a.status=6 then ''PEDIDO FINALIZADO PARCIAL''');
   Add(' when a.status=7 then ''PEDIDO FINALIZADO''');
   Add('end STATUS_PEDIDO,');
   Add('am.nome||''-''|| m.modelo MaquinaVeiculo,');
   Add('asr.Nome TipoServico,');
   Add('sr.Descricao DescricaoServico,');
   Add('(select max(idstatus) from pedidostatus where status=1 and idpedido=a.id)maxidstatus');
   Add('from pedidocompra a');
   Add('join usuario u on u.Id=a.idsolicitante');
   Add('left join maquinaveiculo m on m.id=a.idmaquina');
   Add('left join auxmarcas am on m.idmarca=am.id');
   Add('left join servico sr on a.idServico=sr.id');
   Add('left join AuxTipoServico asr on asr.id=sr.idTipo');
   Add('where a.status>=0 and a.idsegmento='+vIdSegmento);
   if vFiltro.Length>0 then
    Add(vFiltro);
   Add('order by a.id desc');
   Open;
 end;
end;

procedure TdbCtx.AbrePedidosRep(vFiltro: string);
begin
 with TPedidoCompraRep,TPedidoCompraRep.SQL do
 begin
   Clear;
   Add('select a.*,u.nome Solicitante ,');
   Add('case');
   Add(' when a.idCategoria=0 then ''Produtos Estoque''');
   Add(' when a.idCategoria=1 then ''Manuten��o Maquinas e Veiculos''');
   Add(' when a.idCategoria=2 then ''Servi�os Gerais''');
   Add('end Categoria,');
   Add('case');
   Add(' when a.status=0 then ''CANCELADO''');
   Add(' when a.status=1 then ''AGUARDANDO APROVA��O SUPERVISOR''');
   Add(' when a.status=2 then ''AGUARDANDO APROVA��O DIRETORIA''');
   Add(' when a.status=3 then ''APROVADO PARA COTA��O''');
   Add(' when a.status=4 then ''COMPRA EFETUADA''');
   Add(' when a.status=5 then ''PEDIDO RECEBIDO''');
   Add(' when a.status=6 then ''PEDIDO FINALIZADO PARCIAL''');
   Add(' when a.status=7 then ''PEDIDO FINALIZADO''');
   Add('end STATUS_PEDIDO,');
   Add('am.nome||''-''|| m.modelo MaquinaVeiculo,');
   Add('asr.Nome TipoServico,');
   Add('sr.Descricao DescricaoServico,');
   Add('(select max(idstatus) from pedidostatus where status=1 and idpedido=a.id)maxidstatus');
   Add('from pedidocompra a');
   Add('join usuario u on u.Id=a.idsolicitante');
   Add('left join maquinaveiculo m on m.id=a.idmaquina');
   Add('left join auxmarcas am on m.idmarca=am.id');
   Add('left join servico sr on a.idServico=sr.id');
   Add('left join AuxTipoServico asr on asr.id=sr.idTipo');
   Add('where a.id='+vFiltro);
   Open;
 end;
end;

procedure TdbCtx.AbrePluviometria(vFiltro: string);
begin
 with TPluviometria,TPluviometria.SQL do
 begin
   Clear;
   Add('select a.*,b.nome Pluviometro,d.nome Talhao,e.nome Setor from pluviometria a');
   Add('join pluviometro b on a.idPluviometro=b.id');
   Add('join talhoes d on d.id=a.idtalhao');
   Add('join setor e on e.id=d.idSetor');
   Add('join areas f on f.id=e.idarea');
   Add('WHERE a.status=1');
   Add(vFiltro);
   Open;
 end;

 with dmRel.qryRelChuvaMedia,dmRel.qryRelChuvaMedia.sql do
 begin
   Clear;
   Add('select');
   Add('y.datacoleta,');
   Add('y.setor,');
   Add('Y.ANO,');
   Add('case');
   Add('WHEN Y.MES=1 then ''JAN''');
   Add('WHEN Y.MES=2 then ''FEV''');
   Add('WHEN Y.MES=3 then ''MAR''');
   Add('WHEN Y.MES=4 then ''ABR''');
   Add('WHEN Y.MES=5 then ''MAI''');
   Add('WHEN Y.MES=6 then ''JUN''');
   Add('WHEN Y.MES=7 then ''JUL''');
   Add('WHEN Y.MES=8 then ''AGO''');
   Add('WHEN Y.MES=9 then ''SET''');
   Add('WHEN Y.MES=10 then ''OUT''');
   Add('WHEN Y.MES=11 then ''NOV''');
   Add('WHEN Y.MES=12 then ''DEZ''');
   Add('end mes,');
   Add('cast(avg(y.milimetrochuva) as decimal(15,3))milimetrochuva');
   Add('from');
   Add('(select ');
   Add('A.datacoleta,');
   Add('extract(year from datacoleta) ANO,');
   Add('extract(month from datacoleta) MES,');
   Add('e.nome Setor,');
   Add('b.nome Pluv,');
   Add('sum(A.volumemm)/count(*)MilimetroChuva');
   Add('from pluviometria a');
   Add('join pluviometro b on b.ID=A.idpluviometro');
   Add('join talhoes d on a.idtalhao=d.id');
   Add('join setor e on e.id=d.idsetor');
   Add('join areas f on f.id=e.idarea');
   Add('where a.status=1 and a.volumemm>0');
   Add(vFiltro);
   Add('group by A.datacoleta,e.nome,b.nome,extract(year from datacoleta),TRUNC(extract(month from datacoleta))');
   Add('order by extract(year from datacoleta),TRUNC(extract(month from datacoleta)),e.nome,b.nome ,A.datacoleta');
   Add(')y');
   Add('group by Y.ANO,Y.MES,y.datacoleta,y.setor');
   Add('order by Y.ANO,Y.MES,y.setor,y.datacoleta');
   Open;
 end;
end;

procedure TdbCtx.AbreProdutoOperacao(vIdOperacao: string);
begin
 with qryProdutosOperacao,qryProdutosOperacao.SQL do
 begin
   Clear;
   Add('select a.*,b.nome Produto from public.DetOperacaoSafraTalhaoProdutos a');
   Add('join produtos b on b.id=a.idproduto');
   Add('where a.status=1');
   Add('and idoperacaotalhao='+vIdOperacao);
   Open;
 end;
end;


procedure TdbCtx.AbreProdutos(vFiltro: string);
begin
 with TProdutos,TProdutos.SQL do
 begin
   Clear;
   AdD('select');
   AdD('pr.*,');
   AdD('ax.Nome Categoria,');
   AdD('aug.Nome Grupo,');
   AdD('aus.Nome SubGrupo,');
   AdD('aum.Nome Marca,');
   AdD('case pr.idSegmento');
   AdD('when 0 then ''AGROPECU�RIA''');
   AdD('when 1 then ''AGRICULTURA''');
   AdD('when 2 then ''AMBOS''');
   AdD('end Segmento');
   AdD('from produtos pr');
   AdD('join auxcategoriaitem ax on ax.Id=pr.idCategoria');
   AdD('left join auxgrupoprodutos aug on aug.id=pr.idGrupo');
   AdD('left join auxsubgrupoprodutos aus on aus.id=pr.idSubGrupo');
   AdD('left join auxMarcas aum on aum.id=pr.idMarca');
   AdD('where pr.status<>-1');
   if vFiltro.Length=0 then
    Add('and pr.status=1')
   else
    Add(vFiltro);
   AdD('ORDER BY PR.ID DESC');
   TProdutos.SQL.Text;
  Open;
 end;
end;

procedure TdbCtx.MovLocalEstoque(vFiltro: string);
begin
 with TMovLocalEstoque,TMovLocalEstoque.SQL do
 begin
   Clear;
   Add('select a.*,o.nome LocalOrigem,d.nome LocalDestino,c.nome Produto from tranferenciaLocalestoque A');
   Add('join localestoque o on o.id=a.idlocalestoqueorigem');
   Add('join localestoque d on d.id=a.idlocalestoquedetino');
   Add('join produtos c on a.idproduto=c.id');
   Add('where a.status=1');
   Add(vFiltro);
   Add('order by a.datamov desc');
   Open;
 end;
end;

procedure TdbCtx.AbreReceituario(vFiltro: string);
begin
 with TReceituario,TReceituario.SQL do
 begin
   Clear;
   Add('select b.*,u.nome Responsavel,');
   Add(' cast(');
   Add('  case');
   Add('  when b.status=1 then ''Aberto''');
   Add('  when b.status=2 then ''Finalizado''');
   Add(' end as varchar(20)) statusStr,');
   Add('g.nome Cultura');
   Add('from receiturario b');
   Add('join usuario u on u.id=b.idResponsavel');
   Add('left join auxculturas g on g.id=b.idCultura');
   Add('where b.STATUS>-1');
   Add(vFiltro);
   Add('order by b.datareg desc');
   Open;
 end;
end;

procedure TdbCtx.AbreSaidaEstoque(idSegmento, vFiltro: string);
begin
 with dbCtx.TEstoqueSaida,dbCtx.TEstoqueSaida.SQL do
 begin
   Clear;
   Add('select');
   Add(' a.*,');
   Add(' c.nome localEstoque,');
   Add(' d.nome CentroCusto,');
   Add(' e.nome Produto,');
   Add(' e.codigofabricante ProdutoCodFabricante,');
   Add('case');
   Add(' when tipo_baixa=0 then ''Baixa Estoque''');
   Add(' when tipo_baixa=1 then ''Acerto Estoque''');
   Add('end TipoStr');
   Add('from estoquesaida a');
   Add('join localestoque c on c.id=a.idlocalestoque');
   Add('join centrocusto d on d.id=a.idcentrocusto');
   Add('join produtos e on e.id=a.idproduto');
   Add('where a.status=1');
   Add('AND d.idsegmento='+idSegmento);
   if vFiltro.Length >0 then
    Add(vFiltro);
   Open;
 end;
end;

procedure TdbCtx.AbreStatusPedidos(idPedido: string);
begin
 with TStatusPedido,TStatusPedido.SQL do
 begin
   Clear;
   Add('select  a.*,');
   Add('case');
   Add('when idstatus=0 then ''Cancelado''');
   Add('when idstatus=1 then ''Aguardando Aprovacao Supervisor''');
   Add('when idstatus=2 then ''Aguardando Aprovacao Diretoria''');
   Add('when idstatus=3 then ''Enviado para Compra''');
   Add('when idstatus=4 then ''Em Cotacao''');
   Add('when idstatus=5 then ''Em Transporte''');
   Add('when idstatus=6 then ''Recebido''');
   Add('when idstatus=7 then ''Finalizado''');
   Add('when idstatus=8 then ''Finalizado Parcialmente''');
   Add('end NomeStatus');
   Add('from pedidostatus a');
   Add('where status>-1');
   Add('and a.idPedido='+idPedido);
   Open;
 end;
end;

procedure TdbCtx.AbreSystemConfig;
var
 vQry:TFDQuery;
begin
 ConectaPG_AWS;
 vQry:=TFDQuery.Create(nil);
 vQry.Connection  := FDConPG;
 with vQry,vQry.SQL do
 begin
   Clear;
   Add('select * from systemconfig');
   Open;
   vTipoBDConfig := FieldByName('tipodb').AsInteger;
 end;
end;

procedure TdbCtx.AbreTalhoesPluvi(idPluvi: string);
begin
 with TPluviometroTalhoes,TPluviometroTalhoes.SQL do
 begin
   Clear;
   Add('select a.*,b.nome Talhao from pluviometrotalhoes a');
   Add('join talhoes b on a.idtalhao=b.id');
   Add('where a.status=1');
   if idPluvi.Length>0 then
    Add('and a.idpluviometro='+idPluvi);
   Open;
 end;
end;

procedure TdbCtx.AbrirDetReceiturario(vIdReceituario: string);
begin
 with TDetReceituario,TDetReceituario.SQL do
 begin
   Clear;
   Add('select d.*,p.nome Produto');
   Add('from DetReceiturario d');
   Add('join produtos p on d.idproduto=p.id');
   Add('where d.status=1 and d.idreceiturario='+vIdReceituario);
   Open;
 end;
 with TDetReceiturioTalhao,TDetReceiturioTalhao.SQL do
 begin
   Clear;
   Add('select ');
   Add('d.*,');
   Add('p.nome Talhao,');
   Add('p.AreaHE');
   Add('from detreceiturarioTalhao d');
   Add('join Talhoes p on d.idTalhao=p.id');
   Add('where d.status=1 and d.idreceiturario='+vIdReceituario);
   Open;
 end;
end;

procedure TdbCtx.AbrirFornecedoresOrcamento(vIdPedido: String);
begin
 with TOrcamentoFornecedores,TOrcamentoFornecedores.SQL do
 begin
   Clear;
   Add('select b.*,a.Id IdOrcamento from orcamentos a');
   Add('join fornecedor b on a.idfornecedor=b.id');
   Add('where idpedido='+vIdPedido);
   Add('and a.status=1');
   Open;
 end;
end;

procedure TdbCtx.AbrirMonitoramento(vFiltro: string);
begin
 with TMonitoramento,TMonitoramento.sql do
 begin
   Clear;
   Add('select a.*,b.NOME Talhao,c.Nome Responsavel from monitoramentopragas a');
   Add('join talhoes b on a.idTalhao=b.id');
   Add('join setor s on s.id=b.idSetor');
   Add('join usuario c on c.id=a.idusuario');
   Add('where a.status=2');
   Add(vFiltro);
   Open;
 end;

end;

procedure TdbCtx.AbrirMonitoramentoPontos(vFiltro: string);
begin
 with TMonitoramentoValores,TMonitoramentoValores.SQL do
 begin
   Clear;
   Add('select');
   Add('a.id,');
   Add(' b.ponto,');
   Add('b.latitude,');
   Add(' b.longitude,');
   Add(' c.nome Praga,');
   Add(' a.contagem,');
   Add('cast(case');
   Add('  when caracteristica=0 then ''Postura''');
   Add('  when caracteristica=1 then ''Pequena''');
   Add('  when caracteristica=2 then ''M�dia''');
   Add('  when caracteristica=3 then ''Grande''');
   Add('  when caracteristica=4 then ''Ninfas''');
   Add('  when caracteristica=5 then ''Rajado''');
   Add('  when caracteristica=6 then ''Adultos''');
   Add('  when caracteristica=7 then ''Branco''');
   Add('end as varchar(30)) CaracteristicaStr');
   Add('from monitoramentopragaspontos b');
   Add('left join monitoramentopragaspontosvalores a on b.id=a.idponto');
   Add('left join auxpragas c on c.id=a.idpraga');
   Add('where b.idmonitoramento='+vFiltro);
   Add('order by  cast(replace(ponto,'+QuotedStr('Ponto ')+','+QuotedStr('')+')as integer)');
   TMonitoramentoValores.SQL.Text;
   try
    Open
   except
     on e : Exception do
     begin
      ShowMessage(e.Message);
     end;
   end;
 end;

 end;

procedure TdbCtx.AprovaItemsOracamento(vIdOrcamento: string);
var
 vQryAux:TFDQuery;
begin
 vQryAux := TFDQuery.Create(nil);
 vQryAux.Connection := FDConPG;
 with vQry,vQry.SQL do
 begin
   Clear;
   Add('update orcamentos set status=3');
   Add(',dataalteracao=current_timestamp, idusuarioalteracao='+vIdUsuarioLogado);
   Add('where id='+vIdOrcamento);
   ExecSQL;
 end;
 with vQry,vQry.SQL do
 begin
   Clear;
   Add('select * from orcamentositens');
   Add('where idorcamento='+vIdOrcamento);
   Open;
   while not vQry.eof do
   begin
    with vQryAux,vQryAux.SQL do
    begin
      Clear;
      Add('update pedidocompraitems set idorcamento='+vQry.FieldByName('idorcamento').AsString);
      Add(',valorunidade='+StringReplace(vQry.FieldByName('valorunidade').AsString,',','.',[rfReplaceAll]));
      Add(',valortotal='+StringReplace(vQry.FieldByName('valortotal').AsString,',','.',[rfReplaceAll]));
      Add(',qtdrealizada='+vQry.FieldByName('qtde').AsString);
      Add('where iditem='+vQry.FieldByName('idproduto').AsString);
      vQryAux.SQL.Text;
      ExecSQL;
    end;
    vQry.Next;
   end;
 end;
 vQryAux.Free;

end;

procedure TdbCtx.AprovaItemsOracamentoInd(vIdOrcamento, vIdIten, valorunidade,
  valortotal, qtde: string);
var
 vQryAux:TFDQuery;
begin
 vQryAux := TFDQuery.Create(nil);
 vQryAux.Connection := FDConPG;
 with vQry,vQry.SQL do
 begin
   Clear;
   Add('update orcamentositens set status=3');
   Add(',dataalteracao=current_timestamp, idusuarioalteracao='+vIdUsuarioLogado);
   Add('where idOrcamento='+vIdOrcamento);
   Add('and idproduto='+vIdIten);
   ExecSQL;
 end;
  with vQryAux,vQryAux.SQL do
  begin
   Clear;
   Add('update pedidocompraitems set idorcamento='+vIdOrcamento);
   Add(',valorunidade='+valorunidade);
   Add(',valortotal='+valortotal);
   Add(',qtdrealizada='+qtde);
   Add(',status=2');
   Add('where iditem='+vIdIten);
   vQryAux.SQL.Text;
   ExecSQL;
  end;
 vQryAux.Free;
end;

procedure TdbCtx.AtaulizaSaldoAtualCustoMedio(idProduto: string);
var
 vQryAux:TFDQuery;
 TotalItensEntradaGeral,
 TotalValorEntradaGeral,
 TotalItensSaidaGeral,
 TotalValorSaidaGeral,
 ValorSaldoAtual,
 SaldoAtual,
 CustoMedio:Double;
begin
 vQryAux := TFDQuery.Create(nil);
 vQryAux.Connection := FDConPG;
 with vQryAux,vQryAux.SQL do
 begin
   Clear;
   Add('select totalEntrada-totalSaid saldo from');
   Add('(select');
   Add('(select coalesce(sum(qtditens),0) from notafiscalitems');
   Add('where status=1 and idproduto='+idProduto+')totalEntrada,');
   Add('(select  coalesce(sum(qtditens),0) from estoquesaida');
   Add('where status=1 and idproduto='+idProduto+') totalSaid');
   Add('from estoqueentrada limit 1)y');
   Open;
   SaldoAtual := FieldByName('saldo').AsFloat;

   Clear;
   Add('select (sum(y.vl1)/sum(qtditens)) valormedio from');
   Add('(select');
   Add(' (e.qtditens * (e.valortotalnf/e.qtditens))vl1,');
   Add(' e.qtditens');
   Add('from notafiscalitems e');
   Add('where status=1 and e.idproduto='+idProduto+')y');// and a.datasaidaestoque<='+dataEntrada.QuotedString);
   Open;
   CustoMedio := FieldByName('valormedio').AsFloat;

   Clear;
   Add('update produtos set saldoatual='+StringReplace(FloatToStr(SaldoAtual),',','.',[rfReplaceAll]));
   Add(',customedio='+StringReplace(FloatToStr(CustoMedio),',','.',[rfReplaceAll]));
   Add('where id='+idProduto);
   ExecSQL;
 end;
end;

procedure TdbCtx.AtaulizaValorMedioProduto(idNota,idProduto, dataEntrada: string);
var
 vQryAux:TFDQuery;
 TotalItensEntradaGeral,
 TotalValorEntradaGeral,
 TotalItensSaidaGeral,
 TotalValorSaidaGeral,
 ValorSaldoAtual,
 SaldoAtual,
 CustoMedio:Double;
begin
 vQryAux := TFDQuery.Create(nil);
 vQryAux.Connection := FDConPG;
 with vQryAux,vQryAux.SQL do
 begin
   Clear;
   Add('select totalEntrada-totalSaid saldo from');
   Add('(select');
   Add('(select coalesce(sum(qtditens),0) from notafiscalitems');
   Add('where status=1 and idproduto='+idProduto+')totalEntrada,');
   Add('(select  coalesce(sum(qtditens),0) from estoquesaida');
   Add('where status=1 and idproduto='+idProduto+') totalSaid');
   Add('from estoqueentrada limit 1)y');
   Open;
   SaldoAtual := FieldByName('saldo').AsFloat;

   Clear;
   Add('select (sum(y.vl1)/sum(qtditens)) valormedio from');
   Add('(select');
   Add(' (e.qtditens * (e.valortotalnf/e.qtditens))vl1,');
   Add(' e.qtditens');
   Add('from notafiscalitems e');
   Add('where status=1 and e.idproduto='+idProduto+')y');// and a.datasaidaestoque<='+dataEntrada.QuotedString);
   Open;
   CustoMedio := FieldByName('valormedio').AsFloat;

   if dbCtx.RetornaRegistoCustoDia(idProduto,DataEntrada) then
   begin
     Clear;
     Add('INSERT INTO histvalorproduto(idnota,idusuario,datavalor,idproduto,valoratual)values(');
     Add(idNota+',');
     Add(dbCtx.vIdUsuarioLogado+',');
     Add(dataEntrada.QuotedString+',');
     Add(idProduto+',');
     Add(StringReplace(FloatToStr(CustoMedio),',','.',[rfReplaceAll]));
     Add(')');
     vQryAux.SQL.Text;
     ExecSQL;

     Clear;
     Add('update histvalorproduto set valoratual='+StringReplace(FloatToStr(CustoMedio),',','.',[rfReplaceAll]));
     Add('where idnota='+idNota);
     ExecSQL;

     Clear;
     Add('update produtos set saldoatual='+StringReplace(FloatToStr(SaldoAtual),',','.',[rfReplaceAll]));
     Add(',customedio='+StringReplace(FloatToStr(CustoMedio),',','.',[rfReplaceAll]));
     Add('where id='+idProduto);
     ExecSQL;
   end
   else
   begin
     Clear;
     Add('update histvalorproduto set valoratual='+StringReplace(FloatToStr(CustoMedio),',','.',[rfReplaceAll]));
     Add('where idnota='+idNota);
     ExecSQL;

     Clear;
     Add('update produtos set saldoatual='+StringReplace(FloatToStr(SaldoAtual),',','.',[rfReplaceAll]));
     Add(',customedio='+StringReplace(FloatToStr(CustoMedio),',','.',[rfReplaceAll]));
     Add('where id='+idProduto);
     ExecSQL;
   end;
 end;
end;

procedure TdbCtx.AtaulizaValorMedioProdutoGeral;
var
 vQryAux,vQryC:TFDQuery;
 TotalItensEntradaGeral,
 TotalValorEntradaGeral,
 TotalItensSaidaGeral,
 TotalValorSaidaGeral,
 ValorSaldoAtual,
 SaldoAtual,
 CustoMedio:Double;
begin
 vQryAux := TFDQuery.Create(nil);
 vQryAux.Connection := FDConPG;

 vQryC := TFDQuery.Create(nil);
 vQryC.Connection := FDConPG;

 with vQryC,vQryC.SQL do
 begin
   Clear;
   Add('select distinct b.idproduto from notafiscalitems b');
   Add('where idproduto=179');
   Open;
   while not vQryC.eof do
   begin
     with vQryAux,vQryAux.SQL do
     begin
       Clear;
       Add('SELECT');
       Add('sum(a.qtditens) TotalItens,SUM(A.valortotalnf)TotalaValor');
       Add('FROM notafiscalitems A');
       Add('join estoqueentrada b on b.id=a.idnota');
       Add('WHERE a.status=1');//and b.dataentradaestoque<='+
//       FormatDateTime('yyyy-mm-dd',vQryC.FieldByName('dataentradaestoque').AsDateTime).QuotedString);
       Add('and a.idproduto='+vQryC.FieldByName('idproduto').AsString);
       Open;
       if not IsEmpty then
       begin
        TotalItensEntradaGeral:= FieldByName('TotalItens').AsFloat;
        TotalValorEntradaGeral:= FieldByName('TotalaValor').AsFloat;
       end
       else
       begin
        TotalItensEntradaGeral:= 0;
        TotalValorEntradaGeral:= 0;
       end;

       Clear;
       Add('SELECT');
       Add('sum(a.qtditens)QtdItensSaida ,(sum(a.qtditens)*avg(A.valorsaida)) TotalSaida');
       Add('FROM estoquesaida A');
       Add('WHERE a.status=1');
//       Add('and a.datasaidaestoque<='+
//       FormatDateTime('yyyy-mm-dd',vQryC.FieldByName('dataentradaestoque').AsDateTime).QuotedString);
       Add('and a.idproduto='+vQryC.FieldByName('idproduto').AsString);
       Open;
       if not IsEmpty then
       begin
        TotalItensSaidaGeral  := FieldByName('QtdItensSaida').AsFloat;
        TotalValorSaidaGeral  := FieldByName('TotalSaida').AsFloat;
       end
       else
       begin
        TotalItensSaidaGeral  := 0;
        TotalValorSaidaGeral  := 0;
       end;

       ValorSaldoAtual := TotalValorEntradaGeral-TotalValorSaidaGeral;

       SaldoAtual := TotalItensEntradaGeral-TotalItensSaidaGeral;

       if(SaldoAtual>0) and (TotalValorEntradaGeral>0) then
         CustoMedio := (ValorSaldoAtual/SaldoAtual)
       else
        CustoMedio :=0;

        Clear;
        Add('update produtos set saldoatual='+StringReplace(FloatToStr(SaldoAtual),',','.',[rfReplaceAll]));
        Add(',customedio='+StringReplace(FloatToStr(CustoMedio),',','.',[rfReplaceAll]));
        Add('where id='+vQryC.FieldByName('idproduto').AsString);
        ExecSQL;
     end;
     vQryC.Next;
   end;
 end;
end;


procedure TdbCtx.AtualizaSaldoContrato(idContrato: string);
var
 vQryAux:TFDQuery;
 vVolumeTotal,vVolumeSC:double;
 vVolumeTotalS,vVolumeSCS:string;
begin
 vQryAux := TFDQuery.Create(nil);
 vQryAux.Connection := FDConPG;
 with vQry,vQry.SQL do
 begin
   Clear;
   Add('select coalesce(sum(liquido),0)Totalliquido from embarque');
   Add('where status=1 and idContrato='+idContrato);
   Open;
   vVolumeTotal := FieldByName('Totalliquido').AsFloat;

   if vVolumeTotal>0 then
     vVolumeSC := vVolumeTotal/60
   else
    vVolumeSC := 0;

   vVolumeTotalS := FloatToStr(vVolumeTotal);
   vVolumeSCS    := FloatToJson(vVolumeSC);

//   vVolumeTotalS := StringReplace(vVolumeTotalS,'.','',[rfReplaceAll]);
//   vVolumeSCS    := StringReplace(vVolumeSCS,'.','',[rfReplaceAll]);

   vVolumeTotalS := StringReplace(vVolumeTotalS,',','.',[rfReplaceAll]);
   vVolumeSCS    := StringReplace(vVolumeSCS,',','.',[rfReplaceAll]);

   Clear;
   Add('update contratos set totalembarquevolume='+vVolumeTotalS);
   Add(',totalembarquesacos='+vVolumeSCS);
   Add('where id='+idContrato);
   ExecSQL;
 end;
 vQryAux.Free;
end;

procedure TdbCtx.AtualizaSequencias;
begin
 with ScriptSetSequnce do
 begin
  try
   ValidateAll;
   ExecuteAll;
  except
   on e : Exception do
   begin
    ShowMessage(e.Message);
   end;
  end;
 end;
end;

procedure TdbCtx.AtualizaStatusContrato(idContrato,Status: string);
var
 vQryAux:TFDQuery;
begin
 vQryAux := TFDQuery.Create(nil);
 vQryAux.Connection := FDConPG;
 with vQry,vQry.SQL do
 begin
   Clear;
   Add('update contratos set status='+Status);
   Add(',idusuarioalteracao='+vIdUsuarioLogado);
   Add(',dataalteracao=current_timestamp');
   Add('where id='+idContrato);
   ExecSQL;
 end;
 vQryAux.Free;
end;

procedure TdbCtx.AtualizaStatusExluido(vIdPedido: string);
var
 vMAX:string;
begin
  with vQry,vQry.SQL do
 begin
   Clear;
   Add('select max(idstatus)vMax from pedidostatus where status=1 and idpedido='+vIdPedido);
   Open;
   vMAX := FieldByName('vMax').AsString;

   Clear;
   Add('update pedidocompra set status='+vMAX);
   if vMAX='0' then
    Add(',cancelado=1')
   else
    Add(',cancelado=0');
   Add('where id='+vIdPedido);
   ExecSQL;
 end;
end;

procedure TdbCtx.AtualizaStatusPedido(idPedido, status: string);
begin
with vQry,vQry.SQL do
 begin
   Clear;
   Add('update pedidocompra set status='+status);
   Add('where id='+idPedido);
   ExecSQL;
 end;
end;

procedure TdbCtx.AtualizaValorItemOrcamento(vValor, vId: string);
var
 valor:string;
begin
 valor := StringReplace(vValor,'.','',[rfReplaceAll]);
 valor := StringReplace(valor,',','.',[rfReplaceAll]);
 with vQry,vQry.SQL do
 begin
  Clear;
  Add('update orcamentositens set valorunidade='+valor);
  Add(',valorTotal='+Valor+'*qtde');
  Add('where id='+vId);
  try
   ExecSQL
  except
   on E : Exception do
    frmPrincipal.MyShowMessage('Erro :'+E.Message,false);
  end;
 end;
end;

procedure TdbCtx.AtualizaValorIten(idItem,icmst,desconto,frete,ipi,diferencialalicota: string);
begin
 if icmst.Length=0 then              icmst:='0';
 if desconto.Length=0 then           desconto:='0';
 if frete.Length=0 then              frete:='0';
 if ipi.Length=0 then                ipi:='0';
 if diferencialalicota.Length=0 then diferencialalicota:='0';
 with vQry,vQry.SQL do
 begin
   Clear;
   Add('update orcamentositens  set');
   Add('icmst='+StringReplace(icmst,',','.',[rfReplaceAll])+',');
   Add('desconto='+StringReplace(desconto,',','.',[rfReplaceAll])+',');
   Add('frete='+StringReplace(frete,',','.',[rfReplaceAll])+',');
   Add('ipi='+StringReplace(ipi,',','.',[rfReplaceAll])+',');
   Add('diferencialalicota='+StringReplace(diferencialalicota,',','.',[rfReplaceAll]));
   Add('where id='+idItem);
   ExecSQL;
 end;
end;

procedure TdbCtx.AbreOcorrenciaOperacao(vIdOperacao: string);
begin
 with qryOcorrenciaOperacao,qryOcorrenciaOperacao.SQL do
 begin
   Clear;
   Add('select a.*,b.nome TipoOcorrencia from DetOperacaoSafraTalhaoOcorrencia a');
   Add('join auxtipoocorrencia b on a.idtipoocorrencia=b.id');
   Add('where a.status=1 and idoperacaotalhao='+vIdOperacao);
   Open;
 end;
end;

procedure TdbCtx.CancelaPedido(idPedido: string);
begin
with vQry,vQry.SQL do
 begin
   Clear;
   Add('update pedidocompra set cancelado=1');
   Add('where id='+idPedido);
   ExecSQL;
 end;
end;

function TdbCtx.LerIni(Diretorio,Chave1, Chave2, ValorPadrao: String): String;
var
 FileIni: TIniFile;
begin
  result := ValorPadrao;
  try
    FileIni := TIniFile.Create(Diretorio);
    if FileExists(Diretorio) then
      result := FileIni.ReadString(Chave1, Chave2, ValorPadrao);
  finally
    FreeAndNil(FileIni)
  end;
end;

procedure TdbCtx.ConectaPG_AWS;
var
 Arquivo,
 vDataBase,vServer,vUser_name,vPassword,vPorta :string;
begin
  Arquivo := ExtractFilePath(ParamStr(0))+'Fort.ini';
  if not FileExists(Arquivo) then
  begin
    ShowMessage('Arquivo Fort.ini n�o localizado no seguinte diretorio:'+#13+
    Arquivo);
    Exit;
  end
  else
  begin
    vDataBase    := LerIni(Arquivo,'LOCAL','Database','');
    vServer      := LerIni(Arquivo,'LOCAL','Server','');
    vUser_name   := LerIni(Arquivo,'LOCAL','UserName','');
    vPassword    := LerIni(Arquivo,'LOCAL','Password','');
    vPorta       := LerIni(Arquivo,'LOCAL','Port','');
    vURLMetabase := LerIni(Arquivo,'LOCAL','urlmetabase','');
    DataModule1.srvDtSanap := LerIni(Arquivo,'LOCAL','DtSnap','');
    DataModule2.srvDtSanap := LerIni(Arquivo,'LOCAL','DtSnap','');
  end;
  frmPrincipal.lblPathDB.Text := vServer+':'+vDataBase;
  FDConPG.Connected := false;
  FDConPG.Close;
  FDConPG.DriverName              :='PG';
  FDConPG.Params.Database         :=vDataBase;
  FDConPG.Params.UserName         :=vUser_name;
  FDConPG.Params.Password         :=vPassword;
//  FDConPG.Params.Values['Server'] :='server2012';
//  FDConPG.Params.Password         :='Dev#110485';
  FDConPG.Params.Values['Server'] :=vServer;
  FDConPG.Params.Values['Port']   :=vPorta;
  PgDriverLink.VendorLib          := ExtractFilePath(ParamStr(0))+'DrivesDB\libpq_32.dll';
  try
   FDConPG.Connected := true;
   AtualizaSequencias;
   TConfig.Close;
   TConfig.Open;
   if TConfigagricultura.AsInteger=1 then
   begin
    frmPrincipal.lblMenu.Text :='Agricultura';
    vTipoDB :=1
   end
   else
   begin
    frmPrincipal.lblMenu.Text :='Pecuaria';
    vTipoDB :=0;
   end;
  except
   on E : Exception do
    frmPrincipal.MyShowMessage('Erro ao se Conectar ao PG:'+E.Message,false);
  end;
end;


procedure TdbCtx.ContratosReconcileError(DataSet: TFDDataSet; E: EFDException;
  UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
begin
  ShowMessage(e.Message);
end;

procedure TdbCtx.DeletaComparativo;
begin
 with vQry,vQry.SQL do
 begin
   Clear;
   Add('delete from orcamentocomparativo ');
   ExecSQL;
   FDConPG.Commit;
 end;
end;

procedure TdbCtx.DeletaPedido(idPedido: string);
begin
 with vQry,vQry.SQL do
 begin
   Clear;
   Add('update pedidocompra set status=-1');
   Add(' ,dataalteracao= current_date');
   Add(' ,idusuarioalteracao='+vIdUsuarioLogado);
   Add('where ID='+idPedido);
   ExecSQL;
   FDConPG.Commit;
 end;
end;

procedure TdbCtx.DescataOrcamentos(IdPedido: string);
begin
  with vQry,vQry.SQL do
 begin
   Clear;
   Add('update orcamentos set status=2,syncaws=0');
   Add('where idpedido='+IdPedido+' and status<>3');
   ExecSQL;
   FDConPG.Commit;
 end;
end;

procedure TdbCtx.EmbarqueReconcileError(DataSet: TFDDataSet; E: EFDException;
  UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
begin
 ShowMessage(e.Message);
end;

procedure TdbCtx.FinalizaOperacao(vIdOperacao: string);
begin
 with vQry,vQry.SQL do
 begin
   Clear;
   Add('UPDATE operacaosafratalhao SET status=2');
   Add(',idusuarioalteracao='+dbCtx.vIdUsuarioLogado);
   Add(',dataalteracao=current_date');
   Add('where id='+vIdOperacao);
   ExecSQL;
 end;
end;

procedure TdbCtx.InsereSaidaAbastecimento(dataSaida, idcentrocusto,
  idlocalestoque, idproduto, qtditens, idresponsavel: string);
var
 vValorCustoMedio:string;
begin
 with vQry,vQry.SQL do
 begin
   Clear;
   Add('select * from histvalorproduto a');
   Add('where a.idproduto='+idproduto);
   Add('order by a.datavalor desc');
   Add('limit 1');
   Open;
   vValorCustoMedio := FieldByName('valoratual').AsString;
   if vValorCustoMedio.Length=0 then
    vValorCustoMedio:='0';

   Clear;
   Add('insert into estoquesaida(datasaidaestoque,idcentrocusto,idlocalestoque,idproduto,qtditens,idresponsavel,valorsaida)');
   Add('values(');
   Add(dataSaida.QuotedString+',');
   Add(idcentrocusto+',');
   Add(idlocalestoque+',');
   Add(idproduto+',');
   Add(qtditens+',');
   Add(idresponsavel+',');
   Add(StringReplace(vValorCustoMedio,',','.',[rfReplaceAll])+')');
   ExecSQL;

   AtaulizaSaldoAtualCustoMedio(idproduto);
 end;
end;

procedure TdbCtx.InsereStatusInicial(idPedido: string);
begin
 TStatusPedido.Close;
 TStatusPedido.Open;
 TStatusPedido.Insert;
 TStatusPedidodatastatus.AsDateTime := now;
 TStatusPedidoidstatus.AsInteger    := 1;
 TStatusPedidoidusuario.AsString    := vIdUsuarioLogado;
 TStatusPedidoidpedido.AsString     := idPedido;

 if dbCtx.vTipoBDConfig=2 then
  TStatusPedidosyncFaz.AsInteger :=1
 else
  TStatusPedidosyncFaz.AsInteger :=0;

 try
  TStatusPedido.ApplyUpdates(-1);
 except
  on E: Exception do
    ShowMessage('Erro ao salvar Status:'+E.Message);
  end;
end;

function TdbCtx.MD55(const texto: string): string;
var
  idmd5 : TIdHashMessageDigest5;
begin
  idmd5 := TIdHashMessageDigest5.Create;
  try
    result := idmd5.HashStringAsHex(texto);
  finally
    idmd5.Free;
  end;
end;



function TdbCtx.RetornaCustoMedioProduto(idProduto: string): Double;
begin
 with vQry,vQry.SQL do
 begin
   Clear;
   Add('select coalesce(valoratual,0)valoratual from histvalorproduto');
   Add('where idproduto='+idProduto);
   Add('order by datavalor desc limit 1');
   Open;
   Result :=FieldByName('valoratual').AsFloat;
 end;
end;

function TdbCtx.RetornaIdMaxNota: string;
begin
 with vQry,vQry.SQL do
 begin
   Clear;
   Add('select max(id) max_id from estoqueentrada');
   Open;
   Result := FieldByName('max_id').AsString;
 end;
end;

function TdbCtx.RetornaIdOperacao(id: string): string;
begin
 with vQry,vQry.SQL do
 begin
   Clear;
   Add('select * from operacaosafratalhao');
   Add('where id='+id);
   Open;
   if FieldByName('idoperacao').AsString='1' then
    begin
      frmQuadroAtividades.tabAuxCad.ActiveTab   := frmQuadroAtividades.tbiSolidos;
      TAuxTipoOperacaoSolido.Close;
      TAuxTipoOperacaoSolido.Open;
      frmQuadroAtividades.layAuxiliares.Visible := true;
    end;
    if FieldByName('idoperacao').AsString='2' then
    begin
      frmQuadroAtividades.tabAuxCad.ActiveTab   := frmQuadroAtividades.tbiPuverizacao;
      TAuxCulturas.Close;
      TAuxCulturas.Open;
      frmQuadroAtividades.layAuxiliares.Visible := true;
    end;
    if FieldByName('idoperacao').AsString='3' then
    begin
      frmQuadroAtividades.tabAuxCad.ActiveTab   := frmQuadroAtividades.tbiPlantio;
      TAuxCulturas.Close;
      TAuxCulturas.Open;
      TAuxCobertura.Close;
      TAuxCobertura.Open;
      frmQuadroAtividades.layAuxiliares.Visible := true;
    end;
     Result :=FieldByName('idoperacao').AsString;
 end;
end;

function TdbCtx.RetornaMaxId(AnomeTabela: string): string;
begin
 with vQry,vQry.SQL do
 begin
   Clear;
   Add('select max(id) maxid from '+AnomeTabela);
   Open;
   if FieldByName('maxid').AsString.Length=0 then
    Result :='1'
   else
    Result :=FieldByName('maxid').AsString;
 end;
end;

function TdbCtx.RetornaMaxIdPedido: string;
begin
 with vQry,vQry.SQL do
 begin
   Clear;
   Add('select max(id) maxid from orcamentos');
   Open;
   if FieldByName('maxid').AsString.Length=0 then
    Result :='1'
   else
    Result :=FieldByName('maxid').AsString;
 end;
end;

function TdbCtx.RetornaMaxIdReceituario: string;
begin
 with vQry,vQry.SQL do
 begin
   Clear;
   Add('select max(id)+1 maxid from receiturario');
   Open;
   Result :=FieldByName('maxid').AsString;
 end;
end;

function TdbCtx.RetornaMaxPedido: string;
begin
 with vQry,vQry.SQL do
 begin
   Clear;
   Add('select max(id) maxid from pedidocompra where status>-1');
   Open;
   if FieldByName('maxid').AsString.Length=0 then
    Result :='1'
   else
    Result :=FieldByName('maxid').AsString;
 end;
end;

function TdbCtx.RetornaNomeResponsavel(Id: string): string;
begin
 with vQry,vQry.SQL do
 begin
   Clear;
   Add('select * from usuario');
   Add('where id='+id);
   Open;
   Result := vQry.FieldByName('Nome').AsString;
 end;
end;

function TdbCtx.RetornaRegistoCustoDia(idProduto, DataEntrada: string): Boolean;
begin
 with vQry,vQry.SQL do
 begin
   Clear;
   Add('select * from histvalorproduto');
   Add('where idproduto='+idProduto);
   Add('and datavalor='+DataEntrada.QuotedString);
   Open;
   Result := vQry.IsEmpty;
 end;
end;

function TdbCtx.RetornaValorItemOrecamento(idProduto, idOrcamento,
  IdFornecedor: string): string;
begin
 with vQry,vQry.SQL do
 begin
   Clear;
   Add('select * from orcamentositens a');
   Add('join orcamentos b on a.idorcamento=b.id');
   Add('where idproduto='+idProduto);
   Add('and idorcamento='+idOrcamento);
   Add('and idFornecedor='+IdFornecedor);
   Open;
   if not IsEmpty then
    Result := FormatFloat('R$ ###,##0.00',vQry.FieldByName('valorunidade').AsFloat)
   else
    Result := '';
 end;
end;

procedure TdbCtx.TAbastecimentoOutrosReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
 ShowMessage(e.Message);
end;

procedure TdbCtx.TAbastecimentoReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
 ShowMessage(e.Message);
end;

procedure TdbCtx.TAuxCategoriasReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
 ShowMessage(e.Message);
end;

procedure TdbCtx.TDetReceituarioReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
 ShowMessage(e.Message);
end;

procedure TdbCtx.TEstoqueEntradaReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
 ShowMessage(e.Message);
end;

procedure TdbCtx.TFornecedoresReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
 ShowMessage(e.Message);
end;

procedure TdbCtx.TItensPedidoReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
  ShowMessage(e.Message);
end;

procedure TdbCtx.TLocalEstoqueReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
 ShowMessage(e.Message);
end;

procedure TdbCtx.TMaquinasReconcileError(DataSet: TFDDataSet; E: EFDException;
  UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
begin
 ShowMessage(e.Message);
end;

procedure TdbCtx.TOcorrenciaOperacaoReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
 ShowMessage(e.Message);
end;

procedure TdbCtx.TOperacaoSafraTalhaoReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
 ShowMessage(e.Message);
end;

procedure TdbCtx.TOperacaoSafraTalhaoUpdateError(ASender: TDataSet;
  AException: EFDException; ARow: TFDDatSRow; ARequest: TFDUpdateRequest;
  var AAction: TFDErrorAction);
begin
 ShowMessage(AException.Message);
end;

procedure TdbCtx.TPedidoCompraReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
 ShowMessage(e.Message);
end;

procedure TdbCtx.TProdutosReconcileError(DataSet: TFDDataSet; E: EFDException;
  UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
begin
 ShowMessage(e.Message);
end;

procedure TdbCtx.TReceituarioReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
 ShowMessage(e.Message);
end;

procedure TdbCtx.TStatusPedidoReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
 ShowMessage(e.Message);
end;

procedure TdbCtx.TUsuarioReconcileError(DataSet: TFDDataSet; E: EFDException;
  UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
begin
 ShowMessage(e.Message);
end;

function TdbCtx.ValidaUsuario(Usuario, Senha: string): Boolean;
var
 vSenha:string;
begin
 ConectaPG_AWS;
 vSenha := MD55(Senha);
 with vQry,vQry.SQL do
 begin
   Clear;
   Add('SELECT * FROM USUARIO');
   Add('WHERE USUARIO=:USUARIO AND SENHA=:SENHA');
   Add('ORDER BY NOME');
   ParamByName('USUARIO').AsString := Usuario;
   ParamByName('SENHA').AsString   := vSenha;
   Open;
   vIdUsuarioLogado := vQry.FieldByName('id').AsString;
   vIdSegmento      := vQry.FieldByName('idsegmento').AsString;
   Result := vQry.IsEmpty;
 end;
end;

function TdbCtx.VerificaCadastroExiste(ACampo, ATabela, Anome: string): Boolean;
begin
 with vQry,vQry.SQL do
 begin
   Clear;
   Add('SELECT * FROM '+ATabela);
   Add('WHERE Status=1 AND '+ACampo+' = '+Anome.QuotedString);
   Open;
   Result :=vQry.IsEmpty;
 end;
end;

function TdbCtx.VerificaContratoExiste(Numero: string): Boolean;
begin
 with vQry,vQry.SQL do
 begin
   Clear;
   Add('select * from contratos');
   Add('WHERE Status=1 AND numerocontrato='+Numero.QuotedString);
   Open;
 end;
 Result := vQry.IsEmpty;
end;

function TdbCtx.VerificaExisteGenerico(AnomeTabela, AnomeCampo,
  AValorStr: string): Boolean;
begin
 with vQry,vQry.SQL do
 begin
   Clear;
   Add('select * from '+AnomeTabela);
   Add('WHERE Status=1 AND '+AnomeCampo+'='+AValorStr.QuotedString);
   Open;
 end;
 Result := vQry.IsEmpty;
end;

function TdbCtx.VerificaExistePluviometria(AData,AIdPluvi: string): Boolean;
begin
 with vQry,vQry.SQL do
 begin
   Clear;
   Add('select * from pluviometria s');
   Add('where dataColeta='+FormatDateTime('yyyy-mm-dd',strToDate(Adata)).QuotedString);
   Add('and idpluviometro='+AIdPluvi);
   Open;
 end;
 Result := vQry.IsEmpty;
end;

function TdbCtx.VerificaItemPedido(vIdPedido, vIdItem: string): Boolean;
begin
 with vQry,vQry.SQL do
 begin
   Clear;
   Add('select * from pedidocompraitems');
   Add('WHERE Status=1 AND idpedido='+vIdPedido);
   Add('and iditem='+vIdItem);
   Open;
 end;
 Result := vQry.IsEmpty;
end;

function TdbCtx.VerificaPendenciaOperacao(vIdOperacao: string): string;
begin
 with vQry,vQry.SQL do
 begin
   Clear;
   Add('SELECT * FROM operacaosafratalhao');
   Add('WHERE id='+vIdOperacao);
   Open;
   if FieldByName('datafim').AsString.Length=0 then
   begin
     Result:='Informe a Data Final da Opera��o';
     Exit;
   end;
   if (FieldByName('arearealizada').AsString.Length=0) or
   (FieldByName('arearealizada').AsString='0')
   then
   begin
     Result:='Informe a Area Realizada da Opera��o';
     Exit;
   end;
   Result :='OK';
 end;
end;

function TdbCtx.VerificaSafraVigente: Boolean;
begin
 with vQry,vQry.SQL do
 begin
   Clear;
   Add('SELECT * FROM safra');
   Add('WHERE Status=1');
   Open;
   Result :=vQry.IsEmpty;
 end;
end;

function TdbCtx.VerificaSetorExiste(idArea, NomeSetor: string): Boolean;
begin
 with vQry,vQry.SQL do
 begin
   Clear;
   Add('SELECT * FROM setor');
   Add('WHERE Status=1 AND idarea='+idArea);
   Add('AND nome='+NomeSetor.QuotedString);
   Open;
   Result :=vQry.IsEmpty;
 end;
end;

function TdbCtx.VerificaTalhaoExiste(idSetor, NomeTalhao: string): Boolean;
begin
 with vQry,vQry.SQL do
 begin
   Clear;
   Add('SELECT * FROM talhoes');
   Add('WHERE Status=1 AND idsetor='+idSetor);
   Add('AND nome='+NomeTalhao.QuotedString);
   Open;
   Result :=vQry.IsEmpty;
 end;
end;

function TdbCtx.VerificaTalhaoPluviAdicionado(idTalhao: string): Boolean;
begin
 with vQry,vQry.SQL do
 begin
   Clear;
   Add('SELECT * FROM PluviometroTalhoes');
   Add('WHERE Status=1 AND idTalhao='+idTalhao);
   Open;
   Result :=vQry.IsEmpty;
 end;
end;

function TdbCtx.VerificaTalhaoPluviometro(idPluvi, idTalhao: string): Boolean;
begin
 with vQry,vQry.SQL do
 begin
   Clear;
   Add('select * from pluviometrotalhoes a');
   Add('where status=1 and a.idpluviometro='+idPluvi+' and a.idtalhao='+idTalhao);
   Open;
   Result :=vQry.IsEmpty;
 end;
end;

end.
