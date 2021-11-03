unit UProdutos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  UCadPadrao, System.Rtti, FMX.Grid.Style, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FMX.ActnList,
  System.Actions, FMX.TabControl, FMX.Ani, FMX.ScrollBox, FMX.Grid, FMX.Edit,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts,Winapi.Windows,
  Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, FMX.ListBox, Data.Bind.Components, Data.Bind.Grid,
  Data.Bind.DBScope;

type
  TfrmProdutos = class(TfrmCadPadrao)
    BindSourceDB1: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    BindingsList1: TBindingsList;
    Label4: TLabel;
    edtNome: TEdit;
    Layout1: TLayout;
    Rectangle2: TRectangle;
    Layout2: TLayout;
    Layout3: TLayout;
    Label5: TLabel;
    cbxTipo: TComboBox;
    Label6: TLabel;
    cbxunidadeMedida: TComboBox;
    Label7: TLabel;
    edtEstoqueMinimo: TEdit;
    Layout4: TLayout;
    Rectangle3: TRectangle;
    Layout6: TLayout;
    Layout7: TLayout;
    Label10: TLabel;
    edtCodigoBarras: TEdit;
    Image7: TImage;
    procedure edtEstoqueMinimoKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnConfirmaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure StringGrid1CellDblClick(const Column: TColumn;
      const Row: Integer);
    procedure edtNomeFiltroChangeTracking(Sender: TObject);
  private
    procedure LimpaCampos;
  public
    { Public declarations }
  end;

var
  frmProdutos: TfrmProdutos;

implementation

{$R *.fmx}

uses DataContext, UPrincipal, uFormat;

procedure TfrmProdutos.btnAddClick(Sender: TObject);
begin
  LimpaCampos;
  dbCtx.TProdutos.Close;
  dbCtx.TProdutos.Open;
  dbCtx.TProdutos.Insert;
  inherited;
end;

procedure TfrmProdutos.btnConfirmaClick(Sender: TObject);
begin
  if edtNome.Text.Length=0 then
  begin
    MyShowMessage('Informe o Nome!!',false);
    edtNome.SetFocus;
    Exit;
  end;
  if cbxTipo.ItemIndex=-1 then
  begin
    MyShowMessage('Informe o Tipo!!',false);
    cbxTipo.SetFocus;
    Exit;
  end;
  if cbxunidadeMedida.ItemIndex=-1 then
  begin
    MyShowMessage('Informe a Unidade de Medida!!',false);
    cbxunidadeMedida.SetFocus;
    Exit;
  end;
  dbCtx.TProdutosnome.AsString           := edtNome.Text;
  dbCtx.TProdutostipo.AsString           := cbxTipo.Selected.Text;
  dbCtx.TProdutosunidademedida.AsString  := cbxunidadeMedida.Selected.Text;
  dbCtx.TProdutosestoqueminimo.AsString  := edtEstoqueMinimo.Text;
  dbCtx.TProdutoscodigobarras.AsString   := edtCodigoBarras.Text;
  if dbCtx.TProdutos.State=dsEdit then
  begin
   dbCtx.TProdutosIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
   dbCtx.TProdutosDataAlteracao.AsDateTime     := now;
  end;
  if dbCtx.TProdutos.State=dsInsert then
  begin
   if not dbCtx.VerificaCadastroExiste('NOME','produtos',edtNome.Text) then
   begin
     MyShowMessage('Ja existe uma Produto com esse nome:'+edtNome.Text,false);
     Exit;
   end;
   dbCtx.TProdutosIdUsuario.AsString := dbCtx.vIdUsuarioLogado;
  end;
  try
   dbCtx.TProdutos.ApplyUpdates(-1);
   dbCtx.TProdutos.Close;
   dbCtx.TProdutos.Open();
   lblTotalRegistro.Text := intToStr(StringGrid1.RowCount);
   MyShowMessage('Produto Cadastrada com sucesso!',false);
   MudarAba(tbiLista,Sender);
  except
   on E : Exception do
     MyShowMessage('Erro ao Inserir Produto:'+E.Message,false);
  end;
end;

procedure TfrmProdutos.btnDeletarClick(Sender: TObject);
begin
   MyShowMessage('Deseja Realmente Deletar esse registro?',true);
   case frmPrincipal.vMsgConfirma of
     1:begin
        dbCtx.TProdutos.Edit;
        dbCtx.TProdutosStatus.AsInteger := -1;
        dbCtx.TProdutosIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
        dbCtx.TProdutosDataAlteracao.AsDateTime     := now;
        try
          dbCtx.TProdutos.ApplyUpdates(-1);
          MyShowMessage('Registro Excluido com sucesso!',false);
          dbCtx.TProdutos.Close;
          dbCtx.TProdutos.Open();
          lblTotalRegistro.Text := intToStr(StringGrid1.RowCount);
        except
         on E : Exception do
          ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
        end;
     end;
   end;
end;

procedure TfrmProdutos.btnEditarClick(Sender: TObject);
begin
  dbCtx.TProdutos.Edit;
  edtNome.Text                   := dbCtx.TProdutosnome.AsString;
  edtEstoqueMinimo.Text          := dbCtx.TProdutosestoqueminimo.AsString;
  edtCodigoBarras.Text           := dbCtx.TProdutoscodigobarras.AsString;
  cbxTipo.ItemIndex              := cbxTipo.Items.IndexOf(dbCtx.TProdutostipo.AsString);
  cbxunidadeMedida.ItemIndex     := cbxunidadeMedida.Items.IndexOf(dbCtx.TProdutosunidademedida.AsString);
  inherited;
end;

procedure TfrmProdutos.edtEstoqueMinimoKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
 if ((keyChar in ['0'..'9',','] = false) and (word(key) <> vk_back)) then
 begin
   KeyChar := #0;
 end;
end;

procedure TfrmProdutos.edtNomeFiltroChangeTracking(Sender: TObject);
begin
 if edtNomeFiltro.Text.Length>0 then
 begin
   dbCtx.TProdutos.Filtered := false;
   dbCtx.TProdutos.Filter   := 'NOME LIKE '+QuotedStr('%'+edtNomeFiltro.Text+'%');
   dbCtx.TProdutos.Filtered := true;
 end
 else
 begin
   dbCtx.TProdutos.Filtered := false;
   dbCtx.TProdutos.Close;
   dbCtx.TProdutos.Open;
 end;
 lblTotalRegistro.Text := intToStr(StringGrid1.RowCount);
end;

procedure TfrmProdutos.FormShow(Sender: TObject);
begin
  dbCtx.TProdutos.Close;
  dbCtx.TProdutos.Open;
  inherited;
end;

procedure TfrmProdutos.LimpaCampos;
begin
  edtNome.Text                :='';
  cbxTipo.ItemIndex           :=-1;
  cbxunidadeMedida.ItemIndex  :=-1;
  edtEstoqueMinimo.Text       :='';
end;

procedure TfrmProdutos.StringGrid1CellDblClick(const Column: TColumn;
  const Row: Integer);
begin
 Close;
end;

end.
