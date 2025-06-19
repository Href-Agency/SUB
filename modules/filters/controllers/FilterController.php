<?php
namespace modules\filters\controllers;

use craft\web\Controller;
use craft\elements\Entry;
use Craft;


class FilterController extends Controller
{
    protected array|bool|int $allowAnonymous = true;

    public function actionEcho()
    {
        return $this->asJson(['ping' => 'Pong!']);
    }


    // filter query function - Returns html for cards of posts that have the category of categoryId
    public function actionQuery(?string $categoryId = null, ?string $section = 'blog')
    {
        // Validate section parameter
        if (!in_array($section, ['blog', 'projects'])) {
            return $this->asJson([
                'success' => false,
                'error' => 'Invalid section specified'
            ]);
        }

        // Build the entry query for the specified section
        $query = Entry::find()
            ->section($section)
            ->status('live');
        
        // If category_id is provided, filter by it
        if ($categoryId && $categoryId !== 'all') {
            $query->relatedTo(intval($categoryId));
        }
        
        // Execute the query and get all entries
        $entries = $query->all();
        
        // Determine which template to use based on section
        $template = $section === 'blog' ? '_partials/components/_newsCard' : '_partials/components/_projectCard';
        
        // Render the HTML using the appropriate Twig template
        $html = '';
        foreach ($entries as $entry) {
            $html .= Craft::$app->getView()->renderTemplate($template, [
                $section === 'blog' ? 'newsEntry' : 'projectEntry' => $entry,
                'isCarousel' => false
            ]);
        }
        
        return $this->asJson([
            'success' => true,
            'count' => count($entries),
            'html' => $html
        ]);
    }
}
