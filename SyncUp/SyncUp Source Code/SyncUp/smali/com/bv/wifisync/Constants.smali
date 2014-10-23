.class public Lcom/bv/wifisync/Constants;
.super Ljava/lang/Object;
.source "Constants.java"


# static fields
.field static final APP:Ljava/lang/String; = "app"

.field static final DELETED_FILES_PATH:Ljava/lang/String; = "deleted"

.field static final EULA:Ljava/lang/String; = "EULA"

.field static final GLOBAL_MODIFIED_FILE_NAME:Ljava/lang/String; = "modified.dat"

.field static final GOOGLE_ANALYTICS_ID:Ljava/lang/String; = "UA-27375313-1"

.field static final HELP_VISIBLE:Ljava/lang/String; = "hintMinimized"

.field static final HOSTS_FILENAME:Ljava/lang/String; = "hosts.dat"

.field static final JOBS_DIR:Ljava/lang/String; = "jobs"

.field static final JOB_HISTORY_DIR:Ljava/lang/String; = "history"

.field static final LAST_ERROR:Ljava/lang/String; = "lastError"

.field static final LAST_NOTIFICATION_DETAILS:Ljava/lang/String; = "notificationDetails"

.field static final LAST_NOTIFICATION_JOBID:Ljava/lang/String; = "notification"

.field static final LAST_NOTIFICATION_TITLE:Ljava/lang/String; = "notificationTitle"

.field static final LOCAL_FILES_PATH:Ljava/lang/String; = "local"

.field static final OPTIONS:Ljava/lang/String; = "options"

.field static final REMOTE_FILES_PATH:Ljava/lang/String; = "remote"

.field static final RESULT:Ljava/lang/String; = "RESULT"

.field static final RESULT1:Ljava/lang/String; = "RESULT1"

.field static final RESULT2:Ljava/lang/String; = "RESULT2"

.field static final SDCARD_LINK:Ljava/lang/String; = "/sdcard"
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SdCardPath"
        }
    .end annotation
.end field

.field static final SMB_PREFIX:Ljava/lang/String; = "smb://"

.field static final WHATS_NEW:Ljava/lang/String; = "whatsnew.txt"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
