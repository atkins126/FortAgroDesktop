unit UDMRevisao;

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
  FMX.Menus, ppDB, Vcl.Imaging.pngimage, ppCtrls, ppPrnabl, ppClass, ppBands,
  ppCache, ppDesignLayer, ppParameter, ppProd, ppReport, ppComm, ppRelatv,
  ppDBPipe, ppVar, myChkBox, ppStrtch, ppSubRpt;
type
  TdmRevisao = class(TDataModule)
    TAuxRevisaoItem: TFDQuery;
    TAuxRevisaoItemid: TIntegerField;
    TAuxRevisaoItemstatus: TIntegerField;
    TAuxRevisaoItemdatareg: TSQLTimeStampField;
    TAuxRevisaoItemidusuario: TIntegerField;
    TAuxRevisaoItemdataalteracao: TSQLTimeStampField;
    TAuxRevisaoItemidusuarioalteracao: TIntegerField;
    TAuxRevisaoItemnome: TWideStringField;
    TAuxRevisaoItemsyncaws: TIntegerField;
    TAuxRevisaoItemsyncfaz: TIntegerField;
    TAuxRevisaoItemgrupo: TWideStringField;
    TRevisao: TFDQuery;
    TRevisaoid: TIntegerField;
    TRevisaostatus: TIntegerField;
    TRevisaodatareg: TSQLTimeStampField;
    TRevisaoidusuario: TIntegerField;
    TRevisaodataalteracao: TSQLTimeStampField;
    TRevisaoidusuarioalteracao: TIntegerField;
    TRevisaonome: TWideStringField;
    TRevisaointervalohoras: TBCDField;
    TRevisaosyncaws: TIntegerField;
    TRevisaosyncfaz: TIntegerField;
    TRevisaoItens: TFDQuery;
    TRevisaoMaquinas: TFDQuery;
    dsRevisao: TDataSource;
    TRevisaoMaquinasid: TIntegerField;
    TRevisaoMaquinasstatus: TIntegerField;
    TRevisaoMaquinasdatareg: TSQLTimeStampField;
    TRevisaoMaquinasidusuario: TIntegerField;
    TRevisaoMaquinasdataalteracao: TSQLTimeStampField;
    TRevisaoMaquinasidusuarioalteracao: TIntegerField;
    TRevisaoMaquinasidrevisao: TIntegerField;
    TRevisaoMaquinasidmaquina: TIntegerField;
    TRevisaoMaquinassyncaws: TIntegerField;
    TRevisaoMaquinassyncfaz: TIntegerField;
    TRevisaoMaquinasmodelo: TWideStringField;
    TRevisaoMaquinasprefixo: TWideStringField;
    TRevisaoMaquinasplaca: TWideStringField;
    TRevisaoMaquinascombustivel: TIntegerField;
    TRevisaoMaquinasultimarevisao: TDateField;
    TRevisaoMaquinashorimetroultimarev: TBCDField;
    TAuxRevisaoItemcheck: TBooleanField;
    TRevisaoMaquinaApl: TFDQuery;
    TRevisaoMaquinaAplid: TIntegerField;
    TRevisaoMaquinaAplstatus: TIntegerField;
    TRevisaoMaquinaApldatareg: TSQLTimeStampField;
    TRevisaoMaquinaAplidusuario: TIntegerField;
    TRevisaoMaquinaApldataalteracao: TSQLTimeStampField;
    TRevisaoMaquinaAplidusuarioalteracao: TIntegerField;
    TRevisaoMaquinaAplidplanorevisao: TIntegerField;
    TRevisaoMaquinaAplidmaquina: TIntegerField;
    TRevisaoMaquinaAplobservacao: TWideStringField;
    TRevisaoMaquinaApldatainicio: TDateField;
    TRevisaoMaquinaApldatafim: TDateField;
    TRevisaoMaquinaAplsyncaws: TIntegerField;
    TRevisaoMaquinaAplsyncfaz: TIntegerField;
    TRevisaoMaquinaItens: TFDQuery;
    TRevisaoMaquinaItensid: TIntegerField;
    TRevisaoMaquinaItensstatus: TIntegerField;
    TRevisaoMaquinaItensdatareg: TSQLTimeStampField;
    TRevisaoMaquinaItensidusuario: TIntegerField;
    TRevisaoMaquinaItensdataalteracao: TSQLTimeStampField;
    TRevisaoMaquinaItensidusuarioalteracao: TIntegerField;
    TRevisaoMaquinaItensidrevisao: TIntegerField;
    TRevisaoMaquinaItensiditem: TIntegerField;
    TRevisaoMaquinaItenssyncaws: TIntegerField;
    TRevisaoMaquinaItenssyncfaz: TIntegerField;
    TRevisaoMaquinaItensidproduto: TIntegerField;
    TRevisaoMaquinaAplplanorevisao: TWideStringField;
    TRevisaoMaquinaAplprefixo: TWideStringField;
    TRevisaoMaquinaItensnome: TWideStringField;
    TRevisaoMaquinaItenscodigofabricante: TWideStringField;
    TRevisaoMaquinaAplidresponsavel: TIntegerField;
    qryListaItensPlanoRev: TFDQuery;
    qryAux: TFDQuery;
    TRevisaoMaquinaAplresponsavel: TWideStringField;
    TRevisaoMaquinaAplhorimetro: TBCDField;
    TRevisaoItensInsert: TFDQuery;
    dsRelRev: TDataSource;
    ppDBRelRev: TppDBPipeline;
    ppReportRev: TppReport;
    qryRelManutencao: TFDQuery;
    ppParameterList1: TppParameterList;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel109: TppLabel;
    ppImage9: TppImage;
    ppLabel1: TppLabel;
    ppShape1: TppShape;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBITEM: TppDBText;
    ppDBProduto: TppDBText;
    ppDBCodFab: TppDBText;
    ppDBQtde: TppDBText;
    ppLine1: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLabel11: TppLabel;
    TRevisaoMaquinaApltiporevisao: TWideMemoField;
    TRevisaoMaquinaApltipo: TIntegerField;
    TRevisaoMaquinaAplhorimetroproxima: TBCDField;
    dsRelPlanoManu: TDataSource;
    ppDBRelPlanoManu: TppDBPipeline;
    ppReportRelPlanoManu: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppShape2: TppShape;
    ppLabel12: TppLabel;
    ppImage1: TppImage;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDetailBand2: TppDetailBand;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppLine3: TppLine;
    ppFooterBand2: TppFooterBand;
    ppLine4: TppLine;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppLabel23: TppLabel;
    ppDesignLayers2: TppDesignLayers;
    ppDesignLayer2: TppDesignLayer;
    ppParameterList2: TppParameterList;
    qryRelPlanoManu: TFDQuery;
    ppDBText13: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppShape3: TppShape;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel15: TppLabel;
    ppShape4: TppShape;
    ppLabel16: TppLabel;
    ppDBText14: TppDBText;
    myCheckBox1: TmyCheckBox;
    ppLabel17: TppLabel;
    qryRelManutencaoplanorevisao: TWideStringField;
    qryRelManutencaonumerorevisao: TIntegerField;
    qryRelManutencaoresponsavel: TWideStringField;
    qryRelManutencaodatainicio: TDateField;
    qryRelManutencaodatafim: TDateField;
    qryRelManutencaomaquina: TWideStringField;
    qryRelManutencaohorimetro: TBCDField;
    qryRelManutencaoitem: TWideStringField;
    qryRelManutencaoproduto: TWideStringField;
    qryRelManutencaocodigofabricante: TWideStringField;
    qryRelManutencaotipostr: TWideStringField;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppShape40: TppShape;
    ppLblItem: TppLabel;
    ppLblObs: TppLabel;
    ppLblCodFab: TppLabel;
    ppLBLQtde: TppLabel;
    ppShape5: TppShape;
    ppLabel18: TppLabel;
    ppDBText15: TppDBText;
    ppLblProduto: TppLabel;
    ppLblCheck: TppLabel;
    qryRelManutencaoobservacao: TWideStringField;
    ppDBObservacao: TppDBText;
    myChec: TmyCheckBox;
    qryListaItensPlanoRevid: TIntegerField;
    qryListaItensPlanoRevstatus: TIntegerField;
    qryListaItensPlanoRevidrevisao: TIntegerField;
    qryListaItensPlanoRevidproduto: TIntegerField;
    qryListaItensPlanoRevconfirmado: TIntegerField;
    qryListaItensPlanoRevitem: TWideStringField;
    qryListaItensPlanoRevtipo: TIntegerField;
    qryListaItensPlanoRevitemnome: TWideStringField;
    qryListaItensPlanoRevcodigofabricante: TWideStringField;
    qryListaItensPlanoRevproduto: TWideStringField;
    TRevisaoItensInsertid: TIntegerField;
    TRevisaoItensInsertstatus: TIntegerField;
    TRevisaoItensInsertdatareg: TSQLTimeStampField;
    TRevisaoItensInsertidusuario: TIntegerField;
    TRevisaoItensInsertdataalteracao: TSQLTimeStampField;
    TRevisaoItensInsertidusuarioalteracao: TIntegerField;
    TRevisaoItensInsertidrevisao: TIntegerField;
    TRevisaoItensInsertsyncaws: TIntegerField;
    TRevisaoItensInsertsyncfaz: TIntegerField;
    TRevisaoItensInsertidproduto: TIntegerField;
    TRevisaoItensInsertitem: TWideStringField;
    TRevisaoItensInserttipo: TIntegerField;
    TRevisaoItensInsertobservacao: TWideStringField;
    qryListaItensPlanoRevtipostr: TWideStringField;
    qryListaItensPlanoRevobservacao: TWideStringField;
    TServicoRevisao: TFDQuery;
    TServicoRevisaoid: TIntegerField;
    TServicoRevisaostatus: TIntegerField;
    TServicoRevisaodatareg: TSQLTimeStampField;
    TServicoRevisaoidusuario: TIntegerField;
    TServicoRevisaodataalteracao: TSQLTimeStampField;
    TServicoRevisaoidusuarioalteracao: TIntegerField;
    TServicoRevisaotiposervico: TIntegerField;
    TServicoRevisaoidrevisao: TIntegerField;
    TServicoRevisaodescricao: TWideStringField;
    TServicoRevisaoresponsavel: TWideStringField;
    TServicoRevisaovalortotal: TBCDField;
    TServicoRevisaosyncaws: TIntegerField;
    TServicoRevisaosyncfaz: TIntegerField;
    TServicoRevisaotipostr: TWideMemoField;
    TServicoRevisaodatarealizado: TDateField;
    ppDBServiRevisao: TppDBPipeline;
    dsServicoRevisao: TDataSource;
    ppSummaryBand1: TppSummaryBand;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppHeaderBand3: TppHeaderBand;
    ppDetailBand3: TppDetailBand;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppLine5: TppLine;
    ppFooterBand3: TppFooterBand;
    ppDesignLayers3: TppDesignLayers;
    ppDesignLayer3: TppDesignLayer;
    ppShape6: TppShape;
    ppLabel7: TppLabel;
    ppLabel10: TppLabel;
    ppLabel24: TppLabel;
    ppLabel8: TppLabel;
    ppShape7: TppShape;
    ppLabel9: TppLabel;
    ppLabel25: TppLabel;
    TRevisaoItenstipostr: TWideStringField;
    TRevisaoItensid: TIntegerField;
    TRevisaoItensstatus: TIntegerField;
    TRevisaoItensdatareg: TSQLTimeStampField;
    TRevisaoItensidusuario: TIntegerField;
    TRevisaoItensdataalteracao: TSQLTimeStampField;
    TRevisaoItensidusuarioalteracao: TIntegerField;
    TRevisaoItensidrevisao: TIntegerField;
    TRevisaoItenssyncaws: TIntegerField;
    TRevisaoItenssyncfaz: TIntegerField;
    TRevisaoItensidproduto: TIntegerField;
    TRevisaoItensqtde: TBCDField;
    TRevisaoItenstipo: TIntegerField;
    TRevisaoItensobservacao: TWideStringField;
    TRevisaoItensitem: TWideStringField;
    TRevisaoItensiditem: TIntegerField;
    TRevisaoItensitem_1: TWideStringField;
    TRevisaoItenscodigofabricante: TWideStringField;
    TRevisaoItensproduto: TWideStringField;
    TRevisaoItensInsertiditem: TIntegerField;
    qryListaItensPlanoReviditem: TIntegerField;
    qryRelPlanoManuplano: TWideStringField;
    qryRelPlanoManuitem: TWideStringField;
    qryRelPlanoManuqtde: TBCDField;
    qryRelPlanoManuunidademedida: TWideStringField;
    qryRelPlanoManuproduto: TWideStringField;
    qryRelPlanoManucodigofabricante: TWideStringField;
    qryRelPlanoManuintervalohoras: TBCDField;
    qryRelPlanoManutipostr: TWideStringField;
    qryListaItensPlanoRevqtde: TBCDField;
    TRevisaoItensInsertqtde: TBCDField;
    qryRelManutencaoqtde: TBCDField;
    TRevisaoMaquinaItensqtde: TBCDField;
    procedure TRevisaoItensReconcileError(DataSet: TFDDataSet; E: EFDException;
      UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
    procedure TAuxRevisaoItemReconcileError(DataSet: TFDDataSet;
      E: EFDException; UpdateKind: TFDDatSRowState;
      var Action: TFDDAptReconcileAction);
    procedure TRevisaoReconcileError(DataSet: TFDDataSet; E: EFDException;
      UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
    procedure TRevisaoMaquinasReconcileError(DataSet: TFDDataSet;
      E: EFDException; UpdateKind: TFDDatSRowState;
      var Action: TFDDAptReconcileAction);
    procedure TRevisaoMaquinaItensReconcileError(DataSet: TFDDataSet;
      E: EFDException; UpdateKind: TFDDatSRowState;
      var Action: TFDDAptReconcileAction);
    procedure TRevisaoMaquinaAplReconcileError(DataSet: TFDDataSet;
      E: EFDException; UpdateKind: TFDDatSRowState;
      var Action: TFDDAptReconcileAction);
    procedure ppGroupHeaderBand2BeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    procedure AbrePlanoManutencao(idPlano:string);
    procedure GeraListaItensTMP(IdPlano:string);
    procedure InsereItensTMP(vIdRevisao,Item,idProduto,Qtde,Tipo,iditem:string);
    procedure InsereItensTMPLubVeric(vIdRevisao,Item,Observacao,Tipo,iditem: string);
    procedure MudaStatusItemTMP(idItem,idStatus:string);
    procedure EditaItemListaTMP(IdItem,IdProduto,Qtde:string);
    procedure InsereObsListaTMP(IdItem,Obs:string);
    function  VerificaItensConfirmados(IdPlano:string):string;
    function  RetornaIdMaxRevisao:string;
    procedure AbreRevisaoApl(Filtro:string);
    procedure AbreItensRevisaoApl(vIdRevisao:string);
    procedure AbreItensReliRevisaoApl(vIdRevisao:string);
    procedure AtualizaMaquinaProximaRevisao(vIdMaquina,DataUltima,HoraUltim,HoraProxima:string);
    procedure AbrePlanoRevisaoRep(vIdRevisao:string);
    procedure AbreServicosRevisao(vIdRevisao:string);
    procedure AlteraIdRevisaoTMPServico(vIdTMP,vIdRevisao:string);
  end;

var
  dmRevisao: TdmRevisao;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses DataContext;

{$R *.dfm}

procedure TdmRevisao.AbreItensReliRevisaoApl(vIdRevisao: string);
begin
 with qryRelManutencao,qryRelManutencao.SQL do
 begin
   Clear;
   Add('select');
   Add(' coalesce(rp.nome,''CORRETIVA'') PlanoRevisao,');
   Add(' r.id NumeroRevisao,');
   Add(' u.nome responsavel,');
   Add(' r.datainicio,');
   Add(' r.datafim,');
   Add(' m.prefixo maquina,');
   Add(' r.horimetro,');
   Add(' ri.Item,');
   Add(' p.nome Produto,');
   Add(' p.codigofabricante,');
   Add(' RI.qtde,');
   Add(' cast(case');
   Add(' when RI.tipo =0 then ''MANUTEN플O''');
   Add(' when RI.tipo =1 then ''LUBRIFICA플O''');
   Add(' when RI.tipo =2 then ''VERIFICA플O''');
   Add('end as varchar(13)) tipoStr,');
   Add('RI.OBSERVACAO');
   Add('from revisaomaquinaitens ri');
   Add('join revisaomaquina r on r.id=ri.idrevisao');
   Add('LEFT join planorevisao rp on rp.id=r.idplanorevisao');
   Add('join maquinaveiculo m on m.id=r.idmaquina');
   Add('join usuario u on u.id=r.idusuario');
   Add('left join produtos p on p.id=ri.idproduto');
   Add('where r.id='+vIdRevisao);
   Open;
   AbreServicosRevisao(vIdRevisao);
   ppReportRev.print;
 end;
end;

procedure TdmRevisao.AbreItensRevisaoApl(vIdRevisao: string);
begin
 with TRevisaoMaquinaItens,TRevisaoMaquinaItens.SQL do
 begin
   Clear;
   Add('select a.*,b.nome,b.codigofabricante');
   Add('from revisaomaquinaitens a');
   Add('join produtos b on a.idproduto=b.id');
   Add('where a.status>-1');
   Add('and a.idrevisao='+vIdRevisao);
   Open;
 end;
end;

procedure TdmRevisao.AbrePlanoManutencao(idPlano: string);
begin
  qryListaItensPlanoRev.Filtered := false;
  with qryListaItensPlanoRev,qryListaItensPlanoRev.SQL do
  begin
     Clear;
     Add('select a.*,item ItemNome,p.codigofabricante,p.nome produto,');
     Add('cast(case');
     Add(' when a.tipo =0 then ''MANUTEN플O''');
     Add(' when a.tipo =1 then ''LUBRIFICA플O''');
     Add(' when a.tipo =2 then ''VERIFICA플O''');
     Add('end as varchar(13)) tipoStr');
     Add('from tmprevisaoitens a');
     Add('left join produtos p on p.id=a.idproduto');
     Add('where a.status>-1 and a.idrevisao='+idPlano);
     Add('order by tipo,a.status,a.Item');
     qryListaItensPlanoRev.SQL.Text;
     Open;
  end;
end;


procedure TdmRevisao.AbrePlanoRevisaoRep(vIdRevisao: string);
begin
 with qryRelPlanoManu,qryRelPlanoManu.SQL do
 begin
   Clear;
   Add('select');
   Add('a.nome Plano,');
   Add('Item,');
   Add('b.qtde,');
   Add('d.unidademedida,');
   Add('d.nome produto,');
   Add('d.codigofabricante,');
   Add('intervalohoras,');
   Add('cast(case');
   Add(' when b.tipo =0 then ''MANUTEN플O''');
   Add(' when b.tipo =1 then ''LUBRIFICA플O''');
   Add(' when b.tipo =2 then ''VERIFICA플O''');
   Add('end as varchar(13)) tipoStr');
   Add('from planorevisao a');
   Add('join planorevisaoitens b on b.status=1 and a.id=b.idrevisao');
   Add('left join produtos d on d.id=b.idproduto');
   Add('where a.id='+vIdRevisao);
   Add('order by b.tipo');
   Open;
   ppReportRelPlanoManu.Print;
 end;
end;

procedure TdmRevisao.AbreRevisaoApl(Filtro: string);
begin
 with TRevisaoMaquinaApl,TRevisaoMaquinaApl.SQL do
 begin
   Clear;
   Add('select');
   Add(' c.*,');
   Add(' coalesce(r.nome,''CORRETIVA'') PlanoRevisao,');
   Add(' m.prefixo,');
   Add(' u.nome responsavel,');
   Add('case');
   Add(' when C.TIPO=0 then ''PREVENTIVA''');
   Add(' when C.TIPO=1 then ''CORRETIVA''');
   Add('end TipoRevisao');
   Add('from revisaomaquina c');
   Add('left join planorevisao r on r.id=c.idplanorevisao');
   Add('join maquinaveiculo m on m.id=c.idmaquina');
   Add('join usuario u on u.id=c.idresponsavel');
   Add('where c.status>-1');
   Add(Filtro);
   Open;
 end;
end;

procedure TdmRevisao.AbreServicosRevisao(vIdRevisao: string);
begin
 with TServicoRevisao,TServicoRevisao.SQL do
 begin
   Clear;
   Add('select a.*,');
   Add(' case');
   Add('  when tipoServico=0 then ''TERCERIZADO''');
   Add('  when tipoServico=1 then ''INTERNO''');
   Add(' end TipoStr');
   Add('from servicoManutencao a');
   Add('where status=1');
   Add('and a.idrevisao='+vIdRevisao);
   Open;
 end;
end;

procedure TdmRevisao.AlteraIdRevisaoTMPServico(vIdTMP, vIdRevisao: string);
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('update servicoManutencao set idrevisao='+vIdRevisao);
   Add('where id='+vIdTMP);
   try
    ExecSQL;
   except
     on E : Exception do
      ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
    end;
 end;
end;

procedure TdmRevisao.AtualizaMaquinaProximaRevisao(vIdMaquina,DataUltima,HoraUltim,HoraProxima: string);
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('update maquinaveiculo set horimetroultimarev='+HoraUltim);
   Add(',horimetroproximarevisao='+HoraProxima);
   Add(',ultimarevisao='+DataUltima);
   Add('where ID='+vIdMaquina);
   try
    ExecSQL;
   except
     on E : Exception do
      ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
    end;
 end;
end;

procedure TdmRevisao.EditaItemListaTMP(IdItem, IdProduto, Qtde: string);
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('update tmprevisaoitens set idproduto='+IdProduto);
   Add(',qtde='+Qtde);
   Add('where id='+IdItem);
   try
    ExecSQL;
   except
     on E : Exception do
      ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
    end;
 end;
end;

procedure TdmRevisao.GeraListaItensTMP(IdPlano: string);
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('delete from tmprevisaoitens');
   ExecSQL;

   Clear;
   Add('insert into tmprevisaoitens(idrevisao,item,idproduto,qtde,tipo,idItem)');
   Add('(select');
   Add('idrevisao,');
   Add('item,');
   Add('idproduto,');
   Add('qtde,');
   Add('tipo,');
   Add('iditem');
   Add('from planorevisaoitens');
   Add('where idrevisao='+idPlano+')');
   try
    ExecSQL;
   except
     on E : Exception do
      ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
    end;
 end;
end;

procedure TdmRevisao.InsereItensTMP(vIdRevisao,Item, idProduto, Qtde,Tipo,iditem: string);
begin
  with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('insert into tmprevisaoitens(idrevisao,item,idproduto,qtde,tipo,iditem)');
   Add('values(');
   Add(vIdRevisao+',');
   Add(Item.QuotedString+',');
   Add(idproduto+',');
   Add(StringReplace(qtde,',','.',[rfReplaceAll])+',');
   Add(Tipo+',');
   Add(iditem+')');
   try
    ExecSQL;
   except
     on E : Exception do
      ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
    end;
 end;
end;

procedure TdmRevisao.InsereItensTMPLubVeric(vIdRevisao,Item,Observacao,Tipo,IdItem: string);
begin
  with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('insert into tmprevisaoitens(idrevisao,item,observacao,tipo,iditem)');
   Add('values(');
   Add(vIdRevisao+',');
   Add(Item.QuotedString+',');
   Add(Observacao.QuotedString+',');
   Add(Tipo+',');
   Add(IdItem+')');
   try
    ExecSQL;
   except
     on E : Exception do
      ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
    end;
 end;
end;

procedure TdmRevisao.InsereObsListaTMP(IdItem, Obs: string);
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('update tmprevisaoitens set observacao='+Obs.QuotedString);
   Add('where id='+idItem);
   ExecSQL;
 end;
end;

procedure TdmRevisao.MudaStatusItemTMP(idItem, idStatus: string);
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('update tmprevisaoitens set status='+idStatus);
   Add('where id='+idItem);
   ExecSQL;
 end;
end;

procedure TdmRevisao.ppGroupHeaderBand2BeforePrint(Sender: TObject);
begin
 if qryRelManutencaotipostr.AsString='MANUTEN플O' then
 begin
   ppDBObservacao.Visible := false;
   myChec.Visible         := false;

   ppLblObs.Visible       := false;
   ppLblCheck.Visible     := false;

   ppLblItem.Visible      := true;
   ppDBITEM.Visible       := true;

   ppLblProduto.Visible   := true;
   ppDBProduto.Visible    := true;

   ppLblCodFab.Visible    := true;
   ppDBCodFab.Visible     := true;

   ppLBLQtde.Visible      := true;
   ppDBQtde.Visible       := true;


   ppLblItem.Width        := 6.5104;
   ppDBITEM.Width         := 6.5104;

   ppLblProduto.Left      := 6.5417;
   ppDBProduto.Left       := 6.5417;

   ppLblCodFab.Left       := 8.75;
   ppDBCodFab.Left        := 8.75;

   ppLBLQtde.Left         := 10.4271;
   ppDBQtde.Left          := 10.4271;
 end
 else
 begin
   ppLblObs.Visible       := true;
   ppLblCheck.Visible     := true;

   ppLblItem.Visible      := true;
   ppDBITEM.Visible       := true;

   ppLblProduto.Visible   := false;
   ppDBProduto.Visible    := false;

   ppLblCodFab.Visible    := false;
   ppDBCodFab.Visible     := false;

   ppLBLQtde.Visible      := false;
   ppDBQtde.Visible       := false;

   ppLblItem.Width        := 6.8438;
   ppLblObs.left          := 6.9062;
   ppLblCheck.left        := 10.4895;

   ppDBObservacao.Visible := true;
   ppDBObservacao.Left    := 6.8962;

   myChec.Visible         := true;
   myChec.Left            := 10.4893;
 end;
end;

function TdmRevisao.RetornaIdMaxRevisao: string;
begin
   with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('select max(id) max_id from revisaomaquina');
   Open;
   Result := FieldByName('max_id').AsString;
 end;
end;

procedure TdmRevisao.TAuxRevisaoItemReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
   ShowMessage(e.Message);
end;

procedure TdmRevisao.TRevisaoItensReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
   ShowMessage(e.Message);
end;

procedure TdmRevisao.TRevisaoMaquinaAplReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
 ShowMessage(e.Message);
end;

procedure TdmRevisao.TRevisaoMaquinaItensReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
 ShowMessage(e.Message);
end;

procedure TdmRevisao.TRevisaoMaquinasReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
    ShowMessage(e.Message);
end;

procedure TdmRevisao.TRevisaoReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
    ShowMessage(e.Message);
end;

function TdmRevisao.VerificaItensConfirmados(IdPlano: string): string;
begin
  with qryAux,qryAux.SQL do
  begin
     Clear;
     Add('select count(*) qtd from tmprevisaoitens');
     Add('where status=2');
     Open;
     Result := FieldByName('qtd').AsString;
  end;
end;

end.
