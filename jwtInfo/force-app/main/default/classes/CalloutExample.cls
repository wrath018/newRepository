public class CalloutExample {
    public static void makeCallout() {
        // Define the HTTP request
        HttpRequest httpRequest = new HttpRequest();
        httpRequest.setEndpoint('https://3f51-202-131-122-186.ngrok-free.app');
        httpRequest.setMethod('POST');
        httpRequest.setHeader('Content-Type', 'application/json');
        
        // Set the request body
     //   String requestBody = '{"name": "John Doe", "email": "johndoe@example.com"}';
        //httpRequest.setBody(requestBody);
        
        // Create a new HTTP object to send the request
        Http http = new Http();
        
        try {
            // Send the HTTP request and get the response
            HttpResponse httpResponse = http.send(httpRequest);
            
            // Process the response
            if (httpResponse.getStatusCode() == 200) {
                // Callout was successful, handle the response
                String response = httpResponse.getBody();
                System.debug('Response: ' + response);
            } else {
                // Callout failed, handle the error
                System.debug('Error: ' + httpResponse.getStatusCode() + ' - ' + httpResponse.getStatus());
            }
        } catch (Exception ex) {
            // Exception occurred during the callout
            System.debug('Exception: ' + ex.getMessage());
        }
    }
}