/////////////////////////////////////////////////////////////////////////////
// Name:        ext/xrc/XRC.xs
// Purpose:     XS for wxWidgets XML Resources
// Author:      Mattia Barbon
// Modified by:
// Created:     27/07/2001
// RCS-ID:      $Id: XRC.xs 2331 2008-01-20 10:20:17Z mbarbon $
// Copyright:   (c) 2001-2004, 2006, 2008 Mattia Barbon
// Licence:     This program is free software; you can redistribute it and/or
//              modify it under the same terms as Perl itself
/////////////////////////////////////////////////////////////////////////////

#define PERL_NO_GET_CONTEXT

#include "cpp/wxapi.h"
#include "cpp/xr_constants.cpp"

#undef THIS

MODULE=Wx__XRC

BOOT:
  INIT_PLI_HELPERS( wx_pli_helpers );

INCLUDE: XS/XmlResource.xs

INCLUDE: perl ../../script/wxperl_xspp -t ../../typemap.xsp XS/XmlSubclassFactory.xsp |

INCLUDE: perl ../../script/wxperl_xspp -t ../../typemap.xsp XS/XmlDocument.xsp |

INCLUDE: perl ../../script/wxperl_xspp -t ../../typemap.xsp XS/XmlNode.xsp |

INCLUDE: perl ../../script/wxperl_xspp -t ../../typemap.xsp XS/XmlResourceHandler.xsp |

MODULE=Wx__XRC PACKAGE=Wx PREFIX=wx

void
wxXmlInitXmlModule()
  CODE:
    // nothing here

void
wxXmlInitResourceModule()

#include "cpp/overload.h"
#include "cpp/ovl_const.cpp"

#  //FIXME//tricky
#if defined(__WXMSW__)
#undef XS
#define XS( name ) WXXS( name )
#endif

MODULE=Wx__XRC
