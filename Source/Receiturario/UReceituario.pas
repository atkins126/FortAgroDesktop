unit UReceituario;

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
  FMX.ListBox, FMX.DateTimeCtrls;

type
  TfrmReceituario = class(TfrmCadPadrao)
    Label4: TLabel;
    layProdutos: TLayout;
    Layout2: TLayout;
    recSubMenu: TRectangle;
    btnAddDetReceituario: TRectangle;
    Image8: TImage;
    Label6: TLabel;
    btnDropProduto: TRectangle;
    Image10: TImage;
    Label8: TLabel;
    StringGrid2: TStringGrid;
    BindSourceDB1: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    BindingsList1: TBindingsList;
    BindSourceDB2: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB2: TLinkGridToDataSource;
    Rectangle3: TRectangle;
    Layout12: TLayout;
    edtResponsavel: TEdit;
    EditButton2: TEditButton;
    Label5: TLabel;
    edtNome: TEdit;
    layAddDetReceituario: TLayout;
    Rectangle2: TRectangle;
    ToolBar4: TToolBar;
    Rectangle8: TRectangle;
    Label11: TLabel;
    Image12: TImage;
    Rectangle1: TRectangle;
    Layout8: TLayout;
    Label15: TLabel;
    edttalhao: TEdit;
    EditButton1: TEditButton;
    TabDetTalhao: TTabControl;
    tbiTalhao: TTabItem;
    Layout9: TLayout;
    Rectangle4: TRectangle;
    Label16: TLabel;
    Image11: TImage;
    Rectangle12: TRectangle;
    Label17: TLabel;
    Image13: TImage;
    tbiProduto: TTabItem;
    Layout3: TLayout;
    Rectangle5: TRectangle;
    Label9: TLabel;
    Image7: TImage;
    Rectangle7: TRectangle;
    Label10: TLabel;
    Image9: TImage;
    Rectangle10: TRectangle;
    Layout6: TLayout;
    Label13: TLabel;
    edtProduto: TEdit;
    EditButton4: TEditButton;
    Rectangle9: TRectangle;
    Layout4: TLayout;
    cbxIndicacao: TComboBox;
    Layout11: TLayout;
    Label12: TLabel;
    Label14: TLabel;
    edtQtdIndicadaProduto: TEdit;
    Rectangle11: TRectangle;
    Layout7: TLayout;
    gridTalho: TStringGrid;
    LayTalhoes: TLayout;
    Layout10: TLayout;
    RecAddTalhao: TRectangle;
    btnAddTalhao: TRectangle;
    Image14: TImage;
    Label18: TLabel;
    btnDropTalhao: TRectangle;
    Image15: TImage;
    Label19: TLabel;
    StringGrid3: TStringGrid;
    ToolBar5: TToolBar;
    Layout1: TLayout;
    Label20: TLabel;
    Layout13: TLayout;
    Label21: TLabel;
    BindSourceDB3: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB3: TLinkGridToDataSource;
    LinkGridToDataSourceBindSourceDB32: TLinkGridToDataSource;
    Layout14: TLayout;
    lblAreaTotal: TLabel;
    Layout15: TLayout;
    lblAreaTotal1: TLabel;
    Rectangle6: TRectangle;
    btnRelChuva: TRectangle;
    Image18: TImage;
    Label30: TLabel;
    GroupBox1: TGroupBox;
    Label22: TLabel;
    Label23: TLabel;
    edtDataInicio: TDateEdit;
    edtDataFim: TDateEdit;
    Label24: TLabel;
    cbxStatusF: TComboBox;
    Label25: TLabel;
    edtNumeroF: TEdit;
    Rectangle13: TRectangle;
    Layout16: TLayout;
    Layout17: TLayout;
    Layout18: TLayout;
    Label26: TLabel;
    Label27: TLabel;
    edtDataRecomentacao: TDateEdit;
    edtDataPrevReco: TDateEdit;
    Rectangle14: TRectangle;
    Layout19: TLayout;
    Layout20: TLayout;
    Label29: TLabel;
    edtUniMed: TEdit;
    Label28: TLabel;
    edtPesoEmbalagem: TEdit;
    Label31: TLabel;
    edtTotalAplicar: TEdit;
    lblAreaTotalProdutos: TLabel;
    Rectangle15: TRectangle;
    Layout21: TLayout;
    Layout22: TLayout;
    Label32: TLabel;
    Layout23: TLayout;
    edtObservacao: TEdit;
    Layout24: TLayout;
    Label7: TLabel;
    Label33: TLabel;
    edtCultura: TEdit;
    EditButton3: TEditButton;
    edtCulturaFiltro: TEdit;
    Label34: TLabel;
    btnFichaRetirada: TRectangle;
    Image16: TImage;
    Label35: TLabel;
    procedure EditButton2Click(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure StringGrid1CellClick(const Column: TColumn; const Row: Integer);
    procedure Image12Click(Sender: TObject);
    procedure EditButton4Click(Sender: TObject);
    procedure btnAddDetReceituarioClick(Sender: TObject);
    procedure Rectangle7Click(Sender: TObject);
    procedure btnDropProdutoClick(Sender: TObject);
    procedure btnConfirmaClick(Sender: TObject);
    procedure edtQtdIndicadaProdutoKeyUp(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure StringGrid1CellDblClick(const Column: TColumn;
      const Row: Integer);
    procedure btnFecharClick(Sender: TObject);
    procedure EditButton1Click(Sender: TObject);
    procedure btnAddTalhaoClick(Sender: TObject);
    procedure Rectangle12Click(Sender: TObject);
    procedure btnRelChuvaClick(Sender: TObject);
    procedure StringGrid1SelChanged(Sender: TObject);
    procedure btnDropTalhaoClick(Sender: TObject);
    procedure gridTalhoEditingDone(Sender: TObject; const ACol, ARow: Integer);
    procedure btnCancelaClick(Sender: TObject);
    procedure edtQtdIndicadaProdutoChangeTracking(Sender: TObject);
    procedure StringGrid1EditingDone(Sender: TObject; const ACol,
      ARow: Integer);
    procedure EditButton3Click(Sender: TObject);
    procedure btnFichaRetiradaClick(Sender: TObject);
    procedure btnBuscarListaClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
  private
    vIDResponsavel,vIdProduto,vIdTalhao,vId,vIdCultura :string;

    procedure SomaColuna;
    procedure Filtro;
  public
    vAreaTotal:Double;
  end;

var
  frmReceituario: TfrmReceituario;

implementation

{$R *.fmx}

uses DataContext, UPrincipal, UUsuarios, UProdutos, dmReplicacao, UTalhoes,
  UdmReport, UDmReports, UAuxCultura;

procedure TfrmReceituario.btnAddClick(Sender: TObject);
begin
  vId:=dbCtx.RetornaMaxIdReceituario;
  edtNome.Text := '';
  edtResponsavel.Text := '';
  dbCtx.TReceituario.Close;
  dbCtx.TReceituario.Open;
  dbCtx.TReceituario.Insert;
  edtNome.Text    := vId;
  edtNome.Enabled := false;
  inherited;
end;

procedure TfrmReceituario.btnAddDetReceituarioClick(Sender: TObject);
begin
  if lblAreaTotal1.Text='Total(ha): 0.00' then
  begin
    MyShowMessage('Informe os talhoes antes dos produtos!!',false);
    Exit;
  end;

  cbxIndicacao.ItemIndex       := -1;
  edtQtdIndicadaProduto.Text   := '';
  edtProduto.Text              := '';
  edttalhao.Text               := '';
  dbCtx.TDetReceituario.Insert;
  TabDetTalhao.TabPosition     := TTabPosition.None;
  TabDetTalhao.ActiveTab       := tbiProduto;
  layAddDetReceituario.Visible := true;
end;

procedure TfrmReceituario.btnAddTalhaoClick(Sender: TObject);
begin
  edttalhao.Text               := '';
  TabDetTalhao.TabPosition     := TTabPosition.None;
  TabDetTalhao.ActiveTab       := tbiTalhao;
  layAddDetReceituario.Visible := true;
end;

procedure TfrmReceituario.btnBuscarListaClick(Sender: TObject);
begin
 Filtro;
end;

procedure TfrmReceituario.btnCancelaClick(Sender: TObject);
begin
  layAddDetReceituario.Visible := false;
  MudarAba(tbiLista,sender);
end;

procedure TfrmReceituario.btnConfirmaClick(Sender: TObject);
begin
  if edtCultura.Text.Length=0 then
  begin
    MyShowMessage('Informe a Cultura!!',false);
    edtCultura.SetFocus;
    Exit;
  end;
  if edtNome.Text.Length=0 then
  begin
    MyShowMessage('Informe o Nome!!',false);
    edtNome.SetFocus;
    Exit;
  end;
  if edtDataPrevReco.Date<edtDataRecomentacao.Date then
  begin
    MyShowMessage('Data Prevista de Aplivação nao pode ser menor que a data da Recomendação!',false);
    edtDataPrevReco.SetFocus;
    Exit;
  end;
  if edtResponsavel.Text.Length=0 then
  begin
    MyShowMessage('Informe o Responsavel!!',false);
    edtResponsavel.SetFocus;
    Exit;
  end;

  dbCtx.TReceituarionome.AsString           := edtNome.Text;
  dbCtx.TReceituarioidresponsavel.AsString  := vIDResponsavel;
  dbCtx.TReceituarioidcultura.AsString      := vIdCultura;
  if dbCtx.TReceituario.State=dsEdit then
  begin
   dbCtx.TReceituarioIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
   dbCtx.TReceituarioDataAlteracao.AsDateTime     := now;
   dbCtx.AlteraFlaSynAWS_ZERO('receiturario',dbCtx.TReceituarioID.AsString);
  end;
  if dbCtx.TReceituario.State=dsInsert then
  begin
   dbCtx.TReceituarioid.AsString := vId;
   if not dbCtx.VerificaCadastroExiste('NOME','receiturario',edtNome.Text) then
   begin
     MyShowMessage('Ja existe uma Cultura com esse nome:'+edtNome.Text,false);
     Exit;
   end;
   dbCtx.TReceituarioIdUsuario.AsString := dbCtx.vIdUsuarioLogado;
  end;
  dbCtx.TReceituariodatarecomendacao.AsDateTime  := edtDataRecomentacao.DateTime;
  dbCtx.TReceituariodataprevaplicacao.AsDateTime := edtDataPrevReco.DateTime;
  try
   if edtObservacao.Text.Length>0 then
    dbCtx.TReceituarioobservacao.AssTring :=edtObservacao.Text
   else
    dbCtx.TReceituarioobservacao.AsVariant:=null;

   dbCtx.TReceituario.ApplyUpdates(-1);
   dbCtx.TReceituario.Close;
   dbCtx.TReceituario.Open();
   MyShowMessage('Receituário Cadastrada com sucesso!',false);
   MudarAba(tbiLista,Sender);
  except
   on E : Exception do
     MyShowMessage('Erro ao Inserir Receituário:'+E.Message,false);
  end;
end;

procedure TfrmReceituario.btnDeletarClick(Sender: TObject);
begin
   MyShowMessage('Deseja Realmente Deletar esse registro?',true);
   case frmPrincipal.vMsgConfirma of
     1:begin
        dbCtx.TReceituario.Edit;
        dbCtx.TReceituarioStatus.AsInteger := -1;
        dbCtx.TReceituarioIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
        dbCtx.TReceituarioDataAlteracao.AsDateTime     := now;
        dbCtx.AlteraFlaSynAWS_ZERO('receiturario',dbCtx.TReceituarioID.AsString);
        try
          dbCtx.TReceituario.ApplyUpdates(-1);
          MyShowMessage('Registro Excluido com sucesso!',false);
          dbCtx.TReceituario.Close;
          dbCtx.TReceituario.Open();
          lblTotalRegistro.Text := intToStr(StringGrid1.RowCount);
        except
         on E : Exception do
          ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
        end;
     end;
   end;
end;

procedure TfrmReceituario.btnEditarClick(Sender: TObject);
begin
  edtNome.Text              := dbCtx.TReceituarionome.AsString;
  edtResponsavel.Text       := dbCtx.TReceituarioresponsavel.AsString;
  edtDataRecomentacao.Date  := dbCtx.TReceituariodatarecomendacao.AsDateTime;
  edtObservacao.Text        := dbCtx.TReceituarioObservacao.AsString;
  vIDResponsavel            := dbCtx.TReceituarioidresponsavel.AsString;
  if dbCtx.TReceituariodataprevaplicacao.AsString.Length>0 then
   edtDataPrevReco.Date      := dbCtx.TReceituariodataprevaplicacao.AsDateTime
  else
   edtDataPrevReco.Date      := edtDataRecomentacao.Date;
  dbCtx.TReceituario.Edit;
  inherited;
end;

procedure TfrmReceituario.btnFecharClick(Sender: TObject);
begin
// if dbCtx.vTipoBDConfig=2 then
// begin
//  if DataModule1.Sincronizando=0 then
//  begin
//   TThread.Synchronize(nil,procedure
//   begin
//     MyShowMessage('Aguarde Sincronizando Dados',false);
//     DataModule1.ReplicaReceiturario('');
//     DataModule1.ReplicaDetReceiturario('');
//     DataModule1.ReplicaDetReceiturarioTalhao('');
//     inherited;
//   end);
//  end
//  else
//  begin
//   TThread.Synchronize(nil,procedure
//   begin
//     MyShowMessage('Aguarde Sincronizando Dados',false);
//   end);
//  end;
// end
// else
  inherited;
end;

procedure TfrmReceituario.btnFichaRetiradaClick(Sender: TObject);
begin
 dmReport.AbreFichaRetirada(dbCtx.TReceituarioid.AsString);
end;

procedure TfrmReceituario.btnRelChuvaClick(Sender: TObject);
begin
 if dmRel=nil then
  dmRel :=  TdmRel.Create(Self);

 if dbCtx.TReceituarioid.AsString.Length>0 then
  dmRel.AbreReceituario(dbCtx.TReceituarioid.AsString);
end;

procedure TfrmReceituario.EditButton1Click(Sender: TObject);
var
 I:integer;
begin
  frmPrincipal.vTSelectTalhao:=1;
  frmTalhoes := TfrmTalhoes.Create(Self);
  try
    frmTalhoes.ShowModal;
  finally
   for I := 0 to frmTalhoes.StringGrid1.RowCount-1 do
   begin
     if frmTalhoes.StringGrid1.Cells[0,I]='True' then
     begin
       dbCtx.TDetReceiturioTalhao.Close;
       dbCtx.TDetReceiturioTalhao.Open;
       dbCtx.TDetReceiturioTalhao.Insert;
       vIdTalhao             := frmTalhoes.StringGrid1.Cells[1,I];
       dbCtx.TDetReceiturioTalhaoidreceiturario.AsString := dbCtx.TReceituarioid.AsString;
       dbCtx.TDetReceiturioTalhaoidusuario.AsString      := dbCtx.vIdUsuarioLogado;
       dbCtx.TDetReceiturioTalhaoidtalhao.AsString       := vIdTalhao;
       dbCtx.TDetReceiturioTalhaoareahe.AsString         := frmTalhoes.StringGrid1.Cells[4,I];
       try
        dbCtx.TDetReceiturioTalhao.ApplyUpdates(-1);
       except
        on E : Exception do
         myShowMessage('Erro ao inserir Detalhe:'+E.Message,false);
       end;
     end;
   end;
    frmTalhoes.Free;
    dbCtx.AbrirDetReceiturario(dbCtx.TReceituarioid.AsString);
    SomaColuna;
  end;
end;

procedure TfrmReceituario.EditButton2Click(Sender: TObject);
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

procedure TfrmReceituario.EditButton3Click(Sender: TObject);
begin
  frmAuxCultura := TfrmAuxCultura.Create(Self);
  try
    frmAuxCultura.ShowModal;
  finally
    vIdCultura        := dbCtx.TAuxCulturasid.AsString;
    edtCultura.Text   := dbCtx.TAuxCulturasnome.AsString;
    frmAuxCultura.Free;
  end;
end;

procedure TfrmReceituario.EditButton4Click(Sender: TObject);
begin
 frmCadProdutos := TfrmCadProdutos.Create(Self);
  try
    dbCtx.TProdutos.Filtered :=false;
    dbCtx.TProdutos.Filter   :='defensivos=1';
    dbCtx.TProdutos.Filtered :=true;
    frmCadProdutos.ShowModal;
  finally
    vIdProduto            := dbCtx.TProdutosid.AsString;
    edtProduto.Text       := dbCtx.TProdutosnome.AsString;
    edtUniMed.Text        := dbCtx.TProdutosunidademedida.AsString;
    edtPesoEmbalagem.Text := dbCtx.TProdutospesoembalagem.AsString;
    frmCadProdutos.Free;
  end;
end;

procedure TfrmReceituario.edtQtdIndicadaProdutoChangeTracking(Sender: TObject);
begin
 if(edtQtdIndicadaProduto.Text.Length>0)and(edtPesoEmbalagem.Text.Length>0) then
 begin
    if vAreaTotal>0 then
    begin
      if edtPesoEmbalagem.Text<>'0' then
      edtTotalAplicar.Text :=
       FloatToStr(vAreaTotal * StrToFloat(edtQtdIndicadaProduto.Text)/StrToFloat(edtPesoEmbalagem.Text))+
       ' EMBALAGEN(S)';
    end;
 end
 else
 begin
   edtTotalAplicar.Text :='';
 end;
end;

procedure TfrmReceituario.edtQtdIndicadaProdutoKeyUp(Sender: TObject;
  var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
 if (keyChar in ['0'..'9',','] = false) then
 begin
   KeyChar := #0;
 end;
end;

procedure TfrmReceituario.Filtro;
var
 vFiltro:string;
 vDataDe,vDataAte:string;
begin
 vFiltro:='';
 if edtNumeroF.Text.Length>0 then
 begin
  vFiltro:=vFiltro+' and b.id ='+edtNumeroF.Text;
  dbCtx.AbreReceituario(vFiltro);
 end
 else
 begin
   vDataDe  := FormatDateTime('yyyy-mm-dd',edtDataInicio.Date).QuotedString;
   vDataAte := FormatDateTime('yyyy-mm-dd',edtDataFim.Date).QuotedString;
   vFiltro  := vFiltro+' and cast(b.datareg as date) between '+vDataDe+' and '+vDataAte;
   if edtNomeFiltro.Text.Length>0 then
    vFiltro:=vFiltro+' and u.nome like '+QuotedStr('%'+edtNomeFiltro.Text+'%');
   if cbxStatusF.ItemIndex>0 then
    vFiltro:=vFiltro+' and b.status ='+intToStr(cbxStatusF.ItemIndex);
   if edtCulturaFiltro.Text.Length>0 then
    vFiltro:=vFiltro+' and g.nome like '+QuotedStr('%'+edtCulturaFiltro.Text+'%');
   dbCtx.AbreReceituario(vFiltro);
 end;
end;

procedure TfrmReceituario.FormKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
 if(key=13) and (tbPrincipal.TabIndex=0) then
  Filtro;
end;

procedure TfrmReceituario.FormShow(Sender: TObject);
begin
  StringGrid1.RowCount :=0;
  StringGrid2.RowCount :=0;
  StringGrid3.RowCount :=0;
  edtDataInicio.Date   := date-7;
  edtDataFim.Date      := date;
  cbxStatusF.ItemIndex :=0;
  edtDataInicio.Date   := date-30;
  edtDataFim.Date      := date;
  layAddDetReceituario.Visible := false;
  recSubMenu.Enabled := false;
  StringGrid1CellClick(StringGrid1.Columns[0],1);
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
end;

procedure TfrmReceituario.gridTalhoEditingDone(Sender: TObject; const ACol,
  ARow: Integer);
begin
  dbCtx.TDetReceiturioTalhao.Edit;
  dbCtx.TDetReceiturioTalhaoareahe.AsString := gridTalho.Cells[1,gridTalho.Row];
  dbCtx.TDetReceiturioTalhao.ApplyUpdates(-1);
  SomaColuna;
end;

procedure TfrmReceituario.Image12Click(Sender: TObject);
begin
 layAddDetReceituario.Visible := false;
 SomaColuna;
end;

procedure TfrmReceituario.btnDropProdutoClick(Sender: TObject);
begin
   MyShowMessage('Deseja Realmente Deletar esse registro?',true);
   case frmPrincipal.vMsgConfirma of
     1:begin
        dbCtx.TDetReceituario.Edit;
        dbCtx.TDetReceituarioStatus.AsInteger := -1;
        dbCtx.TDetReceituarioIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
        dbCtx.TDetReceituarioDataAlteracao.AsDateTime     := now;
        dbCtx.AlteraFlaSynAWS_ZERO('DetReceiturario',dbCtx.TDetReceituarioID.AsString);
        try
          dbCtx.TDetReceituario.ApplyUpdates(-1);
          MyShowMessage('Registro Excluido com sucesso!',false);
          dbCtx.TDetReceituario.Close;
          dbCtx.TDetReceituario.Open();
          dbCtx.AbrirDetReceiturario(dbCtx.TReceituarioid.AsString);
        except
         on E : Exception do
          ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
        end;
     end;
   end;
end;

procedure TfrmReceituario.btnDropTalhaoClick(Sender: TObject);
begin
  MyShowMessage('Deseja Realmente Deletar esse registro?',true);
   case frmPrincipal.vMsgConfirma of
     1:begin
        dbCtx.TDetReceiturioTalhao.Edit;
        dbCtx.TDetReceiturioTalhaoStatus.AsInteger := -1;
        dbCtx.TDetReceiturioTalhaoIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
        dbCtx.TDetReceiturioTalhaoDataAlteracao.AsDateTime     := now;
        dbCtx.AlteraFlaSynAWS_ZERO('detreceiturariotalhao',dbCtx.TDetReceiturioTalhaoID.AsString);
        try
          dbCtx.TDetReceiturioTalhao.ApplyUpdates(-1);
          MyShowMessage('Registro Excluido com sucesso!',false);
          dbCtx.TDetReceiturioTalhao.Close;
          dbCtx.TDetReceiturioTalhao.Open();
          dbCtx.AbrirDetReceiturario(dbCtx.TReceituarioid.AsString);
        except
         on E : Exception do
          ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
        end;
     end;
   end;
end;

procedure TfrmReceituario.Rectangle12Click(Sender: TObject);
begin
 if dbCtx.TDetReceiturioTalhao.RecordCount=0 then
 begin
  MyShowMessage('Insira pelo menos um talhão',false);
  Exit;
 end
 else
 begin
   MyShowMessage('Talhões adicionados com sucesso!',false);
   layAddDetReceituario.Visible := false;
 end;
end;

procedure TfrmReceituario.Rectangle7Click(Sender: TObject);
begin
 if cbxIndicacao.ItemIndex=-1 then
 begin
   MyShowMessage('Informe a Indicação!',false);
   cbxIndicacao.SetFocus;
   Exit;
 end;


 if edtProduto.Text.Length=0 then
 begin
   MyShowMessage('Informe o Produto!',false);
   edtProduto.SetFocus;
   Exit;
 end;
 if edtQtdIndicadaProduto.Text.Length=0 then
 begin
   MyShowMessage('Informe a Qtde. Indicada!',false);
   edtQtdIndicadaProduto.SetFocus;
   Exit;
 end;
 dbCtx.TDetReceituarioidreceiturario.AsString := dbCtx.TReceituarioid.AsString;
 dbCtx.TDetReceituarioidusuario.AsString      := dbCtx.vIdUsuarioLogado;
 dbCtx.TDetReceituariofinalidade.AsString     := cbxIndicacao.Selected.Text;
 dbCtx.TDetReceituarioqtdporhe.AsString       := edtQtdIndicadaProduto.Text;
 dbCtx.TDetReceituarioidproduto.AsString      := vIdProduto;
 try
  dbCtx.TDetReceituario.ApplyUpdates(-1);
  dbCtx.AbrirDetReceiturario(dbCtx.TReceituarioid.AsString);
  layAddDetReceituario.Visible := false;
 except
  on E : Exception do
   myShowMessage('Erro ao inserir Detalhe:'+E.Message,false);
 end;
end;

procedure TfrmReceituario.SomaColuna;
var
  Sum : Double;
  Val : Double;
  I   : Integer;
begin
  Sum := 0;
  I   := 0;
  for I := 0 to gridTalho.RowCount-1 do
  begin
   if TryStrToFloat(gridTalho.Cells[1,I],Val) then
    Sum := Sum + Val;
  end;
  if I>0 then
  begin
    lblAreaTotal.Text          := 'Total(ha):'+FormatFloat('####,##.00',Sum);
    lblAreaTotal1.Text         := 'Total(ha):'+FormatFloat('####,##.00',Sum);
    lblAreaTotalProdutos.Text  := 'Total(ha):'+FormatFloat('####,##.00',Sum);
    vAreaTotal                 := sum;
  end
  else
  begin
    lblAreaTotal.Text         := 'Total(ha): 0.00';
    lblAreaTotal1.Text        := 'Total(ha): 0.00';
  end
end;

procedure TfrmReceituario.StringGrid1CellClick(const Column: TColumn;
  const Row: Integer);
begin
  if dbCtx.TReceituarioid.AsString.Length>0 then
  begin
   recSubMenu.Enabled   := true;
   dbCtx.AbrirDetReceiturario(dbCtx.TReceituarioid.AsString);
   SomaColuna;
  end;
end;

procedure TfrmReceituario.StringGrid1CellDblClick(const Column: TColumn;
  const Row: Integer);
begin
  close;
end;

procedure TfrmReceituario.StringGrid1EditingDone(Sender: TObject; const ACol,
  ARow: Integer);
begin
 try
  dbCtx.TReceituario.ApplyUpdates(-1);
 except
  on E: Exception do
  begin
    MyShowMessage('Erro ao Alterar Data:'+E.Message,false);
  end;
 end;
end;

procedure TfrmReceituario.StringGrid1SelChanged(Sender: TObject);
begin
  if dbCtx.TReceituarioid.AsString.Length>0 then
  begin
   recSubMenu.Enabled   := true;
   dbCtx.AbrirDetReceiturario(dbCtx.TReceituarioid.AsString);
   SomaColuna;
  end;
end;

end.

