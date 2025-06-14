const std = @import("std");

pub fn build(b: *std.Build) void {
    const exe = b.addExecutable(.{
        .name = "vk-zig",
        .root_source_file = b.path("src/main.zig"),
        .target = b.graph.host,
    });

    exe.linkLibC();

    exe.linkSystemLibrary("glfw");
    exe.linkSystemLibrary("vulkan");

    b.installArtifact(exe);
}
