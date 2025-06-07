pub const vk = @cImport({
    @cInclude("vulkan/vulkan.h");
});

pub const glfw = @cImport({
    @cInclude("GLFW/glfw3.h");
});
