public without sharing class slackVFController 
{
    public slackVFController()
    {
    	   
    }
    public static PageReference mymeth()
    {
        String currentUSerId = UserInfo.getUserId();
        String code = ApexPages.currentPage().getparameters().get('code');
        system.debug(code);
        Lead updateLeadOwner = [SELECT Id,Name, OwnerId From Lead Where Id =: code];
        User usr = [Select name From User where Id=:currentUSerId];
        String leadName = updateLeadOwner.Name;
        String userName = usr.Name;
        updateLeadOwner.OwnerId = currentUSerId;
        update updateLeadOwner;
        getcode(code, leadName ,currentUSerId, userName);
        PageReference pg = new PageReference('https://cyntexa-1e6-dev-ed.develop.lightning.force.com/'+code+'');
        pg.setRedirect(true);
        return pg; 
    }
    @future(callout=true)
    public static void getcode(String leadId, String leadName ,String UserId, String userName)
    {
        HTTP http = new HTTP();
        
        HttpRequest buttonRequest =  new HttpRequest();
        buttonRequest.setEndpoint('https://hooks.slack.com/services/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');
        buttonRequest.setHeader('Content-Type','application/json');
        buttonRequest.setHeader('Authorization', 'Bearer xoxp-5035198010231-5046780714901-5052345918228-1c576ea44c7929bf21764ec5dc8654a1');
        buttonRequest.setMethod('POST');
        buttonRequest.setBody('{"attachments":[{"blocks":[{"type":"section","text":{"type":"plain_text","text":"Lead '+leadId+' ('+leadName+') has been assigned to '+UserId+' ('+userName+')","emoji":true}}]}]}');
            
        HttpResponse buttonresponse = http.send(buttonRequest);
        System.debug('done1');
            
       	System.debug('chatRes '+buttonresponse.getBody());
    }
}