unit UQuadroAtividades;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListBox, FMX.Objects, FMX.ListView, FMX.Layouts, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.TabControl, FMX.Edit, FMX.DateTimeCtrls,
  FMX.Ani, System.Rtti, FMX.Grid.Style, FMX.ScrollBox, FMX.Grid,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope,
  FMX.Memo, FMX.WebBrowser,Winapi.Windows;

type
  TExecutaClickMobile = procedure(Sender: TObject; const Point: TPointF) of Object;
  TfrmQuadroAtividades = class(TForm)
    ToolBar1: TToolBar;
    lblCad: TLabel;
    btnFechar: TImage;
    Layout1: TLayout;
    imgLogoCad: TImage;
    Layout2: TLayout;
    ListaTalhoes: TListView;
    Layout3: TLayout;
    Rectangle1: TRectangle;
    Layout4: TLayout;
    Layout5: TLayout;
    Rectangle2: TRectangle;
    Layout6: TLayout;
    Layout7: TLayout;
    Rectangle3: TRectangle;
    Label2: TLabel;
    Layout8: TLayout;
    Rectangle4: TRectangle;
    Layout9: TLayout;
    btnAddAtividade: TLayout;
    Label3: TLabel;
    Image1: TImage;
    layAuxiliar: TLayout;
    TabAux: TTabControl;
    tbiAddAtividade: TTabItem;
    tbiAddMaquina: TTabItem;
    tbiAddProduto: TTabItem;
    tbiAddOcorrencia: TTabItem;
    Layout10: TLayout;
    Rectangle5: TRectangle;
    Layout11: TLayout;
    Rectangle6: TRectangle;
    Layout12: TLayout;
    Rectangle7: TRectangle;
    Layout13: TLayout;
    Label4: TLabel;
    edtAtividade: TEdit;
    EditButton1: TEditButton;
    Layout14: TLayout;
    Label5: TLabel;
    Label6: TLabel;
    edtDataIniAtividade: TDateEdit;
    edtDataFimAtividade: TDateEdit;
    Label7: TLabel;
    edtResponsavel: TEdit;
    EditButton2: TEditButton;
    Layout15: TLayout;
    btnCancela: TRectangle;
    Label8: TLabel;
    Image5: TImage;
    btnConfirmaAtividade: TRectangle;
    Label9: TLabel;
    Image6: TImage;
    Rectangle8: TRectangle;
    Layout16: TLayout;
    Label10: TLabel;
    edtObservacaoAtividade: TEdit;
    Animation: TFloatAnimation;
    imgOcorrencia: TImage;
    imgMaquinas: TImage;
    imgProdutos: TImage;
    imgFinalizar: TImage;
    GridMaquinas: TStringGrid;
    GridProdutos: TStringGrid;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    BindSourceDB2: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB2: TLinkGridToDataSource;
    BindSourceDB3: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB3: TLinkGridToDataSource;
    Rectangle9: TRectangle;
    Layout17: TLayout;
    Label11: TLabel;
    edtMaquina: TEdit;
    EditButton3: TEditButton;
    Rectangle10: TRectangle;
    Layout18: TLayout;
    Label12: TLabel;
    edtOperador: TEdit;
    Rectangle11: TRectangle;
    Layout19: TLayout;
    Layout20: TLayout;
    Label13: TLabel;
    Label14: TLabel;
    Rectangle12: TRectangle;
    Layout21: TLayout;
    Label15: TLabel;
    edtObsMaquina: TEdit;
    Layout22: TLayout;
    Rectangle13: TRectangle;
    Label16: TLabel;
    Image2: TImage;
    btnConfirmaMaquina: TRectangle;
    Label17: TLabel;
    Image3: TImage;
    Rectangle14: TRectangle;
    Layout23: TLayout;
    Label18: TLabel;
    edtProduto: TEdit;
    EditButton4: TEditButton;
    Rectangle15: TRectangle;
    Layout24: TLayout;
    Rectangle16: TRectangle;
    Layout25: TLayout;
    Label20: TLabel;
    edtObsProduto: TEdit;
    Layout26: TLayout;
    edtQtdeUtilizada: TEdit;
    Layout27: TLayout;
    Rectangle17: TRectangle;
    Label21: TLabel;
    Image4: TImage;
    btnConfirmaProduto: TRectangle;
    Label22: TLabel;
    Image7: TImage;
    Rectangle18: TRectangle;
    Layout28: TLayout;
    Label23: TLabel;
    edtTipoOcorrencia: TEdit;
    EditButton5: TEditButton;
    Layout29: TLayout;
    Rectangle19: TRectangle;
    Label24: TLabel;
    Image8: TImage;
    Rectangle20: TRectangle;
    Label25: TLabel;
    Image9: TImage;
    Rectangle21: TRectangle;
    Layout30: TLayout;
    Label26: TLabel;
    edtDescricao: TMemo;
    Label27: TLabel;
    GridOcorrencia: TStringGrid;
    BindSourceDB4: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB4: TLinkGridToDataSource;
    Layout31: TLayout;
    Rectangle22: TRectangle;
    Label28: TLabel;
    Layout32: TLayout;
    Rectangle23: TRectangle;
    Label29: TLabel;
    Layout33: TLayout;
    Rectangle24: TRectangle;
    Label30: TLabel;
    Layout34: TLayout;
    Rectangle25: TRectangle;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    edtAreaPrev: TEdit;
    edtAreaReal: TEdit;
    Label34: TLabel;
    edtDataMaquina: TDateEdit;
    edtDataProduto: TDateEdit;
    Layout35: TLayout;
    Label19: TLabel;
    Label35: TLabel;
    Rectangle26: TRectangle;
    Layout36: TLayout;
    Layout37: TLayout;
    edtDataOcorrencia: TDateEdit;
    Layout38: TLayout;
    Label36: TLabel;
    layGridMaquinas: TLayout;
    Layout39: TLayout;
    Rectangle27: TRectangle;
    Label37: TLabel;
    layProdUtilizados: TLayout;
    Layout40: TLayout;
    Rectangle28: TRectangle;
    Label38: TLabel;
    Layout42: TLayout;
    ToolBar3: TToolBar;
    lblTotalMaquinas: TLabel;
    lblTotalHoras: TLabel;
    Rectangle30: TRectangle;
    Rectangle31: TRectangle;
    recAux: TRectangle;
    layAuxiliares: TLayout;
    tabAuxCad: TTabControl;
    tbiSolidos: TTabItem;
    tbiPuverizacao: TTabItem;
    recAuxiliar: TRectangle;
    Layout46: TLayout;
    RecPulve: TRectangle;
    Layout47: TLayout;
    Layout48: TLayout;
    Layout49: TLayout;
    Label40: TLabel;
    cbxTipoAplicacaoSolido: TComboBox;
    BindSourceDB5: TBindSourceDB;
    LinkFillControlToFieldnome: TLinkFillControlToField;
    Label41: TLabel;
    cbxTipoOperacaoSolid: TComboBox;
    Label42: TLabel;
    cbxTipoOperacaoPulverizacao: TComboBox;
    Label43: TLabel;
    cbxFinalidadePulverizacao: TComboBox;
    Label44: TLabel;
    cbxCulturaPulverizacao: TComboBox;
    BindSourceDB6: TBindSourceDB;
    LinkFillControlToFieldid: TLinkFillControlToField;
    Label45: TLabel;
    edtReceituario: TEdit;
    EditButton6: TEditButton;
    Label46: TLabel;
    edtHoraIni: TEdit;
    edtHoraFim: TEdit;
    edtHorasTrabalhada: TEdit;
    edtHorasParado: TEdit;
    tbiPlantio: TTabItem;
    RecPlantio: TRectangle;
    Layout45: TLayout;
    Layout50: TLayout;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    cbxPlantioTipoOp: TComboBox;
    cbxPlantioCobertura: TComboBox;
    cbxPlantioCultura: TComboBox;
    BindSourceDB7: TBindSourceDB;
    LinkFillControlToFieldid2: TLinkFillControlToField;
    LinkFillControlToFieldid3: TLinkFillControlToField;
    laySync: TLayout;
    Rectangle32: TRectangle;
    Layout51: TLayout;
    Layout52: TLayout;
    imgSync: TImage;
    Animacao: TFloatAnimation;
    Label50: TLabel;
    ProgressBarSync: TProgressBar;
    msmoSync: TMemo;
    tbiAddVazao: TTabItem;
    Layout53: TLayout;
    Rectangle33: TRectangle;
    Label51: TLabel;
    Layout54: TLayout;
    Layout55: TLayout;
    btnCancelaVazao: TRectangle;
    Label52: TLabel;
    Image10: TImage;
    btnConfirmVazao: TRectangle;
    Label53: TLabel;
    Image11: TImage;
    Layout56: TLayout;
    chk5LTHA: TCheckBox;
    chk30LTHA: TCheckBox;
    chk20LTHA: TCheckBox;
    chk15LTHA: TCheckBox;
    chk10LTHA: TCheckBox;
    Layout57: TLayout;
    chk40LTHA: TCheckBox;
    chk100LTHA: TCheckBox;
    chk75LTHA: TCheckBox;
    chk50LTHA: TCheckBox;
    Rectangle36: TRectangle;
    imgVazao: TImage;
    Rectangle34: TRectangle;
    imgVazao1: TImage;
    layvazao: TLayout;
    Layout59: TLayout;
    Rectangle35: TRectangle;
    Label54: TLabel;
    Layout60: TLayout;
    Rectangle37: TRectangle;
    Layout61: TLayout;
    chk5LTHADet: TCheckBox;
    chk20LTHADet: TCheckBox;
    chk30LTHADet: TCheckBox;
    chk15LTHADet: TCheckBox;
    chk10LTHADet: TCheckBox;
    Layout62: TLayout;
    chk40LTHADet: TCheckBox;
    chk100LTHADet: TCheckBox;
    chk75LTHADet: TCheckBox;
    chk50LTHADet: TCheckBox;
    RecScroolBox: TRectangle;
    listaDetOperacao: TVertScrollBox;
    Layout58: TLayout;
    Label39: TLabel;
    Layout43: TLayout;
    ToolBar4: TToolBar;
    lblTotalProdutos: TLabel;
    Layout44: TLayout;
    Layout41: TLayout;
    ToolBar2: TToolBar;
    lblTotalOcorrencia: TLabel;
    Label81: TLabel;
    cbxQualidadeCobertura: TComboBox;
    Layout63: TLayout;
    Label1: TLabel;
    cbxSetor: TComboBox;
    Label55: TLabel;
    cbxAtividadeF: TComboBox;
    GroupBox1: TGroupBox;
    Label56: TLabel;
    Label57: TLabel;
    edtDataInicio: TDateEdit;
    edtDataFim: TDateEdit;
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure cbxSetorChange(Sender: TObject);
    procedure btnAddAtividadeClick(Sender: TObject);
    procedure ListaTalhoesItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure EditButton2Click(Sender: TObject);
    procedure EditButton1Click(Sender: TObject);
    procedure btnCancelaClick(Sender: TObject);
    procedure btnConfirmaAtividadeClick(Sender: TObject);
    procedure EditButton3Click(Sender: TObject);
    procedure EditButton4Click(Sender: TObject);
    procedure edtQtdeUtilizadaKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure EditButton5Click(Sender: TObject);
    procedure btnConfirmaMaquinaClick(Sender: TObject);
    procedure btnConfirmaProdutoClick(Sender: TObject);
    procedure Rectangle20Click(Sender: TObject);
    procedure cbxTipoAplicacaoSolidoChange(Sender: TObject);
    procedure cbxCulturaPulverizacaoChange(Sender: TObject);
    procedure EditButton6Click(Sender: TObject);
    procedure edtHoraIniKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure edtHoraFimKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure edtHorasParadoKeyUp(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure edtHoraIniChangeTracking(Sender: TObject);
    procedure cbxPlantioCoberturaChange(Sender: TObject);
    procedure cbxPlantioCulturaChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure btnConfirmVazaoClick(Sender: TObject);
  private
    vIdTalhao,vIdAtividade,vIdSafra,vIdResponsavel,vIdMaquina,vIdProduto,
    vIdTipoOcorrencia,idOpClick,vAreaTalhao,vIdTipoAplicacaoSolido,
    vIdCulturaPulverizacao,vIdCulturaPlantio,vIdReceituario,vIdCobertura:string;
    vFinalizandoOP:Integer;
    procedure GeraLista(vIdSetor:string);
    procedure CarregaSetor;
    procedure MyShowMessage(msg: string;btnCancel:Boolean);
    procedure LimpaCampos;
    procedure SomarColunas;
  public
    var
     vFiltroAtividades:string;
    procedure AddItemScrolH();
    procedure ClickItem(Sender: TObject);
    procedure ClickAddMaquina(Sender: TObject);
    procedure ClickAddProduto(Sender: TObject);
    procedure ClickAddOcorrencia(Sender: TObject);
    procedure ClickFinalizaOp(Sender: TObject);
    procedure ClickAddVazao(Sender: TObject);
    procedure AbreDetalhesOp(vIdOp:string);

  end;

var
  frmQuadroAtividades: TfrmQuadroAtividades;

implementation

{$R *.fmx}

uses UPrincipal, DataContext, UAuxOperacoes, UUsuarios, UMsgDlg, UCadMaquina,
  UProdutos, UAuxTipoOcorrencia, UReceituario, dmReplicacao, DmReplicaFaz;

procedure TfrmQuadroAtividades.btnCancelaClick(Sender: TObject);
begin
  edtAtividade.Text           :='';
  edtResponsavel.Text         :='';
  edtObservacaoAtividade.Text :='';
  edtDataFimAtividade.Text    :='';
  layAuxiliar.Visible         := false;
end;

procedure TfrmQuadroAtividades.btnConfirmaAtividadeClick(Sender: TObject);
begin
 if edtAtividade.Text.Length=0 then
 begin
   MyShowMessage('Informe a Atividade!!',false);
   edtAtividade.SetFocus;
   Exit;
 end;
 if vIdAtividade='1' then
 begin
   if cbxTipoAplicacaoSolido.ItemIndex=-1 then
   begin
    MyShowMessage('Informe o Tipo de Aplicação Solido!!',false);
    cbxTipoAplicacaoSolido.SetFocus;
    Exit;
   end;
   if cbxTipoOperacaoSolid.ItemIndex=-1 then
   begin
    MyShowMessage('Informe o Tipo de Operação!!',false);
    cbxTipoOperacaoSolid.SetFocus;
    Exit;
   end;
 end;
 if vIdAtividade='2' then
 begin
   if cbxTipoOperacaoPulverizacao.ItemIndex=-1 then
   begin
    MyShowMessage('Informe o Tipo de Operação!!',false);
    cbxTipoOperacaoPulverizacao.SetFocus;
    Exit;
   end;
   if cbxFinalidadePulverizacao.ItemIndex=-1 then
   begin
    MyShowMessage('Informe a Finalidade!!',false);
    cbxFinalidadePulverizacao.SetFocus;
    Exit;
   end;
   if cbxCulturaPulverizacao.ItemIndex=-1 then
   begin
    MyShowMessage('Informe a Cultura!!',false);
    cbxCulturaPulverizacao.SetFocus;
    Exit;
   end;
   if edtReceituario.Text.Length=0 then
   begin
    MyShowMessage('Informe o Receituario!!',false);
    edtReceituario.SetFocus;
    Exit;
   end;
 end;
 if vIdAtividade='3' then
 begin
   if cbxPlantioCobertura.ItemIndex=-1 then
   begin
    MyShowMessage('Informe a Cobertura!!',false);
    cbxPlantioCobertura.SetFocus;
    Exit;
   end;
   if cbxQualidadeCobertura.ItemIndex=-1 then
   begin
    MyShowMessage('Informe a Qualidade da Cobertura!!',false);
    cbxQualidadeCobertura.SetFocus;
    Exit;
   end;
   if cbxPlantioCultura.ItemIndex=-1 then
   begin
    MyShowMessage('Informe a Cultura!!',false);
    cbxPlantioCultura.SetFocus;
    Exit;
   end;
   if cbxPlantioTipoOp.ItemIndex=-1 then
   begin
    MyShowMessage('Informe o Tipo de Operacao!!',false);
    cbxPlantioTipoOp.SetFocus;
    Exit;
   end;
 end;
 if edtResponsavel.Text.Length=0 then
 begin
   MyShowMessage('Informe o Responsavel!!',false);
   edtResponsavel.SetFocus;
   Exit;
 end;
 if edtDataIniAtividade.Text.Length=0 then
 begin
   MyShowMessage('Informe a Data de Inicio!!',false);
   edtDataIniAtividade.SetFocus;
   Exit;
 end;
 if vFinalizandoOP=1 then
 begin
  if edtDataFimAtividade.Text.Length=0 then
  begin
    MyShowMessage('Informe a Data Fim!!',false);
    edtDataFimAtividade.SetFocus;
    Exit;
  end;
  if edtAreaReal.Text.Length=0 then
  begin
    MyShowMessage('Informe a Area Realizada!!',false);
    edtAreaReal.SetFocus;
    Exit;
  end;
  dbCtx.TOperacaoSafraTalhaoidoperacao.AsString         := vIdAtividade;
  dbCtx.TOperacaoSafraTalhaoidResponsavel.AsString      := vIdResponsavel;
  dbCtx.TOperacaoSafraTalhaodatainicio.AsDateTime       := edtDataIniAtividade.Date;
  dbCtx.TOperacaoSafraTalhaodatafim.AsDateTime          := edtDataFimAtividade.Date;
  dbCtx.TOperacaoSafraTalhaoareaPrevista.Asstring       := edtAreaPrev.Text;
  dbCtx.TOperacaoSafraTalhaoarearealizada.Asstring      := edtAreaReal.Text;
  dbCtx.TOperacaoSafraTalhaoobservacao.AsString         := edtObservacaoAtividade.Text;
  dbCtx.TOperacaoSafraTalhaodataalteracao.AsDateTime    := date;
  dbCtx.TOperacaoSafraTalhaoidusuarioalteracao.AsString := dbCtx.vIdUsuarioLogado;
  if vIdAtividade='1' then
  begin
    dbCtx.TOperacaoSafraTalhaotipoterraaereo.AsString        := cbxTipoOperacaoSolid.Selected.Text;
    dbCtx.TOperacaoSafraTalhaoidtipoaplicacaosolido.AsString := vIdTipoAplicacaoSolido;
  end;
  if vIdAtividade='2' then
  begin
    dbCtx.TOperacaoSafraTalhaotipoterraaereo.AsString        := cbxTipoOperacaoPulverizacao.Selected.Text;
    dbCtx.TOperacaoSafraTalhaofinalidade.AsString            := cbxFinalidadePulverizacao.Selected.Text;
    dbCtx.TOperacaoSafraTalhaoidcultura.AsString             := vIdCulturaPulverizacao;
    dbCtx.TOperacaoSafraTalhaoidreceituario.AsString         := vIdreceituario;
  end;
  if vIdAtividade='3' then
  begin
    dbCtx.TOperacaoSafraTalhaoidcultura.AsString             := vIdCulturaPlantio;
    dbCtx.TOperacaoSafraTalhaoidcobertura.AsString           := vIdCobertura;
    dbCtx.TOperacaoSafraTalhaoqualidadecobertura.AsString    := cbxQualidadeCobertura.Selected.Text;
    dbCtx.TOperacaoSafraTalhaotipoterraaereo.AsString        := cbxPlantioTipoOp.Selected.Text;
  end;
  dbCtx.TOperacaoSafraTalhaostatus.AsInteger            := 2;
  try
    dbCtx.TOperacaoSafraTalhao.ApplyUpdates(-1);
    MyShowMessage('Atividade Finalizada com sucesso!!',false);
//    if dbCtx.vTipoBDConfig=2 then
//    begin
//      TThread.Synchronize(nil,procedure
//       begin
//         MyShowMessage('Aguarde Sincronizando Dados',false);
//         DataModule1.ReplicaOperacaoTalhao('');
//         layAuxiliar.Visible := false;
//         AddItemScrolH();
//         inherited;
//       end);
//    end
//    else
//    begin
     layAuxiliar.Visible := false;
     AddItemScrolH();
     inherited;
//    end
  except
    on E: Exception do
     myShowMessage('Erro ao Finalizar Atividade:'+E.Message,false);
  end;
 end
 else
 begin
   dbCtx.TOperacaoSafraTalhaoidoperacao.AsString     := vIdAtividade;
   dbCtx.TOperacaoSafraTalhaoidResponsavel.AsString  := vIdResponsavel;
   dbCtx.TOperacaoSafraTalhaodatainicio.AsDateTime   := edtDataIniAtividade.Date;
   dbCtx.TOperacaoSafraTalhaoareaPrevista.Asstring   := edtAreaPrev.Text;
   if edtDataFimAtividade.Text.Length>0 then
    dbCtx.TOperacaoSafraTalhaodatafim.AsDateTime     := edtDataFimAtividade.Date;
   if edtAreaReal.Text.Length>0 then
    dbCtx.TOperacaoSafraTalhaoareaRealizada.Asstring := edtAreaReal.Text;
   dbCtx.TOperacaoSafraTalhaoobservacao.AsString    := edtObservacaoAtividade.Text;
   if vIdAtividade='1' then
   begin
     dbCtx.TOperacaoSafraTalhaotipoterraaereo.AsString        := cbxTipoOperacaoSolid.Selected.Text;
     dbCtx.TOperacaoSafraTalhaoidtipoaplicacaosolido.AsString := vIdTipoAplicacaoSolido;
   end;
   if vIdAtividade='2' then
   begin
     dbCtx.TOperacaoSafraTalhaotipoterraaereo.AsString        := cbxTipoOperacaoPulverizacao.Selected.Text;
     dbCtx.TOperacaoSafraTalhaofinalidade.AsString            := cbxFinalidadePulverizacao.Selected.Text;
     dbCtx.TOperacaoSafraTalhaoidcultura.AsString             := vIdCulturaPulverizacao;
     dbCtx.TOperacaoSafraTalhaoidreceituario.AsString         := vIdreceituario;
   end;
   if vIdAtividade='3' then
   begin
      dbCtx.TOperacaoSafraTalhaoidcultura.AsString             := vIdCulturaPlantio;
      dbCtx.TOperacaoSafraTalhaoidcobertura.AsString           := vIdCobertura;
      dbCtx.TOperacaoSafraTalhaoqualidadecobertura.AsString    := cbxQualidadeCobertura.Selected.Text;
      dbCtx.TOperacaoSafraTalhaotipoterraaereo.AsString        := cbxPlantioTipoOp.Selected.Text;
   end;
   try
     dbCtx.TOperacaoSafraTalhao.ApplyUpdates(-1);
     MyShowMessage('Atividade Adicionada com sucesso!!',false);
//     if dbCtx.vTipoBDConfig=2 then
//     begin
//       TThread.Synchronize(nil,procedure
//       begin
//        MyShowMessage('Aguarde Sincronizando Dados',false);
//        DataModule1.ReplicaOperacaoTalhao('');
//        layAuxiliar.Visible := false;
//        AddItemScrolH();
//        inherited;
//       end);
//     end
//     else
//     begin
      layAuxiliar.Visible := false;
      AddItemScrolH();
      inherited;
//     end;
   except
     on E: Exception do
      myShowMessage('Erro ao salvar Atividade:'+E.Message,false);
   end;
 end;
end;

procedure TfrmQuadroAtividades.btnConfirmaMaquinaClick(Sender: TObject);
var
 vHorasTrabalhada:string;
begin
 if edtMaquina.Text.Length=0 then
 begin
   MyShowMessage('Informe a Maquina!!',false);
   edtMaquina.SetFocus;
   Exit;
 end;
 if edtOperador.Text.Length=0 then
 begin
   MyShowMessage('Informe o Operador!!',false);
   edtOperador.SetFocus;
   Exit;
 end;
 if edtHoraIni.Text.Length=0 then
 begin
   MyShowMessage('Informe a Hora de Inicio!!',false);
   edtHoraIni.SetFocus;
   Exit;
 end;
 if edtHoraFim.Text.Length=0 then
 begin
   MyShowMessage('Informe a Hora Fim!!',false);
   edtHoraFim.SetFocus;
   Exit;
 end;
 if edtDataMaquina.Text.Length=0 then
 begin
   MyShowMessage('Informe a Data!!',false);
   edtDataMaquina.SetFocus;
   Exit;
 end;
 vHorasTrabalhada :=FormatFloat('####,##0.00',((strToFloat(edtHoraFim.Text)-strToFloat(edtHoraIni.Text)))-
  (strToFloat(edtHorasParado.Text)));
 dbCtx.TMaquinasOperacaoidmaquina.AsString         := vIdMaquina;
 dbCtx.TMaquinasOperacaooperador.AsString          := edtOperador.Text;
 dbCtx.TMaquinasOperacaohorainicio.AsString        := edtHoraIni.Text;
 dbCtx.TMaquinasOperacaohorafim.AsString           := edtHoraFim.Text;
 dbCtx.TMaquinasOperacaohorastrabalhada.asstring   := vHorasTrabalhada;
 dbCtx.TMaquinasOperacaohoraparada.AsString        := edtHorasParado.Text;
 dbCtx.TMaquinasOperacaodata.AsDateTime            := edtDataMaquina.date;
 dbCtx.TMaquinasOperacaoobservacao.AsString        := edtObsMaquina.Text;
 try
   dbCtx.TMaquinasOperacao.ApplyUpdates(-1);
   MyShowMessage('Maquina Adicionada com sucesso!!',false);
//   if dbCtx.vTipoBDConfig=2 then
//   begin
//    TThread.Synchronize(nil,procedure
//    begin
//     MyShowMessage('Aguarde Sincronizando Dados',false);
//     DataModule1.ReplicaOperacaoMaquinaTalhao('');
//    end);
//   end;
   layAuxiliar.Visible := false;
   AddItemScrolH();
   AbreDetalhesOp(idOpClick);
 except
   on E: Exception do
    myShowMessage('Erro ao salvar Maquina:'+E.Message,false);
 end;
end;

procedure TfrmQuadroAtividades.btnConfirmaProdutoClick(Sender: TObject);
begin
 if edtProduto.Text.Length=0 then
 begin
   MyShowMessage('Informe o Produto!!',false);
   edtProduto.SetFocus;
   Exit;
 end;
 if(edtQtdeUtilizada.Text.Length=0) or (edtQtdeUtilizada.Text='0') then
 begin
   MyShowMessage('Informe a Quantidade!!',false);
   edtQtdeUtilizada.SetFocus;
   Exit;
 end;
 if(edtDataProduto.Text.Length=0) then
 begin
   MyShowMessage('Informe a Data!!',false);
   edtDataProduto.SetFocus;
   Exit;
 end;
 dbCtx.TProdutosOperacaoidproduto.AsString        := vIdProduto;
 dbCtx.TProdutosOperacaoqtdeutilidado.AsString    := edtQtdeUtilizada.Text;
 dbCtx.TProdutosOperacaoobservacao.AsString       := edtObsProduto.Text;
 dbCtx.TProdutosOperacaodata.AsDateTime           := edtDataProduto.Date;
 try
   dbCtx.TProdutosOperacao.ApplyUpdates(-1);
   MyShowMessage('Produto Adicionada com sucesso!!',false);
//   if dbCtx.vTipoBDConfig=2 then
//   begin
//     TThread.Synchronize(nil,procedure
//     begin
//       MyShowMessage('Aguarde Sincronizando Dados',false);
//       DataModule1.ReplicaOperacaoProdutosTalhao('');
//     end);
//   end;
   layAuxiliar.Visible := false;
   AddItemScrolH();
   AbreDetalhesOp(idOpClick);
 except
   on E: Exception do
    myShowMessage('Erro ao salvar Produto:'+E.Message,false);
 end;
end;

procedure TfrmQuadroAtividades.btnConfirmVazaoClick(Sender: TObject);
begin
 if (not chk5LTHA.IsChecked) and (not chk10LTHA.IsChecked) and (not chk15LTHA.IsChecked)and
 (not chk20LTHA.IsChecked)and (not chk30LTHA.IsChecked) and (not chk40LTHA.IsChecked)and
 (not chk50LTHA.IsChecked) and (not chk75LTHA.IsChecked) and (not chk100LTHA.IsChecked) then
 begin
   MyShowMessage('Informe o Pelo menos uma vazão!!',false);
   edtTipoOcorrencia.SetFocus;
   Exit;
 end;
 if chk5LTHA.IsChecked then
  dbCtx.TVazaoOperacaocincoltha.AsInteger          :=1
 else
  dbCtx.TVazaoOperacaocincoltha.AsInteger          :=0;

 if chk10LTHA.IsChecked then
  dbCtx.TVazaoOperacaodezltha.AsInteger            :=1
 else
  dbCtx.TVazaoOperacaodezltha.AsInteger            :=0;

 if chk15LTHA.IsChecked then
  dbCtx.TVazaoOperacaoquinzeltha.AsInteger         :=1
 else
  dbCtx.TVazaoOperacaoquinzeltha.AsInteger         :=0;

 if chk20LTHA.IsChecked then
  dbCtx.TVazaoOperacaovinteltha.AsInteger          :=1
 else
  dbCtx.TVazaoOperacaovinteltha.AsInteger          :=0;

 if chk30LTHA.IsChecked then
  dbCtx.TVazaoOperacaotrintaltha.AsInteger         :=1
 else
  dbCtx.TVazaoOperacaotrintaltha.AsInteger         :=0;

 if chk40LTHA.IsChecked then
  dbCtx.TVazaoOperacaoquarentaltha.AsInteger       :=1
 else
  dbCtx.TVazaoOperacaoquarentaltha.AsInteger       :=0;

 if chk50LTHA.IsChecked then
  dbCtx.TVazaoOperacaocinquentaltha.AsInteger      :=1
 else
  dbCtx.TVazaoOperacaocinquentaltha.AsInteger      :=0;

 if chk75LTHA.IsChecked then
  dbCtx.TVazaoOperacaosetentaecincoltha.AsInteger  :=1
 else
  dbCtx.TVazaoOperacaosetentaecincoltha.AsInteger  :=0;

 if chk100LTHA.IsChecked then
  dbCtx.TVazaoOperacaocemltha.AsInteger            :=1
 else
  dbCtx.TVazaoOperacaocemltha.AsInteger            :=0;

 try
   dbCtx.TVazaoOperacao.ApplyUpdates(-1);
   MyShowMessage('Vazão Adicionada com sucesso!!',false);
//   if dbCtx.vTipoBDConfig=2 then
//   begin
//     TThread.Synchronize(nil,procedure
//     begin
//       MyShowMessage('Aguarde Sincronizando Dados',false);
//       DataModule1.ReplicaOperacaoVazaoTalhao('');
//     end);
//   end;
   layAuxiliar.Visible := false;
   AddItemScrolH();
   AbreDetalhesOp(idOpClick);
 except
   on E: Exception do
    myShowMessage('Erro ao salvar Vazao:'+E.Message,false);
 end;
end;

procedure TfrmQuadroAtividades.btnFecharClick(Sender: TObject);
begin
 close;
end;

procedure TfrmQuadroAtividades.CarregaSetor;
begin
  cbxSetor.Items.Clear;
  cbxSetor.Items.Add('Todos');
  dbCtx.TSetores.Close;
  dbCtx.TSetores.Open;
  dbCtx.TSetores.First;
  while not dbCtx.TSetores.Eof do
  begin
    cbxSetor.Items.AddObject(dbCtx.TSetoresnome.AsString,TObject(dbCtx.TSetoresid.AsInteger));
    dbCtx.TSetores.Next;
  end;
  cbxSetor.ItemIndex :=0;
end;

procedure TfrmQuadroAtividades.cbxCulturaPulverizacaoChange(Sender: TObject);
begin
 if cbxCulturaPulverizacao.ItemIndex>-1 then
  vIdCulturaPulverizacao := LinkFillControlToFieldid.BindList.GetSelectedValue.AsString;
end;

procedure TfrmQuadroAtividades.cbxPlantioCoberturaChange(Sender: TObject);
begin
 if cbxPlantioCobertura.ItemIndex>-1 then
  vIdCobertura := LinkFillControlToFieldid2.BindList.GetSelectedValue.AsString;
end;

procedure TfrmQuadroAtividades.cbxPlantioCulturaChange(Sender: TObject);
begin
 if cbxPlantioCultura.ItemIndex>-1 then
  vIdCulturaPlantio := LinkFillControlToFieldid.BindList.GetSelectedValue.AsString;
end;

procedure TfrmQuadroAtividades.cbxSetorChange(Sender: TObject);
begin
 if cbxSetor.ItemIndex>0 then
 begin
   vIdTalhao := IntToStr(Integer(cbxSetor.Items.Objects[cbxSetor.ItemIndex]));
   GeraLista(vIdTalhao);
 end
 else
  GeraLista('');
end;

procedure TfrmQuadroAtividades.cbxTipoAplicacaoSolidoChange(Sender: TObject);
begin
 if cbxTipoAplicacaoSolido.ItemIndex>-1 then
  vIdTipoAplicacaoSolido := LinkFillControlToFieldnome.BindList.GetSelectedValue.AsString;
end;

procedure TfrmQuadroAtividades.ClickAddMaquina(Sender: TObject);
begin
 idOpClick := TLayout(Sender).TagString;
 vIdAtividade := dbCtx.RetornaIdOperacao(idOpClick);
 LimpaCampos;
 dbCtx.TMaquinasOperacao.Close;
 dbCtx.TMaquinasOperacao.Open;
 dbCtx.TMaquinasOperacao.Insert;
 dbCtx.TMaquinasOperacaoidoperacaotalhao.AsString  := TImage(Sender).TagString;
 dbCtx.TMaquinasOperacaoidusuario.AsString         := dbCtx.vIdUsuarioLogado;
 layAuxiliar.Opacity := 0;
 TabAux.ActiveTab    := tbiAddMaquina;
 layAuxiliar.Visible := true;
 Animation.Start;
end;

procedure TfrmQuadroAtividades.ClickAddOcorrencia(Sender: TObject);
begin
 idOpClick := TLayout(Sender).TagString;
 vIdAtividade := dbCtx.RetornaIdOperacao(idOpClick);
 LimpaCampos;
 dbCtx.TOcorrenciaOperacao.Close;
 dbCtx.TOcorrenciaOperacao.Open;
 dbCtx.TOcorrenciaOperacao.Insert;
 dbCtx.TOcorrenciaOperacaoidoperacaotalhao.AsString  := TImage(Sender).TagString;
 dbCtx.TOcorrenciaOperacaoidusuario.AsString         := dbCtx.vIdUsuarioLogado;
 layAuxiliar.Opacity := 0;
 TabAux.ActiveTab    := tbiAddOcorrencia;
 layAuxiliar.Visible := true;
 Animation.Start;
end;

procedure TfrmQuadroAtividades.ClickAddProduto(Sender: TObject);
begin
 idOpClick := TLayout(Sender).TagString;
 vIdAtividade := dbCtx.RetornaIdOperacao(idOpClick);
 LimpaCampos;
 dbCtx.TProdutosOperacao.Close;
 dbCtx.TProdutosOperacao.Open;
 dbCtx.TProdutosOperacao.Insert;
 dbCtx.TProdutosOperacaoidoperacaotalhao.AsString  := TImage(Sender).TagString;
 dbCtx.TProdutosOperacaoidusuario.AsString         := dbCtx.vIdUsuarioLogado;
 layAuxiliar.Opacity := 0;
 TabAux.ActiveTab    := tbiAddProduto;
 layAuxiliar.Visible := true;
 Animation.Start;
end;

procedure TfrmQuadroAtividades.ClickAddVazao(Sender: TObject);
begin
 idOpClick := TLayout(Sender).TagString;
 vIdAtividade := dbCtx.RetornaIdOperacao(idOpClick);
 LimpaCampos;

 dbCtx.TVazaoOperacao.Close;
 dbCtx.TVazaoOperacao.Open;
 dbCtx.TVazaoOperacao.Filtered := false;
 dbCtx.TVazaoOperacao.Filter   := 'idoperacaotalhao='+TImage(Sender).TagString;
 dbCtx.TVazaoOperacao.Filtered := true;
 if dbCtx.TVazaoOperacao.IsEmpty then
  dbCtx.TVazaoOperacao.Insert
 else
 begin
   dbCtx.TVazaoOperacao.Edit;
   chk5LTHA.IsChecked  := dbCtx.TVazaoOperacaocincoltha.AsInteger=1;
   chk10LTHA.IsChecked := dbCtx.TVazaoOperacaodezltha.AsInteger=1;
   chk15LTHA.IsChecked := dbCtx.TVazaoOperacaoquinzeltha.AsInteger=1;
   chk20LTHA.IsChecked := dbCtx.TVazaoOperacaovinteltha.AsInteger=1;
   chk30LTHA.IsChecked := dbCtx.TVazaoOperacaotrintaltha.AsInteger=1;
   chk40LTHA.IsChecked := dbCtx.TVazaoOperacaoquarentaltha.AsInteger=1;
   chk50LTHA.IsChecked := dbCtx.TVazaoOperacaocinquentaltha.AsInteger=1;
   chk75LTHA.IsChecked := dbCtx.TVazaoOperacaosetentaecincoltha.AsInteger=1;
   chk100LTHA.IsChecked:= dbCtx.TVazaoOperacaocemltha.AsInteger=1;
 end;
 dbCtx.TVazaoOperacaoidoperacaotalhao.AsString  := TImage(Sender).TagString;
 dbCtx.TVazaoOperacaoidusuario.AsString         := dbCtx.vIdUsuarioLogado;
 layAuxiliar.Opacity := 0;
 TabAux.ActiveTab    := tbiAddVazao;
 layAuxiliar.Visible := true;
 Animation.Start;
end;

procedure TfrmQuadroAtividades.ClickFinalizaOp(Sender: TObject);
var
 vPendencia:string;
begin
 idOpClick    := TLayout(Sender).TagString;
 vIdAtividade := dbCtx.RetornaIdOperacao(idOpClick);
 MyShowMessage('Deseja Realmente Finalizar essa Operação?',true);
 case frmPrincipal.vMsgConfirma of
   1:begin
      try
          dbCtx.AlteraFlaSynAWS_ZERO('operacaosafratalhao',idOpClick);
          vFinalizandoOP       :=1;
          dbCtx.TOperacaoSafraTalhao.Close;
          dbCtx.TOperacaoSafraTalhao.Open;

          dbCtx.TOperacaoSafraTalhao.Filtered:= false;
          dbCtx.TOperacaoSafraTalhao.Filter  := 'ID='+idOpClick;
          dbCtx.TOperacaoSafraTalhao.Filtered:= true;
          dbCtx.TOperacaoSafraTalhao.Edit;

          dbCtx.TAuxTipoOperacaoSolido.Close;
          dbCtx.TAuxTipoOperacaoSolido.Open;

          edtAtividade.Enabled        := false;
          edtAtividade.Text           := dbCtx.QryOperacaoSafraTalhaooperacao.AsString;
          edtDataIniAtividade.date    := dbCtx.QryOperacaoSafraTalhaodatainicio.AsDateTime;
          edtDataFimAtividade.Text    := dbCtx.QryOperacaoSafraTalhaodatafim.AsString;
          edtAreaPrev.Text            := dbCtx.QryOperacaoSafraTalhaoareaprevista.AsString;
          edtAreaReal.Text            := dbCtx.QryOperacaoSafraTalhaoarearealizada.AsString;
          edtResponsavel.Text         := dbCtx.QryOperacaoSafraTalhaoresponsavel.AsString;
          edtObservacaoAtividade.Text := dbCtx.QryOperacaoSafraTalhaoobservacao.AsString;
          vIdAtividade                := dbCtx.QryOperacaoSafraTalhaoidoperacao.AsString;
          vIdResponsavel              := dbCtx.QryOperacaoSafraTalhaoidresponsavel.AsString;

          if vIdAtividade='1' then
          begin
            tabAuxCad.TabPosition := TTabPosition.None;
            tabAuxCad.ActiveTab   := tbiSolidos;
            dbCtx.TAuxTipoOperacaoSolido.Close;
            dbCtx.TAuxTipoOperacaoSolido.Open;
            cbxTipoAplicacaoSolido.ItemIndex := cbxTipoAplicacaoSolido.Items.IndexOf(dbCtx.QryOperacaoSafraTalhaotipoterraaereo.AsString);
            vIdTipoAplicacaoSolido           := dbCtx.QryOperacaoSafraTalhaoidtipoaplicacaosolido.AsString;
          end;
          if vIdAtividade='2' then
          begin
            tabAuxCad.TabPosition := TTabPosition.None;
            tabAuxCad.ActiveTab   := tbiPuverizacao;
            dbCtx.TAuxCulturas.Close;
            dbCtx.TAuxCulturas.Open;
            cbxTipoOperacaoPulverizacao.ItemIndex               := cbxTipoOperacaoPulverizacao.Items.IndexOf(dbCtx.QryOperacaoSafraTalhaotipoterraaereo.AsString);
            vIdCulturaPulverizacao                              := dbCtx.QryOperacaoSafraTalhaoidcultura.AsString;
            cbxCulturaPulverizacao.ItemIndex                    := cbxCulturaPulverizacao.Items.IndexOf(dbCtx.QryOperacaoSafraTalhaocultura.AsString);
            cbxFinalidadePulverizacao.ItemIndex                 := cbxFinalidadePulverizacao.Items.IndexOf(dbCtx.QryOperacaoSafraTalhaofinalidade.AsString);
            vIdReceituario                                      := dbCtx.QryOperacaoSafraTalhaoidreceituario.AsString;
            edtReceituario.Text                                 := dbCtx.QryOperacaoSafraTalhaoreceituario.AsString;
          end;
          if vIdAtividade='3' then
          begin
            tabAuxCad.TabPosition := TTabPosition.None;
            tabAuxCad.ActiveTab   := tbiPlantio;
            dbCtx.TAuxCulturas.Close;
            dbCtx.TAuxCulturas.Open;
            dbCtx.TAuxCobertura.Close;
            dbCtx.TAuxCobertura.Open;
          end;
//
//
//
//          if dbCtx.QryOperacaoSafraTalhaoidoperacao.AsInteger=1 then
//          begin
//           cbxTipoAplicacaoSolido.ItemIndex                    := cbxTipoAplicacaoSolido.Items.IndexOf(dbCtx.QryOperacaoSafraTalhaotipoterraaereo.AsString);
//
//           vIdTipoAplicacaoSolido                              := dbCtx.QryOperacaoSafraTalhaoidtipoaplicacaosolido.AsString;
//           TabAuxCad.TabPosition                               := TTabPosition.None;
//           TabAuxCad.ActiveTab                                 := tbiSolidos;
//          end;
//          if dbCtx.QryOperacaoSafraTalhaoidoperacao.AsInteger=2 then
//          begin
//           cbxTipoOperacaoPulverizacao.ItemIndex               := cbxTipoOperacaoPulverizacao.Items.IndexOf(dbCtx.QryOperacaoSafraTalhaotipoterraaereo.AsString);
//           vIdCulturaPulverizacao                              := dbCtx.QryOperacaoSafraTalhaoidcultura.AsString;
//           cbxCulturaPulverizacao.ItemIndex                    := cbxCulturaPulverizacao.Items.IndexOf(dbCtx.QryOperacaoSafraTalhaocultura.AsString);
//           cbxFinalidadePulverizacao.ItemIndex                 := cbxFinalidadePulverizacao.Items.IndexOf(dbCtx.QryOperacaoSafraTalhaofinalidade.AsString);
//           vIdReceituario                                      := dbCtx.QryOperacaoSafraTalhaoidreceituario.AsString;
//           edtReceituario.Text                                 := dbCtx.QryOperacaoSafraTalhaoreceituario.AsString;
//           TabAuxCad.TabPosition                               := TTabPosition.None;
//           TabAuxCad.ActiveTab                                 := tbiSolidos;
//          end;
          layAuxiliar.Opacity := 0;
          TabAux.ActiveTab    := tbiAddAtividade;
          layAuxiliar.Visible := true;
          layAuxiliares.Visible := true;
          Animation.Start;
       except
       on E : Exception do
        ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
      end;
   end;
 end;
end;

procedure TfrmQuadroAtividades.ClickItem(Sender: TObject);
begin
 TThread.Synchronize(nil,procedure
 begin
   idOpClick := TLayout(Sender).TagString;
   vIdAtividade := dbCtx.RetornaIdOperacao(idOpClick);
   AbreDetalhesOp(idOpClick);
   listaDetOperacao.Visible := true;
 end);
end;

procedure TfrmQuadroAtividades.EditButton1Click(Sender: TObject);
begin
 frmAuxOperacao := TfrmAuxOperacao.Create(Self);
  try
    frmAuxOperacao.ShowModal;
  finally
    recAux.Height         :=65;
    vIdAtividade          := dbCtx.TAuxOperacaoid.AsString;
    edtAtividade.Text     := dbCtx.TAuxOperacaonome.AsString;
    if vIdAtividade='1' then
    begin
      tabAuxCad.TabPosition := TTabPosition.None;
      tabAuxCad.ActiveTab   := tbiSolidos;
      dbCtx.TAuxTipoOperacaoSolido.Close;
      dbCtx.TAuxTipoOperacaoSolido.Open;
      layAuxiliares.Visible := true;
    end;
    if vIdAtividade='2' then
    begin
      tabAuxCad.TabPosition := TTabPosition.None;
      tabAuxCad.ActiveTab   := tbiPuverizacao;
      dbCtx.TAuxCulturas.Close;
      dbCtx.TAuxCulturas.Open;
      layAuxiliares.Visible := true;
    end;
    if vIdAtividade='3' then
    begin
      tabAuxCad.TabPosition := TTabPosition.None;
      tabAuxCad.ActiveTab   := tbiPlantio;
      dbCtx.TAuxCulturas.Close;
      dbCtx.TAuxCulturas.Open;
      dbCtx.TAuxCobertura.Close;
      dbCtx.TAuxCobertura.Open;
      layAuxiliares.Visible := true;
    end;
    frmAuxOperacao.Free;
  end;
end;

procedure TfrmQuadroAtividades.EditButton2Click(Sender: TObject);
begin
 frmUsuarios := TfrmUsuarios.Create(Self);
  try
    frmUsuarios.ShowModal;
  finally
    vIDResponsavel        := dbCtx.TUsuarioid.AsString;
    edtResponsavel.Text   := dbCtx.TUsuarionome.AsString;
    frmUsuarios.Free;
  end;
end;

procedure TfrmQuadroAtividades.EditButton3Click(Sender: TObject);
begin
  frmCadMaquinaVeiculo := TfrmCadMaquinaVeiculo.Create(Self);
  try
    frmCadMaquinaVeiculo.ShowModal;
  finally
    vIdMaquina            := dbCtx.TMaquinasid.AsString;
    edtMaquina.Text       := dbCtx.TMaquinasprefixo.AsString;
    frmCadMaquinaVeiculo.Free;
  end;
end;

procedure TfrmQuadroAtividades.EditButton4Click(Sender: TObject);
begin
 frmCadProdutos := TfrmCadProdutos.Create(Self);
  try
    frmCadProdutos.ShowModal;
  finally
    vIdProduto            := dbCtx.TProdutosid.AsString;
    edtProduto.Text       := dbCtx.TProdutosnome.AsString;
    frmCadProdutos.Free;
  end;
end;

procedure TfrmQuadroAtividades.EditButton5Click(Sender: TObject);
begin
  frmAuxtipoOcorrencia := TfrmAuxtipoOcorrencia.Create(Self);
  try
    frmAuxtipoOcorrencia.ShowModal;
  finally
    vIdTipoOcorrencia            := dbCtx.TAuxTipoOcorrenciaid.AsString;
    edtTipoOcorrencia.Text       := dbCtx.TAuxTipoOcorrencianome.AsString;
    frmAuxtipoOcorrencia.Free;
  end;
end;

procedure TfrmQuadroAtividades.EditButton6Click(Sender: TObject);
begin
 frmReceituario := TfrmReceituario.Create(Self);
  try
    frmReceituario.ShowModal;
  finally
    vIdReceituario          := dbCtx.TReceituarioid.AsString;
    edtReceituario.Text     := dbCtx.TReceituarionome.AsString;
    frmReceituario.Free;
  end;
end;

procedure TfrmQuadroAtividades.edtHoraFimKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
 if (keyChar in ['0'..'9',','] = false) then
 begin
   KeyChar := #0;
 end;
end;

procedure TfrmQuadroAtividades.edtHoraIniChangeTracking(Sender: TObject);
begin
  if edtHoraFim.Text.Length=0 then edtHoraFim.Text:='0';
  if edtHoraIni.Text.Length=0 then edtHoraIni.Text:='0';
  if edtHorasParado.Text.Length=0 then edtHorasParado.Text:='0';
  edtHorasTrabalhada.Text := FormatFloat('####,##0.00',((strToFloat(edtHoraFim.Text)-strToFloat(edtHoraIni.Text))-
   strToFloat(edtHorasParado.Text)));
end;

procedure TfrmQuadroAtividades.edtHoraIniKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
 if (keyChar in ['0'..'9',','] = false) then
 begin
   KeyChar := #0;
 end;
end;

procedure TfrmQuadroAtividades.edtHorasParadoKeyUp(Sender: TObject;
  var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
 if (keyChar in ['0'..'9',','] = false) then
 begin
   KeyChar := #0;
 end;
end;

procedure TfrmQuadroAtividades.edtQtdeUtilizadaKeyDown(Sender: TObject;
  var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
 if (keyChar in ['0'..'9',','] = false) then
 begin
   KeyChar := #0;
 end;
end;

procedure TfrmQuadroAtividades.FormKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
 if(Key=VK_F5) then
 begin
  TThread.CreateAnonymousThread(procedure()
  var
   vProgres:Double;
  begin
    vProgres := 3.94;
    TThread.Synchronize(nil,procedure
    begin
      Animacao.Loop          := true;
      Animacao.PropertyName  := 'RotationAngle';
      Animacao.AnimationType := TAnimationType.InOut;
      Animacao.Interpolation := TInterpolationType.Linear;
      Animacao.Start;

      dbCtx.AtualizaSequencias;
      msmoSync.Lines.Clear;
      laySync.visible := true;
      msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Inicio sincrionização AWS');
      ProgressBarSync.Value :=0;
      ProgressBarSync.Min   :=0;
      ProgressBarSync.Max   :=100;
    end);
    TThread.Sleep(1000);
    if dbCtx.vTipoBDConfig=2 then
    begin
      TThread.Synchronize(nil,procedure
      begin
       msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Inicio sincrionização Atividades');
      end);
      DataModule1.ReplicaOperacaoTalhao('');
      TThread.Synchronize(nil,procedure
      begin
         msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Inicio sincrionização Atividades Maquinas');
      end);
      DataModule1.ReplicaOperacaoMaquinaTalhao('');
      TThread.Synchronize(nil,procedure
      begin
       msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Inicio sincrionização Atividades Talhoes');
      end);
      DataModule1.ReplicaOperacaoProdutosTalhao('');
      TThread.Synchronize(nil,procedure
      begin
       msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Inicio sincrionização Atividades Ocorrencia');
      end);
      DataModule1.ReplicaOperacaoOcorrenciaTalhao('');
      TThread.Synchronize(nil,procedure
      begin
       ProgressBarSync.Value :=frmPrincipal.ProgressBarSync.Value+vProgres;
       laySync.visible       :=false;
       dbCtx.AtualizaSequencias;
       btnAddAtividade.Enabled  :=dbCtx.vTipoBDConfig=2;
       listaDetOperacao.Visible := false;
       layAuxiliar.Visible      := false;
       TabAux.TabPosition       := TTabPosition.None;
       btnAddAtividade.Enabled  := false;
       CarregaSetor;
       GeraLista('');
       dbCtx.TSafra.Close;
       dbCtx.TSafra.Open;
       dbCtx.TSafra.Filtered := false;
       dbCtx.TSafra.Filter   := 'status=1';
       dbCtx.TSafra.Filtered := true;
       vIdSafra              := dbCtx.TSafraid.AsString;
       lblCad.Text           := dbCtx.TSafranome.AsString;
      end)
    end;
    if dbCtx.vTipoBDConfig=0 then
    begin
        TThread.Synchronize(nil,procedure
        begin
         msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Inicio sincrionização Atividades');
        end);
        DataModule2.ReplicaOperacaoTalhao;
        TThread.Synchronize(nil,procedure
        begin
         msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Inicio sincrionização Atividades Maquinas');
        end);
        DataModule2.ReplicaOperacaoMaquinaTalhao;
        TThread.Synchronize(nil,procedure
        begin
         msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Inicio sincrionização Atividades Talhoes');
        end);
        DataModule2.ReplicaOperacaoProdutosTalhao;
        TThread.Synchronize(nil,procedure
        begin
         msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Inicio sincrionização Atividades Ocorrencia');
        end);
        DataModule2.ReplicaOperacaoOcorrenciaTalhao;
        TThread.Synchronize(nil,procedure
        begin
         ProgressBarSync.Value :=frmPrincipal.ProgressBarSync.Value+vProgres;
         laySync.visible       :=false;
         dbCtx.AtualizaSequencias;
         btnAddAtividade.Enabled  :=dbCtx.vTipoBDConfig=2;
         listaDetOperacao.Visible := false;
         layAuxiliar.Visible      := false;
         TabAux.TabPosition       := TTabPosition.None;
         btnAddAtividade.Enabled  := false;
         CarregaSetor;
         GeraLista('');
         dbCtx.TSafra.Close;
         dbCtx.TSafra.Open;
         dbCtx.TSafra.Filtered := false;
         dbCtx.TSafra.Filter   := 'status=1';
         dbCtx.TSafra.Filtered := true;
         vIdSafra              := dbCtx.TSafraid.AsString;
         lblCad.Text           := dbCtx.TSafranome.AsString;
        end);
    end;
  end).Start;
 end;
end;

procedure TfrmQuadroAtividades.FormShow(Sender: TObject);
begin
  TThread.CreateAnonymousThread(procedure()
  var
   vProgres:Double;
  begin
    vProgres := 3.94;
//    TThread.Synchronize(nil,procedure
//    begin
//      Animacao.Loop          := true;
//      Animacao.PropertyName  := 'RotationAngle';
//      Animacao.AnimationType := TAnimationType.InOut;
//      Animacao.Interpolation := TInterpolationType.Linear;
//      Animacao.Start;
       dbCtx.AtualizaSequencias;
       laySync.visible       :=false;
       dbCtx.AtualizaSequencias;
       btnAddAtividade.Enabled  :=dbCtx.vTipoBDConfig=2;
       listaDetOperacao.Visible := false;
       layAuxiliar.Visible      := false;
       TabAux.TabPosition       := TTabPosition.None;
       btnAddAtividade.Enabled  := false;
       CarregaSetor;
       dbCtx.TSafra.Close;
       dbCtx.TSafra.Open;
       dbCtx.TSafra.Filtered := false;
       dbCtx.TSafra.Filter   := 'status=1';
       dbCtx.TSafra.Filtered := true;
       vIdSafra              := dbCtx.TSafraid.AsString;
       lblCad.Text           := dbCtx.TSafranome.AsString;

//      msmoSync.Lines.Clear;
//      laySync.visible := true;
//      msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Inicio sincrionização AWS');
//      ProgressBarSync.Value :=0;
//      ProgressBarSync.Min   :=0;
//      ProgressBarSync.Max   :=100;
//    end);
//    if dbCtx.vTipoBDConfig=2 then
//    begin
//      TThread.Synchronize(nil,procedure
//      begin
//       msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Inicio sincrionização Atividades');
//      end);
//      DataModule1.ReplicaOperacaoTalhao('');
//      TThread.Synchronize(nil,procedure
//      begin
//         msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Inicio sincrionização Atividades Maquinas');
//      end);
//      DataModule1.ReplicaOperacaoMaquinaTalhao('');
//      TThread.Synchronize(nil,procedure
//      begin
//       msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Inicio sincrionização Atividades Talhoes');
//      end);
//      DataModule1.ReplicaOperacaoProdutosTalhao('');
//      TThread.Synchronize(nil,procedure
//      begin
//       msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Inicio sincrionização Atividades Ocorrencia');
//      end);
//      DataModule1.ReplicaOperacaoOcorrenciaTalhao('');
//      TThread.Synchronize(nil,procedure
//      begin
//       frmPrincipal.ProgressBarSync.Value :=frmPrincipal.ProgressBarSync.Value+vProgres;
//       frmPrincipal.msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Sincronizando Operação Ocorrência AWS');
//      end);
//      DataModule2.ReplicaOperacaoVazaoTalhao;
//      TThread.Synchronize(nil,procedure
//      begin
//       ProgressBarSync.Value :=frmPrincipal.ProgressBarSync.Value+vProgres;
//       laySync.visible       :=false;
//       dbCtx.AtualizaSequencias;
//       btnAddAtividade.Enabled  :=dbCtx.vTipoBDConfig=2;
//       listaDetOperacao.Visible := false;
//       layAuxiliar.Visible      := false;
//       TabAux.TabPosition       := TTabPosition.None;
//       btnAddAtividade.Enabled  := false;
//       CarregaSetor;
//       GeraLista('');
//       dbCtx.TSafra.Close;
//       dbCtx.TSafra.Open;
//       dbCtx.TSafra.Filtered := false;
//       dbCtx.TSafra.Filter   := 'status=1';
//       dbCtx.TSafra.Filtered := true;
//       vIdSafra              := dbCtx.TSafraid.AsString;
//       lblCad.Text           := dbCtx.TSafranome.AsString;
//      end)
//    end;
//    if dbCtx.vTipoBDConfig=0 then
//    begin
//        TThread.Synchronize(nil,procedure
//        begin
//         msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Inicio sincrionização Atividades');
//        end);
//        DataModule2.ReplicaOperacaoTalhao;
//        TThread.Synchronize(nil,procedure
//        begin
//         msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Inicio sincrionização Atividades Maquinas');
//        end);
//        DataModule2.ReplicaOperacaoMaquinaTalhao;
//        TThread.Synchronize(nil,procedure
//        begin
//         msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Inicio sincrionização Atividades Talhoes');
//        end);
//        DataModule2.ReplicaOperacaoProdutosTalhao;
//        TThread.Synchronize(nil,procedure
//        begin
//         msmoSync.Lines.add(FormatDateTime('hh:mm:ss',now)+': Inicio sincrionização Atividades Ocorrencia');
//        end);
//        DataModule2.ReplicaOperacaoOcorrenciaTalhao;
//        TThread.Synchronize(nil,procedure
//        begin
//         ProgressBarSync.Value :=frmPrincipal.ProgressBarSync.Value+vProgres;
//         laySync.visible       :=false;
//         dbCtx.AtualizaSequencias;
//         btnAddAtividade.Enabled  :=dbCtx.vTipoBDConfig=2;
//         listaDetOperacao.Visible := false;
//         layAuxiliar.Visible      := false;
//         TabAux.TabPosition       := TTabPosition.None;
//         btnAddAtividade.Enabled  := false;
//         CarregaSetor;
//         GeraLista('');
//         dbCtx.TSafra.Close;
//         dbCtx.TSafra.Open;
//         dbCtx.TSafra.Filtered := false;
//         dbCtx.TSafra.Filter   := 'status=1';
//         dbCtx.TSafra.Filtered := true;
//         vIdSafra              := dbCtx.TSafraid.AsString;
//         lblCad.Text           := dbCtx.TSafranome.AsString;
//        end);
//    end;
  end).Start;
end;


procedure TfrmQuadroAtividades.GeraLista(vIdSetor:string);
var
 item   : TListViewItem;
 txt    : TListItemText;
 txtH   : TListItemPurpose;
 img    : TListItemImage;
begin
 dbCtx.TTalhoes.Close;
 dbCtx.TTalhoes.Open;
 if vIdSetor.Length>0 then
 begin
  dbCtx.TTalhoes.Filtered := false;
  dbCtx.TTalhoes.Filter   := 'idsetor='+vIdSetor;
  dbCtx.TTalhoes.Filtered := true;
 end
 else
 begin
   dbCtx.TTalhoes.Filtered := false;
   dbCtx.TTalhoes.Close;
   dbCtx.TTalhoes.Open;
 end;
 dbCtx.TTalhoes.First;
 ListaTalhoes.Items.Clear;
 while not dbCtx.TTalhoes.eof do
 begin
   item := ListaTalhoes.Items.Add;
   with frmQuadroAtividades do
   begin
     with item  do
     begin
       txt :=   TListItemText(Objects.FindDrawable('Text4'));
       txt.Text := dbCtx.TTalhoesid.AsString;

       txt :=   TListItemText(Objects.FindDrawable('Text5'));
       txt.Text := dbCtx.TTalhoesareahe.AsString;

       txt :=   TListItemText(Objects.FindDrawable('Text2'));
       txt.Text := dbCtx.TTalhoesnome.AsString;

       txt :=   TListItemText(Objects.FindDrawable('Text3'));
       txt.Text := 'Área(ha):'+dbCtx.TTalhoesareahe.AsString;


       img := TListItemImage(Objects.FindDrawable('Image2'));
       img.ScalingMode := TImageScalingMode.Stretch;
       img.Bitmap     := frmPrincipal.imgRetanguloLista.Bitmap;

     end;
   end;
   dbCtx.TTalhoes.Next;
 end;
end;

procedure TfrmQuadroAtividades.LimpaCampos;
begin
  edtAtividade.Text           :='';
  edtResponsavel.Text         :='';
  edtObservacaoAtividade.Text :='';
  edtDataFimAtividade.Text    :='';
  edtMaquina.Text             :='';
  edtOperador.Text            :='';
  edtHoraIni.Text             :='0';
  edtHoraFim.Text             :='0';
  edtHorasParado.Text         :='0';
  edtObsMaquina.Text          :='';
  edtProduto.Text             :='';
  edtQtdeUtilizada.Text       :='';
  edtObsProduto.Text          :='';
  edtTipoOcorrencia.Text      :='';
  edtDescricao.Text           :='';
  edtDataMaquina.Text         :='';
  edtDataProduto.Text         :='';
  edtDataOcorrencia.Text      :='';
end;

procedure TfrmQuadroAtividades.ListaTalhoesItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
 if Assigned(ListaTalhoes.Selected) then
 begin
  vIdTalhao:=
   TAppearanceListViewItem(ListaTalhoes.Selected).Objects.FindObjectT<TListItemText>('Text4').Text;
   btnAddAtividade.Enabled := true;
  vAreaTalhao:=
   TAppearanceListViewItem(ListaTalhoes.Selected).Objects.FindObjectT<TListItemText>('Text5').Text;
   AddItemScrolH();
 end;
end;

procedure TfrmQuadroAtividades.MyShowMessage(msg: string; btnCancel: Boolean);
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
    frmPrincipal.vMsgConfirma := dlg.vBntConfirmaMsg;
  end);
end;

procedure TfrmQuadroAtividades.Rectangle20Click(Sender: TObject);
begin
 if edtTipoOcorrencia.Text.Length=0 then
 begin
   MyShowMessage('Informe o Tipo!!',false);
   edtTipoOcorrencia.SetFocus;
   Exit;
 end;
 if edtDescricao.Text.Length=0 then
 begin
   MyShowMessage('Informe a Descrição!!',false);
   edtDescricao.SetFocus;
   Exit;
 end;
 if edtDataOcorrencia.Text.Length=0 then
 begin
   MyShowMessage('Informe a Data!!',false);
   edtDataOcorrencia.SetFocus;
   Exit;
 end;
 dbCtx.TOcorrenciaOperacaodata.AsDateTime              := edtDataOcorrencia.Date;
 dbCtx.TOcorrenciaOperacaoidtipoocorrencia.AsString    := vIdTipoOcorrencia;
 dbCtx.TOcorrenciaOperacaodescricao.AsString           := edtDescricao.Text;
 try
   dbCtx.TOcorrenciaOperacao.ApplyUpdates(-1);
   MyShowMessage('Ocorrencia Adicionada com sucesso!!',false);
   if dbCtx.vTipoBDConfig=2 then
   begin
     TThread.Synchronize(nil,procedure
     begin
       MyShowMessage('Aguarde Sincronizando Dados',false);
       DataModule1.ReplicaOperacaoOcorrenciaTalhao('');
     end);
   end;
   layAuxiliar.Visible := false;
   AddItemScrolH();
   AbreDetalhesOp(idOpClick);
 except
   on E: Exception do
    myShowMessage('Erro ao salvar Ocorrencia:'+E.Message,false);
 end;
end;

procedure TfrmQuadroAtividades.SomarColunas;
var
  Sum : Double;
  Val : Double;
  I   : Integer;
begin
  Sum := 0;
  Val := 0;
  for I := 0 to GridMaquinas.RowCount-1 do
  begin
   if GridMaquinas.Cells[6,I].Length>0 then
   begin
    if TryStrToFloat(GridMaquinas.Cells[6,I],Val) then
     Sum := Val+Val;
   end;
  end;
  lblTotalHoras.Text     := 'Total Horas: '+FormatFloat('####,##0.00',Val);
end;

procedure TfrmQuadroAtividades.AbreDetalhesOp(vIdOp: string);
begin
 dbCtx.AbreMaquinaOperacao(vIdOp);
 Sleep(50);
 dbCtx.AbreProdutoOperacao(vIdOp);
 Sleep(50);
 dbCtx.AbreOcorrenciaOperacao(vIdOp);
 Sleep(50);
 lblTotalMaquinas.Text    := 'Total Registro: '+intToStr(GridMaquinas.RowCount);
 lblTotalProdutos.Text    := 'Total Registro: '+intToStr(GridProdutos.RowCount);
 lblTotalOcorrencia.Text  := 'Total Registro: '+intToStr(GridOcorrencia.RowCount);

if vIdAtividade='2' then
begin
 dbCtx.TVazaoOperacao.Close;
 dbCtx.TVazaoOperacao.Open;
 dbCtx.TVazaoOperacao.Filtered := false;
 dbCtx.TVazaoOperacao.Filter   := 'idoperacaotalhao='+vIdOp;
 dbCtx.TVazaoOperacao.Filtered := true;

 chk5LTHADet.IsChecked  := dbCtx.TVazaoOperacaocincoltha.AsInteger=1;
 chk10LTHADet.IsChecked := dbCtx.TVazaoOperacaodezltha.AsInteger=1;
 chk15LTHADet.IsChecked := dbCtx.TVazaoOperacaoquinzeltha.AsInteger=1;
 chk20LTHADet.IsChecked := dbCtx.TVazaoOperacaovinteltha.AsInteger=1;
 chk30LTHADet.IsChecked := dbCtx.TVazaoOperacaotrintaltha.AsInteger=1;
 chk40LTHADet.IsChecked := dbCtx.TVazaoOperacaoquarentaltha.AsInteger=1;
 chk50LTHADet.IsChecked := dbCtx.TVazaoOperacaocinquentaltha.AsInteger=1;
 chk75LTHADet.IsChecked := dbCtx.TVazaoOperacaosetentaecincoltha.AsInteger=1;
 chk100LTHADet.IsChecked:= dbCtx.TVazaoOperacaocemltha.AsInteger=1;
 layvazao.Visible       := true;
end
else
 layvazao.Visible       := false;
 SomarColunas;
end;

procedure TfrmQuadroAtividades.AddItemScrolH();
var
 i,COUNT :integer;
 Lyt,LytSub: TLayout;
 lbl: TLabel;

 Rec,RecTop: TRectangle;
 Img : TImage;
 FHorizBox  : TScrollBox;
 vScrollBox : TScrollBox;
 vFiltro:string;
 vDatIni,vDataFim:string;
begin
  vDatIni  := FormatDateTime('yyyy-mm-dd',edtDataInicio.Date).QuotedString;
  vDataFim := FormatDateTime('yyyy-mm-dd',edtDataFim.Date).QuotedString;
  vFiltro  := 'and os.datainicio between '+vDatIni+' and '+vDataFim;
  if cbxAtividadeF.ItemIndex>0 then
   vFiltro :=' and idoperacao='+intToStr(cbxAtividadeF.ItemIndex);
   dbCtx.AbreOperacaoTalhaoSafra(vIdTalhao,vIdSafra,vFiltro);
   if not dbCtx.QryOperacaoSafraTalhao.IsEmpty then
   begin
        vScrollBox := TScrollBox(RecScroolBox.FindComponent('ScrH'));
        if vScrollBox<>NIL then
          vScrollBox.DisposeOf;

        FHorizBox                := TScrollBox.Create(RecScroolBox);
        FHorizBox.Align          := TAlignLayout.Client;
        FHorizBox.Name           := 'ScrH';
        FHorizBox.Parent         := RecScroolBox;
        FHorizBox.Margins.Top    := 5;
        FHorizBox.Margins.Bottom := 5;

        dbCtx.QryOperacaoSafraTalhao.First;
        i:=0;
        while not dbCtx.QryOperacaoSafraTalhao.eof do
        begin
          lyt              := TLayout.Create(FHorizBox);
          lyt.Margins.Left := 10;
          lyt.Align        := TAlignLayout.Left;
          lyt.Width        := 400;
          lyt.Parent       := FHorizBox;
          lyt.OnClick      := ClickItem;
          lyt.TagString    := dbCtx.QryOperacaoSafraTalhaoid.AsString;
          lyt.HitTest      := true;

          Rec              := TRectangle.Create(lyt);
          Rec.Align        := TAlignLayout.Contents;
          Rec.Parent       := lyt;
          case dbCtx.QryOperacaoSafraTalhaostatus.AsInteger of
           1:begin
              Rec.Stroke.Color := TAlphaColorRec.Darkblue;
              Rec.Fill.Color   := TAlphaColorRec.Darkblue;
             end;
           2:begin
              Rec.Stroke.Color := TAlphaColorRec.Darkgreen;
              Rec.Fill.Color   := TAlphaColorRec.Darkgreen;
             end;
          end;
          Rec.HitTest      := false;

          lbl                 := TLabel.Create(Rec);
          lbl.Align           := TAlignLayout.top;
          lbl.Parent          := Rec;
          lbl.FontColor       := $FFFFFFFF;
          lbl.StyledSettings  := lbl.StyledSettings - [TStyledSetting.Size];
          lbl.Font.Size       := 15;
          lbl.TextAlign       := TTextAlign.Center;
          lbl.Text            := dbCtx.QryOperacaoSafraTalhaooperacao.AsString;
          lbl.HitTest         := false;
          lbl.Height          := 26;
          lbl.Margins.Left    := 3;
          Rec.AddObject(lbl);

          lbl                 := TLabel.Create(Rec);
          lbl.Align           := TAlignLayout.top;
          lbl.Parent          := Rec;
          lbl.FontColor       := $FFFFFFFF;
          lbl.StyledSettings  := lbl.StyledSettings - [TStyledSetting.Size];
          lbl.Font.Size       := 12;
          lbl.TextAlign       := TTextAlign.Leading;
          lbl.Text            := 'Responsavel: '+dbCtx.QryOperacaoSafraTalhaoresponsavel.AsString;
          lbl.HitTest         := false;
          lbl.Height          := 18;
          lbl.Margins.Left    := 3;
          Rec.AddObject(lbl);

          lbl                 := TLabel.Create(Rec);
          lbl.Align           := TAlignLayout.top;
          lbl.Parent          := Rec;
          lbl.FontColor       := $FFFFFFFF;
          lbl.StyledSettings  := lbl.StyledSettings - [TStyledSetting.Size];
          lbl.Font.Size       := 12;
          lbl.TextAlign       := TTextAlign.Leading;
          lbl.Text            := 'Data Fim: '+dbCtx.QryOperacaoSafraTalhaodatafim.AsString;
          lbl.HitTest         := false;
          lbl.Height          := 18;
          lbl.Margins.Left    := 3;
          Rec.AddObject(lbl);


          lbl                 := TLabel.Create(Rec);
          lbl.Align           := TAlignLayout.top;
          lbl.Parent          := Rec;
          lbl.FontColor       := $FFFFFFFF;
          lbl.StyledSettings  := lbl.StyledSettings - [TStyledSetting.Size];
          lbl.Font.Size       := 12;
          lbl.TextAlign       := TTextAlign.Leading;
          lbl.Text            := 'Data Inicio: '+dbCtx.QryOperacaoSafraTalhaodatainicio.AsString;
          lbl.HitTest         := false;
          lbl.Height          := 18;
          lbl.Margins.Left    := 3;
          Rec.AddObject(lbl);

          lbl                 := TLabel.Create(Rec);
          lbl.Align           := TAlignLayout.top;
          lbl.Parent          := Rec;
          lbl.FontColor       := $FFFFFFFF;
          lbl.StyledSettings  := lbl.StyledSettings - [TStyledSetting.Size];
          lbl.Font.Size       := 12;
          lbl.TextAlign       := TTextAlign.Leading;
          lbl.Text            := 'Area Prevista: '+dbCtx.QryOperacaoSafraTalhaoareaprevista.AsString;
          lbl.HitTest         := false;
          lbl.Height          := 18;
          lbl.Margins.Left    := 3;
          Rec.AddObject(lbl);

          lbl                 := TLabel.Create(Rec);
          lbl.Align           := TAlignLayout.top;
          lbl.Parent          := Rec;
          lbl.FontColor       := $FFFFFFFF;
          lbl.StyledSettings  := lbl.StyledSettings - [TStyledSetting.Size];
          lbl.Font.Size       := 12;
          lbl.TextAlign       := TTextAlign.Leading;
          lbl.Text            := 'Area Realizada: '+dbCtx.QryOperacaoSafraTalhaoarearealizada.AsString;
          lbl.HitTest         := false;
          lbl.Height          := 18;
          lbl.Margins.Left    := 3;
          Rec.AddObject(lbl);

          lbl                 := TLabel.Create(Rec);
          lbl.Align           := TAlignLayout.top;
          lbl.Parent          := Rec;
          lbl.FontColor       := $FFFFFFFF;
          lbl.StyledSettings  := lbl.StyledSettings - [TStyledSetting.Size];
          lbl.Font.Size       := 12;
          lbl.Margins.Left    := 3;
          lbl.TextAlign       := TTextAlign.Leading;
          if dbCtx.QryOperacaoSafraTalhaostatus.AsInteger=1 then
           lbl.Text           := 'Status: Aberta'
          else
           lbl.Text           := 'Status: Finalizada';
          lbl.HitTest         := false;
          lbl.Height          := 18;
          Rec.AddObject(lbl);

          LytSub                := TLayout.Create(rec);
          LytSub.Align          := TAlignLayout.Client;
          LytSub.Height         := 100;
          LytSub.HitTest        := false;
          LytSub.Margins.Left   := 5;
          LytSub.Margins.Right  := 5;
          LytSub.Margins.Bottom := 5;
          Rec.AddObject(LytSub);

          lbl                 := TLabel.Create(LytSub);
          lbl.Align           := TAlignLayout.top;
          lbl.Parent          := LytSub;
          lbl.FontColor       := $FFFFFFFF;
          lbl.StyledSettings  := lbl.StyledSettings - [TStyledSetting.Size];
          lbl.Font.Size       := 10;
          lbl.TextAlign       := TTextAlign.Center;
          lbl.Text            := 'Adicionar';
          lbl.HitTest         := false;
          lbl.Height          := 12;
          lbl.Margins.Bottom  := 5;
          lbl.Margins.Top     := 5;
          LytSub.AddObject(lbl);

          Img                 := TImage.Create(LytSub);
          Img.Align           := TAlignLayout.Left;
          img.Bitmap.Assign(imgOcorrencia.Bitmap);
          img.HitTest         := true;
          Img.OnClick         := ClickAddOcorrencia;
          Img.Width           := 80;
          Img.TagString       := dbCtx.QryOperacaoSafraTalhaoid.AsString;
          Img.Enabled         :=dbCtx.vTipoBDConfig=2;
          LytSub.AddObject(Img);

          Img                 := TImage.Create(LytSub);
          Img.Align           := TAlignLayout.Left;
          img.Bitmap.Assign(imgFinalizar.Bitmap);
          img.HitTest         := true;
          Img.OnClick         := ClickFinalizaOp;
          Img.Width           := 80;
          Img.TagString       := dbCtx.QryOperacaoSafraTalhaoid.AsString;
          Img.Enabled         :=dbCtx.vTipoBDConfig=2;
          LytSub.AddObject(Img);


          Img                 := TImage.Create(LytSub);
          Img.Align           := TAlignLayout.Left;
          img.Bitmap.Assign(imgMaquinas.Bitmap);
          img.HitTest         := true;
          Img.Width           := 80;
          Img.TagString       := dbCtx.QryOperacaoSafraTalhaoid.AsString;
          Img.OnClick         := ClickAddMaquina;
          Img.Enabled         :=dbCtx.vTipoBDConfig=2;
          LytSub.AddObject(Img);


          Img                 := TImage.Create(LytSub);
          Img.Align           := TAlignLayout.Left;
          img.Bitmap.Assign(imgProdutos.Bitmap);
          img.HitTest         := true;
          Img.OnClick         := ClickAddProduto;
          Img.Width           := 80;
          Img.TagString       := dbCtx.QryOperacaoSafraTalhaoid.AsString;
          Img.Enabled         :=dbCtx.vTipoBDConfig=2;
          LytSub.AddObject(Img);
          if dbCtx.QryOperacaoSafraTalhaoidoperacao.AsInteger=2 then
          begin
            Img                 := TImage.Create(LytSub);
            Img.Align           := TAlignLayout.Left;
            img.Bitmap.Assign(imgVazao1.Bitmap);
            img.HitTest         := true;
            Img.OnClick         := ClickAddVazao;
            Img.Width           := 70;
            Img.TagString       := dbCtx.QryOperacaoSafraTalhaoid.AsString;
            Img.Enabled         :=dbCtx.vTipoBDConfig=2;
            LytSub.AddObject(Img);
          end;

          //********************

          lyt.AddObject(Rec);
          inc(i);
          dbCtx.QryOperacaoSafraTalhao.Next;
    end;
   end
   else
   begin
    listaDetOperacao.Visible := false;
    vScrollBox := TScrollBox(RecScroolBox.FindComponent('ScrH'));
    if vScrollBox<>NIL then
     vScrollBox.DisposeOf;
   end;
end;

procedure TfrmQuadroAtividades.btnAddAtividadeClick(Sender: TObject);
begin
 vFinalizandoOP :=0;
 LimpaCampos;
 dbCtx.TOperacaoSafraTalhao.Close;
 dbCtx.TOperacaoSafraTalhao.Open;
 dbCtx.TOperacaoSafraTalhao.Insert;
 dbCtx.TOperacaoSafraTalhaoidsafra.AsString   := vIdSafra;
 dbCtx.TOperacaoSafraTalhaoidtalhao.AsString  := vIdTalhao;
 dbCtx.TOperacaoSafraTalhaoidusuario.AsString := dbCtx.vIdUsuarioLogado;
 edtAreaPrev.Text    := vAreaTalhao;
 layAuxiliar.Opacity := 0;
 TabAux.ActiveTab    := tbiAddAtividade;
 layAuxiliar.Visible := true;
 layAuxiliares.Visible := false;
 recAux.Height         :=0;
 Animation.Start;
end;

end.
