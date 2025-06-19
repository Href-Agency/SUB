import '../sass/app.scss';
import $ from 'jquery';
import AOS from 'aos';
import Swiper from 'swiper/bundle';
import { gsap } from "gsap";
    
import { ScrollTrigger } from "gsap/ScrollTrigger";
import { SplitText } from "gsap/SplitText";

gsap.registerPlugin(ScrollTrigger,SplitText);


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

        burger.on('click', function() {
            burger.toggleClass('is-active');
            nav.toggleClass('is-active');
            logo.toggleClass('menu-active');
            $('html,body').toggleClass('menu-active');
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

});
