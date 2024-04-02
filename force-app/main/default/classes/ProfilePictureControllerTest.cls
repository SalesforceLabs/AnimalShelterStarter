@IsTest
public class ProfilePictureControllerTest {
    @IsTest
    static void testMethod1 () {
        animalshelters__Animal__c TestAnimal = new animalshelters__Animal__c (animalshelters__Animal_Name__c='rex', animalshelters__Date_of_Arrival__c = Date.today(), animalshelters__Type__c = 'Dog');
        insert TestAnimal;

        ProfilePictureController.saveAttachment(TestAnimal.Id, 'Test File', '', 'image/jpeg');

        ProfilePictureController.getProfilePicture(TestAnimal.Id);
    }
}