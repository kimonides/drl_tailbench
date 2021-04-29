/* Warning: This file is generated by /data/home/olly/tmp/xapian-svn-snapshot/tags/1.2.13/xapian/xapian-core/generate-exceptions - do not modify directly! */
/* Copyright (C) 2003,2004,2006,2007,2009 Olly Betts
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of the
 * License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301 USA
 */

/* Note that this file isn't an external header - it's located in
 * include/xapian in the source tree because it's generated so this
 * is the simplest way to make inclusion work in a VPATH build.
 */

// DOXYGEN gets confused by this header-with-code.
#ifndef DOXYGEN
if (type == "AssertionError") throw Xapian::AssertionError(msg, context, error_string);
if (type == "InvalidArgumentError") throw Xapian::InvalidArgumentError(msg, context, error_string);
if (type == "InvalidOperationError") throw Xapian::InvalidOperationError(msg, context, error_string);
if (type == "UnimplementedError") throw Xapian::UnimplementedError(msg, context, error_string);
if (type == "DatabaseError") throw Xapian::DatabaseError(msg, context, error_string);
if (type == "DatabaseCorruptError") throw Xapian::DatabaseCorruptError(msg, context, error_string);
if (type == "DatabaseCreateError") throw Xapian::DatabaseCreateError(msg, context, error_string);
if (type == "DatabaseLockError") throw Xapian::DatabaseLockError(msg, context, error_string);
if (type == "DatabaseModifiedError") throw Xapian::DatabaseModifiedError(msg, context, error_string);
if (type == "DatabaseOpeningError") throw Xapian::DatabaseOpeningError(msg, context, error_string);
if (type == "DatabaseVersionError") throw Xapian::DatabaseVersionError(msg, context, error_string);
if (type == "DocNotFoundError") throw Xapian::DocNotFoundError(msg, context, error_string);
if (type == "FeatureUnavailableError") throw Xapian::FeatureUnavailableError(msg, context, error_string);
if (type == "InternalError") throw Xapian::InternalError(msg, context, error_string);
if (type == "NetworkError") throw Xapian::NetworkError(msg, context, error_string);
if (type == "NetworkTimeoutError") throw Xapian::NetworkTimeoutError(msg, context, error_string);
if (type == "QueryParserError") throw Xapian::QueryParserError(msg, context, error_string);
if (type == "SerialisationError") throw Xapian::SerialisationError(msg, context, error_string);
if (type == "RangeError") throw Xapian::RangeError(msg, context, error_string);
#endif /* DOXYGEN */
