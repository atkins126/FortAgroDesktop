unit UAuxPragas;

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
  Fmx.Bind.DBEngExt, Data.Bind.Components, Fmx.Bind.Grid,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Grid, Data.Bind.DBScope;

type
  TfrmAuxPragas = class(TfrmCadPadrao)
    BindingsList1: TBindingsList;
    BindSourceDB1: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    Label4: TLabel;
    edtNome: TEdit;
    Layout1: TLayout;
    Rectangle1: TRectangle;
    Layout2: TLayout;
    Layout3: TLayout;
    Layout19: TLayout;
    Label6: TLabel;
    edtTipo: TEdit;
    EditButton5: TEditButton;
    procedure btnAddClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure edtNomeFiltroChangeTracking(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EditButton5Click(Sender: TObject);
  private
     vIdTipo :string;
  public
    { Public declarations }
  end;

var
  frmAuxPragas: TfrmAuxPragas;

implementation

{$R *.fmx}

uses UServicos, DataContext, UPrincipal, UAuxPragaTipo;

procedure TfrmAuxPragas.btnAddClick(Sender: TObject);
begin
  edtNome.Text := '';
  edtTipo.Text := '';
  dbCtx.TAuxPragas.Close;
  dbCtx.TAuxPragas.Open;
  dbCtx.TAuxPragas.Insert;
  inherited;
end;

procedure TfrmAuxPragas.btnDeletarClick(Sender: TObject);
begin
   MyShowMessage('Deseja Realmente Deletar esse registro?',true);
   case frmPrincipal.vMsgConfirma of
     1:begin
        dbCtx.TAuxPragas.Edit;
        dbCtx.TAuxPragassyncaws.AsInteger            :=0;
        dbCtx.TAuxPragasStatus.AsInteger             := -1;
        dbCtx.TAuxPragasIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
        dbCtx.TAuxPragasDataAlteracao.AsDateTime     := now;
        dbCtx.AlteraFlaSynAWS_ZERO('AuxPragas',dbCtx.TAuxPragasID.AsString);
        try
          dbCtx.TAuxPragassyncaws.AsInteger          :=0;
          dbCtx.TAuxPragas.ApplyUpdates(-1);
          MyShowMessage('Registro Excluido com sucesso!',false);
          dbCtx.TAuxPragas.Close;
          dbCtx.TAuxPragas.Open();
          lblTotalRegistro.Text := intToStr(StringGrid1.RowCount);
        except
         on E : Exception do
          ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
        end;
     end;
   end;
end;

procedure TfrmAuxPragas.btnEditarClick(Sender: TObject);
begin
  edtNome.Text           := dbCtx.TAuxPragasNome.AsString;
  edtTipo.Text           := dbCtx.TAuxPragastipo.AsString;
  dbCtx.TAuxPragas.Edit;
  inherited;
end;

procedure TfrmAuxPragas.btnSalvarClick(Sender: TObject);
begin
  if edtNome.Text.Length=0 then
  begin
    MyShowMessage('Informe o Nome!!',false);
    edtNome.SetFocus;
    Exit;
  end;
  if edtTipo.Text.Length=0 then
  begin
    MyShowMessage('Informe o Tipo!!',false);
    edtTipo.SetFocus;
    Exit;
  end;
  dbCtx.TAuxPragasnome.AsString  := edtNome.Text;
  if dbCtx.TAuxPragas.State=dsEdit then
  begin
   dbCtx.TAuxPragasIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
   dbCtx.TAuxPragasDataAlteracao.AsDateTime     := now;
   dbCtx.AlteraFlaSynAWS_ZERO('AuxPragas',dbCtx.TAuxPragasID.AsString);
  end;
  if dbCtx.TAuxPragas.State=dsInsert then
  begin
   if not dbCtx.VerificaCadastroExiste('NOME','auxPragas',edtNome.Text) then
   begin
     MyShowMessage('Ja existe uma Praga com esse nome:'+edtNome.Text,false);
     Exit;
   end;
   dbCtx.TAuxPragasIdUsuario.AsString := dbCtx.vIdUsuarioLogado;
  end;
  try
   dbCtx.TAuxPragasidTipo.Asstring   :=vIdTipo;
   dbCtx.TAuxPragassyncaws.AsInteger :=0;
   dbCtx.TAuxPragas.ApplyUpdates(-1);
   dbCtx.TAuxPragas.Close;
   dbCtx.TAuxPragas.Open();
   lblTotalRegistro.Text := intToStr(StringGrid1.RowCount);
   MyShowMessage('Praga Cadastrada com sucesso!',false);
   MudarAba(tbiLista,Sender);
  except
   on E : Exception do
     MyShowMessage('Erro ao Inserir Pagra:'+E.Message,false);
  end;
end;

procedure TfrmAuxPragas.EditButton5Click(Sender: TObject);
begin
  frmCadAuxPragaTipo := TfrmCadAuxPragaTipo.Create(Self);
  try
    frmCadAuxPragaTipo.ShowModal;
  finally
    vIdTipo       := dbCtx.TAuxPragaTipoid.AsString;
    edtTipo.Text  := dbCtx.TAuxPragaTiponome.AsString;
  end;
end;

procedure TfrmAuxPragas.edtNomeFiltroChangeTracking(Sender: TObject);
begin
 if edtNomeFiltro.Text.Length>0 then
 begin
   dbCtx.TAuxPragas.Filtered := false;
   dbCtx.TAuxPragas.Filter   := 'NOME LIKE '+QuotedStr('%'+edtNomeFiltro.Text+'%');
   dbCtx.TAuxPragas.Filtered := true;
 end
 else
 begin
   dbCtx.TAuxPragas.Filtered := false;
   dbCtx.TAuxPragas.Close;
   dbCtx.TAuxPragas.Open;
 end;
 lblTotalRegistro.Text := intToStr(StringGrid1.RowCount);
end;

procedure TfrmAuxPragas.FormShow(Sender: TObject);
begin
  lblBuscar.Text     := 'Filtros';
  lblAdd.Text        := 'Adicionar';
  lblEdit.Text       := 'Editar';
  lblDeleta.Text     := 'Deletar';
  layListaMnu.Width  := 150;
  tbPrincipal.TabPosition := TTabPosition.None;
  tbPrincipal.ActiveTab   := tbiLista;
  btnAdd.Enabled          := dbCtx.vTipoBDConfig=2;
  btnEditar.Enabled       := dbCtx.vTipoBDConfig=2;
  btnDeletar.Enabled      := dbCtx.vTipoBDConfig=2;
  dbCtx.TAuxPragas.Close;
  dbCtx.TAuxPragas.Open;
  lblTotalRegistro.Text := intToStr(StringGrid1.RowCount);
end;

end.
