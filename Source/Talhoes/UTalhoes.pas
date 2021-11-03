unit UTalhoes;

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
  FMX.ListBox;

type
  TfrmTalhoes = class(TfrmCadPadrao)
    BindSourceDB1: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    BindingsList1: TBindingsList;
    Layout1: TLayout;
    lblAreaTotalGrid: TLabel;
    Label5: TLabel;
    edtNome: TEdit;
    Layout2: TLayout;
    Rectangle2: TRectangle;
    Layout3: TLayout;
    Layout4: TLayout;
    edtSetorFazenda: TEdit;
    EditButton5: TEditButton;
    Layout6: TLayout;
    Label6: TLabel;
    Label7: TLabel;
    edtAreaHA: TEdit;
    Layout7: TLayout;
    Rectangle3: TRectangle;
    Layout8: TLayout;
    Layout9: TLayout;
    Label8: TLabel;
    Label9: TLabel;
    lblStatus: TLabel;
    edtLatitude: TEdit;
    edtLongitude: TEdit;
    SwStatus: TSwitch;
    Layout10: TLayout;
    Rectangle4: TRectangle;
    Layout11: TLayout;
    Label10: TLabel;
    edtObs: TEdit;
    Label11: TLabel;
    cbxTipo: TComboBox;
    edtSetorF: TEdit;
    Label4: TLabel;
    cbxTipof: TComboBox;
    Label12: TLabel;
    procedure btnConfirmaClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EditButton5Click(Sender: TObject);
    procedure cbxTipofChange(Sender: TObject);
    procedure edtNomeFiltroChangeTracking(Sender: TObject);
    procedure edtSetorFChangeTracking(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure StringGrid1CellDblClick(const Column: TColumn;
      const Row: Integer);
    procedure StringGrid1CellClick(const Column: TColumn; const Row: Integer);
    procedure StringGrid1SelChanged(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    vIDSetorFaz:string;
    vSelected:integer;
    procedure LimpaCampos;
    procedure SomarColunas;
  public
    vID:string;
    procedure Filtro;
  end;

var
  frmTalhoes: TfrmTalhoes;

implementation

{$R *.fmx}

uses DataContext, UPrincipal, UMsgDlg, USetores, dmReplicacao;

{ TfrmTalhoes }

procedure TfrmTalhoes.btnAddClick(Sender: TObject);
begin
  if DataModule1.Sincronizando=1 then
  begin
    MyShowMessage('Aguarde Sincronizando Dados!',false);
    Exit;
  end;
  LimpaCampos;
  dbCtx.TTalhoes.Close;
  dbCtx.TTalhoes.Open();
  dbCtx.TTalhoes.Insert;
  inherited;
end;

procedure TfrmTalhoes.btnConfirmaClick(Sender: TObject);
begin
 if edtNome.Text.Length=0 then
 begin
   MyShowMessage('Informe o Nome!',false);
   edtNome.SetFocus;
   Exit;
 end;
 if (edtAreaHA.Text.Length=0) or (edtAreaHA.Text='0') then
 begin
   MyShowMessage('Informe a Área ha',false);
   edtNome.SetFocus;
   Exit;
 end;
 if edtSetorFazenda.Text.Length=0 then
 begin
   MyShowMessage('Informe o Setor da Fazenda!',false);
   edtSetorFazenda.SetFocus;
   Exit;
 end;

 if SwStatus.IsChecked then
  dbCtx.TTalhoesstatus.AsInteger            :=1
 else
  dbCtx.TTalhoesstatus.AsInteger            :=0;
 dbCtx.TTalhoesnome.AsString                := edtNome.Text;
 if dbCtx.TTalhoes.State=dsInsert then
 begin
  dbCtx.TTalhoesIdUsuario.AsString          := dbCtx.vIdUsuarioLogado;
  if not  dbCtx.VerificaTalhaoExiste(vIDSetorFaz,edtNome.Text) then
  begin
    MyShowMessage('Ja existe um Talhao nesse Setor com esse nome:'+edtNome.Text,false);
    Exit;
  end;
 end
 else
 begin
  dbCtx.TTalhoesIdUsuarioAlteracao.AsString := dbCtx.vIdUsuarioLogado;
  dbCtx.TTalhoesDataAlteracao.AsDateTime    := now;
  dbCtx.AlteraFlaSynAWS_ZERO('talhoes',dbCtx.TTalhoesID.AsString);
 end;
 dbCtx.TTalhoesareahe.AsString              := edtAreaHA.Text;
 dbCtx.TTalhoeslatitude.AsString            := edtLatitude.Text;
 dbCtx.TTalhoeslongitude.AsString           := edtLongitude.Text;
 dbCtx.TTalhoesidsetor.AsString             := vIDSetorFaz;
 dbCtx.TTalhoestipo.AsInteger               := cbxTipo.ItemIndex;
 dbCtx.TTalhoesobservacao.AsString          := edtObs.Text;
 try
  dbCtx.TTalhoes.ApplyUpdates(-1);
  MyShowMessage('Talhão Cadastrado com Sucesso!',false);
  dbCtx.TTalhoes.Close;
  dbCtx.TTalhoes.Open;
//  if dbCtx.vTipoBDConfig=0 then
//  TThread.CreateAnonymousThread(procedure()
//  begin
//     DataModule1.ReplicaTalhao('');
//  end).Start;
  SomarColunas;
  MudarAba(tbiLista,sender);
 except
   on E: Exception do
    myShowMessage('Erro ao salvar Talhão:'+E.Message,false);
 end;
end;

procedure TfrmTalhoes.btnDeletarClick(Sender: TObject);
begin
 if DataModule1.Sincronizando=1 then
 begin
   MyShowMessage('Aguarde Sincronizando Dados!',false);
   Exit;
 end;
 MyShowMessage('Deseja Realmente Deletar esse registro?',true);
 case frmPrincipal.vMsgConfirma of
   1:begin
      dbCtx.TTalhoes.Edit;
      dbCtx.TTalhoesStatus.AsInteger := -1;
      dbCtx.TTalhoesIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
      dbCtx.TTalhoesDataAlteracao.AsDateTime     := now;
      dbCtx.AlteraFlaSynAWS_ZERO('talhoes',dbCtx.TTalhoesID.AsString);
      try
        dbCtx.TTalhoes.ApplyUpdates(-1);
        MyShowMessage('Registro Excluido com sucesso!',false);
        dbCtx.TTalhoes.Close;
        dbCtx.TTalhoes.Open();
//        if dbCtx.vTipoBDConfig=0 then
//        TThread.CreateAnonymousThread(procedure()
//        begin
//           DataModule1.ReplicaTalhao('');
//        end).Start;
        SomarColunas;
      except
       on E : Exception do
        ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
      end;
   end;
 end;
end;

procedure TfrmTalhoes.btnEditarClick(Sender: TObject);
begin
  if DataModule1.Sincronizando=1 then
  begin
    MyShowMessage('Aguarde Sincronizando Dados!',false);
    Exit;
  end;
  dbCtx.TTalhoes.Edit;
  edtNome.Text         := dbCtx.TTalhoesnome.AsString;
  edtSetorFazenda.Text := dbCtx.TTalhoessetor.AsString;
  edtAreaHA.Text       := dbCtx.TTalhoesareahe.AsString;
  edtLatitude.Text     := dbCtx.TTalhoeslatitude.AsString;
  edtLongitude.Text    := dbCtx.TTalhoeslongitude.AsString;
  SwStatus.IsChecked   := dbCtx.TTalhoesstatus.AsInteger=1;
  vIDSetorFaz          := dbCtx.TTalhoesidsetor.AsString;
  cbxTipo.ItemIndex    := dbCtx.TTalhoestipo.AsInteger;
  edtObs.Text          := dbCtx.TTalhoesobservacao.AsString;
  if dbCtx.TTalhoesstatus.AsInteger=0 then
   SwStatus.IsChecked := false;
  inherited;
end;

procedure TfrmTalhoes.btnFecharClick(Sender: TObject);
begin
  if DataModule1.Sincronizando=1 then
  begin
    MyShowMessage('Aguarde Sincronizando Dados!',false);
    Exit;
  end;
  inherited;
end;

procedure TfrmTalhoes.cbxTipofChange(Sender: TObject);
begin
 Filtro;
end;

procedure TfrmTalhoes.EditButton5Click(Sender: TObject);
begin
  frmSetores := TfrmSetores.Create(Self);
  try
    frmSetores.ShowModal;
  finally
    vIDSetorFaz            := dbCtx.TSetoresid.AsString;
    edtSetorFazenda.Text   := dbCtx.TSetoresnome.AsString;
    frmSetores.Free;
  end;
end;

procedure TfrmTalhoes.edtNomeFiltroChangeTracking(Sender: TObject);
begin
  Filtro;
end;

procedure TfrmTalhoes.edtSetorFChangeTracking(Sender: TObject);
begin
  Filtro;
end;

procedure TfrmTalhoes.Filtro;
var
 vFiltro:string;
 vFiltrado:integer;
begin
 vFiltrado :=0;
 vFiltro   :='';
 if edtNomeFiltro.Text.Length>0 then
 begin
   vFiltro :='NOME LIKE '+QuotedStr('%'+edtNomeFiltro.Text+'%');
   vFiltrado :=1;
 end;

 if edtSetorF.Text.Length>0 then
 begin
   if vFiltrado=1 then
    vFiltro :=vFiltro+' AND SETOR LIKE '+QuotedStr('%'+edtSetorF.Text+'%')
   else
    vFiltro :='SETOR LIKE '+QuotedStr('%'+edtSetorF.Text+'%');
    vFiltrado :=1;
 end;

 if cbxTipof.ItemIndex>0 then
 begin
   if vFiltrado=1 then
    vFiltro :=vFiltro+' AND TIPO='+intToStr(cbxTipof.ItemIndex-1)
   else
    vFiltro :='TIPO='+intToStr(cbxTipof.ItemIndex-1);
    vFiltrado :=1;
 end;
 if vFiltrado=1 then
 begin
   dbCtx.TTalhoes.Filtered := false;
   dbCtx.TTalhoes.Filter   := vFiltro;
   dbCtx.TTalhoes.Filtered := true;
 end
 else
 begin
   dbCtx.TTalhoes.Filtered := false;
   dbCtx.TTalhoes.Close;
   dbCtx.TTalhoes.Open;
 end;
 SomarColunas;
end;

procedure TfrmTalhoes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmPrincipal.vTSelectTalhao:=1;
  inherited;
end;

procedure TfrmTalhoes.FormShow(Sender: TObject);
begin
  vSelected :=0;
  dbCtx.TTalhoes.Close;
  dbCtx.TTalhoes.Open;
  SomarColunas;
  if dbCtx.TPluviometroTalhoes.State=dsInsert then
  begin
    edtSetorF.Text     := dbCtx.TPluviometrossetor.AsString;
    edtSetorF.Enabled  := false;
    Filtro;
  end
  else
  begin
   edtSetorF.Text     := '';
   edtSetorF.Enabled  := true;
   Filtro;
  end;
  vID:='';
  StringGrid1.Columns[0].Visible :=  frmPrincipal.vTSelectTalhao=1;
  inherited;
end;

procedure TfrmTalhoes.LimpaCampos;
begin
  edtNome.Text         :='';
  edtSetorFazenda.Text := '';
  edtAreaHA.Text       := '';
  edtLatitude.Text     := '';
  edtLongitude.Text    := '';
  SwStatus.IsChecked   := true;
  cbxTipo.ItemIndex    :=0;
  edtObs.Text          :='';
end;

procedure TfrmTalhoes.SomarColunas;
var
  Sum : Double;
  Val : Double;
  I   : Integer;
begin
  Sum := 0;
  I   := 0;
  for I := 0 to StringGrid1.RowCount-1 do
  begin
   if TryStrToFloat(StringGrid1.Cells[4,I],Val) then
    Sum := Sum + Val;
  end;
  if I>0 then
    lblAreaTotalGrid.Text         := 'Total(ha):'+FormatFloat('####,##.00',Sum)
  else
    lblAreaTotalGrid.Text     := 'Total(ha): 0.00';
  lblTotalRegistro.Text       := intToStr(StringGrid1.RowCount)
end;

procedure TfrmTalhoes.StringGrid1CellClick(const Column: TColumn;
  const Row: Integer);
begin
  inherited;
  vID := dbCtx.TTalhoesid.AsString;
end;

procedure TfrmTalhoes.StringGrid1CellDblClick(const Column: TColumn;
  const Row: Integer);
begin
 if StringGrid1.ColumnIndex<>0 then
   Close
 else
  vSelected :=1
end;

procedure TfrmTalhoes.StringGrid1SelChanged(Sender: TObject);
begin
 vID := dbCtx.TTalhoesid.AsString;
end;

end.
