<?php

/**
 * File containing the ezcDocumentDocbookElementVisitorConverter class
 *
 * @package Document
 * @version //autogen//
 * @copyright Copyright (C) 2005-2008 eZ systems as. All rights reserved.
 * @license http://ez.no/licenses/new_bsd New BSD License
 */

/**
 * Visit inline media objects
 *
 * Inline media objects are all kind of other media types, embedded in
 * paragraphs, like images.
 * 
 * @package Document
 * @version //autogen//
 */
class ezcDocumentDocbookToWikiInlineMediaObjectHandler extends ezcDocumentDocbookToWikiMediaObjectHandler
{
    /**
     * Handle a node
     *
     * Handle / transform a given node, and return the result of the
     * conversion.
     * 
     * @param ezcDocumentDocbookElementVisitorConverter $converter 
     * @param DOMElement $node 
     * @param mixed $root 
     * @return mixed
     */
    public function handle( ezcDocumentDocbookElementVisitorConverter $converter, DOMElement $node, $root )
    {
        $image = $this->getImageParameters( $converter, $node );

        if ( isset( $image['alt'] ) || isset( $image['text'] ) )
        {
            $root .= sprintf( '{{%s|%s}}',
                $image['resource'],
                isset( $image['text'] ) ? $image['text'] : $image['alt']
            );
        }
        else
        {
            $root .= sprintf( '{{%s}}', $image['resource'] );
        }
        
        return $root;
    }
}

?>