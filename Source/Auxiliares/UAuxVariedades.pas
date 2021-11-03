unit UAuxVariedades;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  UCadPadrao, System.Rtti, FMX.Grid.Style, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FMX.ActnList,
  System.Actions, FMX.TabControl, FMX.Ani, FMX.ScrollBox, FMX.Grid, FMX.Edit,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope, FMX.EditBox,
  FMX.NumberBox,Winapi.Windows;

type
  TfrmAuxVariedades = class(TfrmCadPadrao)
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    Label4: TLabel;
    edtNome: TEdit;
    Rectangle3: TRectangle;
    Layout12: TLayout;
    edtTipo: TEdit;
    EditButton2: TEditButton;
    Layout1: TLayout;
    Label7: TLabel;
    Label5: TLabel;
    edtCiclo: TEdit;
    procedure btnConfirmaClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure edtNomeFiltroChangeTracking(Sender: TObject);
    procedure StringGrid1CellDblClick(const Column: TColumn;
      const Row: Integer);
    procedure FormShow(Sender: TObject);
    procedure EditButton2Click(Sender: TObject);
    procedure edtCicloKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
  private
    vIDTipoCultivar :string;
  public
    { Public declarations }
  end;

var
  frmAuxVariedades: TfrmAuxVariedades;

implementation

{$R *.fmx}

uses DataContext, UPrincipal, dmReplicacao, UAuxTipoCultivar;

procedure TfrmAuxVariedades.btnAddClick(Sender: TObject);
begin
  edtNome.Text := '';
  dbCtx.TAuxCultivares.Close;
  dbCtx.TAuxCultivares.Open;
  dbCtx.TAuxCultivares.Insert;
  inherited;
end;

procedure TfrmAuxVariedades.btnConfirmaClick(Sender: TObject);
begin
  if edtNome.Text.Length=0 then
  begin
    MyShowMessage('Informe o Nome!!',false);
    edtNome.SetFocus;
    Exit;
  end;
  if edtTipo.Text.Length=0 then
  begin
    MyShowMessage('Informe o Tipo!!',false);
    edtTipo.SetFocus;
    Exit;
  end;
  dbCtx.TAuxCultivaresnome.AsString  := edtNome.Text;
  if dbCtx.TAuxCultivares.State=dsEdit then
  begin
   dbCtx.TAuxCultivaresIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
   dbCtx.TAuxCultivaresDataAlteracao.AsDateTime     := now;
   dbCtx.AlteraFlaSynAWS_ZERO('auxCultivares',dbCtx.TAuxCultivaresID.AsString);
  end;
  if dbCtx.TAuxCultivares.State=dsInsert then
  begin
   if not dbCtx.VerificaCadastroExiste('NOME','auxCultivares',edtNome.Text) then
   begin
     MyShowMessage('Ja existe uma Registro com esse nome:'+edtNome.Text,false);
     Exit;
   end;
   dbCtx.TAuxCultivaresIdUsuario.AsString      := dbCtx.vIdUsuarioLogado;
  end;
   dbCtx.TAuxCultivaresidtipocultivar.AsString := vIDTipoCultivar;
   dbCtx.TAuxCultivaresciclo.AsString          := edtCiclo.text;
  try
   dbCtx.TAuxCultivares.ApplyUpdates(-1);
   dbCtx.TAuxCultivares.Close;
   dbCtx.TAuxCultivares.Open();
   lblTotalRegistro.Text := intToStr(StringGrid1.RowCount);
   MyShowMessage('Variedades Cadastrada com sucesso!',false);
   MudarAba(tbiLista,Sender);
  except
   on E : Exception do
     MyShowMessage('Erro ao Inserir Variedades:'+E.Message,false);
  end;
end;

procedure TfrmAuxVariedades.btnDeletarClick(Sender: TObject);
begin
   MyShowMessage('Deseja Realmente Deletar esse registro?',true);
   case frmPrincipal.vMsgConfirma of
     1:begin
        dbCtx.TAuxCultivares.Edit;
        dbCtx.TAuxCultivaresStatus.AsInteger := -1;
        dbCtx.TAuxCultivaresIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
        dbCtx.TAuxCultivaresDataAlteracao.AsDateTime     := now;
        dbCtx.AlteraFlaSynAWS_ZERO('auxCultivares',dbCtx.TAuxCultivaresID.AsString);
        try
          dbCtx.TAuxCultivares.ApplyUpdates(-1);
          MyShowMessage('Registro Excluido com sucesso!',false);
          dbCtx.TAuxCultivares.Close;
          dbCtx.TAuxCultivares.Open();
//          if dbCtx.vTipoBDConfig=0 then
//          TThread.CreateAnonymousThread(procedure()
//          begin
//            DataModule1.ReplicaAuxTipoCultivar('');
//            DataModule1.ReplicaCultivares('');
//          end).Start;
          lblTotalRegistro.Text := intToStr(StringGrid1.RowCount);
        except
         on E : Exception do
          ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
        end;
     end;
   end;
end;

procedure TfrmAuxVariedades.btnEditarClick(Sender: TObject);
begin
  edtNome.Text           := dbCtx.TAuxCultivaresnome.AsString;
  vIDTipoCultivar        := dbCtx.TAuxCultivaresidtipocultivar.AsString;
  edtCiclo.text          := dbCtx.TAuxCultivaresciclo.AsString;
  edtTipo.Text           := dbCtx.TAuxCultivarestipo.AsString;
  dbCtx.TAuxCultivares.Edit;
  inherited;
end;

procedure TfrmAuxVariedades.edtCicloKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
 if ((keyChar in ['0'..'9'] = false) and (word(key) <> vk_back)) then
 begin
   KeyChar := #0;
 end;
end;

procedure TfrmAuxVariedades.EditButton2Click(Sender: TObject);
begin
  frmAuxTipoCultivar := TfrmAuxTipoCultivar.Create(Self);
  try
    frmAuxTipoCultivar.ShowModal;
  finally
    vIDTipoCultivar          := dbCtx.TAuxTipoCultivareid.AsString;
    edtTipo.Text             := dbCtx.TAuxTipoCultivarenome.AsString;
    frmAuxTipoCultivar.Free;
  end;
end;

procedure TfrmAuxVariedades.edtNomeFiltroChangeTracking(Sender: TObject);
begin
 if edtNomeFiltro.Text.Length>0 then
 begin
   dbCtx.TAuxCultivares.Filtered := false;
   dbCtx.TAuxCultivares.Filter   := 'NOME LIKE '+QuotedStr('%'+edtNomeFiltro.Text+'%');
   dbCtx.TAuxCultivares.Filtered := true;
 end
 else
 begin
   dbCtx.TAuxCultivares.Filtered := false;
   dbCtx.TAuxCultivares.Close;
   dbCtx.TAuxCultivares.Open;
 end;
 lblTotalRegistro.Text := intToStr(StringGrid1.RowCount);
end;

procedure TfrmAuxVariedades.FormShow(Sender: TObject);
begin
  dbCtx.TAuxCultivares.Close;
  dbCtx.TAuxCultivares.Open;
  lblTotalRegistro.Text := intToStr(StringGrid1.RowCount);
  inherited;
end;

procedure TfrmAuxVariedades.StringGrid1CellDblClick(const Column: TColumn;
  const Row: Integer);
begin
 Close;
end;

end.
