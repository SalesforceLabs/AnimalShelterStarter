public with sharing class ProfilePictureController {

    @AuraEnabled
    public static Attachment getProfilePicture(Id parentId) {
        if (Schema.SObjectType.Attachment.isAccessible()) {
            return [SELECT Id, Name, LastModifiedDate, ContentType FROM Attachment
            WHERE ParentId=:parentId AND ContentType IN ('image/png', 'image/jpeg', 'image/gif')
            ORDER BY LastModifiedDate DESC LIMIT 1];
        }
        System.debug('User does not have access to view Attachments. Please review access.');
        return null;
    }

    @AuraEnabled
    public static Id saveAttachment(Id parentId, String fileName, String base64Data, String contentType) {
         if (Schema.SObjectType.Attachment.isCreateable() && Schema.SObjectType.Attachment.fields.ParentId.isAccessible() && Schema.SObjectType.Attachment.fields.Name.isAccessible() && Schema.SObjectType.Attachment.fields.ContentType.isAccessible()) {
            Attachment attachment = new Attachment();
            attachment.ParentId = parentId;
            attachment.Body = EncodingUtil.base64Decode(base64Data);
            attachment.Name = fileName;
            attachment.ContentType = contentType;
            insert attachment;
            return attachment.Id;
        }
        System.debug('User does not have access to create Attachments. Please review access.');
        return null;
    }

}