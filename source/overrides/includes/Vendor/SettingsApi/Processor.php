<?php

do_action( "dokan_rest_{$group_id}_settings_after_update", $vendor, $settings );

apply_filters( "dokan_vendor_rest_settings_for{$group_id}_page", [] );
