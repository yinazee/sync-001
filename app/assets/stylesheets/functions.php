<?php
add_action( 'wp_enqueue_scripts', 'blue_construction_theme_css',20);
function blue_construction_theme_css() {
	wp_enqueue_style( 'blue-construction-parent-style', get_template_directory_uri() . '/style.css' );
    wp_enqueue_style( 'blue-construction-blue-style',get_stylesheet_directory_uri() . '/blue.css');

}
