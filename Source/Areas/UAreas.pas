unit UAreas;

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
  TfrmAreas = class(TfrmCadPadrao)
    BindSourceDB1: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    BindingsList1: TBindingsList;
    Label4: TLabel;
    edtNome: TEdit;
    Layout1: TLayout;
    Rectangle2: TRectangle;
    Layout2: TLayout;
    edtResponsavel: TEdit;
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
    edtLatitude: TEdit;
    Label7: TLabel;
    edtLongitude: TEdit;
    lblStatus: TLabel;
    SwStatus: TSwitch;
    lblAreaTotalGrid: TLabel;
    procedure SwStatusSwitch(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnConfirmaClick(Sender: TObject);
    procedure edtNomeFiltroChangeTracking(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EditButton5Click(Sender: TObject);
    procedure StringGrid1CellDblClick(const Column: TColumn;
      const Row: Integer);
    procedure btnFecharClick(Sender: TObject);
  private
    vIDResponsavel:string;
    procedure LimpaCampos;
    procedure SomarColunas;
  public
    { Public declarations }
  end;

var
  frmAreas: TfrmAreas;

implementation

{$R *.fmx}

uses DataContext, UPrincipal, UAuxCultura, UUsuarios, dmReplicacao;

{ TfrmAreas }

procedure TfrmAreas.btnAddClick(Sender: TObject);
begin
  if DataModule1.Sincronizando=1 then
  begin
    MyShowMessage('Aguarde Sincronizando Dados!',false);
    Exit;
  end;
  LimpaCampos;
  dbCtx.TAreas.Close;
  dbCtx.TAreas.Open();
  dbCtx.TAreas.Insert;
  inherited;
end;

procedure TfrmAreas.btnConfirmaClick(Sender: TObject);
begin
 if edtNome.Text.Length=0 then
 begin
   MyShowMessage('Informe o Nome!',false);
   edtNome.SetFocus;
   Exit;
 end;
 if (edtAreaHA.Text.Length=0) or (edtAreaHA.Text='0') then
 begin
   MyShowMessage('Informe a Area!',false);
   edtNome.SetFocus;
   Exit;
 end;
 if edtResponsavel.Text.Length=0 then
 begin
   MyShowMessage('Informe o Responsavel!',false);
   edtResponsavel.SetFocus;
   Exit;
 end;
 if SwStatus.IsChecked then
  dbCtx.TAreasstatus.AsInteger            :=1
 else
  dbCtx.TAreasstatus.AsInteger            :=0;
 dbCtx.TAreasnome.AsString                := edtNome.Text;
 if dbCtx.TAreas.State=dsInsert then
 begin
  dbCtx.TAreasIdUsuario.AsString          := dbCtx.vIdUsuarioLogado;
  if not dbCtx.VerificaCadastroExiste('NOME','areas',edtNome.Text) then
  begin
   MyShowMessage('Ja existe uma Area com esse nome:'+edtNome.Text,false);
   Exit;
  end;
 end
 else
 begin
  dbCtx.TAreasIdUsuarioAlteracao.AsString := dbCtx.vIdUsuarioLogado;
  dbCtx.TAreasDataAlteracao.AsDateTime    := now;
  dbCtx.AlteraFlaSynAWS_ZERO('areas',dbCtx.TAreasID.AsString);
 end;
 dbCtx.TAreasareahe.AsString              := edtAreaHA.Text;
 dbCtx.TAreaslatitude.AsString            := edtLatitude.Text;
 dbCtx.TAreaslongitude.AsString           := edtLongitude.Text;
 dbCtx.TAreasidresponsavel.AsString       := vIDResponsavel;

 try
  dbCtx.TAreas.ApplyUpdates(-1);
  MyShowMessage('Area Cadastrado com Sucesso!',false);
  dbCtx.TAreas.Close;
  dbCtx.TAreas.Open;
//  if dbCtx.vTipoBDConfig=0 then
//   TThread.CreateAnonymousThread(procedure()
//   begin
//     DataModule1.ReplicaAreas('');
//   end).Start;
  SomarColunas;
  MudarAba(tbiLista,sender);
 except
   on E: Exception do
    myShowMessage('Erro ao salvar Area:'+E.Message,false);
 end;
end;

procedure TfrmAreas.btnDeletarClick(Sender: TObject);
begin
  if DataModule1.Sincronizando=1 then
  begin
    MyShowMessage('Aguarde Sincronizando Dados!',false);
    Exit;
  end;
   MyShowMessage('Deseja Realmente Deletar esse registro?',true);
   case frmPrincipal.vMsgConfirma of
     1:begin
        dbCtx.TAreas.Edit;
        dbCtx.TAreasStatus.AsInteger := -1;
        dbCtx.TAreasIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
        dbCtx.TAreasDataAlteracao.AsDateTime     := now;
        dbCtx.AlteraFlaSynAWS_ZERO('areas',dbCtx.TAreasID.AsString);
        try
          dbCtx.TAreas.ApplyUpdates(-1);
          MyShowMessage('Registro Excluido com sucesso!',false);
          dbCtx.TAreas.Close;
          dbCtx.TAreas.Open();
//          if dbCtx.vTipoBDConfig=0 then
//           TThread.CreateAnonymousThread(procedure()
//           begin
//            DataModule1.ReplicaAreas('');
//           end).Start;
          SomarColunas;
        except
         on E : Exception do
          ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
        end;
     end;
   end;
end;

procedure TfrmAreas.btnEditarClick(Sender: TObject);
begin
  if DataModule1.Sincronizando=1 then
  begin
    MyShowMessage('Aguarde Sincronizando Dados!',false);
    Exit;
  end;
  dbCtx.TAreas.Edit;
  edtNome.Text        := dbCtx.TAreasnome.AsString;
  edtResponsavel.Text := dbCtx.TAreasresponsavel.AsString;
  edtAreaHA.Text      := dbCtx.TAreasareahe.AsString;
  edtLatitude.Text    := dbCtx.TAreaslatitude.AsString;
  edtLongitude.Text   := dbCtx.TAreaslongitude.AsString;
  SwStatus.IsChecked  := dbCtx.TAreasstatus.AsInteger=1;
  vIDResponsavel      := dbCtx.TAreasidresponsavel.AsString;
  if dbCtx.TAreasstatus.AsInteger=0 then
   SwStatus.IsChecked := false;
  inherited;
end;

procedure TfrmAreas.btnFecharClick(Sender: TObject);
begin
  if DataModule1.Sincronizando=1 then
  begin
    MyShowMessage('Aguarde Sincronizando Dados!',false);
    Exit;
  end;
  inherited;
end;

procedure TfrmAreas.EditButton5Click(Sender: TObject);
begin
  frmUsuarios := TfrmUsuarios.Create(Self);
  try
    frmUsuarios.ShowModal;
  finally
    vIDResponsavel        := dbCtx.TUsuarioid.AsString;
    edtResponsavel.Text   := dbCtx.TUsuarionome.AsString;
    frmUsuarios.Free;
  end;
end;

procedure TfrmAreas.edtNomeFiltroChangeTracking(Sender: TObject);
begin
 if edtNomeFiltro.Text.Length>0 then
 begin
   dbCtx.TAreas.Filtered := false;
   dbCtx.TAreas.Filter   := 'NOME LIKE '+QuotedStr('%'+edtNomeFiltro.Text+'%');
   dbCtx.TAreas.Filtered := true;
 end
 else
 begin
   dbCtx.TAreas.Filtered := false;
   dbCtx.TAreas.Close;
   dbCtx.TAreas.Open;
 end;
 SomarColunas;
end;

procedure TfrmAreas.FormShow(Sender: TObject);
begin
  dbCtx.TAreas.Close;
  dbCtx.TAreas.Open();
  SomarColunas;
  inherited;
end;

procedure TfrmAreas.LimpaCampos;
begin
  edtNome.Text        :='';
  edtResponsavel.Text := '';
  edtAreaHA.Text      := '';
  edtLatitude.Text    := '';
  edtLongitude.Text   := '';
  SwStatus.IsChecked  := true;
end;

procedure TfrmAreas.SomarColunas;
var
  Sum : Double;
  Val : Double;
  I   : Integer;
begin
  Sum := 0;
  I   := 0;
  for I := 0 to StringGrid1.RowCount-1 do
  begin
   if TryStrToFloat(StringGrid1.Cells[2,I],Val) then
    Sum := Sum + Val;
  end;
  if I>0 then
    lblAreaTotalGrid.Text     := 'Total(ha):'+FormatFloat('####,##.00',Sum)
  else
    lblAreaTotalGrid.Text     := 'Total(ha):0.00';
  lblTotalRegistro.Text       := intToStr(StringGrid1.RowCount)
end;

procedure TfrmAreas.StringGrid1CellDblClick(const Column: TColumn;
  const Row: Integer);
begin
 Close;
end;

procedure TfrmAreas.SwStatusSwitch(Sender: TObject);
begin
  if SwStatus.IsChecked then
  lblStatus.Text:='Ativo'
 else
  lblStatus.Text:='Inativo';
end;

end.
