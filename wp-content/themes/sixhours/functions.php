<?php
/**
 * @package Sixhours
 */

register_sidebar(array(
	'id' => 'right-sidebar',
	'name' => 'Right Sidebar',
	'before_widget' => '<li id="%1$s" class="widget %2$s">',
	'after_widget' => '</li>',
	'before_title' => '<h2 class="widgettitle">',
	'after_title' => '</h2>',
));

if ( function_exists( 'register_nav_menu' ) ) {
	register_nav_menu( 'tabmenu', 'Tabbed Navigation Menu' );
}
 
if ( ! isset( $content_width ) ) $content_width = 600;

add_theme_support('automatic-feed-links');

add_editor_style();

add_custom_background();

?>
