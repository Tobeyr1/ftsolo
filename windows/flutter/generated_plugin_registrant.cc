//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <dart_discord_rpc/dart_discord_rpc_plugin.h>
#include <flutter_secure_storage_windows/flutter_secure_storage_windows_plugin.h>
#include <media_kit_libs_windows_audio/media_kit_libs_windows_audio_plugin_c_api.h>
#include <permission_handler_windows/permission_handler_windows_plugin.h>
#include <screen_retriever/screen_retriever_plugin.h>
#include <system_theme/system_theme_plugin.h>
#include <system_tray/system_tray_plugin.h>
#include <window_manager/window_manager_plugin.h>

void RegisterPlugins(flutter::PluginRegistry *registry) {
    DartDiscordRpcPluginRegisterWithRegistrar(
            registry->GetRegistrarForPlugin("DartDiscordRpcPlugin"));
    FlutterSecureStorageWindowsPluginRegisterWithRegistrar(
            registry->GetRegistrarForPlugin("FlutterSecureStorageWindowsPlugin"));
    MediaKitLibsWindowsAudioPluginCApiRegisterWithRegistrar(
            registry->GetRegistrarForPlugin("MediaKitLibsWindowsAudioPluginCApi"));
    PermissionHandlerWindowsPluginRegisterWithRegistrar(
            registry->GetRegistrarForPlugin("PermissionHandlerWindowsPlugin"));
    ScreenRetrieverPluginRegisterWithRegistrar(
            registry->GetRegistrarForPlugin("ScreenRetrieverPlugin"));
    SystemThemePluginRegisterWithRegistrar(
            registry->GetRegistrarForPlugin("SystemThemePlugin"));
    SystemTrayPluginRegisterWithRegistrar(
            registry->GetRegistrarForPlugin("SystemTrayPlugin"));
    WindowManagerPluginRegisterWithRegistrar(
            registry->GetRegistrarForPlugin("WindowManagerPlugin"));
}
