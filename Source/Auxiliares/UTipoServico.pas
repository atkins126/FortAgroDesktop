unit UTipoServico;

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
  TfrmAuxTipoServico = class(TfrmCadPadrao)
    BindSourceDB1: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    BindingsList1: TBindingsList;
    Label4: TLabel;
    edtNome: TEdit;
    procedure btnAddClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtNomeFiltroChangeTracking(Sender: TObject);
    procedure btnConfirmaClick(Sender: TObject);
    procedure StringGrid1CellDblClick(const Column: TColumn;
      const Row: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAuxTipoServico: TfrmAuxTipoServico;

implementation

{$R *.fmx}

uses DataContext, UPrincipal, dmReplicacao;

procedure TfrmAuxTipoServico.btnAddClick(Sender: TObject);
begin
  edtNome.Text := '';
  dbCtx.TAuxTipoServico.Close;
  dbCtx.TAuxTipoServico.Open;
  dbCtx.TAuxTipoServico.Insert;
  inherited;
end;

procedure TfrmAuxTipoServico.btnConfirmaClick(Sender: TObject);
begin
  if edtNome.Text.Length=0 then
  begin
    MyShowMessage('Informe o Nome!!',false);
    edtNome.SetFocus;
    Exit;
  end;
  dbCtx.TAuxTipoServicoNome.AsString  := edtNome.Text;
  if dbCtx.TAuxTipoServico.State=dsEdit then
  begin
   dbCtx.TAuxTipoServicoIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
   dbCtx.TAuxTipoServicoDataAlteracao.AsDateTime     := now;
   dbCtx.AlteraFlaSynAWS_ZERO('auxTipoServico',dbCtx.TAuxTipoServicoID.AsString);
  end;
  if dbCtx.TAuxTipoServico.State=dsInsert then
  begin
   if not dbCtx.VerificaCadastroExiste('NOME','auxTipoServico',edtNome.Text) then
   begin
     MyShowMessage('Ja existe um Tipo de Serviço com esse nome:'+edtNome.Text,false);
     Exit;
   end;
   dbCtx.TAuxTipoServicoIdUsuario.AsString := dbCtx.vIdUsuarioLogado;
  end;
  try
   TThread.Synchronize(nil,procedure
   begin
    dbCtx.TAuxTipoServicoSyncAWS.AsInteger :=0;
    dbCtx.TAuxTipoServico.ApplyUpdates(-1);
    dbCtx.FDConPG.Commit;
    sleep(200);
    dbCtx.TAuxTipoServico.Close;
    dbCtx.TAuxTipoServico.Open();
//    if dbCtx.vTipoBDConfig=0 then
//     TThread.CreateAnonymousThread(procedure()
//     begin
//       DataModule1.ReplicaTipoServico('');
//     end).Start;
   end);

   MudarAba(tbiLista,sender);
  except
   on E : Exception do
     MyShowMessage('Erro ao Inserir Grupo:'+E.Message,false);
  end;

end;

procedure TfrmAuxTipoServico.btnDeletarClick(Sender: TObject);
begin
  MyShowMessage('Deseja Realmente Deletar esse registro?',true);
   case frmPrincipal.vMsgConfirma of
     1:begin
        dbCtx.TAuxTipoServico.Edit;
        dbCtx.TAuxTipoServicoStatus.AsInteger := -1;
        dbCtx.TAuxTipoServicoIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
        dbCtx.TAuxTipoServicoDataAlteracao.AsDateTime     := now;
        try
          TThread.Synchronize(nil,procedure
           begin
            dbCtx.AlteraFlaSynAWS_ZERO('auxTipoServico',dbCtx.TAuxTipoServicoID.AsString);
            dbCtx.TAuxTipoServico.ApplyUpdates(-1);
            MyShowMessage('Registro Excluido com sucesso!',false);
            dbCtx.FDConPG.Commit;
            sleep(200);
            dbCtx.TAuxTipoServico.Close;
            dbCtx.TAuxTipoServico.Open();
//            if dbCtx.vTipoBDConfig=0 then
//             TThread.CreateAnonymousThread(procedure()
//             begin
//               DataModule1.ReplicaTipoServico('');
//             end).Start;
           end);
//          if dbCtx.vTipoBDConfig=0 then
//           TThread.CreateAnonymousThread(procedure()
//           begin
//             DataModule1.ReplicaTipoServico('');
//           end).Start;
        except
         on E : Exception do
          ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
        end;
     end;
   end;
end;

procedure TfrmAuxTipoServico.btnEditarClick(Sender: TObject);
begin
  edtNome.Text           := dbCtx.TAuxTipoServiconome.AsString;
  dbCtx.TAuxTipoServico.Edit;
  inherited;
end;

procedure TfrmAuxTipoServico.edtNomeFiltroChangeTracking(Sender: TObject);
begin
 if edtNomeFiltro.Text.Length>0 then
 begin
   dbCtx.TAuxTipoServico.Filtered := false;
   dbCtx.TAuxTipoServico.Filter   := 'NOME LIKE '+QuotedStr('%'+edtNomeFiltro.Text+'%');
   dbCtx.TAuxTipoServico.Filtered := true;
 end
 else
 begin
   dbCtx.TAuxTipoServico.Filtered := false;
   dbCtx.TAuxTipoServico.Close;
   dbCtx.TAuxTipoServico.Open;
 end;
end;

procedure TfrmAuxTipoServico.FormShow(Sender: TObject);
begin
  dbCtx.TAuxTipoServico.close;
  dbCtx.TAuxTipoServico.open;
  inherited;
end;

procedure TfrmAuxTipoServico.StringGrid1CellDblClick(const Column: TColumn;
  const Row: Integer);
begin
 close;
end;

end.
