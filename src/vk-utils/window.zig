const vk = @import("../cimports.zig").vk;
const glfw = @import("../cimports.zig").glfw;

const app = @import("../app.zig");

pub fn init_window(self: *app.App) !void {
    _ = glfw.glfwInit();

    glfw.glfwWindowHint(glfw.GLFW_CLIENT_API, glfw.GLFW_NO_API);
    glfw.glfwWindowHint(glfw.GLFW_RESIZABLE, glfw.GLFW_FALSE);

    self.window = glfw.glfwCreateWindow(self.width, self.height, self.name, null, null) orelse {
        return error.Generic;
    };
}
