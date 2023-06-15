public class MyPDFController {
    
    public account myRecord { get; set; }
    	public static Integer total {get;set;}

     public string name { get; set; }
    
    public void MyPDFController() {
        String recordId = ApexPages.currentPage().getParameters().get('recordId');
        myRecord = [SELECT Name, Description FROM account WHERE Id = :recordId];
    }
    
    public PageReference generatePDF(Id recordId) {
        // create the PDF page
        PageReference pdf = new PageReference('/apex/MyPDFTemplate');
      //  PageReference pdfPage = Page.MyPDFTemplate;
        //pdf.getParameters().put('recordId', recordId);
        
        // set the record as a parameter on the PDF page
        pdf.getParameters().put('recordId', recordId);
        
        // generate the PDF blob
        Blob pdfBlob = pdf.getContentAsPDF();
        
        // create a new attachment for the PDF
        Attachment attachment = new Attachment();
        attachment.Body = pdfBlob;
        attachment.Name = 'MyPDF.pdf';
        attachment.ParentId = recordId;
        
        // insert the attachment
        insert attachment;
        
        // redirect to the record detail page
        return pdf;
      
    }
    
    @InvocableMethod(label='MakePdf')
    public static void invoke(list<id> recordIds){
        MyPDFController mypdf=new MyPDFController();
        mypdf.generatePDF(recordIds[0]);
    }
    
    public static Blob generatePdf2(Id recordId) {
    String pdfUrl = '/apex/MyPDFTemplate?id=' + recordId;
    HttpRequest request = new HttpRequest();
    request.setMethod('GET');
    request.setEndpoint(URL.getSalesforceBaseUrl().toExternalForm() + pdfUrl);
    request.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionId());
    Http http = new Http();
    HttpResponse response = http.send(request);
    return response.getBodyAsBlob();
}
    
    
}