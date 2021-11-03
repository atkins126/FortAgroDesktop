unit UPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.TabControl, FMX.Ani, FMX.ActnList, System.Actions,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit, FMX.TreeView,Winapi.Windows,
  FMX.Effects, System.Notification, FMX.ScrollBox, FMX.Memo, FMX.WebBrowser,
  shellapi, FMX.Memo.Types;

type
  TfrmPrincipal = class(TForm)
    tbPrincipal: TTabControl;
    tbiLogin: TTabItem;
    tbiMenu: TTabItem;
    layLogin: TLayout;
    Image2: TImage;
    layMnuPrincipal: TLayout;
    Layout2: TLayout;
    Image3: TImage;
    actAcoes: TActionList;
    actMudarAba: TChangeTabAction;
    AcMudarAbaChart: TAction;
    AcMudarAbaDespesas: TAction;
    AcLeft: TAction;
    AcRigth: TAction;
    Timer1: TTimer;
    StyleBook1: TStyleBook;
    layLoginAnimaiton: TLayout;
    recLogin: TRectangle;
    Layout3: TLayout;
    Layout4: TLayout;
    Label1: TLabel;
    edtUsuario: TEdit;
    Label2: TLabel;
    edtSenha: TEdit;
    Layout5: TLayout;
    btnEntrar: TRectangle;
    Label3: TLabel;
    Image4: TImage;
    Layout6: TLayout;
    Image1: TImage;
    Animation: TFloatAnimation;
    layMnu: TLayout;
    TreeView1: TTreeView;
    AnimacaoMnu: TFloatAnimation;
    TreeViewItem1: TTreeViewItem;
    Image5: TImage;
    AnimationPrincipal: TFloatAnimation;
    ToolBar1: TToolBar;
    ToolBar2: TToolBar;
    TreeExAuxiliares: TTreeViewItem;
    Image12: TImage;
    TreeMarcas: TTreeViewItem;
    TreeTipoMaquinaVeiculo: TTreeViewItem;
    TreeMaquinas: TTreeViewItem;
    Image6: TImage;
    Image8: TImage;
    Image9: TImage;
    TreeCulturas: TTreeViewItem;
    TreeVariedades: TTreeViewItem;
    Image10: TImage;
    Image11: TImage;
    TreeAreas: TTreeViewItem;
    Image13: TImage;
    ToolBar3: TToolBar;
    Label4: TLabel;
    ToolBar4: TToolBar;
    mnu: TImage;
    btnFechar: TImage;
    Image16: TImage;
    TreeSafra: TTreeViewItem;
    Image17: TImage;
    TreeOperacoes: TTreeViewItem;
    Image18: TImage;
    TreeInsumos: TTreeViewItem;
    TreeFornecedores: TTreeViewItem;
    Image19: TImage;
    TreeProdutos: TTreeViewItem;
    Image20: TImage;
    Image23: TImage;
    TreeSetores: TTreeViewItem;
    Image14: TImage;
    TreeTalhoes: TTreeViewItem;
    Image15: TImage;
    imgRetanguloLista: TImage;
    TreeQuadroAtividades: TTreeViewItem;
    Image21: TImage;
    TreeAuxTipoOcorrencia: TTreeViewItem;
    Image22: TImage;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    Rectangle4: TRectangle;
    lblMenu: TLabel;
    lblVersao: TLabel;
    lblVersao2: TLabel;
    ShadowEffect1: TShadowEffect;
    ShadowEffect2: TShadowEffect;
    TreeAuxTipoAplicacaoSolido: TTreeViewItem;
    Image24: TImage;
    TreeReceituario: TTreeViewItem;
    Image25: TImage;
    TreeAgricula: TTreeViewItem;
    Image26: TImage;
    TreeCadastrosGerais: TTreeViewItem;
    Image27: TImage;
    TreeAuxTipoServico: TTreeViewItem;
    Image28: TImage;
    TreeCompras: TTreeViewItem;
    Image29: TImage;
    TreeViewItem2: TTreeViewItem;
    Image30: TImage;
    TreePedidos: TTreeViewItem;
    Image7: TImage;
    TreeAuxAgri: TTreeViewItem;
    TreeViewItem6: TTreeViewItem;
    Image33: TImage;
    TreeViewItem7: TTreeViewItem;
    Image34: TImage;
    TreeViewItem8: TTreeViewItem;
    Image35: TImage;
    Image41: TImage;
    TreeAuxCompras: TTreeViewItem;
    TreeViewItem12: TTreeViewItem;
    Image39: TImage;
    ShadowEffect3: TShadowEffect;
    TreeViewItem13: TTreeViewItem;
    Image40: TImage;
    TreeViewItem16: TTreeViewItem;
    Image44: TImage;
    Image45: TImage;
    TreeCoberturas: TTreeViewItem;
    Image31: TImage;
    NotificationCenter1: TNotificationCenter;
    TreeSetor: TTreeViewItem;
    Image32: TImage;
    TreeAreasAgri: TTreeViewItem;
    Image36: TImage;
    TreeEstoque: TTreeViewItem;
    TreeViewItem4: TTreeViewItem;
    TreeViewItem5: TTreeViewItem;
    Image37: TImage;
    ShadowEffect4: TShadowEffect;
    TreeViewItem9: TTreeViewItem;
    Image38: TImage;
    TreeViewItem10: TTreeViewItem;
    Image42: TImage;
    Image43: TImage;
    TreeLocalEstoque: TTreeViewItem;
    Image46: TImage;
    TreeCentroCusto: TTreeViewItem;
    Image47: TImage;
    Image48: TImage;
    TreeEstoqueEntrada: TTreeViewItem;
    Image49: TImage;
    TreeOperadorMaquina: TTreeViewItem;
    Image50: TImage;
    laySync: TLayout;
    Rectangle5: TRectangle;
    Layout1: TLayout;
    Layout7: TLayout;
    imgSync: TImage;
    Label6: TLabel;
    ProgressBarSync: TProgressBar;
    msmoSync: TMemo;
    Animacao: TFloatAnimation;
    lblTipoDB: TLabel;
    lblPathDB: TLabel;
    TreeRelatorios: TTreeViewItem;
    Image51: TImage;
    TreePluviometro: TTreeViewItem;
    Image52: TImage;
    TreeAbastecimento: TTreeViewItem;
    Image53: TImage;
    layDash: TLayout;
    TreeDash: TTreeViewItem;
    Image61: TImage;
    TreeAuxPragas: TTreeViewItem;
    Image54: TImage;
    TreeMonitoramento: TTreeViewItem;
    Image55: TImage;
    imgPonto: TImage;
    TreeTipoPraga: TTreeViewItem;
    Image56: TImage;
    TreeItensRevisao: TTreeViewItem;
    Image57: TImage;
    TreeCadMaquinas: TTreeViewItem;
    Image58: TImage;
    TreeRevisao: TTreeViewItem;
    IMG_REVISAO: TImage;
    TreeViewMovLocal: TTreeViewItem;
    Image60: TImage;
    TreeBntAtividades: TTreeViewItem;
    Image62: TImage;
    TreeOrcamento: TTreeViewItem;
    Image63: TImage;
    TreeViewItem3: TTreeViewItem;
    Image64: TImage;
    TreeComprador: TTreeViewItem;
    TreeContratos: TTreeViewItem;
    Image65: TImage;
    Image66: TImage;
    TreeCadManutencao: TTreeViewItem;
    Image59: TImage;
    imgDelete: TImage;
    imgEdit: TImage;
    imgConfirmar: TImage;
    imgConfirmado: TImage;
    TreeSaidaEstoque: TTreeViewItem;
    Image67: TImage;
    TreeGerenciamentoEstoque: TTreeViewItem;
    Image68: TImage;
    imgVerific: TImage;
    imgLub: TImage;
    imgObs: TImage;
    imgChk: TImage;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnEntrarClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure TreeViewItem1Click(Sender: TObject);
    procedure edtUsuarioExit(Sender: TObject);
    procedure edtSenhaKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure edtUsuarioKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure TreeMarcasClick(Sender: TObject);
    procedure TreeTipoMaquinaVeiculoClick(Sender: TObject);
    procedure TreeExAuxiliaresClick(Sender: TObject);
    procedure TreeMaquinasClick(Sender: TObject);
    procedure TreeCulturasClick(Sender: TObject);
    procedure TreeVariedadesClick(Sender: TObject);
    procedure TreeExAgriculturaClick(Sender: TObject);
    procedure mnuClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure TreeAreasClick(Sender: TObject);
    procedure TreeSetoresClick(Sender: TObject);
    procedure TreeTalhoesClick(Sender: TObject);
    procedure TreeSafraClick(Sender: TObject);
    procedure TreeOperacoesClick(Sender: TObject);
    procedure TreeFornecedoresClick(Sender: TObject);
    procedure TreeProdutosClick(Sender: TObject);
    procedure TreeInsumosClick(Sender: TObject);
    procedure TreeQuadroAtividadesClick(Sender: TObject);
    procedure TreeAuxTipoOcorrenciaClick(Sender: TObject);
    procedure TreeAuxTipoAplicacaoSolidoClick(Sender: TObject);
    procedure TreeReceituarioClick(Sender: TObject);
    procedure TreeCadastrosGeraisClick(Sender: TObject);
    procedure TreeAgriculaClick(Sender: TObject);
    procedure TreeAuxTipoServicoClick(Sender: TObject);
    procedure TreeViewItem2Click(Sender: TObject);
    procedure TreeComprasClick(Sender: TObject);
    procedure TreePedidosClick(Sender: TObject);
    procedure TreeAuxAgriClick(Sender: TObject);
    procedure TreeAuxComprasClick(Sender: TObject);
    procedure TreeCoberturasClick(Sender: TObject);
    procedure TreeAreasAgriClick(Sender: TObject);
    procedure TreeSetorClick(Sender: TObject);
    procedure TreeLocalEstoqueClick(Sender: TObject);
    procedure TreeCentroCustoClick(Sender: TObject);
    procedure TreeEstoqueClick(Sender: TObject);
    procedure TreeEstoqueEntradaClick(Sender: TObject);
    procedure TreeOperadorMaquinaClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure TreeRelatoriosClick(Sender: TObject);
    procedure TreePluviometroClick(Sender: TObject);
    procedure TreeAbastecimentoClick(Sender: TObject);
    procedure TreeDashClick(Sender: TObject);
    procedure TreeAuxPragasClick(Sender: TObject);
    procedure TreeMonitoramentoClick(Sender: TObject);
    procedure TreeTipoPragaClick(Sender: TObject);
    procedure TreeItensRevisaoClick(Sender: TObject);
    procedure TreeCadMaquinasClick(Sender: TObject);
    procedure TreeRevisaoClick(Sender: TObject);
    procedure TreeViewMovLocalClick(Sender: TObject);
    procedure TreeBntAtividadesClick(Sender: TObject);
    procedure TreeOrcamentoClick(Sender: TObject);
    procedure TreeViewItem3Click(Sender: TObject);
    procedure TreeContratosClick(Sender: TObject);
    procedure TreeCompradorClick(Sender: TObject);
    procedure TreeCadManutencaoClick(Sender: TObject);
    procedure TreeSaidaEstoqueClick(Sender: TObject);
    procedure TreeGerenciamentoEstoqueClick(Sender: TObject);
  private
    vWebBrowser:TWebBrowser;
    procedure FechaMnu;
    procedure ReCreateBrowser(URL: STRING);
  public
    vPositionX,vPositionY:Single;
    iTimer,vMsgConfirma,vTSelectTalhao :integer;
    procedure MudarAba(ATabItem: TTabItem; sender: TObject);
    procedure MyShowMessage(msg: string;btnCancel:Boolean);
    function  GetVersaoArq: string;
    procedure Notificacao(Titulo,Notificacao:string);
    procedure GeraDash;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

uses UMsgDlg, UCadPadrao, DataContext, UUsuarios, UAuxMarcas,
  UAuxTipoMaquinaVeiculo, UCadMaquina, UAuxCultura, UAuxVariedades, UAreas,
  uFormat, USetores, UTalhoes, USafra, UAuxOperacoes, UFornecedor, UProdutos,
  UQuadroAtividades, UAuxTipoOcorrencia, UAuxTipoOperacaoSolido, UReceituario,
  UAuxCategoriaProd, UAuxGrupo, UAuxSubGrupo, UTipoServico, UServicos,
  UPedidoCompra, UAuxCobertura, dmReplicacao, LocalEstoque, UCentrodeCusto,
  UEntradaEstoque, UOperadorMaquinas, DmReplicaFaz, URelOperacao, UPluviometro,
  UAbastecimento, UAuxPragas, UMonitoramento, UAuxPragaTipo, UAuxTipoCultivar,
  UdmReport, UDmReports, UItensRevisao, UCadRevisao, UMovEntreLocalEstoque,
  UAuxAtividadeAbastecimento, UListaOrcamentos, UComprador, UContratosSafra,
  URevisaoMaquinas, USaidaEstoque, UGerencialEstoque;

procedure TfrmPrincipal.Notificacao(Titulo,Notificacao:string);
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

procedure TfrmPrincipal.ReCreateBrowser(URL: STRING);
begin
    layDash.Visible            := true;
    vWebBrowser                := TWebBrowser.Create(LayDash);
    vWebBrowser.Name           := 'WebBrowser';
    vWebBrowser.Parent         := LayDash;
    vWebBrowser.Visible        := true;
    vWebBrowser.Margins.Top    := 10;
    vWebBrowser.Margins.Left   := 10;
    vWebBrowser.Align          := TAlignLayout.Client;
    vWebBrowser.Opacity        := 0.5;
    vWebBrowser.URL :=URL;
end;

procedure TfrmPrincipal.GeraDash;
begin
 if dbCtx.vURLMetabase.Length>0 then
 begin
  if vWebBrowser<>nil  then vWebBrowser.Free;
  TThread.CreateAnonymousThread(procedure()
  begin
   TThread.Synchronize(TThread.CurrentThread,
   procedure ()
   begin
     ReCreateBrowser(dbCtx.vURLMetabase);
   end);
  end).Start;
 end;
end;

function TfrmPrincipal.GetVersaoArq: string;
var
  VerInfoSize: DWORD;
  VerInfo: Pointer;
  VerValueSize: DWORD;
  VerValue: PVSFixedFileInfo;
  Dummy: DWORD;
begin
  VerInfoSize := GetFileVersionInfoSize(PChar(
  ParamStr(0)), Dummy);
  GetMem(VerInfo, VerInfoSize);
  GetFileVersionInfo(PChar(ParamStr(0)), 0,
  VerInfoSize, VerInfo);
  VerQueryValue(VerInfo, '\', Pointer(VerValue),
  VerValueSize);
  with VerValue^ do
  begin
    Result := IntToStr(dwFileVersionMS shr 16);
    Result := Result + '.' + IntToStr(
    dwFileVersionMS and $FFFF);
    Result := Result + '.' + IntToStr(
    dwFileVersionLS shr 16);
    Result := Result + '.' + IntToStr(
    dwFileVersionLS and $FFFF);
  end;
  FreeMem(VerInfo, VerInfoSize);
end;

procedure TfrmPrincipal.btnEntrarClick(Sender: TObject);
begin
 if edtUsuario.Text.Length=0 then
 begin
  MyShowMessage('Informe o Usuario',false);
  edtUsuario.SetFocus;
  Exit;
 end;
 if edtSenha.Text.Length=0 then
 begin
  MyShowMessage('Informe a Senha',false);
  edtSenha.SetFocus;
  Exit;
 end;
 if not dbCtx.ValidaUsuario(edtUsuario.Text, edtSenha.Text) then
 begin
  dbCtx.AtaulizaValorMedioProdutoGeral;
  MudarAba(tbiMenu,Sender);
  if dmReport=NIL then
  begin
   dmReport := TdmReport.Create(self);
  end;
  AnimacaoMnu.Start;
 end
 else
 begin
  MyShowMessage('Usuario ou Senha invalidos!',false);
  edtSenha.SetFocus;
  edtSenha.SelectAll;
 end;
end;

procedure TfrmPrincipal.btnFecharClick(Sender: TObject);
begin
 Application.Terminate;
end;

procedure TfrmPrincipal.edtSenhaKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
 if key=13 then
  btnEntrarClick(sender);
end;

procedure TfrmPrincipal.edtUsuarioExit(Sender: TObject);
begin
 TThread.CreateAnonymousThread(procedure()
 begin
  TThread.Synchronize(TThread.CurrentThread,
  procedure ()
  begin
    edtSenha.SetFocus;
  end);
 end).Start;
end;

procedure TfrmPrincipal.edtUsuarioKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
 if key=13 then
  btnEntrarClick(sender);
end;

procedure TfrmPrincipal.FechaMnu;
begin
 TreeExAuxiliares.IsExpanded  := false;
 TreeInsumos.IsExpanded       := false;
 TreeCompras.IsExpanded       := false;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
 Timer1.Enabled   := false;
end;

procedure TfrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
var
 Arquivo,
 vDataBase,vServer,vUser_name,vPassword,vPorta :string;
begin
 Arquivo := ExtractFilePath(ParamStr(0))+'ReplyAWS.exe';
 if(Key=VK_F5) then
 begin
  if not FileExists(Arquivo) then
  begin
    ShowMessage('Arquivo ReplyAWS.exe não localizado no seguinte diretorio:'+#13+
    Arquivo);
    Exit;
  end
  else
   ShellExecute(GetDesktopWindow,'open',pchar(Arquivo),nil,nil,sw_show);
 end;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  layDash.Visible := false;
  laySync.Visible := false;
  dbCtx.AbreSystemConfig;
//  if dbCtx.vTipoBDConfig=0 then
//  begin
//   lblTipoDB.Text         := 'Escritório:';
//   Animacao.Loop          := true;
//   Animacao.PropertyName  := 'RotationAngle';
//   Animacao.AnimationType := TAnimationType.InOut;
//   Animacao.Interpolation := TInterpolationType.Linear;
//   Animacao.Start;
//   DataModule1.ReplicaAll;
//  end;
//  if dbCtx.vTipoBDConfig=2 then
//  begin
//   lblTipoDB.Text         := 'Fazenda:';
//   DataModule2.ReplicaAll;
//   Animacao.Loop          := true;
//   Animacao.PropertyName  := 'RotationAngle';
//   Animacao.AnimationType := TAnimationType.InOut;
//   Animacao.Interpolation := TInterpolationType.Linear;
//   Animacao.Start;
//  end;

  lblVersao.Text            := 'Versão: '+GetVersaoArq;
  lblVersao2.Text           := 'Versão: '+GetVersaoArq;
  layMnu.Opacity            := 0;
  tbPrincipal.TabPosition   := TTabPosition.None;
  tbPrincipal.ActiveTab     := tbiLogin;
  layLoginAnimaiton.Visible := false;
  Timer1.Enabled            := true;
  edtUsuario.SetFocus;
end;

procedure TfrmPrincipal.mnuClick(Sender: TObject);
begin
 if layMnu.Width=250 then
  layMnu.Width:=0
 else
  layMnu.Width:=250
end;

procedure TfrmPrincipal.MudarAba(ATabItem: TTabItem; sender: TObject);
begin
   actMudarAba.Tab := ATabItem;
   actMudarAba.ExecuteTarget(sender);
end;

procedure TfrmPrincipal.MyShowMessage(msg: string; btnCancel: Boolean);
var
 dlg :TFrmmsgDlg;
begin
  dlg := TFrmmsgDlg.Create(nil);
  dlg.Position := TFormPosition.ScreenCenter;
  dlg.msg.Text := msg;
  dlg.btnCancel.Visible := btnCancel;
  dlg.ShowModal(
  procedure(ModalResult: TModalResult)
  begin
  end);
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin
 layLoginAnimaiton.Visible := true;
 Animation.Start;
 Timer1.Enabled := false;
end;

procedure TfrmPrincipal.TreeEstoqueClick(Sender: TObject);
begin
 TreeExAuxiliares.IsExpanded  := false;
 TreeInsumos.IsExpanded       := false;
 TreeCompras.IsExpanded       := false;
 if TreeEstoque.IsExpanded then
   TreeEstoque.IsExpanded := false
  else
   TreeEstoque.IsExpanded := true;
end;

procedure TfrmPrincipal.TreeEstoqueEntradaClick(Sender: TObject);
begin
  frmCadEntradaEstoque :=  TfrmCadEntradaEstoque.Create(Self);
  try
    layMnuPrincipal.Opacity :=0;
    frmCadEntradaEstoque.ShowModal;
  finally
    AnimationPrincipal.Start;
    frmCadEntradaEstoque.Free;
  end;
end;

procedure TfrmPrincipal.TreeExAgriculturaClick(Sender: TObject);
begin
 TreeExAuxiliares.IsExpanded := false;
 TreeInsumos.IsExpanded      := false;
end;

procedure TfrmPrincipal.TreeExAuxiliaresClick(Sender: TObject);
begin
 TreeInsumos.IsExpanded       := false;
 if TreeExAuxiliares.IsExpanded then
  TreeExAuxiliares.IsExpanded := false
 else
  TreeExAuxiliares.IsExpanded := true;
end;

procedure TfrmPrincipal.TreeFornecedoresClick(Sender: TObject);
begin
 frmCadFornecedor := TfrmCadFornecedor.Create(Self);
  try
    layMnuPrincipal.Opacity :=0;
    frmCadFornecedor.ShowModal;
  finally
    AnimationPrincipal.Start;
    frmCadFornecedor.Free;
  end;
end;

procedure TfrmPrincipal.TreeGerenciamentoEstoqueClick(Sender: TObject);
begin
  frmGerencialEstoque := TfrmGerencialEstoque.Create(Self);
  try
    layMnuPrincipal.Opacity :=0;
    frmGerencialEstoque.ShowModal;
  finally
    AnimationPrincipal.Start;
    frmGerencialEstoque.Free;
  end;
end;

procedure TfrmPrincipal.TreeInsumosClick(Sender: TObject);
begin
 TreeExAuxiliares.IsExpanded       := false;
 if TreeInsumos.IsExpanded then
  TreeInsumos.IsExpanded := false
 else
  TreeInsumos.IsExpanded := true;
end;

procedure TfrmPrincipal.TreeItensRevisaoClick(Sender: TObject);
begin
  frmAuxItemRevisao := TfrmAuxItemRevisao.Create(Self);
  try
    layMnuPrincipal.Opacity :=0;
    frmAuxItemRevisao.ShowModal;
  finally
    AnimationPrincipal.Start;
    frmAuxItemRevisao.Free;
  end;
end;

procedure TfrmPrincipal.TreeLocalEstoqueClick(Sender: TObject);
begin
  frmLocalEstoque := TfrmLocalEstoque.Create(Self);
  try
    layMnuPrincipal.Opacity :=0;
    frmLocalEstoque.ShowModal;
  finally
    AnimationPrincipal.Start;
    frmLocalEstoque.Free;
  end;
end;

procedure TfrmPrincipal.TreeAbastecimentoClick(Sender: TObject);
begin
  frmAbastecimento.ShowModal;
end;

procedure TfrmPrincipal.TreeAgriculaClick(Sender: TObject);
begin
  FechaMnu;
  TreeCadastrosGerais.IsExpanded := false;
  if TreeAgricula.IsExpanded then
   TreeAgricula.IsExpanded := false
  else
   TreeAgricula.IsExpanded := true;
end;

procedure TfrmPrincipal.TreeAreasAgriClick(Sender: TObject);
begin
  frmAreas := TfrmAreas.Create(Self);
  try
    layMnuPrincipal.Opacity :=0;
    frmAreas.ShowModal;
  finally
    AnimationPrincipal.Start;
    frmAreas.Free;
  end;
end;

procedure TfrmPrincipal.TreeAreasClick(Sender: TObject);
begin
  frmAreas := TfrmAreas.Create(Self);
  try
    layMnuPrincipal.Opacity :=0;
    frmAreas.ShowModal;
  finally
    AnimationPrincipal.Start;
    frmAreas.Free;
  end;
end;

procedure TfrmPrincipal.TreeAuxAgriClick(Sender: TObject);
begin
 if TreeAuxAgri.IsExpanded then
  TreeAuxAgri.IsExpanded := false
 else
  TreeAuxAgri.IsExpanded := true;
end;

procedure TfrmPrincipal.TreeAuxComprasClick(Sender: TObject);
begin
 if TreeAuxCompras.IsExpanded then
  TreeAuxCompras.IsExpanded := false
 else
  TreeAuxCompras.IsExpanded := true;
end;

procedure TfrmPrincipal.TreeAuxPragasClick(Sender: TObject);
begin
  frmAuxPragas := TfrmAuxPragas.Create(Self);
  try
    layMnuPrincipal.Opacity :=0;
    frmAuxPragas.ShowModal;
  finally
    AnimationPrincipal.Start;
    frmAuxPragas.Free;
  end;
end;

procedure TfrmPrincipal.TreeAuxTipoAplicacaoSolidoClick(Sender: TObject);
begin
  frmAuxTipoAplicacaoSolido := TfrmAuxTipoAplicacaoSolido.Create(Self);
  try
    layMnuPrincipal.Opacity :=0;
    frmAuxTipoAplicacaoSolido.ShowModal;
  finally
    AnimationPrincipal.Start;
    frmAuxTipoAplicacaoSolido.Free;
  end;
end;

procedure TfrmPrincipal.TreeAuxTipoOcorrenciaClick(Sender: TObject);
begin
  frmAuxtipoOcorrencia := TfrmAuxtipoOcorrencia.Create(Self);
  try
    layMnuPrincipal.Opacity :=0;
    frmAuxtipoOcorrencia.ShowModal;
  finally
    AnimationPrincipal.Start;
    frmAuxtipoOcorrencia.Free;
  end;
end;

procedure TfrmPrincipal.TreeAuxTipoServicoClick(Sender: TObject);
begin
 frmAuxTipoServico := TfrmAuxTipoServico.Create(Self);
  try
    layMnuPrincipal.Opacity :=0;
    frmAuxTipoServico.ShowModal;
  finally
    AnimationPrincipal.Start;
    frmAuxTipoServico.Free;
  end;
end;

procedure TfrmPrincipal.TreeBntAtividadesClick(Sender: TObject);
begin
 frmAuxAtividadeAbastecimento := TfrmAuxAtividadeAbastecimento.Create(Self);
  try
    layMnuPrincipal.Opacity :=0;
    frmAuxAtividadeAbastecimento.ShowModal;
  finally
    AnimationPrincipal.Start;
    frmAuxAtividadeAbastecimento.Free;
  end;
end;

procedure TfrmPrincipal.TreeCadastrosGeraisClick(Sender: TObject);
begin
  FechaMnu;
  TreeAgricula.IsExpanded := false;
  if TreeCadastrosGerais.IsExpanded then
   TreeCadastrosGerais.IsExpanded := false
  else
   TreeCadastrosGerais.IsExpanded := true;
end;

procedure TfrmPrincipal.TreeCentroCustoClick(Sender: TObject);
begin
  frmCentroCusto :=  TfrmCentroCusto.Create(Self);
  try
    layMnuPrincipal.Opacity :=0;
    frmCentroCusto.ShowModal;
  finally
    AnimationPrincipal.Start;
    frmCentroCusto.Free;
  end;
end;

procedure TfrmPrincipal.TreeCoberturasClick(Sender: TObject);
begin
 frmAuxCobertura := TfrmAuxCobertura.Create(Self);
  try
    layMnuPrincipal.Opacity :=0;
    frmAuxCobertura.ShowModal;
  finally
    AnimationPrincipal.Start;
    frmAuxCobertura.Free;
  end;
end;

procedure TfrmPrincipal.TreeCompradorClick(Sender: TObject);
begin
  frmCadComprador := TfrmCadComprador.Create(Self);
  try
    layMnuPrincipal.Opacity :=0;
    frmCadComprador.ShowModal;
  finally
    AnimationPrincipal.Start;
    frmCadComprador.Free;
  end;
end;

procedure TfrmPrincipal.TreeComprasClick(Sender: TObject);
begin
 TreeExAuxiliares.IsExpanded  := false;
 TreeInsumos.IsExpanded       := false;
 TreeEstoque.IsExpanded       := false;
 if TreeCompras.IsExpanded then
   TreeCompras.IsExpanded := false
  else
   TreeCompras.IsExpanded := true;
end;

procedure TfrmPrincipal.TreeContratosClick(Sender: TObject);
begin
  frmCadContratos := TfrmCadContratos.Create(Self);
  try
    layMnuPrincipal.Opacity :=0;
    frmCadContratos.ShowModal;
  finally
    AnimationPrincipal.Start;
    frmCadContratos.Free;
  end;
end;

procedure TfrmPrincipal.TreeCulturasClick(Sender: TObject);
begin
  frmAuxCultura := TfrmAuxCultura.Create(Self);
  try
    layMnuPrincipal.Opacity :=0;
    frmAuxCultura.ShowModal;
  finally
    AnimationPrincipal.Start;
    frmAuxCultura.Free;
  end;
end;

procedure TfrmPrincipal.TreeDashClick(Sender: TObject);
begin
 if layDash.Visible then
  layDash.Visible := false
 else
   GeraDash;
end;

procedure TfrmPrincipal.TreeMaquinasClick(Sender: TObject);
begin
 if TreeMaquinas.IsExpanded then
  TreeMaquinas.IsExpanded := false
 else
  TreeMaquinas.IsExpanded := true;
end;

procedure TfrmPrincipal.TreeMarcasClick(Sender: TObject);
begin
  frmCadAuxMarcas := TfrmCadAuxMarcas.Create(Self);
  try
    layMnuPrincipal.Opacity :=0;
    frmCadAuxMarcas.ShowModal;
  finally
    AnimationPrincipal.Start;
    frmCadAuxMarcas.Free;
  end;
end;

procedure TfrmPrincipal.TreeMonitoramentoClick(Sender: TObject);
begin
  frmMonitoramento := TfrmMonitoramento.Create(Self);
  try
    layMnuPrincipal.Opacity :=0;
    frmMonitoramento.ShowModal;
  finally
    AnimationPrincipal.Start;
    frmMonitoramento.Free;
  end;
end;

procedure TfrmPrincipal.TreeOperacoesClick(Sender: TObject);
begin
  frmAuxOperacao := TfrmAuxOperacao.Create(Self);
  try
    layMnuPrincipal.Opacity :=0;
    frmAuxOperacao.ShowModal;
  finally
    AnimationPrincipal.Start;
    frmAuxOperacao.Free;
  end;
end;

procedure TfrmPrincipal.TreeOperadorMaquinaClick(Sender: TObject);
begin
 frmOperadorMaquinas := TfrmOperadorMaquinas.Create(Self);
  try
    layMnuPrincipal.Opacity :=0;
    frmOperadorMaquinas.ShowModal;
  finally
    AnimationPrincipal.Start;
    frmOperadorMaquinas.Free;
  end;
end;

procedure TfrmPrincipal.TreeOrcamentoClick(Sender: TObject);
begin
   frmListaOrcamento := TfrmListaOrcamento.Create(Self);
  try
    layMnuPrincipal.Opacity :=0;
    frmListaOrcamento.ShowModal;
  finally
    AnimationPrincipal.Start;
    frmListaOrcamento.Free;
  end;
end;

procedure TfrmPrincipal.TreePedidosClick(Sender: TObject);
begin
  frmCadPedidos := TfrmCadPedidos.Create(Self);
  try
    layMnuPrincipal.Opacity :=0;
    frmCadPedidos.ShowModal;
  finally
    AnimationPrincipal.Start;
    frmCadPedidos.Free;
  end;
end;

procedure TfrmPrincipal.TreePluviometroClick(Sender: TObject);
begin
  frmPluviometro := TfrmPluviometro.Create(Self);
  try
    layMnuPrincipal.Opacity :=0;
    frmPluviometro.ShowModal;
  finally
    AnimationPrincipal.Start;
    frmPluviometro.Free;
  end;
end;

procedure TfrmPrincipal.TreeProdutosClick(Sender: TObject);
begin
  frmCadProdutos := TfrmCadProdutos.Create(Self);
  try
    layMnuPrincipal.Opacity :=0;
    frmCadProdutos.ShowModal;
  finally
    AnimationPrincipal.Start;
    frmCadProdutos.Free;
  end;
end;

procedure TfrmPrincipal.TreeQuadroAtividadesClick(Sender: TObject);
begin
  frmQuadroAtividades := TfrmQuadroAtividades.Create(Self);
  try
    layMnuPrincipal.Opacity :=0;
    frmQuadroAtividades.ShowModal;
  finally
    AnimationPrincipal.Start;
    frmQuadroAtividades.Free;
  end;
end;

procedure TfrmPrincipal.TreeReceituarioClick(Sender: TObject);
begin
 frmReceituario := TfrmReceituario.Create(Self);
  try
    layMnuPrincipal.Opacity :=0;
    frmReceituario.ShowModal;
  finally
    AnimationPrincipal.Start;
    frmReceituario.Free;
  end;
end;

procedure TfrmPrincipal.TreeSafraClick(Sender: TObject);
begin
 frmSafra := TfrmSafra.Create(Self);
  try
    layMnuPrincipal.Opacity :=0;
    frmSafra.ShowModal;
  finally
    AnimationPrincipal.Start;
    frmSafra.Free;
  end;
end;

procedure TfrmPrincipal.TreeSaidaEstoqueClick(Sender: TObject);
begin
  frmSaidaEstoque := TfrmSaidaEstoque.Create(Self);
  try
    layMnuPrincipal.Opacity :=0;
    frmSaidaEstoque.ShowModal;
  finally
    AnimationPrincipal.Start;
    frmSaidaEstoque.Free;
  end;
end;

procedure TfrmPrincipal.TreeSetorClick(Sender: TObject);
begin
  frmSetores := TfrmSetores.Create(Self);
  try
    layMnuPrincipal.Opacity :=0;
    frmSetores.ShowModal;
  finally
    AnimationPrincipal.Start;
    frmSetores.Free;
  end;
end;

procedure TfrmPrincipal.TreeSetoresClick(Sender: TObject);
begin
  frmSetores := TfrmSetores.Create(Self);
  try
    layMnuPrincipal.Opacity :=0;
    frmSetores.ShowModal;
  finally
    AnimationPrincipal.Start;
    frmSetores.Free;
  end;
end;

procedure TfrmPrincipal.TreeTalhoesClick(Sender: TObject);
begin
  frmTalhoes := TfrmTalhoes.Create(Self);
  try
    layMnuPrincipal.Opacity :=0;
    frmTalhoes.ShowModal;
  finally
    AnimationPrincipal.Start;
    frmTalhoes.Free;
  end;

end;

procedure TfrmPrincipal.TreeTipoMaquinaVeiculoClick(Sender: TObject);
begin
  frmAuxTipoMaquinaVeiculo := TfrmAuxTipoMaquinaVeiculo.Create(Self);
  try
    layMnuPrincipal.Opacity :=0;
    frmAuxTipoMaquinaVeiculo.ShowModal;
  finally
    AnimationPrincipal.Start;
    frmAuxTipoMaquinaVeiculo.Free;
  end;
end;

procedure TfrmPrincipal.TreeTipoPragaClick(Sender: TObject);
begin
  frmCadAuxPragaTipo:= TfrmCadAuxPragaTipo.Create(Self);
  try
    layMnuPrincipal.Opacity :=0;
    frmCadAuxPragaTipo.ShowModal;
  finally
    AnimationPrincipal.Start;
    frmCadAuxPragaTipo.Free;
  end;

end;

procedure TfrmPrincipal.TreeVariedadesClick(Sender: TObject);
begin
  frmAuxVariedades := TfrmAuxVariedades.Create(Self);
  try
    layMnuPrincipal.Opacity :=0;
    frmAuxVariedades.ShowModal;
  finally
    AnimationPrincipal.Start;
    frmAuxVariedades.Free;
  end;
end;

procedure TfrmPrincipal.TreeViewItem1Click(Sender: TObject);
begin
  FechaMnu;
  frmUsuarios := TfrmUsuarios.Create(Self);
  try
    layMnuPrincipal.Opacity :=0;
    frmUsuarios.ShowModal;
  finally
    AnimationPrincipal.Start;
    frmUsuarios.Free;
  end;
end;

procedure TfrmPrincipal.TreeViewItem2Click(Sender: TObject);
begin
  frmCadServico := TfrmCadServico.Create(Self);
  try
    layMnuPrincipal.Opacity :=0;
    frmCadServico.ShowModal;
  finally
    AnimationPrincipal.Start;
    frmCadServico.Free;
  end;
end;

procedure TfrmPrincipal.TreeViewItem3Click(Sender: TObject);
begin
 if TreeViewItem3.IsExpanded then
  TreeViewItem3.IsExpanded := false
 else
  TreeViewItem3.IsExpanded := true;
end;

procedure TfrmPrincipal.TreeViewMovLocalClick(Sender: TObject);
begin
  frmMovLocalEstoque := TfrmMovLocalEstoque.Create(Self);
  try
    layMnuPrincipal.Opacity :=0;
    frmMovLocalEstoque.ShowModal;
  finally
    AnimationPrincipal.Start;
    frmMovLocalEstoque.Free;
  end;
end;

procedure TfrmPrincipal.TreeCadManutencaoClick(Sender: TObject);
begin
 FechaMnu;
  frmCadRevisaoMaquinas := TfrmCadRevisaoMaquinas.Create(Self);
  try
    layMnuPrincipal.Opacity :=0;
    frmCadRevisaoMaquinas.ShowModal;
  finally
    AnimationPrincipal.Start;
    frmCadRevisaoMaquinas.Free;
  end;
end;

procedure TfrmPrincipal.TreeCadMaquinasClick(Sender: TObject);
begin
 FechaMnu;
  frmCadMaquinaVeiculo := TfrmCadMaquinaVeiculo.Create(Self);
  try
    layMnuPrincipal.Opacity :=0;
    frmCadMaquinaVeiculo.ShowModal;
  finally
    AnimationPrincipal.Start;
    frmCadMaquinaVeiculo.Free;
  end;
end;

procedure TfrmPrincipal.TreeRelatoriosClick(Sender: TObject);
begin
  frmRelOperacao := TfrmRelOperacao.Create(Self);
  try
    layMnuPrincipal.Opacity :=0;
    frmRelOperacao.ShowModal;
  finally
    AnimationPrincipal.Start;
    frmRelOperacao.Free;
  end;
end;

procedure TfrmPrincipal.TreeRevisaoClick(Sender: TObject);
begin
  FechaMnu;
  frmCadRevisao := TfrmCadRevisao.Create(Self);
  try
    layMnuPrincipal.Opacity :=0;
    frmCadRevisao.ShowModal;
  finally
    AnimationPrincipal.Start;
    frmCadRevisao.Free;
  end;
end;

end.
