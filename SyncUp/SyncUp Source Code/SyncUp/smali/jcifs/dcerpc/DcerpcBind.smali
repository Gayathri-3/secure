.class public Ljcifs/dcerpc/DcerpcBind;
.super Ljcifs/dcerpc/DcerpcMessage;
.source "DcerpcBind.java"


# static fields
.field static final result_message:[Ljava/lang/String;


# instance fields
.field binding:Ljcifs/dcerpc/DcerpcBinding;

.field max_recv:I

.field max_xmit:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 26
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    .line 27
    const-string v2, "0"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    .line 28
    const-string v2, "DCERPC_BIND_ERR_ABSTRACT_SYNTAX_NOT_SUPPORTED"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    .line 29
    const-string v2, "DCERPC_BIND_ERR_PROPOSED_TRANSFER_SYNTAXES_NOT_SUPPORTED"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    .line 30
    const-string v2, "DCERPC_BIND_ERR_LOCAL_LIMIT_EXCEEDED"

    aput-object v2, v0, v1

    .line 26
    sput-object v0, Ljcifs/dcerpc/DcerpcBind;->result_message:[Ljava/lang/String;

    .line 31
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 47
    invoke-direct {p0}, Ljcifs/dcerpc/DcerpcMessage;-><init>()V

    .line 48
    return-void
.end method

.method constructor <init>(Ljcifs/dcerpc/DcerpcBinding;Ljcifs/dcerpc/DcerpcHandle;)V
    .locals 1
    .parameter "binding"
    .parameter "handle"

    .prologue
    .line 49
    invoke-direct {p0}, Ljcifs/dcerpc/DcerpcMessage;-><init>()V

    .line 50
    iput-object p1, p0, Ljcifs/dcerpc/DcerpcBind;->binding:Ljcifs/dcerpc/DcerpcBinding;

    .line 51
    iget v0, p2, Ljcifs/dcerpc/DcerpcHandle;->max_xmit:I

    iput v0, p0, Ljcifs/dcerpc/DcerpcBind;->max_xmit:I

    .line 52
    iget v0, p2, Ljcifs/dcerpc/DcerpcHandle;->max_recv:I

    iput v0, p0, Ljcifs/dcerpc/DcerpcBind;->max_recv:I

    .line 53
    const/16 v0, 0xb

    iput v0, p0, Ljcifs/dcerpc/DcerpcBind;->ptype:I

    .line 54
    const/4 v0, 0x3

    iput v0, p0, Ljcifs/dcerpc/DcerpcBind;->flags:I

    .line 55
    return-void
.end method

.method static getResultMessage(I)Ljava/lang/String;
    .locals 3
    .parameter "result"

    .prologue
    const/4 v2, 0x4

    .line 34
    if-ge p0, v2, :cond_0

    .line 35
    sget-object v0, Ljcifs/dcerpc/DcerpcBind;->result_message:[Ljava/lang/String;

    aget-object v0, v0, p0

    .line 34
    :goto_0
    return-object v0

    .line 36
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "0x"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p0, v2}, Ljcifs/util/Hexdump;->toHexString(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method


# virtual methods
.method public decode_out(Ljcifs/dcerpc/ndr/NdrBuffer;)V
    .locals 2
    .parameter "buf"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/dcerpc/ndr/NdrException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x4

    .line 77
    invoke-virtual {p1}, Ljcifs/dcerpc/ndr/NdrBuffer;->dec_ndr_short()I

    .line 78
    invoke-virtual {p1}, Ljcifs/dcerpc/ndr/NdrBuffer;->dec_ndr_short()I

    .line 79
    invoke-virtual {p1}, Ljcifs/dcerpc/ndr/NdrBuffer;->dec_ndr_long()I

    .line 80
    invoke-virtual {p1}, Ljcifs/dcerpc/ndr/NdrBuffer;->dec_ndr_short()I

    move-result v0

    .line 81
    .local v0, n:I
    invoke-virtual {p1, v0}, Ljcifs/dcerpc/ndr/NdrBuffer;->advance(I)V

    .line 82
    invoke-virtual {p1, v1}, Ljcifs/dcerpc/ndr/NdrBuffer;->align(I)I

    .line 83
    invoke-virtual {p1}, Ljcifs/dcerpc/ndr/NdrBuffer;->dec_ndr_small()I

    .line 84
    invoke-virtual {p1, v1}, Ljcifs/dcerpc/ndr/NdrBuffer;->align(I)I

    .line 85
    invoke-virtual {p1}, Ljcifs/dcerpc/ndr/NdrBuffer;->dec_ndr_short()I

    move-result v1

    iput v1, p0, Ljcifs/dcerpc/DcerpcBind;->result:I

    .line 86
    invoke-virtual {p1}, Ljcifs/dcerpc/ndr/NdrBuffer;->dec_ndr_short()I

    .line 87
    const/16 v1, 0x14

    invoke-virtual {p1, v1}, Ljcifs/dcerpc/ndr/NdrBuffer;->advance(I)V

    .line 88
    return-void
.end method

.method public encode_in(Ljcifs/dcerpc/ndr/NdrBuffer;)V
    .locals 3
    .parameter "buf"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljcifs/dcerpc/ndr/NdrException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 61
    iget v0, p0, Ljcifs/dcerpc/DcerpcBind;->max_xmit:I

    invoke-virtual {p1, v0}, Ljcifs/dcerpc/ndr/NdrBuffer;->enc_ndr_short(I)V

    .line 62
    iget v0, p0, Ljcifs/dcerpc/DcerpcBind;->max_recv:I

    invoke-virtual {p1, v0}, Ljcifs/dcerpc/ndr/NdrBuffer;->enc_ndr_short(I)V

    .line 63
    invoke-virtual {p1, v1}, Ljcifs/dcerpc/ndr/NdrBuffer;->enc_ndr_long(I)V

    .line 64
    invoke-virtual {p1, v2}, Ljcifs/dcerpc/ndr/NdrBuffer;->enc_ndr_small(I)V

    .line 65
    invoke-virtual {p1, v1}, Ljcifs/dcerpc/ndr/NdrBuffer;->enc_ndr_small(I)V

    .line 66
    invoke-virtual {p1, v1}, Ljcifs/dcerpc/ndr/NdrBuffer;->enc_ndr_short(I)V

    .line 67
    invoke-virtual {p1, v1}, Ljcifs/dcerpc/ndr/NdrBuffer;->enc_ndr_short(I)V

    .line 68
    invoke-virtual {p1, v2}, Ljcifs/dcerpc/ndr/NdrBuffer;->enc_ndr_small(I)V

    .line 69
    invoke-virtual {p1, v1}, Ljcifs/dcerpc/ndr/NdrBuffer;->enc_ndr_small(I)V

    .line 70
    iget-object v0, p0, Ljcifs/dcerpc/DcerpcBind;->binding:Ljcifs/dcerpc/DcerpcBinding;

    iget-object v0, v0, Ljcifs/dcerpc/DcerpcBinding;->uuid:Ljcifs/dcerpc/UUID;

    invoke-virtual {v0, p1}, Ljcifs/dcerpc/UUID;->encode(Ljcifs/dcerpc/ndr/NdrBuffer;)V

    .line 71
    iget-object v0, p0, Ljcifs/dcerpc/DcerpcBind;->binding:Ljcifs/dcerpc/DcerpcBinding;

    iget v0, v0, Ljcifs/dcerpc/DcerpcBinding;->major:I

    invoke-virtual {p1, v0}, Ljcifs/dcerpc/ndr/NdrBuffer;->enc_ndr_short(I)V

    .line 72
    iget-object v0, p0, Ljcifs/dcerpc/DcerpcBind;->binding:Ljcifs/dcerpc/DcerpcBinding;

    iget v0, v0, Ljcifs/dcerpc/DcerpcBinding;->minor:I

    invoke-virtual {p1, v0}, Ljcifs/dcerpc/ndr/NdrBuffer;->enc_ndr_short(I)V

    .line 73
    sget-object v0, Ljcifs/dcerpc/DcerpcBind;->DCERPC_UUID_SYNTAX_NDR:Ljcifs/dcerpc/UUID;

    invoke-virtual {v0, p1}, Ljcifs/dcerpc/UUID;->encode(Ljcifs/dcerpc/ndr/NdrBuffer;)V

    .line 74
    const/4 v0, 0x2

    invoke-virtual {p1, v0}, Ljcifs/dcerpc/ndr/NdrBuffer;->enc_ndr_long(I)V

    .line 75
    return-void
.end method

.method public getOpnum()I
    .locals 1

    .prologue
    .line 58
    const/4 v0, 0x0

    return v0
.end method

.method public getResult()Ljcifs/dcerpc/DcerpcException;
    .locals 2

    .prologue
    .line 39
    iget v0, p0, Ljcifs/dcerpc/DcerpcBind;->result:I

    if-eqz v0, :cond_0

    .line 40
    new-instance v0, Ljcifs/dcerpc/DcerpcException;

    iget v1, p0, Ljcifs/dcerpc/DcerpcBind;->result:I

    invoke-static {v1}, Ljcifs/dcerpc/DcerpcBind;->getResultMessage(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljcifs/dcerpc/DcerpcException;-><init>(Ljava/lang/String;)V

    .line 41
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
