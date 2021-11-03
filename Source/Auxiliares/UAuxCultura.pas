unit UAuxCultura;

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
  TfrmAuxCultura = class(TfrmCadPadrao)
    BindSourceDB1: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    BindingsList1: TBindingsList;
    Label4: TLabel;
    edtNome: TEdit;
    procedure btnConfirmaClick(Sender: TObject);
    procedure edtNomeFiltroChangeTracking(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure StringGrid1CellDblClick(const Column: TColumn;
      const Row: Integer);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAuxCultura: TfrmAuxCultura;

implementation

{$R *.fmx}

uses DataContext, UPrincipal, dmReplicacao;

procedure TfrmAuxCultura.btnAddClick(Sender: TObject);
begin
  edtNome.Text := '';
  dbCtx.TAuxCulturas.Close;
  dbCtx.TAuxCulturas.Open;
  dbCtx.TAuxCulturas.Insert;
  inherited;
end;

procedure TfrmAuxCultura.btnConfirmaClick(Sender: TObject);
begin
  if edtNome.Text.Length=0 then
  begin
    MyShowMessage('Informe o Nome!!',false);
    edtNome.SetFocus;
    Exit;
  end;
  dbCtx.TAuxCulturasnome.AsString  := edtNome.Text;
  if dbCtx.TAuxCulturas.State=dsEdit then
  begin
   dbCtx.TAuxCulturasIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
   dbCtx.TAuxCulturasDataAlteracao.AsDateTime     := now;
   dbCtx.AlteraFlaSynAWS_ZERO('AuxCulturas',dbCtx.TAuxCulturasID.AsString);
  end;
  if dbCtx.TAuxCulturas.State=dsInsert then
  begin
   if not dbCtx.VerificaCadastroExiste('NOME','auxculturas',edtNome.Text) then
   begin
     MyShowMessage('Ja existe uma Cultura com esse nome:'+edtNome.Text,false);
     Exit;
   end;
   dbCtx.TAuxCulturasIdUsuario.AsString := dbCtx.vIdUsuarioLogado;
  end;
  try
   dbCtx.TAuxCulturassyncaws.AsInteger :=0;
   dbCtx.TAuxCulturas.ApplyUpdates(-1);
   dbCtx.TAuxCulturas.Close;
   dbCtx.TAuxCulturas.Open();
   lblTotalRegistro.Text := intToStr(StringGrid1.RowCount);
   MyShowMessage('Cultura Cadastrada com sucesso!',false);
   MudarAba(tbiLista,Sender);
//   if dbCtx.vTipoBDConfig=0 then
//   TThread.CreateAnonymousThread(procedure()
//   begin
//     DataModule1.ReplicaAuxCulturas('');
//   end).Start;
  except
   on E : Exception do
     MyShowMessage('Erro ao Inserir Cultura:'+E.Message,false);
  end;
end;

procedure TfrmAuxCultura.btnDeletarClick(Sender: TObject);
begin
   MyShowMessage('Deseja Realmente Deletar esse registro?',true);
   case frmPrincipal.vMsgConfirma of
     1:begin
        dbCtx.TAuxCulturas.Edit;
        dbCtx.TAuxCulturassyncaws.AsInteger            :=0;
        dbCtx.TAuxCulturasStatus.AsInteger             := -1;
        dbCtx.TAuxCulturasIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
        dbCtx.TAuxCulturasDataAlteracao.AsDateTime     := now;
        dbCtx.AlteraFlaSynAWS_ZERO('AuxCulturas',dbCtx.TAuxCulturasID.AsString);
        try
          dbCtx.TAuxCulturassyncaws.AsInteger          :=0;
          dbCtx.TAuxCulturas.ApplyUpdates(-1);
          MyShowMessage('Registro Excluido com sucesso!',false);
          dbCtx.TAuxCulturas.Close;
          dbCtx.TAuxCulturas.Open();
//          if dbCtx.vTipoBDConfig=0 then
//           TThread.CreateAnonymousThread(procedure()
//           begin
//             DataModule1.ReplicaAuxCulturas('');
//           end).Start;
          lblTotalRegistro.Text := intToStr(StringGrid1.RowCount);
        except
         on E : Exception do
          ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
        end;
     end;
   end;
end;

procedure TfrmAuxCultura.btnEditarClick(Sender: TObject);
begin
  edtNome.Text           := dbCtx.TAuxCulturasnome.AsString;
  dbCtx.TAuxCulturas.Edit;
  inherited;
end;

procedure TfrmAuxCultura.edtNomeFiltroChangeTracking(Sender: TObject);
begin
 if edtNomeFiltro.Text.Length>0 then
 begin
   dbCtx.TAuxCulturas.Filtered := false;
   dbCtx.TAuxCulturas.Filter   := 'NOME LIKE '+QuotedStr('%'+edtNomeFiltro.Text+'%');
   dbCtx.TAuxCulturas.Filtered := true;
 end
 else
 begin
   dbCtx.TAuxCulturas.Filtered := false;
   dbCtx.TAuxCulturas.Close;
   dbCtx.TAuxCulturas.Open;
 end;
 lblTotalRegistro.Text := intToStr(StringGrid1.RowCount);
end;

procedure TfrmAuxCultura.FormShow(Sender: TObject);
begin
 dbCtx.TAuxCulturas.Close;
 dbCtx.TAuxCulturas.Open;
 lblTotalRegistro.Text := intToStr(StringGrid1.RowCount);
 inherited;
end;

procedure TfrmAuxCultura.StringGrid1CellDblClick(const Column: TColumn;
  const Row: Integer);
begin
 Close;
end;

end.
