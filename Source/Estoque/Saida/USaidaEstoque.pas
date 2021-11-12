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
  FMX.DateTimeCtrls,Winapi.Windows;

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
    layProduto: TLayout;
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
    edtObservacao: TEdit;
    EditButton4: TEditButton;
    Label14: TLabel;
    cbxTipoSaidaF: TComboBox;
    layReceituario: TLayout;
    Label15: TLabel;
    Label22: TLabel;
    edtReceituario: TEdit;
    EditButton5: TEditButton;
    gridIntenRec: TStringGrid;
    Label16: TLabel;
    Label23: TLabel;
    edtSaldoAtual: TEdit;
    tbiDevolucao: TTabItem;
    Rectangle4: TRectangle;
    ToolBar4: TToolBar;
    Image7: TImage;
    Label24: TLabel;
    Rectangle5: TRectangle;
    Layout1: TLayout;
    Label25: TLabel;
    edtNumRecDevolucao: TEdit;
    btnBuscaBaixaReceituario: TEditButton;
    gridDevolucao: TStringGrid;
    edtNumReceituario: TEdit;
    Layout15: TLayout;
    Rectangle6: TRectangle;
    Label26: TLabel;
    Image8: TImage;
    btnConfirmaDevolucao: TRectangle;
    Label27: TLabel;
    Image9: TImage;
    btnDevolucaoQuimico: TRectangle;
    Image10: TImage;
    Label28: TLabel;
    StringColumn1: TStringColumn;
    StringColumn2: TStringColumn;
    StringColumn3: TStringColumn;
    StringColumn4: TStringColumn;
    StringColumn5: TStringColumn;
    StringColumn7: TStringColumn;
    StringColumn8: TStringColumn;
    StringColumn9: TStringColumn;
    FloatColumn1: TFloatColumn;
    StringColumn6: TStringColumn;
    FloatColumn2: TFloatColumn;
    FloatColumn3: TFloatColumn;
    StringColumn10: TStringColumn;
    StringColumn11: TStringColumn;
    procedure EditButton1Click(Sender: TObject);
    procedure EditButton2Click(Sender: TObject);
    procedure EditButton3Click(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure btnBuscaCategoriaFClick(Sender: TObject);
    procedure SearchEditButton1Click(Sender: TObject);
    procedure chkPeriodoEntradaFChange(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure EditButton4Click(Sender: TObject);
    procedure edtqtdKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure cbxTipoSaidaChange(Sender: TObject);
    procedure EditButton5Click(Sender: TObject);
    procedure btnBuscaBaixaReceituarioClick(Sender: TObject);
    procedure btnDevolucaoQuimicoClick(Sender: TObject);
    procedure btnConfirmaDevolucaoClick(Sender: TObject);
    procedure btnBuscarListaClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
  private
    procedure Filtro;
  public
    vIdReceituario,vIdProdutoSelect,vIdCentroCusto,vIdLocalEstoque,vIDResponsavel:string;
    procedure LimpaCampos;
  end;

var
  frmSaidaEstoque: TfrmSaidaEstoque;

implementation

{$R *.fmx}

uses UProdutos, DataContext, UCentrodeCusto, LocalEstoque, UPrincipal,
  UUsuarios, UReceituario;

procedure TfrmSaidaEstoque.btnAddClick(Sender: TObject);
begin
  LimpaCampos;
  dbCtx.TEstoqueSaida.Close;
  dbCtx.TEstoqueSaida.Open;
  dbCtx.TEstoqueSaida.Insert;
  cbxTipoSaida.ItemIndex :=-1;
  inherited;
end;

procedure TfrmSaidaEstoque.LimpaCampos;
begin
 gridIntenRec.RowCount      := 0;
 edtDataSaida.Date          := date;
 edtProduto.Text            := '';
 cbxUnidadeMedida.ItemIndex := -1;
 edtqtd.Text                := '0';
 edtCentroCusto.Text        := '';
 edtLocalEstoque.Text       := '';
 edtResponsavel.Text        := '';
 edtObservacao.Text         := '';
 edtSaldoAtual.Text         := '';
end;

procedure TfrmSaidaEstoque.btnConfirmaDevolucaoClick(Sender: TObject);
var
 I:integer;
 vIdBaixa,vIdReceituario,
 qtdRetirada,QtdeDevolvida:string;
begin
 edtNumRecDevolucao.SetFocus;
 try
   for I := 0 to gridDevolucao.RowCount-1 do
   begin
     vIdBaixa         := gridDevolucao.Cells[0,I];
     vIdReceituario   := gridDevolucao.Cells[1,I];
     vIdProdutoSelect := gridDevolucao.Cells[8,I];
     qtdRetirada      := gridDevolucao.Cells[3,I];
     QtdeDevolvida    := gridDevolucao.Cells[7,I];
     if (QtdeDevolvida<>'0') and (QtdeDevolvida.Length>0) then
     begin
      dbCtx.AtualizaBaixaEstoque(vIdBaixa,StringReplace(QtdeDevolvida,',','.',[rfReplaceAll]));
      dbCtx.TTableDevolucao.Close;
      dbCtx.TTableDevolucao.Open;
      dbCtx.TTableDevolucao.Insert;
      dbCtx.TTableDevolucaoidusuario.AsString     := dbCtx.vIdUsuarioLogado;
      dbCtx.TTableDevolucaoidbaixa.AsString       := vIdBaixa;
      dbCtx.TTableDevolucaoidreceituario.AsString := vIdReceituario;
      dbCtx.TTableDevolucaoidproduto.AsString     := vIdProdutoSelect;
      dbCtx.TTableDevolucaoqtdretirada.AsString   := qtdRetirada;
      dbCtx.TTableDevolucaoqtddevolvida.AsString  := QtdeDevolvida;
      try
       dbCtx.TTableDevolucao.ApplyUpdates(-1);
      except
      on E: Exception do
         ShowMessage('Erro ao salvar Registro:'+E.Message);
      end;
     end;
   end;
   MyShowMessage('Devolução realizada com sucesso!',false);
   MudarAba(tbiLista,sender);
 except
 on E: Exception do
    ShowMessage('Erro ao salvar Registro:'+E.Message);
 end;
end;

procedure TfrmSaidaEstoque.btnBuscaBaixaReceituarioClick(Sender: TObject);
var
 I:integer;
begin
 if edtNumRecDevolucao.Text.Length=0 then
 begin
   MyShowMessage('Informe o numero do Receituário',false);
   Exit;
 end;
 dbCtx.AbreDevolucaoQuimico(edtNumRecDevolucao.Text);
 if dbCtx.TDevolucaoQuimico.IsEmpty then
 begin
   MyShowMessage('Nenhuma Retirada encotrada!',false);
   Exit;
 end
 else
 begin
  I :=0;
  gridDevolucao.RowCount   := dbCtx.TDevolucaoQuimico.RecordCount;
  while not dbCtx.TDevolucaoQuimico.Eof do
  begin
    gridDevolucao.Cells[0,I] := dbCtx.TDevolucaoQuimicoidbaixa.AsString;
    gridDevolucao.Cells[1,I] := dbCtx.TDevolucaoQuimicoidreceiturario.AsString;
    gridDevolucao.Cells[2,I] := dbCtx.TDevolucaoQuimicoproduto.AsString;
    gridDevolucao.Cells[3,I] := dbCtx.TDevolucaoQuimicototalreceitado.AsString;
    gridDevolucao.Cells[4,I] := dbCtx.TDevolucaoQuimicoqtderetirada.AsString;
    gridDevolucao.Cells[5,I] := dbCtx.TDevolucaoQuimicoqtdutilizada.AsString;
    gridDevolucao.Cells[6,I] := dbCtx.TDevolucaoQuimicosaldo.AsString;
    gridDevolucao.Cells[7,I] := '0';
    gridDevolucao.Cells[8,I] := dbCtx.TDevolucaoQuimicoidproduto.AsString;
    INC(I);
    dbCtx.TDevolucaoQuimico.Next;
  end;
 end;
end;

procedure TfrmSaidaEstoque.btnBuscaCategoriaFClick(Sender: TObject);
begin
  frmCentroCusto := TfrmCentroCusto.Create(Self);
  try
    frmCentroCusto.ShowModal;
  finally
    edtCentroCustoF.Text := dbCtx.TCentroCustonome.AsString;
  end;
end;

procedure TfrmSaidaEstoque.btnBuscarListaClick(Sender: TObject);
begin
 Filtro;
end;

procedure TfrmSaidaEstoque.btnDeletarClick(Sender: TObject);
var
 vidProduto:string;
begin
   vidProduto:=  dbCtx.TEstoqueSaidaidproduto.AsString;
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
          dbCtx.AtaulizaSaldoAtualCustoMedio(vidProduto);
          dbCtx.TEstoqueSaida.Close;
          dbCtx.TEstoqueSaida.Open();
        except
         on E : Exception do
          ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
        end;
     end;
   end;
end;

procedure TfrmSaidaEstoque.btnDevolucaoQuimicoClick(Sender: TObject);
begin
 edtNumRecDevolucao.Text :='';
 gridDevolucao.RowCount  := 0;
 MudarAba(tbiDevolucao,sender);
end;

procedure TfrmSaidaEstoque.btnEditarClick(Sender: TObject);
begin
  dbCtx.TEstoqueSaida.Edit;
  if dbCtx.TEstoqueSaidatipo_baixa.AsInteger=2 then
   cbxTipoSaida.ItemIndex :=0
  else
   cbxTipoSaida.ItemIndex := dbCtx.TEstoqueSaidatipo_baixa.AsInteger;


  vIdProdutoSelect                                   := StringGrid1.Cells[0,StringGrid1.Row];
  edtProduto.Text                                    := dbCtx.TEstoqueSaidaproduto.AsString;
  edtDataSaida.Date                                  := dbCtx.TEstoqueSaidadatasaidaestoque.AsDateTime;
  edtqtd.Text                                        := dbCtx.TEstoqueSaidaqtditens.AsString;
  cbxUnidadeMedida.ItemIndex                         := cbxUnidadeMedida.Items.IndexOf(dbCtx.TEstoqueSaidaunidademedida.AsString);
  vIdLocalEstoque                                    := dbCtx.TEstoqueSaidaidlocalestoque.AsString;
  edtLocalEstoque.Text                               := dbCtx.TEstoqueSaidalocalestoque.AsString;
  vIdCentroCusto                                     := dbCtx.TEstoqueSaidaidcentrocusto.AsString;
  edtCentroCusto.Text                                := dbCtx.TEstoqueSaidacentrocusto.AsString;
  vIDResponsavel                                     := dbCtx.TEstoqueSaidaidresponsavel.AsString;
  edtResponsavel.Text                                := dbCtx.TEstoqueSaidaresponsavel.AsString;
  inherited;
end;

procedure TfrmSaidaEstoque.btnSalvarClick(Sender: TObject);
var
 I:integer;
 vUnidadeMedida:string;
 vQtdBaixada:Double;
begin
  if cbxTipoSaida.ItemIndex=-1 then
  begin
    MyShowMessage('Informe a tipo de baixa!',false);
    Exit;
  end;

 if cbxTipoSaida.ItemIndex<> 2 then
 begin
    if edtProduto.Text.Length=0 then
    begin
      MyShowMessage('Informe o produto!',false);
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
     if cbxUnidadeMedida.ItemIndex=-1 then
     begin
       MyShowMessage('Informe a unidade de medida!',false);
       Exit;
     end;
   end;
   if dbCtx.TEstoqueSaida.State=dsEdit then
   begin
     dbCtx.TEstoqueSaidaidusuarioalteracao.AsString := dbCtx.vIdUsuarioLogado;
     dbCtx.TEstoqueSaidadataalteracao.AsDateTime    := now;
     dbCtx.AlteraFlaSynAWS_ZERO('estoquesaida',dbCtx.TEstoqueSaidaID.AsString);
   end;
   dbCtx.TEstoqueSaidaidproduto.AsString                 := vIdProdutoSelect;
   dbCtx.TEstoqueSaidadatasaidaestoque.AsDateTime        := edtDataSaida.Date;
   dbCtx.TEstoqueSaidaqtditens.AsFloat                   := strToFloat(edtqtd.Text);
   dbCtx.TEstoqueSaidaunidademedida.AsString             := cbxUnidadeMedida.Selected.Text;
   dbCtx.TEstoqueSaidaidlocalestoque.AsString            := vIdLocalEstoque;
   dbCtx.TEstoqueSaidaidcentrocusto.AsString             := vIdCentroCusto;
   dbCtx.TEstoqueSaidaidresponsavel.AsString             := vIDResponsavel;
   dbCtx.TEstoqueSaidatipo_baixa.AsInteger               := cbxTipoSaida.ItemIndex;
   dbCtx.TEstoqueSaidavalorsaida.AsFloat                 := dbCtx.RetornaCustoMedioProduto(vIdProdutoSelect);
   try
    dbCtx.TEstoqueSaida.ApplyUpdates(-1);
    dbCtx.AtaulizaSaldoAtualCustoMedio(vIdProdutoSelect);
    MyShowMessage('Baixa realizada com sucesso!',false);
    Filtro;
    inherited;
   except
   on E: Exception do
      ShowMessage('Erro ao salvar Registro:'+E.Message);
   end;
 end//se for receituario
 else
 begin
   if edtResponsavel.Text.Length=0 then
   begin
     MyShowMessage('Informe o Responsavel!',false);
     Exit;
   end;
   try
     for I := 0 to gridIntenRec.RowCount-1 do
     begin
       vIdProdutoSelect     := gridIntenRec.Cells[3,I];
       vUnidadeMedida := gridIntenRec.Cells[4,I];
       vQtdBaixada    := StrToFloat(gridIntenRec.Cells[2,I]);
       if vQtdBaixada>0 then
       begin
        dbCtx.TEstoqueSaida.Close;
        dbCtx.TEstoqueSaida.Open;
        dbCtx.TEstoqueSaida.Insert;
        dbCtx.TEstoqueSaidaidproduto.AsString                 := vIdProdutoSelect;
        dbCtx.TEstoqueSaidadatasaidaestoque.AsDateTime        := edtDataSaida.Date;
        dbCtx.TEstoqueSaidaqtditens.AsFloat                   := vQtdBaixada;
        dbCtx.TEstoqueSaidaunidademedida.AsString             := vUnidadeMedida;
        dbCtx.TEstoqueSaidaidlocalestoque.AsString            := vIdLocalEstoque;
        dbCtx.TEstoqueSaidaidcentrocusto.AsString             := vIdCentroCusto;
        dbCtx.TEstoqueSaidaidresponsavel.AsString             := vIDResponsavel;
        dbCtx.TEstoqueSaidatipo_baixa.AsInteger               := cbxTipoSaida.ItemIndex;
        dbCtx.TEstoqueSaidaidreceiturario.AsString            := vIdReceituario;
        dbCtx.TEstoqueSaidavalorsaida.AsFloat                 := dbCtx.RetornaCustoMedioProduto(vIdProdutoSelect);
        try
         dbCtx.TEstoqueSaida.ApplyUpdates(-1);
         dbCtx.AtaulizaSaldoAtualCustoMedio(vIdProdutoSelect);
        except
        on E: Exception do
           ShowMessage('Erro ao salvar Registro:'+E.Message);
        end;
       end;
     end;
     MyShowMessage('Baixa realizada com sucesso!',false);
     Filtro;
     inherited;
   except
   on E: Exception do
      ShowMessage('Erro ao salvar Registro:'+E.Message);
   end;
 end;
end;

procedure TfrmSaidaEstoque.cbxTipoSaidaChange(Sender: TObject);
begin
 if cbxTipoSaida.ItemIndex=2 then
 begin
  layReceituario.Visible  := true;
  layProduto.Visible      := false;
  layProduto.Visible      := false;
 end
 else
 begin
  layProduto.Visible      := true;
  layProduto.Visible      := true;
 end;
end;

procedure TfrmSaidaEstoque.chkPeriodoEntradaFChange(Sender: TObject);
begin
 edtAteF.Enabled := chkPeriodoEntradaF.IsChecked;
 edtDeF.Enabled  := chkPeriodoEntradaF.IsChecked;
end;

procedure TfrmSaidaEstoque.EditButton1Click(Sender: TObject);
begin
  frmCadProdutos := TfrmCadProdutos.Create(Self);
  try
    frmCadProdutos.ShowModal;
  finally
    vIdProdutoSelect         := dbCtx.TProdutosid.AsString;
    edtSaldoAtual.Text       := dbCtx.AtaulizaSaldoAtualCustoMedio(vIdProdutoSelect);
    edtProduto.Text          := dbCtx.TProdutosnome.AsString;
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
    vIDResponsavel        := frmUsuarios.vIdUsuario;
    edtResponsavel.Text   := frmUsuarios.vNomeUsuario;
    frmUsuarios.Free;
  end;
end;

procedure TfrmSaidaEstoque.EditButton5Click(Sender: TObject);
var
 I:integer;
 vAreaTotal :Double;
begin
  frmReceituario := TfrmReceituario.Create(Self);
  try
    frmReceituario.ShowModal;
  finally
    vIdReceituario         := dbCtx.TReceituarioid.AsString;
    edtReceituario.Text    := dbCtx.TReceituarionome.AsString;
    dbCtx.TDetReceituario.First;
    vAreaTotal             := frmReceituario.vAreaTotal;
    I :=0;
    gridIntenRec.RowCount   := dbCtx.TDetReceituario.RecordCount;
    while not dbCtx.TDetReceituario.Eof do
    begin
      gridIntenRec.Cells[0,I] := dbCtx.TDetReceituarioproduto.AsString;
      gridIntenRec.Cells[1,I] := FormatFloat('####,##0.00',(dbCtx.TDetReceituarioqtdporhe.AsFloat * vAreaTotal));
      gridIntenRec.Cells[2,I] := FormatFloat('####,##0.00',(dbCtx.TDetReceituarioqtdporhe.AsFloat * vAreaTotal));
      gridIntenRec.Cells[3,I] := dbCtx.TDetReceituarioidproduto.AsString;
      gridIntenRec.Cells[4,I] := dbCtx.TDetReceituariounidademedida.AsString;
      INC(I);
      dbCtx.TDetReceituario.Next;
    end;
  end;
end;

procedure TfrmSaidaEstoque.edtqtdKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
 if((keyChar in ['0'..'9',','] = false) and (word(key) <> vk_back)) then
 begin
   KeyChar := #0;
 end;
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
 if edtNumReceituario.Text.Length>0 then
   vFiltro := vFiltro+ 'AND a.idreceiturario ='+edtNumReceituario.Text;
 if cbxTipoSaidaF.ItemIndex>0 then
 begin
   if cbxTipoSaidaF.ItemIndex=1 then
    vFiltro := vFiltro+ 'AND tipo_baixa=0';
   if cbxTipoSaidaF.ItemIndex=2 then
    vFiltro := vFiltro+ 'AND tipo_baixa=1';
 end;

 if chkPeriodoEntradaF.IsChecked then
 begin
   vFiltro := vFiltro+ 'AND a.datasaidaestoque between '+QuotedStr(FormatDateTime('yyyy-mm-dd',edtDeF.Date))
   +' and '+QuotedStr(FormatDateTime('yyyy-mm-dd',edtAteF.Date));
 end;
 dbCtx.AbreSaidaEstoque(dbCtx.vIdSegmento,vFiltro);
 lblTotalRegistro.Text := intToStr(dbCtx.TEstoqueSaida.RecordCount);
end;

procedure TfrmSaidaEstoque.FormKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if(key=13) and (tbPrincipal.TabIndex=0) then
   Filtro;
end;

procedure TfrmSaidaEstoque.FormShow(Sender: TObject);
begin
  chkPeriodoEntradaF.IsChecked := true;
  layReceituario.Visible  := false;
  edtAteF.Enabled         := chkPeriodoEntradaF.IsChecked;
  edtDeF.Enabled          := chkPeriodoEntradaF.IsChecked;
  lblBuscar.Text          := 'Filtros';
  lblAdd.Text             := 'Adicionar';
  lblEdit.Text            := 'Editar';
  lblDeleta.Text          := 'Deletar';
  layListaMnu.Width       := 150;
  tbPrincipal.TabPosition := TTabPosition.None;
  tbPrincipal.ActiveTab   := tbiLista;
  layListaMnu.Enabled     := true;
  edtAteF.Enabled         := true;
  edtDeF.Enabled          := true;
  edtDeF.Date             := date-7;
  edtAteF.Date            := date;
  Filtro;
end;

procedure TfrmSaidaEstoque.SearchEditButton1Click(Sender: TObject);
begin
  frmLocalEstoque := TfrmLocalEstoque.Create(Self);
  try
    frmLocalEstoque.ShowModal;
  finally
    edtLocalEstoqueF.Text := dbCtx.TLocalEstoqueNome.AsString;
  end;
end;

end.

