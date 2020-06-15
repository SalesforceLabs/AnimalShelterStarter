@isTest
public class ProfilePictureControllerTest {
    static testMethod void testMethod1 () {
        animalshelter__Animal__c TestAnimal = new animalshelter__Animal__c (animalshelter__Animal_Name__c='rex', animalshelter__Date_of_Arrival__c = date.today(), animalshelter__Type__c = 'Dog');
        insert TestAnimal;

        //Attachment TempAttachement = new Attachment();
        //TempAttachement = [SELECT Id, Name, LastModifiedDate, ContentType FROM Attachment WHERE parentid='a003z00000rlhSbAAI' AND ContentType IN ('image/png', 'image/jpeg', 'image/gif') ORDER BY LastModifiedDate DESC LIMIT 1];


        ProfilePictureController.saveAttachment(TestAnimal.id, 'Test File', '', 'image/jpeg');

        ProfilePictureController.getProfilePicture(TestAnimal.id);
    }
}