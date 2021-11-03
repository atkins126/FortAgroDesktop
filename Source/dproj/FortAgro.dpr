program FortAgro;

uses
  System.StartUpCopy,
  FMX.Forms,
  UPrincipal in '..\Principal\UPrincipal.pas' {frmPrincipal},
  UMsgDlg in '..\msg\UMsgDlg.pas' {FrmmsgDlg},
  UCadPadrao in '..\CadPadrao\UCadPadrao.pas' {frmCadPadrao},
  DataContext in '..\DataContex\DataContext.pas' {dbCtx: TDataModule},
  UUsuarios in '..\Usuarios\UUsuarios.pas' {frmUsuarios},
  UAuxMarcas in '..\Auxiliares\UAuxMarcas.pas' {frmCadAuxMarcas},
  UAuxTipoMaquinaVeiculo in '..\Auxiliares\UAuxTipoMaquinaVeiculo.pas' {frmAuxTipoMaquinaVeiculo},
  UCadMaquina in '..\Maquinas\UCadMaquina.pas' {frmCadMaquinaVeiculo},
  uFormat in '..\Tools\uFormat.pas',
  UAuxCultura in '..\Auxiliares\UAuxCultura.pas' {frmAuxCultura},
  UAuxVariedades in '..\Auxiliares\UAuxVariedades.pas' {frmAuxVariedades},
  UAreas in '..\Areas\UAreas.pas' {frmAreas},
  USetores in '..\Setores\USetores.pas' {frmSetores},
  UTalhoes in '..\Talhoes\UTalhoes.pas' {frmTalhoes},
  USafra in '..\Safra\USafra.pas' {frmSafra},
  UAuxOperacoes in '..\Auxiliares\UAuxOperacoes.pas' {frmAuxOperacao},
  UFornecedor in '..\Fornecedores\UFornecedor.pas' {frmCadFornecedor},
  UQuadroAtividades in '..\QuadroAtividades\UQuadroAtividades.pas' {frmQuadroAtividades},
  UAuxTipoOcorrencia in '..\Auxiliares\UAuxTipoOcorrencia.pas' {frmAuxtipoOcorrencia},
  UAuxTipoOperacaoSolido in '..\Auxiliares\UAuxTipoOperacaoSolido.pas' {frmAuxTipoAplicacaoSolido},
  UReceituario in '..\Receiturario\UReceituario.pas' {frmReceituario},
  UAuxCategoriaProd in '..\Auxiliares\UAuxCategoriaProd.pas' {frmAuxCategoriasProd},
  UAuxSubGrupo in '..\Auxiliares\UAuxSubGrupo.pas' {frmAuxSubgrupo},
  UProdutos in '..\Produtos\UProdutos.pas' {frmCadProdutos},
  UAuxGrupo in '..\Auxiliares\UAuxGrupo.pas' {frmAuxGrupo},
  UTipoServico in '..\Auxiliares\UTipoServico.pas' {frmAuxTipoServico},
  UServicos in '..\ServicosCompras\UServicos.pas' {frmCadServico},
  UPedidoCompra in '..\PedidoCompras\UPedidoCompra.pas' {frmCadPedidos},
  UDmReports in '..\Reports\UDmReports.pas' {dmReport: TDataModule},
  UAuxCobertura in '..\Auxiliares\UAuxCobertura.pas' {frmAuxCobertura},
  dmReplicacao in '..\dmReplicacao\dmReplicacao.pas' {DataModule1: TDataModule},
  DmReplicaFaz in '..\dmReplicaFaz\DmReplicaFaz.pas' {DataModule2: TDataModule},
  Data.FireDACJSONConsts in '..\Util\Data.FireDACJSONConsts.pas',
  Data.FireDACJSONReflect in '..\Util\Data.FireDACJSONReflect.pas',
  UAuxTipoCultivar in '..\Auxiliares\UAuxTipoCultivar.pas' {frmAuxTipoCultivar},
  UEntradaEstoque in '..\Estoque\Entrada\UEntradaEstoque.pas' {frmCadEntradaEstoque},
  LocalEstoque in '..\Estoque\Axiliares\LocalEstoque.pas' {frmLocalEstoque},
  UCentrodeCusto in '..\Estoque\Axiliares\UCentrodeCusto.pas' {frmCentroCusto},
  UOperadorMaquinas in '..\Auxiliares\UOperadorMaquinas.pas' {frmOperadorMaquinas},
  URelOperacao in '..\Reports\URelOperacao.pas' {frmRelOperacao},
  UPluviometro in '..\Pluviometro\UPluviometro.pas' {frmPluviometro},
  UAbastecimento in '..\Abastecimento\UAbastecimento.pas' {frmAbastecimento},
  UAuxPragas in '..\Auxiliares\UAuxPragas.pas' {frmAuxPragas},
  UMonitoramento in '..\Monitoramento\UMonitoramento.pas' {frmMonitoramento},
  UAuxPragaTipo in '..\Auxiliares\UAuxPragaTipo.pas' {frmCadAuxPragaTipo},
  UItensRevisao in '..\Auxiliares\UItensRevisao.pas' {frmAuxItemRevisao},
  UDMRevisao in '..\DataContex\UDMRevisao.pas' {dmRevisao: TDataModule},
  UCadRevisao in '..\Revisao\UCadRevisao.pas' {frmCadRevisao},
  UMovEntreLocalEstoque in '..\Estoque\MovEntreLocal\UMovEntreLocalEstoque.pas' {frmMovLocalEstoque},
  UAuxAtividadeAbastecimento in '..\Auxiliares\UAuxAtividadeAbastecimento.pas' {frmAuxAtividadeAbastecimento},
  UListaOrcamentos in '..\ListaOrcamentos\UListaOrcamentos.pas' {frmListaOrcamento},
  UComprador in '..\Comprador\UComprador.pas' {frmCadComprador},
  UContratosSafra in '..\UContratosSafra.pas' {frmCadContratos},
  UdmReport in '..\dmReport\UdmReport.pas' {dmRel: TDataModule},
  UdmCompras in '..\dmCompras\UdmCompras.pas' {dmCompras: TDataModule},
  URevisaoMaquinas in '..\RevisaoMaquinas\URevisaoMaquinas.pas' {frmCadRevisaoMaquinas},
  USaidaEstoque in '..\Estoque\Saida\USaidaEstoque.pas' {frmSaidaEstoque},
  UGerencialEstoque in '..\Estoque\Gerenciamento\UGerencialEstoque.pas' {frmGerencialEstoque},
  UServicoRevisao in '..\ServicoRevisao\UServicoRevisao.pas' {frmCadPadrao1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdbCtx, dbCtx);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TDataModule2, DataModule2);
  Application.CreateForm(TdmRevisao, dmRevisao);
  Application.CreateForm(TdmRel, dmRel);
  Application.CreateForm(TdmCompras, dmCompras);
  Application.CreateForm(TdmReport, dmReport);
  Application.CreateForm(TfrmSaidaEstoque, frmSaidaEstoque);
  Application.CreateForm(TfrmGerencialEstoque, frmGerencialEstoque);
  Application.CreateForm(TfrmCadPadrao1, frmCadPadrao1);
  Application.CreateForm(TfrmAbastecimento, frmAbastecimento);
  Application.Run;
end.
