//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, AwasumPrecious"
#property link      "https://www.apforexx.com"
#property version   "1.00"

//+------------------------------------------------------------------+
//| Includes                                                         |
//+------------------------------------------------------------------+
#include<Trade/Trade.mqh>
//+------------------------------------------------------------------+
//| Varables                                                         |
//+------------------------------------------------------------------+
input int openHour, closeHour;
CTrade trade;

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {

   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {

   
  }
  
void OnTick()
  {
  //Show account info
   //These variables are defined here so that they get the account info after every tick.
   double myAccountBalance = AccountInfoDouble(ACCOUNT_BALANCE);
   double myAccountEquity = AccountInfoDouble(ACCOUNT_EQUITY);
   double myAccountProfit = AccountInfoDouble(ACCOUNT_PROFIT);

  Comment("Equity: ", myAccountEquity, "\n", "Balance: ", myAccountBalance, "\n", "profit: ", myAccountProfit);
  
   // Get current time
   MqlDateTime timeNow;
   TimeToStruct(TimeCurrent(), timeNow);
   
   //Check for an open trade
   if(openHour == timeNow.hour){
   
     //This line opens the position
     trade.PositionOpen(_Symbol, ORDER_TYPE_BUY, 1, SymbolInfoDouble(_Symbol,SYMBOL_ASK), 0, 0);
     }
  }
//+------------------------------------------------------------------+
