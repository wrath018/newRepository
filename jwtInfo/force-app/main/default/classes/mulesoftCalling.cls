public class mulesoftCalling {
    @future(callout=true)
    public static void main(id i){
        
        contact c=[Select name,email from contact where id=:i];
        Http http = new Http();
HttpRequest request = new HttpRequest();
request.setEndpoint('https://a2d0-202-131-122-186.ngrok-free.app/stripeCall');
request.setMethod('POST');
request.setHeader('Content-Type', 'application/json');
// Set the body as a JSON object
request.setBody('{"name":"'+c.name+'","email":"'+c.email+'"}');
        system.debug(request.getBody());
HttpResponse response = http.send(request);
// Parse the JSON response
if (response.getStatusCode() != 201) {
    System.debug('The status code returned was not expected: ' +
    response.getStatusCode() + ' ' + response.getStatus());
} else {
    System.debug(response.getBody());
}
    }

}