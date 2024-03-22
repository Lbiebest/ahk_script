/************************************************************************
 * @description 自定义用户脚本
 * @file Script.ahk
 * @author 不吃蛋挞的蛋挞
 * @date 2024/03/22
 * @version 3.0.1
 * @tips 在前两个版本的基础上对整个脚本进行了重构
 ***********************************************************************/
 
#Include ../lib/Function.ahk
#Include ../config/UserInfo.ini

    
; ==============================================================================
; 数据存储
; ==============================================================================

; 应用程序路径
app := Map()
app["wechat"] := "C:\Program Files\Tencent\WeChat\WeChat.exe"
app["cloudmusic"] := "C:\Program Files (x86)\NetEase\CloudMusic\cloudmusic.exe"
app["obs"] := "C:\Users\lbieb\scoop\apps\obs-studio-pre\current\bin\64bit\sudo-obs64.lnk.lnk"

; 应用程序工作目录
workDir := Map()
workDir["obs"] := "C:\Users\lbieb\scoop\apps\obs-studio-pre\current\bin\64bit"

; 网页地址
url := Map()
url["fanyiyoudao"] := "https://fanyi.youdao.com/index.html#/"
url["github"] := "https://github.com"
url["translategoogle"] := "https://translate.google.com/?hl=zh-CN"
url["chatopenai"] := "https://chat.openai.com/"

 
; ==============================================================================
; 快捷键绑定
; ==============================================================================

#W:: open("wechat", "app")
; 网易云音乐
#N:: open("cloudmusic", "app")
; OBS Studio
#O:: open("obs", "app", true)

; 谷歌翻译
!F:: open("translategoogle", "web")
; github
!G:: open("github", "web")



