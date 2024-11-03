#!/bin/bash
set -euo pipefail

source auto_xvfb

ls -l /wine32/drive_c/libs/language_packs_for_v11/

# 判断目标文件夹是否已经包含了指定的文件
if ! diff -q /wine32/drive_c/Program\ Files/Common\ Files/Microsoft\ Shared/Speech/TTS/v11.0/ /wine32/drive_c/libs/chsbrkr_chtbrkr_dlls/ >/dev/null; then
    # 如果目标文件夹不包含指定的文件，则执行安装步骤
    wine msiexec /qn /i /wine32/drive_c/libs/speech_platform_runtime_v11/SpeechPlatformRuntimeX86.msi
    wine msiexec /qn /i /wine32/drive_c/libs/speech_platform_runtime_v11/x86_MicrosoftSpeechPlatformSDK.msi
    # wine msiexec /qn /i /wine32/drive_c/libs/language_packs_for_v11/MSSpeech_TTS_en-US_ZiraPro.msi
    # wine msiexec /qn /i /wine32/drive_c/libs/language_packs_for_v11/MSSpeech_TTS_en-US_ZiraPro.msi
    # wine msiexec /qn /i /wine32/drive_c/libs/language_packs_for_v11/MSSpeech_TTS_zh-CN_HuiHui.msi
    # wine msiexec /qn /i /wine32/drive_c/libs/language_packs_for_v11/MSSpeech_TTS_zh-HK_HunYee.msi
    # wine msiexec /qn /i /wine32/drive_c/libs/language_packs_for_v11/MSSpeech_TTS_ja-JP_Haruka.msi
    # wine msiexec /qn /i /wine32/drive_c/libs/language_packs_for_v11/MSSpeech_TTS_ko-KR_Heami.msi
    # wine msiexec /qn /i /wine32/drive_c/libs/language_packs_for_v11/MSSpeech_TTS_ru-RU_Elena.msi
    wine msiexec /qn /i /wine32/drive_c/libs/language_packs_for_v11/MSSpeech_SR_es-ES_TELE.msi
    wine msiexec /qn /i /wine32/drive_c/libs/language_packs_for_v11/MSSpeech_SR_es-MX_TELE.msi
    wine msiexec /qn /i /wine32/drive_c/libs/language_packs_for_v11/MSSpeech_TTS_es-MX_Hilda.msi
    cp /wine32/drive_c/libs/chsbrkr_chtbrkr_dlls/* /wine32/drive_c/Program\ Files/Common\ Files/Microsoft\ Shared/Speech/TTS/v11.0/
    cp /wine32/drive_c/libs/chsbrkr_chtbrkr_dlls/NaturalLanguage6.dll /wine32/drive_c/windows/system32/
fi

# 运行应用程序
cd /wine32/drive_c/bin
wine MSSpeechServer.exe
