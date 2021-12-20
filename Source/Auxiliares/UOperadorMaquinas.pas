unit UOperadorMaquinas;

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
  FMX.ListBox;

type
  TfrmOperadorMaquinas = class(TfrmCadPadrao)
    Layout1: TLayout;
    Label4: TLabel;
    edtNome: TEdit;
    BindSourceDB1: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    BindingsList1: TBindingsList;
    Layout7: TLayout;
    Rectangle3: TRectangle;
    Layout8: TLayout;
    edtRG: TEdit;
    Layout9: TLayout;
    Label9: TLabel;
    Label12: TLabel;
    Label7: TLabel;
    edtCelular: TEdit;
    edtCPF: TEdit;
    edtCNH: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    cbxPulverizacao: TComboBox;
    procedure btnAddClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtNomeFiltroChangeTracking(Sender: TObject);
    procedure edtCPFTyping(Sender: TObject);
    procedure edtCelularTyping(Sender: TObject);
    procedure StringGrid1CellDblClick(const Column: TColumn;
      const Row: Integer);
  private
    procedure LimpaCampos;
  public
    { Public declarations }
  end;

var
  frmOperadorMaquinas: TfrmOperadorMaquinas;

implementation

{$R *.fmx}

uses DataContext, dmReplicacao, UPrincipal, uFormat;

procedure TfrmOperadorMaquinas.btnAddClick(Sender: TObject);
begin
  LimpaCampos;
  dbCtx.TOperadorMaquina.Close;
  dbCtx.TOperadorMaquina.Open;
  dbCtx.TOperadorMaquina.Insert;
  inherited;
end;

procedure TfrmOperadorMaquinas.btnDeletarClick(Sender: TObject);
begin
  MyShowMessage('Deseja Realmente Deletar esse registro?',true);
   case frmPrincipal.vMsgConfirma of
     1:begin
        dbCtx.TOperadorMaquina.Edit;
        dbCtx.TOperadorMaquinaStatus.AsInteger := -1;
        dbCtx.TOperadorMaquinaIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
        dbCtx.TOperadorMaquinaDataAlteracao.AsDateTime     := now;
        dbCtx.TOperadorMaquinasyncaws.asInteger            :=0;
        try
          dbCtx.TOperadorMaquina.ApplyUpdates(-1);
//          if dbCtx.vTipoBDConfig=0 then
//           TThread.CreateAnonymousThread(procedure()
//           begin
//              DataModule1.ReplicaOperadorMaquinas('');
//           end).Start;
          MyShowMessage('Registro Excluido com sucesso!',false);
          dbCtx.TOperadorMaquina.Close;
          dbCtx.TOperadorMaquina.Open();
        except
         on E : Exception do
          ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
        end;
     end;
   end;
end;

procedure TfrmOperadorMaquinas.btnEditarClick(Sender: TObject);
begin
  edtNome.Text              := dbCtx.TOperadorMaquinanome.AsString;
  edtRG.Text                := dbCtx.TOperadorMaquinaRG.AsString;
  edtCPF.Text               := dbCtx.TOperadorMaquinaCPF.AsString;
  edtCNH.Text               := dbCtx.TOperadorMaquinaCNH.AsString;
  edtCelular.Text           := dbCtx.TOperadorMaquinacelular.AsString;
  cbxPulverizacao.ItemIndex := dbCtx.TOperadorMaquinapulverizacao.AsInteger;
  dbCtx.TOperadorMaquina.Edit;
  inherited;
end;

procedure TfrmOperadorMaquinas.btnSalvarClick(Sender: TObject);
begin
  if edtNome.Text.Length=0 then
  begin
    MyShowMessage('Informe o Nome!!',false);
    edtNome.SetFocus;
    Exit;
  end;
  dbCtx.TOperadorMaquinaNome.AsString  := edtNome.Text;

  if edtCPF.Text.Length>0 then
   dbCtx.TOperadorMaquinacpf.AsString     := edtcpf.Text;
  if edtrg.Text.Length>0 then
   dbCtx.TOperadorMaquinarg.AsString      := edtRG.Text;
  if edtCNH.Text.Length>0 then
   dbCtx.TOperadorMaquinacnh.AsString     := edtCNH.Text;
  if edtCelular.Text.Length>0 then
   dbCtx.TOperadorMaquinacelular.AsString := edtCelular.Text;


  if dbCtx.TOperadorMaquina.State=dsEdit then
  begin
   dbCtx.TOperadorMaquinaIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
   dbCtx.TOperadorMaquinaDataAlteracao.AsDateTime     := now;
  end;
  if dbCtx.TOperadorMaquina.State=dsInsert then
  begin
   if not dbCtx.VerificaCadastroExiste('NOME','OperadorMaquinas',edtNome.Text) then
   begin
     MyShowMessage('Ja existe um Operador com esse nome:'+edtNome.Text,false);
     Exit;
   end;
   if not dbCtx.VerificaCadastroExiste('RG','OperadorMaquinas',edtRG.Text) then
   begin
     MyShowMessage('Ja existe um Operador com esse RG:'+edtNome.Text,false);
     Exit;
   end;
   if not dbCtx.VerificaCadastroExiste('CPF','OperadorMaquinas',edtNome.Text) then
   begin
     MyShowMessage('Ja existe um Operador com esse CPF:'+edtNome.Text,false);
     Exit;
   end;
   if not dbCtx.VerificaCadastroExiste('CNH','OperadorMaquinas',edtNome.Text) then
   begin
     MyShowMessage('Ja existe um Operador com essa CNH:'+edtNome.Text,false);
     Exit;
   end;


   dbCtx.TOperadorMaquinapulverizacao.AsInteger := cbxPulverizacao.ItemIndex;
   dbCtx.TOperadorMaquinaIdUsuario.AsString := dbCtx.vIdUsuarioLogado;
  end;
  try
   dbCtx.TOperadorMaquinasyncaws.asInteger:=0;
   dbCtx.TOperadorMaquina.ApplyUpdates(-1);
//   if dbCtx.vTipoBDConfig=0 then
//    TThread.CreateAnonymousThread(procedure()
//    begin
//      DataModule1.ReplicaOperadorMaquinas('');
//    end).Start;
   dbCtx.TOperadorMaquina.Close;
   dbCtx.TOperadorMaquina.Open();
   MudarAba(tbiLista,sender);
  except
   on E : Exception do
     MyShowMessage('Erro ao Inserir Grupo:'+E.Message,false);
  end;
end;

procedure TfrmOperadorMaquinas.edtCelularTyping(Sender: TObject);
begin
  Formatar(edtCelular,TFormato.Celular)
end;

procedure TfrmOperadorMaquinas.edtCPFTyping(Sender: TObject);
begin
 Formatar(edtCPF,TFormato.CPF)
end;

procedure TfrmOperadorMaquinas.edtNomeFiltroChangeTracking(Sender: TObject);
begin
 if edtNomeFiltro.Text.Length>0 then
 begin
   dbCtx.TOperadorMaquina.Filtered := false;
   dbCtx.TOperadorMaquina.Filter   := 'NOME LIKE '+QuotedStr('%'+edtNomeFiltro.Text+'%');
   dbCtx.TOperadorMaquina.Filtered := true;
 end
 else
 begin
   dbCtx.TOperadorMaquina.Filtered := false;
   dbCtx.TOperadorMaquina.Close;
   dbCtx.TOperadorMaquina.Open;
 end;
 lblTotalRegistro.Text := intToStr(StringGrid1.RowCount);
end;

procedure TfrmOperadorMaquinas.FormShow(Sender: TObject);
begin
  dbCtx.TOperadorMaquina.Close;
  dbCtx.TOperadorMaquina.Open;
   lblBuscar.Text     := 'Filtros';
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

procedure TfrmOperadorMaquinas.LimpaCampos;
begin
 edtNome.Text    :='';
 edtrg.Text      :='';
 edtCPF.Text     :='';
 edtcnh.Text     :='';
 edtCelular.Text :='';
end;

procedure TfrmOperadorMaquinas.StringGrid1CellDblClick(const Column: TColumn;
  const Row: Integer);
begin
 Close;
end;

end.
