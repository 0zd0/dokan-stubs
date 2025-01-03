<?php

/**
 * Fires before sending email to vendor via the REST API.
 *
 * @param WP_REST_Request $request Request object.
 * @param boolean $creating True when creating object, false when updating.
 *
 * @since  2.9.23
 */
do_action( "dokan_rest_pre_{$base}_send_email", $request, true );

apply_filters(
    "dokan_{$base}_send_email_response", [
        'store_id'       => $vendor->get_id(),
        'data'           => __( 'Email sent successfully!', 'dokan-lite' ),
        'sender_name'    => $sender_name,
        'sender_email'   => $sender_email,
        'sender_message' => $sender_message,
    ]
);
