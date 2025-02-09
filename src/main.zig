const std = @import("std");

const stdout_file = std.io.getStdOut().writer();
var bw = std.io.bufferedWriter(stdout_file);
const stdout = bw.writer();

const stdin = std.io.getStdIn().reader();

pub fn events() !void {
    try stdout.print("Run `zig build test` to run the tests.\n", .{});
}

pub fn main() !void {
    std.debug.print("All your {s} are belong to us.\n", .{"codebase"});

    try events();

    try bw.flush(); // don't forget to flush!
}

test "simple test" {
    var list = std.ArrayList(i32).init(std.testing.allocator);
    defer list.deinit(); // try commenting this out and see if zig detects the memory leak!
    try list.append(42);
    try std.testing.expectEqual(@as(i32, 42), list.pop());
}
