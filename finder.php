<?php
declare(strict_types=1);

use StubsGenerator\Finder;

return Finder::create()
    ->in('source/dokan-lite')
    ->in('source/overrides')
	->notPath('source/dokan-lite/lib/packages')
	->notPath('source/dokan-lite/vendor')
    ->sortByName(true);
