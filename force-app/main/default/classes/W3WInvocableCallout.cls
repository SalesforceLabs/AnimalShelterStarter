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
    @InvocableMethod(Label='Get W3W Coordinates' Description='Returns the Latitude and Longitude of the W3W provided' Category='Animal')
    
    public static List<String> getW3WCoordinates(List<animalshelters__Animal__c> animals) {
      for (animalshelters__Animal__c theAnimal : animals) {
        updateAnimal(JSON.serialize(theAnimal));
      }
      return null;
    }

    @Future(Callout=true)
    public static void updateAnimal(String theAnimalStr ) {
        animalshelters__Animal__c theAnimal = (animalshelters__Animal__c)JSON.deserialize(theAnimalStr, animalshelters__Animal__c.class);


        //Add key as a Custom setting
        animalshelters__Animal_Shelter_Settings__c apikey = animalshelters__Animal_Shelter_Settings__c.getOrgDefaults();
        String w3wkey = apikey.animalshelters__What3Words_API_Key__c;

        Http http = new Http();
        HttpRequest request = new HttpRequest();
        
        //String theURL = URL + What3words String + API Key
        String theURL = 'https://api.what3words.com/v3/convert-to-coordinates?words='+theAnimal.animalshelters__what3words__c+'&key='+w3wkey;
        request.setEndpoint(theURL);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200 && Schema.SObjectType.animalshelters__Animal__c.isAccessible() && Schema.SObjectType.animalshelters__Animal__c.fields.animalshelters__Geolocation__c.isAccessible()){
            // Deserialize the JSON string into collections of primitive data types.
            What3Words theResult = What3Words.parse(response.getBody());
            theAnimal.animalshelters__Geolocation__Latitude__s = theResult.coordinates.lat;
            theAnimal.animalshelters__Geolocation__Longitude__s = theResult.coordinates.lng;
            update theAnimal;
        }
    }
}