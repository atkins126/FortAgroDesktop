unit UCadMaquina;

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
  FMX.ListBox,Winapi.Windows, FMX.Menus, FMX.WebBrowser, FMX.DateTimeCtrls;

type
  TfrmCadMaquinaVeiculo = class(TfrmCadPadrao)
    OpenImg: TOpenDialog;
    PopupMnuGrid: TPopupMenu;
    mnuVerImagem: TMenuItem;
    layImg: TLayout;
    Rectangle6: TRectangle;
    Layout17: TLayout;
    Layout18: TLayout;
    ToolBar4: TToolBar;
    lblNomeProduto: TLabel;
    Image10: TImage;
    imgVisualizar: TImage;
    Layout3: TLayout;
    edtModelo: TEdit;
    Layout19: TLayout;
    Label21: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    edtMarca: TEdit;
    EditButton4: TEditButton;
    edtTipo: TEdit;
    EditButton5: TEditButton;
    Layout1: TLayout;
    Rectangle2: TRectangle;
    Layout2: TLayout;
    Layout4: TLayout;
    Layout6: TLayout;
    Label15: TLabel;
    Label8: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    edtPlaca: TEdit;
    cbxAno: TComboBox;
    edtChassi: TEdit;
    Layout7: TLayout;
    Rectangle3: TRectangle;
    Layout8: TLayout;
    Layout9: TLayout;
    Layout10: TLayout;
    Label9: TLabel;
    Label10: TLabel;
    Label25: TLabel;
    edtNumeroSerie: TEdit;
    edtValor: TEdit;
    edtPrefixo: TEdit;
    Layout11: TLayout;
    Rectangle5: TRectangle;
    Label11: TLabel;
    Layout12: TLayout;
    Layout13: TLayout;
    Layout16: TLayout;
    Rectangle9: TRectangle;
    btnLimparImg: TRectangle;
    Image7: TImage;
    Label12: TLabel;
    btnCarregaIMG: TRectangle;
    Image8: TImage;
    Label13: TLabel;
    Layout14: TLayout;
    Layout15: TLayout;
    Rectangle8: TRectangle;
    imgProduto: TImage;
    lblStatus: TLabel;
    chkInativo: TSwitch;
    lblPf: TLabel;
    edtPlacaF: TEdit;
    Label14: TLabel;
    edtPrefixoF: TEdit;
    Label19: TLabel;
    cbxMarcaF: TComboBox;
    Label20: TLabel;
    cbxTipoF: TComboBox;
    Label22: TLabel;
    Label24: TLabel;
    edtNumeroSerieF: TEdit;
    chkInativoF: TCheckBox;
    Label4: TLabel;
    cbxCategoria: TComboBox;
    lblSegmento: TLabel;
    cbxSegmento: TComboBox;
    cbxCombustivel: TComboBox;
    Label6: TLabel;
    cbxAnoModelo: TComboBox;
    Label23: TLabel;
    cbxSegmentoF: TComboBox;
    cbxCategoriaF: TComboBox;
    Label17: TLabel;
    cbxCombustivelF: TComboBox;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    Label26: TLabel;
    edtDepreciacao: TEdit;
    Label27: TLabel;
    edtVidaUtil: TEdit;
    Layout20: TLayout;
    Rectangle1: TRectangle;
    Layout21: TLayout;
    Layout22: TLayout;
    Layout23: TLayout;
    Label28: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Switch1: TSwitch;
    edtHorimetroUltimaRev: TEdit;
    edtDataUltimaRev: TDateEdit;
    procedure btnAddClick(Sender: TObject);
    procedure EditButton4Click(Sender: TObject);
    procedure EditButton5Click(Sender: TObject);
    procedure edtValorTyping(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure edtValorKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure edtNomeFiltroChangeTracking(Sender: TObject);
    procedure cbxCategoriaFChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnLimparImgClick(Sender: TObject);
    procedure btnCarregaIMGClick(Sender: TObject);
    procedure mnuVerImagemClick(Sender: TObject);
    procedure Image10Click(Sender: TObject);
    procedure cbxTipoFChange(Sender: TObject);
    procedure cbxCombustivelFChange(Sender: TObject);
    procedure cbxSegmentoFChange(Sender: TObject);
    procedure edtNumeroSerieFChange(Sender: TObject);
    procedure chkInativoFChange(Sender: TObject);
    procedure cbxMarcaFChange(Sender: TObject);
    procedure btnConfirmaClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure edtPlacaFChangeTracking(Sender: TObject);
    procedure edtPrefixoFChangeTracking(Sender: TObject);
    procedure chkInativoSwitch(Sender: TObject);
    procedure StringGrid1CellDblClick(const Column: TColumn;
      const Row: Integer);
    procedure btnFecharClick(Sender: TObject);
    procedure StringGrid1CellClick(const Column: TColumn; const Row: Integer);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
  private
    vIdMarca,vIdTipo:string;
    procedure CarregaCombos;
  public
    vIdMaquina :string;
    procedure LimpaCampos;
    procedure Filtro;
  end;

var
  frmCadMaquinaVeiculo: TfrmCadMaquinaVeiculo;

implementation

{$R *.fmx}

uses DataContext, UPrincipal, UAuxMarcas, UAuxTipoMaquinaVeiculo, uFormat,
  dmReplicacao, UDMRevisao;

procedure TfrmCadMaquinaVeiculo.btnAddClick(Sender: TObject);
begin
  if DataModule1.Sincronizando=1 then
  begin
    MyShowMessage('Aguarde Sincronizando Dados!',false);
    Exit;
  end;
  LimpaCampos;
  dbCtx.TMaquinas.Close;
  dbCtx.TMaquinas.Open;
  dbCtx.TMaquinas.Insert;
  inherited;
end;

procedure TfrmCadMaquinaVeiculo.btnBuscarClick(Sender: TObject);
begin
 if layFiltros.Height =0 then
  layFiltros.Height  := 140
 else
   layFiltros.Height := 0;
end;

procedure TfrmCadMaquinaVeiculo.btnCarregaIMGClick(Sender: TObject);
begin
 if OpenImg.Execute then
 begin
   imgProduto.Bitmap.LoadFromFile(OpenImg.FileName);
 end;
end;

procedure TfrmCadMaquinaVeiculo.btnConfirmaClick(Sender: TObject);
var
  Stream: TMemoryStream;
begin
 if cbxCategoria.ItemIndex=-1 then
 begin
   MyShowMessage('Informe a Categoria!',false);
   cbxCategoria.SetFocus;
   Exit;
 end;
 if edtTipo.Text.Length=0 then
 begin
   MyShowMessage('Informe o Tipo!',false);
   edtTipo.SetFocus;
   Exit;
 end;
 if edtMarca.Text.Length=0 then
 begin
  MyShowMessage('Informe a Marca!',false);
  edtMarca.SetFocus;
  Exit;
 end;
 if edtModelo.Text.Length=0 then
 begin
  MyShowMessage('Informe o Modelo!',false);
  edtModelo.SetFocus;
  Exit;
 end;
 if cbxSegmento.ItemIndex=-1 then
 begin
   MyShowMessage('Informe o Segmento!',false);
   cbxSegmento.SetFocus;
   Exit;
 end;
 if cbxCombustivel.ItemIndex=-1 then
 begin
   MyShowMessage('Informe o Combustivel!',false);
   cbxCombustivel.SetFocus;
   Exit;
 end;
 if dbCtx.TMaquinas.State=dsInsert then
  dbCtx.TMaquinasIdUsuario.AsString          := dbCtx.vIdUsuarioLogado
 else
 begin
  dbCtx.TMaquinasIdUsuarioAlteracao.AsString := dbCtx.vIdUsuarioLogado;
  dbCtx.TMaquinasDataAlteracao.AsDateTime    := now;
  dbCtx.AlteraFlaSynAWS_ZERO('maquinaveiculo',dbCtx.TMaquinasID.AsString);
 end;
 dbCtx.TMaquinasStatus.AsInteger            := 1;

 if edtPlaca.Text.Length>0 then
  dbCtx.TMaquinasplaca.AsString              := edtPlaca.Text;

 if cbxAno.ItemIndex>-1 then
  dbCtx.TMaquinasano.AsString                := cbxAno.Selected.Text;

 if cbxAnoModelo.ItemIndex>-1 then
  dbCtx.TMaquinasanomodelo.AsString          := cbxAnoModelo.Selected.Text;

 if edtChassi.Text.Length>0 then
  dbCtx.TMaquinaschassi.AsString             := edtChassi.Text;

 if edtNumeroSerie.Text.Length>0 then
  dbCtx.TMaquinasnumeroserie.AsString        := edtNumeroSerie.Text;

 if edtValor.Text.Length>0 then
  dbCtx.TMaquinasvalor.AsString              :=StringReplace(
   StringReplace(edtValor.Text,'R$ ','',[rfReplaceAll]),'.','',[rfReplaceAll]);

 dbCtx.TMaquinasidcategoria.AsInteger        := cbxCategoria.ItemIndex;
 dbCtx.TMaquinasidtipo.AsString              := vIdTipo;
 dbCtx.TMaquinasidmarca.AsString             := vIdMarca;
 dbCtx.TMaquinasmodelo.AsString              := edtModelo.Text;
 dbCtx.TMaquinasidSegmento.AsInteger         := cbxSegmento.ItemIndex;
 dbCtx.TMaquinascombustivel.AsInteger        := cbxCombustivel.ItemIndex;
 dbCtx.TMaquinasprefixo.AsString             := edtPrefixo.Text;
 if edtDataUltimaRev.Text.Length>0 then
  dbCtx.TMaquinasultimarevisao.AsString       := edtDataUltimaRev.Text;
 if edtHorimetroUltimaRev.Text.Length>0 then
  dbCtx.TMaquinashorimetroultimarev.AsString  := edtHorimetroUltimaRev.Text;
 if edtVidaUtil.Text.Length>0 then
  dbCtx.TMaquinasvidautil.AsString            := edtVidaUtil.Text;
 if edtDepreciacao.Text.Length>0 then
  dbCtx.TMaquinasdepreciacao.AsString         := edtDepreciacao.Text;


 if not imgProduto.Bitmap.IsEmpty then
 begin
  Stream := TMemoryStream.Create;
  imgProduto.Bitmap.SaveToStream(Stream);
  dbCtx.TMaquinasimg.loadfromstream(Stream);
 end;
 try
  dbCtx.TMaquinas.ApplyUpdates(-1);
  MyShowMessage('Maquina Cadastrado com Sucesso!',false);
  dbCtx.TMaquinas.Close;
  dbCtx.TMaquinas.Open;
//  if dbCtx.vTipoBDConfig=0 then
//  TThread.CreateAnonymousThread(procedure()
//  begin
//   DataModule1.ReplicaMaquinaVeiculos('');
//  end).Start;

  CarregaCombos;
  MudarAba(tbiLista,sender);
 except
   on E: Exception do
    myShowMessage('Erro ao salvar Maquina:'+E.Message,false);
 end;
end;

procedure TfrmCadMaquinaVeiculo.btnDeletarClick(Sender: TObject);
begin
  if DataModule1.Sincronizando=1 then
  begin
    MyShowMessage('Aguarde Sincronizando Dados!',false);
    Exit;
  end;
   MyShowMessage('Deseja Realmente Deletar esse registro?',true);
   case frmPrincipal.vMsgConfirma of
     1:begin
        dbCtx.TMaquinas.Edit;
        dbCtx.TMaquinasStatus.AsInteger := -1;
        dbCtx.TMaquinasIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
        dbCtx.TMaquinasDataAlteracao.AsDateTime     := now;
        dbCtx.AlteraFlaSynAWS_ZERO('maquinaveiculo',dbCtx.TMaquinasID.AsString);
        try
          dbCtx.TMaquinas.ApplyUpdates(-1);
          MyShowMessage('Registro Excluido com sucesso!',false);
          dbCtx.TMaquinas.Close;
          dbCtx.TMaquinas.Open();
//          if dbCtx.vTipoBDConfig=0 then
//          TThread.CreateAnonymousThread(procedure()
//          begin
//             DataModule1.ReplicaMaquinaVeiculos('');
//          end).Start;
        except
         on E : Exception do
          ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
        end;
     end;
   end;
end;

procedure TfrmCadMaquinaVeiculo.btnEditarClick(Sender: TObject);
var
 Stream : TMemoryStream;
begin
 if DataModule1.Sincronizando=1 then
  begin
    MyShowMessage('Aguarde Sincronizando Dados!',false);
    Exit;
  end;
 cbxCategoria.ItemIndex       := dbCtx.TMaquinasidcategoria.AsInteger;
 edtTipo.Text                 := dbCtx.TMaquinastipo.AsString;
 vIdTipo                      := dbCtx.TMaquinasidtipo.AsString;
 vIdMarca                     := dbCtx.TMaquinasidmarca.AsString;
 edtMarca.Text                := dbCtx.TMaquinasmarca.AsString;
 edtModelo.Text               := dbCtx.TMaquinasmodelo.AsString;
 cbxSegmento.ItemIndex        := dbCtx.TMaquinasidsegmento.AsInteger;
 edtPlaca.Text                := dbCtx.TMaquinasplaca.AsString;
 cbxAno.ItemIndex             := cbxAno.Items.IndexOf(dbCtx.TMaquinasano.AsString);
 cbxCombustivel.ItemIndex     := dbCtx.TMaquinascombustivel.AsInteger;
 edtChassi.Text               := dbCtx.TMaquinaschassi.AsString;
 edtNumeroSerie.Text          := dbCtx.TMaquinasnumeroserie.AsString;
 edtValor.Text                := dbCtx.TMaquinasvalor.AsString;
 edtPrefixo.Text              := dbCtx.TMaquinasprefixo.AsString;
 chkInativo.IsChecked         := dbCtx.TMaquinasstatus.AsInteger=0;
 edtDataUltimaRev.Text        := dbCtx.TMaquinasultimarevisao.AsString;
 edtHorimetroUltimaRev.Text   := dbCtx.TMaquinashorimetroultimarev.AsString;
 edtVidaUtil.Text             := dbCtx.TMaquinasvidautil.AsString;
 edtDepreciacao.Text          := dbCtx.TMaquinasdepreciacao.AsString;

 if dbCtx.TMaquinasimg.AsString.Length>0 then
  begin
   Stream := TMemoryStream.Create;
   dbCtx.TMaquinasimg.SaveToStream(Stream);
   imgProduto.Bitmap.LoadFromStream(Stream);
  end
  else
   imgProduto.Bitmap.Assign(nil);
  dbCtx.TMaquinas.Edit;
  inherited;
end;

procedure TfrmCadMaquinaVeiculo.btnFecharClick(Sender: TObject);
begin
  if DataModule1.Sincronizando=1 then
  begin
    MyShowMessage('Aguarde Sincronizando Dados!',false);
    Exit;
  end;
//  if dbCtx.vTipoBDConfig=0 then
//  TThread.CreateAnonymousThread(procedure()
//  begin
//   DataModule1.ReplicaMaquinaVeiculos('');
//  end).Start;
  inherited;
end;

procedure TfrmCadMaquinaVeiculo.btnLimparImgClick(Sender: TObject);
begin
  imgProduto.Bitmap.Assign(nil);
end;

procedure TfrmCadMaquinaVeiculo.CarregaCombos;
begin
  cbxMarcaF.Items.Clear;
  cbxMarcaF.Items.Add('Todas');

  CbxTIPOF.Items.Clear;
  CbxTIPOF.Items.Add('Todos');

  dbCtx.TAuxTipoMaqVeic.Close;
  dbCtx.TAuxTipoMaqVeic.Open;
  dbCtx.TAuxTipoMaqVeic.First;
  while not dbCtx.TAuxTipoMaqVeic.Eof do
  begin
    CbxTIPOF.Items.AddObject(dbCtx.TAuxTipoMaqVeicNome.AsString,TObject(dbCtx.TAuxTipoMaqVeicID.AsInteger));
    dbCtx.TAuxTipoMaqVeic.Next;
  end;
  CbxTIPOF.ItemIndex :=0;

  dbCtx.TAuxMarca.Close;
  dbCtx.TAuxMarca.Open;
  dbCtx.TAuxMarca.First;
  while not dbCtx.TAuxMarca.Eof do
  begin
    CbxMarcaF.Items.AddObject(dbCtx.TAuxMarcaNome.AsString,TObject(dbCtx.TAuxMarcaID.AsInteger));
    dbCtx.TAuxMarca.Next;
  end;
  CbxMarcaF.ItemIndex :=0;
end;

procedure TfrmCadMaquinaVeiculo.cbxCategoriaFChange(Sender: TObject);
begin
 Filtro;
end;

procedure TfrmCadMaquinaVeiculo.cbxCombustivelFChange(Sender: TObject);
begin
 Filtro;
end;

procedure TfrmCadMaquinaVeiculo.cbxMarcaFChange(Sender: TObject);
begin
 Filtro;
end;

procedure TfrmCadMaquinaVeiculo.cbxSegmentoFChange(Sender: TObject);
begin
 Filtro;
end;

procedure TfrmCadMaquinaVeiculo.cbxTipoFChange(Sender: TObject);
begin
 Filtro;
end;

procedure TfrmCadMaquinaVeiculo.chkInativoFChange(Sender: TObject);
begin
 Filtro;
end;

procedure TfrmCadMaquinaVeiculo.EditButton4Click(Sender: TObject);
begin
  frmCadAuxMarcas := TfrmCadAuxMarcas.Create(Self);
  try
    frmCadAuxMarcas.ShowModal;
  finally
    vIdMarca      := dbCtx.TAuxMarcaid.AsString;
    edtMarca.Text := dbCtx.TAuxMarcanome.AsString;
  end;
end;

procedure TfrmCadMaquinaVeiculo.EditButton5Click(Sender: TObject);
begin
  frmAuxTipoMaquinaVeiculo := TfrmAuxTipoMaquinaVeiculo.Create(Self);
  try
    frmAuxTipoMaquinaVeiculo.ShowModal;
  finally
    vIdTipo       := dbCtx.TAuxTipoMaqVeicid.AsString;
    edtTipo.Text  := dbCtx.TAuxTipoMaqVeicnome.AsString;
  end;
end;

procedure TfrmCadMaquinaVeiculo.edtPlacaFChangeTracking(Sender: TObject);
begin
 Filtro;
end;

procedure TfrmCadMaquinaVeiculo.edtPrefixoFChangeTracking(Sender: TObject);
begin
 Filtro;
end;

procedure TfrmCadMaquinaVeiculo.edtNomeFiltroChangeTracking(Sender: TObject);
begin
 Filtro;
end;

procedure TfrmCadMaquinaVeiculo.edtNumeroSerieFChange(Sender: TObject);
begin
 Filtro;
end;

procedure TfrmCadMaquinaVeiculo.edtValorKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
 if ((keyChar in ['0'..'9',','] = false) and (word(key) <> vk_back)) then
 begin
   KeyChar := #0;
 end;
end;

procedure TfrmCadMaquinaVeiculo.edtValorTyping(Sender: TObject);
begin
 Formatar(edtValor,TFormato.Money);
end;

procedure TfrmCadMaquinaVeiculo.Filtro;
var
 vFiltrado:integer;
 vFiltro:string;
begin
 vFiltrado :=0;
 dbCtx.TUsuario.Filtered := false;
 if edtNomeFiltro.Text.Length>0 then
 begin
   vFiltrado :=1;
   vFiltro := 'MODELO LIKE '+QuotedStr('%'+edtNomeFiltro.Text+'%');
 end;

 if edtPlacaF.Text.Length>0 then
 begin
  if vFiltrado=0 then
   vFiltro := 'PLACA like'+QuotedStr('%'+edtPlacaF.Text+'%')
  else
   vFiltro := vFiltro+' AND PLACA like'+QuotedStr('%'+edtPlacaF.Text+'%');
   vFiltrado :=1;
 end;


 if cbxCategoriaF.ItemIndex>0 then
 begin
  if vFiltrado=0 then
   vFiltro := 'idCategoria ='+intToStr(cbxCategoriaF.ItemIndex-1)
  else
   vFiltro := vFiltro+' and idCategoria ='+intToStr(cbxCategoriaF.ItemIndex-1);
   vFiltrado :=1;
 end;

 if cbxMarcaF.ItemIndex>0 then
 begin
  if vFiltrado=0 then
   vFiltro := 'marca ='+cbxMarcaF.Selected.Text.QuotedString
  else
   vFiltro := vFiltro+' and marca='+cbxMarcaF.Selected.Text.QuotedString;
   vFiltrado :=1;
 end;

 if cbxTipoF.ItemIndex>0 then
 begin
  if vFiltrado=0 then
   vFiltro := 'tipo ='+cbxTipoF.Selected.Text.QuotedString
  else
   vFiltro := vFiltro+' and tipo='+cbxTipoF.Selected.Text.QuotedString;
   vFiltrado :=1;
 end;

 if cbxCombustivelF.ItemIndex>0 then
 begin
  if vFiltrado=0 then
   vFiltro := 'combustivel ='+intToStr(cbxCombustivelF.ItemIndex-1)
  else
   vFiltro := vFiltro+' and combustivel ='+intToStr(cbxCombustivelF.ItemIndex-1);
   vFiltrado :=1;
 end;

 if cbxSegmentoF.ItemIndex>0 then
 begin
  if vFiltrado=0 then
   vFiltro := 'idsegmento ='+intToStr(cbxSegmentoF.ItemIndex-1)
  else
   vFiltro := vFiltro+' and idsegmento ='+intToStr(cbxSegmentoF.ItemIndex-1);
   vFiltrado :=1;
 end;

 if edtNumeroSerieF.Text.Length>0 then
 begin
  if vFiltrado=0 then
   vFiltro := 'numeroserie like'+ QuotedStr('%'+edtNumeroSerieF.Text+'%')
  else
   vFiltro := vFiltro+' and numeroserie like'+ QuotedStr('%'+edtNumeroSerieF.Text+'%');
  vFiltrado :=1;
 end;

 if edtPrefixoF.Text.Length>0 then
 begin
  if vFiltrado=0 then
   vFiltro := 'PREFIXO like'+QuotedStr('%'+edtPrefixoF.Text+'%')
  else
   vFiltro := vFiltro+' and PREFIXO like'+ QuotedStr('%'+edtPrefixoF.Text+'%');
  vFiltrado :=1;
 end;

 if chkInativoF.IsChecked then
 begin
  if vFiltrado=0 then
   vFiltro := 'status=0'
  else
   vFiltro := vFiltro+' and status=0';
  vFiltrado:=1
 end;

 if vFiltrado=1 then
 begin
  dbCtx.TMaquinas.Filter   := vFiltro;
  dbCtx.TMaquinas.Filtered := true;
 end
 else
 begin
   dbCtx.TMaquinas.Filtered := false;
   dbCtx.TMaquinas.Close;
   dbCtx.TMaquinas.Open;
   vFiltro := 'status=1';
   dbCtx.TMaquinas.Filter   := vFiltro;
   dbCtx.TMaquinas.Filtered := true;
 end;
 lblTotalRegistro.Text := intToStr(StringGrid1.RowCount);
end;

procedure TfrmCadMaquinaVeiculo.FormShow(Sender: TObject);
begin
  layImg.Visible := false;
  dbCtx.TMaquinas.Close;
  dbCtx.TMaquinas.Open;
  if DMRevisao.TRevisaoMaquinas.State=dsinsert then
   StringGrid1.Columns[0].Width := 70
  else
   StringGrid1.Columns[0].Width := 0;
  lblTotalRegistro.Text := intToStr(StringGrid1.RowCount);
  CarregaCombos;

  lblBuscar.Text    := 'Filtros';
  lblAdd.Text        := 'Adicionar';
  lblEdit.Text       := 'Editar';
  lblDeleta.Text     := 'Deletar';
  layListaMnu.Width  := 150;
  tbPrincipal.TabPosition := TTabPosition.None;
  tbPrincipal.ActiveTab   := tbiLista;
  btnAdd.Enabled          := dbCtx.vTipoBDConfig=0;
  btnEditar.Enabled       := true;
  btnDeletar.Enabled      := dbCtx.vTipoBDConfig=0;

end;

procedure TfrmCadMaquinaVeiculo.Image10Click(Sender: TObject);
begin
 layImg.Visible := false;
end;

procedure TfrmCadMaquinaVeiculo.LimpaCampos;
begin
 edtModelo.Text               :='';
 edtTipo.Text                 :='';
 edtPlaca.Text                :='';
 cbxAno.ItemIndex             :=-1;
 cbxCombustivel.ItemIndex     :=-1;
 edtChassi.Text               :='';
 edtNumeroSerie.Text          :='';
 edtValor.Text                :='';
 edtPrefixo.Text              :='';

 imgProduto.Bitmap.Assign(nil);
end;

procedure TfrmCadMaquinaVeiculo.MenuItem1Click(Sender: TObject);
var
 I:integer;
begin
 vIdMaquina :='1';
 for I := 0 to StringGrid1.RowCount -1 do
 begin
   StringGrid1.Cells[0,i]:='True';
 end;
end;

procedure TfrmCadMaquinaVeiculo.MenuItem2Click(Sender: TObject);
var
 I:integer;
begin
 vIdMaquina :='';
 for I := 0 to StringGrid1.RowCount -1 do
 begin
   StringGrid1.Cells[0,i]:='False';
 end;
end;

procedure TfrmCadMaquinaVeiculo.mnuVerImagemClick(Sender: TObject);
var
 Stream : TMemoryStream;
begin
  if dbCtx.TMaquinasImg.AsString.Length>0 then
  begin
   Stream := TMemoryStream.Create;
   dbCtx.TMaquinasImg.SaveToStream(Stream);
   imgVisualizar.Bitmap.LoadFromStream(Stream);
   lblNomeProduto.Text  := dbCtx.TMaquinasModelo.AsString;
   layImg.Visible := true;
  end
  else
    MyShowMessage('Maquina sem Imagem para Exibir',false);
end;

procedure TfrmCadMaquinaVeiculo.StringGrid1CellClick(const Column: TColumn;
  const Row: Integer);
begin
 vIdMaquina := dbCtx.TMaquinasid.AsString;
end;

procedure TfrmCadMaquinaVeiculo.StringGrid1CellDblClick(const Column: TColumn;
  const Row: Integer);
begin
 vIdMaquina := dbCtx.TMaquinasid.AsString;
 if StringGrid1.ColumnIndex>0 then
  Close
 else
  StringGrid1.Cells[0,StringGrid1.Row]:='True';
end;

procedure TfrmCadMaquinaVeiculo.chkInativoSwitch(Sender: TObject);
begin
  if chkInativo.IsChecked then
  lblStatus.Text:='Ativo'
 else
  lblStatus.Text:='Inativo';
end;

end.
