unit UAuxTipoOcorrencia;

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
  TfrmAuxtipoOcorrencia = class(TfrmCadPadrao)
    BindSourceDB1: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    BindingsList1: TBindingsList;
    edtNome: TEdit;
    Label4: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
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
  frmAuxtipoOcorrencia: TfrmAuxtipoOcorrencia;

implementation

{$R *.fmx}

uses DataContext, UPrincipal, dmReplicacao;

procedure TfrmAuxtipoOcorrencia.btnAddClick(Sender: TObject);
begin
  edtNome.Text := '';
  dbCtx.TAuxTipoOcorrencia.Close;
  dbCtx.TAuxTipoOcorrencia.Open;
  dbCtx.TAuxTipoOcorrencia.Insert;
  inherited;
end;

procedure TfrmAuxtipoOcorrencia.btnConfirmaClick(Sender: TObject);
begin
 if edtNome.Text.Length=0 then
  begin
    MyShowMessage('Informe o Nome!!',false);
    edtNome.SetFocus;
    Exit;
  end;
  dbCtx.TAuxTipoOcorrencianome.AsString  := edtNome.Text;
  if dbCtx.TAuxTipoOcorrencia.State=dsEdit then
  begin
   dbCtx.TAuxTipoOcorrenciaIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
   dbCtx.TAuxTipoOcorrenciaDataAlteracao.AsDateTime     := now;
  end;
  if dbCtx.TAuxTipoOcorrencia.State=dsInsert then
  begin
   if not dbCtx.VerificaCadastroExiste('NOME','auxtipoocorrencia',edtNome.Text) then
   begin
     MyShowMessage('Ja existe uma Tipo de Ocorrencia com esse nome:'+edtNome.Text,false);
     Exit;
   end;
   dbCtx.TAuxTipoOcorrenciaIdUsuario.AsString := dbCtx.vIdUsuarioLogado;
  end;
  try
   dbCtx.TAuxTipoOcorrenciasyncaws.AsInteger:=0;
   dbCtx.TAuxTipoOcorrencia.ApplyUpdates(-1);
   dbCtx.FDConPG.Commit;
   dbCtx.TAuxTipoOcorrencia.Close;
   dbCtx.TAuxTipoOcorrencia.Open();
   lblTotalRegistro.Text := intToStr(StringGrid1.RowCount);
   MyShowMessage('Tipo de Ocorrencia Cadastrada com sucesso!',false);
//   if dbCtx.vTipoBDConfig=0 then
//   TThread.CreateAnonymousThread(procedure()
//   begin
//     DataModule1.ReplicaAuxtipoOcorrencia('');
//   end).Start;
   MudarAba(tbiLista,Sender);
  except
   on E : Exception do
     MyShowMessage('Erro ao Inserir Tipo de Ocorrencia:'+E.Message,false);
  end;

end;

procedure TfrmAuxtipoOcorrencia.btnDeletarClick(Sender: TObject);
begin
   MyShowMessage('Deseja Realmente Deletar esse registro?',true);
   case frmPrincipal.vMsgConfirma of
     1:begin
        dbCtx.TAuxTipoOcorrencia.Edit;
        dbCtx.TAuxTipoOcorrenciaStatus.AsInteger := -1;
        dbCtx.TAuxTipoOcorrenciaIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
        dbCtx.TAuxTipoOcorrenciaDataAlteracao.AsDateTime     := now;
        dbCtx.TAuxTipoOcorrenciasyncaws.AsInteger            :=0;
        try
          dbCtx.TAuxTipoOcorrenciasyncaws.AsInteger          :=0;
          dbCtx.TAuxTipoOcorrencia.ApplyUpdates(-1);
          dbCtx.FDConPG.Commit;
          MyShowMessage('Registro Excluido com sucesso!',false);
          dbCtx.TAuxTipoOcorrencia.Close;
          dbCtx.TAuxTipoOcorrencia.Open();
//          if dbCtx.vTipoBDConfig=0 then
//           TThread.CreateAnonymousThread(procedure()
//           begin
//             DataModule1.ReplicaAuxtipoOcorrencia('');
//           end).Start;
          lblTotalRegistro.Text := intToStr(StringGrid1.RowCount);
        except
         on E : Exception do
          ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
        end;
     end;
   end;
end;

procedure TfrmAuxtipoOcorrencia.btnEditarClick(Sender: TObject);
begin
  dbCtx.TAuxTipoOcorrencia.Edit;
  edtNome.Text := dbCtx.TAuxTipoOcorrencianome.AsString;
  inherited;
end;

procedure TfrmAuxtipoOcorrencia.edtNomeFiltroChangeTracking(Sender: TObject);
begin
 if edtNomeFiltro.Text.Length>0 then
 begin
   dbCtx.TAuxTipoOcorrencia.Filtered := false;
   dbCtx.TAuxTipoOcorrencia.Filter   := 'NOME LIKE '+QuotedStr('%'+edtNomeFiltro.Text+'%');
   dbCtx.TAuxTipoOcorrencia.Filtered := true;
 end
 else
 begin
   dbCtx.TAuxTipoOcorrencia.Filtered := false;
   dbCtx.TAuxTipoOcorrencia.Close;
   dbCtx.TAuxTipoOcorrencia.Open;
 end;
 lblTotalRegistro.Text := intToStr(StringGrid1.RowCount);
end;

procedure TfrmAuxtipoOcorrencia.FormShow(Sender: TObject);
begin
  dbCtx.TAuxTipoOcorrencia.Close;
  dbCtx.TAuxTipoOcorrencia.Open;
  lblTotalRegistro.Text  := intToStr(StringGrid1.RowCount);
  inherited;
end;

procedure TfrmAuxtipoOcorrencia.StringGrid1CellDblClick(const Column: TColumn;
  const Row: Integer);
begin
  Close;
end;

end.
