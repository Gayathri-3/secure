.class interface abstract Lcom/bv/sync/Mp3Scanner$Parser;
.super Ljava/lang/Object;
.source "Mp3Scanner.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bv/sync/Mp3Scanner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x608
    name = "Parser"
.end annotation


# virtual methods
.method public abstract getField(Lcom/bv/sync/Mp3Scanner$FieldType;)Ljava/lang/String;
.end method

.method public abstract parse(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
