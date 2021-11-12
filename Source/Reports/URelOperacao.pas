unit URelOperacao;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Rtti,
  FMX.Grid.Style, FMX.Ani, FMX.StdCtrls, FMX.ScrollBox, FMX.Grid, FMX.Edit,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, FMX.ListBox,
  FMX.DateTimeCtrls, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Components,
  Data.Bind.Grid, Data.Bind.DBScope, FMX.Memo, FMX.TabControl, FMX.Menus;

type
  TfrmRelOperacao = class(TForm)
    layListaP: TLayout;
    imgLogoCad: TImage;
    ToolBar1: TToolBar;
    recToolBar: TRectangle;
    lblCad: TLabel;
    btnFechar: TImage;
    AnimacaoMnu: TFloatAnimation;
    layLista: TLayout;
    layFiltros: TLayout;
    RecGro: TRectangle;
    ToolBar2: TToolBar;
    layTotalRegistroGrid: TLayout;
    lblGridTotalRegistro: TLabel;
    layFooterGrid1: TLayout;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edtDataInicio: TDateEdit;
    edtDataFim: TDateEdit;
    Label3: TLabel;
    cbxAtividade: TComboBox;
    cbxResponsavel: TComboBox;
    Label4: TLabel;
    cbxSetor: TComboBox;
    Label5: TLabel;
    Buscar: TButton;
    GridAtividadesRel: TStringGrid;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    Layout1: TLayout;
    Layout2: TLayout;
    Layout3: TLayout;
    lblGridAreaPrev: TLabel;
    lblGridAreaRealizada: TLabel;
    lblGridTotalHoraMaquina: TLabel;
    lblGridHoraHA: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    btnPrint: TButton;
    Image1: TImage;
    Image2: TImage;
    btnExportar: TButton;
    Image3: TImage;
    SaveDialog1: TSaveDialog;
    PopupmnuAltera: TPopupMenu;
    MenuItem1: TMenuItem;
    layAuxiliar: TLayout;
    Rectangle34: TRectangle;
    Animation: TFloatAnimation;
    BindSourceDB5: TBindSourceDB;
    LinkFillControlToField1: TLinkFillControlToField;
    BindSourceDB6: TBindSourceDB;
    LinkFillControlToField2: TLinkFillControlToField;
    LinkFillControlToField3: TLinkFillControlToField;
    BindSourceDB7: TBindSourceDB;
    LinkFillControlToField4: TLinkFillControlToField;
    Layout10: TLayout;
    Rectangle6: TRectangle;
    Layout12: TLayout;
    Label12: TLabel;
    edtResponsavel: TEdit;
    EditButton2: TEditButton;
    Rectangle7: TRectangle;
    Layout13: TLayout;
    Layout14: TLayout;
    Label13: TLabel;
    Label14: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    edtDataIniAtividade: TDateEdit;
    edtDataFimAtividade: TDateEdit;
    edtAreaPrev: TEdit;
    edtAreaReal: TEdit;
    Layout15: TLayout;
    btnCancela: TRectangle;
    Label15: TLabel;
    Image5: TImage;
    btnConfirmaAtividade: TRectangle;
    Label16: TLabel;
    Image6: TImage;
    Rectangle8: TRectangle;
    Layout16: TLayout;
    Label17: TLabel;
    edtObservacaoAtividade: TEdit;
    Layout31: TLayout;
    Rectangle22: TRectangle;
    Label28: TLabel;
    recAux: TRectangle;
    layAuxiliares: TLayout;
    tabAuxCad: TTabControl;
    tbiSolidos: TTabItem;
    recAuxiliar: TRectangle;
    Layout46: TLayout;
    Layout48: TLayout;
    Label40: TLabel;
    Label41: TLabel;
    cbxTipoAplicacaoSolido: TComboBox;
    cbxTipoOperacaoSolid: TComboBox;
    tbiPuverizacao: TTabItem;
    RecPulve: TRectangle;
    Layout47: TLayout;
    Layout49: TLayout;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    cbxTipoOperacaoPulverizacao: TComboBox;
    cbxFinalidadePulverizacao: TComboBox;
    cbxCulturaPulverizacao: TComboBox;
    tbiPlantio: TTabItem;
    RecPlantio: TRectangle;
    Layout45: TLayout;
    Layout50: TLayout;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label81: TLabel;
    cbxPlantioTipoOp: TComboBox;
    cbxPlantioCobertura: TComboBox;
    cbxPlantioCultura: TComboBox;
    cbxQualidadeCobertura: TComboBox;
    LinkFillControlToFieldid: TLinkFillControlToField;
    LinkFillControlToFieldid2: TLinkFillControlToField;
    LinkFillControlToField5: TLinkFillControlToField;
    LinkFillControlToField6: TLinkFillControlToField;
    Layout4: TLayout;
    Layout5: TLayout;
    Label19: TLabel;
    cbxVariedade: TComboBox;
    BindSourceDB2: TBindSourceDB;
    LinkFillControlToFieldid3: TLinkFillControlToField;
    Label11: TLabel;
    cbxTalhao: TComboBox;
    BindSourceDB3: TBindSourceDB;
    LinkFillControlToFieldnome: TLinkFillControlToField;
    cbxCultura: TComboBox;
    Label18: TLabel;
    LinkFillControlToField7: TLinkFillControlToField;
    lblTipo: TLabel;
    cbxTipoAreo: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure cbxAtividadeChange(Sender: TObject);
    procedure cbxResponsavelChange(Sender: TObject);
    procedure cbxSetorChange(Sender: TObject);
    procedure BuscarClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnExportarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure btnConfirmaAtividadeClick(Sender: TObject);
    procedure cbxTipoAplicacaoSolidoChange(Sender: TObject);
    procedure cbxCulturaPulverizacaoChange(Sender: TObject);
    procedure cbxPlantioCulturaChange(Sender: TObject);
    procedure cbxPlantioCoberturaChange(Sender: TObject);
    procedure EditButton2Click(Sender: TObject);
    procedure btnCancelaClick(Sender: TObject);
    procedure cbxVariedadeChange(Sender: TObject);
  private
    vIdAtividade,vidvariedade,vIdResponsavel,vSetorId,vIdAtividadeSelect,vIdOperacaoSelect:string;
    vIdTalhao,vIdSafra,vIdMaquina,vIdProduto,
    vIdTipoOcorrencia,idOpClick,vAreaTalhao,vIdTipoAplicacaoSolido,
    vIdCulturaPulverizacao,vIdCulturaPlantio,vIdReceituario,vIdCobertura:string;
    vFinalizandoOP:Integer;
    procedure CarregaCombo;
    procedure SomarColunasGrid;
  public
    procedure MyShowMessage(msg: string; btnCancel: Boolean);
    procedure GeraListaTalhao(vIdSetor:string);
  end;

var
  frmRelOperacao: TfrmRelOperacao;

implementation

{$R *.fmx}

uses UPrincipal, DataContext, UdmReport, UMsgDlg, UUsuarios;

{ TfrmRelOperacao }

procedure TfrmRelOperacao.GeraListaTalhao(vIdSetor:string);
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
end;


procedure TfrmRelOperacao.MenuItem1Click(Sender: TObject);
begin
  vIdAtividadeSelect := dmRel.qryRelOperacaoidoperacao.AsString;
  dbCtx.AbreOperacaoEdit(dmRel.qryRelOperacaoid.AsString);
  dbCtx.QryOperacaoSafraTalhao.Edit;
  if vIdAtividadeSelect='1' then
  begin
    recAux.Height         := 55;
    tabAuxCad.TabPosition := TTabPosition.None;
    tabAuxCad.ActiveTab   := tbiSolidos;
    dbCtx.TAuxTipoOperacaoSolido.Close;
    dbCtx.TAuxTipoOperacaoSolido.Open;
    cbxTipoAplicacaoSolido.ItemIndex := cbxTipoAplicacaoSolido.Items.IndexOf(dbCtx.QryOperacaoSafraTalhaotipoopesolido.AsString);
    layAuxiliares.Visible := true;
  end;
  if vIdAtividadeSelect='2' then
  begin
    recAux.Height         := 55;
    tabAuxCad.TabPosition := TTabPosition.None;
    tabAuxCad.ActiveTab   := tbiPuverizacao;
    dbCtx.TAuxCulturas.Close;
    dbCtx.TAuxCulturas.Open;
    cbxCulturaPulverizacao.ItemIndex := cbxCulturaPulverizacao.Items.IndexOf(dbCtx.QryOperacaoSafraTalhaoCultura.AsString);
    layAuxiliares.Visible := true;
  end;
  if vIdAtividadeSelect='3' then
  begin
    recAux.Height                 := 110;
    tabAuxCad.TabPosition         := TTabPosition.None;
    tabAuxCad.ActiveTab           := tbiPlantio;
    dbCtx.TAuxCulturas.Close;
    dbCtx.TAuxCulturas.Open;
    dbCtx.TAuxCultivares.Close;
    dbCtx.TAuxCultivares.Open;
    cbxPlantioCultura.ItemIndex   := cbxPlantioCultura.Items.IndexOf(dbCtx.QryOperacaoSafraTalhaocultura.AsString);
    dbCtx.TAuxCobertura.Close;
    dbCtx.TAuxCobertura.Open;
    cbxPlantioCobertura.ItemIndex := cbxPlantioCobertura.Items.IndexOf(dbCtx.QryOperacaoSafraTalhaocobertura.AsString);
    layAuxiliares.Visible         := true;
    vidvariedade                  := dbCtx.QryOperacaoSafraTalhaoidvariedade.AsString;
    cbxVariedade.ItemIndex        := cbxVariedade.Items.IndexOf(dbCtx.QryOperacaoSafraTalhaovariedade.AsString);
  end;
  vIdResponsavel                         :=   dbCtx.QryOperacaoSafraTalhaoidresponsavel.AsString;
  vIdTipoAplicacaoSolido                 :=   dbCtx.QryOperacaoSafraTalhaoidtipoaplicacaosolido.AsString;
  vIdreceituario                         :=   dbCtx.QryOperacaoSafraTalhaoidreceituario.AsString;
  vIdCobertura                           :=   dbCtx.QryOperacaoSafraTalhaoidcobertura.AsString;
  vIdCulturaPlantio                      :=   dbCtx.QryOperacaoSafraTalhaoidcultura.AsString;
  edtDataIniAtividade.Date               :=   dbCtx.QryOperacaoSafraTalhaodatainicio.AsDateTime;
  edtDataFimAtividade.Date               :=   dbCtx.QryOperacaoSafraTalhaodatafim.AsDateTime;
  edtAreaPrev.Text                       :=   dbCtx.QryOperacaoSafraTalhaoareaprevista.AsString;
  edtAreaReal.Text                       :=   dbCtx.QryOperacaoSafraTalhaoarearealizada.AsString;
  edtResponsavel.Text                    :=   dbCtx.RetornaNomeResponsavel(dbCtx.QryOperacaoSafraTalhaoidresponsavel.AsString);
  edtObservacaoAtividade.Text            :=   dbCtx.QryOperacaoSafraTalhaoobservacao.AsString;
  cbxTipoOperacaoSolid.ItemIndex         :=   cbxTipoOperacaoSolid.Items.IndexOf(dbCtx.QryOperacaoSafraTalhaotipoterraaereo.AsString);
  cbxTipoOperacaoPulverizacao.ItemIndex  :=   cbxTipoOperacaoPulverizacao.Items.IndexOf(dbCtx.QryOperacaoSafraTalhaotipoterraaereo.AsString);
  cbxFinalidadePulverizacao.ItemIndex    :=   cbxFinalidadePulverizacao.Items.IndexOf(UpperCase(dbCtx.QryOperacaoSafraTalhaofinalidade.AsString));
  cbxPlantioTipoOp.ItemIndex             :=   cbxPlantioTipoOp.Items.IndexOf(dbCtx.QryOperacaoSafraTalhaotipoterraaereo.AsString);
  cbxQualidadeCobertura.ItemIndex        :=   cbxQualidadeCobertura.Items.IndexOf(dbCtx.QryOperacaoSafraTalhaoqualidadecobertura.AsString);
  layAuxiliar.Visible := true;
end;

procedure TfrmRelOperacao.MyShowMessage(msg: string; btnCancel: Boolean);
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

procedure TfrmRelOperacao.SomarColunasGrid;
var
  Sum : Double;
  Val : Double;
  I   : Integer;
  Sum1: Double;
  Val1: Double;
  Sum2: Double;
  Val2: Double;
  Sum3: Double;
  Val3: Double;
begin
  Sum := 0;
  val := 0;
  Sum1:= 0;
  Val1:= 0;
  I   := 0;
  Sum2:= 0;
  Val2:= 0;
  Sum3:= 0;
  Val3:= 0;
  for I := 0 to GridAtividadesRel.RowCount-1 do
  begin
   if TryStrToFloat(GridAtividadesRel.Cells[7,I],Val) then
    Sum := Sum + Val;
   if TryStrToFloat(GridAtividadesRel.Cells[8,I],Val1) then
    Sum1:= Sum1 + Val1;
   if TryStrToFloat(GridAtividadesRel.Cells[9,I],Val2) then
    Sum2:= Sum2 + Val2;
   if TryStrToFloat(GridAtividadesRel.Cells[10,I],Val3) then
    Sum3:= Sum3 + Val3;
  end;
  if I>0 then
  begin
    lblGridTotalRegistro.Text    := IntToStr(I);
    lblGridAreaPrev.Text         := FormatFloat('####,##.00',(Sum));
    lblGridAreaRealizada.Text    := FormatFloat('####,##.00',(Sum1));
    lblGridTotalHoraMaquina.Text := FormatFloat('####,##.00',(Sum2));
    lblGridHoraHA.Text           := formatfloat('###,###,##0.000',(Sum3/I));
  end
  else
  begin
    lblGridTotalRegistro.Text    := '0';
    lblGridAreaPrev.Text         := '0,00';
    lblGridAreaRealizada.Text    := '0,00';
    lblGridTotalHoraMaquina.Text := '0,00';
    lblGridHoraHA.Text           := '0,00';
  end;
end;
procedure TfrmRelOperacao.btnCancelaClick(Sender: TObject);
begin
 layAuxiliar.Visible := false;
end;

procedure TfrmRelOperacao.btnConfirmaAtividadeClick(Sender: TObject);
var
 vTipoAereo:string;
begin
 if vIdAtividadeSelect='1' then
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
 if vIdAtividadeSelect='2' then
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
 end;
 if vIdAtividadeSelect='3' then
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
  dbCtx.TOperacaoSafraTalhao.Close;
  dbCtx.TOperacaoSafraTalhao.Open;
  dbCtx.TOperacaoSafraTalhao.Filtered :=false;
  dbCtx.TOperacaoSafraTalhao.Filter   :='id='+dmRel.qryRelOperacaoid.AsString;
  dbCtx.TOperacaoSafraTalhao.Filtered :=true;
  dbCtx.TOperacaoSafraTalhao.Edit;
  if not dbCtx.TOperacaoSafraTalhao.IsEmpty then
  begin
    dbCtx.TOperacaoSafraTalhaoidoperacao.AsString         := vIdAtividadeSelect;
    dbCtx.TOperacaoSafraTalhaoidResponsavel.AsString      := vIdResponsavel;
    dbCtx.TOperacaoSafraTalhaodatainicio.AsDateTime       := edtDataIniAtividade.Date;
    dbCtx.TOperacaoSafraTalhaodatafim.AsDateTime          := edtDataFimAtividade.Date;
    dbCtx.TOperacaoSafraTalhaoareaPrevista.Asstring       := edtAreaPrev.Text;
    dbCtx.TOperacaoSafraTalhaoarearealizada.Asstring      := edtAreaReal.Text;
    dbCtx.TOperacaoSafraTalhaoobservacao.AsString         := edtObservacaoAtividade.Text;
    dbCtx.TOperacaoSafraTalhaodataalteracao.AsDateTime    := date;
    dbCtx.TOperacaoSafraTalhaoidusuarioalteracao.AsString := dbCtx.vIdUsuarioLogado;
    dbCtx.TOperacaoSafraTalhaosyncaws.AsInteger           := 0;
    dbCtx.TOperacaoSafraTalhaosyncfaz.AsInteger           := 0;
    if vIdAtividadeSelect='1' then
    begin
      dbCtx.TOperacaoSafraTalhaotipoterraaereo.AsString        := cbxTipoOperacaoSolid.Selected.Text;
      dbCtx.TOperacaoSafraTalhaoidtipoaplicacaosolido.AsString := vIdTipoAplicacaoSolido;
    end;
    if vIdAtividadeSelect='2' then
    begin
      dbCtx.TOperacaoSafraTalhaotipoterraaereo.AsString        := cbxTipoOperacaoPulverizacao.Selected.Text;
      dbCtx.TOperacaoSafraTalhaofinalidade.AsString            := cbxFinalidadePulverizacao.Selected.Text;
      dbCtx.TOperacaoSafraTalhaoidcultura.AsString             := vIdCulturaPulverizacao;
      dbCtx.TOperacaoSafraTalhaoidreceituario.AsString         := vIdreceituario;
    end;
    if vIdAtividadeSelect='3' then
    begin
      dbCtx.TOperacaoSafraTalhaoidcultura.AsString             := vIdCulturaPlantio;
      dbCtx.TOperacaoSafraTalhaoidcobertura.AsString           := vIdCobertura;
      dbCtx.TOperacaoSafraTalhaoqualidadecobertura.AsString    := cbxQualidadeCobertura.Selected.Text;
      dbCtx.TOperacaoSafraTalhaotipoterraaereo.AsString        := cbxPlantioTipoOp.Selected.Text;
      dbCtx.TOperacaoSafraTalhaoidvariedade.AsString           := vidvariedade;
    end;
    dbCtx.TOperacaoSafraTalhaostatus.AsInteger            := 2;
    try
      dbCtx.TOperacaoSafraTalhao.ApplyUpdates(-1);
      MyShowMessage('Atividade Atualizada com sucesso!!',false);
      if cbxResponsavel.ItemIndex=0 then
        vIdResponsavel :='0';

      if cbxAtividade.ItemIndex=0 then
        vIdAtividade   :='0';

      if cbxSetor.ItemIndex=0 then
        vSetoriD   :='0';

      if cbxTipoAreo.ItemIndex>0 then
        vTipoAereo := cbxTipoAreo.Selected.Text
      else
        vTipoAereo :='';


      dmRel.AbreRelatorioOperacao(
        FormatDateTime('yyyy-mm-dd',edtDataInicio.Date),
        FormatDateTime('yyyy-mm-dd',edtDataFim.Date),
        vIdResponsavel,
        vIdAtividade,vSetoriD,
        cbxTalhao.Selected.Text.QuotedString,
        cbxCultura.Selected.Text.QuotedString,
        vTipoAereo.QuotedString);
      SomarColunasGrid;
      btnPrint.Enabled           := GridAtividadesRel.RowCount>0;
      btnExportar.Enabled        := GridAtividadesRel.RowCount>0;
      layAuxiliar.Visible := false;
    except
      on E: Exception do
       myShowMessage('Erro ao Atualizar Atividade:'+E.Message,false);
    end;
  end;
end;

procedure TfrmRelOperacao.btnExportarClick(Sender: TObject);
var
 csv: tstringlist;
 row, col: integer;
 s: string;
begin
 if SaveDialog1.Execute then
 begin
   csv:= tstringlist.create;
   for row:= 1 to GridAtividadesRel.rowcount do
    begin
     s:= '';
     if row=1 then
     begin
       for col:= 0 to GridAtividadesRel.ColumnCount-1 do
        s:= s + GridAtividadesRel.Columns[col].Header + ';';
       csv.add(s)
     end
     else
     begin
       for col:= 0 to GridAtividadesRel.ColumnCount-1 do
        s:= s + GridAtividadesRel.Cells[col, row-1] + ';';
       csv.add(s)
     end;
    end;
   csv.savetofile(SaveDialog1.FileName);
   csv.free;
 end;
end;

procedure TfrmRelOperacao.btnFecharClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmRelOperacao.btnPrintClick(Sender: TObject);
var
 vAreaTotal,
 vAreaTotalRealizada:Double;
 vTipoAereo:string;
begin
 if GridAtividadesRel.RowCount=0 then
 begin
   MyShowMessage('Não existe dados para esse filtro!!',false);
   Exit;
 end;
 vAreaTotal :=0;
 vAreaTotalRealizada:=0;
 while not dmRel.qryRelOperacao.eof do
 begin
   vAreaTotal          := vAreaTotal+dmRel.qryRelOperacao.FieldByName('areaprevista').AsFloat;
   vAreaTotalRealizada := vAreaTotalRealizada+dmRel.qryRelOperacao.FieldByName('arearealizada').AsFloat;
   dmRel.qryRelOperacao.Next;
 end;
 dmRel.pplblAreaTotal.Text     := FormatFloat('####,#0.00',vAreaTotal);
 dmRel.pplblAreaRealizada.Text := FormatFloat('####,#0.00',vAreaTotalRealizada);
 dmRel.ppLblDataIni.Text       := edtDataInicio.Text;
 dmRel.ppLblDatafim.Text       := edtDataFim.Text;
 dmRel.ReportOperacao.Print;
end;

procedure TfrmRelOperacao.BuscarClick(Sender: TObject);
var
 vTipoAereo,vTalhao,vCultura:string;
begin
 if cbxResponsavel.ItemIndex=0 then
  vIdResponsavel :='0';

 if cbxAtividade.ItemIndex=0 then
  vIdAtividade   :='0';

 if cbxSetor.ItemIndex=0 then
  vSetoriD   :='0';

 if cbxTipoAreo.ItemIndex>0 then
  vTipoAereo := cbxTipoAreo.Selected.Text.QuotedString
 else
  vTipoAereo :='';

  if cbxTalhao.ItemIndex>-1 then
   vTalhao := cbxTalhao.Selected.Text.QuotedString
  else
   vTalhao :='';

  if cbxCultura.ItemIndex>-1 then
   vCultura := cbxCultura.Selected.Text.QuotedString
  else
   vCultura :='';

  if dmRel=nil then
   dmRel := TdmRel.Create(Self);

  dmRel.AbreRelatorioOperacao(
  FormatDateTime('yyyy-mm-dd',edtDataInicio.Date),
  FormatDateTime('yyyy-mm-dd',edtDataFim.Date),
  vIdResponsavel,
  vIdAtividade,
  vSetoriD,
  vTalhao,
  vCultura,
  vTipoAereo);
 SomarColunasGrid;
 btnPrint.Enabled           := GridAtividadesRel.RowCount>0;
 btnExportar.Enabled        := GridAtividadesRel.RowCount>0;
end;

procedure TfrmRelOperacao.CarregaCombo;
begin
  cbxSetor.Items.Clear;
  dbCtx.TSetores.Close;
  dbCtx.TSetores.Open;
  dbCtx.TSetores.First;
  cbxSetor.Items.Add('Todos');
  while not dbCtx.TSetores.Eof do
  begin
    cbxSetor.Items.AddObject(dbCtx.TSetoresnome.AsString,TObject(dbCtx.TSetoresid.AsInteger));
    dbCtx.TSetores.Next;
  end;
  cbxSetor.ItemIndex :=0;

  cbxResponsavel.Items.Clear;
  cbxResponsavel.Items.Add('Todos');
  dbCtx.TUsuario.Close;
  dbCtx.TUsuario.Open;
  dbCtx.TUsuario.First;
  while not dbCtx.TUsuario.Eof do
  begin
    cbxResponsavel.Items.AddObject(dbCtx.TUsuarionome.AsString,TObject(dbCtx.TUsuarioid.AsInteger));
    dbCtx.TUsuario.Next;
  end;
  cbxResponsavel.ItemIndex :=0;
end;

procedure TfrmRelOperacao.cbxAtividadeChange(Sender: TObject);
begin
 if cbxAtividade.ItemIndex>0 then
  vIdAtividade := intToStr(cbxAtividade.ItemIndex)
 else
  vIdAtividade := '0';
 cbxTipoAreo.Visible        := cbxAtividade.ItemIndex=2;
 lblTipo.Visible            := cbxAtividade.ItemIndex=2;
end;

procedure TfrmRelOperacao.cbxCulturaPulverizacaoChange(Sender: TObject);
begin
  if cbxCulturaPulverizacao.ItemIndex>-1 then
   vIdCulturaPulverizacao := LinkFillControlToFieldid2.BindList.GetSelectedValue.AsString;
end;

procedure TfrmRelOperacao.cbxPlantioCoberturaChange(Sender: TObject);
begin
 if cbxPlantioCobertura.ItemIndex>-1 then
  vIdCobertura := LinkFillControlToField6.BindList.GetSelectedValue.AsString;
end;

procedure TfrmRelOperacao.cbxPlantioCulturaChange(Sender: TObject);
begin
 if cbxPlantioCultura.ItemIndex>-1 then
  vIdCulturaPlantio := LinkFillControlToField5.BindList.GetSelectedValue.AsString;
end;

procedure TfrmRelOperacao.cbxResponsavelChange(Sender: TObject);
begin
 if cbxResponsavel.ItemIndex>0 then
  vIdResponsavel := IntToStr(Integer(cbxResponsavel.Items.Objects[cbxResponsavel.ItemIndex]))
 else
  vIdResponsavel :='0';
end;

procedure TfrmRelOperacao.cbxSetorChange(Sender: TObject);
begin
 if cbxSetor.ItemIndex>0 then
 begin
  vSetorId := IntToStr(Integer(cbxSetor.Items.Objects[cbxSetor.ItemIndex]));
  GeraListaTalhao(vSetorId);
 end
else
  vSetoriD :='0';
end;



procedure TfrmRelOperacao.cbxTipoAplicacaoSolidoChange(Sender: TObject);
begin
  if cbxTipoAplicacaoSolido.ItemIndex>-1 then
   vIdTipoAplicacaoSolido := LinkFillControlToFieldid.BindList.GetSelectedValue.AsString;
end;

procedure TfrmRelOperacao.cbxVariedadeChange(Sender: TObject);
begin
 if cbxVariedade.ItemIndex>-1 then
  vidvariedade := LinkFillControlToFieldid3.BindList.GetSelectedValue.AsString;
end;

procedure TfrmRelOperacao.EditButton2Click(Sender: TObject);
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

procedure TfrmRelOperacao.FormShow(Sender: TObject);
begin
 dbCtx.TAuxCulturas.Close;
 dbCtx.TAuxCulturas.Open;
 cbxTipoAreo.Visible        := false;
 lblTipo.Visible            := false;
 GeraListaTalhao('');
 layAuxiliar.Visible        := false;
 cbxAtividade.ItemIndex     :=0;
 btnPrint.Enabled           := false;
 btnExportar.Enabled        := false;
 edtDataInicio.Date         := date-30;
 edtDataFim.Date            := date;
 GridAtividadesRel.RowCount :=0;
 CarregaCombo;
end;

end.
