INCLUDEPATH *= $$PWD/src
INCLUDEPATH *= $$PWD/../_debugStuff/src/
INCLUDEPATH *= $$PWD/../drawCommands/src/
INCLUDEPATH += $$PWD/../
include($$PWD/../common/common.pri)
include($$PWD/../algorithms/algorithms.pri)
include($$PWD/../sdrawWidgets/sdrawWidgets.pri)
include($$PWD/../selectionLib/selectionLib.pri)
include($$PWD/../zooming/zooming.pri)
include($$PWD/../drawSettings/drawSettings.pri)
include($$PWD/../drawLib/drawLib.pri)

PROJNAME = $$basename(PWD)   
BASENAME = $$PROJNAME        

TEMPDIR = $$PWD/tmp
LIBDIR  = lib

equals(TEMPLATE, "app") | equals(TEMPLATE, "vcapp") {
  build_pass:CONFIG(debug, debug|release) {
    win32:LIBNAME = $$join(BASENAME,,,d.lib)
  } else {
    build_pass:CONFIG(release, debug|release) {
      win32:LIBNAME = $$join(BASENAME,,,.lib)
    }
  }
  LIBS *= -L$$TEMPDIR/$$LIBDIR               
  LIBS *= $$LIBNAME                         
  DEPENDPATH *= $$PWD/src
  LIBNAME = ""  # just to be safe
}
