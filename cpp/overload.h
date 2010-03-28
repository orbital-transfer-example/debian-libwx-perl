/////////////////////////////////////////////////////////////////////////////
// Name:        cpp/overload.h
// Purpose:     C++ code to redispatch a function based on function argument
//              types
// Author:      Mattia Barbon
// Modified by:
// Created:     11/08/2002
// RCS-ID:      $Id: overload.h 2788 2010-02-09 03:06:59Z mdootson $
// Copyright:   (c) 2002, 2004, 2006-2007, 2010 Mattia Barbon
// Licence:     This program is free software; you can redistribute it and/or
//              modify it under the same terms as Perl itself
/////////////////////////////////////////////////////////////////////////////

#include "cpp/ovl_const.h"

#define BEGIN_OVERLOAD() \
    PUSHMARK(MARK); \
    int count; \
    if( false );

#define END_OVERLOAD( FUNCTION ) \
    else \
    { \
        static const char msg[] = "unable to resolve overloaded method for "; \
        require_pv( "Carp" ); \
        const char* argv[3]; argv[0] = msg; argv[1] = #FUNCTION; argv[2] = 0; \
        call_argv( "Carp::croak", G_VOID|G_DISCARD, (char**) argv ); \
    } \
    /* POPMARK; */

#define REDISPATCH( NEW_METHOD_NAME ) \
    count = call_method( #NEW_METHOD_NAME, GIMME_V ); SPAGAIN

#define REDISPATCH_FUNCTION( NEW_METHOD_NAME ) \
    count = call_pv( #NEW_METHOD_NAME, GIMME_V ); SPAGAIN

#define MATCH_VOIDM_REDISP( METHOD ) \
    else if( items == 1 )           \
        { REDISPATCH( METHOD ); }

#define MATCH_ANY_REDISP( METHOD ) \
    else if( true )               \
        { REDISPATCH( METHOD ); }

#define MATCH_REDISP( PROTO, METHOD ) \
    else if( wxPli_match_arguments_skipfirst( aTHX_ PROTO,  \
                                              -1, false ) ) \
        { REDISPATCH( METHOD ); }

#define MATCH_REDISP_COUNT( PROTO, METHOD, REQUIRED ) \
    else if( wxPli_match_arguments_skipfirst( aTHX_ PROTO,       \
                                              REQUIRED, false ) ) \
        { REDISPATCH( METHOD ); }

#define MATCH_REDISP_COUNT_ALLOWMORE( PROTO, METHOD, REQUIRED ) \
    else if( wxPli_match_arguments_skipfirst( aTHX_ PROTO,       \
                                              REQUIRED, true ) ) \
        { REDISPATCH( METHOD ); }

/* used for overloading static functions, see GraphicsContext.xs for an example */
#define MATCH_REDISP_FUNCTION( PROTO, METHOD ) \
    else if( wxPli_match_arguments( aTHX_ PROTO,  \
                                    -1, false ) ) \
        { REDISPATCH_FUNCTION( METHOD );  }

#define MATCH_REDISP_COUNT_FUNCTION( PROTO, METHOD, REQUIRED ) \
    else if( wxPli_match_arguments( aTHX_ PROTO,        \
                                    REQUIRED, false ) ) \
        { REDISPATCH_FUNCTION( METHOD ); }

#define MATCH_REDISP_COUNT_ALLOWMORE_FUNCTION( PROTO, METHOD, REQUIRED ) \
    else if( wxPli_match_arguments( aTHX_ PROTO,       \
                                    REQUIRED, true ) ) \
        { REDISPATCH_FUNCTION( METHOD ); }

#define MATCH_VOIDM_REDISP_FUNCTION( METHOD ) \
    else if( items == 0 ) \
        { REDISPATCH_FUNCTION( METHOD ); }
