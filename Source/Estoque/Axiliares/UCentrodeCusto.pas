unit UCentrodeCusto;

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
  Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope, FMX.ListBox;

type
  TfrmCentroCusto = class(TfrmCadPadrao)
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    Layout1: TLayout;
    Label4: TLabel;
    edtNome: TEdit;
    Layout4: TLayout;
    Rectangle2: TRectangle;
    Layout2: TLayout;
    Layout6: TLayout;
    lblSegmento: TLabel;
    cbxSegmento: TComboBox;
    procedure edtNomeFiltroChangeTracking(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure StringGrid1CellDblClick(const Column: TColumn;
      const Row: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCentroCusto: TfrmCentroCusto;

implementation

{$R *.fmx}

uses DataContext, dmReplicacao, UPrincipal;

procedure TfrmCentroCusto.btnAddClick(Sender: TObject);
begin
  edtNome.Text :='';
  cbxSegmento.ItemIndex:=-1;
  dbCtx.AbreCentroCusto('');
  dbCtx.TCentroCusto.Insert;
  inherited;
end;

procedure TfrmCentroCusto.btnDeletarClick(Sender: TObject);
begin
   MyShowMessage('Deseja Realmente Deletar esse registro?',true);
   case frmPrincipal.vMsgConfirma of
     1:begin
        dbCtx.TCentroCusto.Edit;
        dbCtx.TCentroCustosyncaws.AsInteger            :=0;
        dbCtx.TCentroCustoStatus.AsInteger             := -1;
        dbCtx.TCentroCustoIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
        dbCtx.TCentroCustoDataAlteracao.AsDateTime     := now;
        dbCtx.AlteraFlaSynAWS_ZERO('CentroCusto',dbCtx.TCentroCustoID.AsString);
        try
          dbCtx.TCentroCustosyncaws.AsInteger          :=0;
          dbCtx.TCentroCusto.ApplyUpdates(-1);
          MyShowMessage('Registro Excluido com sucesso!',false);
          dbCtx.AbreCentroCusto('');
//          if dbCtx.vTipoBDConfig=0 then
//           TThread.CreateAnonymousThread(procedure()
//           begin
//             DataModule1.ReplicaCentroCusto('');
//           end).Start;
          lblTotalRegistro.Text := intToStr(StringGrid1.RowCount);
        except
         on E : Exception do
          ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
        end;
     end;
   end;
end;

procedure TfrmCentroCusto.btnEditarClick(Sender: TObject);
begin
  edtNome.Text             := dbCtx.TCentroCustonome.AsString;
  cbxSegmento.ItemIndex    := dbCtx.TCentroCustoidsegmento.AsInteger;
  dbCtx.TCentroCusto.edit;
  inherited;
end;

procedure TfrmCentroCusto.btnSalvarClick(Sender: TObject);
begin
  if edtNome.Text.Length=0 then
  begin
    MyShowMessage('Informe o Nome!!',false);
    edtNome.SetFocus;
    Exit;
  end;
  if cbxSegmento.ItemIndex=-1 then
  begin
    MyShowMessage('Informe o Segmento!!',false);
    cbxSegmento.SetFocus;
    Exit;
  end;
  dbCtx.TCentroCustonome.AsString         := edtNome.Text;
  dbCtx.TCentroCustoidsegmento.AsInteger  := cbxSegmento.ItemIndex;
  if dbCtx.TCentroCusto.State=dsEdit then
  begin
   dbCtx.TCentroCustoIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
   dbCtx.TCentroCustoDataAlteracao.AsDateTime     := now;
   dbCtx.AlteraFlaSynAWS_ZERO('CentroCusto',dbCtx.TCentroCustoID.AsString);
  end;
  if dbCtx.TCentroCusto.State=dsInsert then
  begin
   if not dbCtx.VerificaCadastroExiste('NOME','CentroCusto',edtNome.Text) then
   begin
     MyShowMessage('Ja existe um Centro de Custo com esse nome:'+edtNome.Text,false);
     Exit;
   end;
  end;
  try
   dbCtx.TCentroCustoIdUsuario.AsString := dbCtx.vIdUsuarioLogado;
   dbCtx.TCentroCustosyncaws.AsInteger :=0;
   dbCtx.TCentroCusto.ApplyUpdates(-1);
   dbCtx.AbreCentroCusto('');
   lblTotalRegistro.Text := intToStr(StringGrid1.RowCount);
   MyShowMessage('Centro de Custo Cadastrado com sucesso!',false);
   MudarAba(tbiLista,Sender);
//   if dbCtx.vTipoBDConfig=0 then
//   TThread.CreateAnonymousThread(procedure()
//   begin
//     DataModule1.ReplicaCentroCusto('');
//   end).Start;
  except
   on E : Exception do
     MyShowMessage('Erro ao Inserir Centro de Custo:'+E.Message,false);
  end;
end;

procedure TfrmCentroCusto.edtNomeFiltroChangeTracking(Sender: TObject);
begin
 if edtNomeFiltro.Text.Length>0 then
 begin
   dbCtx.TCentroCusto.Filtered := false;
   dbCtx.TCentroCusto.Filter   := 'NOME LIKE '+QuotedStr('%'+edtNomeFiltro.Text+'%');
   dbCtx.TCentroCusto.Filtered := true;
 end
 else
 begin
   dbCtx.TCentroCusto.Filtered := false;
   dbCtx.TCentroCusto.Close;
   dbCtx.TCentroCusto.Open;
 end;
 lblTotalRegistro.Text := intToStr(StringGrid1.RowCount);
end;

procedure TfrmCentroCusto.FormShow(Sender: TObject);
begin
  dbCtx.AbreCentroCusto('');
  inherited;
end;


procedure TfrmCentroCusto.StringGrid1CellDblClick(const Column: TColumn;
  const Row: Integer);
begin
 Close;
end;

end.
