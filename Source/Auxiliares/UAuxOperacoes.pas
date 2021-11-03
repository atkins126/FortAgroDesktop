unit UAuxOperacoes;

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
  TfrmAuxOperacao = class(TfrmCadPadrao)
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    edtNome: TEdit;
    Label4: TLabel;
    procedure btnAddClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnConfirmaClick(Sender: TObject);
    procedure edtNomeFiltroChangeTracking(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure StringGrid1CellDblClick(const Column: TColumn;
      const Row: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAuxOperacao: TfrmAuxOperacao;

implementation

{$R *.fmx}

uses DataContext, UPrincipal;

procedure TfrmAuxOperacao.btnAddClick(Sender: TObject);
begin
  edtNome.Text := '';
  dbCtx.TAuxOperacao.Close;
  dbCtx.TAuxOperacao.Open;
  dbCtx.TAuxOperacao.Insert;
  inherited;
end;

procedure TfrmAuxOperacao.btnConfirmaClick(Sender: TObject);
begin
 if edtNome.Text.Length=0 then
  begin
    MyShowMessage('Informe o Nome!!',false);
    edtNome.SetFocus;
    Exit;
  end;
  dbCtx.TAuxOperacaonome.AsString  := edtNome.Text;
  if dbCtx.TAuxOperacao.State=dsEdit then
  begin
   dbCtx.TAuxOperacaoIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
   dbCtx.TAuxOperacaoDataAlteracao.AsDateTime     := now;
  end;
  if dbCtx.TAuxOperacao.State=dsInsert then
  begin
   if not dbCtx.VerificaCadastroExiste('NOME','operacoes',edtNome.Text) then
   begin
     MyShowMessage('Ja existe uma Operação com esse nome:'+edtNome.Text,false);
     Exit;
   end;
   dbCtx.TAuxOperacaoIdUsuario.AsString := dbCtx.vIdUsuarioLogado;
  end;
  try
   dbCtx.TAuxOperacao.ApplyUpdates(-1);
   dbCtx.TAuxOperacao.Close;
   dbCtx.TAuxOperacao.Open();
   lblTotalRegistro.Text := intToStr(StringGrid1.RowCount);
   MyShowMessage('Operação Cadastrada com sucesso!',false);
   MudarAba(tbiLista,Sender);
  except
   on E : Exception do
     MyShowMessage('Erro ao Inserir Operação:'+E.Message,false);
  end;
end;

procedure TfrmAuxOperacao.btnDeletarClick(Sender: TObject);
begin
   MyShowMessage('Deseja Realmente Deletar esse registro?',true);
   case frmPrincipal.vMsgConfirma of
     1:begin
        dbCtx.TAuxOperacao.Edit;
        dbCtx.TAuxOperacaoStatus.AsInteger := -1;
        dbCtx.TAuxOperacaoIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
        dbCtx.TAuxOperacaoDataAlteracao.AsDateTime     := now;
        try
          dbCtx.TAuxOperacao.ApplyUpdates(-1);
          MyShowMessage('Registro Excluido com sucesso!',false);
          dbCtx.TAuxOperacao.Close;
          dbCtx.TAuxOperacao.Open();
          lblTotalRegistro.Text := intToStr(StringGrid1.RowCount);
        except
         on E : Exception do
          ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
        end;
     end;
   end;
end;

procedure TfrmAuxOperacao.btnEditarClick(Sender: TObject);
begin
  edtNome.Text           := dbCtx.TAuxOperacaonome.AsString;
  dbCtx.TAuxOperacao.Edit;
  inherited;
end;

procedure TfrmAuxOperacao.edtNomeFiltroChangeTracking(Sender: TObject);
begin
 if edtNomeFiltro.Text.Length>0 then
 begin
   dbCtx.TAuxOperacao.Filtered := false;
   dbCtx.TAuxOperacao.Filter   := 'NOME LIKE '+QuotedStr('%'+edtNomeFiltro.Text+'%');
   dbCtx.TAuxOperacao.Filtered := true;
 end
 else
 begin
   dbCtx.TAuxOperacao.Filtered := false;
   dbCtx.TAuxOperacao.Close;
   dbCtx.TAuxOperacao.Open;
 end;
 lblTotalRegistro.Text := intToStr(StringGrid1.RowCount);
end;

procedure TfrmAuxOperacao.FormShow(Sender: TObject);
begin
 dbCtx.TAuxOperacao.Close;
 dbCtx.TAuxOperacao.Open;
 lblTotalRegistro.Text := intToStr(StringGrid1.RowCount);
 inherited;
end;

procedure TfrmAuxOperacao.StringGrid1CellDblClick(const Column: TColumn;
  const Row: Integer);
begin
  Close;
end;

end.
