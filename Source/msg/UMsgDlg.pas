unit UMsgDlg;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Effects,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Objects, FMX.Layouts;

type
  TFrmmsgDlg = class(TForm)
    layBase: TLayout;
    Layout1: TLayout;
    RecStatusAcao: TRectangle;
    imgLogo: TImage;
    Layout2: TLayout;
    Layout3: TLayout;
    msg: TLabel;
    Layout16: TLayout;
    ShadowEffect4: TShadowEffect;
    Timer1: TTimer;
    layBtnControls: TLayout;
    SEffectBtnConfirm1: TShadowEffect;
    btnConfirmar: TRectangle;
    layBntConfirm: TLayout;
    imgBntConfirm: TImage;
    lblBtnConfirm: TLabel;
    SEffectBtnConfirm: TShadowEffect;
    btnCancel: TRectangle;
    layBtnCancel: TLayout;
    ImgBtnCancel: TImage;
    lblBtnCancel: TLabel;
    SEffectBtnCancel: TShadowEffect;
    Rectangle1: TRectangle;
    procedure FormCreate(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    vBntConfirmaMsg,vAguarde :integer;
    vPositionX,
    vPositionY :Single;
    vKeyUp:integer;
  end;

var
  FrmmsgDlg: TFrmmsgDlg;

implementation

{$R *.fmx}

uses UPrincipal;

procedure TFrmmsgDlg.btnCancelClick(Sender: TObject);
begin
  Timer1.Enabled          := FALSE;
  vBntConfirmaMsg         :=2;
  Close;
end;

procedure TFrmmsgDlg.btnConfirmarClick(Sender: TObject);
begin
  Timer1.Enabled := FALSE;
  vBntConfirmaMsg         :=1;
  Close;
end;

procedure TFrmmsgDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Timer1.Enabled := FALSE;
  vAguarde :=0;
end;

procedure TFrmmsgDlg.FormCreate(Sender: TObject);
begin
  vBntConfirmaMsg         :=0;
  vKeyUp                  :=0;
end;

procedure TFrmmsgDlg.FormKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
 if Key = vkReturn then
 begin
  if vKeyUp=1 then
   btnConfirmarClick(sender)
  else
   vKeyUp:=1;
 end;
end;

procedure TFrmmsgDlg.FormShow(Sender: TObject);
begin
  vPositionX              :=imgLogo.Position.X;
  vPositionY              :=imgLogo.Position.Y;
end;

procedure TFrmmsgDlg.Timer1Timer(Sender: TObject);
begin
 if RecStatusAcao.Stroke.Color=TAlphaColorRec.Black then
  begin
   RecStatusAcao.Stroke.Kind  :=  TBrushKind.Solid;
   RecStatusAcao.Stroke.Color :=  TAlphaColorRec.Red;
  end
  else
  begin
   RecStatusAcao.Stroke.Kind  :=  TBrushKind.Solid;
   RecStatusAcao.Stroke.Color :=  TAlphaColorRec.Black;
  end;
end;
end.
