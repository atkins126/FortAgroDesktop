unit UCadRevisao;

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
  FMX.EditBox, FMX.NumberBox, System.Math.Vectors, FMX.Controls3D, FMX.Layers3D;

type
  TfrmCadRevisao = class(TfrmCadPadrao)
    BindSourceDB1: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    BindingsList1: TBindingsList;
    Layout1: TLayout;
    edtNome: TEdit;
    Label4: TLabel;
    Layout2: TLayout;
    Rectangle1: TRectangle;
    Layout3: TLayout;
    Layout4: TLayout;
    edtIntervalo: TEdit;
    Label5: TLabel;
    Rectangle2: TRectangle;
    Label6: TLabel;
    layDetalhes: TLayout;
    layItensRevisao: TLayout;
    layMaquinas: TLayout;
    Rectangle3: TRectangle;
    Label7: TLabel;
    Rectangle4: TRectangle;
    Label8: TLabel;
    Layout6: TLayout;
    Rectangle5: TRectangle;
    btnEditarRev: TRectangle;
    Label9: TLabel;
    btnIncluirItem: TRectangle;
    Image8: TImage;
    Label10: TLabel;
    btnDeletarItem: TRectangle;
    Image10: TImage;
    Label12: TLabel;
    Layout7: TLayout;
    Rectangle10: TRectangle;
    Rectangle11: TRectangle;
    Image11: TImage;
    Label13: TLabel;
    btnIncluirMaquina: TRectangle;
    Image12: TImage;
    Label14: TLabel;
    btnDeletarMaquina: TRectangle;
    Image14: TImage;
    Label16: TLabel;
    GridItens: TStringGrid;
    StringGrid3: TStringGrid;
    BindSourceDB2: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB2: TLinkGridToDataSource;
    BindSourceDB3: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB3: TLinkGridToDataSource;
    layNovoItem: TLayout;
    ToolBar4: TToolBar;
    Rectangle7: TRectangle;
    Label11: TLabel;
    Image13: TImage;
    Rectangle8: TRectangle;
    Layout9: TLayout;
    Layout10: TLayout;
    Rectangle9: TRectangle;
    Layout11: TLayout;
    Label15: TLabel;
    edtItemRevisao: TEdit;
    ClearEditButton5: TClearEditButton;
    Layout8: TLayout;
    Rectangle12: TRectangle;
    Layout12: TLayout;
    Label17: TLabel;
    edtProdutoUtilizado: TEdit;
    EditButton1: TEditButton;
    ClearEditButton1: TClearEditButton;
    Layout13: TLayout;
    Rectangle13: TRectangle;
    Layout14: TLayout;
    Label18: TLabel;
    edtqtde: TNumberBox;
    Layout15: TLayout;
    Rectangle14: TRectangle;
    Label19: TLabel;
    Image9: TImage;
    Rectangle15: TRectangle;
    Label20: TLabel;
    Image15: TImage;
    btnRel: TRectangle;
    Image16: TImage;
    Label23: TLabel;
    Layout16: TLayout;
    Rectangle16: TRectangle;
    Layout17: TLayout;
    rdManutencao: TRadioButton;
    rdLubrificacao: TRadioButton;
    rdVerificacao: TRadioButton;
    Layout3D1: TLayout3D;
    tabTipoItem: TTabControl;
    tbiManu: TTabItem;
    tbiLubrificar: TTabItem;
    Layout18: TLayout;
    Layout19: TLayout;
    Rectangle17: TRectangle;
    Layout20: TLayout;
    Label21: TLabel;
    edtLub: TEdit;
    tbiVerificar: TTabItem;
    Layout21: TLayout;
    Layout22: TLayout;
    Rectangle18: TRectangle;
    Layout23: TLayout;
    Label22: TLabel;
    edtVrific: TEdit;
    Layout24: TLayout;
    Rectangle19: TRectangle;
    Layout25: TLayout;
    Label24: TLabel;
    edtObsLub: TEdit;
    Layout26: TLayout;
    Rectangle20: TRectangle;
    Layout27: TLayout;
    Label25: TLabel;
    edtObsVerific: TEdit;
    Rectangle21: TRectangle;
    Rectangle22: TRectangle;
    Rectangle23: TRectangle;
    ClearEditButton2: TClearEditButton;
    ClearEditButton3: TClearEditButton;
    ClearEditButton4: TClearEditButton;
    ClearEditButton6: TClearEditButton;
    Layout28: TLayout;
    Rectangle24: TRectangle;
    Layout29: TLayout;
    Label26: TLabel;
    edtObsManu: TEdit;
    ClearEditButton7: TClearEditButton;
    btnBuscaItem: TEditButton;
    btnBuscaItemLubri: TEditButton;
    EditButton6: TEditButton;
    Image7: TImage;
    Label27: TLabel;
    edtMaquinaF: TEdit;
    btnBuscarLista: TButton;
    procedure btnAddClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure edtIntervaloKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnIncluirItemClick(Sender: TObject);
    procedure btnDeletarItemClick(Sender: TObject);
    procedure btnIncluirMaquinaClick(Sender: TObject);
    procedure btnDeletarMaquinaClick(Sender: TObject);
    procedure Rectangle14Click(Sender: TObject);
    procedure btnBuscaItemClick(Sender: TObject);
    procedure Rectangle15Click(Sender: TObject);
    procedure EditButton1Click(Sender: TObject);
    procedure Image13Click(Sender: TObject);
    procedure StringGrid1CellDblClick(const Column: TColumn;
      const Row: Integer);
    procedure btnRelClick(Sender: TObject);
    procedure rdManutencaoChange(Sender: TObject);
    procedure rdLubrificacaoChange(Sender: TObject);
    procedure rdVerificacaoChange(Sender: TObject);
    procedure btnBuscaItemLubriClick(Sender: TObject);
    procedure EditButton6Click(Sender: TObject);
    procedure edtNomeFiltroKeyUp(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnBuscarListaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    vIdItem,vIdProduto:string;
  end;

var
  frmCadRevisao: TfrmCadRevisao;

implementation

{$R *.fmx}

uses UPrincipal, DataContext, UDMRevisao, UItensRevisao, UCadMaquina, UProdutos;

procedure TfrmCadRevisao.btnAddClick(Sender: TObject);
begin
  edtNome.Text :='';
  dmRevisao.TRevisao.Close;
  dmRevisao.TRevisao.Open;
  dmRevisao.TRevisao.Insert;
  inherited;
end;

procedure TfrmCadRevisao.btnBuscaItemClick(Sender: TObject);
begin
  frmAuxItemRevisao := TfrmAuxItemRevisao.Create(Self);
  try
    frmAuxItemRevisao.ShowModal;
  finally
    if frmAuxItemRevisao.vIdSelectec.Length>0 then
    begin
      edtItemRevisao.Text := dmRevisao.TAuxRevisaoItemnome.AsString;
      vIdItem             := dmRevisao.TAuxRevisaoItemid.AsString;
    end;
    frmAuxItemRevisao.Free;
  end;
end;

procedure TfrmCadRevisao.btnBuscaItemLubriClick(Sender: TObject);
begin
  frmAuxItemRevisao := TfrmAuxItemRevisao.Create(Self);
  try
    frmAuxItemRevisao.ShowModal;
  finally
    if frmAuxItemRevisao.vIdSelectec.Length>0 then
    begin
      edtLub.Text         := dmRevisao.TAuxRevisaoItemnome.AsString;
      vIdItem             := dmRevisao.TAuxRevisaoItemid.AsString;
    end;
    frmAuxItemRevisao.Free;
  end;
end;

procedure TfrmCadRevisao.btnBuscarClick(Sender: TObject);
begin
  dmRevisao.TRevisaoItens.Edit;
  rdManutencao.IsChecked   := dmRevisao.TRevisaoItenstipo.AsInteger=0;
  rdLubrificacao.IsChecked := dmRevisao.TRevisaoItenstipo.AsInteger=1;
  rdVerificacao.IsChecked  := dmRevisao.TRevisaoItenstipo.AsInteger=2;
  tabTipoItem.TabPosition  := TTabPosition.None;
  vIdItem                  := dmRevisao.TRevisaoItensIditem.AsString;
  vIdProduto               := dmRevisao.TRevisaoItensidproduto.AsString;
  edtItemRevisao.Text      := dmRevisao.TRevisaoItensitem.AsString;
  if dmRevisao.TRevisaoItenstipo.AsInteger=0 then
  begin
   edtProdutoUtilizado.Text := dmRevisao.TRevisaoItensproduto.AsString;
   edtObsManu.Text          := dmRevisao.TRevisaoItensobservacao.AsString;
   rdManutencaoChange(sender);
  end;
  if dmRevisao.TRevisaoItenstipo.AsInteger=1 then
  begin
   edtLub.Text              := dmRevisao.TRevisaoItensproduto.AsString;
   edtObsLub.Text           :=dmRevisao.TRevisaoItensobservacao.AsString;
   rdLubrificacaoChange(Sender);
  end;
  if dmRevisao.TRevisaoItenstipo.AsInteger=2 then
  begin
   edtVrific.Text           := dmRevisao.TRevisaoItensproduto.AsString;
   edtObsVerific.Text       := dmRevisao.TRevisaoItensobservacao.AsString;
   rdVerificacaoChange(Sender);
  end;
  edtqtde.Value             := dmRevisao.TRevisaoItensqtde.AsFloat;
  layNovoItem.Visible       := true;
end;

procedure TfrmCadRevisao.btnBuscarListaClick(Sender: TObject);
begin
 dmRevisao.AbreRevisao(edtNomeFiltro.Text,edtMaquinaF.Text);
 dmRevisao.TRevisaoItens.Open;
 dmRevisao.TRevisaoMaquinas.Open();
 lblTotalRegistro.Text := intToStr(StringGrid1.RowCount);
end;

procedure TfrmCadRevisao.btnDeletarClick(Sender: TObject);
begin
  MyShowMessage('Deseja Realmente Deletar esse registro?',true);
   case frmPrincipal.vMsgConfirma of
     1:begin
        dmRevisao.TRevisao.Edit;
        dmRevisao.TRevisaoStatus.AsInteger := -1;
        dmRevisao.TRevisaoIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
        dmRevisao.TRevisaoDataAlteracao.AsDateTime     := now;
        dmRevisao.TRevisaosyncaws.AsInteger            :=0;
        try
          dmRevisao.TRevisaosyncaws.AsInteger          :=0;
          dmRevisao.TRevisao.ApplyUpdates(-1);
          dbCtx.FDConPG.Commit;
          MyShowMessage('Registro Excluido com sucesso!',false);
          dmRevisao.TRevisao.Close;
          dmRevisao.TRevisao.Open();
          lblTotalRegistro.Text := intToStr(StringGrid1.RowCount);
        except
         on E : Exception do
          ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
        end;
     end;
   end;

end;

procedure TfrmCadRevisao.btnDeletarItemClick(Sender: TObject);
begin
  MyShowMessage('Deseja Realmente Deletar esse registro?',true);
   case frmPrincipal.vMsgConfirma of
     1:begin
        dmRevisao.TRevisaoItens.Edit;
        dmRevisao.TRevisaoItensStatus.AsInteger := -1;
        dmRevisao.TRevisaoItensIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
        dmRevisao.TRevisaoItensDataAlteracao.AsDateTime     := now;
        dmRevisao.TRevisaoItenssyncaws.AsInteger            :=0;
        try
          dmRevisao.TRevisaoItenssyncaws.AsInteger          :=0;
          dmRevisao.TRevisaoItens.ApplyUpdates(-1);
          dbCtx.FDConPG.Commit;
          MyShowMessage('Registro Excluido com sucesso!',false);
          dmRevisao.TRevisaoItens.Close;
          dmRevisao.TRevisaoItens.Open();
          lblTotalRegistro.Text := intToStr(StringGrid1.RowCount);
        except
         on E : Exception do
          ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
        end;
     end;
   end;
end;

procedure TfrmCadRevisao.btnDeletarMaquinaClick(Sender: TObject);
begin
   MyShowMessage('Deseja Realmente Deletar esse registro?',true);
   case frmPrincipal.vMsgConfirma of
     1:begin
        dmRevisao.TRevisaoMaquinas.Edit;
        dmRevisao.TRevisaoMaquinasStatus.AsInteger := -1;
        dmRevisao.TRevisaoMaquinasIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
        dmRevisao.TRevisaoMaquinasDataAlteracao.AsDateTime     := now;
        dmRevisao.TRevisaoMaquinassyncaws.AsInteger            :=0;
        try
          dmRevisao.TRevisaoMaquinassyncaws.AsInteger          :=0;
          dmRevisao.TRevisaoMaquinas.ApplyUpdates(-1);
          dbCtx.FDConPG.Commit;
          MyShowMessage('Registro Excluido com sucesso!',false);
          dmRevisao.TRevisaoMaquinas.Close;
          dmRevisao.TRevisaoMaquinas.Open();
          lblTotalRegistro.Text := intToStr(StringGrid1.RowCount);
        except
         on E : Exception do
          ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
        end;
     end;
   end;
end;

procedure TfrmCadRevisao.btnEditarClick(Sender: TObject);
begin
  dmRevisao.TRevisao.Edit;
  edtNome.Text      := dmRevisao.TRevisaonome.AsString;
  edtIntervalo.Text := dmRevisao.TRevisaointervalohoras.AsString;
  inherited;
end;

procedure TfrmCadRevisao.btnIncluirItemClick(Sender: TObject);
begin
  rdManutencao.IsChecked   := false;
  rdLubrificacao.IsChecked := false;
  rdVerificacao.IsChecked  := false;
  tabTipoItem.TabPosition  := TTabPosition.None;
  edtProdutoUtilizado.Text :='';
  edtItemRevisao.Text      :='';
  edtLub.Text              :='';
  edtObsLub.Text           :='';
  edtVrific.Text           :='';
  edtObsVerific.Text       :='';
  edtObsManu.Text          :='';
  edtqtde.Value            :=1;
  layNovoItem.Height       := 131;
  dmRevisao.TRevisaoItens.Insert;
  layNovoItem.Visible      := true;
end;

procedure TfrmCadRevisao.btnIncluirMaquinaClick(Sender: TObject);
var
 I:integer;
begin
  dmRevisao.TRevisaoMaquinas.Insert;
  frmCadMaquinaVeiculo:= TfrmCadMaquinaVeiculo.Create(Self);
  try
    frmCadMaquinaVeiculo.ShowModal;
  finally
    if frmCadMaquinaVeiculo.vIdMaquina.Length>0 then
    begin
     for I := 0 to frmCadMaquinaVeiculo.StringGrid1.RowCount-1 do
     begin
      if frmCadMaquinaVeiculo.StringGrid1.Cells[0,I]='True' then
      begin
        dmRevisao.TRevisaoMaquinasidmaquina.AsString   := frmCadMaquinaVeiculo.StringGrid1.Cells[1,I];
        dmRevisao.TRevisaoMaquinasidrevisao.AsString   := dmRevisao.TRevisaoid.AsString;
        dmRevisao.TRevisaoMaquinasidusuario.AsString   := dbCtx.vIdUsuarioLogado;
        dmRevisao.TRevisaoMaquinas.ApplyUpdates(-1);
        dmRevisao.TRevisaoMaquinas.Close;
        dmRevisao.TRevisaoMaquinas.Open;
        dmRevisao.TRevisaoMaquinas.Insert;
      end;
     end;
    end;
    dmRevisao.TRevisaoMaquinas.Close;
    dmRevisao.TRevisaoMaquinas.Open;
    frmCadMaquinaVeiculo.Free;
  end;
end;

procedure TfrmCadRevisao.btnRelClick(Sender: TObject);
begin
 dmRevisao.AbrePlanoRevisaoRep(dmRevisao.TRevisaoid.AsString);
end;

procedure TfrmCadRevisao.btnSalvarClick(Sender: TObject);
begin
 if edtIntervalo.Text.Length=0 then
  begin
    MyShowMessage('Informe o Intervalo de Horas!!',false);
    edtIntervalo.SetFocus;
    Exit;
  end;

  if edtNome.Text.Length=0 then
  begin
    MyShowMessage('Informe o Nome!!',false);
    edtNome.SetFocus;
    Exit;
  end;

  dmRevisao.TRevisaoNome.AsString  := edtNome.Text;
  if dmRevisao.TRevisao.State=dsEdit then
  begin
   dmRevisao.TRevisaoIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
   dmRevisao.TRevisaoDataAlteracao.AsDateTime     := now;
   dbCtx.AlteraFlaSynAWS_ZERO('planoRevisao',dmRevisao.TRevisaoID.AsString);
  end;
  if dmRevisao.TRevisao.State=dsInsert then
  begin
   if not dbCtx.VerificaCadastroExiste('NOME','planoRevisao',edtNome.Text) then
   begin
     MyShowMessage('Ja existe uma Revisao com esse nome:'+edtNome.Text,false);
     Exit;
   end;
   dmRevisao.TRevisaoIdUsuario.AsString      := dbCtx.vIdUsuarioLogado;
  end;
  dmRevisao.TRevisaointervalohoras.AsString  := edtIntervalo.Text;
  try
   TThread.Synchronize(nil,procedure
   begin
    dmRevisao.TRevisaoSyncAWS.AsInteger :=0;
    dmRevisao.TRevisao.ApplyUpdates(-1);
    dbCtx.FDConPG.Commit;
    dmRevisao.TRevisao.Close;
    dmRevisao.TRevisao.Open();
   end);
   MudarAba(tbiLista,sender);
  except
   on E : Exception do
     MyShowMessage('Erro ao Inserir Revisao:'+E.Message,false);
  end;
end;

procedure TfrmCadRevisao.EditButton1Click(Sender: TObject);
begin
  frmCadProdutos := TfrmCadProdutos.Create(Self);
  try
    frmCadProdutos.ShowModal;
  finally
    edtProdutoUtilizado.Text := dbCtx.TProdutosnome.AsString;
    vIdProduto               := dbCtx.TProdutosid.AsString;
    frmCadProdutos.Free;
  end;
end;

procedure TfrmCadRevisao.EditButton6Click(Sender: TObject);
begin
 frmAuxItemRevisao := TfrmAuxItemRevisao.Create(Self);
  try
    frmAuxItemRevisao.ShowModal;
  finally
    if frmAuxItemRevisao.vIdSelectec.Length>0 then
    begin
      edtVrific.Text      := dmRevisao.TAuxRevisaoItemnome.AsString;
      vIdItem             := dmRevisao.TAuxRevisaoItemid.AsString;
    end;
    frmAuxItemRevisao.Free;
  end;
end;

procedure TfrmCadRevisao.edtIntervaloKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
 if (keyChar in ['0'..'9',','] = false) then
 begin
   KeyChar := #0;
 end;
end;

procedure TfrmCadRevisao.edtNomeFiltroKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
 if key=13 then
  if tbPrincipal.TabIndex=0 then
  begin
    btnBuscarListaClick(Sender);
  end;
end;

procedure TfrmCadRevisao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 edtMaquinaF.Enabled := true;
 edtMaquinaF.Text    := '';
end;

procedure TfrmCadRevisao.FormShow(Sender: TObject);
begin
  layNovoItem.Visible := false;
  lblBuscar.Text     := 'Filtros';
  lblAdd.Text        := 'Adicionar';
  lblEdit.Text       := 'Editar';
  lblDeleta.Text     := 'Deletar';
  layListaMnu.Width  := 150;
  tbPrincipal.TabPosition := TTabPosition.None;
  tbPrincipal.ActiveTab   := tbiLista;
  btnAdd.Enabled          := dbCtx.vTipoBDConfig=0;
  btnEditar.Enabled       := dbCtx.vTipoBDConfig=0;
  btnDeletar.Enabled      := dbCtx.vTipoBDConfig=0;
  btnBuscarListaClick(sender);
end;

procedure TfrmCadRevisao.Image13Click(Sender: TObject);
begin
  layNovoItem.Visible      := false;
end;

procedure TfrmCadRevisao.rdLubrificacaoChange(Sender: TObject);
begin
 layNovoItem.Height       :=  329;
 tabTipoItem.ActiveTab    := tbiLubrificar;
end;

procedure TfrmCadRevisao.rdManutencaoChange(Sender: TObject);
begin
 layNovoItem.Height       := 465;
 tabTipoItem.ActiveTab := tbiManu;
end;

procedure TfrmCadRevisao.rdVerificacaoChange(Sender: TObject);
begin
 tabTipoItem.ActiveTab := tbiVerificar;
 layNovoItem.Height    :=  329;
end;

procedure TfrmCadRevisao.Rectangle14Click(Sender: TObject);
begin
 layNovoItem.Visible := false;
end;

procedure TfrmCadRevisao.Rectangle15Click(Sender: TObject);
begin
 dmRevisao.TRevisaoItensidrevisao.AsString := dmRevisao.TRevisaoid.AsString;
 dmRevisao.TRevisaoItensidusuario.AsString := dbCtx.vIdUsuarioLogado;
 if rdManutencao.IsChecked then
 begin
  edtObsManu.SetFocus;
  dmRevisao.TRevisaoItensitem.AsString        := edtItemRevisao.Text;
  dmRevisao.TRevisaoItensidproduto.AsString   := vIdProduto;
  dmRevisao.TRevisaoItensqtde.AsFloat         := edtqtde.Value;
  dmRevisao.TRevisaoItensobservacao.AsString  := edtObsManu.Text;
  dmRevisao.TRevisaoItenstipo.AsInteger       := 0;
 end;
 if rdLubrificacao.IsChecked then
 begin
  edtObsLub.SetFocus;
  dmRevisao.TRevisaoItensitem.AsString        := edtLub.Text;
  dmRevisao.TRevisaoItensobservacao.AsString  := edtObsLub.Text;
  dmRevisao.TRevisaoItenstipo.AsInteger       := 1;
 end;
 if rdVerificacao.IsChecked then
 begin
  edtObsVerific.SetFocus;
  dmRevisao.TRevisaoItensitem.AsString        := edtVrific.Text;
  dmRevisao.TRevisaoItensobservacao.AsString  := edtObsVerific.Text;
  dmRevisao.TRevisaoItenstipo.AsInteger       := 2;
 end;
 try
  dmRevisao.TRevisaoItenssyncfaz.AsInteger    := 0;
  dmRevisao.TRevisaoItensiditem.AsString      := vIdItem;
  dmRevisao.TRevisaoItens.ApplyUpdates(-1);
  dmRevisao.TRevisaoItens.Close;
  dmRevisao.TRevisaoItens.Open;
  edtProdutoUtilizado.Text :='';
  edtItemRevisao.Text      :='';
  edtqtde.Value            :=1;
   MyShowMessage('Item icluso com sucesso!',false);
   layNovoItem.Visible := false;
 except
  on E : Exception do
     MyShowMessage('Erro ao Inserir Item Revisao:'+E.Message,false);
 end;
end;

procedure TfrmCadRevisao.StringGrid1CellDblClick(const Column: TColumn;
  const Row: Integer);
begin
  Close;
end;

end.
