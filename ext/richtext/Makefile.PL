#############################################################################
## Name:        ext/richtext/Makefile.PL
## Purpose:     Makefile.PL for wxRichTextCtrl
## Author:      Mattia Barbon
## Modified by:
## Created:     05/11/2006
## RCS-ID:      $Id: Makefile.PL 2927 2010-06-06 08:06:10Z mbarbon $
## Copyright:   (c) 2006, 2010 Mattia Barbon
## Licence:     This program is free software; you can redistribute it and/or
##              modify it under the same terms as Perl itself
#############################################################################

use strict;

use Config;
use lib '../../build';
use Wx::build::MakeMaker;

wxWriteMakefile( NAME         => 'Wx::RichText',
                 VERSION_FROM => 'lib/Wx/RichText.pm',
                 REQUIRE_WX   => 2.007000,
                 WX_CORE_LIB  => 'richtext html adv core base',
                 );
