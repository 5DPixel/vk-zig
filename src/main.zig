const std = @import("std");

const app = @import("app.zig");

pub fn main() !void {
    var allocator = std.heap.page_allocator;
    var main_app = app.App.new("vk-zig", 800, 600, &allocator);

    try main_app.run();
}
