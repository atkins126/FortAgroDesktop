unit UAuxMarcas;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  UCadPadrao, System.Rtti, FMX.Grid.Style, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FMX.ActnList,
  System.Actions, FMX.TabControl, FMX.Ani, FMX.ScrollBox, FMX.Grid, FMX.Edit,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts;

type
  TfrmCadAuxMarcas = class(TfrmCadPadrao)
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
  frmCadAuxMarcas: TfrmCadAuxMarcas;

implementation

{$R *.fmx}

uses DataContext, UPrincipal, UMsgDlg, dmReplicacao;

procedure TfrmCadAuxMarcas.btnAddClick(Sender: TObject);
begin
  edtNome.Text := '';
  dbCtx.TAuxMarca.Close;
  dbCtx.TAuxMarca.Open;
  dbCtx.TAuxMarca.Insert;
  inherited;
end;

procedure TfrmCadAuxMarcas.btnConfirmaClick(Sender: TObject);
begin
  if edtNome.Text.Length=0 then
  begin
    MyShowMessage('Informe o Nome!!',false);
    edtNome.SetFocus;
    Exit;
  end;
  dbCtx.TAuxMarcaNome.AsString  := edtNome.Text;
  if dbCtx.TAuxMarca.State=dsEdit then
  begin
   dbCtx.TAuxMarcaIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
   dbCtx.TAuxMarcaDataAlteracao.AsDateTime     := now;
   dbCtx.AlteraFlaSynAWS_ZERO('auxmarcas',dbCtx.TAuxMarcaID.AsString);
  end;
  if dbCtx.TAuxMarca.State=dsInsert then
  begin
   if not dbCtx.VerificaCadastroExiste('NOME','auxmarcas',edtNome.Text) then
   begin
     MyShowMessage('Ja existe uma Marca com esse nome:'+edtNome.Text,false);
     Exit;
   end;
   dbCtx.TAuxMarcaIdUsuario.AsString := dbCtx.vIdUsuarioLogado;
  end;
  try
   dbCtx.TAuxMarcasyncAws.Asinteger            := 0;
   dbCtx.TAuxMarca.ApplyUpdates(-1);
   dbCtx.TAuxMarca.Close;
   dbCtx.TAuxMarca.Open();
   MyShowMessage('Marca Cadastrada com sucesso!',false);
//   if dbCtx.vTipoBDConfig=0 then
//     TThread.CreateAnonymousThread(procedure()
//     begin
//        DataModule1.ReplicaMarca('');
//     end).Start;
   MudarAba(tbiLista,Sender);
  except
   on E : Exception do
     MyShowMessage('Erro ao Inserir Marca:'+E.Message,false);
  end;
end;

procedure TfrmCadAuxMarcas.btnDeletarClick(Sender: TObject);
begin
   MyShowMessage('Deseja Realmente Deletar esse registro?',true);
   case frmPrincipal.vMsgConfirma of
     1:begin
        dbCtx.TAuxMarca.Edit;
        dbCtx.TAuxMarcaStatus.AsInteger := -1;
        dbCtx.TAuxMarcaIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
        dbCtx.TAuxMarcaDataAlteracao.AsDateTime     := now;
        dbCtx.TAuxMarcasyncAws.Asinteger            := 0;
        dbCtx.AlteraFlaSynAWS_ZERO('auxmarcas',dbCtx.TAuxMarcaID.AsString);
        try
          dbCtx.TAuxMarca.ApplyUpdates(-1);
          MyShowMessage('Registro Excluido com sucesso!',false);
          dbCtx.TAuxMarca.Close;
          dbCtx.TAuxMarca.Open();
//          if dbCtx.vTipoBDConfig=0 then
//           TThread.CreateAnonymousThread(procedure()
//           begin
//              DataModule1.ReplicaMarca('');
//           end).Start;
        except
         on E : Exception do
          ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
        end;
     end;
   end;
end;

procedure TfrmCadAuxMarcas.btnEditarClick(Sender: TObject);
begin
  edtNome.Text           := dbCtx.TAuxMarcanome.AsString;
  dbCtx.TAuxMarca.Edit;
  inherited;
end;

procedure TfrmCadAuxMarcas.edtNomeFiltroChangeTracking(Sender: TObject);
begin
 if edtNomeFiltro.Text.Length>0 then
 begin
   dbCtx.TAuxMarca.Filtered := false;
   dbCtx.TAuxMarca.Filter   := 'NOME LIKE '+QuotedStr('%'+edtNomeFiltro.Text+'%');
   dbCtx.TAuxMarca.Filtered := true;
 end
 else
 begin
   dbCtx.TAuxMarca.Filtered := false;
   dbCtx.TAuxMarca.Close;
   dbCtx.TAuxMarca.Open;
 end;
 lblTotalRegistro.Text := intToStr(StringGrid1.RowCount);
end;

procedure TfrmCadAuxMarcas.FormShow(Sender: TObject);
begin
  dbCtx.TAuxMarca.Close;
  dbCtx.TAuxMarca.Open;
  lblTotalRegistro.Text := intToStr(StringGrid1.RowCount);
  inherited;
end;

procedure TfrmCadAuxMarcas.StringGrid1CellDblClick(const Column: TColumn;
  const Row: Integer);
begin
 Close;
end;

end.
