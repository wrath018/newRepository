public without sharing class getKnowledgeArticles {
    @AuraEnabled
    public static list<Knowledge__kav> main(){
        list<Knowledge__kav> kv=[SELECT Id, Title,ArticleTotalViewCount, UrlName, PublishStatus,Viewcount__c FROM Knowledge__kav where PublishStatus='Online' ];
        // list<KnowledgeArticleViewStat> kvs=[SELECT Id, ViewCount FROM KnowledgeArticleViewStat where channel ='Pkb'];
        return kv;
    }

    @AuraEnabled
    public static void updateViewCount(string recordid){
      Knowledge__kav kv=[SELECT Id, Title, UrlName, PublishStatus,Viewcount__c FROM Knowledge__kav where id=:recordid UPDATE VIEWSTAT ];
    //   Integer viewcount=Integer.valueOf(kv.Viewcount__c);
    //   viewcount=viewcount+1;
    //   kv.Viewcount__c=string.valueof(viewcount);
    //   update kv;

    }

}