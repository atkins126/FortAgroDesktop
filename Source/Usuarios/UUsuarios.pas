unit UUsuarios;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  UCadPadrao, System.Rtti, FMX.Grid.Style, FMX.ActnList, System.Actions,
  FMX.TabControl, FMX.Ani, FMX.ScrollBox, FMX.Grid, FMX.Edit,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, FMX.ListBox,Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope;

type
  TfrmUsuarios = class(TfrmCadPadrao)
    Rectangle2: TRectangle;
    Layout3: TLayout;
    edtNome: TEdit;
    Label4: TLabel;
    Layout4: TLayout;
    Rectangle3: TRectangle;
    Layout1: TLayout;
    cbxTipo: TComboBox;
    cbxSupervisor: TComboBox;
    Layout8: TLayout;
    Label6: TLabel;
    lblSupervisor: TLabel;
    Layout6: TLayout;
    Rectangle4: TRectangle;
    Layout7: TLayout;
    edtUsuario: TEdit;
    Layout9: TLayout;
    Label5: TLabel;
    Label7: TLabel;
    edtSenha: TEdit;
    cbxTipoF: TComboBox;
    Label8: TLabel;
    cbxSegmento: TComboBox;
    Label9: TLabel;
    Label10: TLabel;
    cbxSegmentoF: TComboBox;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    BindSourceDB1: TBindSourceDB;
    Layout2: TLayout;
    Rectangle1: TRectangle;
    Layout10: TLayout;
    Layout11: TLayout;
    Label11: TLabel;
    chkAbastecimento: TCheckBox;
    btnReset: TEditButton;
    Layout12: TLayout;
    Rectangle5: TRectangle;
    Label12: TLabel;
    Layout13: TLayout;
    Layout14: TLayout;
    Layout16: TLayout;
    Rectangle9: TRectangle;
    btnLimparImg: TRectangle;
    Image7: TImage;
    Label13: TLabel;
    btnCarregaIMG: TRectangle;
    Image8: TImage;
    Label14: TLabel;
    Layout15: TLayout;
    Layout17: TLayout;
    Rectangle8: TRectangle;
    imgProduto: TImage;
    OpenImg: TOpenDialog;
    chkPlantio: TCheckBox;
    chkArmazem: TCheckBox;
    Layout18: TLayout;
    chkAgronomo: TCheckBox;
    chkColheita: TCheckBox;
    chkPulverizacao: TCheckBox;
    chkMonitoramento: TCheckBox;
    chkPluviometria: TCheckBox;
    chkManutencaoMaquina: TCheckBox;
    ChkAplicacaoSolido: TCheckBox;
    chkAbasExterno: TCheckBox;
    procedure btnConfirmaClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtNomeFiltroChangeTracking(Sender: TObject);
    procedure cbxTipoFChange(Sender: TObject);
    procedure StringGrid1CellDblClick(const Column: TColumn;
      const Row: Integer);
    procedure cbxSegmentoFChange(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure cbxTipoChange(Sender: TObject);
    procedure btnCarregaIMGClick(Sender: TObject);
    procedure cbxSupervisorChange(Sender: TObject);
  private
    procedure MyShowMessage(msg: string; btnCancel: Boolean);
    procedure LimpaCampos;
    procedure CarregaSupervisor;
    function  RetornaNomeSupervisor(id:string):string;
    procedure Filtro;
  public
    vIdSupervisor,vNomeUsuario,vIdUsuario:string;
  end;

var
  frmUsuarios: TfrmUsuarios;

implementation

{$R *.fmx}

uses UMsgDlg, DataContext, UPrincipal, dmReplicacao;

procedure TfrmUsuarios.btnAddClick(Sender: TObject);
begin
  LimpaCampos;
  btnReset.Visible := false;
  edtSenha.ReadOnly:= false;
  dbCtx.TUsuario.Close;
  dbCtx.TUsuario.Open;
  dbCtx.TUsuario.Insert;
  inherited;
end;

procedure TfrmUsuarios.LimpaCampos;
begin
  edtNome.Text          :='';
  edtUsuario.Text       :='';
  edtSenha.Text         :='';
  cbxTipo.ItemIndex     :=-1;
  lblSupervisor.Visible := false;
  cbxSupervisor.Visible := false;
end;

procedure TfrmUsuarios.btnCarregaIMGClick(Sender: TObject);
begin
 if OpenImg.Execute then
 begin
   imgProduto.Bitmap.LoadFromFile(OpenImg.FileName);
 end;
end;

procedure TfrmUsuarios.btnConfirmaClick(Sender: TObject);
var
  Stream: TMemoryStream;
begin
 if edtNome.Text.Length =0 then
  begin
    MyShowMessage('Informe o Nome*',false);
    edtNome.SetFocus;
    Exit;
  end;
  if cbxSegmento.ItemIndex =-1 then
  begin
    MyShowMessage('Informe o Segmento',false);
    cbxSegmento.SetFocus;
    Exit;
  end;
  if edtUsuario.Text.Length =0 then
  begin
    MyShowMessage('Informe o Usuario',false);
    edtUsuario.SetFocus;
    Exit;
  end;
  if edtSenha.Text.Length =0 then
  begin
    MyShowMessage('Informe a Senha',false);
    edtSenha.SetFocus;
    Exit;
  end;
  if cbxTipo.ItemIndex =-1 then
  begin
    MyShowMessage('Informe o Tipo',false);
    cbxTipo.SetFocus;
    Exit;
  end;
  if (cbxTipo.ItemIndex =0) and (cbxSupervisor.ItemIndex=-1) then
  begin
    MyShowMessage('Informe o Supervisor',false);
    cbxSupervisor.SetFocus;
    Exit;
  end
  else
   dbCtx.TUsuarioidsupervisor.AsString       := vIdSupervisor;
  dbCtx.TUsuarionome.AsString                := edtNome.Text;
  dbCtx.TUsuariousuario.AsString             := edtUsuario.Text;
  dbCtx.TUsuariotipo.AsInteger               := cbxTipo.ItemIndex;
  if not imgProduto.Bitmap.IsEmpty then
  begin
    Stream := TMemoryStream.Create;
    imgProduto.Bitmap.SaveToStream(Stream);
    dbCtx.TUsuarioimgass.loadfromstream(Stream);
  end;



  if dbCtx.TUsuario.State=dsEdit then
  begin
   dbCtx.TUsuarioIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
   dbCtx.TUsuarioDataAlteracao.AsDateTime     := now;
   dbCtx.AlteraFlaSynAWS_ZERO('usuario',dbCtx.TUsuarioID.AsString);
  end;
  if dbCtx.TUsuario.State=dsInsert then
  begin
   dbCtx.TUsuarioIdUsuario.AsString := dbCtx.vIdUsuarioLogado;
  end;
  if edtSenha.ReadOnly=false then
   dbCtx.TUsuariosenha.AsString              := dbCtx.MD55(edtSenha.Text);

  dbCtx.TUsuarioidsegmento.AsInteger         := cbxSegmento.ItemIndex;
  dbCtx.TUsuarioIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
  dbCtx.TUsuarioDataAlteracao.AsDateTime     := now;

  if cbxSupervisor.ItemIndex>-1 then
   dbCtx.TUsuarioidsupervisor.AsString         := vIdSupervisor;

  dbCtx.TUsuarioagronomo.AsInteger             := ord(chkAgronomo.IsChecked);
  dbCtx.TUsuarioabastecimento.AsInteger        := ord(chkAbastecimento.IsChecked);
  dbCtx.TUsuarioArmazem.AsInteger              := ord(chkArmazem.IsChecked);
  dbCtx.TUsuarioaplicacaosolido.AsInteger      := ord(chkAplicacaoSolido.IsChecked);
  dbCtx.TUsuariopulverizacao.AsInteger         := ord(chkPulverizacao.IsChecked);
  dbCtx.TUsuarioplantio.AsInteger              := ord(chkPlantio.IsChecked);
  dbCtx.TUsuarioColheita.AsInteger             := ord(chkColheita.IsChecked);
  dbCtx.TUsuariomonitoramentopragas.AsInteger  := ord(chkMonitoramento.IsChecked);
  dbCtx.TUsuariopluviometria.AsInteger         := ord(chkPluviometria.IsChecked);
  dbCtx.TUsuariomanutencaomaquinas.AsInteger   := ord(chkManutencaoMaquina.IsChecked);
  dbCtx.TUsuarioabastecimentoexterno.AsInteger :=ORD(chkAbasExterno.IsChecked);
  try
   dbCtx.TUsuario.ApplyUpdates(-1);
   dbCtx.TUsuario.Close;
   dbCtx.TUsuario.Open;
   lblTotalRegistro.Text := intToStr(StringGrid1.RowCount);
   myShowMessage('Usuario cadastrado com sucesso!',false);
   MudarAba(tbiLista,Sender);
  except
   on E : Exception do
      myShowMessage('Erro ao adicionar Usuario:'+E.Message,false);
  end;
end;

procedure TfrmUsuarios.btnDeletarClick(Sender: TObject);
begin
   MyShowMessage('Deseja Realmente Deletar esse registro?',true);
   case frmPrincipal.vMsgConfirma of
     1:begin
        dbCtx.TUsuario.Edit;
        dbCtx.TUsuarioStatus.AsInteger := -1;
        dbCtx.TUsuarioIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
        dbCtx.TUsuarioDataAlteracao.AsDateTime     := now;
        dbCtx.AlteraFlaSynAWS_ZERO('usuario',dbCtx.TUsuarioID.AsString);
        try
          dbCtx.TUsuario.ApplyUpdates(-1);
          MyShowMessage('Registro Excluido com sucesso!',false);
//          if dbCtx.vTipoBDConfig=0 then
//           TThread.CreateAnonymousThread(procedure()
//           begin
//              DataModule1.ReplicaUsuarios('');
//           end).Start;
          dbCtx.TUsuario.Close;
          dbCtx.TUsuario.Open();
        except
         on E : Exception do
          ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
        end;
     end;
   end;
end;

procedure TfrmUsuarios.btnEditarClick(Sender: TObject);
var
 vTipo:integer;
 Stream : TMemoryStream;
begin
  btnReset.Visible                  := true;
  edtNome.Text                      := dbCtx.TUsuarionome.AsString;
  edtUsuario.Text                   := dbCtx.TUsuariousuario.AsString;
  edtSenha.ReadOnly                 := true;
  edtSenha.Text                     := dbCtx.TUsuariosenha.AsString;
  cbxTipo.ItemIndex                 := dbCtx.TUsuariotipo.AsInteger;
  chkAgronomo.IsChecked             := dbCtx.TUsuarioagronomo.AsInteger=1;
  chkAbastecimento.IsChecked        := dbCtx.TUsuarioabastecimento.AsInteger=1;
  chkArmazem.IsChecked              := dbCtx.TUsuarioArmazem.AsInteger=1;
  ChkAplicacaoSolido.IsChecked      := dbCtx.TUsuarioaplicacaosolido.AsInteger=1;
  chkPulverizacao.IsChecked         := dbCtx.TUsuariopulverizacao.AsInteger=1;
  chkPlantio.IsChecked              := dbCtx.TUsuarioPlantio.AsInteger=1;
  chkColheita.IsChecked             := dbCtx.TUsuarioColheita.AsInteger=1;
  chkMonitoramento.IsChecked        := dbCtx.TUsuariomonitoramentopragas.AsInteger=1;
  chkPluviometria.IsChecked         := dbCtx.TUsuariopluviometria.AsInteger=1;
  chkManutencaoMaquina.IsChecked    := dbCtx.TUsuariomanutencaomaquinas.AsInteger=1;
  cbxSegmento.ItemIndex             := dbCtx.TUsuarioidsegmento.AsInteger;
  chkAbasExterno.IsChecked          := dbCtx.TUsuarioabastecimentoexterno.AsInteger=1;

  if dbCtx.TUsuarioimgass.AsString.Length>0 then
  begin
   Stream := TMemoryStream.Create;
   dbCtx.TUsuarioimgass.SaveToStream(Stream);
   imgProduto.Bitmap.LoadFromStream(Stream);
  end
  else
   imgProduto.Bitmap.Assign(nil);

  if (dbCtx.TUsuariotipo.AsInteger=0) then
  begin
   CarregaSupervisor;
   if dbCtx.TUsuarioidsupervisor.AsString.Length>0 then
   begin
    cbxSupervisor.ItemIndex :=
    cbxSupervisor.Items.IndexOf(RetornaNomeSupervisor(dbCtx.TUsuarioidsupervisor.AsString));
   end;
   lblSupervisor.Visible := true;
   cbxSupervisor.Visible := true;
  end
  else
  begin
   lblSupervisor.Visible := false;
   cbxSupervisor.Visible := false;
  end;
  dbCtx.TUsuario.edit;
  inherited;
end;

procedure TfrmUsuarios.btnResetClick(Sender: TObject);
begin
 edtSenha.ReadOnly          := false;
 edtSenha.Text              := '';
end;

procedure TfrmUsuarios.CarregaSupervisor;
begin
 cbxSupervisor.Items.Clear;
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('SELECT * FROM USUARIO WHERE Status=1');
   Add('AND TIPO=1');
   Open;
   while not eof do
   begin
     cbxSupervisor.Items.AddObject(qryAux.FieldByName('Nome').AsString,
      TObject(qryAux.FieldByName('ID').AsInteger));
     qryAux.Next;
   end;
 end;
end;

procedure TfrmUsuarios.cbxSegmentoFChange(Sender: TObject);
begin
 Filtro;
end;

procedure TfrmUsuarios.cbxSupervisorChange(Sender: TObject);
begin
 if cbxSupervisor.ItemIndex>-1 then
  vIdSupervisor := IntToStr(Integer(cbxSupervisor.Items.Objects[cbxSupervisor.ItemIndex]));
end;

procedure TfrmUsuarios.cbxTipoChange(Sender: TObject);
begin
 if cbxTipo.ItemIndex>-1 then
 begin
  if cbxTipo.Selected.Text='PADRAO' then
  begin
   CarregaSupervisor;
   lblSupervisor.Visible := true;
   cbxSupervisor.Visible := true;
  end
  else
  begin
   lblSupervisor.Visible := false;
   cbxSupervisor.Visible := false;
  end;
 end;
end;

procedure TfrmUsuarios.cbxTipoFChange(Sender: TObject);
begin
  Filtro;
end;

procedure TfrmUsuarios.edtNomeFiltroChangeTracking(Sender: TObject);
begin
  Filtro;
end;

procedure TfrmUsuarios.Filtro;
var
 vFiltrado:integer;
 vFiltro:string;
begin
 vFiltrado :=0;
 dbCtx.TUsuario.Filtered := false;
 if edtNomeFiltro.Text.Length>0 then
 begin
   vFiltrado :=1;
   vFiltro := 'NOME LIKE '+QuotedStr('%'+edtNomeFiltro.Text+'%');
 end;
 if cbxSegmentoF.ItemIndex>0 then
 begin
  if vFiltrado=0 then
   vFiltro := 'idsegmento ='+intToStr(cbxSegmentoF.ItemIndex-1)
  else
   vFiltro := ' and idsegmento ='+intToStr(cbxSegmentoF.ItemIndex-1);
  vFiltrado :=1;
 end;
 if cbxTipoF.ItemIndex>0 then
 begin
  if vFiltrado=0 then
   vFiltro := 'tipo ='+intToStr(cbxTipoF.ItemIndex-1)
  else
   vFiltro := ' and tipo ='+intToStr(cbxTipoF.ItemIndex-1);
   vFiltrado :=1;
 end;
 if vFiltrado=1 then
 begin
  dbCtx.TUsuario.Filter   := vFiltro;
  dbCtx.TUsuario.Filtered := true;
 end
 else
 begin
   dbCtx.TUsuario.Filtered := false;
   dbCtx.TUsuario.Close;
   dbCtx.TUsuario.Open;
 end;
 lblTotalRegistro.Text := intToStr(StringGrid1.RowCount);
end;

procedure TfrmUsuarios.FormShow(Sender: TObject);
begin
  lblBuscar.Text     := 'Filtros';
  lblAdd.Text        := 'Adicionar';
  lblEdit.Text       := 'Editar';
  lblDeleta.Text     := 'Deletar';
  layListaMnu.Width  := 150;
  tbPrincipal.TabPosition := TTabPosition.None;
  tbPrincipal.ActiveTab   := tbiLista;
  btnAdd.Enabled          := true;
  btnEditar.Enabled       := true;
  btnDeletar.Enabled      := dbCtx.vTipoBDConfig=0;

  chkAbasExterno.Visible  := dbCtx.vTipoDB=0;
  dbCtx.TUsuario.Close;
  dbCtx.TUsuario.Open;
  dbCtx.TUsuario.Filtered  := false;
  dbCtx.TUsuario.Filter    := 'idsegmento='+dbCtx.vIdSegmento;
  dbCtx.TUsuario.Filtered  := true;
  lblTotalRegistro.Text    := intToStr(StringGrid1.RowCount);

end;

procedure TfrmUsuarios.MyShowMessage(msg: string; btnCancel: Boolean);
var
 dlg :TFrmmsgDlg;
begin
  dlg := TFrmmsgDlg.Create(nil);
  dlg.Position := TFormPosition.ScreenCenter;
  dlg.msg.Text := msg;
  dlg.btnCancel.Visible := btnCancel;
  dlg.ShowModal(
  procedure(ModalResult: TModalResult)
  begin
  end);
end;

function TfrmUsuarios.RetornaNomeSupervisor(id: string): string;
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('SELECT * FROM USUARIO WHERE Id='+id);
   Open;
   Result:= qryAux.FieldByName('nome').AsString;
 end;
end;

procedure TfrmUsuarios.StringGrid1CellDblClick(const Column: TColumn;
  const Row: Integer);
begin
 vIdUsuario   := StringGrid1.Cells[0,StringGrid1.Row];
 vNomeUsuario := StringGrid1.Cells[1,StringGrid1.Row];
 Close;
end;

end.

