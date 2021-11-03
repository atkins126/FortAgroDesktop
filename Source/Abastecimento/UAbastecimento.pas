unit UAbastecimento;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  UCadPadrao, System.Rtti, FMX.Grid.Style, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FMX.ActnList,
  System.Actions, FMX.TabControl, FMX.Ani, FMX.ScrollBox, FMX.Grid, FMX.Edit,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, FMX.ListBox,
  FMX.DateTimeCtrls, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Components,
  Data.Bind.Grid, Data.Bind.DBScope,Winapi.Windows;

type
  TfrmAbastecimento = class(TfrmCadPadrao)
    GroupBox1: TGroupBox;
    Label22: TLabel;
    Label27: TLabel;
    edtDataInicio: TDateEdit;
    edtDataFim: TDateEdit;
    cbxCombustivelF: TComboBox;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lblTotalLitrosGrid: TLabel;
    Layout1: TLayout;
    Layout2: TLayout;
    Rectangle1: TRectangle;
    Layout3: TLayout;
    Layout4: TLayout;
    Layout6: TLayout;
    Rectangle2: TRectangle;
    Layout7: TLayout;
    Layout8: TLayout;
    Label7: TLabel;
    edtDataAbastecimento: TDateEdit;
    Label8: TLabel;
    edtHoraAbastecimento: TTimeEdit;
    Maquina: TLabel;
    edtMaquina: TEdit;
    EditButton5: TEditButton;
    Label9: TLabel;
    Label10: TLabel;
    cbxLocalEstoque: TComboBox;
    Label11: TLabel;
    Label12: TLabel;
    cbxCombustivel: TComboBox;
    edtVolumeLitros: TEdit;
    ClearEditButton2: TClearEditButton;
    Layout9: TLayout;
    ToolBar4: TToolBar;
    Label14: TLabel;
    Layout10: TLayout;
    Rectangle3: TRectangle;
    btnAdicionarTalhao: TRectangle;
    Image8: TImage;
    Label13: TLabel;
    btnExcluirTalhao: TRectangle;
    Image10: TImage;
    Excluir: TLabel;
    BindSourceDB2: TBindSourceDB;
    StringGrid2: TStringGrid;
    LinkGridToDataSourceBindSourceDB2: TLinkGridToDataSource;
    layNewOutros: TLayout;
    Rectangle6: TRectangle;
    ToolBar8: TToolBar;
    Rectangle7: TRectangle;
    Label17: TLabel;
    Image13: TImage;
    Layout20: TLayout;
    Layout21: TLayout;
    Rectangle8: TRectangle;
    Layout22: TLayout;
    Layout23: TLayout;
    Label18: TLabel;
    edtOutroProduto: TEdit;
    SearchEditButton1: TSearchEditButton;
    ClearEditButton3: TClearEditButton;
    Layout25: TLayout;
    Rectangle14: TRectangle;
    Layout26: TLayout;
    Layout27: TLayout;
    Label26: TLabel;
    edtQuantidade: TEdit;
    Layout28: TLayout;
    btnConfirmaPluvi: TRectangle;
    Label28: TLabel;
    Image21: TImage;
    Label15: TLabel;
    edtOperador: TEdit;
    EditButton4: TEditButton;
    ClearEditButton1: TClearEditButton;
    edtHorimetro: TEdit;
    Label16: TLabel;
    edtAtividade: TEdit;
    EditButton1: TEditButton;
    ClearEditButton4: TClearEditButton;
    Layout11: TLayout;
    Rectangle4: TRectangle;
    Layout12: TLayout;
    Layout13: TLayout;
    Label19: TLabel;
    edtObs: TEdit;
    btnExcel: TRectangle;
    Image7: TImage;
    Label20: TLabel;
    SaveDialog1: TSaveDialog;
    Label21: TLabel;
    cbxBombaF: TComboBox;
    Rectangle5: TRectangle;
    Image9: TImage;
    Label23: TLabel;
    layExtrato: TLayout;
    ToolBar5: TToolBar;
    Rectangle9: TRectangle;
    Label24: TLabel;
    Image11: TImage;
    Image12: TImage;
    Rectangle10: TRectangle;
    gpPeriodo: TGroupBox;
    Label25: TLabel;
    Label29: TLabel;
    edtExDataIni: TDateEdit;
    edtExDataFim: TDateEdit;
    Label30: TLabel;
    cbxBombaEx: TComboBox;
    Label31: TLabel;
    cbxCombustivelEx: TComboBox;
    rdBomba: TRadioButton;
    rdCombustivel: TRadioButton;
    Layout14: TLayout;
    Rectangle12: TRectangle;
    Label33: TLabel;
    Image15: TImage;
    Label32: TLabel;
    cbxTipoRelatorio: TComboBox;
    btnBuscarLista: TButton;
    cbxAtividadeF: TComboBox;
    Label34: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure edtVolumeLitrosChangeTracking(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure EditButton5Click(Sender: TObject);
    procedure EditButton4Click(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure cbxLocalEstoqueChange(Sender: TObject);
    procedure edtVolumeLitrosKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure SearchEditButton1Click(Sender: TObject);
    procedure edtQuantidadeChangeTracking(Sender: TObject);
    procedure edtQuantidadeKeyUp(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure btnConfirmaPluviClick(Sender: TObject);
    procedure btnAdicionarTalhaoClick(Sender: TObject);
    procedure Image13Click(Sender: TObject);
    procedure StringGrid1CellClick(const Column: TColumn; const Row: Integer);
    procedure StringGrid1SelChanged(Sender: TObject);
    procedure btnExcluirTalhaoClick(Sender: TObject);
    procedure edtHorimetroKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure edtHorimetroChangeTracking(Sender: TObject);
    procedure EditButton1Click(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure cbxBombaFChange(Sender: TObject);
    procedure cbxCombustivelExChange(Sender: TObject);
    procedure cbxBombaExChange(Sender: TObject);
    procedure Rectangle5Click(Sender: TObject);
    procedure Rectangle12Click(Sender: TObject);
    procedure rdCombustivelChange(Sender: TObject);
    procedure rdBombaChange(Sender: TObject);
    procedure cbxTipoRelatorioChange(Sender: TObject);
    procedure btnBuscarListaClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure cbxAtividadeFChange(Sender: TObject);
  private
    vIdMaquina,vIdOperador,vIdLocalEstoque,vIDProduto,vIdAtividade,
    vCombustivelEx,vBombaEx:string;
    procedure SomarColunasGrid;
    procedure CarregaLocalEstoque;
  public
    procedure Filtro;
  end;

var
  frmAbastecimento: TfrmAbastecimento;

implementation

{$R *.fmx}

uses DataContext, UCadMaquina, UOperadorMaquinas, UPrincipal, UProdutos,
  UAuxAtividadeAbastecimento, UdmReport, UDmReports;

procedure TfrmAbastecimento.btnAddClick(Sender: TObject);
begin
  edtAtividade.Text           :='';
  edtMaquina.Text             :='';
  edtHorimetro.Text           :='0';
  edtOperador.Text            :='';
  cbxLocalEstoque.ItemIndex   :=-1;
  cbxCombustivel.ItemIndex    :=-1;
  edtVolumeLitros.Text        :='0';
  dbCtx.TAbastecimento.Insert;
  inherited;
end;

procedure TfrmAbastecimento.btnAdicionarTalhaoClick(Sender: TObject);
begin
 edtOutroProduto.Text :='';
 edtQuantidade.Text   :='0';
 layNewOutros.Visible := true;
end;

procedure TfrmAbastecimento.btnBuscarListaClick(Sender: TObject);
begin
 Filtro;
end;

procedure TfrmAbastecimento.btnConfirmaPluviClick(Sender: TObject);
begin
 if edtOutroProduto.Text.Length=0 then
 begin
   MyShowMessage('Informe o produto!!',false);
   Exit;
 end;
 if(edtQuantidade.Text.Length=0)or(edtQuantidade.Text='0') then
 begin
   MyShowMessage('Informe a quantidade!!',false);
   Exit;
 end;
 dbCtx.TAbastecimentoOutros.Close;
 dbCtx.TAbastecimentoOutros.Open;
 dbCtx.TAbastecimentoOutros.Insert;
 dbCtx.TAbastecimentoOutrosidabastecimento.AsInteger := dbCtx.TAbastecimentoid.AsInteger;
 dbCtx.TAbastecimentoOutrosidusuario.AsString        := dbCtx.vIdUsuarioLogado;
 dbCtx.TAbastecimentoOutrosidproduto.AsString        := vIDProduto;
 dbCtx.TAbastecimentoOutrosquantidade.AsString       := edtQuantidade.Text;
 try
  dbCtx.TAbastecimentoOutros.ApplyUpdates(-1);
  dbCtx.AbreAbastecimentoOutros(dbCtx.TAbastecimentoid.AsString);
  layNewOutros.Visible    := false;
 except
   on E: Exception do
    myShowMessage('Erro ao salvar Outros Produtos:'+E.Message,false);
 end;
end;

procedure TfrmAbastecimento.btnDeletarClick(Sender: TObject);
begin
 MyShowMessage('Deseja Realmente Deletar esse registro?',true);
   case frmPrincipal.vMsgConfirma of
     1:begin
        dbCtx.TAbastecimento.Edit;
        dbCtx.TAbastecimentostatus.AsInteger := -1;
        dbCtx.TAbastecimentoIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
        dbCtx.TAbastecimentoDataAlteracao.AsDateTime     := now;
        dbCtx.AlteraFlaSynAWS_ZERO('abastecimento',dbCtx.TAbastecimentoID.AsString);
        try
          dbCtx.TAbastecimentosyncaws.AsInteger            :=0;
          dbCtx.TAbastecimento.ApplyUpdates(-1);
          MyShowMessage('Registro Excluido com sucesso!',false);
          dbCtx.AbreAbastecimento('');
          Filtro;
        except
         on E : Exception do
          ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
        end;
     end;
   end;
end;

procedure TfrmAbastecimento.btnEditarClick(Sender: TObject);
begin
 dbCtx.TAbastecimento.Edit;
 edtAtividade.Text         := dbCtx.TAbastecimentoAtividade.AsString;
 vIdAtividade              := dbCtx.TAbastecimentoidAtividade.AsString;
 edtDataAbastecimento.Date := dbCtx.TAbastecimentodataabastecimento.AsDateTime;
 vIdLocalEstoque           := dbCtx.TAbastecimentoidlocalestoque.AsString;
 cbxLocalEstoque.ItemIndex := cbxLocalEstoque.Items.IndexOf(dbCtx.TAbastecimentolocalestoquenome.AsString);
 vIdMaquina                := dbCtx.TAbastecimentoidmaquina.AsString;
 edtMaquina.Text           := dbCtx.TAbastecimentomaquinaprefixo.AsString;
 vIdOperador               := dbCtx.TAbastecimentoidoperador.AsString;
 edtOperador.Text          := dbCtx.TAbastecimentooperador.AsString;
 edtVolumeLitros.Text      := dbCtx.TAbastecimentovolumelt.AsString;
 cbxCombustivel.ItemIndex  := dbCtx.TAbastecimentocombustivel.AsInteger;
 edtHorimetro.Text         := dbCtx.TAbastecimentohorimetro.AsString;
 edtObs.Text               := dbCtx.TAbastecimentoobs.AsString;
 inherited;
end;

procedure TfrmAbastecimento.btnExcelClick(Sender: TObject);
var
 csv: tstringlist;
 row, col: integer;
 s: string;
begin
 if SaveDialog1.Execute then
 begin
   csv:= tstringlist.create;
   for row:= 1 to StringGrid1.rowcount do
    begin
     s:= '';
     if row=1 then
     begin
       for col:= 0 to StringGrid1.ColumnCount-1 do
        s:= s + StringGrid1.Columns[col].Header + ';';
       csv.add(s)
     end
     else
     begin
       for col:= 0 to StringGrid1.ColumnCount-1 do
        s:= s + StringGrid1.Cells[col, row-1] + ';';
       csv.add(s)
     end;
    end;
   csv.savetofile(SaveDialog1.FileName);
   csv.free;
 end;
end;

procedure TfrmAbastecimento.btnExcluirTalhaoClick(Sender: TObject);
begin
 MyShowMessage('Deseja Realmente Deletar esse Produto?',true);
 case frmPrincipal.vMsgConfirma of
   1:begin
      dbCtx.TAbastecimentoOutros.Edit;
      dbCtx.TAbastecimentoOutrosStatus.AsInteger := -1;
      dbCtx.TAbastecimentoOutrosIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
      dbCtx.TAbastecimentoOutrosDataAlteracao.AsDateTime     := now;
      dbCtx.AlteraFlaSynAWS_ZERO('abastecimentoOutros',dbCtx.TAbastecimentoOutrosID.AsString);
      try
        dbCtx.TAbastecimentoOutros.ApplyUpdates(-1);
        MyShowMessage('Registro Excluido com sucesso!',false);
        dbCtx.AbreAbastecimentoOutros(dbCtx.TAbastecimentoid.AsString);
      except
       on E : Exception do
        ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
      end;
   end;
 end;

end;

procedure TfrmAbastecimento.btnSalvarClick(Sender: TObject);
var
 IdCombustivel:string;
begin
  if edtMaquina.Text.Length=0 then
  begin
    MyShowMessage('Informe a maquina!!',false);
    Exit;
  end;
  if edtOperador.Text.Length=0 then
  begin
    MyShowMessage('Informe o Operador!!',false);
    Exit;
  end;
  if cbxLocalEstoque.ItemIndex=-1 then
  begin
    MyShowMessage('Informe o Local Estoque!!',false);
    Exit;
  end;
  if cbxCombustivel.ItemIndex=-1 then
  begin
    MyShowMessage('Informe o Combustivel!!',false);
    Exit;
  end;
  case cbxCombustivel.ItemIndex of
  0: IdCombustivel:='178';
  1: IdCombustivel:='179';
  2: IdCombustivel:='180';
  3: IdCombustivel:='3396';
 end;


  if edtVolumeLitros.Text='0' then
  begin
    MyShowMessage('Informe a quantidade de Litros!!',false);
    Exit;
  end;
  if edtAtividade.Text.Length=0 then
  begin
    MyShowMessage('Informe a Atividade!!',false);
    Exit;
  end;
  if dbCtx.TAbastecimento.State=dsInsert then
   dbCtx.TAbastecimentoidusuario.AsString := dbCtx.vIdUsuarioLogado
  else
  begin
    dbCtx.TAbastecimentoidusuarioalteracao.AsString := dbCtx.vIdUsuarioLogado;
    dbCtx.TAbastecimentodataalteracao.AsDateTime    := now;
    dbCtx.AlteraFlaSynAWS_ZERO('abastecimento',dbCtx.TAbastecimentoID.AsString);
  end;
  dbCtx.TAbastecimentoidAtividade.AsString        := vIdAtividade;
  dbCtx.TAbastecimentoidlocalestoque.AsString     := vIdLocalEstoque;
  dbCtx.TAbastecimentoidmaquina.AsString          := vIdMaquina;
  dbCtx.TAbastecimentoidoperador.AsString         := vIdOperador;
  dbCtx.TAbastecimentovolumelt.AsFloat            := strToFloat(edtVolumeLitros.Text);
  dbCtx.TAbastecimentocombustivel.AsString        := IdCombustivel;
  dbCtx.TAbastecimentodataabastecimento.AsDateTime:= edtDataAbastecimento.DateTime;
  dbCtx.TAbastecimentohora.AsDateTime             := edtHoraAbastecimento.DateTime;
  dbCtx.TAbastecimentohorimetro.AsFloat           := strToFloat(edtHorimetro.Text);
  if edtObs.Text.Length>0 then
   dbCtx.TAbastecimentoobs.AsString := edtObs.Text;
  try
   dbCtx.TAbastecimento.ApplyUpdates(-1);
   dbCtx.InsereSaidaAbastecimento(
    FormatDateTime('yyyy-mm-dd',edtDataAbastecimento.DateTime),'1',
    vIdLocalEstoque,
    IdCombustivel,
    edtVolumeLitros.Text,'0');
   dbCtx.AbreAbastecimento('');
   SomarColunasGrid;
   inherited;
  except
   on E: Exception do
    myShowMessage('Erro ao salvar Abastecimento:'+E.Message,false);
  end;
end;

procedure TfrmAbastecimento.CarregaLocalEstoque;
var
 vQry : TFDQuery;
begin
 vQry := TFDQuery.Create(nil);
 vQry.Connection := dbCtx.FDConPG;
 cbxLocalEstoque.Items.Clear;
 cbxBombaF.Items.Clear;
 cbxBombaEx.Items.Clear;
 cbxBombaF.Items.Add('Todas');

 cbxAtividadeF.Items.Clear;
 cbxAtividadeF.Items.Add('Todas');


 with vQry,vQry.SQL do
 begin
   Clear;
   Add('select * from localestoque');
   Add('where status=1 and combustivel=1');
   Open;
   while not vQry.Eof do
   begin
     cbxLocalEstoque.Items.AddObject(vQry.FieldByName('nome').AsString,
      TObject(vQry.FieldByName('id').AsInteger));
     cbxBombaF.Items.AddObject(vQry.FieldByName('nome').AsString,
      TObject(vQry.FieldByName('id').AsInteger));
     cbxBombaEx.Items.AddObject(vQry.FieldByName('nome').AsString,
      TObject(vQry.FieldByName('id').AsInteger));
     vQry.Next;
   end;

   Clear;
   Add('select * from auxatividadeabastecimento a');
   Add('where status =1');
   Open;
   while not vQry.Eof do
   begin
     cbxAtividadeF.Items.AddObject(vQry.FieldByName('nome').AsString,
      TObject(vQry.FieldByName('id').AsInteger));
     vQry.Next;
   end;
 end;
 cbxAtividadeF.ItemIndex :=0;
 cbxBombaF.ItemIndex :=0;
end;

procedure TfrmAbastecimento.cbxAtividadeFChange(Sender: TObject);
begin
 if cbxAtividadeF.ItemIndex>-1 then
  vIdAtividade := IntToStr(Integer(cbxAtividadeF.Items.Objects[cbxAtividadeF.ItemIndex]));
end;

procedure TfrmAbastecimento.cbxBombaExChange(Sender: TObject);
begin
  if cbxBombaEx.ItemIndex>-1 then
   vBombaEx := IntToStr(Integer(cbxBombaEx.Items.Objects[cbxBombaEx.ItemIndex]));
end;

procedure TfrmAbastecimento.cbxBombaFChange(Sender: TObject);
begin
 if cbxBombaF.ItemIndex>-1 then
  vIdLocalEstoque := IntToStr(Integer(cbxBombaF.Items.Objects[cbxBombaF.ItemIndex]));
end;

procedure TfrmAbastecimento.cbxCombustivelExChange(Sender: TObject);
begin
 if cbxCombustivelEx.ItemIndex=0 then
  vCombustivelEx:='180';
 if cbxCombustivelEx.ItemIndex=1 then
  vCombustivelEx:='178';
 if cbxCombustivelEx.ItemIndex=2 then
  vCombustivelEx:='179';
 if cbxCombustivelEx.ItemIndex=3 then
  vCombustivelEx:='3396';
end;

procedure TfrmAbastecimento.cbxLocalEstoqueChange(Sender: TObject);
begin
 if cbxLocalEstoque.ItemIndex>-1 then
  vIdLocalEstoque := IntToStr(Integer(cbxLocalEstoque.Items.Objects[cbxLocalEstoque.ItemIndex]));
end;

procedure TfrmAbastecimento.cbxTipoRelatorioChange(Sender: TObject);
begin
 if (cbxTipoRelatorio.ItemIndex=1) or (cbxTipoRelatorio.ItemIndex=2) then
   gpPeriodo.Enabled := true
 else
   gpPeriodo.Enabled      := false;
 rdCombustivel.Enabled    := cbxTipoRelatorio.ItemIndex<>2;
 cbxCombustivelEx.Enabled := cbxTipoRelatorio.ItemIndex<>2;
 rdBomba.IsChecked        := cbxTipoRelatorio.ItemIndex=2;
end;

procedure TfrmAbastecimento.EditButton1Click(Sender: TObject);
begin
  frmAuxAtividadeAbastecimento := TfrmAuxAtividadeAbastecimento.Create(Self);
  try
    frmAuxAtividadeAbastecimento.ShowModal;
  finally
    vIdAtividade         := dbCtx.Tauxatividadeabastecimentoid.AsString;
    edtAtividade.Text    := dbCtx.Tauxatividadeabastecimentonome.AsString;
  end;
end;

procedure TfrmAbastecimento.EditButton4Click(Sender: TObject);
begin
  frmOperadorMaquinas := TfrmOperadorMaquinas.Create(Self);
  try
    frmOperadorMaquinas.ShowModal;
  finally
    vIdOperador      := dbCtx.TOperadorMaquinaid.AsString;
    edtOperador.Text  := dbCtx.TOperadorMaquinanome.AsString;
  end;
end;

procedure TfrmAbastecimento.EditButton5Click(Sender: TObject);
begin
  frmCadMaquinaVeiculo := TfrmCadMaquinaVeiculo.Create(Self);
  try
    frmCadMaquinaVeiculo.ShowModal;
  finally
    vIdMaquina       := dbCtx.TMaquinasid.AsString;
    edtMaquina.Text  := dbCtx.TMaquinasprefixo.AsString;
  end;
end;

procedure TfrmAbastecimento.edtHorimetroChangeTracking(Sender: TObject);
begin
 if edtHorimetro.Text.Length=0 then
  edtHorimetro.Text:='0';
end;

procedure TfrmAbastecimento.edtHorimetroKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
 if((keyChar in ['0'..'9',','] = false) and (word(key) <> vk_back)) then
 begin
   KeyChar := #0;
 end;
end;

procedure TfrmAbastecimento.edtQuantidadeChangeTracking(Sender: TObject);
begin
 if edtQuantidade.Text.Length=0 then
  edtQuantidade.Text:='0';
end;

procedure TfrmAbastecimento.edtQuantidadeKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
 if((keyChar in ['0'..'9',','] = false) and (word(key) <> vk_back)) then
 begin
   KeyChar := #0;
 end;
end;

procedure TfrmAbastecimento.edtVolumeLitrosChangeTracking(Sender: TObject);
begin
 if edtVolumeLitros.Text.Length=0 then
  edtVolumeLitros.Text:='0';
end;

procedure TfrmAbastecimento.edtVolumeLitrosKeyDown(Sender: TObject;
  var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
 if((keyChar in ['0'..'9',','] = false) and (word(key) <> vk_back)) then
 begin
   KeyChar := #0;
 end;
end;

procedure TfrmAbastecimento.Filtro;
var
 vFiltro:string;
begin
 vFiltro := '';
 if edtNomeFiltro.Text.Length>0 then
  vFiltro := ' and c.prefixo like '+QuotedStr('%'+edtNomeFiltro.Text+'%');
 if cbxCombustivelF.ItemIndex=1 then
  vFiltro := vFiltro+' and a.combustivel=180';
 if cbxCombustivelF.ItemIndex=2 then
  vFiltro := vFiltro+' and a.combustivel=178';
 if cbxCombustivelF.ItemIndex=3 then
  vFiltro := vFiltro+' and a.combustivel=179';
 if cbxCombustivelF.ItemIndex=4 then
  vFiltro := vFiltro+' and a.combustivel=3396';
 if cbxBombaF.ItemIndex>0 then
  vFiltro := vFiltro+' and b.id='+vIdLocalEstoque;
 if cbxAtividadeF.ItemIndex>0 then
  vFiltro := vFiltro+' and h.id='+vIdAtividade;
 vFiltro  := vFiltro+' and a.dataabastecimento between '+FormatDateTime('yyyy-mm-dd',edtDataInicio.Date).QuotedString+' and '+
 FormatDateTime('yyyy-mm-dd',edtDataFim.Date).QuotedString;
 dbCtx.AbreAbastecimento(vFiltro);
 SomarColunasGrid;
end;

procedure TfrmAbastecimento.FormKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
 if key=13 then
  if tbPrincipal.TabIndex=0 then
   Filtro;
end;

procedure TfrmAbastecimento.FormShow(Sender: TObject);
begin
  layExtrato.Visible        := false;
  layNewOutros.Visible      := false;
  CarregaLocalEstoque;
  edtDataInicio.Date        := DATE-7;
  cbxCombustivelF.ItemIndex := 0;
  Filtro;
  SomarColunasGrid;
  lblBuscar.Text          := 'Filtros';
  lblAdd.Text             := 'Adicionar';
  lblEdit.Text            := 'Editar';
  lblDeleta.Text          := 'Deletar';
  layListaMnu.Width       := 150;
  layListaMnu.Enabled     := true;
  btnAdd.Enabled          := true;
  btnDeletar.Enabled      := true;
  btnEditar.Enabled       := true;
  tbPrincipal.TabPosition := TTabPosition.None;
  tbPrincipal.ActiveTab   := tbiLista;
  StringGrid2.RowCount    := 0;
end;

procedure TfrmAbastecimento.Image13Click(Sender: TObject);
begin
 layNewOutros.Visible    := false;
end;

procedure TfrmAbastecimento.rdBombaChange(Sender: TObject);
begin
  cbxBombaEx.Enabled          := true;
  cbxCombustivelEx.Enabled    := false;
end;

procedure TfrmAbastecimento.rdCombustivelChange(Sender: TObject);
begin
  cbxCombustivelEx.Enabled          := true;
  cbxBombaEx.Enabled                := false;
end;

procedure TfrmAbastecimento.Rectangle12Click(Sender: TObject);
var
 vFiltro:string;
begin
  if cbxTipoRelatorio.ItemIndex=-1 then
  begin
    MyShowMessage('Informe o tipo de Relatório (Extrato ou Saldo Atual)',false);
    Exit;
  end;

  if cbxTipoRelatorio.ItemIndex=1 then
  begin
    if(rdBomba.IsChecked=false)and(rdCombustivel.IsChecked=false)  then
    begin
      MyShowMessage('Informe o tipo Por Bomba ou Por Combustivel',false);
      Exit;
    end;
    if(rdBomba.IsChecked)and(cbxBombaEx.ItemIndex=-1)  then
    begin
      MyShowMessage('Informe a Bomba Combustivel',false);
      Exit;
    end;
    if(rdCombustivel.IsChecked)and(cbxCombustivelEx.ItemIndex=-1)  then
    begin
      MyShowMessage('Informe o Combustivel',false);
      Exit;
    end;
    if rdBomba.IsChecked then
      dmReport.AbreExtratoBomba(vBombaEx, cbxBombaEx.Selected.Text,
      edtExDataIni.Text,
      edtExDataFim.Text);

     if rdCombustivel.IsChecked then
      dmReport.AbreExtratoCombustivel(vCombustivelEx,cbxCombustivelEx.Selected.Text,
      edtExDataIni.Text,
      edtExDataFim.Text);
  end;
  if cbxTipoRelatorio.ItemIndex=0 then
  begin
    if rdBomba.IsChecked then
    begin
      if cbxBombaEx.ItemIndex=-1 then
      begin
        MyShowMessage('Informe a Bomba!!',false);
        Exit;
      end
      else
       vFiltro := ' and localestoque='+cbxBombaEx.Selected.Text.QuotedString;
    end;
    if rdCombustivel.IsChecked then
    begin
      if cbxCombustivelEx.ItemIndex=-1 then
      begin
        MyShowMessage('Informe o Combustivel!!',false);
        Exit;
      end
      else
       vFiltro := ' and entrada.produto='+cbxCombustivelEx.Selected.Text.QuotedString;
    end;
    dmReport.AbreSaldoAtualCombustivel(vFiltro);
  end;
  if cbxTipoRelatorio.ItemIndex=2 then
  begin
    if cbxBombaEx.ItemIndex=-1 then
    begin
      MyShowMessage('Informe a Bomba!!',false);
      Exit;
    end;
    dmReport.AbreExtratoDiaMaquina(
     edtExDataIni.Text,
     edtExDataFim.Text,
     vBombaEx);
  end;
end;

procedure TfrmAbastecimento.Rectangle5Click(Sender: TObject);
begin
 cbxTipoRelatorio.ItemIndex  :=0;
 gpPeriodo.Enabled           :=false;
 cbxBombaEx.ItemIndex        :=-1;
 cbxCombustivelEx.ItemIndex  :=-1;
 cbxBombaEx.Enabled          :=false;
 cbxCombustivelEx.Enabled    :=false;
 layExtrato.Visible          :=true;
end;

procedure TfrmAbastecimento.SearchEditButton1Click(Sender: TObject);
begin
 frmCadProdutos := TfrmCadProdutos.Create(Self);
  try
    frmCadProdutos.ShowModal;
  finally
    vIDProduto            := dbCtx.TProdutosid.AsString;
    edtOutroProduto.Text  := dbCtx.TProdutosnome.AsString;
    frmCadProdutos.Free;
  end;
end;

procedure TfrmAbastecimento.SomarColunasGrid;
var
  Sum : Double;
  Val : Double;
  I   : Integer;
begin
  Sum := 0;
  val := 0;
  I   := 0;
  for I := 0 to StringGrid1.RowCount-1 do
  begin
   if TryStrToFloat(StringGrid1.Cells[7,I],Val) then
    Sum := Sum + Val;
  end;
  if I>0 then
  begin
    lblTotalRegistro.Text        := IntToStr(I);
    lblTotalLitrosGrid.Text      := FormatFloat('####,##.00',(Sum));
  end
  else
  begin
    lblTotalRegistro.Text        := '0';
    lblTotalLitrosGrid.Text      := '0,00';
  end;
end;

procedure TfrmAbastecimento.StringGrid1CellClick(const Column: TColumn;
  const Row: Integer);
begin
 if dbCtx.TAbastecimentoid.AsString.Length>0 then
  dbCtx.AbreAbastecimentoOutros(dbCtx.TAbastecimentoid.AsString);
end;

procedure TfrmAbastecimento.StringGrid1SelChanged(Sender: TObject);
begin
 if dbCtx.TAbastecimentoid.AsString.Length>0 then
  dbCtx.AbreAbastecimentoOutros(dbCtx.TAbastecimentoid.AsString);
end;

end.
