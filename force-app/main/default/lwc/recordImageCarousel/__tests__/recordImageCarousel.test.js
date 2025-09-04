import { createElement } from 'lwc';
import RecordImageCarousel from 'c/recordImageCarousel';
import getRelatedImages from '@salesforce/apex/RecordImageCarouselController.getRelatedImages';

// Mock the Apex method
jest.mock(
    '@salesforce/apex/RecordImageCarouselController.getRelatedImages',
    () => {
        const { createApexTestWireAdapter } = require('@salesforce/sfdx-lwc-jest');
        return {
            default: createApexTestWireAdapter(jest.fn())
        };
    },
    { virtual: true }
);

describe('c-record-image-carousel', () => {
    afterEach(() => {
        // The jsdom instance is shared across test cases in a single file so reset the DOM
        while (document.body.firstChild) {
            document.body.removeChild(document.body.firstChild);
        }
        jest.clearAllMocks();
    });

    it('displays loading spinner initially', () => {
        const element = createElement('c-record-image-carousel', {
            is: RecordImageCarousel
        });
        element.recordId = '001000000000001';
        document.body.appendChild(element);

        // Check if loading spinner is displayed
        const spinner = element.shadowRoot.querySelector('lightning-spinner');
        expect(spinner).toBeTruthy();
    });

    it('displays images when data is loaded', () => {
        const mockImages = [
            {
                contentVersionId: '068000000000001',
                title: 'Test Image 1',
                fileExtension: 'jpg',
                contentSize: 1024,
                downloadUrl: '/sfc/servlet.shepherd/version/download/068000000000001'
            },
            {
                contentVersionId: '068000000000002',
                title: 'Test Image 2',
                fileExtension: 'png',
                contentSize: 2048,
                downloadUrl: '/sfc/servlet.shepherd/version/download/068000000000002'
            }
        ];

        const element = createElement('c-record-image-carousel', {
            is: RecordImageCarousel
        });
        element.recordId = '001000000000001';
        document.body.appendChild(element);

        // Emit data from the wire adapter
        getRelatedImages.emit(mockImages);

        return Promise.resolve().then(() => {
            // Check if carousel is displayed
            const carousel = element.shadowRoot.querySelector('lightning-carousel');
            expect(carousel).toBeTruthy();
            
            // Check if loading spinner is hidden
            const spinner = element.shadowRoot.querySelector('lightning-spinner');
            expect(spinner).toBeFalsy();
        });
    });

    it('displays no images message when no data', () => {
        const element = createElement('c-record-image-carousel', {
            is: RecordImageCarousel
        });
        element.recordId = '001000000000001';
        document.body.appendChild(element);

        // Emit empty data from the wire adapter
        getRelatedImages.emit([]);

        return Promise.resolve().then(() => {
            // Check if no images message is displayed
            const noImagesText = element.shadowRoot.querySelector('p');
            expect(noImagesText.textContent).toBe('No images found for this record');
            
            // Check if carousel is not displayed
            const carousel = element.shadowRoot.querySelector('lightning-carousel');
            expect(carousel).toBeFalsy();
        });
    });

    it('applies custom height property', () => {
        const element = createElement('c-record-image-carousel', {
            is: RecordImageCarousel
        });
        element.recordId = '001000000000001';
        element.carouselHeight = 600;
        document.body.appendChild(element);

        const mockImages = [
            {
                contentVersionId: '068000000000001',
                title: 'Test Image 1',
                fileExtension: 'jpg',
                contentSize: 1024,
                downloadUrl: '/sfc/servlet.shepherd/version/download/068000000000001'
            }
        ];

        // Emit data from the wire adapter
        getRelatedImages.emit(mockImages);

        return Promise.resolve().then(() => {
            const carousel = element.shadowRoot.querySelector('lightning-carousel');
            expect(carousel.style.cssText).toContain('height: 600px');
        });
    });

    it('handles error from wire adapter', () => {
        const element = createElement('c-record-image-carousel', {
            is: RecordImageCarousel
        });
        element.recordId = '001000000000001';
        document.body.appendChild(element);

        // Mock the toast event
        const mockDispatchEvent = jest.fn();
        element.dispatchEvent = mockDispatchEvent;

        // Emit error from the wire adapter
        getRelatedImages.error({ body: { message: 'Test error' } });

        return Promise.resolve().then(() => {
            // Check if error toast was dispatched
            expect(mockDispatchEvent).toHaveBeenCalledWith(
                expect.objectContaining({
                    type: 'lightning__showtoast'
                })
            );
        });
    });
});