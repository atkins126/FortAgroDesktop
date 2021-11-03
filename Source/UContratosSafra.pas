unit UContratosSafra;

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
  FMX.DateTimeCtrls, FMX.Menus, FMX.ListBox;

type
  TfrmCadContratos = class(TfrmCadPadrao)
    BindSourceDB1: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    BindingsList1: TBindingsList;
    edtComprador: TEdit;
    EditButton2: TEditButton;
    Layout1: TLayout;
    Rectangle1: TRectangle;
    Layout2: TLayout;
    Label4: TLabel;
    edtCultura: TEdit;
    EditButton1: TEditButton;
    Layout3: TLayout;
    Label7: TLabel;
    Label5: TLabel;
    edtNumerContrato: TEdit;
    Layout4: TLayout;
    Rectangle2: TRectangle;
    Layout6: TLayout;
    Layout7: TLayout;
    Label6: TLabel;
    edtVolumeSC: TEdit;
    Label8: TLabel;
    edtVolumeKG: TEdit;
    Label9: TLabel;
    edtSafra: TEdit;
    EditButton3: TEditButton;
    Layout8: TLayout;
    Rectangle3: TRectangle;
    Rectangle4: TRectangle;
    Image7: TImage;
    Label10: TLabel;
    Rectangle5: TRectangle;
    Image8: TImage;
    Label11: TLabel;
    Rectangle6: TRectangle;
    Image9: TImage;
    Label12: TLabel;
    Rectangle7: TRectangle;
    Image10: TImage;
    Label13: TLabel;
    gridEmbarques: TStringGrid;
    layNovoEmbarque: TLayout;
    Rectangle8: TRectangle;
    ToolBar4: TToolBar;
    Rectangle9: TRectangle;
    Label14: TLabel;
    Image12: TImage;
    Layout9: TLayout;
    Layout10: TLayout;
    Layout11: TLayout;
    Label15: TLabel;
    edtDatEmbarque: TDateEdit;
    Label16: TLabel;
    BindSourceDB2: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB2: TLinkGridToDataSource;
    edtHoraEmbarque: TTimeEdit;
    Label17: TLabel;
    edtPlaca: TEdit;
    GroupBox1: TGroupBox;
    Layout12: TLayout;
    Layout13: TLayout;
    Label18: TLabel;
    edtTara: TEdit;
    Label19: TLabel;
    edtBruto: TEdit;
    Label20: TLabel;
    edtPesoLiquido: TEdit;
    GroupBox2: TGroupBox;
    Layout14: TLayout;
    Layout15: TLayout;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    edtImp: TEdit;
    edtQueb: TEdit;
    edtVerd: TEdit;
    Label24: TLabel;
    edtAvar: TEdit;
    Label25: TLabel;
    edtUmid: TEdit;
    Layout16: TLayout;
    Rectangle10: TRectangle;
    Label26: TLabel;
    Image13: TImage;
    Rectangle11: TRectangle;
    Label27: TLabel;
    Image14: TImage;
    Label28: TLabel;
    edtNumNF: TEdit;
    ToolBar5: TToolBar;
    Layout18: TLayout;
    lblTotalEmbarque: TLabel;
    lblVolumeKg: TLabel;
    lblVolumeSc: TLabel;
    PopupMenu1: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    cbxStatusF: TComboBox;
    Label29: TLabel;
    brtRelatorio: TRectangle;
    Image11: TImage;
    Label30: TLabel;
    Layout17: TLayout;
    Rectangle12: TRectangle;
    Layout19: TLayout;
    Label31: TLabel;
    edtVendedor: TEdit;
    Label32: TLabel;
    edtValorTotalSaca: TEdit;
    edtValorKG: TEdit;
    Label33: TLabel;
    procedure btnAddClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure EditButton2Click(Sender: TObject);
    procedure EditButton1Click(Sender: TObject);
    procedure edtVolumeSCKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure edtNomeFiltroChangeTracking(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtVolumeSCChangeTracking(Sender: TObject);
    procedure EditButton3Click(Sender: TObject);
    procedure edtTaraChangeTracking(Sender: TObject);
    procedure edtTaraKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure btnCancelaClick(Sender: TObject);
    procedure edtPesoLiquidoChangeTracking(Sender: TObject);
    procedure edtBrutoChangeTracking(Sender: TObject);
    procedure Rectangle11Click(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure StringGrid1CellClick(const Column: TColumn; const Row: Integer);
    procedure StringGrid1SelChanged(Sender: TObject);
    procedure Rectangle5Click(Sender: TObject);
    procedure Rectangle10Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure cbxStatusFChange(Sender: TObject);
    procedure brtRelatorioClick(Sender: TObject);
    procedure edtValorTotalSacaChangeTracking(Sender: TObject);
    procedure gridEmbarquesEditingDone(Sender: TObject; const ACol,
      ARow: Integer);
  private
    { Private declarations }
  public
    vIdComprador,vIdCultura,vIdSafra:string;
    procedure LimpaCampos;
    procedure LimpaCamposEmbarque;
    procedure SomaColuna;
  end;

var
  frmCadContratos: TfrmCadContratos;

implementation

{$R *.fmx}

uses DataContext, UComprador, UAuxCultura, USafra, UPrincipal, UdmReport,
  UDmReports;

procedure TfrmCadContratos.brtRelatorioClick(Sender: TObject);
begin
 if dmReport=nil then
  dmReport := TdmReport.Create(Self);
 dmReport.ppRepContratos.print;
end;

procedure TfrmCadContratos.btnAddClick(Sender: TObject);
begin
  LimpaCampos;
  dbCtx.Contratos.Close;
  dbCtx.Contratos.Open;
  dbCtx.Contratos.Insert;
  inherited;
end;

procedure TfrmCadContratos.btnCancelaClick(Sender: TObject);
begin
 dbCtx.Contratos.CancelUpdates;
 dbCtx.Contratos.Close;
 dbCtx.Contratos.Open;
 MudarAba(tbiLista,sender);
end;

procedure TfrmCadContratos.btnDeletarClick(Sender: TObject);
begin
   MyShowMessage('Deseja Realmente Deletar esse registro?',true);
   case frmPrincipal.vMsgConfirma of
     1:begin
        dbCtx.Embarque.Edit;
        dbCtx.EmbarqueStatus.AsInteger := -1;
        dbCtx.EmbarqueIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
        dbCtx.EmbarqueDataAlteracao.AsDateTime     := now;
        dbCtx.AlteraFlaSynAWS_ZERO('embarque',dbCtx.EmbarqueId.AsString);
        try
          dbCtx.Embarque.ApplyUpdates(-1);
          MyShowMessage('Registro Excluido com sucesso!',false);
          dbCtx.AbreEmbarque(dbCtx.Embarqueid.AsString);
        except
         on E : Exception do
          ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
        end;
     end;
   end;
end;

procedure TfrmCadContratos.btnEditarClick(Sender: TObject);
begin
  dbCtx.Contratos.Edit;
  edtNumerContrato.Text  := dbCtx.Contratosnumerocontrato.AsString;
  edtCultura.Text        := dbCtx.Contratoscultura.AsString;
  edtComprador.Text      := dbCtx.Contratoscomprador.AsString;
  edtVolumeSC.Text       := dbCtx.Contratostotalcomprasacos.AsString;
  edtVolumeKG.Text       := dbCtx.Contratostotalcompravolume.AsString;
  vIdComprador           := dbCtx.Contratosidcomprador.AsString;
  vIdCultura             := dbCtx.Contratosidcultura.AsString;
  edtSafra.Text          := dbCtx.Contratossafra.AsString;
  vIdSafra               := dbCtx.Contratosidsafra.AsString;
  edtVendedor.Text       := dbCtx.Contratosvendedor.AsString;
  edtValorTotalSaca.Text := dbCtx.Contratosvalortotalsaca.AsString;
  edtValorKG.Text        := dbCtx.Contratosvalorkg.AsString;
  inherited;
end;

procedure TfrmCadContratos.btnSalvarClick(Sender: TObject);
begin
  if edtNumerContrato.Text.Length=0 then
  begin
    MyShowMessage('Informe o Nome!',false);
    edtNumerContrato.SetFocus;
    Exit;
  end;
  if edtVendedor.Text.Length=0 then
  begin
    MyShowMessage('Informe o Vendedor!',false);
    edtVendedor.SetFocus;
    Exit;
  end;
  if edtSafra.Text.Length=0 then
  begin
    MyShowMessage('Informe a Safra!',false);
    edtSafra.SetFocus;
    Exit;
  end;
  if edtVolumeSC.Text.Length=0 then
  begin
    MyShowMessage('Informe o Volume em Saco!',false);
    edtVolumeSC.SetFocus;
    Exit;
  end;
  if edtCultura.Text.Length=0 then
  begin
    MyShowMessage('Informe a Cultura!',false);
    edtCultura.SetFocus;
    Exit;
  end;
  if edtNumerContrato.Text.Length=0 then
  begin
    MyShowMessage('Informe o Nome!',false);
    edtNumerContrato.SetFocus;
    Exit;
  end;
  if(edtValorTotalSaca.Text.Length=0)or(edtValorTotalSaca.Text='0') then
  begin
    MyShowMessage('Informe o Valor total do contrato!',false);
    edtValorTotalSaca.SetFocus;
    Exit;
  end;
  if dbCtx.Contratos.State =dsInsert then
  begin
    dbCtx.Contratosidusuario.AsString         := dbCtx.vIdUsuarioLogado;
    if not dbCtx.VerificaContratoExiste(edtNumerContrato.Text) then
    begin
      MyShowMessage('Ja existe um contrato com esse Número!!',false);
      edtNumerContrato.SetFocus;
      Exit;
    end;
  end
  else
  begin
    dbCtx.Contratosidusuarioalteracao.AsString         := dbCtx.vIdUsuarioLogado;
    dbCtx.Contratosdataalteracao.AsDateTime            := now;
  end;
  dbCtx.Contratosnumerocontrato.AsString    := edtNumerContrato.Text;
  dbCtx.Contratoscultura.AsString           := edtCultura.Text;
  dbCtx.Contratoscomprador.AsString         := edtComprador.Text;
  dbCtx.Contratostotalcomprasacos.AsString  := edtVolumeSC.Text;
  dbCtx.Contratostotalcompravolume.AsString := edtVolumeKG.Text;
  dbCtx.Contratosidcomprador.AsString       := vIdComprador;
  dbCtx.Contratosidcultura.AsString         := vIdCultura;
  dbCtx.Contratosidsafra.AsString           := vIdSafra;
  dbCtx.Contratosvendedor.AsString          := edtVendedor.Text;
  dbCtx.Contratosvalortotalsaca.AsString    := edtValorTotalSaca.Text;
  dbCtx.Contratosvalorkg.AsString           := edtValorKG.Text;
  try
    dbCtx.Contratos.ApplyUpdates(-1);
    dbCtx.Contratos.Close;
    dbCtx.Contratos.Open;
    inherited;
  except
   on E: Exception do
      myShowMessage('Erro ao salvar Contrato:'+E.Message,false);
  end;
end;

procedure TfrmCadContratos.cbxStatusFChange(Sender: TObject);
begin
 if cbxStatusF.ItemIndex>0 then
 begin
   dbCtx.Contratos.Filtered := false;
   if edtNomeFiltro.Text.Length>0 then
    dbCtx.Contratos.Filter   := 'numerocontrato = '+QuotedStr('%'+edtNomeFiltro.Text+'%')+
    ' and '+'status = '+intToStr(cbxStatusF.ItemIndex)
   else
    dbCtx.Contratos.Filter   := 'status = '+intToStr(cbxStatusF.ItemIndex);
   dbCtx.Contratos.Filtered := true;
 end
 else
 begin
   dbCtx.Contratos.Filtered := false;
   dbCtx.Contratos.Close;
   dbCtx.Contratos.Open;
 end;
end;

procedure TfrmCadContratos.EditButton1Click(Sender: TObject);
begin
  frmAuxCultura := TfrmAuxCultura.Create(Self);
  try
    frmAuxCultura.ShowModal;
  finally
    vIdCultura          := dbCtx.TAuxCulturasid.AsString;
    edtCultura.Text     := dbCtx.TAuxCulturasNome.AsString;
    frmAuxCultura.Free;
  end;
end;

procedure TfrmCadContratos.EditButton2Click(Sender: TObject);
begin
  frmCadComprador := TfrmCadComprador.Create(Self);
  try
    frmCadComprador.ShowModal;
  finally
    vIdComprador          := dbCtx.Compradoresid.AsString;
    edtComprador.Text     := dbCtx.Compradoresnome.AsString;
    frmCadComprador.Free;
  end;
end;

procedure TfrmCadContratos.EditButton3Click(Sender: TObject);
begin
  frmSafra := TfrmSafra.Create(Self);
  try
    frmSafra.ShowModal;
  finally
    vIdSafra          := dbCtx.TSafraid.AsString;
    edtSafra.Text     := dbCtx.TSafranome.AsString;
    frmSafra.Free;
  end;
end;

procedure TfrmCadContratos.edtBrutoChangeTracking(Sender: TObject);
begin
 if TEdit(Sender).Text.Length<=0 then
  TEdit(Sender).Text := '0';
 edtPesoLiquido.text := floatTostr(strToFloat(edtBruto.Text)-strToFloat(edtTara.Text));
end;

procedure TfrmCadContratos.edtNomeFiltroChangeTracking(Sender: TObject);
begin
 if edtNomeFiltro.Text.Length>0 then
 begin
   dbCtx.Contratos.Filtered := false;
   dbCtx.Contratos.Filter   := 'numerocontrato = '+QuotedStr(edtNomeFiltro.Text);
   if cbxStatusF.ItemIndex>0 then
    dbCtx.Contratos.Filter   := ' and status = '+intToStr(cbxStatusF.ItemIndex);
   dbCtx.Contratos.Filtered := true;
 end
 else
 begin
   dbCtx.Contratos.Filtered := false;
   dbCtx.Contratos.Close;
   dbCtx.Contratos.Open;
 end;
end;

procedure TfrmCadContratos.edtPesoLiquidoChangeTracking(Sender: TObject);
begin
  if TEdit(Sender).Text.Length<=0 then
   TEdit(Sender).Text := '0';
end;

procedure TfrmCadContratos.edtTaraChangeTracking(Sender: TObject);
begin
 if TEdit(Sender).Text.Length<=0 then
  TEdit(Sender).Text := '0';
 edtPesoLiquido.text := floatTostr(strToFloat(edtBruto.Text)-strToFloat(edtTara.Text));
end;

procedure TfrmCadContratos.edtTaraKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
 if (keyChar in ['0'..'9',','] = false) then
 begin
   KeyChar := #0;
 end;
end;

procedure TfrmCadContratos.edtValorTotalSacaChangeTracking(Sender: TObject);
begin
 if(edtVolumeKG.Text.Length>0)and(edtValorTotalSaca.Text.Length>0) then
  edtValorKG.Text :=
  FormatFloat('####,##0.000',(strToFloat(edtValorTotalSaca.Text)
   /strToFloat(edtVolumeKG.Text)));
end;

procedure TfrmCadContratos.edtVolumeSCChangeTracking(Sender: TObject);
begin
 if edtVolumeSC.Text.Length>0 then
  edtVolumeKG.Text := FloatToStr(StrToFloat(edtVolumeSC.Text)*60)
end;

procedure TfrmCadContratos.edtVolumeSCKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
 if (keyChar in ['0'..'9',','] = false) then
 begin
   KeyChar := #0;
 end;
end;

procedure TfrmCadContratos.FormShow(Sender: TObject);
begin
  layNovoEmbarque.Visible := false;
  dbCtx.Contratos.Close;
  dbCtx.Contratos.Open;
  dbCtx.Contratos.First;
  while not dbCtx.Contratos.Eof do
  begin
    dbCtx.AtualizaSaldoContrato(dbCtx.Contratosid.AsString);
    dbCtx.Contratos.Next;
  end;
  lblBuscar.Text     := 'Filtros';
  lblAdd.Text        := 'Adicionar';
  lblEdit.Text       := 'Editar';
  lblDeleta.Text     := 'Deletar';
  layListaMnu.Width  := 150;
  tbPrincipal.TabPosition := TTabPosition.None;
  tbPrincipal.ActiveTab   := tbiLista;
  btnAdd.Enabled          := true;
  btnEditar.Enabled       := true;
  btnDeletar.Enabled      := true;
  recMnuLateral.Enabled   := true;
end;

procedure TfrmCadContratos.gridEmbarquesEditingDone(Sender: TObject; const ACol,
  ARow: Integer);
begin


 dbCtx.Embarquedataalteracao.AsDateTime     := NOW;
 dbCtx.Embarqueidusuarioalteracao.AsString  := dbCtx.vIdUsuarioLogado;
 dbCtx.Embarqueliquido.AsFloat := dbCtx.Embarquebruto.AsFloat-dbCtx.Embarquetara.AsFloat;
 try
  dbCtx.Embarque.ApplyUpdates(-1);
 except
  on E : Exception do
   MyShowMessage('Erro ao atualizar embarque: '+e.Message,false);
 end;
end;

procedure TfrmCadContratos.LimpaCampos;
begin
  edtNumerContrato.Text  := '';
  edtCultura.Text        := '';
  edtComprador.Text      := '';
  edtVolumeSC.Text       := '';
  edtVolumeKG.Text       := '';
end;

procedure TfrmCadContratos.LimpaCamposEmbarque;
begin
  edtPlaca.Text             := '';
  edtNumNF.Text             := '';
  edtTara.Text              := '0';
  edtBruto.Text             := '0';
  edtPesoLiquido.Text       := '0';
  edtImp.Text               := '0';
  edtUmid.Text              := '0';
  edtVerd.Text              := '0';
  edtAvar.Text              := '0';
  edtQueb.Text              := '0';
end;


procedure TfrmCadContratos.MenuItem1Click(Sender: TObject);
begin
  if dbCtx.Contratosid.AsString.Length>0 then
  begin
   MyShowMessage('Deseja Realmente Colocar esse contrato em Embarque??',true);
   case frmPrincipal.vMsgConfirma of
     1:begin
        try
          dbCtx.AtualizaStatusContrato(dbCtx.Contratosid.AsString,'3');
          MyShowMessage('Contrato Alterado com Sucesso!',false);
          dbCtx.Contratos.Close;
          dbCtx.Contratos.Open;
        except
         on E : Exception do
          ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
        end;
     end;
   end;
  end;
end;

procedure TfrmCadContratos.MenuItem2Click(Sender: TObject);
begin
  if dbCtx.Contratosid.AsString.Length>0 then
  begin
   MyShowMessage('Deseja Realmente Finalizar esse contrato??',true);
   case frmPrincipal.vMsgConfirma of
     1:begin
        try
          dbCtx.AtualizaStatusContrato(dbCtx.Contratosid.AsString,'2');
          MyShowMessage('Contrato Finalizado com Sucesso!',false);
          dbCtx.Contratos.Close;
          dbCtx.Contratos.Open;
        except
         on E : Exception do
          ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
        end;
     end;
   end;
  end;
end;

procedure TfrmCadContratos.Rectangle10Click(Sender: TObject);
begin
 layNovoEmbarque.Visible := false;
end;

procedure TfrmCadContratos.Rectangle11Click(Sender: TObject);
begin
  if edtPlaca.Text.Length=0 then
  begin
    MyShowMessage('Informe a Placa!',false);
    edtPlaca.SetFocus;
    Exit;
  end;
  if edtTara.Text='0' then
  begin
    MyShowMessage('Informe a Tara!',false);
    edtTara.SetFocus;
    Exit;
  end;
  if edtBruto.Text='0' then
  begin
    MyShowMessage('Informe o Peso Bruto!',false);
    edtBruto.SetFocus;
    Exit;
  end;
  dbCtx.Embarque.Insert;
  dbCtx.Embarqueidusuario.ASstring        := dbCtx.vIdUsuarioLogado;
  dbCtx.Embarqueidcontrato.ASstring       := dbCtx.Contratosid.AsString;
  dbCtx.Embarquenumeronf.ASstring         := edtNumNF.Text;
  dbCtx.Embarqueplaca.ASstring            := edtPlaca.Text;
  dbCtx.Embarquedataembarque.AsDateTime   := edtDatEmbarque.DateTime;
  dbCtx.Embarquetara.ASstring             := edtTara.Text;
  dbCtx.Embarquebruto.ASstring            := edtBruto.Text;
  dbCtx.Embarqueliquido.ASstring          := edtPesoLiquido.Text;
  dbCtx.Embarquehorabarque.AsDateTime     := edtHoraEmbarque.Time;
  dbCtx.Embarqueimp.AsString              := edtImp.Text;
  dbCtx.Embarquequeb.AsString             := edtQueb.Text;
  dbCtx.EmbarqueVerd.AsString             := edtVerd.Text;
  dbCtx.EmbarqueAvar.AsString             := edtAvar.Text;
  dbCtx.EmbarqueUmid.AsString             := edtUmid.Text;
  try
   dbCtx.Embarque.ApplyUpdates(-1);
   dbCtx.AtualizaSaldoContrato(dbCtx.Contratosid.AsString);
   dbCtx.Contratos.Close;
   dbCtx.Contratos.Open;
   SomaColuna;
   MyShowMessage('Embarque Realizado com Sucesso!',false);
   layNovoEmbarque.Visible := false;
  except
   on E : Exception do
    ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
  end;
end;

procedure TfrmCadContratos.Rectangle5Click(Sender: TObject);
begin
  LimpaCamposEmbarque;
  layNovoEmbarque.Visible := true;
end;

procedure TfrmCadContratos.SomaColuna;
var
  Sum : Double;
  Val : Double;
  I   : Integer;
begin
  Sum := 0;
  I   := 0;
  for I := 0 to gridEmbarques.RowCount-1 do
  begin
   if TryStrToFloat(gridEmbarques.Cells[6,I],Val) then
    Sum := Sum + Val;
  end;
  if I>0 then
  begin
    lblVolumeKg.Text           := 'Volume Total(kg):'+FormatFloat('####,##.00',Sum);
    lblVolumeSc.Text           := 'Volume Total(SC):'+intToStr(TRUNC(Sum/60));
  end
  else
  begin
    lblVolumeKg.Text           := 'Volume Total(kg):0';
    lblVolumeSc.Text           := 'Volume Total(SC):0';
  end;
  lblTotalEmbarque.Text        := 'Total de Embarques:'+IntToStr(gridEmbarques.RowCount);
end;

procedure TfrmCadContratos.StringGrid1CellClick(const Column: TColumn;
  const Row: Integer);
begin
 if dbCtx.Contratosid.AsString.Length>0 then
  dbCtx.AbreEmbarque(dbCtx.Contratosid.AsString);
 SomaColuna;
end;

procedure TfrmCadContratos.StringGrid1SelChanged(Sender: TObject);
begin
  if dbCtx.Contratosid.AsString.Length>0 then
   dbCtx.AbreEmbarque(dbCtx.Contratosid.AsString);
  SomaColuna;
end;

end.
