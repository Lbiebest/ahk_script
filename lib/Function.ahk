

; function.ahk
; 函数：open
; 参数：key - 键值，Type - 类型（"app"表示应用程序，"web"表示网页），isAdmin（可选参数，默认为假） - 是否以管理员身份运行
; 描述：根据提供的键值和类型打开应用程序或网页
; 示例用法
; 打开网页
; open("github", "web")
; 打开应用程序（如果需要管理员权限，则以管理员身份打开）
; open("obs", "app", true)
open(key, Type, isAdmin := false) {
    if (Type = "web") {
        if (url.Has(key)) {
            Run (url[key])
        } else {
            MsgBox "无效key: " key
        }
    }
    else if (Type = "app") {
        if (app.Has(key)) {
            if (isAdmin) {
                if (A_IsAdmin) {
                    if (workDir.Has(key)) {
                        SetWorkingDir workDir[key]
                    }
                    Run app[key]
                }
                else {
                    RunAs User Password Domain
                    Run app[key]
                }
            }
            else {
                Run app[key]
            }
        }
        else {
            MsgBox "无效key: " key
        }
    }
    else {
        MsgBox "无效类型: " Type
    }
}
