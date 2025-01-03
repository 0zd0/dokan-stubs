#!/usr/bin/env bash
#
# Generate dokan stubs from the source directory.
#

HEADER=$'/**\n * Generated stub declarations for dokan.\n * @see https://dokan.co\n * @see https://github.com/0zd0/dokan-stubs\n */'

FILE="dokan-stubs.php"
DIR=$(dirname "$0")

IGNORE_HOOKS=(
"dokan_withdraw_request_' . dokan()->withdraw->get_status_name(\$this->get_status())"
"dokan_rest_insert_{\$this->post_type}_object"
"dokan_rest_delete_{\$this->post_type}_object"
"dokan_rest_prepare_{\$this->post_type}_object"
"dokan_rest_pre_insert_{\$this->post_type}_object"
"dokan_rest_' . \$group_id . '_settings_after_update"
"dokan_rest_pre_{\$this->base}_send_email"
"dokan_rest_{\$this->post_type}_object_query"
"\$this->identifier . '_cron_interval"
"dokan_{\$this->base}_send_email_response"
"woocommerce_rest_pre_insert_{\$this->post_type}_object"
"dokan_{\$this->get_section_id()}_product_section_title"
"dokan_count_posts_' . \$stock_type"
"dokan_pointer_' . \$this->screen_id"
"\$tag"
"dokan_vendor_rest_settings_for' . \$group_id . '_page"
"woocommerce_process_product_meta_' . \$product_type"
"woocommerce_order_item_' . \$item['type'] . '_html"
"dokan_{\$this->get_section_id()}_product_section_item_count"
)
IGNORE_HOOKS_STRING=$(IFS=,; echo "${IGNORE_HOOKS[*]}")

set -e

test -f "$FILE" || touch "$FILE"
test -d "source/dokan-lite"

"$DIR/vendor/bin/generate-hooks" \
    --input=source/dokan-lite \
    --input=source/overrides \
    --output=hooks \
    --ignore-hooks="$IGNORE_HOOKS_STRING"

"$DIR/vendor/bin/generate-stubs" \
    --force \
    --finder=finder.php \
    --header="$HEADER" \
    --functions \
    --classes \
    --interfaces \
    --traits \
    --constants \
    --out="$FILE"
