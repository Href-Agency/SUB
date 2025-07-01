import '../sass/app.scss';
import $ from 'jquery';
import AOS from 'aos';
import Swiper from 'swiper/bundle';
import { gsap } from "gsap";
    
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
                console.log('click');
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
                    }, 800);
                }
            }, 300);
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
                // Update enquiry buttons on product cards
                $('.enquiry-button').each((index, element) => {
                    const $button = $(element);
                    const $productCard = $button.closest('.product-card');
                    const productId = $productCard.data('product-id');
                    
                    if (this.enquiries[productId]) {
                        $button.addClass('in-enquiry');
                        $button.find('span:first').text('REMOVE FROM ENQUIRY LIST');
                    } else {
                        $button.removeClass('in-enquiry');
                        $button.find('span:first').text('ADD TO ENQUIRY LIST');
                    }
                });

                // Update enquiry count in navigation
                this.updateCount();

                // Update equipment list page if we're on it
                if (window.location.pathname === '/enquiry-list') {
                    this.updateEquipmentListPage();
                }
            }

            // Update count in navigation
            updateCount() {
                const count = this.getCount();
                $('[data-enquiry-count]').text(count);
            }

            // Update equipment list page content
            updateEquipmentListPage() {
                const $enquiryItemsList = $('.enquiry-items-list');
                const $emptyState = $('.empty-state');
                const $enquiryActions = $('.enquiry-actions');
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
                // Handle enquiry button clicks on product cards
                $(document).on('click', '.enquiry-button', (e) => {
                    e.preventDefault();
                    e.stopPropagation();
                    
                    const $button = $(e.currentTarget);
                    const $productCard = $button.closest('.product-card');
                    const productId = $productCard.data('product-id');
                    
                    // Get product data for storage
                    const productData = {
                        title: $productCard.find('.product-title').text().trim(),
                        reference: $productCard.find('.product-reference').text().trim(),
                        image: $productCard.find('.product-image img').attr('src'),
                        url: $productCard.find('.product-image a').attr('href')
                    };

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
                $(document).on('click', '#clear-all-enquiries', (e) => {
                    e.preventDefault();
                    if (confirm('Are you sure you want to clear all items from your enquiry list?')) {
                        this.clearAllEnquiries();
                        $('.enquiry-item').fadeOut(300, function() {
                            $(this).remove();
                        });
                    }
                });

                // Initialize UI on page load
                this.updateUI();
            }
        }

        // Create global enquiry manager instance
        enquiryManager = new EnquiryManager();
    })();

    function renderEnquiryListFromCookie() {
        const container = document.getElementById('enquiry-items-list');
        const actions = document.querySelector('.enquiry-actions');
        const emptyState = document.querySelector('.empty-state');
        container.innerHTML = '';

        // Get and parse the cookie
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
            actions.style.display = 'none';
            emptyState.style.display = '';
            return;
        }

        actions.style.display = '';
        emptyState.style.display = 'none';

        ids.forEach(productId => {
            const product = enquiries[productId];
            const item = document.createElement('div');
            item.className = 'enquiry-item';
            item.setAttribute('data-product-id', productId);
            item.innerHTML = `
                <div class="item-image">
                    <img src="${product.image}" alt="${product.title}">
                </div>
                <div class="item-details">
                    <h3 class="item-title">${product.title}</h3>
                    <p class="item-reference">Item Reference: ${product.reference}</p>
                    <a href="${product.url}" class="view-details-link">View Details</a>
                </div>
                <div class="item-actions">
                    <button class="remove-item-btn" data-product-id="${productId}">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16">
                            <path d="M8,16A8,8,0,1,1,16,8,8,8,0,0,1,8,16ZM8,2A6,6,0,1,0,14,8,6,6,0,0,0,8,2ZM11,7H5V9H11Z"/>
                        </svg>
                        Remove
                    </button>
                </div>
            `;
            container.appendChild(item);
        });
    }

    // Call this on page load and after any add/remove/clear
    document.addEventListener('DOMContentLoaded', renderEnquiryListFromCookie);

    // Also re-call after removing or clearing items
    document.addEventListener('click', function(e) {
        if (e.target.closest('.remove-item-btn')) {
            const productId = e.target.closest('.remove-item-btn').getAttribute('data-product-id');
            // Remove from cookie
            const cookie = document.cookie.split('; ').find(row => row.startsWith('enquiries='));
            let enquiries = {};
            if (cookie) {
                try {
                    enquiries = JSON.parse(decodeURIComponent(cookie.split('=')[1]));
                } catch (e) {}
            }
            delete enquiries[productId];
            document.cookie = 'enquiries=' + encodeURIComponent(JSON.stringify(enquiries)) + ';path=/;SameSite=Lax';
            renderEnquiryListFromCookie();
        }
        if (e.target.id === 'clear-all-enquiries') {
            document.cookie = 'enquiries={};path=/;SameSite=Lax';
            renderEnquiryListFromCookie();
        }
    });

});
