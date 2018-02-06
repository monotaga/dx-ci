public with sharing class MarvelAPI {
    public MarvelAPI() {

    }

    @TestVisible
    private static HttpResponse execute( String path, String body) {
        Marvel_Settings__c marvelSettings = Marvel_Settings__c.getInstance(UserInfo.getOrganizationId());
        String endpoint = marvelSettings.Endpoint__c + path;
        
        HttpRequest httpRequest = new HttpRequest();
		httpRequest.setTimeout(120 * 1000);
		httpRequest.setMethod('GET');
		httpRequest.setEndpoint(endpoint);
		httpRequest.setHeader('Content-Type', 'application/json');
        // Use temporarily for debugging. 
        //httpRequest.setHeader('X-TV-Meta', 'true'); 

        if (String.isNotBlank(body)) {
            httpRequest.setBody(body);
        }
        
        HttpResponse httpResponse = (new Http()).send(httpRequest);
        
        String response = httpResponse.getBody();

        System.debug('##### RESPONSE=' + response);

        if (httpResponse.getStatusCode() == 200 || httpResponse.getStatusCode() == 201) {
            return httpResponse;
        } else if (httpResponse.getStatusCode() == 400 || httpResponse.getStatusCode() == 422) {
            Map<String, Object> responseData = (Map<String, Object>) JSON.deserializeUntyped(response);
            Map<String, Object> error = (Map<String, Object>) responseData.get('error');
            
            String errorType = (String) error.get('type');
            String errorMessage = (String) error.get('message');

            throw new APIException('Error: ' + errorType + ' - ' + errorMessage);
		} else if (httpResponse.getStatusCode() == 401) {
			throw new AuthorizationException();
		} else if (httpResponse.getStatusCode() == 404) {
			throw new NotFoundException();
        } else {
            throw new APIException('Server returned status: ' + httpResponse.getStatusCode() + ' - ' + httpResponse.getStatus());
        }

    }

    public class APIException extends Exception {}
    public class AuthorizationException extends Exception {}
    public class NotFoundException extends Exception {}
}
