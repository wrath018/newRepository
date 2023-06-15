@RestResource(urlMapping='/addPDFtoRecord/*')
global without sharing class AddPDFtoRecordREST{
  @HttpPost
    global static void doPost(list<String> accountIdList) {
       // return;
       list<attachment> insertAttachment = new list<attachment>();
        for(String accId: accountIdList){
            //create a pageReference instance of the VF page.
        PageReference pdf = new PageReference('/apex/MyPDFTemplate');
            //pass the Account Id parameter to the class.
            pdf.getParameters().put('recordId',accId);
           // Attachment attach = new Attachment();
            Blob pdfBlob = pdf.getContent();
        
        // create a new attachment for the PDF
     /*   Attachment attach = new Attachment();
        attach.Body = pdfBlob;
        attach.Name = 'MyPDF.pdf';
        attach.ParentId = accId;
            insertAttachment.add(attach);
        
        // insert the attachment
       // insert attachment;
         
         //insert the list
         insert insertAttachment;*/
        }
    }
    
    
    
}