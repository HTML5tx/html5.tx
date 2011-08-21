<?php
/**
 * @package Sixhours
 */
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" <?php language_attributes(); ?>>

<head profile="http://gmpg.org/xfn/11">
<meta http-equiv="Content-Type" content="<?php bloginfo('html_type'); ?>; charset=<?php bloginfo('charset'); ?>" />

<title><?php wp_title('&laquo;', true, 'right'); ?> <?php bloginfo('name'); ?></title>

<link rel="stylesheet" href="<?php bloginfo('stylesheet_url'); ?>" type="text/css" media="screen" />
<link rel="pingback" href="<?php bloginfo('pingback_url'); ?>" />

<?php if ( is_singular() && get_option( 'thread_comments' ) ) wp_enqueue_script( 'comment-reply' ); ?>

<?php wp_head(); ?>
</head>
<body <?php body_class(); ?>>

<div class="wrapper">
	<div class="header">
    	<div class="title"><?php bloginfo('name'); ?></div>
  	</div>
  	<div class="tabmenu">
      	<?php 
      		$menu = has_nav_menu('tabmenu');
      		if ( $menu ) { 
      			wp_nav_menu( array( 'theme_location' => 'tabmenu', 'depth' => '1' ) ); 
      		} ?>
  	</div>
  	<div class="tagline"><?php bloginfo('description'); ?></div>
  	