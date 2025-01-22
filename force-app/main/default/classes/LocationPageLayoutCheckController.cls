public with sharing class LocationPageLayoutCheckController {
    @AuraEnabled(cacheable=true)
    public static String checkPageLayouts() {
        // Expected Page Layouts
        Map<String, String> expectedLayouts = new Map<String, String>{
            'Site' => 'Location Site Layout',
            'Block' => 'Location Block Layout',
            'SubBlock' => 'Location Block Layout',
            'Unit' => 'Location Unit Layout',
            'Organisation' => 'Location Organisation Layout',
            'Foster' => 'Location Foster Layout'
        };

        try {
            // Tooling API Query
            String query = 'SELECT ProfileId, Profile.Name, RecordTypeId, RecordType.Name, RecordType.SobjectType, LayoutId, Layout.Name ' +
                           'FROM ProfileLayout WHERE Profile.Name = \'System Administrator\'';
            List<Map<String, Object>> results = executeToolingQuery(query);

            // Process the results
            Map<String, String> actualLayouts = new Map<String, String>();
            for (Map<String, Object> record : results) {
                if (record.get('RecordType.SobjectType') == 'Locations__c') {
                    actualLayouts.put((String)record.get('RecordType.Name'), (String)record.get('Layout.Name'));
                }
            }

            // Compare actual vs. expected layouts
            for (String recordTypeName : expectedLayouts.keySet()) {
                if (!actualLayouts.containsKey(recordTypeName) || 
                    actualLayouts.get(recordTypeName) != expectedLayouts.get(recordTypeName)) {
                    return 'FAIL: Check Location Page Layouts';
                }
            }
            return 'PASS';
        } catch (Exception e) {
            // Handle any errors gracefully
            System.debug('Error querying Tooling API: ' + e.getMessage());
            return 'Error: Unable to check Page Layouts';
        }
    }

    // Helper method to execute a Tooling API query
    private static List<Map<String, Object>> executeToolingQuery(String query) {
        // Construct the endpoint
        String toolingApiEndpoint = URL.getSalesforceBaseUrl().toExternalForm() + '/services/data/v57.0/tooling/query/?q=' + EncodingUtil.urlEncode(query, 'UTF-8');
        
        // Create HTTP request
        HttpRequest req = new HttpRequest();
        req.setEndpoint(toolingApiEndpoint);
        req.setMethod('GET');
        req.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionId());
        req.setHeader('Content-Type', 'application/json');

        // Send HTTP request
        Http http = new Http();
        HttpResponse res = http.send(req);

        // Parse the response
        if (res.getStatusCode() == 200) {
            Map<String, Object> responseBody = (Map<String, Object>)JSON.deserializeUntyped(res.getBody());
            if (responseBody.containsKey('records')) {
                return (List<Map<String, Object>>)responseBody.get('records');
            }
        }
        
        // If response is invalid, throw an exception
        throw new CalloutException('Failed to query Tooling API. Status: ' + res.getStatusCode() + ', Response: ' + res.getBody());
    }
}
