public with sharing class ProfilePictureController {

    @AuraEnabled
    public static Attachment getProfilePicture(Id parentId) {
        if (Schema.sObjectType.Attachment.isAccessible()) {
            return [SELECT Id, Name, LastModifiedDate, ContentType FROM Attachment
            WHERE parentid=:ParentId AND ContentType IN ('image/png', 'image/jpeg', 'image/gif')
            ORDER BY LastModifiedDate DESC LIMIT 1];
        }
        System.debug('User does not have access to view Attachments. Please review access.');
        return null;
    }

    @AuraEnabled
    public static Id saveAttachment(Id parentId, String fileName, String base64Data, String contentType) {
         if (Schema.sObjectType.Attachment.isCreateable() && Schema.sObjectType.Attachment.fields.parentId.isAccessible() && Schema.sObjectType.Attachment.fields.name.isAccessible() && Schema.sObjectType.Attachment.fields.contentType.isAccessible()) {
            Attachment attachment = new Attachment();
            attachment.parentId = parentId;
            attachment.body = EncodingUtil.base64Decode(base64Data);
            attachment.name = fileName;
            attachment.contentType = contentType;
            insert attachment;
            return attachment.id;
        }
        System.debug('User does not have access to create Attachments. Please review access.');
        return null;
    }

}
