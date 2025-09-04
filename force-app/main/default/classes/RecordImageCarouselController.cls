/**
 * @description       : Apex controller for Record Image Gallery LWC component
 * @author            : Stewart Anderson
 * @group             :
 * @last modified on  : 01-09-2025
 * @last modified by  : Stewart Anderson
**/
public with sharing class RecordImageCarouselController {

    /**
     * @description Get related image files for a given record
     * @param recordId The Id of the record
     * @return List of ImageWrapper containing image information
     */
    @AuraEnabled(cacheable=true)
    public static List<ImageWrapper> getRelatedImages(Id recordId) {
        List<ImageWrapper> imageList = new List<ImageWrapper>();

        try {
            System.debug('RecordImageCarousel: Getting images for record: ' + recordId);

            // Define supported image file extensions
            Set<String> imageExtensions = new Set<String>{
                'jpg', 'jpeg', 'png', 'gif', 'bmp', 'heic', 'heif', 'webp', 'avif'
            };

            // Query ContentDocumentLinks to find files related to this record
            List<ContentDocumentLink> documentLinks = [
                SELECT ContentDocumentId
                FROM ContentDocumentLink
                WHERE LinkedEntityId = :recordId
                AND ShareType IN ('V', 'C', 'I')
            ];

            System.debug('RecordImageCarousel: Found ' + documentLinks.size() + ' document links');

            if (documentLinks.isEmpty()) {
                return imageList;
            }

            // Extract ContentDocument Ids
            Set<Id> documentIds = new Set<Id>();
            for (ContentDocumentLink link : documentLinks) {
                documentIds.add(link.ContentDocumentId);
            }

            // Query ContentVersions to get the latest version of each document
            List<ContentVersion> contentVersions = [
                SELECT Id, Title, FileExtension, ContentSize, ContentDocumentId
                FROM ContentVersion
                WHERE ContentDocumentId IN :documentIds
                AND IsLatest = true
                ORDER BY CreatedDate DESC
            ];

            System.debug('RecordImageCarousel: Found ' + contentVersions.size() + ' content versions');

            // Filter for image files and create ImageWrapper objects
            for (ContentVersion cv : contentVersions) {
                System.debug('RecordImageCarousel: Processing file: ' + cv.Title + ' with extension: ' + cv.FileExtension);

                if (cv.FileExtension != null &&
                    imageExtensions.contains(cv.FileExtension.toLowerCase())) {

                    ImageWrapper wrapper = new ImageWrapper();
                    wrapper.contentVersionId = cv.Id;
                    wrapper.title = cv.Title;
                    wrapper.fileExtension = cv.FileExtension;
                    wrapper.contentSize = cv.ContentSize;
                    wrapper.downloadUrl = '/sfc/servlet.shepherd/version/download/' + cv.Id;

                    imageList.add(wrapper);
                    System.debug('RecordImageCarousel: Added image: ' + cv.Title);
                }
            }

            System.debug('RecordImageCarousel: Returning ' + imageList.size() + ' images');

        } catch (Exception e) {
            // Log the error and throw an AuraHandledException
            System.debug('Error in getRelatedImages: ' + e.getMessage());
            System.debug('Stack trace: ' + e.getStackTraceString());
            throw new AuraHandledException('Error retrieving images: ' + e.getMessage());
        }

        return imageList;
    }


    /**
     * @description Wrapper class for image information
     */
    public class ImageWrapper {
        @AuraEnabled public String contentVersionId {get; set;}
        @AuraEnabled public String title {get; set;}
        @AuraEnabled public String fileExtension {get; set;}
        @AuraEnabled public Integer contentSize {get; set;}
        @AuraEnabled public String downloadUrl {get; set;}
    }
}
