/**
 * @description       : Test class for RecordImageCarouselController
 * @author            : Stewart Anderson
 * @group             :
 * @last modified on  : 01-09-2025
 * @last modified by  : Stewart Anderson
**/
@isTest
public with sharing class RecordImageCarouselControllerTest {

    @TestSetup
    static void setupTestData() {
        // Create a test account
        Account testAccount = new Account(Name = 'Test Account');
        insert testAccount;

        // Create test content documents and versions
        ContentVersion cv1 = new ContentVersion(
            Title = 'Test Image 1',
            PathOnClient = 'test1.jpg',
            VersionData = Blob.valueOf('Test Image Content 1')
        );
        insert cv1;

        ContentVersion cv2 = new ContentVersion(
            Title = 'Test Image 2',
            PathOnClient = 'test2.png',
            VersionData = Blob.valueOf('Test Image Content 2')
        );
        insert cv2;

        ContentVersion cv3 = new ContentVersion(
            Title = 'Test Document',
            PathOnClient = 'test.pdf',
            VersionData = Blob.valueOf('Test PDF Content')
        );
        insert cv3;

        // Get ContentDocument Ids
        List<ContentVersion> insertedVersions = [
            SELECT ContentDocumentId
            FROM ContentVersion
            WHERE Id IN (:cv1.Id, :cv2.Id, :cv3.Id)
        ];

        // Create ContentDocumentLinks to associate files with the account
        List<ContentDocumentLink> linksToInsert = new List<ContentDocumentLink>();
        for (ContentVersion cv : insertedVersions) {
            ContentDocumentLink link = new ContentDocumentLink(
                ContentDocumentId = cv.ContentDocumentId,
                LinkedEntityId = testAccount.Id,
                ShareType = 'V'
            );
            linksToInsert.add(link);
        }
        insert linksToInsert;
    }

    @isTest
    static void testGetRelatedImages_WithImages() {
        // Get test account
        Account testAccount = [SELECT Id FROM Account WHERE Name = 'Test Account' LIMIT 1];

        Test.startTest();
        List<RecordImageCarouselController.ImageWrapper> result =
            RecordImageCarouselController.getRelatedImages(testAccount.Id);
        Test.stopTest();

        // Should return 2 images (jpg and png), but not the pdf
        System.assertEquals(2, result.size(), 'Should return 2 image files');

        // Verify image properties
        for (RecordImageCarouselController.ImageWrapper wrapper : result) {
            System.assertNotEquals(null, wrapper.contentVersionId, 'ContentVersionId should not be null');
            System.assertNotEquals(null, wrapper.title, 'Title should not be null');
            System.assertNotEquals(null, wrapper.downloadUrl, 'Download URL should not be null');
            System.assert(
                wrapper.fileExtension == 'jpg' || wrapper.fileExtension == 'png',
                'File extension should be jpg or png'
            );
        }
    }

    @isTest
    static void testGetRelatedImages_NoImages() {
        // Create account with no related files
        Account testAccount = new Account(Name = 'Empty Account');
        insert testAccount;

        Test.startTest();
        List<RecordImageCarouselController.ImageWrapper> result =
            RecordImageCarouselController.getRelatedImages(testAccount.Id);
        Test.stopTest();

        System.assertEquals(0, result.size(), 'Should return empty list when no images found');
    }

    @isTest
    static void testGetRelatedImages_InvalidRecordId() {
        // Test with a valid Id format but non-existent record
        Id fakeId = '001000000000000AAA';

        Test.startTest();
        List<RecordImageCarouselController.ImageWrapper> result =
            RecordImageCarouselController.getRelatedImages(fakeId);
        Test.stopTest();

        System.assertEquals(0, result.size(), 'Should return empty list for non-existent record');
    }

    @isTest
    static void testImageWrapper() {
        // Test the ImageWrapper class
        RecordImageCarouselController.ImageWrapper wrapper = new RecordImageCarouselController.ImageWrapper();
        wrapper.contentVersionId = 'test123';
        wrapper.title = 'Test Title';
        wrapper.fileExtension = 'jpg';
        wrapper.contentSize = 1024;
        wrapper.downloadUrl = '/test/url';

        System.assertEquals('test123', wrapper.contentVersionId);
        System.assertEquals('Test Title', wrapper.title);
        System.assertEquals('jpg', wrapper.fileExtension);
        System.assertEquals(1024, wrapper.contentSize);
        System.assertEquals('/test/url', wrapper.downloadUrl);
    }
}
