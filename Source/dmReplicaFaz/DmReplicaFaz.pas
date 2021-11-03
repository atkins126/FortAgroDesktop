unit DmReplicaFaz;

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
  TDataModule2 = class(TDataModule)
    TUsuario: TFDQuery;
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
    TUsuarioidsegmento: TIntegerField;
    TUsuariosyncaws: TIntegerField;
    TUsuarioagronomo: TIntegerField;
    TUsuarioabastecimento: TIntegerField;
    lHTTP1: TIdHTTP;
    TProdutos: TFDQuery;
    TAuxMarca: TFDQuery;
    TAuxMarcaid: TIntegerField;
    TAuxMarcastatus: TIntegerField;
    TAuxMarcadatareg: TSQLTimeStampField;
    TAuxMarcaidusuario: TIntegerField;
    TAuxMarcadataalteracao: TSQLTimeStampField;
    TAuxMarcaidusuarioalteracao: TIntegerField;
    TAuxMarcanome: TWideStringField;
    TAuxMarcaidsegmento: TIntegerField;
    TAuxMarcasyncaws: TIntegerField;
    TAuxGrupo: TFDQuery;
    TAuxGrupoid: TIntegerField;
    TAuxGrupostatus: TIntegerField;
    TAuxGrupodatareg: TSQLTimeStampField;
    TAuxGrupoidusuario: TIntegerField;
    TAuxGrupodataalteracao: TSQLTimeStampField;
    TAuxGrupoidusuarioalteracao: TIntegerField;
    TAuxGruponome: TWideStringField;
    TAuxGrupoidsegmento: TIntegerField;
    TAuxGruposyncaws: TIntegerField;
    TAuxSubGrupo: TFDQuery;
    TAuxSubGrupoid: TIntegerField;
    TAuxSubGrupostatus: TIntegerField;
    TAuxSubGrupodatareg: TSQLTimeStampField;
    TAuxSubGrupoidusuario: TIntegerField;
    TAuxSubGrupodataalteracao: TSQLTimeStampField;
    TAuxSubGrupoidusuarioalteracao: TIntegerField;
    TAuxSubGruponome: TWideStringField;
    TAuxSubGrupoidsegmento: TIntegerField;
    TAuxSubGruposyncaws: TIntegerField;
    TAuxCategorias: TFDQuery;
    TAuxCategoriasid: TIntegerField;
    TAuxCategoriasstatus: TIntegerField;
    TAuxCategoriasdatareg: TSQLTimeStampField;
    TAuxCategoriasidusuario: TIntegerField;
    TAuxCategoriasdataalteracao: TSQLTimeStampField;
    TAuxCategoriasidusuarioalteracao: TIntegerField;
    TAuxCategoriasnome: TWideStringField;
    TAuxCategoriasidsegmento: TIntegerField;
    TAuxCategoriassyncaws: TIntegerField;
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
    TProdutoscodigobarras: TWideStringField;
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
    TProdutossyncaws: TIntegerField;
    TProdutosdefensivos: TIntegerField;
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
    TFornecedoressenha: TWideStringField;
    TFornecedoresrazaosocial: TWideStringField;
    TFornecedoresinscricaoestadual: TWideStringField;
    TFornecedoressyncaws: TIntegerField;
    TAuxTipoMaqVeic: TFDQuery;
    TAuxTipoMaqVeicid: TIntegerField;
    TAuxTipoMaqVeicstatus: TIntegerField;
    TAuxTipoMaqVeicdatareg: TSQLTimeStampField;
    TAuxTipoMaqVeicidusuario: TIntegerField;
    TAuxTipoMaqVeicdataalteracao: TSQLTimeStampField;
    TAuxTipoMaqVeicidusuarioalteracao: TIntegerField;
    TAuxTipoMaqVeicnome: TWideStringField;
    TAuxTipoMaqVeicidsegmento: TIntegerField;
    TAuxTipoMaqVeicsyncaws: TIntegerField;
    TMaquinas: TFDQuery;
    TAuxCulturas: TFDQuery;
    TAuxCulturasid: TIntegerField;
    TAuxCulturasstatus: TIntegerField;
    TAuxCulturasdatareg: TSQLTimeStampField;
    TAuxCulturasidusuario: TIntegerField;
    TAuxCulturasdataalteracao: TSQLTimeStampField;
    TAuxCulturasidusuarioalteracao: TIntegerField;
    TAuxCulturasnome: TWideStringField;
    TAuxCulturassyncaws: TIntegerField;
    TAuxCultivares: TFDQuery;
    TAuxCultivaresid: TIntegerField;
    TAuxCultivaresstatus: TIntegerField;
    TAuxCultivaresdatareg: TSQLTimeStampField;
    TAuxCultivaresidusuario: TIntegerField;
    TAuxCultivaresdataalteracao: TSQLTimeStampField;
    TAuxCultivaresidusuarioalteracao: TIntegerField;
    TAuxCultivaresnome: TWideStringField;
    TAuxCultivaressyncaws: TIntegerField;
    TAuxCultivaresidtipocultivar: TIntegerField;
    TAuxCultivaresciclo: TIntegerField;
    TAreas: TFDQuery;
    TSetores: TFDQuery;
    TTalhoes: TFDQuery;
    TSafra: TFDQuery;
    TAuxTipoOcorrencia: TFDQuery;
    TAuxTipoOcorrenciaid: TIntegerField;
    TAuxTipoOcorrenciastatus: TIntegerField;
    TAuxTipoOcorrenciadatareg: TSQLTimeStampField;
    TAuxTipoOcorrenciaidusuario: TIntegerField;
    TAuxTipoOcorrenciadataalteracao: TSQLTimeStampField;
    TAuxTipoOcorrenciaidusuarioalteracao: TIntegerField;
    TAuxTipoOcorrencianome: TWideStringField;
    TAuxTipoOcorrenciasyncaws: TIntegerField;
    TOperacaoSafraTalhao: TFDQuery;
    TOcorrenciaOperacao: TFDQuery;
    TMaquinasOperacao: TFDQuery;
    TProdutosOperacao: TFDQuery;
    TReceituario: TFDQuery;
    TDetReceituario: TFDQuery;
    TPedidoCompra: TFDQuery;
    TItensPedido: TFDQuery;
    TStatusPedido: TFDQuery;
    TAuxTipoServico: TFDQuery;
    TAuxTipoServicoid: TIntegerField;
    TAuxTipoServicostatus: TIntegerField;
    TAuxTipoServicodatareg: TSQLTimeStampField;
    TAuxTipoServicoidusuario: TIntegerField;
    TAuxTipoServicodataalteracao: TSQLTimeStampField;
    TAuxTipoServicoidusuarioalteracao: TIntegerField;
    TAuxTipoServiconome: TWideStringField;
    TAuxTipoServicoidsegmento: TIntegerField;
    TAuxTipoServicosyncaws: TIntegerField;
    TServico: TFDQuery;
    TOrcamento: TFDQuery;
    TItensOrcamento: TFDQuery;
    TAuxCobertura: TFDQuery;
    TAuxCoberturaid: TIntegerField;
    TAuxCoberturastatus: TIntegerField;
    TAuxCoberturadatareg: TSQLTimeStampField;
    TAuxCoberturaidusuario: TIntegerField;
    TAuxCoberturadataalteracao: TSQLTimeStampField;
    TAuxCoberturaidusuarioalteracao: TIntegerField;
    TAuxCoberturanome: TWideStringField;
    TAuxCoberturasyncaws: TIntegerField;
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
    TServicodataprevista: TDateField;
    TServicosyncaws: TIntegerField;
    TAreasid: TIntegerField;
    TAreasstatus: TIntegerField;
    TAreasdatareg: TSQLTimeStampField;
    TAreasidusuario: TIntegerField;
    TAreasdataalteracao: TSQLTimeStampField;
    TAreasidusuarioalteracao: TIntegerField;
    TAreasnome: TWideStringField;
    TAreasareahe: TBCDField;
    TAreasidresponsavel: TIntegerField;
    TAreassyncaws: TIntegerField;
    TSetoresid: TIntegerField;
    TSetoresstatus: TIntegerField;
    TSetoresdatareg: TSQLTimeStampField;
    TSetoresidusuario: TIntegerField;
    TSetoresdataalteracao: TSQLTimeStampField;
    TSetoresidusuarioalteracao: TIntegerField;
    TSetoresnome: TWideStringField;
    TSetoresareahe: TBCDField;
    TSetoresidarea: TIntegerField;
    TSetoressyncaws: TIntegerField;
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
    TMaquinasprefixo: TWideStringField;
    TMaquinasidcategoria: TIntegerField;
    TMaquinasidsegmento: TIntegerField;
    TMaquinasanomodelo: TIntegerField;
    TMaquinassyncaws: TIntegerField;
    TSafraid: TIntegerField;
    TSafrastatus: TIntegerField;
    TSafradatareg: TSQLTimeStampField;
    TSafraidusuario: TIntegerField;
    TSafradataalteracao: TSQLTimeStampField;
    TSafraidusuarioalteracao: TIntegerField;
    TSafranome: TWideStringField;
    TSafradatainicio: TDateField;
    TSafradatafim: TDateField;
    TSafraobservacao: TWideStringField;
    TSafrasyncaws: TIntegerField;
    TReceituarioid: TIntegerField;
    TReceituariostatus: TIntegerField;
    TReceituariodatareg: TSQLTimeStampField;
    TReceituarioidusuario: TIntegerField;
    TReceituariodataalteracao: TSQLTimeStampField;
    TReceituarioidusuarioalteracao: TIntegerField;
    TReceituarionome: TWideStringField;
    TReceituarioidresponsavel: TIntegerField;
    TReceituariosyncaws: TIntegerField;
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
    TOperacaoSafraTalhaoobservacao: TWideStringField;
    TOperacaoSafraTalhaoidtalhao: TIntegerField;
    TOperacaoSafraTalhaoidresponsavel: TIntegerField;
    TOperacaoSafraTalhaoareaprevista: TBCDField;
    TOperacaoSafraTalhaoarearealizada: TBCDField;
    TOperacaoSafraTalhaotipoterraaereo: TWideStringField;
    TOperacaoSafraTalhaoidtipoaplicacaosolido: TIntegerField;
    TOperacaoSafraTalhaoidcultura: TIntegerField;
    TOperacaoSafraTalhaoidvariedade: TIntegerField;
    TOperacaoSafraTalhaofinalidade: TWideStringField;
    TOperacaoSafraTalhaoidreceituario: TIntegerField;
    TOperacaoSafraTalhaosyncaws: TIntegerField;
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
    TMaquinasOperacaodata: TDateField;
    TMaquinasOperacaohorainicio: TBCDField;
    TMaquinasOperacaohorafim: TBCDField;
    TMaquinasOperacaohoraparada: TBCDField;
    TMaquinasOperacaohorastrabalhada: TBCDField;
    TMaquinasOperacaosyncaws: TIntegerField;
    TMaquinasOperacaoidoperador: TIntegerField;
    TProdutosOperacaoid: TIntegerField;
    TProdutosOperacaostatus: TIntegerField;
    TProdutosOperacaodatareg: TSQLTimeStampField;
    TProdutosOperacaoidusuario: TIntegerField;
    TProdutosOperacaodataalteracao: TSQLTimeStampField;
    TProdutosOperacaoidusuarioalteracao: TIntegerField;
    TProdutosOperacaoidoperacaotalhao: TIntegerField;
    TProdutosOperacaoidproduto: TIntegerField;
    TProdutosOperacaoqtdeutilidado: TBCDField;
    TProdutosOperacaoobservacao: TWideStringField;
    TProdutosOperacaodata: TDateField;
    TProdutosOperacaosyncaws: TIntegerField;
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
    TOcorrenciaOperacaodata: TDateField;
    TOcorrenciaOperacaosyncaws: TIntegerField;
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
    TPedidoCompracancelado: TIntegerField;
    TPedidoCompraidmaquina: TIntegerField;
    TPedidoCompraidservico: TIntegerField;
    TPedidoCompraflagurgente: TIntegerField;
    TPedidoComprasyncaws: TIntegerField;
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
    TFornecedoressyncfaz: TIntegerField;
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
    TTalhoessyncaws: TIntegerField;
    TTalhoessyncfaz: TIntegerField;
    TSetoressyncfaz: TIntegerField;
    TMaquinassyncfaz: TIntegerField;
    TSafrasyncfaz: TIntegerField;
    TReceituariosyncfaz: TIntegerField;
    TDetReceituariosyncfaz: TIntegerField;
    TOperadorMaquinasyncfaz: TIntegerField;
    TAuxTipoCultivaresyncfaz: TIntegerField;
    TOperacaoSafraTalhaosyncfaz: TIntegerField;
    TMaquinasOperacaosyncfaz: TIntegerField;
    TProdutosOperacaosyncfaz: TIntegerField;
    TOcorrenciaOperacaosyncfaz: TIntegerField;
    TPedidoComprasyncfaz: TIntegerField;
    TItensPedidosyncfaz: TIntegerField;
    TStatusPedidosyncfaz: TIntegerField;
    TOrcamentosyncfaz: TIntegerField;
    TItensOrcamentosyncfaz: TIntegerField;
    TAuxCulturassyncfaz: TIntegerField;
    TAuxTipoMaqVeicsyncfaz: TIntegerField;
    TAuxTipoOcorrenciasyncfaz: TIntegerField;
    TAuxTipoServicosyncfaz: TIntegerField;
    TServicosyncfaz: TIntegerField;
    TAuxCoberturasyncfaz: TIntegerField;
    TAuxCultivaressyncfaz: TIntegerField;
    TAreassyncfaz: TIntegerField;
    TAuxGruposyncfaz: TIntegerField;
    TAuxSubGruposyncfaz: TIntegerField;
    TAuxCategoriassyncfaz: TIntegerField;
    TProdutossyncfaz: TIntegerField;
    TAuxMarcasyncfaz: TIntegerField;
    TLocalEstoque: TFDQuery;
    TCentroCusto: TFDQuery;
    TEstoqueEntrada: TFDQuery;
    TLocalEstoqueid: TIntegerField;
    TLocalEstoquestatus: TIntegerField;
    TLocalEstoquedatareg: TSQLTimeStampField;
    TLocalEstoqueidusuario: TIntegerField;
    TLocalEstoquedataalteracao: TSQLTimeStampField;
    TLocalEstoqueidusuarioalteracao: TIntegerField;
    TLocalEstoquenome: TWideStringField;
    TLocalEstoqueidsegmento: TIntegerField;
    TLocalEstoquesyncaws: TIntegerField;
    TLocalEstoquesyncfaz: TIntegerField;
    TCentroCustoid: TIntegerField;
    TCentroCustostatus: TIntegerField;
    TCentroCustodatareg: TSQLTimeStampField;
    TCentroCustoidusuario: TIntegerField;
    TCentroCustodataalteracao: TSQLTimeStampField;
    TCentroCustoidusuarioalteracao: TIntegerField;
    TCentroCustonome: TWideStringField;
    TCentroCustoidsegmento: TIntegerField;
    TCentroCustosyncaws: TIntegerField;
    TCentroCustosyncfaz: TIntegerField;
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
    TOperacaoSafraTalhaoqualidadecobertura: TWideStringField;
    TSetoreslatitude: TWideStringField;
    TSetoreslongitude: TWideStringField;
    TTalhoeslatitude: TWideStringField;
    TTalhoeslongitude: TWideStringField;
    TAreaslatitude: TWideStringField;
    TAreaslongitude: TWideStringField;
    TOperacaoSafraTalhaoidcobertura: TIntegerField;
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
    TDetReceituariofinalidade: TWideStringField;
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
    procedure TAreasReconcileError(DataSet: TFDDataSet; E: EFDException;
      UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
    procedure TDetReceituarioTalhaoReconcileError(DataSet: TFDDataSet;
      E: EFDException; UpdateKind: TFDDatSRowState;
      var Action: TFDDAptReconcileAction);
  private
    procedure MudaFalgAWS(vSql:string);
    procedure AcceptMudaFlagSyncCompras(vSql:string);
  public
    srvDtSanap:string;
    procedure ReplicaAll;

    function ReplicaUsuarioFazenda:string;
    function ReplicaGrupo: string;
    function ReplicaSubGrupo: string;
    function ReplicaCategoria: string;
    function ReplicaMarcas: string;
    function ReplicaProduto: string;

    function ReplicaAuxCulturas:string;
    function ReplicaAuxCultivare:string;
    function ReplicaAuxTipoMaquinaVeiculos:string;
    function ReplicaAuxTipoOcorrencia:string;
    function ReplicaAuxTipoServico:string;
    function ReplicaServico:string;
    function ReplicaCobertura:string;
    function ReplicaAreas:string;
    function ReplicaSetor:string;
    function ReplicaTalhoes:string;

    function  ReplicaMaquinas:string;
    function  ReplicaSafra:string;
    function  ReplicaReceituario:string;
    function  ReplicaDetReceituario:string;
    function  ReplicaDetReceituarioTalhao:string;
    function  ReplicaFornecedor:string;
    function  ReplicaOperadorMaquina:string;
    function  ReplicaTipoCultivar:string;


    //estoque
    function ReplicaLocalEstoque:string;
    function ReplicaCentroCusto:string;
    function ReplicaEstoqueEntrada:string;
    //Operacao
    function  ReplicaOperacaoTalhao:string;
    function  ReplicaOperacaoMaquinaTalhao:string;
    function  ReplicaOperacaoProdutosTalhao:string;
    function  ReplicaOperacaoOcorrenciaTalhao:string;
    function  ReplicaOperacaoVazaoTalhao: string;
    //Pedido
    function  ReplicaPedidoCompra:string;
    function  ReplicaPedidoCompraItens:string;
    function  ReplicaStatusPedido:string;
    function  ReplicaOrcamento:string;
    function  ReplicaOrcamentoItens:string;

    function  ReplicaPedidoCompraMGA:string;
    function  ReplicaPedidoCompraItensMGA:string;
    function  ReplicaStatusPedidoMGA:string;
    function  ReplicaOrcamentoMGA:string;
    function  ReplicaOrcamentoItensMGA:string;

    function  ReplicaPluviometro:string;
    function  ReplicaPluviometroTalhoes:string;
    function  ReplicaPluviometria:string;
    function  ReplicaAbastecimento:string;
    function  ReplicaAbastecimentoOutros:string;

  end;

var
  DataModule2: TDataModule2;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses UServicos, DataContext, UPrincipal, dmReplicacao;

{$R *.dfm}


{ TDataModule2 }

//MGA
function TDataModule2.ReplicaPedidoCompraMGA: string;
var
 Url,vJsonString,vIsert,
 vField,vFieldJS,vId:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J,z:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url := 'http://54.198.102.100:8091/ReplicaPedidoCompraMGA';
   lHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := lHTTP1.Get(URL);
    if(vJsonString<>'{"TSyncPedidoCompraMGA":[]}') then
    begin
      TPedidoCompra.Close;
      TPedidoCompra.Open;
      jSubObj  := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
      if(jSubObj <> nil)then
      begin
        vJoGet := jSubObj.GetValue<TJSONArray>('TSyncPedidoCompraMGA') as TJSONArray;
        for i := 0 to vJoGet.Count-1 do
        begin
          vJoGetJ           := vJoGet.Items[i] as TJSONObject;
          vId               := vJoGetJ.GetValue('id').value;
          TPedidoCompra.Filtered := false;
          TPedidoCompra.Filter   := 'id='+vId;
          TPedidoCompra.Filtered := true;
          if not TPedidoCompra.IsEmpty then
           TPedidoCompra.Edit
          else
           TPedidoCompra.Insert;
          for z := 0 to TPedidoCompra.Fields.Count -1 do
          begin
           vField                                        := StringReplace(TPedidoCompra.Fields[z].Name,'TPedidoCompra','',[rfReplaceAll]);
           TPedidoCompra.FieldByName(vField).AsString    := vJoGetJ.GetValue(vField).value;
          end;
          TPedidoCompra.FieldByName('syncaws').AsInteger :=1;
          TPedidoCompra.ApplyUpdates(-1);
          if dbCtx.vTipoBDConfig=0 then
           AcceptMudaFlagSyncCompras('update pedidocompra set syncAWS=1 where id='+vId)
          else
           AcceptMudaFlagSyncCompras('update pedidocompra set syncFAZ=1 where id='+vId)
       end;
       result:='Usuarios Baixados com Sucesso!'
      end;
    end
    else
     Result :=vJsonString;
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;

end;

function TDataModule2.ReplicaPluviometria: string;
var
 Url,vJsonString,vIsert,
 vField,vFieldJS,vId:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J,z:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/ReplicaPluviometria';
   lHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := lHTTP1.Get(URL);
    if(vJsonString<>'{"result":[{"Mensagem":"Nenhum Pluviometria encontrado!"}]}') then
    begin
      TPluviometria.Close;
      TPluviometria.Open;
      joName := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
      joItems := joName.GetValue('result') as TJSONArray;
      for i  := 0 to joItems.Count-1 do
      begin
        joItem := joItems.Items[I] as TJSONObject;
        vJoGet := joItem.GetValue('TPluviometria') as TJSONArray;
        for j := 0 to vJoGet.Count-1 do
        begin
          vJoGetJ           := vJoGet.Items[j] as TJSONObject;
          vId               := vJoGetJ.GetValue('id').value;
          TPluviometria.Filtered := false;
          TPluviometria.Filter   := 'id='+vId;
          TPluviometria.Filtered := true;
          if not TPluviometria.IsEmpty then
           TPluviometria.Edit
          else
           TPluviometria.Insert;
          for z := 0 to TPluviometria.Fields.Count -1 do
          begin
           vField := StringReplace(TPluviometria.Fields[z].Name,'TPluviometria','',[rfReplaceAll]);
           TPluviometria.FieldByName(vField).AsString   := vJoGetJ.GetValue(vField).value;
          end;
          TPluviometria.ApplyUpdates(-1);
          MudaFalgAWS('update pluviometria set syncFaz=1 where id='+vId)
       end;
       result:='Pluviometria Baixados com Sucesso!'
      end;
    end
    else
     Result :=vJsonString;
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;

function TDataModule2.ReplicaPluviometro: string;
var
 Url,vJsonString,vIsert,
 vField,vFieldJS,vId:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J,z:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/ReplicaPluviometro';
   lHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := lHTTP1.Get(URL);
    if(vJsonString<>'{"result":[{"Mensagem":"Nenhum Pluviometro encontrado!"}]}') then
    begin
      TPluviometros.Close;
      TPluviometros.Open;
      joName := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
      joItems := joName.GetValue('result') as TJSONArray;
      for i  := 0 to joItems.Count-1 do
      begin
        joItem := joItems.Items[I] as TJSONObject;
        vJoGet := joItem.GetValue('TPluviometros') as TJSONArray;
        for j := 0 to vJoGet.Count-1 do
        begin
          vJoGetJ           := vJoGet.Items[j] as TJSONObject;
          vId               := vJoGetJ.GetValue('id').value;
          TPluviometros.Filtered := false;
          TPluviometros.Filter   := 'id='+vId;
          TPluviometros.Filtered := true;
          if not TPluviometros.IsEmpty then
           TPluviometros.Edit
          else
           TPluviometros.Insert;
          for z := 0 to TPluviometros.Fields.Count -1 do
          begin
           vField := StringReplace(TPluviometros.Fields[z].Name,'TPluviometros','',[rfReplaceAll]);
           TPluviometros.FieldByName(vField).AsString   := vJoGetJ.GetValue(vField).value;
          end;
          TPluviometros.ApplyUpdates(-1);
          MudaFalgAWS('update pluviometro set syncFaz=1 where id='+vId)
       end;
       result:='Pluviometro Baixados com Sucesso!'
      end;
    end
    else
     Result :=vJsonString;
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;

function TDataModule2.ReplicaPluviometroTalhoes: string;
var
 Url,vJsonString,vIsert,
 vField,vFieldJS,vId:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J,z:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/ReplicaPluviometroTalhoes';
   lHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := lHTTP1.Get(URL);
    if(vJsonString<>'{"result":[{"Mensagem":"Nenhum Pluviometro Talhao encontrado!"}]}') then
    begin
      TPluviometroTalhoes.Close;
      TPluviometroTalhoes.Open;
      joName := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
      joItems := joName.GetValue('result') as TJSONArray;
      for i  := 0 to joItems.Count-1 do
      begin
        joItem := joItems.Items[I] as TJSONObject;
        vJoGet := joItem.GetValue('TPluviometroTalhoes') as TJSONArray;
        for j := 0 to vJoGet.Count-1 do
        begin
          vJoGetJ           := vJoGet.Items[j] as TJSONObject;
          vId               := vJoGetJ.GetValue('id').value;
          TPluviometroTalhoes.Filtered := false;
          TPluviometroTalhoes.Filter   := 'id='+vId;
          TPluviometroTalhoes.Filtered := true;
          if not TPluviometroTalhoes.IsEmpty then
           TPluviometroTalhoes.Edit
          else
           TPluviometroTalhoes.Insert;
          for z := 0 to TPluviometroTalhoes.Fields.Count -1 do
          begin
           vField := StringReplace(TPluviometroTalhoes.Fields[z].Name,'TPluviometroTalhoes','',[rfReplaceAll]);
           TPluviometroTalhoes.FieldByName(vField).AsString   := vJoGetJ.GetValue(vField).value;
          end;
          TPluviometroTalhoes.ApplyUpdates(-1);
          MudaFalgAWS('update pluviometrotalhoes set syncFaz=1 where id='+vId)
       end;
       result:='Pluviometro Talhoes Baixados com Sucesso!'
      end;
    end
    else
     Result :=vJsonString;
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;

function TDataModule2.ReplicaPedidoCompraItensMGA: string;
var
 Url,vJsonString,vIsert,
 vField,vFieldJS,vId:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J,z:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url := 'http://54.198.102.100:8091/ReplicaPedidoCompraItensMGA';
   lHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := lHTTP1.Get(URL);
    if(vJsonString<>'{"TItensPedidoMGA":[]}') then
    begin
      TItensPedido.Close;
      TItensPedido.Open;
      jSubObj  := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
      if(jSubObj <> nil)then
      begin
        vJoGet := jSubObj.GetValue<TJSONArray>('TItensPedidoMGA') as TJSONArray;
        for i := 0 to vJoGet.Count-1 do
        begin
          vJoGetJ           := vJoGet.Items[i] as TJSONObject;
          vId               := vJoGetJ.GetValue('id').value;
          TItensPedido.Filtered := false;
          TItensPedido.Filter   := 'id='+vId;
          TItensPedido.Filtered := true;
          if not TItensPedido.IsEmpty then
           TItensPedido.Edit
          else
           TItensPedido.Insert;
          for z := 0 to TItensPedido.Fields.Count -1 do
          begin
           vField                                  := StringReplace(TItensPedido.Fields[z].Name,'TItensPedido','',[rfReplaceAll]);
           TItensPedido.FieldByName(vField).AsString   := vJoGetJ.GetValue(vField).value;
          end;
          try
           TItensPedido.FieldByName('syncaws').AsInteger :=1;
           TItensPedido.ApplyUpdates(-1);
           if dbCtx.vTipoBDConfig=0 then
            AcceptMudaFlagSyncCompras('update pedidocompraitems set syncAWS=1 where id='+vId)
           else
            AcceptMudaFlagSyncCompras('update pedidocompraitems set syncFAZ=1 where id='+vId)
          except
            on E: Exception do
             result:='Erro ao comunicar com Servidor:'+E.Message;
          end;
       end;
       result:='Usuarios Baixados com Sucesso!'
      end;
    end
    else
     Result :=vJsonString;
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;

function TDataModule2.ReplicaStatusPedidoMGA: string;
var
 Url,vJsonString,vIsert,
 vField,vFieldJS,vId:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J,z:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url := 'http://54.198.102.100:8091/ReplicaStatusPedidoMGA';
   lHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := lHTTP1.Get(URL);
    if(vJsonString<>'{"TStatusPedidoMGA":[]}') then
    begin
      TStatusPedido.Close;
      TStatusPedido.Open;
      jSubObj  := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
      if(jSubObj <> nil)then
      begin
        vJoGet := jSubObj.GetValue<TJSONArray>('TStatusPedidoMGA') as TJSONArray;
        for i := 0 to vJoGet.Count-1 do
        begin
          vJoGetJ           := vJoGet.Items[i] as TJSONObject;
          vId               := vJoGetJ.GetValue('id').value;
          TStatusPedido.Filtered := false;
          TStatusPedido.Filter   := 'id='+vId;
          TStatusPedido.Filtered := true;
          if not TStatusPedido.IsEmpty then
           TStatusPedido.Edit
          else
           TStatusPedido.Insert;
          for z := 0 to TStatusPedido.Fields.Count -1 do
          begin
           vField                                  := StringReplace(TStatusPedido.Fields[z].Name,'TStatusPedido','',[rfReplaceAll]);
           TStatusPedido.FieldByName(vField).AsString   := vJoGetJ.GetValue(vField).value;
          end;
          TStatusPedido.FieldByName('syncaws').AsInteger :=1;
          TStatusPedido.ApplyUpdates(-1);
          if dbCtx.vTipoBDConfig=0 then
           AcceptMudaFlagSyncCompras('update pedidostatus set syncAWS=1 where id='+vId)
          else
           AcceptMudaFlagSyncCompras('update pedidostatus set syncFAZ=1 where id='+vId)
       end;
       result:='Usuarios Baixados com Sucesso!'
      end;
    end
    else
     Result :=vJsonString;
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;

function TDataModule2.ReplicaOrcamentoMGA: string;
var
 Url,vJsonString,vIsert,
 vField,vFieldJS,vId:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J,z:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url := 'http://54.198.102.100:8091/ReplicaOrcamentoMGA';
   lHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := lHTTP1.Get(URL);
    if(vJsonString<>'{"TOrcamentoMGA":[]}') then
    begin
      TOrcamento.Close;
      TOrcamento.Open;
      jSubObj  := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
      if(jSubObj <> nil)then
      begin
        vJoGet := jSubObj.GetValue<TJSONArray>('TOrcamentoMGA') as TJSONArray;
        for i := 0 to vJoGet.Count-1 do
        begin
          vJoGetJ           := vJoGet.Items[i] as TJSONObject;
          vId               := vJoGetJ.GetValue('id').value;
          TOrcamento.Filtered := false;
          TOrcamento.Filter   := 'id='+vId;
          TOrcamento.Filtered := true;
          if not TOrcamento.IsEmpty then
           TOrcamento.Edit
          else
           TOrcamento.Insert;
          for z := 0 to TOrcamento.Fields.Count -1 do
          begin
           vField                                  := StringReplace(TOrcamento.Fields[z].Name,'TOrcamento','',[rfReplaceAll]);
           TOrcamento.FieldByName(vField).AsString   := vJoGetJ.GetValue(vField).value;
          end;
          TOrcamento.FieldByName('syncaws').AsInteger :=1;
          TOrcamento.ApplyUpdates(-1);
          if dbCtx.vTipoBDConfig=0 then
           AcceptMudaFlagSyncCompras('update orcamentos set syncAWS=1 where id='+vId)
          else
           AcceptMudaFlagSyncCompras('update orcamentos set syncFAZ=1 where id='+vId)
       end;
       result:='Usuarios Baixados com Sucesso!'
      end;
    end
    else
     Result :=vJsonString;
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;

function TDataModule2.ReplicaOrcamentoItensMGA: string;
var
 Url,vJsonString,vIsert,
 vField,vFieldJS,vId,vIdOrcamento,vIdProduto:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J,z:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url := 'http://54.198.102.100:8091/ReplicaOrcamentoItensMGA';
   lHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := lHTTP1.Get(URL);
    if(vJsonString<>'{"TItensOrcamentoMGA":[]}') then
    begin
      TItensOrcamento.Close;
      TItensOrcamento.Open;
      jSubObj  := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
      if(jSubObj <> nil)then
      begin
        vJoGet := jSubObj.GetValue<TJSONArray>('TItensOrcamentoMGA') as TJSONArray;
        for i := 0 to vJoGet.Count-1 do
        begin
          vJoGetJ           := vJoGet.Items[i] as TJSONObject;
          vId               := vJoGetJ.GetValue('id').value;
          vIdOrcamento      := vJoGetJ.GetValue('idorcamento').value;
          vIdProduto        := vJoGetJ.GetValue('idproduto').value;

          TItensOrcamento.Filtered := false;
          TItensOrcamento.Filter   := 'idorcamento='+vIdOrcamento+' AND idproduto='+vIdProduto;
          TItensOrcamento.Filtered := true;
          if not TItensOrcamento.IsEmpty then
           TItensOrcamento.Edit
          else
           TItensOrcamento.Insert;
          for z := 0 to TItensOrcamento.Fields.Count -1 do
          begin
           vField                                  := StringReplace(TItensOrcamento.Fields[z].Name,'TItensOrcamento','',[rfReplaceAll]);
           TItensOrcamento.FieldByName(vField).AsString   := vJoGetJ.GetValue(vField).value;
          end;
          TItensOrcamento.FieldByName('syncaws').AsInteger :=1;
          TItensOrcamento.ApplyUpdates(-1);
          if dbCtx.vTipoBDConfig=0 then
           AcceptMudaFlagSyncCompras('update orcamentositens set syncAWS=1 where id='+vId)
          else
           AcceptMudaFlagSyncCompras('update orcamentositens set syncFAZ=1 where id='+vId)
       end;
       result:='Usuarios Baixados com Sucesso!'
      end;
    end
    else
     Result :=vJsonString;
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;
//MGA

procedure TDataModule2.MudaFalgAWS(vSql:string);
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
 Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/MudaFlagFazenda';

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
 lHTTP1.Request.CustomHeaders.Clear;
 lHTTP1.Request.ContentType := 'application/json';
 lHTTP1.Request.Charset := 'UTF-8';
 lHTTP1.Request.Clear;
 lHTTP1.Request.BasicAuthentication := false;
 vReultHTTP  := lHTTP1.Put(URL,JsonToSend);
end;

procedure TDataModule2.AcceptMudaFlagSyncCompras(vSql:string);
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
 Url := 'http://54.198.102.100:8091/MudaFlagSyncCompras';

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
 lHTTP1.Request.CustomHeaders.Clear;
 lHTTP1.Request.Accept      := 'application/json';
 lHTTP1.Request.ContentType := 'application/json';
 vReultHTTP  := lHTTP1.Post(URL,JsonToSend);
end;

function TDataModule2.ReplicaUsuarioFazenda: string;
var
 Url,vJsonString,vIsert,
 vField,vFieldJS,vId:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J,z:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/ReplicaFazendaUsuario';
   lHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := lHTTP1.Get(URL);
    if(vJsonString<>'{"result":[{"Mensagem":"Nenhum Usuario encontrado!"}]}') then
    begin
      TUsuario.Close;
      TUsuario.Open;
      joName := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
      joItems := joName.GetValue('result') as TJSONArray;
      for i  := 0 to joItems.Count-1 do
      begin
        joItem := joItems.Items[I] as TJSONObject;
        vJoGet := joItem.GetValue('TSyncUsuario') as TJSONArray;
        for j := 0 to vJoGet.Count-1 do
        begin
          vJoGetJ           := vJoGet.Items[j] as TJSONObject;
          vId               := vJoGetJ.GetValue('id').value;
          TUsuario.Filtered := false;
          TUsuario.Filter   := 'id='+vId;
          TUsuario.Filtered := true;
          if not TUsuario.IsEmpty then
           TUsuario.Edit
          else
           TUsuario.Insert;
          for z := 0 to TUsuario.Fields.Count -1 do
          begin
           vField                                  := StringReplace(TUsuario.Fields[z].Name,'TUsuario','',[rfReplaceAll]);
           TUsuario.FieldByName(vField).AsString   := vJoGetJ.GetValue(vField).value;
          end;
          TUsuario.ApplyUpdates(-1);
          MudaFalgAWS('update usuario set syncFaz=1 where id='+vId)
       end;
       result:='Usuarios Baixados com Sucesso!'
      end;
    end
    else
     Result :=vJsonString;
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;

procedure TDataModule2.TAreasReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
 ShowMessage(e.Message);
end;

procedure TDataModule2.TDetReceituarioTalhaoReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
 ShowMessage(e.Message);
end;

function TDataModule2.ReplicaGrupo: string;
var
 Url,vJsonString,vIsert,
 vField,vFieldJS,vId:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J,z:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/ReplicaFazendaGrupos';
   lHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := lHTTP1.Get(URL);
    if(vJsonString<>'{"result":[{"Mensagem":"Nenhum Usuario encontrado!"}]}') then
    begin
      TAuxGrupo.Close;
      TAuxGrupo.Open;
      joName := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
      joItems := joName.GetValue('result') as TJSONArray;
      for i  := 0 to joItems.Count-1 do
      begin
        joItem := joItems.Items[I] as TJSONObject;
        vJoGet := joItem.GetValue('TSyncGrupo') as TJSONArray;
        for j := 0 to vJoGet.Count-1 do
        begin
          vJoGetJ           := vJoGet.Items[j] as TJSONObject;
          vId               := vJoGetJ.GetValue('id').value;
          TAuxGrupo.Filtered := false;
          TAuxGrupo.Filter   := 'id='+vId;
          TAuxGrupo.Filtered := true;
          if not TAuxGrupo.IsEmpty then
           TAuxGrupo.Edit
          else
           TAuxGrupo.Insert;
          for z := 0 to TAuxGrupo.Fields.Count -1 do
          begin
           vField                                  := StringReplace(TAuxGrupo.Fields[z].Name,'TAuxGrupo','',[rfReplaceAll]);
           TAuxGrupo.FieldByName(vField).AsString   := vJoGetJ.GetValue(vField).value;
          end;
          TAuxGrupo.ApplyUpdates(-1);
          MudaFalgAWS('update auxgrupoprodutos set syncFaz=1 where id='+vId)
       end;
       result:='Usuarios Baixados com Sucesso!'
      end;
    end
    else
     Result :=vJsonString;
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;

function TDataModule2.ReplicaLocalEstoque: string;
var
 Url,vJsonString,vIsert,
 vField,vFieldJS,vId:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J,z:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/ReplicaLocalEstoque';
   lHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := lHTTP1.Get(URL);
    if(vJsonString<>'{"result":[{"Mensagem":"Nenhum Usuario encontrado!"}]}') then
    begin
      TLocalEstoque.Close;
      TLocalEstoque.Open;
      joName := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
      joItems := joName.GetValue('result') as TJSONArray;
      for i  := 0 to joItems.Count-1 do
      begin
        joItem := joItems.Items[I] as TJSONObject;
        vJoGet := joItem.GetValue('TSyncLocalEstoque') as TJSONArray;
        for j := 0 to vJoGet.Count-1 do
        begin
          vJoGetJ           := vJoGet.Items[j] as TJSONObject;
          vId               := vJoGetJ.GetValue('id').value;
          TLocalEstoque.Filtered := false;
          TLocalEstoque.Filter   := 'id='+vId;
          TLocalEstoque.Filtered := true;
          if not TLocalEstoque.IsEmpty then
           TLocalEstoque.Edit
          else
           TLocalEstoque.Insert;
          for z := 0 to TLocalEstoque.Fields.Count -1 do
          begin
           vField                                  := StringReplace(TLocalEstoque.Fields[z].Name,'TLocalEstoque','',[rfReplaceAll]);
           TLocalEstoque.FieldByName(vField).AsString   := vJoGetJ.GetValue(vField).value;
          end;
          TLocalEstoque.ApplyUpdates(-1);
          MudaFalgAWS('update localestoque set syncFaz=1 where id='+vId)
       end;
       result:='Usuarios Baixados com Sucesso!'
      end;
    end
    else
     Result :=vJsonString;
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;

function TDataModule2.ReplicaSafra: string;
var
 Url,vJsonString,vIsert,
 vField,vFieldJS,vId:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J,z:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/ReplicaSafra';
   lHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := lHTTP1.Get(URL);
    if(vJsonString<>'{"result":[{"Mensagem":"Nenhum Usuario encontrado!"}]}') then
    begin
      TSafra.Close;
      TSafra.Open;
      joName := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
      joItems := joName.GetValue('result') as TJSONArray;
      for i  := 0 to joItems.Count-1 do
      begin
        joItem := joItems.Items[I] as TJSONObject;
        vJoGet := joItem.GetValue('TSyncSafra') as TJSONArray;
        for j := 0 to vJoGet.Count-1 do
        begin
          vJoGetJ           := vJoGet.Items[j] as TJSONObject;
          vId               := vJoGetJ.GetValue('id').value;
          TSafra.Filtered := false;
          TSafra.Filter   := 'id='+vId;
          TSafra.Filtered := true;
          if not TSafra.IsEmpty then
           TSafra.Edit
          else
           TSafra.Insert;
          for z := 0 to TSafra.Fields.Count -1 do
          begin
           vField                                  := StringReplace(TSafra.Fields[z].Name,'TSafra','',[rfReplaceAll]);
           TSafra.FieldByName(vField).AsString   := vJoGetJ.GetValue(vField).value;
          end;
          TSafra.ApplyUpdates(-1);
          MudaFalgAWS('update safra set syncFaz=1 where id='+vId)
       end;
       result:='Usuarios Baixados com Sucesso!'
      end;
    end
    else
     Result :=vJsonString;
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;

function TDataModule2.ReplicaServico: string;
var
 Url,vJsonString,vIsert,
 vField,vFieldJS,vId:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J,z:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/ReplicaServico';
   lHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := lHTTP1.Get(URL);
    if(vJsonString<>'{"result":[{"Mensagem":"Nenhum Usuario encontrado!"}]}') then
    begin
      TServico.Close;
      TServico.Open;
      joName := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
      joItems := joName.GetValue('result') as TJSONArray;
      for i  := 0 to joItems.Count-1 do
      begin
        joItem := joItems.Items[I] as TJSONObject;
        vJoGet := joItem.GetValue('TSyncServico') as TJSONArray;
        for j := 0 to vJoGet.Count-1 do
        begin
          vJoGetJ           := vJoGet.Items[j] as TJSONObject;
          vId               := vJoGetJ.GetValue('id').value;
          TServico.Filtered := false;
          TServico.Filter   := 'id='+vId;
          TServico.Filtered := true;
          if not TServico.IsEmpty then
           TServico.Edit
          else
           TServico.Insert;
          for z := 0 to TServico.Fields.Count -1 do
          begin
           vField                                  := StringReplace(TServico.Fields[z].Name,'TServico','',[rfReplaceAll]);
           TServico.FieldByName(vField).AsString   := vJoGetJ.GetValue(vField).value;
          end;
          TServico.ApplyUpdates(-1);
          MudaFalgAWS('update servico set syncFaz=1 where id='+vId)
       end;
       result:='Usuarios Baixados com Sucesso!'
      end;
    end
    else
     Result :=vJsonString;
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;

function TDataModule2.ReplicaSetor: string;
var
 Url,vJsonString,vIsert,
 vField,vFieldJS,vId:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J,z:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/ReplicaSetor';
   lHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := lHTTP1.Get(URL);
    if(vJsonString<>'{"result":[{"Mensagem":"Nenhum Usuario encontrado!"}]}') then
    begin
      TSetores.Close;
      TSetores.Open;
      joName := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
      joItems := joName.GetValue('result') as TJSONArray;
      for i  := 0 to joItems.Count-1 do
      begin
        joItem := joItems.Items[I] as TJSONObject;
        vJoGet := joItem.GetValue('TSyncSetores') as TJSONArray;
        for j := 0 to vJoGet.Count-1 do
        begin
          vJoGetJ           := vJoGet.Items[j] as TJSONObject;
          vId               := vJoGetJ.GetValue('id').value;
          TSetores.Filtered := false;
          TSetores.Filter   := 'id='+vId;
          TSetores.Filtered := true;
          if not TSetores.IsEmpty then
           TSetores.Edit
          else
           TSetores.Insert;
          for z := 0 to TSetores.Fields.Count -1 do
          begin
           vField                                  := StringReplace(TSetores.Fields[z].Name,'TSetores','',[rfReplaceAll]);
           TSetores.FieldByName(vField).AsString   := vJoGetJ.GetValue(vField).value;
          end;
          TSetores.ApplyUpdates(-1);
          MudaFalgAWS('update setor set syncFaz=1 where id='+vId)
       end;
       result:='Usuarios Baixados com Sucesso!'
      end;
    end
    else
     Result :=vJsonString;
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;

function TDataModule2.ReplicaStatusPedido: string;
var
 Url,vJsonString,vIsert,
 vField,vFieldJS,vId:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J,z:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url := 'http://'+srvDtSanap+'/ReplicaStatusPedido';
   lHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := lHTTP1.Get(URL);
    if(vJsonString<>'{"result":[{"Mensagem":"Nenhum Usuario encontrado!"}]}') then
    begin
      TStatusPedido.Close;
      TStatusPedido.Open;
      joName := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
      joItems := joName.GetValue('result') as TJSONArray;
      for i  := 0 to joItems.Count-1 do
      begin
        joItem := joItems.Items[I] as TJSONObject;
        vJoGet := joItem.GetValue('TStatusPedido') as TJSONArray;
        for j := 0 to vJoGet.Count-1 do
        begin
          vJoGetJ           := vJoGet.Items[j] as TJSONObject;
          vId               := vJoGetJ.GetValue('id').value;
          TStatusPedido.Filtered := false;
          TStatusPedido.Filter   := 'id='+vId;
          TStatusPedido.Filtered := true;
          if not TStatusPedido.IsEmpty then
           TStatusPedido.Edit
          else
           TStatusPedido.Insert;
          for z := 0 to TStatusPedido.Fields.Count -1 do
          begin
           vField                                  := StringReplace(TStatusPedido.Fields[z].Name,'TStatusPedido','',[rfReplaceAll]);
           TStatusPedido.FieldByName(vField).AsString   := vJoGetJ.GetValue(vField).value;
          end;
          TStatusPedido.ApplyUpdates(-1);
          MudaFalgAWS('update pedidostatus set syncFaz=1 where id='+vId)
       end;
       result:='Usuarios Baixados com Sucesso!'
      end;
    end
    else
     Result :=vJsonString;
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;

function TDataModule2.ReplicaSubGrupo: string;
var
 Url,vJsonString,vIsert,
 vField,vFieldJS,vId:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J,z:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/ReplicaFazendaSubGrupos';
   lHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := lHTTP1.Get(URL);
    if(vJsonString<>'{"result":[{"Mensagem":"Nenhum Usuario encontrado!"}]}') then
    begin
      TAuxSubGrupo.Close;
      TAuxSubGrupo.Open;
      joName := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
      joItems := joName.GetValue('result') as TJSONArray;
      for i  := 0 to joItems.Count-1 do
      begin
        joItem := joItems.Items[I] as TJSONObject;
        vJoGet := joItem.GetValue('TAuxSubGrupo') as TJSONArray;
        for j := 0 to vJoGet.Count-1 do
        begin
          vJoGetJ           := vJoGet.Items[j] as TJSONObject;
          vId               := vJoGetJ.GetValue('id').value;
          TAuxSubGrupo.Filtered := false;
          TAuxSubGrupo.Filter   := 'id='+vId;
          TAuxSubGrupo.Filtered := true;
          if not TAuxSubGrupo.IsEmpty then
           TAuxSubGrupo.Edit
          else
           TAuxSubGrupo.Insert;
          for z := 0 to TAuxSubGrupo.Fields.Count -1 do
          begin
           vField                                  := StringReplace(TAuxSubGrupo.Fields[z].Name,'TAuxSubGrupo','',[rfReplaceAll]);
           TAuxSubGrupo.FieldByName(vField).AsString   := vJoGetJ.GetValue(vField).value;
          end;
          TAuxSubGrupo.ApplyUpdates(-1);
          MudaFalgAWS('update auxsubgrupoprodutos set syncFaz=1 where id='+vId)
       end;
       result:='Usuarios Baixados com Sucesso!'
      end;
    end
    else
     Result :=vJsonString;
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;

function TDataModule2.ReplicaTalhoes: string;
var
 Url,vJsonString,vIsert,
 vField,vFieldJS,vId:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J,z:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/ReplicaTalhoes';
   lHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := lHTTP1.Get(URL);
    if(vJsonString<>'{"result":[{"Mensagem":"Nenhum Usuario encontrado!"}]}') then
    begin
      TTalhoes.Close;
      TTalhoes.Open;
      joName := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
      joItems := joName.GetValue('result') as TJSONArray;
      for i  := 0 to joItems.Count-1 do
      begin
        joItem := joItems.Items[I] as TJSONObject;
        vJoGet := joItem.GetValue('TSyncTalhoes') as TJSONArray;
        for j := 0 to vJoGet.Count-1 do
        begin
          vJoGetJ           := vJoGet.Items[j] as TJSONObject;
          vId               := vJoGetJ.GetValue('id').value;
          TTalhoes.Filtered := false;
          TTalhoes.Filter   := 'id='+vId;
          TTalhoes.Filtered := true;
          if not TTalhoes.IsEmpty then
           TTalhoes.Edit
          else
           TTalhoes.Insert;
          for z := 0 to TTalhoes.Fields.Count -1 do
          begin
           vField                                  := StringReplace(TTalhoes.Fields[z].Name,'TTalhoes','',[rfReplaceAll]);
           TTalhoes.FieldByName(vField).AsString   := vJoGetJ.GetValue(vField).value;
          end;
          TTalhoes.ApplyUpdates(-1);
          MudaFalgAWS('update talhoes set syncFaz=1 where id='+vId)
       end;
       result:='Usuarios Baixados com Sucesso!'
      end;
    end
    else
     Result :=vJsonString;
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;

function TDataModule2.ReplicaTipoCultivar: string;
var
 Url,vJsonString,vIsert,
 vField,vFieldJS,vId:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J,z:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/ReplicaTipoCultivar';
   lHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := lHTTP1.Get(URL);
    if(vJsonString<>'{"result":[{"Mensagem":"Nenhum Usuario encontrado!"}]}') then
    begin
      TAuxTipoCultivare.Close;
      TAuxTipoCultivare.Open;
      joName := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
      joItems := joName.GetValue('result') as TJSONArray;
      for i  := 0 to joItems.Count-1 do
      begin
        joItem := joItems.Items[I] as TJSONObject;
        vJoGet := joItem.GetValue('TAuxTipoCultivare') as TJSONArray;
        for j := 0 to vJoGet.Count-1 do
        begin
          vJoGetJ           := vJoGet.Items[j] as TJSONObject;
          vId               := vJoGetJ.GetValue('id').value;
          TAuxTipoCultivare.Filtered := false;
          TAuxTipoCultivare.Filter   := 'id='+vId;
          TAuxTipoCultivare.Filtered := true;
          if not TAuxTipoCultivare.IsEmpty then
           TAuxTipoCultivare.Edit
          else
           TAuxTipoCultivare.Insert;
          for z := 0 to TAuxTipoCultivare.Fields.Count -1 do
          begin
           vField                                  := StringReplace(TAuxTipoCultivare.Fields[z].Name,'TAuxTipoCultivare','',[rfReplaceAll]);
           TAuxTipoCultivare.FieldByName(vField).AsString   := vJoGetJ.GetValue(vField).value;
          end;
          TAuxTipoCultivare.ApplyUpdates(-1);
          MudaFalgAWS('update auxtipocultivar set syncFaz=1 where id='+vId)
       end;
       result:='Usuarios Baixados com Sucesso!'
      end;
    end
    else
     Result :=vJsonString;
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;

function TDataModule2.ReplicaAbastecimento: string;
var
 Url,vJsonString,vIsert,
 vField,vFieldJS,vId:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J,z:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/ReplicaAbastecimento';
   lHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := lHTTP1.Get(URL);
    if(vJsonString<>'{"result":[{"Mensagem":"Nenhum Abastecimento encontrado!"}]}') then
    begin
      TAbastecimento.Close;
      TAbastecimento.Open;
      joName := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
      joItems := joName.GetValue('result') as TJSONArray;
      for i  := 0 to joItems.Count-1 do
      begin
        joItem := joItems.Items[I] as TJSONObject;
        vJoGet := joItem.GetValue('TAbastecimento') as TJSONArray;
        for j := 0 to vJoGet.Count-1 do
        begin
          vJoGetJ           := vJoGet.Items[j] as TJSONObject;
          vId               := vJoGetJ.GetValue('id').value;
          TAbastecimento.Filtered := false;
          TAbastecimento.Filter   := 'id='+vId;
          TAbastecimento.Filtered := true;
          if not TAbastecimento.IsEmpty then
           TAbastecimento.Edit
          else
           TAbastecimento.Insert;
          for z := 0 to TAbastecimento.Fields.Count -1 do
          begin
           vField := StringReplace(TAbastecimento.Fields[z].Name,'TAbastecimento','',[rfReplaceAll]);
           TAbastecimento.FieldByName(vField).AsString   := vJoGetJ.GetValue(vField).value;
          end;
          TAbastecimento.ApplyUpdates(-1);
          MudaFalgAWS('update abastecimento set syncFaz=1 where id='+vId)
       end;
       result:='Abastecimento Baixados com Sucesso!'
      end;
    end
    else
     Result :=vJsonString;
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;

function TDataModule2.ReplicaAbastecimentoOutros: string;
var
 Url,vJsonString,vIsert,
 vField,vFieldJS,vId:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J,z:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/ReplicaAbastecimentoOutros';
   lHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := lHTTP1.Get(URL);
    if(vJsonString<>'{"result":[{"Mensagem":"Nenhum Abastecimento Outros encontrado!"}]}') then
    begin
      TAbastecimentoOutros.Close;
      TAbastecimentoOutros.Open;
      joName := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
      joItems := joName.GetValue('result') as TJSONArray;
      for i  := 0 to joItems.Count-1 do
      begin
        joItem := joItems.Items[I] as TJSONObject;
        vJoGet := joItem.GetValue('TAbastecimentoOutros') as TJSONArray;
        for j := 0 to vJoGet.Count-1 do
        begin
          vJoGetJ           := vJoGet.Items[j] as TJSONObject;
          vId               := vJoGetJ.GetValue('id').value;
          TAbastecimentoOutros.Filtered := false;
          TAbastecimentoOutros.Filter   := 'id='+vId;
          TAbastecimentoOutros.Filtered := true;
          if not TAbastecimentoOutros.IsEmpty then
           TAbastecimentoOutros.Edit
          else
           TAbastecimentoOutros.Insert;
          for z := 0 to TAbastecimentoOutros.Fields.Count -1 do
          begin
           vField := StringReplace(TAbastecimentoOutros.Fields[z].Name,'TAbastecimentoOutros','',[rfReplaceAll]);
           TAbastecimentoOutros.FieldByName(vField).AsString   := vJoGetJ.GetValue(vField).value;
          end;
          TAbastecimentoOutros.ApplyUpdates(-1);
          MudaFalgAWS('update abastecimentooutros set syncFaz=1 where id='+vId)
       end;
       result:='Abastecimento Baixados com Sucesso!'
      end;
    end
    else
     Result :=vJsonString;
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;

procedure TDataModule2.ReplicaAll;
begin
 TThread.CreateAnonymousThread(procedure()
 var
   vProgres:Double;
 begin
  vProgres := 2.85;
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
//  TThread.Synchronize(nil,procedure
//  begin
//   frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Usuarios AWS');
//  end);
//  ReplicaUsuarioFazenda;
//  TThread.Synchronize(nil,procedure
//  begin
//   frmPrincipal.ProgressBarSync.Value :=vProgres;
//   frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Grupos AWS');
//  end);
//  ReplicaGrupo;
//  TThread.Synchronize(nil,procedure
//  begin
//   frmPrincipal.ProgressBarSync.Value :=frmPrincipal.ProgressBarSync.Value+vProgres;
//   frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Subgrupos AWS');
//  end);
//  ReplicaSubGrupo;
//  TThread.Synchronize(nil,procedure
//  begin
//   frmPrincipal.ProgressBarSync.Value :=frmPrincipal.ProgressBarSync.Value+vProgres;
//   frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Categorias AWS');
//  end);
//  ReplicaCategoria;
//  TThread.Synchronize(nil,procedure
//  begin
//   frmPrincipal.ProgressBarSync.Value :=frmPrincipal.ProgressBarSync.Value+vProgres;
//   frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Marcas AWS');
//  end);
//  ReplicaMarcas;
//  TThread.Synchronize(nil,procedure
//  begin
//   frmPrincipal.ProgressBarSync.Value :=frmPrincipal.ProgressBarSync.Value+vProgres;
//   frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Produtos AWS');
//  end);
//  ReplicaProduto;
//  TThread.Synchronize(nil,procedure
//  begin
//   frmPrincipal.ProgressBarSync.Value :=frmPrincipal.ProgressBarSync.Value+vProgres;
//   frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Culturas AWS');
//  end);
//  ReplicaAuxCulturas;
//  TThread.Synchronize(nil,procedure
//  begin
//   frmPrincipal.ProgressBarSync.Value :=frmPrincipal.ProgressBarSync.Value+vProgres;
//   frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Tipo Cultivares AWS');
//  end);
//  ReplicaTipoCultivar;
//  TThread.Synchronize(nil,procedure
//  begin
//   frmPrincipal.ProgressBarSync.Value :=frmPrincipal.ProgressBarSync.Value+vProgres;
//   frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Cutivares AWS');
//  end);
//  ReplicaAuxCultivare;
//  TThread.Synchronize(nil,procedure
//  begin
//   frmPrincipal.ProgressBarSync.Value :=frmPrincipal.ProgressBarSync.Value+vProgres;
//   frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Tipo Maquina AWS');
//  end);
//  ReplicaAuxTipoMaquinaVeiculos;
//  TThread.Synchronize(nil,procedure
//  begin
//   frmPrincipal.ProgressBarSync.Value :=frmPrincipal.ProgressBarSync.Value+vProgres;
//   frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Tipo Ocorrencia AWS');
//  end);
//  ReplicaAuxTipoOcorrencia;
//  TThread.Synchronize(nil,procedure
//  begin
//   frmPrincipal.ProgressBarSync.Value :=frmPrincipal.ProgressBarSync.Value+vProgres;
//   frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Tipo Serviço AWS');
//  end);
//  ReplicaAuxTipoServico;
//  TThread.Synchronize(nil,procedure
//  begin
//   frmPrincipal.ProgressBarSync.Value :=frmPrincipal.ProgressBarSync.Value+vProgres;
//   frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Serviço AWS');
//  end);
//  ReplicaServico;
//  TThread.Synchronize(nil,procedure
//  begin
//   frmPrincipal.ProgressBarSync.Value :=frmPrincipal.ProgressBarSync.Value+vProgres;
//   frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Cobertura AWS');
//  end);
//  ReplicaCobertura;
//  TThread.Synchronize(nil,procedure
//  begin
//   frmPrincipal.ProgressBarSync.Value :=frmPrincipal.ProgressBarSync.Value+vProgres;
//   frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Area AWS');
//  end);
//  ReplicaAreas;
//  TThread.Synchronize(nil,procedure
//  begin
//   frmPrincipal.ProgressBarSync.Value :=frmPrincipal.ProgressBarSync.Value+vProgres;
//   frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Setor AWS');
//  end);
//  ReplicaSetor;
//  TThread.Synchronize(nil,procedure
//  begin
//   frmPrincipal.ProgressBarSync.Value :=frmPrincipal.ProgressBarSync.Value+vProgres;
//   frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Talhoes AWS');
//  end);
//  ReplicaTalhoes;
//  TThread.Synchronize(nil,procedure
//  begin
//   frmPrincipal.ProgressBarSync.Value :=frmPrincipal.ProgressBarSync.Value+vProgres;
//   frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Safra AWS');
//  end);
//  ReplicaSafra;
//
//  TThread.Synchronize(nil,procedure
//  begin
//   frmPrincipal.ProgressBarSync.Value :=frmPrincipal.ProgressBarSync.Value+vProgres;
//   frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Operador Maquina AWS');
//  end);
//  ReplicaOperadorMaquina;
//  TThread.Synchronize(nil,procedure
//  begin
//   frmPrincipal.ProgressBarSync.Value :=frmPrincipal.ProgressBarSync.Value+vProgres;
//   frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Fornecedores AWS');
//  end);
//  ReplicaFornecedor;
//  TThread.Synchronize(nil,procedure
//  begin
//   frmPrincipal.ProgressBarSync.Value :=frmPrincipal.ProgressBarSync.Value+vProgres;
//   frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Maquina AWS');
//  end);
//  ReplicaMaquinas;
//  TThread.Synchronize(nil,procedure
//  begin
//   frmPrincipal.ProgressBarSync.Value :=frmPrincipal.ProgressBarSync.Value+vProgres;
//   frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Local Estoque AWS');
//  end);
//  ReplicaLocalEstoque;
//  TThread.Synchronize(nil,procedure
//  begin
//   frmPrincipal.ProgressBarSync.Value :=frmPrincipal.ProgressBarSync.Value+vProgres;
//   frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Centro Custo AWS');
//  end);
//  ReplicaCentroCusto;
//  TThread.Synchronize(nil,procedure
//  begin
//   frmPrincipal.ProgressBarSync.Value :=frmPrincipal.ProgressBarSync.Value+vProgres;
//   frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Pedido de Compras AWS');
//  end);
//  ReplicaPedidoCompra;
//  TThread.Synchronize(nil,procedure
//  begin
//   frmPrincipal.ProgressBarSync.Value :=frmPrincipal.ProgressBarSync.Value+vProgres;
//   frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Itens do Pedido AWS');
//  end);
//  ReplicaPedidoCompraItens;
//  TThread.Synchronize(nil,procedure
//  begin
//   frmPrincipal.ProgressBarSync.Value :=frmPrincipal.ProgressBarSync.Value+vProgres;
//   frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Status do Pedido AWS');
//  end);
//  ReplicaStatusPedido;
//  TThread.Synchronize(nil,procedure
//  begin
//   frmPrincipal.ProgressBarSync.Value :=frmPrincipal.ProgressBarSync.Value+vProgres;
//   frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Orçamentos AWS');
//  end);
//  ReplicaOrcamento;
//  TThread.Synchronize(nil,procedure
//  begin
//   frmPrincipal.ProgressBarSync.Value :=frmPrincipal.ProgressBarSync.Value+vProgres;
//   frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Itens do Orçamento AWS');
//  end);
//  ReplicaOrcamentoItens;
//
//  //DataModule1.Replica Fazenda para AWS
//
//  TThread.Synchronize(nil,procedure
//  begin
//   frmPrincipal.ProgressBarSync.Value :=vProgres;
//   frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Pluviometros AWS');
//  end);
//  DataModule1.ReplicaPluviometro('');
//
//  TThread.Synchronize(nil,procedure
//  begin
//   frmPrincipal.ProgressBarSync.Value :=vProgres;
//   frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Pluviometros Talhoes AWS');
//  end);
//  DataModule1.ReplicaPluviometroTalhoes('');
//
//  TThread.Synchronize(nil,procedure
//  begin
//   frmPrincipal.ProgressBarSync.Value :=vProgres;
//   frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Pluviometria AWS');
//  end);
//  DataModule1.ReplicaPluviometria('');
//
//  TThread.Synchronize(nil,procedure
//  begin
//   frmPrincipal.ProgressBarSync.Value :=vProgres;
//   frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Abastecimento AWS');
//  end);
//  DataModule1.ReplicaAbastecimento('');
//
//  TThread.Synchronize(nil,procedure
//  begin
//   frmPrincipal.ProgressBarSync.Value :=vProgres;
//   frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Abastecimento Outros AWS');
//  end);
//  DataModule1.ReplicaAbastecimentoOutros('');

  TThread.Synchronize(nil,procedure
  begin
   frmPrincipal.ProgressBarSync.Value :=vProgres;
   frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Abastecimento AWS');
  end);
  DataModule1.ReplicaAuxPraga('');


//  TThread.Synchronize(nil,procedure
//  begin
//   frmPrincipal.ProgressBarSync.Value :=vProgres;
//   frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Receituario AWS');
//  end);
//  DataModule1.ReplicaReceiturario('');
//  TThread.Synchronize(nil,procedure
//  begin
//   frmPrincipal.ProgressBarSync.Value :=vProgres;
//   frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Receituario Produto AWS');
//  end);
//  DataModule1.ReplicaDetReceiturario('');
//  TThread.Synchronize(nil,procedure
//  begin
//   frmPrincipal.ProgressBarSync.Value :=vProgres;
//   frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Receituario Talhao AWS');
//  end);
//  DataModule1.ReplicaDetReceiturarioTalhao('');
//
//  TThread.Synchronize(nil,procedure
//  begin
//   frmPrincipal.ProgressBarSync.Value :=vProgres;
//   frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Operacao Talhao AWS');
//  end);
//  DataModule1.ReplicaOperacaoTalhao('');
//  TThread.Synchronize(nil,procedure
//  begin
//   frmPrincipal.ProgressBarSync.Value :=vProgres;
//   frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Operacao Maquina AWS');
//  end);
//  DataModule1.ReplicaOperacaoMaquinaTalhao('');
//  TThread.Synchronize(nil,procedure
//  begin
//   frmPrincipal.ProgressBarSync.Value :=vProgres;
//   frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Operacao Produtos AWS');
//  end);
//  DataModule1.ReplicaOperacaoProdutosTalhao('');
//  TThread.Synchronize(nil,procedure
//  begin
//   frmPrincipal.ProgressBarSync.Value :=vProgres;
//   frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Operacao Ocorrencia AWS');
//  end);
//  DataModule1.ReplicaOperacaoOcorrenciaTalhao('');
//
//  TThread.Synchronize(nil,procedure
//  begin
//   frmPrincipal.ProgressBarSync.Value :=frmPrincipal.ProgressBarSync.Value+vProgres;
//   frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Operação Vazão AWS');
//  end);
//  DataModule1.ReplicaOperacaoVazaoTalhao('');
//
//  TThread.Synchronize(nil,procedure
//    begin
//     frmPrincipal.ProgressBarSync.Value :=frmPrincipal.ProgressBarSync.Value+vProgres;
//     frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Enviando Pedidos AWS');
//    end);
//    DataModule1.ReplicaPedidoCompra('');
//    TThread.Synchronize(nil,procedure
//    begin
//     frmPrincipal.ProgressBarSync.Value :=frmPrincipal.ProgressBarSync.Value+vProgres;
//     frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Enviando Status do Pedido AWS');
//    end);
//    DataModule1.ReplicaPedidoStatus('');
//    TThread.Synchronize(nil,procedure
//    begin
//     frmPrincipal.ProgressBarSync.Value :=frmPrincipal.ProgressBarSync.Value+vProgres;
//     frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Enviando Itens do Pedido AWS');
//    end);
//    DataModule1.ReplicaPedidoItenCompra('');
//    TThread.Synchronize(nil,procedure
//    begin
//     frmPrincipal.ProgressBarSync.Value :=frmPrincipal.ProgressBarSync.Value+vProgres;
//     frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Enviando Orçamentos AWS');
//    end);
//    DataModule1.ReplicaOrcamento('');
//    TThread.Synchronize(nil,procedure
//    begin
//     frmPrincipal.ProgressBarSync.Value :=frmPrincipal.ProgressBarSync.Value+vProgres;
//     frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Enviando Orçamentos Itens AWS');
//    end);
//    DataModule1.ReplicaOrcamentoItens('');


  TThread.Synchronize(nil,procedure
  begin
   frmPrincipal.ProgressBarSync.Value :=frmPrincipal.ProgressBarSync.Value+vProgres;
   frmPrincipal.laySync.visible       :=false;
   dbCtx.AtualizaSequencias;
  end);
 end).Start;
end;

function TDataModule2.ReplicaAreas: string;
var
 Url,vJsonString,vIsert,
 vField,vFieldJS,vId:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J,z:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/ReplicaAreas';
   lHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := lHTTP1.Get(URL);
    if(vJsonString<>'{"result":[{"Mensagem":"Nenhum Usuario encontrado!"}]}') then
    begin
      TAreas.Close;
      TAreas.Open;
      joName := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
      joItems := joName.GetValue('result') as TJSONArray;
      for i  := 0 to joItems.Count-1 do
      begin
        joItem := joItems.Items[I] as TJSONObject;
        vJoGet := joItem.GetValue('TSyncAreas') as TJSONArray;
        for j := 0 to vJoGet.Count-1 do
        begin
          vJoGetJ           := vJoGet.Items[j] as TJSONObject;
          vId               := vJoGetJ.GetValue('id').value;
          TAreas.Filtered := false;
          TAreas.Filter   := 'id='+vId;
          TAreas.Filtered := true;
          if not TAreas.IsEmpty then
           TAreas.Edit
          else
           TAreas.Insert;
          for z := 0 to TAreas.Fields.Count -1 do
          begin
           vField                                  := StringReplace(TAreas.Fields[z].Name,'TAreas','',[rfReplaceAll]);
           TAreas.FieldByName(vField).AsString   := vJoGetJ.GetValue(vField).value;
          end;
          TAreas.ApplyUpdates(-1);
          MudaFalgAWS('update areas set syncFaz=1 where id='+vId)
       end;
       result:='Usuarios Baixados com Sucesso!'
      end;
    end
    else
     Result :=vJsonString;
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;

function TDataModule2.ReplicaAuxCultivare: string;
var
 Url,vJsonString,vIsert,
 vField,vFieldJS,vId:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J,z:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/ReplicaAuxCultivare';
   lHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := lHTTP1.Get(URL);
    if(vJsonString<>'{"result":[{"Mensagem":"Nenhum Usuario encontrado!"}]}') then
    begin
      TAuxCultivares.Close;
      TAuxCultivares.Open;
      joName := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
      joItems := joName.GetValue('result') as TJSONArray;
      for i  := 0 to joItems.Count-1 do
      begin
        joItem := joItems.Items[I] as TJSONObject;
        vJoGet := joItem.GetValue('TAuxSyncCultivares') as TJSONArray;
        for j := 0 to vJoGet.Count-1 do
        begin
          vJoGetJ           := vJoGet.Items[j] as TJSONObject;
          vId               := vJoGetJ.GetValue('id').value;
          TAuxCultivares.Filtered := false;
          TAuxCultivares.Filter   := 'id='+vId;
          TAuxCultivares.Filtered := true;
          if not TAuxCultivares.IsEmpty then
           TAuxCultivares.Edit
          else
           TAuxCultivares.Insert;
          for z := 0 to TAuxCultivares.Fields.Count -1 do
          begin
           vField                                  := StringReplace(TAuxCultivares.Fields[z].Name,'TAuxCultivares','',[rfReplaceAll]);
           TAuxCultivares.FieldByName(vField).AsString   := vJoGetJ.GetValue(vField).value;
          end;
          TAuxCultivares.ApplyUpdates(-1);
          MudaFalgAWS('update auxcultivares set syncFaz=1 where id='+vId)
       end;
       result:='Usuarios Baixados com Sucesso!'
      end;
    end
    else
     Result :=vJsonString;
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;

function TDataModule2.ReplicaAuxCulturas: string;
var
 Url,vJsonString,vIsert,
 vField,vFieldJS,vId:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J,z:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/ReplicaAuxCulturas';
   lHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := lHTTP1.Get(URL);
    if(vJsonString<>'{"result":[{"Mensagem":"Nenhum Usuario encontrado!"}]}') then
    begin
      TAuxCulturas.Close;
      TAuxCulturas.Open;
      joName := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
      joItems := joName.GetValue('result') as TJSONArray;
      for i  := 0 to joItems.Count-1 do
      begin
        joItem := joItems.Items[I] as TJSONObject;
        vJoGet := joItem.GetValue('TSyncAuxCulturas') as TJSONArray;
        for j := 0 to vJoGet.Count-1 do
        begin
          vJoGetJ           := vJoGet.Items[j] as TJSONObject;
          vId               := vJoGetJ.GetValue('id').value;
          TAuxCulturas.Filtered := false;
          TAuxCulturas.Filter   := 'id='+vId;
          TAuxCulturas.Filtered := true;
          if not TAuxCulturas.IsEmpty then
           TAuxCulturas.Edit
          else
           TAuxCulturas.Insert;
          for z := 0 to TAuxCulturas.Fields.Count -1 do
          begin
           vField                                  := StringReplace(TAuxCulturas.Fields[z].Name,'TAuxCulturas','',[rfReplaceAll]);
           TAuxCulturas.FieldByName(vField).AsString   := vJoGetJ.GetValue(vField).value;
          end;
          TAuxCulturas.ApplyUpdates(-1);
          MudaFalgAWS('update auxculturas set syncFaz=1 where id='+vId)
       end;
       result:='Usuarios Baixados com Sucesso!'
      end;
    end
    else
     Result :=vJsonString;
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;

function TDataModule2.ReplicaAuxTipoMaquinaVeiculos: string;
var
 Url,vJsonString,vIsert,
 vField,vFieldJS,vId:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J,z:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/ReplicaAuxTipoMaquinaVeiculos';
   lHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := lHTTP1.Get(URL);
    if(vJsonString<>'{"result":[{"Mensagem":"Nenhum Usuario encontrado!"}]}') then
    begin
      TAuxTipoMaqVeic.Close;
      TAuxTipoMaqVeic.Open;
      joName := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
      joItems := joName.GetValue('result') as TJSONArray;
      for i  := 0 to joItems.Count-1 do
      begin
        joItem := joItems.Items[I] as TJSONObject;
        vJoGet := joItem.GetValue('TSyncAuxTipoMaqVeic') as TJSONArray;
        for j := 0 to vJoGet.Count-1 do
        begin
          vJoGetJ           := vJoGet.Items[j] as TJSONObject;
          vId               := vJoGetJ.GetValue('id').value;
          TAuxTipoMaqVeic.Filtered := false;
          TAuxTipoMaqVeic.Filter   := 'id='+vId;
          TAuxTipoMaqVeic.Filtered := true;
          if not TAuxTipoMaqVeic.IsEmpty then
           TAuxTipoMaqVeic.Edit
          else
           TAuxTipoMaqVeic.Insert;
          for z := 0 to TAuxTipoMaqVeic.Fields.Count -1 do
          begin
           vField                                  := StringReplace(TAuxTipoMaqVeic.Fields[z].Name,'TAuxTipoMaqVeic','',[rfReplaceAll]);
           TAuxTipoMaqVeic.FieldByName(vField).AsString   := vJoGetJ.GetValue(vField).value;
          end;
          TAuxTipoMaqVeic.ApplyUpdates(-1);
          MudaFalgAWS('update auxtipomaquinaveiculos set syncFaz=1 where id='+vId)
       end;
       result:='Usuarios Baixados com Sucesso!'
      end;
    end
    else
     Result :=vJsonString;
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;

function TDataModule2.ReplicaAuxTipoOcorrencia: string;
var
 Url,vJsonString,vIsert,
 vField,vFieldJS,vId:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J,z:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/ReplicaAuxTipoOcorrencia';
   lHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := lHTTP1.Get(URL);
    if(vJsonString<>'{"result":[{"Mensagem":"Nenhum Usuario encontrado!"}]}') then
    begin
      TAuxTipoOcorrencia.Close;
      TAuxTipoOcorrencia.Open;
      joName := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
      joItems := joName.GetValue('result') as TJSONArray;
      for i  := 0 to joItems.Count-1 do
      begin
        joItem := joItems.Items[I] as TJSONObject;
        vJoGet := joItem.GetValue('TSyncAuxTipoOcorrencia') as TJSONArray;
        for j := 0 to vJoGet.Count-1 do
        begin
          vJoGetJ           := vJoGet.Items[j] as TJSONObject;
          vId               := vJoGetJ.GetValue('id').value;
          TAuxTipoOcorrencia.Filtered := false;
          TAuxTipoOcorrencia.Filter   := 'id='+vId;
          TAuxTipoOcorrencia.Filtered := true;
          if not TAuxTipoOcorrencia.IsEmpty then
           TAuxTipoOcorrencia.Edit
          else
           TAuxTipoOcorrencia.Insert;
          for z := 0 to TAuxTipoOcorrencia.Fields.Count -1 do
          begin
           vField                                  := StringReplace(TAuxTipoOcorrencia.Fields[z].Name,'TAuxTipoOcorrencia','',[rfReplaceAll]);
           TAuxTipoOcorrencia.FieldByName(vField).AsString   := vJoGetJ.GetValue(vField).value;
          end;
          TAuxTipoOcorrencia.ApplyUpdates(-1);
          MudaFalgAWS('update auxtipoocorrencia set syncFaz=1 where id='+vId)
       end;
       result:='Usuarios Baixados com Sucesso!'
      end;
    end
    else
     Result :=vJsonString;
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;

function TDataModule2.ReplicaAuxTipoServico: string;
var
 Url,vJsonString,vIsert,
 vField,vFieldJS,vId:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J,z:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/ReplicaAuxTipoServico';
   lHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := lHTTP1.Get(URL);
    if(vJsonString<>'{"result":[{"Mensagem":"Nenhum Usuario encontrado!"}]}') then
    begin
      TAuxTipoServico.Close;
      TAuxTipoServico.Open;
      joName := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
      joItems := joName.GetValue('result') as TJSONArray;
      for i  := 0 to joItems.Count-1 do
      begin
        joItem := joItems.Items[I] as TJSONObject;
        vJoGet := joItem.GetValue('TSyncAuxTipoServico') as TJSONArray;
        for j := 0 to vJoGet.Count-1 do
        begin
          vJoGetJ           := vJoGet.Items[j] as TJSONObject;
          vId               := vJoGetJ.GetValue('id').value;
          TAuxTipoServico.Filtered := false;
          TAuxTipoServico.Filter   := 'id='+vId;
          TAuxTipoServico.Filtered := true;
          if not TAuxTipoServico.IsEmpty then
           TAuxTipoServico.Edit
          else
           TAuxTipoServico.Insert;
          for z := 0 to TAuxTipoServico.Fields.Count -1 do
          begin
           vField                                  := StringReplace(TAuxTipoServico.Fields[z].Name,'TAuxTipoServico','',[rfReplaceAll]);
           TAuxTipoServico.FieldByName(vField).AsString   := vJoGetJ.GetValue(vField).value;
          end;
          TAuxTipoServico.ApplyUpdates(-1);
          MudaFalgAWS('update auxtiposervico set syncFaz=1 where id='+vId)
       end;
       result:='Usuarios Baixados com Sucesso!'
      end;
    end
    else
     Result :=vJsonString;
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;

end;

function TDataModule2.ReplicaCategoria: string;
var
 Url,vJsonString,vIsert,
 vField,vFieldJS,vId:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J,z:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/ReplicaFazendaCategoria';
   lHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := lHTTP1.Get(URL);
    if(vJsonString<>'{"result":[{"Mensagem":"Nenhum Usuario encontrado!"}]}') then
    begin
      TAuxCategorias.Close;
      TAuxCategorias.Open;
      joName := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
      joItems := joName.GetValue('result') as TJSONArray;
      for i  := 0 to joItems.Count-1 do
      begin
        joItem := joItems.Items[I] as TJSONObject;
        vJoGet := joItem.GetValue('TSyncAuxCategorias') as TJSONArray;
        for j := 0 to vJoGet.Count-1 do
        begin
          vJoGetJ           := vJoGet.Items[j] as TJSONObject;
          vId               := vJoGetJ.GetValue('id').value;
          TAuxCategorias.Filtered := false;
          TAuxCategorias.Filter   := 'id='+vId;
          TAuxCategorias.Filtered := true;
          if not TAuxCategorias.IsEmpty then
           TAuxCategorias.Edit
          else
           TAuxCategorias.Insert;
          for z := 0 to TAuxCategorias.Fields.Count -1 do
          begin
           vField                                  := StringReplace(TAuxCategorias.Fields[z].Name,'TAuxCategorias','',[rfReplaceAll]);
           TAuxCategorias.FieldByName(vField).AsString   := vJoGetJ.GetValue(vField).value;
          end;
          TAuxCategorias.ApplyUpdates(-1);
          MudaFalgAWS('update auxcategoriaitem set syncFaz=1 where id='+vId)
       end;
       result:='Usuarios Baixados com Sucesso!'
      end;
    end
    else
     Result :=vJsonString;
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;

function TDataModule2.ReplicaCentroCusto: string;
var
 Url,vJsonString,vIsert,
 vField,vFieldJS,vId:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J,z:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/ReplicaCentroCusto';
   lHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := lHTTP1.Get(URL);
    if(vJsonString<>'{"result":[{"Mensagem":"Nenhum Usuario encontrado!"}]}') then
    begin
      TCentroCusto.Close;
      TCentroCusto.Open;
      joName := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
      joItems := joName.GetValue('result') as TJSONArray;
      for i  := 0 to joItems.Count-1 do
      begin
        joItem := joItems.Items[I] as TJSONObject;
        vJoGet := joItem.GetValue('TSyncCentroCusto') as TJSONArray;
        for j := 0 to vJoGet.Count-1 do
        begin
          vJoGetJ           := vJoGet.Items[j] as TJSONObject;
          vId               := vJoGetJ.GetValue('id').value;
          TCentroCusto.Filtered := false;
          TCentroCusto.Filter   := 'id='+vId;
          TCentroCusto.Filtered := true;
          if not TCentroCusto.IsEmpty then
           TCentroCusto.Edit
          else
           TCentroCusto.Insert;
          for z := 0 to TCentroCusto.Fields.Count -1 do
          begin
           vField                                  := StringReplace(TCentroCusto.Fields[z].Name,'TCentroCusto','',[rfReplaceAll]);
           TCentroCusto.FieldByName(vField).AsString   := vJoGetJ.GetValue(vField).value;
          end;
          TCentroCusto.ApplyUpdates(-1);
          MudaFalgAWS('update centrocusto set syncFaz=1 where id='+vId)
       end;
       result:='Usuarios Baixados com Sucesso!'
      end;
    end
    else
     Result :=vJsonString;
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;

function TDataModule2.ReplicaCobertura: string;
var
 Url,vJsonString,vIsert,
 vField,vFieldJS,vId:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J,z:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/ReplicaCobertura';
   lHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := lHTTP1.Get(URL);
    if(vJsonString<>'{"result":[{"Mensagem":"Nenhum Usuario encontrado!"}]}') then
    begin
      TAuxCobertura.Close;
      TAuxCobertura.Open;
      joName := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
      joItems := joName.GetValue('result') as TJSONArray;
      for i  := 0 to joItems.Count-1 do
      begin
        joItem := joItems.Items[I] as TJSONObject;
        vJoGet := joItem.GetValue('TAuxSyncCobertura') as TJSONArray;
        for j := 0 to vJoGet.Count-1 do
        begin
          vJoGetJ           := vJoGet.Items[j] as TJSONObject;
          vId               := vJoGetJ.GetValue('id').value;
          TAuxCobertura.Filtered := false;
          TAuxCobertura.Filter   := 'id='+vId;
          TAuxCobertura.Filtered := true;
          if not TAuxCobertura.IsEmpty then
           TAuxCobertura.Edit
          else
           TAuxCobertura.Insert;
          for z := 0 to TAuxCobertura.Fields.Count -1 do
          begin
           vField                                := StringReplace(TAuxCobertura.Fields[z].Name,'TAuxCobertura','',[rfReplaceAll]);
           TAuxCobertura.FieldByName(vField).AsString   := vJoGetJ.GetValue(vField).value;
          end;
          TAuxCobertura.ApplyUpdates(-1);
          MudaFalgAWS('update auxcobertura set syncFaz=1 where id='+vId)
       end;
       result:='Usuarios auxcobertura com Sucesso!'
      end;
    end
    else
     Result :=vJsonString;
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;

function TDataModule2.ReplicaDetReceituario: string;
var
 Url,vJsonString,vIsert,
 vField,vFieldJS,vId:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J,z:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/ReplicaDetReceituario';
   lHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := lHTTP1.Get(URL);
    if(vJsonString<>'{"result":[{"Mensagem":"Nenhum Usuario encontrado!"}]}') then
    begin
      TDetReceituario.Close;
      TDetReceituario.Open;
      joName := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
      joItems := joName.GetValue('result') as TJSONArray;
      for i  := 0 to joItems.Count-1 do
      begin
        joItem := joItems.Items[I] as TJSONObject;
        vJoGet := joItem.GetValue('TDetReceituario') as TJSONArray;
        for j := 0 to vJoGet.Count-1 do
        begin
          vJoGetJ           := vJoGet.Items[j] as TJSONObject;
          vId               := vJoGetJ.GetValue('id').value;
          TDetReceituario.Filtered := false;
          TDetReceituario.Filter   := 'id='+vId;
          TDetReceituario.Filtered := true;
          if not TDetReceituario.IsEmpty then
           TDetReceituario.Edit
          else
           TDetReceituario.Insert;
          for z := 0 to TDetReceituario.Fields.Count -1 do
          begin
           vField                                  := StringReplace(TDetReceituario.Fields[z].Name,'TDetReceituario','',[rfReplaceAll]);
           TDetReceituario.FieldByName(vField).AsString   := vJoGetJ.GetValue(vField).value;
          end;
          TDetReceituario.ApplyUpdates(-1);
          MudaFalgAWS('update detreceiturario set syncFaz=1 where id='+vId)
       end;
       result:='Usuarios Baixados com Sucesso!'
      end;
    end
    else
     Result :=vJsonString;
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;

function TDataModule2.ReplicaDetReceituarioTalhao: string;
var
 Url,vJsonString,vIsert,
 vField,vFieldJS,vId:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J,z:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/ReplicaDetReceituarioTalhao';
   lHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := lHTTP1.Get(URL);
    if(vJsonString<>'{"result":[{"Mensagem":"Nenhum Usuario encontrado!"}]}') then
    begin
      TDetReceituarioTalhao.Close;
      TDetReceituarioTalhao.Open;
      joName := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
      joItems := joName.GetValue('result') as TJSONArray;
      for i  := 0 to joItems.Count-1 do
      begin
        joItem := joItems.Items[I] as TJSONObject;
        vJoGet := joItem.GetValue('TDetReceituarioTalhao') as TJSONArray;
        for j := 0 to vJoGet.Count-1 do
        begin
          TDetReceituarioTalhao.Filtered := false;
          TDetReceituarioTalhao.Close;
          TDetReceituarioTalhao.Open;
          vJoGetJ           := vJoGet.Items[j] as TJSONObject;
          vId               := vJoGetJ.GetValue('id').value;
          TDetReceituarioTalhao.Filtered := false;
          TDetReceituarioTalhao.Filter   := 'id='+vId;
          TDetReceituarioTalhao.Filtered := true;
          if not TDetReceituarioTalhao.IsEmpty then
           TDetReceituarioTalhao.Edit
          else
           TDetReceituarioTalhao.Insert;
          for z := 0 to TDetReceituarioTalhao.Fields.Count -1 do
          begin
           vField                                  := StringReplace(TDetReceituarioTalhao.Fields[z].Name,
            'TDetReceituarioTalhao','',[rfReplaceAll]);
           TDetReceituarioTalhao.FieldByName(vField).AsString   := vJoGetJ.GetValue(vField).value;
          end;
          TDetReceituarioTalhao.ApplyUpdates(-1);
          MudaFalgAWS('update detreceiturarioTalhao set syncAWS=1,syncFaz=1 where id='+vId)
       end;
       result:='Dados Baixados com Sucesso!'
      end;
    end
    else
     Result :=vJsonString;
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;

function TDataModule2.ReplicaEstoqueEntrada: string;
var
 Url,vJsonString,vIsert,
 vField,vFieldJS,vId:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J,z:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/ReplicaEstoqueEntrada';
   lHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := lHTTP1.Get(URL);
    if(vJsonString<>'{"result":[{"Mensagem":"Nenhum Usuario encontrado!"}]}') then
    begin
      TEstoqueEntrada.Close;
      TEstoqueEntrada.Open;
      joName := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
      joItems := joName.GetValue('result') as TJSONArray;
      for i  := 0 to joItems.Count-1 do
      begin
        joItem := joItems.Items[I] as TJSONObject;
        vJoGet := joItem.GetValue('TSyncEstoqueEntrada') as TJSONArray;
        for j := 0 to vJoGet.Count-1 do
        begin
          vJoGetJ           := vJoGet.Items[j] as TJSONObject;
          vId               := vJoGetJ.GetValue('id').value;
          TEstoqueEntrada.Filtered := false;
          TEstoqueEntrada.Filter   := 'id='+vId;
          TEstoqueEntrada.Filtered := true;
          if not TEstoqueEntrada.IsEmpty then
           TEstoqueEntrada.Edit
          else
           TEstoqueEntrada.Insert;
          for z := 0 to TEstoqueEntrada.Fields.Count -1 do
          begin
           vField                                  := StringReplace(TEstoqueEntrada.Fields[z].Name,'TEstoqueEntrada','',[rfReplaceAll]);
           TEstoqueEntrada.FieldByName(vField).AsString   := vJoGetJ.GetValue(vField).value;
          end;
          TEstoqueEntrada.ApplyUpdates(-1);
          MudaFalgAWS('update estoqueentrada set syncFaz=1 where id='+vId)
       end;
       result:='Usuarios Baixados com Sucesso!'
      end;
    end
    else
     Result :=vJsonString;
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;

function TDataModule2.ReplicaFornecedor: string;
var
 Url,vJsonString,vIsert,
 vField,vFieldJS,vId:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J,z:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/ReplicaFornecedor';
   lHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := lHTTP1.Get(URL);
    if(vJsonString<>'{"result":[{"Mensagem":"Nenhum Usuario encontrado!"}]}') then
    begin
      TFornecedores.Close;
      TFornecedores.Open;
      joName := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
      joItems := joName.GetValue('result') as TJSONArray;
      for i  := 0 to joItems.Count-1 do
      begin
        joItem := joItems.Items[I] as TJSONObject;
        vJoGet := joItem.GetValue('TSyncFornecedores') as TJSONArray;
        for j := 0 to vJoGet.Count-1 do
        begin
          vJoGetJ           := vJoGet.Items[j] as TJSONObject;
          vId               := vJoGetJ.GetValue('id').value;
          TFornecedores.Filtered := false;
          TFornecedores.Filter   := 'id='+vId;
          TFornecedores.Filtered := true;
          if not TFornecedores.IsEmpty then
           TFornecedores.Edit
          else
           TFornecedores.Insert;
          for z := 0 to TFornecedores.Fields.Count -1 do
          begin
           vField                                  := StringReplace(TFornecedores.Fields[z].Name,'TFornecedores','',[rfReplaceAll]);
           TFornecedores.FieldByName(vField).AsString   := vJoGetJ.GetValue(vField).value;
          end;
          TFornecedores.ApplyUpdates(-1);
          MudaFalgAWS('update fornecedor set syncFaz=1 where id='+vId)
       end;
       result:='Usuarios Baixados com Sucesso!'
      end;
    end
    else
     Result :=vJsonString;
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;

function TDataModule2.ReplicaMaquinas: string;
var
 Url,vJsonString,vIsert,
 vField,vFieldJS,vId:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J,z:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/ReplicaMaquinas';
   lHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := lHTTP1.Get(URL);
    if(vJsonString<>'{"result":[{"Mensagem":"Nenhum Usuario encontrado!"}]}') then
    begin
      TMaquinas.Close;
      TMaquinas.Open;
      joName := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
      joItems := joName.GetValue('result') as TJSONArray;
      for i  := 0 to joItems.Count-1 do
      begin
        joItem := joItems.Items[I] as TJSONObject;
        vJoGet := joItem.GetValue('TSyncMaquinas') as TJSONArray;
        for j := 0 to vJoGet.Count-1 do
        begin
          vJoGetJ           := vJoGet.Items[j] as TJSONObject;
          vId               := vJoGetJ.GetValue('id').value;
          TMaquinas.Filtered := false;
          TMaquinas.Filter   := 'id='+vId;
          TMaquinas.Filtered := true;
          if not TMaquinas.IsEmpty then
           TMaquinas.Edit
          else
           TMaquinas.Insert;
          for z := 0 to TMaquinas.Fields.Count -1 do
          begin
           vField                                  := StringReplace(TMaquinas.Fields[z].Name,'TMaquinas','',[rfReplaceAll]);
           TMaquinas.FieldByName(vField).AsString   := vJoGetJ.GetValue(vField).value;
          end;
          TMaquinas.ApplyUpdates(-1);
          MudaFalgAWS('update maquinaveiculo set syncFaz=1 where id='+vId)
       end;
       result:='Usuarios Baixados com Sucesso!'
      end;
    end
    else
     Result :=vJsonString;
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;

end;

function TDataModule2.ReplicaMarcas: string;
var
 Url,vJsonString,vIsert,
 vField,vFieldJS,vId:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J,z:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/ReplicaFazendaMarcas';
   lHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := lHTTP1.Get(URL);
    if(vJsonString<>'{"result":[{"Mensagem":"Nenhum Usuario encontrado!"}]}') then
    begin
      TAuxMarca.Close;
      TAuxMarca.Open;
      joName := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
      joItems := joName.GetValue('result') as TJSONArray;
      for i  := 0 to joItems.Count-1 do
      begin
        joItem := joItems.Items[I] as TJSONObject;
        vJoGet := joItem.GetValue('TAuxMarcas') as TJSONArray;
        for j := 0 to vJoGet.Count-1 do
        begin
          vJoGetJ           := vJoGet.Items[j] as TJSONObject;
          vId               := vJoGetJ.GetValue('id').value;
          TAuxMarca.Filtered := false;
          TAuxMarca.Filter   := 'id='+vId;
          TAuxMarca.Filtered := true;
          if not TAuxMarca.IsEmpty then
           TAuxMarca.Edit
          else
           TAuxMarca.Insert;
          for z := 0 to TAuxMarca.Fields.Count -1 do
          begin
           vField                                  := StringReplace(TAuxMarca.Fields[z].Name,'TAuxMarca','',[rfReplaceAll]);
           TAuxMarca.FieldByName(vField).AsString   := vJoGetJ.GetValue(vField).value;
          end;
          TAuxMarca.ApplyUpdates(-1);
          MudaFalgAWS('update auxmarcas set syncFaz=1 where id='+vId)
       end;
       result:='Usuarios Baixados com Sucesso!'
      end;
    end
    else
     Result :=vJsonString;
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;

function TDataModule2.ReplicaOperacaoMaquinaTalhao: string;
var
 Url,vJsonString,vIsert,
 vField,vFieldJS,vId:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J,z:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/ReplicaOperacaoMaquinaTalhao';
   lHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := lHTTP1.Get(URL);
    if(vJsonString<>'{"result":[{"Mensagem":"Nenhum Usuario encontrado!"}]}') then
    begin
      TMaquinasOperacao.Close;
      TMaquinasOperacao.Open;
      joName := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
      joItems := joName.GetValue('result') as TJSONArray;
      for i  := 0 to joItems.Count-1 do
      begin
        joItem := joItems.Items[I] as TJSONObject;
        vJoGet := joItem.GetValue('TSyncMaquinasOperacao') as TJSONArray;
        for j := 0 to vJoGet.Count-1 do
        begin
          vJoGetJ           := vJoGet.Items[j] as TJSONObject;
          vId               := vJoGetJ.GetValue('id').value;
          TMaquinasOperacao.Filtered := false;
          TMaquinasOperacao.Filter   := 'id='+vId;
          TMaquinasOperacao.Filtered := true;
          if not TMaquinasOperacao.IsEmpty then
           TMaquinasOperacao.Edit
          else
           TMaquinasOperacao.Insert;
          for z := 0 to TMaquinasOperacao.Fields.Count -1 do
          begin
           vField                                  := StringReplace(TMaquinasOperacao.Fields[z].Name,'TMaquinasOperacao','',[rfReplaceAll]);
           TMaquinasOperacao.FieldByName(vField).AsString   := vJoGetJ.GetValue(vField).value;
          end;
          TMaquinasOperacao.ApplyUpdates(-1);
          MudaFalgAWS('update detoperacaosafratalhaomaquinasoperadores set syncFaz=1 where id='+vId)
       end;
       result:='Usuarios Baixados com Sucesso!'
      end;
    end
    else
     Result :=vJsonString;
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;

function TDataModule2.ReplicaOperacaoVazaoTalhao: string;
var
 Url,vJsonString,vIsert,
 vField,vFieldJS,vId:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J,z:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/ReplicaOperacaoVazaoTalhao';
   lHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := lHTTP1.Get(URL);
    if(vJsonString<>'{"result":[{"Mensagem":"Nenhum Usuario encontrado!"}]}') then
    begin
      TVazaoOperacao.Close;
      TVazaoOperacao.Open;
      joName := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
      joItems := joName.GetValue('result') as TJSONArray;
      for i  := 0 to joItems.Count-1 do
      begin
        joItem := joItems.Items[I] as TJSONObject;
        vJoGet := joItem.GetValue('TSyncVazaoOperacao') as TJSONArray;
        for j := 0 to vJoGet.Count-1 do
        begin
          vJoGetJ           := vJoGet.Items[j] as TJSONObject;
          vId               := vJoGetJ.GetValue('id').value;
          TVazaoOperacao.Filtered := false;
          TVazaoOperacao.Filter   := 'id='+vId;
          TVazaoOperacao.Filtered := true;
          if not TVazaoOperacao.IsEmpty then
           TVazaoOperacao.Edit
          else
           TVazaoOperacao.Insert;
          for z := 0 to TVazaoOperacao.Fields.Count -1 do
          begin
           vField                                          := StringReplace(TVazaoOperacao.Fields[z].Name,
            'TVazaoOperacao','',[rfReplaceAll]);
           TVazaoOperacao.FieldByName(vField).AsString     := vJoGetJ.GetValue(vField).value;
          end;
          TVazaoOperacao.ApplyUpdates(-1);
          MudaFalgAWS('update DetVazaoOperacao set syncAWS=1 where id='+vId)
       end;
       result:='Vazão Baixada com Sucesso!'
      end;
    end
    else
     Result :=vJsonString;
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;

function TDataModule2.ReplicaOperacaoOcorrenciaTalhao: string;
var
 Url,vJsonString,vIsert,
 vField,vFieldJS,vId:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J,z:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/ReplicaOperacaoOcorrenciaTalhao';
   lHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := lHTTP1.Get(URL);
    if(vJsonString<>'{"result":[{"Mensagem":"Nenhum Usuario encontrado!"}]}') then
    begin
      TOcorrenciaOperacao.Close;
      TOcorrenciaOperacao.Open;
      joName := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
      joItems := joName.GetValue('result') as TJSONArray;
      for i  := 0 to joItems.Count-1 do
      begin
        joItem := joItems.Items[I] as TJSONObject;
        vJoGet := joItem.GetValue('TSyncOcorrenciaOperacao') as TJSONArray;
        for j := 0 to vJoGet.Count-1 do
        begin
          vJoGetJ           := vJoGet.Items[j] as TJSONObject;
          vId               := vJoGetJ.GetValue('id').value;
          TOcorrenciaOperacao.Filtered := false;
          TOcorrenciaOperacao.Filter   := 'id='+vId;
          TOcorrenciaOperacao.Filtered := true;
          if not TOcorrenciaOperacao.IsEmpty then
           TOcorrenciaOperacao.Edit
          else
           TOcorrenciaOperacao.Insert;
          for z := 0 to TOcorrenciaOperacao.Fields.Count -1 do
          begin
           vField                                  := StringReplace(TOcorrenciaOperacao.Fields[z].Name,'TOcorrenciaOperacao','',[rfReplaceAll]);
           TOcorrenciaOperacao.FieldByName(vField).AsString   := vJoGetJ.GetValue(vField).value;
          end;
          TOcorrenciaOperacao.ApplyUpdates(-1);
          MudaFalgAWS('update detoperacaosafratalhaoocorrencia set syncFaz=1 where id='+vId)
       end;
       result:='Usuarios Baixados com Sucesso!'
      end;
    end
    else
     Result :=vJsonString;
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;

function TDataModule2.ReplicaOperacaoProdutosTalhao: string;
var
 Url,vJsonString,vIsert,
 vField,vFieldJS,vId:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J,z:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/ReplicaOperacaoProdutosTalhao';
   lHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := lHTTP1.Get(URL);
    if(vJsonString<>'{"result":[{"Mensagem":"Nenhum Usuario encontrado!"}]}') then
    begin
      TProdutosOperacao.Close;
      TProdutosOperacao.Open;
      joName := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
      joItems := joName.GetValue('result') as TJSONArray;
      for i  := 0 to joItems.Count-1 do
      begin
        joItem := joItems.Items[I] as TJSONObject;
        vJoGet := joItem.GetValue('TSyncProdutosOperacao') as TJSONArray;
        for j := 0 to vJoGet.Count-1 do
        begin
          vJoGetJ           := vJoGet.Items[j] as TJSONObject;
          vId               := vJoGetJ.GetValue('id').value;
          TProdutosOperacao.Filtered := false;
          TProdutosOperacao.Filter   := 'id='+vId;
          TProdutosOperacao.Filtered := true;
          if not TProdutosOperacao.IsEmpty then
           TProdutosOperacao.Edit
          else
           TProdutosOperacao.Insert;
          for z := 0 to TProdutosOperacao.Fields.Count -1 do
          begin
           vField                                  := StringReplace(TProdutosOperacao.Fields[z].Name,'TProdutosOperacao','',[rfReplaceAll]);
           TProdutosOperacao.FieldByName(vField).AsString   := vJoGetJ.GetValue(vField).value;
          end;
          TProdutosOperacao.ApplyUpdates(-1);
          MudaFalgAWS('update detoperacaosafratalhaoprodutos set syncFaz=1 where id='+vId)
       end;
       result:='Usuarios Baixados com Sucesso!'
      end;
    end
    else
     Result :=vJsonString;
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;

function TDataModule2.ReplicaOperacaoTalhao: string;
var
 Url,vJsonString,vIsert,
 vField,vFieldJS,vId:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J,z:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/ReplicaOperacaoTalhao';
   lHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := lHTTP1.Get(URL);
    if(vJsonString<>'{"result":[{"Mensagem":"Nenhum Usuario encontrado!"}]}') then
    begin
      TOperacaoSafraTalhao.Close;
      TOperacaoSafraTalhao.Open;
      joName := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
      joItems := joName.GetValue('result') as TJSONArray;
      for i  := 0 to joItems.Count-1 do
      begin
        joItem := joItems.Items[I] as TJSONObject;
        vJoGet := joItem.GetValue('TSyncOperacaoSafraTalhao') as TJSONArray;
        for j := 0 to vJoGet.Count-1 do
        begin
          vJoGetJ           := vJoGet.Items[j] as TJSONObject;
          vId               := vJoGetJ.GetValue('id').value;
          TOperacaoSafraTalhao.Filtered := false;
          TOperacaoSafraTalhao.Filter   := 'id='+vId;
          TOperacaoSafraTalhao.Filtered := true;
          if not TOperacaoSafraTalhao.IsEmpty then
           TOperacaoSafraTalhao.Edit
          else
           TOperacaoSafraTalhao.Insert;
          for z := 0 to TOperacaoSafraTalhao.Fields.Count -1 do
          begin
           vField                                  := StringReplace(TOperacaoSafraTalhao.Fields[z].Name,'TOperacaoSafraTalhao','',[rfReplaceAll]);
           TOperacaoSafraTalhao.FieldByName(vField).AsString   := vJoGetJ.GetValue(vField).value;
          end;
          TOperacaoSafraTalhao.ApplyUpdates(-1);
          MudaFalgAWS('update operacaosafratalhao set syncFaz=1 where id='+vId)
       end;
       result:='Usuarios Baixados com Sucesso!'
      end;
    end
    else
     Result :=vJsonString;
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;

function TDataModule2.ReplicaOperadorMaquina: string;
var
 Url,vJsonString,vIsert,
 vField,vFieldJS,vId:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J,z:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/ReplicaOperadorMaquina';
   lHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := lHTTP1.Get(URL);
    if(vJsonString<>'{"result":[{"Mensagem":"Nenhum Usuario encontrado!"}]}') then
    begin
      TOperadorMaquina.Close;
      TOperadorMaquina.Open;
      joName := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
      joItems := joName.GetValue('result') as TJSONArray;
      for i  := 0 to joItems.Count-1 do
      begin
        joItem := joItems.Items[I] as TJSONObject;
        vJoGet := joItem.GetValue('TSyncOperadorMaquina') as TJSONArray;
        for j := 0 to vJoGet.Count-1 do
        begin
          vJoGetJ           := vJoGet.Items[j] as TJSONObject;
          vId               := vJoGetJ.GetValue('id').value;
          TOperadorMaquina.Filtered := false;
          TOperadorMaquina.Filter   := 'id='+vId;
          TOperadorMaquina.Filtered := true;
          if not TOperadorMaquina.IsEmpty then
           TOperadorMaquina.Edit
          else
           TOperadorMaquina.Insert;
          for z := 0 to TOperadorMaquina.Fields.Count -1 do
          begin
           vField                                  := StringReplace(TOperadorMaquina.Fields[z].Name,'TOperadorMaquina','',[rfReplaceAll]);
           TOperadorMaquina.FieldByName(vField).AsString   := vJoGetJ.GetValue(vField).value;
          end;
          TOperadorMaquina.ApplyUpdates(-1);
          MudaFalgAWS('update operadormaquinas set syncFaz=1 where id='+vId)
       end;
       result:='Usuarios Baixados com Sucesso!'
      end;
    end
    else
     Result :=vJsonString;
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;

function TDataModule2.ReplicaOrcamento: string;
var
 Url,vJsonString,vIsert,
 vField,vFieldJS,vId:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J,z:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url := 'http://'+srvDtSanap+'/ReplicaOrcamento';
   lHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := lHTTP1.Get(URL);
    if(vJsonString<>'{"result":[{"Mensagem":"Nenhum Usuario encontrado!"}]}') then
    begin
      TOrcamento.Close;
      TOrcamento.Open;
      joName := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
      joItems := joName.GetValue('result') as TJSONArray;
      for i  := 0 to joItems.Count-1 do
      begin
        joItem := joItems.Items[I] as TJSONObject;
        vJoGet := joItem.GetValue('TOrcamento') as TJSONArray;
        for j := 0 to vJoGet.Count-1 do
        begin
          vJoGetJ           := vJoGet.Items[j] as TJSONObject;
          vId               := vJoGetJ.GetValue('id').value;
          TOrcamento.Filtered := false;
          TOrcamento.Filter   := 'id='+vId;
          TOrcamento.Filtered := true;
          if not TOrcamento.IsEmpty then
           TOrcamento.Edit
          else
           TOrcamento.Insert;
          for z := 0 to TOrcamento.Fields.Count -1 do
          begin
           vField                                  := StringReplace(TOrcamento.Fields[z].Name,'TOrcamento','',[rfReplaceAll]);
           TOrcamento.FieldByName(vField).AsString   := vJoGetJ.GetValue(vField).value;
          end;
          TOrcamento.ApplyUpdates(-1);
          MudaFalgAWS('update orcamentos set syncFaz=1 where id='+vId)
       end;
       result:='Usuarios Baixados com Sucesso!'
      end;
    end
    else
     Result :=vJsonString;
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;

function TDataModule2.ReplicaOrcamentoItens: string;
var
 Url,vJsonString,vIsert,
 vField,vFieldJS,vId,vIdProduto,vIdOrcamento:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J,z:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url := 'http://'+srvDtSanap+'/ReplicaOrcamentoItens';
   lHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := lHTTP1.Get(URL);
    if(vJsonString<>'{"result":[{"Mensagem":"Nenhum Usuario encontrado!"}]}') then
    begin
      TItensOrcamento.Close;
      TItensOrcamento.Open;
      joName := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
      joItems := joName.GetValue('result') as TJSONArray;
      for i  := 0 to joItems.Count-1 do
      begin
        joItem := joItems.Items[I] as TJSONObject;
        vJoGet := joItem.GetValue('TItensOrcamento') as TJSONArray;
        for j := 0 to vJoGet.Count-1 do
        begin
          vJoGetJ           := vJoGet.Items[j] as TJSONObject;
          vId               := vJoGetJ.GetValue('id').value;
          vIdOrcamento      := vJoGetJ.GetValue('idorcamento').value;
          vIdProduto        := vJoGetJ.GetValue('idproduto').value;

          TItensOrcamento.Filtered := false;
          TItensOrcamento.Filter   := 'idorcamento='+vIdOrcamento+' AND idproduto='+vIdProduto;
          TItensOrcamento.Filtered := true;
          if not TItensOrcamento.IsEmpty then
           TItensOrcamento.Edit
          else
           TItensOrcamento.Insert;
          for z := 0 to TItensOrcamento.Fields.Count -1 do
          begin
           vField                                  := StringReplace(TItensOrcamento.Fields[z].Name,'TItensOrcamento','',[rfReplaceAll]);
           TItensOrcamento.FieldByName(vField).AsString   := vJoGetJ.GetValue(vField).value;
          end;
          TItensOrcamento.ApplyUpdates(-1);
          MudaFalgAWS('update orcamentositens set syncFaz=1 where id='+vId)
       end;
       result:='Usuarios Baixados com Sucesso!'
      end;
    end
    else
     Result :=vJsonString;
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;

function TDataModule2.ReplicaPedidoCompra: string;
var
 Url,vJsonString,vIsert,
 vField,vFieldJS,vId:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J,z:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/ReplicaPedidoCompra';
   lHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := lHTTP1.Get(URL);
    if(vJsonString<>'{"result":[{"Mensagem":"Nenhum Usuario encontrado!"}]}') then
    begin
      TPedidoCompra.Close;
      TPedidoCompra.Open;
      joName := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
      joItems := joName.GetValue('result') as TJSONArray;
      for i  := 0 to joItems.Count-1 do
      begin
        joItem := joItems.Items[I] as TJSONObject;
        vJoGet := joItem.GetValue('TSyncPedidoCompra') as TJSONArray;
        for j := 0 to vJoGet.Count-1 do
        begin
          vJoGetJ           := vJoGet.Items[j] as TJSONObject;
          vId               := vJoGetJ.GetValue('id').value;
          TPedidoCompra.Filtered := false;
          TPedidoCompra.Filter   := 'id='+vId;
          TPedidoCompra.Filtered := true;
          if not TPedidoCompra.IsEmpty then
           TPedidoCompra.Edit
          else
           TPedidoCompra.Insert;
          for z := 0 to TPedidoCompra.Fields.Count -1 do
          begin
           vField                                  := StringReplace(TPedidoCompra.Fields[z].Name,'TPedidoCompra','',[rfReplaceAll]);
           TPedidoCompra.FieldByName(vField).AsString   := vJoGetJ.GetValue(vField).value;
          end;
          TPedidoCompra.ApplyUpdates(-1);
          MudaFalgAWS('update pedidocompra set syncFaz=1 where id='+vId)
       end;
       result:='Usuarios Baixados com Sucesso!'
      end;
    end
    else
     Result :=vJsonString;
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;

end;

function TDataModule2.ReplicaPedidoCompraItens: string;
var
 Url,vJsonString,vIsert,
 vField,vFieldJS,vId:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J,z:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url := 'http://'+srvDtSanap+'/ReplicaPedidoCompraItens';
   lHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := lHTTP1.Get(URL);
    if(vJsonString<>'{"result":[{"Mensagem":"Nenhum Usuario encontrado!"}]}') then
    begin
      TItensPedido.Close;
      TItensPedido.Open;
      joName := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
      joItems := joName.GetValue('result') as TJSONArray;
      for i  := 0 to joItems.Count-1 do
      begin
        joItem := joItems.Items[I] as TJSONObject;
        vJoGet := joItem.GetValue('TItensPedido') as TJSONArray;
        for j := 0 to vJoGet.Count-1 do
        begin
          vJoGetJ           := vJoGet.Items[j] as TJSONObject;
          vId               := vJoGetJ.GetValue('id').value;
          TItensPedido.Filtered := false;
          TItensPedido.Filter   := 'id='+vId;
          TItensPedido.Filtered := true;
          if not TItensPedido.IsEmpty then
           TItensPedido.Edit
          else
           TItensPedido.Insert;
          for z := 0 to TItensPedido.Fields.Count -1 do
          begin
           vField                                  := StringReplace(TItensPedido.Fields[z].Name,'TItensPedido','',[rfReplaceAll]);
           TItensPedido.FieldByName(vField).AsString   := vJoGetJ.GetValue(vField).value;
          end;
          TItensPedido.ApplyUpdates(-1);
          MudaFalgAWS('update pedidocompraitems set syncFaz=1 where id='+vId)
       end;
       result:='Usuarios Baixados com Sucesso!'
      end;
    end
    else
     Result :=vJsonString;
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;

function TDataModule2.ReplicaProduto: string;
var
 Url,vJsonString,vIsert,
 vField,vFieldJS,vId:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J,z:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/ReplicaFazendaProdutos';
   lHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := lHTTP1.Get(URL);
    if(vJsonString<>'{"result":[{"Mensagem":"Nenhum Usuario encontrado!"}]}') then
    begin
      TProdutos.Close;
      TProdutos.Open;
      joName := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
      joItems := joName.GetValue('result') as TJSONArray;
      for i  := 0 to joItems.Count-1 do
      begin
        joItem := joItems.Items[I] as TJSONObject;
        vJoGet := joItem.GetValue('TSyncProdutos') as TJSONArray;
        for j := 0 to vJoGet.Count-1 do
        begin
          vJoGetJ           := vJoGet.Items[j] as TJSONObject;
          vId               := vJoGetJ.GetValue('id').value;
          TProdutos.Filtered := false;
          TProdutos.Filter   := 'id='+vId;
          TProdutos.Filtered := true;
          if not TProdutos.IsEmpty then
           TProdutos.Edit
          else
           TProdutos.Insert;
          for z := 0 to TProdutos.Fields.Count -1 do
          begin
           vField                                  := StringReplace(TProdutos.Fields[z].Name,'TProdutos','',[rfReplaceAll]);
           TProdutos.FieldByName(vField).AsString   := vJoGetJ.GetValue(vField).value;
          end;
          TProdutos.ApplyUpdates(-1);
          MudaFalgAWS('update produtos set syncFaz=1 where id='+vId)
       end;
       result:='Usuarios Baixados com Sucesso!'
      end;
    end
    else
     Result :=vJsonString;
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;

function TDataModule2.ReplicaReceituario: string;
var
 Url,vJsonString,vIsert,
 vField,vFieldJS,vId:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J,z:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url := 'http://'+srvDtSanap+'/datasnap/rest/TServerMethods1/ReplicaReceituario';
   lHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := lHTTP1.Get(URL);
    if(vJsonString<>'{"result":[{"Mensagem":"Nenhum Usuario encontrado!"}]}') then
    begin
      TReceituario.Close;
      TReceituario.Open;
      joName := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
      joItems := joName.GetValue('result') as TJSONArray;
      for i  := 0 to joItems.Count-1 do
      begin
        joItem := joItems.Items[I] as TJSONObject;
        vJoGet := joItem.GetValue('TSyncReceituario') as TJSONArray;
        for j := 0 to vJoGet.Count-1 do
        begin
          vJoGetJ           := vJoGet.Items[j] as TJSONObject;
          vId               := vJoGetJ.GetValue('id').value;
          TReceituario.Filtered := false;
          TReceituario.Filter   := 'id='+vId;
          TReceituario.Filtered := true;
          if not TReceituario.IsEmpty then
           TReceituario.Edit
          else
           TReceituario.Insert;
          for z := 0 to TReceituario.Fields.Count -1 do
          begin
           vField                                  := StringReplace(TReceituario.Fields[z].Name,'TReceituario','',[rfReplaceAll]);
           TReceituario.FieldByName(vField).AsString   := vJoGetJ.GetValue(vField).value;
          end;
          TReceituario.ApplyUpdates(-1);
          MudaFalgAWS('update receiturario set syncFaz=1 where id='+vId)
       end;
       result:='Usuarios Baixados com Sucesso!'
      end;
    end
    else
     Result :=vJsonString;
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;

end.
