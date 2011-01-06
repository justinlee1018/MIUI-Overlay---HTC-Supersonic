.class public Landroid/hardware/HtcFrontFacingCamera;
.super Landroid/hardware/Camera;
.source "HtcFrontFacingCamera.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Landroid/hardware/Camera;-><init>()V

    return-void
.end method

.method public static getCamera()Landroid/hardware/Camera;
    .locals 1

    .prologue
    .line 11
    const-string v0, "secondary"

    invoke-static {v0}, Landroid/hardware/HtcFrontFacingCamera;->open(Ljava/lang/String;)Landroid/hardware/Camera;

    move-result-object v0

    return-object v0
.end method
