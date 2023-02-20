@IsTest
public class W3WInvocableCalloutTest {
    
    @testSetup
    static void setupTestData(){
        test.startTest();
        Animal__c animal = new Animal__c(Date_of_Arrival__c = Date.Today(), what3words__c = 'whips.vanish.store');
        Insert animal;
        test.stopTest();
    }
    
    public class HttpMock implements HttpCalloutMock {

    protected Integer code;
    protected String status;
    protected String body;
    protected Map<String, String> responseHeaders;

    public HttpMock(Integer code, String status, String body, Map<String, String> responseHeaders) {
        this.code = code;
        this.status = status;
        this.body = body;
        this.responseHeaders = responseHeaders;
    }

    public HTTPResponse respond(HTTPRequest req) {

        HttpResponse res = new HttpResponse();
        for (String key : this.responseHeaders.keySet()) {
            res.setHeader(key, this.responseHeaders.get(key));
        }
        res.setBody(this.body);
        res.setStatusCode(this.code);
        res.setStatus(this.status);
        return res;
    }

}
    
    @isTest static void testCallout(){
        
        List<Animal__c> animal = [SELECT Id, what3words__c FROM Animal__c]; 
        String jsonString = '';
        HttpMock mock = new HttpMock(200,'SUCCESS',jsonString, new Map<String,String>());
        Test.setMock(HttpCalloutMock.class,mock);
        Test.startTest();
        W3WInvocableCallout.getW3WCoordinates(animal);
        Test.stopTest();
        
    }
}