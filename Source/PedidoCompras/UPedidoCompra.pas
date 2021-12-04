unit UPedidoCompra;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  UCadPadrao, System.Rtti, FMX.Grid.Style, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FMX.ActnList, System.Actions, FMX.TabControl, FMX.Ani, FMX.ScrollBox,
  FMX.Grid, FMX.Edit, FMX.Controls.Presentation, FMX.Objects, FMX.Layouts,
  FMX.ListBox, FMX.DateTimeCtrls, Fmx.Bind.Grid, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.Grid, Data.Bind.DBScope, FMX.Memo,Winapi.Windows,System.DateUtils,
  FireDAC.Stan.StorageBin, Datasnap.Provider, Datasnap.DBClient, FMX.Menus,System.Threading,
  System.Notification,IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,System.JSON,
  System.JSON.Writers,System.JSON.Types,shellapi,IdSMTP, IdSSLOpenSSL, IdMessage, IdText, IdAttachmentFile,
  IdExplicitTLSClientServerBase,
  IdMessageClient,
  IdSMTPBase,
  IdIOHandler,
  IdIOHandlerSocket,
  IdIOHandlerStack,
  IdSSL, IdAntiFreezeBase, IdSMTPRelay, myChkBox,
  Vcl.Imaging.pngimage, ppVar, ppStrtch, ppMemo, FireDAC.FMXUI.Wait,
  System.Sensors, System.Sensors.Components;
type
  TMoveSG = class(TCustomGrid); // reveals protected MoveRow procedure
type
  TfrmCadPedidos = class(TfrmCadPadrao)
    Layout7: TLayout;
    tbiItensPedido: TTabItem;
    layMnuItem: TLayout;
    Rectangle3: TRectangle;
    btnAddItem: TRectangle;
    Image8: TImage;
    lblbtnAddItem: TLabel;
    btnEditaItem: TRectangle;
    Image9: TImage;
    lblbtnEditaItem: TLabel;
    btnExcluirItem: TRectangle;
    Image10: TImage;
    lblbtnExcluirItem: TLabel;
    ToolBar4: TToolBar;
    Image11: TImage;
    Image12: TImage;
    Layout9: TLayout;
    StringGrid2: TStringGrid;
    ToolBar5: TToolBar;
    Layout12: TLayout;
    gridItens: TStringGrid;
    BindSourceDB1: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    BindingsList1: TBindingsList;
    lblItemsPedido: TLabel;
    layItem: TLayout;
    Rectangle5: TRectangle;
    Layout11: TLayout;
    Layout13: TLayout;
    Rectangle6: TRectangle;
    Layout14: TLayout;
    edtItemPedido: TEdit;
    btnBuscaItem: TEditButton;
    Layout15: TLayout;
    Label12: TLabel;
    Label13: TLabel;
    cbxTipo: TComboBox;
    Layout16: TLayout;
    Rectangle7: TRectangle;
    Layout17: TLayout;
    Layout18: TLayout;
    Label14: TLabel;
    cbxUnidadeMedida: TComboBox;
    lblQtde: TLabel;
    edtQtde: TEdit;
    Label15: TLabel;
    edtValorUni: TEdit;
    Label16: TLabel;
    edtValorTotalItem: TEdit;
    Layout19: TLayout;
    Rectangle8: TRectangle;
    Layout20: TLayout;
    Layout21: TLayout;
    Label17: TLabel;
    edtObsItem: TMemo;
    Layout22: TLayout;
    Rectangle9: TRectangle;
    btnSalvaItem: TRectangle;
    Image7: TImage;
    Label18: TLabel;
    Rectangle11: TRectangle;
    Image13: TImage;
    Label19: TLabel;
    ToolBar6: TToolBar;
    Label20: TLabel;
    Image15: TImage;
    tbiStatusPedido: TTabItem;
    layMnuStatus: TLayout;
    Rectangle12: TRectangle;
    btnAddStatus: TRectangle;
    Image14: TImage;
    lblbtnAddStatus: TLabel;
    btnEditaStatus: TRectangle;
    Image16: TImage;
    lblbtnEditaStatus: TLabel;
    btnExcluirStatus: TRectangle;
    Image17: TImage;
    lblbtnExcluirStatus: TLabel;
    ToolBar7: TToolBar;
    lblStatusPedidos: TLabel;
    Image18: TImage;
    Image19: TImage;
    Layout24: TLayout;
    StringGrid3: TStringGrid;
    ToolBar8: TToolBar;
    Layout25: TLayout;
    gridStatusPedido: TStringGrid;
    layStatusPedidoADD: TLayout;
    Rectangle16: TRectangle;
    Layout27: TLayout;
    Layout31: TLayout;
    Rectangle18: TRectangle;
    Layout32: TLayout;
    cbxStatusPedido: TComboBox;
    Layout33: TLayout;
    Label24: TLabel;
    Layout34: TLayout;
    Rectangle19: TRectangle;
    Layout35: TLayout;
    ObsStatusPedido: TMemo;
    Layout36: TLayout;
    Label28: TLabel;
    Layout37: TLayout;
    Rectangle20: TRectangle;
    edtAddStatus: TRectangle;
    Image20: TImage;
    Label29: TLabel;
    btnCancelaStatus: TRectangle;
    Image21: TImage;
    Label30: TLabel;
    ToolBar9: TToolBar;
    Label31: TLabel;
    Image22: TImage;
    BindSourceDB2: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB2: TLinkGridToDataSource;
    Label21: TLabel;
    edtDataStatus: TDateEdit;
    lblTotalPedidos: TLabel;
    layRecebimento: TLayout;
    Rectangle14: TRectangle;
    Layout38: TLayout;
    Layout39: TLayout;
    Rectangle15: TRectangle;
    Layout40: TLayout;
    edtDataRecebimento: TDateEdit;
    Layout41: TLayout;
    Label11: TLabel;
    Layout42: TLayout;
    Rectangle17: TRectangle;
    Layout43: TLayout;
    edtObseRecebimento: TMemo;
    Layout44: TLayout;
    Label23: TLabel;
    Layout45: TLayout;
    Rectangle21: TRectangle;
    btnConfirmaRecebimento: TRectangle;
    Image23: TImage;
    Label25: TLabel;
    btnCancelaRecebimento: TRectangle;
    Image24: TImage;
    Label26: TLabel;
    ToolBar10: TToolBar;
    Label27: TLabel;
    Image25: TImage;
    tbiCotacoes: TTabItem;
    ToolBar11: TToolBar;
    lblCotacoes: TLabel;
    Image26: TImage;
    Image27: TImage;
    Layout30: TLayout;
    Rectangle22: TRectangle;
    btnAddCotacao: TRectangle;
    Image28: TImage;
    Label32: TLabel;
    Rectangle25: TRectangle;
    Image30: TImage;
    Label34: TLabel;
    Layout46: TLayout;
    Layout47: TLayout;
    GroupBox2: TGroupBox;
    edtFornecedorF: TEdit;
    Label36: TLabel;
    lblStatus: TLabel;
    cbxStatusOrcamento: TComboBox;
    StringGrid4: TStringGrid;
    BindSourceDB3: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB3: TLinkGridToDataSource;
    layNovoOrcamento: TLayout;
    ToolBar12: TToolBar;
    Label37: TLabel;
    Image31: TImage;
    Rectangle26: TRectangle;
    FloatAnimation1: TFloatAnimation;
    Layout48: TLayout;
    Rectangle27: TRectangle;
    Layout49: TLayout;
    Layout50: TLayout;
    Label39: TLabel;
    edtPedido: TEdit;
    Layout51: TLayout;
    Layout53: TLayout;
    lblTotalChk: TLabel;
    Layout54: TLayout;
    Rectangle28: TRectangle;
    X: TLayout;
    Layout55: TLayout;
    Label41: TLabel;
    edtObs: TEdit;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    Layout56: TLayout;
    Rectangle23: TRectangle;
    Rectangle29: TRectangle;
    Image32: TImage;
    Label40: TLabel;
    Layout57: TLayout;
    Rectangle31: TRectangle;
    Rectangle32: TRectangle;
    Image34: TImage;
    Label43: TLabel;
    Rectangle33: TRectangle;
    Image35: TImage;
    Label44: TLabel;
    BindSourceDB4: TBindSourceDB;
    BindSourceDB5: TBindSourceDB;
    qryFornesedorSelect: TFDQuery;
    qryFornesedorSelectid: TIntegerField;
    qryFornesedorSelectnome: TWideStringField;
    qryFornesedorSelectcpf_cnpj: TWideStringField;
    qryFornesedorSelectSelected: TBooleanField;
    gridItensOrcamento: TStringGrid;
    StringColumn1: TStringColumn;
    StringColumn2: TStringColumn;
    FloatColumn1: TFloatColumn;
    StringColumn3: TStringColumn;
    StringColumn4: TStringColumn;
    TabItem3: TTabItem;
    ToolBar13: TToolBar;
    Rectangle24: TRectangle;
    Label33: TLabel;
    Image29: TImage;
    ToolBar14: TToolBar;
    Rectangle30: TRectangle;
    lblTotalItens: TLabel;
    lblValorTotal: TLabel;
    GridDetalhesOrcamento: TStringGrid;
    Layout52: TLayout;
    Rectangle34: TRectangle;
    btnMudaStatus: TRectangle;
    Image33: TImage;
    Label42: TLabel;
    Rectangle35: TRectangle;
    Image36: TImage;
    Label45: TLabel;
    Rectangle36: TRectangle;
    Layout59: TLayout;
    Layout60: TLayout;
    TabItem4: TTabItem;
    Layout58: TLayout;
    edtFiltraForn: TEdit;
    ClearEditButton1: TClearEditButton;
    Label38: TLabel;
    gridFornSelected: TStringGrid;
    LinkGridToDataSourceBindSourceDB5: TLinkGridToDataSource;
    Layout61: TLayout;
    Layout62: TLayout;
    gridForneAdd: TStringGrid;
    Rectangle37: TRectangle;
    Image38: TImage;
    Label35: TLabel;
    StringColumn9: TStringColumn;
    StringColumn10: TStringColumn;
    Rectangle38: TRectangle;
    ToolBar15: TToolBar;
    Label47: TLabel;
    ToolBar16: TToolBar;
    Label48: TLabel;
    Image39: TImage;
    Image40: TImage;
    StringColumn11: TStringColumn;
    tbiComparativo: TTabItem;
    ToolBar17: TToolBar;
    Rectangle39: TRectangle;
    Label49: TLabel;
    Image41: TImage;
    btnComparativo: TRectangle;
    Image42: TImage;
    Label50: TLabel;
    Layout63: TLayout;
    Rectangle40: TRectangle;
    Label51: TLabel;
    GridItensAprovados: TStringGrid;
    Layout64: TLayout;
    Rectangle41: TRectangle;
    btnAprovarItens: TRectangle;
    Image43: TImage;
    Label52: TLabel;
    Rectangle43: TRectangle;
    Image44: TImage;
    Label53: TLabel;
    StringColumn12: TStringColumn;
    StringColumn13: TStringColumn;
    StringColumn14: TStringColumn;
    IntegerColumn1: TIntegerColumn;
    IntegerColumn2: TIntegerColumn;
    StringColumn15: TStringColumn;
    StringColumn16: TStringColumn;
    StringColumn17: TStringColumn;
    lblCoutProdAprovado: TLabel;
    lblValorTotalAprovados: TLabel;
    PopupMenu1: TPopupMenu;
    MenuItem1: TMenuItem;
    btnImprimir: TRectangle;
    Image45: TImage;
    lblImprimir: TLabel;
    ClearEditButton5: TClearEditButton;
    Layout8: TLayout;
    Label4: TLabel;
    Label5: TLabel;
    Layout1: TLayout;
    edtSolicitante: TEdit;
    EditButton1: TEditButton;
    ClearEditButton3: TClearEditButton;
    dataSolicitacao: TDateEdit;
    Layout2: TLayout;
    Rectangle1: TRectangle;
    Layout3: TLayout;
    cbxSegmento: TComboBox;
    cbxCategoria: TComboBox;
    edtMaquinaVeiculo: TEdit;
    EditButton2: TEditButton;
    ClearEditButton2: TClearEditButton;
    Layout6: TLayout;
    Label6: TLabel;
    Label7: TLabel;
    lblMaquina: TLabel;
    layServico: TLayout;
    Rectangle13: TRectangle;
    Layout26: TLayout;
    edtServico: TEdit;
    EditButton3: TEditButton;
    ClearEditButton4: TClearEditButton;
    Layout28: TLayout;
    Label10: TLabel;
    Layout23: TLayout;
    Label8: TLabel;
    Layout29: TLayout;
    edtDescricao: TMemo;
    cbxStatusF: TComboBox;
    Label9: TLabel;
    imgDetalhes: TImage;
    imgHistPedido: TImage;
    imgPrintPedido: TImage;
    imgOrcamentos: TImage;
    imgSelect: TImage;
    imgStatusIni: TImage;
    imgProximoStatus: TImage;
    imgRecebimento: TImage;
    imgCancelada: TImage;
    listaPedidos: TListView;
    PopupMenuEmail: TPopupMenu;
    MenuItem2: TMenuItem;
    NotificationCenter1: TNotificationCenter;
    IdHTTP1: TIdHTTP;
    laySync: TLayout;
    Rectangle2: TRectangle;
    Layout4: TLayout;
    Layout10: TLayout;
    imgSync: TImage;
    Animacao: TFloatAnimation;
    Label54: TLabel;
    ProgressBarSync: TProgressBar;
    msmoSync: TMemo;
    Layout65: TLayout;
    gridComparativo: TStringGrid;
    Rectangle4: TRectangle;
    btnImprimeComparativo: TRectangle;
    Image48: TImage;
    Label58: TLabel;
    edtOrdemF: TEdit;
    Label55: TLabel;
    Label56: TLabel;
    edtPedidoF: TEdit;
    StringColumn21: TStringColumn;
    StringColumn22: TStringColumn;
    StringColumn23: TStringColumn;
    TComparativo: TFDQuery;
    StringColumn25: TStringColumn;
    StringColumn26: TStringColumn;
    StringColumn27: TStringColumn;
    StringColumn28: TStringColumn;
    StringColumn29: TStringColumn;
    StringColumn30: TStringColumn;
    StringColumn31: TStringColumn;
    StringColumn32: TStringColumn;
    StringColumn33: TStringColumn;
    StringColumn34: TStringColumn;
    StringColumn35: TStringColumn;
    BindSourceDB6: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB6: TLinkGridToDataSource;
    Layout66: TLayout;
    Label46: TLabel;
    lblFornecedor: TLabel;
    Label57: TLabel;
    edtDescontoGeral: TEdit;
    Label59: TLabel;
    edtFreteGeral: TEdit;
    Label60: TLabel;
    edtFormaPagamento: TEdit;
    btnBuscaFormaPG: TEditButton;
    GroupBox1: TGroupBox;
    Label63: TLabel;
    Label64: TLabel;
    edtDataInicio: TDateEdit;
    edtDataFim: TDateEdit;
    edtCentroCustoF: TEdit;
    Label65: TLabel;
    SearchEditButton1: TSearchEditButton;
    edtCentroCusto: TEdit;
    Label66: TLabel;
    btnBuscarLista: TButton;
    Label67: TLabel;
    edtSolicitanteF: TEdit;
    btnExcluirForn: TRectangle;
    Image37: TImage;
    Label68: TLabel;
    btnBuscaForne: TButton;
    Layout67: TLayout;
    Rectangle10: TRectangle;
    Rectangle42: TRectangle;
    Image46: TImage;
    Label69: TLabel;
    Rectangle44: TRectangle;
    Image47: TImage;
    Label70: TLabel;
    btnEditarItemOrc: TRectangle;
    Image49: TImage;
    Label71: TLabel;
    Rectangle46: TRectangle;
    Image50: TImage;
    Label72: TLabel;
    Layout68: TLayout;
    Rectangle47: TRectangle;
    Layout69: TLayout;
    Edit2: TEdit;
    Edit3: TEdit;
    Layout70: TLayout;
    lblMarca: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    edtMarcaItemPedido: TEdit;
    EditButton5: TEditButton;
    ClearEditButton6: TClearEditButton;
    Rectangle48: TRectangle;
    rdOriginal: TRadioButton;
    rdParalelo: TRadioButton;
    layItemOrcamento: TLayout;
    Rectangle49: TRectangle;
    Layout72: TLayout;
    Layout73: TLayout;
    Rectangle50: TRectangle;
    Layout74: TLayout;
    edtitemOrcamento: TEdit;
    EditButton6: TEditButton;
    ClearEditButton7: TClearEditButton;
    ComboBox1: TComboBox;
    Layout75: TLayout;
    Label73: TLabel;
    Label77: TLabel;
    Layout76: TLayout;
    Rectangle51: TRectangle;
    Layout77: TLayout;
    cbxUniMedItemOrcamento: TComboBox;
    edtQtdItemOrcamento: TEdit;
    edValorUnitarioItemOrcamento: TEdit;
    Layout78: TLayout;
    Label78: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    Layout79: TLayout;
    Rectangle52: TRectangle;
    Layout80: TLayout;
    edtObstemOrcamento: TMemo;
    Layout81: TLayout;
    Label82: TLabel;
    Layout82: TLayout;
    Rectangle53: TRectangle;
    btnSalvatemOrcamento: TRectangle;
    Image51: TImage;
    Label83: TLabel;
    btnCancelatemOrcamento: TRectangle;
    Image52: TImage;
    Label84: TLabel;
    ToolBar18: TToolBar;
    Label85: TLabel;
    Image53: TImage;
    Layout83: TLayout;
    Rectangle56: TRectangle;
    Layout84: TLayout;
    Edit7: TEdit;
    Edit8: TEdit;
    edtMarcaItemOrcamento: TEdit;
    EditButton7: TEditButton;
    ClearEditButton8: TClearEditButton;
    Rectangle57: TRectangle;
    rdOriginaltemOrcamento: TRadioButton;
    rdParalelotemOrcamento: TRadioButton;
    Layout85: TLayout;
    Label86: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    Label89: TLabel;
    Layout71: TLayout;
    Rectangle54: TRectangle;
    Layout86: TLayout;
    edtIcmsItemOrcamento: TEdit;
    edtIpiItemOrcamento: TEdit;
    Layout87: TLayout;
    Label91: TLabel;
    Label92: TLabel;
    Label93: TLabel;
    Label94: TLabel;
    edtDifalItemOrcamento: TEdit;
    edtValorTotaltemOrcamento: TEdit;
    Label90: TLabel;
    Layout88: TLayout;
    Rectangle55: TRectangle;
    Label95: TLabel;
    Layout89: TLayout;
    Layout90: TLayout;
    Layout91: TLayout;
    Rectangle58: TRectangle;
    btnLimparImg: TRectangle;
    Image54: TImage;
    Label96: TLabel;
    btnCarregaIMG: TRectangle;
    Image55: TImage;
    Label97: TLabel;
    Layout92: TLayout;
    Layout93: TLayout;
    Rectangle59: TRectangle;
    imgProduto: TImage;
    edtValorLiquidoItemOrc: TEdit;
    Label98: TLabel;
    OpenImg: TOpenDialog;
    lblValorTotalMaisFrete: TLabel;
    lblValorLiquido: TLabel;
    Label99: TLabel;
    edtPropriedadeDestino: TEdit;
    EditButton8: TEditButton;
    EditButton4: TEditButton;
    StringColumn5: TStringColumn;
    StringColumn6: TStringColumn;
    btnFinalizaOrcamento: TRectangle;
    Label61: TLabel;
    btnAprovaOrcamento: TRectangle;
    Label62: TLabel;
    btnEditaOrcamento: TRectangle;
    Image56: TImage;
    Label100: TLabel;
    btnSalvarOrcamento: TRectangle;
    Image57: TImage;
    Label101: TLabel;
    edtFreteItemOrcamento: TEdit;
    edtDescontoitemOrcamento: TEdit;
    Label81: TLabel;
    TComparativoid: TIntegerField;
    TComparativostatus: TIntegerField;
    TComparativodatareg: TSQLTimeStampField;
    TComparativoidusuario: TIntegerField;
    TComparativodataalteracao: TSQLTimeStampField;
    TComparativoidusuarioalteracao: TIntegerField;
    TComparativoitem: TIntegerField;
    TComparativoidproduto: TIntegerField;
    TComparativoidpedido: TIntegerField;
    TComparativoidfornecedor1: TIntegerField;
    TComparativovlfornecedor1: TBCDField;
    TComparativoidfornecedor2: TIntegerField;
    TComparativovlfornecedor2: TBCDField;
    TComparativoidfornecedor3: TIntegerField;
    TComparativovlfornecedor3: TBCDField;
    TComparativoidfornecedor4: TIntegerField;
    TComparativovlfornecedor4: TBCDField;
    TComparativoidfornecedor5: TIntegerField;
    TComparativovlfornecedor5: TBCDField;
    TComparativoidorcamentoforn1: TIntegerField;
    TComparativoidorcamentoforn2: TIntegerField;
    TComparativoidorcamentoforn3: TIntegerField;
    TComparativoidorcamentoforn4: TIntegerField;
    TComparativoidorcamentoforn5: TIntegerField;
    TComparativoformapgfonr1: TWideStringField;
    TComparativoformapgfonr2: TWideStringField;
    TComparativoformapgfonr3: TWideStringField;
    TComparativoformapgfonr4: TWideStringField;
    TComparativoformapgfonr5: TWideStringField;
    TComparativoqtde: TFMTBCDField;
    Layout94: TLayout;
    Rectangle45: TRectangle;
    Layout95: TLayout;
    Layout96: TLayout;
    Label106: TLabel;
    Layout97: TLayout;
    cbxPrioridade: TComboBox;
    Label22: TLabel;
    cbxSetorDestino: TComboBox;
    Label103: TLabel;
    edtPrevisaoEntrega: TDateEdit;
    MotionSensor1: TMotionSensor;
    ClearEditButton9: TClearEditButton;
    ClearEditButton11: TClearEditButton;
    ClearEditButton12: TClearEditButton;
    MenuItem3: TMenuItem;
    tbiRecebimento: TTabItem;
    Layout98: TLayout;
    GroupBox3: TGroupBox;
    Edit1: TEdit;
    Label102: TLabel;
    Edit4: TEdit;
    Label105: TLabel;
    StringGrid5: TStringGrid;
    LinkGridToDataSourceBindSourceDB32: TLinkGridToDataSource;
    ToolBar19: TToolBar;
    Rectangle60: TRectangle;
    Label104: TLabel;
    Image59: TImage;
    Rectangle61: TRectangle;
    Layout99: TLayout;
    Layout100: TLayout;
    Rectangle62: TRectangle;
    Layout101: TLayout;
    Lista: TListView;
    Layout106: TLayout;
    Label111: TLabel;
    Layout103: TLayout;
    Rectangle63: TRectangle;
    Label107: TLabel;
    Image58: TImage;
    Rectangle64: TRectangle;
    Label108: TLabel;
    Image60: TImage;
    layItemRecebido: TLayout;
    Rectangle65: TRectangle;
    ToolBar20: TToolBar;
    Rectangle66: TRectangle;
    Label109: TLabel;
    Image61: TImage;
    Layout102: TLayout;
    Rectangle67: TRectangle;
    Layout104: TLayout;
    edtRecebimentoProduto: TEdit;
    ClearEditButton10: TClearEditButton;
    ComboBox2: TComboBox;
    Layout105: TLayout;
    Label110: TLabel;
    Label112: TLabel;
    Layout107: TLayout;
    Rectangle68: TRectangle;
    Layout108: TLayout;
    edtRecebimentoQtd: TEdit;
    ClearEditButton13: TClearEditButton;
    ComboBox3: TComboBox;
    Layout109: TLayout;
    Label113: TLabel;
    Label114: TLabel;
    Label115: TLabel;
    edtRecebimentoData: TDateEdit;
    Layout110: TLayout;
    Rectangle69: TRectangle;
    Layout111: TLayout;
    ComboBox4: TComboBox;
    Layout112: TLayout;
    Label116: TLabel;
    Label117: TLabel;
    edtRecebimentoObs: TEdit;
    ClearEditButton14: TClearEditButton;
    Layout113: TLayout;
    Rectangle70: TRectangle;
    btnSalvaRec: TRectangle;
    Image62: TImage;
    Label118: TLabel;
    Rectangle72: TRectangle;
    Image63: TImage;
    Label119: TLabel;
    procedure btnAddClick(Sender: TObject);
    procedure EditButton1Click(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure listaPedidosItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure btnBuscaItemClick(Sender: TObject);
    procedure edtValorUniTyping(Sender: TObject);
    procedure edtQtdeKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure btnSalvaItemClick(Sender: TObject);
    procedure btnAddItemClick(Sender: TObject);
    procedure mnuClick(Sender: TObject);
    procedure Image15Click(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure edtValorUniExit(Sender: TObject);
    procedure edtQtdeChangeTracking(Sender: TObject);
    procedure edtNomeFiltroChangeTracking(Sender: TObject);
    procedure edtAddStatusClick(Sender: TObject);
    procedure btnCancelaStatusClick(Sender: TObject);
    procedure btnAddStatusClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure Image18Click(Sender: TObject);
    procedure Image22Click(Sender: TObject);
    procedure EditButton2Click(Sender: TObject);
    procedure cbxCategoriaChange(Sender: TObject);
    procedure EditButton3Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure cbxStatusFKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure cbxStatusPedidoKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure btnEditaItemClick(Sender: TObject);
    procedure Rectangle11Click(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gridItensEditingDone(Sender: TObject; const ACol, ARow: Integer);
    procedure btnCancelaRecebimentoClick(Sender: TObject);
    procedure Image25Click(Sender: TObject);
    procedure btnConfirmaRecebimentoClick(Sender: TObject);
    procedure btnExcluirItemClick(Sender: TObject);
    procedure btnEditaStatusClick(Sender: TObject);
    procedure btnExcluirStatusClick(Sender: TObject);
    procedure btnAddCotacaoClick(Sender: TObject);
    procedure Image31Click(Sender: TObject);
    procedure btnBuscaFormaPGClick(Sender: TObject);
    procedure Rectangle32Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Rectangle29Click(Sender: TObject);
    procedure Rectangle33Click(Sender: TObject);
    procedure StringGrid1CellDblClick(const Column: TColumn;
      const Row: Integer);
    procedure Rectangle35Click(Sender: TObject);
    procedure edtFornecedorFChangeTracking(Sender: TObject);
    procedure cbxStatusOrcamentoChange(Sender: TObject);
    procedure gridFornSelectedEditingDone(Sender: TObject; const ACol,
      ARow: Integer);
    procedure Rectangle37Click(Sender: TObject);
    procedure gridFornSelectedCellDblClick(const Column: TColumn;
      const Row: Integer);
    procedure Image40Click(Sender: TObject);
    procedure Image39Click(Sender: TObject);
    procedure Rectangle25Click(Sender: TObject);
    procedure GridDetalhesOrcamentoEditingDone(Sender: TObject; const ACol,
      ARow: Integer);
    procedure btnComparativoClick(Sender: TObject);
    procedure gridComparativoCellDblClick(const Column: TColumn;
      const Row: Integer);
    procedure btnAprovarItensClick(Sender: TObject);
    procedure GridItensAprovadosEditingDone(Sender: TObject; const ACol,
      ARow: Integer);
    procedure MenuItem1Click(Sender: TObject);
    procedure Rectangle43Click(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure btnImprimeComparativoClick(Sender: TObject);
    procedure TComparativoReconcileError(DataSet: TFDDataSet; E: EFDException;
      UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
    procedure btnAprovaOrcamentoClick(Sender: TObject);
    procedure btnFinalizaOrcamentoClick(Sender: TObject);
    procedure EditButton4Click(Sender: TObject);
    procedure SearchEditButton1Click(Sender: TObject);
    procedure btnBuscarListaClick(Sender: TObject);
    procedure btnExcluirFornClick(Sender: TObject);
    procedure edtFiltraFornKeyUp(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure btnBuscaForneClick(Sender: TObject);
    procedure btnMudaStatusClick(Sender: TObject);
    procedure EditButton5Click(Sender: TObject);
    procedure EditButton6Click(Sender: TObject);
    procedure btnCancelatemOrcamentoClick(Sender: TObject);
    procedure Image53Click(Sender: TObject);
    procedure edtQtdItemOrcamentoKeyUp(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure btnSalvatemOrcamentoClick(Sender: TObject);
    procedure edtDescontoitemOrcamentoChangeTracking(Sender: TObject);
    procedure edtFreteItemOrcamentoChangeTracking(Sender: TObject);
    procedure edtIcmsItemOrcamentoChangeTracking(Sender: TObject);
    procedure edtIpiItemOrcamentoChangeTracking(Sender: TObject);
    procedure edtDifalItemOrcamentoChangeTracking(Sender: TObject);
    procedure btnCarregaIMGClick(Sender: TObject);
    procedure btnLimparImgClick(Sender: TObject);
    procedure btnEditarItemOrcClick(Sender: TObject);
    procedure EditButton7Click(Sender: TObject);
    procedure edtQtdItemOrcamentoExit(Sender: TObject);
    procedure edValorUnitarioItemOrcamentoExit(Sender: TObject);
    procedure edtDescontoitemOrcamentoExit(Sender: TObject);
    procedure edtFreteItemOrcamentoExit(Sender: TObject);
    procedure Rectangle44Click(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure edtDescontoitemOrcamentoEnter(Sender: TObject);
    procedure edtFreteItemOrcamentoEnter(Sender: TObject);
    procedure EditButton8Click(Sender: TObject);
    procedure btnEditaOrcamentoClick(Sender: TObject);
    procedure btnSalvarOrcamentoClick(Sender: TObject);
    procedure Image41Click(Sender: TObject);
    procedure Image29Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure ListaItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure Image61Click(Sender: TObject);
    procedure Rectangle72Click(Sender: TObject);
    procedure btnSalvaRecClick(Sender: TObject);
    procedure StringGrid5CellClick(const Column: TColumn; const Row: Integer);
  private
    { Private declarations }
    LastTimeKeydown:TDatetime;
    Keys:string;
    MemTable: TFDMemTable;
  public
    vIdItensRecebimento,vProdutoRecebimento,vQtdeRecebimento,
    vIdMarcaItemOrcamento,vIdSolicitante,vIdCategoria,vIdentificador,vIdItemPedido,
    vIdItemOrcamento,vIdMarcaItemPedido,vIdPedido,vIdCategoriaFiltro,vIsertPedido,
    vIdMaquina,vIdServico,vFiltro,vStatusSelect,vIdFormaPg,vIdCentroCusto,vIdPropriedade:string;
    vButonSelect,
    vFreteEditado,vDescontoEditado:integer;
    vFeteAtual,vDescontoAtual,vMaquinaLista,vServicoLista,vSetorLista,
    vAplicacaoLista,vCentroCustoLista:string;
    aTasEmail :ITask;
    procedure LimpaCampos;
    procedure LimpaCamposItem;
    procedure LimpaCamposItemOrcamento;
    function  RetornaIdentificador(segmento:string):string;
    procedure GeraLista;
    procedure Filtro;
    procedure FiltrarOrcamento;
    function  PesquisaFornSelected(id:string):boolean;
    procedure GeraCompartivo(vIPedido:string);
    function  StringListSortCompare(List: TStringList; Index1, Index2: Integer): Integer;
    procedure StringGridSort(StrGrid: TStringGrid; SortColumn: Integer);
    procedure SomarValoresAprovados;
    procedure GeraNovosOrcamentosAprovados(vIdPedido:string);
    procedure GeraNovosOrcamentosAprovadosOrcamnto(vIdPedido,vIdOrcamento:string);
    procedure DeleteRow(StringGrid: TStringGrid; ARow: integer);
    procedure Notificacao(Titulo,Notificacao:string);
    procedure EnviaEmail(IDOrcamento:string);
    function  PostEnviaEmailOrcamento(idOrcamento:string):string;
    function  LimpaResut(vResult: string): String;
    procedure DownloadUploadPedidos;
    function  EnviaEmailReport(idOs:string): string;
    function  SendEmailOS(Destinatario,Anexo,Anexo2: string): Boolean;
    procedure CalculaValorBrutoLiquidoOrcamento;
    function  AcceptEnviaEmailFornecedor(obj: TJSONObject): TJSONObject;
    procedure InsreStatus(vIdPedido,vStatus:string);
    procedure GeraListaRecebimento;

  end;

var
  frmCadPedidos: TfrmCadPedidos;

implementation

{$R *.fmx}

uses DataContext,UProdutos, uFormat, UCadMaquina, UServicos,
  UDmReports, UPrincipal, UUsuarios, dmReplicacao, DmReplicaFaz, UFormaPgForn,
  UdmCompras, UCentrodeCusto, UAuxMarcas, UAuxCategoriaProd, UPropriedade;

procedure TfrmCadPedidos.FiltrarOrcamento;
var
 vFiltro:string;
begin
  vFiltro:='';
  if edtFornecedorF.Text.Length>0 then
   vFiltro:=vFiltro+' AND f.NOME LIKE '+QuotedStr('%'+edtFornecedorF.Text+'%');
  case cbxStatusOrcamento.ItemIndex of
   1:vFiltro:=vFiltro+' AND B.status IN(1,2)';
   2:vFiltro:=vFiltro+' AND B.status =3';
  end;
  if edtPedidoF.Text.Length>0 then
   vFiltro:=vFiltro+' AND c.identificador LIKE '+QuotedStr('%'+edtPedidoF.Text+'%');
  if edtOrdemF.Text.Length>0 then
   vFiltro:=vFiltro+' AND b.id='+edtOrdemF.Text;
  dbCtx.AbreOrcamentos(vIdPedido,vFiltro);
end;

function TfrmCadPedidos.AcceptEnviaEmailFornecedor(
  obj: TJSONObject): TJSONObject;
var
 vText,path: string;
 StrAux  : TStringWriter;
 txtJson : TJsonTextWriter;
 vEmailCliente,vEmailUsuario,vJsonString,vSenha,vIdOrcamento:string;
 vJoInsert,vJoItemO,vJoItemO1 : TJSONObject;
 vJoItem,vJoItem1   : TJSONArray;
 I          : Integer;
 vResult    : TJSONObject;
begin
   begin vJsonString := obj.ToString;
   vJoInsert   := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
   vJoItem     := vJoInsert.GetValue('emailFornecedor') as TJSONArray;
   for i := 0 to vJoItem.Count-1 do
   begin
    vJoItemO := vJoItem.Items[I] as TJSONObject;
    vIdOrcamento:= 'id='+vJoItemO.GetValue('Id').value;
   end;
   if not dbCtx.TOrcamentoemail.AsString.Length>0 then
   begin
     vSenha        := dbCtx.TOrcamentosenha.AsString;
     vEmailCliente := dbCtx.TOrcamentoEmail.AsString;  //RetornaEmailCliente(idOs);
     vEmailUsuario := 'orcamentosffg@gmail.com';//RetornaEmailResponsavel(idOs);

     if(vEmailCliente.Length>0) then
     begin
       if SendEmailOS(vEmailCliente,vSenha,vIdOrcamento) then
       begin
         vText :='Email enviado com sucesso para: '+vEmailCliente;
       end
       else
         vText :='Erro ao enviar Email Fornecedor:'+vEmailCliente;
     end;
     StrAux  := TStringWriter.Create;
     txtJson := TJsonTextWriter.Create(StrAux);
     txtJson.Formatting := TJsonFormatting.Indented;
     txtJson.WriteStartObject;
     txtJson.WritePropertyName('Mensagem');
     txtJson.WriteValue(vText);
     txtJson.WriteEndObject;
     Result := TJsonObject.ParseJSONValue(TEncoding.ASCII.GetBytes(StrAux.ToString),0)
     as TJSONObject;
   end
   else
   begin
     StrAux  := TStringWriter.Create;
     txtJson := TJsonTextWriter.Create(StrAux);
     txtJson.Formatting := TJsonFormatting.Indented;
     txtJson.WriteStartObject;
     txtJson.WritePropertyName('Mensagem');
     txtJson.WriteValue(vText+'- Email não encontrado');
     txtJson.WriteEndObject;
     Result := TJsonObject.ParseJSONValue(TEncoding.ASCII.GetBytes(StrAux.ToString),0)
     as TJSONObject;
   end;
 end
end;

procedure TfrmCadPedidos.btnAddClick(Sender: TObject);
begin
  LimpaCampos;
  vIsertPedido :='S';
  dbCtx.TPedidoCompra.Insert;
  cbxSegmento.ItemIndex := strToInt(dbCtx.vIdSegmento);
  inherited;
end;

procedure TfrmCadPedidos.btnAddCotacaoClick(Sender: TObject);
var
 i:integer;
begin
  TabControl1.TabIndex :=0;
  edtPedido.Text    := vIdentificador;
  edtPedido.Enabled := false;
  dbCtx.AbreItemPedidos(vIdPedido);
  dbCtx.TItensPedido.First;
  I:=0;
  while not dbCtx.TItensPedido.Eof do
  begin
    gridItensOrcamento.RowCount   :=I+1;
    gridItensOrcamento.Cells[0,I] := dbCtx.TItensPedidoNome.AsString;
    gridItensOrcamento.Cells[1,I] := dbCtx.TItensPedidocodigofabricante.AsString;
    gridItensOrcamento.Cells[2,I] := dbCtx.TItensPedidoquantidade.AsString;
    gridItensOrcamento.Cells[3,I] := dbCtx.TItensPedidoobservacao.AsString;
    gridItensOrcamento.Cells[4,I] := dbCtx.TItensPedidoiditem.AsString;
    inc(I);
    dbCtx.TItensPedido.Next;
  end;
  layNovoOrcamento.Visible := true;
end;

procedure TfrmCadPedidos.btnAddItemClick(Sender: TObject);
begin
 LimpaCamposItem;
 dbCtx.TItensPedido.Insert;
 layItem.Visible := true;
end;

procedure TfrmCadPedidos.btnAddStatusClick(Sender: TObject);
begin
 ObsStatusPedido.Lines.Clear;
 cbxStatusPedido.ItemIndex  :=-1;
 dbCtx.TStatusPedido.Insert;
 layStatusPedidoADD.Visible := true;
end;

procedure TfrmCadPedidos.btnAprovaOrcamentoClick(Sender: TObject);
begin
   if btnSalvarOrcamento.Enabled then
   begin
    MyShowMessage('Salve as alteraçoes do orçamento antes de prosseguir',false);
    Exit;
   end;
   MyShowMessage('Deseja aprovar esse orçamento? O valores dos itens do pedido serão atualizados',true);
   if frmPrincipal.vMsgConfirma=1 then
   begin
     dbCtx.AprovaItemsOracamento(dbCtx.TOrcamentoid.AsString,dbCtx.TOrcamentoidpedido.AsString);
     GeraNovosOrcamentosAprovadosOrcamnto(vIdPedido,dbCtx.TOrcamentoid.AsString);
     MyShowMessage('Orçamento aprovado com sucesso!',false);
     if dbCtx.vTipoBDConfig in[0,2] then
     begin
       dbCtx.AbreOrcamentos(vIdPedido,'');
       MudarAba(tbiCotacoes,Sender);
     end
     else
     begin
      dbCtx.AbreOrcamentos(vIdPedido,'');
      MudarAba(tbiCotacoes,Sender);
     end;
   end;
end;

procedure TfrmCadPedidos.btnAprovarItensClick(Sender: TObject);
var
 I:integer;
begin
 if GridItensAprovados.RowCount=0 then
 begin
   MyShowMessage('Adicione pelo menos um Item!!',false);
   Exit;
 end;
 MyShowMessage('Deseja aprovar esse orçamento? O valores dos itens do pedido serão atualizados, e os demais orcamentos serão descartados',true);
 if frmPrincipal.vMsgConfirma=1 then
 begin
   for I := 0 to GridItensAprovados.RowCount-1 do
   begin
     dbCtx.AprovaItemsOracamentoInd(
      GridItensAprovados.Cells[9,I],
      GridItensAprovados.Cells[8,I],
      StringReplace(TRIM(StringReplace(GridItensAprovados.Cells[6,I],'R$ ','',[rfReplaceAll])),',','.',[rfReplaceAll]),
      StringReplace(TRIM(StringReplace(GridItensAprovados.Cells[7,I],'R$ ','',[rfReplaceAll])),',','.',[rfReplaceAll]),
      GridItensAprovados.Cells[1,I]
      );
   end;
   GeraNovosOrcamentosAprovados(vIdPedido);
    MyShowMessage('Items aprovados com sucesso!!',false);
    dbCtx.AbreOrcamentos(vIdPedido,'');
    MudarAba(tbiCotacoes,Sender);
 end;
end;

procedure TfrmCadPedidos.btnBuscaItemClick(Sender: TObject);
begin
  frmCadProdutos := TfrmCadProdutos.Create(nil);
  try
    frmCadProdutos.ShowModal;
  finally
    vIdItemPedido               := dbCtx.TProdutosId.AsString;
    if not dbCtx.VerificaItemPedido(vIdPedido,vIdItemPedido) then
    begin
     edtItemPedido.text          := '';
     cbxUnidadeMedida.ItemIndex  := -1;
     MyShowMessage('Item ja Adicionado ao Pedido!',false);
    end
    else
    begin
     edtItemPedido.text          := dbCtx.TProdutosNome.AsString;
     cbxUnidadeMedida.ItemIndex  := cbxUnidadeMedida.Items.IndexOf(dbCtx.TProdutosunidademedida.AsString);
    end;
    frmCadProdutos.Free;
  end;
end;

procedure TfrmCadPedidos.btnBuscarListaClick(Sender: TObject);
begin
 Filtro;
end;

procedure TfrmCadPedidos.btnCancelarClick(Sender: TObject);
begin
 MudarAba(tbiLista,sender);
end;

procedure TfrmCadPedidos.btnCancelaRecebimentoClick(Sender: TObject);
begin
   layRecebimento.Visible  := false;
end;

procedure TfrmCadPedidos.btnCancelaStatusClick(Sender: TObject);
begin
  layStatusPedidoADD.Visible  := false;
end;

procedure TfrmCadPedidos.btnCancelatemOrcamentoClick(Sender: TObject);
begin
 layItemOrcamento.Visible :=FALSE;
end;

procedure TfrmCadPedidos.btnCarregaIMGClick(Sender: TObject);
begin
 if OpenImg.Execute then
 begin
   imgProduto.Bitmap.LoadFromFile(OpenImg.FileName);
 end;
end;

procedure TfrmCadPedidos.btnComparativoClick(Sender: TObject);
begin
  with qryAux,qryAux.SQL do
  begin
   Clear;
   Add('delete from tmpcomparativo');
   ExecSQL;
  end;
  GridItensAprovados.RowCount := 0;
  GeraCompartivo(vIDPedido);
  MudarAba(tbiComparativo,sender);
end;

procedure TfrmCadPedidos.btnConfirmaRecebimentoClick(Sender: TObject);
begin
 if edtDataRecebimento.Text.Length =0 then
  begin
    MyShowMessage('Informe a Data do Recebimento *',false);
    edtDataStatus.SetFocus;
    Exit;
  end;
  dbCtx.TItensPedido.Edit;
  dbCtx.TItensPedidorecebido.AsBoolean             := true;
  dbCtx.TItensPedidodataRecebimento.AsDateTime     := edtDataRecebimento.DateTime;
  dbCtx.TItensPedidoidusuariorecebimento.AsString  := dbCtx.vIdUsuarioLogado;
  dbCtx.TItensPedidoobservacaorecebimento.AsString := edtObseRecebimento.Text;

  if dbCtx.vTipoBDConfig=2 then
   dbCtx.TItensPedidosyncFaz.AsInteger :=1
  else
   dbCtx.TItensPedidosyncFaz.AsInteger :=0;

  dbCtx.TItensPedido.ApplyUpdates(-1);
  layRecebimento.Visible := false;
end;

procedure TfrmCadPedidos.btnDeletarClick(Sender: TObject);
begin
 if not dbCtx.AbreItenOrcamentoEdit(dbCtx.TItensOrcamentoid.AsString)then
 begin
   dbCtx.TItensOrcamentoInsert.Edit;
   MyShowMessage('Deseja Realmente Deletar esse registro?',true);
   case frmPrincipal.vMsgConfirma of
     1:begin
        dbCtx.TItensOrcamentoInsertStatus.AsInteger := -1;
        dbCtx.TItensOrcamentoInsertIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
        dbCtx.TItensOrcamentoInsertDataAlteracao.AsDateTime     := now;
        dbCtx.AlteraFlaSynAWS_ZERO('orcamentositens',dbCtx.TItensOrcamentoID.AsString);
        try
          dbCtx.TItensOrcamentoInsert.ApplyUpdates(-1);
          MyShowMessage('Registro Excluido com sucesso!',false);
          dbCtx.AbreItemsOrcamentos(dbCtx.TOrcamentoid.AsString);
        except
         on E : Exception do
          ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
        end;
     end;
   end;
 end;
end;

procedure TfrmCadPedidos.btnEditaItemClick(Sender: TObject);
begin
  edtItemPedido.Text         := dbCtx.TItensPedidoNome.AsString;
  vIdItemPedido              := dbCtx.TItensPedidoiditem.AsString;
  cbxUnidadeMedida.ItemIndex := cbxUnidadeMedida.Items.IndexOf(dbCtx.TItensPedidounidademedida.AsString);
  edtQtde.Text               := dbCtx.TItensPedidoquantidade.AsString;
  edtValorUni.Text           := dbCtx.TItensPedidovalorunidade.AsString;
  edtObsItem.Text            := dbCtx.TItensPedidoobservacao.AsString;
  edtMarcaItemPedido.Text    := dbCtx.TItensPedidomarca.AsString;
  vIdMarcaItemPedido         := dbCtx.TItensPedidoidmarca.AsString;
  case dbCtx.TItensPedidooriginal.AsInteger of
   0:begin
       rdOriginal.IsChecked := false;
       rdParalelo.IsChecked := true;
     end;
   1:begin
       rdOriginal.IsChecked := true;
       rdParalelo.IsChecked := false;
     end;
  end;
  layItem.Visible            := true;
  dbCtx.TItensPedido.Edit;
end;

procedure TfrmCadPedidos.btnEditaOrcamentoClick(Sender: TObject);
begin
 edtFormaPagamento.Enabled    := true;
 edtDescontoGeral.Enabled     := true;
 edtFreteGeral.Enabled        := true;
 edtPrevisaoEntrega.Enabled   := true;
 btnEditaOrcamento.Enabled    := true;
 btnSalvarOrcamento.Enabled   := true;
end;

procedure TfrmCadPedidos.btnEditarClick(Sender: TObject);
begin
  if vIdPedido.Length=0 then
  begin
    MyShowMessage('Selecione um pedido antes!',false);
    Exit;
  end;
  dbCtx.AbrePedidos('and a.id='+vIdPedido);
  dataSolicitacao.DateTime   := dbCtx.TPedidoCompradatapedido.AsDateTime;
  edtCentroCusto.Text        := dbCtx.TPedidoCompracentrocusto.AsString;
  edtSolicitante.Text        := dbCtx.TPedidoComprasolicitante.AsString;
  cbxSegmento.ItemIndex      := dbCtx.TPedidoCompraidsegmento.AsInteger;
  cbxCategoria.ItemIndex     := dbCtx.TPedidoCompraidcategoria.AsInteger;
  cbxSetorDestino.ItemIndex  := cbxSetorDestino.Items.IndexOf(dbCtx.TPedidoComprasetor.AsString);
  cbxPrioridade.ItemIndex    := dbCtx.TPedidoCompraflagurgente.AsInteger;
  lblMaquina.Visible         := dbCtx.TPedidoCompraidcategoria.AsInteger=1;
  edtMaquinaVeiculo.Visible  := dbCtx.TPedidoCompraidcategoria.AsInteger=1;
  layServico.Visible         := dbCtx.TPedidoCompraidcategoria.AsInteger=2;
  if dbCtx.TPedidoCompraidcategoria.AsInteger=1 then
  begin
   edtMaquinaVeiculo.text   := dbCtx.TPedidoCompramaquinaveiculo.AsString;
   vIdMaquina               := dbCtx.TPedidoCompraidmaquina.AsString;
  end;
  if dbCtx.TPedidoCompraidcategoria.AsInteger=2 then
  begin
   edtServico.text          := dbCtx.TPedidoCompratiposervico.AsString;
   edtDescricao.Text        := dbCtx.TPedidoCompradescricaoservico.AsString;
   vIdServico               := dbCtx.TPedidoCompraidservico.AsString;
  end;
  edtCentroCusto.Text       := dbCtx.TPedidoCompracentrocusto.AsString;;
  edtPropriedadeDestino.Text:=dbCtx.TPedidoCompraPropriedadeNome.AsString;
  vIsertPedido :='N';
  vIdSolicitante            := dbCtx.TPedidoCompraidsolicitante.AsString;
  vIdCentroCusto            := dbCtx.TPedidoCompraidcentrocusto.AsString;
  vIdPropriedade            := dbCtx.TPedidoCompraidpropriedade.AsString;
  dbCtx.TPedidoCompra.Edit;
  dbCtx.TPedidoComprasyncFaz.AsInteger :=0;
  inherited;
end;

procedure TfrmCadPedidos.btnEditaStatusClick(Sender: TObject);
begin
 cbxStatusPedido.ItemIndex  := dbCtx.TStatusPedidoidstatus.AsInteger;
 cbxStatusPedido.Enabled    := false;
 edtDataStatus.Date         := dbCtx.TStatusPedidodatastatus.AsDateTime;
 ObsStatusPedido.Text       := dbCtx.TStatusPedidoobservacao.AsString;
 layStatusPedidoADD.Visible := true;
end;

procedure TfrmCadPedidos.btnExcluirFornClick(Sender: TObject);
begin
 DeleteRow(gridForneAdd,gridForneAdd.Row);
end;

procedure TfrmCadPedidos.btnExcluirItemClick(Sender: TObject);
begin
 if strToInt(vStatusSelect)>4 then
 begin
    MyShowMessage('Status do pedido nao permite mais exclusão de item*',false);
    Exit;
 end;
 MyShowMessage('Deseja realmente deletar esse item do pedido?',false);
 if frmPrincipal.vMsgConfirma=1 then
 begin
   dbCtx.AlteraFlaSynAWS_ZERO('pedidocompraitems',dbCtx.TItensPedidoID.AsString);
   dbCtx.TItensPedido.Edit;
   dbCtx.TItensPedidostatus.AsInteger :=-1;
   dbCtx.TItensPedidodataalteracao.AsDateTime :=now;
   dbCtx.TItensPedidoidusuarioalteracao.AsString := dbCtx.vIdUsuarioLogado;

   if dbCtx.vTipoBDConfig=2 then
    dbCtx.TItensPedidosyncFaz.AsInteger :=1
   else
    dbCtx.TItensPedidosyncFaz.AsInteger :=0;

   dbCtx.TItensPedido.ApplyUpdates(-1);
   dbCtx.AbreItemPedidos(vIdPedido);
   MyShowMessage('Item deletado com sucesso!',false);
 end;
end;

procedure TfrmCadPedidos.btnExcluirStatusClick(Sender: TObject);
begin
 MyShowMessage('Deseja realmente deletar esse Status?',false);
 if frmPrincipal.vMsgConfirma=1 then
 begin
   dbCtx.AlteraFlaSynAWS_ZERO('pedidostatus',dbCtx.TStatusPedidoID.AsString);
   dbCtx.TStatusPedido.Edit;
   dbCtx.TStatusPedidostatus.AsInteger :=-1;
   dbCtx.TStatusPedidodataalteracao.AsDateTime :=now;
   dbCtx.TStatusPedidoidusuarioalteracao.AsString := dbCtx.vIdUsuarioLogado;

   if dbCtx.vTipoBDConfig=2 then
    dbCtx.TStatusPedidosyncFaz.AsInteger :=1
   else
    dbCtx.TStatusPedidosyncFaz.AsInteger :=0;
   

   dbCtx.TStatusPedido.ApplyUpdates(-1);

   dbCtx.AtualizaStatusExluido(vIdPedido);
   MyShowMessage('Status deletado com sucesso!',false);
   dbCtx.AbreStatusPedidos(vIdPedido);
 end;
end;

procedure TfrmCadPedidos.btnFecharClick(Sender: TObject);
begin
  if tbPrincipal.TabIndex=0 then
   Close
  else
  begin
   dbCtx.AbrePedidos('');
   GeraLista;
   MudarAba(tbiLista,sender);
  end;
end;

procedure TfrmCadPedidos.btnFinalizaOrcamentoClick(Sender: TObject);
begin
   if btnSalvarOrcamento.Enabled then
   begin
    MyShowMessage('Salve as alteraçoes do orçamento antes de prosseguir',false);
    Exit;
   end;
   try
     MyShowMessage('Deseja realmente Finalizar esse orçamento?',true);
     if frmPrincipal.vMsgConfirma=1 then
     begin
       dbCtx.TOrcamento.Edit;
       dbCtx.TOrcamentostatus.AsInteger :=2;

       if dbCtx.vTipoBDConfig=2 then
        dbCtx.TOrcamentosyncFaz.AsInteger :=1
       else
        dbCtx.TOrcamentosyncFaz.AsInteger :=0;

       dbCtx.TOrcamento.ApplyUpdates(-1);
       MyShowMessage('Orçamento Finalizado com sucesso!',false);
       dbCtx.AbreOrcamentos(vIdPedido,'');
       MudarAba(tbiCotacoes,Sender);
     end
     else
     begin
       dbCtx.AbreOrcamentos(vIdPedido,'');
       MudarAba(tbiCotacoes,Sender);
     end;
   except
    on E: Exception do
      myShowMessage('Erro ao salvar Item:'+E.Message,false);
   end;
end;

procedure TfrmCadPedidos.btnImprimirClick(Sender: TObject);
begin
 dbCtx.AbreItemsOrcamentos(dbCtx.TOrcamentoid.AsString);
 case dbctx.TOrcamentostatus.AsInteger  of
    1:begin
       dmReport.ppRepOrcamento.ShowPrintDialog := true;
       dmReport.ppRepOrcamento.DeviceType      := 'Screen';
       dmReport.ppRepOrcamento.Print;
      end;
    2:begin
       dmReport.ppRepOrcamento.ShowPrintDialog := true;
       dmReport.ppRepOrcamento.DeviceType      := 'Screen';
       dmReport.ppRepOrcamento.Print;
      end;
    3:begin
        dmReport.ppRepOrcamento.ShowPrintDialog := true;
        dmReport.ppRepOrdemCompra.DeviceType   := 'Screen';
        dbCtx.AbrePropriedade(vIdPropriedade);
        dmReport.ppRepOrdemCompra.Print;
      end;
  end;
end;

procedure TfrmCadPedidos.btnLimparImgClick(Sender: TObject);
begin
   imgProduto.Bitmap.Assign(nil);
end;

procedure TfrmCadPedidos.btnMudaStatusClick(Sender: TObject);
begin
 try
   Filtro;
   myShowMessage('Registro Atualizado com Sucesso',false);
   MudarAba(tbiCotacoes,sender);
 except
  on E: Exception do
    myShowMessage('Erro ao salvar Item:'+E.Message,false);
 end;
end;

procedure TfrmCadPedidos.btnSalvaItemClick(Sender: TObject);
begin
  if edtItemPedido.Text.Length =0 then
  begin
    MyShowMessage('Informe o Item*',false);
    edtItemPedido.SetFocus;
    Exit;
  end;
  if cbxUnidadeMedida.ItemIndex=-1 then
  begin
    MyShowMessage('Informe a Unidade de Medida*',false);
    cbxUnidadeMedida.SetFocus;
    Exit;
  end;
  if(edtQtde.Text.Length=0)or(edtQtde.Text='0') then
  begin
    MyShowMessage('Informe a Quantidade*',false);
    edtQtde.SetFocus;
    Exit;
  end;
  if dbCtx.TItensPedido.State=dsEdit then
   dbCtx.AlteraFlaSynAWS_ZERO('pedidocompraitems',dbCtx.TItensPedidoID.AsString);
  dbCtx.TItensPedidoidpedido.AsString      := vIdPedido;
  dbCtx.TItensPedidoiditem.AsString        := vIdItemPedido;
  dbCtx.TItensPedidounidademedida.AsString := cbxUnidadeMedida.Selected.Text;
  dbCtx.TItensPedidoquantidade.AsString    := edtQtde.Text;
  if edtValorUni.Text.Length>0 then
   dbCtx.TItensPedidovalorunidade.AsString := StringReplace(StringReplace(edtValorUni.Text,'R$','',[rfReplaceAll]),'.','',[rfReplaceAll]);
  if edtObsItem.Text.Length>0 then
   dbCtx.TItensPedidoobservacao.AsString  := edtObsItem.Text;
  dbCtx.TItensPedidoidusuario.AsString    := dbCtx.vIdUsuarioLogado;
  if edtValorTotalItem.Text.Length>0 then
   dbCtx.TItensPedidovalortotal.AsString  := StringReplace(StringReplace(edtValorTotalItem.Text,'R$','',[rfReplaceAll]),'.','',[rfReplaceAll]);

  if dbCtx.vTipoBDConfig=2 then
   dbCtx.TItensPedidosyncFaz.AsInteger :=1
  else
   dbCtx.TItensPedidosyncFaz.AsInteger :=0;

  if edtMarcaItemPedido.Text.Length>0 then
   dbCtx.TItensPedidoidmarca.Asstring := vIdMarcaItemPedido;
  if rdOriginal.IsChecked then
   dbCtx.TItensPedidooriginal.AsInteger :=1
  else
   dbCtx.TItensPedidooriginal.AsInteger :=0;
  try
   dbCtx.TItensPedido.ApplyUpdates(-1);
   if dbCtx.vTipoBDConfig in[0,2] then
   begin
       Image15.Enabled := false;
       Rectangle11.Enabled := false;
       btnSalvaItem.Enabled := false;
       layItem.Visible := false;
       dbCtx.AbreItemPedidos(vIdPedido);
       gridItens.Columns[6].Visible := false;
       Image15.Enabled := true;
       Rectangle11.Enabled := true;
       btnSalvaItem.Enabled := true;
   end
   else
   begin
    layItem.Visible := false;
    dbCtx.AbreItemPedidos(vIdPedido);
    gridItens.Columns[6].Visible := false;
   end;
  except
   on E: Exception do
    myShowMessage('Erro ao salvar Item:'+E.Message,false);
  end;
end;

procedure TfrmCadPedidos.btnSalvarClick(Sender: TObject);
begin
  if edtSolicitante.Text.Length =0 then
  begin
    MyShowMessage('Informe o Soicitante*',false);
    edtSolicitante.SetFocus;
    Exit;
  end;
  if edtCentroCusto.Text.Length =0 then
  begin
    MyShowMessage('Informe o Centro de Custo*',false);
    edtCentroCusto.SetFocus;
    Exit;
  end;
  if cbxSegmento.ItemIndex =-1 then
  begin
    MyShowMessage('Informe o Segmento',false);
    cbxSegmento.SetFocus;
    Exit;
  end;
  if cbxCategoria.ItemIndex =-1 then
  begin
    MyShowMessage('Informe a Categoria',false);
    cbxCategoria.SetFocus;
    Exit;
  end;
  if edtPropriedadeDestino.Text.Length=0 then
  begin
    MyShowMessage('Informe a Propriedade Destino',false);
    edtPropriedadeDestino.SetFocus;
    Exit;
  end;
  if cbxPrioridade.ItemIndex =-1 then
  begin
    MyShowMessage('Informe a Prioridade *',false);
    cbxPrioridade.SetFocus;
    Exit;
  end;
  if cbxSetorDestino.ItemIndex =-1 then
  begin
    MyShowMessage('Informe o Setor *',false);
    cbxSetorDestino.SetFocus;
    Exit;
  end;
  dbCtx.TPedidoCompraidcategoria.AsInteger  := cbxCategoria.ItemIndex;
  dbCtx.TPedidoCompraidsegmento.AsInteger   := cbxSegmento.ItemIndex;
  dbCtx.TPedidoCompraflagurgente.AsInteger  := cbxPrioridade.ItemIndex;
  dbCtx.TPedidoComprasetor.AsString         := cbxSetorDestino.Selected.Text;
  dbCtx.TPedidoCompraidsolicitante.AsString := vIdSolicitante;
  dbCtx.TPedidoCompradatapedido.AsDateTime  := dataSolicitacao.DateTime;
  dbCtx.TPedidoCompraidmaquina.AsString     := vIdMaquina;
  dbCtx.TPedidoCompraidservico.AsString     := vIdServico;
  dbCtx.TPedidoCompraidpropriedade.AsString := vIdPropriedade;
  dbCtx.TPedidoCompraidcentrocusto.AsString := vIdCentroCusto;

  if dbCtx.TPedidoCompra.State=dsEdit then
  begin
   if cbxSegmento.ItemIndex=0 then
    dbCtx.TPedidoCompraidentificador.AsString       := vIdPedido+'-AGRO'
   else
    dbCtx.TPedidoCompraidentificador.AsString       := vIdPedido+'-AGRI';

   dbCtx.TPedidoCompraIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
   dbCtx.TPedidoCompraDataAlteracao.AsDateTime     := now;
  end;
  if dbCtx.TPedidoCompra.State=dsInsert then
  begin
   dbCtx.TPedidoCompraidentificador.AsString := RetornaIdentificador(intToStr(cbxSegmento.ItemIndex));
   dbCtx.TPedidoCompraIdUsuario.AsString := dbCtx.vIdUsuarioLogado;
  end
  else
   dbCtx.AlteraFlaSynAWS_ZERO('pedidocompra',dbCtx.TPedidoCompraID.AsString);

  if dbCtx.vTipoBDConfig=2 then
   dbCtx.TPedidoComprasyncFaz.AsInteger :=1
  else
   dbCtx.TPedidoComprasyncFaz.AsInteger :=0;


  dbCtx.TPedidoCompra.ApplyUpdates(-1);
  if vIsertPedido='S' then
  begin
    vIdPedido  := dbCtx.RetornaMaxPedido;
    dbCtx.InsereStatusInicial(vIdPedido);
  end;
  MyShowMessage('Pedido Cadastrado com Sucesso!',false);
  if dbCtx.vTipoBDConfig in[0,2] then
  begin
   TThread.CreateAnonymousThread(procedure()
   begin
     TThread.Synchronize(nil,procedure
     begin
       dbCtx.AbrePedidos('');
       btnVoltar.Enabled  := true;
       btnSalvar.Enabled  := true;
       btnCancela.Enabled := true;
       if vIsertPedido='S' then
       begin
        dbCtx.AbreItemPedidos(vIdPedido);
        lblItemsPedido.Text := 'Items do Pedido :'+vIdentificador;
        MudarAba(tbiItensPedido,sender);
        gridItens.Columns[6].Visible := false;
       end
       else
       begin
        GeraLista;
        inherited;
        btnVoltar.Enabled  := true;
        btnSalvar.Enabled  := true;
        btnCancela.Enabled := true;
       end;
     end);
   end).Start;
  end
  else
  begin
   if vIsertPedido='S' then
   begin
    dbCtx.AbreItemPedidos(vIdPedido);
    lblItemsPedido.Text := 'Items do Pedido :'+vIdentificador;
    MudarAba(tbiItensPedido,sender);
    gridItens.Columns[6].Visible := false;
   end
   else
   begin
    btnVoltar.Enabled  := true;
    btnSalvar.Enabled  := true;
    btnCancela.Enabled := true;
    dbCtx.AbrePedidos('');
    GeraLista;
    inherited;
   end;
  end;
end;

procedure TfrmCadPedidos.btnSalvaRecClick(Sender: TObject);
begin
 try
  dbCtx.ConfirmaRecebimentoItem(vIdItensRecebimento,'1',
   StringReplace(edtRecebimentoQtd.Text,',','.',[rfReplaceAll]),
   edtRecebimentoObs.Text.QuotedString,
   FormatDateTime('yyyy-mm-dd',edtRecebimentoData.Date).QuotedString,
   dbCtx.vIdUsuarioLogado);
   GeraListaRecebimento;
   layItemRecebido.Visible := false;
 except
  on E: Exception do
   myShowMessage('Erro ao salvar Recebimento:'+E.Message,false);
 end;
end;

procedure TfrmCadPedidos.btnSalvarOrcamentoClick(Sender: TObject);
var
 vDesconto,vFrete,idFormaPG:string;
begin
 if edtDescontoGeral.Text.Length>0 then
  vDesconto := StringReplace(edtDescontoGeral.Text,',','.',[rfReplaceAll])
 else
  vDesconto :='0';

 if edtFreteGeral.Text.Length>0 then
  vFrete := StringReplace(edtFreteGeral.Text,',','.',[rfReplaceAll])
 else
  vFrete :='0';

 if edtFormaPagamento.Text.Length>0 then
  idFormaPG:= vIdFormaPg
 else
  idFormaPG:='0';
 try
  dbCtx.AtualizaOrcamentoDescontoFreteFormaPG(
  dbCtx.TOrcamentoid.AsString,
  vDesconto,
  vFrete,
  idFormaPG,
  IntToStr(GridDetalhesOrcamento.RowCount),
  edtPrevisaoEntrega.Text);



  edtFormaPagamento.Enabled  := false;
  edtDescontoGeral.Enabled   := false;
  edtFreteGeral.Enabled      := false;
  btnEditaOrcamento.Enabled  := true;
  btnSalvarOrcamento.Enabled := false;

  edtPrevisaoEntrega.Enabled   := false;

  MyShowMessage('Orcamento Atualizado com Sucesso!',false);
  dbCtx.AbreOrcamentosInd(dbCtx.TOrcamentoid.AsString);
  dbCtx.AbreItemsOrcamentos(dbCtx.TOrcamentoid.AsString);
  lblTotalItens.Text           := 'Total Itens:'+intToStr(GridDetalhesOrcamento.RowCount);
  lblValorTotal.Text           := 'Valor Bruto:'+FormatFloat('R$####,##0.00',dbCtx.TValorLiquidoOrcvalorbruto.AsFloat);
  lblValorTotalMaisFrete.Text  := 'Valor Bruto + Frete:'+FormatFloat('R$####,##0.00',dbCtx.TValorLiquidoOrcvalorbrutomaisfrete.AsFloat);
  lblValorLiquido.Text         := 'Valor Liquido:'+FormatFloat('R$####,##0.00',dbCtx.TValorLiquidoOrcvalorliquido.AsFloat);
  edtFormaPagamento.Text := dbCtx.TItensOrcamentoformapg.AsString;
  vIdFormaPg             := dbCtx.TItensOrcamentoidformapg.AsString;
  lblFornecedor.Text     := dbCtx.TItensOrcamentofornecedor.AsString;
  edtFreteGeral.Text     := dbCtx.TOrcamentofrete.AsString;
  edtDescontoGeral.Text  := dbCtx.TOrcamentodesconto.AsString;
 except
  on E: Exception do
   myShowMessage('Erro ao salvar Item:'+E.Message,false);
 end;
end;

procedure TfrmCadPedidos.btnSalvatemOrcamentoClick(Sender: TObject);
var
 Stream : TMemoryStream;
begin
  if edValorUnitarioItemOrcamento.Text.Length =0 then
  begin
    MyShowMessage('Informe o Valor da Unidade*',false);
    edValorUnitarioItemOrcamento.SetFocus;
    Exit;
  end;
  if edtitemOrcamento.Text.Length =0 then
  begin
    MyShowMessage('Informe o Item*',false);
    edtitemOrcamento.SetFocus;
    Exit;
  end;
  if edtitemOrcamento.Text.Length =0 then
  begin
    MyShowMessage('Informe o Item*',false);
    edtitemOrcamento.SetFocus;
    Exit;
  end;
  if cbxUniMedItemOrcamento.ItemIndex=-1 then
  begin
    MyShowMessage('Informe a Unidade de Medida*',false);
    cbxUniMedItemOrcamento.SetFocus;
    Exit;
  end;
  if(edtQtdItemOrcamento.Text.Length=0)or(edtQtdItemOrcamento.Text='0') then
  begin
    MyShowMessage('Informe a Quantidade*',false);
    edtQtdItemOrcamento.SetFocus;
    Exit;
  end;
  if dbCtx.TItensOrcamentoInsert.State=dsInsert then
   dbCtx.TItensOrcamentoInsertidusuario.AsString :=dbCtx.vIdUsuarioLogado;
  if dbCtx.TItensOrcamentoInsert.State=dsEdit then
  begin
   dbCtx.TItensOrcamentoInsertidusuarioalteracao.AsString :=dbCtx.vIdUsuarioLogado;
   dbCtx.TItensOrcamentoInsertdataalteracao.AsDateTime    := now;
  end;
  dbCtx.TItensOrcamentoInsertidproduto.AsString          := vIdItemOrcamento;
  if cbxUniMedItemOrcamento.ItemIndex>-1 then
   dbCtx.TItensOrcamentoInsertunidademedida.AsString     := cbxUniMedItemOrcamento.Selected.Text;
  dbCtx.TItensOrcamentoInsertqtde.AsString               := edtQtdItemOrcamento.Text;
  dbCtx.TItensOrcamentoInsertvalorunidade.AsString       := edValorUnitarioItemOrcamento.Text;
  if(edValorUnitarioItemOrcamento.Text.Length>0) and(edtQtdItemOrcamento.Text.Length>0) then
   dbCtx.TItensOrcamentoInsertvalortotal.AsFloat := StrToFloat(edValorUnitarioItemOrcamento.Text)*StrToFloat(edtQtdItemOrcamento.Text);


  if(edtFreteGeral.Text='')or(edtFreteGeral.Text='0') then
  begin
   dbCtx.TItensOrcamentoInsertfrete.AsString             := edtFreteItemOrcamento.Text;
   dbCtx.TItensOrcamentoInsertfreterateio.AsString       := edtFreteItemOrcamento.Text;
  end;
  if(edtDescontoGeral.Text='')or(edtDescontoGeral.Text='0') then
  begin
    dbCtx.TItensOrcamentoInsertdesconto.AsString           := edtDescontoitemOrcamento.Text;
    dbCtx.TItensOrcamentoInsertdescontorateio.AsString     := edtDescontoitemOrcamento.Text;
  end;

  dbCtx.TItensOrcamentoInserticmst.AsString              := edtIcmsItemOrcamento.Text;
  dbCtx.TItensOrcamentoInsertipi.AsString                := edtIpiItemOrcamento.Text;
  dbCtx.TItensOrcamentoInsertidorcamento.AsString        := dbCtx.TOrcamentoid.AsString;
  dbCtx.TItensOrcamentoInsertdiferencialalicota.AsString := edtDifalItemOrcamento.Text;
//  dbCtx.TItensOrcamentoInsertvalortotal.AsString         := edtValorTotaltemOrcamento.Text;
  if edtMarcaItemOrcamento.Text.Length>0 then
   dbCtx.TItensOrcamentoInsertidmarca.AsString           := vIdMarcaItemOrcamento;
  if rdParalelotemOrcamento.IsChecked=true then
   dbCtx.TItensOrcamentoInsertoriginal.AsInteger:=0;
  if rdOriginaltemOrcamento.IsChecked=true then
   dbCtx.TItensOrcamentoInsertoriginal.AsInteger:=1;
  dbCtx.TItensOrcamentoInsertobservacao.AsString          := edtObstemOrcamento.Text;
  if not imgProduto.Bitmap.IsEmpty then
  begin
   Stream := TMemoryStream.Create;
   imgProduto.Bitmap.SaveToStream(Stream);
   dbCtx.TItensOrcamentoInsertimg.loadfromstream(Stream);
  end;
  try
   dbCtx.TItensOrcamentoInsert.ApplyUpdates(-1);
   MyShowMessage('Item registrado com sucesso!',false);
   layItemOrcamento.Visible := false;
   dbCtx.AbreItemsOrcamentos(dbCtx.TOrcamentoid.AsString);
   lblTotalItens.Text           := 'Total Itens:'+intToStr(GridDetalhesOrcamento.RowCount);
   lblValorTotal.Text           := 'Valor Bruto:'+FormatFloat('R$####,##0.00',dbCtx.TValorLiquidoOrcvalorbruto.AsFloat);
   lblValorTotalMaisFrete.Text  := 'Valor Bruto + Frete:'+FormatFloat('R$####,##0.00',dbCtx.TValorLiquidoOrcvalorbrutomaisfrete.AsFloat);
   lblValorLiquido.Text         := 'Valor Liquido:'+FormatFloat('R$####,##0.00',dbCtx.TValorLiquidoOrcvalorliquido.AsFloat);
   edtFormaPagamento.Text       := dbCtx.TItensOrcamentoformapg.AsString;
   vIdFormaPg                   := dbCtx.TItensOrcamentoidformapg.AsString;
   lblFornecedor.Text           := dbCtx.TItensOrcamentofornecedor.AsString;
   edtFreteGeral.Text           := dbCtx.TOrcamentofrete.AsString;
    edtDescontoGeral.Text       := dbCtx.TOrcamentodesconto.AsString;
  except
  on E: Exception do
    myShowMessage('Erro ao salvar Item:'+E.Message,false);
  end;
end;

procedure TfrmCadPedidos.CalculaValorBrutoLiquidoOrcamento;
var
 vDesconto,Frete,ICMS,IPI,DIFAL:double;
begin
 if edtDescontoitemOrcamento.Text.Length>0 then
  vDesconto := StrToFloat(edtDescontoitemOrcamento.Text)
 else
  vDesconto := 0;

 if edtFreteItemOrcamento.Text.Length>0 then
  FRETE := StrToFloat(edtFreteItemOrcamento.Text)
 else
  FRETE := 0;

 if edtIcmsItemOrcamento.Text.Length>0 then
  ICMS := StrToFloat(edtIcmsItemOrcamento.Text)
 else
  ICMS := 0;

 if edtIpiItemOrcamento.Text.Length>0 then
  IPI := StrToFloat(edtIpiItemOrcamento.Text)
 else
  IPI := 0;

 if edtDifalItemOrcamento.Text.Length>0 then
  DIFAL := StrToFloat(edtDifalItemOrcamento.Text)
 else
  DIFAL := 0;

 if(edtQtdItemOrcamento.Text.Length>0)and(edValorUnitarioItemOrcamento.Text.Length>0) then
  edtValorTotaltemOrcamento.Text :=
  FloatToStr((strToFloat(edtQtdItemOrcamento.Text) *
  strToFloat(
   StringReplace(StringReplace(edValorUnitarioItemOrcamento.Text,'R$','',[rfReplaceAll]),'.','',[rfReplaceAll]))));

 if (edtQtdItemOrcamento.Text.Length>0)and(edValorUnitarioItemOrcamento.Text.Length>0) then
  edtValorLiquidoItemOrc.Text :=
  FloatToStr((strToFloat(edtQtdItemOrcamento.Text) *
  strToFloat(
   StringReplace(StringReplace(edValorUnitarioItemOrcamento.Text,'R$','',[rfReplaceAll]),'.','',[rfReplaceAll]))+
   (Frete+ipi+icms+difal)-vDesconto));
end;

procedure TfrmCadPedidos.cbxCategoriaChange(Sender: TObject);
begin
 layServico.Visible        := cbxCategoria.ItemIndex=2;
 lblMaquina.Visible        := cbxCategoria.ItemIndex=1;
 edtMaquinaVeiculo.Visible := cbxCategoria.ItemIndex=1;
end;

procedure TfrmCadPedidos.cbxStatusFKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
var
  aStr:string;
  I: Integer;
begin
  if key=vkReturn then exit;
  if (keychar in [chr(48)..chr(57)]) or (keychar in [chr(65)..chr(90)]) or (keychar in [chr(97)..chr(122)]) then begin
    if MilliSecondsBetween(LastTimeKeydown,Now)<500 then
      keys:=keys+keychar
    else
      keys:=keychar;
    LastTimeKeydown:=Now;
    for I := 0 to cbxStatusF.Items.Count-1 do
      if uppercase(copy(cbxStatusF.items[i],0,keys.length))=uppercase(keys) then begin
        cbxStatusF.itemindex:=i;
        exit;  //first item found is good
      end;
  end;
  inherited;
end;

procedure TfrmCadPedidos.cbxStatusPedidoKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
var
  aStr:string;
  I: Integer;
begin
  if key=vkReturn then exit;
  if (keychar in [chr(48)..chr(57)]) or (keychar in [chr(65)..chr(90)]) or (keychar in [chr(97)..chr(122)]) then begin
    if MilliSecondsBetween(LastTimeKeydown,Now)<500 then
      keys:=keys+keychar
    else
      keys:=keychar;
    LastTimeKeydown:=Now;
    for I := 0 to cbxStatusPedido.Items.Count-1 do
      if uppercase(copy(cbxStatusPedido.items[i],0,keys.length))=uppercase(keys) then begin
        cbxStatusPedido.itemindex:=i;
        exit;  //first item found is good
      end;
  end;
  inherited;
end;

procedure TfrmCadPedidos.cbxStatusOrcamentoChange(Sender: TObject);
begin
 FiltrarOrcamento;
end;

procedure TfrmCadPedidos.EditButton1Click(Sender: TObject);
begin
  frmUsuarios := TfrmUsuarios.Create(nil);
  try
    frmUsuarios.ShowModal;
  finally
   if dbCtx.TUsuarionome.AsString.Length>0 then
   begin
    edtSolicitante.text   := dbCtx.TUsuarionome.AsString;
    vIdSolicitante        := dbCtx.TUsuarioId.AsString;
   end;
    frmUsuarios.Free;
  end;
end;

procedure TfrmCadPedidos.EditButton2Click(Sender: TObject);
begin
  frmCadMaquinaVeiculo := TfrmCadMaquinaVeiculo.Create(nil);
  try
    frmCadMaquinaVeiculo.ShowModal;
  finally
   if dbCtx.TMaquinasmarca.AsString.Length>0 then
   begin
    edtMaquinaVeiculo.text   := dbCtx.TMaquinasmarca.AsString+'-'+dbCtx.TMaquinasmodelo.AsString;
    vIdMaquina               := dbCtx.TMaquinasId.AsString;
   end;
    frmCadMaquinaVeiculo.Free;
  end;
end;

procedure TfrmCadPedidos.EditButton3Click(Sender: TObject);
begin
 frmCadServico := TfrmCadServico.Create(nil);
  try
    frmCadServico.ShowModal;
  finally
   if dbCtx.TServicotipo.AsString.Length>0 then
   begin
    edtServico.text     := dbCtx.TServicotipo.AsString;
    edtDescricao.Text   := dbCtx.TServicodescricao.AsString;
    vIdServico          := dbCtx.TServicoId.AsString;
   end;
    frmCadServico.Free;
  end;
end;

procedure TfrmCadPedidos.EditButton4Click(Sender: TObject);
begin
 frmCentroCusto := TfrmCentroCusto.Create(Self);
 try
  frmCentroCusto.ShowModal;
 finally
  if dbCtx.TCentroCustonome.AsString.Length>0 then
  begin
   edtCentroCusto.Text := dbCtx.TCentroCustonome.AsString;
   vIdCentroCusto      := dbCtx.TCentroCustoid.AsString;
  end;
  frmCentroCusto.Free;
 end;
end;

procedure TfrmCadPedidos.EditButton5Click(Sender: TObject);
begin
  frmCadAuxMarcas := TfrmCadAuxMarcas.Create(nil);
  try
    frmCadAuxMarcas.ShowModal;
  finally
    edtMarcaItemPedido.Text := dbCtx.TAuxMarcanome.AsString;
    vIdMarcaItemPedido      := dbCtx.TAuxMarcaid.AsString;
    frmCadAuxMarcas.Free;
  end;
end;

procedure TfrmCadPedidos.EditButton6Click(Sender: TObject);
begin
  frmCadProdutos := TfrmCadProdutos.Create(nil);
  try
    frmCadProdutos.ShowModal;
  finally
    vIdItemOrcamento               := dbCtx.TProdutosId.AsString;
    if not dbCtx.VerificaItemOrcamento(dbCtx.TOrcamentoid.AsString,vIdItemOrcamento) then
    begin
     edtitemOrcamento.text              := '';
     cbxUniMedItemOrcamento.ItemIndex   := -1;
     MyShowMessage('Item ja Adicionado ao Orçamento!',false);
    end
    else
    begin
     edtitemOrcamento.text             := dbCtx.TProdutosNome.AsString;
     cbxUniMedItemOrcamento.ItemIndex  := cbxUniMedItemOrcamento.Items.IndexOf(dbCtx.TItensOrcamentounidademedida.AsString);
    end;
    frmCadProdutos.Free;
  end;
end;

procedure TfrmCadPedidos.EditButton7Click(Sender: TObject);
begin
frmCadAuxMarcas := TfrmCadAuxMarcas.Create(nil);
  try
    frmCadAuxMarcas.ShowModal;
  finally
    edtMarcaItemOrcamento.Text := dbCtx.TAuxMarcanome.AsString;
    vIdMarcaItemOrcamento      := dbCtx.TAuxMarcaid.AsString;
    frmCadAuxMarcas.Free;
  end;
end;

procedure TfrmCadPedidos.EditButton8Click(Sender: TObject);
begin
 frmpropriedade := Tfrmpropriedade.Create(Self);
 try
  frmpropriedade.ShowModal;
 finally
  if dbCtx.TPropriedadenome.AsString.Length>0 then
  begin
   edtPropriedadeDestino.Text := dbCtx.TPropriedadenome.AsString;
   vIdPropriedade             := dbCtx.TPropriedadeid.AsString;
  end;
  frmpropriedade.Free;
 end;
end;

procedure TfrmCadPedidos.btnBuscaFormaPGClick(Sender: TObject);
begin
  frmCadFormaPG := TfrmCadFormaPG.Create(Self);
  try
    frmCadFormaPG.ShowModal;
  finally
   if dmCompras.AuxFormaPGcodigo.AsString.Length>0 then
   begin
    edtFormaPagamento.Text := dmCompras.AuxFormaPGdescricao.AsString;
    vIdFormaPg             := dmCompras.AuxFormaPGid.AsString;
   end;
   frmCadFormaPG.Free;
  end;
end;

procedure TfrmCadPedidos.btnBuscaForneClick(Sender: TObject);
begin
 if edtFiltraForn.Text.Length>0 then
 begin
   qryFornesedorSelect.Filtered := false;
   qryFornesedorSelect.Filter   := 'nome like '+QuotedStr('%'+edtFiltraForn.Text+'%');
   qryFornesedorSelect.Filtered := true;
 end
 else
 begin
   qryFornesedorSelect.Filtered := false;
   qryFornesedorSelect.Close;
   qryFornesedorSelect.Open;
 end;
end;

procedure TfrmCadPedidos.edtNomeFiltroChangeTracking(Sender: TObject);
begin
 Filtro;
end;

procedure TfrmCadPedidos.edtQtdeChangeTracking(Sender: TObject);
begin
  if (edtQtde.Text.Length>0)and(edtValorUni.Text.Length>0) then
  edtValorTotalItem.Text := 'R$'+FloatToStr(strToFloat(edtQtde.Text) * strToFloat(
   StringReplace(edtValorUni.Text,'R$','',[rfReplaceAll])));
end;

procedure TfrmCadPedidos.edtQtdeKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
 if ((keyChar in ['0'..'9'] = false) and (word(key) <> vk_back)) then
 begin
   KeyChar := #0;
 end;
end;

procedure TfrmCadPedidos.edtQtdItemOrcamentoExit(Sender: TObject);
begin
  CalculaValorBrutoLiquidoOrcamento;
end;

procedure TfrmCadPedidos.edtQtdItemOrcamentoKeyUp(Sender: TObject;
  var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
 if ((keyChar in ['0'..'9'] = false) and (word(key) <> vk_back)) then
 begin
   KeyChar := #0;
 end;
end;

procedure TfrmCadPedidos.edtValorUniExit(Sender: TObject);
begin
 if (edtQtde.Text.Length>0)and(edtValorUni.Text.Length>0) then
  edtValorTotalItem.Text :=
  'R$'+FloatToStr(strToFloat(edtQtde.Text) *
  strToFloat(
   StringReplace(StringReplace(edtValorUni.Text,'R$','',[rfReplaceAll]),'.','',[rfReplaceAll])));
end;

procedure TfrmCadPedidos.edtValorUniTyping(Sender: TObject);
begin
 Formatar(edtValorUni,TFormato.Money);
end;

procedure TfrmCadPedidos.edValorUnitarioItemOrcamentoExit(Sender: TObject);
begin
  CalculaValorBrutoLiquidoOrcamento;
end;

procedure TfrmCadPedidos.EnviaEmail(IDOrcamento: string);
begin
 TThread.CreateAnonymousThread(
 procedure
 var
  vResult:string;
 begin
   vResult:=PostEnviaEmailOrcamento(IDOrcamento);
   TThread.Synchronize(nil, procedure
   begin
     ShowMessage(vResult);
   end);
 end).Start;
end;

function TfrmCadPedidos.PostEnviaEmailOrcamento(idOrcamento:string):string;
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
   Url :='http://54.198.102.100:8091/EnviaEmailFornecedor';
//   Url :='http://192.168.1.68:8091/EnviaEmailFornecedor';
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
   TxtJSON.WriteEndObject;  //Fecha Cabeçalho do pedido
   LJsonObj := TJsonObject.ParseJSONValue(TEncoding.ASCII.GetBytes(StrAux.ToString),0)as TJSONObject;
   JsonToSend := TStringStream.Create(LJsonObj.ToJSON);
   IdHTTP1.Request.Accept      := 'application/json';
   IdHTTP1.Request.ContentType := 'application/json';
   try
     IdHTTP1.Request.CustomHeaders.Clear;
     vJsonString  := IdHTTP1.Post(URL,JsonToSend);
     IdHTTP1.Request.CustomHeaders.Clear;
     vReultHTTPc        := copy(vJsonString,0,26);
      if vReultHTTPc='{"Mensagem":"Email enviado' then
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

function TfrmCadPedidos.LimpaResut(vResult: string): String;
begin
  vResult := StringReplace(vResult,'{"result":[{"Mensagem":"','',[rfReplaceAll]);
  vResult := StringReplace(vResult,'{"result":[{"Erro":"','',[rfReplaceAll]);
  vResult := StringReplace(vResult,'{"result":[{"ok":"','',[rfReplaceAll]);
  vResult := StringReplace(vResult,'"}]}','',[rfReplaceAll]);
  vResult := StringReplace(vResult,'{"Mensagem":"','',[rfReplaceAll]);
  vResult := StringReplace(vResult,'{"Erro":"','',[rfReplaceAll]);
  vResult := StringReplace(vResult,'{"ok":"','',[rfReplaceAll]);
  vResult := StringReplace(vResult,'"}','',[rfReplaceAll]);
  Result  := vResult;
end;


procedure TfrmCadPedidos.ListaItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
 vIdItensRecebimento:=
   TAppearanceListViewItem(lista.Selected).Objects.FindObjectT<TListItemText>('Text1').TagString;
 vProdutoRecebimento:=
   TAppearanceListViewItem(lista.Selected).Objects.FindObjectT<TListItemText>('Text2').Text;
 vQtdeRecebimento:=
   TAppearanceListViewItem(lista.Selected).Objects.FindObjectT<TListItemText>('Text6').Text;

  if ItemObject is TListItemImage then
  begin
     if TListItemImage(ItemObject).Name='Image19' then
     begin
       edtRecebimentoProduto.Text := vProdutoRecebimento;
       edtRecebimentoQtd.Text     := vQtdeRecebimento;
       edtObseRecebimento.Text    :='';
       layItemRecebido.Visible :=true;
     end;
  end;
end;

procedure TfrmCadPedidos.Filtro;
var
 vDataDe,vDataAte:string;
begin
 vDataDe  := FormatDateTime('yyyy-mm-dd',edtDataInicio.Date).QuotedString;
 vDataAte := FormatDateTime('yyyy-mm-dd',edtDataFim.Date).QuotedString;
 vFiltro  :=' AND datapedido between '+vDataDe+' and '+vDataAte;
 if edtNomeFiltro.Text.Length>0 then
   vFiltro   := ' AND A.IDENTIFICADOR LIKE '+QuotedStr('%'+edtNomeFiltro.Text+'%');
 if cbxStatusF.ItemIndex>-1 then
 begin
   case cbxStatusF.ItemIndex of
    0:  vFiltro:=vFiltro+'';
    1:  vFiltro   := vFiltro+ ' AND A.CANCELADO =1';
    2:  vFiltro   := vFiltro+ ' AND A.STATUS =1';
    3:  vFiltro   := vFiltro+ ' AND A.STATUS =2';
    4:  vFiltro   := vFiltro+ ' AND A.STATUS =3';
    5:  vFiltro   := vFiltro+ ' AND A.STATUS =4';
    6:  vFiltro   := vFiltro+ ' AND A.STATUS =5';
    7:  vFiltro   := vFiltro+ ' AND A.STATUS =6';
    8:  vFiltro   := vFiltro+ ' AND A.STATUS =7';
    9:  vFiltro   := vFiltro+ ' AND A.STATUS =8';
    10: vFiltro   := vFiltro+ ' AND A.STATUS =9';
   end;
 end;
 if edtCentroCustoF.Text.Length>0 then
  vFiltro   := vFiltro+ ' AND A.idcentrocusto ='+vIdCentroCusto;

 if edtSolicitanteF.Text.Length>0 then
  vFiltro   := vFiltro+ ' AND u.nome like '+QuotedStr('%'+edtSolicitante.Text+'%');

 dbCtx.AbrePedidos(vFiltro);
 GeraLista;
end;

procedure TfrmCadPedidos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  vButonSelect:=0
end;

procedure TfrmCadPedidos.FormCreate(Sender: TObject);
begin
 laySync.visible             := false;
 tbPrincipal.TabPosition     := TTabPosition.None;
 tbPrincipal.ActiveTab       := tbiLista;
 layNovoOrcamento.Visible    := false;
 layRecebimento.Visible      := false;
 layItem.Visible             := false;
 layStatusPedidoADD.Visible  := false;
 layServico.Visible          := false;
 cbxStatusF.ItemIndex        :=0;
end;

procedure TfrmCadPedidos.FormKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
var
 Arquivo  :string;
begin
  if (key = vk_f5) and (tbPrincipal.TabIndex=0) then
  begin
   TThread.CreateAnonymousThread(
   procedure
   begin
     qryFornesedorSelect.Close;
     qryFornesedorSelect.Open;
     TThread.Synchronize(nil,procedure
     begin
      dbCtx.AtualizaSequencias;
      Arquivo := ExtractFilePath(ParamStr(0))+'Replicador.exe';
      if not FileExists(Arquivo) then
       begin
         ShowMessage('Arquivo Replicador.exe não localizado no seguinte diretorio:'+#13+
         Arquivo);
         Exit;
       end
       else
        ShellExecute(GetDesktopWindow,'open',pchar(Arquivo),nil,nil,sw_show);
     end);
   end).Start;
  end;
end;

procedure TfrmCadPedidos.FormShow(Sender: TObject);
begin
  layItemRecebido.Visible := false;
  layItemOrcamento.Visible :=FALSE;
  qryFornesedorSelect.Close;
  qryFornesedorSelect.Open;
  btnAdd.Enabled       :=true;
  btnEditar.Enabled    :=true;
  listaPedidos.Visible := true;
  dbCtx.AtualizaSequencias;
  Filtro;
end;

procedure TfrmCadPedidos.GeraCompartivo(vIPedido: string);
var
 vRow,i,x:integer;
begin
   dbCtx.AbreItemPedidosComparativo(vIPedido);
   dbCtx.AbrirFornecedoresOrcamento(vIdPedido);
   dbCtx.TOrcamentoFornecedores.First;
   x :=8;
   gridComparativo.Columns[8].Header    :='';
   gridComparativo.Columns[8].Tag       :=0;
   gridComparativo.Columns[8].TagString :='';

   gridComparativo.Columns[9].Header    :='';
   gridComparativo.Columns[9].Tag       :=0;
   gridComparativo.Columns[9].TagString :='';

   gridComparativo.Columns[10].Header    :='';
   gridComparativo.Columns[10].Tag       :=0;
   gridComparativo.Columns[10].TagString :='';

   gridComparativo.Columns[11].Header    :='';
   gridComparativo.Columns[11].Tag       :=0;
   gridComparativo.Columns[11].TagString :='';

   gridComparativo.Columns[12].Header    :='';
   gridComparativo.Columns[12].Tag       :=0;
   gridComparativo.Columns[12].TagString :='';

   while not dbCtx.TOrcamentoFornecedores.eof do
   begin
     gridComparativo.Columns[X].Header    := dbCtx.TOrcamentoFornecedoresnome.AsString+
      '-TOTAL:'+FormatFloat('R$####,##0.00',dbCtx.TOrcamentoFornecedoresvalortotal.AsFloat);
     gridComparativo.Columns[X].Tag       := dbCtx.TOrcamentoFornecedoresid.AsInteger;
     gridComparativo.Columns[X].TagString := dbCtx.TOrcamentoFornecedoresidorcamento.AsString;
     INC(X);
     dbCtx.TOrcamentoFornecedores.Next;
   end;
   dbCtx.TItensPedido.First;
   gridComparativo.RowCount :=0;
   while not dbCtx.TItensOrcamentoComp.Eof do
   begin
     vRow := gridComparativo.RowCount+1;
     gridComparativo.RowCount := vRow;
     gridComparativo.Cells[0,vRow-1]:= dbCtx.TItensOrcamentoCompiditem.AsString;
     gridComparativo.Cells[1,vRow-1]:= dbCtx.TItensOrcamentoCompItem.AsString;
     gridComparativo.Cells[2,vRow-1]:= dbCtx.TItensOrcamentoCompquantidade.AsString;
     gridComparativo.Cells[3,vRow-1]:= dbCtx.TItensOrcamentoCompunidademedida.AsString;
     gridComparativo.Cells[4,vRow-1]:= dbCtx.TItensOrcamentoCompcodigofabricante.AsString;
     gridComparativo.Cells[5,vRow-1]:= dbCtx.TItensOrcamentoCompNome.AsString;
     gridComparativo.Cells[6,vRow-1]:= dbCtx.TItensOrcamentoCompmarca.AsString;
     gridComparativo.Cells[7,vRow-1]:= dbCtx.TItensOrcamentoComporiginalstr.AsString;
     x :=8;
     for I := 0 to dbCtx.TOrcamentoFornecedores.RecordCount-1 do
     begin
      gridComparativo.Cells[x,vRow-1]:= dbCtx.RetornaValorItemOrecamento(
      gridComparativo.Cells[0,vRow-1],
      gridComparativo.Columns[x].TagString,
      intToStr(gridComparativo.Columns[x].Tag));
      inc(x);
     end;
     dbCtx.TItensOrcamentoComp.Next
   end;
end;

procedure TfrmCadPedidos.GeraLista;
var
 item   : TListViewItem;
 txt    : TListItemText;
 txtH   : TListItemPurpose;
 img    : TListItemImage;
 vsegmento,vPrioridade:string;
begin
 listaPedidos.Items.Clear;
 dbCtx.TPedidoCompra.first;
 while not dbCtx.TPedidoCompra.eof do
 begin
   if dbCtx.TPedidoCompraidsegmento.AsInteger=0 then
    vsegmento:='AGROPECUÁRIA'
   else
    vsegmento:='AGRICULTURA';
  if dbCtx.TPedidoCompraflagurgente.AsInteger=0 then
   vPrioridade:='Normal'
  else
   vPrioridade:='Urgente';

   item := listaPedidos.Items.Add;
   with frmCadPedidos do
   begin
     with item  do
     begin
       txt :=   TListItemText(Objects.FindDrawable('Text21'));
       txt.TagString := dbCtx.TPedidoCompraidentificador.AsString;
       txt.Text      := 'Prioridade:';

       txt :=   TListItemText(Objects.FindDrawable('Text22'));
       txt.TagString := dbCtx.TPedidoCompraid.AsString;
       txt.Text      := vPrioridade;

       txt :=   TListItemText(Objects.FindDrawable('Text23'));
       txt.TagString := dbCtx.TPedidoCompraidcategoria.AsString;
       txt.Text := 'Setor:';


       txt :=   TListItemText(Objects.FindDrawable('Text24'));
       txt.TagString := dbCtx.TPedidoComprastatus.AsString;
       txt.Text := dbCtx.TPedidoComprasetor.AsString;;

       img := TListItemImage(Objects.FindDrawable('Image40'));
       img.Visible := true;
       img.Bitmap  := frmPrincipal.imgListaItem.Bitmap;

       txt :=   TListItemText(Objects.FindDrawable('Text43'));
       txt.Text := 'Itens';
       txt.TagString := dbCtx.TPedidoCompraidpropriedade.AsString;

       img := TListItemImage(Objects.FindDrawable('Image41'));
       img.Visible := true;
       img.Bitmap  := frmPrincipal.imgListaHist.Bitmap;
       txt :=   TListItemText(Objects.FindDrawable('Text44'));
       txt.Text := 'Histórico';

       img := TListItemImage(Objects.FindDrawable('Image42'));
       img.Visible := true;
       img.Bitmap  := frmPrincipal.imgListaRel.Bitmap;
       txt :=   TListItemText(Objects.FindDrawable('Text45'));
       txt.Text := 'Relatório';
       if dbCtx.vTipoBDConfig=0 then
       begin
        img := TListItemImage(Objects.FindDrawable('Image50'));
        img.Visible := true;
        img.Bitmap  := frmPrincipal.imgListaOrcamentos.Bitmap;
        txt :=   TListItemText(Objects.FindDrawable('Text51'));
        txt.Text := 'Cotaçoes';
       end;

       if vButonSelect=1 then
       begin
        img := TListItemImage(Objects.FindDrawable('Image46'));
        img.Visible := true;
        img.Bitmap  := imgSelect.Bitmap;
        txt :=   TListItemText(Objects.FindDrawable('Text47'));
        txt.Text := 'Selecionar';
       end;

       txt :=   TListItemText(Objects.FindDrawable('Text1'));
       txt.Text := 'Identificador:';
       txt :=   TListItemText(Objects.FindDrawable('Text2'));
       txt.Text :=dbCtx.TPedidoCompraidentificador.AsString;


       txt :=   TListItemText(Objects.FindDrawable('Text3'));
       txt.Text := 'Data:';
       txt :=   TListItemText(Objects.FindDrawable('Text4'));
       txt.Text :=dbCtx.TPedidoCompradatapedido.AsString;


       txt :=   TListItemText(Objects.FindDrawable('Text5'));
       txt.Text := 'Segmento:';
       txt :=   TListItemText(Objects.FindDrawable('Text6'));
       txt.Text :=vsegmento;

       txt :=   TListItemText(Objects.FindDrawable('Text7'));
       txt.Text := 'Categoria:';
       txt :=   TListItemText(Objects.FindDrawable('Text8'));
       txt.Text :=dbCtx.TPedidoCompracategoria.AsString;

       txt :=   TListItemText(Objects.FindDrawable('Text9'));
       txt.Text := 'Solicitante:';
       txt :=   TListItemText(Objects.FindDrawable('Text10'));
       txt.Text :=dbCtx.TPedidoComprasolicitante.AsString;

       txt :=   TListItemText(Objects.FindDrawable('Text25'));
       txt.Text := 'Centro de Custo:';
       txt :=   TListItemText(Objects.FindDrawable('Text26'));
       txt.Text :=dbCtx.TPedidoCompracentrocusto.AsString;

       if dbCtx.TPedidoCompraidcategoria.AsInteger>0 then
       begin
         if dbCtx.TPedidoCompramaquinaveiculo.AsString.Length>0 then
         begin
           txt :=   TListItemText(Objects.FindDrawable('Text11'));
           txt.Text := 'Máquina/Veículo:';
           txt :=   TListItemText(Objects.FindDrawable('Text12'));
           txt.Text :=dbCtx.TPedidoCompramaquinaveiculo.AsString;
         end;
         if dbCtx.TPedidoCompratiposervico.AsString.Length>0 then
         begin
           txt :=   TListItemText(Objects.FindDrawable('Text11'));
           txt.Text := 'Serviço:';
           txt :=   TListItemText(Objects.FindDrawable('Text12'));
           txt.Text :=dbCtx.TPedidoCompratiposervico.AsString;
         end;
       end;
       img := TListItemImage(Objects.FindDrawable('Image48'));//Recebimento
       img.Bitmap     := nil;


       txt :=   TListItemText(Objects.FindDrawable('Text13'));
       txt.Text := 'Status:';
       case dbCtx.TPedidoCompramaxidstatus.AsInteger of
          7,8:begin
           img := TListItemImage(Objects.FindDrawable('Image27'));//1
           img.ScalingMode := TImageScalingMode.Stretch;
           img.Bitmap := imgStatusIni.Bitmap;

           img := TListItemImage(Objects.FindDrawable('Image34'));//2
           img.ScalingMode := TImageScalingMode.Stretch;
           img.Bitmap      := imgProximoStatus.Bitmap;

           img := TListItemImage(Objects.FindDrawable('Image28'));//3
           img.ScalingMode := TImageScalingMode.Stretch;
           img.Bitmap := imgStatusIni.Bitmap;

           img := TListItemImage(Objects.FindDrawable('Image35'));//4
           img.ScalingMode := TImageScalingMode.Stretch;
           img.Bitmap      := imgProximoStatus.Bitmap;

           img := TListItemImage(Objects.FindDrawable('Image29'));//5
           img.ScalingMode := TImageScalingMode.Stretch;
           img.Bitmap := imgStatusIni.Bitmap;

           img := TListItemImage(Objects.FindDrawable('Image36'));//6
           img.ScalingMode := TImageScalingMode.Stretch;
           img.Bitmap      := imgProximoStatus.Bitmap;

           img := TListItemImage(Objects.FindDrawable('Image30'));//7
           img.ScalingMode := TImageScalingMode.Stretch;
           img.Bitmap      := imgStatusIni.Bitmap;

           img := TListItemImage(Objects.FindDrawable('Image37'));//8
           img.ScalingMode := TImageScalingMode.Stretch;
           img.Bitmap      := imgProximoStatus.Bitmap;

           img := TListItemImage(Objects.FindDrawable('Image31'));//9
           img.ScalingMode := TImageScalingMode.Stretch;
           img.Bitmap      := imgStatusIni.Bitmap;

           img := TListItemImage(Objects.FindDrawable('Image38'));//10
           img.ScalingMode := TImageScalingMode.Stretch;
           img.Bitmap      := imgProximoStatus.Bitmap;

           img := TListItemImage(Objects.FindDrawable('Image32'));//11
           img.ScalingMode := TImageScalingMode.Stretch;
           img.Bitmap      := imgStatusIni.Bitmap;

           img := TListItemImage(Objects.FindDrawable('Image39'));//12
           img.ScalingMode := TImageScalingMode.Stretch;
           img.Bitmap      := imgProximoStatus.Bitmap;

           img := TListItemImage(Objects.FindDrawable('Image33'));//13
           img.ScalingMode := TImageScalingMode.Stretch;
           img.Bitmap      := imgStatusIni.Bitmap;

           if dbCtx.TPedidoCompramaxidstatus.AsInteger=7 then              //14
           begin
            txt :=   TListItemText(Objects.FindDrawable('Text20'));
            txt.Text := 'Finalizado';
           end;

           if dbCtx.TPedidoCompramaxidstatus.AsInteger=8 then
           begin
            txt :=   TListItemText(Objects.FindDrawable('Text20'));
            txt.Text := 'Finalizado Parcial';
           end;

           txt :=   TListItemText(Objects.FindDrawable('Text19'));
           txt.Text := 'Recebido na Propriedade';

           txt :=   TListItemText(Objects.FindDrawable('Text18'));
           txt.Text := 'Transporte Finalizado';

           txt :=   TListItemText(Objects.FindDrawable('Text17'));
           txt.Text := 'Cotacao Aprovada';

           txt :=   TListItemText(Objects.FindDrawable('Text16'));
           txt.Text := 'Enviado para Compra';

           txt :=   TListItemText(Objects.FindDrawable('Text15'));
           txt.Text := 'Aprovado Diretoria';

           txt :=   TListItemText(Objects.FindDrawable('Text14'));
           txt.Text := 'Aprovado Pelo Supervisor';
           if dbCtx.vTipoBDConfig>0 then
           begin
            img := TListItemImage(Objects.FindDrawable('Image48'));//Recebimento
            img.ScalingMode := TImageScalingMode.Stretch;
            img.Bitmap      := frmPrincipal.imgListaReceber.Bitmap;
            img.Visible     := true;
           end;

          end;
          6:begin
           img := TListItemImage(Objects.FindDrawable('Image32'));//1
           img.ScalingMode := TImageScalingMode.Stretch;
           img.Bitmap := imgStatusIni.Bitmap;

           img := TListItemImage(Objects.FindDrawable('Image38'));//2
           img.ScalingMode := TImageScalingMode.Stretch;
           img.Bitmap      := imgProximoStatus.Bitmap;

           img := TListItemImage(Objects.FindDrawable('Image31'));//2
           img.ScalingMode := TImageScalingMode.Stretch;
           img.Bitmap := imgStatusIni.Bitmap;

           img := TListItemImage(Objects.FindDrawable('Image37'));//3
           img.ScalingMode := TImageScalingMode.Stretch;
           img.Bitmap      := imgProximoStatus.Bitmap;

           img := TListItemImage(Objects.FindDrawable('Image30'));//3
           img.ScalingMode := TImageScalingMode.Stretch;
           img.Bitmap := imgStatusIni.Bitmap;

           img := TListItemImage(Objects.FindDrawable('Image36'));//4
           img.ScalingMode := TImageScalingMode.Stretch;
           img.Bitmap      := imgProximoStatus.Bitmap;

           img := TListItemImage(Objects.FindDrawable('Image29'));//4
           img.ScalingMode := TImageScalingMode.Stretch;
           img.Bitmap      := imgStatusIni.Bitmap;

           img := TListItemImage(Objects.FindDrawable('Image35'));//5
           img.ScalingMode := TImageScalingMode.Stretch;
           img.Bitmap      := imgProximoStatus.Bitmap;

           img := TListItemImage(Objects.FindDrawable('Image28'));//5
           img.ScalingMode := TImageScalingMode.Stretch;
           img.Bitmap      := imgStatusIni.Bitmap;

           img := TListItemImage(Objects.FindDrawable('Image34'));//6
           img.ScalingMode := TImageScalingMode.Stretch;
           img.Bitmap      := imgProximoStatus.Bitmap;
           if dbCtx.vTipoBDConfig>0 then
           begin
            img := TListItemImage(Objects.FindDrawable('Image48'));//Recebimento
            img.ScalingMode := TImageScalingMode.Stretch;
            img.Bitmap      := frmPrincipal.imgListaReceber.Bitmap;
            img.Visible     := true;
            txt :=   TListItemText(Objects.FindDrawable('Text49'));
            txt.Text := 'Realizar Recebido';
           end;

           //******
           img := TListItemImage(Objects.FindDrawable('Image27'));
           img.ScalingMode := TImageScalingMode.Stretch;
           img.Bitmap := imgStatusIni.Bitmap;

           txt :=   TListItemText(Objects.FindDrawable('Text19'));
           txt.Text := 'Recebido na Propriedade';

           txt :=   TListItemText(Objects.FindDrawable('Text18'));
           txt.Text := 'Transporte Finalizado';

           txt :=   TListItemText(Objects.FindDrawable('Text17'));
           txt.Text := 'Cotacao Aprovada';

           txt :=   TListItemText(Objects.FindDrawable('Text16'));
           txt.Text := 'Enviado para Compra';

           txt :=   TListItemText(Objects.FindDrawable('Text15'));
           txt.Text := 'Aprovado Diretoria';

           txt :=   TListItemText(Objects.FindDrawable('Text14'));
           txt.Text := 'Aprovado Pelo Supervisor';

          end;
          5:begin
           img := TListItemImage(Objects.FindDrawable('Image31'));//1
           img.ScalingMode := TImageScalingMode.Stretch;
           img.Bitmap := imgStatusIni.Bitmap;

           img := TListItemImage(Objects.FindDrawable('Image37'));//2
           img.ScalingMode := TImageScalingMode.Stretch;
           img.Bitmap      := imgProximoStatus.Bitmap;

           img := TListItemImage(Objects.FindDrawable('Image30'));//2
           img.ScalingMode := TImageScalingMode.Stretch;
           img.Bitmap := imgStatusIni.Bitmap;

           img := TListItemImage(Objects.FindDrawable('Image36'));//3
           img.ScalingMode := TImageScalingMode.Stretch;
           img.Bitmap      := imgProximoStatus.Bitmap;

           img := TListItemImage(Objects.FindDrawable('Image29'));//3
           img.ScalingMode := TImageScalingMode.Stretch;
           img.Bitmap := imgStatusIni.Bitmap;

           img := TListItemImage(Objects.FindDrawable('Image35'));//4
           img.ScalingMode := TImageScalingMode.Stretch;
           img.Bitmap      := imgProximoStatus.Bitmap;

           img := TListItemImage(Objects.FindDrawable('Image28'));//4
           img.ScalingMode := TImageScalingMode.Stretch;
           img.Bitmap      := imgStatusIni.Bitmap;

           img := TListItemImage(Objects.FindDrawable('Image34'));//5
           img.ScalingMode := TImageScalingMode.Stretch;
           img.Bitmap      := imgProximoStatus.Bitmap;

           img := TListItemImage(Objects.FindDrawable('Image27'));//1
           img.ScalingMode := TImageScalingMode.Stretch;
           img.Bitmap := imgStatusIni.Bitmap;

           img := TListItemImage(Objects.FindDrawable('Image48'));//Recebimento
           img.ScalingMode := TImageScalingMode.Stretch;
           img.Bitmap     := nil;

           //******
           if dbCtx.TPedidoCompracancelado.AsInteger=0 then
           begin
             img := TListItemImage(Objects.FindDrawable('Image31'));
             img.ScalingMode := TImageScalingMode.Stretch;
             img.Bitmap := imgStatusIni.Bitmap;

             txt :=   TListItemText(Objects.FindDrawable('Text18'));
             txt.Text := 'Em Transporte';
           end
           else
           begin
             begin
             img := TListItemImage(Objects.FindDrawable('Image31'));
             img.ScalingMode := TImageScalingMode.Stretch;
             img.Bitmap := imgCancelada.Bitmap;

             txt :=   TListItemText(Objects.FindDrawable('Text18'));
             txt.Text := 'Cancelado no Transporte';
             end;
           end;

           img := TListItemImage(Objects.FindDrawable('Image27'));//1
           img.ScalingMode := TImageScalingMode.Stretch;
           img.Bitmap := imgStatusIni.Bitmap;

           txt :=   TListItemText(Objects.FindDrawable('Text17'));
           txt.Text := 'Cotacao Aprovada';

           txt :=   TListItemText(Objects.FindDrawable('Text16'));
           txt.Text := 'Enviado para Compra';

           txt :=   TListItemText(Objects.FindDrawable('Text15'));
           txt.Text := 'Aprovado Diretoria';

           txt :=   TListItemText(Objects.FindDrawable('Text14'));
           txt.Text := 'Aprovado Pelo Supervisor';

          end;
          4:begin

           img := TListItemImage(Objects.FindDrawable('Image48'));//Recebimento
           img.ScalingMode := TImageScalingMode.Stretch;
           img.Bitmap      := nil;
           img.Visible     := false;

           img := TListItemImage(Objects.FindDrawable('Image30'));//1
           img.ScalingMode := TImageScalingMode.Stretch;
           img.Bitmap := imgStatusIni.Bitmap;

           img := TListItemImage(Objects.FindDrawable('Image36'));//2
           img.ScalingMode := TImageScalingMode.Stretch;
           img.Bitmap      := imgProximoStatus.Bitmap;

           img := TListItemImage(Objects.FindDrawable('Image29'));//2
           img.ScalingMode := TImageScalingMode.Stretch;
           img.Bitmap := imgStatusIni.Bitmap;

           img := TListItemImage(Objects.FindDrawable('Image35'));//3
           img.ScalingMode := TImageScalingMode.Stretch;
           img.Bitmap      := imgProximoStatus.Bitmap;

           img := TListItemImage(Objects.FindDrawable('Image28'));//3
           img.ScalingMode := TImageScalingMode.Stretch;
           img.Bitmap := imgStatusIni.Bitmap;

           img := TListItemImage(Objects.FindDrawable('Image34'));//4
           img.ScalingMode := TImageScalingMode.Stretch;
           img.Bitmap      := imgProximoStatus.Bitmap;

           img := TListItemImage(Objects.FindDrawable('Image27'));//1
           img.ScalingMode := TImageScalingMode.Stretch;
           img.Bitmap := imgStatusIni.Bitmap;
           //******
           if dbCtx.TPedidoCompracancelado.AsInteger=0 then
           begin
             img := TListItemImage(Objects.FindDrawable('Image30'));
             img.ScalingMode := TImageScalingMode.Stretch;
             img.Bitmap := imgStatusIni.Bitmap;

             txt :=   TListItemText(Objects.FindDrawable('Text17'));
             txt.Text := 'Em Cotacao';
           end
           else
           begin
             begin
             img := TListItemImage(Objects.FindDrawable('Image30'));
             img.ScalingMode := TImageScalingMode.Stretch;
             img.Bitmap := imgCancelada.Bitmap;

             txt :=   TListItemText(Objects.FindDrawable('Text17'));
             txt.Text := 'Cancelado na Cotacao';
             end;
           end;
           txt :=   TListItemText(Objects.FindDrawable('Text16'));
           txt.Text := 'Enviado para Compra';

           txt :=   TListItemText(Objects.FindDrawable('Text15'));
           txt.Text := 'Aprovado Diretoria';

           txt :=   TListItemText(Objects.FindDrawable('Text14'));
           txt.Text := 'Aprovado Pelo Supervisor';

          end;
          3:begin

           img := TListItemImage(Objects.FindDrawable('Image48'));//Recebimento
           img.ScalingMode := TImageScalingMode.Stretch;
           img.Bitmap      := frmPrincipal.imgListaReceber.Bitmap;
           img.Visible     := false;

           img := TListItemImage(Objects.FindDrawable('Image29'));//1
           img.ScalingMode := TImageScalingMode.Stretch;
           img.Bitmap := imgStatusIni.Bitmap;

           img := TListItemImage(Objects.FindDrawable('Image35'));//2
           img.ScalingMode := TImageScalingMode.Stretch;
           img.Bitmap      := imgProximoStatus.Bitmap;

           img := TListItemImage(Objects.FindDrawable('Image28'));//2
           img.ScalingMode := TImageScalingMode.Stretch;
           img.Bitmap := imgStatusIni.Bitmap;

           img := TListItemImage(Objects.FindDrawable('Image34'));//3
           img.ScalingMode := TImageScalingMode.Stretch;
           img.Bitmap      := imgProximoStatus.Bitmap;

           img := TListItemImage(Objects.FindDrawable('Image27'));//1
           img.ScalingMode := TImageScalingMode.Stretch;
           img.Bitmap := imgStatusIni.Bitmap;

           //****
           if dbCtx.TPedidoCompracancelado.AsInteger=0 then
           begin
             img := TListItemImage(Objects.FindDrawable('Image29'));//2
             img.ScalingMode := TImageScalingMode.Stretch;
             img.Bitmap := imgStatusIni.Bitmap;

             txt :=   TListItemText(Objects.FindDrawable('Text16'));
             txt.Text := 'Enviado para Compra';
           end
           else
           begin
             begin
             img := TListItemImage(Objects.FindDrawable('Image29'));//2
             img.ScalingMode := TImageScalingMode.Stretch;
             img.Bitmap := imgCancelada.Bitmap;

             txt :=   TListItemText(Objects.FindDrawable('Text16'));
             txt.Text := 'Cancelado Diretoria';
             end;
           end;

           txt :=   TListItemText(Objects.FindDrawable('Text15'));
           txt.Text := 'Aprovado Diretoria';

           txt :=   TListItemText(Objects.FindDrawable('Text14'));
           txt.Text := 'Aprovado Pelo Supervisor';

          end;
          2:begin
           img := TListItemImage(Objects.FindDrawable('Image48'));//Recebimento
           img.ScalingMode := TImageScalingMode.Stretch;
           img.Bitmap      := frmPrincipal.imgListaReceber.Bitmap;
           img.Visible     := false;

           img := TListItemImage(Objects.FindDrawable('Image28'));//1
           img.ScalingMode := TImageScalingMode.Stretch;
           img.Bitmap := imgStatusIni.Bitmap;

           img := TListItemImage(Objects.FindDrawable('Image34'));//2
           img.ScalingMode := TImageScalingMode.Stretch;
           img.Bitmap      := imgProximoStatus.Bitmap;

           img := TListItemImage(Objects.FindDrawable('Image27'));//1
           img.ScalingMode := TImageScalingMode.Stretch;
           img.Bitmap := imgStatusIni.Bitmap;

           if dbCtx.TPedidoCompracancelado.AsInteger=0 then
           begin
             img := TListItemImage(Objects.FindDrawable('Image28'));//2
             img.ScalingMode := TImageScalingMode.Stretch;
             img.Bitmap := imgStatusIni.Bitmap;

             txt :=   TListItemText(Objects.FindDrawable('Text15'));
             txt.Text := 'Aguardando Aprovacao Diretoria';
           end
           else
           begin
             begin
             img := TListItemImage(Objects.FindDrawable('Image28'));//2
             img.ScalingMode := TImageScalingMode.Stretch;
             img.Bitmap := imgCancelada.Bitmap;

             txt :=   TListItemText(Objects.FindDrawable('Text15'));
             txt.Text := 'Cancelado Diretoria';
             end;
           end;
           txt :=   TListItemText(Objects.FindDrawable('Text14'));
           txt.Text := 'Aprovado Pelo Supervisor';
          end;
          1:begin
           img := TListItemImage(Objects.FindDrawable('Image48'));//Recebimento
           img.Bitmap      := nil;
           img.Visible     := false;

           img := TListItemImage(Objects.FindDrawable('Image27'));//1
           img.ScalingMode := TImageScalingMode.Stretch;
           img.Bitmap := imgStatusIni.Bitmap;

           txt :=   TListItemText(Objects.FindDrawable('Text14'));
           txt.Text := 'Aguardando aprovação Supervisor';
          end;
       end;
     end;
   end;
   dbCtx.TPedidoCompra.Next;
 end;
 lblTotalPedidos.Text :='Total Pedidos: '+intToStr(listaPedidos.Items.Count);
end;

procedure TfrmCadPedidos.GeraListaRecebimento;
var
 item   : TListViewItem;
 txt    : TListItemText;
 txtH   : TListItemPurpose;
 img    : TListItemImage;
 vsegmento,vPrioridade:string;
begin
  lista.Items.Clear;
  dbCtx.AbreItemsOrcamentos(dbCtx.TOrcamentoid.AsString);
  dbCtx.TItensOrcamento.First;
  item := lista.Items.Add;
  while not dbCtx.TItensOrcamento.eof do
  begin
     with item  do
     begin
       img := TListItemImage(Objects.FindDrawable('Image9'));
       img.ScalingMode := TImageScalingMode.Stretch;
       img.Bitmap      := FrmPrincipal.imgProduto.Bitmap;

       txt :=   TListItemText(Objects.FindDrawable('Text1'));
       txt.TagString := dbCtx.TItensOrcamentoid.AsString;
       txt.Text      := 'Produto:';

       txt :=   TListItemText(Objects.FindDrawable('Text2'));
       txt.Text      := dbCtx.TItensOrcamentonomeproduto.AsString;

       txt :=   TListItemText(Objects.FindDrawable('Text3'));
       txt.Text      := 'Cod. Fabricante:';
       txt :=   TListItemText(Objects.FindDrawable('Text4'));
       txt.Text      := dbCtx.TItensOrcamentonomeproduto.AsString;

       txt :=   TListItemText(Objects.FindDrawable('Text5'));
       txt.Text      := 'Qtde. Itens:';
       txt :=   TListItemText(Objects.FindDrawable('Text6'));
       txt.Text      := dbCtx.TItensOrcamentoqtde.AsString;

       if dbCtx.TItensOrcamento.FieldByName('recebido').AsInteger=0 then
       begin
        img := TListItemImage(Objects.FindDrawable('Image19'));
        img.Bitmap     := nil;
        img := TListItemImage(Objects.FindDrawable('Image19'));
        img.Bitmap    := frmPrincipal.imgChk.Bitmap;
        txt           := TListItemText(Objects.FindDrawable('Text18'));
        txt.text      := 'Confirmar';

        img := TListItemImage(Objects.FindDrawable('Image12'));
        img.Bitmap    := frmPrincipal.imgEdit.Bitmap;
        txt           := TListItemText(Objects.FindDrawable('Text13'));
        txt.text      := 'Editar';
       end;
       if dbCtx.TItensOrcamento.FieldByName('recebido').AsInteger=1 then
       begin
        img := TListItemImage(Objects.FindDrawable('Image19'));
        img.Bitmap     := frmPrincipal.imgConfirmado.Bitmap;

        img := TListItemImage(Objects.FindDrawable('Image19'));
        img.Bitmap    := frmPrincipal.imgConfirmar.Bitmap;

        txt           := TListItemText(Objects.FindDrawable('Text18'));
        txt.text      := 'Confirmado';

       end;

     end;
     dbCtx.TItensOrcamento.Next;
  end;
end;

procedure TfrmCadPedidos.GeraNovosOrcamentosAprovados(vIdPedido: string);
var
 vQry,vQry1:TFDQuery;
 vIdOrcamento:string;
 I:integer;
begin
  vQry := TFDQuery.Create(nil);
  vQry.Connection := dbCtx.FDConPG;
  vQry1 := TFDQuery.Create(nil);
  vQry1.Connection := dbCtx.FDConPG;
  with vQry,vQry.SQL do
  begin
    Clear;
    Add('select distinct b.idfornecedor,b.frete,b.desconto,idformapagamento,');
    Add('datacompra,responsavelcompra,dataprevitaentrega');
    Add('from orcamentositens a');
    Add('join orcamentos b on idorcamento=b.id');
    Add('where a.status=3 and b.idpedido='+vIdPedido);
    Open;
    while not vQry.eof do
    begin
      dbCtx.TOrcamento.Close;
      dbCtx.TOrcamento.Open;
      dbCtx.TOrcamento.Insert;
      dbCtx.TOrcamentoidusuario.AsString         := dbCtx.vIdUsuarioLogado;
      dbCtx.TOrcamentoidfornecedor.AsString      := vQry.FieldByName('idfornecedor').AsString;
      dbCtx.TOrcamentoidpedido.AsString          := vIdPedido;
      dbCtx.TOrcamentodesconto.AsString          := vQry.FieldByName('desconto').AsString;
      dbCtx.TOrcamentofrete.AsString             := vQry.FieldByName('frete').AsString;
      dbCtx.TOrcamentoresponsavelcompra.AsString := dbCtx.vNomeUsuarioLogado;
      dbCtx.TOrcamentodatacompra.AsDateTime      := date;
      if vQry.FieldByName('idformapagamento').AsString.Length>0 then
       dbCtx.TOrcamentoidformapagamento.AsString := vQry.FieldByName('idformapagamento').AsString;
      if vQry.FieldByName('datacompra').AsString.Length>0 then
       dbCtx.TOrcamentodatacompra.AsString         := vQry.FieldByName('datacompra').AsString;
      if vQry.FieldByName('dataprevitaentrega').AsString.Length>0 then
       dbCtx.TOrcamentodataprevitaentrega.AsString := vQry.FieldByName('dataprevitaentrega').AsString;
      if vQry.FieldByName('responsavelcompra').AsString.Length>0 then
       dbCtx.TOrcamentoresponsavelcompra.AsString  := vQry.FieldByName('responsavelcompra').AsString;
      dbCtx.TOrcamentostatus.AsInteger       := 3;
      if dbCtx.vTipoBDConfig=2 then
       dbCtx.TOrcamentosyncFaz.AsInteger :=1
      else
       dbCtx.TOrcamentosyncFaz.AsInteger :=0;
        dbCtx.TOrcamento.ApplyUpdates(-1);
        vIdOrcamento := dbCtx.RetornaMaxIdPedido;
        with vQry1,vQry1.SQL do
        begin
          Clear;
          Add('select * from orcamentositens a');
          Add('join orcamentos b on idorcamento=b.id');
          Add('where a.status=3 and b.idfornecedor='+vQry.FieldByName('idfornecedor').AsString);
          Add('and b.idpedido='+vIdPedido);
          Open;
          while not vQry1.Eof do
          begin
            dbCtx.TItensOrcamentoInsert.Close;
            dbCtx.TItensOrcamentoInsert.Open;
            dbCtx.TItensOrcamentoInsert.Insert;
            dbCtx.TItensOrcamentoInsertidusuario.AsString            := dbCtx.vIdUsuarioLogado;
            dbCtx.TItensOrcamentoInsertidorcamento.AsString          := vIdOrcamento;
            dbCtx.TItensOrcamentoInsertidproduto.AsString            := vQry1.FieldByName('idproduto').AsString;
            dbCtx.TItensOrcamentoInsertqtde.AsString                 := vQry1.FieldByName('qtde').AsString;
            dbCtx.TItensOrcamentoInsertvalorunidade.AsString         := vQry1.FieldByName('valorunidade').AsString;
            dbCtx.TItensOrcamentoInsertvalortotal.AsString           := vQry1.FieldByName('valortotal').AsString;
            dbCtx.TItensOrcamentoInsertdesconto.AsString             := vQry1.FieldByName('descontorateio').AsString;
            dbCtx.TItensOrcamentoInsertipi.AsString                  := vQry1.FieldByName('ipi').AsString;
            dbCtx.TItensOrcamentoInsertfrete.AsString                := vQry1.FieldByName('freterateio').AsString;
            dbCtx.TItensOrcamentoInserticmst.AsString                := vQry1.FieldByName('icmst').AsString;
            dbCtx.TItensOrcamentoInsertobservacao.AsString           := vQry1.FieldByName('observacao').AsString;
            dbCtx.TItensOrcamentoInsertdiferencialalicota.AsString   := vQry1.FieldByName('diferencialalicota').AsString;
            dbCtx.TItensOrcamentoInsertunidademedida.AsString        := vQry1.FieldByName('unidademedida').AsString;
            dbCtx.TItensOrcamentoInsertsyncFaz.AsInteger :=0;
            dbCtx.TItensOrcamentoInsert.ApplyUpdates(-1);
            vQry1.Next;
          end;
        end;
       vQry.Next;
    end;
    InsreStatus(vIdPedido,'5');
    MyShowMessage('Novos Orçamentos Gerado com sucesso!',false);
    dbCtx.AbreOrcamentos(vIdPedido,'');
  end;
  vQry.Free;
  vQry1.Free;
end;

procedure TfrmCadPedidos.GeraNovosOrcamentosAprovadosOrcamnto(vIdPedido,
  vIdOrcamento: string);
var
 vQry,vQry1:TFDQuery;
 I:integer;
 vIdMax:string;
begin
  vQry := TFDQuery.Create(nil);
  vQry.Connection := dbCtx.FDConPG;
  vQry1 := TFDQuery.Create(nil);
  vQry1.Connection := dbCtx.FDConPG;
  with vQry,vQry.SQL do
  begin
    Clear;
    Add('select * from orcamentos');
    Add('where id='+vIdOrcamento);
    Open;
    while not vQry.eof do
    begin
      dbCtx.TOrcamento.Close;
      dbCtx.TOrcamento.Open;
      dbCtx.TOrcamento.Insert;
      dbCtx.TOrcamentoidusuario.AsString         := dbCtx.vIdUsuarioLogado;
      dbCtx.TOrcamentoidfornecedor.AsString      := vQry.FieldByName('idfornecedor').AsString;
      dbCtx.TOrcamentoidpedido.AsString          := vIdPedido;
      dbCtx.TOrcamentodesconto.AsString          := vQry.FieldByName('desconto').AsString;
      dbCtx.TOrcamentofrete.AsString             := vQry.FieldByName('frete').AsString;
      dbCtx.TOrcamentoresponsavelcompra.AsString := dbCtx.vNomeUsuarioLogado;
      dbCtx.TOrcamentodatacompra.AsDateTime      := date;
      if vQry.FieldByName('idformapagamento').AsString.Length>0 then
       dbCtx.TOrcamentoidformapagamento.AsString := vQry.FieldByName('idformapagamento').AsString;


      if vQry.FieldByName('datacompra').AsString.Length>0 then
       dbCtx.TOrcamentodatacompra.AsString         := vQry.FieldByName('datacompra').AsString;

      if vQry.FieldByName('dataprevitaentrega').AsString.Length>0 then
       dbCtx.TOrcamentodataprevitaentrega.AsString := vQry.FieldByName('dataprevitaentrega').AsString;

      if vQry.FieldByName('responsavelcompra').AsString.Length>0 then
       dbCtx.TOrcamentoresponsavelcompra.AsString  := vQry.FieldByName('responsavelcompra').AsString;

      dbCtx.TOrcamentostatus.AsInteger       := 3;

      if dbCtx.vTipoBDConfig=2 then
       dbCtx.TOrcamentosyncFaz.AsInteger :=1
      else
       dbCtx.TOrcamentosyncFaz.AsInteger :=0;


        dbCtx.TOrcamento.ApplyUpdates(-1);
        vIdMax := dbCtx.RetornaMaxIdPedido;
        with vQry1,vQry1.SQL do
        begin
          Clear;
          Add('select * from orcamentositens a');
          Add('join orcamentos b on idorcamento=b.id');
          Add('where b.id='+vIdOrcamento);
          Open;
          while not vQry1.Eof do
          begin
            dbCtx.TItensOrcamentoInsert.Close;
            dbCtx.TItensOrcamentoInsert.Open;
            dbCtx.TItensOrcamentoInsert.Insert;
            dbCtx.TItensOrcamentoInsertidusuario.AsString            := dbCtx.vIdUsuarioLogado;
            dbCtx.TItensOrcamentoInsertidorcamento.AsString          := vIdMax;
            dbCtx.TItensOrcamentoInsertidproduto.AsString            := vQry1.FieldByName('idproduto').AsString;
            dbCtx.TItensOrcamentoInsertqtde.AsString                 := vQry1.FieldByName('qtde').AsString;
            dbCtx.TItensOrcamentoInsertvalorunidade.AsString         := vQry1.FieldByName('valorunidade').AsString;
            dbCtx.TItensOrcamentoInsertvalortotal.AsString           := vQry1.FieldByName('valortotal').AsString;
            dbCtx.TItensOrcamentoInsertdesconto.AsString             := vQry1.FieldByName('descontorateio').AsString;
            dbCtx.TItensOrcamentoInsertipi.AsString                  := vQry1.FieldByName('ipi').AsString;
            dbCtx.TItensOrcamentoInsertfrete.AsString                := vQry1.FieldByName('freterateio').AsString;
            dbCtx.TItensOrcamentoInserticmst.AsString                := vQry1.FieldByName('icmst').AsString;
            dbCtx.TItensOrcamentoInsertobservacao.AsString           := vQry1.FieldByName('observacao').AsString;
            dbCtx.TItensOrcamentoInsertdiferencialalicota.AsString   := vQry1.FieldByName('diferencialalicota').AsString;
            dbCtx.TItensOrcamentoInsertunidademedida.AsString        := vQry1.FieldByName('unidademedida').AsString;
            dbCtx.TItensOrcamentoInsertsyncFaz.AsInteger :=0;
            dbCtx.TItensOrcamentoInsert.ApplyUpdates(-1);
            vQry1.Next;
          end;
        end;
       vQry.Next;
    end;
    InsreStatus(vIdPedido,'5');
    MyShowMessage('Novos Orçamentos Gerado com sucesso!',false);
    dbCtx.AbreOrcamentos(vIdPedido,'');
  end;
  vQry.Free;
  vQry1.Free;
end;

procedure TfrmCadPedidos.gridComparativoCellDblClick(const Column: TColumn;
  const Row: Integer);
var
 vRow:integer;
 vvalue,vValor,vValorTotal:string;
 vValorF,vValorTotalF:Double;
begin
  if gridComparativo.Col>5 then
  begin
    with qryAux,qryAux.SQL do
    begin
     Clear;
     Add('select * from tmpcomparativo');
     Add('where idproduto='+gridComparativo.Cells[0,gridComparativo.Row]);
     Open;
    end;
    if not qryAux.IsEmpty then
    begin
     MyShowMessage('Item ja Adicionado!',false);
     Exit;
    end;
    vvalue := gridComparativo.Cells[gridComparativo.Col,gridComparativo.Row];
    vValor := StringReplace(gridComparativo.Cells[gridComparativo.Col,gridComparativo.Row],'R$','',[rfReplaceAll]);
    vValor := trim(StringReplace(vValor,'.','',[rfReplaceAll]));
    vValorF:= StrToFloat(vValor);

    vValorTotalF := vValorF * strToFloat(gridComparativo.Cells[2,gridComparativo.Row]);



    dbCtx.tmpComparativo.Close;
    dbCtx.tmpComparativo.Open;
    dbCtx.tmpComparativo.Insert;
    dbCtx.TMPComparativoitem.AsString            := gridComparativo.Cells[1,gridComparativo.Row];
    dbCtx.TMPComparativoqtd.AsString             := gridComparativo.Cells[2,gridComparativo.Row];
    dbCtx.TMPComparativounidademedida.AsString   := gridComparativo.Cells[3,gridComparativo.Row];
    dbCtx.TMPComparativocodfabricante.AsString   := gridComparativo.Cells[4,gridComparativo.Row];
    dbCtx.TMPComparativodescricao.AsString       := gridComparativo.Cells[5,gridComparativo.Row];
    dbCtx.TMPComparativofornecedor.AsString      := gridComparativo.Columns[gridComparativo.col].Header;
    dbCtx.TMPComparativovalorunitario.AsFloat    := vValorF;
    dbCtx.TMPComparativovalortotal.AsFloat       := vValorTotalF;
    dbCtx.TMPComparativoidproduto.AsString       := gridComparativo.Cells[0,gridComparativo.Row];
    dbCtx.TMPComparativoidfornecedor.AsString    := intToStr(gridComparativo.Columns[gridComparativo.col].Tag);
    dbCtx.TMPComparativoidorcamento.AsString     := gridComparativo.Columns[gridComparativo.col].TagString;
    try
      dbCtx.tmpComparativo.ApplyUpdates(-1);
    except
     on E: Exception do
      myShowMessage('Erro ao salvar Status:'+E.Message,false);
    end;
    dbCtx.tmpComparativo.Close;
    dbCtx.tmpComparativo.Open;
    dbCtx.tmpComparativo.First;
    GridItensAprovados.RowCount :=0;
    while not dbCtx.tmpComparativo.eof do
    begin
     vRow := GridItensAprovados.RowCount+1;
     GridItensAprovados.RowCount :=vRow;
     GridItensAprovados.Cells[0,vRow-1] := dbCtx.TMPComparativoitem.AsString;
     GridItensAprovados.Cells[1,vRow-1] := dbCtx.TMPComparativoqtd.AsString ;
     GridItensAprovados.Cells[2,vRow-1] := dbCtx.TMPComparativounidademedida.AsString;
     GridItensAprovados.Cells[3,vRow-1] := dbCtx.TMPComparativocodfabricante.AsString;
     GridItensAprovados.Cells[4,vRow-1] := dbCtx.TMPComparativodescricao.AsString;
     GridItensAprovados.Cells[5,vRow-1] := dbCtx.TMPComparativofornecedor.AsString;
     GridItensAprovados.Cells[6,vRow-1] := 'R$ '+dbCtx.TMPComparativovalorunitario.AsString;
     GridItensAprovados.Cells[7,vRow-1] := 'R$ '+dbCtx.TMPComparativovalortotal.AsString;
     GridItensAprovados.Cells[8,vRow-1] := dbCtx.TMPComparativoidproduto.AsString;
     GridItensAprovados.Cells[9,vRow-1] := dbCtx.TMPComparativoidorcamento.AsString;
     dbCtx.tmpComparativo.Next;
    end;
    SomarValoresAprovados;
  end;
end;

procedure TfrmCadPedidos.GridDetalhesOrcamentoEditingDone(Sender: TObject;
  const ACol, ARow: Integer);
var
 i:integer;
 Valor,Valor1:Double;
begin
   dbCtx.AtualizaValorItemOrcamento(GridDetalhesOrcamento.Cells[5,GridDetalhesOrcamento.Row],
    GridDetalhesOrcamento.Cells[14,GridDetalhesOrcamento.Row]);

   dbCtx.AtualizaValorIten(
    GridDetalhesOrcamento.Cells[14,GridDetalhesOrcamento.Row],
    GridDetalhesOrcamento.Cells[7,GridDetalhesOrcamento.Row],
    GridDetalhesOrcamento.Cells[8,GridDetalhesOrcamento.Row],
    GridDetalhesOrcamento.Cells[9,GridDetalhesOrcamento.Row],
    GridDetalhesOrcamento.Cells[10,GridDetalhesOrcamento.Row],
    GridDetalhesOrcamento.Cells[12,GridDetalhesOrcamento.Row]);

    dbCtx.AbreItemsOrcamentos(GridDetalhesOrcamento.Cells[13,GridDetalhesOrcamento.Row]);

   dbCtx.AlteraFlaSynAWS_ZERO('orcamentositens',GridDetalhesOrcamento.Cells[14,GridDetalhesOrcamento.Row]);
//   dbCtx.TItensOrcamento.First;
//   GridDetalhesOrcamento.RowCount    := dbCtx.TItensOrcamento.RecordCount;
//   i:=0;
//   Valor  :=0;
//   Valor1 :=0;
//   while not dbCtx.TItensOrcamento.Eof do
//   begin
//     GridDetalhesOrcamento.Cells[0,i]  := dbCtx.TItensOrcamentoItem.AsString;
//     GridDetalhesOrcamento.Cells[1,i]  := dbCtx.TItensOrcamentonomeproduto.AsString;
//     GridDetalhesOrcamento.Cells[2,i]  := dbCtx.TItensOrcamentocodfabproduto.AsString;
//     GridDetalhesOrcamento.Cells[3,i]  := dbCtx.TItensOrcamentoqtde.AsString;
//     GridDetalhesOrcamento.Cells[4,i]  := dbCtx.TItensOrcamentoobservacao.AsString;
//     GridDetalhesOrcamento.Cells[5,i]  := dbCtx.TItensOrcamentovalorunidade.AsString;
//     GridDetalhesOrcamento.Cells[6,i]  := dbCtx.TItensOrcamentovalortotal.AsString;
//     GridDetalhesOrcamento.Cells[7,i]  := dbCtx.TItensOrcamentoid.AsString;
//     GridDetalhesOrcamento.Cells[8,i]  := dbCtx.TItensOrcamentoicmst.AsString;
//     GridDetalhesOrcamento.Cells[9,i]  := dbCtx.TItensOrcamentodesconto.AsString;
//     GridDetalhesOrcamento.Cells[10,i]  := dbCtx.TItensOrcamentofrete.AsString;
//     GridDetalhesOrcamento.Cells[11,i]  := dbCtx.TItensOrcamentoIPI.AsString;
//     GridDetalhesOrcamento.Cells[12,i] := dbCtx.TItensOrcamentodiferencialalicota.AsString;
//     GridDetalhesOrcamento.Cells[13,i] := dbCtx.TItensOrcamentoidorcamento.AsString;
//     if TryStrToFloat(dbCtx.TItensOrcamentovalortotal.AsString,valor1) then
//      Valor := Valor+Valor1;
//     inc(i);
//     dbCtx.TItensOrcamento.Next;
//   end;
//   lblTotalItens.Text := 'Total de Items: '+ intToStr(dbCtx.TItensOrcamento.RecordCount);
//   lblValorTotal.Text := 'Valor Total: ' + FormatFloat('$####,0.00',Valor);
end;

procedure TfrmCadPedidos.gridFornSelectedCellDblClick(const Column: TColumn;
  const Row: Integer);
var
 vRow:integer;
begin
  vRow := gridForneAdd.RowCount+1;
  gridForneAdd.RowCount :=vRow;
  gridForneAdd.Cells[0,vRow-1] := gridFornSelected.Cells[0,gridFornSelected.Row];
  gridForneAdd.Cells[1,vRow-1] := gridFornSelected.Cells[1,gridFornSelected.Row];
  gridForneAdd.Cells[2,vRow-1] := gridFornSelected.Cells[2,gridFornSelected.Row];
  TabControl1.ActiveTab := TabItem2;
end;

procedure TfrmCadPedidos.gridFornSelectedEditingDone(Sender: TObject;
  const ACol, ARow: Integer);
begin
  if StrToBool(gridFornSelected.Cells[3,gridFornSelected.Row]) then
  begin
    MemTable.Open;
    MemTable.Append;
    MemTable.FieldByName('ID').AsString := gridFornSelected.Cells[0,gridFornSelected.Row];
    MemTable.Post;
  end;
end;

procedure TfrmCadPedidos.GridItensAprovadosEditingDone(Sender: TObject;
  const ACol, ARow: Integer);
var
 vAlor,vQtde:Double;
 vValorStr:string;
begin

  vValorStr:=StringReplace(GridItensAprovados.Cells[3,GridItensAprovados.Row],'.',',',[rfReplaceAll]);
  vValorStr:=StringReplace(vValorStr,'.',',',[rfReplaceAll]);
  vValorStr:=StringReplace(vValorStr,'R$','',[rfReplaceAll]);
  vValorStr:=TRIM(vValorStr);
  vAlor:=strToFloat(vValorStr);
  vQtde := strToFloat(GridItensAprovados.Cells[2,GridItensAprovados.Row]);

   GridItensAprovados.Cells[4,GridItensAprovados.Row]:= floatToStr(vAlor*vQtde);
   SomarValoresAprovados;
end;

procedure TfrmCadPedidos.gridItensEditingDone(Sender: TObject; const ACol,
  ARow: Integer);
var
 vString:string;
begin
 vString := gridItens.Cells[6,gridItens.Row];
 if vString='True' then
 begin
  edtObseRecebimento.Lines.Clear;
  layRecebimento.Visible := true;
 end
 else
 begin
  dbCtx.TItensPedido.Edit;
  dbCtx.TItensPedidorecebido.AsBoolean := false;
  dbCtx.TItensPedidodataRecebimento.AsVariant      := null;
  dbCtx.TItensPedidoidusuariorecebimento.AsVariant := null;
  dbCtx.TItensPedidoobservacaorecebimento.AsString := '';

  if dbCtx.vTipoBDConfig=2 then
   dbCtx.TItensPedidosyncFaz.AsInteger :=1
  else
   dbCtx.TItensPedidosyncFaz.AsInteger :=0;

  dbCtx.TItensPedido.ApplyUpdates(-1);
 end;
end;

procedure TfrmCadPedidos.Image15Click(Sender: TObject);
begin
 layItem.Visible  := false;
end;

procedure TfrmCadPedidos.Image18Click(Sender: TObject);
begin
  if layMnuStatus.Width =57 then
  begin
   lblbtnAddStatus.Text         := 'Adicionar';
   lblbtnEditaStatus.Text       := 'Editar';
   lblbtnExcluirStatus.Text     := 'Deletar';
   layMnuStatus.Width  := 150
  end
  else
  begin
   lblbtnAddStatus.Text         := '';
   lblbtnEditaStatus.Text       := '';
   lblbtnExcluirStatus.Text     := '';
   layMnuStatus.Width  := 57;
  end;
end;

procedure TfrmCadPedidos.Image22Click(Sender: TObject);
begin
 layStatusPedidoADD.Visible := false;
end;

procedure TfrmCadPedidos.Image25Click(Sender: TObject);
begin
 layRecebimento.Visible  := false;
end;

procedure TfrmCadPedidos.Image29Click(Sender: TObject);
begin
 if btnSalvarOrcamento.Enabled then
 begin
  MyShowMessage('Deseja Descartar as alteraçoes feitas no orcamento?',true);
  case frmPrincipal.vMsgConfirma of
   1:begin
      MudarAba(tbiCotacoes,sender);
     end;
  end;
 end
 else
 begin
  dbCtx.AbreOrcamentos(vIdPedido,'');
  MudarAba(tbiCotacoes,sender);
 end;
end;

procedure TfrmCadPedidos.Image31Click(Sender: TObject);
begin
  MudarAba(TabItem1,sender);
end;

procedure TfrmCadPedidos.Image39Click(Sender: TObject);
begin
 MudarAba(TabItem2,sender);
end;

procedure TfrmCadPedidos.Image40Click(Sender: TObject);
begin
  layNovoOrcamento.Visible := false;
end;

procedure TfrmCadPedidos.Image41Click(Sender: TObject);
begin
  MudarAba(tbiCotacoes,sender);
end;

procedure TfrmCadPedidos.Image53Click(Sender: TObject);
begin
 layItemOrcamento.Visible :=FALSE;
end;

procedure TfrmCadPedidos.Image61Click(Sender: TObject);
begin
 layItemRecebido.Visible := false;
end;

procedure TfrmCadPedidos.InsreStatus(vIdPedido, vStatus: string);
begin
   dbCtx.TStatusPedido.Close;
   dbCtx.TStatusPedido.Open();
   dbCtx.TStatusPedido.Insert;
   dbCtx.TStatusPedidoidpedido.AsString            := vIdPedido;
   dbCtx.TStatusPedidoIDstatus.AsString            := vStatus;
   dbCtx.TStatusPedidodatastatus.AsDateTime        := date;
   dbCtx.TStatusPedidoIdUsuario.AsString           := dbCtx.vIdUsuarioLogado;
  try
   if dbCtx.vTipoBDConfig=2 then
    dbCtx.TStatusPedidosyncFaz.AsInteger :=1
   else
    dbCtx.TStatusPedidosyncFaz.AsInteger :=0;

   dbCtx.TStatusPedido.ApplyUpdates(-1);
   dbCtx.AtualizaStatusPedido(vIdPedido,vStatus);
   if dbCtx.vTipoBDConfig in[0,2] then
   begin
     TThread.CreateAnonymousThread(procedure()
     begin
      TThread.Synchronize(nil,procedure
      begin
       if cbxStatusPedido.ItemIndex=0 then
        dbCtx.CancelaPedido(vIdPedido);
       layStatusPedidoADD.Visible := false;
       dbCtx.AbreStatusPedidos(vIdPedido);
       Image22.Enabled := true;
       btnCancelaStatus.Enabled := true;
       edtAddStatus.Enabled := true;
      end);
     end).Start;
   end
   else
   begin
    Image22.Enabled := true;
    btnCancelaStatus.Enabled := true;
    edtAddStatus.Enabled := true;
    dbCtx.AtualizaStatusPedido(vIdPedido,intToStr(cbxStatusPedido.ItemIndex));
    if cbxStatusPedido.ItemIndex=0 then
     dbCtx.CancelaPedido(vIdPedido);
    layStatusPedidoADD.Visible := false;
    dbCtx.AbreStatusPedidos(vIdPedido);
   end
  except
   on E: Exception do
    myShowMessage('Erro ao salvar Status:'+E.Message,false);
  end;
end;

procedure TfrmCadPedidos.LimpaCampos;
begin
 edtSolicitante.Text       :='';
 cbxSegmento.ItemIndex     :=-1;
 cbxCategoria.ItemIndex    :=-1;
 edtCentroCusto.Text       :='';
 lblMaquina.Visible        := false;
 edtMaquinaVeiculo.Visible := false;
 edtCentroCusto.Text       :='';
 edtPropriedadeDestino.Text:='';
 cbxPrioridade.ItemIndex   :=-1;
end;

procedure TfrmCadPedidos.LimpaCamposItem;
begin
  cbxTipo.ItemIndex          :=-1;
  cbxUnidadeMedida.ItemIndex :=-1;
  edtQtde.Text               :='';
  edtValorUni.Text           :='';
  edtItemPedido.Text         :='';
  edtValorTotalItem.Text     :='';
  edtMarcaItemPedido.Text    :='';
//  rdOriginal.IsCh
  edtObsItem.Lines.Clear;
end;

procedure TfrmCadPedidos.LimpaCamposItemOrcamento;
begin
  edtDescontoitemOrcamento.Enabled   := true;
  edtFreteItemOrcamento.Enabled      := true;
  edtitemOrcamento.Text              :='';
  cbxUniMedItemOrcamento.ItemIndex   :=-1;
  edtQtdItemOrcamento.Text           :='';
  edValorUnitarioItemOrcamento.Text  :='';
  edtDescontoitemOrcamento.Text      :='';
  edtFreteItemOrcamento.Text         :='';
  edtIcmsItemOrcamento.Text          :='';
  edtIpiItemOrcamento.Text           :='';
  edtDifalItemOrcamento.Text         :='';
  edtValorTotaltemOrcamento.Text     :='';
  edtValorLiquidoItemOrc.Text        :='';
  rdOriginal.IsChecked               :=false;
  rdParalelo.IsChecked               :=false;
  edtObstemOrcamento.Text            :='';
  imgProduto.Bitmap                  :=nil;
  edtMarcaItemOrcamento.Text         :='';
  dbCtx.TItensOrcamento.Insert;
  layItemOrcamento.Visible           := true;
end;

procedure TfrmCadPedidos.listaPedidosItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
 if Assigned(listaPedidos.Selected) then
 begin
  vIdentificador:=
   TAppearanceListViewItem(listaPedidos.Selected).Objects.FindObjectT<TListItemText>('Text21').TagString;
  vIdPedido :=
   TAppearanceListViewItem(listaPedidos.Selected).Objects.FindObjectT<TListItemText>('Text22').TagString;
  vIdCategoriaFiltro:=
   TAppearanceListViewItem(listaPedidos.Selected).Objects.FindObjectT<TListItemText>('Text23').TagString;
  vStatusSelect:=
   TAppearanceListViewItem(listaPedidos.Selected).Objects.FindObjectT<TListItemText>('Text24').TagString;
  vIdPropriedade:=
   TAppearanceListViewItem(listaPedidos.Selected).Objects.FindObjectT<TListItemText>('Text43').TagString;

  vMaquinaLista     := TAppearanceListViewItem(listaPedidos.Selected).Objects.FindObjectT<TListItemText>('Text12').Text;
  vServicoLista     := TAppearanceListViewItem(listaPedidos.Selected).Objects.FindObjectT<TListItemText>('Text12').Text;
  vSetorLista       := TAppearanceListViewItem(listaPedidos.Selected).Objects.FindObjectT<TListItemText>('Text24').Text;
  vCentroCustoLista := TAppearanceListViewItem(listaPedidos.Selected).Objects.FindObjectT<TListItemText>('Text26').Text;


  if ItemObject is TListItemImage then
  begin
     if TListItemImage(ItemObject).Name='Image40' then
     begin
       dbCtx.AbreItemPedidos(vIdPedido);
       lblItemsPedido.Text := 'Items do Pedido :'+vIdentificador;
       MudarAba(tbiItensPedido,sender);
       gridItens.Columns[6].Visible := false;
       Exit;
     end;
     if (TListItemImage(ItemObject).Name='Image48') and (strToInt(vStatusSelect)=6)
     and (dbCtx.vTipoBDConfig>0) then
     begin
       dbCtx.AbreOrcamentos(vIdPedido,' and b.status=3');
       lblItemsPedido.Text := 'Recebimento Items do Pedido :'+vIdentificador;
       MudarAba(tbiRecebimento,sender);
       gridItens.Columns[6].Visible := true;
       Exit;
     end;
     if TListItemImage(ItemObject).Name='Image41' then
     begin
       dbCtx.AbreStatusPedidos(vIdPedido);
       lblStatusPedidos.Text := 'Histórico do Pedido :'+vIdentificador;
       MudarAba(tbiStatusPedido,sender);
       Exit;
     end;
     if (TListItemImage(ItemObject).Name='Image50') and (dbCtx.vTipoBDConfig=0) then
     begin
       TabControl1.TabPosition := TTabPosition.None;
       TabControl1.ActiveTab   := TabItem1;
       dbCtx.AtualizaValoresOrcamentoItens(vIdPedido);
       dbCtx.AbreOrcamentos(vIdPedido,'');
       dbCtx.AbreItemPedidos(vIdPedido);
       lblCotacoes.Text     :='Cotaçoes Referente ao Pedido :'+vIdentificador;
       MudarAba(tbiCotacoes,sender);
     end;
     if TListItemImage(ItemObject).Name='Image42' then
     begin
      if strToInt(vStatusSelect)<=3 then
      begin
       dbCtx.AbrePedidosRep(vIdPedido);
       dbCtx.AbreItemPedidos(vIdPedido);
       dmReport.ppRepPedido.Print;
       Exit;
      end
      else
      begin
        dbCtx.AbrePedidosRep4(vIdPedido);
        if dbCtx.TPedidoCompraRep4.RecordCount>0 then
         dmReport.ppRepPedido4.Print;
      end;
     end;
  end;
 end;
end;

procedure TfrmCadPedidos.MenuItem1Click(Sender: TObject);
begin
   with qryAux,qryAux.SQL do
    begin
     Clear;
     Add('delete from tmpcomparativo');
     Add('where item='+GridItensAprovados.Cells[0,GridItensAprovados.Row]);
     ExecSQL;
   end;
   DeleteRow(GridItensAprovados, GridItensAprovados.Row);
   SomarValoresAprovados;
end;

procedure TfrmCadPedidos.MenuItem2Click(Sender: TObject);
var
 Dir,DirSolicitacao,DirOrdem:string;
 IdSSLIOHandlerSocket: TIdSSLIOHandlerSocketOpenSSL;
 IdSMTP: TIdSMTP;
 IdMessage: TIdMessage;
 IdText: TIdText;
 sAnexo,sAnexo2: string;
 StrAux  : TStringWriter;
 vEmailCliente,vEmailUsuario:string;
 x:integer;
begin
 if dbCtx.TOrcamentoemail.AsString.Length>0 then
 begin
   Dir:=ExtractFilePath(ParamStr(0))+'Reports';
   DirSolicitacao := Dir+'\SolicitacaoCompra\';
   DirOrdem       := Dir+'\OrdemCompra\';
   if not DirectoryExists(Dir) then
    CreateDir(ExtractFilePath(ParamStr(0))+'Reports');
   if not DirectoryExists(DirSolicitacao) then
    CreateDir(DirSolicitacao);
   if not DirectoryExists(DirOrdem) then
    CreateDir(DirOrdem);
   dbCtx.AbreItemsOrcamentos(dbCtx.TOrcamentoid.AsString);
   if dbCtx.TOrcamentostatus.AsInteger<>3 then
   begin
     dmReport.ppRepOrcamento.ShowPrintDialog := false;
     dmReport.ppRepOrcamento.DeviceType      := 'PDF';
     dmReport.ppRepOrcamento.TextFileName    := DirSolicitacao+'Solicitacao_Compra_'+dbCtx.TOrcamentoid.AsString+'.PDF';
     dmReport.ppRepOrcamento.Print;
     SendEmailOS(dbCtx.TOrcamentoemail.AsString,
      DirSolicitacao+'Solicitacao_Compra_'+dbCtx.TOrcamentoid.AsString+'.PDF','');
   end
   else
   begin
     dmReport.ppRepOrdemCompra.ShowPrintDialog := false;
     dmReport.ppRepOrdemCompra.DeviceType      := 'PDF';
     dmReport.ppRepOrdemCompra.TextFileName    := DirOrdem+'Ordem_Compra_'+dbCtx.TOrcamentoid.AsString+'.PDF';
     dmReport.ppRepOrdemCompra.Print;
     SendEmailOS(dbCtx.TOrcamentoemail.AsString,
      DirOrdem+'Ordem_Compra_'+dbCtx.TOrcamentoid.AsString+'.PDF','');
   end;
 end;
end;

procedure TfrmCadPedidos.MenuItem3Click(Sender: TObject);
begin
 MyShowMessage('Deseja realmente Converter esse Ordem de Compra em Solicitação?',false);
 if frmPrincipal.vMsgConfirma=1 then
 begin
   dbCtx.TOrcamento.Edit;
   dbCtx.TOrcamentostatus.AsInteger :=1;
   dbCtx.TOrcamentodataalteracao.AsDateTime :=now;
   dbCtx.TOrcamentoidusuarioalteracao.AsString := dbCtx.vIdUsuarioLogado;
   if dbCtx.vTipoBDConfig=2 then
    dbCtx.TOrcamentosyncFaz.AsInteger :=1
   else
    dbCtx.TOrcamentosyncFaz.AsInteger :=0;

   dbCtx.TOrcamento.ApplyUpdates(-1);
   MyShowMessage('Orçamento deletado com sucesso!',false);
   dbCtx.AbreOrcamentos(vIdPedido,'');
 end;
end;

function TfrmCadPedidos.EnviaEmailReport(idOs:string): string;
var
 vText,path: string;
 StrAux  : TStringWriter;
 txtJson : TJsonTextWriter;
 vEmailCliente,vEmailUsuario,vJsonString:string;
 vJoInsert,vJoItemO,vJoItemO1 : TJSONObject;
 vJoItem,vJoItem1   : TJSONArray;
begin
 vEmailCliente := dbCtx.TOrcamentoemail.AsString;  //RetornaEmailCliente(idOs);
 vEmailUsuario := 'orcamentosffg@gmail.com';//RetornaEmailResponsavel(idOs);

 path:=ExtractFilePath(ParamStr(0))+'Ordens';
 path := path+'\'+idOs;
 if not DirectoryExists(path) then
  ForceDirectories(path);
 dmReport.ppLblOrdemPedido.Text := 'Ordem de Compra';
 try
   dmReport.ppRepOrcamento.ShowPrintDialog := false;
   dmReport.ppRepOrcamento.DeviceType      := 'PDF';
   dmReport.ppRepOrcamento.TextFileName    := path+'\OrdemCompra_'+idOs+'.pdf';
   dmReport.ppRepOrcamento.Print;
  except
  on E:Exception do
    MyShowMessage('Erro ao gerar Relatório:'+e.Message,false);
  end;

 if vEmailCliente.Length>0 then
 begin
   if SendEmailOS(vEmailCliente,path+'\OrdemCompra_'+idOs+'.pdf','') then
   begin
     vText :='Email Cliente OK';
   end
   else
     vText :='Erro ao enviar Email Cliente';
 end;
 Result := vText;
end;

procedure TfrmCadPedidos.SearchEditButton1Click(Sender: TObject);
begin
 frmCentroCusto := TfrmCentroCusto.Create(Self);
 try
  frmCentroCusto.ShowModal;
 finally
  edtCentroCustoF.Text := dbCtx.TCentroCustonome.AsString;
  vIdCentroCusto      := dbCtx.TCentroCustoid.AsString;
  frmCentroCusto.Free;
 end;
end;

function TfrmCadPedidos.SendEmailOS(Destinatario,Anexo,Anexo2: string): Boolean;
var
// variáveis e objetos necessários para o envio
 IdSSLIOHandlerSocket: TIdSSLIOHandlerSocketOpenSSL;
 IdSMTP: TIdSMTP;
 IdMessage: TIdMessage;
 IdText: TIdText;
 sAnexo,sAnexo2,vSaudacao: string;
 StrAux  : TStringWriter;
 txtJson : TJsonTextWriter;
 vEmailCliente,vEmailUsuario:string;
 I : Integer;
begin
  I := Trunc(Time * 24);
  case i of
     0..6:   vSaudacao := 'Boa madrugada';
     7..12:  vSaudacao := 'Bom dia';
     13..18: vSaudacao := 'Boa tarde';
  else
     vSaudacao := 'Boa Noite';
  end;
 // instanciação dos objetos
 IdSSLIOHandlerSocket := TIdSSLIOHandlerSocketOpenSSL.Create(Self);
 IdSMTP := TIdSMTP.Create(Self);
 IdMessage := TIdMessage.Create(Self);
 try
  IdSSLIOHandlerSocket.SSLOptions.Method := sslvSSLv23;
  IdSSLIOHandlerSocket.SSLOptions.Mode := sslmClient;
  IdSMTP.IOHandler := IdSSLIOHandlerSocket;
  IdSMTP.UseTLS := utUseImplicitTLS;
  IdSMTP.AuthType := satDefault;
  IdSMTP.Port := 465;
  IdSMTP.Host := 'smtp.gmail.com';
//  IdSMTP.Username := 'orcamentosffg@gmail.com';
  IdSMTP.Username := 'fortagroorcamentos@gmail.com';
//  IdSMTP.Password := '#ffg#2020';
  IdSMTP.Password := 'Ffg_2021';
  IdMessage.From.Address := Destinatario;
  IdMessage.From.Name := 'Relatórios FieldPec';
  IdMessage.Recipients.Add.Text := Destinatario;
  if dbCtx.TOrcamentostatus.AsInteger<>3 then
  begin
   IdMessage.From.Name := 'Solicitação de Orçamentos Fortaleza do Guaporé Agropastoril';
   IdMessage.Subject := 'Solicitação de  Compra';
  end;
  if dbCtx.TOrcamentostatus.AsInteger=3 then
  begin
   IdMessage.From.Name := 'Ordem de Compra Fortaleza do Guaporé Agropastoril';
   IdMessage.Subject := 'Ordem de Compra';
  end;
  IdMessage.Encoding := meMIME;
  IdText := TIdText.Create(IdMessage.MessageParts);
  if dbCtx.TOrcamentostatus.AsInteger<>3 then
  begin
   IdText.Body.Add(vSaudacao+','+#13+
   'Solicito através desse, uma cotação de valores dos itens vinculados ao Orçamento de Código:'+#13+
   dbCtx.TOrcamentoid.AsString+#13+
   'Acesse o sistema de Orçamentos online pelo link:'+#13+
   'http://54.198.102.100/OrcamentosFFG'+#13+
   'Login:'+dbCtx.TOrcamentoemail.AsString+#13+
   'Senha:'+dbCtx.TOrcamentosenha.AsString+#13+
   'Preencha o valor unitário e acrescente uma observação caso seja necessário.'+#13+
   'Desde já a equipe de compras Fortaleza do Guaporé Agropastoril agradece a atenção.')
  end
  else
  begin
   IdText.Body.Add(vSaudacao+','+#13+
   'Segue ordem de compra aprovada referente a solicitação:'+dbCtx.TOrcamentoid.AsString+#13+
   'Grata.')
  end;
  IdText.ContentType := 'text/plain; charset=iso-8859-1';
  sAnexo := Anexo;
  if FileExists(sAnexo) then
  begin
   TIdAttachmentFile.Create(IdMessage.MessageParts, sAnexo);
  end;
  try
    IdSMTP.Connect;
    IdSMTP.Authenticate;
  except
  on E:Exception do
  begin
   MyShowMessage('Erro ao Enviar Email '+e.Message,false);
  end;
  end;
  try
    IdSMTP.Send(IdMessage);
    MyShowMessage('Emial enviado com Sucesso para :'+Destinatario,false);
   except
   On E:Exception do
   begin
     MyShowMessage('Erro ao Enviar Email :'+e.Message,false);
   end;
  end;
  finally
   IdSMTP.Disconnect;
   UnLoadOpenSSLLibrary;
   FreeAndNil(IdMessage);
   FreeAndNil(IdSSLIOHandlerSocket);
   FreeAndNil(IdSMTP);
 end;
end;


procedure TfrmCadPedidos.DeleteRow(StringGrid: TStringGrid; ARow: integer);
var
  i, j: integer;
begin
  with StringGrid do
  begin
    for i := ARow to RowCount - 2 do
      for j := 0 to ColumnCount - 1 do
        Cells[j, i] := Cells[j, i + 1];
    RowCount := RowCount - 1;
  end;
end;


procedure TfrmCadPedidos.DownloadUploadPedidos;
begin
 TThread.CreateAnonymousThread(procedure()
 var
   vProgres:Double;
 begin
  vProgres := 10;
  TThread.Synchronize(nil,procedure
  begin
    btnAdd.Enabled      := false;
    btnEditar.Enabled   := false;
    msmoSync.Lines.Clear;
    laySync.visible := true;
    msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Inicio sincrionização AWS');
    ProgressBarSync.Value :=0;
    ProgressBarSync.Min   :=0;
    ProgressBarSync.Max   :=100;
    Animacao.Loop          := true;
    Animacao.PropertyName  := 'RotationAngle';
    Animacao.AnimationType := TAnimationType.InOut;
    Animacao.Interpolation := TInterpolationType.Linear;
    Animacao.Start;
  end);
  //Baixa
  if dbCtx.vTipoBDConfig=2 then
  begin
    TThread.Synchronize(nil,procedure
    begin
     ProgressBarSync.Value :=ProgressBarSync.Value+vProgres;
     msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Pedido de Compras AWS');
    end);
//    DataModule2.ReplicaPedidoCompra;
    TThread.Synchronize(nil,procedure
    begin
     ProgressBarSync.Value :=ProgressBarSync.Value+vProgres;
     msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Itens do Pedido AWS');
    end);
//    DataModule2.ReplicaPedidoCompraItens;
    TThread.Synchronize(nil,procedure
    begin
     ProgressBarSync.Value :=ProgressBarSync.Value+vProgres;
     msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Status do Pedido AWS');
    end);
//    DataModule2.ReplicaStatusPedido;
    TThread.Synchronize(nil,procedure
    begin
     ProgressBarSync.Value :=ProgressBarSync.Value+vProgres;
     msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Orçamentos AWS');
    end);
//    DataModule2.ReplicaOrcamento;
    TThread.Synchronize(nil,procedure
    begin
     ProgressBarSync.Value :=ProgressBarSync.Value+vProgres;
     msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Itens do Orçamento AWS');
    end);
//    DataModule2.ReplicaOrcamentoItens;
  end;
  if dbCtx.vTipoBDConfig=0 then
  begin
    TThread.Synchronize(nil,procedure
    begin
     ProgressBarSync.Value :=ProgressBarSync.Value+vProgres;
     msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Pedido de Compras AWS');
    end);
//    DataModule2.ReplicaPedidoCompraMGA;
    TThread.Synchronize(nil,procedure
    begin
     ProgressBarSync.Value :=ProgressBarSync.Value+vProgres;
     msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Itens do Pedido AWS');
    end);
//    DataModule2.ReplicaPedidoCompraItensMGA;
    TThread.Synchronize(nil,procedure
    begin
     ProgressBarSync.Value :=ProgressBarSync.Value+vProgres;
     msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Status do Pedido AWS');
    end);
//    DataModule2.ReplicaStatusPedidoMGA;
    TThread.Synchronize(nil,procedure
    begin
     ProgressBarSync.Value :=ProgressBarSync.Value+vProgres;
     msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Orçamentos AWS');
    end);
//    DataModule2.ReplicaOrcamentoMGA;
    TThread.Synchronize(nil,procedure
    begin
     ProgressBarSync.Value :=ProgressBarSync.Value+vProgres;
     msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Itens do Orçamento AWS');
    end);
//    DataModule2.ReplicaOrcamentoItensMGA;
  end;
  TThread.Synchronize(nil,procedure
  begin
   dbCtx.AbrePedidos('');
   GeraLista;
   ProgressBarSync.Value :=ProgressBarSync.Value+vProgres;
   laySync.visible       :=false;
   btnAdd.Enabled        :=true;
   btnEditar.Enabled     :=true;
   dbCtx.AtualizaSequencias;
  end);
 end).Start;
end;

procedure TfrmCadPedidos.mnuClick(Sender: TObject);
begin
 if layMnuItem.Width =57 then
  begin
   lblbtnAddItem.Text         := 'Adicionar';
   lblbtnEditaItem.Text       := 'Editar';
   lblbtnExcluirItem.Text     := 'Deletar';
   layListaMnu.Width  := 150
  end
  else
  begin
   lblbtnAddItem.Text         := ' ';
   lblbtnEditaItem.Text       := ' ';
   lblbtnExcluirItem.Text     := ' ';
   layListaMnu.Width  := 57;
  end;
end;

function TfrmCadPedidos.PesquisaFornSelected(id: string): boolean;
begin
  MemTable.Filtered := false;
  MemTable.Filter   :='ID='+ID;
  MemTable.Filtered := TRUE;
  Result := MemTable.IsEmpty;
end;

procedure TfrmCadPedidos.edtAddStatusClick(Sender: TObject);
begin
 if edtDataStatus.Text.Length =0 then
  begin
    MyShowMessage('Informe a Data *',false);
    edtDataStatus.SetFocus;
    Exit;
  end;
  if cbxStatusPedido.ItemIndex=-1 then
  begin
    MyShowMessage('Informe o Status *',false);
    cbxStatusPedido.SetFocus;
    Exit;
  end;
  dbCtx.TStatusPedidoidpedido.AsString            := vIdPedido;
  dbCtx.TStatusPedidoIDstatus.AsInteger           := cbxStatusPedido.ItemIndex;
  dbCtx.TStatusPedidodatastatus.AsDateTime        := edtDataStatus.Date;
  dbCtx.TStatusPedidoobservacao.AsString          := ObsStatusPedido.Text;
  if dbCtx.TStatusPedido.State=dsInsert then
   dbCtx.TStatusPedidoIdUsuario.AsString          := dbCtx.vIdUsuarioLogado
  else
  begin
   dbCtx.TStatusPedidoIdUsuarioAlteracao.AsString := dbCtx.vIdUsuarioLogado;
   dbCtx.TStatusPedidoDataAlteracao.AsDateTime    := now;
   dbCtx.AlteraFlaSynAWS_ZERO('pedidostatus',dbCtx.TStatusPedidoID.AsString);
  end;
  try
   if dbCtx.vTipoBDConfig=2 then
    dbCtx.TStatusPedidosyncFaz.AsInteger :=1
   else
    dbCtx.TStatusPedidosyncFaz.AsInteger :=0;

   dbCtx.TStatusPedido.ApplyUpdates(-1);
   dbCtx.AtualizaStatusPedido(vIdPedido,intToStr(cbxStatusPedido.ItemIndex));
   if dbCtx.vTipoBDConfig in[0,2] then
   begin
     TThread.CreateAnonymousThread(procedure()
     begin
      TThread.Synchronize(nil,procedure
      begin
       if cbxStatusPedido.ItemIndex=0 then
        dbCtx.CancelaPedido(vIdPedido);
       layStatusPedidoADD.Visible := false;
       dbCtx.AbreStatusPedidos(vIdPedido);
       Image22.Enabled := true;
       btnCancelaStatus.Enabled := true;
       edtAddStatus.Enabled := true;
      end);
     end).Start;
   end
   else
   begin
    Image22.Enabled := true;
    btnCancelaStatus.Enabled := true;
    edtAddStatus.Enabled := true;
    dbCtx.AtualizaStatusPedido(vIdPedido,intToStr(cbxStatusPedido.ItemIndex));
    if cbxStatusPedido.ItemIndex=0 then
     dbCtx.CancelaPedido(vIdPedido);
    layStatusPedidoADD.Visible := false;
    dbCtx.AbreStatusPedidos(vIdPedido);
   end
  except
   on E: Exception do
    myShowMessage('Erro ao salvar Status:'+E.Message,false);
  end;
end;

procedure TfrmCadPedidos.edtDescontoitemOrcamentoChangeTracking(
  Sender: TObject);
begin
 CalculaValorBrutoLiquidoOrcamento;
end;

procedure TfrmCadPedidos.edtDescontoitemOrcamentoEnter(Sender: TObject);
begin
 if(edtDescontoGeral.Text.Length>0)and(strToFloat(edtDescontoGeral.Text)>0) then
 begin
  MyShowMessage('Só é permitida alteração desse campo quando o desconto geral do pedido for zerado!',false);
  edtDescontoitemOrcamento.Enabled := false;
  TThread.CreateAnonymousThread(procedure()
  begin
   TThread.Synchronize(TThread.CurrentThread,
   procedure ()
   begin
     edtIcmsItemOrcamento.SetFocus;
   end);
  end).Start;
 end
 else
  edtDescontoitemOrcamento.Enabled := true;
end;

procedure TfrmCadPedidos.edtDescontoitemOrcamentoExit(Sender: TObject);
begin
 CalculaValorBrutoLiquidoOrcamento;
end;

procedure TfrmCadPedidos.edtDifalItemOrcamentoChangeTracking(Sender: TObject);
begin
 CalculaValorBrutoLiquidoOrcamento;
end;

procedure TfrmCadPedidos.edtFiltraFornKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
if key=13 then
begin
 if edtFiltraForn.Text.Length>0 then
 begin
   qryFornesedorSelect.Filtered := false;
   qryFornesedorSelect.Filter   := 'nome like '+QuotedStr('%'+edtFiltraForn.Text+'%');
   qryFornesedorSelect.Filtered := true;
 end
 else
 begin
   qryFornesedorSelect.Filtered := false;
   qryFornesedorSelect.Close;
   qryFornesedorSelect.Open;
 end;
end
end;

procedure TfrmCadPedidos.edtFornecedorFChangeTracking(Sender: TObject);
begin
 FiltrarOrcamento;
end;

procedure TfrmCadPedidos.edtFreteItemOrcamentoChangeTracking(Sender: TObject);
begin
 CalculaValorBrutoLiquidoOrcamento;
end;

procedure TfrmCadPedidos.edtFreteItemOrcamentoEnter(Sender: TObject);
begin
 if(edtFreteGeral.Text.Length>0)and(strToFloat(edtFreteGeral.Text)>0) then
 begin
  MyShowMessage('Só é permitida alteração desse campo quando o desconto geral do pedido for zerado!',false);
  edtFreteItemOrcamento.Enabled:= false;
  TThread.CreateAnonymousThread(procedure()
  begin
   TThread.Synchronize(TThread.CurrentThread,
   procedure ()
   begin
     edtIcmsItemOrcamento.SetFocus;
   end);
  end).Start;
 end
 else
  edtFreteItemOrcamento.Enabled:= true;
end;

procedure TfrmCadPedidos.edtFreteItemOrcamentoExit(Sender: TObject);
begin
  CalculaValorBrutoLiquidoOrcamento;
end;

procedure TfrmCadPedidos.edtIcmsItemOrcamentoChangeTracking(Sender: TObject);
begin
 CalculaValorBrutoLiquidoOrcamento;
end;

procedure TfrmCadPedidos.edtIpiItemOrcamentoChangeTracking(Sender: TObject);
begin
 CalculaValorBrutoLiquidoOrcamento;
end;

procedure TfrmCadPedidos.Rectangle11Click(Sender: TObject);
begin
  layItem.Visible  := false;
end;

procedure TfrmCadPedidos.Rectangle25Click(Sender: TObject);
begin
 MyShowMessage('Deseja realmente deletar esse Orcamento?',false);
 if frmPrincipal.vMsgConfirma=1 then
 begin
   dbCtx.TOrcamento.Edit;
   dbCtx.TOrcamentostatus.AsInteger :=-1;
   dbCtx.TOrcamentodataalteracao.AsDateTime :=now;
   dbCtx.TOrcamentoidusuarioalteracao.AsString := dbCtx.vIdUsuarioLogado;

   if dbCtx.vTipoBDConfig=2 then
    dbCtx.TOrcamentosyncFaz.AsInteger :=1
   else
    dbCtx.TOrcamentosyncFaz.AsInteger :=0;

   dbCtx.TOrcamento.ApplyUpdates(-1);
   MyShowMessage('Orçamento deletado com sucesso!',false);
   dbCtx.AbreOrcamentos(vIdPedido,'');
 end;
end;

procedure TfrmCadPedidos.Rectangle29Click(Sender: TObject);
var
 I:integer;
begin
  gridForneAdd.RowCount :=0;
  I :=0;
  MudarAba(TabItem2,sender);
  inherited;
end;

procedure TfrmCadPedidos.Rectangle32Click(Sender: TObject);
var
  I,x,Y: Integer;
  vIdOrcamento:string;
begin
 if gridFornSelected.RowCount=0 then
 begin
   MyShowMessage('Selecione pelo menos um fornecedor!!',false);
   Exit;
 end
 else
 begin
  try
   TThread.CreateAnonymousThread(
   procedure
   begin
    TThread.Synchronize(nil,procedure
    var
     I,x,Y: Integer;
    begin
       for I := 0 to gridForneAdd.RowCount-1 do
       begin
           dbCtx.TOrcamento.Close;
           dbCtx.TOrcamento.Open;
           dbCtx.TOrcamento.Insert;
           dbCtx.TOrcamentoidusuario.AsString     := dbCtx.vIdUsuarioLogado;
           dbCtx.TOrcamentoidfornecedor.AsString  := gridForneAdd.Cells[0,I];
           dbCtx.TOrcamentoidpedido.AsString      := vIdPedido;
           dbCtx.TOrcamentoobservacao.AsString    := edtObs.Text;

           if dbCtx.vTipoBDConfig=2 then
            dbCtx.TOrcamentosyncfaz.AsInteger :=1
           else
            dbCtx.TOrcamentosyncfaz.AsInteger :=0;

           try
            dbCtx.TOrcamento.ApplyUpdates(-1);
            vIdOrcamento := dbCtx.RetornaMaxIdPedido;
            x :=0;
            dbCtx.TItensOrcamentoInsert.ResourceOptions.SilentMode := True;
            dbCtx.TItensPedido.First;
            while not dbCtx.TItensPedido.eof do
            begin
              dbCtx.TItensOrcamentoInsert.Close;
              dbCtx.TItensOrcamentoInsert.Open;
              dbCtx.TItensOrcamentoInsert.Insert;
              dbCtx.TItensOrcamentoInsertidusuario.AsString     := dbCtx.vIdUsuarioLogado;
              dbCtx.TItensOrcamentoInsertidorcamento.AsString   := vIdOrcamento;
              dbCtx.TItensOrcamentoInsertidproduto.AsString     := dbCtx.TItensPedidoiditem.AsString;
              dbCtx.TItensOrcamentoInsertqtde.AsString          := dbCtx.TItensPedidoquantidade.AsString;
              dbCtx.TItensOrcamentoInsertvalorunidade.AsInteger := 0;
              dbCtx.TItensOrcamentoInsertvalortotal.AsInteger   := 0;
              dbCtx.TItensOrcamentoInsertobservacao.AsString    := dbCtx.TItensPedidoobservacao.AsString;
              if dbCtx.TItensPedidoidmarca.AsString.Length>0 then
               dbCtx.TItensOrcamentoInsertidmarca.AsString      := dbCtx.TItensPedidoidmarca.AsString;
              if dbCtx.TItensPedidounidademedida.AsString.Length>0 then
               dbCtx.TItensOrcamentoInsertunidademedida.AsString := dbCtx.TItensPedidounidademedida.AsString;
              if dbCtx.vTipoBDConfig=2 then
               dbCtx.TItensOrcamentoInsertsyncFaz.AsInteger :=1
              else
               dbCtx.TItensOrcamentoInsertsyncFaz.AsInteger :=0;

              dbCtx.TItensOrcamentoInsert.ApplyUpdates(-1);
              dbCtx.TItensPedido.Next;
            end;
           except
           on E : Exception do
            MyShowMessage('Erro ao inserir orçamento:'+e.Message,false);
           end;
           if dbCtx.vTipoBDConfig in[0,2] then
           begin
             TThread.CreateAnonymousThread(procedure()
             begin
              TThread.Synchronize(nil,procedure
              begin
               InsreStatus(vIdPedido,'4');
               MyShowMessage('Orçamento Gerado com sucesso!',false);
               dbCtx.AbreOrcamentos(vIdPedido,'');
               layNovoOrcamento.Visible := false;
               Rectangle33.Enabled := true;
               Rectangle32.Enabled := true;
              end);
             end).Start;
           end
           else
           begin
            InsreStatus(vIdPedido,'4');
            MyShowMessage('Orçamento Gerado com sucesso!',false);
            dbCtx.AbreOrcamentos(vIdPedido,'');
            layNovoOrcamento.Visible := false;
            Rectangle33.Enabled := true;
            Rectangle32.Enabled := true;
           end;
       end;
    end);
   end).Start;
   except
    on E : Exception do
     MyShowMessage('Erro ao inserir orçamento:'+e.Message,false);
  end;
 end;
end;

procedure TfrmCadPedidos.Notificacao(Titulo,Notificacao:string);
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

procedure TfrmCadPedidos.Rectangle33Click(Sender: TObject);
begin
  layNovoOrcamento.Visible := false;
end;

procedure TfrmCadPedidos.Rectangle35Click(Sender: TObject);
begin
 MudarAba(tbiCotacoes,sender);
end;

procedure TfrmCadPedidos.Rectangle37Click(Sender: TObject);
begin
 if gridForneAdd.RowCount>=5 then
 begin
  MyShowMessage('Número maximo de fornecedore nao pode ser maior que 5!',false);
  Exit;
 end;
 MudarAba(TabItem4,sender);
end;

procedure TfrmCadPedidos.Rectangle43Click(Sender: TObject);
begin
  MudarAba(tbiCotacoes,sender);
end;

procedure TfrmCadPedidos.Rectangle44Click(Sender: TObject);
begin
  if btnSalvarOrcamento.Enabled then
  begin
    MyShowMessage('Salve as alteraçoes do orçamento antes de prosseguir',false);
    Exit;
  end;
  LimpaCamposItemOrcamento;
  dbCtx.TItensOrcamentoInsert.Close;
  dbCtx.TItensOrcamentoInsert.Open;
  dbCtx.TItensOrcamentoInsert.Insert;
  layItemOrcamento.Visible := true;
end;

procedure TfrmCadPedidos.Rectangle72Click(Sender: TObject);
begin
 layItemRecebido.Visible := false;
end;

procedure TfrmCadPedidos.btnEditarItemOrcClick(Sender: TObject);
var
 Stream : TMemoryStream;
begin
 if btnSalvarOrcamento.Enabled then
 begin
  MyShowMessage('Salve as alteraçoes do orçamento antes de prosseguir',false);
  Exit;
 end;
 if not dbCtx.AbreItenOrcamentoEdit(dbCtx.TItensOrcamentoid.AsString)then
 begin
   dbCtx.TItensOrcamentoInsert.Edit;
   edtDescontoitemOrcamento.Enabled   := true;
   edtFreteItemOrcamento.Enabled      := true;
   edtitemOrcamento.Text              := dbCtx.TItensOrcamentonomeproduto.AsString;
   vIdItemOrcamento                   := dbCtx.TItensOrcamentoidproduto.AsString;
   cbxUniMedItemOrcamento.ItemIndex   := cbxUnidadeMedida.Items.IndexOf(dbCtx.TItensOrcamentounidademedida.AsString);
   edtQtdItemOrcamento.Text           := dbCtx.TItensOrcamentoqtde.AsString;
   edValorUnitarioItemOrcamento.Text  := dbCtx.TItensOrcamentovalorunidade.AsString;
   edtDescontoitemOrcamento.Text      := dbCtx.TItensOrcamentodesconto.AsString;
   edtFreteItemOrcamento.Text         := dbCtx.TItensOrcamentofrete.AsString;
   edtIcmsItemOrcamento.Text          := dbCtx.TItensOrcamentoicmst.AsString;
   edtIpiItemOrcamento.Text           := dbCtx.TItensOrcamentoipi.AsString;
   edtDifalItemOrcamento.Text         := dbCtx.TItensOrcamentodiferencialalicota.AsString;
   edtMarcaItemOrcamento.Text         := dbCtx.TItensOrcamentomarcanome.AsString;
   vIdMarcaItemOrcamento              := dbCtx.TItensOrcamentoidmarca.AsString;
   if dbCtx.TItensOrcamentooriginal.AsInteger=0 then
   begin
    rdParalelotemOrcamento.IsChecked := true;
    rdOriginaltemOrcamento.IsChecked := false;
   end
   else
   begin
    rdParalelotemOrcamento.IsChecked := false;
    rdOriginaltemOrcamento.IsChecked := true;
   end;
   edtObstemOrcamento.Text           := dbCtx.TItensOrcamentoobservacao.AsString;
   if dbCtx.TItensOrcamentoimg.AsString.Length>0 then
    begin
     Stream := TMemoryStream.Create;
     dbCtx.TItensOrcamentoimg.SaveToStream(Stream);
     imgProduto.Bitmap.LoadFromStream(Stream);
    end
    else
     imgProduto.Bitmap.Assign(nil);
    dbCtx.TItensOrcamento.Edit;
    CalculaValorBrutoLiquidoOrcamento;
    layItemOrcamento.Visible := true;
 end;
end;

procedure TfrmCadPedidos.btnImprimeComparativoClick(Sender: TObject);
var
 I,X:integer;
begin
 dbCtx.DeletaComparativo;
 X :=8;
 for I := 0 to gridComparativo.RowCount-1 do
 begin
   TComparativo.Close;
   TComparativo.Open;
   TComparativo.Insert;
   TComparativoidusuario.AsString        := dbCtx.vIdUsuarioLogado;
   TComparativoidpedido.AsString         := vIdPedido;
   TComparativoitem.AsString             := gridComparativo.Cells[1,I];
   TComparativoidproduto.AsString        := gridComparativo.Cells[0,I];
   TComparativoqtde.AsString             := gridComparativo.Cells[2,I];

   if gridComparativo.Columns[8].Tag>0 then
   begin
    TComparativoidfornecedor1.AsInteger    := gridComparativo.Columns[8].Tag;
    TComparativovlfornecedor1.AsString     := trim(StringReplace(StringReplace(gridComparativo.Cells[8,I],'R$','',[rfReplaceAll]),'.','',[rfReplaceAll]));
    TComparativoidorcamentoforn1.AsString  := gridComparativo.Columns[8].TagString;
    if gridComparativo.Columns[8].TagString.Length>0 then
     dmReport.pplblPrevEntrega1.text :=
      dbCtx.RetornaPrevisaoEntrega(gridComparativo.Columns[8].TagString)
     else
      dmReport.pplblPrevEntrega1.Text :='';
   end;
   if gridComparativo.Columns[9].Tag>0 then
   begin
    TComparativoidfornecedor2.AsInteger    := gridComparativo.Columns[9].Tag;
    TComparativovlfornecedor2.AsString     := trim(StringReplace(StringReplace(gridComparativo.Cells[9,I],'R$','',[rfReplaceAll]),'.','',[rfReplaceAll]));
    TComparativoidorcamentoforn2.AsString  := gridComparativo.Columns[9].TagString;
    if gridComparativo.Columns[9].TagString.Length>0 then
     dmReport.pplblPrevEntrega2.text :=
      dbCtx.RetornaPrevisaoEntrega(gridComparativo.Columns[9].TagString)
     else
      dmReport.pplblPrevEntrega2.Text :='';
   end;
   if gridComparativo.Columns[10].Tag>0 then
   begin
    TComparativoidfornecedor3.AsInteger    := gridComparativo.Columns[10].Tag;
    TComparativovlfornecedor3.AsString     := trim(StringReplace(StringReplace(gridComparativo.Cells[10,I],'R$','',[rfReplaceAll]),'.','',[rfReplaceAll]));
    TComparativoidorcamentoforn3.AsString  := gridComparativo.Columns[10].TagString;
    if gridComparativo.Columns[10].TagString.Length>0 then
     dmReport.pplblPrevEntrega3.text :=
      dbCtx.RetornaPrevisaoEntrega(gridComparativo.Columns[10].TagString)
     else
      dmReport.pplblPrevEntrega3.Text :='';
   end;
   if gridComparativo.Columns[11].Tag>0 then
   begin
    TComparativoidfornecedor4.AsInteger    := gridComparativo.Columns[11].Tag;
    TComparativovlfornecedor4.AsString     := trim(StringReplace(StringReplace(gridComparativo.Cells[11,I],'R$','',[rfReplaceAll]),'.','',[rfReplaceAll]));
    TComparativoidorcamentoforn4.AsString  := gridComparativo.Columns[11].TagString;
    if gridComparativo.Columns[12].TagString.Length>0 then
     dmReport.pplblPrevEntrega4.text :=
      dbCtx.RetornaPrevisaoEntrega(gridComparativo.Columns[12].TagString)
     else
      dmReport.pplblPrevEntrega4.Text :='';
   end;
   if gridComparativo.Columns[12].Tag>0 then
   begin
    TComparativoidfornecedor5.AsInteger    := gridComparativo.Columns[12].Tag;
    TComparativovlfornecedor5.AsString     := trim(StringReplace(StringReplace(gridComparativo.Cells[12,I],'R$','',[rfReplaceAll]),'.','',[rfReplaceAll]));
    TComparativoidorcamentoforn5.AsString  := gridComparativo.Columns[12].TagString;
    if gridComparativo.Columns[12].TagString.Length>0 then
     dmReport.pplblPrevEntrega5.text :=
      dbCtx.RetornaPrevisaoEntrega(gridComparativo.Columns[12].TagString)
     else
      dmReport.pplblPrevEntrega5.Text :='';
   end;
   TComparativo.ApplyUpdates(-1);
 end;
 if(vMaquinaLista.Length>0)and(vIdCategoriaFiltro='2') then
  dmReport.ppLblTipoMaquinaServico.Text :='Servico : '+vMaquinaLista
 else
 begin
  if(vMaquinaLista.Length>0) and (vIdCategoriaFiltro='1') then
   dmReport.ppLblTipoMaquinaServico.Text :='Maquina : '+vMaquinaLista
  else
   dmReport.ppLblTipoMaquinaServico.Text :='';
 end;

 if vCentroCustoLista.Length>0 then
  dmReport.ppLblCentroCusto.Text :='Centro de Custo: '+vCentroCustoLista
 else
   dmReport.ppLblCentroCusto.Text :='';

 dmReport.ppLblSetor.Text       := vSetorLista;
 if dbCtx.TPedidoCompraidcategoria.AsInteger=0 then
  dmReport.ppLblAplicacao.Text   := 'Estoque'
 else
  dmReport.ppLblAplicacao.Text   := 'Aplicacao Direta';
 dmReport.qryComparativo.Close;
 dmReport.qryComparativo.Open;
 dmReport.ppRepComparativo.Print;
end;

function TfrmCadPedidos.RetornaIdentificador(segmento:string):string;
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('SELECT last_value+1 last_value FROM pedidocompra_id_seq');
   Open;
   if segmento='0' then
    Result :=  qryAux.FieldByName('last_value').AsString+'-AGRO';
   if segmento='1' then
    Result :=  qryAux.FieldByName('last_value').AsString+'-AGRI';
 end;
end;

procedure TfrmCadPedidos.SomarValoresAprovados;
var
 i:integer;
 Valor,Valor1:Double;
begin
 for I := 0 to GridItensAprovados.RowCount-1 do
 begin
   if TryStrToFloat( StringReplace(GridItensAprovados.Cells[7,I],'R$ ','',[rfReplaceAll]),valor1)then
    Valor := Valor+Valor1;
 end;
 lblCoutProdAprovado.Text    := 'Total de Items: '+ intToStr(I);
 lblValorTotalAprovados.Text := 'Valor Total: ' + FormatFloat('R$####,0.00',Valor);
end;

procedure TfrmCadPedidos.StringGrid1CellDblClick(const Column: TColumn;
  const Row: Integer);
var
 i:integer;
 Valor,Valor1:Double;
begin
 dbCtx.AbreItemsOrcamentos(dbCtx.TOrcamentoid.AsString);
 lblTotalItens.Text           := 'Total Itens:'+intToStr(GridDetalhesOrcamento.RowCount);
 lblValorTotal.Text           := 'Valor Bruto:'+FormatFloat('R$####,##0.00',dbCtx.TValorLiquidoOrcvalorbruto.AsFloat);
 lblValorTotalMaisFrete.Text  := 'Valor Bruto + Frete:'+FormatFloat('R$####,##0.00',dbCtx.TValorLiquidoOrcvalorbrutomaisfrete.AsFloat);
 lblValorLiquido.Text         := 'Valor Liquido:'+FormatFloat('R$####,##0.00',dbCtx.TValorLiquidoOrcvalorliquido.AsFloat);
 edtFormaPagamento.Text       := dbCtx.TItensOrcamentoformapg.AsString;
 vIdFormaPg                   := dbCtx.TItensOrcamentoidformapg.AsString;
 lblFornecedor.Text           := dbCtx.TItensOrcamentofornecedor.AsString;

 if dbCtx.TOrcamentofrete.AsString.Length>0 then
  edtFreteGeral.Text           := dbCtx.TOrcamentofrete.AsString
 else
  edtFreteGeral.Text           := '0';

 if dbCtx.TOrcamentodesconto.AsString.Length>0 then
  edtDescontoGeral.Text        := dbCtx.TOrcamentodesconto.AsString
 else
  edtDescontoGeral.Text        := '0';


 if dbCtx.TOrcamentodataprevitaentrega.AsString.Length>0 then
  edtPrevisaoEntrega.Text     := dbCtx.TOrcamentodataprevitaentrega.AsString
 else
  edtPrevisaoEntrega.IsEmpty  := true;


 edtFormaPagamento.Enabled    := false;
 edtDescontoGeral.Enabled     := false;
 edtFreteGeral.Enabled        := false;
 btnSalvarOrcamento.Enabled   := false;
 btnEditaOrcamento.Enabled    := true;
 edtPrevisaoEntrega.Enabled   := false;
 tbPrincipal.ActiveTab  := TabItem3;
end;

procedure TfrmCadPedidos.StringGrid5CellClick(const Column: TColumn;
  const Row: Integer);
begin
 GeraListaRecebimento;
end;

procedure TfrmCadPedidos.StringGridSort(StrGrid: TStringGrid;
  SortColumn: Integer);
var
  col, row, rowx: Integer;
  MySortCol, MyListCols: TStringList;
begin
  MySortCol := TStringList.Create;
  MyListCols := TStringList.Create;
  try
    MySortCol.Sort;
    MyListCols.Sorted := False;
    StrGrid.BeginUpdate;
    try
      for row := 0 to StrGrid.RowCount - 1 do
        MySortCol.AddObject(StrGrid.Cells[SortColumn, row], TObject(row));
      MySortCol.Sorted := True;
      for row := 0 to StrGrid.RowCount - 1 do
        StrGrid.Cells[SortColumn, row] := MySortCol[row];

      for col := 0 to StrGrid.ColumnCount - 1 do
        if col <> SortColumn then
        begin
          MyListCols.Clear;
          for row := 0 to StrGrid.RowCount - 1 do
            MyListCols.Add(StrGrid.Cells[col, row]);

          for rowx := 0 to StrGrid.RowCount - 1 do
            StrGrid.Cells[col, rowx] :=
              MyListCols[Integer(MySortCol.Objects[rowx])];
        end;
    finally
      StrGrid.EndUpdate;
    end;
  finally
    MySortCol.Free;
    MyListCols.Free;
  end;
end;


function TfrmCadPedidos.StringListSortCompare(List: TStringList; Index1,
  Index2: Integer): Integer;
begin
 Result := StrToIntDef(List[Index2], 0) - StrToIntDef(List[Index1], 0)
end;

procedure TfrmCadPedidos.TComparativoReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
  ShowMessage(e.Message);
end;

end.
