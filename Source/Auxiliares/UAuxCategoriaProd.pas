unit UAuxCategoriaProd;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  UCadPadrao, System.Rtti, FMX.Grid.Style, FMX.ActnList, System.Actions,
  FMX.TabControl, FMX.Ani, FMX.ScrollBox, FMX.Grid, FMX.Edit,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, Fmx.Bind.Grid,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components,Data.DB, Data.Bind.Grid, Data.Bind.DBScope,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmAuxCategoriasProd = class(TfrmCadPadrao)
    BindSourceDB1: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    BindingsList1: TBindingsList;
    Label4: TLabel;
    edtNome: TEdit;
    procedure btnAddClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure edtNomeFiltroChangeTracking(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnConfirmaClick(Sender: TObject);
    procedure StringGrid1CellDblClick(const Column: TColumn;
      const Row: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAuxCategoriasProd: TfrmAuxCategoriasProd;

implementation

{$R *.fmx}

uses DataContext, UMsgDlg, UPrincipal, dmReplicacao;

procedure TfrmAuxCategoriasProd.btnAddClick(Sender: TObject);
begin
  edtNome.Text := '';
  dbCtx.TAuxCategorias.Close;
  dbCtx.TAuxCategorias.Open;
  dbCtx.TAuxCategorias.Insert;
  inherited;
end;

procedure TfrmAuxCategoriasProd.btnConfirmaClick(Sender: TObject);
var
 vId:string;
 vInsert :integer;
begin
if edtNome.Text.Length=0 then
  begin
    MyShowMessage('Informe o Nome!!',false);
    edtNome.SetFocus;
    Exit;
  end;
  dbCtx.TAuxCategoriasNome.AsString  := edtNome.Text;
  if dbCtx.TAuxCategorias.State=dsEdit then
  begin
   dbCtx.TAuxCategoriasIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
   dbCtx.TAuxCategoriasDataAlteracao.AsDateTime     := now;
   dbCtx.AlteraFlaSynAWS_ZERO('auxcategoriaitem',dbCtx.TAuxCategoriasID.AsString);
   vId := dbCtx.TAuxCategoriasId.AsString;
   vInsert :=0;
  end;
  if dbCtx.TAuxCategorias.State=dsInsert then
  begin
   vInsert :=1;
   if not dbCtx.VerificaCadastroExiste('NOME','auxcategoriaitem',edtNome.Text) then
   begin
     MyShowMessage('Ja existe uma Sessão com esse nome:'+edtNome.Text,false);
     Exit;
   end;
   dbCtx.TAuxCategoriasIdUsuario.AsString := dbCtx.vIdUsuarioLogado;
  end;
  try
   dbCtx.TAuxCategoriassyncaws.AsInteger := 0;
   dbCtx.TAuxCategorias.ApplyUpdates(-1);
   if vInsert=1 then
    vId := dbCtx.RetornaMaxId('auxcategoriaitem');
//   if dbCtx.vTipoBDConfig=0 then
//    TThread.CreateAnonymousThread(procedure()
//    begin
//      DataModule1.ReplicaCategoria(vId);
//    end).Start;
   dbCtx.TAuxCategorias.Close;
   dbCtx.TAuxCategorias.Open();
   MudarAba(tbiLista,sender);
  except
   on E : Exception do
     MyShowMessage('Erro ao Inserir Categoria:'+E.Message,false);
  end;
end;

procedure TfrmAuxCategoriasProd.btnDeletarClick(Sender: TObject);
begin
   MyShowMessage('Deseja Realmente Deletar esse registro?',true);
   case frmPrincipal.vMsgConfirma of
     1:begin
        dbCtx.TAuxCategorias.Edit;
        dbCtx.TAuxCategoriasStatus.AsInteger  := -1;
        dbCtx.TAuxCategoriassyncaws.AsInteger := 0;
        dbCtx.TAuxCategoriasIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
        dbCtx.TAuxCategoriasDataAlteracao.AsDateTime     := now;
        dbCtx.AlteraFlaSynAWS_ZERO('auxcategoriaitem',dbCtx.TAuxCategoriasID.AsString);
        try
          dbCtx.TAuxCategorias.ApplyUpdates(-1);
//          if dbCtx.vTipoBDConfig=0 then
//           TThread.CreateAnonymousThread(procedure()
//           begin
//              DataModule1.ReplicaCategoria('');
//           end).Start;
          MyShowMessage('Registro Excluido com sucesso!',false);
          dbCtx.TAuxCategorias.Close;
          dbCtx.TAuxCategorias.Open();
        except
         on E : Exception do
          ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
        end;
     end;
   end;
end;

procedure TfrmAuxCategoriasProd.btnEditarClick(Sender: TObject);
begin
  edtNome.Text           := dbCtx.TAuxCategoriasNome.AsString;
  dbCtx.TAuxCategorias.Edit;
  inherited;
end;

procedure TfrmAuxCategoriasProd.edtNomeFiltroChangeTracking(Sender: TObject);
begin
 if edtNomeFiltro.Text.Length>0 then
 begin
   dbCtx.TAuxCategorias.Filtered := false;
   dbCtx.TAuxCategorias.Filter   := 'NOME LIKE '+QuotedStr('%'+edtNomeFiltro.Text+'%');
   dbCtx.TAuxCategorias.Filtered := true;
 end
 else
 begin
   dbCtx.TAuxCategorias.Filtered := false;
   dbCtx.TAuxCategorias.Close;
   dbCtx.TAuxCategorias.Open;
 end;
end;

procedure TfrmAuxCategoriasProd.FormShow(Sender: TObject);
begin
  dbCtx.TAuxCategorias.Close;
  dbCtx.TAuxCategorias.Open;
  inherited;
end;

procedure TfrmAuxCategoriasProd.StringGrid1CellDblClick(const Column: TColumn;
  const Row: Integer);
begin
  Close;

end;

end.
