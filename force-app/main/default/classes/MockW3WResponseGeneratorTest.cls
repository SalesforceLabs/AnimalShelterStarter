@isTest
private class MockW3WResponseGeneratorTest {

    @isTest
    static void testRespond() {
        // Create a mock request
        HttpRequest req = new HttpRequest();
        req.setEndpoint('http://www.example.com');
        req.setMethod('GET');

        // Call the mock response generator
        MockW3WResponseGenerator generator = new MockW3WResponseGenerator();
        HttpResponse res = generator.respond(req);

        // Verify the response
        System.assertEquals(200, res.getStatusCode());
        System.assertEquals('application/json', res.getHeader('Content-Type'));
        String expectedBody = '{ "country": "GB", "square": { "southwest": { "lng": -0.403987, "lat": 50.826272 }, "northeast": { "lng": -0.403945, "lat": 50.826299 } }, "nearestPlace": "Goring-by-Sea, West Sussex", "coordinates": { "lng": -0.403966, "lat": 50.826286 }, "words": "whips.vanish.store", "language": "en", "map": "https://w3w.co/whips.vanish.store" }';
        System.assertEquals(expectedBody, res.getBody());
    }
}
