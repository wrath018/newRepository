public class apexclassToinvoke {
      @InvocableMethod(label='notMakePdf')
    public static void invoke(list<id> recordIds){
        
         CreatePDFAttachments batchJob = new CreatePDFAttachments();
        batchJob.recordIds = new List<Id>();
        for (id acc :recordIds ) {
            batchJob.recordIds.add(acc);
        }
        Database.executeBatch(batchJob);
        
    }

}