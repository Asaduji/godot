@echo off
scons platform=windows production=yes module_mono_enabled=yes d3d12=yes
cd ./bin
godot.windows.editor.x86_64.mono --headless --generate-mono-glue modules/mono/glue
cd ..
python ./modules/mono/build_scripts/build_assemblies.py --godot-output-dir=./bin --godot-platform=windows
scons platform=windows production=yes module_mono_enabled=yes d3d12=yes target=template_release
scons platform=windows production=yes module_mono_enabled=yes d3d12=yes target=template_debug

pause