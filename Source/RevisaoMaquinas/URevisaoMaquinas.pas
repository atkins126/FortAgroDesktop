unit URevisaoMaquinas;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  UCadPadrao, System.Rtti, FMX.Grid.Style, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FMX.ActnList,
  System.Actions, FMX.TabControl, FMX.Ani, FMX.ScrollBox, FMX.Grid, FMX.Edit,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, Fmx.Bind.Grid,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, FMX.EditBox, FMX.NumberBox, FMX.DateTimeCtrls, FMX.ListBox,
  System.Math.Vectors, FMX.Controls3D, FMX.Layers3D, FMX.Memo;

type
  TfrmCadRevisaoMaquinas = class(TfrmCadPadrao)
    BindSourceDB1: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    BindingsList1: TBindingsList;
    Lista: TListView;
    Layout1: TLayout;
    Rectangle1: TRectangle;
    layDadosMaquias: TLayout;
    RecDados: TRectangle;
    Layout7: TLayout;
    Layout8: TLayout;
    Maquina: TLabel;
    Label9: TLabel;
    Label15: TLabel;
    edtMaquina: TEdit;
    EditButton5: TEditButton;
    ClearEditButton2: TClearEditButton;
    edtResponsavel: TEdit;
    EditButton4: TEditButton;
    ClearEditButton1: TClearEditButton;
    edtHorimetro: TEdit;
    layDadosManutencao: TLayout;
    Layout3: TLayout;
    Rectangle3: TRectangle;
    Layout4: TLayout;
    Layout9: TLayout;
    Label4: TLabel;
    edtPlanoManutencao: TEdit;
    EditButton1: TEditButton;
    ClearEditButton3: TClearEditButton;
    btnGerar: TRectangle;
    Label5: TLabel;
    Image7: TImage;
    layEdit: TLayout;
    Label12: TLabel;
    Label13: TLabel;
    edtDataIni: TDateEdit;
    edtDataFim: TDateEdit;
    tbiDet: TTabItem;
    Layout15: TLayout;
    Layout16: TLayout;
    Rectangle10: TRectangle;
    Layout17: TLayout;
    Layout18: TLayout;
    Rectangle11: TRectangle;
    lblPlanoManutencao: TLabel;
    Rectangle12: TRectangle;
    Label16: TLabel;
    lblMaquina: TLabel;
    Label14: TLabel;
    lblHorimetro: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    lblDataInicio: TLabel;
    lblDataFim: TLabel;
    Rectangle13: TRectangle;
    Label19: TLabel;
    lblResponsavel: TLabel;
    StringGrid2: TStringGrid;
    ToolBar4: TToolBar;
    Image10: TImage;
    BindSourceDB2: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB2: TLinkGridToDataSource;
    GroupBox1: TGroupBox;
    Label22: TLabel;
    Label27: TLabel;
    edtDataInicio: TDateEdit;
    DateEdit1: TDateEdit;
    Rectangle14: TRectangle;
    Image11: TImage;
    Label23: TLabel;
    tbiAddItem: TTabItem;
    ToolBar5: TToolBar;
    Image12: TImage;
    Layout19: TLayout;
    Rectangle15: TRectangle;
    Layout20: TLayout;
    Layout24: TLayout;
    Layout25: TLayout;
    Rectangle17: TRectangle;
    Label25: TLabel;
    Image13: TImage;
    btnAddItem: TRectangle;
    Label26: TLabel;
    Image14: TImage;
    Layout21: TLayout;
    Layout22: TLayout;
    btnAdicionarItem: TRectangle;
    Label21: TLabel;
    Image16: TImage;
    Layout23: TLayout;
    Rectangle16: TRectangle;
    Layout32: TLayout;
    Layout33: TLayout;
    Label20: TLabel;
    layNovoItem: TLayout;
    Rectangle19: TRectangle;
    Layout2: TLayout;
    Layout26: TLayout;
    Rectangle22: TRectangle;
    Layout27: TLayout;
    rdManutencao: TRadioButton;
    rdLubrificacao: TRadioButton;
    rdVerificacao: TRadioButton;
    Layout3D1: TLayout3D;
    tabTipoItem: TTabControl;
    tbiManu: TTabItem;
    Rectangle23: TRectangle;
    Layout28: TLayout;
    Rectangle24: TRectangle;
    Layout29: TLayout;
    Label30: TLabel;
    edtItemRevisao: TEdit;
    ClearEditButton5: TClearEditButton;
    Layout30: TLayout;
    Rectangle25: TRectangle;
    Layout31: TLayout;
    Label31: TLabel;
    edtProdutoUtilizado: TEdit;
    btnBuscaProd: TEditButton;
    ClearEditButton6: TClearEditButton;
    Layout34: TLayout;
    Rectangle26: TRectangle;
    Layout35: TLayout;
    Label32: TLabel;
    edtQtdtemManutencao: TNumberBox;
    Layout36: TLayout;
    Rectangle27: TRectangle;
    Layout37: TLayout;
    Label33: TLabel;
    edtObsManu: TEdit;
    ClearEditButton7: TClearEditButton;
    tbiLubrificar: TTabItem;
    Layout38: TLayout;
    Rectangle28: TRectangle;
    Layout39: TLayout;
    Rectangle29: TRectangle;
    Layout40: TLayout;
    Label34: TLabel;
    edtLub: TEdit;
    ClearEditButton8: TClearEditButton;
    Layout41: TLayout;
    Rectangle30: TRectangle;
    Layout42: TLayout;
    Label35: TLabel;
    edtObsLub: TEdit;
    ClearEditButton9: TClearEditButton;
    tbiVerificar: TTabItem;
    Layout43: TLayout;
    Rectangle31: TRectangle;
    Layout44: TLayout;
    Rectangle32: TRectangle;
    Layout45: TLayout;
    Label36: TLabel;
    edtVrific: TEdit;
    ClearEditButton10: TClearEditButton;
    Layout46: TLayout;
    Rectangle33: TRectangle;
    Layout47: TLayout;
    Label37: TLabel;
    edtObsVerific: TEdit;
    ClearEditButton11: TClearEditButton;
    Label24: TLabel;
    Layout6: TLayout;
    Rectangle2: TRectangle;
    Layout48: TLayout;
    rdManutencaoF: TRadioButton;
    RdLubF: TRadioButton;
    RdVerificF: TRadioButton;
    rdTtodosF: TRadioButton;
    Label28: TLabel;
    tbLayEdit: TTabControl;
    tbiEdit: TTabItem;
    tbiObs: TTabItem;
    Rectangle4: TRectangle;
    Layout11: TLayout;
    Layout12: TLayout;
    lblItem: TLabel;
    Layout13: TLayout;
    Rectangle5: TRectangle;
    Label6: TLabel;
    edtProduto: TEdit;
    EditButton2: TEditButton;
    ClearEditButton4: TClearEditButton;
    Layout14: TLayout;
    Rectangle6: TRectangle;
    Label7: TLabel;
    edtqtde: TNumberBox;
    edtTab: TEdit;
    Rectangle7: TRectangle;
    Label8: TLabel;
    Image8: TImage;
    Rectangle8: TRectangle;
    Label10: TLabel;
    Image9: TImage;
    Layout10: TLayout;
    Rectangle9: TRectangle;
    Label11: TLabel;
    edtCodFab: TEdit;
    Layout49: TLayout;
    Layout50: TLayout;
    lblItemObs: TLabel;
    btnConfirmaObs: TRectangle;
    Label40: TLabel;
    Image15: TImage;
    Rectangle35: TRectangle;
    Label41: TLabel;
    Image17: TImage;
    Layout53: TLayout;
    Rectangle36: TRectangle;
    Label42: TLabel;
    edtObs: TMemo;
    Rectangle20: TRectangle;
    cbxTipoManu: TComboBox;
    btnServicos: TRectangle;
    Label29: TLabel;
    Image18: TImage;
    tbiServico: TTabItem;
    ToolBar6: TToolBar;
    Label38: TLabel;
    Image19: TImage;
    Layout51: TLayout;
    tbServico: TTabControl;
    tbiListaServico: TTabItem;
    tbiCadServico: TTabItem;
    recCadServ: TRectangle;
    Layout52: TLayout;
    Layout54: TLayout;
    Layout55: TLayout;
    Rectangle21: TRectangle;
    Label39: TLabel;
    Image20: TImage;
    edtConfirmaServico: TRectangle;
    Label43: TLabel;
    Image21: TImage;
    Layout56: TLayout;
    Rectangle37: TRectangle;
    Layout57: TLayout;
    Layout58: TLayout;
    Rectangle38: TRectangle;
    Layout59: TLayout;
    rdTerceiro: TRadioButton;
    rdInterno: TRadioButton;
    Layout3D2: TLayout3D;
    Layout60: TLayout;
    Rectangle39: TRectangle;
    Layout61: TLayout;
    Label44: TLabel;
    edtDescricao: TEdit;
    ClearEditButton12: TClearEditButton;
    Layout62: TLayout;
    Rectangle40: TRectangle;
    Layout63: TLayout;
    Label45: TLabel;
    edtResponsavelServico: TEdit;
    ClearEditButton13: TClearEditButton;
    Layout64: TLayout;
    Rectangle41: TRectangle;
    Layout65: TLayout;
    Label46: TLabel;
    edtValorServico: TNumberBox;
    Rectangle18: TRectangle;
    Rectangle34: TRectangle;
    Rectangle42: TRectangle;
    Image22: TImage;
    Label47: TLabel;
    btnAddServico: TRectangle;
    Image23: TImage;
    Label48: TLabel;
    Rectangle44: TRectangle;
    Image24: TImage;
    Label49: TLabel;
    btnExcluirServico: TRectangle;
    Image25: TImage;
    Label50: TLabel;
    StringGrid3: TStringGrid;
    BindSourceDB3: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB3: TLinkGridToDataSource;
    Layout66: TLayout;
    Rectangle43: TRectangle;
    Layout67: TLayout;
    Label51: TLabel;
    edtDataServico: TDateEdit;
    btnServicosRev: TRectangle;
    Image26: TImage;
    Label52: TLabel;
    btnBuscaItem: TEditButton;
    btnBuscaItemLubri: TEditButton;
    EditButton6: TEditButton;
    btnBuscarLista: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure EditButton5Click(Sender: TObject);
    procedure EditButton4Click(Sender: TObject);
    procedure EditButton1Click(Sender: TObject);
    procedure ListaItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure EditButton2Click(Sender: TObject);
    procedure Rectangle7Click(Sender: TObject);
    procedure btnCancelaClick(Sender: TObject);
    procedure btnGerarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure StringGrid1CellDblClick(const Column: TColumn;
      const Row: Integer);
    procedure btnVoltarClick(Sender: TObject);
    procedure edtDataInicioClosePicker(Sender: TObject);
    procedure DateEdit1ClosePicker(Sender: TObject);
    procedure Rectangle14Click(Sender: TObject);
    procedure btnAddItemClick(Sender: TObject);
    procedure EditButton3Click(Sender: TObject);
    procedure btnAdicionarItemClick(Sender: TObject);
    procedure rdManutencaoChange(Sender: TObject);
    procedure rdLubrificacaoChange(Sender: TObject);
    procedure rdVerificacaoChange(Sender: TObject);
    procedure btnBuscaProdClick(Sender: TObject);
    procedure rdTtodosFChange(Sender: TObject);
    procedure rdManutencaoFChange(Sender: TObject);
    procedure RdLubFChange(Sender: TObject);
    procedure RdVerificFChange(Sender: TObject);
    procedure btnConfirmaObsClick(Sender: TObject);
    procedure cbxTipoManuChange(Sender: TObject);
    procedure Rectangle21Click(Sender: TObject);
    procedure edtConfirmaServicoClick(Sender: TObject);
    procedure btnServicosClick(Sender: TObject);
    procedure btnAddServicoClick(Sender: TObject);
    procedure btnServicosRevClick(Sender: TObject);
    procedure Image19Click(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnExcluirServicoClick(Sender: TObject);
    procedure btnBuscaItemClick(Sender: TObject);
    procedure btnBuscaItemLubriClick(Sender: TObject);
    procedure EditButton6Click(Sender: TObject);
    procedure btnBuscarListaClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure btnEditarClick(Sender: TObject);
  private
    var
     vStatusSelected,vIdMaquina,vIdResponsavel,vIdPlanoRevisao,
     vIdItemTMP,vProdutoNome,vItemNome,vQtde,vIdProduto,vCodFab,
     vIdItem,vIdProdutoAdd,vItemSelect,vObsSelected,vIdPlanoRevisaoApl,vIdMaxRevEdit:string;
     vPlanoRevisaoHoras :Double;
     vEdit:integer;
  public
    procedure GeraLista(idPlanoManutencao:string);
    procedure GeraListaEdit(idRevisao:string);
    procedure Filtro;
  end;

var
  frmCadRevisaoMaquinas: TfrmCadRevisaoMaquinas;

implementation

{$R *.fmx}

uses UDMRevisao, UCadMaquina, UUsuarios, UCadRevisao,DataContext, UPrincipal,
  UProdutos, UItensRevisao;

procedure TfrmCadRevisaoMaquinas.btnAddClick(Sender: TObject);
begin
  vEdit :=0;
  layEdit.Visible           := false;
  RectCad.Visible           := false;
  edtMaquina.Text           :='';
  edtHorimetro.Text         :='0';
  edtResponsavel.Text       :='';
  edtPlanoManutencao.Text   :='';
  edtPlanoManutencao.Enabled := true;
  cbxTipoManu.ItemIndex      := -1;
  cbxTipoManu.Enabled        := true;
  edtMaquina.Enabled         := true;
  layDadosMaquias.Enabled    := false;
  layDadosManutencao.Enabled := false;
  dmRevisao.TRevisaoMaquinaApl.Insert;
  btnGerar.Enabled           := true;
  inherited;
end;

procedure TfrmCadRevisaoMaquinas.btnAddItemClick(Sender: TObject);
begin

 if rdManutencao.IsChecked then     //Manutencao
 begin
  edtObsManu.SetFocus;
  if edtItemRevisao.Text.Length=0 then
  begin
   MyShowMessage('Informe o Item!',false);
   Exit;
  end;

  if edtProdutoUtilizado.Text.Length=0 then
  begin
   MyShowMessage('Informe o Produto!',false);
   Exit;
  end;

  if (edtQtdtemManutencao.Text.Length=0) or (edtQtdtemManutencao.Value=0) then
  begin
   MyShowMessage('Informe a Qtde!',false);
   Exit;
  end;

  dmRevisao.InsereItensTMP(vIdPlanoRevisao,edtItemRevisao.Text, vidProduto, edtQtdtemManutencao.Text,'0',vIdItem);
  MyShowMessage('Item Inserido com sucesso!',false);
  GeraLista(vIdPlanoRevisao);
  MudarAba(tbiCad,sender);
 end;
 if rdLubrificacao.IsChecked then //Lubrificação
 begin
  edtObsLub.SetFocus;
  if edtLub.Text.Length=0 then
  begin
   MyShowMessage('Informe o Item!',false);
   Exit;
  end;
  dmRevisao.InsereItensTMPLubVeric(vIdPlanoRevisao,edtLub.Text,edtObsLub.Text,'1',vIdItem);
  MyShowMessage('Item Inserido com sucesso!',false);
  GeraLista(vIdPlanoRevisao);
  MudarAba(tbiCad,sender);
 end;
 if rdVerificacao.IsChecked then //verificacao
 begin
  edtObsVerific.SetFocus;
  if edtVrific.Text.Length=0 then
  begin
   MyShowMessage('Informe o Item!',false);
   Exit;
  end;
  dmRevisao.InsereItensTMPLubVeric(vIdPlanoRevisao,edtVrific.Text,edtObsVerific.Text,'2',vIdItem);
  MyShowMessage('Item Inserido com sucesso!',false);
  GeraLista(vIdPlanoRevisao);
  MudarAba(tbiCad,sender);
 end;
end;

procedure TfrmCadRevisaoMaquinas.btnAddServicoClick(Sender: TObject);
begin
 rdTerceiro.IsChecked  := false;
 rdInterno.IsChecked   := false;
 edtResponsavelServico.Text :='';
 edtDescricao.Text          :='';
 edtValorServico.Text       :='';
 tbServico.ActiveTab        := tbiCadServico;
end;

procedure TfrmCadRevisaoMaquinas.btnBuscaItemClick(Sender: TObject);
begin
  frmAuxItemRevisao := TfrmAuxItemRevisao.Create(Self);
  try
    frmAuxItemRevisao.ShowModal;
  finally
    edtItemRevisao.Text := dmRevisao.TAuxRevisaoItemnome.AsString;
    vIdItem             := dmRevisao.TAuxRevisaoItemid.AsString;
    frmAuxItemRevisao.Free;
  end;
end;

procedure TfrmCadRevisaoMaquinas.btnBuscaItemLubriClick(Sender: TObject);
begin
  frmAuxItemRevisao := TfrmAuxItemRevisao.Create(Self);
  try
    frmAuxItemRevisao.ShowModal;
  finally
    edtLub.Text := dmRevisao.TAuxRevisaoItemnome.AsString;
    vIdItem     := dmRevisao.TAuxRevisaoItemid.AsString;
    frmAuxItemRevisao.Free;
  end;
end;

procedure TfrmCadRevisaoMaquinas.btnBuscaProdClick(Sender: TObject);
begin
  frmCadProdutos := TfrmCadProdutos.Create(Self);
  try
    frmCadProdutos.ShowModal;
  finally
    edtProdutoUtilizado.Text := dbCtx.TProdutosnome.AsString;
    vIdProduto               := dbCtx.TProdutosid.AsString;
    frmCadProdutos.Free;
  end;
end;

procedure TfrmCadRevisaoMaquinas.btnBuscarListaClick(Sender: TObject);
begin
  filtro;
end;

procedure TfrmCadRevisaoMaquinas.btnCancelaClick(Sender: TObject);
begin
  MudarAba(tbiLista,sender);
end;

procedure TfrmCadRevisaoMaquinas.btnConfirmaObsClick(Sender: TObject);
begin
 if edtObs.Text.Length=0 then
 begin
  MyShowMessage('Digite um texto na observação!',false);
  Exit;
 end
 else
 begin
  try
   dmRevisao.InsereObsListaTMP(vIdItemTMP,edtObs.Text);
   MyShowMessage('Observação Gerada com Sucesso!',false);
    GeraLista(vIdPlanoRevisao);
   layEdit.Visible := false
  except
   on E : Exception do
    myShowMessage('Error ao Inserir uma observação: '+E.Message,false);
  end;
 end
end;

procedure TfrmCadRevisaoMaquinas.btnDeletarClick(Sender: TObject);
begin
 MyShowMessage('Deseja Realmente Deletar essa Revisão?',true);
 case frmPrincipal.vMsgConfirma of
   1:begin
      try
        dmRevisao.TRevisaoMaquinaApl.Edit;
        dmRevisao.TRevisaoMaquinaAplstatus.AsInteger :=-1;
        dmRevisao.TRevisaoMaquinaAplidusuarioalteracao.AsString := dbCtx.vIdUsuarioLogado;
        dmRevisao.TRevisaoMaquinaApldataalteracao.AsDateTime    := now;
        dmRevisao.TRevisaoMaquinaApl.ApplyUpdates(-1);
        Filtro;
      except
       on E : Exception do
        ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
      end;
   end;
 end;
end;

procedure TfrmCadRevisaoMaquinas.btnEditarClick(Sender: TObject);
begin
 vEdit :=1;
 cbxTipoManu.ItemIndex    := dmRevisao.TRevisaoMaquinaApltipo.AsInteger;
 edtMaquina.Text          := dmRevisao.TRevisaoMaquinaAplprefixo.AsString;
 vIdMaquina               := dmRevisao.TRevisaoMaquinaAplidmaquina.AsString;
 edtHorimetro.Text        := dmRevisao.TRevisaoMaquinaAplhorimetro.AsString;
 edtResponsavel.Text      := dmRevisao.TRevisaoMaquinaAplresponsavel.AsString;
 vIdResponsavel           := dmRevisao.TRevisaoMaquinaAplidresponsavel.AsString;
 edtPlanoManutencao.Text  := dmRevisao.TRevisaoMaquinaAplplanorevisao.AsString;
 vIdPlanoRevisao          := dmRevisao.TRevisaoMaquinaAplidplanorevisao.AsString;
 edtDataIni.Date          := dmRevisao.TRevisaoMaquinaApldatainicio.AsDateTime;
 edtDataFim.Date          := dmRevisao.TRevisaoMaquinaApldatafim.AsDateTime;
 dmRevisao.GeraListaItensTMPEdit(dmRevisao.TRevisaoMaquinaAplid.AsString);
 GeraLista(dmRevisao.TRevisaoMaquinaAplid.AsString);
 vIdMaxRevEdit              :=dmRevisao.TRevisaoMaquinaAplid.AsString;
 edtPlanoManutencao.Enabled := false;
 cbxTipoManu.Enabled        := false;
 edtMaquina.Enabled         := false;
 btnGerar.Enabled           := false;
 MudarAba(tbiCad,sender);
end;

procedure TfrmCadRevisaoMaquinas.btnExcluirServicoClick(Sender: TObject);
begin
 MyShowMessage('Deseja Realmente Deletar esse Serviço?',true);
 case frmPrincipal.vMsgConfirma of
   1:begin
      try
        dmRevisao.TServicoRevisao.Edit;
        dmRevisao.TServicoRevisaostatus.AsInteger :=-1;
        dmRevisao.TServicoRevisaoidusuarioalteracao.AsString := dbCtx.vIdUsuarioLogado;
        dmRevisao.TServicoRevisaodataalteracao.AsDateTime    := now;
        dmRevisao.TServicoRevisao.ApplyUpdates(-1);
        dmRevisao.AbreServicosRevisao(dmRevisao.TRevisaoMaquinaAplid.asstring);
      except
       on E : Exception do
        ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
      end;
   end;
 end;
end;

procedure TfrmCadRevisaoMaquinas.btnGerarClick(Sender: TObject);
begin
 if edtMaquina.Text.Length=0 then
 begin
  MyShowMessage('Informe a maquina!',false);
  Exit;
 end;
 if edtResponsavel.Text.Length=0 then
 begin
  MyShowMessage('Informe o Responsavel!',false);
  Exit;
 end;
 if (edtHorimetro.Text.Length=0)and (edtHorimetro.Text='0') then
 begin
  MyShowMessage('Informe o Horimentro!',false);
  Exit;
 end;
 if edtPlanoManutencao.Text.Length=0 then
 begin
  MyShowMessage('Informe o Plano de Manutenção!',false);
  Exit;
 end;
 if cbxTipoManu.ItemIndex=0 then
  dmRevisao.GeraListaItensTMP(vIdPlanoRevisao);
 if cbxTipoManu.ItemIndex=1 then
  dmRevisao.GeraListaItensTMP('0');

 GeraLista(vIdPlanoRevisao);
 RectCad.Visible := true;
 rdTtodosF.IsChecked := true;
end;

procedure TfrmCadRevisaoMaquinas.btnSalvarClick(Sender: TObject);
var
 vItensConfirmados,vIdMaxRev:string;
begin
  vItensConfirmados := dmRevisao.VerificaItensConfirmados(vIdPlanoRevisao);
  if vItensConfirmados='0' then
  begin
    MyShowMessage('Pelo menos um item deve ser confirmado antes de salvar!!',false);
    Exit;
  end;
  if vEdit=0 then
  begin
   dmRevisao.TRevisaoMaquinaApl.Close;
   dmRevisao.TRevisaoMaquinaApl.Open;
   dmRevisao.TRevisaoMaquinaApl.Insert;
  end
  else
  begin
   dmRevisao.TRevisaoMaquinaApl.Edit;
   dmRevisao.TRevisaoMaquinaAplidusuarioalteracao.AsString := dbCtx.vIdUsuarioLogado;
   dmRevisao.TRevisaoMaquinaApldataalteracao.AsDateTime    := now;
   dmRevisao.TRevisaoMaquinaAplsyncaws.AsInteger           := 0;
  end;

  dmRevisao.TRevisaoMaquinaAplidusuario.AsString        :=dbCtx.vIdUsuarioLogado;

  if cbxTipoManu.ItemIndex=0 then
  begin
   dmRevisao.TRevisaoMaquinaAplidplanorevisao.AsString   :=vIdPlanoRevisao;
   dmRevisao.TRevisaoMaquinaAplhorimetroproxima.AsFloat  := StrToFloat(edtHorimetro.Text)+vPlanoRevisaoHoras;
  end;
  if cbxTipoManu.ItemIndex=1 then
   dmRevisao.TRevisaoMaquinaAplidplanorevisao.AsString :='0';

  dmRevisao.TRevisaoMaquinaAplidmaquina.AsString      :=vIdMaquina;
  dmRevisao.TRevisaoMaquinaApldatainicio.AsDateTime   := edtDataIni.DateTime;
  dmRevisao.TRevisaoMaquinaApldatafim.AsDateTime      := edtDataFim.DateTime;
  dmRevisao.TRevisaoMaquinaAplidresponsavel.AsString  := vIdResponsavel;
  dmRevisao.TRevisaoMaquinaAplhorimetro.AsString      := edtHorimetro.Text;
  try
    dmRevisao.TRevisaoMaquinaApl.ApplyUpdates(-1);
    dmRevisao.AtualizaMaquinaProximaRevisao(
     vIdMaquina,
     FormatDateTime('yyyy-mm-dd',edtDataFim.DateTime).QuotedString,
     edtHorimetro.Text,
     stringrePLACE(floatToStr(StrToFloat(edtHorimetro.Text)+vPlanoRevisaoHoras),',','.',[rfReplaceAll])
    );
    if vEdit=0 then
      vIdMaxRev := dmRevisao.RetornaIdMaxRevisao
    else
    begin
      vIdMaxRev := vIdMaxRevEdit;
      dmRevisao.DeletaItensRevisao(vIdMaxRev);
    end;

      dmRevisao.qryListaItensPlanoRev.Filtered := false;
      dmRevisao.qryListaItensPlanoRev.Filter   := 'confirmado=2';
      dmRevisao.qryListaItensPlanoRev.Filtered := true;
      dmRevisao.qryListaItensPlanoRev.First;
      while not dmRevisao.qryListaItensPlanoRev.eof do
      begin
       dmRevisao.TRevisaoItensInsert.close;
       dmRevisao.TRevisaoItensInsert.Open;
       dmRevisao.TRevisaoItensInsert.Insert;
       dmRevisao.TRevisaoItensInsertidusuario.AsString :=dbCtx.vIdUsuarioLogado;
       dmRevisao.TRevisaoItensInsertidrevisao.AsString :=vIdMaxRev;
       dmRevisao.TRevisaoItensInsertitem.AsString      :=dmRevisao.qryListaItensPlanoRevitem.AsString;
       dmRevisao.TRevisaoItensInsertidproduto.AsString :=dmRevisao.qryListaItensPlanoRevidproduto.AsString;
       dmRevisao.TRevisaoItensInsertqtde.AsString      :=dmRevisao.qryListaItensPlanoRevqtde.AsString;
       dmRevisao.TRevisaoItensInsertqtde.AsString      :=dmRevisao.qryListaItensPlanoRevqtde.AsString;
       dmRevisao.TRevisaoItensInserttipo.AsString      :=dmRevisao.qryListaItensPlanoRevtipo.AsString;
       dmRevisao.TRevisaoItensInsertidItem.AsString    :=dmRevisao.qryListaItensPlanoRevidItem.AsString;
       dmRevisao.TRevisaoItensInsert.ApplyUpdates(-1);
       dmRevisao.qryListaItensPlanoRev.Next
      end;

      dmRevisao.TServicoRevisao.Close;
      dmRevisao.TServicoRevisao.Open;
      dmRevisao.TServicoRevisao.First;
      while not dmRevisao.TServicoRevisao.Eof do
      begin
        dmRevisao.AlteraIdRevisaoTMPServico(
         dmRevisao.TServicoRevisaoid.AsString,
         vIdMaxRev);
         dmRevisao.TServicoRevisao.Next;
      end;
      MyShowMessage('Manutenção lançada com sucesso!!',false);
      dmRevisao.AbreRevisaoApl('');
      MudarAba(tbiLista,Sender);
    except
      on E : Exception do
       ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
    end;
end;

procedure TfrmCadRevisaoMaquinas.btnServicosClick(Sender: TObject);
begin
 dmRevisao.AbreServicosRevisao(vIdPlanoRevisao);
 MudarAba(tbiServico,Sender);
end;

procedure TfrmCadRevisaoMaquinas.btnServicosRevClick(Sender: TObject);
begin
 vIdPlanoRevisaoApl := dmRevisao.TRevisaoMaquinaAplid.asstring;
 dmRevisao.AbreServicosRevisao(dmRevisao.TRevisaoMaquinaAplid.asstring);
 MudarAba(tbiServico,Sender);
end;

procedure TfrmCadRevisaoMaquinas.btnVoltarClick(Sender: TObject);
begin
 if tbPrincipal.TabIndex<3 then
  MudarAba(tbiLista,sender)
 else
   MudarAba(tbiCad,sender)
end;

procedure TfrmCadRevisaoMaquinas.cbxTipoManuChange(Sender: TObject);
begin
 if cbxTipoManu.ItemIndex=0 then
 begin
   layDadosMaquias.Enabled    := true;
   layDadosManutencao.Enabled := true;
   edtPlanoManutencao.Text    := '';
   edtPlanoManutencao.Enabled := true;
 end;
 if cbxTipoManu.ItemIndex=1 then
 begin
   vIdPlanoRevisao            :='0';
   layDadosMaquias.Enabled    := true;
   layDadosManutencao.Enabled := true;
   edtPlanoManutencao.Text    := 'Corretiva';
   edtPlanoManutencao.Enabled := false;
 end;
end;

procedure TfrmCadRevisaoMaquinas.DateEdit1ClosePicker(Sender: TObject);
begin
  filtro;
end;

procedure TfrmCadRevisaoMaquinas.EditButton1Click(Sender: TObject);
begin
  if edtMaquina.Text.Length=0 then
  begin
    MyShowMessage('Informe a Maquina Antes!!',false);
    Exit;
  end;

  frmCadRevisao := TfrmCadRevisao.Create(Self);
  frmCadRevisao.edtMaquinaF.Text    := edtMaquina.Text;
  frmCadRevisao.edtMaquinaF.Enabled := false;
  frmCadRevisao.btnBuscarListaClick(Sender);
  try
    frmCadRevisao.ShowModal;
  finally
    vIdPlanoRevisao          := dmRevisao.TRevisaoid.AsString;
    vPlanoRevisaoHoras       := dmRevisao.TRevisaointervalohoras.AsFloat;
    edtPlanoManutencao.Text  := dmRevisao.TRevisaonome.AsString;
  end;
end;

procedure TfrmCadRevisaoMaquinas.EditButton2Click(Sender: TObject);
begin
  frmCadProdutos := TfrmCadProdutos.Create(Self);
  try
    frmCadProdutos.ShowModal;
  finally
    vIdProduto               := dbCtx.TProdutosid.AsString;
    edtProduto.Text          := dbCtx.TProdutosnome.AsString;
    edtCodFab.Text           := dbCtx.TProdutoscodigofabricante.AsString;
  end;
end;

procedure TfrmCadRevisaoMaquinas.EditButton3Click(Sender: TObject);
begin
  frmCadProdutos := TfrmCadProdutos.Create(Self);
  try
    frmCadProdutos.ShowModal;
  finally
    edtProdutoUtilizado.Text := dbCtx.TProdutosnome.AsString;
    vIdProduto               := dbCtx.TProdutosid.AsString;
    frmCadProdutos.Free;
  end;
end;

procedure TfrmCadRevisaoMaquinas.EditButton4Click(Sender: TObject);
begin
 frmUsuarios := TfrmUsuarios.Create(Self);
  try
    frmUsuarios.ShowModal;
  finally
    vIdResponsavel       := dbCtx.TUsuarioid.AsString;
    edtResponsavel.Text  := dbCtx.TUsuarionome.AsString;
  end;
end;

procedure TfrmCadRevisaoMaquinas.EditButton5Click(Sender: TObject);
begin
 frmCadMaquinaVeiculo := TfrmCadMaquinaVeiculo.Create(Self);
  try
    frmCadMaquinaVeiculo.ShowModal;
  finally
    vIdMaquina       := dbCtx.TMaquinasid.AsString;
    edtMaquina.Text  := dbCtx.TMaquinasprefixo.AsString;
  end;
end;

procedure TfrmCadRevisaoMaquinas.EditButton6Click(Sender: TObject);
begin
  frmAuxItemRevisao := TfrmAuxItemRevisao.Create(Self);
  try
    frmAuxItemRevisao.ShowModal;
  finally
    edtVrific.Text := dmRevisao.TAuxRevisaoItemnome.AsString;
    vIdItem        := dmRevisao.TAuxRevisaoItemid.AsString;
    frmAuxItemRevisao.Free;
  end;
end;

procedure TfrmCadRevisaoMaquinas.edtConfirmaServicoClick(Sender: TObject);
begin
 if (rdTerceiro.IsChecked)and(rdInterno.IsChecked) then
 begin
   MyShowMessage('Informe o tipo de Serviço, Terceiro ou Interno!',false);
   Exit;
 end;
 if edtResponsavelServico.Text.Length=0 then
 begin
   MyShowMessage('Informe o Responsavel!',false);
   Exit;
 end;
 if edtDescricao.Text.Length=0 then
 begin
   MyShowMessage('Informe uma Descrição para o serviço!',false);
   Exit;
 end;
 if(edtValorServico.Text.Length=0)and(edtValorServico.Value=0) then
 begin
   MyShowMessage('Informe um valor para o serviço!',false);
   Exit;
 end;
 dmRevisao.TServicoRevisao.Insert;
 dmRevisao.TServicoRevisaoidusuario.AsString       := dbCtx.vIdUsuarioLogado;
 if rdTerceiro.IsChecked then
  dmRevisao.TServicoRevisaotiposervico.AsInteger   :=0;
 if rdInterno.IsChecked then
  dmRevisao.TServicoRevisaotiposervico.AsInteger   :=1;
 dmRevisao.TServicoRevisaoidrevisao.AsString       := vIdPlanoRevisaoApl;
 dmRevisao.TServicoRevisaodescricao.AsString       := edtDescricao.Text;
 dmRevisao.TServicoRevisaovalortotal.AsFloat       := edtValorServico.Value;
 dmRevisao.TServicoRevisaoresponsavel.AsString     := edtResponsavel.Text;
 dmRevisao.TServicoRevisaodatarealizado.AsDateTime := edtDataServico.DateTime;
 try
   dmRevisao.TServicoRevisao.ApplyUpdates(-1);
   myShowMessage('Serviço Adicionado com sucesso!',false);
   dmRevisao.AbreServicosRevisao(vIdPlanoRevisaoApl);
   MudarAba(tbiListaServico,sender);
  except
   on E : Exception do
    myShowMessage('Error ao Inserir uma observação: '+E.Message,false);
 end
end;

procedure TfrmCadRevisaoMaquinas.edtDataInicioClosePicker(Sender: TObject);
begin
  filtro;
end;

procedure TfrmCadRevisaoMaquinas.FormKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
 if key=13 then
  if tbPrincipal.TabIndex=0 then
    filtro;
end;

procedure TfrmCadRevisaoMaquinas.FormShow(Sender: TObject);
begin
  layEdit.Visible       := false;
  tbServico.TabPosition := TTabPosition.None;
  tbServico.ActiveTab   := tbiListaServico;
  edtDataInicio.Date    := date-30;
  Filtro;
  lblBuscar.Text     := 'Filtros';
  lblAdd.Text        := 'Adicionar';
  lblEdit.Text       := 'Editar';
  lblDeleta.Text     := 'Deletar';
  layListaMnu.Width  := 150;
  tbPrincipal.TabPosition := TTabPosition.None;
  tbPrincipal.ActiveTab   := tbiLista;
  tbLayEdit.TabPosition   := TTabPosition.None;
  btnAdd.Enabled          := dbCtx.vTipoBDConfig=2;
  btnEditar.Enabled       := dbCtx.vTipoBDConfig=2;
  btnDeletar.Enabled      := dbCtx.vTipoBDConfig=2;
  vEdit :=0;
end;

procedure TfrmCadRevisaoMaquinas.GeraLista(idPlanoManutencao: string);
var
 item   : TListViewItem;
 txt    : TListItemText;
 txtH   : TListItemPurpose;
 img    : TListItemImage;
 vStatus:string;
begin
 dmRevisao.AbrePlanoManutencao(idPlanoManutencao);
 if rdTtodosF.IsChecked then
 begin
   dmRevisao.qryListaItensPlanoRev.Filtered := false;
 end
 else
 begin
   dmRevisao.qryListaItensPlanoRev.Filtered := false;
   if rdManutencaoF.IsChecked then
    dmRevisao.qryListaItensPlanoRev.Filter   := 'tipo=0';
   if RdLubF.IsChecked then
    dmRevisao.qryListaItensPlanoRev.Filter   := 'tipo=1';
   if RdVerificF.IsChecked then
    dmRevisao.qryListaItensPlanoRev.Filter   := 'tipo=2';
   dmRevisao.qryListaItensPlanoRev.Filtered := true;
 end;

 dmRevisao.qryListaItensPlanoRev.First;
 Lista.Items.Clear;
 while not dmRevisao.qryListaItensPlanoRev.eof do
 begin
     item := Lista.Items.Add;
     with frmCadRevisaoMaquinas do
     begin
       with item  do
       begin

         txt           := TListItemText(Objects.FindDrawable('Text17'));
         txt.Text      := dmRevisao.qryListaItensPlanoRevtipostr.AsString;
         txt.TagString := dmRevisao.qryListaItensPlanoRevitem.AsString;

         txt           := TListItemText(Objects.FindDrawable('Text1'));
         txt.Text      := 'Item : ';
         txt.TagString := dmRevisao.qryListaItensPlanoRevidproduto.AsString;

         txt           := TListItemText(Objects.FindDrawable('Text2'));
         txt.text      := dmRevisao.qryListaItensPlanoRevitemnome.AsString;
         txt.TagString := dmRevisao.qryListaItensPlanoRevobservacao.AsString;

         if dmRevisao.qryListaItensPlanoRevtipo.AsInteger=0 then
         begin
          txt           := TListItemText(Objects.FindDrawable('Text3'));
          txt.Text      := 'Produto : ';
          txt.TagString := dmRevisao.qryListaItensPlanoRevid.AsString;

          txt           := TListItemText(Objects.FindDrawable('Text4'));
          txt.text      := dmRevisao.qryListaItensPlanoRevproduto.AsString;

          txt           := TListItemText(Objects.FindDrawable('Text5'));
          txt.Text      := 'Codigo Fabricante : ';
          txt.TagString := dmRevisao.qryListaItensPlanoRevcodigofabricante.AsString;

          txt           := TListItemText(Objects.FindDrawable('Text6'));
          txt.text      := dmRevisao.qryListaItensPlanoRevcodigofabricante.AsString;

          txt           := TListItemText(Objects.FindDrawable('Text7'));
          txt.Text      := 'Qtde : ';

          txt           := TListItemText(Objects.FindDrawable('Text8'));
          txt.text      := dmRevisao.qryListaItensPlanoRevqtde.AsString;

          img := TListItemImage(Objects.FindDrawable('Image11'));
          img.Bitmap     := frmPrincipal.imgEdit.Bitmap;
          txt            := TListItemText(Objects.FindDrawable('Text14'));
          txt.text       := 'Editar';
         end;
         if dmRevisao.qryListaItensPlanoRevtipo.AsInteger>0 then
         begin
          txt           := TListItemText(Objects.FindDrawable('Text3'));
          txt.Text      := 'Observação : ';
          txt.TagString := dmRevisao.qryListaItensPlanoRevid.AsString;

          txt           := TListItemText(Objects.FindDrawable('Text4'));
          txt.text      := dmRevisao.qryListaItensPlanoRevobservacao.AsString;

          img := TListItemImage(Objects.FindDrawable('Image19'));
          img.Bitmap     := frmPrincipal.imgObs.Bitmap;
          txt            := TListItemText(Objects.FindDrawable('Text18'));
          txt.text       := 'Observação';
         end;

         img := TListItemImage(Objects.FindDrawable('Image9'));
         if dmRevisao.qryListaItensPlanoRevtipo.AsInteger=0 then
          img.Bitmap     := frmPrincipal.IMG_REVISAO.Bitmap;
         if dmRevisao.qryListaItensPlanoRevtipo.AsInteger=1 then
          img.Bitmap     := frmPrincipal.imgLub.Bitmap;
         if dmRevisao.qryListaItensPlanoRevtipo.AsInteger=2 then
          img.Bitmap     := frmPrincipal.imgVerific.Bitmap;

         txt           := TListItemText(Objects.FindDrawable('Text13'));
         txt.text      := 'Excluir';
         txt.TagString := dmRevisao.qryListaItensPlanoRevStatus.AsString;

         img := TListItemImage(Objects.FindDrawable('Image12'));
         img.Bitmap     := frmPrincipal.imgdelete.Bitmap;

         if dmRevisao.qryListaItensPlanoRevstatus.AsInteger=1 then
         begin
          img := TListItemImage(Objects.FindDrawable('Image25'));
          img.Bitmap     := nil;

          img := TListItemImage(Objects.FindDrawable('Image10'));
          img.Bitmap    := frmPrincipal.imgChk.Bitmap;

          txt           := TListItemText(Objects.FindDrawable('Text15'));
          txt.text      := 'Confirmar';


         end;
         if dmRevisao.qryListaItensPlanoRevconfirmado.AsInteger=2 then
         begin
          img := TListItemImage(Objects.FindDrawable('Image25'));
          img.Bitmap     := frmPrincipal.imgConfirmado.Bitmap;

          img := TListItemImage(Objects.FindDrawable('Image10'));
          img.Bitmap    := frmPrincipal.imgConfirmar.Bitmap;

          txt           := TListItemText(Objects.FindDrawable('Text15'));
          txt.text      := 'Confirmado';

         end;
       end;
       dmRevisao.qryListaItensPlanoRev.Next;
     end;
 end;
end;


procedure TfrmCadRevisaoMaquinas.GeraListaEdit(idRevisao: string);
var
 item   : TListViewItem;
 txt    : TListItemText;
 txtH   : TListItemPurpose;
 img    : TListItemImage;
 vStatus:string;
begin
 dmRevisao.AbreItensRevisaoApl(idRevisao);
 if rdTtodosF.IsChecked then
 begin
   dmRevisao.TRevisaoMaquinaItens.Filtered := false;
 end
 else
 begin
   dmRevisao.TRevisaoMaquinaItens.Filtered := false;
   if rdManutencaoF.IsChecked then
    dmRevisao.TRevisaoMaquinaItens.Filter   := 'tipo=0';
   if RdLubF.IsChecked then
    dmRevisao.TRevisaoMaquinaItens.Filter   := 'tipo=1';
   if RdVerificF.IsChecked then
    dmRevisao.TRevisaoMaquinaItens.Filter   := 'tipo=2';
   dmRevisao.TRevisaoMaquinaItens.Filtered := true;
 end;
 dmRevisao.TRevisaoMaquinaItens.First;
 Lista.Items.Clear;
 while not dmRevisao.TRevisaoMaquinaItens.eof do
 begin
     item := Lista.Items.Add;
     with frmCadRevisaoMaquinas do
     begin
       with item  do
       begin

         txt           := TListItemText(Objects.FindDrawable('Text17'));
         txt.Text      := dmRevisao.TRevisaoMaquinaItenstipostr.AsString;
         txt.TagString := dmRevisao.TRevisaoMaquinaItensitem.AsString;

         txt           := TListItemText(Objects.FindDrawable('Text1'));
         txt.Text      := 'Item : ';
         txt.TagString := dmRevisao.TRevisaoMaquinaItensidproduto.AsString;

         txt           := TListItemText(Objects.FindDrawable('Text2'));
         txt.text      := dmRevisao.TRevisaoMaquinaItensitemnome.AsString;
         txt.TagString := dmRevisao.TRevisaoMaquinaItensobservacao.AsString;

         if dmRevisao.TRevisaoMaquinaItenstipo.AsInteger=0 then
         begin
          txt           := TListItemText(Objects.FindDrawable('Text3'));
          txt.Text      := 'Produto : ';
          txt.TagString := dmRevisao.TRevisaoMaquinaItensid.AsString;

          txt           := TListItemText(Objects.FindDrawable('Text4'));
          txt.text      := dmRevisao.TRevisaoMaquinaItensproduto.AsString;

          txt           := TListItemText(Objects.FindDrawable('Text5'));
          txt.Text      := 'Codigo Fabricante : ';
          txt.TagString := dmRevisao.TRevisaoMaquinaItenscodigofabricante.AsString;

          txt           := TListItemText(Objects.FindDrawable('Text6'));
          txt.text      := dmRevisao.TRevisaoMaquinaItenscodigofabricante.AsString;

          txt           := TListItemText(Objects.FindDrawable('Text7'));
          txt.Text      := 'Qtde : ';

          txt           := TListItemText(Objects.FindDrawable('Text8'));
          txt.text      := dmRevisao.TRevisaoMaquinaItensqtde.AsString;

          img := TListItemImage(Objects.FindDrawable('Image11'));
          img.Bitmap     := frmPrincipal.imgEdit.Bitmap;
          txt            := TListItemText(Objects.FindDrawable('Text14'));
          txt.text       := 'Editar';
         end;
         if dmRevisao.qryListaItensPlanoRevtipo.AsInteger>0 then
         begin
          txt           := TListItemText(Objects.FindDrawable('Text3'));
          txt.Text      := 'Observação : ';
          txt.TagString := dmRevisao.TRevisaoMaquinaItensid.AsString;

          txt           := TListItemText(Objects.FindDrawable('Text4'));
          txt.text      := dmRevisao.TRevisaoMaquinaItensobservacao.AsString;

          img := TListItemImage(Objects.FindDrawable('Image19'));
          img.Bitmap     := frmPrincipal.imgObs.Bitmap;
          txt            := TListItemText(Objects.FindDrawable('Text18'));
          txt.text       := 'Observação';
         end;

         img := TListItemImage(Objects.FindDrawable('Image9'));
         if dmRevisao.TRevisaoMaquinaItenstipo.AsInteger=0 then
          img.Bitmap     := frmPrincipal.IMG_REVISAO.Bitmap;
         if dmRevisao.TRevisaoMaquinaItenstipo.AsInteger=1 then
          img.Bitmap     := frmPrincipal.imgLub.Bitmap;
         if dmRevisao.TRevisaoMaquinaItenstipo.AsInteger=2 then
          img.Bitmap     := frmPrincipal.imgVerific.Bitmap;

         txt           := TListItemText(Objects.FindDrawable('Text13'));
         txt.text      := 'Excluir';
         txt.TagString := dmRevisao.TRevisaoMaquinaItensStatus.AsString;

         img := TListItemImage(Objects.FindDrawable('Image12'));
         img.Bitmap     := frmPrincipal.imgdelete.Bitmap;

         if dmRevisao.qryListaItensPlanoRevstatus.AsInteger=1 then
         begin
          img := TListItemImage(Objects.FindDrawable('Image25'));
          img.Bitmap     := nil;

          img := TListItemImage(Objects.FindDrawable('Image10'));
          img.Bitmap    := frmPrincipal.imgChk.Bitmap;

          txt           := TListItemText(Objects.FindDrawable('Text15'));
          txt.text      := 'Confirmar';


         end;
         if dmRevisao.qryListaItensPlanoRevstatus.AsInteger=2 then
         begin
          img := TListItemImage(Objects.FindDrawable('Image25'));
          img.Bitmap     := frmPrincipal.imgConfirmado.Bitmap;

          img := TListItemImage(Objects.FindDrawable('Image10'));
          img.Bitmap    := frmPrincipal.imgConfirmar.Bitmap;

          txt           := TListItemText(Objects.FindDrawable('Text15'));
          txt.text      := 'Confirmado';

         end;
       end;
       dmRevisao.TRevisaoMaquinaItens.Next;
     end;
 end;
end;

procedure TfrmCadRevisaoMaquinas.Image19Click(Sender: TObject);
begin
 if tbServico.TabIndex=1 then
  MudarAba(tbiListaServico,Sender);
 if tbServico.TabIndex=0 then
  MudarAba(tbiLista,Sender);
end;

procedure TfrmCadRevisaoMaquinas.ListaItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
    vIdItemTMP :=
     TAppearanceListViewItem(Lista.Selected).Objects.FindObjectT<TListItemText>
      ('Text3').TagString;

     vIdProduto:=
     TAppearanceListViewItem(Lista.Selected).Objects.FindObjectT<TListItemText>
       ('Text1').TagString;

    vProdutoNome :=
     TAppearanceListViewItem(Lista.Selected).Objects.FindObjectT<TListItemText>
       ('Text4').Text;
    vItemNome    :=
     TAppearanceListViewItem(Lista.Selected).Objects.FindObjectT<TListItemText>
       ('Text2').Text;
    vQtde        :=
     TAppearanceListViewItem(Lista.Selected).Objects.FindObjectT<TListItemText>
       ('Text8').Text;

    vCodFab        :=
     TAppearanceListViewItem(Lista.Selected).Objects.FindObjectT<TListItemText>
       ('Text5').TagString;

    vItemSelect    :=
     TAppearanceListViewItem(Lista.Selected).Objects.FindObjectT<TListItemText>
       ('Text17').TagString;

    vObsSelected       :=
     TAppearanceListViewItem(Lista.Selected).Objects.FindObjectT<TListItemText>
       ('Text2').TagString;

     vStatusSelected       :=
     TAppearanceListViewItem(Lista.Selected).Objects.FindObjectT<TListItemText>
       ('Text13').TagString;

    if ItemObject is TListItemImage then
    begin
     if TListItemImage(ItemObject).Name='Image12' then
     begin
       MyShowMessage('Deseja Realmente Deletar esse Item?',true);
       case frmPrincipal.vMsgConfirma of
         1:begin
            try
              dmRevisao.MudaStatusItemTMP(vIdItemTMP,'-1');
              GeraLista(vIdPlanoRevisao);
              Exit;
            except
             on E : Exception do
              ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
            end;
         end;
       end;
     end;
     if TListItemImage(ItemObject).Name='Image10' then
     begin
      if vStatusSelected='1' then
       dmRevisao.MudaStatusItemTMP(vIdItemTMP,'2')
      else
       dmRevisao.MudaStatusItemTMP(vIdItemTMP,'1');
       GeraLista(vIdPlanoRevisao);
     end;
     if TListItemImage(ItemObject).Name='Image11' then
     begin
       layEdit.Visible           := true;
       lblItem.Text              := vItemSelect;
       edtItemRevisao.Text       := vItemSelect;
       edtProduto.Text           := vProdutoNome;
       edtCodFab.Text            := vCodFab;
       edtqtde.Value             := StrToFloat(vQtde);
       tbLayEdit.ActiveTab       := tbiEdit;
     end;
     if TListItemImage(ItemObject).Name='Image16' then
     begin
       layEdit.Visible           := true;
       lblItemObs.Text           := vItemSelect;
       tbLayEdit.ActiveTab       := tbiObs;
       edtObs.Lines.Clear;
       edtObs.Text               := vObsSelected;
     end;
    end;
end;

procedure TfrmCadRevisaoMaquinas.RdLubFChange(Sender: TObject);
begin
  GeraLista(vIdPlanoRevisao);
end;

procedure TfrmCadRevisaoMaquinas.rdLubrificacaoChange(Sender: TObject);
begin
 tabTipoItem.ActiveTab    := tbiLubrificar;
end;

procedure TfrmCadRevisaoMaquinas.rdManutencaoChange(Sender: TObject);
begin
 tabTipoItem.ActiveTab := tbiManu;
end;

procedure TfrmCadRevisaoMaquinas.rdManutencaoFChange(Sender: TObject);
begin
 GeraLista(vIdPlanoRevisao);
end;

procedure TfrmCadRevisaoMaquinas.rdTtodosFChange(Sender: TObject);
begin
 GeraLista(vIdPlanoRevisao);
end;

procedure TfrmCadRevisaoMaquinas.rdVerificacaoChange(Sender: TObject);
begin
 tabTipoItem.ActiveTab := tbiVerificar;
end;

procedure TfrmCadRevisaoMaquinas.RdVerificFChange(Sender: TObject);
begin
 GeraLista(vIdPlanoRevisao);
end;

procedure TfrmCadRevisaoMaquinas.Rectangle14Click(Sender: TObject);
begin
 dmRevisao.AbreItensReliRevisaoApl(dmRevisao.TRevisaoMaquinaAplid.AsString);
end;

procedure TfrmCadRevisaoMaquinas.Rectangle21Click(Sender: TObject);
begin
 MudarAba(tbiCad,sender);
end;

procedure TfrmCadRevisaoMaquinas.btnAdicionarItemClick(Sender: TObject);
begin
  rdManutencao.IsChecked    := false;
  rdLubrificacao.IsChecked  := false;
  rdVerificacao.IsChecked   := false;
  tabTipoItem.TabPosition   := TTabPosition.None;
  tabTipoItem.TabIndex      := -1;
  edtProdutoUtilizado.Text  :='';
  edtItemRevisao.Text       :='';
  edtLub.Text               :='';
  edtObsLub.Text            :='';
  edtVrific.Text            :='';
  edtObsVerific.Text        :='';
  edtObsManu.Text           :='';
  edtqtde.Value             :=1;
  edtQtdtemManutencao.Value :=0;
  layNovoItem.Height        := 131;
  layNovoItem.Visible       := true;
  MudarAba(tbiAddItem,sender);
end;

procedure TfrmCadRevisaoMaquinas.Rectangle7Click(Sender: TObject);
begin
 edtTab.SetFocus;
 if edtProduto.Text.Length=0 then
 begin
  MyShowMessage('Informe o Produto!',false);
  Exit;
 end;
 if edtqtde.Value=0 then
 begin
  MyShowMessage('Informe a Quantidade!',false);
  Exit;
 end;
 try
  dmRevisao.EditaItemListaTMP(vIdItemTMP, vIdProduto,
  StringReplace(edtqtde.Text,',','.',[rfReplaceAll]));
  MyShowMessage('Item Alterado com Sucesso!',false);
  GeraLista(vIdPlanoRevisao);
  layEdit.Visible := false
 except
   on E : Exception do
    ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
 end;
end;

procedure TfrmCadRevisaoMaquinas.StringGrid1CellDblClick(const Column: TColumn;
  const Row: Integer);
begin
 lblPlanoManutencao.Text := dmRevisao.TRevisaoMaquinaAplplanorevisao.AsString;
 lblMaquina.Text         := dmRevisao.TRevisaoMaquinaAplprefixo.AsString;
 lblDataInicio.Text      := dmRevisao.TRevisaoMaquinaApldatainicio.AsString;
 lblDataFim.Text         := dmRevisao.TRevisaoMaquinaApldatafim.AsString;
 lblHorimetro.Text       := dmRevisao.TRevisaoMaquinaAplhorimetro.AsString;
 lblResponsavel.Text     := dmRevisao.TRevisaoMaquinaAplresponsavel.AsString;
 dmRevisao.AbreItensRevisaoApl(dmRevisao.TRevisaoMaquinaAplid.AsString);
 tbPrincipal.ActiveTab   := tbiDet;
end;

procedure TfrmCadRevisaoMaquinas.Filtro;
var
 vFiltro:string;
begin
 vFiltro := '';
 if edtNomeFiltro.Text.Length>0 then
  vFiltro := ' and m.prefixo like '+QuotedStr('%'+edtNomeFiltro.Text+'%');

 vFiltro  := vFiltro+' and c.datainicio between '+FormatDateTime('yyyy-mm-dd',edtDataInicio.Date).QuotedString+' and '+
 FormatDateTime('yyyy-mm-dd',edtDataFim.Date).QuotedString;
 dmRevisao.AbreRevisaoApl(vFiltro);
end;

end.
