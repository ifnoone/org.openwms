/*
 * openwms.org, the Open Warehouse Management System.
 *
 * This file is part of openwms.org.
 *
 * openwms.org is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as 
 * published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 *
 * openwms.org is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this software. If not, write to the Free
 * Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA
 * 02110-1301 USA, or see the FSF site: http://www.fsf.org.
 */
package org.openwms.common.exception;

/**
 * An InvalidPasswordException.
 * 
 * @author <a href="mailto:russelltina@users.sourceforge.net">Tina Russell</a>
 * @version $Revision$
 * @since 0.1
 */
public class InvalidPasswordException extends Exception {

    /**
     * The serialVersionUID.
     */
    private static final long serialVersionUID = 1L;

    /**
     * Create a new InvalidPasswordException.
     */
    public InvalidPasswordException() {}

    /**
     * Create a new InvalidPasswordException.
     * 
     * @param message
     *            The message text
     */
    public InvalidPasswordException(String message) {
        super(message);
    }

    /**
     * Create a new InvalidPasswordException.
     * 
     * @param cause
     *            The root cause of the exception
     */
    public InvalidPasswordException(Throwable cause) {
        super(cause);
    }

    /**
     * Create a new InvalidPasswordException.
     * 
     * @param message
     *            The message text
     * @param cause
     *            The root cause of the exception
     */
    public InvalidPasswordException(String message, Throwable cause) {
        super(message, cause);
    }

}