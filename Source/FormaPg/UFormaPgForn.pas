unit UFormaPgForn;

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
  TfrmCadFormaPG = class(TfrmCadPadrao)
    BindSourceDB1: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    BindingsList1: TBindingsList;
    edtDescricao: TEdit; 
    Layout1: TLayout;
    Rectangle1: TRectangle;
    Layout2: TLayout;
    Label5: TLabel;
    edtcodigo: TEdit;
    procedure FormShow(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure edtNomeFiltroChangeTracking(Sender: TObject);
    procedure StringGrid1CellDblClick(const Column: TColumn;
      const Row: Integer);
  private
    { Private declarations }
  public
    vIdFornecedor:string;
  end;

var
  frmCadFormaPG: TfrmCadFormaPG;

implementation

{$R *.fmx}

uses UdmCompras, UPrincipal, DataContext;

procedure TfrmCadFormaPG.btnAddClick(Sender: TObject);
begin
  dmCompras.AuxFormaPG.Close;
  dmCompras.AuxFormaPG.Open;
  dmCompras.AuxFormaPG.Insert;
  edtCodigo.Text    :='';
  edtDescricao.Text :='';
  MudarAba(tbiCad,sender);
end;

procedure TfrmCadFormaPG.btnDeletarClick(Sender: TObject);
begin
   MyShowMessage('Deseja Realmente Deletar esse registro?',true);
   case frmPrincipal.vMsgConfirma of
     1:begin
        dmCompras.AuxFormaPG.Edit;
        dmCompras.AuxFormaPGStatus.AsInteger := -1;
        dmCompras.AuxFormaPGIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
        dmCompras.AuxFormaPGDataAlteracao.AsDateTime     := now;
        try
          dmCompras.AuxFormaPG.ApplyUpdates(-1);
          MyShowMessage('Registro Excluido com sucesso!',false);
          dmCompras.AbreFormaPagamento;
        except
         on E : Exception do
          ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
        end;
     end;
   end;
end;

procedure TfrmCadFormaPG.btnEditarClick(Sender: TObject);
begin
  dmCompras.AuxFormaPG.Edit;
  edtCodigo.Text    :=dmCompras.AuxFormaPGcodigo.AsString;
  edtDescricao.Text :=dmCompras.AuxFormaPGdescricao.AsString;
  MudarAba(tbiCad,sender);
end;

procedure TfrmCadFormaPG.btnSalvarClick(Sender: TObject);
begin
 if edtCodigo.Text.Length=0 then
 begin
   MyShowMessage('Informe o codigo!!',false);
   Exit;
 end;
 if edtDescricao.Text.Length=0 then
 begin
   MyShowMessage('Informe a Descrição',false);
   Exit;
 end;
 dmCompras.AuxFormaPGcodigo.AsString       := edtCodigo.Text;
 dmCompras.AuxFormaPGdescricao.AsString    := edtDescricao.Text;
 if dmCompras.AuxFormaPG.State=dsInsert then
   dmCompras.AuxFormaPGidusuario.AsString    := dbCtx.vIdUsuarioLogado;
 if dmCompras.AuxFormaPG.State=dsEdit then
 begin
   dmCompras.AuxFormaPGidusuarioalteracao.AsString    := dbCtx.vIdUsuarioLogado;
   dmCompras.AuxFormaPGdataalteracao.AsDateTime       := Now;
 end;
 try
  dmCompras.AuxFormaPG.ApplyUpdates(-1);
  myShowMessage('Cadastro realizado com sucesso!',false);
  dmCompras.AbreFormaPagamento;
  MudarAba(tbiLista,sender);
 except
  on E: Exception do
   myShowMessage('Erro ao salvar Forma de pagamento:'+E.Message,false);
 end;
end;

procedure TfrmCadFormaPG.edtNomeFiltroChangeTracking(Sender: TObject);
begin
 if edtNomeFiltro.Text.Length>0 then
 begin
   dmCompras.AuxFormaPG.Filtered := false;
   dmCompras.AuxFormaPG.Filter   := 'descricao like '+QuotedStr('%'+edtNomeFiltro.Text+'%');
   dmCompras.AuxFormaPG.Filtered := true;
 end
 else
 begin
   dmCompras.AuxFormaPG.Filtered := false;
   dmCompras.AbreFormaPagamento;
 end
end;

procedure TfrmCadFormaPG.FormShow(Sender: TObject);
begin
  dmCompras.AbreFormaPagamento;
  inherited;
end;

procedure TfrmCadFormaPG.StringGrid1CellDblClick(const Column: TColumn;
  const Row: Integer);
begin
 Close;
end;

end.

