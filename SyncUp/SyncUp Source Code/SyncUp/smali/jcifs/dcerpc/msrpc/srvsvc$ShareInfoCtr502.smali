.class public Ljcifs/dcerpc/msrpc/srvsvc$ShareInfoCtr502;
.super Ljcifs/dcerpc/ndr/NdrObject;
.source "srvsvc.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljcifs/dcerpc/msrpc/srvsvc;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ShareInfoCtr502"
.end annotation


# instance fields
.field public array:[Ljcifs/dcerpc/msrpc/srvsvc$ShareInfo502;

.field public count:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 285
    invoke-direct {p0}, Ljcifs/dcerpc/ndr/NdrObject;-><init>()V

    return-void
.end method


# virtual methods
.method public decode(Ljcifs/dcerpc/ndr/NdrBuffer;)V
    .locals 6
    .parameter "_src"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/dcerpc/ndr/NdrException;
        }
    .end annotation

    .prologue
    .line 309
    const/4 v4, 0x4

    invoke-virtual {p1, v4}, Ljcifs/dcerpc/ndr/NdrBuffer;->align(I)I

    .line 310
    invoke-virtual {p1}, Ljcifs/dcerpc/ndr/NdrBuffer;->dec_ndr_long()I

    move-result v4

    iput v4, p0, Ljcifs/dcerpc/msrpc/srvsvc$ShareInfoCtr502;->count:I

    .line 311
    invoke-virtual {p1}, Ljcifs/dcerpc/ndr/NdrBuffer;->dec_ndr_long()I

    move-result v1

    .line 313
    .local v1, _arrayp:I
    if-eqz v1, :cond_3

    .line 314
    iget-object p1, p1, Ljcifs/dcerpc/ndr/NdrBuffer;->deferred:Ljcifs/dcerpc/ndr/NdrBuffer;

    .line 315
    invoke-virtual {p1}, Ljcifs/dcerpc/ndr/NdrBuffer;->dec_ndr_long()I

    move-result v2

    .line 316
    .local v2, _arrays:I
    iget v0, p1, Ljcifs/dcerpc/ndr/NdrBuffer;->index:I

    .line 317
    .local v0, _arrayi:I
    mul-int/lit8 v4, v2, 0x28

    invoke-virtual {p1, v4}, Ljcifs/dcerpc/ndr/NdrBuffer;->advance(I)V

    .line 319
    iget-object v4, p0, Ljcifs/dcerpc/msrpc/srvsvc$ShareInfoCtr502;->array:[Ljcifs/dcerpc/msrpc/srvsvc$ShareInfo502;

    if-nez v4, :cond_2

    .line 320
    if-ltz v2, :cond_0

    const v4, 0xffff

    if-le v2, v4, :cond_1

    :cond_0
    new-instance v4, Ljcifs/dcerpc/ndr/NdrException;

    const-string v5, "invalid array conformance"

    invoke-direct {v4, v5}, Ljcifs/dcerpc/ndr/NdrException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 321
    :cond_1
    new-array v4, v2, [Ljcifs/dcerpc/msrpc/srvsvc$ShareInfo502;

    iput-object v4, p0, Ljcifs/dcerpc/msrpc/srvsvc$ShareInfoCtr502;->array:[Ljcifs/dcerpc/msrpc/srvsvc$ShareInfo502;

    .line 323
    :cond_2
    invoke-virtual {p1, v0}, Ljcifs/dcerpc/ndr/NdrBuffer;->derive(I)Ljcifs/dcerpc/ndr/NdrBuffer;

    move-result-object p1

    .line 324
    const/4 v3, 0x0

    .local v3, _i:I
    :goto_0
    if-lt v3, v2, :cond_4

    .line 331
    .end local v0           #_arrayi:I
    .end local v2           #_arrays:I
    .end local v3           #_i:I
    :cond_3
    return-void

    .line 325
    .restart local v0       #_arrayi:I
    .restart local v2       #_arrays:I
    .restart local v3       #_i:I
    :cond_4
    iget-object v4, p0, Ljcifs/dcerpc/msrpc/srvsvc$ShareInfoCtr502;->array:[Ljcifs/dcerpc/msrpc/srvsvc$ShareInfo502;

    aget-object v4, v4, v3

    if-nez v4, :cond_5

    .line 326
    iget-object v4, p0, Ljcifs/dcerpc/msrpc/srvsvc$ShareInfoCtr502;->array:[Ljcifs/dcerpc/msrpc/srvsvc$ShareInfo502;

    new-instance v5, Ljcifs/dcerpc/msrpc/srvsvc$ShareInfo502;

    invoke-direct {v5}, Ljcifs/dcerpc/msrpc/srvsvc$ShareInfo502;-><init>()V

    aput-object v5, v4, v3

    .line 328
    :cond_5
    iget-object v4, p0, Ljcifs/dcerpc/msrpc/srvsvc$ShareInfoCtr502;->array:[Ljcifs/dcerpc/msrpc/srvsvc$ShareInfo502;

    aget-object v4, v4, v3

    invoke-virtual {v4, p1}, Ljcifs/dcerpc/msrpc/srvsvc$ShareInfo502;->decode(Ljcifs/dcerpc/ndr/NdrBuffer;)V

    .line 324
    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method

.method public encode(Ljcifs/dcerpc/ndr/NdrBuffer;)V
    .locals 5
    .parameter "_dst"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/dcerpc/ndr/NdrException;
        }
    .end annotation

    .prologue
    .line 291
    const/4 v3, 0x4

    invoke-virtual {p1, v3}, Ljcifs/dcerpc/ndr/NdrBuffer;->align(I)I

    .line 292
    iget v3, p0, Ljcifs/dcerpc/msrpc/srvsvc$ShareInfoCtr502;->count:I

    invoke-virtual {p1, v3}, Ljcifs/dcerpc/ndr/NdrBuffer;->enc_ndr_long(I)V

    .line 293
    iget-object v3, p0, Ljcifs/dcerpc/msrpc/srvsvc$ShareInfoCtr502;->array:[Ljcifs/dcerpc/msrpc/srvsvc$ShareInfo502;

    const/4 v4, 0x1

    invoke-virtual {p1, v3, v4}, Ljcifs/dcerpc/ndr/NdrBuffer;->enc_ndr_referent(Ljava/lang/Object;I)V

    .line 295
    iget-object v3, p0, Ljcifs/dcerpc/msrpc/srvsvc$ShareInfoCtr502;->array:[Ljcifs/dcerpc/msrpc/srvsvc$ShareInfo502;

    if-eqz v3, :cond_0

    .line 296
    iget-object p1, p1, Ljcifs/dcerpc/ndr/NdrBuffer;->deferred:Ljcifs/dcerpc/ndr/NdrBuffer;

    .line 297
    iget v1, p0, Ljcifs/dcerpc/msrpc/srvsvc$ShareInfoCtr502;->count:I

    .line 298
    .local v1, _arrays:I
    invoke-virtual {p1, v1}, Ljcifs/dcerpc/ndr/NdrBuffer;->enc_ndr_long(I)V

    .line 299
    iget v0, p1, Ljcifs/dcerpc/ndr/NdrBuffer;->index:I

    .line 300
    .local v0, _arrayi:I
    mul-int/lit8 v3, v1, 0x28

    invoke-virtual {p1, v3}, Ljcifs/dcerpc/ndr/NdrBuffer;->advance(I)V

    .line 302
    invoke-virtual {p1, v0}, Ljcifs/dcerpc/ndr/NdrBuffer;->derive(I)Ljcifs/dcerpc/ndr/NdrBuffer;

    move-result-object p1

    .line 303
    const/4 v2, 0x0

    .local v2, _i:I
    :goto_0
    if-lt v2, v1, :cond_1

    .line 307
    .end local v0           #_arrayi:I
    .end local v1           #_arrays:I
    .end local v2           #_i:I
    :cond_0
    return-void

    .line 304
    .restart local v0       #_arrayi:I
    .restart local v1       #_arrays:I
    .restart local v2       #_i:I
    :cond_1
    iget-object v3, p0, Ljcifs/dcerpc/msrpc/srvsvc$ShareInfoCtr502;->array:[Ljcifs/dcerpc/msrpc/srvsvc$ShareInfo502;

    aget-object v3, v3, v2

    invoke-virtual {v3, p1}, Ljcifs/dcerpc/msrpc/srvsvc$ShareInfo502;->encode(Ljcifs/dcerpc/ndr/NdrBuffer;)V

    .line 303
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method
