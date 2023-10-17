global class MockW3WResponseGenerator implements HttpCalloutMock {

    global HTTPResponse respond(HTTPRequest req) {
        // Create a fake response
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        string result = '{ "country": "GB", "square": { "southwest": { "lng": -0.403987, "lat": 50.826272 }, "northeast": { "lng": -0.403945, "lat": 50.826299 } }, "nearestPlace": "Goring-by-Sea, West Sussex", "coordinates": { "lng": -0.403966, "lat": 50.826286 }, "words": "whips.vanish.store", "language": "en", "map": "https://w3w.co/whips.vanish.store" }';
        res.setBody(result);
        res.setStatusCode(200);
        return res;
    }
}
