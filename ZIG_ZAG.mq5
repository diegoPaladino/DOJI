//+------------------------------------------------------------------+
//|                                                      ZIG_ZAG.mq5 |
//|                                                    diegoPaladino |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "diegoPaladino"
#property link      "https://www.mql5.com"
#property version   "1.00"

#property indicator_label1 "Zigzag"

input int ExtDepth=12;
input int ExtDeviation=5;
input int ExtBackstep=3;

double ZigzagBuffer[]; // comentário no buffer zig zag
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---
   SetIndexBuffer(0,ZigzagBuffer,INDICATOR_DATA);
   
   
   PlotIndexSetString(0,PLOT_LABEL,"ZigZag("+(string)ExtDepth+","+(string)ExtDeviation+","+(string)ExtBackstep+")");
   
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---
   
  }
//+------------------------------------------------------------------+
