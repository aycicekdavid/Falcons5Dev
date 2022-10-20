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

        //To invoke this code we can use anonymous developer console or from anonymous apex file. >> UsersCallout.fetchAllUsers();

        System.debug('Response: ' + response.getBody());

        String jsonString = response.getBody();

        if(response.getStatusCode() == 200){
            //Converting JSON response to the UsersWrapper.
            List<UsersWrapper> userList = (List<UsersWrapper>) (JSON.deserialize(jsonString, List<UsersWrapper>.class));
            System.debug('userList Response : ' + userList);
        }else{
            System.debug('Error occured: ' + response.getStatus());
        }     
    }  

    //TASK: Get call steps ==============================
    //Validate if user exist in the FedEx ERP, if yes bring the user/contact and create a record in salesforce, if not exist UI to create new contact.
    //SOLUTION 
    //implement a method with email,status, gender as a parameters
    //do a callout based on email,status, gender
    //if contact found, create contact into the salesforce based on response

    public static void checkContactAndCreate(String contactEmail, String status, String gender) {

        HttpRequest request = new HttpRequest();//Request instance
        request.setEndpoint('https://gorest.co.in/public/v2/users?email='+contactEmail + '&status='+ status + '&gender=' + gender);
        request.setMethod('GET');

        Http httpInstance = new Http();//Http protocol

        HttpResponse response = httpInstance.send(request);//Response


        //Check if the request if success or not
       
        List<Contact> contactToUpdate = new List<Contact>();

        if(response.getStatusCode() == 200){
            System.debug('Success Response : ' + response.getBody());

            //Converting/Deserializing JSON response (response body) to the UsersWrapper (sObject).
            List<UsersWrapper> userList = (List<UsersWrapper>) (JSON.deserialize(response.getBody(), List<UsersWrapper>.class));

            //Iterating through of users wrapper to prepare a contact instance
            for(UsersWrapper wrapperInstance : userList){

                //Constructing Contact instance with wrapper instance
                Contact contactInstance = new Contact(
                    LastName = wrapperInstance.name,
                    Email = wrapperInstance.email
                );

                //Adding Contact instance to the list to insert
                contactToUpdate.add(contactInstance);
            }  
            insert contactToUpdate;

        }else{
            System.debug('Error response: ' + response.getStatus());
        }     
    }


    /*
    TASK: Post call steps ==============================
    Validate if user exist in the FedEx ERP, if no, bring the user/contact from Salesforce org and create a record in FedEx ERP, if yes do nothing.

    SOLUTION 
    - implement a method with email,status, gender as a parameters, do a callout to create records into the ERP system.
    - Print the record in the debug.

    1- EndPoint URL = https://gorest.co.in/public/v2/users
    2- Method = POST
    3- Parameter =
    4- Headers : Content-Type:application/json
                 Authorization : Bearer {{Access_Token}} //Provided by https://gorest.co.in/
    5- Body : {
        "name":"Tenali Ramakrishna", 
        "gender":"male", 
        "email":"tenali.ramakrishna@15ce.com", 
        "status":"active"
    }
    */

    /*
    TYPES WHERE WE CAN STORE SECRET INFO LIKE ACCESS TOKEN, CLIENT ID, CLIENT SECRET
    1- Protected Custom Settings
    2- Named Credentials
    3- Protected Custom Meta Data

    NOTE: Never use public custom settings, never store the info above in anywhere in Apex.
    Check Trailhead for above subjects.
    */

    public static void createUserInGoREST(String name, String contactEmail, String status, String gender) {

        HttpRequest request = new HttpRequest();//Request instance
        request.setEndpoint('https://gorest.co.in/public/v2/users');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json');
        request.setHeader('Authorization', 'Bearer 87f419ccf62d4cba8347c8a546572799c42eefc06bd878e6e08edae4e853491f');
        
        UsersWrapper wrapperInstance = new UsersWrapper();
        wrapperInstance.name = name;
        wrapperInstance.email = contactEmail;
        wrapperInstance.gender = gender;
        wrapperInstance.status = status;

        String jsonString = JSON.serialize(wrapperInstance);//To send, we should convert to JSON.

        request.setBody(jsonString);

        Http httpInstance = new Http();//Http protocol

        HttpResponse response = httpInstance.send(request);//Response
        System.debug('Status code: ' + response.getStatusCode());

        if(response.getStatusCode() == 201){
            UsersWrapper responseWrapper = (UsersWrapper) (JSON.deserialize(response.getBody(), UsersWrapper.class));//To see the response we need to deserialize the response.
            System.debug('responseWrapper : ' + responseWrapper);

        }
        
    }

    //Wrapper class to hold the users from the response.
    private class UsersWrapper {
        private Integer id;
        private String name;
        private String email;
        private String gender;
        private String status;
    }
}
