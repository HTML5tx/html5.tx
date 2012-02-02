<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" <?php language_attributes(); ?>>

<head profile="http://gmpg.org/xfn/11">
	
	<meta http-equiv="Content-Type" content="<?php bloginfo('html_type'); ?>; charset=<?php bloginfo('charset'); ?>" />
	<link href="/wp-content/themes/HTML5TX/css/html5reset.css" rel="stylesheet" type="text/css" />
	
	<?php if (is_search()) { ?>
	   <meta name="robots" content="index, follow" /> 
	<?php } ?>

	<title>
		   HTML5tx.com :: 100% Pure
	</title>
	<meta name="description" content="A premium grade conference for all things HTML, CSS and Javascript. Join us in 
Austin, TX on October 8, 2011 for the future of the web." />
	<meta name="keywords" content="HTML, HTML5, CSS, Javascript, tech, conference, event, Austin, TX, Texas" />
	<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" href="<?php bloginfo('stylesheet_url'); ?>" type="text/css" />

	<script type="text/javascript">
		document.createElement('header');
		document.createElement('article');
	</script>

	
		<!--[if IE]><link rel="stylesheet" href="wp-content/themes/#/css/ie.css" type="text/css" /><![endif]-->

	<link rel="pingback" href="<?php bloginfo('pingback_url'); ?>" />

	<?php if ( is_singular() ) wp_enqueue_script( 'comment-reply' ); ?>

	<?php wp_head(); ?>
	<script type="text/javascript" src="/wp-content/themes/HTML5TX/js/sizing.js"></script>
</head>

<body <?php body_class(); ?>>
	
	<div id="page-wrap">

		<div id="mainHeader">
			<header>
				<div id="topline">
					<a id="top"></a>
					<div><img src="/wp-content/themes/HTML5TX/images/stars.png" alt="stars" /></div>
					<div id="toplineLeft">MADE IN</div>
					<div><img src="/wp-content/themes/HTML5TX/images/shield.png" id="shield" alt="HTML5 Shield" /></div>
					<div id="toplineRight">TEXAS</div>                
					<div><img src="/wp-content/themes/HTML5TX/images/stars.png" alt="stars" /></div>
				</div>
			</header>
		</div>

<?php include 'main.php'; ?>