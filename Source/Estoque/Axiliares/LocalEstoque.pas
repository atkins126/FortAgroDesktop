unit LocalEstoque;

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
  FMX.ListBox;

type
  TfrmLocalEstoque = class(TfrmCadPadrao)
    BindSourceDB1: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    BindingsList1: TBindingsList;
    Label4: TLabel;
    edtNome: TEdit;
    Layout4: TLayout;
    Rectangle2: TRectangle;
    Layout1: TLayout;
    Layout6: TLayout;
    lblSegmento: TLabel;
    cbxSegmento: TComboBox;
    chkCombustivel: TCheckBox;
    procedure edtNomeFiltroChangeTracking(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure StringGrid1CellDblClick(const Column: TColumn;
      const Row: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLocalEstoque: TfrmLocalEstoque;

implementation

{$R *.fmx}

uses DataContext, dmReplicacao, UPrincipal;

procedure TfrmLocalEstoque.btnAddClick(Sender: TObject);
begin
  edtNome.Text :='';
  cbxSegmento.ItemIndex:=-1;
  dbCtx.AbreLocalEstoque('');
  dbCtx.TLocalEstoque.Insert;
  inherited;
end;

procedure TfrmLocalEstoque.btnDeletarClick(Sender: TObject);
begin
   MyShowMessage('Deseja Realmente Deletar esse registro?',true);
   case frmPrincipal.vMsgConfirma of
     1:begin
        dbCtx.TLocalEstoque.Edit;
        dbCtx.TLocalEstoquesyncaws.AsInteger            :=0;
        dbCtx.TLocalEstoqueStatus.AsInteger             := -1;
        dbCtx.TLocalEstoqueIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
        dbCtx.TLocalEstoqueDataAlteracao.AsDateTime     := now;
        dbCtx.AlteraFlaSynAWS_ZERO('localEstoque',dbCtx.TLocalEstoqueID.AsString);
        try
          dbCtx.TLocalEstoquesyncaws.AsInteger          :=0;
          dbCtx.TLocalEstoque.ApplyUpdates(-1);
          MyShowMessage('Registro Excluido com sucesso!',false);
          dbCtx.AbreLocalEstoque('');
//          if dbCtx.vTipoBDConfig=0 then
//           TThread.CreateAnonymousThread(procedure()
//           begin
//             DataModule1.ReplicaLocalEstoque('');
//           end).Start;
          lblTotalRegistro.Text := intToStr(StringGrid1.RowCount);
        except
         on E : Exception do
          ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
        end;
     end;
   end;
end;

procedure TfrmLocalEstoque.btnEditarClick(Sender: TObject);
begin
  edtNome.Text             := dbCtx.TLocalEstoquenome.AsString;
  cbxSegmento.ItemIndex    := dbCtx.TLocalEstoqueidsegmento.AsInteger;
  chkCombustivel.IsChecked := dbCtx.TLocalEstoquecombustivel.AsInteger =1;
  dbCtx.TLocalEstoque.edit;
  inherited;
end;

procedure TfrmLocalEstoque.btnSalvarClick(Sender: TObject);
begin
  if edtNome.Text.Length=0 then
  begin
    MyShowMessage('Informe o Nome!!',false);
    edtNome.SetFocus;
    Exit;
  end;
  if cbxSegmento.ItemIndex=-1 then
  begin
    MyShowMessage('Informe o Segmento!!',false);
    cbxSegmento.SetFocus;
    Exit;
  end;
  dbCtx.TLocalEstoquenome.AsString         := edtNome.Text;
  dbCtx.TLocalEstoqueidsegmento.AsInteger  := cbxSegmento.ItemIndex;
  if dbCtx.TLocalEstoque.State=dsEdit then
  begin
   dbCtx.TLocalEstoqueIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
   dbCtx.TLocalEstoqueDataAlteracao.AsDateTime     := now;
   dbCtx.AlteraFlaSynAWS_ZERO('localEstoque',dbCtx.TLocalEstoqueID.AsString);
  end;
  if dbCtx.TLocalEstoque.State=dsInsert then
  begin
   if not dbCtx.VerificaCadastroExiste('NOME','localestoque',edtNome.Text) then
   begin
     MyShowMessage('Ja existe um Local Estoque com esse nome:'+edtNome.Text,false);
     Exit;
   end;
  end;
  if chkCombustivel.IsChecked then
   dbCtx.TLocalEstoquecombustivel.AsInteger := 1;
  try
   dbCtx.TLocalEstoqueIdUsuario.AsString := dbCtx.vIdUsuarioLogado;
   dbCtx.TLocalEstoquesyncaws.AsInteger :=0;
   dbCtx.TLocalEstoque.ApplyUpdates(-1);
   dbCtx.AbreLocalEstoque('');
   lblTotalRegistro.Text := intToStr(StringGrid1.RowCount);
   MyShowMessage('Local Estoque Cadastrada com sucesso!',false);
   MudarAba(tbiLista,Sender);
//   if dbCtx.vTipoBDConfig=0 then
//   TThread.CreateAnonymousThread(procedure()
//   begin
//     DataModule1.ReplicaLocalEstoque('');
//   end).Start;
  except
   on E : Exception do
     MyShowMessage('Erro ao Inserir Local Estoque:'+E.Message,false);
  end;
end;

procedure TfrmLocalEstoque.edtNomeFiltroChangeTracking(Sender: TObject);
begin
 if edtNomeFiltro.Text.Length>0 then
 begin
   dbCtx.TLocalEstoque.Filtered := false;
   dbCtx.TLocalEstoque.Filter   := 'NOME LIKE '+QuotedStr('%'+edtNomeFiltro.Text+'%');
   dbCtx.TLocalEstoque.Filtered := true;
 end
 else
 begin
   dbCtx.TLocalEstoque.Filtered := false;
   dbCtx.AbreLocalEstoque('');
 end;
 lblTotalRegistro.Text := intToStr(StringGrid1.RowCount);
end;

procedure TfrmLocalEstoque.FormShow(Sender: TObject);
begin
  dbCtx.AbreLocalEstoque('');
  inherited;
end;

procedure TfrmLocalEstoque.StringGrid1CellDblClick(const Column: TColumn;
  const Row: Integer);
begin
  Close;
end;

end.
