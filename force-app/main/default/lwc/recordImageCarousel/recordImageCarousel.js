/**
 * @description       : LWC component to display related image files in a carousel
 * @author            : Stewart Anderson
 * @group             :
 * @last modified on  : 01-09-2025
 * @last modified by  : Stewart Anderson
**/
import { LightningElement, api, wire } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { refreshApex } from '@salesforce/apex';
import getRelatedImages from '@salesforce/apex/RecordImageCarouselController.getRelatedImages';

export default class RecordImageCarousel extends LightningElement {
    @api recordId;
    @api carouselHeight = 400; // Default height in pixels

    imageData = [];
    isLoading = true;
    showModal = false;
    selectedImage = {};
    wiredImagesResult;
    refreshInterval;
    lastImageCount = 0;

    connectedCallback() {
        // Set up auto-refresh every 30 seconds to detect external file uploads
        this.refreshInterval = setInterval(() => {
            this.checkForNewImages();
        }, 30000);
    }

    disconnectedCallback() {
        if (this.refreshInterval) {
            clearInterval(this.refreshInterval);
        }
    }

    renderedCallback() {
        // Set the custom height CSS property
        if (this.template.host && this.template.host.style) {
            this.template.host.style.setProperty('--carousel-height', `${this.carouselHeight}px`);
        }
    }

    // Wire method to get related images
    @wire(getRelatedImages, { recordId: '$recordId' })
    wiredImages(result) {
        this.wiredImagesResult = result;
        const { error, data } = result;
        this.isLoading = true;
        if (data) {
            this.processImages(data);
            this.isLoading = false;
        } else if (error) {
            this.handleError(error);
            this.isLoading = false;
        } else {
        }
    }

    // Process the images for the carousel
    processImages(images) {

        if (images && images.length > 0) {
            // Store images with formatted descriptions directly
            this.imageData = images.map(image => ({
                contentVersionId: image.contentVersionId,
                downloadUrl: image.downloadUrl,
                title: image.title,
                description: `File size: ${this.formatFileSize(image.contentSize)}`,
                fileExtension: image.fileExtension,
                contentSize: image.contentSize
            }));

            // Update last image count for auto-refresh detection
            this.lastImageCount = this.imageData.length;
        } else {
            this.imageData = [];
        }
    }

    // Handle errors
    handleError(error) {
        let message = 'Unknown error';
        if (Array.isArray(error.body)) {
            message = error.body.map(e => e.message).join(', ');
        } else if (typeof error.body.message === 'string') {
            message = error.body.message;
        }

        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Error Loading Images',
                message,
                variant: 'error',
            })
        );
    }

    // Format file size for display
    formatFileSize(bytes) {
        if (!bytes) return '0 Bytes';

        const k = 1024;
        const sizes = ['Bytes', 'KB', 'MB', 'GB'];
        const i = Math.floor(Math.log(bytes) / Math.log(k));

        return parseFloat((bytes / Math.pow(k, i)).toFixed(2)) + ' ' + sizes[i];
    }

    // Computed properties
    get hasImages() {
        return this.imageData && this.imageData.length > 0;
    }

    get imageDataLength() {
        return this.imageData ? this.imageData.length : 0;
    }

    // Event handlers
    handleImageClick(event) {
        const imageId = event.target.dataset.imageId;

        // Find the clicked image
        const clickedImage = this.imageData.find(img => img.contentVersionId === imageId);
        if (clickedImage) {
            this.selectedImage = clickedImage;
            this.showModal = true;
        }
    }

    // Set accepted image formats
    get acceptedFormats() {
        return ['.png', '.jpg', '.jpeg', '.webp', '.heic', '.heif', '.avif', '.bmp', '.gif'];
    }

    // Handle completed upload
    handleUploadFinished(event) {
        const uploadedFiles = event.detail.files;
        if (uploadedFiles && uploadedFiles.length > 0) {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Success',
                    message: `Image "${uploadedFiles[0].name}" uploaded successfully!`,
                    variant: 'success',
                })
            );

            // Refresh the component to show the new image
            this.refreshImages();
        }
    }

    async refreshImages() {
        try {
            await refreshApex(this.wiredImagesResult);
        } catch (error) {
            console.error('Error refreshing images:', error);
        } finally {
            this.isLoading = false;
        }
    }

    async checkForNewImages() {
        try {
            // Only check if we have a record ID and aren't currently loading
            if (!this.recordId || this.isLoading) return;

            // Refresh to get latest count
            await refreshApex(this.wiredImagesResult);

            // If image count increased, show notification
            if (this.imageData.length > this.lastImageCount) {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'New Images Detected',
                        message: 'Image gallery has been refreshed with new content.',
                        variant: 'info',
                    })
                );
            }

            this.lastImageCount = this.imageData.length;
        } catch (error) {
            // Silently handle errors in background refresh
            console.error('Error checking for new images:', error);
        }
    }

    handleModalDownload() {
        this.downloadImage(this.selectedImage.downloadUrl, this.selectedImage.title);
    }

    closeModal() {
        this.showModal = false;
        this.selectedImage = {};
    }

    downloadImage(url, filename) {
        try {
            // Create a temporary anchor element to trigger download
            const link = document.createElement('a');
            link.href = url;
            link.download = filename || 'image';
            link.target = '_blank';

            // Append to body, click, and remove
            document.body.appendChild(link);
            link.click();
            document.body.removeChild(link);

            // Show success message
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Download Started',
                    message: `Downloading ${filename}`,
                    variant: 'success',
                })
            );
        } catch (error) {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Download Failed',
                    message: 'Unable to download the image. Please try again.',
                    variant: 'error',
                })
            );
        }
    }

}
