#Persistent ; 使脚本一直运行
/*
==============================================================
======================== 应用程序部分 ==========================
==============================================================
*/
; 设置应用程序路径变量
WeChat := "C:\UserScoop\apps\wechat-np\nightly-20230730\WeChat.exe"
Foobar2000 := "D:\foobar2000\foobar2000.exe"
NetEaseCloudMusic := "D:\CloudMusic\cloudmusic.exe"
OBS := "C:\UserScoop\apps\obs-studio\current\bin\64bit\sudo-obs64.lnk"
ChatAll := "D:\ChatAll\ChatALL.exe"
Dopamine := "C:\UserScoop\apps\dopamine\2.0.9\Dopamine.exe"
; Clash := "D:\Clash\Clash for Windows.exe"

; 打开应用程序函数
OpenApp(AppName) {
    Run, %AppName%
    Return
}

; 绑定热键打开应用程序
#w::OpenApp(WeChat)
#n::OpenApp(NetEaseCloudMusic)
#f::OpenApp(Dopamine)
; #f::OpenApp(Foobar2000)

; 需要特殊启动程序
#o::
    SetWorkingDir, "C:\UserScoop\apps\obs-studio\current\bin\64bit"
    Run, %OBS%, , RunAs
Return
#c::
    Run, %ChatAll%, , Max
Return

; Run, %Clash%, , Hide
/*
==============================================================
========================== 网页部分 ===========================
==============================================================
*/
; 打开网页函数
OpenWebsite(url) {
    Run, % url
    Return
}

; 绑定热键打开网页
!f::OpenWebsite("https://fanyi.youdao.com/index.html#/") ; 打开有道翻译网页
!g::OpenWebsite("https://github.com") ; 打开 GitHub 网页

; 设置快捷键 Fn+t
!t::EmptyRecycleBin()

EmptyRecycleBin() {
    ; 打开回收站
    Run, shell:::{645FF040-5081-101B-9F08-00AA002F954E}

    ; 创建自定义对话框
    Gui +AlwaysOnTop
    Gui, Add, Text, , Whether to empty the recycle bin?
    Gui, Add, Button, x20 y40 w60 h30 gYesButton, Yes
    Gui, Add, Button, x100 y40 w60 h30 gNoButton, No
    Gui, Font, s12, Arial
    Gui, Show
}

YesButton:
    ; 清空回收站
    RunWait, cmd /c rd /s /q C:\$Recycle.Bin
    RunWait, cmd /c rd /s /q D:\$Recycle.Bin
    RunWait, cmd /c rd /s /q E:\$Recycle.Bin
    RunWait, cmd /c rd /s /q F:\$Recycle.Bin
    ; 关闭对话框
    Gui, Destroy
    ; 关闭回收站窗口
    WinClose, ahk_exe explorer.exe
return

NoButton:
    ; 关闭对话框
    Gui, Destroy
return

