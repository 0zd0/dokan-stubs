<?php

/**
 * Action based on withdraw status
 *
 * @since 3.0.0
 *
 * @param \WeDevs\Dokan\Withdraw\Withdraw $this
 */
do_action( "dokan_withdraw_request_{$withdraw_status_name}", $this );
