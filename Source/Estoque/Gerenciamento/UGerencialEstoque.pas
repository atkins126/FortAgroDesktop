unit UGerencialEstoque;

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
  FMX.ListBox, FMX.DateTimeCtrls;

type
  TfrmGerencialEstoque = class(TfrmCadPadrao)
    BindSourceDB1: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    BindingsList1: TBindingsList;
    Label4: TLabel;
    edtCodFabF: TEdit;
    Layout1: TLayout;
    Layout2: TLayout;
    Layout3: TLayout;
    Rectangle1: TRectangle;
    Label5: TLabel;
    edtProdutoListaEnt: TEdit;
    Label6: TLabel;
    edtCodFabListaEnt: TEdit;
    gridListaEntrada: TStringGrid;
    ToolBar4: TToolBar;
    Layout4: TLayout;
    Label7: TLabel;
    Layout6: TLayout;
    edtFornecedorListaEnt: TEdit;
    Label8: TLabel;
    GroupBox1: TGroupBox;
    chkPeriodoEntradaF: TCheckBox;
    Label19: TLabel;
    edtDeFEntrada: TDateEdit;
    Label21: TLabel;
    edtAteFSaida: TDateEdit;
    Label9: TLabel;
    cbxCentroCusto: TComboBox;
    cbxLocalEstoque: TComboBox;
    Label10: TLabel;
    BindSourceDB2: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB2: TLinkGridToDataSource;
    Label11: TLabel;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    Image7: TImage;
    Label12: TLabel;
    btnGeraRelEntrada: TRectangle;
    Image8: TImage;
    Label13: TLabel;
    brtExportaEntrada: TRectangle;
    Image9: TImage;
    Label14: TLabel;
    btnBuscarListaEnt: TButton;
    SaveDialog1: TSaveDialog;
    tbiListaSaida: TTabItem;
    ToolBar5: TToolBar;
    Image10: TImage;
    Label15: TLabel;
    Rectangle4: TRectangle;
    FloatAnimation1: TFloatAnimation;
    Layout7: TLayout;
    Rectangle5: TRectangle;
    Layout8: TLayout;
    Layout9: TLayout;
    Rectangle6: TRectangle;
    Layout10: TLayout;
    Layout11: TLayout;
    Layout12: TLayout;
    Rectangle7: TRectangle;
    Label16: TLabel;
    Image11: TImage;
    Rectangle8: TRectangle;
    Label17: TLabel;
    Image12: TImage;
    Layout13: TLayout;
    Layout14: TLayout;
    Layout15: TLayout;
    Rectangle9: TRectangle;
    Label18: TLabel;
    edtProdutoSaida: TEdit;
    Label20: TLabel;
    edtCodFabSaida: TEdit;
    GroupBox2: TGroupBox;
    chkPeriodoSaida: TCheckBox;
    Label23: TLabel;
    edtDataDeSaida: TDateEdit;
    Label24: TLabel;
    edtDataAteSaida: TDateEdit;
    Label25: TLabel;
    cbxCentroCustoSaida: TComboBox;
    cbxLocalEstoqueSaida: TComboBox;
    Label26: TLabel;
    btnBuscaSaida: TButton;
    GridListaSaida: TStringGrid;
    ToolBar6: TToolBar;
    Layout16: TLayout;
    Label27: TLabel;
    Layout17: TLayout;
    SaveDialog2: TSaveDialog;
    Rectangle10: TRectangle;
    Rectangle11: TRectangle;
    Image13: TImage;
    Label28: TLabel;
    btnGeraListaSaida: TRectangle;
    Image14: TImage;
    Label29: TLabel;
    Rectangle13: TRectangle;
    Image15: TImage;
    Label30: TLabel;
    BindSourceDB3: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB3: TLinkGridToDataSource;
    cbxTipoEntrada: TComboBox;
    edtTipoEntrada: TLabel;
    Label22: TLabel;
    cbxTipoSaida: TComboBox;
    edtSubGrupoF: TEdit;
    btnBuscaSubGrupo: TSearchEditButton;
    ClearEditButton3: TClearEditButton;
    edtGrupoF: TEdit;
    btnBuscaGrupo: TSearchEditButton;
    ClearEditButton2: TClearEditButton;
    EdtCategoriaF: TEdit;
    btnBuscaCategoriaF: TSearchEditButton;
    ClearEditButton1: TClearEditButton;
    edtMarcaF: TEdit;
    btnBuscarMarcaF: TSearchEditButton;
    ClearEditButton4: TClearEditButton;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    edtSubGrupoFEntrada: TEdit;
    SearchEditButton1: TSearchEditButton;
    ClearEditButton5: TClearEditButton;
    Label36: TLabel;
    edtSessaoFEntrada: TEdit;
    SearchEditButton2: TSearchEditButton;
    ClearEditButton6: TClearEditButton;
    Label37: TLabel;
    edtGrupoFEntrada: TEdit;
    SearchEditButton3: TSearchEditButton;
    ClearEditButton7: TClearEditButton;
    Label38: TLabel;
    edtGrupoFSaida: TEdit;
    SearchEditButton4: TSearchEditButton;
    ClearEditButton8: TClearEditButton;
    Label39: TLabel;
    edtSubGrupoFSaida: TEdit;
    SearchEditButton5: TSearchEditButton;
    ClearEditButton9: TClearEditButton;
    Label40: TLabel;
    edtSessaoFSaida: TEdit;
    SearchEditButton6: TSearchEditButton;
    ClearEditButton10: TClearEditButton;
    Button1: TButton;
    edtNumNFF: TEdit;
    Label41: TLabel;
    btnAtualizaSaldos: TRectangle;
    Image16: TImage;
    Label42: TLabel;
    chkSaldoNegativo: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure edtNomeFiltroChangeTracking(Sender: TObject);
    procedure edtCodFabFChangeTracking(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnBuscarListaEntClick(Sender: TObject);
    procedure btnGeraRelEntradaClick(Sender: TObject);
    procedure brtExportaEntradaClick(Sender: TObject);
    procedure btnBuscaSaidaClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnGeraListaSaidaClick(Sender: TObject);
    procedure Rectangle13Click(Sender: TObject);
    procedure btnBuscaCategoriaFClick(Sender: TObject);
    procedure btnBuscaGrupoClick(Sender: TObject);
    procedure btnBuscaSubGrupoClick(Sender: TObject);
    procedure btnBuscarMarcaFClick(Sender: TObject);
    procedure ClearEditButton3Click(Sender: TObject);
    procedure ClearEditButton4Click(Sender: TObject);
    procedure ClearEditButton1Click(Sender: TObject);
    procedure ClearEditButton2Click(Sender: TObject);
    procedure SearchEditButton3Click(Sender: TObject);
    procedure SearchEditButton1Click(Sender: TObject);
    procedure SearchEditButton2Click(Sender: TObject);
    procedure ClearEditButton7Click(Sender: TObject);
    procedure ClearEditButton5Click(Sender: TObject);
    procedure ClearEditButton6Click(Sender: TObject);
    procedure SearchEditButton4Click(Sender: TObject);
    procedure SearchEditButton5Click(Sender: TObject);
    procedure SearchEditButton6Click(Sender: TObject);
    procedure ClearEditButton10Click(Sender: TObject);
    procedure ClearEditButton9Click(Sender: TObject);
    procedure ClearEditButton8Click(Sender: TObject);
    procedure edtProdutoListaEntChangeTracking(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure edtProdutoSaidaKeyUp(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure edtCodFabSaidaKeyUp(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure edtProdutoListaEntKeyUp(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure edtNomeFiltroKeyUp(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure btnAtualizaSaldosClick(Sender: TObject);
  private
    { Private declarations }
  public
    vIdCategoriaF,
    vIdGrupoF,vIdSubGrupoF,vIdMarcaF :string;
    procedure Filtro;
    procedure FiltroListaEntrada;
    procedure FiltroListaSaida;
    procedure CarregaCombobox;
    procedure ExpXLS(DataSet: TDataSet; Arq: string);
    procedure ExpTXT(DataSet: TDataSet; Arq: string);
  end;

var
  frmGerencialEstoque: TfrmGerencialEstoque;

implementation

{$R *.fmx}

uses UDmReports, DataContext, UAuxCategoriaProd, UAuxGrupo, UAuxSubGrupo,
  UAuxMarcas;

procedure TfrmGerencialEstoque.brtExportaEntradaClick(Sender: TObject);
var
 arq: TextFile;
begin
 if gridListaEntrada.RowCount>0 then
 begin
  if SaveDialog1.Execute then
    ExpTXT(dmReport.QryListaEntrEstoque,SaveDialog1.FileName);
//   ExpXLS(dmReport.QryEstoqueG,SaveDialog1.FileName);
  MyShowMessage('Arquivo gerado com sucesso :'+#13+SaveDialog1.FileName,false);
 end
 else
  MyShowMessage('Sem dados para esse filtro',false);
end;

procedure TfrmGerencialEstoque.btnAddClick(Sender: TObject);
begin
 dmReport.ppRepEstoqueG.Print;
end;

procedure TfrmGerencialEstoque.btnAtualizaSaldosClick(Sender: TObject);
begin
  try
   dbCtx.AtualzisaSaldoGeral;
   MyShowMessage('Saldo Atualizado com Sucesso!',false);
   Button1Click(sender);
  except
   on E: Exception do
    myShowMessage('Erro ao salvar Atualizar Saldo:'+E.Message,false);
  end;
end;

procedure TfrmGerencialEstoque.btnBuscaCategoriaFClick(Sender: TObject);
begin
  frmAuxCategoriasProd := TfrmAuxCategoriasProd.Create(nil);
  try
    frmAuxCategoriasProd.ShowModal;
  finally
    EdtCategoriaF.text         := dbCtx.TAuxCategoriasnome.AsString;
    vIdCategoriaF              := dbCtx.TAuxCategoriasid.AsString;
    frmAuxCategoriasProd.Free;
  end;
end;

procedure TfrmGerencialEstoque.btnBuscaGrupoClick(Sender: TObject);
begin
  frmAuxGrupo := TfrmAuxGrupo.Create(nil);
  try
    frmAuxGrupo.ShowModal;
  finally
    edtGrupoF.text              := dbCtx.TAuxGruponome.AsString;
    vIdGrupoF                   := dbCtx.TAuxGrupoid.AsString;
    frmAuxGrupo.Free;
  end;
end;

procedure TfrmGerencialEstoque.btnBuscarListaEntClick(Sender: TObject);
begin
 FiltroListaEntrada;
end;

procedure TfrmGerencialEstoque.btnBuscarMarcaFClick(Sender: TObject);
begin
  frmCadAuxMarcas := TfrmCadAuxMarcas.Create(nil);
  try
    frmCadAuxMarcas.ShowModal;
  finally
    edtMarcaF.text         := dbCtx.TAuxMarcanome.AsString;
    vIdMarcaF              := dbCtx.TAuxMarcaid.AsString;
    frmCadAuxMarcas.Free;
  end;
end;

procedure TfrmGerencialEstoque.btnBuscaSaidaClick(Sender: TObject);
begin
  FiltroListaSaida;
end;

procedure TfrmGerencialEstoque.btnBuscaSubGrupoClick(Sender: TObject);
begin
  frmAuxSubGrupo := TfrmAuxSubGrupo.Create(nil);
  try
    frmAuxSubGrupo.ShowModal;
  finally
    edtSubGrupoF.text              := dbCtx.TAuxSubGruponome.AsString;
    vIdSubGrupoF                   := dbCtx.TAuxSubGrupoid.AsString;
    frmAuxSubGrupo.Free;
  end;
end;

procedure TfrmGerencialEstoque.btnDeletarClick(Sender: TObject);
begin
 MudarAba(tbiListaSaida,sender);
end;

procedure TfrmGerencialEstoque.btnEditarClick(Sender: TObject);
begin
 MudarAba(tbiCad,sender);
end;

procedure TfrmGerencialEstoque.btnGeraListaSaidaClick(Sender: TObject);
begin
 if GridListaSaida.RowCount>0 then
  dmReport.ppRepppListaSaidaEstoque.print
 else
  MyShowMessage('Sem dados para esse filtro',false);
end;

procedure TfrmGerencialEstoque.btnGeraRelEntradaClick(Sender: TObject);
begin
 if gridListaEntrada.RowCount>0 then
  dmReport.ppRepListaEntrEstoque.print
 else
  MyShowMessage('Sem dados para esse filtro',false);
end;

procedure TfrmGerencialEstoque.Button1Click(Sender: TObject);
begin
   Filtro;
end;

procedure TfrmGerencialEstoque.CarregaCombobox;
begin
 cbxCentroCusto.Items.Clear;
 cbxCentroCusto.Items.add('Todos');
 cbxCentroCustoSaida.Items.Clear;
 cbxCentroCustoSaida.Items.add('Todos');
 dbCtx.TCentroCusto.Close;
 dbCtx.TCentroCusto.Open;
 while not dbCtx.TCentroCusto.eof  do
 begin
   cbxCentroCusto.Items.add(dbCtx.TCentroCustonome.AsString);
   cbxCentroCustoSaida.Items.add(dbCtx.TCentroCustonome.AsString);
   dbCtx.TCentroCusto.Next;
 end;

 cbxLocalEstoque.Items.Clear;
 cbxLocalEstoque.Items.add('Todos');
 cbxLocalEstoqueSaida.Items.Clear;
 cbxLocalEstoqueSaida.Items.add('Todos');
 dbCtx.TLocalEstoque.Close;
 dbCtx.TLocalEstoque.Open;
 while not dbCtx.TLocalEstoque.eof  do
 begin
   cbxLocalEstoque.Items.add(dbCtx.TLocalEstoquenome.AsString);
   cbxLocalEstoqueSaida.Items.add(dbCtx.TLocalEstoquenome.AsString);
   dbCtx.TLocalEstoque.Next;
 end;
 cbxLocalEstoque.ItemIndex       :=0;
 cbxCentroCusto.ItemIndex        :=0;
 cbxCentroCustoSaida.ItemIndex   :=0;
 cbxLocalEstoqueSaida.ItemIndex  :=0;
end;

procedure TfrmGerencialEstoque.ClearEditButton10Click(Sender: TObject);
begin
  inherited;
  FiltroListaSaida;
end;

procedure TfrmGerencialEstoque.ClearEditButton1Click(Sender: TObject);
begin
  inherited;
  Filtro;
end;

procedure TfrmGerencialEstoque.ClearEditButton2Click(Sender: TObject);
begin
  inherited;
  Filtro;
end;

procedure TfrmGerencialEstoque.ClearEditButton3Click(Sender: TObject);
begin
  inherited;
  Filtro;
end;

procedure TfrmGerencialEstoque.ClearEditButton4Click(Sender: TObject);
begin
  inherited;
  Filtro;
end;

procedure TfrmGerencialEstoque.ClearEditButton5Click(Sender: TObject);
begin
  inherited;
  FiltroListaEntrada;
end;

procedure TfrmGerencialEstoque.ClearEditButton6Click(Sender: TObject);
begin
  inherited;
  FiltroListaEntrada;
end;

procedure TfrmGerencialEstoque.ClearEditButton7Click(Sender: TObject);
begin
 inherited;
 FiltroListaEntrada;
end;

procedure TfrmGerencialEstoque.ClearEditButton8Click(Sender: TObject);
begin
 inherited;
 FiltroListaSaida;
end;

procedure TfrmGerencialEstoque.ClearEditButton9Click(Sender: TObject);
begin
  inherited;
  FiltroListaSaida;
end;

procedure TfrmGerencialEstoque.edtCodFabFChangeTracking(Sender: TObject);
begin
 Filtro;
end;

procedure TfrmGerencialEstoque.edtCodFabSaidaKeyUp(Sender: TObject;
  var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
 if key=13 then
   FiltroListaSaida;
end;

procedure TfrmGerencialEstoque.edtNomeFiltroChangeTracking(Sender: TObject);
begin
 Filtro;
end;

procedure TfrmGerencialEstoque.edtNomeFiltroKeyUp(Sender: TObject;
  var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
 if key=13 then
  Filtro;
end;

procedure TfrmGerencialEstoque.edtProdutoListaEntChangeTracking(
  Sender: TObject);
begin
 FiltroListaEntrada;
end;

procedure TfrmGerencialEstoque.edtProdutoListaEntKeyUp(Sender: TObject;
  var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
 if key=13 then
  FiltroListaEntrada;
end;

procedure TfrmGerencialEstoque.edtProdutoSaidaKeyUp(Sender: TObject;
  var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
 if key=13 then
   FiltroListaSaida;
end;

procedure TfrmGerencialEstoque.ExpTXT(DataSet: TDataSet; Arq: string);
var
  i: integer;
  sl: TStringList;
  st: string;
begin
  DataSet.First;
  sl := TStringList.Create;
  try
    st := '';
    for i := 0 to DataSet.Fields.Count - 1 do
      st := st + DataSet.Fields[i].DisplayLabel + ';';
    sl.Add(st);
    DataSet.First;
    while not DataSet.Eof do
    begin
      st := '';
      for i := 0 to DataSet.Fields.Count - 1 do
        st := st + DataSet.Fields[i].DisplayText + ';';
      sl.Add(st);
      DataSet.Next;
    end;
    sl.SaveToFile(Arq);
  finally
     sl.free;
  end;
end;


procedure TfrmGerencialEstoque.ExpXLS(DataSet: TDataSet; Arq: string);
var
 Arquivo: TextFile;
 nX, nY: SmallInt;
 Cabecalho: TStringLIst;
 LinhaDados: String;
begin
  begin
    Cabecalho := TStringList.Create;
    AssignFile(Arquivo, Arq);
    ReWrite(Arquivo);

    DataSet.Open;

    Cabecalho := DataSet.FieldList;
    nY := Cabecalho.Count-1;

    LinhaDados := '';
    For nX := 0 to nY do
    begin
     LinhaDados := LinhaDados + Cabecalho.Strings[nX] + ';';
    end;
   WriteLn(Arquivo, LinhaDados);
   nY := DataSet.FieldCount-1;
   while not DataSet.Eof do
   begin
     LinhaDados := '';
     For nX := 0 to nY do
     begin
      LinhaDados := LinhaDados + DataSet.FieldByName(Cabecalho.Strings[nX]).AsString+';';
     end;
     WriteLn(Arquivo, LinhaDados);
     DataSet.Next;
   end;
   Cabecalho.Free;
   CloseFile(Arquivo);
  end;
end;

procedure TfrmGerencialEstoque.FiltroListaEntrada;
var
 vFiltro:string;
 vDataDe,vDataAte:string;
begin
  vDataDe  := FormatDateTime('yyyy-mm-dd',edtDeFEntrada.Date).QuotedString;
  vDataAte := FormatDateTime('yyyy-mm-dd',edtAteFSaida.Date).QuotedString;

  vFiltro :='';
  if edtProdutoListaEnt.Text.Length>0 then
   vFiltro := 'and c.nome like '+QuotedStr('%'+edtProdutoListaEnt.Text+'%');

  if edtCodFabListaEnt.Text.Length>0 then
   vFiltro := vFiltro+'and c.codigofabricante like '+QuotedStr('%'+edtCodFabListaEnt.Text+'%');

  if edtFornecedorListaEnt.Text.Length>0 then
   vFiltro := vFiltro+'and f.nome like '+QuotedStr('%'+edtFornecedorListaEnt.Text+'%');

  if cbxCentroCusto.ItemIndex>0 then
   vFiltro := vFiltro+'and e.nome ='+cbxCentroCusto.Selected.Text.QuotedString;

  if cbxLocalEstoque.ItemIndex>0 then
   vFiltro := vFiltro+'and d.nome ='+cbxLocalEstoque.Selected.Text.QuotedString;

   if cbxTipoEntrada.ItemIndex>0 then
   begin
    if cbxTipoEntrada.ItemIndex=1 then
     vFiltro := vFiltro+'and b.tipo =0';

    if cbxTipoEntrada.ItemIndex=2 then
     vFiltro := vFiltro+'and b.tipo =1'
   end;

  if edtSessaoFEntrada.Text.Length >0 then
   vFiltro := vFiltro+' and idCategoria ='+vIdCategoriaF;

  if edtGrupoFEntrada.Text.Length>0 then
   vFiltro := vFiltro+' and idgrupo ='+vIdGrupoF;

  if edtSubGrupoFEntrada.Text.Length>0 then
   vFiltro := vFiltro+' and idsubgrupo ='+vIdSubGrupoF;

  if edtMarcaF.Text.Length>0 then
   vFiltro := vFiltro+' and idmarca ='+vIdMarcaF;

  if edtNumNFF.Text.Length>0 then
   vFiltro := vFiltro+' and b.numeronf ='+edtNumNFF.Text;

  if chkPeriodoEntradaF.IsChecked then
  begin
   vFiltro := vFiltro+'and b.dataentradaestoque  between '+vDataDe+' and '+vDataAte;
  end;
  if vFiltro.Length>0 then
   dmReport.AbreListaEntradas(vFiltro)
  else
   dmReport.AbreListaEntradas('')
end;

procedure TfrmGerencialEstoque.Filtro;
var
 vFiltro:string;
begin
  vFiltro :='';
  if edtNomeFiltro.Text.Length>0 then
   vFiltro := 'and nome like '+QuotedStr('%'+edtNomeFiltro.Text+'%');
  if edtCodFabF.Text.Length>0 then
   vFiltro := vFiltro+'and codigofabricante like '+QuotedStr('%'+edtCodFabF.Text+'%');


  if edtCategoriaF.Text.Length >0 then
   vFiltro := vFiltro+' and idCategoria ='+vIdCategoriaF;

  if edtGrupoF.Text.Length>0 then
   vFiltro := vFiltro+' and idgrupo ='+vIdGrupoF;

  if edtSubGrupoF.Text.Length>0 then
   vFiltro := vFiltro+' and idsubgrupo ='+vIdSubGrupoF;

  if edtMarcaF.Text.Length>0 then
   vFiltro := vFiltro+' and idmarca ='+vIdMarcaF;

  if chkSaldoNegativo.IsChecked then
   vFiltro := vFiltro+' and saldoatual<=0'+vIdMarcaF;

  if vFiltro.Length>0 then
   dmReport.SaldoAtualCustoMedio(vFiltro)
  else
   dmReport.SaldoAtualCustoMedio('')
end;

procedure TfrmGerencialEstoque.FiltroListaSaida;
var
 vFiltro:string;
 vDataDe,vDataAte:string;
begin
  vDataDe  := FormatDateTime('yyyy-mm-dd',edtDataDeSaida.Date).QuotedString;
  vDataAte := FormatDateTime('yyyy-mm-dd',edtDataAteSaida.Date).QuotedString;

  vFiltro :='';
  if edtProdutoSaida.Text.Length>0 then
   vFiltro := 'and c.nome like '+QuotedStr('%'+edtProdutoSaida.Text+'%');

  if edtCodFabSaida.Text.Length>0 then
   vFiltro := vFiltro+'and c.codigofabricante like '+QuotedStr('%'+edtCodFabSaida.Text+'%');


  if cbxCentroCustoSaida.ItemIndex>0 then
   vFiltro := vFiltro+'and e.nome ='+cbxCentroCustoSaida.Selected.Text.QuotedString;

  if cbxLocalEstoqueSaida.ItemIndex>0 then
   vFiltro := vFiltro+'and d.nome ='+cbxLocalEstoqueSaida.Selected.Text.QuotedString;

  if cbxTipoSaida.ItemIndex>0 then
   begin
    if cbxTipoSaida.ItemIndex=1 then
     vFiltro := vFiltro+'and tipo_baixa=0';

    if cbxTipoSaida.ItemIndex=2 then
     vFiltro := vFiltro+'and tipo_baixa=1'
   end;

  if edtSessaoFSaida.Text.Length >0 then
   vFiltro := vFiltro+' and idCategoria ='+vIdCategoriaF;

  if edtGrupoFSaida.Text.Length>0 then
   vFiltro := vFiltro+' and idgrupo ='+vIdGrupoF;

  if edtSubGrupoFSaida.Text.Length>0 then
   vFiltro := vFiltro+' and idsubgrupo ='+vIdSubGrupoF;

  if chkPeriodoSaida.IsChecked then
  begin
   vFiltro := vFiltro+'and a.datasaidaestoque between '+vDataDe+' and '+vDataAte;
  end;
  if vFiltro.Length>0 then
   dmReport.AbreListaSaidas(vFiltro)
  else
   dmReport.AbreListaSaidas('')
end;

procedure TfrmGerencialEstoque.FormShow(Sender: TObject);
begin
  CarregaCombobox;
  dmReport.SaldoAtualCustoMedio('');
  tbPrincipal.TabPosition := TTabPosition.None;
  tbPrincipal.ActiveTab   := tbiLista;
end;

procedure TfrmGerencialEstoque.Rectangle13Click(Sender: TObject);
var
 arq: TextFile;
begin
 if gridListaEntrada.RowCount>0 then
 begin
  if SaveDialog1.Execute then
    ExpTXT(dmReport.QryListaSaidaEstoque,SaveDialog1.FileName);
  MyShowMessage('Arquivo gerado com sucesso :'+#13+SaveDialog1.FileName,false);
 end
 else
  MyShowMessage('Sem dados para esse filtro',false);
end;

procedure TfrmGerencialEstoque.SearchEditButton1Click(Sender: TObject);
begin
 frmAuxSubGrupo := TfrmAuxSubGrupo.Create(nil);
  try
    frmAuxSubGrupo.ShowModal;
  finally
    edtSubGrupoFEntrada.text              := dbCtx.TAuxSubGruponome.AsString;
    vIdSubGrupoF                   := dbCtx.TAuxSubGrupoid.AsString;
    frmAuxSubGrupo.Free;
  end;
end;

procedure TfrmGerencialEstoque.SearchEditButton2Click(Sender: TObject);
begin
 frmAuxCategoriasProd := TfrmAuxCategoriasProd.Create(nil);
  try
    frmAuxCategoriasProd.ShowModal;
  finally
    edtSessaoFEntrada.text      := dbCtx.TAuxCategoriasnome.AsString;
    vIdCategoriaF               := dbCtx.TAuxCategoriasid.AsString;
    frmAuxCategoriasProd.Free;
  end;
end;

procedure TfrmGerencialEstoque.SearchEditButton3Click(Sender: TObject);
begin
 frmAuxGrupo := TfrmAuxGrupo.Create(nil);
  try
    frmAuxGrupo.ShowModal;
  finally
    edtGrupoFEntrada.text              := dbCtx.TAuxGruponome.AsString;
    vIdGrupoF                   := dbCtx.TAuxGrupoid.AsString;
    frmAuxGrupo.Free;
  end;
end;

procedure TfrmGerencialEstoque.SearchEditButton4Click(Sender: TObject);
begin
  frmAuxGrupo := TfrmAuxGrupo.Create(nil);
  try
    frmAuxGrupo.ShowModal;
  finally
    edtGrupoFSaida.text         := dbCtx.TAuxGruponome.AsString;
    vIdGrupoF                   := dbCtx.TAuxGrupoid.AsString;
    frmAuxGrupo.Free;
  end;
end;

procedure TfrmGerencialEstoque.SearchEditButton5Click(Sender: TObject);
begin
  frmAuxSubGrupo := TfrmAuxSubGrupo.Create(nil);
  try
    frmAuxSubGrupo.ShowModal;
  finally
    edtSubGrupoFSaida.text         := dbCtx.TAuxSubGruponome.AsString;
    vIdSubGrupoF                   := dbCtx.TAuxSubGrupoid.AsString;
    frmAuxSubGrupo.Free;
  end;
end;

procedure TfrmGerencialEstoque.SearchEditButton6Click(Sender: TObject);
begin
 frmAuxCategoriasProd := TfrmAuxCategoriasProd.Create(nil);
  try
    frmAuxCategoriasProd.ShowModal;
  finally
    edtSessaoFSaida.text        := dbCtx.TAuxCategoriasnome.AsString;
    vIdCategoriaF               := dbCtx.TAuxCategoriasid.AsString;
    frmAuxCategoriasProd.Free;
  end;
end;

end.
