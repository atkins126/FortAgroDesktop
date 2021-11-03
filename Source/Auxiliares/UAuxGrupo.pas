unit UAuxGrupo;

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
  TfrmAuxGrupo = class(TfrmCadPadrao)
    BindSourceDB1: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    BindingsList1: TBindingsList;
    Label4: TLabel;
    Layout3: TLayout;
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
  frmAuxGrupo: TfrmAuxGrupo;

implementation

{$R *.fmx}

uses DataContext, UPrincipal, dmReplicacao;

procedure TfrmAuxGrupo.btnAddClick(Sender: TObject);
begin
  edtNome.Text := '';
  dbCtx.TAuxGrupo.Close;
  dbCtx.TAuxGrupo.Open;
  dbCtx.TAuxGrupo.Insert;
  inherited;
end;

procedure TfrmAuxGrupo.btnConfirmaClick(Sender: TObject);
begin
  if edtNome.Text.Length=0 then
  begin
    MyShowMessage('Informe o Nome!!',false);
    edtNome.SetFocus;
    Exit;
  end;
  dbCtx.TAuxGrupoNome.AsString  := edtNome.Text;
  if dbCtx.TAuxGrupo.State=dsEdit then
  begin
   dbCtx.TAuxGrupoIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
   dbCtx.TAuxGrupoDataAlteracao.AsDateTime     := now;
  end;
  if dbCtx.TAuxGrupo.State=dsInsert then
  begin
   if not dbCtx.VerificaCadastroExiste('NOME','auxgrupoprodutos',edtNome.Text) then
   begin
     MyShowMessage('Ja existe um Grupo com esse nome:'+edtNome.Text,false);
     Exit;
   end;
   dbCtx.TAuxGrupoIdUsuario.AsString := dbCtx.vIdUsuarioLogado;
  end;
  try
   dbCtx.TAuxGruposyncaws.asInteger            :=0;
   dbCtx.TAuxGrupo.ApplyUpdates(-1);
//   if dbCtx.vTipoBDConfig=0 then
//    TThread.CreateAnonymousThread(procedure()
//    begin
//      DataModule1.ReplicaGrupo('');
//    end).Start;
   dbCtx.TAuxGrupo.Close;
   dbCtx.TAuxGrupo.Open();
   MudarAba(tbiLista,sender);
  except
   on E : Exception do
     MyShowMessage('Erro ao Inserir Grupo:'+E.Message,false);
  end;
end;

procedure TfrmAuxGrupo.btnDeletarClick(Sender: TObject);
begin
   MyShowMessage('Deseja Realmente Deletar esse registro?',true);
   case frmPrincipal.vMsgConfirma of
     1:begin
        dbCtx.TAuxGrupo.Edit;
        dbCtx.TAuxGrupoStatus.AsInteger := -1;
        dbCtx.TAuxGrupoIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
        dbCtx.TAuxGrupoDataAlteracao.AsDateTime     := now;
        dbCtx.TAuxGruposyncaws.asInteger            :=0;
        try
          dbCtx.TAuxGrupo.ApplyUpdates(-1);
//          if dbCtx.vTipoBDConfig=0 then
//           TThread.CreateAnonymousThread(procedure()
//           begin
//              DataModule1.ReplicaGrupo('');
//           end).Start;
          MyShowMessage('Registro Excluido com sucesso!',false);
          dbCtx.TAuxGrupo.Close;
          dbCtx.TAuxGrupo.Open();
        except
         on E : Exception do
          ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
        end;
     end;
   end;
end;

procedure TfrmAuxGrupo.btnEditarClick(Sender: TObject);
begin
  edtNome.Text           := dbCtx.TAuxGruponome.AsString;
  dbCtx.TAuxGrupo.Edit;
  inherited;
end;

procedure TfrmAuxGrupo.edtNomeFiltroChangeTracking(Sender: TObject);
begin
 if edtNomeFiltro.Text.Length>0 then
 begin
   dbCtx.TAuxGrupo.Filtered := false;
   dbCtx.TAuxGrupo.Filter   := 'NOME LIKE '+QuotedStr('%'+edtNomeFiltro.Text+'%');
   dbCtx.TAuxGrupo.Filtered := true;
 end
 else
 begin
   dbCtx.TAuxGrupo.Filtered := false;
   dbCtx.TAuxGrupo.Close;
   dbCtx.TAuxGrupo.Open;
 end;
end;

procedure TfrmAuxGrupo.FormShow(Sender: TObject);
begin
  dbCtx.TAuxGrupo.Close;
  dbCtx.TAuxGrupo.Open;
  inherited;
end;

procedure TfrmAuxGrupo.StringGrid1CellDblClick(const Column: TColumn;
  const Row: Integer);
begin
 close;
end;

end.
