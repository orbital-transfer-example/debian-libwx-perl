#############################################################################
## Name:        ext/ribbon/lib/Wx/Ribbon.pm
## Purpose:     Wx::Ribbon and related classes
## Author:      Mark Dootson
## Created:     01/03/2012
## SVN-ID:      $Id: Ribbon.pm 3184 2012-03-09 19:54:08Z mdootson $
## Copyright:   (c) 2012 Mattia Barbon
## Licence:     This program is free software; you can redistribute it and/or
##              modify it under the same terms as Perl itself
#############################################################################
BEGIN {
    package Wx::Ribbon;
    our $__wx_ribbon_present = Wx::_wx_optmod_ribbon();
}

package Wx::Ribbon;
use strict;

our $VERSION = '0.01';

our $__wx_ribbon_present;

if( $__wx_ribbon_present ) {
    Wx::load_dll( 'adv' );
    Wx::load_dll( 'ribbon' );
    Wx::wx_boot( 'Wx::Ribbon', $VERSION );
}

our @_wxribbonart_exported_constants = qw(
    wxRIBBON_ART_TAB_SEPARATION_SIZE
    wxRIBBON_ART_PAGE_BORDER_LEFT_SIZE
    wxRIBBON_ART_PAGE_BORDER_TOP_SIZE
    wxRIBBON_ART_PAGE_BORDER_RIGHT_SIZE
    wxRIBBON_ART_PAGE_BORDER_BOTTOM_SIZE
    wxRIBBON_ART_PANEL_X_SEPARATION_SIZE
    wxRIBBON_ART_PANEL_Y_SEPARATION_SIZE
    wxRIBBON_ART_TOOL_GROUP_SEPARATION_SIZE
    wxRIBBON_ART_GALLERY_BITMAP_PADDING_LEFT_SIZE
    wxRIBBON_ART_GALLERY_BITMAP_PADDING_RIGHT_SIZE
    wxRIBBON_ART_GALLERY_BITMAP_PADDING_TOP_SIZE
    wxRIBBON_ART_GALLERY_BITMAP_PADDING_BOTTOM_SIZE
    wxRIBBON_ART_PANEL_LABEL_FONT
    wxRIBBON_ART_BUTTON_BAR_LABEL_FONT
    wxRIBBON_ART_TAB_LABEL_FONT
    wxRIBBON_ART_BUTTON_BAR_LABEL_COLOUR
    wxRIBBON_ART_BUTTON_BAR_HOVER_BORDER_COLOUR
    wxRIBBON_ART_BUTTON_BAR_HOVER_BACKGROUND_TOP_COLOUR
    wxRIBBON_ART_BUTTON_BAR_HOVER_BACKGROUND_TOP_GRADIENT_COLOUR
    wxRIBBON_ART_BUTTON_BAR_HOVER_BACKGROUND_COLOUR
    wxRIBBON_ART_BUTTON_BAR_HOVER_BACKGROUND_GRADIENT_COLOUR
    wxRIBBON_ART_BUTTON_BAR_ACTIVE_BORDER_COLOUR
    wxRIBBON_ART_BUTTON_BAR_ACTIVE_BACKGROUND_TOP_COLOUR
    wxRIBBON_ART_BUTTON_BAR_ACTIVE_BACKGROUND_TOP_GRADIENT_COLOUR
    wxRIBBON_ART_BUTTON_BAR_ACTIVE_BACKGROUND_COLOUR
    wxRIBBON_ART_BUTTON_BAR_ACTIVE_BACKGROUND_GRADIENT_COLOUR
    wxRIBBON_ART_GALLERY_BORDER_COLOUR
    wxRIBBON_ART_GALLERY_HOVER_BACKGROUND_COLOUR
    wxRIBBON_ART_GALLERY_BUTTON_BACKGROUND_COLOUR
    wxRIBBON_ART_GALLERY_BUTTON_BACKGROUND_GRADIENT_COLOUR
    wxRIBBON_ART_GALLERY_BUTTON_BACKGROUND_TOP_COLOUR
    wxRIBBON_ART_GALLERY_BUTTON_FACE_COLOUR
    wxRIBBON_ART_GALLERY_BUTTON_HOVER_BACKGROUND_COLOUR
    wxRIBBON_ART_GALLERY_BUTTON_HOVER_BACKGROUND_GRADIENT_COLOUR
    wxRIBBON_ART_GALLERY_BUTTON_HOVER_BACKGROUND_TOP_COLOUR
    wxRIBBON_ART_GALLERY_BUTTON_HOVER_FACE_COLOUR
    wxRIBBON_ART_GALLERY_BUTTON_ACTIVE_BACKGROUND_COLOUR
    wxRIBBON_ART_GALLERY_BUTTON_ACTIVE_BACKGROUND_GRADIENT_COLOUR
    wxRIBBON_ART_GALLERY_BUTTON_ACTIVE_BACKGROUND_TOP_COLOUR
    wxRIBBON_ART_GALLERY_BUTTON_ACTIVE_FACE_COLOUR
    wxRIBBON_ART_GALLERY_BUTTON_DISABLED_BACKGROUND_COLOUR
    wxRIBBON_ART_GALLERY_BUTTON_DISABLED_BACKGROUND_GRADIENT_COLOUR
    wxRIBBON_ART_GALLERY_BUTTON_DISABLED_BACKGROUND_TOP_COLOUR
    wxRIBBON_ART_GALLERY_BUTTON_DISABLED_FACE_COLOUR
    wxRIBBON_ART_GALLERY_ITEM_BORDER_COLOUR
    wxRIBBON_ART_TAB_LABEL_COLOUR
    wxRIBBON_ART_TAB_SEPARATOR_COLOUR
    wxRIBBON_ART_TAB_SEPARATOR_GRADIENT_COLOUR
    wxRIBBON_ART_TAB_CTRL_BACKGROUND_COLOUR
    wxRIBBON_ART_TAB_CTRL_BACKGROUND_GRADIENT_COLOUR
    wxRIBBON_ART_TAB_HOVER_BACKGROUND_TOP_COLOUR
    wxRIBBON_ART_TAB_HOVER_BACKGROUND_TOP_GRADIENT_COLOUR
    wxRIBBON_ART_TAB_HOVER_BACKGROUND_COLOUR
    wxRIBBON_ART_TAB_HOVER_BACKGROUND_GRADIENT_COLOUR
    wxRIBBON_ART_TAB_ACTIVE_BACKGROUND_TOP_COLOUR
    wxRIBBON_ART_TAB_ACTIVE_BACKGROUND_TOP_GRADIENT_COLOUR
    wxRIBBON_ART_TAB_ACTIVE_BACKGROUND_COLOUR
    wxRIBBON_ART_TAB_ACTIVE_BACKGROUND_GRADIENT_COLOUR
    wxRIBBON_ART_TAB_BORDER_COLOUR
    wxRIBBON_ART_PANEL_BORDER_COLOUR
    wxRIBBON_ART_PANEL_BORDER_GRADIENT_COLOUR
    wxRIBBON_ART_PANEL_MINIMISED_BORDER_COLOUR
    wxRIBBON_ART_PANEL_MINIMISED_BORDER_GRADIENT_COLOUR
    wxRIBBON_ART_PANEL_LABEL_BACKGROUND_COLOUR
    wxRIBBON_ART_PANEL_LABEL_BACKGROUND_GRADIENT_COLOUR
    wxRIBBON_ART_PANEL_LABEL_COLOUR
    wxRIBBON_ART_PANEL_HOVER_LABEL_BACKGROUND_COLOUR
    wxRIBBON_ART_PANEL_HOVER_LABEL_BACKGROUND_GRADIENT_COLOUR
    wxRIBBON_ART_PANEL_HOVER_LABEL_COLOUR
    wxRIBBON_ART_PANEL_MINIMISED_LABEL_COLOUR
    wxRIBBON_ART_PANEL_ACTIVE_BACKGROUND_TOP_COLOUR
    wxRIBBON_ART_PANEL_ACTIVE_BACKGROUND_TOP_GRADIENT_COLOUR
    wxRIBBON_ART_PANEL_ACTIVE_BACKGROUND_COLOUR
    wxRIBBON_ART_PANEL_ACTIVE_BACKGROUND_GRADIENT_COLOUR
    wxRIBBON_ART_PAGE_BORDER_COLOUR
    wxRIBBON_ART_PAGE_BACKGROUND_TOP_COLOUR
    wxRIBBON_ART_PAGE_BACKGROUND_TOP_GRADIENT_COLOUR
    wxRIBBON_ART_PAGE_BACKGROUND_COLOUR
    wxRIBBON_ART_PAGE_BACKGROUND_GRADIENT_COLOUR
    wxRIBBON_ART_PAGE_HOVER_BACKGROUND_TOP_COLOUR
    wxRIBBON_ART_PAGE_HOVER_BACKGROUND_TOP_GRADIENT_COLOUR
    wxRIBBON_ART_PAGE_HOVER_BACKGROUND_COLOUR
    wxRIBBON_ART_PAGE_HOVER_BACKGROUND_GRADIENT_COLOUR
    wxRIBBON_ART_TOOLBAR_BORDER_COLOUR
    wxRIBBON_ART_TOOLBAR_HOVER_BORDER_COLOUR
    wxRIBBON_ART_TOOLBAR_FACE_COLOUR
    wxRIBBON_ART_TOOL_BACKGROUND_TOP_COLOUR
    wxRIBBON_ART_TOOL_BACKGROUND_TOP_GRADIENT_COLOUR
    wxRIBBON_ART_TOOL_BACKGROUND_COLOUR
    wxRIBBON_ART_TOOL_BACKGROUND_GRADIENT_COLOUR
    wxRIBBON_ART_TOOL_HOVER_BACKGROUND_TOP_COLOUR
    wxRIBBON_ART_TOOL_HOVER_BACKGROUND_TOP_GRADIENT_COLOUR
    wxRIBBON_ART_TOOL_HOVER_BACKGROUND_COLOUR
    wxRIBBON_ART_TOOL_HOVER_BACKGROUND_GRADIENT_COLOUR
    wxRIBBON_ART_TOOL_ACTIVE_BACKGROUND_TOP_COLOUR
    wxRIBBON_ART_TOOL_ACTIVE_BACKGROUND_TOP_GRADIENT_COLOUR
    wxRIBBON_ART_TOOL_ACTIVE_BACKGROUND_COLOUR
    wxRIBBON_ART_TOOL_ACTIVE_BACKGROUND_GRADIENT_COLOUR
);

if( $__wx_ribbon_present ) {
    push @Wx::EXPORT_OK, @_wxribbonart_exported_constants;
    $Wx::EXPORT_TAGS{'ribbonart'} = [ @_wxribbonart_exported_constants ];
}

#
# properly setup inheritance tree
#

no strict;

package Wx::RibbonArtProvider;
package Wx::RibbonMSWArtProvider; @ISA = qw( Wx::RibbonArtProvider );
package Wx::RibbonAUIArtProvider; @ISA = qw( Wx::RibbonMSWArtProvider );
package Wx::RibbonDefaultArtProvider; @ISA = ( Wx::wxMSW() ) ? qw( Wx::RibbonMSWArtProvider ) : qw( Wx::RibbonAUIArtProvider ) ;

1;
