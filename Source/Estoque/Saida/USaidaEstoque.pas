unit USaidaEstoque;

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
  Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope,
  FMX.DateTimeCtrls;

type
  TfrmSaidaEstoque = class(TfrmCadPadrao)
    Layout490000000000000: TLayout;
    Layout47000000000: TLayout;
    Label31000000000: TLabel;
    layCapDadosPasto: TLayout;
    lbll: TLabel;
    Layout48000000000: TLayout;
    cbxCurralPastoGrupo: TComboBox;
    LayValueDadosPasto: TLayout;
    Layout1: TLayout;
    Rectangle1: TRectangle;
    Layout2: TLayout;
    Layout3: TLayout;
    Layout4: TLayout;
    Label4: TLabel;
    Layout6: TLayout;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Layout7: TLayout;
    ComboBox1: TComboBox;
    Layout8: TLayout;
    edtProduto: TEdit;
    EditButton1: TEditButton;
    cbxUnidadeMedida: TComboBox;
    edtqtd: TEdit;
    cbxTipoSaida: TComboBox;
    Layout9: TLayout;
    Rectangle2: TRectangle;
    Layout10: TLayout;
    Layout11: TLayout;
    Label7: TLabel;
    Layout12: TLayout;
    Label12: TLabel;
    Label13: TLabel;
    Layout13: TLayout;
    ComboBox2: TComboBox;
    Layout14: TLayout;
    edtCentroCusto: TEdit;
    EditButton2: TEditButton;
    edtLocalEstoque: TEdit;
    EditButton3: TEditButton;
    BindSourceDB1: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    BindingsList1: TBindingsList;
    edtCodFabF: TEdit;
    Label20: TLabel;
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
    Label9: TLabel;
    edtDataSaida: TDateEdit;
    Layout15: TLayout;
    Rectangle3: TRectangle;
    Layout16: TLayout;
    Layout17: TLayout;
    Label10: TLabel;
    Layout18: TLayout;
    Label11: TLabel;
    Layout19: TLayout;
    ComboBox3: TComboBox;
    Layout20: TLayout;
    edtResponsavel: TEdit;
    EditButton4: TEditButton;
    Label14: TLabel;
    cbxTipoSaidaF: TComboBox;
    procedure EditButton1Click(Sender: TObject);
    procedure EditButton2Click(Sender: TObject);
    procedure EditButton3Click(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure btnBuscaCategoriaFClick(Sender: TObject);
    procedure SearchEditButton1Click(Sender: TObject);
    procedure ClearEditButton1Click(Sender: TObject);
    procedure ClearEditButton2Click(Sender: TObject);
    procedure edtNomeFiltroChangeTracking(Sender: TObject);
    procedure edtCodFabFChangeTracking(Sender: TObject);
    procedure chkPeriodoEntradaFChange(Sender: TObject);
    procedure edtDeFClosePicker(Sender: TObject);
    procedure edtAteFClosePicker(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure EditButton4Click(Sender: TObject);
    procedure cbxTipoSaidaFChange(Sender: TObject);
  private
    procedure Filtro;
  public
    vIdProduto,vIdCentroCusto,vIdLocalEstoque,vIDResponsavel:string;
    procedure LimpaCampos;
  end;

var
  frmSaidaEstoque: TfrmSaidaEstoque;

implementation

{$R *.fmx}

uses UProdutos, DataContext, UCentrodeCusto, LocalEstoque, UPrincipal,
  UUsuarios;

procedure TfrmSaidaEstoque.btnAddClick(Sender: TObject);
begin
  LimpaCampos;
  dbCtx.TEstoqueSaida.Close;
  dbCtx.TEstoqueSaida.Open;
  dbCtx.TEstoqueSaida.Insert;
  inherited;
end;

procedure TfrmSaidaEstoque.LimpaCampos;
begin
 edtDataSaida.Date          := date;
 edtProduto.Text            := '';
 cbxUnidadeMedida.ItemIndex :=-1;
 edtqtd.Text                :='0';
 edtCentroCusto.Text        := '';
 edtLocalEstoque.Text       := '';
 edtResponsavel.Text        := '';
end;

procedure TfrmSaidaEstoque.btnBuscaCategoriaFClick(Sender: TObject);
begin
  frmCentroCusto := TfrmCentroCusto.Create(Self);
  try
    frmCentroCusto.ShowModal;
  finally
    edtCentroCustoF.Text := dbCtx.TCentroCustonome.AsString;
    Filtro;
  end;
end;

procedure TfrmSaidaEstoque.btnDeletarClick(Sender: TObject);
begin
   MyShowMessage('Deseja Realmente Deletar esse registro?',true);
   case frmPrincipal.vMsgConfirma of
     1:begin
        dbCtx.TEstoqueSaida.Edit;
        dbCtx.TEstoqueSaidaStatus.AsInteger := -1;
        dbCtx.TEstoqueSaidaIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
        dbCtx.TEstoqueSaidaDataAlteracao.AsDateTime     := now;
        dbCtx.AlteraFlaSynAWS_ZERO('estoquesaida',dbCtx.TEstoqueSaidaID.AsString);
        try
          dbCtx.TEstoqueSaidasyncaws.AsInteger            :=0;
          dbCtx.TEstoqueSaida.ApplyUpdates(-1);
          MyShowMessage('Registro Excluido com sucesso!',false);
          dbCtx.TEstoqueSaida.Close;
          dbCtx.TEstoqueSaida.Open();
        except
         on E : Exception do
          ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
        end;
     end;
   end;
end;

procedure TfrmSaidaEstoque.btnEditarClick(Sender: TObject);
begin
  dbCtx.TEstoqueSaida.Edit;
  vIdProduto                                         := dbCtx.TEstoqueSaidaidproduto.AsString;
  edtProduto.Text                                    := dbCtx.TEstoqueSaidaproduto.AsString;
  edtDataSaida.Date                                  := dbCtx.TEstoqueSaidadatasaidaestoque.AsDateTime;
  edtqtd.Text                                        := dbCtx.TEstoqueSaidaqtditens.AsString;
  cbxUnidadeMedida.ItemIndex                         := cbxUnidadeMedida.Items.IndexOf(dbCtx.TEstoqueSaidaunidademedida.AsString);
  vIdLocalEstoque                                    := dbCtx.TEstoqueSaidaidlocalestoque.AsString;
  edtLocalEstoque.Text                               := dbCtx.TEstoqueSaidalocalestoque.AsString;
  vIdCentroCusto                                     := dbCtx.TEstoqueSaidaidcentrocusto.AsString;
  edtCentroCusto.Text                                := dbCtx.TEstoqueSaidacentrocusto.AsString;
  cbxTipoSaida.ItemIndex                             := dbCtx.TEstoqueSaidatipo_baixa.AsInteger            ;
  inherited;
end;

procedure TfrmSaidaEstoque.btnSalvarClick(Sender: TObject);
begin
  if cbxTipoSaida.ItemIndex=-1 then
  begin
    MyShowMessage('Informe a tipo de baixa!',false);
    Exit;
  end;
  if edtProduto.Text.Length=0 then
  begin
    MyShowMessage('Informe o produto!',false);
    Exit;
  end;
  if cbxUnidadeMedida.ItemIndex=-1 then
  begin
    MyShowMessage('Informe a unidade de medida!',false);
    Exit;
  end;
  if edtResponsavel.Text.Length=0 then
  begin
    MyShowMessage('Informe o Responsavel!',false);
    Exit;
  end;
 if dbCtx.TEstoqueSaida.State=dsInsert then
 begin
   dbCtx.TEstoqueSaidaidusuario.AsString := dbCtx.vIdUsuarioLogado;
 end;
 if dbCtx.TEstoqueSaida.State=dsEdit then
 begin
   dbCtx.TEstoqueSaidaidusuarioalteracao.AsString := dbCtx.vIdUsuarioLogado;
   dbCtx.TEstoqueSaidadataalteracao.AsDateTime    := now;
   dbCtx.AlteraFlaSynAWS_ZERO('estoquesaida',dbCtx.TEstoqueSaidaID.AsString);
 end;
 dbCtx.TEstoqueSaidaidproduto.AsString                 := vIdProduto;
 dbCtx.TEstoqueSaidadatasaidaestoque.AsDateTime        := edtDataSaida.Date;
 dbCtx.TEstoqueSaidaqtditens.AsString                  := StringReplace(edtqtd.Text,',','.',[rfReplaceAll]);
 dbCtx.TEstoqueSaidaunidademedida.AsString             := cbxUnidadeMedida.Selected.Text;
 dbCtx.TEstoqueSaidaidlocalestoque.AsString            := vIdLocalEstoque;
 dbCtx.TEstoqueSaidaidcentrocusto.AsString             := vIdCentroCusto;
 dbCtx.TEstoqueSaidaidresponsavel.AsString             := vIDResponsavel;
 dbCtx.TEstoqueSaidatipo_baixa.AsInteger               := cbxTipoSaida.ItemIndex;
 dbCtx.TEstoqueSaidavalorsaida.AsFloat                 := dbCtx.RetornaCustoMedioProduto(vIdProduto);
 try
  dbCtx.TEstoqueSaida.ApplyUpdates(-1);
  dbCtx.AtaulizaSaldoAtualCustoMedio(vIdProduto);
  MyShowMessage('Baixa realizada com sucesso!',false);
  dbCtx.AbreSaidaEstoque(dbCtx.vIdSegmento,'');
  inherited;
 except
 on E: Exception do
    ShowMessage('Erro ao salvar Registro:'+E.Message);
 end;
end;

procedure TfrmSaidaEstoque.cbxTipoSaidaFChange(Sender: TObject);
begin
 Filtro;
end;

procedure TfrmSaidaEstoque.chkPeriodoEntradaFChange(Sender: TObject);
begin
 edtAteF.Enabled := chkPeriodoEntradaF.IsChecked;
 edtDeF.Enabled  := chkPeriodoEntradaF.IsChecked;
end;

procedure TfrmSaidaEstoque.ClearEditButton1Click(Sender: TObject);
begin
  inherited;
  Filtro;
end;

procedure TfrmSaidaEstoque.ClearEditButton2Click(Sender: TObject);
begin
  inherited;
  Filtro;
end;

procedure TfrmSaidaEstoque.EditButton1Click(Sender: TObject);
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

procedure TfrmSaidaEstoque.EditButton2Click(Sender: TObject);
begin
  frmCentroCusto := TfrmCentroCusto.Create(Self);
  try
    frmCentroCusto.ShowModal;
  finally
    vIdCentroCusto      := dbCtx.TCentroCustoid.AsString;
    edtCentroCusto.Text := dbCtx.TCentroCustonome.AsString;
  end;
end;

procedure TfrmSaidaEstoque.EditButton3Click(Sender: TObject);
begin
  frmLocalEstoque := TfrmLocalEstoque.Create(Self);
  try
    frmLocalEstoque.ShowModal;
  finally
    vIdLocalEstoque       := dbCtx.TLocalEstoqueid.AsString;
    edtLocalEstoque.Text  := dbCtx.TLocalEstoquenome.AsString;
  end;
end;

procedure TfrmSaidaEstoque.EditButton4Click(Sender: TObject);
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

procedure TfrmSaidaEstoque.edtAteFClosePicker(Sender: TObject);
begin
  filtro;
end;

procedure TfrmSaidaEstoque.edtCodFabFChangeTracking(Sender: TObject);
begin
 Filtro;
end;

procedure TfrmSaidaEstoque.edtDeFClosePicker(Sender: TObject);
begin
  filtro;
end;

procedure TfrmSaidaEstoque.edtNomeFiltroChangeTracking(Sender: TObject);
begin
  Filtro;
end;

procedure TfrmSaidaEstoque.Filtro;
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
 if cbxTipoSaidaF.ItemIndex>0 then
 begin
   if cbxTipoSaidaF.ItemIndex=1 then
    vFiltro := vFiltro+ 'AND tipo_baixa=0';
   if cbxTipoSaidaF.ItemIndex=2 then
    vFiltro := vFiltro+ 'AND tipo_baixa=1';
 end;

 if chkPeriodoEntradaF.IsChecked then
 begin
   vFiltro := vFiltro+ 'AND a.dataentradaestoque between '+QuotedStr(FormatDateTime('yyyy-mm-dd',edtDeF.Date))
   +' and '+QuotedStr(FormatDateTime('yyyy-mm-dd',edtAteF.Date));
 end;
 dbCtx.AbreSaidaEstoque(dbCtx.vIdSegmento,vFiltro);
end;

procedure TfrmSaidaEstoque.FormShow(Sender: TObject);
begin
  edtAteF.Enabled := chkPeriodoEntradaF.IsChecked;
  edtDeF.Enabled  := chkPeriodoEntradaF.IsChecked;
  lblBuscar.Text     := 'Filtros';
  lblAdd.Text        := 'Adicionar';
  lblEdit.Text       := 'Editar';
  lblDeleta.Text     := 'Deletar';
  layListaMnu.Width  := 150;
  tbPrincipal.TabPosition := TTabPosition.None;
  tbPrincipal.ActiveTab   := tbiLista;
  layListaMnu.Enabled     := dbCtx.vTipoBDConfig=2;
  edtAteF.Enabled := false;
  edtDeF.Enabled  := false;
  dbCtx.AbreSaidaEstoque(dbCtx.vIdSegmento,'');
end;

procedure TfrmSaidaEstoque.SearchEditButton1Click(Sender: TObject);
begin
  frmLocalEstoque := TfrmLocalEstoque.Create(Self);
  try
    frmLocalEstoque.ShowModal;
  finally
    edtLocalEstoqueF.Text := dbCtx.TLocalEstoqueNome.AsString;
    Filtro;
  end;
end;

end.
