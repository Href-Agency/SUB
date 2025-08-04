import '../sass/app.scss';
import $ from 'jquery';
import AOS from 'aos';
import Swiper from 'swiper/bundle';
import { gsap } from "gsap";
import GLightbox from 'glightbox';
import { ScrollTrigger } from "gsap/ScrollTrigger";
import { SplitText } from "gsap/SplitText";

gsap.registerPlugin(ScrollTrigger,SplitText);


// Global EnquiryManager instance
let enquiryManager;

document.addEventListener('DOMContentLoaded', function() {

    AOS.init({
        duration: 1000,
        once: false,
        offset: 100,
    });
    // Find all links containing "privacy-policy" in href

    $('a[href*="privacy-policy"]').attr('href', '/privacy-policy');


    // Set minimum height for main content area
    (function setMainMinHeight() {
        function updateMainMinHeight() {
            const main = document.querySelector('.error-page');
            const header = document.querySelector('.site-header');
            const footer = document.querySelector('.site-footer');
            
            if (main && header && footer) {
                const viewportHeight = window.innerHeight;
                const headerHeight = header.offsetHeight;
                const footerHeight = footer.offsetHeight;
                
                // Calculate minimum height: viewport height - header height - footer height
                const minHeight = viewportHeight - headerHeight - footerHeight;
                
                // Set minimum height (ensure it's at least 100px to prevent negative values)
                main.style.minHeight = Math.max(minHeight, 100) + 'px';
            }
        }
        
        // Update on page load
        updateMainMinHeight();
        
        // Update on window resize
        window.addEventListener('resize', updateMainMinHeight);
        
        // Update after a short delay to ensure all content is loaded
        setTimeout(updateMainMinHeight, 100);
    })();


    function checkScroll(scrollPos) {
        if (scrollPos > 0) {
            $('.site-header').addClass('is-scrolled');
        } else {
            $('.site-header').removeClass('is-scrolled');
        }
    }

    $(window).on('scroll', function() {
        checkScroll($(window).scrollTop());
    });

    checkScroll($(window).scrollTop());

    // HEADER CODE
    const header = $('.site-header');
    const nav = header.find('.site-header__nav');
    const menu = nav.find('.site-header__nav--menu');
    const burger = header.find('.site-header__burger');
    const logo = header.find('.header-logo');
    const parentItems = menu.find('.menu-item--has-submenu');
    const megamenuItems = menu.find('.megamenu-item');

    // Function to handle megamenu behavior based on screen size
    function handleMegamenuBehavior() {
        // Remove existing event listeners
        megamenuItems.off('mouseenter mouseleave');
        megamenuItems.find('.megamenu-toggle').off('click');
        megamenuItems.find('.submenu-list__item a').off('click');
        
        if(window.innerWidth <= 1200) {
            // Mobile/tablet behavior: click toggle button to show/hide
            megamenuItems.find('.megamenu-toggle').on('click', function(e) {
                e.preventDefault();
                e.stopPropagation();
                
                const $toggle = $(this);
                const $megamenuItem = $toggle.closest('.megamenu-item');
                const $submenu = $megamenuItem.find('.submenu');
                const isActive = $megamenuItem.hasClass('is-active');
                
                // Close all other megamenus
                megamenuItems.not($megamenuItem).each(function() {
                    $(this).removeClass('is-active');
                    $(this).find('.submenu').slideUp(300);
                });
                
                // Toggle current megamenu
                if (!isActive) {
                    $megamenuItem.addClass('is-active');
                    $submenu.slideDown(300);
                } else {
                    $megamenuItem.removeClass('is-active');
                    $submenu.slideUp(300);
                }
            });

            // Accordion functionality for submenu headings
            megamenuItems.find('.submenu-list__title').off('click').on('click', function(e) {
                e.preventDefault();
                e.stopPropagation();
                
                const $this = $(this);
                const $items = $this.siblings('.submenu-list__items');
                const $parentList = $this.closest('.submenu-list');
                
                // Close other accordion items in the same submenu
                $parentList.siblings('.submenu-list').find('.submenu-list__items').slideUp(200);
                $parentList.siblings('.submenu-list').find('.submenu-list__title').removeClass('is-active');
                
                // Toggle current accordion
                $this.toggleClass('is-active');
                $items.slideToggle(200);
            });

            // Ensure submenu links work properly and close megamenu when clicked
            megamenuItems.find('.submenu-list__item a').on('click', function() {
                // Close the megamenu when a submenu link is clicked
                megamenuItems.removeClass('is-active');
                megamenuItems.find('.submenu').slideUp(200);
                megamenuItems.find('.submenu-list__items').slideUp(200);
                megamenuItems.find('.submenu-list__title').removeClass('is-active');
            });
        } else {
            // Desktop behavior: hover to show/hide
            megamenuItems.on('mouseenter', function() {
                const $this = $(this);
                const $submenu = $this.find('.submenu');
                $this.addClass('is-active');
                $submenu.slideDown(200);
            });

            megamenuItems.on('mouseleave', function() {
                const $this = $(this);
                const $submenu = $this.find('.submenu');
                $this.removeClass('is-active');
                $submenu.slideUp(200);
            });

            // On desktop, ensure all accordion items are open
            megamenuItems.find('.submenu-list__items').show();
            megamenuItems.find('.submenu-list__title').addClass('is-active');
        }
    }

    // Initialize megamenu behavior
    handleMegamenuBehavior();

    // Re-initialize on window resize
    $(window).on('resize', function() {
        handleMegamenuBehavior();
    });

    // Legacy code for regular dropdowns (keeping for compatibility)
    if(window.innerWidth <= 1024) {
        parentItems.on('click', function(e) {
            e.preventDefault();
            parentItems.find('.submenu').not($(this) || $(this).parents('.submenu')).slideUp();
            const submenu = $(this).find('.submenu').first();
            submenu.stop().slideToggle();
        });
    } else {
        parentItems.on('mouseenter', function(e) {
            const submenu = $(this).find('.submenu').first();
            submenu.stop().slideDown();
        });

        parentItems.on('mouseleave', function() {
            const submenu = $(this).find('.submenu').first();
            submenu.stop().slideUp();
        });
    }

    // Burger menu toggle
    burger.on('click', function() {
        burger.toggleClass('is-active');
        nav.toggleClass('is-active');
        logo.toggleClass('menu-active');
        $('html,body').toggleClass('menu-active');
        
        // Close all megamenus when mobile menu is closed
        if (!nav.hasClass('is-active')) {
            megamenuItems.removeClass('is-active');
            megamenuItems.find('.submenu').slideUp(200);
            megamenuItems.find('.submenu-list__items').slideUp(200);
            megamenuItems.find('.submenu-list__title').removeClass('is-active');
        }
    });

    // Close megamenu when clicking outside
    $(document).on('click', function(e) {
        if (window.innerWidth <= 1200) {
            if (!$(e.target).closest('.megamenu-item').length) {
                megamenuItems.removeClass('is-active');
                megamenuItems.find('.submenu').slideUp(200);
                megamenuItems.find('.submenu-list__items').slideUp(200);
                megamenuItems.find('.submenu-list__title').removeClass('is-active');
            }
        }
    }); 


    (function initFilters() {
        const filterForm = $('.filters-container form');
        if(filterForm.length) {
            const filterInputs = filterForm.find('.filter-item input');
            filterInputs.on('change', function() {
                const $form = $(this).closest('form');
                const $entries = $form.closest('.archive-page').find('.post-list');
                const section = $form.find('input[name="section"]').val();
                const url = "/actions/filters/filter/query?" + $(this).attr('name') + "=" + $(this).val() + "&section=" + section;
                $entries.addClass('loading');
                
                fetch(url)
                    .then(response => response.json())
                    .then(data => {
                        setTimeout(() => {
                            $entries.html(data.html);
                            $entries.removeClass('loading');
                        }, 300);
                    });
            });
            const selectContainer = $('.select-container');
            if(selectContainer.length) {
                selectContainer.on('change', function() {
                    const $form = $(this).closest('form');
                    const $entries = $form.closest('.archive-page').find('.post-list');
                    const select = $(this).find('select');
                    const section = $form.find('input[name="section"]').val();
                    const url = "/actions/filters/filter/query?" + select.attr('name') + "=" + select.val() + "&section=" + section;
                    $entries.addClass('loading');
                    
                    fetch(url)
                        .then(response => response.json())
                        .then(data => {
                            setTimeout(() => {
                                $entries.html(data.html);
                                $entries.removeClass('loading');
                            }, 300);
                        });
                })
            }
        }
    })();

    // Mobile filter and categories functionality
    (function initCategoriesAndFilter() {
        const categoriesContainer = $('.categories-container');
        const filterToggle = $('.filter-toggle');
        const filterClose = $('.filter-close');
        
        // Mobile filter toggle functionality
        function toggleMobileFilter() {
            categoriesContainer.toggleClass('is-active');
            $('body').toggleClass('filter-open');
        }
        
        // Open filter on button click
        filterToggle.on('click', function(e) {
            e.preventDefault();
            toggleMobileFilter();
        });
        
        // Close filter on close button click
        filterClose.on('click', function(e) {
            e.preventDefault();
            categoriesContainer.removeClass('is-active');
            $('body').removeClass('filter-open');
        });
        
        // Close filter when clicking outside on mobile
        $(document).on('click', function(e) {
            if (window.innerWidth <= 1200) {
                if (!$(e.target).closest('.categories-container, .filter-toggle').length) {
                    categoriesContainer.removeClass('is-active');
                    $('body').removeClass('filter-open');
                }
            }
        });
        
        // Categories functionality
        if (categoriesContainer.length) {
            // Initialize - show main subcategories by default, but hide sub-subcategories
            categoriesContainer.find('.subcategories').show();
            categoriesContainer.find('.subcategory-children').hide();
            
            // Handle main category toggle (only for categories that have toggle icons)
            categoriesContainer.on('click', '.category-header .toggle-icon', function(e) {
                e.preventDefault();
                e.stopPropagation();
                
                const $toggleIcon = $(this);
                const $categoryItem = $toggleIcon.closest('.category-item');
                const $subcategories = $categoryItem.find('.subcategories');
                const isActive = $categoryItem.hasClass('is-active');
                
                // Toggle current category
                if (!isActive) {
                    $categoryItem.addClass('is-active');
                    $toggleIcon.addClass('is-rotated');
                    $subcategories.slideDown(300);
                } else {
                    $categoryItem.removeClass('is-active');
                    $toggleIcon.removeClass('is-rotated');
                    $subcategories.slideUp(300);
                }
            });
            
            // Handle subcategory toggle (only for subcategories that have toggle icons)
            categoriesContainer.on('click', '.subcategory-header .toggle-icon', function(e) {
                e.preventDefault();
                e.stopPropagation();
                
                const $toggleIcon = $(this);
                const $subcategoryItem = $toggleIcon.closest('.subcategory-item');
                const $subcategoryChildren = $subcategoryItem.find('.subcategory-children');
                const isActive = $subcategoryItem.hasClass('is-active');
                
                // Toggle current subcategory
                if (!isActive) {
                    $subcategoryItem.addClass('is-active');
                    $toggleIcon.addClass('is-rotated');
                    $subcategoryChildren.slideDown(250);
                } else {
                    $subcategoryItem.removeClass('is-active');
                    $toggleIcon.removeClass('is-rotated');
                    $subcategoryChildren.slideUp(250);
                }
            });
            
            // Prevent event bubbling on category and subcategory links
            categoriesContainer.on('click', '.category-header a, .subcategory-header a, .subcategory-link', function(e) {
                e.stopPropagation();
                // Allow normal link behavior
                
                // Close mobile filter when a link is clicked
                if (window.innerWidth <= 1200) {
                    categoriesContainer.removeClass('is-active');
                    $('body').removeClass('filter-open');
                }
            });
        }
    })();

    // Sort dropdown functionality
    (function initSortDropdown() {
        const sortSelect = $('#sort-select');
        
        if (sortSelect.length) {
            sortSelect.on('change', function() {
                const selectedOrder = $(this).val();
                const currentUrl = new URL(window.location.href);
                
                // Set or remove the order parameter
                if (selectedOrder) {
                    currentUrl.searchParams.set('order', selectedOrder);
                } else {
                    currentUrl.searchParams.delete('order');
                }
                
                // Reset page parameter when sorting
                currentUrl.searchParams.delete('page');
                
                // Navigate to new URL
                window.location.href = currentUrl.toString();
            });
        }
    })();

    // Auto-scroll to products section if URL has pagination or sort parameters
    (function initAutoScroll() {
        const urlParams = new URLSearchParams(window.location.search);
        const hasPage = urlParams.has('page');
        const hasOrder = urlParams.has('order');
        
        if (hasPage || hasOrder) {
            // Small delay to ensure page is fully loaded
            setTimeout(function() {
                const productsSection = $('.productListingBlock .products-section');
                if (productsSection.length) {
                    $('html, body').animate({
                        scrollTop: productsSection.offset().top - 100
                    }, 100);
                }
            }, 100);
        }
    })();

    // Enquiry List Management
    (function initEnquiryManager() {
        class EnquiryManager {
            constructor() {
                this.cookieName = 'enquiries';
                this.enquiries = this.loadEnquiries();
                this.init();
            }

            // Load enquiries from cookie
            loadEnquiries() {
                const cookie = this.getCookie(this.cookieName);
                if (cookie) {
                    try {
                        return JSON.parse(cookie);
                    } catch (e) {
                        console.error('Error parsing enquiries cookie:', e);
                        return {};
                    }
                }
                return {};
            }

            // Save enquiries to cookie
            saveEnquiries() {
                const cookieValue = JSON.stringify(this.enquiries);
                this.setCookie(this.cookieName, cookieValue, 30); // 30 days expiry
            }

            // Add product to enquiry list
            addToEnquiry(productId, productData = {}) {
                if (!this.enquiries[productId]) {
                    this.enquiries[productId] = {
                        id: productId,
                        addedAt: new Date().toISOString(),
                        ...productData
                    };
                    this.saveEnquiries();
                    this.updateUI();
                    this.updateCount();
                    return true;
                }
                return false;
            }

            // Remove product from enquiry list
            removeFromEnquiry(productId) {
                if (this.enquiries[productId]) {
                    delete this.enquiries[productId];
                    this.saveEnquiries();
                    this.updateUI();
                    this.updateCount();
                    return true;
                }
                return false;
            }

            // Toggle product in enquiry list
            toggleEnquiry(productId, productData = {}) {
                if (this.enquiries[productId]) {
                    return this.removeFromEnquiry(productId);
                } else {
                    return this.addToEnquiry(productId, productData);
                }
            }

            // Clear all enquiries
            clearAllEnquiries() {
                this.enquiries = {};
                this.saveEnquiries();
                this.updateUI();
                this.updateCount();
            }

            // Get enquiry count
            getCount() {
                return Object.keys(this.enquiries).length;
            }

            // Get all enquiries
            getAllEnquiries() {
                return this.enquiries;
            }

            // Update UI elements
            updateUI() {
                // Update enquiry buttons on product cards and single equipment pages
                $('.enquiry-button').each((index, element) => {
                    const $button = $(element);
                    const productId = $button.data('product-id');
                    
                    if (this.enquiries[productId]) {
                        $button.addClass('in-enquiry');
                        // Show/hide the appropriate text spans based on the new template structure
                        $button.find('.add-to-enquiry-text').hide();
                        $button.find('.in-enquiry-text').show();
                    } else {
                        $button.removeClass('in-enquiry');
                        // Show/hide the appropriate text spans based on the new template structure
                        $button.find('.add-to-enquiry-text').show();
                        $button.find('.in-enquiry-text').hide();
                    }
                });

                // Update enquiry count in navigation
                this.updateCount();

                            // Update equipment list page if we're on it
            if (window.location.pathname === '/enquiry-list') {
                this.updateEquipmentListPage();
                this.updateMultiEnquiryForm();
            }
            }

            // Update count in navigation
            updateCount() {
                const count = this.getCount();
                $('[data-enquiry-count]').text(count);
                
                // Update multi enquiry form when count changes
                if (window.location.pathname === '/enquiry-list') {
                    this.updateMultiEnquiryForm();
                }
            }

            // Update equipment list page content
            updateEquipmentListPage() {
                const $enquiryItemsList = $('.enquiry-items-list');
                const $emptyState = $('.empty-state');
                const $enquiryActions = $('.equipment-list-container');
                const $formContainer = $('.form-container');
                const $formDisabledMessage = $('.form-disabled-message');

                if (this.getCount() > 0) {
                    // Show items and form, hide empty state
                    $emptyState.hide();
                    $enquiryItemsList.show();
                    $enquiryActions.show();
                    $formContainer.show();
                    $formDisabledMessage.hide();
                } else {
                    // Show empty state, hide items and form
                    $emptyState.show();
                    $enquiryItemsList.hide();
                    $enquiryActions.hide();
                    $formContainer.hide();
                    $formDisabledMessage.show();
                }
            }

            // Update multi enquiry form with current enquiry data
            updateMultiEnquiryForm() {
                const $form = $('[data-handle="multiEnquiryForm"]');
                if ($form.length) {
                    const enquiries = this.getAllEnquiries();
                    const productNames = [];
                    const productReferences = [];
                    
                    // Collect product names and references from enquiry list
                    Object.values(enquiries).forEach(product => {
                        if (product.title) {
                            productNames.push(product.title);
                        }
                        if (product.reference) {
                            productReferences.push(product.reference);
                        }
                    });
                    
                    // Update form fields with comma-separated values
                    const $productNameInput = $form.find('#form-input-productName');
                    const $productReferenceInput = $form.find('#form-input-productReference');
                    
                    if ($productNameInput.length) {
                        $productNameInput.val(productNames.join(', '));
                    }
                    
                    if ($productReferenceInput.length) {
                        $productReferenceInput.val(productReferences.join(', '));
                    }
                }
            }

            // Cookie utility methods
            setCookie(name, value, days) {
                const expires = new Date();
                expires.setTime(expires.getTime() + (days * 24 * 60 * 60 * 1000));
                document.cookie = `${name}=${value};expires=${expires.toUTCString()};path=/;SameSite=Lax`;
            }

            getCookie(name) {
                const nameEQ = name + "=";
                const ca = document.cookie.split(';');
                for (let i = 0; i < ca.length; i++) {
                    let c = ca[i];
                    while (c.charAt(0) === ' ') c = c.substring(1, c.length);
                    if (c.indexOf(nameEQ) === 0) return c.substring(nameEQ.length, c.length);
                }
                return null;
            }

            // Initialize event listeners
            init() {
                // Handle enquiry button clicks on product cards and single equipment pages
                $(document).on('click', '.enquiry-button', (e) => {
                    e.preventDefault();
                    e.stopPropagation();
                    
                    const $button = $(e.currentTarget);
                    const productId = $button.data('product-id');
                    
                    // Get product data for storage - handle both product cards and single equipment pages
                    let productData = {};
                    
                    // Check if we're on a product card or single equipment page
                    const $productCard = $button.closest('.product-card');
                    if ($productCard.length) {
                        // Product card
                        productData = {
                            title: $productCard.find('.product-title').text().trim(),
                            reference: $productCard.find('.product-reference').text().trim(),
                            image: $productCard.find('.product-image img').attr('src'),
                            url: $productCard.find('.product-image a').attr('href')
                        };
                    } else {
                        // Single equipment page - get data from button attributes
                        // Try to find the first image on the page
                        let imageUrl = '';
                        const $firstImage = $('img').first();
                        if ($firstImage.length) {
                            imageUrl = $firstImage.attr('src');
                        }
                        
                        productData = {
                            title: $button.data('product-title'),
                            reference: $button.data('product-reference'),
                            url: $button.data('product-url'),
                            image: imageUrl
                        };
                    }

                    this.toggleEnquiry(productId, productData);
                });

                // Handle remove item buttons on equipment list page
                $(document).on('click', '.remove-item-btn', (e) => {
                    e.preventDefault();
                    const productId = $(e.currentTarget).data('product-id');
                    this.removeFromEnquiry(productId);
                    
                    // Remove the item from the DOM
                    $(e.currentTarget).closest('.enquiry-item').fadeOut(300, function() {
                        $(this).remove();
                    });
                });

                // Handle clear all button
                $('form[data-handle="multiEnquiryForm"]').on('click', '#clear-all-enquiries', (e) => {
                    e.preventDefault();
                    if (confirm('Are you sure you want to clear all items from your enquiry list?')) {
                        this.clearAllEnquiries();
                        $('.enquiry-item').fadeOut(300, function() {
                            $(this).remove();
                        });
                    }
                });

                // Handle clear all button
                $('form[data-handle="multiEnquiryForm"]').on('freeform-ajax-success', (e) => {
                    this.clearAllEnquiries();
                    $('.enquiry-item').fadeOut(300, function() {
                        $(this).remove();
                    });
                });

                // Initialize UI on page load
                this.updateUI();
                
                // Update multi enquiry form on page load
                this.updateMultiEnquiryForm();
            }
        }

        // Create global enquiry manager instance
        enquiryManager = new EnquiryManager();
    })();

    // Quick Enquiry Modal functionality
    (function initQuickEnquiryModal() {
        const $modal = $('.quick-enquiry-modal');
        const $modalContent = $modal.find('.quick-enquiry-modal-content');
        const $closeButton = $modal.find('.close-button');
        const $previewImage = $('#preview-product-image');
        const $previewTitle = $('#preview-product-title');
        const $previewReference = $('#preview-product-reference');
        


        // Open modal when quick enquiry button is clicked
        $(document).on('click', '.quick-enquiry-button', function(e) {
            e.preventDefault();
            
            const $button = $(this);
            const productTitle = $button.data('product-title');
            const productReference = $button.data('product-reference');
            const productImage = $button.data('product-image');
            
            // Update modal content
            $previewTitle.text(productTitle);
            $previewReference.text(productReference);
            $previewImage.attr('src', productImage);
            $previewImage.attr('alt', productTitle);
            
            // Show modal
            $modal.addClass('is-active');
            $('body').addClass('modal-open');

            $modal.find('form [name="productName"]').attr('value', productTitle);
            $modal.find('form [name="productReference"]').attr('value', productReference);
        });

        // Close modal when close button is clicked
        $closeButton.on('click', function() {
            $modal.removeClass('is-active');
            $('body').removeClass('modal-open');
        });

        // Close modal when clicking outside
        $modal.on('click', function(e) {
            if (e.target === this) {
                $modal.removeClass('is-active');
                $('body').removeClass('modal-open');
            }
        });

        // Close modal with Escape key
        $(document).on('keydown', function(e) {
            if (e.key === 'Escape' && $modal.hasClass('is-active')) {
                $modal.removeClass('is-active');
                $('body').removeClass('modal-open');
            }
        });
    })();

    // Wanted Equipment Modal functionality
    (function initWantedEquipmentModal() {
        const $modal = $('.wanted-equipment-modal');
        const $modalContent = $modal.find('.wanted-equipment-modal-content');
        const $closeButton = $modal.find('.close-button');
        const $previewImage = $('#preview-wanted-equipment-image');
        const $previewTitle = $('#preview-wanted-equipment-title');
        const $previewReference = $('#preview-wanted-equipment-reference');
        
        // Open modal when wanted equipment modal button is clicked
        $(document).on('click', '.wanted-equipment-modal-button', function(e) {
            e.preventDefault();
            
            const $button = $(this);
            const productTitle = $button.data('product-title');
            const productReference = $button.data('product-reference');
            const productImage = $button.data('product-image');
            
            // Update modal content
            $previewTitle.text(productTitle);
            if (productReference.length > 0) {
                $previewReference.text(productReference);
            }
            if (productImage) {
                $previewImage.attr('src', productImage);
                $previewImage.attr('alt', productTitle);
            }
            
            // Add hidden fields to the form for productReference and productName
            const $form = $modal.find('form');
            
            
            if ($form.find('input#form-input-productName').length) {
                $form.find('input#form-input-productName').val(productTitle);
            }

            if ($form.find('input#form-input-productReference').length) {
                $form.find('input#form-input-productReference').val(productReference);
            }
            
            // Show modal
            $modal.addClass('is-active');
            $('body').addClass('modal-open');
            
            // Initialize file uploads after modal content is loaded
            setTimeout(function() {
                initWantedEquipmentFileUploads();
            }, 100);
        });

        // Close modal when close button is clicked
        $closeButton.on('click', function() {
            $modal.removeClass('is-active');
            $('body').removeClass('modal-open');
        });

        // Close modal when clicking outside
        $modal.on('click', function(e) {
            if (e.target === this) {
                $modal.removeClass('is-active');
                $('body').removeClass('modal-open');
            }
        });

        // Close modal with Escape key
        $(document).on('keydown', function(e) {
            if (e.key === 'Escape' && $modal.hasClass('is-active')) {
                $modal.removeClass('is-active');
                $('body').removeClass('modal-open');
            }
        });

        // Initialize file upload functionality for wanted equipment modal
        function initWantedEquipmentFileUploads() {
            // Find all file inputs inside the wanted equipment modal
            $modal.find('input[type="file"]').each(function() {
                const fileInput = this;
                
                // Check if this file input is already wrapped
                if (fileInput.parentNode && fileInput.parentNode.classList.contains('custom-file-upload')) {
                    return; // Skip if already initialized
                }
                
                // Create wrapper div
                const wrapper = document.createElement('div');
                wrapper.className = 'custom-file-upload';
                
                // Create placeholder div
                const placeholder = document.createElement('div');
                placeholder.className = 'file-upload-placeholder';
                placeholder.textContent = 'Drag file(s) here or click to select from your device';
                
                // Insert wrapper before file input
                fileInput.parentNode.insertBefore(wrapper, fileInput);
                
                // Move file input and placeholder into wrapper
                wrapper.appendChild(fileInput);
                wrapper.appendChild(placeholder);
                
                // File input styling is handled by CSS classes
                
                // Update placeholder on file select
                fileInput.addEventListener('change', function() {
                    if (fileInput.files && fileInput.files.length > 0) {
                        const fileNames = Array.from(fileInput.files).map(function(f) { 
                            return f.name; 
                        }).join(', ');
                        placeholder.textContent = fileNames;
                    } else {
                        placeholder.textContent = 'Drag file(s) here or click to select from your device';
                    }
                });
            });
        }


    })();

    

    (function featuredEquipmentCarousel() {
        const featuredEquipmentCarousel = new Swiper('.featuredEquipmentCarousel .equipment-carousel', {
            slidesPerView: 1,
            spaceBetween: 30,
            loop: true,
            autoplay: {
                delay: 4000,
                disableOnInteraction: false,
            },
            breakpoints: {
                0 : {
                    spaceBetween: 12,
                    slidesPerView: 1,
                },
                768: {
                    spaceBetween: 12,
                    slidesPerView: 2,
                },
                1024: {
                    slidesPerView: 3,
                    spaceBetween: 16,
                },
                1600: {
                    slidesPerView: 4,
                    spaceBetween: 16,
                },
            },
            pagination: {
                el: '.featuredEquipmentCarousel .equipment-carousel .swiper-pagination',
            },
        });
    })();

    (function tableWithFormCarousel() {
        const block = $('.tableWithFormBlock');
        console.log(block);
        if (block.length) {
            const carousel = block.find('.carousel').get(0);
            console.log(carousel);
            const tableWithFormCarousel = new Swiper(carousel, {
                slidesPerView: 1,
                spaceBetween: 0,
                loop: true,
                autoplay: {
                    delay: 5000,
                    disableOnInteraction: false,
                },
                pagination: {
                    el: block.find('.swiper-pagination').get(0),
                    clickable: true,
                },
                navigation: {
                    nextEl: block.find('.swiper-btn-next').get(0),
                    prevEl: block.find('.swiper-btn-prev').get(0),
                },
            });

            // Initialize GLightbox for the carousel
            const lightbox = GLightbox({
                selector: '.tableWithFormBlock .glightbox-el',
                touchNavigation: true,
                loop: true,
                autoplayVideos: true,
                plyr: {
                    css: 'https://cdn.plyr.io/3.6.8/plyr.css',
                    js: 'https://cdn.plyr.io/3.6.8/plyr.js'
                },
                onOpen: () => {
                    // Pause Swiper autoplay when lightbox is open
                    if (tableWithFormCarousel.autoplay) {
                        tableWithFormCarousel.autoplay.stop();
                    }
                },
                onClose: () => {
                    // Resume Swiper autoplay when lightbox is closed
                    if (tableWithFormCarousel.autoplay) {
                        tableWithFormCarousel.autoplay.start();
                    }
                }
            });
        }
    })();

    (function wantedEquipmentListingBlock() {
        const block = $('.wantedEquipmentListingBlock');
        if (block.length) {
            const $equipmentList = block.find('.equipment-list');
            const $equipmentItems = $equipmentList.find('.single-wanted-equipment');
            const $categoryCheckboxes = block.find('.category-form .category-checkboxes input[type="checkbox"]');
            const $categorySelect = block.find('#category-select');
            const $sortSelect = block.find('#wanted-sort-select');
            const $currentVisible = block.find('.current-visible');
            const $totalResults = block.find('.total-results');
            
            let allEquipment = [];
            let filteredEquipment = [];
            
            // Initialize equipment data
            function initEquipmentData() {
                allEquipment = [];
                $equipmentItems.each(function() {
                    const $item = $(this);
                    const tags = $item.data('tags').split(',').map(tag => tag.trim()).filter(tag => tag);
                    allEquipment.push({
                        element: $item,
                        title: $item.data('title'),
                        tags: tags,
                        number: $item.data('number')
                    });
                });
                filteredEquipment = [...allEquipment];
            }
            
            // Filter equipment by selected categories
            function filterEquipment() {
                const selectedCategories = [];
                
                // Get selected categories from checkboxes (desktop)
                $categoryCheckboxes.each(function() {
                    if ($(this).is(':checked')) {
                        selectedCategories.push($(this).val());
                    }
                });
                
                // Get selected categories from select (mobile)
                if ($categorySelect.length) {
                    const selectedOptions = $categorySelect.find('option:selected');
                    selectedOptions.each(function() {
                        const value = $(this).val();
                        if (value && !selectedCategories.includes(value)) {
                            selectedCategories.push(value);
                        }
                    });
                }
                
                // If no categories selected, show all equipment
                if (selectedCategories.length === 0) {
                    filteredEquipment = [...allEquipment];
                } else {
                    // Filter equipment that has at least one of the selected tags
                    filteredEquipment = allEquipment.filter(equipment => {
                        const hasMatchingTag = equipment.tags.some(tag => selectedCategories.includes(tag));
                        return hasMatchingTag;
                    });
                }
                
                // Apply current sort after filtering
                const currentSort = $sortSelect.val();
                sortEquipment(currentSort);
            }
            
            // Sort equipment by title
            function sortEquipment(sortType) {
                if (sortType === 'title-asc') {
                    filteredEquipment.sort((a, b) => a.title.localeCompare(b.title));
                } else if (sortType === 'title-desc') {
                    filteredEquipment.sort((a, b) => b.title.localeCompare(a.title));
                } else {
                    filteredEquipment.sort((a, b) => a.number - b.number);
                }
                
                updateDisplay();
            }
            
            // Update the display
            function updateDisplay() {
                // Hide all equipment first
                $equipmentItems.addClass('hidden');
                
                // Show filtered and sorted equipment
                filteredEquipment.forEach(equipment => {
                    equipment.element.removeClass('hidden');
                });
                
                // Update count
                $currentVisible.text(filteredEquipment.length);
                $totalResults.text(allEquipment.length);
                
                // Reorder equipment in DOM
                const $container = $equipmentList;
                filteredEquipment.forEach(equipment => {
                    $container.append(equipment.element);
                });
            }
            
            // Sync checkboxes with select dropdown
            function syncCheckboxesWithSelect() {
                const selectedValues = [];
                $categoryCheckboxes.each(function() {
                    if ($(this).is(':checked')) {
                        selectedValues.push($(this).val());
                    }
                });
                
                // Update select dropdown
                $categorySelect.find('option').prop('selected', false);
                selectedValues.forEach(value => {
                    $categorySelect.find(`option[value="${value}"]`).prop('selected', true);
                });
            }
            
            // Sync select dropdown with checkboxes
            function syncSelectWithCheckboxes() {
                const selectedValues = [];
                $categorySelect.find('option:selected').each(function() {
                    const value = $(this).val();
                    if (value) {
                        selectedValues.push(value);
                    }
                });
                
                // Update checkboxes
                $categoryCheckboxes.prop('checked', false);
                selectedValues.forEach(value => {
                    $categoryCheckboxes.filter(`[value="${value}"]`).prop('checked', true);
                });
            }
            
            // Event listeners
            $categoryCheckboxes.on('change', function() {
                syncCheckboxesWithSelect();
                filterEquipment();
            });
            
            $categorySelect.on('change', function() {
                syncSelectWithCheckboxes();
                filterEquipment();
            });
            
            $sortSelect.on('change', function() {
                const sortType = $(this).val();
                sortEquipment(sortType);
            });
            
            // Initialize
            initEquipmentData();
        }
    })();

    // Find all file inputs inside .contactPageFormBlock
    document.querySelectorAll('.contactPageFormBlock input[type="file"]').forEach(function(fileInput) {
        // Create wrapper div
        var wrapper = document.createElement('div');
        wrapper.className = 'custom-file-upload';
        // Create placeholder div
        var placeholder = document.createElement('div');
        placeholder.className = 'file-upload-placeholder';
        placeholder.textContent = 'Drag file(s) here or click to select from your device';
        // Insert wrapper before file input
        fileInput.parentNode.insertBefore(wrapper, fileInput);
        // Move file input and placeholder into wrapper
        wrapper.appendChild(fileInput);
        wrapper.appendChild(placeholder);
        // Style file input for accessibility
        fileInput.style.opacity = 0;
        fileInput.style.position = 'absolute';
        fileInput.style.width = '100%';
        fileInput.style.height = '100%';
        fileInput.style.cursor = 'pointer';
        fileInput.style.zIndex = 2;
        fileInput.style.margin = 0;
        wrapper.style.position = 'relative';
        wrapper.style.width = '100%';
        // Update placeholder on file select
        fileInput.addEventListener('change', function () {
            if (fileInput.files && fileInput.files.length > 0) {
                var fileNames = Array.from(fileInput.files).map(function(f) { return f.name; }).join(', ');
                placeholder.textContent = fileNames;
            } else {
                placeholder.textContent = 'Drag file(s) here or click to select from your device';
            }
        });
    });

    $(function() {
        const $searchToggle = $('#search-toggle');
        const $searchContainer = $('#search-bar');
        const $searchInput = $searchContainer.find('input[type="text"]');

        $searchToggle.on('click', function(e) {
            e.preventDefault();
            const isActive = $searchContainer.hasClass('is-active');
            $searchContainer.toggleClass('is-active', !isActive);
            $searchToggle.toggleClass('is-active', !isActive);
            if (!isActive) {
                setTimeout(() => $searchInput.focus(), 300);
            }
        });

        // Optional: Close search on ESC
        $(document).on('keydown', function(e) {
            if (e.key === 'Escape' && $searchContainer.hasClass('is-active')) {
                $searchContainer.removeClass('is-active');
                $searchToggle.removeClass('is-active');
            }
        });

        // Hover state for button
        $searchToggle.hover(
            function() { $(this).addClass('is-hover'); },
            function() { $(this).removeClass('is-hover'); }
        );
    });

});

// --- Render enquiry items from cookie into #list-contents (JS only) ---
function renderEnquiryList() {
    const container = document.getElementById('list-contents');
    if (!container) return;
    container.innerHTML = '';

    // Parse the 'enquiries' cookie
    const cookie = document.cookie.split('; ').find(row => row.startsWith('enquiries='));
    let enquiries = {};
    if (cookie) {
        try {
            enquiries = JSON.parse(decodeURIComponent(cookie.split('=')[1]));
        } catch (e) {
            enquiries = {};
        }
    }

    const ids = Object.keys(enquiries);
    if (ids.length === 0) {
        container.innerHTML = '<div class="empty-state">No items in your enquiry list.</div>';
        return;
    }

    ids.forEach(productId => {
        const product = enquiries[productId];
        // Create the item row
        const item = document.createElement('div');
        item.className = 'enquiry-item';

        // Image
        const imgDiv = document.createElement('div');
        imgDiv.className = 'item-image';
        imgDiv.innerHTML = `<img src="${product.image}" alt="${product.title}">`;

        // Details
        const detailsDiv = document.createElement('div');
        detailsDiv.className = 'item-details';
        detailsDiv.innerHTML = `
            <h3 class="item-title" style="margin:0 0 8px 0;">${product.title}</h3>
            <p class="item-reference">Item Reference: ${product.reference}</p>
        `;

        // Remove button
        const actionsDiv = document.createElement('div');
        actionsDiv.className = 'item-actions';
        actionsDiv.innerHTML = `
            <button class="remove-item-btn" data-product-id="${productId}">
                <svg xmlns="http://www.w3.org/2000/svg" width="13.333" height="15" viewBox="0 0 13.333 15">
                    <path id="delete_FILL0_wght400_GRAD0_opsz24" d="M162.5-825a1.605,1.605,0,0,1-1.177-.49,1.605,1.605,0,0,1-.49-1.177V-837.5H160v-1.667h4.167V-840h5v.833h4.167v1.667H172.5v10.833a1.605,1.605,0,0,1-.49,1.177,1.605,1.605,0,0,1-1.177.49Zm8.333-12.5H162.5v10.833h8.333Zm-6.667,9.167h1.667v-7.5h-1.667Zm3.333,0h1.667v-7.5H167.5Zm-5-9.167v0Z" transform="translate(-160 840)" fill="#041c2a"/>
                </svg>
                <span class="text">Remove</span>
            </button>
        `;

        // Assemble
        item.appendChild(imgDiv);
        item.appendChild(detailsDiv);
        item.appendChild(actionsDiv);
        container.appendChild(item);
    });

    // Update multi enquiry form fields if enquiry manager exists
    if (typeof enquiryManager !== 'undefined' && enquiryManager) {
        enquiryManager.updateMultiEnquiryForm();
    }
}

document.addEventListener('DOMContentLoaded', renderEnquiryList);
document.addEventListener('click', function(e) {
    if (e.target.closest('.remove-item-btn')) {
        const productId = e.target.closest('.remove-item-btn').getAttribute('data-product-id');
        
        // Use enquiry manager if available, otherwise fallback to direct cookie manipulation
        if (typeof enquiryManager !== 'undefined' && enquiryManager) {
            enquiryManager.removeFromEnquiry(productId);
            // Remove the item from the DOM
            e.target.closest('.enquiry-item').style.opacity = '0';
            setTimeout(() => {
                renderEnquiryList();
            }, 300);
        } else {
            // Fallback to direct cookie manipulation
            const cookie = document.cookie.split('; ').find(row => row.startsWith('enquiries='));
            let enquiries = {};
            if (cookie) {
                try {
                    enquiries = JSON.parse(decodeURIComponent(cookie.split('=')[1]));
                } catch (e) {}
            }
            delete enquiries[productId];
            document.cookie = 'enquiries=' + encodeURIComponent(JSON.stringify(enquiries)) + ';path=/;SameSite=Lax';
            renderEnquiryList();
        }
    }
});
