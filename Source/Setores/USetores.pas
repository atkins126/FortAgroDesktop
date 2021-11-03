unit USetores;

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
  TfrmSetores = class(TfrmCadPadrao)
    BindSourceDB1: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    BindingsList1: TBindingsList;
    Layout2: TLayout;
    edtAreaFazenda: TEdit;
    EditButton5: TEditButton;
    Layout3: TLayout;
    Label5: TLabel;
    Label6: TLabel;
    edtAreaHA: TEdit;
    Layout4: TLayout;
    Rectangle3: TRectangle;
    Layout6: TLayout;
    Layout7: TLayout;
    Label8: TLabel;
    Label7: TLabel;
    lblStatus: TLabel;
    edtLatitude: TEdit;
    edtLongitude: TEdit;
    SwStatus: TSwitch;
    Layout1: TLayout;
    Rectangle2: TRectangle;
    Layout8: TLayout;
    Label4: TLabel;
    edtNome: TEdit;
    lblAreaTotalGrid: TLabel;
    lbllllb: TLabel;
    edtAreaFazF: TEdit;
    procedure EditButton5Click(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnConfirmaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure StringGrid1CellDblClick(const Column: TColumn;
      const Row: Integer);
    procedure edtNomeFiltroChangeTracking(Sender: TObject);
    procedure edtAreaFazFChangeTracking(Sender: TObject);
  private
    vIDAreaFaz:string;
    procedure LimpaCampos;
    procedure SomarColunas;
    procedure Filtro;
  public
    { Public declarations }
  end;

var
  frmSetores: TfrmSetores;

implementation

{$R *.fmx}

uses DataContext, UPrincipal, UAreas, dmReplicacao;

procedure TfrmSetores.btnAddClick(Sender: TObject);
begin
  LimpaCampos;
  dbCtx.TSetores.Close;
  dbCtx.TSetores.Open();
  dbCtx.TSetores.Insert;
  inherited;
end;

procedure TfrmSetores.btnConfirmaClick(Sender: TObject);
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
 if edtAreaFazenda.Text.Length=0 then
 begin
   MyShowMessage('Informe a Área da Fazenda!',false);
   edtAreaFazenda.SetFocus;
   Exit;
 end;
 if SwStatus.IsChecked then
  dbCtx.TSetoresstatus.AsInteger            :=1
 else
  dbCtx.TSetoresstatus.AsInteger            :=0;
 dbCtx.TSetoresnome.AsString                := edtNome.Text;
 if dbCtx.TSetores.State=dsInsert then
 begin
  dbCtx.TSetoresIdUsuario.AsString          := dbCtx.vIdUsuarioLogado;
  if not dbCtx.VerificaSetorExiste(vIDAreaFaz,edtNome.Text) then
  begin
    MyShowMessage('Ja existe um Setor nessa Área com esse nome:'+edtNome.Text,false);
    Exit;
  end;
 end
 else
 begin
  dbCtx.TSetoresIdUsuarioAlteracao.AsString := dbCtx.vIdUsuarioLogado;
  dbCtx.TSetoresDataAlteracao.AsDateTime    := now;
  dbCtx.AlteraFlaSynAWS_ZERO('setor',dbCtx.TSetoresID.AsString);
 end;
 dbCtx.TSetoresareahe.AsString              := edtAreaHA.Text;
 dbCtx.TSetoreslatitude.AsString            := edtLatitude.Text;
 dbCtx.TSetoreslongitude.AsString           := edtLongitude.Text;
 dbCtx.TSetoresidarea.AsString              := vIDAreaFaz;
 try
  dbCtx.TSetores.ApplyUpdates(-1);
  MyShowMessage('Setor Cadastrado com Sucesso!',false);
//  if dbCtx.vTipoBDConfig=0 then
//  TThread.CreateAnonymousThread(procedure()
//  begin
//     DataModule1.ReplicaSetor('');
//  end).Start;
  dbCtx.TSetores.Close;
  dbCtx.TSetores.Open;
  SomarColunas;
  MudarAba(tbiLista,sender);
 except
   on E: Exception do
    myShowMessage('Erro ao salvar Setor:'+E.Message,false);
 end;
end;

procedure TfrmSetores.btnDeletarClick(Sender: TObject);
begin
 MyShowMessage('Deseja Realmente Deletar esse registro?',true);
 case frmPrincipal.vMsgConfirma of
   1:begin
      dbCtx.TSetores.Edit;
      dbCtx.TSetoresStatus.AsInteger := -1;
      dbCtx.TSetoresIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
      dbCtx.TSetoresDataAlteracao.AsDateTime     := now;
      dbCtx.AlteraFlaSynAWS_ZERO('setor',dbCtx.TSetoresID.AsString);
      try
        dbCtx.TSetores.ApplyUpdates(-1);
        MyShowMessage('Registro Excluido com sucesso!',false);
        dbCtx.TSetores.Close;
        dbCtx.TSetores.Open();
//        if dbCtx.vTipoBDConfig=0 then
//         TThread.CreateAnonymousThread(procedure()
//         begin
//           DataModule1.ReplicaSetor('');
//         end).Start;
        SomarColunas;
      except
       on E : Exception do
        ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
      end;
   end;
 end;
end;

procedure TfrmSetores.btnEditarClick(Sender: TObject);
begin
  dbCtx.TSetores.Edit;
  edtNome.Text        := dbCtx.TSetoresnome.AsString;
  edtAreaFazenda.Text := dbCtx.TSetoresareanome.AsString;
  edtAreaHA.Text      := dbCtx.TSetoresareahe.AsString;
  edtLatitude.Text    := dbCtx.TSetoreslatitude.AsString;
  edtLongitude.Text   := dbCtx.TSetoreslongitude.AsString;
  SwStatus.IsChecked  := dbCtx.TSetoresstatus.AsInteger=1;
  vIDAreaFaz          := dbCtx.TSetoresidarea.AsString;
  if dbCtx.TSetoresstatus.AsInteger=0 then
   SwStatus.IsChecked := false;
  inherited;
end;

procedure TfrmSetores.EditButton5Click(Sender: TObject);
begin
 frmAreas := TfrmAreas.Create(Self);
  try
    frmAreas.ShowModal;
  finally
    vIDAreaFaz            := dbCtx.TAreasid.AsString;
    edtAreaFazenda.Text   := dbCtx.TAreasnome.AsString;
    frmAreas.Free;
  end;
end;

procedure TfrmSetores.edtAreaFazFChangeTracking(Sender: TObject);
begin
  Filtro;
end;

procedure TfrmSetores.edtNomeFiltroChangeTracking(Sender: TObject);
begin
  Filtro;
end;

procedure TfrmSetores.Filtro;
var
 vFiltro:string;
 vFiltrado:integer;
begin
 vFiltrado :=0;
 if edtNomeFiltro.Text.Length>0 then
 begin
   vFiltro :='NOME LIKE '+QuotedStr('%'+edtNomeFiltro.Text+'%');
   vFiltrado :=1;
 end
 else
 begin
   if vFiltrado=1 then
    vFiltro :=vFiltro+' AND AREANOME LIKE '+QuotedStr('%'+edtAreaFazF.Text+'%')
   else
    vFiltro :='AREANOME LIKE '+QuotedStr('%'+edtAreaFazF.Text+'%');
    vFiltrado :=1;
 end;
 if vFiltrado=1 then
 begin
   dbCtx.TSetores.Filtered := false;
   dbCtx.TSetores.Filter   := vFiltro;
   dbCtx.TSetores.Filtered := true;
 end
 else
 begin
   dbCtx.TSetores.Filtered := false;
   dbCtx.TSetores.Close;
   dbCtx.TSetores.Open;
 end;
 SomarColunas;
end;

procedure TfrmSetores.FormShow(Sender: TObject);
begin
  dbCtx.TSetores.Close;
  dbCtx.TSetores.Open;
  SomarColunas;
  inherited;
end;

procedure TfrmSetores.LimpaCampos;
begin
  edtNome.Text        :='';
  edtAreaFazenda.Text := '';
  edtAreaHA.Text      := '';
  edtLatitude.Text    := '';
  edtLongitude.Text   := '';
  SwStatus.IsChecked  := true;
end;

procedure TfrmSetores.SomarColunas;
var
  Sum : Double;
  Val : Double;
  I   : Integer;
begin
  Sum := 0;
  I   := 0;
  for I := 0 to StringGrid1.RowCount-1 do
  begin
   if TryStrToFloat(StringGrid1.Cells[3,I],Val) then
    Sum := Sum + Val;
  end;
  if I>0 then
    lblAreaTotalGrid.Text         := 'Total(ha):'+FormatFloat('####,##.00',Sum)
  else
    lblAreaTotalGrid.Text     := 'Total(ha): 0.00';
  lblTotalRegistro.Text       := intToStr(StringGrid1.RowCount)
end;

procedure TfrmSetores.StringGrid1CellDblClick(const Column: TColumn;
  const Row: Integer);
begin
 Close;
end;

end.
