unit UMovEntreLocalEstoque;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  UCadPadrao, System.Rtti, FMX.Grid.Style, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FMX.ActnList,
  System.Actions, FMX.TabControl, FMX.Ani, FMX.ScrollBox, FMX.Grid, FMX.Edit,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, FMX.DateTimeCtrls,
  FMX.ListBox;

type
  TfrmMovLocalEstoque = class(TfrmCadPadrao)
    BindSourceDB1: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    BindingsList1: TBindingsList;
    GroupBox1: TGroupBox;
    Label22: TLabel;
    Label23: TLabel;
    edtDataInicio: TDateEdit;
    edtDataFim: TDateEdit;
    Layout8: TLayout;
    Layout9: TLayout;
    Label8: TLabel;
    Layout10: TLayout;
    Label13: TLabel;
    Layout11: TLayout;
    ComboBox2: TComboBox;
    Layout12: TLayout;
    edtLocalOrigem: TEdit;
    EditButton2: TEditButton;
    Layout1: TLayout;
    Rectangle1: TRectangle;
    Layout2: TLayout;
    Layout3: TLayout;
    Layout4: TLayout;
    Label4: TLabel;
    Layout6: TLayout;
    Label5: TLabel;
    Layout7: TLayout;
    ComboBox1: TComboBox;
    Layout13: TLayout;
    edtLocalDestino: TEdit;
    EditButton1: TEditButton;
    Layout46000000: TLayout;
    Rectangle16000000: TRectangle;
    Layout490000000000000: TLayout;
    Layout47000000000: TLayout;
    Label31000000000: TLabel;
    layCapDadosPasto: TLayout;
    lbll: TLabel;
    Label7: TLabel;
    Layout48000000000: TLayout;
    cbxCurralPastoGrupo: TComboBox;
    LayValueDadosPasto: TLayout;
    edtProduto: TEdit;
    btnBuscaProduto: TEditButton;
    edtqtd: TEdit;
    Layout14: TLayout;
    Rectangle2: TRectangle;
    Layout15: TLayout;
    Rectangle3: TRectangle;
    Layout16: TLayout;
    Layout17: TLayout;
    Label6: TLabel;
    Layout18: TLayout;
    Label9: TLabel;
    Layout19: TLayout;
    ComboBox3: TComboBox;
    Layout20: TLayout;
    edtDataMov: TDateEdit;
    Label11: TLabel;
    edtHoraMov: TTimeEdit;
    procedure FormShow(Sender: TObject);
    procedure edtDataInicioChange(Sender: TObject);
    procedure edtDataFimChange(Sender: TObject);
    procedure edtNomeFiltroChangeTracking(Sender: TObject);
    procedure EditButton2Click(Sender: TObject);
    procedure EditButton1Click(Sender: TObject);
    procedure btnBuscaProdutoClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure edtqtdKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
  private
    vIdLocalOrigem,vIdLocalDestino,vIdProduto:string;
    procedure Filtro;
    procedure LimpaCampos;
  public
    { Public declarations }
  end;

var
  frmMovLocalEstoque: TfrmMovLocalEstoque;

implementation

{$R *.fmx}

uses DataContext, LocalEstoque, UAuxCategoriaProd, UProdutos, UPrincipal;

procedure TfrmMovLocalEstoque.btnAddClick(Sender: TObject);
begin
  LimpaCampos;
  dbCtx.TMovLocalEstoque.Close;
  dbCtx.TMovLocalEstoque.Open;
  dbCtx.TMovLocalEstoque.Insert;
  inherited;
end;

procedure TfrmMovLocalEstoque.btnBuscaProdutoClick(Sender: TObject);
begin
 frmCadProdutos := TfrmCadProdutos.Create(Self);
  try
    frmCadProdutos.ShowModal;
  finally
    vIdProduto         := dbCtx.TProdutosid.AsString;
    edtProduto.Text    := dbCtx.TProdutosnome.AsString;
  end;
end;

procedure TfrmMovLocalEstoque.btnDeletarClick(Sender: TObject);
begin
  MyShowMessage('Deseja Realmente Deletar esse registro?',true);
   case frmPrincipal.vMsgConfirma of
     1:begin
        dbCtx.TMovLocalEstoque.Edit;
        dbCtx.TMovLocalEstoqueStatus.AsInteger := -1;
        dbCtx.TMovLocalEstoqueIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
        dbCtx.TMovLocalEstoqueDataAlteracao.AsDateTime     := now;
        dbCtx.AlteraFlaSynAWS_ZERO('tranferencialocalestoque',dbCtx.TProdutosID.AsString);
        try
          dbCtx.TMovLocalEstoquesyncaws.AsInteger            :=0;
          dbCtx.TMovLocalEstoque.ApplyUpdates(-1);
          MyShowMessage('Registro Excluido com sucesso!',false);
          Filtro;
        except
         on E : Exception do
          ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
        end;
     end;
   end;

end;

procedure TfrmMovLocalEstoque.btnEditarClick(Sender: TObject);
begin
  dbCtx.TEstoqueEntrada.Edit;
  vIdProduto                                         := dbCtx.TMovLocalEstoqueidproduto.AsString;
  edtProduto.Text                                    := dbCtx.TMovLocalEstoqueidproduto.AsString;
  vIdLocalOrigem                                     := dbCtx.TMovLocalEstoqueidlocalestoqueorigem.AsString;
  vIdLocalDestino                                    := dbCtx.TMovLocalEstoqueidlocalestoquedetino.AsString;
  edtDataMov.Date                                    := dbCtx.TMovLocalEstoquedatamov.AsDateTime;
  edtHoraMov.Date                                    := dbCtx.TMovLocalEstoquehora.AsDateTime;
  edtqtd.Text                                        := dbCtx.TEstoqueEntradaqtditens.AsString;
  inherited;
end;

procedure TfrmMovLocalEstoque.btnSalvarClick(Sender: TObject);
begin
 if edtLocalOrigem.Text.Length=0 then
 begin
   MyShowMessage('Informe o Local de Origem!',false);
   edtLocalOrigem.SetFocus;
   Exit;
 end;
 if edtLocalDestino.Text.Length=0 then
 begin
   MyShowMessage('Informe o Local de Destino!',false);
   edtLocalDestino.SetFocus;
   Exit;
 end;
 if edtProduto.Text.Length=0 then
 begin
   MyShowMessage('Informe o Prtoduto!',false);
   edtProduto.SetFocus;
   Exit;
 end;
 if(edtqtd.Text.Length=0)or(edtqtd.Text='0') then
 begin
   MyShowMessage('Informe a Quantidade!',false);
   edtqtd.SetFocus;
   Exit;
 end;
 if dbCtx.TMovLocalEstoque.State=dsInsert then
 begin
   dbCtx.TMovLocalEstoqueidusuario.AsString := dbCtx.vIdUsuarioLogado;
 end;
 if dbCtx.TMovLocalEstoque.State=dsEdit then
 begin
   dbCtx.TMovLocalEstoqueidusuarioalteracao.AsString := dbCtx.vIdUsuarioLogado;
   dbCtx.TMovLocalEstoquedataalteracao.AsDateTime    := now;
   dbCtx.AlteraFlaSynAWS_ZERO('tranferencialocalestoque',dbCtx.TEstoqueEntradaID.AsString);
 end;
 dbCtx.TMovLocalEstoqueidproduto.AsString             := vIdProduto;
 dbCtx.TMovLocalEstoqueidlocalestoqueorigem.AsString  := vIdLocalOrigem;
 dbCtx.TMovLocalEstoqueidlocalestoquedetino.AsString  := vIdLocalDestino;
 dbCtx.TMovLocalEstoqueqtde.AsString                  := edtqtd.Text;
 dbCtx.TMovLocalEstoquedatamov.AsDateTime             := edtDataMov.DateTime;
 dbCtx.TMovLocalEstoquehora.AsDateTime                := edtHoraMov.DateTime;
 try
  dbCtx.TMovLocalEstoque.ApplyUpdates(-1);
  MyShowMessage('Movimentação realizada com sucesso!',false);
  dbCtx.MovLocalEstoque('');
  inherited;
 except
 on E: Exception do
    ShowMessage('Erro ao salvar Registro:'+E.Message);
 end;
end;

procedure TfrmMovLocalEstoque.EditButton1Click(Sender: TObject);
begin
 frmLocalEstoque := TfrmLocalEstoque.Create(Self);
  try
    frmLocalEstoque.ShowModal;
  finally
    vIdLocalDestino        := dbCtx.TLocalEstoqueid.AsString;
    edtLocalDestino.Text   := dbCtx.TLocalEstoquenome.AsString;
  end;
end;

procedure TfrmMovLocalEstoque.EditButton2Click(Sender: TObject);
begin
  frmLocalEstoque := TfrmLocalEstoque.Create(Self);
  try
    frmLocalEstoque.ShowModal;
  finally
    vIdLocalOrigem        := dbCtx.TLocalEstoqueid.AsString;
    edtLocalOrigem.Text  := dbCtx.TLocalEstoquenome.AsString;
  end;
end;

procedure TfrmMovLocalEstoque.edtDataFimChange(Sender: TObject);
begin
 Filtro
end;

procedure TfrmMovLocalEstoque.edtDataInicioChange(Sender: TObject);
begin
  Filtro;
end;

procedure TfrmMovLocalEstoque.edtNomeFiltroChangeTracking(Sender: TObject);
begin
 Filtro;
end;

procedure TfrmMovLocalEstoque.edtqtdKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
 if (keyChar in ['0'..'9',','] = false) then
 begin
   KeyChar := #0;
 end;
end;

procedure TfrmMovLocalEstoque.Filtro;
var
 vFiltro:string;
 vDataDe,vDataAte:string;
begin
 vFiltro:='';
 vDataDe  := FormatDateTime('yyyy-mm-dd',edtDataInicio.Date).QuotedString;
 vDataAte := FormatDateTime('yyyy-mm-dd',edtDataFim.Date).QuotedString;
 vFiltro  := vFiltro+' and cast(a.datamov as date) between '+vDataDe+' and '+vDataAte;
 if edtNomeFiltro.Text.Length>0 then
  vFiltro:=vFiltro+' and c.nome like '+QuotedStr('%'+edtNomeFiltro.Text+'%');
 dbCtx.MovLocalEstoque(vFiltro);
 lblTotalRegistro.Text := intToStr(StringGrid1.RowCount);
end;

procedure TfrmMovLocalEstoque.FormShow(Sender: TObject);
begin
  lblBuscar.Text     := 'Filtros';
  lblAdd.Text        := 'Adicionar';
  lblEdit.Text       := 'Editar';
  lblDeleta.Text     := 'Deletar';
  layListaMnu.Width  := 150;
  tbPrincipal.TabPosition := TTabPosition.None;
  tbPrincipal.ActiveTab   := tbiLista;
  layListaMnu.Enabled     := dbCtx.vTipoBDConfig=2;
  edtDataInicio.Date      := Date-30;
  edtDataFim.Date         := Date;
  Filtro;
end;

procedure TfrmMovLocalEstoque.LimpaCampos;
begin
 edtDataMov.Date            := date;
 edtProduto.Text            := '';
 edtqtd.Text                :='0';
end;

end.
