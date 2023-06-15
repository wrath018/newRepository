public class OpprtunityHandler {
    
    public static  list<Opportunity> getOpportunitiesWithAmountinThisMonth(){
      list<Opportunity> opps=[Select id, amount from Opportunity ORDER BY  amount DESC ];
        return opps;
         
    }
}