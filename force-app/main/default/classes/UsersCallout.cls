public with sharing class UsersCallout {
    //We don't need to use @RestResource because it is used exposing the endpoit for third party. It's for inbound integration.
    //Mostly we will use outbound integration, so to learn this subject is extremly important.

    public  static void fetchAllUsers() {

        //We are going to send a request(HttpRequest) through http protocol (Http) to get a response (HttpResponse). This is the definition of the outbound call.

        //Request instance
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://gorest.co.in/public/v2/users');
        request.setMethod('GET');

        //Http protocol
        Http httpInstance = new Http();

        //Response
        HttpResponse response = httpInstance.send(request);
        //Response will be received to the response instance
        System.debug('Status : ' + response.getStatus());//OK
        System.debug('Status Code : ' + response.getStatusCode());//200

        //Next step is to go our org, setup > Remote site setting > put url there. Whenever we are making callout, we need to give authorization via Remote site setting. Means "this integration is under control, as the developer I'm aware of the transaction."

        //To invoke this code we can use anonymous developer console
    }
    
}
