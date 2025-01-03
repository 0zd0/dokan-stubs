<?php

/**
 * Fires after a single object is created or updated via the REST API.
 *
 * @param WC_Data         $object    Inserted object.
 * @param WP_REST_Request $request   Request object.
 * @param boolean         $creating  True when creating object, false when updating.
 */
do_action( "dokan_rest_insert_{$post_type}_object", $object, $request, true );

do_action( "dokan_rest_delete_{$post_type}_object", $object, $response, $request );

/**
 * Filter the query arguments for a request.
 *
 * Enables adding extra arguments or setting defaults for a post
 * collection request.
 *
 * @param array           $args    Key value array of query var to query value.
 * @param WP_REST_Request $request The request used.
 */
$args = apply_filters( "dokan_rest_{$post_type}_object_query", $args, $request );
