<?php
/**
 * File containing the ezcDocumentPdfStyleMeasureValue class
 *
 * @package Document
 * @version //autogen//
 * @copyright Copyright (C) 2005-2009 eZ Systems AS. All rights reserved.
 * @license http://ez.no/licenses/new_bsd New BSD License
 * @access private
 */

/**
 * Style directive measure value representation
 *
 * @package Document
 * @access private
 * @version //autogen//
 */
class ezcDocumentPdfStyleMeasureValue extends ezcDocumentPdfStyleValue
{
    /**
     * Construct value handler from string representation
     *
     * @param mixed $value
     * @return void
     */
    public function __construct( $value )
    {
        $this->value = ezcDocumentPdfMeasure::create( $value )->get();
    }

    /**
     * Convert value to string
     *
     * @return string
     */
    public function __toString()
    {
        return sprintf( '%.2Fmm', $this->value );
    }
}

?>
