@isTest
public class ProfilePictureControllerTest {
    static testMethod void testMethod1 () {
        %%%NAMESPACED_ORG%%%Animal__c TestAnimal = new %%%NAMESPACED_ORG%%%Animal__c (%%%NAMESPACED_ORG%%%Animal_Name__c='rex', %%%NAMESPACED_ORG%%%Date_of_Arrival__c = date.today(), %%%NAMESPACED_ORG%%%Type__c = 'Dog');
        insert TestAnimal;

        ProfilePictureController.saveAttachment(TestAnimal.id, 'Test File', '', 'image/jpeg');

        ProfilePictureController.getProfilePicture(TestAnimal.id);
    }
}
