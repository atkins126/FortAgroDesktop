unit UListaOrcamentos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  UCadPadrao, System.Rtti, FMX.Grid.Style, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FMX.ActnList, System.Actions, FMX.TabControl, FMX.Ani, FMX.ScrollBox,
  FMX.Grid, FMX.Edit, FMX.Controls.Presentation, FMX.Objects, FMX.Layouts,
  FMX.ListBox, FMX.DateTimeCtrls, Fmx.Bind.Grid, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.Grid, Data.Bind.DBScope, FMX.Memo,Winapi.Windows,System.DateUtils,
  FireDAC.Stan.StorageBin, Datasnap.Provider, Datasnap.DBClient, FMX.Menus,System.Threading,
  System.Notification,IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,System.JSON,
  System.JSON.Writers,System.JSON.Types,shellapi,IdSMTP, IdSSLOpenSSL, IdMessage, IdText, IdAttachmentFile,
  IdExplicitTLSClientServerBase,
  IdMessageClient,
  IdSMTPBase,
  IdIOHandler,
  IdIOHandlerSocket,
  IdIOHandlerStack,
  IdSSL, IdAntiFreezeBase, IdSMTPRelay, myChkBox,
  Vcl.Imaging.pngimage, ppVar, ppStrtch, ppMemo, FireDAC.FMXUI.Wait,
  FMX.Effects, FMX.TreeView;

type
  TfrmListaOrcamento = class(TForm)
    ToolBar11: TToolBar;
    Label22: TLabel;
    Image26: TImage;
    Image27: TImage;
    layMnuStatus: TLayout;
    Rectangle22: TRectangle;
    Layout46: TLayout;
    Layout47: TLayout;
    GroupBox2: TGroupBox;
    edtFornecedorF: TEdit;
    Label36: TLabel;
    lblStatus: TLabel;
    cbxStatusOrcamento: TComboBox;
    edtOrdemF: TEdit;
    Label55: TLabel;
    Label56: TLabel;
    edtPedidoF: TEdit;
    StringGrid4: TStringGrid;
    BindSourceDB3: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB3: TLinkGridToDataSource;
    PopupMenuEmail: TPopupMenu;
    MenuItem2: TMenuItem;
    edtProdutoF: TEdit;
    Label1: TLabel;
    btnBuscaFornecedor: TEditButton;
    btnBuscaProduto: TEditButton;
    GroupBox1: TGroupBox;
    Label63: TLabel;
    Label64: TLabel;
    edtDataInicio: TDateEdit;
    edtDataFim: TDateEdit;
    ClearEditButton1: TClearEditButton;
    ClearEditButton2: TClearEditButton;
    btnBuscar: TButton;
    TreeView1: TTreeView;
    TreeRelatorios: TTreeViewItem;
    TreeRelOrdem: TTreeViewItem;
    TreePedidoProduto: TTreeViewItem;
    Image1: TImage;
    ShadowEffect1: TShadowEffect;
    Image2: TImage;
    Image3: TImage;
    TreeRelFornecedor: TTreeViewItem;
    Image4: TImage;
    TreeResumoGeral: TTreeViewItem;
    Image5: TImage;
    procedure FormShow(Sender: TObject);
    procedure Image27Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure btnBuscaProdutoClick(Sender: TObject);
    procedure ClearEditButton1Click(Sender: TObject);
    procedure btnBuscaFornecedorClick(Sender: TObject);
    procedure ClearEditButton2Click(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure TreeRelOrdemClick(Sender: TObject);
    procedure TreePedidoProdutoClick(Sender: TObject);
    procedure TreeRelFornecedorClick(Sender: TObject);
    procedure TreeResumoGeralClick(Sender: TObject);
  private
    vIdProduto,vIdFornecedor:string;
    procedure FiltrarOrcamento;
  public
    function EnviaEmailReport(idOs:string): string;
    function SendEmailOS(Destinatario,Anexo,Anexo2: string): Boolean;
  end;

var
  frmListaOrcamento: TfrmListaOrcamento;

implementation

{$R *.fmx}

uses UPrincipal, DataContext, UdmReport, UDmReports, UFornecedor, UProdutos,
  UdmCompras;

procedure TfrmListaOrcamento.ClearEditButton1Click(Sender: TObject);
begin
 edtProdutoF.Text :='';
 vIdProduto :='0';
end;

procedure TfrmListaOrcamento.ClearEditButton2Click(Sender: TObject);
begin
 edtFornecedorF.Text :='';
 vIdFornecedor       :='0'
end;

procedure TfrmListaOrcamento.btnBuscaFornecedorClick(Sender: TObject);
begin
 frmCadFornecedor := TfrmCadFornecedor.Create(Self);
 try
  frmCadFornecedor.ShowModal;
 finally
  edtFornecedorF.Text    := dbCtx.TFornecedoresnome.AsString;
  vIdFornecedor          := dbCtx.TFornecedoresid.AsString;
  frmCadFornecedor.Free;
 end;
end;

procedure TfrmListaOrcamento.btnBuscaProdutoClick(Sender: TObject);
begin
 frmCadProdutos := TfrmCadProdutos.Create(Self);
 try
  frmCadProdutos.ShowModal;
 finally
  edtProdutoF.Text    := dbCtx.TProdutosnome.AsString;
  vIdProduto          := dbCtx.TProdutosid.AsString;
  frmCadProdutos.Free;
 end;
end;

procedure TfrmListaOrcamento.btnBuscarClick(Sender: TObject);
begin
 FiltrarOrcamento;
end;

procedure TfrmListaOrcamento.FiltrarOrcamento;
var
 vFiltro,vDataDe,vDataAte:string;
begin
  vFiltro:='';
  vDataDe  := FormatDateTime('yyyy-mm-dd',edtDataInicio.Date).QuotedString;
  vDataAte := FormatDateTime('yyyy-mm-dd',edtDataFim.Date).QuotedString;
  vFiltro  :=' AND c.datapedido between '+vDataDe+' and '+vDataAte;

  if edtFornecedorF.Text.Length>0 then
   vFiltro:=vFiltro+' AND f.id ='+vIdFornecedor;
//  case cbxStatusOrcamento.ItemIndex of
//   1:vFiltro:=vFiltro+' AND B.status IN(1,2)';
//   2:vFiltro:=vFiltro+' AND B.status =3';
//  end;
  vFiltro:=vFiltro+' AND B.status =3';
  if edtPedidoF.Text.Length>0 then
   vFiltro:=vFiltro+' AND c.identificador LIKE '+QuotedStr('%'+edtPedidoF.Text+'%');
  if edtOrdemF.Text.Length>0 then
   vFiltro:=vFiltro+' AND b.id='+edtOrdemF.Text;
  if edtProdutoF.Text.Length>0 then
   vFiltro:=vFiltro+' and p.id='+vIdProduto;

  dmCompras.AbreOrcamentosLista(vFiltro);
end;


procedure TfrmListaOrcamento.FormShow(Sender: TObject);
begin
 StringGrid4.RowCount :=0;
end;

procedure TfrmListaOrcamento.Image27Click(Sender: TObject);
begin
 Close;
end;

procedure TfrmListaOrcamento.MenuItem2Click(Sender: TObject);
begin
 ShowMessage(EnviaEmailReport(dbCtx.TOrcamentoid.AsString));
end;

function TfrmListaOrcamento.EnviaEmailReport(idOs:string): string;
var
 vText,path: string;
 StrAux  : TStringWriter;
 txtJson : TJsonTextWriter;
 vEmailCliente,vEmailUsuario,vJsonString:string;
 vJoInsert,vJoItemO,vJoItemO1 : TJSONObject;
 vJoItem,vJoItem1   : TJSONArray;
begin
 vEmailCliente := dbCtx.TOrcamentoemail.AsString;  //RetornaEmailCliente(idOs);
 vEmailUsuario := 'orcamentosffg@gmail.com';//RetornaEmailResponsavel(idOs);

 path:=ExtractFilePath(ParamStr(0))+'Ordens';
 path := path+'\'+idOs;
 if not DirectoryExists(path) then
  ForceDirectories(path);
 dmReport.ppLblOrdemPedido.Text := 'Ordem de Compra';
 try
   dmReport.ppRepOrcamento.ShowPrintDialog := false;
   dmReport.ppRepOrcamento.DeviceType      := 'PDF';
   dmReport.ppRepOrcamento.TextFileName    := path+'\OrdemCompra_'+idOs+'.pdf';
   dmReport.ppRepOrcamento.Print;
  except
  on E:Exception do
    ShowMessage('Erro ao gerar Relatório:'+e.Message);
  end;

 if vEmailCliente.Length>0 then
 begin
   if SendEmailOS(vEmailCliente,path+'\OrdemCompra_'+idOs+'.pdf','') then
   begin
     vText :='Email Cliente OK';
   end
   else
     vText :='Erro ao enviar Email Cliente';
 end;
 Result := vText;
end;

function TfrmListaOrcamento.SendEmailOS(Destinatario,Anexo,Anexo2: string): Boolean;
var
// variáveis e objetos necessários para o envio
 IdSSLIOHandlerSocket: TIdSSLIOHandlerSocketOpenSSL;
 IdSMTP: TIdSMTP;
 IdMessage: TIdMessage;
 IdText: TIdText;
 sAnexo,sAnexo2: string;
 StrAux  : TStringWriter;
 txtJson : TJsonTextWriter;
 vEmailCliente,vEmailUsuario:string;
begin
 // instanciação dos objetos
 IdSSLIOHandlerSocket := TIdSSLIOHandlerSocketOpenSSL.Create(Self);
 IdSMTP := TIdSMTP.Create(Self);
 IdMessage := TIdMessage.Create(Self);
 try
  // Configuração do protocolo SSL (TIdSSLIOHandlerSocketOpenSSL)
  IdSSLIOHandlerSocket.SSLOptions.Method := sslvSSLv23;
  IdSSLIOHandlerSocket.SSLOptions.Mode := sslmClient;
  // Configuração do servidor SMTP (TIdSMTP)
  IdSMTP.IOHandler := IdSSLIOHandlerSocket;
  IdSMTP.UseTLS := utUseImplicitTLS;
  IdSMTP.AuthType := satDefault;
  IdSMTP.Port := 465;
  IdSMTP.Host := 'smtp.gmail.com';
  IdSMTP.Username := 'orcamentosffg@gmail.com';
  IdSMTP.Password := 'ffg#2020';
  // Configuração da mensagem (TIdMessage)
  IdMessage.From.Address := Destinatario;
  IdMessage.From.Name := 'Orçamentos Fortaleza do Guaporé Agropastoril';
  IdMessage.Recipients.Add.Text := Destinatario;
  IdMessage.Subject := 'Ordem de Compra';
  IdMessage.Encoding := meMIME;
  // Configuração do corpo do email (TIdText)
  IdText := TIdText.Create(IdMessage.MessageParts);
  IdText.Body.Add('Ordem de compra aprovada');
  IdText.ContentType := 'text/plain; charset=iso-8859-1';
  // Opcional - Anexo da mensagem (TIdAttachmentFile)
  sAnexo := Anexo;
  if FileExists(sAnexo) then
  begin
   TIdAttachmentFile.Create(IdMessage.MessageParts, sAnexo);
  end;

  // Conexão e autenticação
  try
    IdSMTP.Connect;
    IdSMTP.Authenticate;
  except
  on E:Exception do
  begin
   ShowMessage(e.Message);
   Result := false;
  end;
  end;
  // Envio da mensagem
  try
    IdSMTP.Send(IdMessage);
    Result := true;
   except
   On E:Exception do
   begin
    Result := false;
   end;
  end;
  finally
   // desconecta do servidor
   IdSMTP.Disconnect;
   // liberação da DLL
   UnLoadOpenSSLLibrary;
   // liberação dos objetos da memória
   FreeAndNil(IdMessage);
   FreeAndNil(IdSSLIOHandlerSocket);
   FreeAndNil(IdSMTP);
 end;
end;


procedure TfrmListaOrcamento.TreePedidoProdutoClick(Sender: TObject);
begin
 if edtProdutoF.Text.Length=0 then
 begin
   frmPrincipal.MyShowMessage('Informe o produto!!',false);
   Exit;
 end;
 dmCompras.ppRepPedidoProduto.Print;
end;

procedure TfrmListaOrcamento.TreeRelFornecedorClick(Sender: TObject);
begin
 if edtFornecedorF.Text.Length=0 then
 begin
   frmPrincipal.MyShowMessage('Informe o Fornecedor!!',false);
   Exit;
 end;
 dmCompras.ppRepFornecedor.Print;
end;

procedure TfrmListaOrcamento.TreeRelOrdemClick(Sender: TObject);
begin
 if dmCompras.TOrcamentoid.AsString.Length>0 then
 begin
  dmCompras.AbreItemsOrcamentos(dmCompras.TOrcamentoid.AsString);
  case dmCompras.TOrcamentostatus.AsInteger  of
    1: dmCompras.ppLblOrdemPedido.Text := 'Solicitação de Orçamento';
    2: dmCompras.ppLblOrdemPedido.Text := 'Solicitação de Orçamento';
    3: dmCompras.ppLblOrdemPedido.Text := 'Ordem de Compra';
  end;
  dmCompras.ppRepOrcamento.Print;
 end;
end;

procedure TfrmListaOrcamento.TreeResumoGeralClick(Sender: TObject);
var
 vFiltro,vDataDe,vDataAte:string;
begin
  vFiltro:='';
  vDataDe  := FormatDateTime('yyyy-mm-dd',edtDataInicio.Date).QuotedString;
  vDataAte := FormatDateTime('yyyy-mm-dd',edtDataFim.Date).QuotedString;
  vFiltro  :=' AND coalesce(o.datacompra,cast(o.datareg as date)) between '+vDataDe+' and '+vDataAte;
  dmCompras.AbreResumoGeralPedidos(vFiltro);
end;

end.
