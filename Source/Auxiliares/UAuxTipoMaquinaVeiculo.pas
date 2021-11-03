unit UAuxTipoMaquinaVeiculo;

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
  TfrmAuxTipoMaquinaVeiculo = class(TfrmCadPadrao)
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
  frmAuxTipoMaquinaVeiculo: TfrmAuxTipoMaquinaVeiculo;

implementation

{$R *.fmx}

uses DataContext, UPrincipal, dmReplicacao;

procedure TfrmAuxTipoMaquinaVeiculo.btnAddClick(Sender: TObject);
begin
  edtNome.Text := '';
  dbCtx.TAuxTipoMaqVeic.Close;
  dbCtx.TAuxTipoMaqVeic.Open;
  dbCtx.TAuxTipoMaqVeic.Insert;
  inherited;
end;

procedure TfrmAuxTipoMaquinaVeiculo.btnConfirmaClick(Sender: TObject);
begin
if edtNome.Text.Length=0 then
  begin
    MyShowMessage('Informe o Nome!!',false);
    edtNome.SetFocus;
    Exit;
  end;
  dbCtx.TAuxTipoMaqVeicNome.AsString  := edtNome.Text;
  if dbCtx.TAuxTipoMaqVeic.State=dsEdit then
  begin
   dbCtx.TAuxTipoMaqVeicIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
   dbCtx.TAuxTipoMaqVeicDataAlteracao.AsDateTime     := now;
  end;
  if dbCtx.TAuxTipoMaqVeic.State=dsInsert then
  begin
   if not dbCtx.VerificaCadastroExiste('NOME','auxtipomaquinaveiculos',edtNome.Text) then
   begin
     MyShowMessage('Ja existe uma Tipo Maquina Veiculos com esse nome:'+edtNome.Text,false);
     Exit;
   end;
   dbCtx.TAuxTipoMaqVeicIdUsuario.AsString := dbCtx.vIdUsuarioLogado;
  end;
  try
   dbCtx.TAuxTipoMaqVeicsyncaws.AsInteger            := 0;
   dbCtx.TAuxTipoMaqVeic.ApplyUpdates(-1);
   dbCtx.FDConPG.Commit;
   dbCtx.TAuxTipoMaqVeic.Close;
   dbCtx.TAuxTipoMaqVeic.Open();
   MyShowMessage('Tipo Cadastrada com sucesso!',false);
//   if dbCtx.vTipoBDConfig=0 then
//   TThread.CreateAnonymousThread(procedure()
//   begin
//     DataModule1.ReplicaAuxtipomaquinaveiculos('');
//   end).Start;
   MudarAba(tbiLista,Sender);
  except
   on E : Exception do
     MyShowMessage('Erro ao Inserir Tipo Maquina Veiculos:'+E.Message,false);
  end;
end;

procedure TfrmAuxTipoMaquinaVeiculo.btnDeletarClick(Sender: TObject);
begin
   MyShowMessage('Deseja Realmente Deletar esse registro?',true);
   case frmPrincipal.vMsgConfirma of
     1:begin
        dbCtx.TAuxTipoMaqVeic.Edit;
        dbCtx.TAuxTipoMaqVeicStatus.AsInteger := -1;
        dbCtx.TAuxTipoMaqVeicIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
        dbCtx.TAuxTipoMaqVeicDataAlteracao.AsDateTime     := now;
        dbCtx.TAuxTipoMaqVeicsyncaws.AsInteger            := 0;
        dbCtx.AlteraFlaSynAWS_ZERO('auxtipomaquinaveiculos',dbCtx.TAuxTipoMaqVeicID.AsString);
        try
          dbCtx.TAuxTipoMaqVeicsyncaws.AsInteger           := 0;
          dbCtx.TAuxTipoMaqVeic.ApplyUpdates(-1);
          dbCtx.FDConPG.Commit;
          MyShowMessage('Registro Excluido com sucesso!',false);
          dbCtx.TAuxTipoMaqVeic.Close;
          dbCtx.TAuxTipoMaqVeic.Open();
//          if dbCtx.vTipoBDConfig=0 then
//           TThread.CreateAnonymousThread(procedure()
//           begin
//             DataModule1.ReplicaAuxtipomaquinaveiculos('');
//           end).Start;
          lblTotalRegistro.Text := intToStr(StringGrid1.RowCount);
        except
         on E : Exception do
          ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
        end;
     end;
   end;
end;

procedure TfrmAuxTipoMaquinaVeiculo.btnEditarClick(Sender: TObject);
begin
  edtNome.Text           := dbCtx.TAuxTipoMaqVeicnome.AsString;
  dbCtx.TAuxTipoMaqVeic.Edit;
  inherited;
end;

procedure TfrmAuxTipoMaquinaVeiculo.edtNomeFiltroChangeTracking(
  Sender: TObject);
begin
 if edtNomeFiltro.Text.Length>0 then
 begin
   dbCtx.TAuxTipoMaqVeic.Filtered := false;
   dbCtx.TAuxTipoMaqVeic.Filter   := 'NOME LIKE '+QuotedStr('%'+edtNomeFiltro.Text+'%');
   dbCtx.TAuxTipoMaqVeic.Filtered := true;
 end
 else
 begin
   dbCtx.TAuxTipoMaqVeic.Filtered := false;
   dbCtx.TAuxTipoMaqVeic.Close;
   dbCtx.TAuxTipoMaqVeic.Open;
 end;
 lblTotalRegistro.Text := intToStr(StringGrid1.RowCount);
end;

procedure TfrmAuxTipoMaquinaVeiculo.FormShow(Sender: TObject);
begin
  dbCtx.TAuxTipoMaqVeic.Close;
  dbCtx.TAuxTipoMaqVeic.Open;
  lblTotalRegistro.Text := intToStr(StringGrid1.RowCount);
  inherited;
end;

procedure TfrmAuxTipoMaquinaVeiculo.StringGrid1CellDblClick(
  const Column: TColumn; const Row: Integer);
begin
  Close;
end;

end.
