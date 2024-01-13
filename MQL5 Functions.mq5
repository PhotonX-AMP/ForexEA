#include <Trade\Trade.mqh>

//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---
   Comment("This is the fuction tutorial");
  double myAccountBalance = AccountInfoDouble(ACCOUNT_BALANCE);
  double myAccountProfit = AccountInfoDouble(ACCOUNT_PROFIT);
  double myAccountEquity = AccountInfoDouble(ACCOUNT_EQUITY);
  
  Comment("Account balance: ", myAccountBalance,"\n","Equity: ",myAccountEquity, "\n", "Profit: ", myAccountProfit);
   MqlTradeRequest myrequest;
   MqlTradeResult myresult;
   ZeroMemory(myrequest);
   myrequest.action = TRADE_ACTION_DEAL;
   myrequest.type = ORDER_TYPE_BUY;
   myrequest.symbol = _Symbol;
   myrequest.volume = 0.01;
   myrequest.type_filling = ORDER_FILLING_FOK;
   myrequest.price = SymbolInfoDouble(_Symbol, SYMBOL_ASK);
   myrequest.deviation = 50;
   
   if(!PositionSelect(_Symbol)) //if open position does not exist
      {
         OrderSend(myrequest,myresult);
      } 
   
   if((myAccountEquity-myAccountBalance)>2)
      {
         CloseAllOrders();
      }
    }
    
 void CloseAllOrders(){
   CTrade Trade;
   int i = PositionsTotal()-1;
   while(i>=0){
      if(Trade.PositionClose(PositionGetSymbol(i))) i--;
   }
 }
//+------------------------------------------------------------------+
