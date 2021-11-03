unit UEntradaEstoque;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  UCadPadrao, System.Rtti, FMX.Grid.Style, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FMX.ActnList,
  System.Actions, FMX.TabControl, FMX.Ani, FMX.ScrollBox, FMX.Grid, FMX.Edit,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, FMX.EditBox,
  FMX.NumberBox, FMX.DateTimeCtrls, FMX.ListBox, Fmx.Bind.Grid,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope;

type
  TfrmCadEntradaEstoque = class(TfrmCadPadrao)
    Rectangle2: TRectangle;
    Layout3: TLayout;
    Layout4: TLayout;
    Label4: TLabel;
    Layout2: TLayout;
    Label5: TLabel;
    Label9: TLabel;
    Layout6: TLayout;
    ComboBox1: TComboBox;
    Layout7: TLayout;
    edtEmissaoNF: TDateEdit;
    edtNumNF: TEdit;
    Label11: TLabel;
    edtDataEntradaFaz: TDateEdit;
    BindSourceDB1: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    BindingsList1: TBindingsList;
    Layout13: TLayout;
    Rectangle3: TRectangle;
    Layout14: TLayout;
    Layout15: TLayout;
    Label14: TLabel;
    Layout16: TLayout;
    Label15: TLabel;
    Layout17: TLayout;
    ComboBox3: TComboBox;
    Layout18: TLayout;
    edtFornecedor: TEdit;
    EditButton3: TEditButton;
    edtCodFabF: TEdit;
    Label20: TLabel;
    Label16: TLabel;
    edtNumNFF: TEdit;
    EdtCentroCustoF: TEdit;
    btnBuscaCategoriaF: TSearchEditButton;
    ClearEditButton1: TClearEditButton;
    Label17: TLabel;
    edtLocalEstoqueF: TEdit;
    SearchEditButton1: TSearchEditButton;
    ClearEditButton2: TClearEditButton;
    Label18: TLabel;
    GroupBox1: TGroupBox;
    chkPeriodoEntradaF: TCheckBox;
    Label19: TLabel;
    edtDeF: TDateEdit;
    Label21: TLabel;
    edtAteF: TDateEdit;
    Layout19: TLayout;
    Rectangle4: TRectangle;
    Layout20: TLayout;
    Layout21: TLayout;
    Layout22: TLayout;
    Label22: TLabel;
    Layout23: TLayout;
    Label23: TLabel;
    Layout24: TLayout;
    ComboBox4: TComboBox;
    Layout25: TLayout;
    cbxTipoSaida: TComboBox;
    Label24: TLabel;
    Layout26: TLayout;
    Layout27: TLayout;
    StringGrid2: TStringGrid;
    Rectangle5: TRectangle;
    Rectangle6: TRectangle;
    Image7: TImage;
    Label25: TLabel;
    btnNovoItem: TRectangle;
    Image8: TImage;
    No: TLabel;
    btnExcluirItem: TRectangle;
    Image10: TImage;
    Label28: TLabel;
    BindSourceDB2: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB2: TLinkGridToDataSource;
    Label12: TLabel;
    edtCentroCusto: TEdit;
    EditButton1: TEditButton;
    tbiItens: TTabItem;
    Layout29: TLayout;
    Layout30: TLayout;
    Rectangle7: TRectangle;
    Rectangle9: TRectangle;
    Image9: TImage;
    Label26: TLabel;
    Rectangle11: TRectangle;
    Image13: TImage;
    Label29: TLabel;
    Rectangle13: TRectangle;
    Image14: TImage;
    Label31: TLabel;
    StringGrid3: TStringGrid;
    LinkGridToDataSourceBindSourceDB22: TLinkGridToDataSource;
    Layout31: TLayout;
    Layout32: TLayout;
    Rectangle15: TRectangle;
    Label33: TLabel;
    Image16: TImage;
    Rectangle14: TRectangle;
    Label32: TLabel;
    Image15: TImage;
    layItensNota: TLayout;
    Rectangle8: TRectangle;
    Layout46000000: TLayout;
    Rectangle16000000: TRectangle;
    Layout490000000000000: TLayout;
    Layout47000000000: TLayout;
    Label31000000000: TLabel;
    layCapDadosPasto: TLayout;
    Label10: TLabel;
    lbll: TLabel;
    Label7: TLabel;
    Layout48000000000: TLayout;
    cbxCurralPastoGrupo: TComboBox;
    LayValueDadosPasto: TLayout;
    edtProduto: TEdit;
    btnBuscaProduto: TEditButton;
    cbxUnidadeMedida: TComboBox;
    edtqtd: TEdit;
    Layout1: TLayout;
    Rectangle1: TRectangle;
    Layout8: TLayout;
    Layout9: TLayout;
    Label8: TLabel;
    Layout10: TLayout;
    Label13: TLabel;
    Label6: TLabel;
    Layout11: TLayout;
    ComboBox2: TComboBox;
    Layout12: TLayout;
    edtLocalEstoque: TEdit;
    EditButton2: TEditButton;
    edtValorTotalNF: TNumberBox;
    Layout28: TLayout;
    Rectangle12: TRectangle;
    Label30: TLabel;
    Image12: TImage;
    ToolBar4: TToolBar;
    Rectangle10: TRectangle;
    Label27: TLabel;
    Image11: TImage;
    ToolBar5: TToolBar;
    lblItemNf: TLabel;
    edtFornF: TEdit;
    SearchEditButton2: TSearchEditButton;
    ClearEditButton3: TClearEditButton;
    Label34: TLabel;
    btnImprime: TRectangle;
    Image17: TImage;
    Label35: TLabel;
    procedure btnAddClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure chkPeriodoEntradaFChange(Sender: TObject);
    procedure EditButton3Click(Sender: TObject);
    procedure btnBuscaProdutoClick(Sender: TObject);
    procedure EditButton2Click(Sender: TObject);
    procedure btnBuscaCategoriaFClick(Sender: TObject);
    procedure ClearEditButton1Click(Sender: TObject);
    procedure edtCodFabFChangeTracking(Sender: TObject);
    procedure edtNomeFiltroChangeTracking(Sender: TObject);
    procedure SearchEditButton1Click(Sender: TObject);
    procedure ClearEditButton2Click(Sender: TObject);
    procedure edtLocalEstoqueFChangeTracking(Sender: TObject);
    procedure edtDeFChange(Sender: TObject);
    procedure edtAteFChange(Sender: TObject);
    procedure edtNumNFFKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure edtqtdKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure Image11Click(Sender: TObject);
    procedure EditButton1Click(Sender: TObject);
    procedure Rectangle12Click(Sender: TObject);
    procedure btnNovoItemClick(Sender: TObject);
    procedure StringGrid1CellClick(const Column: TColumn; const Row: Integer);
    procedure StringGrid1SelChanged(Sender: TObject);
    procedure btnExcluirItemClick(Sender: TObject);
    procedure Rectangle15Click(Sender: TObject);
    procedure tbPrincipalChange(Sender: TObject);
    procedure btnCancelaClick(Sender: TObject);
    procedure edtProdutoClick(Sender: TObject);
    procedure edtLocalEstoqueClick(Sender: TObject);
    procedure edtCentroCustoClick(Sender: TObject);
    procedure edtFornecedorClick(Sender: TObject);
    procedure EdtCentroCustoFKeyUp(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure SearchEditButton2Click(Sender: TObject);
    procedure ClearEditButton3Click(Sender: TObject);
    procedure btnImprimeClick(Sender: TObject);
  private
    vIdProduto,vIdCentroCusto,vIdLocalEstoque,vIdFornecedor,
    vIdNFCAD:string;
    procedure LimpaCampos;
    procedure Filtro;
  public
    { Public declarations }
  end;

var
  frmCadEntradaEstoque: TfrmCadEntradaEstoque;

implementation

{$R *.fmx}

uses DataContext, dmReplicacao, UPrincipal, UFornecedor, UAuxCategoriaProd,
  UProdutos, UCentrodeCusto, LocalEstoque, UDmReports;

procedure TfrmCadEntradaEstoque.btnAddClick(Sender: TObject);
begin
  LimpaCampos;
  dbCtx.TEstoqueEntrada.Close;
  dbCtx.TEstoqueEntrada.Open;
  dbCtx.TEstoqueEntrada.Insert;
  inherited;
end;

procedure TfrmCadEntradaEstoque.btnBuscaCategoriaFClick(Sender: TObject);
begin
 frmCentroCusto := TfrmCentroCusto.Create(Self);
  try
    frmCentroCusto.ShowModal;
  finally
    edtCentroCustoF.Text := dbCtx.TCentroCustonome.AsString;
    Filtro;
  end;
end;

procedure TfrmCadEntradaEstoque.btnBuscaProdutoClick(Sender: TObject);
begin
 frmCadProdutos := TfrmCadProdutos.Create(Self);
  try
    frmCadProdutos.ShowModal;
  finally
    vIdProduto         := dbCtx.TProdutosid.AsString;
    edtProduto.Text    := dbCtx.TProdutosnome.AsString;
    if dbCtx.TProdutosunidademedida.AsString.Length>0 then
     cbxUnidadeMedida.ItemIndex := cbxUnidadeMedida.Items.IndexOf(dbCtx.TProdutosunidademedida.AsString)
  end;
end;

procedure TfrmCadEntradaEstoque.btnCancelaClick(Sender: TObject);
begin
  dbCtx.AbreEntradaEstoque(dbCtx.vIdSegmento,'');
  inherited;
end;

procedure TfrmCadEntradaEstoque.btnDeletarClick(Sender: TObject);
begin
  if StringGrid2.RowCount=0 then
  begin
   MyShowMessage('Deseja Realmente Deletar esse registro?',true);
   case frmPrincipal.vMsgConfirma of
     1:begin
        dbCtx.TEstoqueEntrada.Edit;
        dbCtx.TEstoqueEntradaStatus.AsInteger := -1;
        dbCtx.TEstoqueEntradaIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
        dbCtx.TEstoqueEntradaDataAlteracao.AsDateTime     := now;
        dbCtx.AlteraFlaSynAWS_ZERO('estoqueentrada',dbCtx.TEstoqueEntradaID.AsString);
        try
          dbCtx.TEstoqueEntradasyncaws.AsInteger            :=0;
          dbCtx.TEstoqueEntrada.ApplyUpdates(-1);
          MyShowMessage('Registro Excluido com sucesso!',false);
          dbCtx.TEstoqueEntrada.Close;
          dbCtx.TEstoqueEntrada.Open();
        except
         on E : Exception do
          ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
        end;
     end;
   end;
  end
  else
  begin
    MyShowMessage('Delete is Itens antes de deletar a nota!',false);
  end;
end;

procedure TfrmCadEntradaEstoque.btnEditarClick(Sender: TObject);
begin
  dbCtx.TEstoqueEntrada.Edit;
  vIdFornecedor                                      := dbCtx.TEstoqueEntradaidfornecedor.AsString;
  edtFornecedor.Text                                 := dbCtx.TEstoqueEntradafornecedor.AsString;
  edtNumNF.Text                                      := dbCtx.TEstoqueEntradanumeronf.AsString;
  edtEmissaoNF.Date                                  := dbCtx.TEstoqueEntradadataemissao.AsDateTime;
  edtDataEntradaFaz.Date                             := dbCtx.TEstoqueEntradadataentradaestoque.AsDateTime;
  vIdCentroCusto                                     := dbCtx.TEstoqueEntradaidcentrocusto.AsString;
  edtCentroCusto.Text                                := dbCtx.TEstoqueEntradacentrocusto.AsString;
  cbxTipoSaida.ItemIndex                             := dbCtx.TEstoqueEntradaTipo.asInteger;
  inherited;
end;

procedure TfrmCadEntradaEstoque.btnExcluirItemClick(Sender: TObject);
begin
   MyShowMessage('Deseja Realmente Deletar esse Item?',true);
   case frmPrincipal.vMsgConfirma of
     1:begin
        dbCtx.TnotaFiscalIntem.Edit;
        dbCtx.TnotaFiscalIntemstatus.AsInteger := -1;
        dbCtx.TnotaFiscalIntemIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
        dbCtx.TnotaFiscalIntemDataAlteracao.AsDateTime     := now;
        dbCtx.AlteraFlaSynAWS_ZERO('notafiscalitems',dbCtx.TnotaFiscalIntemID.AsString);
        try
          dbCtx.TnotaFiscalIntemsyncaws.AsInteger          :=0;
          dbCtx.TnotaFiscalIntem.ApplyUpdates(-1);
          dbCtx.AtaulizaValorMedioProduto(dbCtx.TEstoqueEntradaid.AsString,
          dbCtx.TnotaFiscalIntemidproduto.AsString,
            FormatDateTime('yyyy-mm-dd',edtDataEntradaFaz.Date));
          MyShowMessage('Registro Excluido com sucesso!',false);
          dbCtx.AbreItensNf(dbCtx.TEstoqueEntradaid.AsString);
        except
         on E : Exception do
          ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
        end;
     end;
   end;
end;

procedure TfrmCadEntradaEstoque.btnImprimeClick(Sender: TObject);
begin
 dmReport.AbreRepNota(dbCtx.TEstoqueEntradaid.AsString);
end;

procedure TfrmCadEntradaEstoque.btnNovoItemClick(Sender: TObject);
begin
 edtProduto.Text            :='';
 edtCentroCusto.Text        :='';
 edtLocalEstoque.Text       :='';
 cbxUnidadeMedida.ItemIndex :=-1;
 edtqtd.Text                :='0';
 edtValorTotalNF.Text       :='0';

 dbCtx.TnotaFiscalIntem.Close;
 dbCtx.TnotaFiscalIntem.Open;
 dbCtx.TnotaFiscalIntem.Insert;
 layItensNota.Visible:= true;
end;

procedure TfrmCadEntradaEstoque.btnSalvarClick(Sender: TObject);
var
 vTipoInsUp:integer;
begin
 if edtNumNF.Text.Length=0 then
 begin
   MyShowMessage('Informe o N° da NF!',false);
   edtNumNF.SetFocus;
   Exit;
 end;

 if edtFornecedor.Text.Length=0 then
 begin
   MyShowMessage('Informe o Fornecedor da NF!',false);
   edtFornecedor.SetFocus;
   Exit;
 end;

 
 if edtCentroCusto.Text.Length=0 then
 begin
   MyShowMessage('Informe o Centro de Custo!',false);
   edtCentroCusto.SetFocus;
   Exit;
 end;

 if cbxTipoSaida.ItemIndex=-1 then
 begin
   MyShowMessage('Informe o Tipo de Saída!',false);
   cbxTipoSaida.SetFocus;
   Exit;
 end;
 if dbCtx.TEstoqueEntrada.State=dsInsert then
 begin
   dbCtx.TEstoqueEntradaidusuario.AsString := dbCtx.vIdUsuarioLogado;
   vTipoInsUp :=1;
 end
 else
  vTipoInsUp :=0;

 if dbCtx.TEstoqueEntrada.State=dsEdit then
 begin
   dbCtx.TEstoqueEntradaidusuarioalteracao.AsString := dbCtx.vIdUsuarioLogado;
   dbCtx.TEstoqueEntradadataalteracao.AsDateTime    := now;
   dbCtx.AlteraFlaSynAWS_ZERO('estoqueentrada',dbCtx.TEstoqueEntradaID.AsString);
 end;
 dbCtx.TEstoqueEntradaidproduto.AsString            := vIdProduto;
 dbCtx.TEstoqueEntradaidfornecedor.AsString         := vIdFornecedor;
 dbCtx.TEstoqueEntradanumeronf.AsString             := edtNumNF.Text;
 dbCtx.TEstoqueEntradadataemissao.AsDateTime        := edtEmissaoNF.Date;
 dbCtx.TEstoqueEntradadataentradaestoque.AsDateTime := edtDataEntradaFaz.Date;
 dbCtx.TEstoqueEntradaidcentrocusto.AsString        := vIdCentroCusto;
 dbCtx.TEstoqueEntradaTipo.asInteger                := cbxTipoSaida.ItemIndex;
 try
  dbCtx.TEstoqueEntrada.ApplyUpdates(-1);
  MyShowMessage('Entrada Atualizada com sucesso adicione os Itens!',false);
  if vTipoInsUp=1 then
   vIdNFCAD := dbCtx.RetornaIdMaxNota
  else
   vIdNFCAD := dbCtx.TEstoqueEntradaid.AsString;
  dbCtx.AbreItensNf(vIdNFCAD);
  MudarAba(tbiItens,sender);
 except
 on E: Exception do
    ShowMessage('Erro ao salvar Registro:'+E.Message);
 end;
end;

procedure TfrmCadEntradaEstoque.chkPeriodoEntradaFChange(Sender: TObject);
begin
 edtAteF.Enabled := chkPeriodoEntradaF.IsChecked;
 edtDeF.Enabled  := chkPeriodoEntradaF.IsChecked;
end;

procedure TfrmCadEntradaEstoque.ClearEditButton1Click(Sender: TObject);
begin
  EdtCentroCustoF.Text :='';
  Filtro;
end;

procedure TfrmCadEntradaEstoque.ClearEditButton2Click(Sender: TObject);
begin
  inherited;
  Filtro;
end;

procedure TfrmCadEntradaEstoque.ClearEditButton3Click(Sender: TObject);
begin
 edtFornF.Text :='';
 Filtro;
end;

procedure TfrmCadEntradaEstoque.EditButton1Click(Sender: TObject);
begin
 frmCentroCusto := TfrmCentroCusto.Create(Self);
  try
    frmCentroCusto.ShowModal;
  finally
    vIdCentroCusto      := dbCtx.TCentroCustoid.AsString;
    edtCentroCusto.Text := dbCtx.TCentroCustonome.AsString;
  end;
end;

procedure TfrmCadEntradaEstoque.EditButton2Click(Sender: TObject);
begin
 frmLocalEstoque := TfrmLocalEstoque.Create(Self);
  try
    frmLocalEstoque.ShowModal;
  finally
    vIdLocalEstoque      := dbCtx.TLocalEstoqueid.AsString;
    edtLocalEstoque.Text  := dbCtx.TLocalEstoquenome.AsString;
  end;
end;

procedure TfrmCadEntradaEstoque.EditButton3Click(Sender: TObject);
begin
 frmCadFornecedor := TfrmCadFornecedor.Create(Self);
  try
    frmCadFornecedor.ShowModal;
  finally
    vIdFornecedor  := dbCtx.TFornecedoresid.AsString;
    edtFornecedor.Text := dbCtx.TFornecedoresnome.AsString;
  end;
end;

procedure TfrmCadEntradaEstoque.edtAteFChange(Sender: TObject);
begin
  Filtro;
end;

procedure TfrmCadEntradaEstoque.edtCentroCustoClick(Sender: TObject);
begin
 EditButton1Click(Sender);
end;

procedure TfrmCadEntradaEstoque.EdtCentroCustoFKeyUp(Sender: TObject;
  var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
 if key=13 then
  Filtro;
end;

procedure TfrmCadEntradaEstoque.edtCodFabFChangeTracking(Sender: TObject);
begin
 Filtro;
end;

procedure TfrmCadEntradaEstoque.edtDeFChange(Sender: TObject);
begin
 filtro;
end;

procedure TfrmCadEntradaEstoque.edtFornecedorClick(Sender: TObject);
begin
 EditButton3Click(Sender);
end;

procedure TfrmCadEntradaEstoque.edtLocalEstoqueClick(Sender: TObject);
begin
 EditButton2Click(Sender);
end;

procedure TfrmCadEntradaEstoque.edtLocalEstoqueFChangeTracking(Sender: TObject);
begin
 filtro;
end;

procedure TfrmCadEntradaEstoque.edtNomeFiltroChangeTracking(Sender: TObject);
begin
 Filtro;
end;

procedure TfrmCadEntradaEstoque.edtNumNFFKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if Key=13 then
   Filtro;

end;

procedure TfrmCadEntradaEstoque.edtProdutoClick(Sender: TObject);
begin
 btnBuscaProdutoClick(Sender);
end;

procedure TfrmCadEntradaEstoque.edtqtdKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
 if (keyChar in ['0'..'9',','] = false) then
 begin
   KeyChar := #0;
 end;
end;

procedure TfrmCadEntradaEstoque.Filtro;
var
 vFiltro:string;
begin
 vFiltro   :='';
 if edtNomeFiltro.Text.Length>0 then
   vFiltro := vFiltro+ 'AND e.nome LIKE '+QuotedStr('%'+edtNomeFiltro.Text+'%');
 if edtCodFabF.Text.Length>0 then
   vFiltro := vFiltro+ 'AND e.codigofabricante LIKE '+QuotedStr('%'+edtCodFabF.Text+'%');
 if EdtCentroCustoF.Text.Length>0 then
   vFiltro := vFiltro+ 'AND d.nome ='+QuotedStr(EdtCentroCustoF.Text);
 if edtLocalEstoqueF.Text.Length>0 then
   vFiltro := vFiltro+ 'AND c.nome ='+QuotedStr(edtLocalEstoqueF.Text);
 if edtNumNFF.Text.Length>0 then
   vFiltro := vFiltro+ 'AND a.numeronf ='+edtNumNFF.Text;
 if edtFornF.Text.Length>0 then
   vFiltro := vFiltro+ 'AND b.nome ='+QuotedStr(edtFornF.Text);
 if chkPeriodoEntradaF.IsChecked then
 begin
   vFiltro := vFiltro+ 'AND a.dataentradaestoque between '+QuotedStr(FormatDateTime('yyyy-mm-dd',edtDeF.Date))
   +' and '+QuotedStr(FormatDateTime('yyyy-mm-dd',edtAteF.Date));
 end;
 dbCtx.AbreEntradaEstoque(dbCtx.vIdSegmento,vFiltro);
end;

procedure TfrmCadEntradaEstoque.FormShow(Sender: TObject);
begin
  layItensNota.Visible := false;
  lblBuscar.Text       := 'Filtros';
  lblAdd.Text          := 'Adicionar';
  lblEdit.Text         := 'Editar';
  lblDeleta.Text       := 'Deletar';
  layListaMnu.Width    := 150;
  tbPrincipal.TabPosition := TTabPosition.None;
  tbPrincipal.ActiveTab   := tbiLista;
  layListaMnu.Enabled     := dbCtx.vTipoBDConfig=2;
  edtAteF.Enabled := false;
  edtDeF.Enabled  := false;
  dbCtx.AbreEntradaEstoque(dbCtx.vIdSegmento,'');
end;

procedure TfrmCadEntradaEstoque.Image11Click(Sender: TObject);
begin
 edtProduto.Text            :='';
 edtCentroCusto.Text        :='';
 edtLocalEstoque.Text       :='';
 cbxUnidadeMedida.ItemIndex :=-1;
 edtqtd.Text                :='0';
 edtValorTotalNF.Text       :='0';
 layItensNota.Visible := false;
end;

procedure TfrmCadEntradaEstoque.LimpaCampos;
begin
 edtNumNF.Text              := '';
 edtEmissaoNF.Date          := date;
 edtValorTotalNF.Value      := 0.00;
 edtDataEntradaFaz.Date     := date;
 edtProduto.Text            := '';
 cbxUnidadeMedida.ItemIndex :=-1;
 edtqtd.Text                :='0';
 edtCentroCusto.Text        := '';
 edtLocalEstoque.Text       := '';
 edtFornecedor.Text         := '';
end;

procedure TfrmCadEntradaEstoque.Rectangle12Click(Sender: TObject);
var
 vQry:TFDQuery;
begin
 vQry:=TFDQuery.Create(nil);
 vQry.Connection := dbCtx.FDConPG;
 edtqtd.SetFocus;
 if(edtValorTotalNF.Text.Length=0)or(edtValorTotalNF.Value<=0) then
 begin
   MyShowMessage('Informe o Valor total da NF!',false);
   edtValorTotalNF.SetFocus;
   Exit;
 end;
 if edtProduto.Text.Length=0 then
 begin
   MyShowMessage('Informe o Produto da NF!',false);
   edtProduto.SetFocus;
   Exit;
 end;

 if cbxUnidadeMedida.ItemIndex=-1 then
 begin
   MyShowMessage('Informe a Unidade de Medida!',false);
   cbxUnidadeMedida.SetFocus;
   Exit;
 end;
 if (edtqtd.Text.Length=0)or(edtqtd.Text='0')  then
 begin
   MyShowMessage('Informe a Qtde.!',false);
   edtqtd.SetFocus;
   Exit;
 end;
 with vQry,vQry.SQL do
 begin
   Clear;
   Add('INSERT INTO public.notafiscalitems(idusuario,idnota, idproduto,valortotalnf,qtditens,unidademedida,idlocalestoque)');
   Add('values(');
   Add(dbCtx.vIdUsuarioLogado+',');
   Add(vIdNFCAD+',');
   Add(vIdProduto+',');
   Add(StringReplace(edtValorTotalNF.Text,',','.',[rfReplaceAll])+',');
   Add(StringReplace(edtqtd.Text,',','.',[rfReplaceAll])+',');
   Add(cbxUnidadeMedida.Selected.Text.QuotedString+',');
   Add(vIdLocalEstoque+')');
   try
    ExecSQL;
    dbCtx.AtaulizaValorMedioProduto(vIdNFCAD,vIdProduto,
    FormatDateTime('yyyy-mm-dd',edtDataEntradaFaz.Date));
    MyShowMessage('Item adicionado com sucesso!',false);
    dbCtx.AbreItensNf(vIdNFCAD);
    Image11Click(Sender);
   except
   on E : Exception do
    ShowMessage('Erro ao inserir Item : '+E.Message);
   end;
 end;
 vQry.Free;
end;

procedure TfrmCadEntradaEstoque.Rectangle15Click(Sender: TObject);
begin
 dbCtx.AbreEntradaEstoque(dbCtx.vIdSegmento,'');
 MudarAba(tbiLista,sender);
end;

procedure TfrmCadEntradaEstoque.SearchEditButton1Click(Sender: TObject);
begin
  frmLocalEstoque := TfrmLocalEstoque.Create(Self);
  try
    frmLocalEstoque.ShowModal;
  finally
    edtLocalEstoqueF.Text := dbCtx.TLocalEstoqueNome.AsString;
    Filtro;
  end;
end;

procedure TfrmCadEntradaEstoque.SearchEditButton2Click(Sender: TObject);
begin
 frmCadFornecedor := TfrmCadFornecedor.Create(Self);
  try
    frmCadFornecedor.ShowModal;
  finally
    edtFornF.Text := dbCtx.TFornecedoresnome.AsString;
    Filtro;
  end;
end;

procedure TfrmCadEntradaEstoque.StringGrid1CellClick(const Column: TColumn;
  const Row: Integer);
begin
  dbCtx.AbreItensNf(dbCtx.TEstoqueEntradaid.AsString);
end;

procedure TfrmCadEntradaEstoque.StringGrid1SelChanged(Sender: TObject);
begin
  if dbCtx.TEstoqueEntradaid.AsString.Length>0 then
   dbCtx.AbreItensNf(dbCtx.TEstoqueEntradaid.AsString);
end;

procedure TfrmCadEntradaEstoque.tbPrincipalChange(Sender: TObject);
begin
 if tbPrincipal.TabIndex=2 then
  lblItemNf.Text := 'Itens da Nota : '+dbCtx.TEstoqueEntradanumeronf.AsString;
end;

end.
