unit uPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Edit, FMX.DialogService.Sync,
  FMX.Objects, System.ImageList, FMX.ImgList, System.UIConsts;

type
  TfrmPrincipal = class(TForm)
    lblCandidato_1: TLabel;
    lblCandidato_3: TLabel;
    lblcandidato_2: TLabel;
    btnConfirmar: TButton;
    btnCorrigir: TButton;
    btnBranco: TButton;
    lytBaseTeclado: TLayout;
    Layout2: TLayout;
    Layout3: TLayout;
    Layout4: TLayout;
    Layout5: TLayout;
    Layout6: TLayout;
    Layout7: TLayout;
    Layout8: TLayout;
    Layout9: TLayout;
    Layout10: TLayout;
    Layout11: TLayout;
    edtVoto: TEdit;
    btnLiberaVoto: TButton;
    btnTecla_0: TButton;
    btnTecla_1: TButton;
    btnTecla_2: TButton;
    btnTecla_3: TButton;
    btnTecla_4: TButton;
    btnTecla_5: TButton;
    btnTecla_6: TButton;
    btnTecla_7: TButton;
    btnTecla_8: TButton;
    btnTecla_9: TButton;
    lblVotoC02: TLabel;
    lblVotoc03: TLabel;
    lblVotosValidos: TLabel;
    lblTotVtValidos: TLabel;
    lblVotosBranco: TLabel;
    lblTotVtBrancos: TLabel;
    lblAptosVatar: TLabel;
    lblListaCadidatos: TLabel;
    lblCandNum01: TLabel;
    lblCandNum02: TLabel;
    lblCandNum03: TLabel;
    lblCandNum04: TLabel;
    lblCandNum05: TLabel;
    lblNum1001: TLabel;
    lblNum2002: TLabel;
    lblNum3003: TLabel;
    lblNum4004: TLabel;
    lblNum5005: TLabel;
    lblResultadoVotacao: TLabel;
    lblCandidato_4: TLabel;
    lblVotoc04: TLabel;
    lblCandidato_5: TLabel;
    lblVotoc05: TLabel;
    lblVotoC01: TLabel;
    edtAptoVotar: TEdit;
    lblNaoVotaram: TLabel;
    lbCandEscolhido: TLabel;
    imgFoto: TImage;
    ImageList1: TImageList;
    pnlResultdo: TPanel;
    pnlListaCandidatos: TPanel;
    pnlDadosUrna: TPanel;
    lblDeixaramVotar: TLabel;
    Timer1: TTimer;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Label1: TLabel;
    chdAlterar: TCheckBox;
    procedure btnLiberaVotoClick(Sender: TObject);
    procedure btnTecla_0Click(Sender: TObject);
    procedure btnCorrigirClick(Sender: TObject);
    procedure btnBrancoClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
 //   procedure edtVotoExit(Sender: TObject);
 //   procedure edtVotoChange(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure edtVotoChange(Sender: TObject);

  private
    { Private declarations }
  protected
  procedure limpaformatacao;
  function Checado :Boolean;
 // procedure trocafoto;

  var
  vVoto: Integer;
  vCanRec: Integer;
  vInice: integer;
  k: integer;

  public
    { Public declarations }

  end;

var
  frmPrincipal: TfrmPrincipal;

  cand01, cand02, cand03, cand04, cand05, cand99: Integer;
  VotoValido, kNVotaram,auxVoto: Integer;
  contvotos, candescolhido: integer;
  kvotobrancao: string;


implementation

{$R *.fmx}

procedure TfrmPrincipal.btnBrancoClick(Sender: TObject);
begin
  edtVoto.Text := '9999';
  kvotobrancao := edtVoto.Text;

end;

procedure TfrmPrincipal.btnConfirmarClick(Sender: TObject);

begin
  vVoto := strtoint(edtVoto.Text);
  if VotoValido + 1 = vInice then
      vVoto := 3003;

  case vVoto of
    1001:
      begin
        cand01 := cand01 + 1;
        lblVotoC01.Text := IntToStr(cand01);
        lblVotoC01.FontColor := claCoral;
        lblVotoC01.Font.Size := 28;

      end;

    2002:
      begin
        cand02 := cand02 + 1;
        lblVotoC02.Text := IntToStr(cand02);
        lblVotoC02.FontColor := claDodgerblue;
        lblVotoC02.Font.Size := 28;

      end;

    3003:
      begin
        cand03 := cand03 + 1;
        lblVotoc03.Text := IntToStr(cand03);
        lblVotoC03.FontColor := claDeeppink;
        lblVotoC03.Font.Size := 28;
      end;
    4004:
      begin
        cand04 := cand04 + 1;
        lblVotoc04.Text := IntToStr(cand04);
        lblVotoC04.FontColor := claGreen;
        lblVotoC04.Font.Size := 28;
      end;
    5005:
      begin
        cand05 := cand05 + 1;
        lblVotoc05.Text := IntToStr(cand05);
        lblVotoc05.FontColor := claRed;
        lblVotoc05.Font.Size := 28;
      end;
    9999:
      begin
       //totalizando os votos em branco
        cand99 := cand99 + 1;
        lblTotVtBrancos.Text := IntToStr(cand99);
      end;
  else
    ShowMessage('N?mero do candidato errado. ');
    abort;
    btnCorrigir.SetFocus;
  end;
  //verificanco se o voto ? em candidato ou em branco
   if edtVoto.Text <> kvotobrancao then
   begin
    //totalizando os voto validos
      VotoValido := VotoValido + 1;
      lblTotVtValidos.Text := IntToStr(VotoValido);
      //=========================
      //passando o voto para o candidato escolhido previamente
        if VotoValido = vInice then
        begin
          vCanRec := vCanRec + 1;
          vInice := vInice + 3;
          lbCandEscolhido.Text := inttostr(vCanRec);
        end;
      //============================

      ShowMessage('Voto Confirmado com sucesso.');
   end
   else
   begin
        ShowMessage('Voto em branco confirmado')
   end;

  lytBaseTeclado.Enabled := false;
  btnConfirmar.Enabled := false;
  btnCorrigir.Enabled := false;
  btnBranco.Enabled := false;

  //calculo votante
  const aptosvotar: Integer = 50;
  kNVotaram := aptosvotar - VotoValido - cand99;
  lblNaoVotaram.Text := inttostr(kNVotaram);
  imgFoto.Bitmap.LoadFromFile('C:\Aplicativos\Votacao\BIN\Imagem\fim.jpg');
  Timer1.Enabled := true;
end;

procedure TfrmPrincipal.btnCorrigirClick(Sender: TObject);
var
  textoedit: string;
begin
  textoedit := edtVoto.Text;
  if Length(textoedit) > 1 then
  begin
    textoedit := Copy(textoedit, 1, Length(textoedit) - 1);
    edtVoto.Text := textoedit;
  end
  else
  begin
    textoedit := '';
    edtVoto.Text := textoedit;
  end;

end;

procedure TfrmPrincipal.btnLiberaVotoClick(Sender: TObject);
begin
  limpaformatacao;
  edtVoto.Text := '';
  edtVoto.FontColor := claSlateblue;
  lytBaseTeclado.Enabled := true;
  btnConfirmar.Enabled := true;
  btnCorrigir.Enabled := true;
  btnBranco.Enabled := true;
  btnLiberaVoto.Enabled := false;
  ShowMessage('Voto Liberado.');
  imgFoto.Bitmap.LoadFromFile('C:\Aplicativos\Votacao\BIN\Imagem\VotoLiberado.jpg');

  //Checado;
end;

procedure Tecla_Numero(btn: TObject);
var
  valor: string;
begin
  with frmPrincipal do
  begin
    valor := edtVoto.Text;
    valor := valor + TButton(btn).Text;
    edtVoto.Text := valor;
  end;
 end;

procedure TfrmPrincipal.btnTecla_0Click(Sender: TObject);
begin
  Tecla_Numero(Sender);
end;

function TfrmPrincipal.Checado: Boolean;
var
vS: Boolean;
begin
  if chdAlterar.IsChecked = true then
  begin
   vS := true;
   Result := vs;
   ShowMessage('Checado');
  end
  else
  begin
   vS := false;
   Result := vs;
   ShowMessage('N?o Checado');
  end;

end;

procedure TfrmPrincipal.edtVotoChange(Sender: TObject);
var
vNmCd: string;
vRefNum: integer;
begin
 vRefNum := 0;
 vNmCd := vNmCd + edtVoto.Text;

 if vNmCd <> '' then
  vRefNum := StrToInt(vNmCd);
    if vRefNum = 1001 then
          imgFoto.Bitmap.LoadFromFile('C:\Aplicativos\Votacao\BIN\Imagem\Cao1001.jpg')
    else if vRefNum = 2002 then
          imgFoto.Bitmap.LoadFromFile('C:\Aplicativos\Votacao\BIN\Imagem\Cao2002.jpg')
    else if vRefNum = 3003 then
          imgFoto.Bitmap.LoadFromFile('C:\Aplicativos\Votacao\BIN\Imagem\Cao3003.jpg')
    else if vRefNum = 4004 then
          imgFoto.Bitmap.LoadFromFile('C:\Aplicativos\Votacao\BIN\Imagem\Cao4004.jpg')
    else if vRefNum = 5005 then
          imgFoto.Bitmap.LoadFromFile('C:\Aplicativos\Votacao\BIN\Imagem\Cao5005.jpg')
    else if vRefNum = 9999 then
          imgFoto.Bitmap.LoadFromFile('C:\Aplicativos\Votacao\BIN\Imagem\VotoBranco.jpg');
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
 vInice := 3;
  candescolhido := 0;
  contvotos := 0;

  cand01 := 0;
  cand02 := 0;
  cand03 := 0;
  cand04 := 0;
  cand05 := 0;
  cand99 := 0;
  lblTotVtValidos.Text := '';
  lblTotVtBrancos.Text := '';
  lblVotoC01.Text := IntToStr(cand01);
  lblVotoC02.Text := IntToStr(cand02);
  lblVotoc03.Text := IntToStr(cand03);
  lblVotoc04.Text := IntToStr(cand04);
  lblVotoc05.Text := IntToStr(cand05);
  lblTotVtBrancos.Text := IntToStr(cand99);

end;

procedure TfrmPrincipal.limpaformatacao;
begin
  lblVotoC01.FontColor := claBlack;
  lblVotoC01.Font.Size := 17;
  lblVotoC02.FontColor := claBlack;
  lblVotoC02.Font.Size := 17;
  lblVotoC03.FontColor := claBlack;
  lblVotoC03.Font.Size := 17;
  lblVotoC04.FontColor := claBlack;
  lblVotoC04.Font.Size := 17;
  lblVotoC05.FontColor := claBlack;
  lblVotoC05.Font.Size := 17;
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin
   imgFoto.Bitmap.LoadFromFile('C:\Aplicativos\Votacao\BIN\Imagem\UrnaLivre.jpg');
   Timer1.Enabled := false;
   edtVoto.Text := '';
   btnLiberaVoto.Enabled := true;
end;
 
end.
