unit UdmReport;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, ppCtrls, ppBands, ppVar, ppClass,
  Vcl.Imaging.pngimage, ppPrnabl, ppDB, ppCache, ppDesignLayer, ppParameter,
  ppProd, ppReport, ppComm, ppRelatv, ppDBPipe,FMX.Objects,Soap.EncdDecd,
  FMX.Graphics, ppStrtch, ppMemo, ppSubRpt, myChkBox, ppModule, raCodMod,
  Vcl.Imaging.jpeg;

type
  TdmRel = class(TDataModule)
    qryRelOperacao: TFDQuery;
    DBPRelOperacao: TppDBPipeline;
    dsRelOperacao: TDataSource;
    ReportOperacao: TppReport;
    ppParameterList1: TppParameterList;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppShape1: TppShape;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    pplblAreaTotal: TppLabel;
    ppLabel7: TppLabel;
    pplblAreaRealizada: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText5: TppDBText;
    ppShape3: TppShape;
    ppDBText6: TppDBText;
    qryMapaPLuvi: TFDQuery;
    qryMapaPLuviareanome: TWideStringField;
    qryMapaPLuvisetornome: TWideStringField;
    qryMapaPLuvipluvi: TWideStringField;
    qryMapaPLuvitalhaonome: TWideStringField;
    dsRelMapaPluvi: TDataSource;
    ppDBPMapaPluvi: TppDBPipeline;
    ReportMapaPLUVI: TppReport;
    ppParameterList2: TppParameterList;
    ppDesignLayers2: TppDesignLayers;
    ppDesignLayer2: TppDesignLayer;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppLabel8: TppLabel;
    ppLine1: TppLine;
    ppImage1: TppImage;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppLabel12: TppLabel;
    ppDBText10: TppDBText;
    ppLabel13: TppLabel;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBMemo1: TppDBMemo;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppGroupFooterBand5: TppGroupFooterBand;
    ppLabel1: TppLabel;
    ppLabel17: TppLabel;
    ppLblDataIni: TppLabel;
    ppLblDatafim: TppLabel;
    ppImage3: TppImage;
    ppShape_Zebrado: TppShape;
    ppLine4: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLine3: TppLine;
    ppShape5: TppShape;
    ppLabel10: TppLabel;
    ppDBText8: TppDBText;
    ppLabel11: TppLabel;
    ppDBText9: TppDBText;
    ppShape4: TppShape;
    ppShape_Zebrado1: TppShape;
    dsPluviometria: TDataSource;
    ppDBPluviometria: TppDBPipeline;
    ReportPluviometria: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppLabel6: TppLabel;
    ppLine2: TppLine;
    ppImage2: TppImage;
    ppDetailBand3: TppDetailBand;
    ppShape9: TppShape;
    ppFooterBand3: TppFooterBand;
    ppGroup7: TppGroup;
    ppGroupHeaderBand7: TppGroupHeaderBand;
    ppShape10: TppShape;
    ppLabel23: TppLabel;
    ppDBText2: TppDBText;
    ppGroupFooterBand7: TppGroupFooterBand;
    ppDesignLayers3: TppDesignLayers;
    ppDesignLayer3: TppDesignLayer;
    ppParameterList3: TppParameterList;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppGroupFooterBand6: TppGroupFooterBand;
    ppShape11: TppShape;
    ppLabel24: TppLabel;
    ppDBText3: TppDBText;
    ppLabel9: TppLabel;
    ppDBText1: TppDBText;
    ppLabel25: TppLabel;
    ppDBText4: TppDBText;
    ppDBText7: TppDBText;
    ppLabel26: TppLabel;
    ppShape12: TppShape;
    ppShape13: TppShape;
    ppShape14: TppShape;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppLine5: TppLine;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppLabel2: TppLabel;
    ppLabel14: TppLabel;
    ppLabel18: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppShape2: TppShape;
    dsReceituario: TDataSource;
    ReportReceituario1: TppReport;
    ppParameterList4: TppParameterList;
    ppDBDetRec: TppDBPipeline;
    DetTalhoesRec: TFDQuery;
    DetTalhoesRectalho: TWideStringField;
    DetTalhoesRecareahe: TBCDField;
    dsMonitoramento: TDataSource;
    ppReportMonitoramento: TppReport;
    ppHeaderBand5: TppHeaderBand;
    ppLabel46: TppLabel;
    ppLine9: TppLine;
    ppImage5: TppImage;
    ppDetailBand5: TppDetailBand;
    ppDBText32: TppDBText;
    ppLine10: TppLine;
    ppPageSummaryBand2: TppPageSummaryBand;
    ppShape27: TppShape;
    ppDBCalc7: TppDBCalc;
    ppFooterBand5: TppFooterBand;
    ppDesignLayers5: TppDesignLayers;
    ppDesignLayer5: TppDesignLayer;
    ppParameterList5: TppParameterList;
    ppDBPMonitoramento: TppDBPipeline;
    ppGroup8: TppGroup;
    ppGroupHeaderBand8: TppGroupHeaderBand;
    ppGroupFooterBand8: TppGroupFooterBand;
    ppDBText34: TppDBText;
    ppLine11: TppLine;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    TRelMonitoramento: TFDQuery;
    TRelMonitoramentodatamonitoramento: TDateField;
    TRelMonitoramentoresponsavel: TWideStringField;
    TRelMonitoramentotalhao: TWideStringField;
    TRelMonitoramentohorainicio: TSQLTimeStampField;
    TRelMonitoramentohorafim: TSQLTimeStampField;
    TRelMonitoramentotempototal: TTimeField;
    TRelMonitoramentoareahe: TBCDField;
    TRelMonitoramentoponto: TWideStringField;
    TRelMonitoramentolatitude: TWideStringField;
    TRelMonitoramentolongitude: TWideStringField;
    TRelMonitoramentopraga: TWideStringField;
    TRelMonitoramentocontagem: TIntegerField;
    ppGroup9: TppGroup;
    ppGroupHeaderBand9: TppGroupHeaderBand;
    ppGroupFooterBand9: TppGroupFooterBand;
    ppShape21: TppShape;
    ppLabel50: TppLabel;
    ppDBText30: TppDBText;
    ppDBText27: TppDBText;
    ppLabel49: TppLabel;
    ppLabel53: TppLabel;
    ppLabel55: TppLabel;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    ppDBText37: TppDBText;
    ppDBText29: TppDBText;
    TRelMonitoramentocaracteristicastr: TWideStringField;
    ppDBText38: TppDBText;
    ReceituarioUtil: TFDQuery;
    ReceituarioUtilidentificador: TWideStringField;
    ReceituarioUtilfinalidade: TWideStringField;
    ReceituarioUtildatarecomendada: TSQLTimeStampField;
    ReceituarioUtilresponsavel: TWideStringField;
    ReceituarioUtilidresponsavel: TIntegerField;
    ReceituarioUtilassinaturaresponsavel: TBlobField;
    ReceituarioUtilsafra: TWideStringField;
    ReceituarioUtiltalhao: TWideStringField;
    ReceituarioUtilproduto: TWideStringField;
    ReceituarioUtilrecomendadoha: TBCDField;
    ReceituarioUtilrealizadoha: TFMTBCDField;
    ReceituarioUtilareaha: TBCDField;
    ReceituarioUtilrecomendadototal: TFMTBCDField;
    ReceituarioUtilrealizadototal: TFMTBCDField;
    dsRecUtil: TDataSource;
    ppDBRecUtil: TppDBPipeline;
    ppRepRecUtil: TppReport;
    ppHeaderBand6: TppHeaderBand;
    ppShape22: TppShape;
    ppLabel58: TppLabel;
    ppLine12: TppLine;
    ppImage6: TppImage;
    ppShape24: TppShape;
    ppLabel59: TppLabel;
    ppDBText39: TppDBText;
    ppShape29: TppShape;
    ppLabel65: TppLabel;
    ppLabel66: TppLabel;
    ppLabel67: TppLabel;
    ppLabel68: TppLabel;
    ppLabel73: TppLabel;
    ppDetailBand6: TppDetailBand;
    ppDBText43: TppDBText;
    ppDBText44: TppDBText;
    ppDBText45: TppDBText;
    ppLine13: TppLine;
    ppDBText46: TppDBText;
    ppPageSummaryBand3: TppPageSummaryBand;
    ppShape31: TppShape;
    ppDBCalc9: TppDBCalc;
    ppFooterBand6: TppFooterBand;
    ppDesignLayers6: TppDesignLayers;
    ppDesignLayer6: TppDesignLayer;
    ppParameterList6: TppParameterList;
    ppLabel63: TppLabel;
    ppDBText47: TppDBText;
    ppLabel64: TppLabel;
    ppDBText48: TppDBText;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    ppDBText49: TppDBText;
    ppDBText50: TppDBText;
    ppShape28: TppShape;
    ppDBCalc11: TppDBCalc;
    ppShape30: TppShape;
    ppDBCalc12: TppDBCalc;
    ReceituarioUtilSum: TFDQuery;
    ReceituarioUtilSumproduto: TWideStringField;
    ReceituarioUtilSumtotalrecomendados: TFMTBCDField;
    ReceituarioUtilSumtotalrealizado: TFMTBCDField;
    dsRecUtilSum: TDataSource;
    ppDBRecUtilSum: TppDBPipeline;
    ppLine14: TppLine;
    ppSystemVariable7: TppSystemVariable;
    ppSystemVariable8: TppSystemVariable;
    ppSummaryBand2: TppSummaryBand;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppDesignLayers7: TppDesignLayers;
    ppDesignLayer7: TppDesignLayer;
    ppTitleBand1: TppTitleBand;
    ppDetailBand7: TppDetailBand;
    ppSummaryBand3: TppSummaryBand;
    ppShape26: TppShape;
    ppLabel60: TppLabel;
    ppLabel76: TppLabel;
    ppLabel77: TppLabel;
    ppDBText40: TppDBText;
    ppDBText41: TppDBText;
    ppDBText51: TppDBText;
    ppShape32: TppShape;
    DetRecVasao: TFDQuery;
    dsRecVasao: TDataSource;
    ppDBPRecVasao: TppDBPipeline;
    qryRelChuvaMedia: TFDQuery;
    dsRelMediaChuvas: TDataSource;
    ppDBRelChuvaMedia: TppDBPipeline;
    ppRelChuvaMed: TppReport;
    ppHeaderBand7: TppHeaderBand;
    ppLabel90: TppLabel;
    ppLine20: TppLine;
    ppImage8: TppImage;
    ppDetailBand8: TppDetailBand;
    ppDBText54: TppDBText;
    ppDBText56: TppDBText;
    ppFooterBand7: TppFooterBand;
    ppLine21: TppLine;
    ppSystemVariable9: TppSystemVariable;
    ppSystemVariable10: TppSystemVariable;
    ppGroup10: TppGroup;
    ppGroupHeaderBand10: TppGroupHeaderBand;
    ppShape35: TppShape;
    ppLabel91: TppLabel;
    ppDBText57: TppDBText;
    ppGroupFooterBand10: TppGroupFooterBand;
    ppDesignLayers8: TppDesignLayers;
    ppDesignLayer8: TppDesignLayer;
    ppParameterList7: TppParameterList;
    ppShape38: TppShape;
    ppLabel95: TppLabel;
    ppLabel96: TppLabel;
    ppSummaryBand4: TppSummaryBand;
    qryRelChuvaMediadatacoleta: TDateField;
    qryRelChuvaMediasetor: TWideStringField;
    qryRelChuvaMediaano: TFloatField;
    qryRelChuvaMediamilimetrochuva: TBCDField;
    qryRelChuvaMediames: TWideMemoField;
    ppGroup11: TppGroup;
    ppGroupHeaderBand11: TppGroupHeaderBand;
    ppGroupFooterBand11: TppGroupFooterBand;
    ppLabel94: TppLabel;
    ppDBCalc14: TppDBCalc;
    ppDBText55: TppDBText;
    ppShape39: TppShape;
    ppLabel97: TppLabel;
    ppDBCalc15: TppDBCalc;
    ppLine22: TppLine;
    ppShape34: TppShape;
    ppLabel93: TppLabel;
    ppShape36: TppShape;
    ppLabel98: TppLabel;
    ppLabel99: TppLabel;
    ppDBCalc13: TppDBCalc;
    ppDBCalc16: TppDBCalc;
    qryRepMonitoramento: TFDQuery;
    qryRepMonitoramentonome: TWideStringField;
    qryRepMonitoramentotalhao: TWideStringField;
    qryRepMonitoramentopraga: TWideStringField;
    qryRepMonitoramentototalpontos: TLargeintField;
    qryRepMonitoramentototalpragas: TLargeintField;
    qryRepMonitoramentoprimeiromonitoramento: TDateField;
    qryRepMonitoramentoultimomonitoramento: TDateField;
    qryRepMonitoramentodiasultimomonitoramento: TIntegerField;
    dsRepMonitoramento: TDataSource;
    ppDBRepMonitoramento: TppDBPipeline;
    RepMonitoramentoIdice: TppReport;
    ppHeaderBand8: TppHeaderBand;
    ppLabel109: TppLabel;
    ppLine23: TppLine;
    ppImage9: TppImage;
    ppDetailBand9: TppDetailBand;
    ppPageSummaryBand4: TppPageSummaryBand;
    ppDesignLayers9: TppDesignLayers;
    ppDesignLayer9: TppDesignLayer;
    ppParameterList8: TppParameterList;
    ppGroup12: TppGroup;
    ppGroupHeaderBand12: TppGroupHeaderBand;
    ppGroupFooterBand12: TppGroupFooterBand;
    ppGroup13: TppGroup;
    ppGroupHeaderBand13: TppGroupHeaderBand;
    ppGroupFooterBand13: TppGroupFooterBand;
    ppLabel110: TppLabel;
    ppDBText59: TppDBText;
    ppShape40: TppShape;
    ppLabel111: TppLabel;
    ppDBText60: TppDBText;
    ppShape41: TppShape;
    ppShape42: TppShape;
    ppLabel112: TppLabel;
    ppDBText61: TppDBText;
    ppLabel113: TppLabel;
    ppDBText62: TppDBText;
    ppLabel114: TppLabel;
    ppDBText63: TppDBText;
    ppShape43: TppShape;
    ppLabel115: TppLabel;
    ppDBText64: TppDBText;
    ppLabel116: TppLabel;
    ppDBText65: TppDBText;
    ppLabel117: TppLabel;
    ppDBText66: TppDBText;
    ppLabel118: TppLabel;
    ppDBText67: TppDBText;
    ppLine24: TppLine;
    qryRepMonSum: TFDQuery;
    dsRepMonSum: TDataSource;
    ppDBPRepMonSum: TppDBPipeline;
    qryRepMonitoramentomedia: TBCDField;
    ppFooterBand8: TppFooterBand;
    ppLine25: TppLine;
    ppSystemVariable11: TppSystemVariable;
    ppSystemVariable12: TppSystemVariable;
    qryRepMonSumLabel: TWideStringField;
    qryRepMonSumValue: TFMTBCDField;
    ppDBText28: TppDBText;
    ppShape20: TppShape;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    DetTalhoesRecarearealizada: TFMTBCDField;
    DSDetTalhoesRec: TDataSource;
    ppDBDetTalhoesRec: TppDBPipeline;
    DetRecVasaocincoltha: TBooleanField;
    DetRecVasaodezltha: TBooleanField;
    DetRecVasaoquinzeltha: TBooleanField;
    DetRecVasaovinteltha: TBooleanField;
    DetRecVasaotrintaltha: TBooleanField;
    DetRecVasaoquarentaltha: TBooleanField;
    DetRecVasaocinquentaltha: TBooleanField;
    DetRecVasaosetentaecincoltha: TBooleanField;
    DetRecVasaocemltha: TBooleanField;
    qryAux: TFDQuery;
    ppReportReceituario: TppReport;
    ppParameterList9: TppParameterList;
    ppDesignLayers10: TppDesignLayers;
    ppDesignLayer10: TppDesignLayer;
    ppHeaderBand9: TppHeaderBand;
    ppDetailBand10: TppDetailBand;
    ppFooterBand9: TppFooterBand;
    ppShape15: TppShape;
    ppLabel54: TppLabel;
    ppLine26: TppLine;
    ppImage10: TppImage;
    ppShape18: TppShape;
    ppLabel92: TppLabel;
    ppDBText68: TppDBText;
    ppLabel119: TppLabel;
    ppDBText70: TppDBText;
    ppLabel120: TppLabel;
    ppDBText71: TppDBText;
    ppLabel122: TppLabel;
    ppDBText72: TppDBText;
    ppLabel123: TppLabel;
    ppDBText73: TppDBText;
    ppLabel124: TppLabel;
    ppDBText74: TppDBText;
    ppShape19: TppShape;
    ppLabel125: TppLabel;
    ppShape23: TppShape;
    ppLabel126: TppLabel;
    ppDBText75: TppDBText;
    ppGroup15: TppGroup;
    ppGroupHeaderBand15: TppGroupHeaderBand;
    ppGroupFooterBand15: TppGroupFooterBand;
    ppShape25: TppShape;
    ppShape44: TppShape;
    ppLabel127: TppLabel;
    ppLabel128: TppLabel;
    ppLabel129: TppLabel;
    ppLabel130: TppLabel;
    ppLabel131: TppLabel;
    ppLabel132: TppLabel;
    ppLabel133: TppLabel;
    ppDBText76: TppDBText;
    ppLabel134: TppLabel;
    ppLabel135: TppLabel;
    ppDBText77: TppDBText;
    ppDBText78: TppDBText;
    ppDBText79: TppDBText;
    ppDBText80: TppDBText;
    ppLine28: TppLine;
    ppDBText81: TppDBText;
    ppDBText82: TppDBText;
    ppDBText83: TppDBText;
    ppDBText84: TppDBText;
    ppImage11: TppImage;
    ppImage12: TppImage;
    ppLabel136: TppLabel;
    ppLabel137: TppLabel;
    ppLabel138: TppLabel;
    ppLabel139: TppLabel;
    ppLabel140: TppLabel;
    ppLabel141: TppLabel;
    ppLine29: TppLine;
    ppLine30: TppLine;
    ppLine31: TppLine;
    ppLine32: TppLine;
    ppLine33: TppLine;
    ppLine34: TppLine;
    ppLine35: TppLine;
    ppSystemVariable15: TppSystemVariable;
    ppSystemVariable16: TppSystemVariable;
    ppShape45: TppShape;
    ppLabel142: TppLabel;
    ppDBText85: TppDBText;
    Receiturario: TFDQuery;
    Receiturariotalhao: TWideStringField;
    Receiturarioproduto: TWideStringField;
    Receiturariofinalidade: TWideStringField;
    Receiturarioid: TIntegerField;
    Receiturarioidentificador: TWideStringField;
    Receiturariodatarecomendada: TDateField;
    Receiturariodataprevaplicacao: TDateField;
    Receiturarioresponsavel: TWideStringField;
    Receiturarioassinaturaresponsavel: TBlobField;
    Receiturarioidresponsavel: TIntegerField;
    Receiturariosafra: TWideStringField;
    Receiturariotipoop: TWideMemoField;
    Receiturarioobservacao: TWideStringField;
    Receiturarioqtdetotal: TFMTBCDField;
    Receiturarioqtdrealizada: TFMTBCDField;
    Receiturarioarearealizada: TFMTBCDField;
    Receiturariocultura: TWideStringField;
    Receiturariorealizadoha: TBCDField;
    Receiturarioareaprevista: TBCDField;
    qryRelOperacaoid: TIntegerField;
    qryRelOperacaodatainicio: TDateField;
    qryRelOperacaodatafim: TDateField;
    qryRelOperacaoresponsavel: TWideStringField;
    qryRelOperacaooperacao: TWideMemoField;
    qryRelOperacaosetor: TWideStringField;
    qryRelOperacaotalhao: TWideStringField;
    qryRelOperacaoareaprevista: TBCDField;
    qryRelOperacaoarearealizada: TBCDField;
    qryRelOperacaoidoperacao: TIntegerField;
    qryRelOperacaohorastrabalhada: TFMTBCDField;
    qryRelOperacaocultura: TWideStringField;
    qryRelOperacaovariedade: TWideStringField;
    qryRelOperacaoqualidadecobertura: TWideStringField;
    qryRelOperacaocobertura: TWideStringField;
    qryRelOperacaohoraha: TFMTBCDField;
    qryRelOperacaofinalidade: TWideStringField;
    Receiturarioqtdporhe: TBCDField;
    ppHeaderBand4: TppHeaderBand;
    ppShape7: TppShape;
    ppLabel32: TppLabel;
    ppLine6: TppLine;
    ppImage4: TppImage;
    ppShape6: TppShape;
    ppLabel33: TppLabel;
    ppDBText19: TppDBText;
    ppLabel34: TppLabel;
    ppDBText20: TppDBText;
    ppLabel35: TppLabel;
    ppDBText21: TppDBText;
    ppLabel36: TppLabel;
    ppDBText22: TppDBText;
    ppLabel89: TppLabel;
    ppDBText52: TppDBText;
    ppLabel108: TppLabel;
    ppDBText58: TppDBText;
    ppShape16: TppShape;
    ppLabel38: TppLabel;
    ppShape8: TppShape;
    ppLabel45: TppLabel;
    ppDBText53: TppDBText;
    ppShape47: TppShape;
    ppLabel143: TppLabel;
    ppDBText86: TppDBText;
    ppDetailBand4: TppDetailBand;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppLine7: TppLine;
    ppDBText26: TppDBText;
    pplblRealTotal: TppDBText;
    ppDBText42: TppDBText;
    ppDBText33: TppDBText;
    ppFooterBand4: TppFooterBand;
    ppLine27: TppLine;
    ppSystemVariable13: TppSystemVariable;
    ppSystemVariable14: TppSystemVariable;
    ppGroup14: TppGroup;
    ppGroupHeaderBand14: TppGroupHeaderBand;
    ppShape46: TppShape;
    ppShape17: TppShape;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel44: TppLabel;
    ppLabel61: TppLabel;
    ppLabel62: TppLabel;
    ppLabel121: TppLabel;
    ppDBText69: TppDBText;
    ppLabel37: TppLabel;
    ppLabel43: TppLabel;
    ppDBText31: TppDBText;
    ppGroupFooterBand14: TppGroupFooterBand;
    ppShape33: TppShape;
    myDBCheckBox1: TmyDBCheckBox;
    myDBCheckBox10: TmyDBCheckBox;
    myDBCheckBox2: TmyDBCheckBox;
    myDBCheckBox3: TmyDBCheckBox;
    myDBCheckBox4: TmyDBCheckBox;
    myDBCheckBox5: TmyDBCheckBox;
    myDBCheckBox6: TmyDBCheckBox;
    myDBCheckBox8: TmyDBCheckBox;
    myDBCheckBox9: TmyDBCheckBox;
    ppImage7: TppImage;
    ppImgAss: TppImage;
    ppLabel100: TppLabel;
    ppLabel101: TppLabel;
    ppLabel102: TppLabel;
    ppLabel103: TppLabel;
    ppLabel104: TppLabel;
    ppLabel105: TppLabel;
    ppLabel42: TppLabel;
    ppLabel71: TppLabel;
    ppLabel72: TppLabel;
    ppLabel74: TppLabel;
    ppLabel75: TppLabel;
    ppLabel78: TppLabel;
    ppLabel79: TppLabel;
    ppLabel80: TppLabel;
    ppLabel81: TppLabel;
    ppLabel82: TppLabel;
    ppLabel83: TppLabel;
    ppLabel84: TppLabel;
    ppLabel85: TppLabel;
    ppLabel86: TppLabel;
    ppLabel87: TppLabel;
    ppLabel88: TppLabel;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLine8: TppLine;
    ppShape37: TppShape;
    ppLabel144: TppLabel;
    ppLabel145: TppLabel;
    ppLabel146: TppLabel;
    ppLabel147: TppLabel;
    raCodeModule2: TraCodeModule;
    ppDesignLayers4: TppDesignLayers;
    ppDesignLayer4: TppDesignLayer;
    procedure ppDetailBand1BeforePrint(Sender: TObject);
    procedure ppDetailBand2BeforePrint(Sender: TObject);
    procedure ppFooterBand4BeforePrint(Sender: TObject);
  private
    vAreaTotal,vAreaTotalRealizada:Double;
    vTalhoes,vTalhoesRec:string;
  public
    procedure AbreReceituario(vid:string);
    procedure AbreRelatorioOperacao(DataIni,DataFim,idResponsavel,idAtividade,idSetor,idTalhao,idCultura,vTipo:string);
    function  RetornaTalhoesReceituario(vIdPull:string): string;
    procedure AbreDetTalhoesReceituario(vid:string);
    function  BitmapFromBase64(const base64: string): TBitmap;
    procedure AbreRelatorioMonitoramento(vFiltro:string);
    procedure AbreVasaoReceituario(idReceituario:string);
    procedure GeraExtratoCombustivel(DataIni,DataFim,LocalEstoque:string);
    procedure GeraExtratoCombustivelProduto(DataIni, DataFim, vIdProduto: string);
    function  RetornaNomeLocal(idLocal:string):string;
  end;

var
  dmRel: TdmRel;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses DataContext, UMonitoramento;

{$R *.dfm}

{ TdmRel }

procedure TdmRel.AbreDetTalhoesReceituario(vid: string);
begin
 with DetTalhoesRec,DetTalhoesRec.SQL do
 begin
   Clear;
   Add('select b.nome Talho,a.areahe,');
   Add('coalesce((select arearealizada from operacaosafratalhao b where idreceituario=a.idreceiturario');
   Add('and idtalhao=a.idtalhao),0)arearealizada');
   Add('from detreceiturariotalhao a');
   Add('join talhoes b on a.idtalhao=b.id');
   Add('where a.idreceiturario='+vid);
   Open;
 end;
end;

procedure TdmRel.AbreReceituario(vid: string);
begin
 with Receiturario,Receiturario.SQL do
 begin
   Clear;
   Add('select x.*,');
   Add(' cast(');
   Add(' case');
   Add(' when areaRealizada>0 and qtdRealizada>0 then qtdRealizada/areaRealizada');
   Add(' else');
   Add('  0');
   Add(' end');
   Add(' as decimal(15,2))');
   Add(' realizadoHA');
   Add(' from');
   Add(' (select');
   Add(' th.nome Talhao,');
   Add(' b.nome Produto,');
   Add(' a.finalidade,');
   Add(' a.qtdporhe,');
   Add(' R.id,');
   Add(' R.nome Identificador,');
   Add(' R.datarecomendacao DataRecomendada,');
   Add(' R.dataprevaplicacao,');
   Add(' U.nome Responsavel,');
   Add(' U.imgass AssinaturaResponsavel,');
   Add(' U.id IdResponsavel,');
   Add(' (select nome from safra where datainicio<=a.datareg');
   Add(' order by id desc limit 1)safra,');
   Add(' upper((select m.tipoterraaereo from operacaosafratalhao m');
   Add(' where m.idreceituario=R.id limit 1)) TipoOp,');
   Add(' R.observacao,');
   Add(' t.areahe areaprevista,');
   Add(' a.qtdporhe*(select avg(areahe) from detreceiturariotalhao a');
   Add(' where idreceiturario=a.idreceiturario and status=1');
   Add(' and a.idtalhao=th.id) QtdeTotal,');
   Add(' coalesce((select sum(p.qtdeutilidado)');
   Add(' from detoperacaosafratalhaoprodutos p');
   Add(' join operacaosafratalhao l on p.idoperacaotalhao=l.id');
   Add(' where l.idreceituario=a.idreceiturario');
   Add(' and p.idproduto=a.idproduto');
   Add(' and l.idtalhao=th.id),0)qtdRealizada,');
   Add(' coalesce((select avg(o2.arearealizada)');
   Add(' from operacaosafratalhao o2');
   Add(' where o2.idreceituario=a.idreceiturario and o2.idtalhao=th.id),0)areaRealizada,');
   Add(' g.nome Cultura');
   Add(' from detreceiturario a');
   Add(' join receiturario r on r.id=a.idreceiturario');
   Add(' join usuario U on R.idresponsavel=U.id');
   Add(' join detreceiturariotalhao t on t.idreceiturario=r.id and t.status=1');
   Add(' join talhoes th on th.id=t.idtalhao');
   Add(' join produtos b on a.idproduto=b.id');
   Add(' left join auxculturas g on g.id=r.idCultura');
   Add(' where A.status=1 and a.idreceiturario='+vid+')x');
   Open;
   ReportReceituario1.Print;
 end;
end;

procedure TdmRel.AbreRelatorioMonitoramento(vFiltro: string);
begin
 with TRelMonitoramento,TRelMonitoramento.SQL do
 begin
   Clear;
   Add('select');
   Add('d.datamonitoramento,');
   Add('u.nome responsavel,');
   Add('g.nome Talhao,');
   Add('d.horainicio,');
   Add('d.horafim,');
   Add('cast(d.horafim-cast(d.horainicio as time)as time) TempoTotal,');
   Add('g.areahe,');
   Add('b.ponto,');
   Add('b.latitude,');
   Add('b.longitude,');
   Add('c.nome Praga,');
   Add('a.contagem,');
   Add('cast(case');
   Add('  when caracteristica=0 then ''Postura''');
   Add('  when caracteristica=1 then ''Pequena''');
   Add('  when caracteristica=2 then ''Média''');
   Add('  when caracteristica=3 then ''Grande''');
   Add('  when caracteristica=4 then ''Ninfas''');
   Add('  when caracteristica=5 then ''Rajado''');
   Add('  when caracteristica=6 then ''Adultos''');
   Add('  when caracteristica=7 then ''Branco''');
   Add('end as varchar(30)) CaracteristicaStr');
   Add('from monitoramentopragas d');
   Add('join talhoes g on g.id=d.idtalhao');
   Add('join monitoramentopragaspontos b on b.idmonitoramento=d.id');
   Add('left join monitoramentopragaspontosvalores a  on a.idponto=b.id');
   Add('left join auxpragas c on c.id=a.idpraga');
   Add('join usuario u on d.idusuario=u.id');
   Add('where d.status>-1');
   Add(vFiltro);
   Add('order by d.id, cast(replace(b.ponto,'+QuotedStr('Ponto ')+','+QuotedStr('')+')as integer)');
   Open;
   ppReportMonitoramento.Print;
 end;
end;

procedure TdmRel.AbreRelatorioOperacao(DataIni, DataFim, idResponsavel,
  idAtividade, idSetor,idTalhao,idCultura,vTipo: string);
begin
 with qryRelOperacao,qryRelOperacao.SQL do
 begin
   Clear;
   Add('select ');
   Add('y.*,');
   Add('case');
   Add('  when arearealizada >0 then');
   Add('   cast(horastrabalhada/arearealizada as decimal(15,3))');
   Add('  else');
   Add('    0');
   Add('end HoraHa');
   Add('from');
   Add(' (');
   Add('select');
   Add(' A.id,');
   Add(' A.datainicio,');
   Add(' A.datafim,');
   Add(' B.nome Responsavel,');
   Add(' case');
   Add(' when idoperacao=''1'' then ''Aplicação Solido''');
   Add(' when idoperacao=''3'' then ''Plantio''');
   Add(' when idoperacao=''2'' then ''Pulverização''');
   Add(' when idoperacao=''4'' then ''Colheita/Transbordo''');
   Add(' when idoperacao=''5'' then ''Extra''');
   Add(' end Operacao,');
   Add('d.nome Setor,');
   Add('c.nome Talhao,');
   Add('a.areaprevista,');
   Add('a.arearealizada,');
   Add('idoperacao,');
   Add('(select sum(x.horastrabalhada)');
   Add('from detoperacaosafratalhaomaquinasoperadores x where x.idoperacaotalhao=a.id)horastrabalhada,');
   Add('e.nome Cultura,');
   Add('f.nome Variedade,');
   Add('a.qualidadecobertura,');
   Add('acb.nome Cobertura,');
   Add('a.finalidade');
   Add('from operacaosafratalhao A');
   Add('join usuario B on A.idresponsavel=B.ID');
   Add('join talhoes C on C.ID=A.idtalhao');
   Add('join setor D on D.id=C.idsetor');
   Add('left join auxculturas e on a.idcultura=e.id');
   Add('left join auxcultivares f on f.id=a.idvariedade');
   Add('left join auxcobertura acb on acb.id=A.idcobertura');
   Add('where a.status>-1 and A.datainicio between '+DataIni.QuotedString+' and '+DataFim.QuotedString);
   if idResponsavel<>'0' then
    Add('and a.idresponsavel='+idResponsavel);
   if idAtividade<>'0' then
    Add('and a.idoperacao='+idAtividade);
   if idSetor<>'0' then
    Add('and c.idsetor='+idSetor);
   if idTalhao.Length>0 then
    Add('and c.nome='+idTalhao);
   if idCultura.Length>0 then
    Add('and e.nome='+idCultura);
   if vTipo.Length>0 then
    Add('and a.tipoterraaereo ='+vTipo);
   Add(')y');
   qryRelOperacao.SQL.Text;
   Open;
 end;
end;


procedure TdmRel.AbreVasaoReceituario(idReceituario: string);
begin
 with DetRecVasao,DetRecVasao.SQL do
 begin
   Clear;
   Add('select');
   Add('cast(y.cincoltha as boolean),');
   Add('cast(y.dezltha as boolean),');
   Add('cast(y.quinzeltha as boolean),');
   Add('cast(y.vinteltha as boolean),');
   Add('cast(y.trintaltha as boolean),');
   Add('cast(y.quarentaltha as boolean),');
   Add('cast(y.cinquentaltha as boolean),');
   Add('cast(y.setentaecincoltha as boolean),');
   Add('cast(y.cemltha as boolean)');
   Add('from');
   Add('(');
   Add('select');
   Add('case');
   Add(' when cincoltha=0 then False');
   Add(' else');
   Add('  True');
   Add(' end cincoltha,');
   Add(' case');
   Add(' when dezltha=0 then False');
   Add(' else');
   Add('   True');
   Add('  end dezltha,');
   Add(' case');
   Add(' when quinzeltha=0 then False');
   Add(' else');
   Add('  True');
   Add(' end quinzeltha,');
   Add(' case');
   Add(' when vinteltha=0 then False');
   Add(' else');
   Add('  True');
   Add(' end vinteltha,');
   Add(' case');
   Add(' when trintaltha=0 then False');
   Add(' else');
   Add('  True');
   Add(' end trintaltha,');
   Add(' case');
   Add(' when quarentaltha=0 then False');
   Add(' else');
   Add('  True');
   Add(' end quarentaltha,');
   Add(' case');
   Add(' when cinquentaltha=0 then False');
   Add(' else');
   Add('  True');
   Add(' end cinquentaltha,');
   Add(' case');
   Add(' when setentaecincoltha=0 then False');
   Add(' else');
   Add('  True');
   Add(' end setentaecincoltha,');
   Add(' case');
   Add(' when cemltha=0 then False');
   Add(' else');
   Add('  True');
   Add(' end cemltha');
   Add('from detvazaooperacao a');
   Add('join operacaosafratalhao b on a.idoperacaotalhao=b.id');
   Add('where b.idreceituario='+idReceituario+' limit 1');
   Add(')y');
   Open;
 end;
end;

procedure TdmRel.ppDetailBand1BeforePrint(Sender: TObject);
begin
 if Tag = 0 then
  begin
    ppShape_Zebrado.Visible := false;
    Tag := 1;
  end
  else
  begin
    ppShape_Zebrado.Visible := true;
    Tag := 0;
  end;
end;

procedure TdmRel.ppDetailBand2BeforePrint(Sender: TObject);
begin
  if Tag = 0 then
  begin
    ppShape_Zebrado1.Visible := false;
    Tag := 1;
  end
  else
  begin
    ppShape_Zebrado1.Visible := true;
    Tag := 0;
  end;
end;

function TdmRel.BitmapFromBase64(const base64: string): TBitmap;
var
  Input: TStringStream;
  Output: TBytesStream;
begin
  Input := TStringStream.Create(base64, TEncoding.ASCII);
  try
    Output := TBytesStream.Create;
    try
      Soap.EncdDecd.DecodeStream(Input, Output);
      Output.Position := 0;
      Result := TBitmap.Create;
      try
        Result.LoadFromStream(Output);
      except
        Result.Free;
        raise;
      end;
    finally
      Output.Free;
    end;
  finally
    Input.Free;
  end;
end;

procedure TdmRel.GeraExtratoCombustivelProduto(DataIni, DataFim, vIdProduto: string);
var
 vQry,vQry2,vQry3,vQry4:TFDQuery;
 vTotalEntradaIni,
 vTotalSaidaAbsIni,
 vTotalSaidaIni,
 vTotalEntradaTrsIni,
 vTotalSaidaTrsIni,
 vSaldoIni,
 vSaidaTrsDia,
 vSaidaAcertoDia,
 vEntradaTrsDia,
 vEntradaEstoqueDia,
 vAbastecimento,
 vSaldoDia,
 vEntradaTotalDia,
 vSaldoDiaAnterior:double;

 vDataControle,
 vDataFim:TDate;
 vMaquina,vidLocal,vLocal:string;
 i,x:integer;
begin
 vQry := TFDQuery.Create(nil);
 vQry.Connection := dbCtx.FDConPG;
 vQry2 := TFDQuery.Create(nil);
 vQry2.Connection := dbCtx.FDConPG;
 vQry3 := TFDQuery.Create(nil);
 vQry3.Connection := dbCtx.FDConPG;
 vQry4 := TFDQuery.Create(nil);
 vQry4.Connection := dbCtx.FDConPG;

 with vQry,vQry.SQL do
 begin
   Clear;//pegando local de estoque do combustivel
   Add('select');
   Add(' distinct idlocalestoque');
   Add('from abastecimento a');
   Add('where status=1 and combustivel ='+vIdProduto);
   Add('and dataabastecimento between '+DataIni.QuotedString+' and '+DataFim.QuotedString);
   Open;
   while not vQry.Eof do
   begin
     i :=0;
     x :=0;
     vDataControle := strToDate(DataIni);
     vidLocal := FieldByName('idlocalestoque').AsString;
     vLocal   := dmRel.RetornaNomeLocal(vidLocal);
     with vQry2,vQry2.SQL do
     begin
       //total entrada estoque
       Clear;
       Add('select coalesce(sum(n.qtditens),0) Total from notafiscalitems n');
       Add('join estoqueentrada e on e.id=n.idnota');
       Add('where n.idlocalestoque='+vidLocal);
       Add('and n.idproduto='+vIdProduto);
       Add('and e.dataentradaestoque <'+DataIni.QuotedString);
       Open;
       vTotalEntradaIni := FieldByName('Total').AsFloat;

       //total entrada transferencia
       Clear;
       Add('select coalesce(sum(t.qtde),0) Total  from tranferencialocalestoque t');
       Add('where t.status =1 and t.idlocalestoquedetino ='+vidLocal);
       Add('and t.idproduto='+vIdProduto);
       Add('and datamov<'+DataIni.QuotedString);
       Open;
       vTotalEntradaTrsIni := FieldByName('Total').AsFloat;

       //total saida estoque
       Clear;
       Add('select coalesce(sum(e.qtditens),0) Total  from estoquesaida e');
       Add('where e.status =1 and e.idlocalestoque ='+vidLocal);
       Add('and e.idproduto='+vIdProduto);
       Add('and e.datasaidaestoque<'+DataIni.QuotedString);
       Open;
       vTotalSaidaIni := FieldByName('Total').AsFloat;

       // total saida transferencia
       Clear;
       Add('select coalesce(sum(t.qtde),0) Total  from tranferencialocalestoque t');
       Add('where t.status =1 and t.idlocalestoqueorigem  ='+vidLocal);
       Add('and t.idproduto='+vIdProduto);
       Add('and datamov<'+DataIni.QuotedString);
       Open;
       vTotalSaidaTrsIni := FieldByName('Total').AsFloat;
       vSaldoIni    := (vTotalEntradaIni+vTotalEntradaTrsIni)-(vTotalSaidaIni+vTotalSaidaTrsIni);
       i :=0;
       x :=0;
       while vDataControle<=strToDate(DataFim) do
       begin
          Clear;
          Add('select coalesce(sum(qtde),0) qtde from tranferencialocalestoque a');
          Add('where a.status=1 and a.idlocalestoquedetino='+vidLocal+' and');
          Add('a.datamov=:dataControle and idproduto='+vIdProduto);
          ParamByName('dataControle').AsDate := vDataControle;
          Open;
          vEntradaTrsDia  := FieldByName('qtde').AsFloat;

          Clear;
          Add('select coalesce(sum(a.qtditens),0)qtde');
          Add('from notafiscalitems a');
          Add('join estoqueentrada b on a.idnota=b.id');
          Add('where a.status=1 and a.idlocalestoque='+vidLocal);
          Add('and b.dataentradaestoque=:dataControle and b.idproduto='+vIdProduto);
          ParamByName('dataControle').AsDate := vDataControle;
          Open;
          vEntradaEstoqueDia := FieldByName('qtde').AsFloat;

          Clear;
          Add('select coalesce(sum(qtde),0)qtde from tranferencialocalestoque a');
          Add('where a.status=1 and a.idlocalestoqueorigem='+vidLocal+' and');
          Add('a.datamov=:dataControle and a.idproduto='+vIdProduto);
          ParamByName('dataControle').AsDate := vDataControle;
          Open;
          vSaidaTrsDia  := FieldByName('qtde').AsFloat;

          Clear;
          Add('select coalesce(sum(e.qtditens),0) Total  from estoquesaida e');
          Add('where e.idabastecimento is null and e.status =1 and e.idlocalestoque ='+vidLocal);
          Add('and e.idproduto='+vIdProduto);
          Add('and e.datasaidaestoque=:dataControle');
          ParamByName('dataControle').AsDate := vDataControle;
          Open;
          vSaidaAcertoDia := FieldByName('Total').AsFloat;

          vEntradaTotalDia := vEntradaEstoqueDia+vEntradaTrsDia;

          with vQry3,vQry3.SQL do
          begin
            Clear;
            Add('select');
            Add('c.modelo||''-''||c.prefixo maquina,');
            Add('coalesce(a.volumelt,0)qtd');
            Add('from estoquesaida e');
            Add('left join abastecimento a on a.id=e.idabastecimento');
            Add('left join maquinaveiculo c on c.id=a.idmaquina');
            Add('where a.status=1 and a.idlocalestoque='+vidLocal);
            Add('and idproduto='+vIdProduto);
            Add('and e.datasaidaestoque =:dataControle');
            ParamByName('dataControle').AsDate := vDataControle;
            Open;
            if not vQry3.IsEmpty then
            begin
              x:=0;
              while not vQry3.eof do
              begin
               vAbastecimento := FieldByName('qtd').AsFloat;
               vMaquina       := FieldByName('maquina').AsString;
               if i=0 then
                vsaldoDia     := (vSaldoIni+vEntradaTotalDia)- (vSaidaTrsDia+vAbastecimento+vSaidaAcertoDia)
               else
                vsaldoDia     := (vSaldoDiaAnterior+vEntradaTotalDia)-(vSaidaTrsDia+vAbastecimento+vSaidaAcertoDia);

               with vQry4,vQry4.SQL do
               begin
                Clear;
                Add('insert into extratocombustivel(bomba,datadia,saldoinicial,totalentrada,maquina,saidaabastecimento,totalsaidatrnasf,saldodia,saidaacerto)');
                Add('values(:LocalEstoque,:DataDia,:SaldoInicial,:TotalEntrada,:Maquina,:Abastecimento,:SaidaTransferencia,:saldoDia,:saidaacerto)');
                ParamByName('LocalEstoque').AsString       := vLocal;
                ParamByName('DataDia').AsDate              := vDataControle;
                if i=0 then
                 ParamByName('SaldoInicial').AsFloat       := vSaldoIni
                else
                 ParamByName('SaldoInicial').AsFloat       := vSaldoDiaAnterior;
                ParamByName('TotalEntrada').AsFloat        := vEntradaTotalDia;
                ParamByName('Maquina').AsString            := vMaquina;
                ParamByName('Abastecimento').AsFloat       := vAbastecimento;
                ParamByName('SaidaTransferencia').AsFloat  := vSaidaTrsDia;
                ParamByName('saldoDia').AsFloat            := vsaldoDia;
                ParamByName('saidaacerto').AsFloat         := vSaidaAcertoDia;
                ExecSQL;
               end;
               inc(x);
               vSaldoDiaAnterior := vsaldoDia;
               if x>0 then
               begin
                 vSaidaTrsDia     :=0;
                 vEntradaTotalDia :=0;
                 vEntradaTrsDia   :=0;
                 vAbastecimento   :=0;
                 vSaidaAcertoDia  :=0;
               end;
               inc(i);
               vQry3.Next
              end;
            end
            else
            begin
              if i=0 then
                vsaldoDia      := (vSaldoIni+vEntradaTotalDia)-(vSaidaTrsDia+vAbastecimento+vSaidaAcertoDia)
               else
                vsaldoDia      := (vSaldoDiaAnterior+vEntradaTotalDia)- (vSaidaTrsDia+vAbastecimento+vSaidaAcertoDia);
              with vQry3,vQry3.SQL do
              begin
                Clear;
                Add('insert into extratocombustivel(bomba,datadia,saldoinicial,totalentrada,maquina,saidaabastecimento,totalsaidatrnasf,saldodia,saidaacerto)');
                Add('values(:LocalEstoque,:DataDia,:SaldoInicial,:TotalEntrada,:Maquina,:Abastecimento,:SaidaTransferencia,:saldoDia,:saidaacerto)');
                ParamByName('LocalEstoque').AsString       := vLocal;
                ParamByName('DataDia').AsDate              := vDataControle;
                if i=0 then
                 ParamByName('SaldoInicial').AsFloat       := vSaldoIni
                else
                 ParamByName('SaldoInicial').AsFloat       := vSaldoDiaAnterior;
                ParamByName('TotalEntrada').AsFloat        := vEntradaTotalDia;
                ParamByName('Maquina').AsString            := '';
                ParamByName('Abastecimento').AsFloat       := 0;
                ParamByName('SaidaTransferencia').AsFloat  := vSaidaTrsDia;
                ParamByName('saldoDia').AsFloat            := vsaldoDia;
                ParamByName('saidaacerto').AsFloat         := vSaidaAcertoDia;
                ExecSQL;
              end;
            end;
          end;//with vQry3
          vSaldoDiaAnterior := vsaldoDia;
          inc(i);
          vDataControle := vDataControle+1;
       end;//while data
     end;//with vQry2
    vQry.Next;//localestoque
   end;
 end;//with vQry
end;


procedure TdmRel.GeraExtratoCombustivel(DataIni, DataFim, LocalEstoque: string);
var
 vQry,vQry2,vQry3:TFDQuery;
 vTotalEntradaIni,
 vTotalSaidaAbsIni,
 vTotalSaidaIni,
 vTotalEntradaTrsIni,
 vTotalSaidaTrsIni,
 vSaldoIni,
 vSaidaTrsDia,
 vEntradaTrsDia,
 vEntradaEstoqueDia,
 vAbastecimento,
 vSaldoDia,vEntradaTotalDia,
 vSaldoDiaAnterior,
 vSaidaAcertoDia:double;
 vDataControle,
 vDataFim:TDate;
 vMaquina,vLocal:string;
 i,x:integer;
begin
 vQry := TFDQuery.Create(nil);
 vQry.Connection := dbCtx.FDConPG;
 vQry2 := TFDQuery.Create(nil);
 vQry2.Connection := dbCtx.FDConPG;
 vQry3 := TFDQuery.Create(nil);
 vQry3.Connection := dbCtx.FDConPG;
 i :=0;
 x :=0;
 with vQry,vQry.SQL do
 begin
   vTotalEntradaIni :=0;
   vTotalSaidaIni   :=0;

   Clear;
   Add('select * from localestoque l');
   Add('where id='+LocalEstoque);
   Open;
   vLocal := FieldByName('Nome').AsString;


   //total entrada estoque
   Clear;
   Add('select coalesce(sum(n.qtditens),0) Total from notafiscalitems n');
   Add('join estoqueentrada e on e.id=n.idnota');
   Add('where n.idlocalestoque='+LocalEstoque);
   Add('and e.dataentradaestoque <'+DataIni.QuotedString);
   Open;
   vTotalEntradaIni := FieldByName('Total').AsFloat;

   //total entrada transferencia
   Clear;
   Add('select coalesce(sum(t.qtde),0) Total  from tranferencialocalestoque t');
   Add('where t.status =1 and t.idlocalestoquedetino ='+LocalEstoque);
   Add('and datamov<'+DataIni.QuotedString);
   Open;
   vTotalEntradaTrsIni := FieldByName('Total').AsFloat;

   //total saida estoque
   Clear;
   Add('select coalesce(sum(e.qtditens),0) Total  from estoquesaida e');
   Add('where e.status =1 and e.idlocalestoque ='+LocalEstoque);
   Add('and e.datasaidaestoque<'+DataIni.QuotedString);
   Open;
   vTotalSaidaIni := FieldByName('Total').AsFloat;

   // total saida transferencia
   Clear;
   Add('select coalesce(sum(t.qtde),0) Total  from tranferencialocalestoque t');
   Add('where t.status =1 and t.idlocalestoqueorigem  ='+LocalEstoque);
   Add('and datamov<'+DataIni.QuotedString);
   Open;
   vTotalSaidaTrsIni := FieldByName('Total').AsFloat;

   vSaldoIni    := (vTotalEntradaIni+vTotalEntradaTrsIni)-(vTotalSaidaIni+vTotalSaidaTrsIni);

   vDataControle := StrToDate(DataIni);
   vDataFim      := StrToDate(DataFim);

   while vDataControle<=vDataFim do
   begin
    Clear;
    Add('select coalesce(sum(qtde),0) qtde from tranferencialocalestoque a');
    Add('where a.status=1 and a.idlocalestoquedetino='+LocalEstoque+' and');
    Add('a.datamov=:dataControle');
    ParamByName('dataControle').AsDate := vDataControle;
    Open;
    vEntradaTrsDia  := FieldByName('qtde').AsFloat;

    Clear;
    Add('select coalesce(sum(a.qtditens),0)qtde');
    Add('from notafiscalitems a');
    Add('join estoqueentrada b on a.idnota=b.id');
    Add('where a.status=1 and a.idlocalestoque='+LocalEstoque);
    Add('and b.dataentradaestoque=:dataControle');
    ParamByName('dataControle').AsDate := vDataControle;
    Open;
    vEntradaEstoqueDia := FieldByName('qtde').AsFloat;

    Clear;
    Add('select coalesce(sum(qtde),0)qtde from tranferencialocalestoque a');
    Add('where a.status=1 and a.idlocalestoqueorigem='+LocalEstoque+' and');
    Add('a.datamov=:dataControle');
    ParamByName('dataControle').AsDate := vDataControle;
    Open;
    vSaidaTrsDia  := FieldByName('qtde').AsFloat;

    Clear;
    Add('select coalesce(sum(e.qtditens),0) Total  from estoquesaida e');
    Add('where e.idabastecimento is null and e.status =1 and e.idlocalestoque ='+LocalEstoque);
    Add('and e.datasaidaestoque=:dataControle');
    ParamByName('dataControle').AsDate := vDataControle;
    Open;
    vSaidaAcertoDia := FieldByName('Total').AsFloat;

    vEntradaTotalDia := vEntradaEstoqueDia+vEntradaTrsDia;

    with vQry2,vQry2.SQL do
    begin
      Clear;
      Add('select');
      Add('c.modelo||''-''||c.prefixo maquina,');
      Add('coalesce(a.volumelt,0)qtd');
      Add('from estoquesaida e');
      Add('left join abastecimento a on a.id=e.idabastecimento');
      Add('left join maquinaveiculo c on c.id=a.idmaquina');
      Add('where a.status=1 and a.idlocalestoque='+LocalEstoque);
      Add('and e.datasaidaestoque =:dataControle');
      ParamByName('dataControle').AsDate := vDataControle;
      Open;
      if not vQry2.IsEmpty then
      begin
        x:=0;
        while not vQry2.eof do
        begin
         vAbastecimento := FieldByName('qtd').AsFloat;
         vMaquina       := FieldByName('maquina').AsString;
         if i=0 then
          vsaldoDia      := (vSaldoIni+vEntradaTotalDia)- (vSaidaTrsDia+vAbastecimento+vSaidaAcertoDia)
         else
          vsaldoDia      := (vSaldoDiaAnterior+vEntradaTotalDia)- (vSaidaTrsDia+vAbastecimento+vSaidaAcertoDia);

         with vQry3,vQry3.SQL do
         begin
          Clear;
          Add('insert into extratocombustivel(bomba,datadia,saldoinicial,totalentrada,maquina,saidaabastecimento,totalsaidatrnasf,saldodia,saidaacerto)');
          Add('values(:LocalEstoque,:DataDia,:SaldoInicial,:TotalEntrada,:Maquina,:Abastecimento,:SaidaTransferencia,:saldoDia,:saidaacerto)');
          ParamByName('LocalEstoque').AsString       := vLocal;
          ParamByName('DataDia').AsDate              := vDataControle;
          if i=0 then
           ParamByName('SaldoInicial').AsFloat       := vSaldoIni
          else
           ParamByName('SaldoInicial').AsFloat       := vSaldoDiaAnterior;
          ParamByName('TotalEntrada').AsFloat        := vEntradaTotalDia;
          ParamByName('Maquina').AsString            := vMaquina;
          ParamByName('Abastecimento').AsFloat       := vAbastecimento;
          ParamByName('SaidaTransferencia').AsFloat  := vSaidaTrsDia;
          ParamByName('saldoDia').AsFloat            := vsaldoDia;
          ParamByName('saidaacerto').AsFloat         := vSaidaAcertoDia;
          ExecSQL;
         end;
         inc(x);
         vSaldoDiaAnterior := vsaldoDia;
         if x>0 then
         begin
           vSaidaTrsDia     :=0;
           vEntradaTotalDia :=0;
           vEntradaTrsDia   :=0;
           vAbastecimento   :=0;
           vSaidaAcertoDia  :=0;
         end;
         inc(i);
         vQry2.Next
        end;
      end
      else
      begin
        if i=0 then
          vsaldoDia      := (vSaldoIni+vEntradaTotalDia)-(vSaidaTrsDia+vAbastecimento)
         else
          vsaldoDia      := (vSaldoDiaAnterior+vEntradaTotalDia)- (vSaidaTrsDia+vAbastecimento);
        with vQry3,vQry3.SQL do
        begin
          Clear;
          Add('insert into extratocombustivel(bomba,datadia,saldoinicial,totalentrada,maquina,saidaabastecimento,totalsaidatrnasf,saldodia,saidaacerto)');
          Add('values(:LocalEstoque,:DataDia,:SaldoInicial,:TotalEntrada,:Maquina,:Abastecimento,:SaidaTransferencia,:saldoDia,:saidaacerto)');
          ParamByName('LocalEstoque').AsString       := vLocal;
          ParamByName('DataDia').AsDate              := vDataControle;
          if i=0 then
           ParamByName('SaldoInicial').AsFloat       := vSaldoIni
          else
           ParamByName('SaldoInicial').AsFloat       := vSaldoDiaAnterior;
          ParamByName('TotalEntrada').AsFloat        := vEntradaTotalDia;
          ParamByName('Maquina').AsString            := '';
          ParamByName('Abastecimento').AsFloat       := 0;
          ParamByName('SaidaTransferencia').AsFloat  := vSaidaTrsDia;
          ParamByName('saldoDia').AsFloat            := vsaldoDia;
          ParamByName('saidaacerto').AsFloat         := vSaidaAcertoDia;
          ExecSQL;
        end;
      end;
    end;
    vSaldoDiaAnterior := vsaldoDia;
    inc(i);
    vDataControle := vDataControle+1
   end;
 end;
end;

procedure TdmRel.ppFooterBand4BeforePrint(Sender: TObject);
var
 Stream : TMemoryStream;
 vPathImg:string;
begin
  vPathImg := ExtractFilePath(ParamStr(0))+'imgRel';
  if not DirectoryExists(vPathImg) then
   ForceDirectories(vPathImg);
  if Receiturarioassinaturaresponsavel.AsString.Length>0 then
  begin
   Stream := TMemoryStream.Create;
   Receiturarioassinaturaresponsavel.SaveToFile(vPathImg+'\img.png');
   Receiturarioassinaturaresponsavel.SaveToStream(Stream);
   ppImgAss.Picture.LoadFromFile(vPathImg+'\img.png');
  end
  else
   ppImgAss.Picture.Bitmap.Assign(nil);
end;

function TdmRel.RetornaNomeLocal(idLocal: string): string;
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('select * from localestoque l');
   Add('where id='+idLocal);
   Open;
   Result := FieldByName('nome').AsString;
 end;
end;

function TdmRel.RetornaTalhoesReceituario(vIdPull: string): string;
var
 Talhoes:string;
begin
//  Talhoes :='';
//  AbreDetTalhoesReceituario(vIdPull);
//  DetTalhoesRec.First;
//  while not DetTalhoesRec.Eof do
//  begin
//    Talhoes := Talhoes+DetTalhoesRectalho.AsString+
//     ' Area Prev.: '+DetTalhoesRecareahe.AsString+'(ha)'+
//     ' Area Real.: '+DetTalhoesRecarearealizada.AsString+'(ha)'+' | ';
//    DetTalhoesRec.Next;
//  end;
//  Result := Talhoes;
end;

end.
