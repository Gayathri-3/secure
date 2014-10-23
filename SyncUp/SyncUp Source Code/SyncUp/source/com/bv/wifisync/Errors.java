package com.bv.wifisync;

import java.util.*;
import android.content.*;
import java.io.*;
import java.net.*;
import com.bv.sync.*;
import jcifs.smb.*;
import jcifs.util.transport.*;
import java.util.concurrent.*;

public class Errors
{
    private static final int NT_STATUS_ACCESS_DENIED = -1073741790;
    private static final int NT_STATUS_ACCESS_VIOLATION = -1073741819;
    private static final int NT_STATUS_ACCOUNT_DISABLED = -1073741710;
    private static final int NT_STATUS_ACCOUNT_EXPIRED = -1073741421;
    private static final int NT_STATUS_ACCOUNT_LOCKED_OUT = -1073741260;
    private static final int NT_STATUS_ACCOUNT_RESTRICTION = -1073741714;
    private static final int NT_STATUS_ALREADY_COMMITTED = -1073741791;
    private static final int NT_STATUS_BAD_DEVICE_TYPE = -1073741621;
    private static final int NT_STATUS_BAD_NETWORK_NAME = -1073741620;
    private static final int NT_STATUS_BAD_NETWORK_PATH = -1073741634;
    private static final int NT_STATUS_BUFFER_OVERFLOW = -2147483643;
    private static final int NT_STATUS_BUFFER_TOO_SMALL = -1073741789;
    private static final int NT_STATUS_CANNOT_DELETE = -1073741535;
    private static final int NT_STATUS_CANT_ACCESS_DOMAIN_INFO = -1073741606;
    private static final int NT_STATUS_CONNECTION_REFUSED = -1073741258;
    private static final int NT_STATUS_CONNECTION_RESET = -1073741299;
    private static final int NT_STATUS_CRC_ERROR = -1073741761;
    private static final int NT_STATUS_CSS_SCRAMBLED_SECTOR = -1073741047;
    private static final int NT_STATUS_DATA_ERROR = -1073741668;
    private static final int NT_STATUS_DELETE_PENDING = -1073741738;
    private static final int NT_STATUS_DEVICE_DOES_NOT_EXIST = -1073741632;
    private static final int NT_STATUS_DEVICE_NOT_CONNECTED = -1073741667;
    private static final int NT_STATUS_DEVICE_NOT_READY = -1073741661;
    private static final int NT_STATUS_DEVICE_PAPER_EMPTY = -2147483634;
    private static final int NT_STATUS_DFS_EXIT_PATH_FOUND = -1073741669;
    private static final int NT_STATUS_DIRECTORY_NOT_EMPTY = -1073741567;
    private static final int NT_STATUS_DISK_CORRUPT_ERROR = -1073741774;
    private static final int NT_STATUS_DISK_FULL = -1073741697;
    private static final int NT_STATUS_DISK_OPERATION_FAILED = -1073741462;
    private static final int NT_STATUS_DUPLICATE_NAME = -1073741635;
    private static final int NT_STATUS_EAS_NOT_SUPPORTED = -1073741745;
    private static final int NT_STATUS_EA_TOO_LARGE = -1073741744;
    private static final int NT_STATUS_END_OF_FILE = -1073741807;
    private static final int NT_STATUS_FILE_CLOSED = -1073741528;
    private static final int NT_STATUS_FILE_CORRUPT_ERROR = -1073741566;
    private static final int NT_STATUS_FILE_DELETED = -1073741533;
    private static final int NT_STATUS_FILE_INVALID = -1073741672;
    private static final int NT_STATUS_FILE_IS_A_DIRECTORY = -1073741638;
    private static final int NT_STATUS_FILE_LOCK_CONFLICT = -1073741740;
    private static final int NT_STATUS_FILE_RENAMED = -1073741611;
    private static final int NT_STATUS_FVE_VOLUME_NOT_BOUND = -1071579125;
    private static final int NT_STATUS_HANDLE_NOT_CLOSABLE = -1073741259;
    private static final int NT_STATUS_ILLEGAL_FUNCTION = -1073741649;
    private static final int NT_STATUS_INSTANCE_NOT_AVAILABLE = -1073741653;
    private static final int NT_STATUS_INSUFFICIENT_RESOURCES = -1073741670;
    private static final int NT_STATUS_INSUFF_SERVER_RESOURCES = -1073741307;
    private static final int NT_STATUS_INTERNAL_DB_ERROR = -1073741480;
    private static final int NT_STATUS_INTERNAL_ERROR = -1073741595;
    private static final int NT_STATUS_INVALID_COMPUTER_NAME = -1073741534;
    private static final int NT_STATUS_INVALID_DEVICE_REQUEST = -1073741808;
    private static final int NT_STATUS_INVALID_DEVICE_STATE = -1073741436;
    private static final int NT_STATUS_INVALID_HANDLE = -1073741816;
    private static final int NT_STATUS_INVALID_INFO_CLASS = -1073741821;
    private static final int NT_STATUS_INVALID_LOCK_SEQUENCE = -1073741794;
    private static final int NT_STATUS_INVALID_LOGON_HOURS = -1073741713;
    private static final int NT_STATUS_INVALID_PARAMETER = -1073741811;
    private static final int NT_STATUS_INVALID_PIPE_STATE = -1073741651;
    private static final int NT_STATUS_INVALID_PORT_HANDLE = -1073741758;
    private static final int NT_STATUS_INVALID_READ_MODE = -1073741644;
    private static final int NT_STATUS_INVALID_SERVER_STATE = -1073741604;
    private static final int NT_STATUS_INVALID_SID = -1073741704;
    private static final int NT_STATUS_INVALID_SMB = 65538;
    private static final int NT_STATUS_INVALID_VIEW_SIZE = -1073741793;
    private static final int NT_STATUS_INVALID_WORKSTATION = -1073741712;
    private static final int NT_STATUS_IN_PAGE_ERROR = -1073741818;
    private static final int NT_STATUS_IO_DEVICE_ERROR = -1073741435;
    private static final int NT_STATUS_IO_REPARSE_DATA_INVALID = -1073741192;
    private static final int NT_STATUS_IO_REPARSE_TAG_NOT_HANDLED = -1073741191;
    private static final int NT_STATUS_IO_TIMEOUT = -1073741643;
    private static final int NT_STATUS_LOCK_NOT_GRANTED = -1073741739;
    private static final int NT_STATUS_LOGON_FAILURE = -1073741715;
    private static final int NT_STATUS_LOGON_TYPE_NOT_GRANTED = -1073741477;
    private static final int NT_STATUS_MEDIA_WRITE_PROTECTED = -1073741662;
    private static final int NT_STATUS_MORE_PROCESSING_REQUIRED = -1073741802;
    private static final int NT_STATUS_NAME_TOO_LONG = -1073741562;
    private static final int NT_STATUS_NETLOGON_NOT_STARTED = -1073741422;
    private static final int NT_STATUS_NETWORK_ACCESS_DENIED = -1073741622;
    private static final int NT_STATUS_NETWORK_BUSY = -1073741633;
    private static final int NT_STATUS_NETWORK_NAME_DELETED = -1073741623;
    private static final int NT_STATUS_NETWORK_SESSION_EXPIRED = -1073740964;
    private static final int NT_STATUS_NOLOGON_WORKSTATION_TRUST_ACCOUNT = -1073741415;
    private static final int NT_STATUS_NONEXISTENT_SECTOR = -1073741803;
    private static final int NT_STATUS_NONE_MAPPED = -1073741709;
    private static final int NT_STATUS_NOTIFY_ENUM_DIR = 268;
    private static final int NT_STATUS_NOT_A_DIRECTORY = -1073741565;
    private static final int NT_STATUS_NOT_FOUND = -1073741275;
    private static final int NT_STATUS_NOT_IMPLEMENTED = -1073741822;
    private static final int NT_STATUS_NOT_SAME_DEVICE = -1073741612;
    private static final int NT_STATUS_NOT_SUPPORTED = -1073741637;
    private static final int NT_STATUS_NO_LOGON_SERVERS = -1073741730;
    private static final int NT_STATUS_NO_MEDIA_IN_DEVICE = -1073741805;
    private static final int NT_STATUS_NO_MEMORY = -1073741801;
    private static final int NT_STATUS_NO_MORE_FILES = -2147483642;
    private static final int NT_STATUS_NO_SPOOL_SPACE = -1073741625;
    private static final int NT_STATUS_NO_SUCH_ALIAS = -1073741487;
    private static final int NT_STATUS_NO_SUCH_DEVICE = -1073741810;
    private static final int NT_STATUS_NO_SUCH_DOMAIN = -1073741601;
    private static final int NT_STATUS_NO_SUCH_FILE = -1073741809;
    private static final int NT_STATUS_NO_SUCH_GROUP = -1073741722;
    private static final int NT_STATUS_NO_SUCH_USER = -1073741724;
    private static final int NT_STATUS_NO_TRUST_SAM_ACCOUNT = -1073741429;
    private static final int NT_STATUS_OBJECT_NAME_COLLISION = -1073741771;
    private static final int NT_STATUS_OBJECT_NAME_INVALID = -1073741773;
    private static final int NT_STATUS_OBJECT_NAME_NOT_FOUND = -1073741772;
    private static final int NT_STATUS_OBJECT_PATH_INVALID = -1073741767;
    private static final int NT_STATUS_OBJECT_PATH_NOT_FOUND = -1073741766;
    private static final int NT_STATUS_OBJECT_PATH_SYNTAX_BAD = -1073741765;
    private static final int NT_STATUS_OBJECT_TYPE_MISMATCH = -1073741788;
    private static final int NT_STATUS_OS2_ATOMIC_LOCKS_NOT_SUPPORTED = 11403265;
    private static final int NT_STATUS_OS2_CANCEL_VIOLATION = 11337729;
    private static final int NT_STATUS_OS2_CANNOT_COPY = 17432577;
    private static final int NT_STATUS_OS2_EAS_DIDNT_FIT = 18022401;
    private static final int NT_STATUS_OS2_EA_ACCESS_DENIED = 65142785;
    private static final int NT_STATUS_OS2_INVALID_ACCESS = 786433;
    private static final int NT_STATUS_OS2_INVALID_LEVEL = 8126465;
    private static final int NT_STATUS_OS2_NEGATIVE_SEEK = 8585217;
    private static final int NT_STATUS_OS2_NO_MORE_SIDS = 7405569;
    private static final int NT_STATUS_PASSWORD_EXPIRED = -1073741711;
    private static final int NT_STATUS_PASSWORD_MUST_CHANGE = -1073741276;
    private static final int NT_STATUS_PATH_NOT_COVERED = -1073741225;
    private static final int NT_STATUS_PIPE_BROKEN = -1073741493;
    private static final int NT_STATUS_PIPE_BUSY = -1073741650;
    private static final int NT_STATUS_PIPE_CLOSING = -1073741647;
    private static final int NT_STATUS_PIPE_DISCONNECTED = -1073741648;
    private static final int NT_STATUS_PIPE_EMPTY = -1073741607;
    private static final int NT_STATUS_PIPE_LISTENING = -1073741645;
    private static final int NT_STATUS_PIPE_NOT_AVAILABLE = -1073741652;
    private static final int NT_STATUS_PORT_CONNECTION_REFUSED = -1073741759;
    private static final int NT_STATUS_PORT_DISCONNECTED = -1073741769;
    private static final int NT_STATUS_PRINT_CANCELLED = -1073741624;
    private static final int NT_STATUS_PRINT_QUEUE_FULL = -1073741626;
    private static final int NT_STATUS_PRIVILEGE_NOT_HELD = -1073741727;
    private static final int NT_STATUS_PROCESS_IS_TERMINATING = -1073741558;
    private static final int NT_STATUS_RANGE_NOT_LOCKED = -1073741698;
    private static final int NT_STATUS_REDIRECTOR_NOT_STARTED = -1073741573;
    private static final int NT_STATUS_REMOTE_SESSION_LIMIT = -1073741418;
    private static final int NT_STATUS_REQUEST_NOT_ACCEPTED = -1073741616;
    private static final int NT_STATUS_SECTION_TOO_BIG = -1073741760;
    private static final int NT_STATUS_SHARING_VIOLATION = -1073741757;
    private static final int NT_STATUS_SHUTDOWN_IN_PROGRESS = -1073741058;
    private static final int NT_STATUS_SMB_BAD_COMMAND = 1441794;
    private static final int NT_STATUS_SMB_BAD_FID = 393217;
    private static final int NT_STATUS_SMB_BAD_TID = 327682;
    private static final int NT_STATUS_SMB_BAD_UID = 5963778;
    private static final int NT_STATUS_SMB_CONTINUE_MPX = 16515074;
    private static final int NT_STATUS_SMB_NO_SUPPORT = -65534;
    private static final int NT_STATUS_SMB_USE_MPX = 16384002;
    private static final int NT_STATUS_SMB_USE_STANDARD = 16449538;
    private static final int NT_STATUS_STOPPED_ON_SYMLINK = -2147483603;
    private static final int NT_STATUS_THREAD_IS_TERMINATING = -1073741749;
    private static final int NT_STATUS_TOO_LATE = -1073741431;
    private static final int NT_STATUS_TOO_MANY_OPENED_FILES = -1073741537;
    private static final int NT_STATUS_TOO_MANY_PAGING_FILES = -1073741673;
    private static final int NT_STATUS_TOO_MANY_SESSIONS = -1073741618;
    private static final int NT_STATUS_TRUSTED_DOMAIN_FAILURE = -1073741428;
    private static final int NT_STATUS_TRUSTED_RELATIONSHIP_FAILURE = -1073741427;
    private static final int NT_STATUS_UNEXPECTED_NETWORK_ERROR = -1073741628;
    private static final int NT_STATUS_UNRECOGNIZED_VOLUME = -1073741489;
    private static final int NT_STATUS_UNSUCCESSFUL = -1073741823;
    private static final int NT_STATUS_USER_EXISTS = -1073741725;
    private static final int NT_STATUS_USER_MAPPED_FILE = -1073741245;
    private static final int NT_STATUS_USER_SESSION_DELETED = -1073741309;
    private static final int NT_STATUS_VIRUS_INFECTED = -1073739514;
    private static final int NT_STATUS_VOLUME_DISMOUNTED = -1073741202;
    private static final int NT_STATUS_WRONG_PASSWORD = -1073741718;
    private static final int NT_STATUS_WRONG_VOLUME = -1073741806;
    private static final Integer[][] ntMessageMap;
    
    static {
        Arrays.sort(ntMessageMap = new Integer[][] { { 65538, 2131099768 }, { 327682, 2131099769 }, { 393217, 2131099735 }, { 786433, 2131099745 }, { 1441794, 2131099771 }, { 5963778, 2131099778 }, { 7405569, 2131099756 }, { 8126465, 2131099753 }, { 8585217, 2131099754 }, { 11337729, 2131099757 }, { 11403265, 2131099758 }, { 16384002, 2131099779 }, { 16449538, 2131099780 }, { 16515074, 2131099781 }, { 17432577, 2131099760 }, { 18022401, 2131099764 }, { 65142785, 2131099766 }, { -2147483643, 2131099762 }, { -2147483642, 2131099750 }, { -2147483634, 2131099790 }, { -2147483603, 2131099795 }, { -1073741823, 2131099714 }, { -1073741822, 2131099693 }, { -1073741821, 2131099667 }, { -1073741819, 2131099651 }, { -1073741818, 2131099652 }, { -1073741816, 2131099666 }, { -1073741811, 2131099669 }, { -1073741810, 2131099682 }, { -1073741809, 2131099685 }, { -1073741808, 2131099719 }, { -1073741807, 2131099751 }, { -1073741806, 2131099791 }, { -1073741805, 2131099785 }, { -1073741803, 2131099789 }, { -1073741802, 2131099676 }, { -1073741794, 2131099724 }, { -1073741793, 2131099725 }, { -1073741791, 2131099726 }, { -1073741790, 2131099650 }, { -1073741789, 2131099658 }, { -1073741788, 2131099736 }, { -1073741774, 2131099788 }, { -1073741773, 2131099695 }, { -1073741772, 2131099696 }, { -1073741771, 2131099694 }, { -1073741769, 2131099709 }, { -1073741767, 2131099697 }, { -1073741766, 2131099698 }, { -1073741765, 2131099699 }, { -1073741761, 2131099787 }, { -1073741759, 2131099727 }, { -1073741760, 2131099741 }, { -1073741758, 2131099737 }, { -1073741757, 2131099711 }, { -1073741749, 2131099728 }, { -1073741745, 2131099765 }, { -1073741744, 2131099763 }, { -1073741740, 2131099717 }, { -1073741739, 2131099718 }, { -1073741738, 2131099661 }, { -1073741730, 2131099679 }, { -1073741727, 2131099729 }, { -1073741725, 2131099715 }, { -1073741724, 2131099686 }, { -1073741722, 2131099687 }, { -1073741718, 2131099716 }, { -1073741715, 2131099674 }, { -1073741714, 2131099655 }, { -1073741713, 2131099668 }, { -1073741712, 2131099672 }, { -1073741711, 2131099700 }, { -1073741710, 2131099653 }, { -1073741709, 2131099690 }, { -1073741704, 2131099671 }, { -1073741698, 2131099755 }, { -1073741697, 2131099792 }, { -1073741673, 2131099742 }, { -1073741672, 2131099743 }, { -1073741670, 2131099797 }, { -1073741669, 2131099721 }, { -1073741668, 2131099746 }, { -1073741667, 2131099747 }, { -1073741662, 2131099784 }, { -1073741661, 2131099748 }, { -1073741653, 2131099664 }, { -1073741652, 2131099708 }, { -1073741651, 2131099670 }, { -1073741650, 2131099704 }, { -1073741649, 2131099720 }, { -1073741648, 2131099706 }, { -1073741647, 2131099705 }, { -1073741645, 2131099707 }, { -1073741644, 2131099759 }, { -1073741643, 2131099776 }, { -1073741638, 2131099663 }, { -1073741637, 2131099752 }, { -1073741635, 2131099662 }, { -1073741634, 2131099656 }, { -1073741633, 2131099657 }, { -1073741632, 2131099747 }, { -1073741628, 2131099775 }, { -1073741626, 2131099772 }, { -1073741625, 2131099773 }, { -1073741624, 2131099774 }, { -1073741623, 2131099678 }, { -1073741622, 2131099677 }, { -1073741621, 2131099770 }, { -1073741620, 2131099656 }, { -1073741618, 2131099777 }, { -1073741616, 2131099710 }, { -1073741612, 2131099749 }, { -1073741611, 2131099730 }, { -1073741607, 2131099761 }, { -1073741606, 2131099660 }, { -1073741601, 2131099683 }, { -1073741604, 2131099684 }, { -1073741595, 2131099681 }, { -1073741573, 2131099722 }, { -1073741567, 2131099732 }, { -1073741566, 2131099733 }, { -1073741565, 2131099691 }, { -1073741562, 2131099834 }, { -1073741558, 2131099731 }, { 268, 2131099767 }, { -1073741537, 2131099723 }, { -1073741535, 2131099659 }, { -1073741534, 2131099665 }, { -1073741533, 2131099734 }, { -1073741528, 2131099738 }, { -1073741493, 2131099703 }, { -1073741489, 2131099803 }, { -1073741487, 2131099680 }, { -1073741480, 2131099681 }, { -1073741477, 2131099675 }, { -1073741462, 2131099802 }, { -1073741436, 2131099786 }, { -1073741435, 2131099802 }, { -1073741431, 2131099796 }, { -1073741429, 2131099688 }, { -1073741428, 2131099712 }, { -1073741427, 2131099712 }, { -1073741422, 2131099713 }, { -1073741421, 2131099782 }, { -1073741418, 2131099777 }, { -1073741415, 2131099689 }, { -1073741309, 2131099798 }, { -1073741307, 2131099744 }, { -1073741299, 2131099740 }, { -1073741276, 2131099701 }, { -1073741275, 2131099692 }, { -1073741260, 2131099654 }, { -1073741259, 2131099739 }, { -1073741258, 2131099740 }, { -1073741245, 2131099651 }, { -1073741225, 2131099702 }, { -1073741192, 2131099673 }, { -1073741191, 2131099673 }, { -1073741058, 2131099833 }, { -1073741047, 2131099835 }, { -1071579125, 2131099796 }, { -65534, 2131099783 }, { -1073741202, 2131099796 }, { -1073740964, 2131099798 }, { -1073739514, 2131099832 }, { -1073741801, 2131099805 } }, (Comparator<? super Integer[]>)new IntComparator(null));
    }
    
    private static void dispatchStackTrace(final Context context, final Throwable t) {
        try {
            Utils.getTracker(context).trackEvent("Trace" + Utils.getAppVersion(context), context.getClass().getName(), String.valueOf(new StringBuilder(String.valueOf(context.getClass().getSimpleName())).append("/").append(t.getClass().getSimpleName()).append("/").toString()) + getStackTrace(t, 300), 1);
            Utils.getTracker(context).dispatch();
        }
        catch (Throwable t2) {
            t.printStackTrace();
        }
    }
    
    static String getErrorMessage(final Context context, final Throwable t) {
        return getErrorMessage(context, t, true);
    }
    
    static String getErrorMessage(final Context context, final Throwable t, final boolean b) {
        if (b) {
            t.printStackTrace();
        }
        String s = internalGetErrorMessage(context, t);
        if (t instanceof CifsSync.SyncException) {
            if (b && !Utils.isDebugBuild(context)) {
                traceError(context, s, t.getCause());
            }
            final CifsSync.SyncException ex = (CifsSync.SyncException)t;
            if (ex.sourcePath != null && ex.destPath != null) {
                s = String.valueOf(s) + "\n" + context.getString(2131099963, new Object[] { ex.sourcePath, ex.destPath });
            }
            else if (ex.sourcePath != null) {
                s = String.valueOf(s) + "\n" + context.getString(2131099964, new Object[] { ex.sourcePath });
            }
        }
        else if (b && !Utils.isDebugBuild(context)) {
            traceError(context, s, t);
        }
        return s;
    }
    
    private static int getHelp(final CifsSync.SyncException ex) {
        final Throwable cause = ex.getCause();
        int n;
        if (cause != null && cause instanceof Exception) {
            n = getHelp(cause);
        }
        else {
            n = getHelp((IOException)ex);
        }
        return n;
    }
    
    private static int getHelp(final IOException ex) {
        int n;
        if (ex instanceof SocketTimeoutException) {
            n = 2131099837;
        }
        else if (ex instanceof UnknownHostException) {
            n = 2131099836;
        }
        else if (ex instanceof FileNotFoundException) {
            n = 2131099846;
        }
        else if (ex instanceof ConnectException) {
            n = 2131099838;
        }
        else if (ex instanceof ErrorCodeException && ((ErrorCodeException)ex).errorCode == 6) {
            n = 2131099850;
        }
        else {
            final String message = ex.getMessage();
            if (message != null) {
                if (message.contains(".android_secure")) {
                    n = 2131099848;
                    return n;
                }
                if (message.contains("Can not read directory: /mnt/sdcard")) {
                    n = 2131099847;
                    return n;
                }
            }
            n = 0;
        }
        return n;
    }
    
    static int getHelp(final Throwable t) {
        int n = 0;
        if (t != null) {
            if (t instanceof SmbException) {
                n = getHelp((SmbException)t);
            }
            else if (t instanceof TransportException) {
                n = getHelp((TransportException)t);
            }
            else if (t instanceof CifsSync.SyncException) {
                n = getHelp((CifsSync.SyncException)t);
            }
            else {
                final boolean b = t instanceof IOException;
                n = 0;
                if (b) {
                    n = getHelp((IOException)t);
                }
            }
        }
        return n;
    }
    
    private static int getHelp(final SmbException ex) {
        int help = 0;
        switch (ex.getNtStatus()) {
            default: {
                final Throwable rootCause = ex.getRootCause();
                if (rootCause != null) {
                    help = getHelp(rootCause);
                    break;
                }
                help = 0;
                break;
            }
            case -1073741715: {
                help = 2131099839;
                break;
            }
            case -1073741790: {
                help = 2131099840;
                break;
            }
            case -1073741477: {
                help = 2131099841;
                break;
            }
            case -1073741772: {
                help = 2131099843;
                break;
            }
            case -1073741670:
            case -1073741307: {
                help = 2131099844;
                break;
            }
            case -1073741710: {
                help = 2131099845;
                break;
            }
            case -1073741757: {
                help = 2131099842;
                break;
            }
            case -1073741811: {
                help = 2131099849;
                break;
            }
        }
        return help;
    }
    
    private static int getHelp(final TransportException ex) {
        final Throwable rootCause = ex.getRootCause();
        int help;
        if (rootCause != null) {
            help = getHelp(rootCause);
        }
        else {
            help = 0;
        }
        return help;
    }
    
    static String getNtMessage(final Context context, final int n) {
        final int binarySearch = Arrays.binarySearch(Errors.ntMessageMap, new Integer[] { n, 0 }, new IntComparator(null));
        String string = null;
        if (binarySearch >= 0) {
            string = context.getString((int)Errors.ntMessageMap[binarySearch][1]);
        }
        return string;
    }
    
    private static String getStackTrace(final Throwable t, final int n) {
        String s = "";
        final StackTraceElement[] stackTrace = t.getStackTrace();
        if (stackTrace != null) {
            for (final StackTraceElement stackTraceElement : stackTrace) {
                if (s.length() != 0) {
                    s = String.valueOf(s) + " ";
                }
                s = String.valueOf(s) + stackTraceElement.getFileName() + ":" + stackTraceElement.getLineNumber();
                if (n > 0 && s.length() > n) {
                    break;
                }
            }
        }
        if (s.length() < n && t.getCause() != null) {
            final String string = String.valueOf(s) + "  Cause: ";
            s = String.valueOf(string) + getStackTrace(t.getCause(), n - string.length());
        }
        return s;
    }
    
    private static String handleError(final Context context, final ErrorCodeException ex) {
        final String message = ex.getMessage();
        String s = null;
        switch (ex.errorCode) {
            default: {
                s = String.valueOf(message) + " " + ex.errorCode;
                break;
            }
            case 3: {
                s = String.valueOf(context.getString(2131099793)) + " " + message;
                break;
            }
            case 5: {
                s = context.getString(2131099799, new Object[] { message });
                break;
            }
            case 7: {
                s = context.getString(2131099830, new Object[] { message });
                break;
            }
            case 6: {
                s = String.valueOf(context.getString(2131099694)) + " " + message;
                break;
            }
            case 8: {
                s = String.valueOf(context.getString(2131099792)) + " " + message;
                break;
            }
            case 2: {
                s = String.valueOf(context.getString(2131099813)) + " " + message;
                break;
            }
            case 4: {
                final String[] split = message.split("\n");
                s = context.getString(2131099801, new Object[] { split[0], split[1] });
                break;
            }
            case 1: {
                s = context.getString(2131099831, new Object[] { message });
                break;
            }
        }
        return s;
    }
    
    private static String internalGetErrorMessage(final Context context, final Throwable t) {
        String s = t.getLocalizedMessage();
        if (t instanceof UnknownHostException) {
            s = context.getString(2131099814);
        }
        else if (t instanceof CancellationException) {
            final StringBuilder append = new StringBuilder(String.valueOf(context.getString(2131099931))).append(" ");
            if (s == null) {
                s = "";
            }
            s = append.append(s).toString();
        }
        else if (t instanceof FileNotFoundException) {
            final StringBuilder append2 = new StringBuilder(String.valueOf(context.getString(2131099685))).append(" ");
            if (s == null) {
                s = "";
            }
            s = append2.append(s).toString();
        }
        else if (t instanceof SocketTimeoutException) {
            s = context.getString(2131099809);
        }
        else if (t instanceof ConnectException) {
            final StringBuilder append3 = new StringBuilder(String.valueOf(context.getString(2131099826))).append(" ");
            String string;
            if (s == null) {
                string = "";
            }
            else {
                string = ", " + s;
            }
            s = append3.append(string).toString();
        }
        else if (t instanceof OutOfMemoryError) {
            final StringBuilder append4 = new StringBuilder(String.valueOf(context.getString(2131099825))).append(" ");
            String string2;
            if (s == null) {
                string2 = "";
            }
            else {
                string2 = ", " + s;
            }
            s = append4.append(string2).toString();
        }
        else if (t instanceof CifsSync.SyncException) {
            s = internalGetErrorMessage(context, t.getCause());
        }
        else if (t instanceof ErrorCodeException) {
            s = handleError(context, (ErrorCodeException)t);
        }
        else {
            if (t instanceof SmbException) {
                final SmbException ex = (SmbException)t;
                if (ex.getNtStatus() != 0 && ex.getNtStatus() != -1073741823) {
                    String s2 = getNtMessage(context, ex.getNtStatus());
                    if (s2 == null) {
                        s2 = t.getMessage();
                    }
                    if (s2 != null) {
                        s = context.getString(2131100047, new Object[] { s2 });
                        return s;
                    }
                }
                final Throwable rootCause = ex.getRootCause();
                if (rootCause != null) {
                    s = internalGetErrorMessage(context, rootCause);
                    return s;
                }
            }
            else if (t instanceof TransportException) {
                final TransportException ex2 = (TransportException)t;
                final Throwable rootCause2 = ex2.getRootCause();
                if (rootCause2 != null) {
                    s = internalGetErrorMessage(context, rootCause2);
                    return s;
                }
                final Throwable cause = ex2.getCause();
                if (cause != null) {
                    s = internalGetErrorMessage(context, cause);
                    return s;
                }
            }
            if (s == null || !(t instanceof IOException)) {
                dispatchStackTrace(context, t);
            }
            if (s == null) {
                s = String.valueOf(context.getString(2131099822)) + " " + t.getClass();
            }
        }
        return s;
    }
    
    private static void traceError(final Context context, final String s, final Throwable t) {
        while (true) {
            if (s == null) {
                try {
                    String substring = "null";
                    while (true) {
                        final String string = String.valueOf(context.getClass().getSimpleName()) + "/" + t.getClass().getSimpleName() + "/";
                        Utils.getTracker(context).trackEvent("Error" + Utils.getAppVersion(context), substring, String.valueOf(string) + getStackTrace(t, 200 - string.length()), 1);
                        Utils.getTracker(context).dispatch();
                        return;
                        Block_3: {
                            break Block_3;
                            Label_0156: {
                                substring = s;
                            }
                            continue;
                        }
                        substring = s.substring(0, 200);
                        continue;
                    }
                }
                // iftrue(Label_0156:, s.length() <= 200)
                catch (Throwable t2) {
                    t2.printStackTrace();
                }
                return;
            }
            continue;
        }
    }
    
    private static class IntComparator implements Comparator<Integer[]>
    {
        public int compare(final Integer[] array, final Integer[] array2) {
            int n;
            if (array[0] > array2[0]) {
                n = 1;
            }
            else {
                final int intValue = array[0];
                final int intValue2 = array2[0];
                n = 0;
                if (intValue < intValue2) {
                    n = -1;
                }
            }
            return n;
        }
    }
}
