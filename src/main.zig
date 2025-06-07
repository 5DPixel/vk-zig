const std = @import("std");

const vk = @cImport({
    @cInclude("vulkan/vulkan.h");
});

pub fn main() !void {
    std.debug.print("VK_SUCCESS = {}\n", .{vk.VK_SUCCESS});
}
