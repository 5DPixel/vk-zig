const std = @import("std");

const vk = @import("cimports.zig").vk;
const glfw = @import("cimports.zig").glfw;

const window = @import("vk-utils/window.zig");
const instance = @import("vk-utils/instance.zig");

pub const App = struct {
    name: [*c]const u8,
    width: u16,
    height: u16,
    allocator: *std.mem.Allocator,

    window: *glfw.GLFWwindow,

    instance: vk.VkInstance,

    pub fn new(name: []const u8, width: u16, height: u16, allocator: *std.mem.Allocator) App {
        return App{
            .name = @ptrCast(name),
            .width = width,
            .height = height,
            .allocator = allocator,
            .window = undefined,
            .instance = undefined,
        };
    }

    pub fn run(self: *App) !void {
        try window.init_window(self);
        try init_vk(self);
        try render_loop(self);
        try cleanup(self);
    }

    fn render_loop(self: *App) !void {
        while (glfw.glfwWindowShouldClose(self.window) != 1) {
            glfw.glfwPollEvents();
        }
    }

    fn cleanup(self: *App) !void {
        vk.vkDestroyInstance(self.instance, null);

        glfw.glfwDestroyWindow(self.window);

        glfw.glfwTerminate();
    }

    fn init_vk(self: *App) !void {
        try instance.create_instance(self);
    }
};
