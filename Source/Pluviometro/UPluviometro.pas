unit UPluviometro;

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
  FMX.DateTimeCtrls,Winapi.Windows;

type
  TfrmPluviometro = class(TfrmCadPadrao)
    BindSourceDB1: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    BindingsList1: TBindingsList;
    Layout8: TLayout;
    Label4: TLabel;
    edtNome: TEdit;
    Layout1: TLayout;
    Rectangle1: TRectangle;
    Layout2: TLayout;
    Layout3: TLayout;
    edtSetorFazenda: TEdit;
    EditButton5: TEditButton;
    Layout4: TLayout;
    Label5: TLabel;
    Layout6: TLayout;
    Rectangle3: TRectangle;
    Layout7: TLayout;
    Layout9: TLayout;
    Label8: TLabel;
    Label7: TLabel;
    lblStatus: TLabel;
    edtLatitude: TEdit;
    edtLongitude: TEdit;
    SwStatus: TSwitch;
    Label6: TLabel;
    edtSetorFiltro: TEdit;
    Layout10: TLayout;
    Rectangle2: TRectangle;
    btnAdicionarTalhao: TRectangle;
    Image8: TImage;
    Label11: TLabel;
    btnExcluirTalhao: TRectangle;
    Image10: TImage;
    Excluir: TLabel;
    gridTalhoes: TStringGrid;
    BindSourceDB2: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB2: TLinkGridToDataSource;
    Layout13: TLayout;
    ToolBar5: TToolBar;
    Layout11: TLayout;
    lblQtdTalhao: TLabel;
    Layout12: TLayout;
    Layout14: TLayout;
    ToolBar4: TToolBar;
    Label9: TLabel;
    btnHistChuva: TRectangle;
    Image7: TImage;
    Label10: TLabel;
    TbiHist: TTabItem;
    ToolBar6: TToolBar;
    Image9: TImage;
    Label12: TLabel;
    Image11: TImage;
    Layout15: TLayout;
    Layout16: TLayout;
    Rectangle5: TRectangle;
    Label13: TLabel;
    edtPluviometroF: TEdit;
    Label14: TLabel;
    edtSetorF: TEdit;
    StringGrid2: TStringGrid;
    ToolBar7: TToolBar;
    Layout17: TLayout;
    Label15: TLabel;
    Layout18: TLayout;
    Layout24: TLayout;
    Rectangle9: TRectangle;
    Rectangle10: TRectangle;
    Image14: TImage;
    Label20: TLabel;
    btnNewPluv: TRectangle;
    Image15: TImage;
    Label21: TLabel;
    Rectangle13: TRectangle;
    Image17: TImage;
    Label23: TLabel;
    ToolBar10: TToolBar;
    Rectangle15: TRectangle;
    Label25: TLabel;
    Image20: TImage;
    edtTalhaoF: TEdit;
    Label16: TLabel;
    layNewPluv: TLayout;
    Rectangle6: TRectangle;
    ToolBar8: TToolBar;
    Rectangle7: TRectangle;
    Label17: TLabel;
    Image13: TImage;
    Layout20: TLayout;
    Layout21: TLayout;
    Rectangle8: TRectangle;
    Layout22: TLayout;
    Layout23: TLayout;
    edtPluviometro: TEdit;
    SearchEditButton1: TSearchEditButton;
    ClearEditButton1: TClearEditButton;
    Label18: TLabel;
    Layout25: TLayout;
    Rectangle14: TRectangle;
    Layout26: TLayout;
    Layout27: TLayout;
    Label19: TLabel;
    Label24: TLabel;
    Label26: TLabel;
    edtDataColeta: TDateEdit;
    edtHoraColeta: TTimeEdit;
    edtVolumeChuva: TEdit;
    Layout28: TLayout;
    btnConfirmaPluvi: TRectangle;
    Label28: TLabel;
    Image21: TImage;
    GroupBox1: TGroupBox;
    Label22: TLabel;
    Label27: TLabel;
    edtDataInicio: TDateEdit;
    edtDataFim: TDateEdit;
    btnMapa: TRectangle;
    Image16: TImage;
    Label29: TLabel;
    btnRelChuva: TRectangle;
    Image18: TImage;
    Label30: TLabel;
    BindSourceDB3: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB3: TLinkGridToDataSource;
    Label31: TLabel;
    edtAreaF: TEdit;
    brtReportResumo: TRectangle;
    Image12: TImage;
    Label32: TLabel;
    procedure EditButton5Click(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAdicionarTalhaoClick(Sender: TObject);
    procedure StringGrid1CellClick(const Column: TColumn; const Row: Integer);
    procedure StringGrid1SelChanged(Sender: TObject);
    procedure btnExcluirTalhaoClick(Sender: TObject);
    procedure btnHistChuvaClick(Sender: TObject);
    procedure StringGrid1CellDblClick(const Column: TColumn;
      const Row: Integer);
    procedure edtVolumeChuvaKeyUp(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure btnNewPluvClick(Sender: TObject);
    procedure btnConfirmaPluviClick(Sender: TObject);
    procedure SearchEditButton1Click(Sender: TObject);
    procedure Image13Click(Sender: TObject);
    procedure edtPluviometroFChangeTracking(Sender: TObject);
    procedure edtSetorFChangeTracking(Sender: TObject);
    procedure edtTalhaoFChangeTracking(Sender: TObject);
    procedure edtDataInicioCheckChanged(Sender: TObject);
    procedure edtDataFimCheckChanged(Sender: TObject);
    procedure edtDataFimChange(Sender: TObject);
    procedure edtDataInicioChange(Sender: TObject);
    procedure edtSetorFiltroChangeTracking(Sender: TObject);
    procedure btnMapaClick(Sender: TObject);
    procedure btnRelChuvaClick(Sender: TObject);
    procedure edtVolumeChuvaKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure brtReportResumoClick(Sender: TObject);
  private
    vIDSetor,vidTalhao:string;
    procedure LimpaCampos;
    procedure Filtro;
    procedure FiltroPluviometria;
  public
    vIdPluviometro :string;
  end;

var
  frmPluviometro: TfrmPluviometro;

implementation

{$R *.fmx}

uses DataContext, UPrincipal, USetores, UTalhoes, UdmReport, UDmReports;

procedure TfrmPluviometro.brtReportResumoClick(Sender: TObject);
begin
 dmRel.ppRelChuvaMed.Print;
end;

procedure TfrmPluviometro.btnAddClick(Sender: TObject);
begin
 LimpaCampos;
 dbCtx.TPluviometros.Close;
 dbCtx.TPluviometros.Open();
 dbCtx.TPluviometros.Insert;
 inherited;
end;

procedure TfrmPluviometro.btnAdicionarTalhaoClick(Sender: TObject);
begin
  dbCtx.TPluviometroTalhoes.Insert;
  frmTalhoes := TfrmTalhoes.Create(Self);
  try
    frmTalhoes.ShowModal;
  finally
    vidTalhao                     := frmTalhoes.vID;
    frmTalhoes.Free;
  end;
  if vidTalhao.Length>0 then
  begin
    if not dbCtx.VerificaTalhaoPluviometro(dbCtx.TPluviometrosid.AsString,vidTalhao)then
    begin
      MyShowMessage('Talhão ja adicionado nesse pluviometro',false);
      dbCtx.TPluviometroTalhoes.Close;
      dbCtx.TPluviometroTalhoes.Open();
      Exit;
    end;
    if not dbCtx.VerificaTalhaoPluviAdicionado(vidTalhao)then
    begin
      MyShowMessage('Talhão ja Pertence a outro pluviometro',false);
      dbCtx.TPluviometroTalhoes.Close;
      dbCtx.TPluviometroTalhoes.Open();
      Exit;
    end;
    dbCtx.TPluviometroTalhoesidusuario.AsString     := dbCtx.vIdUsuarioLogado;
    dbCtx.TPluviometroTalhoesidpluviometro.AsString := dbCtx.TPluviometrosid.AsString;
    dbCtx.TPluviometroTalhoesidtalhao.AsString      := vidTalhao;
    try
     dbCtx.TPluviometroTalhoes.ApplyUpdates(-1);
     dbCtx.AbreTalhoesPluvi(dbCtx.TPluviometrosid.AsString);
    except
     on E : Exception do
      ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
    end;
  end
  else
  begin
    dbCtx.TPluviometroTalhoes.Close;
    dbCtx.TPluviometroTalhoes.Open();
  end;
end;

procedure TfrmPluviometro.btnConfirmaPluviClick(Sender: TObject);
var
 vQryAux:TFDQuery;
begin
  vQryAux:=TFDQuery.Create(nil);
  vQryAux.Connection := dbCtx.FDConPG;
  if edtPluviometro.Text.Length=0 then
  begin
    MyShowMessage('Informe o Pluviometro!!',false);
    Exit;
  end;
  if not dbCtx.VerificaExistePluviometria(edtDataColeta.Text,vIdPluviometro) then
  begin
    MyShowMessage('ja Existe um volume de chuva lançado nesse data!!',false);
    Exit;
  end;
  with vQryAux,vQryAux.SQL do
  begin
    Clear;
    Add('select * from pluviometrotalhoes');
    Add('where status=1 and idpluviometro='+vIdPluviometro);
    Open;
    try
    while not vQryAux.eof do
    begin
     dbCtx.TPluviometria.Close;
     dbCtx.TPluviometria.Open;
     dbCtx.TPluviometria.Insert;
     dbCtx.TPluviometriaidusuario.AsString     := dbCtx.vIdUsuarioLogado;
     dbCtx.TPluviometriaidpluviometro.AsString := vIdPluviometro;
     dbCtx.TPluviometriaidtalhao.AsString      := vQryAux.FieldByName('idtalhao').AsString;
     dbCtx.TPluviometriadatacoleta.AsDateTime  := edtDataColeta.Date;
     dbCtx.TPluviometriahora.AsDateTime        := edtDataColeta.DateTime;
     dbCtx.TPluviometriavolumemm.AsFloat       := strToFloat(edtVolumeChuva.Text);
     dbCtx.TPluviometria.ApplyUpdates(-1);
     vQryAux.Next;
    end;
    myShowMessage('Dados Registrados com sucesso!',false);
    dbCtx.AbrePluviometria('');
    layNewPluv.Visible := false;
   except
   on E: Exception do
    myShowMessage('Erro ao salvar Pluviometro:'+E.Message,false);
   end;
  end;
  vQryAux.Free;
end;

procedure TfrmPluviometro.btnDeletarClick(Sender: TObject);
begin
 MyShowMessage('Deseja Realmente Deletar esse Pluviometro?',true);
 case frmPrincipal.vMsgConfirma of
   1:begin
      dbCtx.TPluviometros.Edit;
      dbCtx.TPluviometrosStatus.AsInteger := -1;
      dbCtx.TPluviometrosIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
      dbCtx.TPluviometrosDataAlteracao.AsDateTime     := now;
      dbCtx.AlteraFlaSynAWS_ZERO('Pluviometro',dbCtx.TPluviometrosID.AsString);
      try
        dbCtx.TPluviometros.ApplyUpdates(-1);
        MyShowMessage('Registro Excluido com sucesso!',false);
        dbCtx.TPluviometros.Close;
        dbCtx.TPluviometros.Open();
        lblTotalRegistro.Text := intToStr(dbCtx.TPluviometros.RecordCount);
        lblQtdTalhao.Text     := intToStr(dbCtx.TPluviometroTalhoes.RecordCount);
        if dbCtx.vTipoBDConfig=2 then
         TThread.CreateAnonymousThread(procedure()
         begin
//           DataModule1.ReplicaSetor('');
         end).Start;
      except
       on E : Exception do
        ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
      end;
   end;
 end;

end;

procedure TfrmPluviometro.btnEditarClick(Sender: TObject);
begin
  dbCtx.TPluviometros.Edit;
  edtNome.Text          := dbCtx.TPluviometrosnome.AsString;
  edtLatitude.Text      := dbCtx.TPluviometroslatitude.AsString;
  edtLongitude.Text     := dbCtx.TPluviometroslongitude.AsString;
  vIDSetor              := dbCtx.TPluviometrosidsetor.AsString;
  edtSetorFazenda.Text  := dbCtx.TPluviometrossetor.AsString;
  inherited;
end;

procedure TfrmPluviometro.btnExcluirTalhaoClick(Sender: TObject);
begin
 MyShowMessage('Deseja Realmente Deletar esse Talhão?',true);
 case frmPrincipal.vMsgConfirma of
   1:begin
      dbCtx.TPluviometroTalhoes.Edit;
      dbCtx.TPluviometroTalhoesStatus.AsInteger := -1;
      dbCtx.TPluviometroTalhoesIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
      dbCtx.TPluviometroTalhoesDataAlteracao.AsDateTime     := now;
      dbCtx.AlteraFlaSynAWS_ZERO('PluviometroTalhoes',dbCtx.TPluviometroTalhoesid.AsString);
      try
        dbCtx.TPluviometroTalhoes.ApplyUpdates(-1);
        MyShowMessage('Registro Excluido com sucesso!',false);
        dbCtx.AbreTalhoesPluvi(dbCtx.TPluviometrosid.AsString);
        lblTotalRegistro.Text := intToStr(dbCtx.TPluviometros.RecordCount);
        lblQtdTalhao.Text     := intToStr(dbCtx.TPluviometroTalhoes.RecordCount);
        if dbCtx.vTipoBDConfig=2 then
         TThread.CreateAnonymousThread(procedure()
         begin
//           DataModule1.ReplicaSetor('');
         end).Start;
      except
       on E : Exception do
        ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
      end;
   end;
 end;
end;

procedure TfrmPluviometro.btnNewPluvClick(Sender: TObject);
begin
 edtPluviometro.Text := '';
 edtVolumeChuva.Text := '0';
 edtDataColeta.Date  := date;
 edtHoraColeta.Time  := now;
 layNewPluv.Visible  := true;
end;

procedure TfrmPluviometro.btnRelChuvaClick(Sender: TObject);
begin
 dmRel.ReportPluviometria.Print;
end;

procedure TfrmPluviometro.btnSalvarClick(Sender: TObject);
begin
  if edtNome.Text.Length=0 then
  begin
    MyShowMessage('Informe o Nome!!',false);
    Exit;
  end;
  if not dbCtx.VerificaExisteGenerico('Pluviometro', 'nome',edtNome.Text) then
  begin
    MyShowMessage('ja Existe um Pluviometro com esse Nome!!',false);
    Exit;
  end;
  if edtSetorFazenda.Text.Length=0 then
  begin
    MyShowMessage('Informe o Setor!!',false);
    Exit;
  end;
  if dbCtx.TPluviometros.State=dsInsert then
   dbCtx.TPluviometrosidusuario.AsString := dbCtx.vIdUsuarioLogado
  else
  begin
    dbCtx.TPluviometrosidusuarioalteracao.AsString := dbCtx.vIdUsuarioLogado;
    dbCtx.TPluviometrosdataalteracao.AsDateTime    := now;
    dbCtx.AlteraFlaSynAWS_ZERO('Pluviometro',dbCtx.TPluviometrosID.AsString);
  end;
  dbCtx.TPluviometrosnome.AsString := edtNome.Text;
  if edtLatitude.Text.Length>0 then
   dbCtx.TPluviometroslatitude.AsString := edtLatitude.Text;
  if edtLongitude.Text.Length>0 then
   dbCtx.TPluviometroslongitude.AsString := edtLongitude.Text;
  if SwStatus.IsChecked then
   dbCtx.TPluviometrosstatus.AsInteger :=1
  else
   dbCtx.TPluviometrosstatus.AsInteger :=0;
  try
   dbCtx.TPluviometrosidsetor.AsString := vIDSetor ;
   dbCtx.TPluviometros.ApplyUpdates(-1);
   dbCtx.TPluviometros.Close;
   dbCtx.TPluviometros.Open;
   lblTotalRegistro.Text:= intToStr(dbCtx.TPluviometros.RecordCount);
   inherited;

  except
   on E: Exception do
    myShowMessage('Erro ao salvar Pluviometro:'+E.Message,false);
  end;
end;

procedure TfrmPluviometro.EditButton5Click(Sender: TObject);
begin
  frmSetores := TfrmSetores.Create(Self);
  try
    frmSetores.ShowModal;
  finally
    vIDSetor              := dbCtx.TSetoresid.AsString;
    edtSetorFazenda.Text  := dbCtx.TSetoresnome.AsString;
    frmSetores.Free;
  end;
end;

procedure TfrmPluviometro.edtDataFimChange(Sender: TObject);
begin
 FiltroPluviometria;
end;

procedure TfrmPluviometro.edtDataFimCheckChanged(Sender: TObject);
begin
 FiltroPluviometria;
end;

procedure TfrmPluviometro.edtDataInicioChange(Sender: TObject);
begin
 FiltroPluviometria;
end;

procedure TfrmPluviometro.edtDataInicioCheckChanged(Sender: TObject);
begin
  FiltroPluviometria;
end;

procedure TfrmPluviometro.edtPluviometroFChangeTracking(Sender: TObject);
begin
 FiltroPluviometria;
end;

procedure TfrmPluviometro.edtSetorFChangeTracking(Sender: TObject);
begin
 FiltroPluviometria;
end;

procedure TfrmPluviometro.edtSetorFiltroChangeTracking(Sender: TObject);
begin
 if edtSetorFiltro.Text.Length>0 then
 begin
   dbCtx.TPluviometros.Filtered := false;
   dbCtx.TPluviometros.Filter   := 'setor like '+QuotedStr('%'+edtSetorFiltro.Text+'%');
   dbCtx.TPluviometros.Filtered := True;
 end
 else
 begin
   dbCtx.TPluviometros.Filtered := false;
   dbCtx.TPluviometros.Close;
   dbCtx.TPluviometros.Open;
 end;
end;

procedure TfrmPluviometro.edtTalhaoFChangeTracking(Sender: TObject);
begin
 FiltroPluviometria;
end;

procedure TfrmPluviometro.edtVolumeChuvaKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
 if((keyChar in ['0'..'9',','] = false) and (word(key) <> vk_back)) then
 begin
   KeyChar := #0;
 end;
end;

procedure TfrmPluviometro.edtVolumeChuvaKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
 if ((keyChar in ['0'..'9',','] = false) and (word(key) <> vk_back)) then
 begin
   KeyChar := #0;
 end;
end;

procedure TfrmPluviometro.Filtro;
var
 vFiltro:string;
 vFiltrado:integer;
begin
 vFiltrado :=0;
 if edtNomeFiltro.Text.Length>0 then
 begin
   vFiltro :='NOME LIKE '+QuotedStr('%'+edtNomeFiltro.Text+'%');
   vFiltrado :=1;
 end;
 if edtSetorFiltro.Text.Length>0 then
 begin
  if vFiltrado=1 then
    vFiltro :=vFiltro+' AND SETOR LIKE '+QuotedStr('%'+edtSetorFiltro.Text+'%')
   else
    vFiltro :='SETOR LIKE '+QuotedStr('%'+edtSetorFiltro.Text+'%');
    vFiltrado :=1;
 end;
 if vFiltrado=1 then
 begin
   dbCtx.TPluviometros.Filtered := false;
   dbCtx.TPluviometros.Filter   := vFiltro;
   dbCtx.TPluviometros.Filtered := true;
 end
 else
 begin
   dbCtx.TPluviometros.Filtered := false;
   dbCtx.TPluviometros.Close;
   dbCtx.TPluviometros.Open;
 end;
end;

procedure TfrmPluviometro.FiltroPluviometria;
var
 vFiltro:string;
begin
 vFiltro := '';
 if edtPluviometroF.Text.Length>0 then
  vFiltro := ' and b.nome like '+QuotedStr('%'+edtPluviometroF.Text+'%');
 if edtSetorF.Text.Length>0 then
  vFiltro := vFiltro+' and e.nome like '+QuotedStr('%'+edtSetorF.Text+'%');
 if edtTalhaoF.Text.Length>0 then
  vFiltro := vFiltro+' and d.nome like '+QuotedStr('%'+edtTalhaoF.Text+'%');

 if edtAreaF.Text.Length>0 then
  vFiltro := vFiltro+' and f.nome like '+QuotedStr('%'+edtAreaF.Text+'%');

 vFiltro  := vFiltro+' and a.dataColeta between '+FormatDateTime('yyyy-mm-dd',edtDataInicio.Date).QuotedString+' and '+
 FormatDateTime('yyyy-mm-dd',edtDataFim.Date).QuotedString;
 dbCtx.AbrePluviometria(vFiltro);
end;

procedure TfrmPluviometro.FormShow(Sender: TObject);
begin
  lblBuscar.Text         := 'Filtros';
  lblAdd.Text             := 'Adicionar';
  lblEdit.Text            := 'Editar';
  lblDeleta.Text          := 'Deletar';
  layListaMnu.Width       := 150;
  tbPrincipal.TabPosition := TTabPosition.None;
  tbPrincipal.ActiveTab   := tbiLista;
  layListaMnu.Enabled     := dbCtx.vTipoBDConfig=2;
  dbCtx.TPluviometros.Close;
  dbCtx.TPluviometros.Open();
  gridTalhoes.RowCount    :=0;
  lblQtdTalhao.Text       := intToStr(dbCtx.TPluviometroTalhoes.RecordCount);
  lblTotalRegistro.Text   := intToStr(dbCtx.TPluviometros.RecordCount);
end;

procedure TfrmPluviometro.Image13Click(Sender: TObject);
begin
 layNewPluv.Visible := false;
end;

procedure TfrmPluviometro.LimpaCampos;
begin
 edtNome.Text         :='';
 edtSetorFazenda.Text :='';
 edtLatitude.Text     :='';
 edtLongitude.Text    :='';
 SwStatus.IsChecked   :=true;
end;

procedure TfrmPluviometro.btnHistChuvaClick(Sender: TObject);
begin
 edtDataInicio.Date := date-30;
 edtDataFim.Date    := date;
 layNewPluv.Visible := false;
 dbCtx.AbrePluviometria('');
 MudarAba(TbiHist,sender);
end;

procedure TfrmPluviometro.btnMapaClick(Sender: TObject);
begin
 if edtSetorFiltro.Text.Length>0 then
 begin
   dmRel.qryMapaPLuvi.Filtered := false;
   dmRel.qryMapaPLuvi.Filter   := 'setornome like '+QuotedStr('%'+edtSetorFiltro.Text+'%');
   dmRel.qryMapaPLuvi.Filtered := True;
   dmRel.ReportMapaPLUVI.Print;
 end
 else
 begin
   dmRel.qryMapaPLuvi.Filtered := false;
   dmRel.qryMapaPLuvi.Close;
   dmRel.qryMapaPLuvi.Open;
   dmRel.ReportMapaPLUVI.Print;
 end;
end;

procedure TfrmPluviometro.SearchEditButton1Click(Sender: TObject);
begin
 MudarAba(tbiLista,Sender);
 btnHistChuva.Visible := false;
end;

procedure TfrmPluviometro.StringGrid1CellClick(const Column: TColumn;
  const Row: Integer);
begin
 dbCtx.AbreTalhoesPluvi(dbCtx.TPluviometrosid.AsString);
end;

procedure TfrmPluviometro.StringGrid1CellDblClick(const Column: TColumn;
  const Row: Integer);
begin
 tbPrincipal.ActiveTab := TbiHist;
 edtPluviometro.Text   := dbCtx.TPluviometrosnome.AsString;
 vIdPluviometro        := dbCtx.TPluviometrosid.AsString;
end;

procedure TfrmPluviometro.StringGrid1SelChanged(Sender: TObject);
begin
 dbCtx.AbreTalhoesPluvi(dbCtx.TPluviometrosid.AsString);
end;

end.
