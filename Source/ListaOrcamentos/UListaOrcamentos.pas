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
  Vcl.Imaging.pngimage, ppVar, ppStrtch, ppMemo, FireDAC.FMXUI.Wait;

type
  TfrmListaOrcamento = class(TForm)
    ToolBar11: TToolBar;
    Label22: TLabel;
    Image26: TImage;
    Image27: TImage;
    layMnuStatus: TLayout;
    Rectangle22: TRectangle;
    btnImprimir: TRectangle;
    Image45: TImage;
    lblImprimir: TLabel;
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
    procedure FormShow(Sender: TObject);
    procedure Image27Click(Sender: TObject);
    procedure Image26Click(Sender: TObject);
    procedure edtFornecedorFChangeTracking(Sender: TObject);
    procedure cbxStatusOrcamentoChange(Sender: TObject);
    procedure edtOrdemFChangeTracking(Sender: TObject);
    procedure edtPedidoFChangeTracking(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
  private
    procedure FiltrarOrcamento;
  public
    function EnviaEmailReport(idOs:string): string;
    function SendEmailOS(Destinatario,Anexo,Anexo2: string): Boolean;
  end;

var
  frmListaOrcamento: TfrmListaOrcamento;

implementation

{$R *.fmx}

uses UPrincipal, DataContext, UdmReport, UDmReports;

procedure TfrmListaOrcamento.btnImprimirClick(Sender: TObject);
begin
 if dbCtx.TOrcamentoid.AsString.Length>0 then
 begin
  dbCtx.AbreItemsOrcamentos(dbCtx.TOrcamentoid.AsString);
  case dbctx.TOrcamentostatus.AsInteger  of
    1: dmReport.ppLblOrdemPedido.Text := 'Solicitação de Orçamento';
    2: dmReport.ppLblOrdemPedido.Text := 'Solicitação de Orçamento';
    3: dmReport.ppLblOrdemPedido.Text := 'Ordem de Compra';
  end;
  dmReport.ppRepOrcamento.Print;
 end;
end;

procedure TfrmListaOrcamento.cbxStatusOrcamentoChange(Sender: TObject);
begin
 FiltrarOrcamento;
end;

procedure TfrmListaOrcamento.edtFornecedorFChangeTracking(Sender: TObject);
begin
  FiltrarOrcamento;
end;

procedure TfrmListaOrcamento.edtOrdemFChangeTracking(Sender: TObject);
begin
 FiltrarOrcamento;
end;

procedure TfrmListaOrcamento.edtPedidoFChangeTracking(Sender: TObject);
begin
 FiltrarOrcamento;
end;

procedure TfrmListaOrcamento.FiltrarOrcamento;
var
 vFiltro:string;
begin
  vFiltro:='';
  if edtFornecedorF.Text.Length>0 then
   vFiltro:=vFiltro+' AND f.NOME LIKE '+QuotedStr('%'+edtFornecedorF.Text+'%');
  case cbxStatusOrcamento.ItemIndex of
   1:vFiltro:=vFiltro+' AND B.status IN(1,2)';
   2:vFiltro:=vFiltro+' AND B.status =3';
  end;
  if edtPedidoF.Text.Length>0 then
   vFiltro:=vFiltro+' AND c.identificador LIKE '+QuotedStr('%'+edtPedidoF.Text+'%');
  if edtOrdemF.Text.Length>0 then
   vFiltro:=vFiltro+' AND b.id='+edtOrdemF.Text;
  dbCtx.AbreOrcamentosLista(vFiltro);
end;


procedure TfrmListaOrcamento.FormShow(Sender: TObject);
begin
 dbCtx.AbreOrcamentosLista('');
end;

procedure TfrmListaOrcamento.Image26Click(Sender: TObject);
begin
  if layMnuStatus.Width =57 then
  begin
   lblImprimir.Text         := 'Imprimir';
   layMnuStatus.Width  := 150
  end
  else
  begin
   lblImprimir.Text         := '';
   layMnuStatus.Width  := 57;
  end;
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


end.
