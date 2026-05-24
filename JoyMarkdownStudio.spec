# -*- mode: python ; coding: utf-8 -*-
import re

# 1. jmstudio.py에서 버전을 동적으로 읽어오기
version = "" # 기본값 설정
try:
    with open('jmstudio.py', 'r', encoding='utf-8') as f:
        content = f.read()
        # APP_NAME = "Joy Markdown Studio v3.61" 패턴 매칭
        match = re.search(r'APP_NAME\s*=\s*["\']Joy Markdown Studio v([\d\.]+)["\']', content)
        if match:
            version = "v" + match.group(1)
except Exception as e:
    print(f"Version read error: {e}")

# 2. 동적 파일명 생성 (예: JoyMarkdownStudio-v3.61)
exe_name = f"JoyMarkdownStudio-{version}"

a = Analysis(
    ['jmstudio.py'],
    pathex=[],
    binaries=[],
    datas=[],
    hiddenimports=[],
    hookspath=[],
    hooksconfig={},
    runtime_hooks=[],
    excludes=[],
    noarchive=False,
    optimize=0,
)
pyz = PYZ(a.pure)

exe = EXE(
    pyz,
    a.scripts,
    a.binaries,
    a.datas,
    [],
    name=exe_name,  # <- 여기에 동적으로 생성한 이름을 대입합니다.
    debug=False,
    bootloader_ignore_signals=False,
    strip=False,
    upx=True,
    upx_exclude=[],
    runtime_tmpdir=None,
    console=True,
    disable_windowed_traceback=False,
    argv_emulation=False,
    target_arch=None,
    codesign_identity=None,
    entitlements_file=None,
    icon='app_icon.ico',  # 아이콘 표출 추가
)
