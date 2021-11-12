unit UPropriedade;

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
  Tfrmpropriedade = class(TfrmCadPadrao)
    edtNome: TEdit;
    Layout2: TLayout;
    lbl: TLabel;
    Label11: TLabel;
    edtRazaoSocial: TEdit;
    Layout4: TLayout;
    Rectangle2: TRectangle;
    Layout1: TLayout;
    edtCidade: TEdit;
    Layout6: TLayout;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label13: TLabel;
    edtCpfCnpj: TEdit;
    edtInscricaoEstadual: TEdit;
    Layout3: TLayout;
    Rectangle1: TRectangle;
    Layout7: TLayout;
    EtdEnderecoCobranca: TEdit;
    Layout8: TLayout;
    Label7: TLabel;
    Layout9: TLayout;
    Rectangle3: TRectangle;
    Layout10: TLayout;
    edtEnderecoFaturamento: TEdit;
    Layout11: TLayout;
    Label8: TLabel;
    Layout12: TLayout;
    Rectangle4: TRectangle;
    Layout13: TLayout;
    edtEmails: TEdit;
    Layout14: TLayout;
    Label9: TLabel;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    LinkControlToField5: TLinkControlToField;
    LinkControlToField6: TLinkControlToField;
    LinkControlToField7: TLinkControlToField;
    LinkControlToField8: TLinkControlToField;
    LinkFillControlToField1: TLinkFillControlToField;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    edtTab: TEdit;
    cbxUf: TComboBox;
    LinkFillControlToField2: TLinkFillControlToField;
    procedure btnAddClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure StringGrid1CellDblClick(const Column: TColumn;
      const Row: Integer);
    procedure edtNomeFiltroChangeTracking(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmpropriedade: Tfrmpropriedade;

implementation

{$R *.fmx}

uses UPrincipal, DataContext;

procedure Tfrmpropriedade.btnAddClick(Sender: TObject);
begin
  dbCtx.TPropriedade.Close;
  dbCtx.TPropriedade.Open;
  dbCtx.TPropriedade.Insert;
  inherited;
end;

procedure Tfrmpropriedade.btnDeletarClick(Sender: TObject);
begin
   MyShowMessage('Deseja Realmente Deletar esse registro?',true);
   case frmPrincipal.vMsgConfirma of
     1:begin
        dbCtx.TPropriedade.Edit;
        dbCtx.TPropriedadeStatus.AsInteger := -1;
        dbCtx.TPropriedadeIdUsuarioAlteracao.AsString  := dbCtx.vIdUsuarioLogado;
        dbCtx.TPropriedadeDataAlteracao.AsDateTime     := now;
        dbCtx.AlteraFlaSynAWS_ZERO('Propriedade',dbCtx.TPropriedadeID.AsString);
        try
          dbCtx.TPropriedadesyncaws.AsInteger            :=0;
          dbCtx.TPropriedade.ApplyUpdates(-1);
          MyShowMessage('Registro Excluido com sucesso!',false);
          dbCtx.TPropriedade.Close;
          dbCtx.TPropriedade.Open();
        except
         on E : Exception do
          ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
        end;
     end;
   end;
end;

procedure Tfrmpropriedade.btnEditarClick(Sender: TObject);
begin
 dbCtx.TPropriedade.Edit;
 inherited;
end;

procedure Tfrmpropriedade.btnSalvarClick(Sender: TObject);
begin
 edtTab.SetFocus;
 if edtNome.Text.Length =0 then
 begin
  MyShowMessage('Informe o Nome *',false);
  edtNome.SetFocus;
  Exit;
 end;
 if edtRazaoSocial.Text.Length =0 then
 begin
  MyShowMessage('Informe a Razão *',false);
  edtRazaoSocial.SetFocus;
  Exit;
 end;
 if edtCidade.Text.Length =0 then
 begin
  MyShowMessage('Informe a Cidade *',false);
  edtCidade.SetFocus;
  Exit;
 end;
 if cbxUF.ItemIndex=-1 then
 begin
  MyShowMessage('Informe a UF *',false);
  Exit;
 end;
 if edtCpfCnpj.Text.Length =0 then
 begin
  MyShowMessage('Informe o CPF/CNPJ *',false);
  edtCpfCnpj.SetFocus;
  Exit;
 end;
 if dbCtx.TPropriedade.State= dsInsert then
  dbCtx.TPropriedadeidusuario.AsString := dbCtx.vIdUsuarioLogado
 else
 begin
  dbCtx.TPropriedadeidusuarioalteracao.AsString := dbCtx.vIdUsuarioLogado;
  dbCtx.TPropriedadedataalteracao.AsDateTime    := now;
 end;

 try
  dbCtx.TPropriedade.ApplyUpdates(-1);
  dbCtx.TPropriedade.Close;
  dbCtx.TPropriedade.Open;
  inherited;
 except
  on E : Exception do
   ShowMessage(E.ClassName+' error raised, with message : '+E.Message)
 end;
end;

procedure Tfrmpropriedade.edtNomeFiltroChangeTracking(Sender: TObject);
begin
 if edtNomeFiltro.Text.Length>0 then
 begin
   dbCtx.TPropriedade.Filtered := false;
   dbCtx.TPropriedade.Filter   := 'NOME LIKE '+QuotedStr('%'+edtNomeFiltro.Text+'%');
   dbCtx.TPropriedade.Filtered := true;
 end
 else
 begin
   dbCtx.TPropriedade.Filtered := false;
   dbCtx.TPropriedade.Close;
   dbCtx.TPropriedade.Open;
 end;
end;

procedure Tfrmpropriedade.FormShow(Sender: TObject);
begin
  dbCtx.TPropriedade.Filtered := false;
  dbCtx.TPropriedade.Close;
  dbCtx.TPropriedade.Open;
  inherited;
end;

procedure Tfrmpropriedade.StringGrid1CellDblClick(const Column: TColumn;
  const Row: Integer);
begin
 Close;
end;

end.

