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
    BindSourceDB5: TBindSourceDB;
    LinkFillControlToField1: TLinkFillControlToField;
    BindSourceDB6: TBindSourceDB;
    LinkFillControlToField2: TLinkFillControlToField;
    LinkFillControlToField3: TLinkFillControlToField;
    BindSourceDB7: TBindSourceDB;
    LinkFillControlToField4: TLinkFillControlToField;
    LinkFillControlToFieldid: TLinkFillControlToField;
    LinkFillControlToFieldid2: TLinkFillControlToField;
    LinkFillControlToField5: TLinkFillControlToField;
    LinkFillControlToField6: TLinkFillControlToField;
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
    layAuxiliar: TLayout;
    Rectangle34: TRectangle;
    TabAux: TTabControl;
    tbiAddMaquina: TTabItem;
    Rectangle9: TRectangle;
    Layout17: TLayout;
    Label20: TLabel;
    edtMaquina: TEdit;
    EditButton3: TEditButton;
    Rectangle10: TRectangle;
    Layout18: TLayout;
    Label21: TLabel;
    edtOperador: TEdit;
    Rectangle11: TRectangle;
    Layout19: TLayout;
    Layout20: TLayout;
    Label22: TLabel;
    Label23: TLabel;
    Label27: TLabel;
    Label34: TLabel;
    Label46: TLabel;
    edtDataMaquina: TDateEdit;
    edtHoraIni: TEdit;
    edtHoraFim: TEdit;
    edtHorasTrabalhada: TEdit;
    edtHorasParado: TEdit;
    Rectangle12: TRectangle;
    Layout21: TLayout;
    Label24: TLabel;
    edtObsMaquina: TEdit;
    Layout22: TLayout;
    Rectangle13: TRectangle;
    Label25: TLabel;
    Image4: TImage;
    btnConfirmaMaquina: TRectangle;
    Label26: TLabel;
    Image7: TImage;
    Layout32: TLayout;
    Rectangle23: TRectangle;
    Label29: TLabel;
    Animation: TFloatAnimation;
    tbiListaMaquinas: TTabItem;
    Layout4: TLayout;
    Rectangle1: TRectangle;
    Label12: TLabel;
    GridMaquinas: TStringGrid;
    BindSourceDB4: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB4: TLinkGridToDataSource;
    PopupEditaMaquina: TPopupMenu;
    MenuItem2: TMenuItem;
    Image5: TImage;
    Image6: TImage;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    EditButton1: TEditButton;
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
    procedure btnCancelaClick(Sender: TObject);
    procedure EditButton3Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure btnConfirmaMaquinaClick(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Rectangle13Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure edtHoraFimChangeTracking(Sender: TObject);
    procedure edtHoraIniChangeTracking(Sender: TObject);
    procedure EditButton1Click(Sender: TObject);
  private
    vIdAtividade,vidvariedade,vIdResponsavel,vSetorId,vIdOperacaoSelect:string;
    vIdTalhao,vIdSafra,vIdMaquina,vIdProduto,vIdOperador,
    vIdTipoOcorrencia,idOpClick,vAreaTalhao,vIdTipoAplicacaoSolido,
    vIdCulturaPulverizacao,vIdCulturaPlantio,vIdReceituario,vIdCobertura:string;
    vFinalizandoOP:Integer;
    procedure CarregaCombo;
    procedure SomarColunasGrid;
  public
    procedure MyShowMessage(msg: string; btnCancel: Boolean);
    procedure GeraListaTalhao(vIdSetor:string);
    procedure LimpaCampos;
  end;

var
  frmRelOperacao: TfrmRelOperacao;

implementation

{$R *.fmx}

uses UPrincipal, DataContext, UdmReport, UMsgDlg, UUsuarios,
  UAuxTipoMaquinaVeiculo, UCadMaquina, UOperadorMaquinas;

{ TfrmRelOperacao }

procedure TfrmRelOperacao.LimpaCampos;
begin
  edtMaquina.Text             :='';
  edtOperador.Text            :='';
  edtHoraIni.Text             :='0';
  edtHoraFim.Text             :='0';
  edtHorasParado.Text         :='0';
  edtObsMaquina.Text          :='';
end;

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


procedure TfrmRelOperacao.Image5Click(Sender: TObject);
begin
 layAuxiliar.Visible := false;
end;

procedure TfrmRelOperacao.Image6Click(Sender: TObject);
begin
 TabAux.TabIndex := 0;
end;

procedure TfrmRelOperacao.MenuItem1Click(Sender: TObject);
begin
  dbCtx.AbreMaquinaOperacao(dmRel.qryRelOperacaoid.AsString);
  TabAux.TabPosition := TTabPosition.None;
  TabAux.TabIndex    :=0;
  layAuxiliar.Visible := true;
end;

procedure TfrmRelOperacao.MenuItem2Click(Sender: TObject);
begin
 dbCtx.TMaquinasOperacao.Close;
 dbCtx.TMaquinasOperacao.Open;
 dbCtx.TMaquinasOperacao.Filtered := false;
 dbCtx.TMaquinasOperacao.Filter   := 'id='+dbCtx.QryMaquinaOperacaoid.AsString;
 dbCtx.TMaquinasOperacao.Filtered := true;
 if not dbCtx.TMaquinasOperacao.IsEmpty then
 begin
  dbCtx.TMaquinasOperacao.Edit;
  edtMaquina.Text     := dbCtx.QryMaquinaOperacaomaquina.AsString;
  vIdMaquina          := dbCtx.QryMaquinaOperacaoidmaquina.AsString;
  edtOperador.Text    := dbCtx.QryMaquinaOperacaooperador.AsString;
  vIdOperador         := dbCtx.QryMaquinaOperacaoidoperador.AsString;
  edtHoraIni.Text     := dbCtx.QryMaquinaOperacaohorainicio.AsString;
  edtHoraFim.Text     := dbCtx.QryMaquinaOperacaohorafim.AsString;
  edtHorasTrabalhada.Text := dbCtx.QryMaquinaOperacaohoratotal.AsString;
  edtHorasParado.Text     := dbCtx.QryMaquinaOperacaohoraparada.AsString;
  edtDataMaquina.Date     := dbCtx.QryMaquinaOperacaodata.AsDateTime;
  TabAux.TabIndex :=1;
 end;
end;

procedure TfrmRelOperacao.MenuItem3Click(Sender: TObject);
begin
 MyShowMessage('Deseja Realmente Finalizar essa Operação?',true);
 case frmPrincipal.vMsgConfirma of
   1:begin
    try
      dbCtx.DeletaMaquinaOp(dbCtx.QryMaquinaOperacaoid.AsString);
      dbCtx.AbreMaquinaOperacao(dmRel.qryRelOperacaoid.AsString);
     except
     on E : Exception do
      ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
    end;
   end;
 end;
end;

procedure TfrmRelOperacao.MenuItem4Click(Sender: TObject);
begin
 LimpaCampos;
 dbCtx.TMaquinasOperacao.Filtered := false;
 dbCtx.TMaquinasOperacao.Close;
 dbCtx.TMaquinasOperacao.Open;
 dbCtx.TMaquinasOperacao.Insert;
 dbCtx.TMaquinasOperacaoidusuario.AsString := dbCtx.vIdUsuarioLogado;
 TabAux.TabIndex  :=1;
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

procedure TfrmRelOperacao.Rectangle13Click(Sender: TObject);
begin
 TabAux.TabIndex :=0;
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
end;

procedure TfrmRelOperacao.btnConfirmaMaquinaClick(Sender: TObject);
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
 dbCtx.TMaquinasOperacaoidoperacaotalhao.AsString  := dmRel.qryRelOperacaoid.AsString;
 dbCtx.TMaquinasOperacaosyncaws.AsInteger          := 0;
 try
   dbCtx.TMaquinasOperacao.ApplyUpdates(-1);
   MyShowMessage('Maquina Atualizada com sucesso!!',false);
   layAuxiliar.Visible := false;
   dbCtx.AbreMaquinaOperacao(dmRel.qryRelOperacaoid.AsString);
   BuscarClick(sender);
 except
   on E: Exception do
    myShowMessage('Erro ao salvar Maquina:'+E.Message,false);
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



procedure TfrmRelOperacao.EditButton1Click(Sender: TObject);
begin
 frmOperadorMaquinas := TfrmOperadorMaquinas.Create(Self);
  try
    frmOperadorMaquinas.ShowModal;
  finally
    vIdOperador           := dbCtx.TOperadorMaquinaid.AsString;
    edtOperador.Text      := dbCtx.TOperadorMaquinanome.AsString;
    frmOperadorMaquinas.Free;
  end;
end;

procedure TfrmRelOperacao.EditButton3Click(Sender: TObject);
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

procedure TfrmRelOperacao.edtHoraFimChangeTracking(Sender: TObject);
begin
 if edtHoraFim.Text.Length=0 then edtHoraFim.Text:='0';
  if edtHoraIni.Text.Length=0 then edtHoraIni.Text:='0';
  if edtHorasParado.Text.Length=0 then edtHorasParado.Text:='0';
  edtHorasTrabalhada.Text := FormatFloat('####,##0.00',((strToFloat(edtHoraFim.Text)-strToFloat(edtHoraIni.Text))-
   strToFloat(edtHorasParado.Text)));
end;

procedure TfrmRelOperacao.edtHoraIniChangeTracking(Sender: TObject);
begin
 if edtHoraFim.Text.Length=0 then edtHoraFim.Text:='0';
  if edtHoraIni.Text.Length=0 then edtHoraIni.Text:='0';
  if edtHorasParado.Text.Length=0 then edtHorasParado.Text:='0';
  edtHorasTrabalhada.Text := FormatFloat('####,##0.00',((strToFloat(edtHoraFim.Text)-strToFloat(edtHoraIni.Text))-
   strToFloat(edtHorasParado.Text)));
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
