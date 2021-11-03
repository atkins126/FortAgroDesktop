unit UAuxAtividadeAbastecimento;

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
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope;

type
  TfrmAuxAtividadeAbastecimento = class(TfrmCadPadrao)
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
    procedure btnSalvarClick(Sender: TObject);
    procedure StringGrid1CellDblClick(const Column: TColumn;
      const Row: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAuxAtividadeAbastecimento: TfrmAuxAtividadeAbastecimento;

implementation

{$R *.fmx}

uses DataContext, UPrincipal;

procedure TfrmAuxAtividadeAbastecimento.btnAddClick(Sender: TObject);
begin
  edtNome.Text := '';
  dbCtx.Tauxatividadeabastecimento.Close;
  dbCtx.Tauxatividadeabastecimento.Open;
  dbCtx.Tauxatividadeabastecimento.Insert;
  inherited;
end;

procedure TfrmAuxAtividadeAbastecimento.btnDeletarClick(Sender: TObject);
begin
  MyShowMessage('Deseja Realmente Deletar esse registro?',true);
   case frmPrincipal.vMsgConfirma of
     1:begin
        dbCtx.Tauxatividadeabastecimento.Edit;
        dbCtx.TauxatividadeabastecimentoStatus.AsInteger := -1;
        dbCtx.TauxatividadeabastecimentoIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
        dbCtx.TauxatividadeabastecimentoDataAlteracao.AsDateTime     := now;
        dbCtx.AlteraFlaSynAWS_ZERO('auxatividadeabastecimento',dbCtx.TauxatividadeabastecimentoID.AsString);
        try
          dbCtx.Tauxatividadeabastecimento.ApplyUpdates(-1);
          MyShowMessage('Registro Excluido com sucesso!',false);
          dbCtx.Tauxatividadeabastecimento.Close;
          dbCtx.Tauxatividadeabastecimento.Open();
        except
         on E : Exception do
          ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
        end;
     end;
   end;
end;

procedure TfrmAuxAtividadeAbastecimento.btnEditarClick(Sender: TObject);
begin
  edtNome.Text           := dbCtx.Tauxatividadeabastecimentonome.AsString;
  dbCtx.Tauxatividadeabastecimento.Edit;
  inherited;
end;

procedure TfrmAuxAtividadeAbastecimento.btnSalvarClick(Sender: TObject);
begin
  if edtNome.Text.Length=0 then
  begin
    MyShowMessage('Informe o Nome!!',false);
    edtNome.SetFocus;
    Exit;
  end;
  dbCtx.Tauxatividadeabastecimentonome.AsString  := edtNome.Text;
  if dbCtx.Tauxatividadeabastecimento.State=dsEdit then
  begin
   dbCtx.TauxatividadeabastecimentoIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
   dbCtx.TauxatividadeabastecimentoDataAlteracao.AsDateTime     := now;
   dbCtx.AlteraFlaSynAWS_ZERO('auxatividadeabastecimento',dbCtx.TauxatividadeabastecimentoID.AsString);
  end;
  if dbCtx.Tauxatividadeabastecimento.State=dsInsert then
  begin
   if not dbCtx.VerificaCadastroExiste('NOME','auxatividadeabastecimento',edtNome.Text) then
   begin
     MyShowMessage('Ja existe uma Atividade com esse nome:'+edtNome.Text,false);
     Exit;
   end;
   dbCtx.TauxatividadeabastecimentoIdUsuario.AsString := dbCtx.vIdUsuarioLogado;
  end;
  try
   dbCtx.Tauxatividadeabastecimento.ApplyUpdates(-1);
   dbCtx.Tauxatividadeabastecimento.Close;
   dbCtx.Tauxatividadeabastecimento.Open();
   MudarAba(tbiLista,sender);
  except
   on E : Exception do
     MyShowMessage('Erro ao Inserir Atividade:'+E.Message,false);
  end;
end;

procedure TfrmAuxAtividadeAbastecimento.edtNomeFiltroChangeTracking(
  Sender: TObject);
begin
 if edtNomeFiltro.Text.Length>0 then
 begin
   dbCtx.Tauxatividadeabastecimento.Filtered := false;
   dbCtx.Tauxatividadeabastecimento.Filter   := 'NOME LIKE '+QuotedStr('%'+edtNomeFiltro.Text+'%');
   dbCtx.Tauxatividadeabastecimento.Filtered := true;
 end
 else
 begin
   dbCtx.Tauxatividadeabastecimento.Filtered := false;
   dbCtx.Tauxatividadeabastecimento.Close;
   dbCtx.Tauxatividadeabastecimento.Open;
 end;
end;

procedure TfrmAuxAtividadeAbastecimento.FormShow(Sender: TObject);
begin
  dbCtx.Tauxatividadeabastecimento.close;
  dbCtx.Tauxatividadeabastecimento.open;
  inherited;
end;

procedure TfrmAuxAtividadeAbastecimento.StringGrid1CellDblClick(
  const Column: TColumn; const Row: Integer);
begin
  Close;
end;

end.
