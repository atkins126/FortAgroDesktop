unit UMonitoramento;

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
  FMX.DateTimeCtrls, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, View.WebCharts,FMX.WebBrowser,
  Charts.Types;

type
  TfrmMonitoramento = class(TfrmCadPadrao)
    Layout1: TLayout;
    Rectangle2: TRectangle;
    Layout6: TLayout;
    imgOcorrencia: TImage;
    imgMaquinas: TImage;
    imgProdutos: TImage;
    imgFinalizar: TImage;
    imgVazao1: TImage;
    RecScroolBox: TRectangle;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    edtDataInicio: TDateEdit;
    edtDataFim: TDateEdit;
    Buscar: TButton;
    Image7: TImage;
    btnPrint: TButton;
    Image8: TImage;
    layDetalhes: TLayout;
    layGridMaquinas: TLayout;
    Layout39: TLayout;
    Rectangle27: TRectangle;
    Label37: TLabel;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    FHorizBox: TScrollBox;
    Lista: TListView;
    Layout2: TLayout;
    Image9: TImage;
    Button1: TButton;
    Image10: TImage;
    Label6: TLabel;
    edtSetor: TEdit;
    WebCharts1: TWebCharts;
    btnGrafico: TButton;
    WebBrowser1: TWebBrowser;
    procedure FormShow(Sender: TObject);
    procedure BuscarClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure Image9Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnGraficoClick(Sender: TObject);
  private
    idOpClick:string;
    procedure GeraLista(vFiltro:string);
    procedure GeraListaPontos(vIdMonit:string);
    procedure ClickItem(Sender: TObject);
    procedure ClickAbreProntos(Sender: TObject);
    procedure DeleteAll;

  public
    Capturing: Boolean;
    MouseDownSpot: TPoint;
    procedure MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

  end;

var
  frmMonitoramento: TfrmMonitoramento;

implementation

{$R *.fmx}

uses UPrincipal, DataContext, UdmReport;

{ TfrmMonitoramento }

procedure TfrmMonitoramento.btnGraficoClick(Sender: TObject);
begin
 TThread.CreateAnonymousThread(procedure()
 begin
 TThread.Synchronize(TThread.CurrentThread,
 procedure ()
 begin
   with dmRel.qryRepMonSum,dmRel.qryRepMonSum.SQL do
   begin
     Clear;
     Add('select Praga "Label",avg(media)"Value" from');
     Add('(select');
     Add('y.*,');
     Add('cast(cast(y.totalPragas as double precision) /cast(y.totalpontos  as double precision) as decimal(15,3))media');
     Add('from');
     Add('( ');
     Add('select');
     Add(' s.nome,');
     Add(' f.nome Talhao,');
     Add(' p.nome Praga,');
     Add(' count(b.id) TotalPontos,');
     Add(' sum(a.contagem) TotalPragas,');
     Add(' min(c.datamonitoramento) PrimeiroMonitoramento,');
     Add(' max(c.datamonitoramento) ultimoMonitoramento,');
     Add(' current_date-max(c.datamonitoramento) diasUltimoMonitoramento');
     Add('from  monitoramentopragaspontos  b');
     Add('join monitoramentopragas c on b.idmonitoramento=c.id');
     Add('join talhoes f on f.id=c.idtalhao');
     Add('join setor s on s.id=f.idsetor');
     Add('left join monitoramentopragaspontosvalores a on a.idponto=b.id');
     Add('left join auxpragas p on p.id=a.idpraga');
     Add('group by s.nome,f.nome,p.nome)y');
     Add('where y.praga is not null');
     if edtNomeFiltro.Text.Length>0 then
      Add('and Y.Talhao='+edtNomeFiltro.Text.QuotedString);
     if edtSetor.Text.Length >0 then
      Add('and Y.nome='+edtSetor.Text.QuotedString);
     Add('order by TALHAO)w');
     Add('group by Praga');
     dmRel.qryRepMonitoramento.SQL.Text;
     Open;
   end;
  if not dmRel.qryRepMonSum.IsEmpty then
  begin
   try
    WebCharts1
    .BackgroundColor('#000000')
    .NewProject
      .Charts
        ._ChartType(bar)
          .Attributes
            .Name('GraficoPragas')
            .Options
              .Legend
              .display(false)
              .&End
            .&End
            .Labelling
             .Format('0.0[00]')
             .RGBColor('255,255,255,255')
             .FontSize(12)
             .FontStyle('bold') //normal, bold, italic
             .FontFamily('Arial') //Open Sans, Arial, Helvetica e etc..
           .&End
            .DataSet
              .Fill(false)
              .BackgroundColor('14,55,200')
              .BorderColor('30,182,203')
              .DataSet(dmRel.qryRepMonSum)
            .&End
          .&End
        .&End
      .&End
    .WebBrowser(WebBrowser1)
    .Generated;
    MudarAba(tbiCad,sender);
   except
     on E : Exception do
      ShowMessage('Erro ao Gerar Grafico: '+e.Message);
   end;
  end
  else
   ShowMessage('Sem dados para esse filtro!!');
 end);
end).Start;
end;

procedure TfrmMonitoramento.btnPrintClick(Sender: TObject);
var
 vDataIniF,vDataFimF,vFiltro:string;
begin
 vDataIniF:= FormatDateTime('yyyy-mm-dd',edtDataInicio.Date).QuotedString;
 vDataFimF:= FormatDateTime('yyyy-mm-dd',edtDataFim.Date).QuotedString;
 vFiltro  := ' AND datamonitoramento between '+vDataIniF+' and '+vDataFimF;
 if edtNomeFiltro.Text.Length >0 then
   vFiltro  := vFiltro+' and g.nome like '+QuotedStr('%'+edtNomeFiltro.Text+'%');
 dmRel.AbreRelatorioMonitoramento(vFiltro);
end;

procedure TfrmMonitoramento.BuscarClick(Sender: TObject);
var
 vDataIniF,vDataFimF,vFiltro:string;
begin
 vDataIniF:= FormatDateTime('yyyy-mm-dd',edtDataInicio.Date).QuotedString;
 vDataFimF:= FormatDateTime('yyyy-mm-dd',edtDataFim.Date).QuotedString;
 vFiltro  := ' AND datamonitoramento between '+vDataIniF+' and '+vDataFimF;
 if edtNomeFiltro.Text.Length >0 then
   vFiltro  := vFiltro+' and b.nome like '+QuotedStr('%'+edtNomeFiltro.Text+'%');
 if edtSetor.Text.Length >0 then
   vFiltro  := vFiltro+' and s.nome like '+QuotedStr('%'+edtSetor.Text+'%');

 GeraLista(vFiltro);
end;

procedure TfrmMonitoramento.Button1Click(Sender: TObject);
begin
 with dmRel.qryRepMonitoramento,dmRel.qryRepMonitoramento.SQL do
 begin
   Clear;
   Add('select');
   Add('y.*,');
   Add('cast(cast(y.totalPragas as double precision) /cast(y.totalpontos  as double precision) as decimal(15,3))media');
   Add('from');
   Add('(');
   Add('select');
   Add(' s.nome,');
   Add(' f.nome Talhao,');
   Add(' p.nome Praga,');
   Add(' count(b.id) TotalPontos,');
   Add(' sum(a.contagem) TotalPragas,');
   Add(' min(c.datamonitoramento) PrimeiroMonitoramento,');
   Add(' max(c.datamonitoramento) ultimoMonitoramento,');
   Add(' current_date-max(c.datamonitoramento) diasUltimoMonitoramento ');
   Add('from  monitoramentopragaspontos  b ');
   Add('join monitoramentopragas c on b.idmonitoramento=c.id');
   Add('join talhoes f on f.id=c.idtalhao');
   Add('join setor s on s.id=f.idsetor');
   Add('left join monitoramentopragaspontosvalores a on a.idponto=b.id');
   Add('left join auxpragas p on p.id=a.idpraga');
   Add('group by s.nome,f.nome,p.nome)y');
   Add('where y.praga is not null');
   if edtNomeFiltro.Text.Length>0 then
    Add('and Y.Talhao='+edtNomeFiltro.Text.QuotedString);
   if edtSetor.Text.Length >0 then
    Add('and Y.nome='+edtSetor.Text.QuotedString);
   Add('order by TALHAO,media desc');
   Open;
   if not IsEmpty then
     dmRel.RepMonitoramentoIdice.Print
   else
    MyShowMessage('Sem dados para esse filtro!',false);
 end;

end;

procedure TfrmMonitoramento.ClickAbreProntos(Sender: TObject);
begin
 TThread.CreateAnonymousThread(procedure
 begin
  idOpClick := TImage(Sender).TagString;
  GeraListaPontos(idOpClick);
  layDetalhes.Visible := true;
 end).Start;
end;

procedure TfrmMonitoramento.ClickItem(Sender: TObject);
begin
 TThread.CreateAnonymousThread(procedure
 begin
  TThread.Synchronize(nil, procedure
  begin
    (Sender as TLayout).Opacity :=0.5;
  end);
  sleep(200);
  TThread.Synchronize(nil, procedure
  begin
    (Sender as TLayout).Opacity :=1;
  end);
  idOpClick := TLayout(Sender).TagString;
 end).Start;
end;


procedure TfrmMonitoramento.FormShow(Sender: TObject);
 var
 vDataIniF,vDataFimF,vFiltro:string;
begin
 layDetalhes.Visible := false;
 edtDataInicio.Date  := date-30;
 edtDataFim.Date     := date;
 tbPrincipal.TabPosition := TTabPosition.None;
 tbPrincipal.ActiveTab   := tbiLista;
 vDataIniF:= FormatDateTime('yyyy-mm-dd',edtDataInicio.Date).QuotedString;
 vDataFimF:= FormatDateTime('yyyy-mm-dd',edtDataFim.Date).QuotedString;
 vFiltro  := ' AND datamonitoramento between '+vDataIniF+' and '+vDataFimF;
 GeraLista(vFiltro);
 layDetalhes.Height    := frmPrincipal.Height -50;
end;

procedure TfrmMonitoramento.DeleteAll;
var
 i : integer;
 layout : TLayout;
begin
 try
  for i := FHorizBox.ComponentCount - 1 downto 0 do
  begin
      if (UpperCase(FHorizBox.Components[i].ClassName) = 'TLAYOUT') and
         (FHorizBox.Components[i].tag >= 0) then
      begin
          layout := TLayout(FHorizBox.Components[i]);
          layout.DisposeOf;
      end;
  end;
 finally
 end;
end;

procedure TfrmMonitoramento.GeraLista(vFiltro: string);
var
 i,COUNT,vLargura :integer;
 Lyt,LytMaster,LytSub: TLayout;
 lbl: TLabel;

 Rec,RecTop: TRectangle;
 Img : TImage;
begin
   vLargura := trunc((frmPrincipal.Width/5)-10);
   dbCtx.AbrirMonitoramento(vFiltro);
   DeleteAll();
   if not dbCtx.TMonitoramento.IsEmpty then
   begin

    dbCtx.TMonitoramento.First;
    i:=0;
    COUNT:=1;
    while not dbCtx.TMonitoramento.eof do
    begin
      if COUNT=1 then
      begin
        LytMaster              := TLayout.Create(FHorizBox);
        LytMaster.Align        := TAlignLayout.top;
        LytMaster.Height       := 200;
        LytMaster.Parent       := FHorizBox;
        LytMaster.TagString    := dbCtx.TMonitoramentoid.AsString;
        LytMaster.HitTest      := false;
        LytMaster.Margins.Top  := 5;
      end;
        lyt              := TLayout.Create(LytMaster);
        lyt.Margins.Left := 10;
        lyt.Align        := TAlignLayout.Left;
        lyt.Width        := vLargura;
        lyt.Parent       := LytMaster;
        lyt.OnClick      := ClickItem;
        lyt.TagString    := dbCtx.TMonitoramentoid.AsString;
        lyt.HitTest      := true;

        Rec              := TRectangle.Create(lyt);
        Rec.Align        := TAlignLayout.Contents;
        Rec.Parent       := lyt;
        Rec.Stroke.Color := TAlphaColorRec.Darkblue;
        Rec.Fill.Color   := TAlphaColorRec.Darkblue;
        Rec.HitTest      := false;

        lbl                 := TLabel.Create(Rec);
        lbl.Align           := TAlignLayout.top;
        lbl.Parent          := Rec;
        lbl.FontColor       := $FFFFFFFF;
        lbl.StyledSettings  := lbl.StyledSettings - [TStyledSetting.Size];
        lbl.Font.Size       := 20;
        lbl.TextAlign       := TTextAlign.Center;
        lbl.Text            := dbCtx.TMonitoramentotalhao.AsString;
        lbl.HitTest         := false;
        lbl.Height          := 30;
        lbl.Margins.Left    := 3;
        Rec.AddObject(lbl);



        lbl                 := TLabel.Create(Rec);
        lbl.Align           := TAlignLayout.top;
        lbl.Parent          := Rec;
        lbl.FontColor       := $FFFFFFFF;
        lbl.StyledSettings  := lbl.StyledSettings - [TStyledSetting.Size];
        lbl.Font.Size       := 15;
        lbl.TextAlign       := TTextAlign.Leading;
        lbl.Text            := dbCtx.TMonitoramentoresponsavel.AsString;
        lbl.HitTest         := false;
        lbl.Height          := 18;
        lbl.Margins.Left    := 3;
        Rec.AddObject(lbl);

        lbl                 := TLabel.Create(Rec);
        lbl.Align           := TAlignLayout.top;
        lbl.Parent          := Rec;
        lbl.FontColor       := $FFFFFFFF;
        lbl.StyledSettings  := lbl.StyledSettings - [TStyledSetting.Size];
        lbl.Font.Size       := 15;
        lbl.TextAlign       := TTextAlign.Leading;
        lbl.Text            := 'Data: '+dbCtx.TMonitoramentodatamonitoramento.AsString;
        lbl.HitTest         := false;
        lbl.Height          := 18;
        lbl.Margins.Left    := 3;
        Rec.AddObject(lbl);

        lbl                 := TLabel.Create(Rec);
        lbl.Align           := TAlignLayout.top;
        lbl.Parent          := Rec;
        lbl.FontColor       := $FFFFFFFF;
        lbl.StyledSettings  := lbl.StyledSettings - [TStyledSetting.Size];
        lbl.Font.Size       := 15;
        lbl.TextAlign       := TTextAlign.Leading;
        lbl.Text            := 'Hora Inicio:'+FormatDateTime('hh:mm:ss',dbCtx.TMonitoramentohorainicio.AsDateTime);
        lbl.HitTest         := false;
        lbl.Height          := 18;
        lbl.Margins.Left    := 3;
        Rec.AddObject(lbl);

        lbl                 := TLabel.Create(Rec);
        lbl.Align           := TAlignLayout.top;
        lbl.Parent          := Rec;
        lbl.FontColor       := $FFFFFFFF;
        lbl.StyledSettings  := lbl.StyledSettings - [TStyledSetting.Size];
        lbl.Font.Size       := 15;
        lbl.TextAlign       := TTextAlign.Leading;
        lbl.Text            := 'Hora Fim:'+FormatDateTime('hh:mm:ss',dbCtx.TMonitoramentohorafim.AsDateTime);
        lbl.HitTest         := false;
        lbl.Height          := 18;
        lbl.Margins.Left    := 3;
        Rec.AddObject(lbl);

        lbl                 := TLabel.Create(Rec);
        lbl.Align           := TAlignLayout.top;
        lbl.Parent          := Rec;
        lbl.FontColor       := $FFFFFFFF;
        lbl.StyledSettings  := lbl.StyledSettings - [TStyledSetting.Size];
        lbl.Font.Size       := 15;
        lbl.Margins.Left    := 3;
        lbl.TextAlign       := TTextAlign.Leading;
        lbl.Text           := 'Status: Finalizada';
        lbl.HitTest         := false;
        lbl.Height          := 18;
        Rec.AddObject(lbl);

        LytSub                := TLayout.Create(rec);
        LytSub.Align          := TAlignLayout.Client;
        LytSub.Height         := 100;
        LytSub.HitTest        := false;
        LytSub.Margins.Left   := 5;
        LytSub.Margins.Right  := 5;
        LytSub.Margins.Bottom := 5;
        Rec.AddObject(LytSub);

        lbl                 := TLabel.Create(LytSub);
        lbl.Align           := TAlignLayout.top;
        lbl.Parent          := LytSub;
        lbl.FontColor       := $FFFFFFFF;
        lbl.StyledSettings  := lbl.StyledSettings - [TStyledSetting.Size];
        lbl.Font.Size       := 12;
        lbl.TextAlign       := TTextAlign.Center;
        lbl.Text            := 'Pontos';
        lbl.HitTest         := false;
        lbl.Height          := 12;
        lbl.Margins.Bottom  := 5;
        lbl.Margins.Top     := 5;
        LytSub.AddObject(lbl);

        Img                 := TImage.Create(LytSub);
        Img.Align           := TAlignLayout.Center;
        img.Bitmap.Assign(frmPrincipal.imgPonto.Bitmap);
        img.HitTest         := true;
        Img.OnClick         := ClickAbreProntos;
        Img.Width           := 120;
        Img.TagString       := dbCtx.TMonitoramentoid.AsString;
        LytSub.AddObject(Img);

        inc(COUNT);
        if COUNT=5 then
         COUNT:=1;
        inc(i);
        dbCtx.TMonitoramento.Next;
    end;
   end;
end;

procedure TfrmMonitoramento.GeraListaPontos(vIdMonit: string);
var
 item   : TListViewItem;
 txt    : TListItemText;
 txtH   : TListItemPurpose;
 img    : TListItemImage;
 vStatus:string;
begin
 dbCtx.AbrirMonitoramentoPontos(vIdMonit);
 dbCtx.TMonitoramentoValores.First;
 Lista.Items.Clear;
 while not dbCtx.TMonitoramentoValores.eof do
 begin
   item := Lista.Items.Add;
   with frmMonitoramento do
   begin
     with item  do
     begin
       txt      := TListItemText(Objects.FindDrawable('Text3'));
       txt.Text := dbCtx.TMonitoramentoValoresponto.AsString;
       txt.TagString := dbCtx.TMonitoramentoValoresid.AsString;

       txt      := TListItemText(Objects.FindDrawable('Text5'));
       txt.Text := 'Latitude: ';
       txt      := TListItemText(Objects.FindDrawable('Text6'));
       txt.Text := dbCtx.TMonitoramentoValoreslatitude.AsString;

       txt      := TListItemText(Objects.FindDrawable('Text4'));
       txt.Text := 'Longitude: ';
       txt      := TListItemText(Objects.FindDrawable('Text7'));
       txt.Text := dbCtx.TMonitoramentoValoreslongitude.AsString;

       txt      := TListItemText(Objects.FindDrawable('Text8'));
       txt.Text := 'Praga: ';
       txt      := TListItemText(Objects.FindDrawable('Text9'));
       txt.Text := dbCtx.TMonitoramentoValorespraga.AsString;


       txt      := TListItemText(Objects.FindDrawable('Text10'));
       txt.Text := 'Contagem: ';
       txt      := TListItemText(Objects.FindDrawable('Text11'));
       txt.Text := dbCtx.TMonitoramentoValorescontagem.AsString;

       txt      := TListItemText(Objects.FindDrawable('Text12'));
       txt.Text := 'Caracteristica: ';
       txt      := TListItemText(Objects.FindDrawable('Text13'));
       txt.Text := dbCtx.TMonitoramentoValorescaracteristicastr.AsString;

       img := TListItemImage(Objects.FindDrawable('Image10'));
       img.Bitmap     := frmPrincipal.imgPonto.Bitmap;

       if dbCtx.TMonitoramentoValorescontagem.AsString.Length>0 then
       begin
         img := TListItemImage(Objects.FindDrawable('Image17'));
         img.Bitmap     := frmPrincipal.imgRetanguloLista.Bitmap;
         img.Visible    := true;
       end;
//       else
//       begin
//        img := TListItemImage(Objects.FindDrawable('Image17'));
//        img.Bitmap     := frmPrincipal.imgRetanguloLista.Bitmap;
//        img.Visible    := false;
//       end;


       dbCtx.TMonitoramentoValores.Next;
     end;
   end;
 end;
end;

procedure TfrmMonitoramento.Image9Click(Sender: TObject);
begin
 layDetalhes.Visible := false;
end;

procedure TfrmMonitoramento.MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  (Sender as TRectangle).Opacity :=1;
end;

procedure TfrmMonitoramento.MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  (Sender as TRectangle).Opacity :=0.5;
end;


end.
