const vk = @import("../cimports.zig").vk;
const glfw = @import("../cimports.zig").glfw;

const app = @import("../app.zig");

pub fn create_instance(self: *app.App) !void {
    var app_info = vk.VkApplicationInfo{};
    app_info.sType = vk.VK_STRUCTURE_TYPE_APPLICATION_INFO;
    app_info.pApplicationName = self.name;
    app_info.applicationVersion = vk.VK_MAKE_VERSION(1, 0, 0);
    app_info.pEngineName = "No Engine";
    app_info.engineVersion = vk.VK_MAKE_VERSION(1, 0, 0);
    app_info.apiVersion = vk.VK_API_VERSION_1_0;

    var create_info = vk.VkInstanceCreateInfo{};
    create_info.sType = vk.VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO;
    create_info.pApplicationInfo = &app_info;

    var glfw_extension_count: u32 = 0;
    const glfw_extensions = glfw.glfwGetRequiredInstanceExtensions(&glfw_extension_count);

    create_info.enabledExtensionCount = glfw_extension_count;
    create_info.ppEnabledExtensionNames = glfw_extensions;

    create_info.enabledLayerCount = 0;

    if (vk.vkCreateInstance(&create_info, null, &self.instance) != vk.VK_SUCCESS) {
        @panic("failed to create instance!");
    }
}
