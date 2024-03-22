; 调用 Windows API 实现 DPAPI 加密
DpapiEncrypt(data) {
  encryptedData := ""
  dataStr := StrPut(data, "UTF-16")
  if DllCall("Crypt32\CryptProtectData", "ptr", dataStr, "wstr", 0, "ptr", 0, "ptr", 0, "ptr", 0, "uint", 0, "ptr", &encryptedData) {
      return RTrim(StrGet(&encryptedData, "UTF-16"), "\x00")
  }
  return ""
}

; 调用 Windows API 实现 DPAPI 解密
DpapiDecrypt(encryptedData) {
  decryptedData := ""
  encryptedDataStr := StrPut(encryptedData, "UTF-16")
  if DllCall("Crypt32\CryptUnprotectData", "ptr", encryptedDataStr, "ptr", 0, "ptr", 0, "ptr", 0, "ptr", 0, "uint", 0, "ptr", &decryptedData) {
      return RTrim(StrGet(&decryptedData, "UTF-16"), "\x00")
  }
  return ""
}
