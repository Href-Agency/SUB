<?php

namespace modules\filters;

use Craft;
use yii\base\Module as BaseModule;

/**
 * filters module
 *
 * @method static Module getInstance()
 */
class Module extends BaseModule
{
    public function init(): void
    {
        Craft::setAlias('@modules/filters', __DIR__);

        // Set the controllerNamespace based on whether this is a console or web request
        if (Craft::$app->request->isConsoleRequest) {
            $this->controllerNamespace = 'modules\\filters\\console\\controllers';
        } else {
            $this->controllerNamespace = 'modules\\filters\\controllers';
        }

        parent::init();

        $this->attachEventHandlers();

        // Any code that creates an element query or loads Twig should be deferred until
        // after Craft is fully initialized, to avoid conflicts with other plugins/modules
        Craft::$app->onInit(function() {
            // ...
        });
    }

    private function attachEventHandlers(): void
    {
        // Register event handlers here ...
        // (see https://craftcms.com/docs/5.x/extend/events.html to get started)
    }
}
