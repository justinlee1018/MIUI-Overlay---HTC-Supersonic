.class public Landroid/hardware/CameraSwitch;
.super Ljava/lang/Object;
.source "CameraSwitch.java"


# static fields
#the value of this static final field might be set in the static constructor
.field private static final HAS_CAMERA_SWITCH:Z = false

.field private static final LOG_TAG:Ljava/lang/String; = "CameraSwitch"

.field private static final SWITCH_CAMERA_FILE_PATH:Ljava/lang/String; = "/sys/android_camera2/htcwc"

.field public static final SWITCH_CAMERA_MAIN:Ljava/lang/String; = "main"

.field public static final SWITCH_CAMERA_SECONDARY:Ljava/lang/String; = "secondary"


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 26
    new-instance v0, Ljava/io/File;

    const-string v1, "/sys/android_camera2/htcwc"

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 27
    .local v0, file:Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    sput-boolean v1, Landroid/hardware/CameraSwitch;->HAS_CAMERA_SWITCH:Z

    .line 28
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static hasCameraSwitch()Z
    .locals 1

    .prologue
    .line 78
    sget-boolean v0, Landroid/hardware/CameraSwitch;->HAS_CAMERA_SWITCH:Z

    return v0
.end method

.method public static openCamera(Ljava/lang/String;)V
    .locals 0
    .parameter "cameraNode"

    .prologue
    .line 70
    invoke-static {p0}, Landroid/hardware/CameraSwitch;->setHTCCameraSwitch(Ljava/lang/String;)Z

    .line 71
    return-void
.end method

.method public static openMainCamera()V
    .locals 1

    .prologue
    .line 74
    const-string v0, "main"

    invoke-static {v0}, Landroid/hardware/CameraSwitch;->setHTCCameraSwitch(Ljava/lang/String;)Z

    .line 75
    return-void
.end method

.method private static setHTCCameraSwitch(Ljava/lang/String;)Z
    .locals 10
    .parameter "cameraSwitch"

    .prologue
    const/4 v8, 0x0

    const-string v9, "Error closing /sys/android_camera2/htcwc"

    const-string v7, "CameraSwitch"

    .line 31
    sget-boolean v5, Landroid/hardware/CameraSwitch;->HAS_CAMERA_SWITCH:Z

    if-nez v5, :cond_0

    move v5, v8

    .line 66
    :goto_0
    return v5

    .line 36
    :cond_0
    const-string v5, "main"

    invoke-virtual {v5, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 37
    const-string v2, "0"

    .line 38
    .local v2, node:Ljava/lang/String;
    const-string v5, "CameraSwitch"

    const-string v5, "Open main camera"

    invoke-static {v7, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    :goto_1
    new-instance v1, Ljava/io/File;

    const-string v5, "/sys/android_camera2/htcwc"

    invoke-direct {v1, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 48
    .local v1, file:Ljava/io/File;
    const/4 v3, 0x0

    .line 50
    .local v3, writer:Ljava/io/BufferedWriter;
    :try_start_0
    new-instance v4, Ljava/io/BufferedWriter;

    new-instance v5, Ljava/io/FileWriter;

    invoke-direct {v5, v1}, Ljava/io/FileWriter;-><init>(Ljava/io/File;)V

    invoke-direct {v4, v5}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 51
    .end local v3           #writer:Ljava/io/BufferedWriter;
    .local v4, writer:Ljava/io/BufferedWriter;
    :try_start_1
    invoke-virtual {v4, v2}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 52
    invoke-virtual {v4}, Ljava/io/BufferedWriter;->flush()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_4

    .line 58
    if-eqz v4, :cond_1

    .line 59
    :try_start_2
    invoke-virtual {v4}, Ljava/io/BufferedWriter;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 66
    :cond_1
    const/4 v5, 0x1

    goto :goto_0

    .line 39
    .end local v1           #file:Ljava/io/File;
    .end local v2           #node:Ljava/lang/String;
    .end local v4           #writer:Ljava/io/BufferedWriter;
    :cond_2
    const-string v5, "secondary"

    invoke-virtual {v5, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 40
    const-string v2, "1"

    .line 41
    .restart local v2       #node:Ljava/lang/String;
    const-string v5, "CameraSwitch"

    const-string v5, "Open secondary camera"

    invoke-static {v7, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 43
    .end local v2           #node:Ljava/lang/String;
    :cond_3
    const-string v5, "CameraSwitch"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Unknown camera node: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", using main"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v7, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    const-string v2, "0"

    .restart local v2       #node:Ljava/lang/String;
    goto :goto_1

    .line 61
    .restart local v1       #file:Ljava/io/File;
    .restart local v4       #writer:Ljava/io/BufferedWriter;
    :catch_0
    move-exception v0

    .line 62
    .local v0, e:Ljava/io/IOException;
    const-string v5, "CameraSwitch"

    const-string v5, "Error closing /sys/android_camera2/htcwc"

    invoke-static {v7, v9, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move v5, v8

    .line 63
    goto :goto_0

    .line 53
    .end local v0           #e:Ljava/io/IOException;
    .end local v4           #writer:Ljava/io/BufferedWriter;
    .restart local v3       #writer:Ljava/io/BufferedWriter;
    :catch_1
    move-exception v5

    move-object v0, v5

    .line 54
    .restart local v0       #e:Ljava/io/IOException;
    :goto_2
    :try_start_3
    const-string v5, "CameraSwitch"

    const-string v6, "Can\'t open /sys/android_camera2/htcwc"

    invoke-static {v5, v6, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 58
    if-eqz v3, :cond_4

    .line 59
    :try_start_4
    invoke-virtual {v3}, Ljava/io/BufferedWriter;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    :cond_4
    move v5, v8

    .line 63
    goto :goto_0

    .line 61
    :catch_2
    move-exception v0

    .line 62
    const-string v5, "CameraSwitch"

    const-string v5, "Error closing /sys/android_camera2/htcwc"

    invoke-static {v7, v9, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move v5, v8

    .line 63
    goto/16 :goto_0

    .line 57
    .end local v0           #e:Ljava/io/IOException;
    :catchall_0
    move-exception v5

    .line 58
    :goto_3
    if-eqz v3, :cond_5

    .line 59
    :try_start_5
    invoke-virtual {v3}, Ljava/io/BufferedWriter;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    .line 63
    :cond_5
    throw v5

    .line 61
    :catch_3
    move-exception v0

    .line 62
    .restart local v0       #e:Ljava/io/IOException;
    const-string v5, "CameraSwitch"

    const-string v5, "Error closing /sys/android_camera2/htcwc"

    invoke-static {v7, v9, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move v5, v8

    .line 63
    goto/16 :goto_0

    .line 57
    .end local v0           #e:Ljava/io/IOException;
    .end local v3           #writer:Ljava/io/BufferedWriter;
    .restart local v4       #writer:Ljava/io/BufferedWriter;
    :catchall_1
    move-exception v5

    move-object v3, v4

    .end local v4           #writer:Ljava/io/BufferedWriter;
    .restart local v3       #writer:Ljava/io/BufferedWriter;
    goto :goto_3

    .line 53
    .end local v3           #writer:Ljava/io/BufferedWriter;
    .restart local v4       #writer:Ljava/io/BufferedWriter;
    :catch_4
    move-exception v5

    move-object v0, v5

    move-object v3, v4

    .end local v4           #writer:Ljava/io/BufferedWriter;
    .restart local v3       #writer:Ljava/io/BufferedWriter;
    goto :goto_2
.end method
