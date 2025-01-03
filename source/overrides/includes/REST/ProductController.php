<?php

/**
 * Filters an object before it is inserted via the REST API.
 *
 * The dynamic portion of the hook name, `$this->post_type`,
 * refers to the object type slug.
 *
 * @param WC_Data $product Object object.
 * @param WP_REST_Request $request Request object.
 * @param bool $creating If is creating a new object.
 */
return apply_filters( "woocommerce_rest_pre_insert_{$post_type}_object", $product, $request, $creating );
