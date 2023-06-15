public with sharing class IQMS_MetadataController {

  @AuraEnabled
  public static void createRemote (String url) {
    IQMS_MetadataController.createRemoteSite('IQMS_EndPoint', 'IQMS_URL', url);
  }

  @future(callout=true)
  public static void createRemoteSite(String remoteName, String CSPName, String url) {
    //Metadata Service
    MetadataService.MetadataPort service = new MetadataService.MetadataPort();
    service.SessionHeader = new MetadataService.SessionHeader_element();
    service.SessionHeader.sessionId = UserInfo.getSessionId();
    
    //Metadata for remote site settings
    MetadataService.RemoteSiteSetting remoteSiteSettings = new MetadataService.RemoteSiteSetting();
      remoteSiteSettings.fullName = remoteName;
      remoteSiteSettings.url = url;
      remoteSiteSettings.description = 'Remote site settings created from apex';
      remoteSiteSettings.isActive = true;
      remoteSiteSettings.disableProtocolSecurity = false;
      
      
      MetadataService.CspTrustedSite CSPSite = new MetadataService.CspTrustedSite();
      CSPSite.fullName = CSPName;
      CSPSite.endpointUrl = url;
      CSPSite.description = 'Remote site settings created from apex';
      CSPSite.isActive = true;
      
      MetadataService.SaveResult[] results = service.updateMetadata(
        new List<MetadataService.Metadata>{ remoteSiteSettings, CSPSite }
        );
        
        for (MetadataService.SaveResult result : results) {
          if (result.success) {
            //Success
            System.debug(result);
          } else {
            //Failed
            System.debug(result.errors[0].message);
          }
          
        }
        
      

            
        //     Http http = new Http();
        //         HttpRequest req = new HttpRequest();
    //         req.setEndpoint(url+'/WebAPI//user/login');
    //         req.setMethod('GET');
    //         req.setHeader('Connection', 'keep-alive');
    //         req.setBody('{"ApplicationName" : "WebAPITester","Username" : "iqms","Password" : "iqms_irs"}');
    //         //req.setBody('{"name":"mighty moose"}');
    //         HttpResponse res = http.send(req);
    // System.debug(res.getBody());
    //         Map<String, String> bodyMap = (Map<String, String>)JSON.deserializeUntyped(res.getBody());
    //         System.debug(bodyMap);
    }
      public static String insertCustomSite(){
          MetadataService.MetadataPort service = new MetadataService.MetadataPort();
    service.SessionHeader = new MetadataService.SessionHeader_element();
    service.SessionHeader.sessionId = UserInfo.getSessionId();
          
          
   MetadataService.CustomSite customSite = new MetadataService.CustomSite();

customSite.active = true;
customSite.allowHomePage = false;
customSite.allowStandardAnswersPages = false;
customSite.allowStandardIdeasPages = false;
customSite.allowStandardLookups = false;
customSite.allowStandardSearch = false;
customSite.analyticsTrackingCode = 'FileNotFound';
customSite.browserXssProtection = false;
customSite.changePasswordPage = 'ChangePassword';
customSite.chatterAnswersForgotPasswordConfirmPage = 'ForgotPasswordConfirm';
customSite.chatterAnswersForgotPasswordPage = 'ForgotPassword';
customSite.chatterAnswersHelpPage = 'AnswersHome';
customSite.chatterAnswersLoginPage = 'FileNotFound';
customSite.contentSniffingProtection = false;
customSite.cspUpgradeInsecureRequests = false;
customSite.referrerPolicyOriginWhenCrossOrigin = false;
customSite.allowStandardPortalPages = false;
customSite.authorizationRequiredPage = 'Unauthorized';
customSite.bandwidthExceededPage = 'BandwidthExceeded';
customSite.clickjackProtectionLevel = 'SameOriginOnly';
customSite.fileNotFoundPage = 'FileNotFound';
customSite.genericErrorPage = 'Exception';
customSite.inMaintenancePage = 'InMaintenance';
customSite.inactiveIndexPage = 'InMaintenance';
customSite.indexPage = 'InMaintenance';
customSite.masterLabel = 'unique_site_name_xx';
customSite.requireHttps = false;
customSite.requireInsecurePortalAccess = false;
customSite.siteAdmin = 'puneetsharma072000@gmail.com';
customSite.siteTemplate = 'SiteTemplate';
customSite.siteType = 'Visualforce';
customSite.subdomain = 'cyntexa-48a-dev-ed.develop.my.salesforce-sites.com';



MetadataService.SaveResult[] results = service.createMetadata(new MetadataService.Metadata[] { customSite });
          
          for (MetadataService.SaveResult result : results) {
          if (result.success) {
            //Success
            System.debug(result);
          } else {
            //Failed
            System.debug(result.errors);
          }
          
        }

          return 'Success';
          


      
    }
}