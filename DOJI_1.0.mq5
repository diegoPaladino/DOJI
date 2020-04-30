//+------------------------------------------------------------------+
//|                                                     DOJI_1.0.mq5 |
//|                                                    diegoPaladino |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "diegoPaladino"
#property link      "https://www.mql5.com"
#property version   "1.00"
enum ESTRATEGIA_ENTRADA
  {
   APENAS_MM,     // Apenas Média Móvel
   APENAS_IFR,    // Apenas Indicador IFR
   APENAS_ZIG_ZAG,   // Apenas Zig Zag
   MM_IFR,        // Médias + IFR
   MM_ZIG_ZAG,       // Média Móvel + Zig Zag
   MM_IFR_ZIG_ZAG,   // Média Móvel + IFR + Zig Zag
  };
//---

// Variáveis de Input:
sinput string s0;
input ESTRATEGIA_ENTRADA estrategia       = APENAS_MM;      // Estratégia de Entrada Trader

sinput string s1;
input int mediamovel_periodo               = 200;            // Período Média Móvel
input ENUM_TIMEFRAMES mm_tempo_grafico     = PERIOD_CURRENT;// Tempo Gráfico
input ENUM_MA_METHOD  mm_metodo            = MODE_EMA;      // Método 
input ENUM_APPLIED_PRICE  mm_preco         = PRICE_CLOSE;   // Preço Aplicado

sinput string s2; //-----------IFR-------------
input int ifr_periodo                      = 5;             // Período IFR
input ENUM_TIMEFRAMES ifr_tempo_grafico    = PERIOD_CURRENT;// Tempo Gráfico  
input ENUM_APPLIED_PRICE ifr_preco         = PRICE_CLOSE;   // Preço Aplicado

input int ifr_sobrecompra                  = 70;            // Nível de Sobrecompra
input int ifr_sobrevenda                   = 30;            // Nível de Sobrevenda

sinput string s3; //---------------------------
input int num_lots                         = 100;           // Número de Lotes
input double TK                            = 60;            // Take Profit
input double SL                            = 30;            // Stop Loss

sinput string s4; //---------------------------
input string hora_limite_fecha_op          = "17:40";       // Horário Limite Fechar Posição

input int ifr_sobrecompra                  = 70;            // Nível de Sobrecompra
input int ifr_sobrevenda                   = 30;            // Nível de Sobrevenda

sinput string s3; //---------------------------
input int num_lots                         = 100;           // Número de Lotes
input double TK                            = 60;            // Take Profit
input double SL                            = 30;            // Stop Loss

//+------------------------------------------------------------------+
//|  Variáveis para os indicadores                                   |
//+------------------------------------------------------------------+
//--- Médias Móveis
// RÁPIDA - menor período
   
int mediamovel_Handle;        // Handle controlador da média móvel rápida
double mediamovel_Buffer[];   // Buffer para armazenamento dos dados das médias

//--- IFR
int ifr_Handle;           // Handle controlador para o IFR
double ifr_Buffer[];      // Buffer para armazenamento dos dados do IFR

//+------------------------------------------------------------------+
//| Variáveis para as funçoes                                        |
//+------------------------------------------------------------------+

int magic_number = 123456;   // Nº mágico do robô

MqlRates velas[];            // Variável para armazenar velas
MqlTick tick;                // variável para armazenar ticks 


//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---
mm_mediamovel_Handle = iMA(_Symbol,mm_tempo_grafico,mm_mediamovel_periodo,0,mm_metodo,mm_preco);

ifr_Handle = iRSI(_Symbol,ifr_tempo_grafico,ifr_periodo,ifr_preco);

   CopyRates(_Symbol,_Period,0,4,velas);
   ArraySetAsSeries(velas,true);
   
   // Para adicionar no gráfico o indicador:
   ChartIndicatorAdd(0,0,mm_mediamovel_Handle); 
   ChartIndicatorAdd(0,1,ifr_Handle);
   //---   
   
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   IndicatorRelease(mm_mediamovel_Handle);
   IndicatorRelease(ifr_Handle);
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---
   //desenhaLinhaVertical("L1",tick.time,clrRed);
   // Copiar um vetor de dados tamanho três para o vetor mm_Buffer
    CopyBuffer(mm_mediamovel_Handle,0,0,4,mm_mediamovel_Buffer);
    
    CopyBuffer(ifr_Handle,0,0,4,ifr_Buffer);
    
    //--- Alimentar Buffers das Velas com dados:
    CopyRates(_Symbol,_Period,0,4,velas);
    ArraySetAsSeries(velas,true);
    
    // Ordenar o vetor de dados:
    ArraySetAsSeries(mm_mediamovel_Buffer,true);
    ArraySetAsSeries(ifr_Buffer,true);
    //---
    
    // Alimentar com dados variável de tick
    SymbolInfoTick(_Symbol,tick);
<<<<<<< HEAD

        // LOGICA PARA ATIVAR COMPRA 
    bool compra_mm_cros = mm_mediamovel_Buffer[0] > mm_lenta_Buffer[0] &&
                          mm_rapida_Buffer[2] < mm_lenta_Buffer[2] ;
                                             
    bool compra_ifr = ifr_Buffer[0] <= ifr_sobrevenda;
    
    // LÓGICA PARA ATIVAR VENDA
    bool venda_mm_cros = mm_mediamovel_Buffer[0] > mm_rapida_Buffer[0] &&
                         mm_mediamovel_Buffer[2] < mm_rapida_Buffer[2];
    
    bool venda_ifr = ifr_Buffer[0] >= ifr_sobrecompra;
  }
//+------------------------------------------------------------------+
// just a comment to test
=======
  }
//+------------------------------------------------------------------+
// just a comment to test
>
