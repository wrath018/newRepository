global class AccountTriggerController{
 
    @Future(callout=true)
    public static void addPDFAttach( list<id> accountIdList){
       HttpRequest req = new HttpRequest(); 
       req.setEndpoint('https://cyntexa-48a-dev-ed.develop.my.salesforce-sites.com/services/apexrest/addPDFtoRecord/');
       req.setMethod('POST');
    List<String> accountsids=new List<String>();
        for(integer i=0;accountIdList.size() > i;i++){
            accountsids.add( '"'+ accountIdList[i]+'"');
            
        }
        String accidstr = '[';
        accidstr += string.join(accountsids,',');
        accidstr += ']';
        system.debug('accidstr'+accidstr);
       req.setBody('{"accountIdList":["123"]}');
        system.debug(req);
    //   req.setHeader('Authorization', 'Bearer '+ sessionId);
     req.setHeader('Content-Type', 'application/json');
       Http http = new Http();
       if(!test.isRunningTest()){
           HTTPResponse res = http.send(req);
       }
    }
}