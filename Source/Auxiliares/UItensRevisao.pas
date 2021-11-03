unit UItensRevisao;

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
  FMX.Menus;

type
  TfrmAuxItemRevisao = class(TfrmCadPadrao)
    BindSourceDB1: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    BindingsList1: TBindingsList;
    Layout1: TLayout;
    edtNome: TEdit;
    Label4: TLabel;
    Layout2: TLayout;
    Rectangle1: TRectangle;
    Layout3: TLayout;
    Layout4: TLayout;
    edtGrupo: TEdit;
    Label5: TLabel;
    edtGrupof: TEdit;
    Label6: TLabel;
    PopupMenu1: TPopupMenu;
    mnuSelecionarTudo: TMenuItem;
    MenuItem1: TMenuItem;
    procedure btnAddClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure edtNomeFiltroChangeTracking(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure StringGrid1CellDblClick(const Column: TColumn;
      const Row: Integer);
    procedure mnuSelecionarTudoClick(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure StringGrid1CellClick(const Column: TColumn; const Row: Integer);
  private
    { Private declarations }
  public
    vIdSelectec:string;
  end;

var
  frmAuxItemRevisao: TfrmAuxItemRevisao;

implementation

{$R *.fmx}

uses UDMRevisao, UPrincipal, DataContext;

procedure TfrmAuxItemRevisao.btnAddClick(Sender: TObject);
begin
  edtNome.Text :='';
  edtGrupo.Text :='';
  dmRevisao.TAuxRevisaoItem.Close;
  dmRevisao.TAuxRevisaoItem.Open;
  dmRevisao.TAuxRevisaoItem.Insert;
  inherited;
end;

procedure TfrmAuxItemRevisao.btnDeletarClick(Sender: TObject);
begin
   MyShowMessage('Deseja Realmente Deletar esse registro?',true);
   case frmPrincipal.vMsgConfirma of
     1:begin
        dmRevisao.TAuxRevisaoItem.Edit;
        dmRevisao.TAuxRevisaoItemStatus.AsInteger := -1;
        dmRevisao.TAuxRevisaoItemIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
        dmRevisao.TAuxRevisaoItemDataAlteracao.AsDateTime     := now;
        dmRevisao.TAuxRevisaoItemsyncaws.AsInteger            :=0;
        try
          dmRevisao.TAuxRevisaoItemsyncaws.AsInteger          :=0;
          dmRevisao.TAuxRevisaoItem.ApplyUpdates(-1);
          dbCtx.FDConPG.Commit;
          MyShowMessage('Registro Excluido com sucesso!',false);
          dmRevisao.TAuxRevisaoItem.Close;
          dmRevisao.TAuxRevisaoItem.Open();
          lblTotalRegistro.Text := intToStr(StringGrid1.RowCount);
        except
         on E : Exception do
          ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
        end;
     end;
   end;
end;

procedure TfrmAuxItemRevisao.btnEditarClick(Sender: TObject);
begin
  dmRevisao.TAuxRevisaoItem.Edit;
  edtGrupo.Text := dmRevisao.TAuxRevisaoItemGrupo.AsString;
  edtNome.Text  := dmRevisao.TAuxRevisaoItemnome.AsString;
  inherited;
end;

procedure TfrmAuxItemRevisao.btnSalvarClick(Sender: TObject);
begin
  if edtGrupo.Text.Length=0 then
  begin
    MyShowMessage('Informe o Grupo!!',false);
    edtGrupo.SetFocus;
    Exit;
  end;

  if edtNome.Text.Length=0 then
  begin
    MyShowMessage('Informe o Nome!!',false);
    edtNome.SetFocus;
    Exit;
  end;

  dmRevisao.TAuxRevisaoItemNome.AsString  := edtNome.Text;
  if dmRevisao.TAuxRevisaoItem.State=dsEdit then
  begin
   dmRevisao.TAuxRevisaoItemIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
   dmRevisao.TAuxRevisaoItemDataAlteracao.AsDateTime     := now;
   dbCtx.AlteraFlaSynAWS_ZERO('AuxRevisaoItens',dmRevisao.TAuxRevisaoItemID.AsString);
  end;
  if dmRevisao.TAuxRevisaoItem.State=dsInsert then
  begin
   if not dbCtx.VerificaCadastroExiste('NOME','AuxRevisaoItens',edtNome.Text) then
   begin
     MyShowMessage('Ja existe um Item com esse nome:'+edtNome.Text,false);
     Exit;
   end;
   dmRevisao.TAuxRevisaoItemIdUsuario.AsString := dbCtx.vIdUsuarioLogado;
  end;
  dmRevisao.TAuxRevisaoItemGrupo.AsString     := edtGrupo.Text;
  try
   TThread.Synchronize(nil,procedure
   begin
    dmRevisao.TAuxRevisaoItemSyncAWS.AsInteger :=0;
    dmRevisao.TAuxRevisaoItem.ApplyUpdates(-1);
    dbCtx.FDConPG.Commit;
    dmRevisao.TAuxRevisaoItem.Close;
    dmRevisao.TAuxRevisaoItem.Open();
   end);
   MudarAba(tbiLista,sender);
  except
   on E : Exception do
     MyShowMessage('Erro ao Inserir Item Revisao:'+E.Message,false);
  end;
end;

procedure TfrmAuxItemRevisao.edtNomeFiltroChangeTracking(Sender: TObject);
var
 filtro:string;
begin
  if edtNomeFiltro.Text.Length>0 then
    filtro:= 'NOME LIKE '+QuotedStr('%'+edtNomeFiltro.Text+'%');
  if edtGrupof.Text.Length>0 then
  begin
    if filtro.Length>0 then
     filtro:= filtro+' AND GRUPO LIKE '+QuotedStr('%'+edtGrupof.Text+'%')
    else
     filtro:= 'GRUPO LIKE '+QuotedStr('%'+edtGrupof.Text+'%');
  end;
  if filtro.Length>0 then
  begin
    dmRevisao.TAuxRevisaoItem.Filtered := false;
    dmRevisao.TAuxRevisaoItem.Filter   := Filtro;
    dmRevisao.TAuxRevisaoItem.Filtered := true;
  end
  else
  begin
     dmRevisao.TAuxRevisaoItem.Filtered := false;
     dmRevisao.TAuxRevisaoItem.Close;
     dmRevisao.TAuxRevisaoItem.Open;
  end;
  lblTotalRegistro.Text := intToStr(StringGrid1.RowCount);
end;

procedure TfrmAuxItemRevisao.FormShow(Sender: TObject);
begin
  lblBuscar.Text     := 'Filtros';
  lblAdd.Text        := 'Adicionar';
  lblEdit.Text       := 'Editar';
  lblDeleta.Text     := 'Deletar';
  layListaMnu.Width  := 150;
  if DMRevisao.TRevisaoItens.State=dsinsert then
   StringGrid1.Columns[0].Width := 70
  else
   StringGrid1.Columns[0].Width := 0;
  tbPrincipal.TabPosition := TTabPosition.None;
  tbPrincipal.ActiveTab   := tbiLista;
  btnAdd.Enabled          := dbCtx.vTipoBDConfig=0;
  btnEditar.Enabled       := dbCtx.vTipoBDConfig=0;
  btnDeletar.Enabled      := dbCtx.vTipoBDConfig=0;
  dmRevisao.TAuxRevisaoItem.Close;
  dmRevisao.TAuxRevisaoItem.Open;
end;

procedure TfrmAuxItemRevisao.MenuItem1Click(Sender: TObject);
var
 I:integer;
begin
 vIdSelectec :='';
 for I := 0 to StringGrid1.RowCount -1 do
 begin
   StringGrid1.Cells[0,i]:='False';
 end;
end;

procedure TfrmAuxItemRevisao.mnuSelecionarTudoClick(Sender: TObject);
var
 I:integer;
begin
 for I := 0 to StringGrid1.RowCount -1 do
 begin
   StringGrid1.Cells[0,i]:='True';
 end;
 vIdSelectec :='1';
end;

procedure TfrmAuxItemRevisao.StringGrid1CellClick(const Column: TColumn;
  const Row: Integer);
begin
  vIdSelectec := dmRevisao.TAuxRevisaoItemid.AsString;
end;

procedure TfrmAuxItemRevisao.StringGrid1CellDblClick(const Column: TColumn;
  const Row: Integer);
begin
 if StringGrid1.ColumnIndex>0 then
 begin
  vIdSelectec := dmRevisao.TAuxRevisaoItemid.AsString;
  Close;
 end;
end;

end.
