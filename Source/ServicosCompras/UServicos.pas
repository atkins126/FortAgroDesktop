unit UServicos;

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
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope,
  FMX.DateTimeCtrls, FMX.ListBox, FMX.Memo;

type
  TfrmCadServico = class(TfrmCadPadrao)
    BindSourceDB1: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    BindingsList1: TBindingsList;
    Rectangle2: TRectangle;
    Layout1: TLayout;
    edtTipo: TEdit;
    EditButton1: TEditButton;
    EdtdataPrevista: TDateEdit;
    cbxSegmento: TComboBox;
    Layout8: TLayout;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Layout34: TLayout;
    Rectangle19: TRectangle;
    Layout35: TLayout;
    edtDescricao: TMemo;
    Layout36: TLayout;
    Label28: TLabel;
    Layout2: TLayout;
    Rectangle1: TRectangle;
    Label7: TLabel;
    Layout3: TLayout;
    edtResponsavel: TEdit;
    procedure EditButton1Click(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure edtNomeFiltroChangeTracking(Sender: TObject);
    procedure StringGrid1CellDblClick(const Column: TColumn;
      const Row: Integer);
  private
    vIdTipo:string;
    procedure LimpaCampos;
  public
    { Public declarations }
  end;

var
  frmCadServico: TfrmCadServico;

implementation

{$R *.fmx}

uses DataContext, UPrincipal, UTipoServico, dmReplicacao;

procedure TfrmCadServico.btnAddClick(Sender: TObject);
begin
  LimpaCampos;
  dbCtx.TServico.Close;
  dbCtx.TServico.Open;
  dbCtx.TServico.Insert;
  inherited;
end;

procedure TfrmCadServico.btnDeletarClick(Sender: TObject);
begin
   MyShowMessage('Deseja Realmente Deletar esse registro?',true);
   case frmPrincipal.vMsgConfirma of
     1:begin
        dbCtx.TServico.Edit;
        dbCtx.TServicoStatus.AsInteger := -1;
        dbCtx.TServicoIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
        dbCtx.TServicoDataAlteracao.AsDateTime     := now;
        dbCtx.AlteraFlaSynAWS_ZERO('servico',dbCtx.TServicoID.AsString);
        try
          dbCtx.TServicosyncaws.AsInteger :=0;
          dbCtx.TServico.ApplyUpdates(-1);
          MyShowMessage('Registro Excluido com sucesso!',false);
          dbCtx.TServico.Close;
          dbCtx.TServico.Open();
          TThread.CreateAnonymousThread(procedure()
          begin
            DataModule1.ReplicaServico('');
          end).Start;
        except
         on E : Exception do
          ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
        end;
     end;
   end;
end;

procedure TfrmCadServico.btnEditarClick(Sender: TObject);
begin
  vIdTipo                  := dbCtx.TServicoidtipo.AsString;
  edtDescricao.Text        := dbCtx.TServicodescricao.AsString;
  cbxSegmento.ItemIndex    := dbCtx.TServicoidsegmento.AsInteger;
  EdtdataPrevista.DateTime := dbCtx.TServicodataprevista.AsDateTime;
  edtResponsavel.Text      := dbCtx.TServicoresponsavel.AsString;
  dbCtx.TServico.Edit;
  inherited;
end;

procedure TfrmCadServico.btnSalvarClick(Sender: TObject);
begin
  if edtTipo.Text.Length=0 then
  begin
    MyShowMessage('Informe o Tipo!!',false);
    edtTipo.SetFocus;
    Exit;
  end;
  if cbxSegmento.ItemIndex=-1 then
  begin
    MyShowMessage('Informe o Segmento!!',false);
    cbxSegmento.SetFocus;
    Exit;
  end;
  if EdtdataPrevista.Text.Length=0 then
  begin
    MyShowMessage('Informe uma Data Prevista!!',false);
    EdtdataPrevista.SetFocus;
    Exit;
  end;
  if edtDescricao.Text.Length=0 then
  begin
    MyShowMessage('Informe uma Descrição!!',false);
    edtDescricao.SetFocus;
    Exit;
  end;
   dbCtx.TServicosyncaws.AsInteger :=0;
  dbCtx.TServicoidtipo.AsString         := vIdTipo;
  dbCtx.TServicodescricao.AsString      := edtDescricao.Text;
  dbCtx.TServicoidsegmento.AsInteger    := cbxSegmento.ItemIndex;
  dbCtx.TServicodataprevista.AsDateTime := EdtdataPrevista.DateTime;
  if edtResponsavel.Text.Length>0 then
   dbCtx.TServicoresponsavel.AsString  := edtResponsavel.Text;

  if dbCtx.TServico.State=dsEdit then
  begin
   dbCtx.TServicoIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
   dbCtx.TServicoDataAlteracao.AsDateTime     := now;
   dbCtx.AlteraFlaSynAWS_ZERO('servico',dbCtx.TServicoID.AsString);
  end;
  if dbCtx.TServico.State=dsInsert then
  begin
   dbCtx.TServicoIdUsuario.AsString := dbCtx.vIdUsuarioLogado;
  end;
  try
   dbCtx.TServico.ApplyUpdates(-1);
   dbCtx.TServico.Close;
   dbCtx.TServico.Open();
   TThread.CreateAnonymousThread(procedure()
   begin
     DataModule1.ReplicaServico('');
   end).Start;
   MudarAba(tbiLista,sender);
  except
   on E : Exception do
     MyShowMessage('Erro ao Inserir Serviço:'+E.Message,false);
  end;
end;

procedure TfrmCadServico.EditButton1Click(Sender: TObject);
begin
  frmAuxTiposervico := TfrmAuxTiposervico.Create(nil);
  try
    frmAuxTiposervico.ShowModal;
  finally
    edtTipo.text          := dbCtx.TAuxTipoServiconome.AsString;
    vIdTipo               := dbCtx.TAuxTipoServicoId.AsString;
    frmAuxTiposervico.Free;
  end;
end;

procedure TfrmCadServico.edtNomeFiltroChangeTracking(Sender: TObject);
begin
  if edtNomeFiltro.Text.Length>0 then
 begin
   dbCtx.TServico.Filtered := false;
   dbCtx.TServico.Filter   := 'TIPO LIKE '+QuotedStr('%'+edtNomeFiltro.Text+'%');
   dbCtx.TServico.Filtered := true;
 end
 else
 begin
   dbCtx.TServico.Filtered := false;
   dbCtx.TServico.Close;
   dbCtx.TServico.Open;
 end;
end;

procedure TfrmCadServico.FormShow(Sender: TObject);
begin
  dbCtx.TServico.Close;
  dbCtx.TServico.Open;
  inherited;
end;

procedure TfrmCadServico.LimpaCampos;
begin
  edtDescricao.Lines.Clear;
  cbxSegmento.ItemIndex :=-1;
  edtResponsavel.Text   :='';
  edtTipo.Text          :='';
end;

procedure TfrmCadServico.StringGrid1CellDblClick(const Column: TColumn;
  const Row: Integer);
begin
 close;
end;

end.
