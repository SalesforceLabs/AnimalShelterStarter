@isTest
private class What3WordsTest {

    @isTest
    static void testParse_ValidJson() {
        String json = '{"country":"United States","square":{"southwest":{"lng":-77.036604,"lat":38.897626},"northeast":{"lng":-77.036505,"lat":38.897725}},"nearestPlace":"White House, Washington D.C.","coordinates":{"lng":-77.036572,"lat":38.897675},"words":"filled.count.soap","language":"en","map":"https://w3w.co/filled.count.soap"}';
        
        What3Words w3w = What3Words.parse(json);
        
        System.assertEquals('United States', w3w.country);
        System.assertEquals('filled.count.soap', w3w.words);
        System.assertEquals('en', w3w.language);
        System.assertEquals('https://w3w.co/filled.count.soap', w3w.mapUrl);
        
        What3Words.Square square = w3w.square;
        System.assertEquals(-77.036604, square.southwest.lng);
        System.assertEquals(38.897626, square.southwest.lat);
        System.assertEquals(-77.036505, square.northeast.lng);
        System.assertEquals(38.897725, square.northeast.lat);
        
        What3Words.Southwest coordinates = w3w.coordinates;
        System.assertEquals(-77.036572, coordinates.lng);
        System.assertEquals(38.897675, coordinates.lat);
    }
    
    @isTest
    static void testParse_NullValues() {
        String json = '{"country":null,"square":null,"nearestPlace":null,"coordinates":null,"words":null,"language":null,"map":null}';
        
        What3Words w3w = What3Words.parse(json);
        
        System.assertEquals(null, w3w.country);
        System.assertEquals(null, w3w.words);
        System.assertEquals(null, w3w.language);
        System.assertEquals(null, w3w.mapUrl);
        System.assertEquals(null, w3w.square);
        System.assertEquals(null, w3w.nearestPlace);
        System.assertEquals(null, w3w.coordinates);
    }

    @isTest
    static void testConsumeObject_StartObject() {
        String json = '{ "obj": { "prop": "value" } }';
        
        System.JSONParser parser = System.JSON.createParser(json);
        parser.nextToken();
        parser.nextToken();
        parser.nextToken();
        
        What3Words.consumeObject(parser);
        
        System.assertEquals(System.JSONToken.END_OBJECT, parser.getCurrentToken());
    }
    
    @isTest
    static void testConsumeObject_StartArray() {
        String json = '{ "arr": [ "value" ] }';
        
        System.JSONParser parser = System.JSON.createParser(json);
        parser.nextToken();
        parser.nextToken();
        parser.nextToken();
        
        What3Words.consumeObject(parser);
        
        System.assertEquals(System.JSONToken.END_ARRAY, parser.getCurrentToken());
    }
    
    @isTest
    static void testConsumeObject_MultipleObjects() {
        String json = '{ "obj1": { "prop1": "value1" }, "obj2": { "prop2": "value2" } }';
        
        System.JSONParser parser = System.JSON.createParser(json);
        parser.nextToken();
        parser.nextToken();
        parser.nextToken();
        parser.nextToken();
        parser.nextToken();
        parser.nextToken();
        
        What3Words.consumeObject(parser);
        
        System.assertEquals(System.JSONToken.END_OBJECT, parser.getCurrentToken());
    }
    
    @isTest
    static void testSquare_ValidJson() {
        String json = '{ "southwest": { "lng": -77.036604, "lat": 38.897626 }, "northeast": { "lng": -77.036505, "lat": 38.897725 } }';
        
        What3Words.Square square = new What3Words.Square(System.JSON.createParser(json));
        
        System.assertEquals(-77.036604, square.southwest.lng);
        System.assertEquals(38.897626, square.southwest.lat);
        System.assertEquals(-77.036505, square.northeast.lng);
        System.assertEquals(38.897725, square.northeast.lat);
    }
    
    @isTest
    static void testSouthwest_ValidJson() {
        String json = '{ "lng": -77.036572, "lat": 38.897675 }';
        
        What3Words.Southwest southwest = new What3Words.Southwest(System.JSON.createParser(json));
        
        System.assertEquals(-77.036572, southwest.lng);
        System.assertEquals(38.897675, southwest.lat);
    }
        

}