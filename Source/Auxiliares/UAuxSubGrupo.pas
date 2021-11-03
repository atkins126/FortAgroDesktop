unit UAuxSubGrupo;

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
  TfrmAuxSubgrupo = class(TfrmCadPadrao)
    BindSourceDB1: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    BindingsList1: TBindingsList;
    edtNome: TEdit;
    Label4: TLabel;
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
  frmAuxSubgrupo: TfrmAuxSubgrupo;

implementation

{$R *.fmx}

uses DataContext, UPrincipal, dmReplicacao;

procedure TfrmAuxSubgrupo.btnAddClick(Sender: TObject);
begin
  edtNome.Text := '';
  dbCtx.TAuxSubGrupo.Close;
  dbCtx.TAuxSubGrupo.Open;
  dbCtx.TAuxSubGrupo.Insert;
  inherited;
end;

procedure TfrmAuxSubgrupo.btnConfirmaClick(Sender: TObject);
begin
  if edtNome.Text.Length=0 then
  begin
    MyShowMessage('Informe o Nome!!',false);
    edtNome.SetFocus;
    Exit;
  end;
  dbCtx.TAuxSubGrupoNome.AsString  := edtNome.Text;
  if dbCtx.TAuxSubGrupo.State=dsEdit then
  begin
   dbCtx.TAuxSubGrupoIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
   dbCtx.TAuxSubGrupoDataAlteracao.AsDateTime     := now;
   dbCtx.AlteraFlaSynAWS_ZERO('auxsubgrupoprodutos',dbCtx.TAuxSubGrupoID.AsString);
  end;
  if dbCtx.TAuxSubGrupo.State=dsInsert then
  begin
   if not dbCtx.VerificaCadastroExiste('NOME','auxsubgrupoprodutos',edtNome.Text) then
   begin
     MyShowMessage('Ja existe um Grupo com esse nome:'+edtNome.Text,false);
     Exit;
   end;
   dbCtx.TAuxSubGrupoIdUsuario.AsString := dbCtx.vIdUsuarioLogado;
  end;
  try
   dbCtx.TAuxSubGruposyncaws.AsInteger            :=0;
   dbCtx.TAuxSubGrupo.ApplyUpdates(-1);
//   if dbCtx.vTipoBDConfig=0 then
//    TThread.CreateAnonymousThread(procedure()
//    begin
//      DataModule1.ReplicaSubGrupo('');
//    end).Start;
   dbCtx.TAuxSubGrupo.Close;
   dbCtx.TAuxSubGrupo.Open();
   MudarAba(tbiLista,sender);
  except
   on E : Exception do
     MyShowMessage('Erro ao Inserir Grupo:'+E.Message,false);
  end;
end;

procedure TfrmAuxSubgrupo.btnDeletarClick(Sender: TObject);
begin
   MyShowMessage('Deseja Realmente Deletar esse registro?',true);
   case frmPrincipal.vMsgConfirma of
     1:begin
        dbCtx.TAuxSubGrupo.Edit;
        dbCtx.TAuxSubGrupoStatus.AsInteger := -1;
        dbCtx.TAuxSubGrupoIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
        dbCtx.TAuxSubGrupoDataAlteracao.AsDateTime     := now;
        dbCtx.TAuxSubGruposyncaws.AsInteger            :=0;
        dbCtx.AlteraFlaSynAWS_ZERO('auxsubgrupoprodutos',dbCtx.TAuxSubGrupoID.AsString);
        try
          dbCtx.TAuxSubGrupo.ApplyUpdates(-1);
//          if dbCtx.vTipoBDConfig=0 then
//           TThread.CreateAnonymousThread(procedure()
//           begin
//             DataModule1.ReplicaSubGrupo('');
//           end).Start;
          MyShowMessage('Registro Excluido com sucesso!',false);
          dbCtx.TAuxSubGrupo.Close;
          dbCtx.TAuxSubGrupo.Open();
        except
         on E : Exception do
          ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
        end;
     end;
   end;
end;

procedure TfrmAuxSubgrupo.btnEditarClick(Sender: TObject);
begin
  edtNome.Text           := dbCtx.TAuxsubGruponome.AsString;
  dbCtx.TAuxSubGrupo.Edit;
  inherited;
end;

procedure TfrmAuxSubgrupo.edtNomeFiltroChangeTracking(Sender: TObject);
begin
 if edtNomeFiltro.Text.Length>0 then
 begin
   dbCtx.TAuxSubGrupo.Filtered := false;
   dbCtx.TAuxSubGrupo.Filter   := 'NOME LIKE '+QuotedStr('%'+edtNomeFiltro.Text+'%');
   dbCtx.TAuxSubGrupo.Filtered := true;
 end
 else
 begin
   dbCtx.TAuxSubGrupo.Filtered := false;
   dbCtx.TAuxSubGrupo.Close;
   dbCtx.TAuxSubGrupo.Open;
 end;
end;

procedure TfrmAuxSubgrupo.FormShow(Sender: TObject);
begin
  dbCtx.TAuxSubGrupo.Close;
  dbCtx.TAuxSubGrupo.Open;
  inherited;
end;

procedure TfrmAuxSubgrupo.StringGrid1CellDblClick(const Column: TColumn;
  const Row: Integer);
begin
  Close;
end;

end.
