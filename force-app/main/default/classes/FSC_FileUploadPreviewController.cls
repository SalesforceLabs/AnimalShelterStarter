/**
 * @File Name          : FSC_FileUploadPreviewController.apxc
 * @Description        : 
 * @Author             : Chris Rolfe (Salesforce)
 * @Group              : 
 * @Last Modified By   : Chris Rolfe (Salesforce)
 * @Last Modified On   : 25/01/2023, 10:00:00 AM
 * @Modification Log   : 
 * Ver       Date            Author              Modification
 * 1.0    25/01/2023   Chris Rolfe (Salesforce)     Initial Version
**/

public class FSC_FileUploadPreviewController {

    @AuraEnabled
    public static List<ContentDocument> getFiles(String recordId){
        Set<Id> recordIds = new Set<Id>{recordId};
        List<ContentDocumentLink> cdlList = [SELECT Id, LinkedEntityId, ContentDocumentId FROM
                                             ContentDocumentLink WHERE LinkedEntityId IN :recordIds
                                            ];                         
        Set<Id> documentIds = new Set<Id>();
        for(ContentDocumentLink cdl:cdlList){
            documentIds.add(cdl.ContentDocumentId);
        }    
        return [SELECT Id, Title, FileType FROM ContentDocument WHERE Id IN :documentIds];   
    }
    
    @AuraEnabled
    public static void deleteFile(String contentDocumentId){
        delete [SELECT Id from ContentDocument WHERE Id = :contentDocumentId]; 
    }
}
