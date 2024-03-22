
#Include lib\DPAPI.ahk
; 加密用户信息
encryptedUser := DpapiEncrypt("Administrator")
encryptedPassword := DpapiEncrypt("ly-253417")
encryptedDomain := DpapiEncrypt("DESKTOP-MFIFC4G")

; 写入INI文件
IniWrite encryptedUser, "config\User.ini", "AdminInfo", "User"
IniWrite encryptedPassword, "config\User.ini", "AdminInfo", "Password"
IniWrite encryptedDomain, "config\User.ini", "AdminInfo", "Domain"

; 从INI文件读取加密的用户信息
encryptedUser := IniRead("User.ini", "AdminInfo", "User", "")
encryptedPassword := IniRead("User.ini", "AdminInfo", "Password", "")
encryptedDomain := IniRead("User.ini", "AdminInfo", "Domain", "")

; 解密用户信息
decryptedUser := DpapiDecrypt(encryptedUser)
decryptedPassword := DpapiDecrypt(encryptedPassword)
decryptedDomain := DpapiDecrypt(encryptedDomain)

MsgBox 解密后的User：%decryptedUser%
MsgBox 解密后的Password：%decryptedPassword%
MsgBox 解密后的Domain：%decryptedDomain%

 