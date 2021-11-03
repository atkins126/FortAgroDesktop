unit UdmCompras;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmCompras = class(TDataModule)
    AuxFormaPG: TFDQuery;
    AuxFormaPGid: TIntegerField;
    AuxFormaPGstatus: TIntegerField;
    AuxFormaPGdatareg: TSQLTimeStampField;
    AuxFormaPGidusuario: TIntegerField;
    AuxFormaPGdataalteracao: TSQLTimeStampField;
    AuxFormaPGidusuarioalteracao: TIntegerField;
    AuxFormaPGidfornecedor: TIntegerField;
    AuxFormaPGcodigo: TWideStringField;
    AuxFormaPGdescricao: TWideStringField;
    AuxFormaPGsyncfaz: TIntegerField;
    AuxFormaPGsyncaws: TIntegerField;
  private
    { Private declarations }
  public
    procedure AbreFormaPagamento(id:string);
  end;

var
  dmCompras: TdmCompras;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses DataContext;

{$R *.dfm}

{ TdmCompras }

procedure TdmCompras.AbreFormaPagamento(id: string);
begin
 with AuxFormaPG,AuxFormaPG.SQL do
 begin
   Clear;
   Add('select * from forma_pagamento_fornecedor');
   Add('where idfornecedor='+id);
   Open;
 end;
end;

end.
