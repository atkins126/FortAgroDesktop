unit UProdutos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  UCadPadrao, System.Rtti, FMX.Grid.Style, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FMX.ActnList,
  System.Actions, FMX.TabControl, FMX.Ani, FMX.ScrollBox, FMX.Grid, FMX.Edit,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, FMX.ListBox,Winapi.Windows,
  Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope,
  FMX.Menus,System.DateUtils;

type
  TfrmCadProdutos = class(TfrmCadPadrao)
    OpenImg: TOpenDialog;
    BindSourceDB1: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    BindingsList1: TBindingsList;
    PopupMnuGrid: TPopupMenu;
    mnuVerImagem: TMenuItem;
    layImg: TLayout;
    Rectangle6: TRectangle;
    Layout17: TLayout;
    Layout18: TLayout;
    ToolBar4: TToolBar;
    Image10: TImage;
    imgVisualizar: TImage;
    lblNomeProduto: TLabel;
    Layout19: TLayout;
    Label4: TLabel;
    Label21: TLabel;
    edtNome: TEdit;
    edtMarca: TEdit;
    EditButton4: TEditButton;
    ClearEditButton5: TClearEditButton;
    chkInativo: TCheckBox;
    Layout4: TLayout;
    Rectangle2: TRectangle;
    Layout1: TLayout;
    Layout6: TLayout;
    lblSegmento: TLabel;
    Label5: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    cbxSegmento: TComboBox;
    edtSessao: TEdit;
    EditButton1: TEditButton;
    ClearEditButton8: TClearEditButton;
    edtSubGrupo: TEdit;
    EditButton2: TEditButton;
    ClearEditButton7: TClearEditButton;
    edtGrupo: TEdit;
    EditButton3: TEditButton;
    ClearEditButton6: TClearEditButton;
    Layout7: TLayout;
    Rectangle3: TRectangle;
    Layout8: TLayout;
    Layout9: TLayout;
    Label9: TLabel;
    Label10: TLabel;
    Label14: TLabel;
    Label6: TLabel;
    Label17: TLabel;
    edtNumeroSerie: TEdit;
    edtCodBarras: TEdit;
    edtCodigoFabricante: TEdit;
    edtEstoqueMin: TEdit;
    cbxUnidadeMedida: TComboBox;
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
    Label7: TLabel;
    cbxSegmentoF: TComboBox;
    Label8: TLabel;
    EdtCategoriaF: TEdit;
    btnBuscaCategoriaF: TSearchEditButton;
    ClearEditButton1: TClearEditButton;
    Label18: TLabel;
    edtGrupoF: TEdit;
    btnBuscaGrupo: TSearchEditButton;
    ClearEditButton2: TClearEditButton;
    Label19: TLabel;
    edtSubGrupoF: TEdit;
    btnBuscaSubGrupo: TSearchEditButton;
    ClearEditButton3: TClearEditButton;
    Label22: TLabel;
    edtMarcaF: TEdit;
    btnBuscarMarcaF: TSearchEditButton;
    ClearEditButton4: TClearEditButton;
    Label20: TLabel;
    edtCodFabF: TEdit;
    chkInativoF: TCheckBox;
    chkDefensivos: TCheckBox;
    btnBuscarLista: TButton;
    procedure FormShow(Sender: TObject);
    procedure edtEstoqueMinKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure btnLimparImgClick(Sender: TObject);
    procedure btnCarregaIMGClick(Sender: TObject);
    procedure edtNomeExit(Sender: TObject);
    procedure edtEstoqueMinExit(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure Image10Click(Sender: TObject);
    procedure mnuVerImagemClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure StringGrid1CellDblClick(const Column: TColumn;
      const Row: Integer);
    procedure EditButton1Click(Sender: TObject);
    procedure EditButton3Click(Sender: TObject);
    procedure EditButton2Click(Sender: TObject);
    procedure EditButton4Click(Sender: TObject);
    procedure cbxUnidadeMedidaKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure cbxCategoriaFKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure btnBuscaGrupoClick(Sender: TObject);
    procedure btnBuscaSubGrupoClick(Sender: TObject);
    procedure btnBuscaCategoriaFClick(Sender: TObject);
    procedure btnBuscarMarcaFClick(Sender: TObject);
    procedure ClearEditButton1Click(Sender: TObject);
    procedure ClearEditButton2Click(Sender: TObject);
    procedure ClearEditButton3Click(Sender: TObject);
    procedure ClearEditButton4Click(Sender: TObject);
    procedure btnConfirmaClick(Sender: TObject);
    procedure cbxSegmentoChange(Sender: TObject);
    procedure btnBuscarListaClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
  private
    LastTimeKeydown:TDatetime;
    Keys:string;
    procedure LimpaCampos;
  public
    vIdCategoriaF,vIdSegmento,vIdGrupoF,vIdSubGrupoF,vIdMarcaF,
    vIdSessao,vIdGrupo,vIdSubGrupo,vIdMarca:string;
    procedure CarregaCombos;
    procedure Filtro;
  end;

var
  frmCadProdutos: TfrmCadProdutos;

implementation

{$R *.fmx}

uses DataContext, UPrincipal, UAuxCategoriaProd, UAuxGrupo, UAuxSubGrupo,
  UAuxMarcas, dmReplicacao;

{ TfrmCadProdutos }

procedure TfrmCadProdutos.Filtro;
var
 vFiltrado:integer;
 vFiltro:string;
begin
 vFiltrado :=0;
 vFiltro   :='';
 dbCtx.TUsuario.Filtered := false;
 if edtNomeFiltro.Text.Length>0 then
 begin
   vFiltrado :=1;
   vFiltro := 'AND pr.NOME LIKE '+QuotedStr('%'+edtNomeFiltro.Text+'%');
 end;

 if cbxSegmentoF.ItemIndex>0 then
 begin
   vFiltro := vFiltro+' or pr.idsegmento =2';
   vFiltrado :=1;
 end;

 if edtCategoriaF.Text.Length >0 then
 begin
   vFiltro := vFiltro+' and pr.idCategoria ='+vIdCategoriaF;
   vFiltrado :=1;
 end;

 if edtGrupoF.Text.Length>0 then
 begin
   vFiltro := vFiltro+' and pr.idgrupo ='+vIdGrupoF;
   vFiltrado :=1;
 end;

 if edtSubGrupoF.Text.Length>0 then
 begin
   vFiltro := vFiltro+' and pr.idsubgrupo ='+vIdSubGrupoF;
   vFiltrado :=1;
 end;

 if edtMarcaF.Text.Length>0 then
 begin
   vFiltro := vFiltro+' and pr.idmarca ='+vIdMarcaF;
   vFiltrado :=1;
 end;


 if edtCodFabF.Text.Length>0 then
 begin
   vFiltro := vFiltro+' and pr.codigofabricante LIKE '+QuotedStr('%'+edtCodFabF.Text+'%');
   vFiltrado :=1;
 end;

 if chkInativoF.IsChecked then
 begin
   vFiltro := vFiltro+' and pr.status=0';
   vFiltrado:=1
 end
 else
 begin
   vFiltro := vFiltro+' and pr.status=1';
   vFiltrado:=1
 end;
 dbCtx.AbreProdutos(vFiltro);
end;

procedure TfrmCadProdutos.btnAddClick(Sender: TObject);
begin
  LimpaCampos;
  dbCtx.TProdutos.Close;
  dbCtx.TProdutos.Open;
  dbCtx.TProdutos.Insert;
  inherited;
end;

procedure TfrmCadProdutos.btnCarregaIMGClick(Sender: TObject);
begin
 if OpenImg.Execute then
 begin
   imgProduto.Bitmap.LoadFromFile(OpenImg.FileName);
 end;
end;

procedure TfrmCadProdutos.btnConfirmaClick(Sender: TObject);
var
  Stream: TMemoryStream;
begin
 if edtNome.Text.Length=0 then
 begin
   MyShowMessage('Informe o nome!',false);
   edtNome.SetFocus;
   Exit;
 end;
 if cbxSegmento.ItemIndex=-1 then
 begin
   MyShowMessage('Informe o Segmento!',false);
   cbxSegmento.SetFocus;
   Exit;
 end;
 if edtSessao.Text.Length=0 then
 begin
   MyShowMessage('Informe a Sessão!',false);
   edtSessao.SetFocus;
   Exit;
 end;
 if cbxUnidadeMedida.ItemIndex=-1 then
 begin
  MyShowMessage('Informe a Unidade de Medida!',false);
  cbxUnidadeMedida.SetFocus;
  Exit;
 end;

 if edtEstoqueMin.Text.Length=0 then
  edtEstoqueMin.Text :='0';
 if dbCtx.TProdutos.State=dsInsert then
  dbCtx.TProdutosIdUsuario.AsString          := dbCtx.vIdUsuarioLogado
 else
 begin
  dbCtx.TProdutosIdUsuarioAlteracao.AsString := dbCtx.vIdUsuarioLogado;
  dbCtx.TProdutosDataAlteracao.AsDateTime    := now;
  dbCtx.AlteraFlaSynAWS_ZERO('produtos',dbCtx.TProdutosID.AsString);
 end;

 if chkInativo.IsChecked then
  dbCtx.TProdutosStatus.AsInteger            := 0;

 if edtGrupo.Text.Length>0 then
  dbCtx.TProdutosidgrupo.AsString            := vIdGrupo;

 if edtSubGrupo.Text.Length>0 then
  dbCtx.TProdutosidSubgrupo.AsString         := vIdSubGrupo;

 if cbxUnidadeMedida.ItemIndex>-1 then
  dbCtx.TProdutosunidademedida.AsString      := cbxUnidadeMedida.Selected.Text;

 if edtCodigoFabricante.Text.Length>0 then
  dbCtx.TProdutoscodigofabricante.AsString   := edtCodigoFabricante.Text;

 if edtMarca.Text.Length>0 then
  dbCtx.TProdutosidmarca.AsString := vIdMarca;
 if chkDefensivos.IsChecked then
   dbCtx.TProdutosdefensivos.AsInteger := 1
 else
   dbCtx.TProdutosdefensivos.AsInteger := 0;
 dbCtx.TProdutosNome.AsString                := edtNome.Text;
 dbCtx.TProdutosidSegmento.AsInteger         := cbxSegmento.ItemIndex;
 dbCtx.TProdutosidCategoria.AsString         := vIdSessao;
 dbCtx.TProdutosEstoqueMinimo.AsString       := edtEstoqueMin.Text;
 dbCtx.TProdutosNumeroSerie.AsString         := edtNumeroSerie.Text;
 dbCtx.TProdutosCodigoBarras.AsString        := edtCodBarras.Text;
 if not imgProduto.Bitmap.IsEmpty then
 begin
  Stream := TMemoryStream.Create;
  imgProduto.Bitmap.SaveToStream(Stream);
  dbCtx.TProdutosImg.loadfromstream(Stream);
 end;
 try
  dbCtx.TProdutossyncaws.AsInteger           :=0;
  dbCtx.TProdutos.ApplyUpdates(-1);
  MyShowMessage('Produto Cadastrado com Sucesso!',false);
//  if dbCtx.vTipoBDConfig=0 then
//    TThread.CreateAnonymousThread(procedure()
//    begin
//      dataModule1.ReplicaProduto('');
//    end).Start;

  dbCtx.AbreProdutos('');
  CarregaCombos;
  MudarAba(tbiLista,sender);
 except
   on E: Exception do
    myShowMessage('Erro ao salvar produto:'+E.Message,false);
 end;
end;

procedure TfrmCadProdutos.btnDeletarClick(Sender: TObject);
begin
  MyShowMessage('Deseja Realmente Deletar esse registro?',true);
   case frmPrincipal.vMsgConfirma of
     1:begin
        dbCtx.TProdutos.Edit;
        dbCtx.TProdutosStatus.AsInteger := -1;
        dbCtx.TProdutosIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
        dbCtx.TProdutosDataAlteracao.AsDateTime     := now;
        dbCtx.AlteraFlaSynAWS_ZERO('produtos',dbCtx.TProdutosID.AsString);
        try
          dbCtx.TProdutossyncaws.AsInteger            :=0;
          dbCtx.TProdutos.ApplyUpdates(-1);
          MyShowMessage('Registro Excluido com sucesso!',false);
          dbCtx.TProdutos.Close;
          dbCtx.TProdutos.Open();
          Filtro;
//          if dbCtx.vTipoBDConfig=0 then
//            TThread.CreateAnonymousThread(procedure()
//            begin
//              DataModule1.ReplicaProduto('');
//            end).Start;
        except
         on E : Exception do
          ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
        end;
     end;
   end;
end;

procedure TfrmCadProdutos.btnEditarClick(Sender: TObject);
var
 Stream : TMemoryStream;
begin
  edtNome.Text               := dbCtx.TProdutosNome.AsString;
  edtEstoqueMin.Text         := dbCtx.TProdutosEstoqueMinimo.AsString;
  edtNumeroSerie.Text        := dbCtx.TProdutosNumeroSerie.AsString;
  edtCodBarras.Text          := dbCtx.TProdutosCodigoBarras.AsString;
  vIdSessao                  := dbCtx.TProdutosidCategoria.AsString;
  edtSessao.Text             := dbCtx.TProdutoscategoria.AsString;
  cbxSegmento.ItemIndex      := dbCtx.TProdutosidSegmento.AsInteger;
  vIdGrupo                   := dbCtx.TProdutosidgrupo.AsString;
  vIdSubGrupo                := dbCtx.TProdutosidsubgrupo.AsString;
  vIdMarca                   := dbCtx.TProdutosidmarca.AsString;
  edtGrupo.Text              := dbCtx.TProdutosgrupo.AsString;
  edtSubGrupo.Text           := dbCtx.TProdutossubgrupo.AsString;
  cbxUnidadeMedida.ItemIndex := cbxUnidadeMedida.Items.IndexOf(dbCtx.TProdutosunidademedida.AsString);
  edtCodigoFabricante.Text   := dbCtx.TProdutoscodigofabricante.AsString;
  chkInativo.IsChecked       := dbCtx.TProdutosStatus.AsInteger =0;
  chkDefensivos.IsChecked    := dbCtx.TProdutosdefensivos.AsInteger =1;
  if dbCtx.TProdutosidSegmento.AsInteger=1 then
  begin
   chkDefensivos.IsChecked := dbCtx.TProdutosdefensivos.AsInteger=1;
   chkDefensivos.Visible := true;
  end;
  if dbCtx.TProdutosImg.AsString.Length>0 then
  begin
   Stream := TMemoryStream.Create;
   dbCtx.TProdutosImg.SaveToStream(Stream);
   imgProduto.Bitmap.LoadFromStream(Stream);
  end
  else
   imgProduto.Bitmap.Assign(nil);
  dbCtx.TProdutos.Edit;
  inherited;
end;

procedure TfrmCadProdutos.btnLimparImgClick(Sender: TObject);
begin
 imgProduto.Bitmap.Assign(nil);
end;

procedure TfrmCadProdutos.CarregaCombos;
begin
 TThread.CreateAnonymousThread(
 procedure
 begin
 end).Start;
end;

procedure TfrmCadProdutos.cbxCategoriaFKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
var
  aStr:string;
  I: Integer;
begin
  if key=vkReturn then exit;
  if (keychar in [chr(48)..chr(57)]) or (keychar in [chr(65)..chr(90)]) or (keychar in [chr(97)..chr(122)]) then begin
    if MilliSecondsBetween(LastTimeKeydown,Now)<500 then
      keys:=keys+keychar
    else
      keys:=keychar;
    LastTimeKeydown:=Now;
  end;
  inherited;
end;

procedure TfrmCadProdutos.cbxSegmentoChange(Sender: TObject);
begin
 chkDefensivos.Visible   := cbxSegmento.ItemIndex=1
end;

procedure TfrmCadProdutos.cbxUnidadeMedidaKeyDown(Sender: TObject;
  var Key: Word; var KeyChar: Char; Shift: TShiftState);
var
  aStr:string;
  I: Integer;
begin
  if key=vkReturn then exit;
  if (keychar in [chr(48)..chr(57)]) or (keychar in [chr(65)..chr(90)]) or (keychar in [chr(97)..chr(122)]) then begin
    if MilliSecondsBetween(LastTimeKeydown,Now)<500 then
      keys:=keys+keychar
    else
      keys:=keychar;
    LastTimeKeydown:=Now;
    for I := 0 to cbxUnidadeMedida.Items.Count-1 do
      if uppercase(copy(cbxUnidadeMedida.items[i],0,keys.length))=uppercase(keys) then begin
        cbxUnidadeMedida.itemindex:=i;
        exit;  //first item found is good
      end;
  end;
  inherited;
end;

procedure TfrmCadProdutos.ClearEditButton1Click(Sender: TObject);
begin
 EdtCategoriaF.Text:='';
end;

procedure TfrmCadProdutos.ClearEditButton2Click(Sender: TObject);
begin
 edtGrupoF.Text:='';
end;

procedure TfrmCadProdutos.ClearEditButton3Click(Sender: TObject);
begin
 edtSubGrupo.Text :='';
end;

procedure TfrmCadProdutos.ClearEditButton4Click(Sender: TObject);
begin
 edtMarcaF.Text :='';
end;

procedure TfrmCadProdutos.EditButton1Click(Sender: TObject);
begin
  frmAuxCategoriasProd := TfrmAuxCategoriasProd.Create(Self);
  try
    frmAuxCategoriasProd.ShowModal;
  finally
    vIdSessao      := dbCtx.TAuxCategoriasid.AsString;
    edtSessao.Text := dbCtx.TAuxCategoriasnome.AsString;
  end;
end;

procedure TfrmCadProdutos.EditButton2Click(Sender: TObject);
begin
  frmAuxSubGrupo := TfrmAuxSubGrupo.Create(Self);
  try
    frmAuxSubGrupo.ShowModal;
  finally
    vIdSubGrupo      := dbCtx.TAuxSubGrupoid.AsString;
    edtSubGrupo.Text := dbCtx.TAuxSubGruponome.AsString;
  end;
end;

procedure TfrmCadProdutos.EditButton3Click(Sender: TObject);
begin
 frmAuxGrupo := TfrmAuxGrupo.Create(Self);
  try
    frmAuxGrupo.ShowModal;
  finally
    vIdGrupo      := dbCtx.TAuxGrupoid.AsString;
    edtGrupo.Text := dbCtx.TAuxGruponome.AsString;
  end;
end;

procedure TfrmCadProdutos.EditButton4Click(Sender: TObject);
begin
 frmCadAuxMarcas := TfrmCadAuxMarcas.Create(Self);
  try
    frmCadAuxMarcas.ShowModal;
  finally
    vIdMarca      := dbCtx.TAuxMarcaid.AsString;
    edtMarca.Text := dbCtx.TAuxMarcanome.AsString;
  end;
end;

procedure TfrmCadProdutos.edtEstoqueMinExit(Sender: TObject);
begin
 TThread.CreateAnonymousThread(
  procedure
  begin
    TThread.Synchronize( nil,
      procedure
      begin
        edtNumeroSerie.SetFocus;
      end
    );
  end
  ).Start;
end;

procedure TfrmCadProdutos.edtEstoqueMinKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
 if ((keyChar in ['0'..'9',','] = false) and (word(key) <> vk_back)) then
 begin
   KeyChar := #0;
 end;
end;

procedure TfrmCadProdutos.edtNomeExit(Sender: TObject);
begin
  TThread.CreateAnonymousThread(
  procedure
  begin
    TThread.Synchronize( nil,
      procedure
      begin
        edtSessao.SetFocus;
      end
    );
  end
  ).Start;
end;

procedure TfrmCadProdutos.FormKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
 if(key=13) and (tbPrincipal.TabIndex=0) then
  Filtro;
end;

procedure TfrmCadProdutos.FormShow(Sender: TObject);
begin
 TThread.CreateAnonymousThread(
 procedure
 begin
   TThread.Synchronize(nil,procedure
   begin
//    CarregaCombos;
//    layImg.Visible := false;
//    dbCtx.TProdutos.Close;
//    dbCtx.TProdutos.ResourceOptions.SilentMode := True;
//    dbCtx.TProdutos.Open;
//    dbCtx.TProdutos.Filtered := false;
//    dbCtx.TProdutos.Filter   := 'and status=1';
//    dbCtx.TProdutos.Filtered := true;
//    dbCtx.AbreProdutos('');
    inherited;
   end);
 end).Start;
 inherited;
end;

procedure TfrmCadProdutos.Image10Click(Sender: TObject);
begin
 layImg.Visible := false;
end;

procedure TfrmCadProdutos.LimpaCampos;
begin
 edtCodigoFabricante.Text     :='';
 edtNome.Text                 :='';
 edtSessao.Text               :='';
 edtGrupo.Text                :='';
 edtSubGrupo.Text             :='';
 cbxSegmento.ItemIndex        :=-1;
 cbxUnidadeMedida.ItemIndex   :=-1;
 edtEstoqueMin.Text           :='';
 edtNumeroSerie.Text          :='';
 edtCodBarras.Text            :='';
  imgProduto.Bitmap.Assign(nil);
end;

procedure TfrmCadProdutos.mnuVerImagemClick(Sender: TObject);
var
 Stream : TMemoryStream;
begin
  if dbCtx.TProdutosImg.AsString.Length>0 then
  begin
   Stream := TMemoryStream.Create;
   dbCtx.TProdutosImg.SaveToStream(Stream);
   imgVisualizar.Bitmap.LoadFromStream(Stream);
   lblNomeProduto.Text  := dbCtx.TProdutosNome.AsString;
   layImg.Visible := true;
  end
  else
    MyShowMessage('Produtor sem Imagem para Exibir',false);
end;

procedure TfrmCadProdutos.btnBuscaCategoriaFClick(Sender: TObject);
begin
  frmAuxCategoriasProd := TfrmAuxCategoriasProd.Create(nil);
  try
    frmAuxCategoriasProd.ShowModal;
  finally
    EdtCategoriaF.text         := dbCtx.TAuxCategoriasnome.AsString;
    vIdCategoriaF              := dbCtx.TAuxCategoriasid.AsString;
    frmAuxCategoriasProd.Free;
  end;
end;

procedure TfrmCadProdutos.btnBuscaGrupoClick(Sender: TObject);
begin
  frmAuxGrupo := TfrmAuxGrupo.Create(nil);
  try
    frmAuxGrupo.ShowModal;
  finally
    edtGrupoF.text              := dbCtx.TAuxGruponome.AsString;
    vIdGrupoF                   := dbCtx.TAuxGrupoid.AsString;
    frmAuxGrupo.Free;
  end;
end;

procedure TfrmCadProdutos.btnBuscarListaClick(Sender: TObject);
begin
 Filtro;
end;

procedure TfrmCadProdutos.btnBuscarMarcaFClick(Sender: TObject);
begin
  frmCadAuxMarcas := TfrmCadAuxMarcas.Create(nil);
  try
    frmCadAuxMarcas.ShowModal;
  finally
    edtMarcaF.text         := dbCtx.TAuxMarcanome.AsString;
    vIdMarcaF              := dbCtx.TAuxMarcaid.AsString;
    frmCadAuxMarcas.Free;
  end;
end;

procedure TfrmCadProdutos.btnBuscaSubGrupoClick(Sender: TObject);
begin
  frmAuxSubGrupo := TfrmAuxSubGrupo.Create(nil);
  try
    frmAuxSubGrupo.ShowModal;
  finally
    edtSubGrupoF.text              := dbCtx.TAuxSubGruponome.AsString;
    vIdSubGrupoF                   := dbCtx.TAuxSubGrupoid.AsString;
    frmAuxSubGrupo.Free;
  end;
end;

procedure TfrmCadProdutos.StringGrid1CellDblClick(const Column: TColumn;
  const Row: Integer);
begin
  Close;
end;

end.
