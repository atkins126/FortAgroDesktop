unit UAuxTipoOperacaoSolido;

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
  Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope;

type
  TfrmAuxTipoAplicacaoSolido = class(TfrmCadPadrao)
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    edtNome: TEdit;
    Label4: TLabel;
    procedure btnAddClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure edtNomeFiltroChangeTracking(Sender: TObject);
    procedure btnConfirmaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure StringGrid1CellDblClick(const Column: TColumn;
      const Row: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAuxTipoAplicacaoSolido: TfrmAuxTipoAplicacaoSolido;

implementation

{$R *.fmx}

uses DataContext, UPrincipal, UMsgDlg;

procedure TfrmAuxTipoAplicacaoSolido.btnAddClick(Sender: TObject);
begin
  edtNome.Text := '';
  dbCtx.TAuxTipoOperacaoSolido.Close;
  dbCtx.TAuxTipoOperacaoSolido.Open;
  dbCtx.TAuxTipoOperacaoSolido.Insert;
  inherited;
end;

procedure TfrmAuxTipoAplicacaoSolido.btnConfirmaClick(Sender: TObject);
begin
  if edtNome.Text.Length=0 then
  begin
    MyShowMessage('Informe o Nome!!',false);
    edtNome.SetFocus;
    Exit;
  end;
  dbCtx.TAuxTipoOperacaoSolidonome.AsString  := edtNome.Text;
  if dbCtx.TAuxTipoOperacaoSolido.State=dsEdit then
  begin
   dbCtx.TAuxTipoOperacaoSolidoIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
   dbCtx.TAuxTipoOperacaoSolidoDataAlteracao.AsDateTime     := now;
  end;
  if dbCtx.TAuxTipoOperacaoSolido.State=dsInsert then
  begin
   if not dbCtx.VerificaCadastroExiste('NOME','auxTipoOperacaoSolido',edtNome.Text) then
   begin
     MyShowMessage('Ja existe uma Tipo de Aplicação de Solido com esse nome:'+edtNome.Text,false);
     Exit;
   end;
   dbCtx.TAuxTipoOperacaoSolidoIdUsuario.AsString := dbCtx.vIdUsuarioLogado;
  end;
  try
   dbCtx.TAuxTipoOperacaoSolido.ApplyUpdates(-1);
   dbCtx.TAuxTipoOperacaoSolido.Close;
   dbCtx.TAuxTipoOperacaoSolido.Open();
   lblTotalRegistro.Text := intToStr(StringGrid1.RowCount);
   MyShowMessage('Tipo de Aplicação de Solido Cadastrada com sucesso!',false);
   MudarAba(tbiLista,Sender);
  except
   on E : Exception do
     MyShowMessage('Erro ao Inserir Tipo de Aplicação de Solido:'+E.Message,false);
  end;
end;

procedure TfrmAuxTipoAplicacaoSolido.btnDeletarClick(Sender: TObject);
begin
   MyShowMessage('Deseja Realmente Deletar esse registro?',true);
   case frmPrincipal.vMsgConfirma of
     1:begin
        dbCtx.TAuxTipoOperacaoSolido.Edit;
        dbCtx.TAuxTipoOperacaoSolidostatus.AsInteger             := -1;
        dbCtx.TAuxTipoOperacaoSolidoIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
        dbCtx.TAuxTipoOperacaoSolidoDataAlteracao.AsDateTime     := now;
        try
          dbCtx.TAuxTipoOperacaoSolido.ApplyUpdates(-1);
          MyShowMessage('Registro Excluido com sucesso!',false);
          dbCtx.TAuxTipoOperacaoSolido.Close;
          dbCtx.TAuxTipoOperacaoSolido.Open();
          lblTotalRegistro.Text := intToStr(StringGrid1.RowCount);
        except
         on E : Exception do
          ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
        end;
     end;
   end;
end;

procedure TfrmAuxTipoAplicacaoSolido.btnEditarClick(Sender: TObject);
begin
  edtNome.Text           := dbCtx.TAuxTipoOperacaoSolidonome.AsString;
  dbCtx.TAuxTipoOperacaoSolido.Edit;
  inherited;
end;

procedure TfrmAuxTipoAplicacaoSolido.edtNomeFiltroChangeTracking(Sender: TObject);
begin
 if edtNomeFiltro.Text.Length>0 then
 begin
   dbCtx.TAuxTipoOperacaoSolido.Filtered := false;
   dbCtx.TAuxTipoOperacaoSolido.Filter   := 'NOME LIKE '+QuotedStr('%'+edtNomeFiltro.Text+'%');
   dbCtx.TAuxTipoOperacaoSolido.Filtered := true;
 end
 else
 begin
   dbCtx.TAuxTipoOperacaoSolido.Filtered := false;
   dbCtx.TAuxTipoOperacaoSolido.Close;
   dbCtx.TAuxTipoOperacaoSolido.Open;
 end;
 lblTotalRegistro.Text := intToStr(StringGrid1.RowCount);
end;

procedure TfrmAuxTipoAplicacaoSolido.FormShow(Sender: TObject);
begin
 dbCtx.TAuxTipoOperacaoSolido.Close;
 dbCtx.TAuxTipoOperacaoSolido.Open;
 lblTotalRegistro.Text := intToStr(StringGrid1.RowCount);
 inherited;
end;

procedure TfrmAuxTipoAplicacaoSolido.StringGrid1CellDblClick(
  const Column: TColumn; const Row: Integer);
begin
  Close;
end;

end.
