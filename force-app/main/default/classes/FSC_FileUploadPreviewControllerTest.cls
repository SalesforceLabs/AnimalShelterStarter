@IsTest
    
public class FSC_FileUploadPreviewControllerTest {

    @TestSetup
    static void setupTestData(){

        Account acc = new Account(
            BillingStreet = '110 Bishopsgate',
            BillingCity = 'London',
            BillingCountry = 'UK',
            BillingPostalCode = 'EC2N 4AY',
            Name = 'ASS Test Account'
        );
        insert acc;

        ContentVersion cv = new ContentVersion(
            Title = 'ASS Test File',
            PathOnClient = 'ASSTest.jpg',
            VersionData = Blob.valueOf('Test Content'),
            IsMajorVersion = true
        );
        insert cv;

        ContentDocument cd = [SELECT Id, Title, LatestPublishedVersionId FROM ContentDocument LIMIT 1 ];

        // create ContentDocumentLink Record
        ContentDocumentLink cdl = new ContentDocumentLink(
            LinkedEntityId = acc.Id,
            ContentDocumentId = cd.Id,
            ShareType = 'V'
        );
        insert cdl;

    }

        @isTest static void testReadDocument(){
        
            List<Account> accList = [SELECT Id FROM Account WHERE Name = 'ASS Test Account' LIMIT 1];
            for(Account acc : accList){
                List<ContentDocument> tstGetFiles  = new List<ContentDocument>();
                tstGetFiles = FSC_FileUploadPreviewController.getFiles(String.valueOf(acc.Id));
                Assert.isNotNull(tstGetFiles,'Read Uploaded Files Failed');
            }           
        }
        
        @isTest static  void testDeleteDocument(){
            
            List<ContentDocument> cdList = [SELECT Id FROM ContentDocument WHERE Title = 'ASS Test File' LIMIT 1];
            for(ContentDocument cd : cdList){
                FSC_FileUploadPreviewController.deleteFile(String.valueOf(cd.Id));
            }
            List<ContentDocument> tstDelFile = [SELECT Id FROM ContentDocument WHERE Title = 'ASS Test File' LIMIT 1];
            Assert.isNotNull(tstDelFile, 'Delete Files Failed');
        
        }

}

