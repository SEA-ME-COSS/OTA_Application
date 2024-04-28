cmake_minimum_required(VERSION 3.16)

project(tmp VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)

qt_standard_project_setup()

qt_add_executable(apptmp
    main.cpp
)

qt_add_qml_module(apptmp
    URI tmp
    VERSION 1.0
    QML_FILES
        Main.qml
        content/Home.qml
        content/SplashScreen.qml
        content/Style.qml
        content/Menu.qml
        content/Map.qml
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
        content/images/car_demo.png
        content/images/car_model_name.png
        content/images/style_comment.png
        content/images/style_main.png
        content/images/setting.png
        content/images/demo_map.png
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(apptmp PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.apptmp
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(apptmp
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS apptmp
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
