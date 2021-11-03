unit UAuxPragaTipo;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  UAuxMarcas, System.Rtti, FMX.Grid.Style, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FMX.ActnList,
  System.Actions, FMX.TabControl, FMX.Ani, FMX.ScrollBox, FMX.Grid, FMX.Edit,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts;

type
  TfrmCadAuxPragaTipo = class(TfrmCadAuxMarcas)
    procedure FormShow(Sender: TObject);
    procedure StringGrid1CellDblClick(const Column: TColumn;
      const Row: Integer);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure edtNomeFiltroChangeTracking(Sender: TObject);
    procedure btnConfirmaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadAuxPragaTipo: TfrmCadAuxPragaTipo;

implementation

{$R *.fmx}

uses DataContext, UPrincipal;

procedure TfrmCadAuxPragaTipo.btnAddClick(Sender: TObject);
begin
  edtNome.Text := '';
  dbCtx.TAuxPragaTipo.Close;
  dbCtx.TAuxPragaTipo.Open;
  dbCtx.TAuxPragaTipo.Insert;
  inherited;
end;

procedure TfrmCadAuxPragaTipo.btnConfirmaClick(Sender: TObject);
begin
 if edtNome.Text.Length=0 then
  begin
    MyShowMessage('Informe o Nome!!',false);
    edtNome.SetFocus;
    Exit;
  end;
  dbCtx.TAuxPragaTipoNome.AsString  := edtNome.Text;
  if dbCtx.TAuxPragaTipo.State=dsEdit then
  begin
   dbCtx.TAuxPragaTipoIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
   dbCtx.TAuxPragaTipoDataAlteracao.AsDateTime     := now;
   dbCtx.AlteraFlaSynAWS_ZERO('AuxPragaTipo',dbCtx.TAuxPragaTipoID.AsString);
  end;
  if dbCtx.TAuxPragaTipo.State=dsInsert then
  begin
   if not dbCtx.VerificaCadastroExiste('NOME','auxmarcas',edtNome.Text) then
   begin
     MyShowMessage('Ja existe uma Marca com esse nome:'+edtNome.Text,false);
     Exit;
   end;
   dbCtx.TAuxPragaTipoIdUsuario.AsString := dbCtx.vIdUsuarioLogado;
  end;
  try
   dbCtx.TAuxPragaTiposyncAws.Asinteger            := 0;
   dbCtx.TAuxPragaTipo.ApplyUpdates(-1);
   dbCtx.TAuxPragaTipo.Close;
   dbCtx.TAuxPragaTipo.Open();
   MyShowMessage('Tipo Praga Cadastrada com sucesso!',false);
   MudarAba(tbiLista,Sender);
  except
   on E : Exception do
     MyShowMessage('Erro ao Inserir Tipo Praga:'+E.Message,false);
  end;
end;

procedure TfrmCadAuxPragaTipo.btnDeletarClick(Sender: TObject);
begin
   MyShowMessage('Deseja Realmente Deletar esse registro?',true);
   case frmPrincipal.vMsgConfirma of
     1:begin
        dbCtx.TAuxPragaTipo.Edit;
        dbCtx.TAuxPragaTipoStatus.AsInteger := -1;
        dbCtx.TAuxPragaTipoIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
        dbCtx.TAuxPragaTipoDataAlteracao.AsDateTime     := now;
        dbCtx.TAuxPragaTiposyncAws.Asinteger            := 0;
        dbCtx.AlteraFlaSynAWS_ZERO('AuxPragaTipo',dbCtx.TAuxPragaTipoID.AsString);
        try
          dbCtx.TAuxPragaTipo.ApplyUpdates(-1);
          MyShowMessage('Registro Excluido com sucesso!',false);
          dbCtx.TAuxPragaTipo.Close;
          dbCtx.TAuxPragaTipo.Open();
        except
         on E : Exception do
          ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
        end;
     end;
   end;
end;

procedure TfrmCadAuxPragaTipo.btnEditarClick(Sender: TObject);
begin
  edtNome.Text           := dbCtx.TAuxPragaTiponome.AsString;
  dbCtx.TAuxPragaTipo.Edit;
  inherited;
end;

procedure TfrmCadAuxPragaTipo.edtNomeFiltroChangeTracking(Sender: TObject);
begin
  if edtNomeFiltro.Text.Length>0 then
   begin
     dbCtx.TAuxPragaTipo.Filtered := false;
     dbCtx.TAuxPragaTipo.Filter   := 'NOME LIKE '+QuotedStr('%'+edtNomeFiltro.Text+'%');
     dbCtx.TAuxPragaTipo.Filtered := true;
   end
   else
   begin
     dbCtx.TAuxPragaTipo.Filtered := false;
     dbCtx.TAuxPragaTipo.Close;
     dbCtx.TAuxPragaTipo.Open;
   end;
   lblTotalRegistro.Text := intToStr(StringGrid1.RowCount);
end;

procedure TfrmCadAuxPragaTipo.FormShow(Sender: TObject);
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
  dbCtx.TAuxPragaTipo.Close;
  dbCtx.TAuxPragaTipo.Open;
  lblTotalRegistro.Text := intToStr(StringGrid1.RowCount);
end;

procedure TfrmCadAuxPragaTipo.StringGrid1CellDblClick(const Column: TColumn;
  const Row: Integer);
begin
 Close;
end;

end.
