unit UComprador;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  UFornecedor, System.Rtti, FMX.Grid.Style, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FMX.ActnList,
  System.Actions, FMX.TabControl, FMX.Edit, FMX.ListBox, FMX.Ani, FMX.ScrollBox,
  FMX.Grid, FMX.Controls.Presentation, FMX.Objects, FMX.Layouts;

type
  TfrmCadComprador = class(TfrmCadFornecedor)
    procedure btnAddClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnConfirmaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtNomeFiltroChangeTracking(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    procedure LimpaCampos;
    function ValidarEMail(aStr: string): Boolean;
  end;

var
  frmCadComprador: TfrmCadComprador;

implementation

{$R *.fmx}

uses DataContext, UPrincipal;

procedure TfrmCadComprador.btnAddClick(Sender: TObject);
begin
  LimpaCampos;
  dbCtx.Compradores.Close;
  dbCtx.Compradores.Open;
  dbCtx.Compradores.Insert;
  inherited;
end;

procedure TfrmCadComprador.btnConfirmaClick(Sender: TObject);
begin
  if edtNome.Text.Length=0 then
  begin
    MyShowMessage('Informe o Nome!',false);
    edtNome.SetFocus;
    Exit;
  end;

  if edtCidade.Text.Length=0 then
  begin
    MyShowMessage('Informe a Cidade!',false);
    edtNome.SetFocus;
    Exit;
  end;

  if cbxUF.ItemIndex=-1 then
  begin
    MyShowMessage('Informe a UF!',false);
    cbxUF.SetFocus;
    Exit;
  end;

  if edtCpfCnpj.Text.Length=0 then
  begin
    MyShowMessage('Informe o CPF/CNPJ!',false);
    edtCpfCnpj.SetFocus;
    Exit;
  end;
  if edtEmail.Text.Length>0 then
   if not ValidarEMail(edtEmail.Text) then
   begin
     MyShowMessage('Email invalido!!',false);
     edtEmail.SelectAll;
     edtEmail.SetFocus;
   end;
   if dbCtx.Compradores.State=dsInsert then
    dbCtx.CompradoresIdUsuario.AsString          := dbCtx.vIdUsuarioLogado
   else
   begin
    dbCtx.CompradoresIdUsuarioAlteracao.AsString := dbCtx.vIdUsuarioLogado;
    dbCtx.CompradoresDataAlteracao.AsDateTime    := now;
    dbCtx.AlteraFlaSynAWS_ZERO('fornecedor',dbCtx.CompradoresID.AsString);
   end;
   dbCtx.Compradoresnome.AsString              := edtNome.Text;
   dbCtx.Compradorescidade.AsString            := edtCidade.Text;
   dbCtx.Compradoresuf.AsString                := cbxUF.Selected.Text;
   dbCtx.Compradorescpf_cnpj.AsString          := edtCpfCnpj.Text;
   dbCtx.Compradorestelefone_fixo.AsString     := edtTelefoneFixo.Text;
   dbCtx.Compradorescontatopessoa.AsString     := edtNomeContato.Text;
   dbCtx.Compradorescelular.AsString           := edtCelular.Text;
   dbCtx.Compradoresemail.AsString             := edtEmail.Text;
   dbCtx.Compradoresrazaosocial.AsString       := edtRazaoSocial.Text;
   dbCtx.Compradoresinscricaoestadual.AsString := edtInscricaoEstadual.Text;

   if edtSenha.Text.Length>0 then
     dbCtx.CompradoresSenha.AsString         := edtSenha.Text;
   try

    dbCtx.Compradores.ApplyUpdates(-1);
    MyShowMessage('Fornecedor Cadastrado com Sucesso!',false);
    dbCtx.Compradores.Close;
    dbCtx.Compradores.Open;
    MudarAba(tbiLista,sender);
   except
     on E: Exception do
      myShowMessage('Erro ao salvar Fornecedor:'+E.Message,false);
   end;
end;

function TfrmCadComprador.ValidarEMail(aStr: string): Boolean;
begin
 aStr := Trim(UpperCase(aStr));
 if Pos('@', aStr) > 1 then
 begin
   Delete(aStr, 1, pos('@', aStr));
   Result := (Length(aStr) > 0) and (Pos('.', aStr) > 2);
 end
 else
   Result := False;
end;

procedure TfrmCadComprador.btnDeletarClick(Sender: TObject);
begin
   MyShowMessage('Deseja Realmente Deletar esse registro?',true);
   case frmPrincipal.vMsgConfirma of
     1:begin
        dbCtx.Compradores.Edit;
        dbCtx.CompradoresStatus.AsInteger := -1;
        dbCtx.CompradoresIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
        dbCtx.CompradoresDataAlteracao.AsDateTime     := now;
        dbCtx.AlteraFlaSynAWS_ZERO('fornecedor',dbCtx.CompradoresID.AsString);
        try
          dbCtx.Compradores.ApplyUpdates(-1);
          MyShowMessage('Registro Excluido com sucesso!',false);
          dbCtx.Compradores.Close;
          dbCtx.Compradores.Open();
        except
         on E : Exception do
          ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
        end;
     end;
   end;
end;

procedure TfrmCadComprador.btnEditarClick(Sender: TObject);
begin
  edtNome.Text              := dbCtx.Compradoresnome.AsString;
  edtCidade.Text            := dbCtx.Compradorescidade.AsString;
  edtCpfCnpj.Text           := dbCtx.Compradorescpf_cnpj.AsString;
  edtTelefoneFixo.Text      := dbCtx.Compradorestelefone_fixo.AsString;
  edtNomeContato.Text       := dbCtx.Compradorescontatopessoa.AsString;
  edtCelular.Text           := dbCtx.Compradorescelular.AsString;
  edtEmail.Text             := dbCtx.Compradoresemail.AsString;
  cbxUF.ItemIndex           := cbxUF.Items.IndexOf(dbCtx.Compradoresuf.AsString);
  edtSenha.Text             := dbCtx.CompradoresSenha.AsString;
  edtRazaoSocial.Text       := dbCtx.Compradoresrazaosocial.AsString;
  edtInscricaoEstadual.Text := dbCtx.Compradoresinscricaoestadual.AsString;
  dbCtx.Compradores.Edit;
  inherited;
end;

procedure TfrmCadComprador.edtNomeFiltroChangeTracking(Sender: TObject);
begin
 if edtNomeFiltro.Text.Length>0 then
 begin
   dbCtx.Compradores.Filtered := false;
   dbCtx.Compradores.Filter   := 'NOME LIKE '+QuotedStr('%'+edtNomeFiltro.Text+'%');
   dbCtx.Compradores.Filtered := true;
 end
 else
 begin
   dbCtx.Compradores.Filtered := false;
   dbCtx.Compradores.Close;
   dbCtx.Compradores.Open;
 end;
end;

procedure TfrmCadComprador.FormCreate(Sender: TObject);
begin
  dbCtx.Compradores.Close;
  dbCtx.Compradores.Open;
  lblBuscar.Text     := 'Filtros';
  lblAdd.Text        := 'Adicionar';
  lblEdit.Text       := 'Editar';
  lblDeleta.Text     := 'Deletar';
  layListaMnu.Width  := 150;
  tbPrincipal.TabPosition := TTabPosition.None;
  tbPrincipal.ActiveTab   := tbiLista;
end;

procedure TfrmCadComprador.FormShow(Sender: TObject);
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
  btnDeletar.Enabled      := true;
end;

procedure TfrmCadComprador.LimpaCampos;
begin
  edtNome.Text             := '';
  edtCidade.Text           := '';
  edtCpfCnpj.Text          := '';
  edtTelefoneFixo.Text     := '';
  edtNomeContato.Text      := '';
  edtCelular.Text          := '';
  edtEmail.Text            := '';
  edtRazaoSocial.Text      := '';
  edtInscricaoEstadual.Text:= '';
  cbxUF.ItemIndex          := -1;
end;

end.
