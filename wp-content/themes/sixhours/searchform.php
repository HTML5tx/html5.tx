<?php
/**
 * @package Sixhours
 */
?>

<form method="get" id="searchform" action="<?php echo esc_url( home_url( '/' ) ); ?>">
	<label for="s" class="assistive-text">Search:</label>
	<input type="text" class="field" name="s" id="s" size="12" />
	<input type="submit" class="submit" name="submit" id="searchsubmit" value="<?php esc_attr_e( 'Go' ); ?>" />
</form>
