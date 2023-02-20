/**
 * @File Name          : W3WInvocableCallout.apxc
 * @Description        : What3words Invocable Flow Action. Taken from what3words help docs
 * @Author             : Chris Rolfe
 * @Group              : 
 * @Last Modified By   : Chris Rolfe
 * @Last Modified On   : 20/02/2023
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    20/02/2023  Chris Rolfe                     Initial Version
**/

public with sharing class W3WInvocableCallout {
    @InvocableMethod(label='Get W3W Coordinates' description='Returns the Latitude and Longitude of the W3W provided' category='Animal')
    public static List<String> getW3WCoordinates(List<Animal__c> animals) {
      for (Animal__c theAnimal : animals) {
        updateAnimal(JSON.serialize(theAnimal));
      }
      return null;
    }

    @future(callout=true)
    public static void updateAnimal(String theAnimalStr ) {
      Animal__c theAnimal = (Animal__c)JSON.deserialize(theAnimalStr, Animal__c.class);
        
        
        //Add key as a Custom setting
        Animal_Shelter_Settings__c apikey = Animal_Shelter_Settings__c.getOrgDefaults();
        string w3wkey = apikey.What3Words_API_Key__c;
            
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        //String theURL = 'https://api.what3words.com/v3/autosuggest?input='+theAnimal.what3words__c+'&key=APIKEY';
        String theURL = 'https://api.what3words.com/v3/convert-to-coordinates?words='+theAnimal.what3words__c+'&key='+w3wkey;
        request.setEndpoint(theURL);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            // Deserialize the JSON string into collections of primitive data types.
            What3Words theResult = What3Words.parse(response.getBody());
            theAnimal.Geolocation__latitude__s = theResult.coordinates.lat;
            theAnimal.Geolocation__longitude__s = theResult.coordinates.lng;
            update theAnimal;            
        }       
    }
}