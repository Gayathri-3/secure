.class public interface abstract Ljcifs/smb/DosError;
.super Ljava/lang/Object;
.source "DosError.java"


# static fields
.field public static final DOS_ERROR_CODES:[[I

.field public static final DOS_ERROR_MESSAGES:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x1

    const/4 v4, 0x0

    const/4 v3, 0x2

    .line 23
    const/16 v0, 0x28

    new-array v0, v0, [[I

    .line 24
    new-array v1, v3, [I

    aput-object v1, v0, v4

    .line 25
    new-array v1, v3, [I

    fill-array-data v1, :array_0

    aput-object v1, v0, v5

    .line 26
    new-array v1, v3, [I

    fill-array-data v1, :array_1

    aput-object v1, v0, v3

    .line 27
    new-array v1, v3, [I

    fill-array-data v1, :array_2

    aput-object v1, v0, v6

    .line 28
    new-array v1, v3, [I

    fill-array-data v1, :array_3

    aput-object v1, v0, v7

    const/4 v1, 0x5

    .line 29
    new-array v2, v3, [I

    fill-array-data v2, :array_4

    aput-object v2, v0, v1

    const/4 v1, 0x6

    .line 30
    new-array v2, v3, [I

    fill-array-data v2, :array_5

    aput-object v2, v0, v1

    const/4 v1, 0x7

    .line 31
    new-array v2, v3, [I

    fill-array-data v2, :array_6

    aput-object v2, v0, v1

    const/16 v1, 0x8

    .line 32
    new-array v2, v3, [I

    fill-array-data v2, :array_7

    aput-object v2, v0, v1

    const/16 v1, 0x9

    .line 33
    new-array v2, v3, [I

    fill-array-data v2, :array_8

    aput-object v2, v0, v1

    const/16 v1, 0xa

    .line 34
    new-array v2, v3, [I

    fill-array-data v2, :array_9

    aput-object v2, v0, v1

    const/16 v1, 0xb

    .line 35
    new-array v2, v3, [I

    fill-array-data v2, :array_a

    aput-object v2, v0, v1

    const/16 v1, 0xc

    .line 36
    new-array v2, v3, [I

    fill-array-data v2, :array_b

    aput-object v2, v0, v1

    const/16 v1, 0xd

    .line 37
    new-array v2, v3, [I

    fill-array-data v2, :array_c

    aput-object v2, v0, v1

    const/16 v1, 0xe

    .line 38
    new-array v2, v3, [I

    fill-array-data v2, :array_d

    aput-object v2, v0, v1

    const/16 v1, 0xf

    .line 39
    new-array v2, v3, [I

    fill-array-data v2, :array_e

    aput-object v2, v0, v1

    const/16 v1, 0x10

    .line 40
    new-array v2, v3, [I

    fill-array-data v2, :array_f

    aput-object v2, v0, v1

    const/16 v1, 0x11

    .line 41
    new-array v2, v3, [I

    fill-array-data v2, :array_10

    aput-object v2, v0, v1

    const/16 v1, 0x12

    .line 42
    new-array v2, v3, [I

    fill-array-data v2, :array_11

    aput-object v2, v0, v1

    const/16 v1, 0x13

    .line 43
    new-array v2, v3, [I

    fill-array-data v2, :array_12

    aput-object v2, v0, v1

    const/16 v1, 0x14

    .line 44
    new-array v2, v3, [I

    fill-array-data v2, :array_13

    aput-object v2, v0, v1

    const/16 v1, 0x15

    .line 45
    new-array v2, v3, [I

    fill-array-data v2, :array_14

    aput-object v2, v0, v1

    const/16 v1, 0x16

    .line 46
    new-array v2, v3, [I

    fill-array-data v2, :array_15

    aput-object v2, v0, v1

    const/16 v1, 0x17

    .line 47
    new-array v2, v3, [I

    fill-array-data v2, :array_16

    aput-object v2, v0, v1

    const/16 v1, 0x18

    .line 48
    new-array v2, v3, [I

    fill-array-data v2, :array_17

    aput-object v2, v0, v1

    const/16 v1, 0x19

    .line 49
    new-array v2, v3, [I

    fill-array-data v2, :array_18

    aput-object v2, v0, v1

    const/16 v1, 0x1a

    .line 50
    new-array v2, v3, [I

    fill-array-data v2, :array_19

    aput-object v2, v0, v1

    const/16 v1, 0x1b

    .line 51
    new-array v2, v3, [I

    fill-array-data v2, :array_1a

    aput-object v2, v0, v1

    const/16 v1, 0x1c

    .line 52
    new-array v2, v3, [I

    fill-array-data v2, :array_1b

    aput-object v2, v0, v1

    const/16 v1, 0x1d

    .line 53
    new-array v2, v3, [I

    fill-array-data v2, :array_1c

    aput-object v2, v0, v1

    const/16 v1, 0x1e

    .line 54
    new-array v2, v3, [I

    fill-array-data v2, :array_1d

    aput-object v2, v0, v1

    const/16 v1, 0x1f

    .line 55
    new-array v2, v3, [I

    fill-array-data v2, :array_1e

    aput-object v2, v0, v1

    const/16 v1, 0x20

    .line 56
    new-array v2, v3, [I

    fill-array-data v2, :array_1f

    aput-object v2, v0, v1

    const/16 v1, 0x21

    .line 57
    new-array v2, v3, [I

    fill-array-data v2, :array_20

    aput-object v2, v0, v1

    const/16 v1, 0x22

    .line 58
    new-array v2, v3, [I

    fill-array-data v2, :array_21

    aput-object v2, v0, v1

    const/16 v1, 0x23

    .line 59
    new-array v2, v3, [I

    fill-array-data v2, :array_22

    aput-object v2, v0, v1

    const/16 v1, 0x24

    .line 60
    new-array v2, v3, [I

    fill-array-data v2, :array_23

    aput-object v2, v0, v1

    const/16 v1, 0x25

    .line 61
    new-array v2, v3, [I

    fill-array-data v2, :array_24

    aput-object v2, v0, v1

    const/16 v1, 0x26

    .line 62
    new-array v2, v3, [I

    fill-array-data v2, :array_25

    aput-object v2, v0, v1

    const/16 v1, 0x27

    .line 63
    new-array v2, v3, [I

    fill-array-data v2, :array_26

    aput-object v2, v0, v1

    .line 23
    sput-object v0, Ljcifs/smb/DosError;->DOS_ERROR_CODES:[[I

    .line 69
    const/16 v0, 0x28

    new-array v0, v0, [Ljava/lang/String;

    .line 70
    const-string v1, "The operation completed successfully."

    aput-object v1, v0, v4

    .line 71
    const-string v1, "Incorrect function."

    aput-object v1, v0, v5

    .line 72
    const-string v1, "Incorrect function."

    aput-object v1, v0, v3

    .line 73
    const-string v1, "The system cannot find the file specified."

    aput-object v1, v0, v6

    .line 74
    const-string v1, "Bad password."

    aput-object v1, v0, v7

    const/4 v1, 0x5

    .line 75
    const-string v2, "The system cannot find the path specified."

    aput-object v2, v0, v1

    const/4 v1, 0x6

    .line 76
    const-string v2, "reserved"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    .line 77
    const-string v2, "The client does not have the necessary access rights to perform the requested function."

    aput-object v2, v0, v1

    const/16 v1, 0x8

    .line 78
    const-string v2, "Access is denied."

    aput-object v2, v0, v1

    const/16 v1, 0x9

    .line 79
    const-string v2, "The TID specified was invalid."

    aput-object v2, v0, v1

    const/16 v1, 0xa

    .line 80
    const-string v2, "The handle is invalid."

    aput-object v2, v0, v1

    const/16 v1, 0xb

    .line 81
    const-string v2, "The network name cannot be found."

    aput-object v2, v0, v1

    const/16 v1, 0xc

    .line 82
    const-string v2, "Not enough storage is available to process this command."

    aput-object v2, v0, v1

    const/16 v1, 0xd

    .line 83
    const-string v2, "The media is write protected."

    aput-object v2, v0, v1

    const/16 v1, 0xe

    .line 84
    const-string v2, "The device is not ready."

    aput-object v2, v0, v1

    const/16 v1, 0xf

    .line 85
    const-string v2, "A device attached to the system is not functioning."

    aput-object v2, v0, v1

    const/16 v1, 0x10

    .line 86
    const-string v2, "A device attached to the system is not functioning."

    aput-object v2, v0, v1

    const/16 v1, 0x11

    .line 87
    const-string v2, "The process cannot access the file because it is being used by another process."

    aput-object v2, v0, v1

    const/16 v1, 0x12

    .line 88
    const-string v2, "The process cannot access the file because it is being used by another process."

    aput-object v2, v0, v1

    const/16 v1, 0x13

    .line 89
    const-string v2, "The process cannot access the file because another process has locked a portion of the file."

    aput-object v2, v0, v1

    const/16 v1, 0x14

    .line 90
    const-string v2, "The disk is full."

    aput-object v2, v0, v1

    const/16 v1, 0x15

    .line 91
    const-string v2, "A duplicate name exists on the network."

    aput-object v2, v0, v1

    const/16 v1, 0x16

    .line 92
    const-string v2, "The network name cannot be found."

    aput-object v2, v0, v1

    const/16 v1, 0x17

    .line 93
    const-string v2, "ERRnomoreconn."

    aput-object v2, v0, v1

    const/16 v1, 0x18

    .line 94
    const-string v2, "The file exists."

    aput-object v2, v0, v1

    const/16 v1, 0x19

    .line 95
    const-string v2, "The parameter is incorrect."

    aput-object v2, v0, v1

    const/16 v1, 0x1a

    .line 96
    const-string v2, "Too many Uids active on this session."

    aput-object v2, v0, v1

    const/16 v1, 0x1b

    .line 97
    const-string v2, "The Uid is not known as a valid user identifier on this session."

    aput-object v2, v0, v1

    const/16 v1, 0x1c

    .line 98
    const-string v2, "The pipe has been ended."

    aput-object v2, v0, v1

    const/16 v1, 0x1d

    .line 99
    const-string v2, "The filename, directory name, or volume label syntax is incorrect."

    aput-object v2, v0, v1

    const/16 v1, 0x1e

    .line 100
    const-string v2, "The directory is not empty."

    aput-object v2, v0, v1

    const/16 v1, 0x1f

    .line 101
    const-string v2, "Cannot create a file when that file already exists."

    aput-object v2, v0, v1

    const/16 v1, 0x20

    .line 102
    const-string v2, "All pipe instances are busy."

    aput-object v2, v0, v1

    const/16 v1, 0x21

    .line 103
    const-string v2, "The pipe is being closed."

    aput-object v2, v0, v1

    const/16 v1, 0x22

    .line 104
    const-string v2, "No process is on the other end of the pipe."

    aput-object v2, v0, v1

    const/16 v1, 0x23

    .line 105
    const-string v2, "More data is available."

    aput-object v2, v0, v1

    const/16 v1, 0x24

    .line 106
    const-string v2, "This user account has expired."

    aput-object v2, v0, v1

    const/16 v1, 0x25

    .line 107
    const-string v2, "The user is not allowed to log on from this workstation."

    aput-object v2, v0, v1

    const/16 v1, 0x26

    .line 108
    const-string v2, "The user is not allowed to log on at this time."

    aput-object v2, v0, v1

    const/16 v1, 0x27

    .line 109
    const-string v2, "The password of this user has expired."

    aput-object v2, v0, v1

    .line 69
    sput-object v0, Ljcifs/smb/DosError;->DOS_ERROR_MESSAGES:[Ljava/lang/String;

    .line 110
    return-void

    .line 25
    nop

    :array_0
    .array-data 0x4
        0x1t 0x0t 0x1t 0x0t
        0x2t 0x0t 0x0t 0xc0t
    .end array-data

    .line 26
    :array_1
    .array-data 0x4
        0x2t 0x0t 0x1t 0x0t
        0x2t 0x0t 0x0t 0xc0t
    .end array-data

    .line 27
    :array_2
    .array-data 0x4
        0x1t 0x0t 0x2t 0x0t
        0xft 0x0t 0x0t 0xc0t
    .end array-data

    .line 28
    :array_3
    .array-data 0x4
        0x2t 0x0t 0x2t 0x0t
        0x6at 0x0t 0x0t 0xc0t
    .end array-data

    .line 29
    :array_4
    .array-data 0x4
        0x1t 0x0t 0x3t 0x0t
        0x3at 0x0t 0x0t 0xc0t
    .end array-data

    .line 30
    :array_5
    .array-data 0x4
        0x2t 0x0t 0x3t 0x0t
        0xcbt 0x0t 0x0t 0xc0t
    .end array-data

    .line 31
    :array_6
    .array-data 0x4
        0x2t 0x0t 0x4t 0x0t
        0xcat 0x0t 0x0t 0xc0t
    .end array-data

    .line 32
    :array_7
    .array-data 0x4
        0x1t 0x0t 0x5t 0x0t
        0x22t 0x0t 0x0t 0xc0t
    .end array-data

    .line 33
    :array_8
    .array-data 0x4
        0x2t 0x0t 0x5t 0x0t
        0xdt 0x0t 0x0t 0xc0t
    .end array-data

    .line 34
    :array_9
    .array-data 0x4
        0x1t 0x0t 0x6t 0x0t
        0x8t 0x0t 0x0t 0xc0t
    .end array-data

    .line 35
    :array_a
    .array-data 0x4
        0x2t 0x0t 0x6t 0x0t
        0xcct 0x0t 0x0t 0xc0t
    .end array-data

    .line 36
    :array_b
    .array-data 0x4
        0x1t 0x0t 0x8t 0x0t
        0x9at 0x0t 0x0t 0xc0t
    .end array-data

    .line 37
    :array_c
    .array-data 0x4
        0x3t 0x0t 0x13t 0x0t
        0xa2t 0x0t 0x0t 0xc0t
    .end array-data

    .line 38
    :array_d
    .array-data 0x4
        0x3t 0x0t 0x15t 0x0t
        0x13t 0x0t 0x0t 0xc0t
    .end array-data

    .line 39
    :array_e
    .array-data 0x4
        0x1t 0x0t 0x1ft 0x0t
        0x1t 0x0t 0x0t 0xc0t
    .end array-data

    .line 40
    :array_f
    .array-data 0x4
        0x3t 0x0t 0x1ft 0x0t
        0x1t 0x0t 0x0t 0xc0t
    .end array-data

    .line 41
    :array_10
    .array-data 0x4
        0x1t 0x0t 0x20t 0x0t
        0x43t 0x0t 0x0t 0xc0t
    .end array-data

    .line 42
    :array_11
    .array-data 0x4
        0x3t 0x0t 0x20t 0x0t
        0x43t 0x0t 0x0t 0xc0t
    .end array-data

    .line 43
    :array_12
    .array-data 0x4
        0x3t 0x0t 0x21t 0x0t
        0x54t 0x0t 0x0t 0xc0t
    .end array-data

    .line 44
    :array_13
    .array-data 0x4
        0x3t 0x0t 0x27t 0x0t
        0x7ft 0x0t 0x0t 0xc0t
    .end array-data

    .line 45
    :array_14
    .array-data 0x4
        0x1t 0x0t 0x34t 0x0t
        0xbdt 0x0t 0x0t 0xc0t
    .end array-data

    .line 46
    :array_15
    .array-data 0x4
        0x1t 0x0t 0x43t 0x0t
        0xcct 0x0t 0x0t 0xc0t
    .end array-data

    .line 47
    :array_16
    .array-data 0x4
        0x1t 0x0t 0x47t 0x0t
        0xd0t 0x0t 0x0t 0xc0t
    .end array-data

    .line 48
    :array_17
    .array-data 0x4
        0x1t 0x0t 0x50t 0x0t
        0x35t 0x0t 0x0t 0xc0t
    .end array-data

    .line 49
    :array_18
    .array-data 0x4
        0x1t 0x0t 0x57t 0x0t
        0x3t 0x0t 0x0t 0xc0t
    .end array-data

    .line 50
    :array_19
    .array-data 0x4
        0x2t 0x0t 0x5at 0x0t
        0xcet 0x0t 0x0t 0xc0t
    .end array-data

    .line 51
    :array_1a
    .array-data 0x4
        0x2t 0x0t 0x5bt 0x0t
        0xdt 0x0t 0x0t 0xc0t
    .end array-data

    .line 52
    :array_1b
    .array-data 0x4
        0x1t 0x0t 0x6dt 0x0t
        0x4bt 0x1t 0x0t 0xc0t
    .end array-data

    .line 53
    :array_1c
    .array-data 0x4
        0x1t 0x0t 0x7bt 0x0t
        0x33t 0x0t 0x0t 0xc0t
    .end array-data

    .line 54
    :array_1d
    .array-data 0x4
        0x1t 0x0t 0x91t 0x0t
        0x1t 0x1t 0x0t 0xc0t
    .end array-data

    .line 55
    :array_1e
    .array-data 0x4
        0x1t 0x0t 0xb7t 0x0t
        0x35t 0x0t 0x0t 0xc0t
    .end array-data

    .line 56
    :array_1f
    .array-data 0x4
        0x1t 0x0t 0xe7t 0x0t
        0xabt 0x0t 0x0t 0xc0t
    .end array-data

    .line 57
    :array_20
    .array-data 0x4
        0x1t 0x0t 0xe8t 0x0t
        0xb1t 0x0t 0x0t 0xc0t
    .end array-data

    .line 58
    :array_21
    .array-data 0x4
        0x1t 0x0t 0xe9t 0x0t
        0xb0t 0x0t 0x0t 0xc0t
    .end array-data

    .line 59
    :array_22
    .array-data 0x4
        0x1t 0x0t 0xeat 0x0t
        0x16t 0x0t 0x0t 0xc0t
    .end array-data

    .line 60
    :array_23
    .array-data 0x4
        0x2t 0x0t 0xbft 0x8t
        0x93t 0x1t 0x0t 0xc0t
    .end array-data

    .line 61
    :array_24
    .array-data 0x4
        0x2t 0x0t 0xc0t 0x8t
        0x70t 0x0t 0x0t 0xc0t
    .end array-data

    .line 62
    :array_25
    .array-data 0x4
        0x2t 0x0t 0xc1t 0x8t
        0x6ft 0x0t 0x0t 0xc0t
    .end array-data

    .line 63
    :array_26
    .array-data 0x4
        0x2t 0x0t 0xc2t 0x8t
        0x71t 0x0t 0x0t 0xc0t
    .end array-data
.end method
