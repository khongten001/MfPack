// FactoryX
//
// Copyright: � FactoryX. All rights reserved.
//
// Project: MfPack - MediaFoundation
// Project location: https://sourceforge.net/projects/MFPack
//                   https://github.com/FactoryXCode/MfPack
// Module: WinApi.MediaFoundationApi.MfError.pas
// Kind: Pascal / Delphi unit
// Release date: 29-06-2012
// Language: ENU
//
// Revision Version: 3.0.2
// Description: Definitions for MediaFoundation events.
//
// Organisation: FactoryX
// Initiator(s): Tony (maXcomX), Peter (OzShips)
// Contributor(s): Tony Kalf (maXcomX), Peter Larson (ozships), (TopPlay)
//
//------------------------------------------------------------------------------
// CHANGE LOG
// Date       Person              Reason
// ---------- ------------------- ----------------------------------------------
// 13/08/2020 All                 Enigma release. New layout and namespaces
// 28/09/2021 All                 Updated to 10.0.20348.0
//------------------------------------------------------------------------------
//
// Remarks: Requires Windows Vista or later.
//
// Related objects: -
// Related projects: MfPackX302
// Known Issues: -
//
// Compiler version: 23 up to 34
// SDK version: 10.0.20348.0
//
// Todo: -
//
//==============================================================================
// Source: mferror.h
//
// Copyright (c) Microsoft Corporation. All rights reserved.
//==============================================================================
//
// LICENSE
//
// The contents of this file are subject to the Mozilla Public License
// Version 2.0 (the "License"); you may not use this file except in
// compliance with the License. You may obtain a copy of the License at
// https://www.mozilla.org/en-US/MPL/2.0/
//
// Software distributed under the License is distributed on an "AS IS"
// basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See the
// License for the specific language governing rights and limitations
// under the License.
//
// Users may distribute this source code provided that this header is included
// in full at the top of the file.
//==============================================================================
unit WinApi.MediaFoundationApi.MfError;

  {$HPPEMIT '#include "MfError.h"'}

interface


// Microsoft Windows Media Foundation
// Copyright (C) Microsoft Corporation. All rights reserved.
//
// Module Name:
//
//     mferror.mc
//
// Abstract:
//
//     Definitions for MediaFoundation events.
//
// Author:
//
//
// Revision History:
//
// Notes:
//
//     This file is used by the MC tool (Message Compiler (MC.exe)) to generate
//     the mferror.h file
//
// **************************** READ ME ****************************************
//
//  Here are the commented error ranges for the Windows Media Technologies Group
//
//
//  RANGES
//
//  14000 - 14999 = General Media Foundation errors
//
//  15000 - 15999 = ASF parsing errors
//
//  16000 - 16999 = Media Source errors
//
//  17000 - 17999 = MEDIAFOUNDATION Network Error Events
//
//  18000 - 18999 = MEDIAFOUNDATION WMContainer Error Events
//
//  19000 - 19999 = MEDIAFOUNDATION Media Sink Error Events
//
//  20000 - 20999 = Renderer errors
//
//  21000 - 21999 = Topology Errors
//
//  25000 - 25999 = Timeline Errors
//
//  26000 - 26999 = Unused
//
//  28000 - 28999 = Transform errors
//
//  29000 - 29999 = Content Protection errors
//
//  40000 - 40999 = Clock errors
//
//  41000 - 41999 = MF Quality Management Errors
//
//  42000 - 42999 = MF Transcode API Errors
//
//  43000 - 43999 = MF HW Device Proxy errors
//
//  44000 - 44999 = MF Capture Engine errors
//
//  45000 - 45999 = MF Media Timeline Controller errors
//
//  46000 - 46999 = MediaExtensions via AppService errors
//
// **************************** READ ME ****************************************

uses
  {WinApi}
  WinApi.WinApiTypes;

  {$WEAKPACKAGEUNIT ON}


//_MFERROR_H                            = true;


//  STATUS_SEVERITY                       = (hr)(((hr)>>30)&$3);
  function STATUS_SEVERITY(hr: HRESULT): LongWord;
  {$EXTERNALSYM STATUS_SEVERITY}


type
  _HRESULT_TYPEDEF_                     = LongInt; // DWORD;
  {$EXTERNALSYM _HRESULT_TYPEDEF_}

//  _HRESULT_TYPEDEF_                     = (_sc)((HRESULT)_sc);
//## Error: Line: 72, Param: 11. "_HRESULT_TYPEDEF_" already defined

const

/////////////////////////////////////////////////////////////////////////
//
// MEDIAFOUNDATION Success Events
//
/////////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////////
//
// MEDIAFOUNDATION Warning Events
//
/////////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////////
//
// MEDIAFOUNDATION Error Events
//
/////////////////////////////////////////////////////////////////////////

//
//  Values are 32 bit values laid out as follows:
//
//   3 3 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1 1 1 1 1 1
//   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
//  +---+-+-+-----------------------+-------------------------------+
//  |Sev|C|R|     Facility          |               Code            |
//  +---+-+-+-----------------------+-------------------------------+
//
//  where
//
//      Sev - is the severity code
//
//          00 - Success
//          01 - Informational
//          10 - Warning
//          11 - Error
//
//      C - is the Customer code flag
//
//      R - is a reserved bit
//
//      Facility - is the facility code
//
//      Code - is the facility's status code
//
//
// Define the facility codes
//
  FACILITY_MF                           = $D;
  {$EXTERNALSYM FACILITY_MF}
  FACILITY_MF_WIN32                     = $7;
  {$EXTERNALSYM FACILITY_MF_WIN32}

//
// Define the severity codes
//
  STATUS_SEVERITY_SUCCESS               = $0;
  {$EXTERNALSYM STATUS_SEVERITY_SUCCESS}
  STATUS_SEVERITY_INFORMATIONAL         = $1;
  {$EXTERNALSYM STATUS_SEVERITY_INFORMATIONAL}
  STATUS_SEVERITY_WARNING               = $2;
  {$EXTERNALSYM STATUS_SEVERITY_WARNING}
  STATUS_SEVERITY_ERROR                 = $3;
  {$EXTERNALSYM STATUS_SEVERITY_ERROR}


//
// MessageId: MF_E_PLATFORM_NOT_INITIALIZED
//
// MessageText:
//
// Platform not initialized. Please call MFStartup().%0
//
  MF_E_PLATFORM_NOT_INITIALIZED         = _HRESULT_TYPEDEF_($C00D36B0);
  {$EXTERNALSYM MF_E_PLATFORM_NOT_INITIALIZED}

//
// MessageId: MF_E_BUFFERTOOSMALL
//
// MessageText:
//
// The buffer was too small to carry out the requested action.%0
//
  MF_E_BUFFERTOOSMALL                   = _HRESULT_TYPEDEF_($C00D36B1);
  {$EXTERNALSYM MF_E_BUFFERTOOSMALL}

//                  F
// MessageId: MF_E_INVALIDREQUEST
//
// MessageText:
//
// The request is invalid in the current state.%0
//
  MF_E_INVALIDREQUEST                   = _HRESULT_TYPEDEF_($C00D36B2);
  {$EXTERNALSYM MF_E_INVALIDREQUEST}

//
// MessageId: MF_E_INVALIDSTREAMNUMBER
//
// MessageText:
//
// The stream number provided was invalid.%0
//
  MF_E_INVALIDSTREAMNUMBER              = _HRESULT_TYPEDEF_($C00D36B3);
  {$EXTERNALSYM MF_E_INVALIDSTREAMNUMBER}

//
// MessageId: MF_E_INVALIDMEDIATYPE
//
// MessageText:
//
// The data specified for the media type is invalid, inconsistent, or not supported by this object.%0
//
  MF_E_INVALIDMEDIATYPE                 = _HRESULT_TYPEDEF_($C00D36B4);
  {$EXTERNALSYM MF_E_INVALIDMEDIATYPE}

//
// MessageId: MF_E_NOTACCEPTING
//
// MessageText:
//
// The caller is currently not accepting further input.%0
//
  MF_E_NOTACCEPTING                     = _HRESULT_TYPEDEF_($C00D36B5);
  {$EXTERNALSYM MF_E_NOTACCEPTING}

//
// MessageId: MF_E_NOT_INITIALIZED
//
// MessageText:
//
// This object needs to be initialized before the requested operation can be carried out.%0
//
  MF_E_NOT_INITIALIZED                  = _HRESULT_TYPEDEF_($C00D36B6);
  {$EXTERNALSYM MF_E_NOT_INITIALIZED}

//
// MessageId: MF_E_UNSUPPORTED_REPRESENTATION
//
// MessageText:
//
// The requested representation is not supported by this object.%0
//
  MF_E_UNSUPPORTED_REPRESENTATION       = _HRESULT_TYPEDEF_($C00D36B7);
  {$EXTERNALSYM MF_E_UNSUPPORTED_REPRESENTATION}

//
// MessageId: MF_E_NO_MORE_TYPES
//
// MessageText:
//
// An object ran out of media types to suggest therefore the requested chain of streaming objects cannot be completed.%0
//
  MF_E_NO_MORE_TYPES                    = _HRESULT_TYPEDEF_($C00D36B9);
  {$EXTERNALSYM MF_E_NO_MORE_TYPES}

//
// MessageId: MF_E_UNSUPPORTED_SERVICE
//
// MessageText:
//
// The object does not support the specified service.%0
//
  MF_E_UNSUPPORTED_SERVICE              = _HRESULT_TYPEDEF_($C00D36BA);
  {$EXTERNALSYM MF_E_UNSUPPORTED_SERVICE}

//
// MessageId: MF_E_UNEXPECTED
//
// MessageText:
//
// An unexpected error has occurred in the operation requested.%0
//
  MF_E_UNEXPECTED                       = _HRESULT_TYPEDEF_($C00D36BB);
  {$EXTERNALSYM MF_E_UNEXPECTED}

//
// MessageId: MF_E_INVALIDNAME
//
// MessageText:
//
// Invalid name.%0
//
  MF_E_INVALIDNAME                      = _HRESULT_TYPEDEF_($C00D36BC);
  {$EXTERNALSYM MF_E_INVALIDNAME}

//
// MessageId: MF_E_INVALIDTYPE
//
// MessageText:
//
// Invalid type.%0
//
  MF_E_INVALIDTYPE                      = _HRESULT_TYPEDEF_($C00D36BD);
  {$EXTERNALSYM MF_E_INVALIDTYPE}

//
// MessageId: MF_E_INVALID_FILE_FORMAT
//
// MessageText:
//
// The file does not conform to the relevant file format specification.
//
  MF_E_INVALID_FILE_FORMAT              = _HRESULT_TYPEDEF_($C00D36BE);
  {$EXTERNALSYM MF_E_INVALID_FILE_FORMAT}

//
// MessageId: MF_E_INVALIDINDEX
//
// MessageText:
//
// Invalid index.%0
//
  MF_E_INVALIDINDEX                     = _HRESULT_TYPEDEF_($C00D36BF);
  {$EXTERNALSYM MF_E_INVALIDINDEX}

//
// MessageId: MF_E_INVALID_TIMESTAMP
//
// MessageText:
//
// An invalid timestamp was given.%0
//
  MF_E_INVALID_TIMESTAMP                = _HRESULT_TYPEDEF_($C00D36C0);
  {$EXTERNALSYM MF_E_INVALID_TIMESTAMP}

//
// MessageId: MF_E_UNSUPPORTED_SCHEME
//
// MessageText:
//
// The scheme of the given URL is unsupported.%0
//
  MF_E_UNSUPPORTED_SCHEME               = _HRESULT_TYPEDEF_($C00D36C3);
  {$EXTERNALSYM MF_E_UNSUPPORTED_SCHEME}

//
// MessageId: MF_E_UNSUPPORTED_BYTESTREAM_TYPE
//
// MessageText:
//
// The byte stream type of the given URL is unsupported.%0
//
  MF_E_UNSUPPORTED_BYTESTREAM_TYPE      = _HRESULT_TYPEDEF_($C00D36C4);
  {$EXTERNALSYM MF_E_UNSUPPORTED_BYTESTREAM_TYPE}

//
// MessageId: MF_E_UNSUPPORTED_TIME_FORMAT
//
// MessageText:
//
// The given time format is unsupported.%0
//
  MF_E_UNSUPPORTED_TIME_FORMAT          = _HRESULT_TYPEDEF_($C00D36C5);
  {$EXTERNALSYM MF_E_UNSUPPORTED_TIME_FORMAT}

//
// MessageId: MF_E_NO_SAMPLE_TIMESTAMP
//
// MessageText:
//
// The Media Sample does not have a timestamp.%0
//
  MF_E_NO_SAMPLE_TIMESTAMP              = _HRESULT_TYPEDEF_($C00D36C8);
  {$EXTERNALSYM MF_E_NO_SAMPLE_TIMESTAMP}

//
// MessageId: MF_E_NO_SAMPLE_DURATION
//
// MessageText:
//
// The Media Sample does not have a duration.%0
//
  MF_E_NO_SAMPLE_DURATION               = _HRESULT_TYPEDEF_($C00D36C9);
  {$EXTERNALSYM MF_E_NO_SAMPLE_DURATION}

//
// MessageId: MF_E_INVALID_STREAM_DATA
//
// MessageText:
//
// The request failed because the data in the stream is corrupt.%0\n.
//
  MF_E_INVALID_STREAM_DATA              = _HRESULT_TYPEDEF_($C00D36CB);
  {$EXTERNALSYM MF_E_INVALID_STREAM_DATA}

//
// MessageId: MF_E_RT_UNAVAILABLE
//
// MessageText:
//
// Real time services are not available.%0
//
  MF_E_RT_UNAVAILABLE                   = _HRESULT_TYPEDEF_($C00D36CF);
  {$EXTERNALSYM MF_E_RT_UNAVAILABLE}

//
// MessageId: MF_E_UNSUPPORTED_RATE
//
// MessageText:
//
// The specified rate is not supported.%0
//
  MF_E_UNSUPPORTED_RATE                 = _HRESULT_TYPEDEF_($C00D36D0);
  {$EXTERNALSYM MF_E_UNSUPPORTED_RATE}

//
// MessageId: MF_E_THINNING_UNSUPPORTED
//
// MessageText:
//
// This component does not support stream-thinning.%0
//
  MF_E_THINNING_UNSUPPORTED             = _HRESULT_TYPEDEF_($C00D36D1);
  {$EXTERNALSYM MF_E_THINNING_UNSUPPORTED}

//
// MessageId: MF_E_REVERSE_UNSUPPORTED
//
// MessageText:
//
// The call failed because no reverse playback rates are available.%0
//
  MF_E_REVERSE_UNSUPPORTED              = _HRESULT_TYPEDEF_($C00D36D2);
  {$EXTERNALSYM MF_E_REVERSE_UNSUPPORTED}

//
// MessageId: MF_E_UNSUPPORTED_RATE_TRANSITION
//
// MessageText:
//
// The requested rate transition cannot occur in the current state.%0
//
  MF_E_UNSUPPORTED_RATE_TRANSITION      = _HRESULT_TYPEDEF_($C00D36D3);
  {$EXTERNALSYM MF_E_UNSUPPORTED_RATE_TRANSITION}

//
// MessageId: MF_E_RATE_CHANGE_PREEMPTED
//
// MessageText:
//
// The requested rate change has been pre-empted and will not occur.%0
//
  MF_E_RATE_CHANGE_PREEMPTED            = _HRESULT_TYPEDEF_($C00D36D4);
  {$EXTERNALSYM MF_E_RATE_CHANGE_PREEMPTED}

//
// MessageId: MF_E_NOT_FOUND
//
// MessageText:
//
// The specified object or value does not exist.%0
//
  MF_E_NOT_FOUND                        = _HRESULT_TYPEDEF_($C00D36D5);
  {$EXTERNALSYM MF_E_NOT_FOUND}

//
// MessageId: MF_E_NOT_AVAILABLE
//
// MessageText:
//
// The requested value is not available.%0
//
  MF_E_NOT_AVAILABLE                    = _HRESULT_TYPEDEF_($C00D36D6);
  {$EXTERNALSYM MF_E_NOT_AVAILABLE}

//
// MessageId: MF_E_NO_CLOCK
//
// MessageText:
//
// The specified operation requires a clock and no clock is available.%0
//
  MF_E_NO_CLOCK                         = _HRESULT_TYPEDEF_($C00D36D7);
  {$EXTERNALSYM MF_E_NO_CLOCK}

//
// MessageId: MF_S_MULTIPLE_BEGIN
//
// MessageText:
//
// This callback and state had already been passed in to this event generator earlier.%0
//
  MF_S_MULTIPLE_BEGIN                   = _HRESULT_TYPEDEF_($000D36D8);
  {$EXTERNALSYM MF_S_MULTIPLE_BEGIN}

//
// MessageId: MF_E_MULTIPLE_BEGIN
//
// MessageText:
//
// This callback has already been passed in to this event generator.%0
//
  MF_E_MULTIPLE_BEGIN                   = _HRESULT_TYPEDEF_($C00D36D9);
  {$EXTERNALSYM MF_E_MULTIPLE_BEGIN}

//
// MessageId: MF_E_MULTIPLE_SUBSCRIBERS
//
// MessageText:
//
// Some component is already listening to events on this event generator.%0
//
  MF_E_MULTIPLE_SUBSCRIBERS             = _HRESULT_TYPEDEF_($C00D36DA);
  {$EXTERNALSYM MF_E_MULTIPLE_SUBSCRIBERS}

//
// MessageId: MF_E_TIMER_ORPHANED
//
// MessageText:
//
// This timer was orphaned before its callback time arrived.%0
//
  MF_E_TIMER_ORPHANED                   = _HRESULT_TYPEDEF_($C00D36DB);
  {$EXTERNALSYM MF_E_TIMER_ORPHANED}

//
// MessageId: MF_E_STATE_TRANSITION_PENDING
//
// MessageText:
//
// A state transition is already pending.%0
//
  MF_E_STATE_TRANSITION_PENDING         = _HRESULT_TYPEDEF_($C00D36DC);
  {$EXTERNALSYM MF_E_STATE_TRANSITION_PENDING}

//
// MessageId: MF_E_UNSUPPORTED_STATE_TRANSITION
//
// MessageText:
//
// The requested state transition is unsupported.%0
//
  MF_E_UNSUPPORTED_STATE_TRANSITION     = _HRESULT_TYPEDEF_($C00D36DD);
  {$EXTERNALSYM MF_E_UNSUPPORTED_STATE_TRANSITION}

//
// MessageId: MF_E_UNRECOVERABLE_ERROR_OCCURRED
//
// MessageText:
//
// An unrecoverable error has occurred.%0
//
  MF_E_UNRECOVERABLE_ERROR_OCCURRED     = _HRESULT_TYPEDEF_($C00D36DE);
  {$EXTERNALSYM MF_E_UNRECOVERABLE_ERROR_OCCURRED}

//
// MessageId: MF_E_SAMPLE_HAS_TOO_MANY_BUFFERS
//
// MessageText:
//
// The provided sample has too many buffers.%0
//
  MF_E_SAMPLE_HAS_TOO_MANY_BUFFERS      = _HRESULT_TYPEDEF_($C00D36DF);
  {$EXTERNALSYM MF_E_SAMPLE_HAS_TOO_MANY_BUFFERS}

//
// MessageId: MF_E_SAMPLE_NOT_WRITABLE
//
// MessageText:
//
// The provided sample is not writable.%0
//
  MF_E_SAMPLE_NOT_WRITABLE              = _HRESULT_TYPEDEF_($C00D36E0);
  {$EXTERNALSYM MF_E_SAMPLE_NOT_WRITABLE}

//
// MessageId: MF_E_INVALID_KEY
//
// MessageText:
//
// The specified key is not valid.
//
  MF_E_INVALID_KEY                      = _HRESULT_TYPEDEF_($C00D36E2);
  {$EXTERNALSYM MF_E_INVALID_KEY}

//
// MessageId: MF_E_BAD_STARTUP_VERSION
//
// MessageText:
//
// You are calling MFStartup with the wrong MF_VERSION. Mismatched bits?
//
  MF_E_BAD_STARTUP_VERSION              = _HRESULT_TYPEDEF_($C00D36E3);
  {$EXTERNALSYM MF_E_BAD_STARTUP_VERSION}

//
// MessageId: MF_E_UNSUPPORTED_CAPTION
//
// MessageText:
//
// The caption of the given URL is unsupported.%0
//
  MF_E_UNSUPPORTED_CAPTION              = _HRESULT_TYPEDEF_($C00D36E4);
  {$EXTERNALSYM MF_E_UNSUPPORTED_CAPTION}

//
// MessageId: MF_E_INVALID_POSITION
//
// MessageText:
//
// The operation on the current offset is not permitted.%0
//
  MF_E_INVALID_POSITION                 = _HRESULT_TYPEDEF_($C00D36E5);
  {$EXTERNALSYM MF_E_INVALID_POSITION}

//
// MessageId: MF_E_ATTRIBUTENOTFOUND
//
// MessageText:
//
// The requested attribute was not found.%0
//
  MF_E_ATTRIBUTENOTFOUND                = _HRESULT_TYPEDEF_($C00D36E6);
  {$EXTERNALSYM MF_E_ATTRIBUTENOTFOUND}

//
// MessageId: MF_E_PROPERTY_TYPE_NOT_ALLOWED
//
// MessageText:
//
// The specified property type is not allowed in this context.%0
//
  MF_E_PROPERTY_TYPE_NOT_ALLOWED        = _HRESULT_TYPEDEF_($C00D36E7);
  {$EXTERNALSYM MF_E_PROPERTY_TYPE_NOT_ALLOWED}

//
// MessageId: MF_E_PROPERTY_TYPE_NOT_SUPPORTED
//
// MessageText:
//
// The specified property type is not supported.%0
//
  MF_E_PROPERTY_TYPE_NOT_SUPPORTED      = _HRESULT_TYPEDEF_($C00D36E8);
  {$EXTERNALSYM MF_E_PROPERTY_TYPE_NOT_SUPPORTED}

//
// MessageId: MF_E_PROPERTY_EMPTY
//
// MessageText:
//
// The specified property is empty.%0
//
  MF_E_PROPERTY_EMPTY                   = _HRESULT_TYPEDEF_($C00D36E9);
  {$EXTERNALSYM MF_E_PROPERTY_EMPTY}

//
// MessageId: MF_E_PROPERTY_NOT_EMPTY
//
// MessageText:
//
// The specified property is not empty.%0
//
  MF_E_PROPERTY_NOT_EMPTY               = _HRESULT_TYPEDEF_($C00D36EA);
  {$EXTERNALSYM MF_E_PROPERTY_NOT_EMPTY}

//
// MessageId: MF_E_PROPERTY_VECTOR_NOT_ALLOWED
//
// MessageText:
//
// The vector property specified is not allowed in this context.%0
//
  MF_E_PROPERTY_VECTOR_NOT_ALLOWED      = _HRESULT_TYPEDEF_($C00D36EB);
  {$EXTERNALSYM MF_E_PROPERTY_VECTOR_NOT_ALLOWED}

//
// MessageId: MF_E_PROPERTY_VECTOR_REQUIRED
//
// MessageText:
//
// A vector property is required in this context.%0
//
  MF_E_PROPERTY_VECTOR_REQUIRED         = _HRESULT_TYPEDEF_($C00D36EC);
  {$EXTERNALSYM MF_E_PROPERTY_VECTOR_REQUIRED}

//
// MessageId: MF_E_OPERATION_CANCELLED
//
// MessageText:
//
// The operation is cancelled.%0
//
  MF_E_OPERATION_CANCELLED              = _HRESULT_TYPEDEF_($C00D36ED);
  {$EXTERNALSYM MF_E_OPERATION_CANCELLED}

//
// MessageId: MF_E_BYTESTREAM_NOT_SEEKABLE
//
// MessageText:
//
// The provided bytestream was expected to be seekable and it is not.%0
//
  MF_E_BYTESTREAM_NOT_SEEKABLE          = _HRESULT_TYPEDEF_($C00D36EE);
  {$EXTERNALSYM MF_E_BYTESTREAM_NOT_SEEKABLE}

//
// MessageId: MF_E_DISABLED_IN_SAFEMODE
//
// MessageText:
//
// The Media Foundation platform is disabled when the system is running in Safe Mode.%0
//
  MF_E_DISABLED_IN_SAFEMODE             = _HRESULT_TYPEDEF_($C00D36EF);
  {$EXTERNALSYM MF_E_DISABLED_IN_SAFEMODE}

//
// MessageId: MF_E_CANNOT_PARSE_BYTESTREAM
//
// MessageText:
//
// The Media Source could not parse the byte stream.%0
//
  MF_E_CANNOT_PARSE_BYTESTREAM          = _HRESULT_TYPEDEF_($C00D36F0);
  {$EXTERNALSYM MF_E_CANNOT_PARSE_BYTESTREAM}

//
// MessageId: MF_E_SOURCERESOLVER_MUTUALLY_EXCLUSIVE_FLAGS
//
// MessageText:
//
// Mutually exclusive flags have been specified to source resolver. This flag combination is invalid.%0
//
  MF_E_SOURCERESOLVER_MUTUALLY_EXCLUSIVE_FLAGS = _HRESULT_TYPEDEF_($C00D36F1);
  {$EXTERNALSYM MF_E_SOURCERESOLVER_MUTUALLY_EXCLUSIVE_FLAGS}

//
// MessageId: MF_E_MEDIAPROC_WRONGSTATE
//
// MessageText:
//
// MediaProc is in the wrong state%0
//
  MF_E_MEDIAPROC_WRONGSTATE             = _HRESULT_TYPEDEF_($C00D36F2);
  {$EXTERNALSYM MF_E_MEDIAPROC_WRONGSTATE}

//
// MessageId: MF_E_RT_THROUGHPUT_NOT_AVAILABLE
//
// MessageText:
//
// Real time I/O service can not provide requested throughput.%0
//
  MF_E_RT_THROUGHPUT_NOT_AVAILABLE      = _HRESULT_TYPEDEF_($C00D36F3);
  {$EXTERNALSYM MF_E_RT_THROUGHPUT_NOT_AVAILABLE}

//
// MessageId: MF_E_RT_TOO_MANY_CLASSES
//
// MessageText:
//
// The workqueue cannot be registered with more classes.%0
//
  MF_E_RT_TOO_MANY_CLASSES              = _HRESULT_TYPEDEF_($C00D36F4);
  {$EXTERNALSYM MF_E_RT_TOO_MANY_CLASSES}

//
// MessageId: MF_E_RT_WOULDBLOCK
//
// MessageText:
//
// This operation cannot succeed because another thread owns this object.%0
//
  MF_E_RT_WOULDBLOCK                    = _HRESULT_TYPEDEF_($C00D36F5);
  {$EXTERNALSYM MF_E_RT_WOULDBLOCK}

//
// MessageId: MF_E_NO_BITPUMP
//
// MessageText:
//
// Internal. Bitpump not found.%0
//
  MF_E_NO_BITPUMP                       = _HRESULT_TYPEDEF_($C00D36F6);
  {$EXTERNALSYM MF_E_NO_BITPUMP}

//
// MessageId: MF_E_RT_OUTOFMEMORY
//
// MessageText:
//
// No more RT memory available.%0
//
  MF_E_RT_OUTOFMEMORY                   = _HRESULT_TYPEDEF_($C00D36F7);
  {$EXTERNALSYM MF_E_RT_OUTOFMEMORY}

//
// MessageId: MF_E_RT_WORKQUEUE_CLASS_NOT_SPECIFIED
//
// MessageText:
//
// An MMCSS class has not been set for this work queue.%0
//
  MF_E_RT_WORKQUEUE_CLASS_NOT_SPECIFIED = _HRESULT_TYPEDEF_($C00D36F8);
  {$EXTERNALSYM MF_E_RT_WORKQUEUE_CLASS_NOT_SPECIFIED}

//
// MessageId: MF_E_INSUFFICIENT_BUFFER
//
// MessageText:
//
// Insufficient memory for response.%0
//
  MF_E_INSUFFICIENT_BUFFER              = _HRESULT_TYPEDEF_($C00D7170);
  {$EXTERNALSYM MF_E_INSUFFICIENT_BUFFER}

//
// MessageId: MF_E_CANNOT_CREATE_SINK
//
// MessageText:
//
// Activate failed to create mediasink. Call OutputNode.GetUINT32(MF_TOPONODE_MAJORTYPE) for more information. %0
//
  MF_E_CANNOT_CREATE_SINK               = _HRESULT_TYPEDEF_($C00D36FA);
  {$EXTERNALSYM MF_E_CANNOT_CREATE_SINK}

//
// MessageId: MF_E_BYTESTREAM_UNKNOWN_LENGTH
//
// MessageText:
//
// The length of the provided bytestream is unknown.%0
//
  MF_E_BYTESTREAM_UNKNOWN_LENGTH        = _HRESULT_TYPEDEF_($C00D36FB);
  {$EXTERNALSYM MF_E_BYTESTREAM_UNKNOWN_LENGTH}

//
// MessageId: MF_E_SESSION_PAUSEWHILESTOPPED
//
// MessageText:
//
// The media session cannot pause from a stopped state.%0
//
  MF_E_SESSION_PAUSEWHILESTOPPED        = _HRESULT_TYPEDEF_($C00D36FC);
  {$EXTERNALSYM MF_E_SESSION_PAUSEWHILESTOPPED}

//
// MessageId: MF_S_ACTIVATE_REPLACED
//
// MessageText:
//
// The activate could not be created in the remote process for some reason it was replaced with empty one.%0
//
  MF_S_ACTIVATE_REPLACED                = _HRESULT_TYPEDEF_($000D36FD);
  {$EXTERNALSYM MF_S_ACTIVATE_REPLACED}

//
// MessageId: MF_E_FORMAT_CHANGE_NOT_SUPPORTED
//
// MessageText:
//
// The data specified for the media type is supported, but would require a format change, which is not supported by this object.%0
//
  MF_E_FORMAT_CHANGE_NOT_SUPPORTED      = _HRESULT_TYPEDEF_($C00D36FE);
  {$EXTERNALSYM MF_E_FORMAT_CHANGE_NOT_SUPPORTED}

//
// MessageId: MF_E_INVALID_WORKQUEUE
//
// MessageText:
//
// The operation failed because an invalid combination of workqueue ID and flags was specified.%0
//
  MF_E_INVALID_WORKQUEUE                = _HRESULT_TYPEDEF_($C00D36FF);
  {$EXTERNALSYM MF_E_INVALID_WORKQUEUE}

//
// MessageId: MF_E_DRM_UNSUPPORTED
//
// MessageText:
//
// No DRM support is available.%0
//
  MF_E_DRM_UNSUPPORTED                  = _HRESULT_TYPEDEF_($C00D3700);
  {$EXTERNALSYM MF_E_DRM_UNSUPPORTED}

//
// MessageId: MF_E_UNAUTHORIZED
//
// MessageText:
//
// This operation is not authorized.%0
//
  MF_E_UNAUTHORIZED                     = _HRESULT_TYPEDEF_($C00D3701);
  {$EXTERNALSYM MF_E_UNAUTHORIZED}

//
// MessageId: MF_E_OUT_OF_RANGE
//
// MessageText:
//
// The value is not in the specified or valid range.%0
//
  MF_E_OUT_OF_RANGE                     = _HRESULT_TYPEDEF_($C00D3702);
  {$EXTERNALSYM MF_E_OUT_OF_RANGE}

//
// MessageId: MF_E_INVALID_CODEC_MERIT
//
// MessageText:
//
// The registered codec merit is not valid.%0
//
  MF_E_INVALID_CODEC_MERIT              = _HRESULT_TYPEDEF_($C00D3703);
  {$EXTERNALSYM MF_E_INVALID_CODEC_MERIT}

//
// MessageId: MF_E_HW_MFT_FAILED_START_STREAMING
//
// MessageText:
//
// Hardware MFT failed to start streaming due to lack of hardware resources.%0
//
  MF_E_HW_MFT_FAILED_START_STREAMING    = _HRESULT_TYPEDEF_($C00D3704);
  {$EXTERNALSYM MF_E_HW_MFT_FAILED_START_STREAMING}

//
// MessageId: MF_E_OPERATION_IN_PROGRESS
//
// MessageText:
//
// The operation is already in progress.%0
//
   MF_E_OPERATION_IN_PROGRESS           = _HRESULT_TYPEDEF_($C00D3705);
   {$EXTERNALSYM MF_E_OPERATION_IN_PROGRESS}

//
// MessageId: MF_E_HARDWARE_DRM_UNSUPPORTED
//
// MessageText:
//
// No Hardware DRM support is available.%0
//
  MF_E_HARDWARE_DRM_UNSUPPORTED         =  _HRESULT_TYPEDEF_($C00D3706);
  {$EXTERNALSYM MF_E_HARDWARE_DRM_UNSUPPORTED}

//
// MessageId: MF_E_DURATION_TOO_LONG
//
// MessageText:
//
// The specified duration is too long.%0
//
  MF_E_DURATION_TOO_LONG                = _HRESULT_TYPEDEF_($C00D3707);
  {$EXTERNALSYM MF_E_DURATION_TOO_LONG}

//
// MessageId: MF_E_OPERATION_UNSUPPORTED_AT_D3D_FEATURE_LEVEL
//
// MessageText:
//
// The attempted call or command is not supported with the DirectX version used by the component.%0
//
  MF_E_OPERATION_UNSUPPORTED_AT_D3D_FEATURE_LEVEL = _HRESULT_TYPEDEF_($C00D3708);
  {$EXTERNALSYM MF_E_OPERATION_UNSUPPORTED_AT_D3D_FEATURE_LEVEL}

//
// MessageId: MF_E_UNSUPPORTED_MEDIATYPE_AT_D3D_FEATURE_LEVEL
//
// MessageText:
//
// The specified media type is not supported with the DirectX version used by the component.%0
//
  MF_E_UNSUPPORTED_MEDIATYPE_AT_D3D_FEATURE_LEVEL = _HRESULT_TYPEDEF_($C00D3709);
  {$EXTERNALSYM MF_E_UNSUPPORTED_MEDIATYPE_AT_D3D_FEATURE_LEVEL}


/////////////////////////////////////////////////////////////////////////
//
// MEDIAFOUNDATION ASF Parsing Informational Events
//
/////////////////////////////////////////////////////////////////////////

//
// MessageId: MF_S_ASF_PARSEINPROGRESS
//
// MessageText:
//
// Parsing is still in progress and is not yet complete.%0
//
  MF_S_ASF_PARSEINPROGRESS              = _HRESULT_TYPEDEF_($400D3A98);
  {$EXTERNALSYM MF_S_ASF_PARSEINPROGRESS}


/////////////////////////////////////////////////////////////////////////
//
// MEDIAFOUNDATION ASF Parsing Error Events
//
/////////////////////////////////////////////////////////////////////////

//
// MessageId: MF_E_ASF_PARSINGINCOMPLETE
//
// MessageText:
//
// Not enough data have been parsed to carry out the requested action.%0
//
  MF_E_ASF_PARSINGINCOMPLETE            = _HRESULT_TYPEDEF_($C00D3A98);
  {$EXTERNALSYM MF_E_ASF_PARSINGINCOMPLETE}

//
// MessageId: MF_E_ASF_MISSINGDATA
//
// MessageText:
//
// There is a gap in the ASF data provided.%0
//
  MF_E_ASF_MISSINGDATA                  = _HRESULT_TYPEDEF_($C00D3A99);
  {$EXTERNALSYM MF_E_ASF_MISSINGDATA}

//
// MessageId: MF_E_ASF_INVALIDDATA
//
// MessageText:
//
// The data provided are not valid ASF.%0
//
  MF_E_ASF_INVALIDDATA                  = _HRESULT_TYPEDEF_($C00D3A9A);
  {$EXTERNALSYM MF_E_ASF_INVALIDDATA}

//
// MessageId: MF_E_ASF_OPAQUEPACKET
//
// MessageText:
//
// The packet is opaque, so the requested information cannot be returned.%0
//
  MF_E_ASF_OPAQUEPACKET                 = _HRESULT_TYPEDEF_($C00D3A9B);
  {$EXTERNALSYM MF_E_ASF_OPAQUEPACKET}

//
// MessageId: MF_E_ASF_NOINDEX
//
// MessageText:
//
// The requested operation failed since there is no appropriate ASF index.%0
//
  MF_E_ASF_NOINDEX                      = _HRESULT_TYPEDEF_($C00D3A9C);
  {$EXTERNALSYM MF_E_ASF_NOINDEX}

//
// MessageId: MF_E_ASF_OUTOFRANGE
//
// MessageText:
//
// The value supplied is out of range for this operation.%0
//
  MF_E_ASF_OUTOFRANGE                   = _HRESULT_TYPEDEF_($C00D3A9D);
  {$EXTERNALSYM MF_E_ASF_OUTOFRANGE}

//
// MessageId: MF_E_ASF_INDEXNOTLOADED
//
// MessageText:
//
// The index entry requested needs to be loaded before it can be available.%0
//
  MF_E_ASF_INDEXNOTLOADED               = _HRESULT_TYPEDEF_($C00D3A9E);
  {$EXTERNALSYM MF_E_ASF_INDEXNOTLOADED}

//
// MessageId: MF_E_ASF_TOO_MANY_PAYLOADS
//
// MessageText:
//
// The packet has reached the maximum number of payloads.%0
//
  MF_E_ASF_TOO_MANY_PAYLOADS            = _HRESULT_TYPEDEF_($C00D3A9F);
  {$EXTERNALSYM MF_E_ASF_TOO_MANY_PAYLOADS}

//
// MessageId: MF_E_ASF_UNSUPPORTED_STREAM_TYPE
//
// MessageText:
//
// Stream type is not supported.%0
//
  MF_E_ASF_UNSUPPORTED_STREAM_TYPE      = _HRESULT_TYPEDEF_($C00D3AA0);
  {$EXTERNALSYM MF_E_ASF_UNSUPPORTED_STREAM_TYPE}

//
// MessageId: MF_E_ASF_DROPPED_PACKET
//
// MessageText:
//
// One or more ASF packets were dropped.%0
//
  MF_E_ASF_DROPPED_PACKET               = _HRESULT_TYPEDEF_($C00D3AA1);
  {$EXTERNALSYM MF_E_ASF_DROPPED_PACKET}


/////////////////////////////////////////////////////////////////////////
//
// MEDIAFOUNDATION Media Source Error Events
//
/////////////////////////////////////////////////////////////////////////

//
// MessageId: MF_E_NO_EVENTS_AVAILABLE
//
// MessageText:
//
// There are no events available in the queue.%0
//
  MF_E_NO_EVENTS_AVAILABLE              = _HRESULT_TYPEDEF_($C00D3E80);
  {$EXTERNALSYM MF_E_NO_EVENTS_AVAILABLE}

//
// MessageId: MF_E_INVALID_STATE_TRANSITION
//
// MessageText:
//
// A media source cannot go from the stopped state to the paused state.%0
//
  MF_E_INVALID_STATE_TRANSITION         = _HRESULT_TYPEDEF_($C00D3E82);
  {$EXTERNALSYM MF_E_INVALID_STATE_TRANSITION}

//
// MessageId: MF_E_END_OF_STREAM
//
// MessageText:
//
// The media stream cannot process any more samples because there are no more samples in the stream.%0
//
  MF_E_END_OF_STREAM                    = _HRESULT_TYPEDEF_($C00D3E84);
  {$EXTERNALSYM MF_E_END_OF_STREAM}

//
// MessageId: MF_E_SHUTDOWN
//
// MessageText:
//
// The request is invalid because Shutdown() has been called.%0
//
  MF_E_SHUTDOWN                         = _HRESULT_TYPEDEF_($C00D3E85);
  {$EXTERNALSYM MF_E_SHUTDOWN}

//
// MessageId: MF_E_MP3_NOTFOUND
//
// MessageText:
//
// The MP3 object was not found.%0
//
  MF_E_MP3_NOTFOUND                     = _HRESULT_TYPEDEF_($C00D3E86);
  {$EXTERNALSYM MF_E_MP3_NOTFOUND}

//
// MessageId: MF_E_MP3_OUTOFDATA
//
// MessageText:
//
// The MP3 parser ran out of data before finding the MP3 object.%0
//
  MF_E_MP3_OUTOFDATA                    = _HRESULT_TYPEDEF_($C00D3E87);
  {$EXTERNALSYM MF_E_MP3_OUTOFDATA}

//
// MessageId: MF_E_MP3_NOTMP3
//
// MessageText:
//
// The file is not really a MP3 file.%0
//
  MF_E_MP3_NOTMP3                       = _HRESULT_TYPEDEF_($C00D3E88);
  {$EXTERNALSYM MF_E_MP3_NOTMP3}

//
// MessageId: MF_E_MP3_NOTSUPPORTED
//
// MessageText:
//
// The MP3 file is not supported.%0
//
  MF_E_MP3_NOTSUPPORTED                 = _HRESULT_TYPEDEF_($C00D3E89);
  {$EXTERNALSYM MF_E_MP3_NOTSUPPORTED}

//
// MessageId: MF_E_NO_DURATION
//
// MessageText:
//
// The Media stream has no duration.%0
//
  MF_E_NO_DURATION                      = _HRESULT_TYPEDEF_($C00D3E8A);
  {$EXTERNALSYM MF_E_NO_DURATION}

//
// MessageId: MF_E_INVALID_FORMAT
//
// MessageText:
//
// The Media format is recognized but is invalid.%0
//
  MF_E_INVALID_FORMAT                   = _HRESULT_TYPEDEF_($C00D3E8C);
  {$EXTERNALSYM MF_E_INVALID_FORMAT}

//
// MessageId: MF_E_PROPERTY_NOT_FOUND
//
// MessageText:
//
// The property requested was not found.%0
//
  MF_E_PROPERTY_NOT_FOUND               = _HRESULT_TYPEDEF_($C00D3E8D);
  {$EXTERNALSYM MF_E_PROPERTY_NOT_FOUND}

//
// MessageId: MF_E_PROPERTY_READ_ONLY
//
// MessageText:
//
// The property is read only.%0
//
  MF_E_PROPERTY_READ_ONLY               = _HRESULT_TYPEDEF_($C00D3E8E);
  {$EXTERNALSYM MF_E_PROPERTY_READ_ONLY}

//
// MessageId: MF_E_PROPERTY_NOT_ALLOWED
//
// MessageText:
//
// The specified property is not allowed in this context.%0
//
  MF_E_PROPERTY_NOT_ALLOWED             = _HRESULT_TYPEDEF_($C00D3E8F);
  {$EXTERNALSYM MF_E_PROPERTY_NOT_ALLOWED}

//
// MessageId: MF_E_MEDIA_SOURCE_NOT_STARTED
//
// MessageText:
//
// The media source is not started.%0
//
  MF_E_MEDIA_SOURCE_NOT_STARTED         = _HRESULT_TYPEDEF_($C00D3E91);
  {$EXTERNALSYM MF_E_MEDIA_SOURCE_NOT_STARTED}

//
// MessageId: MF_E_UNSUPPORTED_FORMAT
//
// MessageText:
//
// The Media format is recognized but not supported.%0
//
  MF_E_UNSUPPORTED_FORMAT               = _HRESULT_TYPEDEF_($C00D3E98);
  {$EXTERNALSYM MF_E_UNSUPPORTED_FORMAT}

//
// MessageId: MF_E_MP3_BAD_CRC
//
// MessageText:
//
// The MPEG frame has bad CRC.%0
//
  MF_E_MP3_BAD_CRC                      = _HRESULT_TYPEDEF_($C00D3E99);
  {$EXTERNALSYM MF_E_MP3_BAD_CRC}

//
// MessageId: MF_E_NOT_PROTECTED
//
// MessageText:
//
// The file is not protected.%0
//
  MF_E_NOT_PROTECTED                    = _HRESULT_TYPEDEF_($C00D3E9A);
  {$EXTERNALSYM MF_E_NOT_PROTECTED}

//
// MessageId: MF_E_MEDIA_SOURCE_WRONGSTATE
//
// MessageText:
//
// The media source is in the wrong state%0
//
  MF_E_MEDIA_SOURCE_WRONGSTATE          = _HRESULT_TYPEDEF_($C00D3E9B);
  {$EXTERNALSYM MF_E_MEDIA_SOURCE_WRONGSTATE}

//
// MessageId: MF_E_MEDIA_SOURCE_NO_STREAMS_SELECTED
//
// MessageText:
//
// No streams are selected in source presentation descriptor.%0
//
  MF_E_MEDIA_SOURCE_NO_STREAMS_SELECTED = _HRESULT_TYPEDEF_($C00D3E9C);
  {$EXTERNALSYM MF_E_MEDIA_SOURCE_NO_STREAMS_SELECTED}

//
// MessageId: MF_E_CANNOT_FIND_KEYFRAME_SAMPLE
//
// MessageText:
//
// No key frame sample was found.%0
//
  MF_E_CANNOT_FIND_KEYFRAME_SAMPLE      = _HRESULT_TYPEDEF_($C00D3E9D);
  {$EXTERNALSYM MF_E_CANNOT_FIND_KEYFRAME_SAMPLE}


/////////////////////////////////////////////////////////////////////////
//
// MEDIAFOUNDATION Network Error Events
//
/////////////////////////////////////////////////////////////////////////

//
// MessageId: MF_E_NETWORK_RESOURCE_FAILURE
//
// MessageText:
//
// An attempt to acquire a network resource failed.%0
//
  MF_E_NETWORK_RESOURCE_FAILURE         = _HRESULT_TYPEDEF_($C00D4268);
  {$EXTERNALSYM MF_E_NETWORK_RESOURCE_FAILURE}

//
// MessageId: MF_E_NET_WRITE
//
// MessageText:
//
// Error writing to the network.%0
//
  MF_E_NET_WRITE                        = _HRESULT_TYPEDEF_($C00D4269);
  {$EXTERNALSYM MF_E_NET_WRITE}

//
// MessageId: MF_E_NET_READ
//
// MessageText:
//
// Error reading from the network.%0
//
  MF_E_NET_READ                         = _HRESULT_TYPEDEF_($C00D426A);
  {$EXTERNALSYM MF_E_NET_READ}

//
// MessageId: MF_E_NET_REQUIRE_NETWORK
//
// MessageText:
//
// Internal. Entry cannot complete operation without network.%0
//
  MF_E_NET_REQUIRE_NETWORK              = _HRESULT_TYPEDEF_($C00D426B);
  {$EXTERNALSYM MF_E_NET_REQUIRE_NETWORK}

//
// MessageId: MF_E_NET_REQUIRE_ASYNC
//
// MessageText:
//
// Internal. Async op is required.%0
//
  MF_E_NET_REQUIRE_ASYNC                = _HRESULT_TYPEDEF_($C00D426C);
  {$EXTERNALSYM MF_E_NET_REQUIRE_ASYNC}

//
// MessageId: MF_E_NET_BWLEVEL_NOT_SUPPORTED
//
// MessageText:
//
// Internal. Bandwidth levels are not supported.%0
//
  MF_E_NET_BWLEVEL_NOT_SUPPORTED        = _HRESULT_TYPEDEF_($C00D426D);
  {$EXTERNALSYM MF_E_NET_BWLEVEL_NOT_SUPPORTED}

//
// MessageId: MF_E_NET_STREAMGROUPS_NOT_SUPPORTED
//
// MessageText:
//
// Internal. Stream groups are not supported.%0
//
  MF_E_NET_STREAMGROUPS_NOT_SUPPORTED   = _HRESULT_TYPEDEF_($C00D426E);
  {$EXTERNALSYM MF_E_NET_STREAMGROUPS_NOT_SUPPORTED}

//
// MessageId: MF_E_NET_MANUALSS_NOT_SUPPORTED
//
// MessageText:
//
// Manual stream selection is not supported.%0
//
  MF_E_NET_MANUALSS_NOT_SUPPORTED       = _HRESULT_TYPEDEF_($C00D426F);
  {$EXTERNALSYM MF_E_NET_MANUALSS_NOT_SUPPORTED}

//
// MessageId: MF_E_NET_INVALID_PRESENTATION_DESCRIPTOR
//
// MessageText:
//
// Invalid presentation descriptor.%0
//
  MF_E_NET_INVALID_PRESENTATION_DESCRIPTOR = _HRESULT_TYPEDEF_($C00D4270);
  {$EXTERNALSYM MF_E_NET_INVALID_PRESENTATION_DESCRIPTOR}

//
// MessageId: MF_E_NET_CACHESTREAM_NOT_FOUND
//
// MessageText:
//
// Cannot find cache stream.%0
//
  MF_E_NET_CACHESTREAM_NOT_FOUND        = _HRESULT_TYPEDEF_($C00D4271);
  {$EXTERNALSYM MF_E_NET_CACHESTREAM_NOT_FOUND}

//
// MessageId: MF_I_MANUAL_PROXY
//
// MessageText:
//
// The proxy setting is manual.%0
//
  MF_I_MANUAL_PROXY                     = _HRESULT_TYPEDEF_($400D4272);
  {$EXTERNALSYM MF_I_MANUAL_PROXY}

//duplicate removed
//MessageId=17011 Severity=Informational Facility=MEDIAFOUNDATION SymbolicName=MF_E_INVALID_REQUEST
//Language=English
//The request is invalid in the current state.%0
//.
//
// MessageId: MF_E_NET_REQUIRE_INPUT
//
// MessageText:
//
// Internal. Entry cannot complete operation without input.%0
//
  MF_E_NET_REQUIRE_INPUT                = _HRESULT_TYPEDEF_($C00D4274);
  {$EXTERNALSYM MF_E_NET_REQUIRE_INPUT}

//
// MessageId: MF_E_NET_REDIRECT
//
// MessageText:
//
// The client redirected to another server.%0
//
  MF_E_NET_REDIRECT                     = _HRESULT_TYPEDEF_($C00D4275);
  {$EXTERNALSYM MF_E_NET_REDIRECT}

//
// MessageId: MF_E_NET_REDIRECT_TO_PROXY
//
// MessageText:
//
// The client is redirected to a proxy server.%0
//
  MF_E_NET_REDIRECT_TO_PROXY            = _HRESULT_TYPEDEF_($C00D4276);
  {$EXTERNALSYM MF_E_NET_REDIRECT_TO_PROXY}

//
// MessageId: MF_E_NET_TOO_MANY_REDIRECTS
//
// MessageText:
//
// The client reached maximum redirection limit.%0
//
  MF_E_NET_TOO_MANY_REDIRECTS           = _HRESULT_TYPEDEF_($C00D4277);
  {$EXTERNALSYM MF_E_NET_TOO_MANY_REDIRECTS}

//
// MessageId: MF_E_NET_TIMEOUT
//
// MessageText:
//
// The server, a computer set up to offer multimedia content to other computers, could not handle your request for multimedia content in a timely manner.  Please try again later.%0
//
  MF_E_NET_TIMEOUT                      = _HRESULT_TYPEDEF_($C00D4278);
  {$EXTERNALSYM MF_E_NET_TIMEOUT}

//
// MessageId: MF_E_NET_CLIENT_CLOSE
//
// MessageText:
//
// The control socket is closed by the client.%0
//
  MF_E_NET_CLIENT_CLOSE                 = _HRESULT_TYPEDEF_($C00D4279);
  {$EXTERNALSYM MF_E_NET_CLIENT_CLOSE}

//
// MessageId: MF_E_NET_BAD_CONTROL_DATA
//
// MessageText:
//
// The server received invalid data from the client on the control connection.%0
//
  MF_E_NET_BAD_CONTROL_DATA             = _HRESULT_TYPEDEF_($C00D427A);
  {$EXTERNALSYM MF_E_NET_BAD_CONTROL_DATA}

//
// MessageId: MF_E_NET_INCOMPATIBLE_SERVER
//
// MessageText:
//
// The server is not a compatible streaming media server.%0
//
  MF_E_NET_INCOMPATIBLE_SERVER          = _HRESULT_TYPEDEF_($C00D427B);
  {$EXTERNALSYM MF_E_NET_INCOMPATIBLE_SERVER}

//
// MessageId: MF_E_NET_UNSAFE_URL
//
// MessageText:
//
// Url.%0
//
  MF_E_NET_UNSAFE_URL                   = _HRESULT_TYPEDEF_($C00D427C);
  {$EXTERNALSYM MF_E_NET_UNSAFE_URL}

//
// MessageId: MF_E_NET_CACHE_NO_DATA
//
// MessageText:
//
// Data is not available.%0
//
  MF_E_NET_CACHE_NO_DATA                = _HRESULT_TYPEDEF_($C00D427D);
  {$EXTERNALSYM MF_E_NET_CACHE_NO_DATA}

//
// MessageId: MF_E_NET_EOL
//
// MessageText:
//
// End of line.%0
//
  MF_E_NET_EOL                          = _HRESULT_TYPEDEF_($C00D427E);
  {$EXTERNALSYM MF_E_NET_EOL}

//
// MessageId: MF_E_NET_BAD_REQUEST
//
// MessageText:
//
// The request could not be understood by the server.%0
//
  MF_E_NET_BAD_REQUEST                  = _HRESULT_TYPEDEF_($C00D427F);
  {$EXTERNALSYM MF_E_NET_BAD_REQUEST}

//
// MessageId: MF_E_NET_INTERNAL_SERVER_ERROR
//
// MessageText:
//
// The server encountered an unexpected condition which prevented it from fulfilling the request.%0
//
  MF_E_NET_INTERNAL_SERVER_ERROR        = _HRESULT_TYPEDEF_($C00D4280);
  {$EXTERNALSYM MF_E_NET_INTERNAL_SERVER_ERROR}

//
// MessageId: MF_E_NET_SESSION_NOT_FOUND
//
// MessageText:
//
// Session not found.%0
//
  MF_E_NET_SESSION_NOT_FOUND            = _HRESULT_TYPEDEF_($C00D4281);
  {$EXTERNALSYM MF_E_NET_SESSION_NOT_FOUND}

//
// MessageId: MF_E_NET_NOCONNECTION
//
// MessageText:
//
// There is no connection established with the Windows Media server. The operation failed.%0
//
  MF_E_NET_NOCONNECTION                 = _HRESULT_TYPEDEF_($C00D4282);
  {$EXTERNALSYM MF_E_NET_NOCONNECTION}

//
// MessageId: MF_E_NET_CONNECTION_FAILURE
//
// MessageText:
//
// The network connection has failed.%0
//
  MF_E_NET_CONNECTION_FAILURE           = _HRESULT_TYPEDEF_($C00D4283);
  {$EXTERNALSYM MF_E_NET_CONNECTION_FAILURE}

//
// MessageId: MF_E_NET_INCOMPATIBLE_PUSHSERVER
//
// MessageText:
//
// The Server service that received the HTTP push request is not a compatible version of Windows Media Services (WMS).  This error may indicate the push request was received by IIS instead of WMS.  Ensure WMS is started and has the HTTP Server control protocol properly enabled and try again.%0
//
  MF_E_NET_INCOMPATIBLE_PUSHSERVER      = _HRESULT_TYPEDEF_($C00D4284);
  {$EXTERNALSYM MF_E_NET_INCOMPATIBLE_PUSHSERVER}

//
// MessageId: MF_E_NET_SERVER_ACCESSDENIED
//
// MessageText:
//
// The Windows Media server is denying access.  The username and/or password might be incorrect.%0
//
  MF_E_NET_SERVER_ACCESSDENIED          = _HRESULT_TYPEDEF_($C00D4285);
  {$EXTERNALSYM MF_E_NET_SERVER_ACCESSDENIED}

//
// MessageId: MF_E_NET_PROXY_ACCESSDENIED
//
// MessageText:
//
// The proxy server is denying access.  The username and/or password might be incorrect.%0
//
  MF_E_NET_PROXY_ACCESSDENIED           = _HRESULT_TYPEDEF_($C00D4286);
  {$EXTERNALSYM MF_E_NET_PROXY_ACCESSDENIED}

//
// MessageId: MF_E_NET_CANNOTCONNECT
//
// MessageText:
//
// Unable to establish a connection to the server.%0
//
  MF_E_NET_CANNOTCONNECT                = _HRESULT_TYPEDEF_($C00D4287);
  {$EXTERNALSYM MF_E_NET_CANNOTCONNECT}

//
// MessageId: MF_E_NET_INVALID_PUSH_TEMPLATE
//
// MessageText:
//
// The specified push template is invalid.%0
//
  MF_E_NET_INVALID_PUSH_TEMPLATE        = _HRESULT_TYPEDEF_($C00D4288);
  {$EXTERNALSYM MF_E_NET_INVALID_PUSH_TEMPLATE}

//
// MessageId: MF_E_NET_INVALID_PUSH_PUBLISHING_POINT
//
// MessageText:
//
// The specified push publishing point is invalid.%0
//
  MF_E_NET_INVALID_PUSH_PUBLISHING_POINT = _HRESULT_TYPEDEF_($C00D4289);
  {$EXTERNALSYM MF_E_NET_INVALID_PUSH_PUBLISHING_POINT}

//
// MessageId: MF_E_NET_BUSY
//
// MessageText:
//
// The requested resource is in use.%0
//
  MF_E_NET_BUSY                         = _HRESULT_TYPEDEF_($C00D428A);
  {$EXTERNALSYM MF_E_NET_BUSY}

//
// MessageId: MF_E_NET_RESOURCE_GONE
//
// MessageText:
//
// The Publishing Point or file on the Windows Media Server is no longer available.%0
//
  MF_E_NET_RESOURCE_GONE                = _HRESULT_TYPEDEF_($C00D428B);
  {$EXTERNALSYM MF_E_NET_RESOURCE_GONE}

//
// MessageId: MF_E_NET_ERROR_FROM_PROXY
//
// MessageText:
//
// The proxy experienced an error while attempting to contact the media server.%0
//
  MF_E_NET_ERROR_FROM_PROXY             = _HRESULT_TYPEDEF_($C00D428C);
  {$EXTERNALSYM MF_E_NET_ERROR_FROM_PROXY}

//
// MessageId: MF_E_NET_PROXY_TIMEOUT
//
// MessageText:
//
// The proxy did not receive a timely response while attempting to contact the media server.%0
//
  MF_E_NET_PROXY_TIMEOUT                = _HRESULT_TYPEDEF_($C00D428D);
  {$EXTERNALSYM MF_E_NET_PROXY_TIMEOUT}

//
// MessageId: MF_E_NET_SERVER_UNAVAILABLE
//
// MessageText:
//
// The server is currently unable to handle the request due to a temporary overloading or maintenance of the server.%0
//
  MF_E_NET_SERVER_UNAVAILABLE           = _HRESULT_TYPEDEF_($C00D428E);
  {$EXTERNALSYM MF_E_NET_SERVER_UNAVAILABLE}

//
// MessageId: MF_E_NET_TOO_MUCH_DATA
//
// MessageText:
//
// The encoding process was unable to keep up with the amount of supplied data.%0
//
  MF_E_NET_TOO_MUCH_DATA                = _HRESULT_TYPEDEF_($C00D428F);
  {$EXTERNALSYM MF_E_NET_TOO_MUCH_DATA}

//
// MessageId: MF_E_NET_SESSION_INVALID
//
// MessageText:
//
// Session not found.%0
//
  MF_E_NET_SESSION_INVALID              = _HRESULT_TYPEDEF_($C00D4290);
  {$EXTERNALSYM MF_E_NET_SESSION_INVALID}

//
// MessageId: MF_E_OFFLINE_MODE
//
// MessageText:
//
// The requested URL is not available in offline mode.%0
//
  MF_E_OFFLINE_MODE                     = _HRESULT_TYPEDEF_($C00D4291);
  {$EXTERNALSYM MF_E_OFFLINE_MODE}

//
// MessageId: MF_E_NET_UDP_BLOCKED
//
// MessageText:
//
// A device in the network is blocking UDP traffic.%0
//
  MF_E_NET_UDP_BLOCKED                  = _HRESULT_TYPEDEF_($C00D4292);
  {$EXTERNALSYM MF_E_NET_UDP_BLOCKED}

//
// MessageId: MF_E_NET_UNSUPPORTED_CONFIGURATION
//
// MessageText:
//
// The specified configuration value is not supported.%0
//
  MF_E_NET_UNSUPPORTED_CONFIGURATION    = _HRESULT_TYPEDEF_($C00D4293);
  {$EXTERNALSYM MF_E_NET_UNSUPPORTED_CONFIGURATION}

//
// MessageId: MF_E_NET_PROTOCOL_DISABLED
//
// MessageText:
//
// The networking protocol is disabled.%0
//
  MF_E_NET_PROTOCOL_DISABLED            = _HRESULT_TYPEDEF_($C00D4294);
  {$EXTERNALSYM MF_E_NET_PROTOCOL_DISABLED}


/////////////////////////////////////////////////////////////////////////
//
// MEDIAFOUNDATION WMContainer Error Events
//
/////////////////////////////////////////////////////////////////////////

//
// MessageId: MF_E_ALREADY_INITIALIZED
//
// MessageText:
//
// This object has already been initialized and cannot be re-initialized at this time.%0
//
  MF_E_ALREADY_INITIALIZED              = _HRESULT_TYPEDEF_($C00D4650);
  {$EXTERNALSYM MF_E_ALREADY_INITIALIZED}

//
// MessageId: MF_E_BANDWIDTH_OVERRUN
//
// MessageText:
//
// The amount of data passed in exceeds the given bitrate and buffer window.%0
//
  MF_E_BANDWIDTH_OVERRUN                = _HRESULT_TYPEDEF_($C00D4651);
  {$EXTERNALSYM MF_E_BANDWIDTH_OVERRUN}

//
// MessageId: MF_E_LATE_SAMPLE
//
// MessageText:
//
// The sample was passed in too late to be correctly processed.%0
//
  MF_E_LATE_SAMPLE                      = _HRESULT_TYPEDEF_($C00D4652);
  {$EXTERNALSYM MF_E_LATE_SAMPLE}

//
// MessageId: MF_E_FLUSH_NEEDED
//
// MessageText:
//
// The requested action cannot be carried out until the object is flushed and the queue is emptied.%0
//
  MF_E_FLUSH_NEEDED                     = _HRESULT_TYPEDEF_($C00D4653);
  {$EXTERNALSYM MF_E_FLUSH_NEEDED}

//
// MessageId: MF_E_INVALID_PROFILE
//
// MessageText:
//
// The profile is invalid.%0
//
  MF_E_INVALID_PROFILE                  = _HRESULT_TYPEDEF_($C00D4654);
  {$EXTERNALSYM MF_E_INVALID_PROFILE}

//
// MessageId: MF_E_INDEX_NOT_COMMITTED
//
// MessageText:
//
// The index that is being generated needs to be committed before the requested action can be carried out.%0
//
  MF_E_INDEX_NOT_COMMITTED              = _HRESULT_TYPEDEF_($C00D4655);
  {$EXTERNALSYM MF_E_INDEX_NOT_COMMITTED}

//
// MessageId: MF_E_NO_INDEX
//
// MessageText:
//
// The index that is necessary for the requested action is not found.%0
//
  MF_E_NO_INDEX                         = _HRESULT_TYPEDEF_($C00D4656);
  {$EXTERNALSYM MF_E_NO_INDEX}

//
// MessageId: MF_E_CANNOT_INDEX_IN_PLACE
//
// MessageText:
//
// The requested index cannot be added in-place to the specified ASF content.%0
//
  MF_E_CANNOT_INDEX_IN_PLACE            = _HRESULT_TYPEDEF_($C00D4657);
  {$EXTERNALSYM MF_E_CANNOT_INDEX_IN_PLACE}

//
// MessageId: MF_E_MISSING_ASF_LEAKYBUCKET
//
// MessageText:
//
// The ASF leaky bucket parameters must be specified in order to carry out this request.%0
//
  MF_E_MISSING_ASF_LEAKYBUCKET          = _HRESULT_TYPEDEF_($C00D4658);
  {$EXTERNALSYM MF_E_MISSING_ASF_LEAKYBUCKET}

//
// MessageId: MF_E_INVALID_ASF_STREAMID
//
// MessageText:
//
// The stream id is invalid. The valid range for ASF stream id is from 1 to 127.%0
//
  MF_E_INVALID_ASF_STREAMID             = _HRESULT_TYPEDEF_($C00D4659);
  {$EXTERNALSYM MF_E_INVALID_ASF_STREAMID}


/////////////////////////////////////////////////////////////////////////
//
// MEDIAFOUNDATION Media Sink Error Events
//
/////////////////////////////////////////////////////////////////////////

//
// MessageId: MF_E_STREAMSINK_REMOVED
//
// MessageText:
//
// The requested Stream Sink has been removed and cannot be used.%0
//
  MF_E_STREAMSINK_REMOVED               = _HRESULT_TYPEDEF_($C00D4A38);
  {$EXTERNALSYM MF_E_STREAMSINK_REMOVED}

//
// MessageId: MF_E_STREAMSINKS_OUT_OF_SYNC
//
// MessageText:
//
// The various Stream Sinks in this Media Sink are too far out of sync for the requested action to take place.%0
//
  MF_E_STREAMSINKS_OUT_OF_SYNC          = _HRESULT_TYPEDEF_($C00D4A3A);
  {$EXTERNALSYM MF_E_STREAMSINKS_OUT_OF_SYNC}

//
// MessageId: MF_E_STREAMSINKS_FIXED
//
// MessageText:
//
// Stream Sinks cannot be added to or removed from this Media Sink because its set of streams is fixed.%0
//
  MF_E_STREAMSINKS_FIXED                = _HRESULT_TYPEDEF_($C00D4A3B);
  {$EXTERNALSYM MF_E_STREAMSINKS_FIXED}

//
// MessageId: MF_E_STREAMSINK_EXISTS
//
// MessageText:
//
// The given Stream Sink already exists.%0
//
  MF_E_STREAMSINK_EXISTS                = _HRESULT_TYPEDEF_($C00D4A3C);
  {$EXTERNALSYM MF_E_STREAMSINK_EXISTS}

//
// MessageId: MF_E_SAMPLEALLOCATOR_CANCELED
//
// MessageText:
//
// Sample allocations have been canceled.%0
//
  MF_E_SAMPLEALLOCATOR_CANCELED         = _HRESULT_TYPEDEF_($C00D4A3D);
  {$EXTERNALSYM MF_E_SAMPLEALLOCATOR_CANCELED}

//
// MessageId: MF_E_SAMPLEALLOCATOR_EMPTY
//
// MessageText:
//
// The sample allocator is currently empty, due to outstanding requests.%0
//
  MF_E_SAMPLEALLOCATOR_EMPTY            = _HRESULT_TYPEDEF_($C00D4A3E);
  {$EXTERNALSYM MF_E_SAMPLEALLOCATOR_EMPTY}

//
// MessageId: MF_E_SINK_ALREADYSTOPPED
//
// MessageText:
//
// When we try to sopt a stream sink, it is already stopped %0
//
  MF_E_SINK_ALREADYSTOPPED              = _HRESULT_TYPEDEF_($C00D4A3F);
  {$EXTERNALSYM MF_E_SINK_ALREADYSTOPPED}

//
// MessageId: MF_E_ASF_FILESINK_BITRATE_UNKNOWN
//
// MessageText:
//
// The ASF file sink could not reserve AVIO because the bitrate is unknown.%0
//
  MF_E_ASF_FILESINK_BITRATE_UNKNOWN     = _HRESULT_TYPEDEF_($C00D4A40);
  {$EXTERNALSYM MF_E_ASF_FILESINK_BITRATE_UNKNOWN}

//
// MessageId: MF_E_SINK_NO_STREAMS
//
// MessageText:
//
// No streams are selected in sink presentation descriptor.%0
//
  MF_E_SINK_NO_STREAMS                  = _HRESULT_TYPEDEF_($C00D4A41);
  {$EXTERNALSYM MF_E_SINK_NO_STREAMS}

//
// MessageId: MF_S_SINK_NOT_FINALIZED
//
// MessageText:
//
// The sink has not been finalized before shut down. This may cause sink generate a corrupted content.%0
//
  MF_S_SINK_NOT_FINALIZED               = _HRESULT_TYPEDEF_($000D4A42);
  {$EXTERNALSYM MF_S_SINK_NOT_FINALIZED}

//
// MessageId: MF_E_METADATA_TOO_LONG
//
// MessageText:
//
// A metadata item was too long to write to the output container.%0
//
  MF_E_METADATA_TOO_LONG                = _HRESULT_TYPEDEF_($C00D4A43);
  {$EXTERNALSYM MF_E_METADATA_TOO_LONG}

//
// MessageId: MF_E_SINK_NO_SAMPLES_PROCESSED
//
// MessageText:
//
// The operation failed because no samples were processed by the sink.%0
//
  MF_E_SINK_NO_SAMPLES_PROCESSED        = _HRESULT_TYPEDEF_($C00D4A44);
  {$EXTERNALSYM MF_E_SINK_NO_SAMPLES_PROCESSED}

// SDK 10

//
// MessageId: MF_E_SINK_HEADERS_NOT_FOUND
//
// MessageText:
//
// Sink could not create valid output file because required headers were not provided to the sink.%0
//
  MF_E_SINK_HEADERS_NOT_FOUND         = _HRESULT_TYPEDEF_ ($C00D4A45);
  {$EXTERNALSYM MF_E_SINK_HEADERS_NOT_FOUND}

/////////////////////////////////////////////////////////////////////////
//
// MEDIAFOUNDATION Renderer Error Events
//
/////////////////////////////////////////////////////////////////////////

//
// MessageId: MF_E_VIDEO_REN_NO_PROCAMP_HW
//
// MessageText:
//
// There is no available procamp hardware with which to perform color correction.%0
//
  MF_E_VIDEO_REN_NO_PROCAMP_HW          = _HRESULT_TYPEDEF_($C00D4E20);
  {$EXTERNALSYM MF_E_VIDEO_REN_NO_PROCAMP_HW}

//
// MessageId: MF_E_VIDEO_REN_NO_DEINTERLACE_HW
//
// MessageText:
//
// There is no available deinterlacing hardware with which to deinterlace the video stream.%0
//
  MF_E_VIDEO_REN_NO_DEINTERLACE_HW      = _HRESULT_TYPEDEF_($C00D4E21);
  {$EXTERNALSYM MF_E_VIDEO_REN_NO_DEINTERLACE_HW}

//
// MessageId: MF_E_VIDEO_REN_COPYPROT_FAILED
//
// MessageText:
//
// A video stream requires copy protection to be enabled, but there was a failure in attempting to enable copy protection.%0
//
  MF_E_VIDEO_REN_COPYPROT_FAILED        = _HRESULT_TYPEDEF_($C00D4E22);
  {$EXTERNALSYM MF_E_VIDEO_REN_COPYPROT_FAILED}

//
// MessageId: MF_E_VIDEO_REN_SURFACE_NOT_SHARED
//
// MessageText:
//
// A component is attempting to access a surface for sharing that is not shared.%0
//
  MF_E_VIDEO_REN_SURFACE_NOT_SHARED     = _HRESULT_TYPEDEF_($C00D4E23);
  {$EXTERNALSYM MF_E_VIDEO_REN_SURFACE_NOT_SHARED}

//
// MessageId: MF_E_VIDEO_DEVICE_LOCKED
//
// MessageText:
//
// A component is attempting to access a shared device that is already locked by another component.%0
//
  MF_E_VIDEO_DEVICE_LOCKED              = _HRESULT_TYPEDEF_($C00D4E24);
  {$EXTERNALSYM MF_E_VIDEO_DEVICE_LOCKED}

//
// MessageId: MF_E_NEW_VIDEO_DEVICE
//
// MessageText:
//
// The device is no longer available. The handle should be closed and a new one opened.%0
//
  MF_E_NEW_VIDEO_DEVICE                 = _HRESULT_TYPEDEF_($C00D4E25);
  {$EXTERNALSYM MF_E_NEW_VIDEO_DEVICE}

//
// MessageId: MF_E_NO_VIDEO_SAMPLE_AVAILABLE
//
// MessageText:
//
// A video sample is not currently queued on a stream that is required for mixing.%0
//
  MF_E_NO_VIDEO_SAMPLE_AVAILABLE        = _HRESULT_TYPEDEF_($C00D4E26);
  {$EXTERNALSYM MF_E_NO_VIDEO_SAMPLE_AVAILABLE}

//
// MessageId: MF_E_NO_AUDIO_PLAYBACK_DEVICE
//
// MessageText:
//
// No audio playback device was found.%0
//
  MF_E_NO_AUDIO_PLAYBACK_DEVICE         = _HRESULT_TYPEDEF_($C00D4E84);
  {$EXTERNALSYM MF_E_NO_AUDIO_PLAYBACK_DEVICE}

//
// MessageId: MF_E_AUDIO_PLAYBACK_DEVICE_IN_USE
//
// MessageText:
//
// The requested audio playback device is currently in use.%0
//
  MF_E_AUDIO_PLAYBACK_DEVICE_IN_USE     = _HRESULT_TYPEDEF_($C00D4E85);
  {$EXTERNALSYM MF_E_AUDIO_PLAYBACK_DEVICE_IN_USE}

//
// MessageId: MF_E_AUDIO_PLAYBACK_DEVICE_INVALIDATED
//
// MessageText:
//
// The audio playback device is no longer present.%0
//
  MF_E_AUDIO_PLAYBACK_DEVICE_INVALIDATED = _HRESULT_TYPEDEF_($C00D4E86);
  {$EXTERNALSYM MF_E_AUDIO_PLAYBACK_DEVICE_INVALIDATED}

//
// MessageId: MF_E_AUDIO_SERVICE_NOT_RUNNING
//
// MessageText:
//
// The audio service is not running.%0
//
  MF_E_AUDIO_SERVICE_NOT_RUNNING        = _HRESULT_TYPEDEF_($C00D4E87);
  {$EXTERNALSYM MF_E_AUDIO_SERVICE_NOT_RUNNING}

//
// MessageId: MF_E_AUDIO_BUFFER_SIZE_ERROR
//
// MessageText:
//
// The audio renderer encountered an error trying to set the render buffer size.%0
//
  MF_E_AUDIO_BUFFER_SIZE_ERROR          = _HRESULT_TYPEDEF_($C00D4E88);
  {$EXTERNALSYM MF_E_AUDIO_BUFFER_SIZE_ERROR}

//
// MessageId: MF_E_AUDIO_CLIENT_WRAPPER_SPOOF_ERROR
//
// MessageText:
//
// The audio renderer encountered an error trying spoof the invalidated audio client.%0
//
  MF_E_AUDIO_CLIENT_WRAPPER_SPOOF_ERROR = _HRESULT_TYPEDEF_($C00D4E89);
  {$EXTERNALSYM MF_E_AUDIO_CLIENT_WRAPPER_SPOOF_ERROR}


/////////////////////////////////////////////////////////////////////////
//
// MEDIAFOUNDATION Topology Error Events
//
/////////////////////////////////////////////////////////////////////////

//
// MessageId: MF_E_TOPO_INVALID_OPTIONAL_NODE
//
// MessageText:
//
// The topology contains an invalid optional node.  Possible reasons are incorrect number of outputs and inputs or optional node is at the beginning or end of a segment. %0
//
  MF_E_TOPO_INVALID_OPTIONAL_NODE       = _HRESULT_TYPEDEF_($C00D520E);
  {$EXTERNALSYM MF_E_TOPO_INVALID_OPTIONAL_NODE}

//
// MessageId: MF_E_TOPO_CANNOT_FIND_DECRYPTOR
//
// MessageText:
//
// No suitable transform was found to decrypt the content. %0
//
  MF_E_TOPO_CANNOT_FIND_DECRYPTOR       = _HRESULT_TYPEDEF_($C00D5211);
  {$EXTERNALSYM MF_E_TOPO_CANNOT_FIND_DECRYPTOR}

//
// MessageId: MF_E_TOPO_CODEC_NOT_FOUND
//
// MessageText:
//
// No suitable transform was found to encode or decode the content. %0
//
  MF_E_TOPO_CODEC_NOT_FOUND             = _HRESULT_TYPEDEF_($C00D5212);
  {$EXTERNALSYM MF_E_TOPO_CODEC_NOT_FOUND}

//
// MessageId: MF_E_TOPO_CANNOT_CONNECT
//
// MessageText:
//
// Unable to find a way to connect nodes%0
//
  MF_E_TOPO_CANNOT_CONNECT              = _HRESULT_TYPEDEF_($C00D5213);
  {$EXTERNALSYM MF_E_TOPO_CANNOT_CONNECT}

//
// MessageId: MF_E_TOPO_UNSUPPORTED
//
// MessageText:
//
// Unsupported operations in topoloader%0
//
  MF_E_TOPO_UNSUPPORTED                 = _HRESULT_TYPEDEF_($C00D5214);
  {$EXTERNALSYM MF_E_TOPO_UNSUPPORTED}

//
// MessageId: MF_E_TOPO_INVALID_TIME_ATTRIBUTES
//
// MessageText:
//
// The topology or its nodes contain incorrectly set time attributes%0
//
  MF_E_TOPO_INVALID_TIME_ATTRIBUTES     = _HRESULT_TYPEDEF_($C00D5215);
  {$EXTERNALSYM MF_E_TOPO_INVALID_TIME_ATTRIBUTES}

//
// MessageId: MF_E_TOPO_LOOPS_IN_TOPOLOGY
//
// MessageText:
//
// The topology contains loops, which are unsupported in media foundation topologies%0
//
  MF_E_TOPO_LOOPS_IN_TOPOLOGY           = _HRESULT_TYPEDEF_($C00D5216);
  {$EXTERNALSYM MF_E_TOPO_LOOPS_IN_TOPOLOGY}

//
// MessageId: MF_E_TOPO_MISSING_PRESENTATION_DESCRIPTOR
//
// MessageText:
//
// A source stream node in the topology does not have a presentation descriptor%0
//
  MF_E_TOPO_MISSING_PRESENTATION_DESCRIPTOR = _HRESULT_TYPEDEF_($C00D5217);
  {$EXTERNALSYM MF_E_TOPO_MISSING_PRESENTATION_DESCRIPTOR}

//
// MessageId: MF_E_TOPO_MISSING_STREAM_DESCRIPTOR
//
// MessageText:
//
// A source stream node in the topology does not have a stream descriptor%0
//
  MF_E_TOPO_MISSING_STREAM_DESCRIPTOR   = _HRESULT_TYPEDEF_($C00D5218);
  {$EXTERNALSYM MF_E_TOPO_MISSING_STREAM_DESCRIPTOR}

//
// MessageId: MF_E_TOPO_STREAM_DESCRIPTOR_NOT_SELECTED
//
// MessageText:
//
// A stream descriptor was set on a source stream node but it was not selected on the presentation descriptor%0
//
  MF_E_TOPO_STREAM_DESCRIPTOR_NOT_SELECTED = _HRESULT_TYPEDEF_($C00D5219);
  {$EXTERNALSYM MF_E_TOPO_STREAM_DESCRIPTOR_NOT_SELECTED}

//
// MessageId: MF_E_TOPO_MISSING_SOURCE
//
// MessageText:
//
// A source stream node in the topology does not have a source%0
//
  MF_E_TOPO_MISSING_SOURCE              = _HRESULT_TYPEDEF_($C00D521A);
  {$EXTERNALSYM MF_E_TOPO_MISSING_SOURCE}

//
// MessageId: MF_E_TOPO_SINK_ACTIVATES_UNSUPPORTED
//
// MessageText:
//
// The topology loader does not support sink activates on output nodes.%0
//
  MF_E_TOPO_SINK_ACTIVATES_UNSUPPORTED  = _HRESULT_TYPEDEF_($C00D521B);
  {$EXTERNALSYM MF_E_TOPO_SINK_ACTIVATES_UNSUPPORTED}


/////////////////////////////////////////////////////////////////////////
//
// MEDIAFOUNDATION Timeline Error Events
//
/////////////////////////////////////////////////////////////////////////

//
// MessageId: MF_E_SEQUENCER_UNKNOWN_SEGMENT_ID
//
// MessageText:
//
// The sequencer cannot find a segment with the given ID.%0\n.
//
  MF_E_SEQUENCER_UNKNOWN_SEGMENT_ID     = _HRESULT_TYPEDEF_($C00D61AC);
  {$EXTERNALSYM MF_E_SEQUENCER_UNKNOWN_SEGMENT_ID}

//
// MessageId: MF_S_SEQUENCER_CONTEXT_CANCELED
//
// MessageText:
//
// The context was canceled.%0\n.
//
  MF_S_SEQUENCER_CONTEXT_CANCELED       = _HRESULT_TYPEDEF_($000D61AD);
  {$EXTERNALSYM MF_S_SEQUENCER_CONTEXT_CANCELED}

//
// MessageId: MF_E_NO_SOURCE_IN_CACHE
//
// MessageText:
//
// Cannot find source in source cache.%0\n.
//
  MF_E_NO_SOURCE_IN_CACHE               = _HRESULT_TYPEDEF_($C00D61AE);
  {$EXTERNALSYM MF_E_NO_SOURCE_IN_CACHE}

//
// MessageId: MF_S_SEQUENCER_SEGMENT_AT_END_OF_STREAM
//
// MessageText:
//
// Cannot update topology flags.%0\n.
//
  MF_S_SEQUENCER_SEGMENT_AT_END_OF_STREAM = _HRESULT_TYPEDEF_($000D61AF);
  {$EXTERNALSYM MF_S_SEQUENCER_SEGMENT_AT_END_OF_STREAM}


//////////////////////////////////////////////////////////////////////////////
//
// Transform errors
//
//////////////////////////////////////////////////////////////////////////////

//
// MessageId: MF_E_TRANSFORM_TYPE_NOT_SET
//
// MessageText:
//
// A valid type has not been set for this stream or a stream that it depends on.%0
//
  MF_E_TRANSFORM_TYPE_NOT_SET           = _HRESULT_TYPEDEF_($C00D6D60);
  {$EXTERNALSYM MF_E_TRANSFORM_TYPE_NOT_SET}

//
// MessageId: MF_E_TRANSFORM_STREAM_CHANGE
//
// MessageText:
//
// A stream change has occurred. Output cannot be produced until the streams have been renegotiated.%0
//
  MF_E_TRANSFORM_STREAM_CHANGE          = _HRESULT_TYPEDEF_($C00D6D61);
  {$EXTERNALSYM MF_E_TRANSFORM_STREAM_CHANGE}

//
// MessageId: MF_E_TRANSFORM_INPUT_REMAINING
//
// MessageText:
//
// The transform cannot take the requested action until all of the input data it currently holds is processed or flushed.%0
//
  MF_E_TRANSFORM_INPUT_REMAINING        = _HRESULT_TYPEDEF_($C00D6D62);
  {$EXTERNALSYM MF_E_TRANSFORM_INPUT_REMAINING}

//
// MessageId: MF_E_TRANSFORM_PROFILE_MISSING
//
// MessageText:
//
// The transform requires a profile but no profile was supplied or found.%0
//
  MF_E_TRANSFORM_PROFILE_MISSING        = _HRESULT_TYPEDEF_($C00D6D63);
  {$EXTERNALSYM MF_E_TRANSFORM_PROFILE_MISSING}

//
// MessageId: MF_E_TRANSFORM_PROFILE_INVALID_OR_CORRUPT
//
// MessageText:
//
// The transform requires a profile but the supplied profile was invalid or corrupt.%0
//
  MF_E_TRANSFORM_PROFILE_INVALID_OR_CORRUPT = _HRESULT_TYPEDEF_($C00D6D64);
  {$EXTERNALSYM MF_E_TRANSFORM_PROFILE_INVALID_OR_CORRUPT}

//
// MessageId: MF_E_TRANSFORM_PROFILE_TRUNCATED
//
// MessageText:
//
// The transform requires a profile but the supplied profile ended unexpectedly while parsing.%0
//
  MF_E_TRANSFORM_PROFILE_TRUNCATED      = _HRESULT_TYPEDEF_($C00D6D65);
  {$EXTERNALSYM MF_E_TRANSFORM_PROFILE_TRUNCATED}

//
// MessageId: MF_E_TRANSFORM_PROPERTY_PID_NOT_RECOGNIZED
//
// MessageText:
//
// The property ID does not match any property supported by the transform.%0
//
  MF_E_TRANSFORM_PROPERTY_PID_NOT_RECOGNIZED = _HRESULT_TYPEDEF_($C00D6D66);
  {$EXTERNALSYM MF_E_TRANSFORM_PROPERTY_PID_NOT_RECOGNIZED}

//
// MessageId: MF_E_TRANSFORM_PROPERTY_VARIANT_TYPE_WRONG
//
// MessageText:
//
// The variant does not have the type expected for this property ID.%0
//
  MF_E_TRANSFORM_PROPERTY_VARIANT_TYPE_WRONG = _HRESULT_TYPEDEF_($C00D6D67);
  {$EXTERNALSYM MF_E_TRANSFORM_PROPERTY_VARIANT_TYPE_WRONG}

//
// MessageId: MF_E_TRANSFORM_PROPERTY_NOT_WRITEABLE
//
// MessageText:
//
// An attempt was made to set the value on a read-only property.%0
//
  MF_E_TRANSFORM_PROPERTY_NOT_WRITEABLE = _HRESULT_TYPEDEF_($C00D6D68);
  {$EXTERNALSYM MF_E_TRANSFORM_PROPERTY_NOT_WRITEABLE}

//
// MessageId: MF_E_TRANSFORM_PROPERTY_ARRAY_VALUE_WRONG_NUM_DIM
//
// MessageText:
//
// The array property value has an unexpected number of dimensions.%0
//
  MF_E_TRANSFORM_PROPERTY_ARRAY_VALUE_WRONG_NUM_DIM = _HRESULT_TYPEDEF_($C00D6D69);
  {$EXTERNALSYM MF_E_TRANSFORM_PROPERTY_ARRAY_VALUE_WRONG_NUM_DIM}

//
// MessageId: MF_E_TRANSFORM_PROPERTY_VALUE_SIZE_WRONG
//
// MessageText:
//
// The array or blob property value has an unexpected size.%0
//
  MF_E_TRANSFORM_PROPERTY_VALUE_SIZE_WRONG = _HRESULT_TYPEDEF_($C00D6D6A);
  {$EXTERNALSYM MF_E_TRANSFORM_PROPERTY_VALUE_SIZE_WRONG}

//
// MessageId: MF_E_TRANSFORM_PROPERTY_VALUE_OUT_OF_RANGE
//
// MessageText:
//
// The property value is out of range for this transform.%0
//
  MF_E_TRANSFORM_PROPERTY_VALUE_OUT_OF_RANGE = _HRESULT_TYPEDEF_($C00D6D6B);
  {$EXTERNALSYM MF_E_TRANSFORM_PROPERTY_VALUE_OUT_OF_RANGE}

//
// MessageId: MF_E_TRANSFORM_PROPERTY_VALUE_INCOMPATIBLE
//
// MessageText:
//
// The property value is incompatible with some other property or mediatype set on the transform.%0
//
  MF_E_TRANSFORM_PROPERTY_VALUE_INCOMPATIBLE = _HRESULT_TYPEDEF_($C00D6D6C);
  {$EXTERNALSYM MF_E_TRANSFORM_PROPERTY_VALUE_INCOMPATIBLE}

//
// MessageId: MF_E_TRANSFORM_NOT_POSSIBLE_FOR_CURRENT_OUTPUT_MEDIATYPE
//
// MessageText:
//
// The requested operation is not supported for the currently set output mediatype.%0
//
  MF_E_TRANSFORM_NOT_POSSIBLE_FOR_CURRENT_OUTPUT_MEDIATYPE = _HRESULT_TYPEDEF_($C00D6D6D);
  {$EXTERNALSYM MF_E_TRANSFORM_NOT_POSSIBLE_FOR_CURRENT_OUTPUT_MEDIATYPE}

//
// MessageId: MF_E_TRANSFORM_NOT_POSSIBLE_FOR_CURRENT_INPUT_MEDIATYPE
//
// MessageText:
//
// The requested operation is not supported for the currently set input mediatype.%0
//
  MF_E_TRANSFORM_NOT_POSSIBLE_FOR_CURRENT_INPUT_MEDIATYPE = _HRESULT_TYPEDEF_($C00D6D6E);
  {$EXTERNALSYM MF_E_TRANSFORM_NOT_POSSIBLE_FOR_CURRENT_INPUT_MEDIATYPE}

//
// MessageId: MF_E_TRANSFORM_NOT_POSSIBLE_FOR_CURRENT_MEDIATYPE_COMBINATION
//
// MessageText:
//
// The requested operation is not supported for the currently set combination of mediatypes.%0
//
  MF_E_TRANSFORM_NOT_POSSIBLE_FOR_CURRENT_MEDIATYPE_COMBINATION = _HRESULT_TYPEDEF_($C00D6D6F);
  {$EXTERNALSYM MF_E_TRANSFORM_NOT_POSSIBLE_FOR_CURRENT_MEDIATYPE_COMBINATION}

//
// MessageId: MF_E_TRANSFORM_CONFLICTS_WITH_OTHER_CURRENTLY_ENABLED_FEATURES
//
// MessageText:
//
// The requested feature is not supported in combination with some other currently enabled feature.%0
//
  MF_E_TRANSFORM_CONFLICTS_WITH_OTHER_CURRENTLY_ENABLED_FEATURES = _HRESULT_TYPEDEF_($C00D6D70);
  {$EXTERNALSYM MF_E_TRANSFORM_CONFLICTS_WITH_OTHER_CURRENTLY_ENABLED_FEATURES}

//
// MessageId: MF_E_TRANSFORM_NEED_MORE_INPUT
//
// MessageText:
//
// The transform cannot produce output until it gets more input samples.%0
//
  MF_E_TRANSFORM_NEED_MORE_INPUT        = _HRESULT_TYPEDEF_($C00D6D72);
  {$EXTERNALSYM MF_E_TRANSFORM_NEED_MORE_INPUT}

//
// MessageId: MF_E_TRANSFORM_NOT_POSSIBLE_FOR_CURRENT_SPKR_CONFIG
//
// MessageText:
//
// The requested operation is not supported for the current speaker configuration.%0
//
  MF_E_TRANSFORM_NOT_POSSIBLE_FOR_CURRENT_SPKR_CONFIG = _HRESULT_TYPEDEF_($C00D6D73);
  {$EXTERNALSYM MF_E_TRANSFORM_NOT_POSSIBLE_FOR_CURRENT_SPKR_CONFIG}

//
// MessageId: MF_E_TRANSFORM_CANNOT_CHANGE_MEDIATYPE_WHILE_PROCESSING
//
// MessageText:
//
// The transform cannot accept mediatype changes in the middle of processing.%0
//
  MF_E_TRANSFORM_CANNOT_CHANGE_MEDIATYPE_WHILE_PROCESSING = _HRESULT_TYPEDEF_($C00D6D74);
  {$EXTERNALSYM MF_E_TRANSFORM_CANNOT_CHANGE_MEDIATYPE_WHILE_PROCESSING}

//
// MessageId: MF_S_TRANSFORM_DO_NOT_PROPAGATE_EVENT
//
// MessageText:
//
// The caller should not propagate this event to downstream components.%0
//
  MF_S_TRANSFORM_DO_NOT_PROPAGATE_EVENT = _HRESULT_TYPEDEF_($000D6D75);
  {$EXTERNALSYM MF_S_TRANSFORM_DO_NOT_PROPAGATE_EVENT}

//
// MessageId: MF_E_UNSUPPORTED_D3D_TYPE
//
// MessageText:
//
// The input type is not supported for D3D device.%0
//
  MF_E_UNSUPPORTED_D3D_TYPE             = _HRESULT_TYPEDEF_($C00D6D76);
  {$EXTERNALSYM MF_E_UNSUPPORTED_D3D_TYPE}

//
// MessageId: MF_E_TRANSFORM_ASYNC_LOCKED
//
// MessageText:
//
// The caller does not appear to support this transform's asynchronous capabilities.%0
//
  MF_E_TRANSFORM_ASYNC_LOCKED           = _HRESULT_TYPEDEF_($C00D6D77);
  {$EXTERNALSYM MF_E_TRANSFORM_ASYNC_LOCKED}

//
// MessageId: MF_E_TRANSFORM_CANNOT_INITIALIZE_ACM_DRIVER
//
// MessageText:
//
// An audio compression manager driver could not be initialized by the transform.%0
//
  MF_E_TRANSFORM_CANNOT_INITIALIZE_ACM_DRIVER = _HRESULT_TYPEDEF_($C00D6D78);
  {$EXTERNALSYM MF_E_TRANSFORM_CANNOT_INITIALIZE_ACM_DRIVER}

//
// MessageId: MF_E_TRANSFORM_STREAM_INVALID_RESOLUTION
//
// MessageText:
//
// The input stream has invalid and illegal resolution.
// Output should stop on next ProcessOutput call after the invalid and illegal resolution is detected.%0
//
  MF_E_TRANSFORM_STREAM_INVALID_RESOLUTION = _HRESULT_TYPEDEF_ ($C00D6D79);
  {$EXTERNALSYM MF_E_TRANSFORM_STREAM_INVALID_RESOLUTION}

//
// MessageId: MF_E_TRANSFORM_ASYNC_MFT_NOT_SUPPORTED
//
// MessageText:
//
// The transform cannot be asynchronous in current context.%0
//
  MF_E_TRANSFORM_ASYNC_MFT_NOT_SUPPORTED = _HRESULT_TYPEDEF_ ($C00D6D7A);
  {$EXTERNALSYM MF_E_TRANSFORM_ASYNC_MFT_NOT_SUPPORTED}

//
// MessageId: MF_E_TRANSFORM_EXATTRIBUTE_NOT_SUPPORTED
//
// MessageText:
//
// It is not supported in the current context to have the transform copy attributes from an input sample to an output sample.%0
//
  MF_E_TRANSFORM_EXATTRIBUTE_NOT_SUPPORTED = _HRESULT_TYPEDEF_ ($C00D6D7C);
  {$EXTERNALSYM MF_E_TRANSFORM_EXATTRIBUTE_NOT_SUPPORTED}


//////////////////////////////////////////////////////////////////////////////
//
// Content Protection errors
//
//////////////////////////////////////////////////////////////////////////////

//
// MessageId: MF_E_LICENSE_INCORRECT_RIGHTS
//
// MessageText:
//
// You are not allowed to open this file. Contact the content provider for further assistance.%0
//
  MF_E_LICENSE_INCORRECT_RIGHTS         = _HRESULT_TYPEDEF_($C00D7148);
  {$EXTERNALSYM MF_E_LICENSE_INCORRECT_RIGHTS}

//
// MessageId: MF_E_LICENSE_OUTOFDATE
//
// MessageText:
//
// The license for this media file has expired. Get a new license or contact the content provider for further assistance.%0
//
  MF_E_LICENSE_OUTOFDATE                = _HRESULT_TYPEDEF_($C00D7149);
  {$EXTERNALSYM MF_E_LICENSE_OUTOFDATE}

//
// MessageId: MF_E_LICENSE_REQUIRED
//
// MessageText:
//
// You need a license to perform the requested operation on this media file.%0
//
  MF_E_LICENSE_REQUIRED                 = _HRESULT_TYPEDEF_($C00D714A);
  {$EXTERNALSYM MF_E_LICENSE_REQUIRED}

//
// MessageId: MF_E_DRM_HARDWARE_INCONSISTENT
//
// MessageText:
//
// The licenses for your media files are corrupted. Contact Microsoft product support.%0
//
  MF_E_DRM_HARDWARE_INCONSISTENT        = _HRESULT_TYPEDEF_($C00D714B);
  {$EXTERNALSYM MF_E_DRM_HARDWARE_INCONSISTENT}

//
// MessageId: MF_E_NO_CONTENT_PROTECTION_MANAGER
//
// MessageText:
//
// The APP needs to provide IMFContentProtectionManager callback to access the protected media file.%0
//
  MF_E_NO_CONTENT_PROTECTION_MANAGER    = _HRESULT_TYPEDEF_($C00D714C);
  {$EXTERNALSYM MF_E_NO_CONTENT_PROTECTION_MANAGER}

//
// MessageId: MF_E_LICENSE_RESTORE_NO_RIGHTS
//
// MessageText:
//
// Client does not have rights to restore licenses.%0
//
  MF_E_LICENSE_RESTORE_NO_RIGHTS        = _HRESULT_TYPEDEF_($C00D714D);
  {$EXTERNALSYM MF_E_LICENSE_RESTORE_NO_RIGHTS}

//
// MessageId: MF_E_BACKUP_RESTRICTED_LICENSE
//
// MessageText:
//
// Licenses are restricted and hence can not be backed up.%0
//
  MF_E_BACKUP_RESTRICTED_LICENSE        = _HRESULT_TYPEDEF_($C00D714E);
  {$EXTERNALSYM MF_E_BACKUP_RESTRICTED_LICENSE}

//
// MessageId: MF_E_LICENSE_RESTORE_NEEDS_INDIVIDUALIZATION
//
// MessageText:
//
// License restore requires machine to be individualized.%0
//
  MF_E_LICENSE_RESTORE_NEEDS_INDIVIDUALIZATION = _HRESULT_TYPEDEF_($C00D714F);
  {$EXTERNALSYM MF_E_LICENSE_RESTORE_NEEDS_INDIVIDUALIZATION}

//
// MessageId: MF_S_PROTECTION_NOT_REQUIRED
//
// MessageText:
//
// Protection for stream is not required.%0
//
  MF_S_PROTECTION_NOT_REQUIRED          = _HRESULT_TYPEDEF_($000D7150);
  {$EXTERNALSYM MF_S_PROTECTION_NOT_REQUIRED}

//
// MessageId: MF_E_COMPONENT_REVOKED
//
// MessageText:
//
// Component is revoked.%0
//
  MF_E_COMPONENT_REVOKED                = _HRESULT_TYPEDEF_($C00D7151);
  {$EXTERNALSYM MF_E_COMPONENT_REVOKED}

//
// MessageId: MF_E_TRUST_DISABLED
//
// MessageText:
//
// Trusted functionality is currently disabled on this component.%0
//
  MF_E_TRUST_DISABLED                   = _HRESULT_TYPEDEF_($C00D7152);
  {$EXTERNALSYM MF_E_TRUST_DISABLED}

//
// MessageId: MF_E_WMDRMOTA_NO_ACTION
//
// MessageText:
//
// No Action is set on WMDRM Output Trust Authority.%0
//
  MF_E_WMDRMOTA_NO_ACTION               = _HRESULT_TYPEDEF_($C00D7153);
  {$EXTERNALSYM MF_E_WMDRMOTA_NO_ACTION}

//
// MessageId: MF_E_WMDRMOTA_ACTION_ALREADY_SET
//
// MessageText:
//
// Action is already set on WMDRM Output Trust Authority.%0
//
  MF_E_WMDRMOTA_ACTION_ALREADY_SET      = _HRESULT_TYPEDEF_($C00D7154);
  {$EXTERNALSYM MF_E_WMDRMOTA_ACTION_ALREADY_SET}

//
// MessageId: MF_E_WMDRMOTA_DRM_HEADER_NOT_AVAILABLE
//
// MessageText:
//
// DRM Heaader is not available.%0
//
  MF_E_WMDRMOTA_DRM_HEADER_NOT_AVAILABLE = _HRESULT_TYPEDEF_($C00D7155);
  {$EXTERNALSYM MF_E_WMDRMOTA_DRM_HEADER_NOT_AVAILABLE}

//
// MessageId: MF_E_WMDRMOTA_DRM_ENCRYPTION_SCHEME_NOT_SUPPORTED
//
// MessageText:
//
// Current encryption scheme is not supported.%0
//
  MF_E_WMDRMOTA_DRM_ENCRYPTION_SCHEME_NOT_SUPPORTED = _HRESULT_TYPEDEF_($C00D7156);
  {$EXTERNALSYM MF_E_WMDRMOTA_DRM_ENCRYPTION_SCHEME_NOT_SUPPORTED}

//
// MessageId: MF_E_WMDRMOTA_ACTION_MISMATCH
//
// MessageText:
//
// Action does not match with current configuration.%0
//
  MF_E_WMDRMOTA_ACTION_MISMATCH         = _HRESULT_TYPEDEF_($C00D7157);
  {$EXTERNALSYM MF_E_WMDRMOTA_ACTION_MISMATCH}

//
// MessageId: MF_E_WMDRMOTA_INVALID_POLICY
//
// MessageText:
//
// Invalid policy for WMDRM Output Trust Authority.%0
//
  MF_E_WMDRMOTA_INVALID_POLICY          = _HRESULT_TYPEDEF_($C00D7158);
  {$EXTERNALSYM MF_E_WMDRMOTA_INVALID_POLICY}

//
// MessageId: MF_E_POLICY_UNSUPPORTED
//
// MessageText:
//
// The policies that the Input Trust Authority requires to be enforced are unsupported by the outputs.%0
//
  MF_E_POLICY_UNSUPPORTED               = _HRESULT_TYPEDEF_($C00D7159);
  {$EXTERNALSYM MF_E_POLICY_UNSUPPORTED}

//
// MessageId: MF_E_OPL_NOT_SUPPORTED
//
// MessageText:
//
// The OPL that the license requires to be enforced are not supported by the Input Trust Authority.%0
//
  MF_E_OPL_NOT_SUPPORTED                = _HRESULT_TYPEDEF_($C00D715A);
  {$EXTERNALSYM MF_E_OPL_NOT_SUPPORTED}

//
// MessageId: MF_E_TOPOLOGY_VERIFICATION_FAILED
//
// MessageText:
//
// The topology could not be successfully verified.%0
//
  MF_E_TOPOLOGY_VERIFICATION_FAILED     = _HRESULT_TYPEDEF_($C00D715B);
  {$EXTERNALSYM MF_E_TOPOLOGY_VERIFICATION_FAILED}

//
// MessageId: MF_E_SIGNATURE_VERIFICATION_FAILED
//
// MessageText:
//
// Signature verification could not be completed successfully for this component.%0
//
  MF_E_SIGNATURE_VERIFICATION_FAILED    = _HRESULT_TYPEDEF_($C00D715C);
  {$EXTERNALSYM MF_E_SIGNATURE_VERIFICATION_FAILED}

//
// MessageId: MF_E_DEBUGGING_NOT_ALLOWED
//
// MessageText:
//
// Running this process under a debugger while using protected content is not allowed.%0
//
  MF_E_DEBUGGING_NOT_ALLOWED            = _HRESULT_TYPEDEF_($C00D715D);
  {$EXTERNALSYM MF_E_DEBUGGING_NOT_ALLOWED}

//
// MessageId: MF_E_CODE_EXPIRED
//
// MessageText:
//
// MF component has expired.%0
//
  MF_E_CODE_EXPIRED                     = _HRESULT_TYPEDEF_($C00D715E);
  {$EXTERNALSYM MF_E_CODE_EXPIRED}

//
// MessageId: MF_E_GRL_VERSION_TOO_LOW
//
// MessageText:
//
// The current GRL on the machine does not meet the minimum version requirements.%0
//
  MF_E_GRL_VERSION_TOO_LOW              = _HRESULT_TYPEDEF_($C00D715F);
  {$EXTERNALSYM MF_E_GRL_VERSION_TOO_LOW}

//
// MessageId: MF_E_GRL_RENEWAL_NOT_FOUND
//
// MessageText:
//
// The current GRL on the machine does not contain any renewal entries for the specified revocation.%0
//
  MF_E_GRL_RENEWAL_NOT_FOUND            = _HRESULT_TYPEDEF_($C00D7160);
  {$EXTERNALSYM MF_E_GRL_RENEWAL_NOT_FOUND}

//
// MessageId: MF_E_GRL_EXTENSIBLE_ENTRY_NOT_FOUND
//
// MessageText:
//
// The current GRL on the machine does not contain any extensible entries for the specified extension GUID.%0
//
  MF_E_GRL_EXTENSIBLE_ENTRY_NOT_FOUND   = _HRESULT_TYPEDEF_($C00D7161);
  {$EXTERNALSYM MF_E_GRL_EXTENSIBLE_ENTRY_NOT_FOUND}

//
// MessageId: MF_E_KERNEL_UNTRUSTED
//
// MessageText:
//
// The kernel isn't secure for high security level content.%0
//
  MF_E_KERNEL_UNTRUSTED                 = _HRESULT_TYPEDEF_($C00D7162);
  {$EXTERNALSYM MF_E_KERNEL_UNTRUSTED}

//
// MessageId: MF_E_PEAUTH_UNTRUSTED
//
// MessageText:
//
// The response from protected environment driver isn't valid.%0
//
  MF_E_PEAUTH_UNTRUSTED                 = _HRESULT_TYPEDEF_($C00D7163);
  {$EXTERNALSYM MF_E_PEAUTH_UNTRUSTED}

//
// MessageId: MF_E_NON_PE_PROCESS
//
// MessageText:
//
// A non-PE process tried to talk to PEAuth.%0
//
  MF_E_NON_PE_PROCESS                   = _HRESULT_TYPEDEF_($C00D7165);
  {$EXTERNALSYM MF_E_NON_PE_PROCESS}

//
// MessageId: MF_E_REBOOT_REQUIRED
//
// MessageText:
//
// We need to reboot the machine.%0
//
  MF_E_REBOOT_REQUIRED                  = _HRESULT_TYPEDEF_($C00D7167);
  {$EXTERNALSYM MF_E_REBOOT_REQUIRED}

//
// MessageId: MF_S_WAIT_FOR_POLICY_SET
//
// MessageText:
//
// Protection for this stream is not guaranteed to be enforced until the MEPolicySet event is fired.%0
//
  MF_S_WAIT_FOR_POLICY_SET              = _HRESULT_TYPEDEF_($000D7168);
  {$EXTERNALSYM MF_S_WAIT_FOR_POLICY_SET}

//
// MessageId: MF_S_VIDEO_DISABLED_WITH_UNKNOWN_SOFTWARE_OUTPUT
//
// MessageText:
//
// This video stream is disabled because it is being sent to an unknown software output.%0
//
  MF_S_VIDEO_DISABLED_WITH_UNKNOWN_SOFTWARE_OUTPUT = _HRESULT_TYPEDEF_($000D7169);
  {$EXTERNALSYM MF_S_VIDEO_DISABLED_WITH_UNKNOWN_SOFTWARE_OUTPUT}

//
// MessageId: MF_E_GRL_INVALID_FORMAT
//
// MessageText:
//
// The GRL file is not correctly formed, it may have been corrupted or overwritten.%0
//
  MF_E_GRL_INVALID_FORMAT               = _HRESULT_TYPEDEF_($C00D716A);
  {$EXTERNALSYM MF_E_GRL_INVALID_FORMAT}

//
// MessageId: MF_E_GRL_UNRECOGNIZED_FORMAT
//
// MessageText:
//
// The GRL file is in a format newer than those recognized by this GRL Reader.%0
//
  MF_E_GRL_UNRECOGNIZED_FORMAT          = _HRESULT_TYPEDEF_($C00D716B);
  {$EXTERNALSYM MF_E_GRL_UNRECOGNIZED_FORMAT}

//
// MessageId: MF_E_ALL_PROCESS_RESTART_REQUIRED
//
// MessageText:
//
// The GRL was reloaded and required all processes that can run protected media to restart.%0
//
  MF_E_ALL_PROCESS_RESTART_REQUIRED     = _HRESULT_TYPEDEF_($C00D716C);
  {$EXTERNALSYM MF_E_ALL_PROCESS_RESTART_REQUIRED}

//
// MessageId: MF_E_PROCESS_RESTART_REQUIRED
//
// MessageText:
//
// The GRL was reloaded and the current process needs to restart.%0
//
  MF_E_PROCESS_RESTART_REQUIRED         = _HRESULT_TYPEDEF_($C00D716D);
  {$EXTERNALSYM MF_E_PROCESS_RESTART_REQUIRED}

//
// MessageId: MF_E_USERMODE_UNTRUSTED
//
// MessageText:
//
// The user space is untrusted for protected content play.%0
//
  MF_E_USERMODE_UNTRUSTED               = _HRESULT_TYPEDEF_($C00D716E);
  {$EXTERNALSYM MF_E_USERMODE_UNTRUSTED}

//
// MessageId: MF_E_PEAUTH_SESSION_NOT_STARTED
//
// MessageText:
//
// PEAuth communication session hasn't been started.%0
//
  MF_E_PEAUTH_SESSION_NOT_STARTED       = _HRESULT_TYPEDEF_($C00D716F);
  {$EXTERNALSYM MF_E_PEAUTH_SESSION_NOT_STARTED}

//
// MessageId: MF_E_PEAUTH_PUBLICKEY_REVOKED
//
// MessageText:
//
// PEAuth's public key is revoked.%0
//
  MF_E_PEAUTH_PUBLICKEY_REVOKED         = _HRESULT_TYPEDEF_($C00D7171);
  {$EXTERNALSYM MF_E_PEAUTH_PUBLICKEY_REVOKED}

//
// MessageId: MF_E_GRL_ABSENT
//
// MessageText:
//
// The GRL is absent.%0
//
  MF_E_GRL_ABSENT                       = _HRESULT_TYPEDEF_($C00D7172);
  {$EXTERNALSYM MF_E_GRL_ABSENT}

//
// MessageId: MF_S_PE_TRUSTED
//
// MessageText:
//
// The Protected Environment is trusted.%0
//
  MF_S_PE_TRUSTED                       = _HRESULT_TYPEDEF_($000D7173);
  {$EXTERNALSYM MF_S_PE_TRUSTED}

//
// MessageId: MF_E_PE_UNTRUSTED
//
// MessageText:
//
// The Protected Environment is untrusted.%0
//
  MF_E_PE_UNTRUSTED                     = _HRESULT_TYPEDEF_($C00D7174);
  {$EXTERNALSYM MF_E_PE_UNTRUSTED}

//
// MessageId: MF_E_PEAUTH_NOT_STARTED
//
// MessageText:
//
// The Protected Environment Authorization service (PEAUTH) has not been started.%0
//
  MF_E_PEAUTH_NOT_STARTED               = _HRESULT_TYPEDEF_($C00D7175);
  {$EXTERNALSYM MF_E_PEAUTH_NOT_STARTED}

//
// MessageId: MF_E_INCOMPATIBLE_SAMPLE_PROTECTION
//
// MessageText:
//
// The sample protection algorithms supported by components are not compatible.%0
//
  MF_E_INCOMPATIBLE_SAMPLE_PROTECTION   = _HRESULT_TYPEDEF_($C00D7176);
  {$EXTERNALSYM MF_E_INCOMPATIBLE_SAMPLE_PROTECTION}

//
// MessageId: MF_E_PE_SESSIONS_MAXED
//
// MessageText:
//
// No more protected environment sessions can be supported.%0
//
  MF_E_PE_SESSIONS_MAXED                = _HRESULT_TYPEDEF_($C00D7177);
  {$EXTERNALSYM MF_E_PE_SESSIONS_MAXED}

//
// MessageId: MF_E_HIGH_SECURITY_LEVEL_CONTENT_NOT_ALLOWED
//
// MessageText:
//
// WMDRM ITA does not allow protected content with high security level for this release.%0
//
  MF_E_HIGH_SECURITY_LEVEL_CONTENT_NOT_ALLOWED = _HRESULT_TYPEDEF_($C00D7178);
  {$EXTERNALSYM MF_E_HIGH_SECURITY_LEVEL_CONTENT_NOT_ALLOWED}

//
// MessageId: MF_E_TEST_SIGNED_COMPONENTS_NOT_ALLOWED
//
// MessageText:
//
// WMDRM ITA cannot allow the requested action for the content as one or more components is not properly signed.%0
//
  MF_E_TEST_SIGNED_COMPONENTS_NOT_ALLOWED = _HRESULT_TYPEDEF_($C00D7179);
  {$EXTERNALSYM MF_E_TEST_SIGNED_COMPONENTS_NOT_ALLOWED}

//
// MessageId: MF_E_ITA_UNSUPPORTED_ACTION
//
// MessageText:
//
// WMDRM ITA does not support the requested action.%0
//
  MF_E_ITA_UNSUPPORTED_ACTION           = _HRESULT_TYPEDEF_($C00D717A);
  {$EXTERNALSYM MF_E_ITA_UNSUPPORTED_ACTION}

//
// MessageId: MF_E_ITA_ERROR_PARSING_SAP_PARAMETERS
//
// MessageText:
//
// WMDRM ITA encountered an error in parsing the Secure Audio Path parameters.%0
//
  MF_E_ITA_ERROR_PARSING_SAP_PARAMETERS = _HRESULT_TYPEDEF_($C00D717B);
  {$EXTERNALSYM MF_E_ITA_ERROR_PARSING_SAP_PARAMETERS}

//
// MessageId: MF_E_POLICY_MGR_ACTION_OUTOFBOUNDS
//
// MessageText:
//
// The Policy Manager action passed in is invalid.%0
//
  MF_E_POLICY_MGR_ACTION_OUTOFBOUNDS    = _HRESULT_TYPEDEF_($C00D717C);
  {$EXTERNALSYM MF_E_POLICY_MGR_ACTION_OUTOFBOUNDS}

//
// MessageId: MF_E_BAD_OPL_STRUCTURE_FORMAT
//
// MessageText:
//
// The structure specifying Output Protection Level is not the correct format.%0
//
  MF_E_BAD_OPL_STRUCTURE_FORMAT         = _HRESULT_TYPEDEF_($C00D717D);
  {$EXTERNALSYM MF_E_BAD_OPL_STRUCTURE_FORMAT}

//
// MessageId: MF_E_ITA_UNRECOGNIZED_ANALOG_VIDEO_PROTECTION_GUID
//
// MessageText:
//
// WMDRM ITA does not recognize the Explicite Analog Video Output Protection guid specified in the license.%0
//
  MF_E_ITA_UNRECOGNIZED_ANALOG_VIDEO_PROTECTION_GUID = _HRESULT_TYPEDEF_($C00D717E);
  {$EXTERNALSYM MF_E_ITA_UNRECOGNIZED_ANALOG_VIDEO_PROTECTION_GUID}

//
// MessageId: MF_E_NO_PMP_HOST
//
// MessageText:
//
// IMFPMPHost object not available.%0
//
  MF_E_NO_PMP_HOST                      = _HRESULT_TYPEDEF_($C00D717F);
  {$EXTERNALSYM MF_E_NO_PMP_HOST}

//
// MessageId: MF_E_ITA_OPL_DATA_NOT_INITIALIZED
//
// MessageText:
//
// WMDRM ITA could not initialize the Output Protection Level data.%0
//
  MF_E_ITA_OPL_DATA_NOT_INITIALIZED     = _HRESULT_TYPEDEF_($C00D7180);
  {$EXTERNALSYM MF_E_ITA_OPL_DATA_NOT_INITIALIZED}

//
// MessageId: MF_E_ITA_UNRECOGNIZED_ANALOG_VIDEO_OUTPUT
//
// MessageText:
//
// WMDRM ITA does not recognize the Analog Video Output specified by the OTA.%0
//
  MF_E_ITA_UNRECOGNIZED_ANALOG_VIDEO_OUTPUT = _HRESULT_TYPEDEF_($C00D7181);
  {$EXTERNALSYM MF_E_ITA_UNRECOGNIZED_ANALOG_VIDEO_OUTPUT}

//
// MessageId: MF_E_ITA_UNRECOGNIZED_DIGITAL_VIDEO_OUTPUT
//
// MessageText:
//
// WMDRM ITA does not recognize the Digital Video Output specified by the OTA.%0
//
  MF_E_ITA_UNRECOGNIZED_DIGITAL_VIDEO_OUTPUT = _HRESULT_TYPEDEF_($C00D7182);
  {$EXTERNALSYM MF_E_ITA_UNRECOGNIZED_DIGITAL_VIDEO_OUTPUT}


//////////////////////////////////////////////////////////////////////////////
//
// Clock errors
//
//////////////////////////////////////////////////////////////////////////////

//
// MessageId: MF_E_CLOCK_INVALID_CONTINUITY_KEY
//
// MessageText:
//
// The continuity key supplied is not currently valid.%0
//
  MF_E_CLOCK_INVALID_CONTINUITY_KEY     = _HRESULT_TYPEDEF_($C00D9C40);
  {$EXTERNALSYM MF_E_CLOCK_INVALID_CONTINUITY_KEY}

//
// MessageId: MF_E_CLOCK_NO_TIME_SOURCE
//
// MessageText:
//
// No Presentation Time Source has been specified.%0
//
  MF_E_CLOCK_NO_TIME_SOURCE             = _HRESULT_TYPEDEF_($C00D9C41);
  {$EXTERNALSYM MF_E_CLOCK_NO_TIME_SOURCE}

//
// MessageId: MF_E_CLOCK_STATE_ALREADY_SET
//
// MessageText:
//
// The clock is already in the requested state.%0
//
  MF_E_CLOCK_STATE_ALREADY_SET          = _HRESULT_TYPEDEF_($C00D9C42);
  {$EXTERNALSYM MF_E_CLOCK_STATE_ALREADY_SET}

//
// MessageId: MF_E_CLOCK_NOT_SIMPLE
//
// MessageText:
//
// The clock has too many advanced features to carry out the request.%0
//
  MF_E_CLOCK_NOT_SIMPLE                 = _HRESULT_TYPEDEF_($C00D9C43);
  {$EXTERNALSYM MF_E_CLOCK_NOT_SIMPLE}

//
// MessageId: MF_S_CLOCK_STOPPED
//
// MessageText:
//
// Timer.SetTimer returns this success code if called happened while timer is stopped. Timer is not going to be dispatched until clock is running%0
//
  MF_S_CLOCK_STOPPED                    = _HRESULT_TYPEDEF_($000D9C44);
  {$EXTERNALSYM MF_S_CLOCK_STOPPED}

//
// MessageId: MF_E_CLOCK_AUDIO_DEVICE_POSITION_UNEXPECTED
//
// MessageText:
//
// The clock can't return a valid time because the audio position returned from the audio playback device is unexpected.%0
//
  MF_E_CLOCK_AUDIO_DEVICE_POSITION_UNEXPECTED = _HRESULT_TYPEDEF_ ($000D9C45);
  {$EXTERNALSYM MF_E_CLOCK_AUDIO_DEVICE_POSITION_UNEXPECTED}

//
// MessageId: MF_E_CLOCK_AUDIO_RENDER_POSITION_UNEXPECTED
//
// MessageText:
//
// The clock can't return a valid render time because the audio position specified to the clock is unexpected.%0
//
  MF_E_CLOCK_AUDIO_RENDER_POSITION_UNEXPECTED= _HRESULT_TYPEDEF_ ($000D9C46);
  {$EXTERNALSYM MF_E_CLOCK_AUDIO_RENDER_POSITION_UNEXPECTED}

//
// MessageId: MF_E_CLOCK_AUDIO_RENDER_TIME_UNEXPECTED
//
// MessageText:
//
// The clock can't return a valid render position because the timestamp specified to the clock is unexpected.%0
//
  MF_E_CLOCK_AUDIO_RENDER_TIME_UNEXPECTED= _HRESULT_TYPEDEF_ ($000D9C47);
  {$EXTERNALSYM MF_E_CLOCK_AUDIO_RENDER_TIME_UNEXPECTED}



//////////////////////////////////////////////////////////////////////////////
//
// MF Quality Management errors
//
//////////////////////////////////////////////////////////////////////////////

//
// MessageId: MF_E_NO_MORE_DROP_MODES
//
// MessageText:
//
// The component does not support any more drop modes.%0
//
  MF_E_NO_MORE_DROP_MODES               = _HRESULT_TYPEDEF_($C00DA028);
  {$EXTERNALSYM MF_E_NO_MORE_DROP_MODES}

//
// MessageId: MF_E_NO_MORE_QUALITY_LEVELS
//
// MessageText:
//
// The component does not support any more quality levels.%0
//
  MF_E_NO_MORE_QUALITY_LEVELS           = _HRESULT_TYPEDEF_($C00DA029);
  {$EXTERNALSYM MF_E_NO_MORE_QUALITY_LEVELS}

//
// MessageId: MF_E_DROPTIME_NOT_SUPPORTED
//
// MessageText:
//
// The component does not support drop time functionality.%0
//
  MF_E_DROPTIME_NOT_SUPPORTED           = _HRESULT_TYPEDEF_($C00DA02A);
  {$EXTERNALSYM MF_E_DROPTIME_NOT_SUPPORTED}

//
// MessageId: MF_E_QUALITYKNOB_WAIT_LONGER
//
// MessageText:
//
// Quality Manager needs to wait longer before bumping the Quality Level up.%0
//
  MF_E_QUALITYKNOB_WAIT_LONGER          = _HRESULT_TYPEDEF_($C00DA02B);
  {$EXTERNALSYM MF_E_QUALITYKNOB_WAIT_LONGER}

//
// MessageId: MF_E_QM_INVALIDSTATE
//
// MessageText:
//
// Quality Manager is in an invalid state. Quality Management is off at this moment.%0
//
  MF_E_QM_INVALIDSTATE                  = _HRESULT_TYPEDEF_($C00DA02C);
  {$EXTERNALSYM MF_E_QM_INVALIDSTATE}


//////////////////////////////////////////////////////////////////////////////
//
// MF Transcode errors
//
//////////////////////////////////////////////////////////////////////////////

//
// MessageId: MF_E_TRANSCODE_NO_CONTAINERTYPE
//
// MessageText:
//
// No transcode output container type is specified.%0
//
  MF_E_TRANSCODE_NO_CONTAINERTYPE       = _HRESULT_TYPEDEF_($C00DA410);
  {$EXTERNALSYM MF_E_TRANSCODE_NO_CONTAINERTYPE}

//
// MessageId: MF_E_TRANSCODE_PROFILE_NO_MATCHING_STREAMS
//
// MessageText:
//
// The profile does not have a media type configuration for any selected source streams.%0
//
  MF_E_TRANSCODE_PROFILE_NO_MATCHING_STREAMS = _HRESULT_TYPEDEF_($C00DA411);
  {$EXTERNALSYM MF_E_TRANSCODE_PROFILE_NO_MATCHING_STREAMS}

//
// MessageId: MF_E_TRANSCODE_NO_MATCHING_ENCODER
//
// MessageText:
//
// Cannot find an encoder MFT that accepts the user preferred output type.%0
//
  MF_E_TRANSCODE_NO_MATCHING_ENCODER    = _HRESULT_TYPEDEF_($C00DA412);
  {$EXTERNALSYM MF_E_TRANSCODE_NO_MATCHING_ENCODER}


//////////////////////////////////////////////////////////////////////////////
//
// MF HW Device Proxy errors
//
//////////////////////////////////////////////////////////////////////////////

//
// MessageId: MF_E_ALLOCATOR_NOT_INITIALIZED
//
// MessageText:
//
// Memory allocator is not initialized.%0
//
  MF_E_ALLOCATOR_NOT_INITIALIZED        = _HRESULT_TYPEDEF_($C00DA7F8);
  {$EXTERNALSYM MF_E_ALLOCATOR_NOT_INITIALIZED}

//
// MessageId: MF_E_ALLOCATOR_NOT_COMMITED
//
// MessageText:
//
// Memory allocator is not committed yet.%0
//
  MF_E_ALLOCATOR_NOT_COMMITED           = _HRESULT_TYPEDEF_($C00DA7F9);
  {$EXTERNALSYM MF_E_ALLOCATOR_NOT_COMMITED}

//
// MessageId: MF_E_ALLOCATOR_ALREADY_COMMITED
//
// MessageText:
//
// Memory allocator has already been committed.%0
//
  MF_E_ALLOCATOR_ALREADY_COMMITED       = _HRESULT_TYPEDEF_($C00DA7FA);
  {$EXTERNALSYM MF_E_ALLOCATOR_ALREADY_COMMITED}

//
// MessageId: MF_E_STREAM_ERROR
//
// MessageText:
//
// An error occurred in media stream.%0
//
  MF_E_STREAM_ERROR                     = _HRESULT_TYPEDEF_($C00DA7FB);
  {$EXTERNALSYM MF_E_STREAM_ERROR}

//
// MessageId: MF_E_INVALID_STREAM_STATE
//
// MessageText:
//
// Stream is not in a state to handle the request.%0
//
  MF_E_INVALID_STREAM_STATE             = _HRESULT_TYPEDEF_($C00DA7FC);
  {$EXTERNALSYM MF_E_INVALID_STREAM_STATE}

//
// MessageId: MF_E_HW_STREAM_NOT_CONNECTED
//
// MessageText:
//
// Hardware stream is not connected yet.%0
//
  MF_E_HW_STREAM_NOT_CONNECTED          = _HRESULT_TYPEDEF_($C00DA7FD);
  {$EXTERNALSYM MF_E_HW_STREAM_NOT_CONNECTED}

// SDK 10.0.10240.0 //////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////
//
// MF Capture Engine and MediaCapture errors
//
//////////////////////////////////////////////////////////////////////////////

//
// MessageId: MF_E_NO_CAPTURE_DEVICES_AVAILABLE
//
// MessageText:
//
// No capture devices are available.%0
//
  MF_E_NO_CAPTURE_DEVICES_AVAILABLE   = _HRESULT_TYPEDEF_ ($C00DABE0);
  {$EXTERNALSYM MF_E_NO_CAPTURE_DEVICES_AVAILABLE}

//
// MessageId: MF_E_CAPTURE_SINK_OUTPUT_NOT_SET
//
// MessageText:
//
// No output was set for recording.%0
//
  MF_E_CAPTURE_SINK_OUTPUT_NOT_SET    = _HRESULT_TYPEDEF_ ($C00DABE1);
  {$EXTERNALSYM MF_E_CAPTURE_SINK_OUTPUT_NOT_SET}

//
// MessageId: MF_E_CAPTURE_SINK_MIRROR_ERROR
//
// MessageText:
//
// The current capture sink configuration does not support mirroring.%0
//
  MF_E_CAPTURE_SINK_MIRROR_ERROR      = _HRESULT_TYPEDEF_ ($C00DABE2);
  {$EXTERNALSYM MF_E_CAPTURE_SINK_MIRROR_ERROR}

//
// MessageId: MF_E_CAPTURE_SINK_ROTATE_ERROR
//
// MessageText:
//
// The current capture sink configuration does not support rotation.%0
//
  MF_E_CAPTURE_SINK_ROTATE_ERROR      = _HRESULT_TYPEDEF_ ($C00DABE3);
  {$EXTERNALSYM MF_E_CAPTURE_SINK_ROTATE_ERROR}

//
// MessageId: MF_E_CAPTURE_ENGINE_INVALID_OP
//
// MessageText:
//
// The op is invalid.%0
//
  MF_E_CAPTURE_ENGINE_INVALID_OP      = _HRESULT_TYPEDEF_ ($C00DABE4);
  {$EXTERNALSYM MF_E_CAPTURE_ENGINE_INVALID_OP}

//
// MessageId: MF_E_CAPTURE_ENGINE_ALL_EFFECTS_REMOVED
//
// MessageText:
//
// The effects previously added were incompatible with the new topology which caused all effects to be removed.%0
//
  MF_E_CAPTURE_ENGINE_ALL_EFFECTS_REMOVED = _HRESULT_TYPEDEF_ ($C00DABE5);
  {$EXTERNALSYM MF_E_CAPTURE_ENGINE_ALL_EFFECTS_REMOVED}

//
// MessageId: MF_E_CAPTURE_SOURCE_NO_INDEPENDENT_PHOTO_STREAM_PRESENT
//
// MessageText:
//
// The current capture source does not have an independent photo stream.%0
//
  MF_E_CAPTURE_SOURCE_NO_INDEPENDENT_PHOTO_STREAM_PRESENT = _HRESULT_TYPEDEF_ ($C00DABE6);
  {$EXTERNALSYM MF_E_CAPTURE_SOURCE_NO_INDEPENDENT_PHOTO_STREAM_PRESENT}

//
// MessageId: MF_E_CAPTURE_SOURCE_NO_VIDEO_STREAM_PRESENT
//
// MessageText:
//
// The current capture source does not have a video stream.%0
//
  MF_E_CAPTURE_SOURCE_NO_VIDEO_STREAM_PRESENT = _HRESULT_TYPEDEF_ ($C00DABE7);
  {$EXTERNALSYM MF_E_CAPTURE_SOURCE_NO_VIDEO_STREAM_PRESENT}

//
// MessageId: MF_E_CAPTURE_SOURCE_NO_AUDIO_STREAM_PRESENT
//
// MessageText:
//
// The current capture source does not have an audio stream.%0
//
  MF_E_CAPTURE_SOURCE_NO_AUDIO_STREAM_PRESENT = _HRESULT_TYPEDEF_ ($C00DABE8);
  {$EXTERNALSYM MF_E_CAPTURE_SOURCE_NO_AUDIO_STREAM_PRESENT}

//
// MessageId: MF_E_CAPTURE_SOURCE_DEVICE_EXTENDEDPROP_OP_IN_PROGRESS
//
// MessageText:
//
// The capture source device has an asynchronous extended property operation in progress.%0
//
  MF_E_CAPTURE_SOURCE_DEVICE_EXTENDEDPROP_OP_IN_PROGRESS= _HRESULT_TYPEDEF_ ($C00DABE9);
  {$EXTERNALSYM MF_E_CAPTURE_SOURCE_DEVICE_EXTENDEDPROP_OP_IN_PROGRESS}

//
// MessageId: MF_E_CAPTURE_PROPERTY_SET_DURING_PHOTO
//
// MessageText:
//
// A property cannot be set because a photo or photo sequence is in progress.%0
//
  MF_E_CAPTURE_PROPERTY_SET_DURING_PHOTO = _HRESULT_TYPEDEF_ ($C00DABEA);
  {$EXTERNALSYM MF_E_CAPTURE_PROPERTY_SET_DURING_PHOTO}

//
// MessageId: MF_E_CAPTURE_NO_SAMPLES_IN_QUEUE
//
// MessageText:
//
// No more samples in queue.%0
//
  MF_E_CAPTURE_NO_SAMPLES_IN_QUEUE    = _HRESULT_TYPEDEF_ ($C00DABEB);
  {$EXTERNALSYM MF_E_CAPTURE_NO_SAMPLES_IN_QUEUE}

//
// MessageId: MF_E_HW_ACCELERATED_THUMBNAIL_NOT_SUPPORTED
//
// MessageText:
//
// Hardware accelerated thumbnail generation is not supported for the currently selected mediatype on the mediacapture stream.%0
//
  MF_E_HW_ACCELERATED_THUMBNAIL_NOT_SUPPORTED = _HRESULT_TYPEDEF_ ($C00DABEC);
  {$EXTERNALSYM MF_E_HW_ACCELERATED_THUMBNAIL_NOT_SUPPORTED}

//
// MessageId: MF_E_UNSUPPORTED_CAPTURE_DEVICE_PRESENT
//
// MessageText:
//
// Capture device that is present on the system is not supported by Media Foundation.%0
//
  MF_E_UNSUPPORTED_CAPTURE_DEVICE_PRESENT = _HRESULT_TYPEDEF_ ($C00DABED);
  {$EXTERNALSYM MF_E_UNSUPPORTED_CAPTURE_DEVICE_PRESENT}


//////////////////////////////////////////////////////////////////////////////
//
// Media Timeline Controller errors
//
//////////////////////////////////////////////////////////////////////////////

//
// MessageId: MF_E_TIMELINECONTROLLER_UNSUPPORTED_SOURCE_TYPE
//
// MessageText:
//
// Media Source type is not supported in Media Timeline Controller scenarios.%0
//
  MF_E_TIMELINECONTROLLER_UNSUPPORTED_SOURCE_TYPE= _HRESULT_TYPEDEF_ ($C00DAFC8);
  {$EXTERNALSYM MF_E_TIMELINECONTROLLER_UNSUPPORTED_SOURCE_TYPE}

//
// MessageId: MF_E_TIMELINECONTROLLER_NOT_ALLOWED
//
// MessageText:
//
// Operation is not allowed when Media Timeline Controller is attached.%0
//
  MF_E_TIMELINECONTROLLER_NOT_ALLOWED = _HRESULT_TYPEDEF_ ($C00DAFC9);
  {$EXTERNALSYM MF_E_TIMELINECONTROLLER_NOT_ALLOWED}

//
// MessageId: MF_E_TIMELINECONTROLLER_CANNOT_ATTACH
//
// MessageText:
//
// Attaching Media Timeline Controller is blocked because of the current state of the object.%0
//
  MF_E_TIMELINECONTROLLER_CANNOT_ATTACH= _HRESULT_TYPEDEF_ ($C00DAFCA);
  {$EXTERNALSYM MF_E_TIMELINECONTROLLER_CANNOT_ATTACH}


//////////////////////////////////////////////////////////////////////////////
//
// MediaExtension as AppService errors
//
//////////////////////////////////////////////////////////////////////////////

//
// MessageId: MF_E_MEDIA_EXTENSION_APPSERVICE_CONNECTION_FAILED
//
// MessageText:
//
// Connection to app service providing a media extension failed.%0
//
  MF_E_MEDIA_EXTENSION_APPSERVICE_CONNECTION_FAILED= _HRESULT_TYPEDEF_ ($C00DB3B0);
  {$EXTERNALSYM MF_E_MEDIA_EXTENSION_APPSERVICE_CONNECTION_FAILED}

//
// MessageId: MF_E_MEDIA_EXTENSION_APPSERVICE_REQUEST_FAILED
//
// MessageText:
//
// App service providing a media extension failed to process the request.%0
//
  MF_E_MEDIA_EXTENSION_APPSERVICE_REQUEST_FAILED= _HRESULT_TYPEDEF_ ($C00DB3B1);
  {$EXTERNALSYM MF_E_MEDIA_EXTENSION_APPSERVICE_REQUEST_FAILED}

//
// MessageId: MF_E_MEDIA_EXTENSION_PACKAGE_INTEGRITY_CHECK_FAILED
//
// MessageText:
//
// Package integrity check for app failed.%0
//
  MF_E_MEDIA_EXTENSION_PACKAGE_INTEGRITY_CHECK_FAILED= _HRESULT_TYPEDEF_ ($C00DB3B2);
  {$EXTERNALSYM MF_E_MEDIA_EXTENSION_PACKAGE_INTEGRITY_CHECK_FAILED}

//
// MessageId: MF_E_MEDIA_EXTENSION_PACKAGE_LICENSE_INVALID
//
// MessageText:
//
// License check for app failed.%0
//
  MF_E_MEDIA_EXTENSION_PACKAGE_LICENSE_INVALID= _HRESULT_TYPEDEF_ ($C00DB3B3);
  {$EXTERNALSYM MF_E_MEDIA_EXTENSION_PACKAGE_LICENSE_INVALID}


//////////////////////////////////////////////////////////////////////////////
//
// MF Media Engine errors - see W3C definitions for details
//
//////////////////////////////////////////////////////////////////////////////

  MF_INDEX_SIZE_ERR                   = $80700001;
  {$EXTERNALSYM MF_INDEX_SIZE_ERR}
  MF_NOT_FOUND_ERR                    = $80700008;
  {$EXTERNALSYM MF_NOT_FOUND_ERR}
  MF_NOT_SUPPORTED_ERR                = $80700009;
  {$EXTERNALSYM MF_NOT_SUPPORTED_ERR}
  MF_INVALID_STATE_ERR                = $8070000B;
  {$EXTERNALSYM MF_INVALID_STATE_ERR}
  MF_SYNTAX_ERR                       = $8070000C;
  {$EXTERNALSYM MF_SYNTAX_ERR}
  MF_INVALID_ACCESS_ERR               = $8070000F;
  {$EXTERNALSYM MF_INVALID_ACCESS_ERR}
  MF_QUOTA_EXCEEDED_ERR               = $80700016;
  {$EXTERNALSYM MF_QUOTA_EXCEEDED_ERR}
  MF_PARSE_ERR                        = $80700051;
  {$EXTERNALSYM MF_PARSE_ERR}
  MF_TYPE_ERR                         = $80704005;
  {$EXTERNALSYM MF_TYPE_ERR}
  

  // Additional Prototypes for ALL interfaces


  // End of Additional Prototypes

implementation

  // Implement Additional functions here.



//--------------------- Helper functions -------------------------------------

{-----------------------------------------------------------------------------
  STATUS_SEVERITY       This macro will return the severity code from the
                        HR value
-----------------------------------------------------------------------------}
function STATUS_SEVERITY(hr: HRESULT): LongWord;
begin
  Result:= ((hr shr 30) and $3);
end;


end.
