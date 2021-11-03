unit UAuxCobertura;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  UCadPadrao, System.Rtti, FMX.Grid.Style, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FMX.ActnList,
  System.Actions, FMX.TabControl, FMX.Ani, FMX.ScrollBox, FMX.Grid, FMX.Edit,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts;

type
  TfrmAuxCobertura = class(TfrmCadPadrao)
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    Label4: TLabel;
    edtNome: TEdit;
    procedure btnAddClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtNomeFiltroChangeTracking(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAuxCobertura: TfrmAuxCobertura;

implementation

{$R *.fmx}

uses DataContext, UPrincipal, dmReplicacao;

procedure TfrmAuxCobertura.btnAddClick(Sender: TObject);
begin
  edtNome.Text := '';
  dbCtx.TAuxCobertura.Close;
  dbCtx.TAuxCobertura.Open;
  dbCtx.TAuxCobertura.Insert;
  inherited;
end;

procedure TfrmAuxCobertura.btnDeletarClick(Sender: TObject);
begin
   MyShowMessage('Deseja Realmente Deletar esse registro?',true);
   case frmPrincipal.vMsgConfirma of
     1:begin
        dbCtx.TAuxCobertura.Edit;
        dbCtx.TAuxCoberturaStatus.AsInteger := -1;
        dbCtx.TAuxCoberturaIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
        dbCtx.TAuxCoberturaDataAlteracao.AsDateTime     := now;
        dbCtx.AlteraFlaSynAWS_ZERO('auxCobertura',dbCtx.TAuxCoberturaID.AsString);
        try
          dbCtx.TAuxCobertura.ApplyUpdates(-1);
          MyShowMessage('Registro Excluido com sucesso!',false);
          dbCtx.TAuxCobertura.Close;
          dbCtx.TAuxCobertura.Open();
//          if dbCtx.vTipoBDConfig=0 then
//          TThread.CreateAnonymousThread(procedure()
//          begin
//            DataModule1.ReplicaCobertura('');
//          end).Start;
        except
         on E : Exception do
          ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
        end;
     end;
   end;
end;

procedure TfrmAuxCobertura.btnEditarClick(Sender: TObject);
begin
  edtNome.Text           := dbCtx.TAuxCoberturanome.AsString;
  dbCtx.TAuxCobertura.Edit;
  inherited;
end;

procedure TfrmAuxCobertura.btnSalvarClick(Sender: TObject);
begin
  if edtNome.Text.Length=0 then
  begin
    MyShowMessage('Informe o Nome!!',false);
    edtNome.SetFocus;
    Exit;
  end;
  dbCtx.TAuxCoberturanome.AsString  := edtNome.Text;
  if dbCtx.TAuxCobertura.State=dsEdit then
  begin
   dbCtx.TAuxCoberturaIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
   dbCtx.TAuxCoberturaDataAlteracao.AsDateTime     := now;
   dbCtx.AlteraFlaSynAWS_ZERO('auxCobertura',dbCtx.TAuxCoberturaID.AsString);
  end;
  if dbCtx.TAuxCobertura.State=dsInsert then
  begin
   if not dbCtx.VerificaCadastroExiste('NOME','auxCobertura',edtNome.Text) then
   begin
     MyShowMessage('Ja existe uma Cobertura com esse nome:'+edtNome.Text,false);
     Exit;
   end;
   dbCtx.TAuxCoberturaIdUsuario.AsString := dbCtx.vIdUsuarioLogado;
  end;
  try
   dbCtx.TAuxCobertura.ApplyUpdates(-1);
   dbCtx.TAuxCobertura.Close;
   dbCtx.TAuxCobertura.Open();
//   if dbCtx.vTipoBDConfig=0 then
//   TThread.CreateAnonymousThread(procedure()
//   begin
//     DataModule1.ReplicaCobertura('');
//   end).Start;
   MudarAba(tbiLista,sender);
  except
   on E : Exception do
     MyShowMessage('Erro ao Inserir Grupo:'+E.Message,false);
  end;
end;

procedure TfrmAuxCobertura.edtNomeFiltroChangeTracking(Sender: TObject);
begin
 if edtNomeFiltro.Text.Length>0 then
 begin
   dbCtx.TAuxCobertura.Filtered := false;
   dbCtx.TAuxCobertura.Filter   := 'NOME LIKE '+QuotedStr('%'+edtNomeFiltro.Text+'%');
   dbCtx.TAuxCobertura.Filtered := true;
 end
 else
 begin
   dbCtx.TAuxCobertura.Filtered := false;
   dbCtx.TAuxCobertura.Close;
   dbCtx.TAuxCobertura.Open;
 end;
end;

procedure TfrmAuxCobertura.FormShow(Sender: TObject);
begin
  dbCtx.TAuxCobertura.close;
  dbCtx.TAuxCobertura.open;
  inherited;
end;

end.
