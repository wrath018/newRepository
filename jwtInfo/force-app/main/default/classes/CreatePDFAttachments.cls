global class CreatePDFAttachments implements Database.Batchable<sObject> , Database.AllowsCallouts {
    global List<Id> recordIds {get;set;}
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator([SELECT Id FROM Account WHERE Id IN :recordIds]);
    }

    global void execute(Database.BatchableContext bc, List<sObject> scope) {
        List<Attachment> attachments = new List<Attachment>();
        for (sObject s : scope) {
            Account acc = (Account)s;

             Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://app.useanvil.com/api/v1/fill/n4Y7oiOi15vjUa0DCe9D.pdf');
        request.setMethod('POST'); 
            request.setHeader('Authorization','Basic BofKFT6b06ZSNX6usisfGy0AgdX6e946');
            request.setHeader('Content-Type','application/json');
        
String body = '{ "title": "Sample Template", "fontSize": 10, "textColor": "#333333", "data": { "shortText": "Short Text", "date": "2023-03-30", "name": { "firstName": "Robin", "mi": "W", "lastName": "Smith" }, "email": "testy@example.com", "phone": { "num": "5554443333", "region": "US", "baseRegion": "US" }, "usAddress": { "street1": "123 Main St #234", "city": "San Francisco", "state": "CA", "zip": "94106", "country": "US" }, "ssn": "456454567", "ein": "897654321", "checkbox": true, "radioGroup": "cast68d7e540afba11ecaf289fa5a354293a", "decimalNumber": 12345.67, "dollar": 12345.67, "integer": 12345, "percent": 50.3, "longText": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.", "textPerLine": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.", "textPerLetter": "4wfTQbbStOh4rFTfzqw", "image": "https://placekitten.com/800/495" } }';
request.setBody(body);


        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
   //   system.debug(response.getBody());
          Blob pdfContent = response.getBodyAsBlob();

    // Create an attachment record in Salesforce
    Attachment attachment = new Attachment();
    attachment.Name = 'My PDF Attachment';
    attachment.ParentId = acc.Id; // replace with the ID of the record you want to attach the PDF to
    attachment.Body = pdfContent;
    attachment.ContentType = 'application/pdf';
      //  insert  attachment;

            // Check if the request was successful
           

                attachments.add(attachment);
            
        }

        insert attachments;
        system.debug(attachments);
    }

    global void finish(Database.BatchableContext bc) {
        // Send a notification or perform any necessary cleanup here
    }
}