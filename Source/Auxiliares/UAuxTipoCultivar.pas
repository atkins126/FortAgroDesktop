unit UAuxTipoCultivar;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  UCadPadrao, System.Rtti, FMX.Grid.Style, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FMX.ActnList,
  System.Actions, FMX.TabControl, FMX.Ani, FMX.ScrollBox, FMX.Grid, FMX.Edit,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.Components, Data.Bind.DBScope, Data.Bind.Grid;

type
  TfrmAuxTipoCultivar = class(TfrmCadPadrao)
    Label4: TLabel;
    edtNome: TEdit;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    BindSourceDB1: TBindSourceDB;
    procedure btnAddClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure StringGrid1CellDblClick(const Column: TColumn;
      const Row: Integer);
    procedure edtNomeFiltroChangeTracking(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAuxTipoCultivar: TfrmAuxTipoCultivar;

implementation

{$R *.fmx}

uses DataContext, UPrincipal, dmReplicacao;

procedure TfrmAuxTipoCultivar.btnAddClick(Sender: TObject);
begin
  edtNome.Text := '';
  dbCtx.TAuxTipoCultivare.Close;
  dbCtx.TAuxTipoCultivare.Open;
  dbCtx.TAuxTipoCultivare.Insert;
  inherited;
end;

procedure TfrmAuxTipoCultivar.btnDeletarClick(Sender: TObject);
begin
   MyShowMessage('Deseja Realmente Deletar esse registro?',true);
   case frmPrincipal.vMsgConfirma of
     1:begin
        dbCtx.TAuxTipoCultivare.Edit;
        dbCtx.TAuxTipoCultivareStatus.AsInteger := -1;
        dbCtx.TAuxTipoCultivareIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
        dbCtx.TAuxTipoCultivareDataAlteracao.AsDateTime     := now;
        dbCtx.AlteraFlaSynAWS_ZERO('auxCobertura',dbCtx.TAuxTipoCultivareID.AsString);
        try
          dbCtx.TAuxTipoCultivare.ApplyUpdates(-1);
          MyShowMessage('Registro Excluido com sucesso!',false);
          dbCtx.TAuxTipoCultivare.Close;
          dbCtx.TAuxTipoCultivare.Open();
//          if dbCtx.vTipoBDConfig=0 then
//          TThread.CreateAnonymousThread(procedure()
//          begin
//            DataModule1.ReplicaAuxTipoCultivar('');
//          end).Start;
        except
         on E : Exception do
          ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
        end;
     end;
   end;

end;

procedure TfrmAuxTipoCultivar.btnEditarClick(Sender: TObject);
begin
  edtNome.Text           := dbCtx.TAuxTipoCultivarenome.AsString;
  dbCtx.TAuxTipoCultivare.Edit;
  inherited;
end;

procedure TfrmAuxTipoCultivar.btnSalvarClick(Sender: TObject);
begin
  if edtNome.Text.Length=0 then
  begin
    MyShowMessage('Informe o Nome!!',false);
    edtNome.SetFocus;
    Exit;
  end;
  dbCtx.TAuxTipoCultivarenome.AsString  := edtNome.Text;
  if dbCtx.TAuxTipoCultivare.State=dsEdit then
  begin
   dbCtx.TAuxTipoCultivareIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
   dbCtx.TAuxTipoCultivareDataAlteracao.AsDateTime     := now;
   dbCtx.AlteraFlaSynAWS_ZERO('auxTipoCultivar',dbCtx.TAuxTipoCultivareID.AsString);
  end;
  if dbCtx.TAuxTipoCultivare.State=dsInsert then
  begin
   if not dbCtx.VerificaCadastroExiste('NOME','auxTipoCultivar',edtNome.Text) then
   begin
     MyShowMessage('Ja existe uma Tipo Cultivar com esse nome:'+edtNome.Text,false);
     Exit;
   end;
   dbCtx.TAuxTipoCultivareIdUsuario.AsString := dbCtx.vIdUsuarioLogado;
  end;
  try
   dbCtx.TAuxTipoCultivare.ApplyUpdates(-1);
   dbCtx.TAuxTipoCultivare.Close;
   dbCtx.TAuxTipoCultivare.Open();
//   if dbCtx.vTipoBDConfig=0 then
//   TThread.CreateAnonymousThread(procedure()
//   begin
//     DataModule1.ReplicaAuxTipoCultivar('');
//   end).Start;
   MudarAba(tbiLista,sender);
  except
   on E : Exception do
     MyShowMessage('Erro ao Inserir Grupo:'+E.Message,false);
  end;
end;

procedure TfrmAuxTipoCultivar.edtNomeFiltroChangeTracking(Sender: TObject);
begin
 if edtNomeFiltro.Text.Length>0 then
 begin
   dbCtx.TAuxTipoCultivare.Filtered := false;
   dbCtx.TAuxTipoCultivare.Filter   := 'NOME LIKE '+QuotedStr('%'+edtNomeFiltro.Text+'%');
   dbCtx.TAuxTipoCultivare.Filtered := true;
 end
 else
 begin
   dbCtx.TAuxTipoCultivare.Filtered := false;
   dbCtx.TAuxTipoCultivare.Close;
   dbCtx.TAuxTipoCultivare.Open;
 end;
end;

procedure TfrmAuxTipoCultivar.FormShow(Sender: TObject);
begin
  dbCtx.TAuxTipoCultivare.Close;
  dbCtx.TAuxTipoCultivare.Open;
  inherited;
end;

procedure TfrmAuxTipoCultivar.StringGrid1CellDblClick(const Column: TColumn;
  const Row: Integer);
begin
 Close;
end;

end.
