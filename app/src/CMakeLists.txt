cmake_minimum_required(VERSION 3.16)

project(app VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Core Gui Qml Quick Network Mqtt)

include(android_openssl/android_openssl.cmake)

qt_standard_project_setup()

qt_add_executable(appapp
    main.cpp
)

qt_add_qml_module(appapp
    URI app
    VERSION 1.0
    SOURCES
        data.hpp
        data.cpp
        update.hpp
        update.cpp
    QML_FILES
        Main.qml
        content/Home.qml
        content/SplashScreen.qml
        content/Style.qml
        content/Menu.qml
        content/Map.qml
        content/Update.qml
        content/DrawPath.qml
        content/SafetyDetail.qml
        content/TypeDescription.qml
    RESOURCES
        content/images/logo1.png
        content/images/logo2.png
        content/images/home_home.png
        content/images/home_map.png
        content/images/home_style.png
        content/images/style_home.png
        content/images/style_map.png
        content/images/style_style.png
        content/images/map_home.png
        content/images/map_map.png
        content/images/map_style.png
        content/images/home_pd.png
        content/images/home_td.png
        content/images/home_battery.png
        content/images/home_update.png
        content/images/car_model_name.png
        content/images/style_comment.png
        content/images/style_main.png
        content/images/setting.png
        content/images/alarm_off.png
        content/images/alarm_on.png
        content/images/update_o.png
        content/images/update_x.png
        content/images/update.png
        content/images/map.png
        content/images/map_detail.png
        content/images/lv1.png
        content/images/lv2.png
        content/images/lv3.png
        content/images/lv4.png
        content/images/lv5.png
        content/images/lv6.png
        content/images/lv7.png
        content/images/lv8.png
        content/images/lv9.png
        content/images/lv10.png
        content/images/lv11.png
        content/images/lv12.png
        content/images/lv13.png
        content/images/lv14.png
        content/images/lv15.png
        content/images/safety_main.png
        content/images/good.png
        content/images/normal.png
        content/images/bad.png
        content/images/sloth.png
        content/images/sloth_type.png
        content/images/wildboar.png
        content/images/wildboar_type.png
        content/images/turtle.png
        content/images/turtle_type.png
        content/images/panda.png
        content/images/panda_type.png
        content/images/lion.png
        content/images/lion_type.png
        content/images/wolf.png
        content/images/wolf_type.png
        content/images/cheetah.png
        content/images/cheetah_type.png
        content/images/elephant.png
        content/images/elephant_type.png
        content/images/description_type.png
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appapp PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appapp
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

if (ANDROID)
    add_android_openssl_libraries(appapp)
endif()

set_target_properties(appapp PROPERTIES
    QT_ANDROID_PACKAGE_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/android"
)

target_link_libraries(appapp
    PRIVATE Qt6::Core
    PRIVATE Qt6::Gui
    PRIVATE Qt6::Qml
    PRIVATE Qt6::Quick
    PRIVATE Qt6::Network
    PRIVATE Qt6::Mqtt
)

include(GNUInstallDirs)
install(TARGETS appapp
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
