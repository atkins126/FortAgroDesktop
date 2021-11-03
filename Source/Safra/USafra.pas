unit USafra;

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
  TfrmSafra = class(TfrmCadPadrao)
    BindSourceDB1: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    BindingsList1: TBindingsList;
    edtNome: TEdit;
    Label4: TLabel;
    Layout1: TLayout;
    Rectangle2: TRectangle;
    Layout2: TLayout;
    Layout3: TLayout;
    Label5: TLabel;
    edtDataInicio: TDateEdit;
    Label6: TLabel;
    cbxStatus: TComboBox;
    lblDataFim: TLabel;
    edtDataFim: TDateEdit;
    Layout10: TLayout;
    Rectangle4: TRectangle;
    Layout11: TLayout;
    Label10: TLabel;
    edtObs: TEdit;
    procedure btnAddClick(Sender: TObject);
    procedure LimpaCampos;
    procedure btnEditarClick(Sender: TObject);
    procedure btnConfirmaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtNomeFiltroChangeTracking(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure StringGrid1CellDblClick(const Column: TColumn;
      const Row: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSafra: TfrmSafra;

implementation

{$R *.fmx}

uses DataContext, UPrincipal, dmReplicacao;

procedure TfrmSafra.btnAddClick(Sender: TObject);
begin
  if not dbCtx.VerificaSafraVigente then
  begin
   MyShowMessage('Já existe uma safra vigente, é necessário finalizar antes de cadastrar uma nova!',false);
   Exit;
  end;
  dbCtx.TSafra.Close;
  dbCtx.TSafra.Open;
  dbCtx.TSafra.Insert;
  LimpaCampos;
  inherited;
end;

procedure TfrmSafra.btnConfirmaClick(Sender: TObject);
begin
 if edtNome.Text.Length=0 then
 begin
   MyShowMessage('Informe o Nome!',false);
   edtNome.SetFocus;
   Exit;
 end;
 if (edtDataInicio.Text.Length=0)then
 begin
   MyShowMessage('Informe a Data Inicio',false);
   edtDataInicio.SetFocus;
   Exit;
 end;
 if cbxStatus.ItemIndex=-1 then
 begin
   MyShowMessage('Informe o Status',false);
   cbxStatus.SetFocus;
   Exit;
 end;
 dbCtx.TSafranome.AsString                := edtNome.Text;
 if dbCtx.TSafra.State=dsInsert then
  dbCtx.TSafraIdUsuario.AsString          := dbCtx.vIdUsuarioLogado
 else
 begin
  dbCtx.TSafraIdUsuarioAlteracao.AsString := dbCtx.vIdUsuarioLogado;
  dbCtx.AlteraFlaSynAWS_ZERO('safra',dbCtx.TSafraID.AsString);
  if(cbxStatus.ItemIndex=1) and (edtDataFim.Text.Length=0) then
  begin
    MyShowMessage('Informe a data Final da Safra',false);
    Exit;
  end;
  dbCtx.TSafradatafim.AsDateTime := edtDataInicio.Date;
 end;
 dbCtx.TSafradatainicio.AsDateTime := edtDataInicio.Date;
 dbCtx.TSafraobservacao.AsString   := edtObs.Text;
 try
  dbCtx.TSafra.ApplyUpdates(-1);
  MyShowMessage('Safra Cadastrado com Sucesso!',false);
  dbCtx.TSafra.Close;
  dbCtx.TSafra.Open;
//  if dbCtx.vTipoBDConfig=0 then
//  TThread.CreateAnonymousThread(procedure()
//  begin
//    DataModule1.ReplicaSafra('');
//  end).Start;
  lblTotalRegistro.Text := intToStr(StringGrid1.RowCount);
  MudarAba(tbiLista,sender);
 except
   on E: Exception do
    myShowMessage('Erro ao salvar Safra:'+E.Message,false);
 end;
end;

procedure TfrmSafra.btnDeletarClick(Sender: TObject);
begin
   MyShowMessage('Deseja Realmente Deletar essa Safra?',true);
   case frmPrincipal.vMsgConfirma of
     1:begin
        dbCtx.TSafra.Edit;
        dbCtx.TSafraStatus.AsInteger := -1;
        dbCtx.TSafraIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
        dbCtx.TSafraDataAlteracao.AsDateTime     := now;
        dbCtx.AlteraFlaSynAWS_ZERO('safra',dbCtx.TSafraID.AsString);
        try
          dbCtx.TSafra.ApplyUpdates(-1);
          MyShowMessage('Registro Excluido com sucesso!',false);
          dbCtx.TSafra.Close;
          dbCtx.TSafra.Open();
//          if dbCtx.vTipoBDConfig=0 then
//          TThread.CreateAnonymousThread(procedure()
//          begin
//            DataModule1.ReplicaSafra('');
//          end).Start;
        except
         on E : Exception do
          ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
        end;
     end;
   end;
end;

procedure TfrmSafra.btnEditarClick(Sender: TObject);
begin
  dbCtx.TSafra.Edit;
  edtNome.Text         := dbCtx.TSafranome.AsString;
  if dbCtx.TSafrastatus.AsInteger=1 then
  begin
   cbxStatus.ItemIndex  :=0;
   edtDataFim.Text      :='';
   lblDataFim.Visible   := true;
   edtDataFim.Visible   := true;
  end
  else
  begin
   cbxStatus.ItemIndex  :=1;
   edtDataFim.date      := dbCtx.TSafradatafim.AsDateTime;
  end;
  edtObs.Text          :=dbCtx.TSafraobservacao.AsString;
  inherited;
end;

procedure TfrmSafra.edtNomeFiltroChangeTracking(Sender: TObject);
begin
 if edtNomeFiltro.Text.Length>0 then
 begin
   dbCtx.TSafra.Filtered := false;
   dbCtx.TSafra.Filter   := 'NOME LIKE '+QuotedStr('%'+edtNomeFiltro.Text+'%');
   dbCtx.TSafra.Filtered := true;
 end
 else
 begin
   dbCtx.TSafra.Filtered := false;
   dbCtx.TSafra.Close;
   dbCtx.TSafra.Open;
 end;
 lblTotalRegistro.Text := intToStr(StringGrid1.RowCount);
end;

procedure TfrmSafra.FormShow(Sender: TObject);
begin
  dbCtx.TSafra.Close;
  dbCtx.TSafra.Open;
  lblTotalRegistro.Text := intToStr(StringGrid1.RowCount);
  inherited;
end;

procedure TfrmSafra.LimpaCampos;
begin
  edtNome.Text         :='';
  cbxStatus.ItemIndex  :=0;
  cbxStatus.Enabled    :=false;
  edtDataInicio.Text   :='';
  edtDataFim.Text      :='';
  edtDataFim.Visible   :=false;
  lblDataFim.Visible   :=false;
  edtObs.Text          :='';
end;

procedure TfrmSafra.StringGrid1CellDblClick(const Column: TColumn;
  const Row: Integer);
begin
  Close;
end;

end.
